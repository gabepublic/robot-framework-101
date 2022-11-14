*** Settings ***
Documentation          descriptions of login test suites;
...                    this suite has multiple test cases.
Metadata               template    1.0
Library                Browser
Resource               login.resource
Resource               KEYWORD-TEMPLATE.resource
Default Tags           headless
Force Tags
Keyword Tags
#Test Tags              login-suite
Test Setup             Log    executing overall test setup
Test Teardown          Log    executing overall test teardown
Test Timeout
Test Template
Suite Setup
Suite Teardown


*** Variables ***
${USERNAME}            demo          # Scalar
${MULTILINE_DESC}      SEPARATOR=\n
...                    This is a long multiline string.
...                    This is the second line.
@{LIST}                this     list     is      quite    long     and
&{DICT}                first=This value is pretty long.


*** Keywords ***
Submit Login
    [Documentation]    descriptions of keyword
	...                Tags: my, fine, tags
    [Tags]             loginkw
    [Arguments]
    [Return]
    [Teardown]
    [Timeout]

	
*** Test Cases ***
Do Nothing
    [Documentation]    descriptions of test cases
	[Tags]
    [Setup]            No Operation
    [Teardown]         No Operation
    [Timeout]
    [Template]
    No Operation
	
Login page is live
    [Documentation]    to fail but robot:skip
    [Tags]             logintc    robot:skip      # reserved tags
	Fail               Will fail but robot:skip here

Calling Keyword Examples
    Two Arguments With Defaults    arg1=value1

Keyword embedded arguments
    Select cat from list

Show the variables of KEYWORD-TEMPLATE resource file
    Show all the defined variables

Demonstrate keyword handling search priority
    [Documentation]    the keyword is defined in the python library 
	...                lib/Template.py; see log.html
    Log Method To Become Keyword    Hello world!!