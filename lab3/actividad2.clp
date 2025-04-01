(deffunction MAIN::sumar (?p0))

(deftemplate MAIN::lista
   (slot nombre)
   (multislot numeros))

(deffacts MAIN::test-listas
   (lista (nombre L1) (numeros 1 2 3 4 5))
   (lista (nombre L2) (numeros 10 20 30))
   (lista (nombre L3) (numeros 0 0 0))
   (lista (nombre L4) (numeros -5 5 -10 10)))

(deffunction MAIN::sumar
   (?lista)
   (bind ?total 0)
   (foreach ?n ?lista
      (bind ?total (+ ?total ?n)))
   (return ?total))

(defrule MAIN::calcular-suma
   ?fact <- (lista (nombre ?name) (numeros $?nums))
   =>
   (bind ?resultado (sumar $?nums))
   (printout t "La suma de la lista " ?name " es: " ?resultado crlf)
   (retract ?fact))

