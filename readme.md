Etapas de la configuracion, cuando logre automatizarlas las comparto


Estos script son paso a paso para configurar en forma segura un cpanel.

ademas deben hacer 2 pasos manuales hasta nuevo script que automatice el proceso

<h1>Profile EasyApache</h1>

Este archivo itfinden.json se debe agregar como profile en easyapache4 <-- despues en provision 

en tweak setting 

buscar ssl 

Choose the closest matched domain for which that the system has a valid certificate when redirecting from non-SSL to SSL URLs. Formerly known as “Always redirect to SSL/TLS” [?] 

poner en OFF

buscar mail

Number of failed or deferred messages a domain may send before protections can be triggered [?]

aumentar a 35


Exim Configuration Manager 

Require clients to connect with SSL or issue the STARTTLS command before they are allowed to authenticate with the server. [?]

cambiar a OFF


MultiPHP INI Editor

modificar los valores de los PHP

a los valores que se cree que son optimos ... pero casi a varios es agregarles un 0 , excepto session.gc_maxlifetime que siempre es 1440

