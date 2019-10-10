fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew cask install fastlane`

# Available Actions
## iOS
### ios deploy_to_hockey
```
fastlane ios deploy_to_hockey
```
Upload to HockeyApp
### ios test_unit
```
fastlane ios test_unit
```
Run unit tests
### ios test_ui
```
fastlane ios test_ui
```
Run UI tests
### ios develop
```
fastlane ios develop
```
Build the app
### ios nightly
```
fastlane ios nightly
```
Build the app
### ios release
```
fastlane ios release
```
Build the release app

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
