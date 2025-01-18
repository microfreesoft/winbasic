DECLARE SUB ShowHelp()
DECLARE SUB SaveFile(filename$)
DECLARE SUB OpenFile(filename$)

DIM SHARED doc$(1 TO 50) ' Arreglo para almacenar el texto
DIM SHARED currentLine AS INTEGER ' L�nea actual que est� escribiendo el usuario
DIM filename$ ' Nombre del archivo

' Inicializaci�n
FOR i = 1 TO 50
    doc$(i) = "" ' Inicializar el arreglo con cadenas vac�as
NEXT

CLS
currentLine = 1

DO
    PRINT "TUI Word Processor - QBASIC"
    PRINT "============================="
    PRINT "1. Nuevo Archivo"
    
    PRINT "3. Guardar Archivo"
    PRINT "4. Salir"
    PRINT "5. Mostrar Ayuda"
    PRINT
    PRINT "Selecciona una opci�n (1-5): ";
    
    INPUT choice

    SELECT CASE choice
        CASE 1 ' Nuevo archivo
            CLS
            PRINT "TUI Word Processor - QBASIC"
            PRINT "============================="
            PRINT "Nuevo archivo creado. Escribe tu texto:"
            ' Reiniciar el contenido y empezar desde la primera l�nea
            FOR i = 1 TO 50
                doc$(i) = "" ' Limpiar el arreglo de l�neas
            NEXT
            currentLine = 1
            
            DO
                LOCATE 10 + currentLine, 1 ' Posici�n de la l�nea actual en pantalla
                PRINT "L�nea "; currentLine; ": ";  ' Mostrar el n�mero de l�nea
                INPUT doc$(currentLine) ' Capturar el texto en la l�nea actual
                
                IF doc$(currentLine) = "" THEN
                    PRINT "Presiona Enter sin escribir texto para volver al men�."
                    EXIT DO ' Salir del ciclo y volver al men� si no se escribe nada
                ELSE
                    currentLine = currentLine + 1
                    IF currentLine > 50 THEN
                        PRINT "El l�mite de l�neas ha sido alcanzado."
                        EXIT DO ' Salir del ciclo si se alcanza el l�mite de l�neas
                    END IF
                END IF
            LOOP
        CASE 2 ' Abrir archivo
            CLS
            PRINT "== ABRIR ARCHIVO =="
            INPUT "Ingrese el nombre del archivo: "; filename$
            CALL OpenFile(filename$)
        CASE 3 ' Guardar archivo
            CLS
            PRINT "TUI Word Processor - QBASIC"
            PRINT "============================="
            INPUT "Introduce el nombre del archivo para guardar: ", filename$
            CALL SaveFile(filename$)
        CASE 4 ' Salir
            END
        CASE 5 ' Mostrar ayuda
            CALL ShowHelp
        CASE ELSE
            PRINT "Opci�n no v�lida. Intenta de nuevo."
    END SELECT

    PRINT
    PRINT "Presiona Enter para continuar..."
    SLEEP
    CLS
LOOP

SUB ShowHelp
    CLS
    PRINT "Ayuda del Procesador de Texto"
    PRINT
    PRINT "1. Nuevo Archivo - Crea un nuevo archivo vac�o."
    PRINT "2. Abrir Archivo - Abre un archivo existente para editarlo."
    PRINT "3. Guardar Archivo - Guarda el contenido actual en un archivo."
    PRINT "4. Salir - Termina el programa."
    PRINT "5. Mostrar Ayuda - Muestra esta ayuda."
    PRINT
    PRINT "Formato de texto:"
    PRINT " - *negrita*: Encierra el texto entre asteriscos."
    PRINT " - /cursiva/: Encierra el texto entre diagonales."
    PRINT " - # T�tulo: Comienza la l�nea con # para un t�tulo."
    PRINT
    PRINT "Presiona cualquier tecla para volver al men� principal."
    SLEEP
    CLS
END SUB

SUB SaveFile(filename$)
    OPEN filename$ FOR OUTPUT AS #1
    FOR i = 1 TO currentLine - 1 ' Guardar hasta la �ltima l�nea escrita
        ' Aseg�rate de que la l�nea no est� vac�a
        IF doc$(i) <> "" THEN
            PRINT #1, doc$(i)
        END IF
    NEXT
    CLOSE #1
    PRINT "Archivo guardado como "; filename$
END SUB

SUB OpenFile(filename$)
    OPEN filename$ FOR INPUT AS #1
    currentLine = 1 ' Empezar desde la primera l�nea
    lineContent$ = "" ' Variable temporal para almacenar la l�nea le�da

    WHILE NOT EOF(1)
        LINE INPUT #1, lineContent$ ' Leer l�nea por l�nea
        doc$(currentLine) = lineContent$ ' Guardar la l�nea le�da en el arreglo
        currentLine = currentLine + 1
        
        IF currentLine > 50 THEN
            PRINT "El archivo tiene m�s de 50 l�neas. Solo se cargaron las primeras 50."
            EXIT WHILE ' Detener la lectura si se alcanza el l�mite de 50 l�neas
        END IF
    WEND

    CLOSE #1
    PRINT "Archivo cargado correctamente."
    INPUT "Presione ENTER para continuar."; choice
    CLS
    RETURN
END SUB
