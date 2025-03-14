% Calcolo in avanti (da I1 a I100)
I0 = exp(-1)*(exp(1) - 1);  % Inizializza I0
s = zeros(1, 100);          % Crea un vettore per I1-I100
s(1) = 1 - 1 * I0;          % Calcola I1 (n=1)
for n = 2:100
    s(n) = 1 - n * s(n-1);  % Calcola I2-I100
end

% Calcolo all'indietro (da I1000 a I1)
I_backward = zeros(1, 1000); % Crea un vettore per I1-I1000
I_backward(1000) = 0;        % Inizializza I1000
for n = 1000:-1:2            % Ciclo all'indietro (passo -1)
    I_backward(n-1) = (1 - I_backward(n)) / n; % Calcola In-1
end
t = I_backward(1:100);       % Estrae I1-I100

% Grafico semilogaritmico
figure;
semilogy(1:100, s, 'k.', 'DisplayName', 'In avanti');
hold on;
semilogy(1:100, t, 'm+', 'DisplayName', 'All''indietro');
xlabel('n');
ylabel('I_n (scala log)');
title('Confronto tra i due metodi');
legend('show');
grid on;