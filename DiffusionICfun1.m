function u0 = DiffusionICfun1(x, P)
%pdex1ic1 permet d'impl�menter une condition initiale � l'equation partielle diff�rentielle de l'�thyl�ne
        %[M1(0);M2(0);T(0);Rpol(0)]
    u0 = [0; 0; P.Tb; x];
    
end