(deffunction MAIN::interseccion (?p0 ?p1))

(deftemplate MAIN::cadena
   (slot id)
   (multislot letras))

(deffacts MAIN::test-cadenas
   (cadena (id C1) (letras B C A D E E B C E))
   (cadena (id C2) (letras E E B C A F E)))

(deffunction MAIN::interseccion
   (?lista1 ?lista2)
   (bind ?resultado (create$))
   (foreach ?l ?lista1
      (if (and (member$ ?l ?lista2) (not (member$ ?l ?resultado)))
         then
         (bind ?resultado (create$ ?resultado ?l))))
   (return ?resultado))

(defrule MAIN::calcular-union
   (cadena (id C1) (letras $?l1))
   (cadena (id C2) (letras $?l2))
   =>
   (bind ?res (interseccion $?l1 $?l2))
   (printout t "(union " ?res ")" crlf))

