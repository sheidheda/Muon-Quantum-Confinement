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
meBN = 0.26*m0;
epsBN = 7.1;
mhBN = 0.90*m0;
%%%%%%% electron and hole mass when using muon %%%%%%
%%%% electron %%%%
meBNu = meBN*206;
%%%% hole %%%%%
mhBNu = meBN*1836;
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
mrBN = (meBN * mhBN)/(meBN + mhBN);
%%%%%% mr for electrons %%%%%%%%%%
mrBNe = mrBN ;
%%%%%%%%%% calculating reduced mass muonic hydrogen %%%%%%
mruBN = (meBNu * mhBNu)/(meBNu + mhBNu);
%%%%%%%%%% mr for muon%%%%%%
mrBNu = mruBN ;
%%%%%%% calculating electron bohr radius a0e  %%%%%%%
a0eBN = (4*pi*eps0*epsBN*hbar^2)/(mrBNe*e0^2);
%%%%%%%% calculating muon bohr radius a0u %%%%%%%%%
a0uBN = (4*pi*eps0*epsBN*hbar^2)/(mrBNu*e0^2);
%%%%%%%%%%%%% calculating ground state rydberg energy E0 %%%%%%%%%%%%
%%%%%%%%%% for electron E0e %%%%%%%%%%%%%%
E0eBN = (hbar^2)/(2*mrBNe*a0eBN^2); 
%%%%%%%%%% for muon E0u %%%%%%%%%%%%%%%%%
E0uBN = (hbar^2)/(2*mrBNu*a0uBN^2);
%%%%%%%%%%%% R for electron %%%%%%%%
ReBN = linspace(1e-9,a0eBN,100);
%%%%%%%%%%% R for muon %%%%%%%%
RuBN = linspace(1e-9,a0uBN,100);
%%%%%%%%%% E0eRe for electron %%%%%%
E0eReBN = E0eBN .* (a0eBN./ReBN).^2;
%%%%%%%%%% E0uRu for muon %%%%%%
E0uRuBN = E0uBN .* (a0uBN./RuBN).^2;

%plot(ReBN*1e9,E0eReBN/e0,'black', 'LineWidth',3);hold on
%plot(RuBN*1e9,E0uRuBN/e0,'r','LineWidth',3)
%ylabel('Confinement Energy (eV)')
%xlabel('R (nm) ')
%legend('E_0''E_0_\mu')

%%%%%%% tau in material%%%%%
tauBNe = (ReBN * mrBNe)./sqrt(2*mrBNe*E0eBN);
tauBNu = (RuBN * mrBNu)./sqrt(2*mrBNu*E0uBN);

%%%%plot for tau in material%%%
plot (ReBN*1e9,tauBNe*1e12, 'black', 'LineWidth',3);hold on
plot (RuBN*1e9,tauBNu*1e12, 'r', 'LineWidth',3)
ylabel('LifeTime ''\tau_p_s')
xlabel('R (nm) ')
legend('\tau_0''\tau_0_\mu')

goodplot
