% Especificaciones 
BWp = 7; BWs = 10; Oc = 85; Ap = 1; As = 57;
% Pasabajas normalizado
[n , Wn] = ellipord(1, BWs/BWp, Ap, As, 's');
[Blpn, Alpn] = ellip(n, Ap, As, Wn, 's');
[Hlpn, Wlpn] = freqs(Blpn, Alpn, 500);
figure
plot(Wlpn, 20*log10(abs(Hlpn))); axis([0, 2, -As, 5]); grid;
% Pasabajas desnormalizado
[Blp, Alp] = lp2lp(Blpn, Alpn, BWp/Oc);
[Hlp, Wlp] = freqs(Blp, Alp, 500);
figure
plot(Wlp, 20*log10(abs(Hlp))); axis([0, .2, -As, 5]); grid;
% TRansformando de pasabajas a pasabanda
[Bbpn, Abpn] = lp2bp(Blp, Alp, 1, 1);
[Hbpn, Wbpn] = freqs(Bbpn, Abpn, 500);
figure;
plot(Wbpn, 20*log10(abs(Hbpn))); axis([.5, 1.5, -As, 5]); grid; pause;
% Transformación pasabajas pasabajas
[Bbp, Abp] = lp2lp(Bbpn, Abpn, Oc);
[Hbp, Wbp] = freqs(Bbp, Abp, 1000);
figure;
plot(Wbp, 20*log10(abs(Hbp))); axis([75, 95, -70, 5]); grid;

pause;

%[n , Wn] = ellipord(1, BWs/BWp, Ap, As, 's');
%[Blpn, Alpn] = ellip(n, Ap, As, Wn, 's');
%[Hlpn, Wlpn] = freqs(Blpn, Alpn, 500);
%plot(Wlpn, 20*log10(abs(Hlpn))); %axis([0, 2, -As, 5]); grid;
%pause;
