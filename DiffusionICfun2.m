function u0 = DiffusionICfun2(x, P)
%pdex1ic1 permet d'impl�menter une condition initiale � l'equation partielle diff�rentielle de l'�thyl�ne
    global ic2
        
        u0 = [interp1(ic2.x, ic2.CI2(1,:,1), x, 'pchip');
            interp1(ic2.x, ic2.CI2(1,:,2), x, 'pchip'); 
            interp1(ic2.x, ic2.CI2(1,:,3), x, 'pchip'); 
            interp1(ic2.x, ic2.CI2(1,:,4), x, 'pchip')];
    
end