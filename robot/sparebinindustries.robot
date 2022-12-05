*** Settings ***
Documentation    Basic Spare Bins Industries Robot
Library    Browser

*** Variables ***
${URL} =         https://robotsparebinindustries.com/
${TITLE} =       RobotSpareBin Industries Inc. - Intranet
${SUBTITLE} =    The leader in refurbished and dubious quality spare parts for robots, since 1982!

*** Keywords ***
Open Browser To Show Web Page
    New Page    ${URL}
    Get Title    ==    ${TITLE}

Verify Web Page
    Get Url     ==    ${URL}/#/
	Get Title    ==    ${TITLE}
    Get Text    body    contains    ${SUBTITLE}

*** Test Cases ***
Web page is live
    Open Browser To Show Web Page
	Verify Web Page
