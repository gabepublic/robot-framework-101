Line-1 ignored
Line-2 ignored
Line-3 ignored
Line-4 ignored



*** Settings ***
Documentation
Library           Process
Library           String
Library           lib/Log.py
Test Tags         requirement: 42    smoke

*** Keywords ***
# comment
Logging message
    [Arguments]    ${message}
	Log To Console    ${message}

The result of ${calculation} should be ${expected}
    ${result} =    Calculate    ${calculation}
    Should Be Equal    ${result}     ${expected}

Calculate
    [Arguments]    ${calculation}
    ${number1} =     Get Substring    ${calculation}    0    1
    ${operator} =    Get Substring    ${calculation}    2    3
    ${number2} =     Get Substring    ${calculation}    4    5
	#Logging message    ${number1}
	#Logging message    ${operator}
	#Logging message    ${number2}
	${eval-result} =    Evaluate    ${number1} ${operator} ${number2}
	${result} =    Convert To String    ${eval-result}
	#Logging message    ${result}
	[Return]    ${result}


*** Test Cases ***
Submit to log Hello World
    [Tags]    hello
    Logging message    Hello World

Submit to log Hello Robot
    [Tags]    hello
    Logging message    Hello Robot

Normal Error
    [Tags]    robot:skip
    Fail    This is a rather boring example...

Test Run Process
    ${result} =     Run Process    ls -al    shell=True
	Logging message    ${result.stdout}

Simple
    [Documentation]    Simple documentation
    No Operation

Template with embedded arguments
    [Template]    The result of ${calculation} should be ${expected}
    1 + 1    2
    1 + 2    3

Setting string variable
    ${string} =    Set Variable    abc
    Logging message    ${string.upper()}      # Logs 'ABC'
    Logging message    ${string * 2}          # Logs 'abcabc'

Setting number variable
    ${number} =    Set Variable    ${-2}
    Logging message    ${number * 10}         # Logs -20
    Logging message    ${number.__abs__()}    # Logs 2