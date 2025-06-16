*** Settings ***
Library     AppiumLibrary


*** Variables ***
${REMOTE_URL}           http://localhost:4723
${PLATFORM_NAME}        Android
${PLATFORM_VERSION}     16.0
${DEVICE_NAME}          Medium_Phone_API_36.0
${AUTOMATION_NAME}      UiAutomator2
${APP_PACKAGE}          com.android.settings
${APP_ACTIVITY}         .Settings
${AVD}                  Medium_Phone_API_36.0
${AVD_TIMEOUT}          200000
${AUTO_GRANT}           true


*** Test Cases ***
Open Android Settings App
    [Documentation]    Open Android Settings app and check if loaded
    [Setup]    Open Application    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    platformVersion=${PLATFORM_VERSION}
    ...    deviceName=${DEVICE_NAME}
    ...    automationName=${AUTOMATION_NAME}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
    ...    avd=${AVD}
    ...    avdLaunchTimeout=${AVD_TIMEOUT}
    ...    autoGrantPermissions=${AUTO_GRANT}
    Sleep    5s
    Page Should Contain Element    //*[@text='Network & internet']
    [Teardown]    Close Application
