(deffunction MAIN::minimo (?p0))

(deftemplate MAIN::lista
   (slot nombre)
   (multislot numeros))

(deffacts MAIN::test-listas
   (lista (nombre L1) (numeros 10 5 8 20 3 15))
   (lista (nombre L2) (numeros 99 24 36 7 88))
   (lista (nombre L3) (numeros 42))
   (lista (nombre L4) (numeros 5 5 5 5)))

(deffunction MAIN::minimo
   (?lista)
   (if (eq (length$ ?lista) 0)
      then
      (return nil))
   (bind ?min (nth$ 1 ?lista))
   (foreach ?n ?lista
      (if (< ?n ?min)
         then
         (bind ?min ?n)))
   (return ?min))

(defrule MAIN::calcular-minimo
   ?fact <- (lista (nombre ?name) (numeros $?nums))
   =>
   (bind ?min (minimo $?nums))
   (printout t "El mínimo de la lista " ?name " es: " ?min crlf)
   (retract ?fact))

