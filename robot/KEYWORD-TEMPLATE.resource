*** Settings ***
Documentation     An example resource file
Library           Browser
Library           lib/Template.py
#Resource          

*** Variables ***
${GLOBALVAR1}     Globalvar1

*** Keywords ***
Private Keyword
    [Tags]             robot:private
    No Operation

Show all the defined variables
    Log To Console     ${GLOBALVAR1}

Two Arguments With Defaults
    [Arguments]        ${arg1}    ${arg2}=default 2
	Log To Console     ${arg1}

Select ${animal} from list
    Log To Console     ${animal}
