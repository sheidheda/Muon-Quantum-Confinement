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
meGaN = 0.15*m0;
epsGaN = 9.7;
mhGaN = 1.3*m0;
%%%%%%% electron and hole mass when using muon %%%%%%
%%%% electron %%%%
meGaNu = meGaN*206;
%%%% hole %%%%%
mhGaNu = meGaN*1836;
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
mrGaN = (meGaN * mhGaN)/(meGaN + mhGaN);
%%%%%% mr for electrons %%%%%%%%%%
mrGaNe = mrGaN ;
%%%%%%%%%% calculating reduced mass muonic hydrogen %%%%%%
mruGaN = (meGaNu * mhGaNu)/(meGaNu + mhGaNu);
%%%%%%%%%% mr for muon%%%%%%
mrGaNu = mruGaN ;
%%%%%%% calculating electron bohr radius a0e  %%%%%%%
a0eGaN = (4*pi*eps0*epsGaN*hbar^2)/(mrGaNe*e0^2);
%%%%%%%% calculating muon bohr radius a0u %%%%%%%%%
a0uGaN = (4*pi*eps0*epsGaN*hbar^2)/(mrGaNu*e0^2);
%%%%%%%%%%%%% calculating ground state rydberg energy E0 %%%%%%%%%%%%
%%%%%%%%%% for electron E0e %%%%%%%%%%%%%%
E0eGaN = (hbar^2)/(2*mrGaNe*a0eGaN^2); 
%%%%%%%%%% for muon E0u %%%%%%%%%%%%%%%%%
E0uGaN = (hbar^2)/(2*mrGaNu*a0uGaN^2);
%%%%%%%%%%%% R for electron %%%%%%%%
ReGaN = linspace(1e-9,a0eGaN,100);
%%%%%%%%%%% R for muon %%%%%%%%
RuGaN = linspace(1e-9,a0uGaN,100);
%%%%%%%%%% E0eRe for electron %%%%%%
E0eReGaN = E0eGaN .* (a0eGaN./ReGaN).^2;
%%%%%%%%%% E0uRu for muon %%%%%%
E0uRuGaN = E0uGaN .* (a0uGaN./RuGaN).^2;

%plot(ReGaN*1e9,E0eReGaN/e0,'black', 'LineWidth',3);hold on
%plot(RuGaN*1e9,E0uRuGaN/e0,'r','LineWidth',3)
%ylabel('Confinement Energy (eV)')
%xlabel('R (nm) ')
%legend('E_0''E_0_\mu')

%%%%%%%  lifetime tauu %%%%%%%%%%
tauGaNe = (ReGaN * mrGaNe)./sqrt(2*mrGaNe*E0eGaN);
tauGaNu = (RuGaN * mrGaNu)./sqrt(2*mrGaNu*E0uGaN);


plot (ReGaN*1e9,tauGaNe*1e12, 'black', 'LineWidth',3);hold on
plot (RuGaN*1e9,tauGaNu*1e12, 'r', 'LineWidth',3)
ylabel('LifeTime ''\tau_p_s')
xlabel('R (nm) ')
legend('\tau_0''\tau_0_\mu')

goodplot
 