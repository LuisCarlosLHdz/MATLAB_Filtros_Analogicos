% Pasabajas especificaciones
Op = 1000; Os = 2000; Ap = 3; As = 20;
% Normalizar las especificaciones
Opn = 1; Osn = 2;
% Cálculo del orden
[n, Wn] = buttord(Opn, Osn, Ap, As, 's');
[Bn, An] = butter(n, Wn, 's');
[B, A] = lp2lp(Bn, An, 1000);
[H, W] = freqs(B, A, 500); 
plot(W, 20*log10(abs(H))); axis([0, 2000, -20, 5]); grid;