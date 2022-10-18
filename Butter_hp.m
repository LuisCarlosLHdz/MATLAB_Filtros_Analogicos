% Especificaciones 
wp=0.77*pi; ws = 0.9*pi;
Op = 2*(tan(wp/2)); Os = 2*(tan(ws/2)); Ap = 1; As = 14;
[n , Wn] = buttord(Op, Os, Ap, As, 's');
[Bn, An] = butter(n, Wn, 's');
[Hn, Wn] = freqs(Bn, An, 500);
plot(Wn, 20*log10(abs(Hn))); 

[Bhn, Ahn] = lp2hp(Bn, An, 1);
[Hhn, Whn] = freqs(Bhn, Ahn, 500);
figure;
plot(Whn, 20*log10(abs(Hhn))); 

[Bh, Ah] = lp2lp(Bhn, Ahn, 6000*pi);
[Hh, Wh] = freqs(Bh, Ah, 500);
figure;
plot(Wh/(2*pi), 20*log10(abs(Hh))); 