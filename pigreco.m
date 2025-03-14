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
for n=2:200
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
for n=2:10000
    c=(4^(1-n))*(z(n))^2; %ultima parte dentro le radici
    inner_sqrt=sqrt(1-c); %radice interna 
    z(n+1) = (2^(n-0.5))*sqrt(1-inner_sqrt); 
    %ci sarà un motivo se inner_sqrt viene isolata -> analisi se si
    %avvicina a 1 -> cancellazione numerica
end
rel_err_z=abs(z-pi)/pi;
fprintf('\n')





%alg3 (simil alg2?)
y(1)=1;
y(2)=2;
for n=2:200
    num=(2^(1/2)) * abs(y(n));
    %sqrt(2) * abs(y(n));
    c=(4^(1-n)) *(y(n))^2;
    inner_sqrt=sqrt(1-c);
    %fin ora ho: sqrt(1-(4^(1-n)) * (y(n))^2
    den = sqrt(1+inner_sqrt);
    %ora ho: sqrt(1 + sqrt(1-(4^(1-n)) * (y(n))^2)
    y(n+1)=num/den;
end
%num -> deriva dalla riscrittura della formula originale per semplificare divisioni e radici quadrate, garantendo stabilità numerica durante le iterazioni.
rel_err_y=abs(y-pi)/pi;

%plot semilogy
semilogy(1:length(u), rel_err_u, 'k.'); %asse y in log e asse x in scala lineare
hold on; %hold on serve per mantenere il grafico attuale e permettere di aggiungere nuovi elementi senza cancellarlo
semilogy(1:length(z),rel_err_z, 'm+');
semilogy(1:length(y),rel_err_y,'ro');
hold off;


%Un errore di 10^-15 indica che l'algoritmo ha raggiunto il limite fisico della precisione numerica del calcolatore, mentre un errore di 
%10^0 segnala un fallimento totale dovuto a instabilità. La differenza sta nella capacità dell'algoritmo di controllare gli errori anziché lasciarli dominare.

%quindi l'alg 3 da il migliore risultato -> sistemato dal punto di vista di
%cancellazione numerica
