clear
clc


mp = 1.672623e-21;
m0 = 9.1093837e-31;
mpu = 1836 * m0;
e0 = 1.60217663e-19;
hbar = 1.054571817e-34;
h = 6.626e-34;
m0u = m0 * 206.7682830;
c = 299792458;
nano = 1e9;
pico = 1e12;
pi= 3.142;
eps0 = 8.85418782e-12;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%   band parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
meInN = 0.12*m0;
epsInN = 15.3;
mhInN = 1.63*m0;
%%%%%%% electron and hole mass when using muon %%%%%%
%%%% electron %%%%
meInNu = meInN*206;
%%%% hole %%%%%
mhInNu = meInN*1836;
%%%%%%%%%% reduced mass in free space%%%%%%%%
mr0 = (m0*mp)/(m0+mp);
mr0u = 186*m0;
%%%%%%%%%%% bohr radii in free space%%%%%%%%
a0 = (4*pi*eps0*hbar^2)/(mr0*e0^2);
a0u = (4*pi*eps0*hbar^2)/(mr0u*e0^2);
%%%%%%%%%%% Energy in free space%%%%%%%%%%%%
E0 = (mr0*e0^4)/(8*eps0^2*h^2);
E0u = (mr0u*e0^4)/(8*eps0^2*h^2);
%%%%%%%%%% calculating reduced mass electronic hydrohen %%%%%%
mrInN = (meInN * mhInN)/(meInN + mhInN);
%%%%%% mr for electrons %%%%%%%%%%
mrInNe = mrInN ;
%%%%%%%%%% calculating reduced mass muonic hydrogen %%%%%%
mruInN = (meInNu * mhInNu)/(meInNu + mhInNu);
%%%%%%%%%% mr for muon%%%%%%
mrInNu = mruInN ;
%%%%%%% calculating electron bohr radius a0e  %%%%%%%
a0eInN = (4*pi*eps0*epsInN*hbar^2)/(mrInNe*e0^2);
%%%%%%%% calculating muon bohr radius a0u %%%%%%%%%
a0uInN = (4*pi*eps0*epsInN*hbar^2)/(mrInNu*e0^2);
%%%%%%%%%%%%% calculating ground state rydberg energy E0 %%%%%%%%%%%%
%%%%%%%%%% for electron E0e %%%%%%%%%%%%%%
E0eInN = (hbar^2)/(2*mrInNe*a0eInN^2); 
%%%%%%%%%% for muon E0u %%%%%%%%%%%%%%%%%
E0uInN = (hbar^2)/(2*mrInNu*a0uInN^2);
%%%%%%%%%%%% R for electron %%%%%%%%
ReInN = linspace(1e-9,a0eInN,100);
%%%%%%%%%%% R for muon %%%%%%%%
RuInN = linspace(1e-9,a0uInN,100);
%%%%%%%%%% E0eRe for electron %%%%%%
E0eReInN = E0eInN .* (a0eInN./ReInN).^2;
%%%%%%%%%% E0uRu for muon %%%%%%
E0uRuInN = E0uInN .* (a0uInN./RuInN).^2;

%%%%% plot for energy %%%%%%%%%%%
%plot(ReInN*1e9,E0eReInN/e0,'black', 'LineWidth',3);hold on
%plot(RuInN*1e9,E0uRuInN/e0,'r','LineWidth',3)
%ylabel('Confinement Energy (eV)')
%xlabel('R (nm) ')
%legend('E_0''E_0_\mu')

%%%%%%% lifetime tauu %%%%%%%%%%
%%%% in vacuum %%%%%
Rcm = linspace(1e-9,a0,100);
tau = (Rcm * mr0)./sqrt(2*mr0*E0);

%%%muon%%%
Rcmu = linspace(1e-9,a0u,100);
tauu = (Rcmu * mr0u)./sqrt(2*mr0u*E0u);

%%%%% plot for tau in free space%%%
%plot (Rcm,tau*1e12, 'b');hold on
%plot (Rcmu,tauu*1e12,'r')

%%%%%%% tau in material%%%%%
tauInNe = (ReInN * mrInNe)./sqrt(2*mrInNe*E0eInN);
tauInNu = (RuInN * mrInNu)./sqrt(2*mrInNu*E0uInN);

%%%%plot for tau in material%%%
plot (ReInN*1e9,tauInNe*1e12, 'black', 'LineWidth',3);hold on
plot (RuInN*1e9,tauInNu*1e12, 'r', 'LineWidth',3)
ylabel('LifeTime ''\tau_p_s')
xlabel('R (nm) ')
legend('\tau_0''\tau_0_\mu')

%ylabel('\tau''_p_s')
%xlabel('R')
%xlim([0 4e-9])


%%%%%%%% plot for bohr radius %%%%%%%
%plot(ReInN,a0eInN,'b');hold on
%plot(RuInN,a0uInN,'r')

goodplot
%xlim([0 5e-10])
