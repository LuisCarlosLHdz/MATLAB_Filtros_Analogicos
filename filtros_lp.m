% Especificaciones 
Op = 1; Os = 1.2; Ap = 3; As = 65;

% Butterworth
[nb , Wn] = buttord(Op, Os, Ap, As, 's');
[Bn, An] = butter(nb, Wn, 's');
[Hn, Wn] = freqs(Bn, An, 500);
nb
plot(Wn, 20*log10(abs(Hn))); axis([0, Os, -As, 5]); grid;
pause;

% Chebyshev
[nc , Wn] = cheb1ord(Op, Os, Ap, As, 's');
[Bn, An] = cheby1(nc, Ap/2, Wn, 's');
[Hn, Wn] = freqs(Bn, An, 500);
nc
plot(Wn, 20*log10(abs(Hn))); axis([0, Os, -As, 5]); grid;
pause;

% Elíptica
[ne , Wn] = ellipord(Op, Os, Ap, As, 's');
[Bn, An] = ellip(ne, Ap, As, Wn, 's');
[Hn, Wn] = freqs(Bn, An, 500);
ne
plot(Wn, 20*log10(abs(Hn))); axis([0, Os, -As, 5]); grid;

pause; close all;
