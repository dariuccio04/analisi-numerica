
%definite le var p,q,sol 
p=1000;
q=0.018000000081;
sol=0.9+10^(-5);

%alg1 per calcolo di -p + sqrt(p^2 + q)

s=p^2;
t=s+q;
% t = p^2+q

%verifico che t sia maggiore o uguale di 0, essendo la radice

if t >= 0
    u=sqrt(t);
    %allora mi salvo sqrt(p^2 + q) su u
else 
    fprintf('\n \t [RADICI COMPLESSE]');
end
%se andiamo avanti quindi t>=0 allora posso fare -p + sqrt(p^2 + q)
s1 = -p+u;
%fprintf('ok')


%alg2
%dichiarazione variabili
v = p+u; %cioè p + sqrt(p^2 + q), non dovrebbe essere p - sqrt(p^2 + q)?
t1= q/v; %cioè q/p + sqrt(p^2 + q) : post razionalizzato

fprintf( '\n \t [ALG.1]: %10.16f' ,s1);
fprintf( '\n \t [ALG.2]: %10.16f ',t1);
if (sol ~= 0)
 rerr1 =abs(s1-sol)/abs(sol);
 rerr2=abs(t1-sol)/abs(sol);
 fprintf( '\n \t [REL.ERR.ALG.1]: %2.2e ',rerr1);
 fprintf(' \n \t [REL.ERR.ALG.2]: %2.2e' ,rerr2);
end