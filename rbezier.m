function b = rbezier(B,w,t)
% Opis:
%   rbezier  vrne  toèke  na  racionalni  Bezierovi  krivulji
%
% Definicija:
%   b = rbezier(B,w,t)
%
% Vhodni  podatki:
%   B   matrika  velikosti n+1 x d, v kateri  vsaka  vrstica
%   predstavlja  kontrolno  toèko  racionalne  Bezierjeve
%   krivulje  stopnje n v d-dimenzionalnem  prostoru ,
%   w   seznam  uteži  racionalne  Bezierjeve  krivulje ,
%   t   seznam  parametrov  dolžine N, za  katere  se  raèunajo
%   toèke  na  racionalni  Bezierjevi  krivulji
%
% Izhodni  podatek:
%   b   matrika  velikosti N x d, v kateri i-ta  vrstica
%   predstavlja  toèko  na  racionalni  Bezierjevi  krivulji
%   pri i-tem  parametru  iz  seznama t

b = [];

for i=1:length(t)
    tocka = rdecasteljau(B,w,t(i));
    b = [b; tocka];
end

end