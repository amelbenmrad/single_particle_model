% sol = t,r,etat(C1,C2, T, r_pol)
C1 = res.sol(:, :, 1);
C2 = res.sol(:, :, 2);
T = res.sol(:, :, 3);
r_pol_dist = res.sol(:, :, 4); % [m]

% disp('The volume of produced polymer (m3) = ')
% v_pol=4/3*pi()*(res.r_pol(end)^3-P.r_pol0^3)
% disp('The mass of produced polymer (g) = ')
% m_pol=v_pol*869.8*1000
% disp('Facteur de croissance = ')
% res.r_pol(end)^3/P.r_pol0^3

kp = P.kp_ref * exp(-P.Ea./ P.R.*(1 ./ T - 1 / P.T_ref));        % m3/mol/s

kd = P.kd_ref * exp(-P.Ed ./ P.R.*(1 ./ T - 1 / P.T_ref));       % m3/mol/s

C_star = P.C1_star .* exp(- kd .* res.t') + P.C2_star;           %(mole site/m3 de cata)

Rp = kp .* C_star .* C1;                                         %(mol/m3/s)

r_pol=r_pol_dist(end,:);
phi = r_pol ./ P.r_cat;             %overall growth factor (-)

Rv = Rp .* ((1-P.epsi) ./ phi.^3);                               %(mol/m3/s)
  
%% %%%CATALYST CONCENTRATION%%%

figure
hold all
plot(res.t/60, C_star, 'LineWidth', 2)   %sum(A,2) = vecteur colonne contenant la somme des lignes du vecteur A
xlabel('Time (min)', 'fontsize', 12, 'fontweight', 'b', 'fontname', 'arial')
ylabel('Catalyst concentration (mol/m^3)', 'fontsize', 12, 'fontweight' , 'b', 'fontname', 'arial')
% axis([0 inf 20 inf])
set(gca, 'FontSize', 12, 'fontweight', 'b', 'fontname', 'arial')
title('Catalyst concentration')

%% %%%REACTION RATE%%%

figure
hold all
plot(res.t/60, Rv, 'LineWidth', 2)   %sum(A,2) = vecteur colonne contenant la somme des lignes du vecteur A
xlabel('Time (min)', 'fontsize', 12, 'fontweight', 'b', 'fontname', 'arial')
ylabel('Reaction rate (mol/s/m^3)', 'fontsize', 12, 'fontweight' , 'b', 'fontname', 'arial')
% axis([0 inf 20 inf])
set(gca, 'FontSize', 12, 'fontweight', 'b', 'fontname', 'arial')

figure
hold all
plot(x * 1e6,Rv(res.t == 1, :) , 'LineWidth', 2)
plot(x * 1e6,Rv(res.t == 5, :) , 'k--', 'LineWidth', 2)
plot(x * 1e6,Rv(res.t == 10, :) , 'm:', 'LineWidth', 2)
plot(x * 1e6,Rv(res.t == 100, :), 'g:', 'LineWidth', 2)
legend('t = 1 s', 't = 5 s', 't = 10 s', 't = 100 s')
xlabel('Normalized particle radius (-)', 'fontsize', 12, 'fontweight', 'b', 'fontname', 'arial')
ylabel('Reaction rate (mol/s/m^3)', 'fontsize', 12, 'fontweight', 'b', 'fontname', 'arial')
% axis([0 inf 80 90])
set(gca, 'FontSize', 12, 'fontweight', 'b', 'fontname', 'arial')

figure
hold all
plot(r_pol_dist(1,:) * 1e6,Rv(res.t == 1, :) , 'LineWidth', 2)
plot(r_pol_dist(1,:) * 1e6,Rv(res.t == 5, :) , 'k--', 'LineWidth', 2)
plot(r_pol_dist(1,:) * 1e6,Rv(res.t == 10, :) , 'm:', 'LineWidth', 2)
plot(r_pol_dist(1,:) * 1e6,Rv(res.t == 100, :), 'g:', 'LineWidth', 2)
legend('t = 1 s', 't = 5 s', 't = 10 s', 't = 100 s')
xlabel('Real particle radius (-)', 'fontsize', 12, 'fontweight', 'b', 'fontname', 'arial')
ylabel('Reaction rate (mol/s/m^3)', 'fontsize', 12, 'fontweight', 'b', 'fontname', 'arial')
% axis([0 inf 80 90])
set(gca, 'FontSize', 12, 'fontweight', 'b', 'fontname', 'arial')

%% %%%PARTICLE RADIUS%%%

figure
hold all
plot(res.t/60, res.r_pol, 'LineWidth', 2)   %sum(A,2) = vecteur colonne contenant la somme des lignes du vecteur A
xlabel('Time (min)', 'fontsize', 12, 'fontweight', 'b', 'fontname', 'arial')
ylabel('Particle radius (m)', 'fontsize', 12, 'fontweight' , 'b', 'fontname', 'arial')
% axis([0 inf 20 inf])
set(gca, 'FontSize', 12, 'fontweight', 'b', 'fontname', 'arial')

v_pol=4/3*pi()*(res.r_pol.^3-P.r_pol0^3*0);
m_pol=v_pol*869.8*1000; % (g)

figure
hold all
plot(res.t/60, m_pol, 'LineWidth', 2)   %sum(A,2) = vecteur colonne contenant la somme des lignes du vecteur A
xlabel('Time (min)', 'fontsize', 12, 'fontweight', 'b', 'fontname', 'arial')
ylabel('Total mass of polymer (g)', 'fontsize', 12, 'fontweight' , 'b', 'fontname', 'arial')
% axis([0 inf 20 inf])
set(gca, 'FontSize', 12, 'fontweight', 'b', 'fontname', 'arial')

%% %%%CONCENTRATION ETHYLENE%%%%%

% % 3D surface plot
% figure
% surf(x*1e6,t,C1,'edgecolor','none');
% xlabel('Particle radius (µm)','fontsize',12,'fontweight','b','fontname','arial')
% ylabel('Time (s)','fontsize',12,'fontweight','b','fontname','arial')
% zlabel('Ethylene concentration (mol m^{-3})','fontsize',12,'fontweight','b','fontname','arial')
% axis([0 inf 0 inf 0 inf])
% set(gcf(), 'Renderer', 'painters')
% set(gca,'FontSize',12,'fontweight','b','fontname','arial')

figure
hold all
plot(x * 1e6, C1(res.t == 1, :), 'LineWidth', 2)          %find(t==1) cherche la colonne ou t=1 peu importe si on change le pas
plot(x * 1e6, C1(res.t == 5, :), 'k--', 'LineWidth', 2)
plot(x * 1e6, C1(res.t == 10, :), 'm:', 'LineWidth', 2)
plot(x * 1e6, C1(res.t == 100, :), 'g', 'LineWidth', 2)
legend('t = 1 s', 't = 5 s', 't = 10 s', 't = 100 s')
xlabel('Normalized particle radius (-)', 'fontsize', 12, 'fontweight', 'b', 'fontname', 'arial')
ylabel('Ethylene concentration (mol m^{-3})', 'fontsize', 12, 'fontweight', 'b', 'fontname', 'arial')
%axis([0 inf 0 inf])
set(gca, 'FontSize', 12, 'fontweight', 'b', 'fontname', 'arial')

figure
hold all
plot(res.t, C1(:, end), 'LineWidth', 2)
plot(res.t, C1(:, round(length(x) / 2)), 'k--', 'LineWidth', 2)            % round = arrondi au plus haut
plot(res.t, C1(:, 1), 'm:', 'LineWidth', 2)
legend('R', 'R/2', 'Center')
xlabel('Time (s)', 'fontsize', 12, 'fontweight', 'b', 'fontname', 'arial')
ylabel('Ethylene concentration (mol m^{-3})', 'fontsize', 12, 'fontweight', 'b', 'fontname', 'arial')
% axis([0 inf 20 inf])
set(gca, 'FontSize', 12, 'fontweight', 'b', 'fontname', 'arial')

%% %%%CONCENTRATION ICA%%%%%

% 3D surface plot
% figure
% surf(x*1e6,t,C2,'edgecolor','none');
% xlabel('Particle radius (µm)','fontsize',12,'fontweight','b','fontname','arial')
% ylabel('Time (s)','fontsize',12,'fontweight','b','fontname','arial')
% zlabel('ICA concentration (mol m^{-3})','fontsize',12,'fontweight','b','fontname','arial')
% axis([0 inf 0 inf 0 inf])
% set(gcf(), 'Renderer', 'painters')
% set(gca,'FontSize',12,'fontweight','b','fontname','arial')

figure
hold all
plot(x * 1e6, C2(res.t == 1, :), 'LineWidth', 2)
plot(x * 1e6, C2(res.t == 5, :), 'LineWidth', 2)
plot(x * 1e6, C2(res.t == 10, :), 'k--', 'LineWidth', 2)
plot(x * 1e6, C2(res.t == 100, :), 'm:', 'LineWidth', 2)
legend('t = 1 s', 't = 5 s', 't = 10 s', 't = 100 s')
xlabel('Normalized particle radius (-)', 'fontsize', 12, 'fontweight', 'b', 'fontname', 'arial')
ylabel('ICA concentration (mol m^{-3})', 'fontsize', 12, 'fontweight', 'b', 'fontname', 'arial')
axis([0 inf 0 inf])
set(gca, 'FontSize', 12, 'fontweight', 'b', 'fontname', 'arial')

figure
hold all
plot(res.t, C2(:, end), 'LineWidth', 2)   %Linewidth = largeur de la ligne
plot(res.t, C2(:, round(length(x) / 2)), 'k--', 'LineWidth', 2) % round = arrondi au plus haut
plot(res.t, C2(:, 1), 'm:','LineWidth', 2)
legend('R', 'R/2', 'Center')
xlabel('Time (s)', 'fontsize', 12, 'fontweight', 'b', 'fontname', 'arial')
ylabel('ICA concentration (mol m^{-3})', 'fontsize', 12, 'fontweight', 'b', 'fontname', 'arial')
% axis([0 inf 20 inf])
set(gca, 'FontSize', 12, 'fontweight', 'b', 'fontname', 'arial')

%% %%%TEMPERATURE%%%%%

% 3D surface plot
% figure
% surf(x*1e6,t,T,'edgecolor','none');
% xlabel('Particle radius x (µm)','fontsize',12,'fontweight','b','fontname','arial')
% ylabel('Time (s)','fontsize',12,'fontweight','b','fontname','arial')
% zlabel('Temperature (K)','fontsize',12,'fontweight','b','fontname','arial')
% axis([0 inf 0 inf 0 inf])
% set(gcf(), 'Renderer', 'painters')
% set(gca,'FontSize',12,'fontweight','b','fontname','arial')

figure
hold all
plot(x * 1e6,T(res.t == 1, :), 'LineWidth', 2)
plot(x * 1e6,T(res.t == 5, :), 'k--', 'LineWidth', 2)
plot(x * 1e6,T(res.t == 10, :) , 'm:', 'LineWidth', 2)
plot(x * 1e6,T(res.t == 100, :) , 'g:', 'LineWidth', 2)
plot(x * 1e6,T(res.t == 500, :) , 'b:', 'LineWidth', 2)
legend('t = 1 s', 't = 5 s', 't = 10 s', 't = 100 s', 't = 500 s')
xlabel('Normalized particle radius (-)', 'fontsize', 12, 'fontweight', 'b', 'fontname', 'arial')
ylabel('Temperature (°C)', 'fontsize', 12, 'fontweight', 'b', 'fontname', 'arial')
% axis([0 inf 80 90])
set(gca, 'FontSize', 12, 'fontweight', 'b', 'fontname', 'arial')

figure
hold all
plot(res.t, T(:, end) - 273, 'LineWidth' ,2)
plot(res.t, T(:, round(length(x)/2)) - 273, 'k--', 'LineWidth', 2)
plot(res.t, T(:, 1) - 273, 'm:', 'LineWidth', 2)
legend('Surface', 'Surface/2', 'Center')
xlabel('Time (s)', 'fontsize', 12, 'fontweight', 'b', 'fontname', 'arial')
ylabel('Temperature (°C)', 'fontsize', 12, 'fontweight', 'b', 'fontname', 'arial')
% axis([0 inf 20 inf])
set(gca, 'FontSize', 12, 'fontweight', 'b', 'fontname', 'arial')

% figure
% hold all
% plot(res.t, T(:, end) -  P.Tb, 'LineWidth' ,2)
% plot(res.t, T(:, round(length(x)/2)) -  P.Tb, 'k--', 'LineWidth', 2)
% plot(res.t, T(:, 1) -  P.Tb, 'm:', 'LineWidth', 2)
% legend('Surface', 'Surface/2', 'Center')
% xlabel('Time (s)', 'fontsize', 12, 'fontweight', 'b', 'fontname', 'arial')
% ylabel('T_s - T_b (°C)', 'fontsize', 12, 'fontweight', 'b', 'fontname', 'arial')
% % axis([0 inf 20 inf])
% set(gca, 'FontSize', 12, 'fontweight', 'b', 'fontname', 'arial')