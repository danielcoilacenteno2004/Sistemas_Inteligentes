(deffunction MAIN::contiene-todos (?p0 $?wildargs))

(deftemplate MAIN::país
   (slot nombre)
   (multislot bandera))

(deffacts MAIN::paises
   (país (nombre España) (bandera Rojo Amarillo Rojo))
   (país (nombre Alemania) (bandera Negro Rojo Amarillo))
   (país (nombre Italia) (bandera Verde Blanco Rojo))
   (país (nombre Brasil) (bandera Verde Amarillo Azul Blanco))
   (país (nombre Peru) (bandera Rojo Blanco)))

(deffunction MAIN::contiene-todos
   (?buscado $?bandera)
   (foreach ?color ?buscado
      (if (not (member$ ?color $?bandera))
         then
         (return FALSE)))
   (return TRUE))

(defrule MAIN::buscar-paises
   (ColoresABuscar $?buscados)
   ?p <- (país (nombre ?nombre) (bandera $?bandera))
   =>
   (if (eq (contiene-todos $?buscados $?bandera) TRUE)
      then
      (printout t "País: " ?nombre crlf)))

