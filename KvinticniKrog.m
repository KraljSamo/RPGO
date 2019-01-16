% Kvinticna krivulja, predstavlja kroznico

%Prvotni krivulji, ki ima nekaj utezi nicelni, zelimo dvgniti stopnjo, da
%bo dobljena kvinticna krivulja predstavljala kroznico in imela pozitivne
%utezi
B = [1 0 1;0 1 0; -1 0 1/3; 0 -1 0; 1 0 1];
Be = bezierelv(B,1);


% to?ke, ki jih bomo uporabili za izris kontrolnih to?k.
kontrolne_X = B(:,1);
kontrolne_Y = B(:,2);
kontrolne_Z = B(:,3);

%tocke krivulje z zvisano stopnjo
kontrolne2_X = Be(:,1);
kontrolne2_Y = Be(:,2);
kontrolne2_Z = Be(:,3);

kontrolne3_X = Be(:,1)./Be(:,3);
kontrolne3_Y = Be(:,2)./Be(:,3);
kontrolne3_Z = Be(:,3)./Be(:,3);

% Deljenje bezierjeve krivulje
t = linspace(0,1,100);

% To?ke na bezierjevi krivulji
tocke = bezier(B,t);

tocke2 = bezier(Be,t);

% Racionalno krivuljo dobimo tako, da osnovno bezierjevo krivuljo
% preslikamo na ravnino w=1 s projektivno projekcijo. 
racionalna_X = tocke(:,1);
racionalna_Y = tocke(:,2);
racionalna_Z = tocke(:,3);

for i=1:size(racionalna_X,1)
    racionalna_X(i) = racionalna_X(i)/racionalna_Z(i);
    racionalna_Y(i) = racionalna_Y(i)/racionalna_Z(i);
    racionalna_Z(i) = racionalna_Z(i)/racionalna_Z(i);
end

% To?ke krivulje
X = tocke(:,1);
Y = tocke(:,2);
Z = tocke(:,3);


% To?ke ravnine z = 1;
[RX, RY] = meshgrid(-5:0.1:5);
RZ = ones(size(RX,1));
% COLORPLANE matrika, ki dolo?a barvo ravnine w=1. 
% (R,G,B) shema.
COLORPLANE = zeros(size(RZ,1), size(RZ,1),3);
COLORPLANE(:,:,1) = (255/256)*ones(size(RZ,1));
COLORPLANE(:,:,2) = (255/256)*ones(size(RZ,1));
COLORPLANE(:,:,3) = (150/256)*ones(size(RZ,1));

% CONE
% CZ so z-kooridnate sto�?a, katerega presek z ravnino z=1 je enotski krog
% s sredi�?em v (0,0).
CZ = zeros(size(RX,1));
for i=1:size(RX,1)
    for j=1:size(RX,1)
        CZ(i,j) = (RX(i,j)^2 + RY(i,j)^2)^0.5;
    end
end

% Dolo?imo barvo sto�?a. (R,G,B) shema.
COLORCONE = zeros(size(RZ,1), size(RZ,1),3);
COLORCONE(:,:,1) = (220/256)*ones(size(RZ,1));
COLORCONE(:,:,2) = (220/256)*ones(size(RZ,1));
COLORCONE(:,:,3) = (220/256)*ones(size(RZ,1));

hold on 

grid on
axis equal

axis([-5,5,-5,5,-2,2])

% Nari�emo ravnino in sto�e?.
surf(RX, RY, RZ, COLORPLANE)
surf(RX, RY, CZ, COLORCONE)

% S sto�?a in ravnine izbri�emo ?rte.
shading interp;

% Nari�emo krivuljo v 3D
plot3(X,Y,Z)
% Nari�emo krivuljo projicirano na ravnino z=1
plot3(racionalna_X, racionalna_Y, racionalna_Z)
% Nari�emo kontrolne to?ke bezierjeve krivulje
plot3(kontrolne_X, kontrolne_Y, kontrolne_Z, '.r', 'MarkerSize', 15)
% Nari�emo kontrolni poligon
plot3(kontrolne_X, kontrolne_Y, kontrolne_Z, '-r', 'MarkerSize', 10)

pause

% Nari�emo kontrolne to?ke zvisane bezierjeve krivulje
plot3(kontrolne2_X, kontrolne2_Y, kontrolne2_Z, '.g', 'MarkerSize', 15)
% Nari�emo kontrolni poligon
plot3(kontrolne2_X, kontrolne2_Y, kontrolne2_Z, '-g', 'MarkerSize', 10)
hold on
% Nari�emo kontrolne to?ke zvisane bezierjeve krivulje na w=1
plot3(kontrolne3_X, kontrolne3_Y, kontrolne3_Z, '.b', 'MarkerSize', 15)
% Nari�emo kontrolni poligon
plot3(kontrolne3_X, kontrolne3_Y, kontrolne3_Z, '-b', 'MarkerSize', 10)
