function u0 = DiffusionICfun2(x, P)
%pdex1ic1 permet d'impl�menter une condition initiale � l'equation partielle diff�rentielle de l'�thyl�ne
    global res
        
        u0 = [interp1(res.x, res.CI2(1,:,1), x, 'pchip');
            interp1(res.x, res.CI2(1,:,2), x, 'pchip'); 
            interp1(res.x, res.CI2(1,:,3), x, 'pchip'); 
            interp1(res.x, res.CI2(1,:,4), x, 'pchip')];
    
end