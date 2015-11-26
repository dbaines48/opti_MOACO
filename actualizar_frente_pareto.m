function [ pD, pT ] = actualizar_frente_pareto( parD, parT, sD, sT)
    
    hay_algo_abajo = 0;
    
    if numel(parD) == 0
        parD = [parD sD];
        parT = [parT sT];
    else
        %buscar si hay soluciones en el cuadrante inferior izquierdo
        i = 1;
        while (i <= numel(parD) && hay_algo_abajo == 0)
            if parD(i) < sD && parT(i) < sT
                  hay_algo_abajo = 1; 
            else
                i = i+1;
            end
        end
        if hay_algo_abajo == 1 %si hay algo abajo
           %no hacer nada
        else                   %si no hay nada abajo
            %quitar lo que esté en el cuadrante superior derecho
            rD = [];
            rT = [];
            for k=1:numel(parD)
               if(parD(k) > sD && parT(k) > sT)
                   %no agregar
               else
                   rD = [rD parD(k)];
                   rT = [rT parT(k)];
               end
            end
            %añadir la solucion ultima hallada
            parD = [rD sD];
            parT = [rT sT];
        end
    end
    pD = parD;
    pT = parT;
end

