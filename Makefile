export THDLOCK_DEFINE=-D_DEBUG_THDLOCK_
export MODULO_DEFINE=-D_MOD222_STYLE_
export COMPILE64_DEFINE=-m64

OUTPUT 	= simplec.out
LIB 	=
SLIB    = -lbsd -lm -lc -lpthread

CC_OPT	= -c -g -w -I. -D__P_INFO_SHAREMEM__ -D_THREAD_SAFE $(MODULO_DEFINE) $(THDLOCK_DEFINE) $(COMPILE64_DEFINE)

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
