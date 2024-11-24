tic
% Parameters
kappar = 0.5;           % Speed of mean reversion
thetar = 0.04;          % Long-term mean interest rate
sigmar = 0.003;          % Volatility
r0 = 0.0525;            % Initial interest rate
T = 5;                % Total time in years
N = 20000;              % Number of time steps
M=1000000;
dt = T/N;              % Time step size
excessreturn=0.05;
sigmaS=0.18;
lambdac=0.1;

V0=1.1;
muV=0.08;
sigmaV=0.2;
gam=0.005;
betta=gam*0.01;
ug=0.03;
lg=-0.03;
uc=0.05;
lc=-0.15;


greeniums=zeros(2,11);
prices=zeros(4,11);
for nn=1:11
Eg0=0;
Eg1=0;
Egn1=0;
Ec1=0;
Ecn1=0;
lambdag=(nn-1)*0.02;
parfor n=1:M
% Initialize the rate vector
r = r0;
rint=0;
int=0;
tg=exprnd(1/lambdag);
tc=exprnd(1/lambdac);
G=0;
V=V0;

% Generate the interest rate path
for i = 2:(N+1)
    r = r + kappar * (thetar - r) * dt + sigmar * sqrt(dt) * randn();
    rint=rint+r*dt;
    int=int+dt*(excessreturn/(sigmaS*sqrt(r/r0)))^2;
    if (i*dt)>tc && (i*dt)>tg
        tc=tc+exprnd(1/lambdac);
        tg=T+1;
        G=1;
        V = V + V*(muV * dt + sigmaV *sqrt(r/r0)* sqrt(dt) * randn()+((ug-lg)*rand()+lg)*((uc-lc)*rand()+lc));
        
    elseif (i*dt)>tc && (i*dt)<tg
        tc=tc+exprnd(1/lambdac);
        V = V + V*(muV * dt + sigmaV *sqrt(r/r0)* sqrt(dt) * randn()+(uc-lc)*rand()+lc);
        
    elseif (i*dt)<tc && (i*dt)>tg
        G=1;
        tg=T+1;
        V = V + V*(muV * dt + sigmaV *sqrt(r/r0)* sqrt(dt) * randn()+(ug-lg)*rand()+lg);
    end
    V = V + V*(muV * dt + sigmaV *sqrt(r/r0)* sqrt(dt) * randn());
end
D=exp(-rint);

Eg0=Eg0+exp(-0.5*int);
Eg1=Eg1+exp(-0.5*int)*exp(-gam*D*1000*min(V,1)-betta*1000*(1-G));
Egn1=Egn1+exp(-0.5*int)*exp(gam*D*1000*min(V,1)+betta*1000*(1-G));
Ec1=Ec1+exp(-0.5*int)*exp(-gam*D*1000*min(V,1));
Ecn1=Ecn1+exp(-0.5*int)*exp(gam*D*1000*min(V,1));
end
Eg0=Eg0/M;
Eg1=Eg1/M;
Egn1=Egn1/M;
Ec1=Ec1/M;
Ecn1=Ecn1/M;
pg1=(1/gam)*log(Eg0/Eg1);
pgn1=(-1/gam)*log(Eg0/Egn1);
pc1=(1/gam)*log(Eg0/Ec1);
pcn1=(-1/gam)*log(Eg0/Ecn1);

%greenium 
greeniums(1,nn)=(1000/pg1)^(1/T)-(1000/pc1)^(1/T);
greeniums(2,nn)=(1000/pgn1)^(1/T)-(1000/pcn1)^(1/T);
prices(1,nn)=pg1;
prices(2,nn)=pgn1;
prices(3,nn)=pc1;
prices(4,nn)=pcn1;
end
toc


save g1 greeniums prices