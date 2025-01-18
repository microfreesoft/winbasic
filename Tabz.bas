' Hoja de c�lculo simple sin uso de DIM

' Variables
cell$ = ""
formula$ = ""
value$ = ""
filename$ = ""
option$ = ""

' Bucle principal
DO
    CLS
    PRINT "Hoja de C�lculo Simple"
    PRINT "======================="
    
    PRINT "Ingrese la celda a modificar (ejemplo: A1, B2):"
    INPUT cell$
    
    PRINT "Ingrese el valor para "; cell$
    INPUT value$
    
    PRINT "Valor ingresado para "; cell$; ": "; value$
    
    ' Ingresar f�rmula
    PRINT "Ingrese la f�rmula (ejemplo: =A1+B1):"
    INPUT formula$
    
    ' Simulaci�n de f�rmula simple
    IF LEFT$(formula$, 1) = "=" THEN
        formula$ = MID$(formula$, 2) ' Eliminar "=" de la f�rmula
        IF formula$ = "A1+B1" THEN
            result$ = "Resultado: " + value$
        ELSE
            result$ = "F�rmula no reconocida."
        END IF
    ELSE
        result$ = "No es una f�rmula v�lida."
    END IF
    
    PRINT result$
    
    PRINT "--------------------------"
    PRINT "Operaciones disponibles:"
    PRINT "1. Mostrar tabla"
    PRINT "2. Guardar archivo"
    PRINT "3. Cargar archivo"
    PRINT "4. Salir"
    
    INPUT "Selecciona una opci�n (1-4): ", option$
    
    SELECT CASE option$
        CASE "1"
            ' Mostrar tabla simple (solo muestra una celda como ejemplo)
            PRINT "Tabla de celdas:"
            PRINT "Celda "; cell$; ": "; value$
            
        CASE "2"
            ' Guardar datos en archivo
            PRINT "Ingrese el nombre del archivo para guardar:"
            INPUT filename$
            OPEN filename$ FOR OUTPUT AS #1
            PRINT #1, "Celda: "; cell$
            PRINT #1, "Valor: "; value$
            PRINT #1, "F�rmula: "; formula$
            CLOSE #1
            PRINT "Datos guardados en "; filename$
            
        CASE "3"
            ' Cargar datos desde archivo
            PRINT "Ingrese el nombre del archivo para cargar:"
            INPUT filename$
            OPEN filename$ FOR INPUT AS #1
            LINE INPUT #1, cell$
            LINE INPUT #1, value$
            LINE INPUT #1, formula$
            CLOSE #1
            PRINT "Datos cargados desde "; filename$
            PRINT "Celda: "; cell$
            PRINT "Valor: "; value$
            PRINT "F�rmula: "; formula$
            
        CASE "4"
            ' Salir
            PRINT "Saliendo..."
            END
            
        CASE ELSE
            PRINT "Opci�n no v�lida."
    END SELECT
    
    PRINT "�Desea hacer otra operaci�n? (S/N): "
    INPUT option$
LOOP UNTIL UCASE$(option$) = "N"

END
