% Especificaciones 
Op = 1; Os = 2; Ap = 3; As = 16;
[n , Wn] = buttord(Op, Os, Ap, As, 's');
[Bn, An] = butter(n, Wn, 's');
[Hn, Wn] = freqs(Bn, An, 500);
plot(Wn, 20*log10(abs(Hn))); axis([0, 2, -16, 5]); grid;
pause;

FD = 2000*pi;
[B, A] = lp2lp(Bn, An, FD);
[H, W] = freqs(B, A, 500);
figure;
plot(W, 20*log10(abs(H))); axis([0, 12566, -16, 5]); grid;

pause; close all;
