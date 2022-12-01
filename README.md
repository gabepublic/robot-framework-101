# robot-framework-101

Robot Framework exploration 101

## Prerequisite

- Python
- Git

## SETUP

### Linux

- Create python virtual env
```
$ cd [projects-dir]/robot-framework-101
$ virtualenv ./.venv
$ source .venv/bin/activate
(.venv) $
```

- Installing Robot Framework with `pip`:
```
(.venv) $ pip install robotframework
(.venv) $ robot --version
Robot Framework 6.0 (Python 3.8.2 on linux)
(.venv) $
```

- To run automated test cases for web UIs, the current go-to library is
  the `Browser-library`. The tests will be run "headless", by default.
```
(.venv) $ pip install robotframework-browser
```
  - After the installation has completed successfully, the library has
    to be **initialized** by running
```
(.venv) $ rfbrowser init
```

- Install - nodejs using nvm. The Browser-library has requirements 
  for NodeJS.
```
$ curl -sL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
$ source ~/.bashrc
$ command -v nvm
$ node --version
$ npm --version
$
$ rfbrowser init
```

- Install `robotframework-lint`, a linting tool, that is a lightweight
  static analysis tool to verify that you and your team are doing your
  code consistently
```
(.venv) $ pip install robotframework-lint
```

- [Optional - To be validated, may not be needed!!] 
  Install dependencies to run UI browsers on Ubuntu.
  If you have a non-GUI Ubuntu, you need to install playwright:
```
$ sudo npx playwright install-deps
```
  - Or, alternative, (this option was not TESTED!!)
```
$ sudo apt-get install libgbm1 libxkbcommon0 libpango-1.0-0 libcairo2
$ 
```

### Windows

- Create python virtual env
```
C:\> cd [projects-dir]/robot-framework-101
C:\> virtualenv .venv-win
C:\> .venv-win/Scripts/activate
(.venv-win) C:\> 
```

- Installing Robot Framework with `pip`:
```
(.venv-win) C:\> pip install robotframework
(.venv-win) C:\> $ robot --version
Robot Framework 6.0 (Python 3.8.2 on linux)
(.venv-win) C:\> 
```

- To run automated test cases for web UIs, the current go-to library is
  the `Browser-library`. The tests will be run "headless", by default.
```
(venv) $ pip install robotframework-browser
```
  - After the installation has completed successfully, the library has
    to be **initialized** by running
```
(venv) $ rfbrowser init
```

## Login robot

Based on robotframework kata excercise.

Source: 
- Robot Framework katas: series of exercises and examples how to get 
  started with test automation. No prior knowledge of test automation
  required. https://robotframework.org/?tab=2#getting-started
  Github: https://github.com/eficode-academy/rf-katas

- Prerequisite:
  - Setup the above prerequisite
  - clone this repo; https://github.com/gabepublic/robot-framework-101.git

- The following instructions are for linux environment.
  For windows environment, see below.

- Start the http-server web application
```
(venv) $ cd [projects-dir]/robot-framework-101
$ source .venv/bin/activate
(venv) $ python server/server.py
Demo server starting on port 7272.
CTRL-C to stop 
```

- Open another terminal,
```
(venv) $ cd [projects-dir]/robot-framework-101
$ source .venv/bin/activate
(venv) $ robot robot/login.robot
==============================================================================
Login                                                                         
==============================================================================
Login page is live                                                    | PASS |
------------------------------------------------------------------------------
[ WARN ] Direct assignment of values as 'secret' is deprecated. Use special variable syntax to resolve variable. Example $var instead of ${var}.
Welcome Page Should Be Visible After Successful Login                 | PASS |
------------------------------------------------------------------------------
[ WARN ] Direct assignment of values as 'secret' is deprecated. Use special variable syntax to resolve variable. Example $var instead of ${var}.
Welcome Page shows success message After Successful Login             | PASS |
------------------------------------------------------------------------------
Login                                                                 | PASS |
3 tests, 3 passed, 0 failed
==============================================================================
Output:  /mnt/c/zWSL/projects/robot-framework-101/output.xml
Log:     /mnt/c/zWSL/projects/robot-framework-101/log.html
Report:  /mnt/c/zWSL/projects/robot-framework-101/report.html
(.venv) $
```

### Windows environment

- Start the http-server web application from a windows console: 
```
(.venv-win) C:\> cd [projects-dir]/robot-framework-101
(.venv-win) C:\> python server/server.py
Demo server starting on port 7272.
CTRL-C to stop 
```

- On Windows, we can run the tests "headless", like the linux above;
  or run the test on the "headed" browser UI. Both are demonstrated
  below.

- Open another windows console to run the "headless" tests:
```
C:\> cd [projects-dir]/robot-framework-101
C:\> .venv-win/Scripts/activate
(.venv-win) C:\> robot robot/login.robot
==============================================================================
Login
==============================================================================
Login page is live                                                    | PASS |
------------------------------------------------------------------------------
[ WARN ] Direct assignment of values as 'secret' is deprecated. Use special variable syntax to resolve variable. Example $var instead of ${var}.
Welcome Page Should Be Visible After Successful Login                 | PASS |
------------------------------------------------------------------------------
[ WARN ] Direct assignment of values as 'secret' is deprecated. Use special variable syntax to resolve variable. Example $var instead of ${var}.
Welcome Page shows success message After Successful Login             | PASS |
------------------------------------------------------------------------------
Login                                                                 | PASS |
3 tests, 3 passed, 0 failed
==============================================================================
Output:  C:\zWSL\projects\robot-framework-101\output.xml
Log:     C:\zWSL\projects\robot-framework-101\log.html
Report:  C:\zWSL\projects\robot-framework-101\report.html
(.venv-win) C:\> 
```
 
- NOTE: to run with browser GUI, modify the `login.robot` to add the
  following line after the "Open Browser To Show Login Page" keyword;
  this will open the browser GUI during the test.
```
New Browser    headless=${FALSE}
```

- Open another terminal, run the test cases with the "headed" browser
```
C:\> cd [projects-dir]/robot-framework-101
C:\> .venv-win/Scripts/activate
(.venv-win) C:\> robot robot/login-headed.robot
==============================================================================
Login-Headed
==============================================================================
Login page is live                                                    | PASS |
------------------------------------------------------------------------------
[ WARN ] Direct assignment of values as 'secret' is deprecated. Use special variable syntax to resolve variable. Example $var instead of ${var}.
Welcome Page Should Be Visible After Successful Login                 | PASS |
------------------------------------------------------------------------------
[ WARN ] Direct assignment of values as 'secret' is deprecated. Use special variable syntax to resolve variable. Example $var instead of ${var}.
Welcome Page shows success message After Successful Login             | PASS |
------------------------------------------------------------------------------
Login-Headed                                                          | PASS |
3 tests, 3 passed, 0 failed
==============================================================================
Output:  C:\zWSL\projects\robot-framework-101\output.xml
Log:     C:\zWSL\projects\robot-framework-101\log.html
Report:  C:\zWSL\projects\robot-framework-101\report.html
(.venv-win) C:\> 
```

## Documentation

Source: https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#library-documentation-tool-libdoc

- Generate documentation
```
(venv) $ libdoc robot/login.robot login.html
.../login.html
(venv) $  
```

