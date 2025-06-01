*** Settings ***
Documentation       SauceDemo Auth Test Suite

Library             Browser
Variables           ../data/contants.py
Variables           ../data/locators.py


*** Variables ***
${SAUCEDEMO_STANDARD_USER}              standard_user
${SAUCEDEMO_PROBLEM_USER}               problem_user
${SAUCEDEMO_LOCKED_OUT_USER}            locked_out_user
${SAUCEDEMO_PERFORMANCE_GLITCH_USER}    performance_glitch_user
${SAUCEDEMO_ERROR_USER}                 error_user
${SAUCEDEMO_VISUAL_USER}                visual_user
${SAUCEDEMO_PASSWORD}                   secret_sauce
${PRODUCTS_PAGE_URL}                    ${CONSTANTS_BASE_URL}/inventory.html


*** Test Cases ***
Standard Users Should Be Able To See Products
    [Tags]    saucedemo    auth    standard_user
    [Setup]    Open SauceDemo On Browser
    Log In    ${SAUCEDEMO_STANDARD_USER}    ${SAUCEDEMO_PASSWORD}
    User Should Be Able To See Products
    [Teardown]    Close Browser

Problem User Should Be Able To See Products
    [Tags]    saucedemo    auth    problem_user
    [Setup]    Open SauceDemo On Browser
    Log In    ${SAUCEDEMO_PROBLEM_USER}    ${SAUCEDEMO_PASSWORD}
    User Should Be Able To See Products
    [Teardown]    Close Browser

Locked Out User Should Not Be Able To See Products
    [Tags]    saucedemo    auth    locked_out_user
    [Setup]    Open SauceDemo On Browser
    Log In    ${SAUCEDEMO_LOCKED_OUT_USER}    ${SAUCEDEMO_PASSWORD}
    Lockout Error Should Be Shown
    [Teardown]    Close Browser

Performance Glitch User Should Be Able To See Products
    [Tags]    saucedemo    auth    performance_glitch_user
    [Setup]    Open SauceDemo On Browser
    Log In    ${SAUCEDEMO_PERFORMANCE_GLITCH_USER}    ${SAUCEDEMO_PASSWORD}
    User Should Be Able To See Products
    [Teardown]    Close Browser

Error User Should Be Able To See Products
    [Tags]    saucedemo    auth    error_user
    [Setup]    Open SauceDemo On Browser
    Log In    ${SAUCEDEMO_ERROR_USER}    ${SAUCEDEMO_PASSWORD}
    User Should Be Able To See Products
    [Teardown]    Close Browser

Visual User Should Be Able To See Products
    [Tags]    saucedemo    auth    visual_user
    [Setup]    Open SauceDemo On Browser
    Log In    ${SAUCEDEMO_VISUAL_USER}    ${SAUCEDEMO_PASSWORD}
    User Should Be Able To See Products
    [Teardown]    Close Browser


*** Keywords ***
Open SauceDemo On Browser
    New Browser    browser=chromium
    ...    headless=False
    ...    slowMo=1s
    ...    timeout=30s
    New Context    tracing=True
    ...    viewport={"width": 1280, "height": 720}
    ...    defaultBrowserType=chromium
    New Page    ${CONSTANTS_START_URL}

Log In
    [Arguments]    ${username}    ${password}
    Fill Text    css=${LOCATORS_AUTH_USERNAME}    ${username}
    Fill Text    css=${LOCATORS_AUTH_PASSWORD}    ${password}
    Click    css=${LOCATORS_AUTH_LOGIN_BTN}

User Should Be Able To See Products
    Wait For Elements State    css=${LOCATORS_PRODUCTS_PAGE_TITLE}    visible    5000
    ${URL}=    Get Url
    ${PRODUCTS_TITLE}=    Get Text    css=${LOCATORS_PRODUCTS_PAGE_TITLE}
    Should Be Equal As Strings    ${URL}    ${PRODUCTS_PAGE_URL}
    Should Be Equal As Strings    ${PRODUCTS_TITLE}    ${CONSTANTS_PRODUCTS_PAGE_TITLE}

Lockout Error Should Be Shown
    Wait For Elements State    css=${LOCATORS_AUTH_ERROR_MESSAGE}    visible
    ${ERROR_MESSAGE}=    Get Text    css=${LOCATORS_AUTH_ERROR_MESSAGE}
    Should Be Equal As Strings    ${ERROR_MESSAGE}    ${CONSTANTS_AUTH_ERROR_MESSAGE}
