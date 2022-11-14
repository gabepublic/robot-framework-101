*** Settings ***
Resource        login.resource
Default Tags    headless

*** Keywords ***
Open Browser To Show Login Page
    New Page    ${URL}
    Get Title    ==     Login Page

*** Test Cases ***
Login page is live
    Open Browser To Show Login Page
	Verify Login Page

Welcome Page Should Be Visible After Successful Login
    Open Browser To Show Login Page
    Do Successful Login
    [Teardown]    Do Successful Logout

Welcome Page shows success message After Successful Login
    Open Browser To Show Login Page
    Do Successful Login 
    Get Text    body    contains    Login succeeded. 
    [Teardown]    Do Successful Logout
