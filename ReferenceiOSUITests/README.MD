# e2e Testing
End to end testing is implemented using the XCUItest framework with the native iOS test runner. The iOS-native framework waits for the app to become idle before executing each step, thus eliminating synchronization issues and required waits.

Supported platforms:
- iOS Simulator
- iOS Physical device

To let XCUItest interact with the elements in the app, accessibilityIdentifier labels have been added to all elements.

## How to run using fastlane
To run:
- Install _fastlane_ using: `[sudo] gem install fastlane -NV`
or alternatively using: `brew cask install fastlane`

Then use the following command to run the UI tests: `fastlane ios test_ui`

## Constants
Constant are collections of a static data required for a specific test set. Normally constants would contain lists of, for example, test users, addresses or screen specific functions. In this case it contains all the static texts in the app.

## Extensions
- XCUIApplicationExtension: helps the test driver with shared recourses of the app.
- XCUIElementExtension: adds additional XCUIElement methods, in this case tapIfExists() only.

## Helpers
- ComponentHelper: any interaction with on-screen app components.
- Helper: protocol for Helper classes, uses shared recourses of the app.
- TestHelper: checks for on-screen app components.

## Tests
- Gherkin-style tests are found here, along with setUp() and tearDown() steps. All tests are using helpers for steps to improve reusability and readability and structure.

## Requirements
- macOS and Xcode 10.1+ are required to run iOS tests
- Fastlane is required

## Structure
Starting the test requires Fastlane or Xcode. The test functions will be executed by XCtest after performing the setUp() and tearDown() steps. All tests are placed within the `Tests` folder. The `Helpers` folder provides all global helpers for executing the test steps. The constants are used for static data and screen specific methods.

## Known issues
- None at the time of writing.
