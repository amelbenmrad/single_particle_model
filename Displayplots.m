C1 = sol(:,:,1);      % t,r,uk
C2 = sol(:,:,2);
T = sol(:,:,3);
r_pol = sol(:,:,4); % [m]

%% Rayon de la particule
figure
hold all
plot(t,P.r_pol0+sum(r_pol-x,2),'LineWidth',2)
xlabel('Time (s)','fontsize',12,'fontweight','b','fontname','arial')
ylabel('Particle radius (m)','fontsize',12,'fontweight','b','fontname','arial')
% axis([0 inf 20 inf])
set(gca,'FontSize',12,'fontweight','b','fontname','arial')

%% %%%DISPLAYPLOTS CONCENTRATION ETHYLENE%%%%%
% 3D surface plot
% figure
% surf(x*1e6,t,C1,'edgecolor','none');
% xlabel('Particle radius (µm)','fontsize',12,'fontweight','b','fontname','arial')
% ylabel('Time (s)','fontsize',12,'fontweight','b','fontname','arial')
% zlabel('Ethylene concentration (mol m^{-3})','fontsize',12,'fontweight','b','fontname','arial')
% axis([0 inf 0 inf 0 inf])
% set(gcf(), 'Renderer', 'painters')
% set(gca,'FontSize',12,'fontweight','b','fontname','arial')

% 2D line plot
figure
hold all
plot(x*1e6,C1(find(t==1),:),'LineWidth',2)
plot(x*1e6,C1(find(t==5),:),'k--','LineWidth',2)
plot(x*1e6,C1(find(t==10),:),'m:','LineWidth',2)
plot(x*1e6,C1(find(t==100),:),'g','LineWidth',2)
legend('t = 1 s','t = 5 s', 't = 10 s','t = 100 s')
xlabel('Particle radius (µm)','fontsize',12,'fontweight','b','fontname','arial')
ylabel('Ethylene concentration (mol m^{-3})','fontsize',12,'fontweight','b','fontname','arial')
axis([0 inf 0 inf])
set(gca,'FontSize',12,'fontweight','b','fontname','arial')

figure
hold all
plot(t,C1(:,end),'LineWidth',2)
plot(t,C1(:,round(length(x)/2)),'k--','LineWidth',2)
plot(t,C1(:,1),'m:','LineWidth',2)
legend('R', 'R/2','Center')
xlabel('Time (s)','fontsize',12,'fontweight','b','fontname','arial')
ylabel('C1','fontsize',12,'fontweight','b','fontname','arial')
% axis([0 inf 20 inf])
set(gca,'FontSize',12,'fontweight','b','fontname','arial')
%% %%%DISPLAYPLOTS CONCENTRATION ICA%%%%%
% 3D surface plot
% figure
% surf(x*1e6,t,C2,'edgecolor','none');
% xlabel('Particle radius (µm)','fontsize',12,'fontweight','b','fontname','arial')
% ylabel('Time (s)','fontsize',12,'fontweight','b','fontname','arial')
% zlabel('ICA concentration (mol m^{-3})','fontsize',12,'fontweight','b','fontname','arial')
% axis([0 inf 0 inf 0 inf])
% set(gcf(), 'Renderer', 'painters')
% set(gca,'FontSize',12,'fontweight','b','fontname','arial')

% 2D line plot
figure
hold all
plot(x*1e6,C2(find(t==1),:),'LineWidth',2)
plot(x*1e6,C2(find(t==5),:),'LineWidth',2)
plot(x*1e6,C2(find(t==10),:),'k--','LineWidth',2)
plot(x*1e6,C2(find(t==100),:),'m:','LineWidth',2)
legend('t = 1 s','t = 5 s', 't = 10 s','t = 100 s')
xlabel('Particle radius (µm)','fontsize',12,'fontweight','b','fontname','arial')
ylabel('ICA concentration (mol m^{-3})','fontsize',12,'fontweight','b','fontname','arial')
axis([0 inf 0 inf])
set(gca,'FontSize',12,'fontweight','b','fontname','arial')

figure
hold all
plot(t,C2(:,end),'LineWidth',2)
plot(t,C2(:,round(length(x)/2)),'k--','LineWidth',2)
plot(t,C2(:,1),'m:','LineWidth',2)
legend('R', 'R/2','Center')
xlabel('Time (s)','fontsize',12,'fontweight','b','fontname','arial')
ylabel('C2','fontsize',12,'fontweight','b','fontname','arial')
% axis([0 inf 20 inf])
set(gca,'FontSize',12,'fontweight','b','fontname','arial')

%% %%%DISPLAYPLOTS TEMPERATURE%%%%%

% 3D surface plot
% figure
% surf(x*1e6,t,T,'edgecolor','none');
% xlabel('Particle radius x (µm)','fontsize',12,'fontweight','b','fontname','arial')
% ylabel('Time (s)','fontsize',12,'fontweight','b','fontname','arial')
% zlabel('Temperature (K)','fontsize',12,'fontweight','b','fontname','arial')
% axis([0 inf 0 inf 0 inf])
% set(gcf(), 'Renderer', 'painters')
% set(gca,'FontSize',12,'fontweight','b','fontname','arial')

% 2D line plot
figure
hold all
plot(x*1e6,T(find(t==1),:)-273,'LineWidth',2)
plot(x*1e6,T(find(t==5),:)-273,'k--','LineWidth',2)
plot(x*1e6,T(find(t==10),:)-273,'m:','LineWidth',2)
plot(x*1e6,T(find(t==100),:)-273,'g:','LineWidth',2)
legend('t = 1 s','t = 5 s', 't = 10 s','t = 100 s')
xlabel('Particle radius (µm)','fontsize',12,'fontweight','b','fontname','arial')
ylabel('Temperature (°C)','fontsize',12,'fontweight','b','fontname','arial')
% axis([0 inf 80 90])
set(gca,'FontSize',12,'fontweight','b','fontname','arial')


%% 2D line plot
figure
hold all
plot(t,T(:,end)-273,'LineWidth',2)
plot(t,T(:,round(length(x)/2))-273,'k--','LineWidth',2)
plot(t,T(:,1)-273,'m:','LineWidth',2)
legend('Surface', 'Surface/2','Center')
xlabel('Time (s)','fontsize',12,'fontweight','b','fontname','arial')
ylabel('Temperature (°C)','fontsize',12,'fontweight','b','fontname','arial')
% axis([0 inf 20 inf])
set(gca,'FontSize',12,'fontweight','b','fontname','arial')