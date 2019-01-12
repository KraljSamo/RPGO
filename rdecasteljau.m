function b = rdecasteljau(B,w,t)
% Opis:
%   rdecasteljau  vrne  to�ko  na  racionalni  Bezierjevi
%   krivulji , ki je  izra�unana z de  Casteljaujevim
%   postopkom , prirejenim  za  racionalni  primer
%
% Definicija:
%   b = rdecasteljau(B,w,t)
%
% Vhodni  podatki:
%   B matrika , katere  vrstica  predstavlja  koordinate
%   kontrolne  to�ke  racionalne  Bezierjeve  krivulje ,
%   w seznam  ute�i  racionalne  Bezierjeve  krivulje ,
%   t �tevilo , ki  dolo�a  vrednost  delilnega  parametra v
%   de  Casteljaujevem  postopku
%
% Izhodni  podatek:
%   b vrstica , ki  predstavlja  to�ko  na  racionalni
%   Bezierjevi  krivulji  pri  parametru t

n = length(w);

for korak=1:n-1
    w2 = [];
    for j=1:n-korak
        w2 =[w2 (1-t)*w(j)+t*w(j+1)];
    end
    B2 = [];
    for i=1:n-korak
        dodaj = (1-t)*w(i)/w2(i).*B(i,:) + t*w(i+1)/w2(i).*B(i+1,:);
        B2 = [B2; dodaj];
    end
    B = B2;
    w = w2;  
end

b = B;

end