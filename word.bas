DECLARE SUB ShowHelp()
DECLARE SUB SaveFile(filename$)
DECLARE SUB OpenFile(filename$)

DIM SHARED doc$(1 TO 50) ' Arreglo para almacenar el texto
DIM SHARED currentLine AS INTEGER ' Línea actual que está escribiendo el usuario
DIM filename$ ' Nombre del archivo

' Inicialización
FOR i = 1 TO 50
    doc$(i) = "" ' Inicializar el arreglo con cadenas vacías
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
    PRINT "Selecciona una opción (1-5): ";
    
    INPUT choice

    SELECT CASE choice
        CASE 1 ' Nuevo archivo
            CLS
            PRINT "TUI Word Processor - QBASIC"
            PRINT "============================="
            PRINT "Nuevo archivo creado. Escribe tu texto:"
            ' Reiniciar el contenido y empezar desde la primera línea
            FOR i = 1 TO 50
                doc$(i) = "" ' Limpiar el arreglo de líneas
            NEXT
            currentLine = 1
            
            DO
                LOCATE 10 + currentLine, 1 ' Posición de la línea actual en pantalla
                PRINT "Línea "; currentLine; ": ";  ' Mostrar el número de línea
                INPUT doc$(currentLine) ' Capturar el texto en la línea actual
                
                IF doc$(currentLine) = "" THEN
                    PRINT "Presiona Enter sin escribir texto para volver al menú."
                    EXIT DO ' Salir del ciclo y volver al menú si no se escribe nada
                ELSE
                    currentLine = currentLine + 1
                    IF currentLine > 50 THEN
                        PRINT "El límite de líneas ha sido alcanzado."
                        EXIT DO ' Salir del ciclo si se alcanza el límite de líneas
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
            PRINT "Opción no válida. Intenta de nuevo."
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
    PRINT "1. Nuevo Archivo - Crea un nuevo archivo vacío."
    PRINT "2. Abrir Archivo - Abre un archivo existente para editarlo."
    PRINT "3. Guardar Archivo - Guarda el contenido actual en un archivo."
    PRINT "4. Salir - Termina el programa."
    PRINT "5. Mostrar Ayuda - Muestra esta ayuda."
    PRINT
    PRINT "Formato de texto:"
    PRINT " - *negrita*: Encierra el texto entre asteriscos."
    PRINT " - /cursiva/: Encierra el texto entre diagonales."
    PRINT " - # Título: Comienza la línea con # para un título."
    PRINT
    PRINT "Presiona cualquier tecla para volver al menú principal."
    SLEEP
    CLS
END SUB

SUB SaveFile(filename$)
    OPEN filename$ FOR OUTPUT AS #1
    FOR i = 1 TO currentLine - 1 ' Guardar hasta la última línea escrita
        ' Asegúrate de que la línea no está vacía
        IF doc$(i) <> "" THEN
            PRINT #1, doc$(i)
        END IF
    NEXT
    CLOSE #1
    PRINT "Archivo guardado como "; filename$
END SUB

SUB OpenFile(filename$)
    OPEN filename$ FOR INPUT AS #1
    currentLine = 1 ' Empezar desde la primera línea
    lineContent$ = "" ' Variable temporal para almacenar la línea leída

    WHILE NOT EOF(1)
        LINE INPUT #1, lineContent$ ' Leer línea por línea
        doc$(currentLine) = lineContent$ ' Guardar la línea leída en el arreglo
        currentLine = currentLine + 1
        
        IF currentLine > 50 THEN
            PRINT "El archivo tiene más de 50 líneas. Solo se cargaron las primeras 50."
            EXIT WHILE ' Detener la lectura si se alcanza el límite de 50 líneas
        END IF
    WEND

    CLOSE #1
    PRINT "Archivo cargado correctamente."
    INPUT "Presione ENTER para continuar."; choice
    CLS
    RETURN
END SUB
