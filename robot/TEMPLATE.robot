*** Settings ***
Documentation          descriptions of login test suites;
...                    this suite has multiple test cases.
Metadata               template    1.0
Library                Browser
Resource               login.resource
Default Tags
Force Tags
Keyword Tags
#Test Tags              login-suite
Test Setup             No Operation
Test Teardown          No Operation
Test Timeout
Test Template
Suite Setup
Suite Teardown


*** Variables ***
${USERNAME} =          demo          # Scalar
${MULTILINE_DESC}      SEPARATOR=\n
...                    This is a long multiline string.
...                    This is the second line.
@{LIST}                this     list     is      quite    long     and
&{DICT}                first=This value is pretty long.


*** Keywords ***
Submit Login
    [Documentation]    descriptions of keyword
    [Tags]             loginkw
    [Arguments]
    [Return]
    [Teardown]
    [Timeout]

Private Keyword
    [Tags]    robot:private
    No Operation

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

