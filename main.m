clear all;
clc;
nodos = 0;
while(nodos ~= 20 && nodos~=40 && nodos~=60 && nodos~=80 && nodos~=100)
    nodos = input('Escoja la cantidad de nodos a trabajar (Opciones: 20, 40, 60, 80, 100) -> ');
end
%[paretoX, paretoY] = MOACO(nodos);
MOACO(nodos);