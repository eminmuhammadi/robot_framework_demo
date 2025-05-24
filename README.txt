Robot Framework

https://docs.robotframework.org/docs/getting_started/ide
https://chrisjhart.com/Robot-Framework-Syntax-Cheat-Sheet/
https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html

Extensions:
- https://marketplace.visualstudio.com/items?itemName=d-biehl.robotcode
- https://marketplace.visualstudio.com/items?itemName=tumit.vscode-rf-formatter
- https://marketplace.visualstudio.com/items?itemName=robocorp.robotframework-lsp


BDD: https://docs.robotframework.org/docs/testcase_styles/bdd
DD: https://docs.robotframework.org/docs/testcase_styles/datadriven
RIDE Editor: https://github.com/robotframework/RIDE/wiki/Installation-Instructions


UI Testing: https://marketsquare.github.io/robotframework-browser/Browser.html
API Request: https://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html
Built In: https://robotframework.org/robotframework/latest/libraries/BuiltIn.html


>>> Setup:

$ python -m venv .venv

$ source ./.venv/Scripts/activate

$ node --version
$ npm --version

$ pip install -r requirements.txt

$ rfbrowser init

$ robot -T --loglevel DEBUG -d report/ --variablefile ./data/contants.py --variablefile ./data/locators.py tests/example.robot

$ ./.venv/Scripts/ride .