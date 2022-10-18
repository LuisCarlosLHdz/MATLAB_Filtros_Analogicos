% Especificaciones filtro pasabanda
BW=20; BWs=40; Ap=3; As=15; wo=1000;

% Obtención del pasabajas normalizado
[n, wn]=buttord(1, BWs/BW, Ap, As, 's');
[Bln, Aln]=butter(n, wn, 's');

% Desnormalizando el pasabajas
[Bl, Al]=lp2lp(Bln, Aln, BW/wo);

% Aplicando la transformación lp2bp
[Bn, An]=lp2bp(Bl, Al, 1, 1);

% Desnormalizando el pasabanda
[B, A]=lp2lp(Bn, An, wo);

% Obteniendo la función de respuesta en frecuencia
[H, W]=freqs(B, A, 5000);
plot(W, 20*log10(abs(H)));
pause;
figure;
plot(W, 20*log10(abs(H))); axis([980 1020 -15 5]);
pause;
figure;
plot(W, 20*log10(abs(H))); axis([990 1010 -3 5]);
pause;


[Hln, Wln]=freqs(Bln, Aln, 5000);
[Hl, Wl]=freqs(Bl, Al, 5000);
[Hn, Wn]=freqs(Bn, An, 5000);
[H, W]=freqs(B, A, 5000);

figure;
subplot(2,2,1); plot(Wln, 20*log10(abs(Hln))); axis([0 5 -15 5]);
subplot(2,2,2); plot(Wl, 20*log10(abs(Hl))); axis([0 .05 -15 5]);
subplot(2,2,3); plot(Wn, 20*log10(abs(Hn))); axis([.9 1.1 -15 5]);
subplot(2,2,4); plot(W, 20*log10(abs(H))); axis([900 1100 -15 5]);
pause;
close all