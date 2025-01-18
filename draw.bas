'
'  © JM. :: Hecho en Ronda
'
'
'  Procedente de...        es.geocities.com/jm00092
'
'______________________________________________________________________
'                                        APLICACION DE DIBUJO VECTORIAL
SCREEN 12
COLOR 15
CLS
LINE (10, 10)-(350, 470), 15, BF
LINE (40, 40)-(600, 310), 14, BF
LINE (80, 80)-(260, 400), 2, BF
LINE (320, 80)-(430, 270), 12, BF
LINE (460, 80)-(580, 270), 9, BF
LOCATE 22, 46: PRINT "PROGRAMA PARA DIBUJAR"
LOCATE 24, 46: PRINT " IMITACION A LO BESTIA DEL"
LOCATE 25, 46: PRINT "AUTOCAD RELEASE 10 PARA MS-DOS"
COLOR 14
LOCATE 28, 46: PRINT "Pulse cualquier tecla --->"

DO
LOOP WHILE INKEY$ = ""

'DIBUJA LA PANTALLA DEL PROGRAMA

PAINT (12, 8), 1
COLOR 15
LOCATE 1, 25: PRINT "PROGRAMA PARA DIBUJAR"
LINE (10, 20)-(565, 410), 15, BF
LOCATE 3, 72: PRINT "    1  "
LOCATE 4, 72: PRINT " LINEA "
LOCATE 6, 72: PRINT "    2  "
LOCATE 7, 72: PRINT "CIRCULO"
LOCATE 9, 72: PRINT "    3  "
LOCATE 10, 72: PRINT " CUADRO"
LOCATE 11, 72: PRINT " VACIO "
LOCATE 13, 72: PRINT "    4  "
LOCATE 14, 72: PRINT " CUADRO"
LOCATE 15, 72: PRINT " LLENO "
LOCATE 17, 72: PRINT "    5  "
LOCATE 18, 72: PRINT "RELLENO"
LOCATE 21, 72: PRINT "    0   "
LOCATE 22, 72: PRINT "  SALIR "
COLOR 14
LOCATE 1, 1: PRINT "(10,20)"
LOCATE 1, 68: PRINT "(20,565)"
LOCATE 27, 1: PRINT "(10,410)"
LOCATE 27, 68: PRINT "(410,565)"
COLOR 15


DO

   LOCATE 28, 5: INPUT "ORDEN: ", O%
   SELECT CASE O%
     
      CASE 1
      LOCATE 28, 5: INPUT "LINEA DESDE: X=", DX%
      LOCATE 28, 24: INPUT "Y=", DY%
      LOCATE 28, 30: INPUT " HASTA: X=", HX%
      LOCATE 28, 44: INPUT "Y=", HY%
      LOCATE 28, 50: INPUT " COLOR (0 AL 15):", C%
      LINE (DX%, DY%)-(HX%, HY%), C%
      LOCATE 28, 5: PRINT "                                                                      "
      
      CASE 2
      LOCATE 28, 5: INPUT "CIRCULO CENTRO: X=", DX%
      LOCATE 28, 28: INPUT "Y=", DY%
      LOCATE 28, 35: INPUT " RADIO=", HX%
      LOCATE 28, 48: INPUT " COLOR (0 AL 15):", C%
      CIRCLE (DX%, DY%), HX%, C%
      LOCATE 28, 5: PRINT "                                                               "
     
      CASE 3
      LOCATE 28, 5: INPUT "CUADOR VACIO:ÚÄ: X=", DX%
      LOCATE 28, 28: INPUT "Y=", DY%
      LOCATE 28, 35: INPUT "ÄÙ: X=", HX%
      LOCATE 28, 45: INPUT "Y=", HY%
      LOCATE 28, 54: INPUT " COLOR (0 AL 15):", C%
      LINE (DX%, DY%)-(HX%, HY%), C%, B
      LOCATE 28, 5: PRINT "                                                                      "
     
      CASE 4
      LOCATE 28, 5: INPUT "CUADOR LLENO:ÚÄ: X=", DX%
      LOCATE 28, 28: INPUT "Y=", DY%
      LOCATE 28, 35: INPUT "ÄÙ: X=", HX%
      LOCATE 28, 45: INPUT "Y=", HY%
      LOCATE 28, 54: INPUT " COLOR (0 AL 15):", C%
      LINE (DX%, DY%)-(HX%, HY%), C%, BF
      LOCATE 28, 5: PRINT "                                                                      "
     
      CASE 5
      LOCATE 28, 5: INPUT "RELLENO: LUGAR: X=", DX%
      LOCATE 28, 28: INPUT "Y=", DY%
      LOCATE 28, 35: INPUT "COLOR (0 AL 15):", HY%
      LOCATE 28, 57: INPUT "COLOR LÖMITE :", C%
      PAINT (DX%, DY%), HY%, C%
      LOCATE 28, 5: PRINT "                                                                   "

   END SELECT

LOOP UNTIL O% = 0

