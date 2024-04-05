clear
clc

m0 = 9.1093837e-31;
e0 = 1.60217663e-19;
hbar = 1.054571817e-34;
m0u = m0 * 206.7682830;
c = 299792458;
pi= 3.142;
eps0 = 8.85418782e-12;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%   band parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
meInN = 0.12;
epsInN = 15.3;
mhInN = 1.63;
%%%%%%%%%% calculating reduced mass %%%%%%
mrInN = (meInN * mhInN)/(meInN + mhInN);
%%%%%% mr for electrons %%%%%%%%%%
mrInNe = mrInN * m0;
%%%%%%% mr for muon %%%%%%%%
mrInNu = mrInN * m0u;
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
%plot(ReInN,E0eReInN/e0,'r');
%plot(ReInN,E0eReInN/e0,'r',RuInN,E0uRuInN/e0,'b');
%%%%%%% muon lifetime tauu %%%%%%%%%%
%%tauReInN = tauInNu * (RuInN./a0uInN);
%%plot (RuInN,tauInNu);
tauInNe = (hbar)./ (2*E0eReInN);
plot (ReInN,tauInNe);
goodplot
