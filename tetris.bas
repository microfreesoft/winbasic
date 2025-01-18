'                                                        …ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕª
'  …Õª …Õª …Õª …Õª     …Õª …Õª …Õª …Õª …Õª …Õª     …Õª   ∫  H  E  C  H  O  ∫
'  »Õº »Õº »Õº »Õº     »Õº »Õº »Õº »Õº »Õº »Õº     »Õº   ∫      E   N      ∫
'      …Õª                 …Õª                     …Õª   ∫  R  O  N  D  A  ∫   ∫
'      »Õº                 »Õº                     »Õº   »ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº
'      …Õª     …Õª …Õª     …Õª     …Õª …Õª …Õª     …Õª     …Õª …Õª …Õª
'      »Õº     »Õº »Õº     »Õº     »Õº »Õº »Õº     »Õº     »Õº »Õº »Õº
'      …Õª     …Õª         …Õª     …Õª     …Õª     …Õª     …Õª
'      »Õº     »Õº         »Õº     »Õº     »Õº     »Õº     »Õº
'      …Õª     …Õª …Õª     …Õª     …Õª …Õª …Õª     …Õª     …Õª …Õª …Õª
'      »Õº     »Õº »Õº     »Õº     »Õº »Õº »Õº     »Õº     »Õº »Õº »Õº
'              …Õª                 …Õª …Õª                         …Õª
'              »Õº                 »Õº »Õº                         »Õº
'              …Õª …Õª …Õª …Õª     …Õª     …Õª     …Õª …Õª …Õª …Õª …Õª
'              »Õº »Õº »Õº »Õº     »Õº     »Õº     »Õº »Õº »Õº »Õº »Õº
'
'                           es.geocities.com/jm00092
'
'
'
'
DECLARE SUB subebase (vvv!)
DECLARE SUB cambiaropciones (n!, p!)
DECLARE SUB tipos (C!)
DECLARE SUB cuadrorelieve (h1!, v1!, h2!, v2!, co!, cc!, cm!)
DECLARE SUB dibujapaleta ()
DECLARE SUB opciones ()
DECLARE SUB acerca ()
DECLARE SUB entrada ()
DECLARE SUB tetris ()
DECLARE SUB menuinicio (t!)
DECLARE SUB borraconcuadros (m!)
DECLARE SUB letras (X!, Y!, TEXT$, escl!, clrs!, ang!, ancho!, relleno!)
DECLARE SUB letrarelieve (h!, v!, TEXT$, e!, c1!, c2!, c3!)
DECLARE SUB inicializa ()
DECLARE SUB pantalla ()
DECLARE SUB salida ()
DECLARE SUB niveles (p!)
DECLARE SUB pausa ()
DECLARE SUB gameover ()
DECLARE SUB buscalineas ()
DECLARE SUB posible (h!, v!, CADENA$)
DECLARE SUB piezas (n!, g!)
DECLARE SUB bot (h!, v!)
DECLARE SUB borra (h!, v!, CADENA$)
DECLARE SUB pieza (h!, v!, CADENA$)
DECLARE SUB boton (h!, v!, l!, a!, sol!, sombra!, cara!, borde!)
DECLARE SUB ayuda ()
DECLARE SUB tuberias (h!, v!, D$, l!, D!, cl!)
DECLARE FUNCTION seleccionanumero! ()
DECLARE FUNCTION seleccionacolor! ()
DIM SHARED zonadejuego(1 TO 5000)
DIM SHARED marcadores(1 TO 3000)
DIM SHARED opcionales(1 TO 10)
RANDOMIZE TIMER
inicializa
entrada
'FOR h = 0 TO 300 STEP 47
'FOR V = 0 TO 150 STEP 50
'PIEZAS ((h / 47) + 1), ((V / 50) + 1)
'PIEZA h, V, CADENA$
'NEXT
'NEXT
'END
empezar:
CLEAR
PEN ON: ON PEN GOSUB salidarapida
TIMER OFF
FOR a = 2 TO 6
cambiaropciones a, 0
NEXT
opcionales(7) = 25
opcionales(9) = 32
menuinicio 0
pantalla
TIMER ON: ON TIMER(1) GOSUB HORA
inicio = TIMER

nnn = INT(RND * 7) + 1
IF nnn = 8 THEN : nnn = 7
piezas nnn, 1
niveles 0
DO
col = 80
lin = 10
acol = 80
alin = 10

nnn = INT(RND * 7) + 1
IF nnn = 8 THEN : nn = 7
piezas nn, 1
posible 80, 10, CADENA$
IF posibilidad = 0 THEN : gameover: GOSUB empezar
pieza col, lin, CADENA$
LINE (230, 80)-(290, 100), 0, BF
piezas nnn, 1
IF opcionales(4) THEN : pieza 230, 80, CADENA$
piezas nn, 1
nn = nnn
g = 1
DO
tecla:
Kbd$ = ""
ti = 0
DO
Kbd$ = INKEY$
LOOP WHILE Kbd$ = "" XOR ti = 1
IF Kbd$ = "" THEN : Kbd$ = CHR$(0) + "P"
borra col, lin, CADENA$
SELECT CASE UCASE$(Kbd$)
CASE IS = "S"
cambiaropciones 6, 2
CASE IS = "P"
pausa
'ARRIBA
CASE CHR$(0) + "H"
acad$ = CADENA$
ALARGO = LARGO
AALTO = ALTO
g = g + 1:
IF g > 4 THEN : g = 1
piezas na, g
posible col, lin, CADENA$
IF posibilidad = 1 THEN : :  ELSE : CADENA$ = acad$: g = g - 1: ALTO = AALTO: LARGO = ALARGO
LARGO = LARGO
ALTO = ALTO
'ABAJO
CASE CHR$(0) + "P": lin = lin + 10
'IZQUIERDA
CASE CHR$(0) + "K": col = col - 10
'DERECHA
CASE CHR$(0) + "M": col = col + 10
END SELECT
IF lin < 10 THEN : lin = 10
IF col < 50 THEN : col = 50
IF col > 140 - LARGO THEN : col = 140 - LARGO
borra acol, alin, CADENA$
posibilidad = 1
posible col, lin, CADENA$
baja = 0
IF lin = alin THEN : :  ELSE : baja = 1
IF posibilidad = 1 THEN :  ELSE col = acol: lin = alin
pieza col, lin, CADENA$
acol = col
alin = lin
LOOP UNTIL Kbd$ = CHR$(27) XOR (baja - posibilidad) = 1
IF Kbd$ = CHR$(27) THEN : gameover: GOSUB empezar
TIMER OFF
FOR a = 500 TO 1500 STEP 10
IF opcionales(6) THEN : SOUND 2000 - a, .06
NEXT
TIMER ON
baja = 0
buscalineas
col = 80
lin = 10
acol = 80
alin = 10
LOOP UNTIL Kbd$ = CHR$(27)
GOSUB empezar
HORA:
psh = POINT(0)
psv = POINT(1)
ti = 1
SELECT CASE C
CASE 0: C = 1: IF opcionales(6) THEN : SOUND 800, .6
CASE 1: C = 0: IF opcionales(6) THEN : SOUND 950, .6
END SELECT
WHILE INKEY$ <> "": WEND
difer = INT(TIMER - inicio)
minutos = INT(difer / 60)
segundos = difer MOD 60
IF opcionales(5) OR opcionales(3) THEN : LINE (273, 142)-(305, 154), 7, BF
IF opcionales(5) THEN : letras 271, 146, TIME$, 4, 32, 0, 1, 1
IF opcionales(3) THEN : letras 267, 152, STR$(minutos) + ":" + (MID$(STR$(segundos), LEN(segundos) - 2, 2)), 4, 40, 0, 1, 1
cpshpsv = POINT(psh, psv)
PSET (psh, psv), cpshpsv
RETURN
salidarapida:
COLOR 45
BEEP
END

'
' Presemta la pantalla de informaci¢n "Acerca de ..."
'
'
'
SUB acerca
borraconcuadros 1
letrarelieve 37, 120, "hecho en ronda, ciudad so§ada", 8, 215, 195, 205
letrarelieve 31, 140, "programado entero con q-basic", 8, 26, 30, 28
letrarelieve 22, 160, "versi¢n 2.0  J.M.G.B. Octubre 1996", 8, 2, 44, 48
letrarelieve 4, 180, "necesario pc r pido y vga 256 colores", 8, 41, 43, 42


WHILE INKEY$ <> "": WEND
DO: LOOP WHILE INKEY$ = ""

borraconcuadros 1
END SUB

'
'  Presenta la pantalla de ayuda
'
'
SUB ayuda


borraconcuadros 0
FOR p = 0 TO 63
LINE (p, 0)-(p + 199, 199), 255 - p
LINE (126 - p, 0)-(325 - p, 199), 255 - p
NEXT
letrarelieve 34, 14, "ayuda", 12, 2, 44, 48

     letrarelieve -5, 30, "tetris es un juego de rompecabezas", 8, 27, 31, 29
      letrarelieve -5, 44, "cuyo objetivo es completar l°neas", 8, 26, 30, 28
       letrarelieve -5, 58, "horizontales en el  rea de juego", 8, 25, 29, 27
    letrarelieve -5, 72, "combinando de la forma mas compacta", 8, 24, 28, 26
   letrarelieve -5, 86, "posible los m¢dulos que se proponen.", 8, 23, 27, 25
  letrarelieve -5, 100, "el juego termina cuando no hay sitio", 8, 22, 26, 24
    letrarelieve -5, 114, "para que aparezca un nuevo m¢dulo.", 8, 21, 25, 23
 letrarelieve -5, 128, "para mover los m¢dulos usa las flechas", 8, 20, 24, 22
letrarelieve -5, 142, "izquierda, derecha y abajo. para girar", 8, 19, 23, 21
letrarelieve -5, 156, "usa la flecha arriba. todas las teclas", 8, 18, 22, 20
  letrarelieve -5, 170, "disponibles en cada momento aparecen", 8, 17, 21, 19
             letrarelieve -5, 184, "dibujadas en la pantalla.", 8, 16, 20, 18


boton 210, 180, 100, 15, 15, 8, 7, 0
letras 215, 188, "pulsa cualquier tecla", 4, 0, 0, 1, 1

WHILE INKEY$ <> "": WEND
DO: LOOP WHILE INKEY$ = ""

borraconcuadros 0


END SUB

'
' Borra un m¢dulo indicado por cadena$ y situado en h,v
'
'
SUB borra (h, v, CADENA$) STATIC

IF MID$(CADENA$, 1, 1) = "1" THEN : bot h, v
IF MID$(CADENA$, 2, 1) = "1" THEN : bot h + 10, v
IF MID$(CADENA$, 3, 1) = "1" THEN : bot h + 20, v
IF MID$(CADENA$, 4, 1) = "1" THEN : bot h + 30, v
IF MID$(CADENA$, 5, 1) = "1" THEN : bot h, v + 10
IF MID$(CADENA$, 6, 1) = "1" THEN : bot h + 10, v + 10
IF MID$(CADENA$, 7, 1) = "1" THEN : bot h + 20, v + 10
IF MID$(CADENA$, 8, 1) = "1" THEN : bot h + 30, v + 10
IF MID$(CADENA$, 9, 1) = "1" THEN : bot h, v + 20
IF MID$(CADENA$, 10, 1) = "1" THEN : bot h + 10, v + 20
IF MID$(CADENA$, 11, 1) = "1" THEN : bot h + 20, v + 20
IF MID$(CADENA$, 12, 1) = "1" THEN : bot h + 30, v + 20
IF MID$(CADENA$, 13, 1) = "1" THEN : bot h, v + 30
IF MID$(CADENA$, 14, 1) = "1" THEN : bot h + 10, v + 30
IF MID$(CADENA$, 15, 1) = "1" THEN : bot h + 20, v + 30
IF MID$(CADENA$, 16, 1) = "1" THEN : bot h + 30, v + 30




END SUB

'
' Borra la pantalla entera (0) o la mitad inferior (1)
' con cuadros negros en salida aleatoria
'
'
SUB borraconcuadros (m)
SELECT CASE m
CASE 0
FOR a = 1 TO 3000

h = INT(RND * 32) * 10

v = INT(RND * 20) * 10
LINE (h, v)-STEP(9, 9), 0, BF
NEXT
CLS


CASE ELSE
FOR a = 1 TO 1100

h = INT(RND * 32) * 10

v = (INT(RND * 9) * 10) + 110
LINE (h, v)-STEP(9, 9), 0, BF
NEXT

LINE (0, 110)-(320, 200), 0, BF
         END SELECT
END SUB

'
' Dibuja una l°nea negra 10x10 en h,v para borrar un bot¢n.
'
SUB bot (h, v) STATIC
LINE (h, v)-(h + 10, v + 10), 0, BF

END SUB

'
' Dibuja un bot¢n en h,v con dimensiones l,a y colores pedidos...
'
'
'
SUB boton (h, v, l, a, sol, sombra, cara, borde)

IF opcionales(9) = 0 AND l = 10 AND a = 10 AND sol = 15 AND sombra = 8 AND cara = 7 AND borde = 0 THEN

sol = INT(RND * 15) + 32
cara = sol + 72
sombra = sol + 144
END IF


LINE (h, v)-STEP(l, a), borde, B
LINE (h + 1, v + 1)-STEP(l - 2, a - 2), sol, B
LINE (h + 2, v + 2)-STEP(l - 3, a - 3), sombra, B
IF cara < 255 THEN LINE (h + 2, v + 2)-STEP(l - 4, a - 4), cara, BF

END SUB

'
' Busca una linea horizontal completa
'  Si la encuentra la borra y hace caer todas las piezas
'  que estÇn m s arriba y aumenta una linea en el marcador
'
'
SUB buscalineas

SHARED PUNTOS

FOR v = 20 TO 190 STEP 10
     prueba = 0
          FOR h = 50 TO 130 STEP 10
          IF POINT(h + 5, 200 - v + 5) > 0 THEN : prueba = prueba + 1
     NEXT
    
     IF prueba = 9 AND POINT(50, 200 - v + 5) <> 40 THEN
     TIMER OFF

          PUNTOS = PUNTOS + 1
               
               FOR hh = 50 TO 130 STEP 10
                   IF opcionales(6) THEN : SOUND hh * 3, .7:  ELSE : FOR delay = 1 TO 900: NEXT
                    LINE (hh, 200 - v)-STEP(10, 10), 0, BF
               NEXT
              
               FOR vv = v TO 190 STEP 10
                    FOR hh = 50 TO 130 STEP 10
                         IF POINT(hh + 5, 200 - vv + 5) > 0 THEN
                              bot hh, 200 - vv
                              boton hh, 200 - vv + 10, 10, 10, 15, 8, 7, 0
                              IF opcionales(6) THEN : SOUND hh * 15, .8:    ELSE : FOR delay = 1 TO 1000: NEXT
                         END IF
                    NEXT
               NEXT
          v = v - 10
SELECT CASE PUNTOS
CASE 0 TO 9: pp = 240
CASE 10 TO 99: pp = 236
CASE IS > 100: pp = 232
END SELECT

LINE (257, 112)-(303, 130), 0, BF
letrarelieve pp, 127, STR$(PUNTOS), 16, 215, 195, 205

             niveles PUNTOS
     END IF
NEXT


     
WHILE INKEY$ <> "": WEND



'LINE (235, 175)-(245, 184), 0, BF
              TIMER ON
END SUB

'
'  Cambia los valores 1 al 7 de la matriz OPCIONALES
'  Presenta los "Visores de opciones activas" = VOAs
'
'         0.-No presentar VOAs
'    p {  1.-Presentar VOAs en pantalla de opciones
'         2.-En pantalla del juego
'
SUB cambiaropciones (n, p)




SELECT CASE opcionales(n)
CASE 0: opcionales(n) = 1
CASE 1: opcionales(n) = 0
END SELECT


SELECT CASE p
CASE 0
CASE 1

fun = 1
FOR v = 32 TO 110 STEP 15
fun = fun + 1

LINE (34, v + 1)-STEP(15, 11), 177, B
LINE (33, v)-STEP(15, 11), 107, BF
SELECT CASE opcionales(fun)
CASE 1: letras 33, v + 7, "si", 6, 46, 0, 2, 1
CASE 0: letras 30, v + 7, "no", 6, 40, 0, 2, 1
END SELECT
NEXT


CASE 2
LINE (202, 142)-(216, 154), 7, BF            'cambiaropciones

IF n = 6 AND opcionales(6) THEN : DRAW "s4bm203,154 c25 r12bu2l12bu2r12bu2l12bu2r12bu2l12bu2r12  bm206,153 c40 feu4ne4u2e4d7gh"


END SELECT

END SUB

'
' Dibuja un rect ngulo hueco con relieve entre h1,v1 y h2,v2
'
'
' cc=color claro arriba a la izquierda
' co=color oscuro abajo a al derecha
' cm=color medio al frente
'
SUB cuadrorelieve (h1, v1, h2, v2, co, cc, cm)

LINE (h1, v1)-(h2 - 2, v2 - 2), cc, B
LINE (h1, v1)-(h2, v2), cc, B
LINE (h1 + 2, v1 + 2)-(h2, v2), co, B
LINE (h1 + 1, v1 + 1)-(h2 - 1, v2 - 1), cm, B
PSET (h1 + 1, v2), co
PSET (h2, v1 + 1), co

END SUB

'
' Dibuja la paleta de colores de la pantalla opciones
'
'
SUB dibujapaleta

letras 110, 145, "felchas y enter", 4, 45, 0, 1, 1
letras 110, 152, "negro = aleatorio", 4, 45, 0, 1, 1

h = 55
v = 160
FOR n = 32 TO 103
h = h + 5
IF h > 175 THEN : h = 60: v = v + 8
LINE (h, v)-STEP(3, 6), n, BF
NEXT

h = 55
FOR n = 19 TO 31 STEP 2
h = h + 5
LINE (h, 184)-STEP(3, 6), n, BF
NEXT
h = 90
FOR n = 200 TO 230 STEP 2
h = h + 5
LINE (h, 184)-STEP(3, 6), n, BF
NEXT

END SUB

'
' Dibuja el repertorio de piezas de la pantalla opciones
'
'
SUB dibujapiezas

END SUB

'
' Dibuja la pantalla de entrada
'
'
SUB entrada

CLS
tetris
letrarelieve 35, 140, "hecho en ronda", 16, 215, 195, 205
letrarelieve 80, 170, "bienvenido", 16, 28, 30, 29
SLEEP 2
borraconcuadros 1


END SUB

'
' Sin uso
'
SUB flecha (h, v, D$, l, C)
SELECT CASE LCASE$(D$)
CASE "a": PSET (h, v), C: DRAW "c" + STR$(C) + "u" + STR$(l) + "dlr2drl4dlr6"
CASE "b": PSET (h, v), C: DRAW "c" + STR$(C) + "d" + STR$(l) + "ulr2url4ulr6"
CASE "i": PSET (h, v), C: DRAW "c" + STR$(C) + "l" + STR$(l) + "rnundrnu2nd2rnu3nd3"
CASE "d": PSET (h, v), C: DRAW "c" + STR$(C) + "r" + STR$(l) + "lnundlnu2nd2lnu3nd3"
END SELECT

END SUB

'
' Dibuja la pantalla de juego terminado o abandono
'
'
SUB gameover

SHARED PUNTOS

TIMER OFF


IF opcionales(6) THEN
FOR a = 1 TO 5
SOUND 1200, 2
SOUND 1000, 1
NEXT
END IF
borraconcuadros 0

FOR n = 0 TO 63
LINE (10 + n, 10 + n)-(304 - n, 189 - n), n + 192, B
NEXT

letrarelieve -10, 70, "juego terminado", 20, 215, 195, 205
letrarelieve 3, 160, "pulsa cualquier tecla para ir al men£", 8, 24, 28, 26

letrarelieve 10, 110, "l°neas conseguidas", 8, 107, 32, 1
letrarelieve 120, 130, STR$(PUNTOS), 32, 2, 44, 48


WHILE INKEY$ <> "": WEND
DO
LOOP WHILE INKEY$ = ""
borraconcuadros 0
tetris
END SUB

'
' Sit£a la gradaci¢n de rojos en valores de color anteriores a 255
'
'
SUB inicializa
SCREEN 13

cuadrorelieve 7, 7, 140, 53, 27, 31, 29
cuadrorelieve 7, 57, 140, 68, 27, 31, 29

letrarelieve 0, 85, "creando colores...", 12, 26, 30, 28
        
h = 220
v = 40
cf = POINT(h, v)
LINE (h, v)-STEP(45, 21), 255, B
LINE (h + 2, v + 2)-STEP(41, 6), 255, BF
letras h + 4, v + 6, "HECHO EN", 4, cf, 0, 1, 1
letras h - 3, v + 17, "RONDA", 8, 255, 0, 2, 1
C = 32
FOR hh = h TO h + 45
C = C + .4
FOR vv = v TO v + 21
IF POINT(hh, vv) = 255 THEN PSET (hh, vv), C
NEXT
NEXT

FOR p = 0 TO 63
PALETTE 255 - p, p
LINE ((p * 2) + 10, 10)-((p * 2) + 11, 50), 255 - p, B
LINE ((p * 2) + 10, 60)-((p * 2) + 11, 65), 32, B
 FOR ppp = 1 TO 1000: NEXT
NEXT

CLS
END SUB

'
' Crea las letras con relieve llamando ordenadamente a la sub letras
'
'
SUB letrarelieve (h, v, TEXT$, e, c1, c2, c3)

letras h, v, TEXT$, e, c1, 0, 3, 1
letras h, v, TEXT$, e, c2, 0, 2, 1
letras h + 1, v + 1, TEXT$, e, c3, 0, 1, 1

END SUB

'
' Sub letras repetida de otros programas
'
SUB letras (X, Y, TEXT$, escl, clrs, ang, ancho, relleno)
IF relleno < 1 THEN : relleno = 1
FOR h = 1 TO ancho STEP relleno
FOR v = 1 TO ancho STEP relleno
ccc = POINT(X + h, Y + v)
PSET (X + h, Y + v), ccc
C$ = STR$(clrs): e$ = STR$(escl): a$ = STR$(ang)
FOR a = 1 TO LEN(TEXT$)
IF clrs > 255 THEN C$ = STR$(INT(RND * 15) + 1)
DRAW "S" + e$ + "C" + C$ + "ta" + a$
SELECT CASE UCASE$(MID$(TEXT$, a, 1))
CASE "A": DRAW "br2 u2nnr2u2r2d4"
CASE "B": DRAW "br2 u4r2dgnlfdnl2"
CASE "C": DRAW "br2 bu4 nr2d4r2"
CASE "D": DRAW "br2 u4rfd2glbr2"
CASE "E": DRAW "br2 bu4 nr2d2nr2d2r2"
CASE "F": DRAW "br2 bu4 nr2d2nr2d2br2"
CASE "G": DRAW "br2 bu4 nr2d4r2unld"
CASE "H": DRAW "br2 u2nu2r2nu2d2"
CASE "I": DRAW "br2 nu4"
CASE "J": DRAW "br2 nur2nu4"
CASE "K": DRAW "br2 u2 nu2ne2f2"
CASE "L": DRAW "br2 nu4r2"
CASE "M": DRAW "br2 u4f2e2d4"
CASE "N": DRAW "br2 u4f4nu4"
CASE "§": DRAW "br2 u3f3u3bunl3bd4"
CASE "•": DRAW "br2 u3f3u3bunl3bd4"
CASE "O": DRAW "br2 bu4 nr2d4r2nu4"
CASE "P": DRAW "br2 u2nnr2u2r2d2bd2"
CASE "Q": DRAW "br2 bu4 nr2d4renu3blf"
CASE "R": DRAW "br2 u4r2d2l2f2"
CASE "S": DRAW "br2 r2u2l2u2r2BD4"
CASE "T": DRAW "br2 BU4r2nd4r2bd4"
CASE "U": DRAW "br2 nu4r2nu4"
CASE "V": DRAW "br2 bunu3fenu3bd"
CASE "W": DRAW "br2 bunu3fenu2fenu3bd"
CASE "X": DRAW "br2 br2bu2ne2nf2ng2nh2br2bd2"
CASE "Y": DRAW "br2 br2u2nh2ne2bd2br2"
CASE "Z": DRAW "br2 bu4 r4g2nlnrg2r4"
CASE "1": DRAW "br2 bu3ed4nlr"
CASE "2": DRAW "br2 bu4 r2d2l2d2r2"
CASE "3": DRAW "br2 bu4 r2d2nl2d2nl2" '"br2 bu4 r2fgnlfgnl2bl"
CASE "4": DRAW "br2 bu2 nu2r2nu2d2"
CASE "5": DRAW "br2 bu4 nr2d2r2d2nl2"
CASE "6": DRAW "br2 bu4 nr2d2nr2d2r2nu2"
CASE "7": DRAW "br2 bu4 r2d4"
CASE "8": DRAW "br2 u4r2d2nl2d2nl2"
CASE "9": DRAW "br2 bu2 nr2u2r2d4"
CASE "0": DRAW "br2 bu4 nr2d4r2nu4"
CASE "*": DRAW "br2 br2 u2nl2nu2nr2nengnhfbf "
CASE "+": DRAW "br2 br2 u2nl2nu2r2bd2"
CASE "-": DRAW "br2 bu2r2bd2"
CASE ".": DRAW "br2": PSET STEP(0, 0), clrs
CASE ",": DRAW "br2 ng"
CASE ";": DRAW "br2 ngbunuBD"
CASE ":": DRAW "br2": PSET STEP(0, 0), clrs: PSET STEP(0, -2), clrs: DRAW "bd2"
CASE "=": DRAW "br2 bunr2bu2r2bd3"
CASE "µ": DRAW "br2 unr2u2rbunebdrd3"
CASE "ê": DRAW "br2 bu3 rbunebdrl2d2nr2dr2"
CASE "÷": DRAW "br2 u3bunebd4"
CASE "‡": DRAW "br2 u3rbunebdrd3nl2"
CASE "È": DRAW "br2 u3brbunebdbrd3nl2"
CASE " ": DRAW "br2 unr2u2rbunebdrd3"
CASE "Ç": DRAW "br2 bu3 rbunebdrl2d2nr2dr2"
CASE "°": DRAW "br2 u3bunebd4"
CASE "¢": DRAW "br2 u3rbunebdrd3nl2"
CASE "£": DRAW "br2 u3brbunebdbrd3nl2"
CASE ELSE: DRAW "S" + e$ + "ta" + a$ + "BR4"
END SELECT
NEXT: NEXT: NEXT
DRAW "s4ta0"
END SUB

'
' Dibuja la pantalla del men£ principal y da acceso a las opciones
'
'
'
' t....si aparece o no el letreeo "TETRIS"
'
'
SUB menuinicio (t)


IF t = 1 THEN : CLS : tetris

boton 40, 120, 25, 20, 15, 8, 7, 0
letras 41, 133, "f1", 8, 0, 0, 2, 1
boton 130, 120, 55, 20, 15, 8, 7, 0
letras 130, 133, "enter", 8, 0, 0, 2, 1
boton 230, 120, 31, 20, 15, 8, 7, 0
letras 230, 133, "esc", 8, 0, 0, 2, 1
letrarelieve 15, 155, "ayuda", 12, 215, 195, 205
letrarelieve 120, 155, "jugar", 12, 2, 44, 48
letrarelieve 213, 155, "salir", 12, 107, 32, 1

boton 17, 177, 15, 12, 15, 8, 7, 0
letras 20, 184, "a", 4, 0, 0, 1, 1
letrarelieve 35, 185, "acerca de...", 8, 108, 13, 5

boton 142, 177, 15, 12, 15, 8, 7, 0
letras 145, 184, "o", 4, 0, 0, 1, 1
letrarelieve 160, 185, "opciones de juego", 8, 41, 43, 42

WHILE INKEY$ <> "": WEND
DO
Kbd$ = UCASE$(INKEY$)
LOOP UNTIL Kbd$ = CHR$(27) XOR Kbd$ = CHR$(13) XOR Kbd$ = CHR$(0) + ";" XOR Kbd$ = "A" XOR Kbd$ = "O"
SELECT CASE Kbd$
CASE CHR$(27): salida
CASE CHR$(13): borraconcuadros 0: EXIT SUB
CASE CHR$(0) + ";": ayuda: menuinicio 1
CASE "A": acerca: menuinicio 0
CASE "O": opciones: menuinicio 1
END SELECT




END SUB

'
' Calcula el nivel a partir de la puntuaci¢n y va reduciendo
' el tama§o de la pantalla y dibuja el letrero "NIVEL x"
'
'
'
SUB niveles (p) STATIC
SHARED n

ln = opcionales(7)


IF p / ln = INT(p / ln) THEN
TIMER OFF
n = p / ln

IF n > 0 THEN
IF opcionales(2) THEN : LINE (51, 10)-(140, (199 - (n * 10))), 0, BF
subebase (191 - (n * 10))
END IF

IF opcionales(6) THEN : SOUND 300, 2:  ELSE : FOR delay = 1 TO 1000: NEXT
letrarelieve 60, 20, "n", 8, 2, 44, 48
IF opcionales(6) THEN : SOUND 400, 2:  ELSE : FOR delay = 1 TO 1000: NEXT
letrarelieve 72, 20, "i", 8, 2, 44, 48
IF opcionales(6) THEN : SOUND 500, 2:  ELSE : FOR delay = 1 TO 1000: NEXT
letrarelieve 76, 20, "v", 8, 2, 44, 48
IF opcionales(6) THEN : SOUND 600, 2:  ELSE : FOR delay = 1 TO 1000: NEXT
letrarelieve 84, 20, "e", 8, 2, 44, 48
IF opcionales(6) THEN : SOUND 700, 2:  ELSE : FOR delay = 1 TO 1000: NEXT
letrarelieve 92, 20, "l", 8, 2, 44, 48
IF opcionales(6) THEN : SOUND 800, 2:  ELSE : FOR delay = 1 TO 1000: NEXT
letrarelieve 100, 20, STR$(n + 1), 8, 2, 44, 48
IF opcionales(6) THEN : SOUND 900, 2:  ELSE : FOR delay = 1 TO 1000: NEXT

IF opcionales(6) THEN : SOUND 900, 2:  ELSE : FOR delay = 1 TO 1000: NEXT
letrarelieve 60, 20, "n", 8, 0, 0, 0
IF opcionales(6) THEN : SOUND 800, 2:  ELSE : FOR delay = 1 TO 1000: NEXT
letrarelieve 72, 20, "i", 8, 0, 0, 0
IF opcionales(6) THEN : SOUND 700, 2:  ELSE : FOR delay = 1 TO 1000: NEXT
letrarelieve 76, 20, "v", 8, 0, 0, 0
IF opcionales(6) THEN : SOUND 600, 2:  ELSE : FOR delay = 1 TO 1000: NEXT
letrarelieve 84, 20, "e", 8, 0, 0, 0
IF opcionales(6) THEN : SOUND 500, 2:  ELSE : FOR delay = 1 TO 1000: NEXT
letrarelieve 92, 20, "l", 8, 0, 0, 0
IF opcionales(6) THEN : SOUND 400, 2:  ELSE : FOR delay = 1 TO 1000: NEXT
letrarelieve 100, 20, STR$(n + 1), 8, 0, 0, 0
IF opcionales(6) THEN : SOUND 300, 2:  ELSE : FOR delay = 1 TO 1000: NEXT

LINE (240, 142)-(251, 154), 7, BF
letras 229, 150, STR$(n + 1), 8, 45, 0, 2, 1

TIMER ON

END IF

END SUB

'
' Dibuja la pantalla de occiones y las cambiar 
'
'
SUB opciones
borraconcuadros 0
FOR p = 0 TO 63
LINE (63 - p, 0)-(63 - p, 199), (255 - p)
NEXT
letrarelieve 34, 14, "opciones", 12, 2, 44, 48

letras 145, 7, "elije las opciones y pulsa", 4, 15, 0, 1, 1
letras 145, 15, "escape cuando termines.....", 4, 15, 0, 1, 1

boton 270, 0, 31, 20, 15, 8, 7, 0
letras 270, 13, "esc", 8, 0, 0, 2, 1


letrarelieve 50, 40, "limpiar pantalla en nuevo nivel", 8, 19, 23, 21
   letrarelieve 50, 55, "mostrar cron¢metro del juego", 8, 21, 25, 23
       letrarelieve 50, 70, "mostrar siguiente m¢dulo", 8, 23, 27, 25
            letrarelieve 50, 85, "mostrar hora actual", 8, 25, 29, 27
            letrarelieve 50, 100, "sonido por defecto", 8, 27, 31, 29

letrarelieve 50, 115, "l°neas por nivel.........", 8, 108, 13, 5
cuadrorelieve 220, 80, 310, 120, 108, 13, 5   'numero
letrarelieve 50, 130, "elegir pieza..........", 8, 106, 32, 1
cuadrorelieve 188, 125, 310, 195, 106, 32, 1  'piezas
letrarelieve 50, 145, "color....", 8, 2, 44, 48
cuadrorelieve 55, 155, 184, 195, 2, 44, 48    'paleta




letrarelieve 226, 104, STR$(opcionales(7)), 16, 215, 195, 205

dibujapaleta
tipos opcionales(9)

fun = 1
FOR v = 32 TO 140 STEP 15
fun = fun + 1
boton 13, v, 14, 12, 15, 8, 7, 0
letras 14, v + 7, STR$(fun), 4, 0, 0, 1, 1
letras 14, v + 7, "f", 4, 0, 0, 1, 1

LINE (34, v + 1)-STEP(15, 11), 177, B
LINE (33, v)-STEP(15, 11), 107, BF
NEXT



FOR n = 2 TO 6
cambiaropciones n, 0
NEXT
FOR n = 2 TO 6
cambiaropciones n, 1
NEXT

letras 26, 114, STR$(opcionales(7)), 6, 76, 0, 2, 1
LINE (35, 139)-STEP(11, 7), opcionales(9), BF

WHILE INKEY$ <> "": WEND

DO
DO
Kbd$ = INKEY$
LOOP WHILE Kbd$ = ""
SELECT CASE Kbd$
CASE CHR$(0) + "<": cambiaropciones 2, 1              'F2=Limpiar
CASE CHR$(0) + "=": cambiaropciones 3, 1               'F3=Cron¢metro
CASE CHR$(0) + ">": cambiaropciones 4, 1               'F4=Siguiente
CASE CHR$(0) + "?": cambiaropciones 5, 1               'F5=Hora
CASE CHR$(0) + "@": cambiaropciones 6, 1               'F6=Sonido
CASE CHR$(0) + "A": opcionales(7) = seleccionanumero                'F7=Lineas
CASE CHR$(0) + "B": opcionales(9) = 1                'F8=Pieza
CASE CHR$(0) + "C": opcionales(9) = seleccionacolor  'F9=Color
CASE CHR$(27): EXIT DO
CASE ELSE: SOUND 900, 1
END SELECT
LOOP


END SUB

'
' Dibuja la pantalla del juego
'
'
SUB pantalla
CLS


FOR p = 0 TO 63
LINE (p - 14, 0)-(p - 14, 199), 255 - p
LINE (204 - p, 0)-(204 - p, 199), 255 - p
NEXT
LINE (50, 0)-(140, 9), 40, BF
LINE (50, 191)-(140, 195), 40, BF
tuberias 60, 196, "|", 0, 16, 25
tuberias 114, 196, "|", 0, 16, 25

tuberias 64, 197, "|", 1, 8, 27
tuberias 118, 197, "|", 1, 8, 27

tuberias 60, 199, "|", 0, 16, 25
tuberias 114, 199, "|", 0, 16, 25


FOR n = 0 TO 6
LINE (95, 8)-(95 + n, 2), 200 + (n * 3)
LINE (95, 8)-(95 - n, 2), 200 + (n * 3)
NEXT


letrarelieve 208, 20, "tetris", 12, 26, 30, 28
letrarelieve 190, 35, "hecho en ronda", 8, 215, 195, 205


IF opcionales(4) THEN : letrarelieve 213, 60, "siguiente:", 8, 107, 32, 1
letrarelieve 201, 123, "l°neas", 8, 2, 44, 47

  cuadrorelieve 200, 45, 307, 137, 25, 29, 27


letrarelieve 256, 127, "0", 16, 215, 195, 205



cuadrorelieve 238, 140, 268, 156, 25, 29, 7  'niveles
cuadrorelieve 200, 140, 235, 156, 25, 29, 7  'pantalla
cuadrorelieve 271, 140, 307, 156, 25, 29, 7  'pantalla


LINE (202, 142)-(233, 154), 7, BF
LINE (273, 142)-(305, 154), 7, BF
LINE (240, 142)-(266, 154), 7, BF


boton 202, 157, 12, 12, 15, 8, 7, 0
letras 204, 164, "S", 4, 0, 0, 1, 1
boton 222, 168, 18, 12, 15, 8, 7, 0
letras 223, 175, "ESC", 4, 0, 0, 1, 1
boton 204, 179, 12, 12, 15, 8, 7, 0
letras 206, 186, "P", 4, 0, 0, 1, 1
boton 260, 180, 15, 15, 15, 8, 7, 0
boton 275, 180, 15, 15, 15, 8, 7, 0
boton 290, 180, 15, 15, 15, 8, 7, 0
boton 275, 165, 15, 15, 15, 8, 7, 0
DRAW "s4bm282,185 c0 d5nh2e2l4 r2bu13u5ng2f2l4 bd16br15r5nh2g2u4d2 bl28l5ne2f2u4"'flechas


IF opcionales(5) THEN : letras 271, 146, TIME$, 4, 32, 0, 1, 1
IF opcionales(3) THEN : letras 271, 152, "0:0", 4, 40, 0, 1, 1

letras 237, 150, "0", 8, 45, 0, 2, 1
letras 244, 150, STR$(opcionales(7)), 6, 25, 0, 2, 1

IF opcionales(2) THEN : DRAW "s4 bm220,154 c25 r12bu2l12bu2r12bu2l12bu2r12bu2l12bu2r12 bm222,151 c32 nru4rbr2d4rbr2ru2lu2rbr2u2nl10d8l10"
IF opcionales(6) THEN : DRAW "s4 bm203,154 c25 r12bu2l12bu2r12bu2l12bu2r12bu2l12bu2r12  bm206,153 c40 feu4ne4u2e4d7gh"

END SUB

'
' Detiene el juego al pulsar la tecla "P"
'
'
SUB pausa
TIMER OFF

DO
FOR n = 1500 TO 2500 STEP 500
IF opcionales(6) THEN : SOUND n, 1.5:  ELSE : FOR a = 1 TO 3000: NEXT
NEXT
boton 204, 179, 12, 12, 8, 15, 260, 0
FOR n = 2500 TO 1500 STEP -500
IF opcionales(6) THEN : SOUND n, 1.5:  ELSE : FOR a = 1 TO 3000: NEXT
NEXT
boton 204, 179, 12, 12, 15, 8, 260, 0
LOOP UNTIL UCASE$(INKEY$) = "P"
WHILE INKEY$ <> "": WEND
TIMER ON
END SUB

'
' Dibuja una pueza a partir de los m¢dulos b sicos seg£n diga cadena$
'
'
SUB pieza (h, v, CADENA$) STATIC


IF MID$(CADENA$, 1, 1) = "1" THEN : boton h, v, 10, 10, 15, 8, 7, 0
IF MID$(CADENA$, 2, 1) = "1" THEN : boton h + 10, v, 10, 10, 15, 8, 7, 0
IF MID$(CADENA$, 3, 1) = "1" THEN : boton h + 20, v, 10, 10, 15, 8, 7, 0
IF MID$(CADENA$, 4, 1) = "1" THEN : boton h + 30, v, 10, 10, 15, 8, 7, 0
IF MID$(CADENA$, 5, 1) = "1" THEN : boton h, v + 10, 10, 10, 15, 8, 7, 0
IF MID$(CADENA$, 6, 1) = "1" THEN : boton h + 10, v + 10, 10, 10, 15, 8, 7, 0
IF MID$(CADENA$, 7, 1) = "1" THEN : boton h + 20, v + 10, 10, 10, 15, 8, 7, 0
IF MID$(CADENA$, 8, 1) = "1" THEN : boton h + 30, v + 10, 10, 10, 15, 8, 7, 0
IF MID$(CADENA$, 9, 1) = "1" THEN : boton h, v + 20, 10, 10, 15, 8, 7, 0
IF MID$(CADENA$, 10, 1) = "1" THEN : boton h + 10, v + 20, 10, 10, 15, 8, 7, 0
IF MID$(CADENA$, 11, 1) = "1" THEN : boton h + 20, v + 20, 10, 10, 15, 8, 7, 0
IF MID$(CADENA$, 12, 1) = "1" THEN : boton h + 30, v + 20, 10, 10, 15, 8, 7, 0
IF MID$(CADENA$, 13, 1) = "1" THEN : boton h, v + 30, 10, 10, 15, 8, 7, 0
IF MID$(CADENA$, 14, 1) = "1" THEN : boton h + 10, v + 30, 10, 10, 15, 8, 7, 0
IF MID$(CADENA$, 15, 1) = "1" THEN : boton h + 20, v + 30, 10, 10, 15, 8, 7, 0
IF MID$(CADENA$, 16, 1) = "1" THEN : boton h + 30, v + 30, 10, 10, 15, 8, 7, 0



END SUB

'
'
' Monta la variable cadena$ para cada pieza y cada orientaci¢n
'
'
'
SUB piezas (n, g) STATIC
SHARED CADENA$
 SHARED LARGO
 SHARED ALTO
 SHARED na
 

IF n = 0 THEN : n = INT(RND * 7) + 1

          IF n = 8 THEN : n = 7
SELECT CASE n
CASE 1
     CADENA$ = "110011"
CASE 2
     SELECT CASE g
          CASE 1: CADENA$ = "1111"
          CASE 2: CADENA$ = "1000100010001"
          CASE 3: CADENA$ = "1111"
          CASE 4: CADENA$ = "1000100010001"

     END SELECT
CASE 3
     SELECT CASE g
          CASE 1: CADENA$ = "111001"
          CASE 2: CADENA$ = "0100110001"
          CASE 3: CADENA$ = "0100111"
          CASE 4: CADENA$ = "100011001"
     END SELECT
CASE 4
     SELECT CASE g
          CASE 1: CADENA$ = "011011"
          CASE 2: CADENA$ = "1000110001"
          CASE 3: CADENA$ = "011011"
          CASE 4: CADENA$ = "1000110001"
     END SELECT
CASE 5
     SELECT CASE g
          CASE 1: CADENA$ = "1100011"
          CASE 2: CADENA$ = "010011001"
          CASE 3: CADENA$ = "1100011"
          CASE 4: CADENA$ = "010011001"
     END SELECT
CASE 6
     SELECT CASE g
          CASE 1: CADENA$ = "11101"
          CASE 2: CADENA$ = "1100010001"
          CASE 3: CADENA$ = "0010111"
          CASE 4: CADENA$ = "1000100011"
     END SELECT
CASE 7
     SELECT CASE g
          CASE 1: CADENA$ = "1110001"
          CASE 2: CADENA$ = "0100010011"
          CASE 3: CADENA$ = "1000111"
          CASE 4: CADENA$ = "110010001"
     END SELECT
CASE ELSE
     BEEP

END SELECT



LARGO = 0
IF MID$(CADENA$, 1, 1) = "1" OR MID$(CADENA$, 5, 1) = "1" OR MID$(CADENA$, 9, 1) = "1" OR MID$(CADENA$, 13, 1) = "1" THEN : LARGO = 10
IF MID$(CADENA$, 2, 1) = "1" OR MID$(CADENA$, 6, 1) = "1" OR MID$(CADENA$, 10, 1) = "1" OR MID$(CADENA$, 14, 1) = "1" THEN : LARGO = 20
IF MID$(CADENA$, 3, 1) = "1" OR MID$(CADENA$, 7, 1) = "1" OR MID$(CADENA$, 11, 1) = "1" OR MID$(CADENA$, 15, 1) = "1" THEN : LARGO = 30
IF MID$(CADENA$, 4, 1) = "1" OR MID$(CADENA$, 8, 1) = "1" OR MID$(CADENA$, 12, 1) = "1" OR MID$(CADENA$, 16, 1) = "1" THEN : LARGO = 40


ALTO = 0
IF MID$(CADENA$, 1, 1) = "1" OR MID$(CADENA$, 2, 1) = "1" OR MID$(CADENA$, 3, 1) = "1" OR MID$(CADENA$, 4, 1) = "1" THEN : ALTOO = 10
IF MID$(CADENA$, 5, 1) = "1" OR MID$(CADENA$, 6, 1) = "1" OR MID$(CADENA$, 7, 1) = "1" OR MID$(CADENA$, 8, 1) = "1" THEN : ALTO = 20
IF MID$(CADENA$, 9, 1) = "1" OR MID$(CADENA$, 10, 1) = "1" OR MID$(CADENA$, 11, 1) = "1" OR MID$(CADENA$, 12, 1) = "1" THEN : ALTO = 30
IF MID$(CADENA$, 13, 1) = "1" OR MID$(CADENA$, 14, 1) = "1" OR MID$(CADENA$, 15, 1) = "1" OR MID$(CADENA$, 16, 1) = "1" THEN : ALTO = 40

na = n
END SUB

'
'
' Comprueba si es posible o no colocar una pieza en un sitio
'  (si ya estaba cubierto o fuera de la pantalla de juego o ocupado)
'
'
SUB posible (h, v, CADENA$) STATIC
SHARED posibilidad
posibilidad = 1
posi = 0
h = h + 1
v = v + 1
'PSET (h + 2, v + 2), 14

IF MID$(CADENA$, 1, 1) = "1" THEN : posi = posi + POINT(h, v)
IF MID$(CADENA$, 2, 1) = "1" THEN : posi = posi + POINT(h + 10, v)
IF MID$(CADENA$, 3, 1) = "1" THEN : posi = posi + POINT(h + 20, v)
IF MID$(CADENA$, 4, 1) = "1" THEN : posi = posi + POINT(h + 30, v)
IF MID$(CADENA$, 5, 1) = "1" THEN : posi = posi + POINT(h, v + 10)
IF MID$(CADENA$, 6, 1) = "1" THEN : posi = posi + POINT(h + 10, v + 10)
IF MID$(CADENA$, 7, 1) = "1" THEN : posi = posi + POINT(h + 20, v + 10)
IF MID$(CADENA$, 8, 1) = "1" THEN : posi = posi + POINT(h + 30, v + 10)
IF MID$(CADENA$, 9, 1) = "1" THEN : posi = posi + POINT(h, v + 20)
IF MID$(CADENA$, 10, 1) = "1" THEN : posi = posi + POINT(h + 10, v + 20)
IF MID$(CADENA$, 11, 1) = "1" THEN : posi = posi + POINT(h + 20, v + 20)
IF MID$(CADENA$, 12, 1) = "1" THEN : posi = posi + POINT(h + 30, v + 20)
IF MID$(CADENA$, 13, 1) = "1" THEN : posi = posi + POINT(h, v + 30)
IF MID$(CADENA$, 14, 1) = "1" THEN : posi = posi + POINT(h + 10, v + 30)
IF MID$(CADENA$, 15, 1) = "1" THEN : posi = posi + POINT(h + 20, v + 30)
IF MID$(CADENA$, 16, 1) = "1" THEN : posi = posi + POINT(h + 30, v + 30)

h = h - 1
v = v - 1
'LOCATE 1, 35: PRINT posi / 7
IF posi = 0 THEN : posibilidad = 1:  ELSE : posibilidad = 0': IF sonido THEN :SOUND 600, 1

END SUB

'
'
' Dibuja la pantalla de salida del juego y sale a QBasic o a MS-DOS
'
'
SUB salida

borraconcuadros 1

letrarelieve 37, 115, "tetris - hecho en ronda", 8, 215, 195, 205
letrarelieve 32, 145, "gracias por jugar a este juego", 8, 26, 30, 28
letrarelieve 70, 170, "j.m.g.b. ronda 1996", 12, 2, 44, 48
COLOR 0

letrarelieve 0, 188, "pulsa cualquier tecla para volver al sistema operativo", 4, 0, 20, 27

SYSTEM

END


END SUB

'
'
' Selecciona un color de la paleta de colores en la pantalla opciones
'
'
FUNCTION seleccionacolor

h = 59
v = 159
LINE (h, v)-STEP(5, 8), 44, B
DO
WHILE INKEY$ <> "": WEND
DO
Kbd$ = INKEY$
LOOP WHILE Kbd$ = ""
LINE (h, v)-STEP(5, 8), 0, B
         
         
          SELECT CASE Kbd$
            
CASE CHR$(0) + "H": v = v - 8
CASE CHR$(0) + "P": v = v + 8
CASE CHR$(0) + "K": h = h - 5
CASE CHR$(0) + "M": h = h + 5
CASE CHR$(13): EXIT DO
CASE CHR$(27): EXIT DO

          END SELECT

IF h < 59 THEN : h = 59: SOUND 600, 1
IF h > 174 THEN : h = 174: SOUND 600, 1
IF v < 159 THEN : v = 159: SOUND 600, 1
IF v > 183 THEN : v = 183: SOUND 600, 1
tipos (POINT(h + 1, v + 1))

LINE (h, v)-STEP(5, 8), 44, B

LOOP



seleccionacolor = POINT(h + 1, v + 1)

LINE (35, 139)-STEP(11, 7), POINT(h + 1, v + 1), BF
END FUNCTION

'
'
'  Selecciona un n£mero de lineas por nivel para opciones
'
'
FUNCTION seleccionanumero
letras 226, 115, "10 a 50  enter=fin", 4, 13, 0, 1, 1
boton 235, 90, 13, 14, 15, 8, 7, 0
boton 280, 90, 13, 14, 15, 8, 7, 0
DRAW "bm239,97 c0s4 r5 br42 nu2nd2nl2nr2"
 
num = opcionales(7)

DO
DO
Kbd$ = INKEY$

LOOP WHILE Kbd$ = ""

SELECT CASE Kbd$
CASE "-": num = num - 1
CASE "+": num = num + 1
CASE CHR$(13): EXIT DO
CASE ELSE: SOUND 300, 2
END SELECT

IF num < 10 THEN : num = 10: SOUND 2000, 2
IF num > 50 THEN : num = 50: SOUND 2000, 2

LINE (250, 88)-(278, 108), 0, BF
letrarelieve 226, 104, STR$(num), 16, 215, 195, 205

LOOP

letras 226, 115, "10 a 50  enter=fin", 4, 0, 0, 1, 1
boton 235, 90, 13, 14, 0, 0, 0, 0
boton 280, 90, 13, 14, 0, 0, 0, 0

LINE (33, 107)-STEP(15, 11), 107, BF
letras 26, 114, STR$(num), 6, 76, 0, 2, 1

seleccionanumero = num
END FUNCTION

SUB subebase (vvv)

FOR vvvv = vvv + 10 TO vvv STEP -1
lt = 200 - vvvv - 10
LINE (50, vvvv)-(140, vvvv + 4), 40, BF
LINE (50, vvvv + 6)-(60, vvvv + 6), 0
LINE (76, vvvv + 6)-(115, vvvv + 6), 0
LINE (131, vvvv + 6)-(140, vvvv + 6), 0
LINE (50, vvvv + 7)-(64, vvvv + 7), 0
LINE (72, vvvv + 7)-(119, vvvv + 7), 0
LINE (127, vvvv + 7)-(140, vvvv + 7), 0
tuberias 60, vvvv + 6, "|", 0, 16, 25
tuberias 114, vvvv + 6, "|", 0, 16, 25
tuberias 64, vvvv + 7, "|", lt, 8, 27
tuberias 118, vvvv + 7, "|", lt, 8, 27
IF opcionales(6) THEN : SOUND 500 - (vvvv * 2), 2:  ELSE : FOR delay = 1 TO 1000: NEXT
NEXT
END SUB

'
'
' Dibuja el letrero grande "TETRIS" que aparece en las pantallas de inicio
'
'
SUB tetris
FOR p = 0 TO 63
LINE (0, p - 5)-(315, p - 5), 255 - p
LINE (0, 122 - p)-(315, 122 - p), 255 - p
NEXT


tuberias 25, 37, "|", 58, 15, 22
tuberias 10, 20, "-", 50, 15, 24

tuberias 70, 37, "|", 42, 15, 24
tuberias 70, 20, "-", 40, 15, 24
tuberias 70, 50, "-", 30, 15, 24
tuberias 70, 79, "-", 40, 15, 24

tuberias 135, 37, "|", 58, 15, 22
tuberias 120, 20, "-", 50, 15, 24

tuberias 178, 37, "|", 58, 15, 22
tuberias 198, 72, "|", 7, 15, 22
tuberias 200, 80, "|", 7, 15, 22
tuberias 202, 88, "|", 7, 15, 22
tuberias 210, 37, "|", 18, 15, 22
tuberias 178, 20, "-", 50, 15, 24
tuberias 178, 55, "-", 50, 15, 24

tuberias 235, 21, "|", 74, 15, 22

tuberias 260, 37, "|", 13, 15, 24
tuberias 283, 67, "|", 12, 15, 24

tuberias 260, 20, "-", 40, 15, 24
tuberias 260, 50, "-", 40, 15, 24
tuberias 260, 79, "-", 40, 15, 24

END SUB

'
' Presenta el cuadro de piezas disponibles de la pantalla opciones en color C
'
SUB tipos (C)

IF C = 0 THEN
LINE (191, 128)-(307, 192), 0, BF
EXIT SUB
END IF
DRAW "s4"
FOR v = 130 TO 160 STEP 10
FOR h = 194 TO 294 STEP 10
LINE (h + 1, v)-(h + 9, v + 8), C, B
NEXT
NEXT
LINE (197, 132)-(200, 135), C, BF
LINE (207, 133)-(210, 136), C, BF
LINE (218, 132)-(221, 135), C, BF
LINE (228, 133)-(231, 136), C, BF
LINE (237, 132)-(241, 136), C, BF
LINE (247, 132)-(251, 136), C, B
LINE (257, 132)-(259, 134), C, BF
LINE (259, 134)-(261, 136), C, BF
LINE (267, 132)-(268, 133), C, BF
LINE (270, 135)-(271, 136), C, BF
LINE (277, 132)-(278, 133), C, BF
LINE (277, 135)-(278, 136), C, BF
LINE (280, 132)-(281, 133), C, BF
LINE (280, 135)-(281, 136), C, BF
LINE (288, 133)-(290, 135), C, BF

PAINT (196, 147), C, C: DRAW "C0 R6U6"
PAINT (206, 147), C, C: DRAW "C0 BR6U6L6"
PAINT (216, 147), C, C: DRAW "C0 NR6U6"
PAINT (226, 147), C, C: DRAW "C0 U6R6"
PAINT (236, 147), C, C
PAINT (246, 147), C, C: DRAW "C0 R6U6BL2D4L4BU2R2U2"
PAINT (256, 147), C, C: DRAW "C0 BR6U6L6BD2R4D4BL2U2L2"
PAINT (266, 147), C, C: DRAW "C0 NR6U6BR2D4R4BU2L2U2"
PAINT (276, 147), C, C: DRAW "C0 U6R6BD2L4D4BR2U2R2"

PSET (285, 148), C: DRAW "E8L8F8"
PSET (295, 148), C: DRAW "U4R8U4L4D8"
LINE (197, 152)-(201, 154), C, BF
LINE (207, 152)-(209, 156), C, BF
LINE (217, 154)-(221, 156), C, BF
LINE (229, 152)-(231, 156), C, BF
PSET (237, 156), C: DRAW "U4BR2D4BR2U4"
PSET (247, 156), C: DRAW "R4BU2L4BU2R4"
PSET (257, 156), C: DRAW "U4R2D4R2U4"
PSET (267, 156), C: DRAW "R4U2L4U2R4"
PSET (279, 156), C: DRAW "U4NL2R2"
PSET (289, 156), C: DRAW "U2NR2NL2NU2"
PSET (299, 154), C
PSET (200, 163), C: DRAW "r3d2l8u2r3u3r2d8l2u5 r"
PSET (210, 163), C: DRAW "r3d2l8u2r3u3r2d8l2u4 c0rnu4nd4nl4nr4"
PSET (222, 161), C: DRAW "g6"
PSET (226, 161), C: DRAW "f6"
PSET (235, 160), C: DRAW "d8r2u8r2d8r2u8r2d8"
PSET (245, 160), C: DRAW "r8d2l8d2r8d2l8d2r8"
PSET (255, 160), C: DRAW "r8d2l8d2r8d2l8d2r8bh8d8r2u8r2d8r2u8r2d8"
LINE (265, 160)-(303, 168), 0, BF
PSET (265, 160), C: DRAW "r8d2l8d2r8d2l8d2r8"
PSET (275, 160), C: DRAW "d8r2u8r2d8r2u8r2d8"
PSET (285, 168), C: DRAW "r8u8l8d6r6u4l4d2r2"
PSET (295, 168), C: DRAW "nr8u8r8d6l6u4r4d2l2"
n = 18
FOR h = 194 TO 215 STEP 10
n = n + 3
boton h, 169, 10, 10, 15, n, C, 0
NEXT
boton 224, 169, 10, 10, 15, C - 1, C, 0
boton 234, 169, 10, 10, 15, C + 1, C, 0
boton 244, 169, 10, 10, 15, C - 3, C, 0
boton 254, 169, 10, 10, 15, C + 3, C, 0
boton 264, 169, 10, 10, C - 1, 8, C, 0
boton 274, 169, 10, 10, C + 1, 8, C, 0
boton 284, 169, 10, 10, C - 3, 8, C, 0
boton 294, 169, 10, 10, C + 3, 8, C, 0
boton 194, 179, 10, 10, C + 1, C - 1, C, 0
boton 204, 179, 10, 10, C + 3, C - 3, C, 0
boton 214, 179, 10, 10, C - 1, C + 1, C, 0
boton 224, 179, 10, 10, C - 3, C + 3, C, 0
boton 234, 179, 10, 10, 15, 8, 27, 0
boton 244, 179, 10, 10, 15, 4, 40, 0
boton 254, 179, 10, 10, 15, 2, 48, 0
boton 264, 179, 10, 10, 15, 1, 32, 0
boton 274, 179, 10, 10, 15, 5, 36, 0
boton 284, 179, 10, 10, 15, 43, 44, 0
boton 294, 179, 10, 10, 15, 3, 11, 0
END SUB

'
'
' Dibuja las "tuber°as" para el letrero "TETRIS"
'
'
SUB tuberias (h, v, D$, l, D, cl)

SELECT CASE D$
CASE "|"
a = 1
hh = h
C = cl
DO
hh = hh + 1
C = C + a
SELECT CASE C
CASE 16: a = 1
CASE 31: a = -1
END SELECT
LINE (hh, v)-(hh, v + l), C

LOOP UNTIL hh > h + D

CASE "-"
a = 1
vv = v
C = cl
DO
vv = vv + 1
C = C + a
SELECT CASE C
CASE 16: a = 1
CASE 31: a = -1
END SELECT
LINE (h, vv)-(h + l, vv), C

LOOP UNTIL vv > v + D

END SELECT


END SUB
