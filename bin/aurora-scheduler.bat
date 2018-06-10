@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  aurora-scheduler startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Add default JVM options here. You can also use JAVA_OPTS and AURORA_SCHEDULER_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windows variants

if not "%OS%" == "Windows_NT" goto win9xME_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\aurora-0.21.0-SNAPSHOT.jar;%APP_HOME%\lib\aurora-api-0.21.0-SNAPSHOT.jar;%APP_HOME%\lib\classes;%APP_HOME%\lib\classes;%APP_HOME%\lib\commons-0.21.0-SNAPSHOT.jar;%APP_HOME%\lib\guice-assistedinject-4.1.0.jar;%APP_HOME%\lib\shiro-guice-1.4.0.jar;%APP_HOME%\lib\guice-multibindings-4.1.0.jar;%APP_HOME%\lib\guice-servlet-4.1.0.jar;%APP_HOME%\lib\resteasy-guice-3.1.4.Final.jar;%APP_HOME%\lib\guice-4.1.0.jar;%APP_HOME%\lib\aopalliance-1.0.jar;%APP_HOME%\lib\logback-classic-1.2.3.jar;%APP_HOME%\lib\jcommander-1.72.jar;%APP_HOME%\lib\jackson-datatype-protobuf-0.9.3.jar;%APP_HOME%\lib\mesos-1.4.0.jar;%APP_HOME%\lib\protobuf-java-3.3.0.jar;%APP_HOME%\lib\jackson-databind-2.5.1.jar;%APP_HOME%\lib\jackson-core-2.5.1.jar;%APP_HOME%\lib\resteasy-jackson-provider-3.1.4.Final.jar;%APP_HOME%\lib\resteasy-client-3.1.4.Final.jar;%APP_HOME%\lib\resteasy-jaxrs-3.1.4.Final.jar;%APP_HOME%\lib\javax.inject-1.jar;%APP_HOME%\lib\jetty-rewrite-9.3.11.v20160721.jar;%APP_HOME%\lib\jetty-servlet-9.3.11.v20160721.jar;%APP_HOME%\lib\jetty-security-9.3.11.v20160721.jar;%APP_HOME%\lib\jetty-server-9.3.11.v20160721.jar;%APP_HOME%\lib\javax.servlet-api-3.1.0.jar;%APP_HOME%\lib\stringtemplate-3.2.1.jar;%APP_HOME%\lib\curator-recipes-2.12.0.jar;%APP_HOME%\lib\curator-framework-2.12.0.jar;%APP_HOME%\lib\curator-client-2.12.0.jar;%APP_HOME%\lib\async-http-client-2.0.37.jar;%APP_HOME%\lib\shiro-web-1.4.0.jar;%APP_HOME%\lib\zookeeper-3.4.8.jar;%APP_HOME%\lib\jetty-servlets-9.3.11.v20160721.jar;%APP_HOME%\lib\quartz-2.2.2.jar;%APP_HOME%\lib\libthrift-0.10.0.jar;%APP_HOME%\lib\gson-2.3.1.jar;%APP_HOME%\lib\guava-23.2-jre.jar;%APP_HOME%\lib\commons-lang-2.6.jar;%APP_HOME%\lib\javax.ws.rs-api-2.0.jar;%APP_HOME%\lib\easymock-3.4.jar;%APP_HOME%\lib\junit-4.12.jar;%APP_HOME%\lib\logback-core-1.2.3.jar;%APP_HOME%\lib\async-http-client-netty-utils-2.0.37.jar;%APP_HOME%\lib\netty-resolver-dns-2.0.37.jar;%APP_HOME%\lib\netty-resolver-2.0.37.jar;%APP_HOME%\lib\netty-codec-dns-2.0.37.jar;%APP_HOME%\lib\shiro-core-1.4.0.jar;%APP_HOME%\lib\shiro-cache-1.4.0.jar;%APP_HOME%\lib\shiro-crypto-hash-1.4.0.jar;%APP_HOME%\lib\shiro-crypto-cipher-1.4.0.jar;%APP_HOME%\lib\shiro-config-ogdl-1.4.0.jar;%APP_HOME%\lib\shiro-config-core-1.4.0.jar;%APP_HOME%\lib\shiro-event-1.4.0.jar;%APP_HOME%\lib\shiro-crypto-core-1.4.0.jar;%APP_HOME%\lib\shiro-lang-1.4.0.jar;%APP_HOME%\lib\slf4j-api-1.7.25.jar;%APP_HOME%\lib\jackson-annotations-2.5.1.jar;%APP_HOME%\lib\annotations-3.0.0.jar;%APP_HOME%\lib\jboss-annotations-api_1.2_spec-1.0.0.Final.jar;%APP_HOME%\lib\jboss-logging-3.3.0.Final.jar;%APP_HOME%\lib\jackson-jaxrs-1.9.13.jar;%APP_HOME%\lib\jackson-xc-1.9.13.jar;%APP_HOME%\lib\jackson-mapper-asl-1.9.13.jar;%APP_HOME%\lib\jackson-core-asl-1.9.13.jar;%APP_HOME%\lib\jboss-jaxrs-api_2.0_spec-1.0.1.Beta1.jar;%APP_HOME%\lib\resteasy-jaxrs-services-3.1.4.Final.jar;%APP_HOME%\lib\activation-1.1.1.jar;%APP_HOME%\lib\httpclient-4.5.2.jar;%APP_HOME%\lib\commons-io-2.5.jar;%APP_HOME%\lib\jcip-annotations-1.0.jar;%APP_HOME%\lib\antlr-2.7.7.jar;%APP_HOME%\lib\netty-codec-http-4.0.52.Final.jar;%APP_HOME%\lib\netty-reactive-streams-1.0.8.jar;%APP_HOME%\lib\netty-handler-4.0.52.Final.jar;%APP_HOME%\lib\netty-transport-native-epoll-4.0.52.Final-linux-x86_64.jar;%APP_HOME%\lib\reactive-streams-1.0.0.jar;%APP_HOME%\lib\jline-0.9.94.jar;%APP_HOME%\lib\netty-3.7.0.Final.jar;%APP_HOME%\lib\jetty-client-9.3.11.v20160721.jar;%APP_HOME%\lib\jetty-http-9.3.11.v20160721.jar;%APP_HOME%\lib\jetty-io-9.3.11.v20160721.jar;%APP_HOME%\lib\jetty-continuation-9.3.11.v20160721.jar;%APP_HOME%\lib\jetty-util-9.3.11.v20160721.jar;%APP_HOME%\lib\c3p0-0.9.1.1.jar;%APP_HOME%\lib\httpcore-4.4.4.jar;%APP_HOME%\lib\jsr305-1.3.9.jar;%APP_HOME%\lib\error_prone_annotations-2.0.18.jar;%APP_HOME%\lib\j2objc-annotations-1.1.jar;%APP_HOME%\lib\animal-sniffer-annotations-1.14.jar;%APP_HOME%\lib\objenesis-2.2.jar;%APP_HOME%\lib\hamcrest-core-1.3.jar;%APP_HOME%\lib\commons-logging-1.2.jar;%APP_HOME%\lib\commons-codec-1.9.jar;%APP_HOME%\lib\netty-codec-4.0.52.Final.jar;%APP_HOME%\lib\netty-transport-4.0.52.Final.jar;%APP_HOME%\lib\netty-buffer-4.0.52.Final.jar;%APP_HOME%\lib\netty-common-4.0.52.Final.jar;%APP_HOME%\lib\commons-beanutils-1.9.3.jar;%APP_HOME%\lib\commons-collections-3.2.2.jar

@rem Execute aurora-scheduler
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %AURORA_SCHEDULER_OPTS%  -classpath "%CLASSPATH%" org.apache.aurora.scheduler.app.SchedulerMain %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable AURORA_SCHEDULER_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%AURORA_SCHEDULER_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
