%pigreco
%confronto tra i due metodi: problema di basilea e l'altro 
%alg1
%il termine u_(n+1) servirà sicuramente per correggere il risultato del
%problema di basilea: pi^2 / 6, infatti è sqrt(6*s(n+1)), s(n+1) andrà a
%pi^2/6
s(1) = 1;
u(1) = 1;
s(2) = 1.25;  %1 + 1/4;
u(2) = s(2);
%itero fino a 40
for n=2:40
    s(n+1) = s(n)+(n+1)^(-2);
    u(n+1) = sqrt(6*s(n+1));
end


%si presuppone che u tenderà al valore di pi, calcolo l'errore relativo
rel_err_u=abs(u-pi)/pi;
fprintf('\n');



%alg2
format long %maggiore accuratezza
z(1)=1;
z(2)=2;
for n=2:40
    c=(4^(1-n))*(z(n))^2; %ultima parte dentro le radici
    inner_sqrt=sqrt(1-c); %radice interna 
    z(n+1) = (2^(n-0.5))*sqrt(1-inner_sqrt); 
    %ci sarà un motivo se inner_sqrt viene isolata -> analisi se si
    %avvicina a 1 -> cancellazione numerica
end
rel_err_z=abs(z-pi)/pi;
fprintf('\n')