function D = decasteljau(b,t, korakov)
% Opis:
%   decasteljau  vrne  shemo  de  Casteljaujevega  postopka  za dan
%   seznam  koordinat b pri  danem  parametru t
%
% Definicija:
%   D = decasteljau(b,t)
%
% Vhodna  podatka:
%   b seznam  koordinat  kontrolnih  toèk  Bezierjeve  krivulje
% stopnje n,
%   t parameter , pri  katerem  raèunamo  koordinato
% Bezierjeve  krivulje
%   korakov - stevilo korakov, ki jih izvedemo
% 
% Izhodni  podatek:
%   D tabela  velikosti n+1 x n+1, ki  predstavlja  de
% Casteljaujevo  shemo  za  koordinate b pri  parametru t
% (element  na  mestu (1,n+1) je  koordinata  Bezierjeve
% krivulje  pri  parametru t, elementi  na  mestih (i,j)
% za i > n-j+2 so NaN)

%n = length(b') - 1;
n = size(b);
n = n(1);

for i=1:korakov
    vrstic = size(b);
    vrstic = vrstic(1);
    NB = [];
    for j=1:vrstic - 1
        tocka = (1-t).*b(j,:) + t.*b(j+1,:);
        NB = [NB; tocka];
    end
    b = NB;
end
D = b;
end 