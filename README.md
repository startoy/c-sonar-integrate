## Prerequisite
- gcc
- cppcheck

## USAGE
1. `make`
2. `make sonar`

###### If rebuild use `make clean` before `make`

### Other cmd
- `make sonar-scan` for create report files on "report" folder
- `make sonar-push` for execute sonar-scanner -X  

**- `make sonar` is calling 2 cmd above**

## Configuration can be config in..
- Makefile
- sonar-project.properties
