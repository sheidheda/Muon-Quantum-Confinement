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
pi= 3.142;
eps0 = 8.85418782e-12;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%   band parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
meAlN = 0.25*m0;
epsAlN = 9.4;
mhAlN = 1.02*m0;
%%%%%%% electron and hole mass when using muon %%%%%%
%%%% electron %%%%
meAlNu = meAlN*206;
%%%% hole %%%%%
mhAlNu = meAlN*1836;
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
mrAlN = (meAlN * mhAlN)/(meAlN + mhAlN);
%%%%%% mr for electrons %%%%%%%%%%
mrAlNe = mrAlN ;
%%%%%%%%%% calculating reduced mass muonic hydrogen %%%%%%
mruAlN = (meAlNu * mhAlNu)/(meAlNu + mhAlNu);
%%%%%%%%%% mr for muon%%%%%%
mrAlNu = mruAlN ;
%%%%%%% calculating electron bohr radius a0e  %%%%%%%
a0eAlN = (4*pi*eps0*epsAlN*hbar^2)/(mrAlNe*e0^2);
%%%%%%%% calculating muon bohr radius a0u %%%%%%%%%
a0uAlN = (4*pi*eps0*epsAlN*hbar^2)/(mrAlNu*e0^2);
%%%%%%%%%%%%% calculating ground state rydberg energy E0 %%%%%%%%%%%%
%%%%%%%%%% for electron E0e %%%%%%%%%%%%%%
E0eAlN = (hbar^2)/(2*mrAlNe*a0eAlN^2); 
%%%%%%%%%% for muon E0u %%%%%%%%%%%%%%%%%
E0uAlN = (hbar^2)/(2*mrAlNu*a0uAlN^2);
%%%%%%%%%%%% R for electron %%%%%%%%
ReAlN = linspace(1e-9,a0eAlN,100);
%%%%%%%%%%% R for muon %%%%%%%%
RuAlN = linspace(1e-9,a0uAlN,100);
%%%%%%%%%% E0eRe for electron %%%%%%
E0eReAlN = E0eAlN .* (a0eAlN./ReAlN).^2;
%%%%%%%%%% E0uRu for muon %%%%%%
E0uRuAlN = E0uAlN .* (a0uAlN./RuAlN).^2;

%plot(ReAlN*1e9,E0eReAlN/e0,'black', 'LineWidth',3);hold on
%plot(RuAlN*1e9,E0uRuAlN/e0,'r','LineWidth',3)
%ylabel('Confinement Energy (eV)')
%xlabel('R (nm) ')
%legend('E_0''E_0_\mu')



%%%%%%% tau in material%%%%%
tauAlNe = (ReAlN * mrAlNe)./sqrt(2*mrAlNe*E0eAlN);
tauAlNu = (RuAlN * mrAlNu)./sqrt(2*mrAlNu*E0uAlN);

%%%%plot for tau in material%%%
plot (ReAlN*1e9,tauAlNe*1e12, 'black', 'LineWidth',3);hold on
plot (RuAlN*1e9,tauAlNu*1e12, 'r', 'LineWidth',3)
ylabel('LifeTime ''\tau_p_s')
xlabel('R (nm) ')
legend('\tau_0''\tau_0_\mu')

goodplot
