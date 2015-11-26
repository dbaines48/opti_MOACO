function [ parD, parT ] = actualizar_frente_pareto( parD, parT, sD, sT)
    rD = [];
    rT = [];
    sw = 0; %verifica si ya se ha establecido que deba incluirse la solución
    can_get_in = 1; %verifica que la solución pueda ser incluida
    
    if numel(parD) == 0     %si no hay nada en el frente de pareto
        rD = [rD sD];
        rT = [rT sT];
    else                    % si si hay algo
        for i=1:numel(parD)
            if sD < parD(i) && sT < parT(i) % si la solucion es mejor en todo sentido
                sw = 1;
            else
                if sD > parD(i) && sT > parT(i) % si la solucion es peor en todo sentido
                   can_get_in = 0;
                   rD = [rD parD(i)];
                   rT = [rT parT(i)];
                else
                    
                end
            end
        end
    end
    
    parD = rD;
    parT = rT;    
end

