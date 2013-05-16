You need to install the QT SDK with QT 4.7.0 or newer.
Open the project file src/QtWepApp.pro with QT Creator.

To quickly test the program, run it with argument -e. You should configure
your project in Qt Creator accordingly, so you can run and debug it within
QT Creator.

When you stop the program by klicking the red stop button under Linux,
you will see the error message "The program crashed". This is not an error,
but a harmless side-effect of the qtservice library.

When you run the application without any command-line option on Linux,
it will fork a background process. You can use the kill command to stop it.

When you run the application without any command-line option on Windows,
it will try to start the Windows service. To get this working, you must
install the service once by using the option -i.

The argument -h will display a help about the other available options.

The argument -c does nothing useful in the current version.

If you like to generate a class documentation in HTML, then install doxygen
and execute the doxygen command in the projects main directory. The result
will be placed in doc/html.
