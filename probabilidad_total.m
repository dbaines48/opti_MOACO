%probabilidad_total(nodos,nodo_origen,mat_dist, mat_time, mat_fermo, visitado, alfa, beta, kappa) 
function total = probabilidad_total(nodos, nodo_origen, mat_dist, mat_time, mat_fermo, visitado, alfa, beta, kappa)
    
    total = 0;
    %La probabilidad es en función de la cantidad de feromonas, la
    %distancia entre nodos, y los tiempos de cambio de estadoa a estado
    
    for i=1:nodos
       if(visitado(i) ~= 1 && nodo_origen ~= i)
          total = total + (mat_fermo(nodo_origen,i)^alfa) * ((1/mat_dist(nodo_origen,i))^beta);
          total = total + (mat_fermo(nodo_origen,i)^alfa) * ((1/mat_time(nodo_origen,i))^kappa);
       end
    end
    
end