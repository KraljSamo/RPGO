function  Be = bezierelv(B,k)
% Opis:
%   bezierelv  izvede  visanje  stopnje  dane  Bezierjeve  krivulje
%
% Definicija:
%   Be = bezierelv(B,k)
%
% Vhodna  podatka:
%   Bmatrika  velikosti (n+1) x d, v kateri  vsaka  vrstica
%   predstavlja d-dimenzionalno  kontrolno  tocko
%   Bezierjeve  krivulje  stopnje n,
%   k  stevilo , ki doloca , za  koliko  zelimo  zvisati  stopnjo
%   dane  Bezierjeve  krivulje
%
% Izhodni  podatek:
%   Be    matrika  velikosti (n+k+1) x d, v kateri  vsaka
%     vrstica  predstavlja d-dimenzionalno  kontrolno  tocko
%     Bezierjeve  krvulje  stopnje n+k, ki  ustreza  dani
%     Bezierjevi  krivulji

for j=1:k
    
    n = size(B);
    n = n(1);
    
    B2 = [B(1,:)];
    for i=1:n-1
        B2 = [B2; (1-i/n).*B(i+1,:) + (i/n).*B(i,:)];
    end
    B2 = [B2; B(n,:)];
    B = B2;
end

Be = B;

end