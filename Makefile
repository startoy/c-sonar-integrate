OUTPUT 	= simplec.out

simplec :	
		gcc -o $(OUTPUT) simplec.c --coverage

all:	/bin/false

clean:
	rm -rf *.out *.o *.xml *.gcno *.gcov

#########
# SONAR #
#########

CPPCHECK_INCLUDES = -I.
SOURCES_TO_ANALYSE = .

sonar-report: sonar_cppcheck sonar_coverage
sonar-push: sonar_sonar
sonar: sonar-report sonar-push

sonar_cppcheck:
	cppcheck -v --enable=all --xml $(CPPCHECK_INCLUDES) $(SOURCES_TO_ANALYSE) 2> cppcheck-report.xml

sonar_coverage:
	gcovr -x -r . > gcovr-report.xml

sonar_sonar:
	sonar-scanner -X
