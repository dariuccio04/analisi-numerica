%esercizio lab1
%che errore mi da se metto I(1) fuori? %Errore nell'assegnazione di I(1) fuori dal ciclo: Se metti I(1) fuori dal ciclo, e poi nel ciclo cerchi di aggiornare I(n+1) per n = 1, 2, ..., 100, probabilmente stai cercando di usare un array che non è stato allocato correttamente
%I(1)=exp(-1) *(exp(1)-1);
%for n=1:100
%    I(n+1) = 1-(n+1)*I(n);
%end
%s = I(n);

%I(1000)=0;
%for n=1000:0
%    I(n-1)=(1-I(n))/n;
%end
%t = I(n);

%semilogy(0:1000, s, 'k.');
%semilogy(0:1000, t, 'm+');

% Esercizio lab1: Successione in avanti e all'indietro
% Calcolare In per n = 1:100 mediante la successione in avanti
% I0 = e^(1) * (e - 1)
% In+1 = 1 - (n+1) * In
% Successione all'indietro:
% I1000 = 0
% In-1 = (1 - In) / n

% Esercizio lab1: Successione in avanti e all'indietro
% Calcolare In per n = 1:100 mediante la successione in avanti
% I0 = e^(1) * (e - 1)
% In+1 = 1 - (n+1) * In
% Successione all'indietro:
% I1000 = 0
% In-1 = (1 - In) / n

% Successione in avanti
I(1) = exp(-1) * (exp(1) - 1);  % Inizializza I(1)

% Calcolo della successione in avanti
for n = 1:100
    I(n + 1) = 1 - (n + 1) * I(n);  % Successione in avanti
end
s = I(1:100);  % Salva i valori della successione in avanti

% Successione all'indietro
I(1000) = 0;  % Inizializza I1000
for n = 1000:-1:2  % Partiamo da 1000 e scendiamo fino a 2
    I(n - 1) = (1 - I(n)) / n;  % Successione all'indietro
end
t = I(1:100);  % Salva i valori della successione all'indietro

% Creazione del grafico semilogaritmico
figure;  % Crea una nuova finestra grafica
semilogy(1:100, s, 'k.');  % Grafico della successione in avanti
hold on;  % Mantieni il grafico corrente
semilogy(1:100, t, 'm+');  % Grafico della successione all'indietro
xlabel('n');  % Etichetta dell'asse x
ylabel('I_n');  % Etichetta dell'asse y
legend('Successione in avanti', 'Successione all\indietro');  % Aggiungi la legenda
grid on;  % Aggiungi la griglia
