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
meGaN = 0.15;
meInN = 0.12;
meBN = 0.74;
meAlN = 0.25;
epsGaN = 9.7;
epsBN = 7.1;
epsAlN = 9.4;
epsInN = 15.3;
mhGaN = 1.3;
mhBN = 0.90;
mhInN = 1.63;
mhAlN = 1.02;
%%%%%%%%%% calculating reduced mass %%%%%%
mrInN = (meInN * mhInN)/(meInN + mhInN);
mrGaN = (meGaN * mhGaN)/(meGaN + mhGaN);
mrBN = (meBN * mhBN)/(meBN + mhBN);
mrAlN = (meAlN * mhAlN)/(meAlN + mhAlN);
%%%%%% mr for electrons %%%%%%%%%%
mrInNe = mrInN * m0;
mrGaNe = mrGaN * m0;
mrBNe = mrBN * m0;
mrAlNe = mrAlN * m0;
%%%%%%% mr for muon %%%%%%%%
mrInNu = mrInN * m0u;
mrGaNu = mrGaN * m0u;
mrBNu = mrBN * m0u;
mrAlNu = mrAlN * m0u;
%%%%%%% calculating electron bohr radius a0e  %%%%%%%
a0eInN = (4*pi*eps0*epsInN*hbar^2)/(mrInNe*e0^2);
a0eGaN = (4*pi*eps0*epsGaN*hbar^2)/(mrGaNe*e0^2);
a0eBN = (4*pi*eps0*epsBN*hbar^2)/(mrBNe*e0^2);
a0eAlN = (4*pi*eps0*epsAlN*hbar^2)/(mrAlNe*e0^2);
%%%%%%%% calculating muon bohr radius a0u %%%%%%%%%
a0uInN = (4*pi*eps0*epsInN*hbar^2)/(mrInNu*e0^2);
a0uGaN = (4*pi*eps0*epsGaN*hbar^2)/(mrGaNu*e0^2);
a0uBN = (4*pi*eps0*epsBN*hbar^2)/(mrBNu*e0^2);
a0uAlN = (4*pi*eps0*epsAlN*hbar^2)/(mrAlNu*e0^2);

%%%%%%%%%%%%% calculating ground state energy E0 %%%%%%%%%%%%
%%%%%%%%%% for electron E0e %%%%%%%%%%%%%%
E0eInN = (hbar^2)/(2*mrInNe*a0eInN^2);
E0eGaN = (hbar^2)/(2*mrGaNe*a0eGaN^2);
E0eBN = (hbar^2)/(2*mrBNe*a0eBN^2);
E0eAlN = (hbar^2)/(2*mrAlNe*a0eAlN^2);
%%%%%%%%%% for muon E0u %%%%%%%%%%%%%%%%%
E0uInN = (hbar^2)/(2*mrInNu*a0uInN^2);
E0uGaN = (hbar^2)/(2*mrGaNu*a0uGaN^2);
E0uBN = (hbar^2)/(2*mrBNu*a0uBN^2);
E0uAlN = (hbar^2)/(2*mrAlNu*a0uAlN^2);

