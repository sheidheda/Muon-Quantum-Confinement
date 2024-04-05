clear
clc
mp = 1.672623e-21;
m0 = 9.1093837e-31;
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

meInN = 0.12;
epsInN = 15.3;
mhInN = 1.63;
%%%%%%% electron and hole mass when using muon %%%%%%
%%%% electron %%%%
meInNu = meInN*206.7682830;
%%%% hole %%%%%
mhInNu = meInN*186;
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
mrInNe = mrInN * m0;
%%%%%%%%%% calculating reduced mass muonic hydrogen %%%%%%
mruInN = (meInNu * mhInNu)/(meInNu + mhInNu);
%%%%%%%%%% mr for muon%%%%%%
mrInNu = mruInN * m0;

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
ReInN = linspace(1e-9,a0uInN,100);
%%%%%%%%%%% R for muon %%%%%%%%
RuInN = linspace(1e-9,a0uInN,100);
%%%%%%%%%% E0eRe for electron %%%%%%
E0eReInN = E0eInN .* (a0eInN./ReInN).^2;
%%%%%%%%%% E0uRu for muon %%%%%%
E0uRuInN = E0uInN .* (a0uInN./RuInN).^2;
%plot(ReInN,E0eReInN/e0,'r',ReGaN,E0eReGaN/e0,'b',ReAlN,E0eReAlN/e0,'g',ReBN,E0eBN/e0,'k');
plot(ReInN,E0eReInN/e0,'r');
%%%%%%% muon lifetime tauu %%%%%%%%%%
tauInNu = (RuInN * mrInNu)./sqrt(2*mrInN*E0uInN);
%%tauReInN = tauInNu * (RuInN./a0uInN);
%%plot (RuInN,tauInNu);
delT = (hbar)./ (2 *  E0uRuInN);
goodplot
