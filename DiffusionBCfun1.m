function [pl, ql, pr, qr] = DiffusionBCfun1(xl, ul, xr, ur, t, P)
%pdex1bc1 permet d'implémenter des conditions limite à l'equation partielle différentielle de l'éthylène
%p(x,t,C) + q(x,t) * f(x,t,C,dC/dx) = 0
    
    %% %%%%%%HEAT TRANSFER COEFFICIENT%%%%%%
    
       %%%Ranz-Marshall correlation%%%
    Re = (P.rho_g * P.v * (2 * P.r_pol0)) / P.mu_g;
    Pr = (P.mu_g * P.Cp_g) / P.kc_g;
    h = (P.kc_g / (2 * P.r_pol0)) * (2 + 0.6 * Re^(1/2) * Pr^(1/3));

       %%%Nicollela correllation%%%
%     Pr = (P.mu_g * P.Cp_g) / P.kc_g;
%     h = (P.kc_g / (2 * P.R_pol)) * (2 + 0.265 * ((2 * P.R_pol * P.epsi_s)/(P.mu_g / P.rho_g)^0.241) * Pr^(1/3));    %(J/m2/s/K)
%     h=300;

    %% %%%%% PDE COEFFICIENT %%%%%
    %    [M1;                 M2,                   T]
    pl = [0;                  0;                    0   ;               0];
    ql = [1 / P.D_1;          1 / P.D_2;            1 / P.kc_ov;        1];
    pr = [ur(1) - P.C1_eq;    ur(2) - P.C2_eq;      h * (ur(3) - P.Tb); 0];
    qr = [0;                  0;                    1;                  1];
    
end