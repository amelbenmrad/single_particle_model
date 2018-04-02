function [c, f, s] = DiffusionPDEfun1(x, t, u, dudx, P)
%pdex1pde1 permet de resoudre l'equation partielle différentielle pour le bilan de matiere de l'éthylène
%c(x,t,C,dC/dx)dC/dt = x^-m * d/dx (x^m * f(x,t,C,dC/dx)) + s(x,t,C,dC/dx)

     C1 = u(1); % [mol/m3 pol] Ethylene
        C2 = u(2);  % [mol/m3 pol ] ICA
        T = u(3);
        r_pol =u(4);     % Rayon de la particule [m]

       
    % P.rho_ov à calculer ici
     
    kp = P.kp_ref * exp(-P.Ea / P.R*(1 / T - 1 / P.T_ref));       % m3/mol/s

    kd = P.kd_ref * exp(-P.Ed / P.R*(1 / T - 1 / P.T_ref));       % m3/mol/s
    
    C_star = P.C1_star * exp(- kd * t) + P.C2_star;                        %(mole site/m3 de cata)
    
    Rp = kp * C_star * C1;                                               %(mol/m3/s)
    
    Rv = Rp * ((1-P.epsi) / P.phi^3);                                      %(mol/m3/s)
    
    
    %P.rho_g = P.P * P.Mw1 / (P.R * T);                                  %densité de phase gaz (kg/m3)
    
    %% %%%%% PDE COEFFICIENT %%%%%
    c = [1;                 1;                  P.rho_ov * P.Cp_ov;     1];
    f = [P.D_1 * dudx(1);   P.D_2 * dudx(2);    P.kc_ov * dudx(3)   ;   0];
    s = [-Rv;               0;                  -P.delta_Hp * Rv    ;   Rv*r_pol*P.Mw1/3/P.rho_ov];
    
end