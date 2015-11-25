%Algoritmo de Colonia de Hormigas Multi-Objetivo
function [ px, py ] = MOACO( cant_nodos, max)
   n = num2str(cant_nodos);
   ds = strcat(n,'x',n,'distances.csv');
   ts = strcat(n,'x',n,'times.csv');
   
   switch(cant_nodos)
    case 20
        max = 10;
        pf = 0.4;
    case 40
        max = 35;
        pf = 0.3;
    case 60
        max = 50;
        pf = 0.25;
    case 80
        max = 60;
        pf = 0.2;
    case 100
        max = 75;
        pf = 0.15;
   end
   
   %Generar grafo en funcion de las distancias y los tiempos
   %Se asume que todos los nodos están conectados entre si.
   MD = csvread(ds);
   MT = csvread(ts);
   
   %Inicialización de feromonas
   for i=1:cant_nodos
       for j=1:cant_nodos
           frm(i,j) = pf; %matriz para valor de feromonas
       end
   end
   alfa  = 0.8 %influencia de las feromonas 
   beta  = 0.5 %influencia de la distancia
   kappa = 0.5 %influencia del tiempo
   
   %Ciclo de optimizacion
   for i=1:max %ciclo hasta el maximo de iteraciones específicadas
       %marcar todos los nodos como no visitados y reiniciar las probabilidades de visita a 0
       for k=1:cant_nodos
           for l=1:cant_nodos
               visitado(i,j) = 0;
               prob_visita(i,j) = 0;
           end
       end
       %inicializar totales de solucion de iteracion para calculos posteriores
       total_tiempos = 0;
       total_distancias = 0;
       
       %elegir al azar un nodo origen
       i_ini = randi([1, cant_nodos]);
       j_ini = randi([1, cant_nodos]);
       
       visitado(i_ini,j_ini) = 1; %marcar como visitado nodo origen
       
       %hallar ruta para iteracion
       for k=1: cant_nodos
          %calculo de la probabilidad de cambio de estado de una hormiga
          pk_ij = 0;
          for l=1: cant_nodos
              
          end
       end
   end
end
