% Especificaciones del filtro digital a diseñar
wp = 0.2*pi; ws = 0.3*pi; Ap = 1; As = 60;

% Predistorsionar las especificaciones
Op = 2*tan(wp/2); Os = 2*tan(ws/2);

% Diseño del filtro prototipo analógico
[n, wn] = cheb1ord(Op, Os, Ap, As, 's');
[B, A] = cheby1(n, Ap, wn, 's');
n
[H, W] = freqs(B, A, 500); 
plot(W, 20*log10(abs(H))); axis([0, Os, -As, 5]); grid;
pause;

% Aplicar la transformación bilineal
[Bz, Az] = bilinear(B, A, 1);
[Hz, Wz] = freqz(Bz, Az, 500); 
plot(Wz/pi, 20*log10(abs(Hz))); %axis([0, ws, -As, 5]); grid;
pause;
%close all;