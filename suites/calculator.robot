*** Settings ***
Documentation       Test suite for a simple calculator API.

Library             ./../libraries/Calculator.py


*** Test Cases ***
Test Addition
    [Documentation]    Test the addition functionality of the calculator.
    [Tags]    calculator    addition
    ${result}=    Add    5    3
    Should Be Equal As Numbers    ${result}    8

Test Subtraction
    [Documentation]    Test the subtraction functionality of the calculator.
    [Tags]    calculator    subtraction
    ${result}=    Subtract    10    4
    Should Be Equal As Numbers    ${result}    6

Test Multiplication
    [Documentation]    Test the multiplication functionality of the calculator.
    [Tags]    calculator    multiplication
    ${result}=    Multiply    7    6
    Should Be Equal As Numbers    ${result}    42

Test Division
    [Documentation]    Test the division functionality of the calculator.
    [Tags]    calculator    division
    ${result}=    Divide    20    5
    Should Be Equal As Numbers    ${result}    4

Test Division By Zero
    [Documentation]    Test division by zero raises an error.
    [Tags]    calculator    division_by_zero
    Run Keyword And Expect Error    ValueError: Division by zero is not allowed.    Divide    10    0
