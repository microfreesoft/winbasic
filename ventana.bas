'
'  © JM. :: Hecho en Ronda
'
'
'  Procedente de...        es.geocities.com/jm00092
'
'______________________________________________________________________
'                                   DEMO DE BARRA DE MENUS DESPLEGABLES
'
DECLARE FUNCTION menu! (comando$, v!, h!, l!, f!, lr!, fr!, pp!, s!, t!)
DECLARE SUB caja (F1!, C1!, F2!, C2!, papel!, marco!, fondo!, sombra!)
DECLARE FUNCTION barramenu! (v!, h!, comando$, l!, f!, lr!, fr!)

CLS
PALETTE 4, 36
PALETTE 3, 63
PALETTE 6, 62

DIM SHARED conjuntomenu$(1 TO 20)
DIM SHARED posicionmenu(1 TO 20, 1 TO 2)
COLOR 15, 7: CLS
LOCATE 1, 1: COLOR 15, 1: PRINT "                         Ejemplo de barra de men£ m¢vil                          "

SELECT CASE barramenu(2, 1, "  Archivo  Edici¢n  Ver  Calcular  Herramientas  Complementos  Opciones  Ayuda  ", 0, 3, 14, 4)

   CASE 1: p = menu("Nuevo-Abrir-Guardar-Guardar como-P gina-Impresi¢n-Imprimir-Directorios-Salir", 3, 2, 0, 3, 14, 4, 7, 8, 1)
   CASE 2: p = menu("Cortar-Copiar-Pegar-Borrar-Buscar-Reemplazar-Sugerir-Anotar", 3, 11, 0, 3, 14, 4, 7, 8, 1)
   CASE 3: p = menu("Zoom-Borrador-Todo-Inverso-B y N-Impreso-M£ltiple", 3, 20, 0, 3, 14, 4, 7, 8, 1)
   CASE 4: p = menu("Autom tico-Manual-Aleatorio-Sistem tico-Fraccionario-Monetario", 3, 25, 0, 3, 14, 4, 7, 8, 1)
   CASE 5: p = menu("Dibujar-Ortograf¡a-Sin¢nimos-Repeticiones-Puntuaci¢n-Rima", 3, 35, 0, 3, 14, 4, 7, 8, 1)
   CASE 6: p = menu("Calculadora-Juego 1-Juego 2-Juego 3-Juego 4-M£sica-Gr ficas-Programaci¢n-Animaciones-Reloj-Agenda-Calendario-Traductor-Internet", 3, 49, 0, 3, 14, 4, 7, 8, 1)
   CASE 7: p = menu("Colores-Preferencias-Entrada-Programa-Sonidos-Mostrar-Usuario", 3, 63, 0, 3, 14, 4, 7, 8, 1)
   CASE 8: p = menu("Indice-Comandos-Men£s-Como hacer..-Introducci¢n-Tutorial-Teclado-Rat¢n-Ampliaciones-Acerca de...", 3, 65, 0, 3, 14, 4, 7, 8, 1)

END SELECT

'
'  © JM. :: Hecho en Ronda
'
'
'  Procedente de...        es.geocities.com/jm00092
'
'______________________________________________________________________
'                              BARRA DE MENUS HORIZONTAL HECHA EN RONDA
'
'
FUNCTION barramenu (v, h, comando$, l, f, lr, fr)

IF RIGHT$(comando$, 1) <> " " THEN : comando$ = comando$ + " "
IF LEFT$(comando$, 1) <> " " THEN : comando$ = " " + comando$

p = 0
letra$ = ""

FOR n = 1 TO LEN(comando$)
   Aletra$ = letra$
   letra$ = MID$(comando$, n, 1)
   IF letra$ <> " " AND Aletra$ = " " THEN : p = p + 1: posicionmenu(p, 1) = n - 1
NEXT
numlineas = p

FOR n = 1 TO numlineas
   p = posicionmenu(n, 1)
   DO
      p = p + 1
      letra$ = MID$(comando$, p, 1)
   LOOP UNTIL letra$ = " "
   posicionmenu(n, 2) = p - posicionmenu(n, 1) - 1
NEXT

FOR n = 1 TO numlineas
   p = posicionmenu(n, 1)
   posicionmenu(n, 1) = p - 1
   p = posicionmenu(n, 2)
   posicionmenu(n, 2) = p + 2
NEXT

FOR n = 1 TO numlineas
   conjuntomenu$(n) = MID$(comando$, posicionmenu(n, 1) + 1, posicionmenu(n, 2))
NEXT

LOCATE v, h: COLOR l, f: PRINT comando$
LOCATE v, h + posicionmenu(1, 1): COLOR lr, fr: PRINT conjuntomenu$(1)
p = 1

DO
   DO
      kbd$ = INKEY$
   LOOP WHILE kbd$ = ""
   LOCATE v, h: COLOR l, f: PRINT comando$

   SELECT CASE kbd$
      CASE CHR$(0) + "M": p = p + 1
      CASE CHR$(0) + "K": p = p - 1
      CASE CHR$(0) + "P": EXIT DO
      CASE CHR$(13): EXIT DO
      CASE ELSE: SOUND 400, 2
   END SELECT

   IF p > numlineas THEN : p = 1
   IF p < 1 THEN : p = numlineas

   LOCATE v, h + posicionmenu(p, 1): COLOR lr, fr: PRINT conjuntomenu$(p)
LOOP

LOCATE v, h + posicionmenu(p, 1): COLOR lr, fr: PRINT conjuntomenu$(p)
barramenu = p

END FUNCTION

'
'  © JM. :: Hecho en Ronda
'
'
'  Procedente de...        es.geocities.com/jm00092
'
'______________________________________________________________________
'
'
SUB caja (F1, C1, F2, C2, papel, marco, fondo, sombra) STATIC
COLOR marco, fondo
ANCHO = C2 - C1 + 1
LOCATE F1, C1
PRINT "Ú"; STRING$(ANCHO - 2, "Ä"); "¿";
LOCATE F1, C1 + ANCHO: COLOR sombra, papel: PRINT "Ü";
FOR a = F1 + 1 TO F2 - 1
   LOCATE a, C1
   COLOR marco, fondo: PRINT "³"; SPACE$(ANCHO - 2); "³";
   LOCATE a, C1 + ANCHO: COLOR sombra, papel: PRINT "Û";
NEXT a
LOCATE F2, C1
COLOR marco, fondo: PRINT "À"; STRING$(ANCHO - 2, "Ä"); "Ù";
LOCATE F2, C1 + ANCHO: COLOR sombra, papel: PRINT "Û";
LOCATE F2 + 1, C1 + 1: COLOR sombra, papel:  PRINT STRING$(ANCHO, "ß");
COLOR marco, fondo
END SUB

'
'  © JM. :: Hecho en Ronda
'
'
'  Procedente de...        es.geocities.com/jm00092
'
'______________________________________________________________________
'                                       MENU DESPLEGABLE HECHO EN RONDA
'
'
'  camando$....Conjunto de ordenes del men£ separadas por guiones
'  v,h.........Posici¢n superior izquierda
'  l...........Color de letra
'  f...........Color de fondo
'  lr..........Color de letra resaltada
'  fr..........Color de fondo resaltado
'  p...........Color del fondo de la pantalla detr s del men£
'  s...........Color de la sombra del men£ en relieve
'  t...........Tipo se men£  0=Simple  1=Sombra   2=Borde y sombra
'
'
FUNCTION menu (comando$, v, h, l, f, lr, fr, pp, s, t)
comando$ = comando$ + "-"
p = 0
Linea$ = ""
FOR n = 1 TO LEN(comando$)
   letra$ = MID$(comando$, n, 1)
   SELECT CASE letra$
      CASE "-": p = p + 1: conjuntomenu$(p) = Linea$: Linea$ = ""
      CASE ELSE: Linea$ = Linea$ + letra$
   END SELECT
NEXT
numlineas = p
largo = 0
FOR n = 1 TO numlineas
   la = LEN(conjuntomenu$(n))
   IF la > largo THEN : largo = la
NEXT
h2 = h + largo + 1
v2 = v + numlineas - 1
SELECT CASE t
   CASE 1: caja v, h, v2, h2, pp, l, f, s
   CASE 2: caja v - 1, h - 1, v2 + 1, h2 + 1, pp, l, f, s
END SELECT
FOR n = 1 TO numlineas
   la = LEN(conjuntomenu$(n))
   nuevalinea$ = " " + conjuntomenu$(n) + SPACE$((largo - la) + 1)
   conjuntomenu$(n) = nuevalinea$
NEXT
COLOR l, f
FOR vv = v + 1 TO v + numlineas - 1
   LOCATE vv, h: PRINT conjuntomenu$(vv - v + 1); ' Numlineas; largo
NEXT
LOCATE v, h: COLOR lr, fr: PRINT conjuntomenu$(1);
p = 1
DO
   DO
      kbd$ = INKEY$
   LOOP WHILE kbd$ = ""
   COLOR l, f
   FOR vv = v TO v + numlineas - 1
      LOCATE vv, h: PRINT conjuntomenu$(vv - v + 1);
   NEXT
   SELECT CASE kbd$
      CASE CHR$(0) + "H": p = p - 1
      CASE CHR$(0) + "P": p = p + 1
      CASE CHR$(13): EXIT DO
      CASE ELSE: SOUND 400, 2
   END SELECT
   IF p < 1 THEN : p = numlineas
   IF p > numlineas THEN : p = 1
   LOCATE v + p - 1, h: COLOR lr, fr: PRINT conjuntomenu$(p);
LOOP
LOCATE v + p - 1, h: COLOR lr, fr: PRINT conjuntomenu$(p);
menu = p
END FUNCTION
