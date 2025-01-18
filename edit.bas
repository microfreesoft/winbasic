CLS
' Editor de Texto en QBasic - Estilo Windows 3.1
' Fondo blanco, texto negro, permite abrir, editar y guardar archivos.

COLOR 0, 7 ' Texto negro sobre fondo blanco
CLS

DIM fileName AS STRING
DIM textArray(100) AS STRING ' M�ximo 100 l�neas de texto
DIM lineCount AS INTEGER
DIM choice AS STRING
DIM editLine AS INTEGER
DIM textLine AS STRING

DO
    CLS
    PRINT "===== EDITOR DE TEXTO WINDOWS 3.1 ====="
    PRINT "1. Nuevo Archivo"
    PRINT "2. Abrir Archivo"
    PRINT "3. Editar Archivo"
    PRINT "4. Guardar Archivo"
    PRINT "5. Salir"
    PRINT "========================================"
    INPUT "Seleccione una opci�n (1-5): "; choice
    
    SELECT CASE choice
        CASE "1"
            CLS
            PRINT "== NUEVO ARCHIVO =="
            lineCount = 0
            DO
                INPUT "Escriba una l�nea (FIN para terminar): "; textLine
                IF UCASE$(textLine) = "FIN" THEN EXIT DO
                lineCount = lineCount + 1
                textArray(lineCount) = textLine
            LOOP
            
        CASE "2"
            CLS
            PRINT "== ABRIR ARCHIVO =="
            INPUT "Ingrese el nombre del archivo: "; fileName
            OPEN fileName FOR INPUT AS #1
            lineCount = 0
            WHILE NOT EOF(1)
                lineCount = lineCount + 1
                LINE INPUT #1, textArray(lineCount)
            WEND
            CLOSE #1
            PRINT "Archivo cargado correctamente."
            INPUT "Presione ENTER para continuar."; choice
            
        CASE "3"
            CLS
            IF lineCount = 0 THEN
                PRINT "No hay texto para editar. Abra un archivo primero."
                INPUT "Presione ENTER para continuar."; choice
            ELSE
                PRINT "== EDITAR TEXTO =="
                FOR i = 1 TO lineCount
                    PRINT i; ": "; textArray(i)
                NEXT i
                DO
                    INPUT "N�mero de l�nea a editar (0 para salir): "; editLine
                    IF editLine = 0 THEN EXIT DO
                    IF editLine > 0 AND editLine <= lineCount THEN
                        PRINT "L�nea Actual: "; textArray(editLine)
                        INPUT "Nueva l�nea: "; textArray(editLine)
                    ELSE
                        PRINT "N�mero de l�nea inv�lido. Intente nuevamente."
                    END IF
                LOOP
            END IF
            
        CASE "4"
            CLS
            PRINT "== GUARDAR ARCHIVO =="
            INPUT "Ingrese el nombre del archivo: "; fileName
            OPEN fileName FOR OUTPUT AS #1
            FOR i = 1 TO lineCount
                PRINT #1, textArray(i)
            NEXT i
            CLOSE #1
            PRINT "Archivo guardado correctamente."
            INPUT "Presione ENTER para continuar."; choice
            
        CASE "5"
            PRINT "Saliendo del editor..."
            EXIT DO
            
        CASE ELSE
            PRINT "Opci�n inv�lida. Intente de nuevo."
            INPUT "Presione ENTER para continuar."; choice
    END SELECT
LOOP

END
