' Hoja de cálculo simple sin uso de DIM

' Variables
cell$ = ""
formula$ = ""
value$ = ""
filename$ = ""
option$ = ""

' Bucle principal
DO
    CLS
    PRINT "Hoja de Cálculo Simple"
    PRINT "======================="
    
    PRINT "Ingrese la celda a modificar (ejemplo: A1, B2):"
    INPUT cell$
    
    PRINT "Ingrese el valor para "; cell$
    INPUT value$
    
    PRINT "Valor ingresado para "; cell$; ": "; value$
    
    ' Ingresar fórmula
    PRINT "Ingrese la fórmula (ejemplo: =A1+B1):"
    INPUT formula$
    
    ' Simulación de fórmula simple
    IF LEFT$(formula$, 1) = "=" THEN
        formula$ = MID$(formula$, 2) ' Eliminar "=" de la fórmula
        IF formula$ = "A1+B1" THEN
            result$ = "Resultado: " + value$
        ELSE
            result$ = "Fórmula no reconocida."
        END IF
    ELSE
        result$ = "No es una fórmula válida."
    END IF
    
    PRINT result$
    
    PRINT "--------------------------"
    PRINT "Operaciones disponibles:"
    PRINT "1. Mostrar tabla"
    PRINT "2. Guardar archivo"
    PRINT "3. Cargar archivo"
    PRINT "4. Salir"
    
    INPUT "Selecciona una opción (1-4): ", option$
    
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
            PRINT #1, "Fórmula: "; formula$
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
            PRINT "Fórmula: "; formula$
            
        CASE "4"
            ' Salir
            PRINT "Saliendo..."
            END
            
        CASE ELSE
            PRINT "Opción no válida."
    END SELECT
    
    PRINT "¿Desea hacer otra operación? (S/N): "
    INPUT option$
LOOP UNTIL UCASE$(option$) = "N"

END
