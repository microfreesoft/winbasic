'----------------------------------------
' Simulación de una shell estilo Unix en QBasic
' Comandos: LS, CD, CD .., PWD, MKDIR, CAT, HELP, EXIT, TIME, DATE, VER, EXECUTE, CLEAR, RD, RM
'----------------------------------------

DECLARE SUB ListFiles()
DECLARE SUB ChangeDir(dir$)
DECLARE SUB ShowPath()
DECLARE SUB MakeDir()
DECLARE SUB ShowFile()
DECLARE SUB ShowHelp()
DECLARE SUB ShowTime()
DECLARE SUB ShowDate()
DECLARE SUB ShowVersion()
DECLARE SUB ExecuteProgram()
DECLARE SUB ClearScreen()
DECLARE SUB RemoveDir()
DECLARE SUB RemoveFile()
DECLARE FUNCTION GetPrompt$()

DIM SHARED currentPath AS STRING
currentPath = "C:\"

CLS
PRINT "Bienvenido a la Shell estilo Unix "
PRINT "Escribe 'HELP' para ver la lista de comandos disponibles."
PRINT "Escribe 'EXIT' para salir."

mainLoop:
    PRINT
    PRINT GetPrompt$; "> ";
    LINE INPUT userInput$ ' Captura la entrada completa

    ' Validar si la entrada está vacía
    IF LEN(userInput$) = 0 THEN
        PRINT "No ingresaste ningún comando. Intenta de nuevo."
        GOTO mainLoop
    END IF

    ' Procesar comandos
    SELECT CASE UCASE$(userInput$)
        CASE "LS"
            ListFiles
        CASE "PWD"
            ShowPath
        CASE "MKDIR"
            MakeDir
        CASE "CAT"
            ShowFile
        CASE "HELP"
            ShowHelp
        CASE "TIME"
            ShowTime
        CASE "DATE"
            ShowDate
        CASE "VER"
            ShowVersion
        CASE "EXECUTE"
            ExecuteProgram
        CASE "CLEAR"
            ClearScreen
        CASE "RD"
            RemoveDir
        CASE "RM"
            RemoveFile
        CASE "EXIT"
            PRINT "Saliendo de la Shell. ¡Adiós!"
            END
        CASE ELSE
            ' Verificar comandos CD y CD ..
            IF UCASE$(LEFT$(userInput$, 2)) = "CD" THEN
                ChangeDir MID$(userInput$, 4)
            ELSE
                PRINT "Comando no reconocido: "; userInput$
            END IF
    END SELECT

GOTO mainLoop

'----------------------------------------
' SUBPROGRAMAS
'----------------------------------------

' Listar archivos en el directorio actual
SUB ListFiles
    SHELL "DIR " + currentPath + " /B"
END SUB

' Cambiar directorio
SUB ChangeDir (dir$)
    dir$ = LTRIM$(RTRIM$(dir$)) ' Eliminar espacios adicionales

    IF UCASE$(dir$) = ".." THEN
        ' Ir al directorio padre
        IF currentPath = "C:\" THEN
            PRINT "Ya estás en el directorio raíz."
        ELSE
            lastSlash = 0
            FOR i = LEN(currentPath) TO 1 STEP -1
                IF MID$(currentPath, i, 1) = "\" THEN
                    lastSlash = i
                    EXIT FOR
                END IF
            NEXT i

            IF lastSlash > 1 THEN
                currentPath = LEFT$(currentPath, lastSlash - 1)
            ELSE
                currentPath = "C:\"
            END IF
        END IF
    ELSEIF LEN(dir$) > 0 THEN
        currentPath = currentPath + "\" + dir$
    ELSE
        PRINT "Uso correcto: CD [directorio] o CD .."
    END IF
END SUB

' Mostrar directorio actual
SUB ShowPath
    PRINT "Directorio actual: "; currentPath
END SUB

' Crear un nuevo directorio
SUB MakeDir
    DIM dirName AS STRING
    PRINT "Ingresa el nombre del nuevo directorio: ";
    LINE INPUT dirName$
    IF LEN(dirName$) > 0 THEN
        SHELL "MD " + currentPath + "\" + dirName$
        PRINT "Directorio creado: "; dirName$
    ELSE
        PRINT "Nombre de directorio no válido."
    END IF
END SUB

' Mostrar contenido de un archivo
SUB ShowFile
    DIM fileName AS STRING
    PRINT "Ingresa el nombre del archivo: ";
    LINE INPUT fileName$
    IF LEN(fileName$) > 0 THEN
        SHELL "TYPE " + currentPath + "\" + fileName$
    ELSE
        PRINT "Nombre de archivo no válido."
    END IF
END SUB

' Mostrar sistema de ayuda
SUB ShowHelp
    PRINT "----------------------------------------"
    PRINT "Comandos disponibles:"
    PRINT "LS       - Listar archivos en el directorio actual"
    PRINT "CD       - Cambiar de directorio"
    PRINT "CD ..    - Ir al directorio padre"
    PRINT "PWD      - Mostrar el directorio actual"
    PRINT "MKDIR    - Crear un nuevo directorio"
    PRINT "CAT      - Mostrar el contenido de un archivo"
    PRINT "TIME     - Mostrar la hora actual"
    PRINT "DATE     - Mostrar la fecha actual"
    PRINT "VER      - Mostrar la versión de la shell"
    PRINT "EXECUTE  - Ejecutar un programa .exe o .com"
    PRINT "CLEAR    - Limpiar la pantalla"
    PRINT "RD       - Borrar un directorio"
    PRINT "RM       - Borrar un archivo"
    PRINT "HELP     - Mostrar esta ayuda"
    PRINT "EXIT     - Salir de la Shell"
    PRINT "----------------------------------------"
END SUB

' Mostrar la hora actual
SUB ShowTime
    PRINT "La hora actual es: "; TIME$
END SUB

' Mostrar la fecha actual
SUB ShowDate
    PRINT "La fecha actual es: "; DATE$
END SUB

' Mostrar la versión de la shell
SUB ShowVersion
    PRINT "Shell BAS Versión 1.1"
END SUB

' Ejecutar un programa
SUB ExecuteProgram
    DIM programName AS STRING
    PRINT "Ingresa el nombre del programa a ejecutar (.exe o .com): ";
    LINE INPUT programName$
    IF LEN(programName$) > 0 THEN
        SHELL currentPath + "\" + programName$
    ELSE
        PRINT "Nombre de programa no válido."
    END IF
END SUB

' Limpiar la pantalla
SUB ClearScreen
    CLS
END SUB

' Borrar un directorio
SUB RemoveDir
    DIM dirName AS STRING
    PRINT "Ingresa el nombre del directorio a borrar: ";
    LINE INPUT dirName$
    IF LEN(dirName$) > 0 THEN
        SHELL "RD " + currentPath + "\" + dirName$
        PRINT "Directorio borrado: "; dirName$
    ELSE
        PRINT "Nombre de directorio no válido."
    END IF
END SUB

' Borrar un archivo
SUB RemoveFile
    DIM fileName AS STRING
    PRINT "Ingresa el nombre del archivo a borrar: ";
    LINE INPUT fileName$
    IF LEN(fileName$) > 0 THEN
        SHELL "DEL " + currentPath + "\" + fileName$
        PRINT "Archivo borrado: "; fileName$
    ELSE
        PRINT "Nombre de archivo no válido."
    END IF
END SUB

' Obtener el prompt dinámico
FUNCTION GetPrompt$
    IF currentPath = "C:\" THEN
        GetPrompt$ = "ROOT"
    ELSE
        GetPrompt$ = "USER"
    END IF
END FUNCTION
