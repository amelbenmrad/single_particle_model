clc
clear all
close all
global res
% format long g

% Obtenir les valeurs des variables utiles pour ce programme
[P] = variables();

%% %%%%%%%%%%%%%%%%%BILAN DE MATIERE ET BILAN ENERGETIQUE%%%%%%%%%%%%%%%%%%%%%%

%m peut prendre 0(slab), 1(cylindrical) ou 2(spherical)
m = 2;
%xmesh specifie les points auxquels une solution numérique est demandée pour chaque valeur de tspan (intervalle de concentration)
x = (0: P.r_pol0/100: P.r_pol0);         % [m]
%tspan specifie les points auxquels une solution numérique est demandée pour chaque valeur de xmesh (intervalle de temps)
%t = linspace(Start time, number of intervals,End time)
t = 0:.5:1;                              % [s]
%appelle la solution de DiffusionPDEfun1 du composant k pour concentration C1=P au temps tspan(i)
%et au point de maillage xmesh(j) avec CI DiffusionICfun1 et CL DiffusionBCfun1
sol = pdepe(m, @DiffusionPDEfun1, @DiffusionICfun1, @DiffusionBCfun1, x, t, [], P);


%% Boucle

for k = 2:100                                   % [s]
    res.sol = [sol(1, :, :); sol(end, :, :)];   % 3 temps donc sol(1...) c'est t=0 1ere colonne et sol(end...) c'est t=1 derniere colonne
    res.CI2 = sol(end, :, :);                   % nouvelle condition initiale est la derniere valeur de l'ancien vecteur sol(end..) du precedent
    r_pol = sol(end, :, 4);                     % [m] 4 pour la solution de r_pol
    P.r_pol = P.r_pol0 + sum(r_pol - x, 2);     % [m] r_pol-x pour la translation de rpol passant par 0 ??????
    res.x = (0: P.r_pol/100: P.r_pol);          % (m)
    t = k-1 : 0.5 : k;                          % [s] k commence à 2 pas a 1 car dans la premiere boucle k-1 = 1
    sol = pdepe(m, @DiffusionPDEfun1, @DiffusionICfun2, @DiffusionBCfun1, x, t, [], P);
    
    r_pol = sol(end, :, 4);                     % [m]
    res.r_pol(k) = P.r_pol + sum(r_pol - x, 2); % [m]
    P.r_pol = res.r_pol(k);

end


%%
Displayplots
