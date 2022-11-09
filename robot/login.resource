*** Settings ***
Documentation    Login features
Library    Browser

*** Variables ***
${URL} =    http://localhost:7272
${USERNAME} =    demo
${PASSWORD} =    mode

*** Keywords ***
Enter Username
    [Arguments]    ${username}
    Fill Text      id=username_field    ${username}

Enter Password
    [Arguments]    ${password}
    Fill Secret    id=password_field    ${password}

Submit Login Form
    Click    id=login_button
	
Enter valid credentials
    Enter Username    ${USERNAME}
    Enter Password    ${PASSWORD}

Verify Welcome Page
    Get Text    body    contains    Welcome Page
    Get Url     ==    http://localhost:7272/welcome.html
	Get Title    ==    Welcome Page

Verify Login Page
    Get Text    body    contains    Login Page
    Get Url     ==    http://localhost:7272/
	Get Title    ==    Login Page

Do Successful Login
    Enter valid credentials
    Submit Login Form
	Verify Welcome Page

Do Successful Logout
	${logout} =    Get Element    text=logout
    Click    ${logout}
    Verify Login Page
	Close Browser