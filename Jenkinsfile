// This import is require so that we can skip a stage
import org.jenkinsci.plugins.pipeline.modeldefinition.Utils

// Helper function which allows us to define a stage with some conditions
def stage(name, execute, block) {
    return stage(name, execute ? block : {
        echo "skipped stage $name"
        Utils.markStageSkippedForConditional(STAGE_NAME)
    })
}

// This is a set of possible BUILD_TYPE's
def availableBuildTypes = ["develop", "release", "nightly"]

// This is the ID of the git credential set from Jenkins
def gitCredential = "b6ba7e97-d203-4c3d-9f92-0de9b860e69d"

// First we select a node.
// The node name can be injected via Jenkins as an ENV; NODE_TARGET
// Else it will default to an machine labeled with ios and production
node(env.NODE_TARGET ?: 'ios&&production') {
  // We add a badge to the build so that if the build fails we can easily see
  // on which machine it failed
  manager.addShortText(env.NODE_NAME)

  // Assertions
  // We will assert that the BUILD_TYPE has been set in Jenkins otherwise we
  // don't want to start the bild 
  assert env.BUILD_TYPE : "Missing ENV: BUILD_TYPE"
  
  // We also assert that the BUILD_TYPE is a valid build type
  assert env.BUILD_TYPE in availableBuildTypes : "Wrong BUILD_TYPE: ${availableBuildTypes.join(', ')}"
  
  // We add a badge 
  manager.addShortText(env.BUILD_TYPE)

  // Teardown
  // With cleanWs we make sure that we start by cleaning the workspace.
  // Otherwise we end up wasting valueable disk space on the Jenkins slave.
  cleanWs notFailBuild: true

  // Checkout
  // We checkout the code from Bitbucket
  stage("Checkout", true) {
    checkout scm
  }

  // Prepare
  // We install the tools that we need to make our build
  // In this example, since we're using fastlane we will have to install
  // bundler first and then using bundler we will install fastlane
  stage("Prepare") {
    steps.sh "gem install bundler && bundle install --path ~/.gems"
  }

  // Unit Tests
  // We run fastlane to run our unit tests
  // Once fastlane is done it will generate some test reports in
  // fastlane/report.xml. We will tell jenkins that those are our junit files
  // so that Jenkins can display nice statistics for us
  stage('Unit Tests') {
    steps.sh "bundle exec fastlane test_unit"
    junit 'fastlane/report.xml'
  }

  // UI Tests
  // We will make sure the inject the git credentials so that match (used
  // inside the test_ui lane of fastlane) will be able to checkout the
  // certificates repo using match
  sshagent([gitCredential]) {
    // Similar to the unit tests we will run our ui tests using fastlane
    stage('UI Test', env.BUILD_TYPE == "nightly") {
      steps.sh "bundle exec fastlane test_ui"
    }
  }

  // Build
  // We will make sure the inject the git credentials so that match will be
  // able to checkout the certificates repo using match
  sshagent([gitCredential]) {
    stage('Build') {
      // We will again use fastlane to create a build
      steps.sh "bundle exec fastlane ${env.BUILD_TYPE}"
    }
  }

  // Archive artifcats
  // All artifacts created by fastlane are volatile on Jenkins. We would like
  // to be able archive certain artifacts between builds
  stage('Archive') {
    steps.archiveArtifacts "output/"
  }

  // Snice all tests passed and our ipa has been built now we can deploy it to
  // a distribution channel. Distribution can be done parallely.
  parallel(
    'Nexus': {
      // Nexus
      // We use fastlane to upload the ipa to Nexus
      stage('Deploy to Nexus', env.BUILD_TYPE == "release") {
        steps.withCredentials([usernamePassword(credentialsId: 'GRIP_BUILDER', usernameVariable: 'GRIP_BUILDER', passwordVariable: 'GRIP_PASSWD')]) {
          steps.sh "bundle exec fastlane deploy_to_nexus"
        }
      }
    },
    'Internal': {
      // Internal Distribution
      // We use fastlane to deploy to HockeyApp
      stage('Deploy to Internal', env.BUILD_TYPE == "develop") {
        withCredentials([[$class: 'StringBinding', credentialsId: 'HockeyAppApiKey', variable: 'hockeyAppApiKey']]) {
          steps.sh "bundle exec fastlane deploy_to_hockey"
        }
      }
    },
    'External': {
      // External Distribution
      // We use fastlane to deploy to TestFlight
      stage('Deploy to External', env.BUILD_TYPE == "release") {
        steps.sh "bundle exec fastlane upload_to_apple"
      }
    }
  )
}
