% Kvadratne bezierjeve krivulje

% Polovica kota, ki ga bo oklepala kvadratna bezierjeva krivulja
fi = 5*pi/6;

% Kontrolne to?ke
B = [cos(fi), -sin(fi), 1;
    1,0, cos(fi);
    cos(fi), sin(fi), 1];

kontrolne_X = B(:,1);
kontrolne_Y = B(:,2);
kontrolne_Z = B(:,3);

t = linspace(0,1,100);

tocke = bezier(B,t);

% To?ke, ki bodo projicirane na ravnino w=1.
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
COLORPLANE = zeros(size(RZ,1), size(RZ,1),3);
COLORPLANE(:,:,1) = (255/256)*ones(size(RZ,1));
COLORPLANE(:,:,2) = (255/256)*ones(size(RZ,1));
COLORPLANE(:,:,3) = (250/256)*ones(size(RZ,1));

% CONE z - koordinata
CZ = zeros(size(RX,1));
for i=1:size(RX,1)
    for j=1:size(RX,1)
        CZ(i,j) = (RX(i,j)^2 + RY(i,j)^2)^0.5;
    end
end

% Barva stož?ca (R,G,B)
COLORCONE = zeros(size(RZ,1), size(RZ,1),3);
COLORCONE(:,:,1) = (240/256)*ones(size(RZ,1));
COLORCONE(:,:,2) = (240/256)*ones(size(RZ,1));
COLORCONE(:,:,3) = (240/256)*ones(size(RZ,1));

hold on 

grid on
axis equal

axis([-2,2,-2,2,-2,2])

surf(RX, RY, RZ, COLORPLANE)
surf(RX, RY, CZ, COLORCONE)

shading interp;

plot3(X,Y,Z)
plot3(racionalna_X, racionalna_Y, racionalna_Z)
plot3(kontrolne_X, kontrolne_Y, kontrolne_Z, '.r', 'MarkerSize', 15)
plot3(kontrolne_X, kontrolne_Y, kontrolne_Z, '-r', 'MarkerSize', 15)


