%Algoritmo de Colonia de Hormigas Multi-Objetivo
function [ paretoD, paretoT ] = MOACO(cant_nodos)
   n = num2str(cant_nodos);
   ds = strcat(n,'x',n,'distances.csv');
   ts = strcat(n,'x',n,'times.csv');
   
   switch(cant_nodos)
    case 20
        pf = 0.4;
    case 40
        pf = 0.3;
    case 60
        pf = 0.25;
    case 80
        pf = 0.2;
    case 100
        pf = 0.15;
   end
   
   %Generar grafo en funcion de las distancias y los tiempos
   %Se asume que todos los nodos están conectados entre si.
   mx = 100;
   MD = csvread(ds);
   MT = csvread(ts);
   
   %Inicialización de feromonas
   for i=1:cant_nodos
       for j=1:cant_nodos
            frm(i,j) = pf; %matriz para valor de feromonas
       end
   end
   alfa  = 0.9; %influencia de las feromonas 
   beta  = 0.4; %influencia de la distancia
   kappa = 0.4; %influencia del tiempo
   
   %Ciclo de optimizacion
   paretoD = []; %inicializar frente de pareto para distancias
   paretoT = []; %inicializar frente de pareto para tiempos
   
   [f s] = size(paretoD);
   while s < mx %ciclo hasta el maximo de soluciones esperadas
       
       %marcar todos los nodos como no visitados y reiniciar las probabilidades de visita a 0
       for k=1:cant_nodos
           visitado(k) = 0;
       end
       %inicializar totales de solucion de iteracion para calculos posteriores
       total_tiempos = 0;
       total_distancias = 0;
       
       nodo_origen_iteracion = randi([1, cant_nodos]); %elegir al azar un nodo origen
       
       ruta_iter = [];
       for c=1:cant_nodos-1 %hacer una ruta de n nodos
           visitado(nodo_origen_iteracion) = 1; %marcar como visitado el nodo
           %ruta_iter = [ruta_iter nodo_origen_iteracion];
           prob_total = probabilidad_total(cant_nodos,nodo_origen_iteracion,MD,MT,frm,visitado,alfa,beta,kappa); 
          
          lprs = [];
          lpns = [];
          for k=1:cant_nodos
              if (visitado(k) ~= 1)
                  p_iter = (frm(nodo_origen_iteracion,k)^alfa)*((1/MD(nodo_origen_iteracion,k))^beta);
                  p_iter = (frm(nodo_origen_iteracion,k)^alfa)*((1/MT(nodo_origen_iteracion,k))^kappa);
                  prb = p_iter/prob_total;
                  lprs = [lprs prb];
                  lpns = [lpns k];
              end
          end
          [bp bi] = max(lprs); %escoger la mejor probabilidad
          nnodo = lpns(bi);
          frm(nodo_origen_iteracion, nnodo) = frm(nodo_origen_iteracion, nnodo) + pf/2; %aumentar rastro de feromona al pasar hormiga.
          
          total_tiempos = total_tiempos + MT(nodo_origen_iteracion, nnodo);
          total_distancias = total_distancias + MD(nodo_origen_iteracion, nnodo);
          
          nodo_origen_iteracion = nnodo;
       end
       ruta_iter = [ruta_iter nnodo];
       %[paretoD, paretoT] = verificar_frente_pareto(paretoD, paretoT, total_distancias, total_tiempos);
       paretoD = [paretoD total_distancias];
       paretoT = [paretoT total_tiempos];
       frm = actualizar_feromonas(frm, cant_nodos);
       [f s] = size(paretoD);
   end 
end