function [P] = variables()

    % Declare et initialise toutes les variables utilis�es dans le programme principal "main"
    
    %% %%POLYMERIZATION KINETICS PARAMETERS%%%%
    P.kp_ref = 70.3;                        %constante de vitesse de propagation � Tref (m3/mol site.s)
    P.kd_ref = 0.000156;                    %constante de desactivation (s-1)
    P.C1_star = 1.37;                       %constante d�terminant concentration aux SA au d�but de r�action (mole site/m3 de cata)
    P.C2_star = 0.45;                       %constante d�terminant concentration aux SA � la fin de r�action (mole site/m3 de cata)
    P.Ea = 42000;                           %Energie d'activation (J/mol)
    P.Ed = 42000;                           %Energie de desactivation (J/mol)
    P.T_ref = 313.15;                       %temp�rature de r�ference (K)
    P.delta_Hp = -107500;                   %enthalpie de polym�risation de l'�thyl�ne (J/mol)
    
    %% %%HYDRODYNAMICS OF REACTOR%%%%
    P.v = 0.02;                             %vitesse relative gaz-particule (m/s)
    
    %% %%CATALYST PHYSICAL PROPERTIES%%%%
    P.r_cat = 0.000025;                     %rayon de particule de catalyseur initiale (m)
    P.rho_cat = 2300;                       %densit� du catalyseur (kg/m3)
    P.R = 8.314;                            %constante des gaz parfaits (J/mol/K)
    
    %% %%OVERALL PARTICLE PROPERTIES%%%%
    P.r_pol0 = 0.0001;                       %rayon de la particule de polymere seulement (sans le volume des pores) (m)
    P.epsi = 0.05;                          %porosit� de la particule (-)
    P.kc_ov = 0.2;                          %conductivit� thermique de la particule (J/m.s.K)
    P.Cp_ov = 1840;                         %capacit� calorifique de la particule (J/kg.K)
    P.C1_eq = 86;                           %concentration � l'�q de l'�thyl�ne dans particule (mol/m3)
    P.C2_eq = 122.6;                        %concentration du n-hexane dans particule (mol/m3)
    P.D_1 = 3.1e-9;                         %diffusivit� totale de l'�thyl�ne (m2/s)
    P.D_2 = 5.2e-10;                        %diffusivit� totale du n-hexane (m2/s)
    P.epsi_s = 0.1;                         %viscous dissipation rate (m2/s3) (A VERIFIER !!!!!!!)
    P.phi = P.r_pol0 / P.r_cat;              %overall growth factor (-)
    
    P.rho_ov = 869.8;                       %densit� de particule (kg/m3) (this is variable, depnds on [M1] and [M2]!!!!!!!!!!)
    
    %% %%GAZ PHASE PROPERTIES%%%%
    P.Tb = 353.15;                          %temp�rature bulk phase (K)
    P.mu_g = 1.32e-5;                       %viscosit� de la phase gaz (kg/m.s)
    P.kc_g = 2.61e-2;                       %conductivit� thermique de phase gaz (J/m.s.K)
    P.P = 7e5;                              %pressure (Pa)
    P.Mw1 = 0.028;                          %molecular weight of ethylene (kg/mol)
    P.Cp_g =16.6;                           %capacit� calorifique de la phase gaz (J/kg.K)
    P.rho_g = 9.2;                          %densit� de phase gaz (kg/m3)
    
end