% Kvarti?ne bezierjeve krivulje

b = 0.85;
theta = 120*pi/180;

B = [cos(theta), -sin(theta), 1;
    2/(3*b^0.5) + b*cos(theta)/3, -b*sin(theta)/3, (2*cos(theta)/(3*b^0.5) + b/3);
    cos(theta)/(3*b) + 2*b^0.5/3, sin(theta)/(3*b), 2*cos(theta)*b^0.5/3 + 1/(3*b);
    cos(theta), sin(theta), 1];

% to?ke, ki jih bomo uporabili za izris kontrolnih to?k.
kontrolne_X = B(:,1);
kontrolne_Y = B(:,2);
kontrolne_Z = B(:,3);

% Deljenje bezierjeve krivulje
t = linspace(0,1,100);

% To?ke na bezierjevi krivulji
tocke = bezier(B,t);

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
[RX, RY] = meshgrid(-2:0.1:2);
RZ = ones(size(RX,1));
% COLORPLANE matrika, ki dolo?a barvo ravnine w=1. 
% (R,G,B) shema.
COLORPLANE = zeros(size(RZ,1), size(RZ,1),3);
COLORPLANE(:,:,1) = (255/256)*ones(size(RZ,1));
COLORPLANE(:,:,2) = (255/256)*ones(size(RZ,1));
COLORPLANE(:,:,3) = (150/256)*ones(size(RZ,1));

% CONE
% CZ so z-kooridnate stož?a, katerega presek z ravnino z=1 je enotski krog
% s središ?em v (0,0).
CZ = zeros(size(RX,1));
for i=1:size(RX,1)
    for j=1:size(RX,1)
        CZ(i,j) = (RX(i,j)^2 + RY(i,j)^2)^0.5;
    end
end

% Dolo?imo barvo stož?a. (R,G,B) shema.
COLORCONE = zeros(size(RZ,1), size(RZ,1),3);
COLORCONE(:,:,1) = (220/256)*ones(size(RZ,1));
COLORCONE(:,:,2) = (220/256)*ones(size(RZ,1));
COLORCONE(:,:,3) = (220/256)*ones(size(RZ,1));

hold on 

grid on
axis equal

axis([-2,2,-2,2,-2,2])

% Narišemo ravnino in stože?.
surf(RX, RY, RZ, COLORPLANE)
surf(RX, RY, CZ, COLORCONE)

% S stož?a in ravnine izbrišemo ?rte.
shading interp;

% Narišemo krivuljo v 3D
plot3(X,Y,Z)
% Narišemo krivuljo projicirano na ravnino z=1
plot3(racionalna_X, racionalna_Y, racionalna_Z)
% Narišemo kontrolne to?ke bezierjeve krivulje
plot3(kontrolne_X, kontrolne_Y, kontrolne_Z, '.r', 'MarkerSize', 15)
% Narišemo kontrolni poligon
plot3(kontrolne_X, kontrolne_Y, kontrolne_Z, '-r', 'MarkerSize', 10)


