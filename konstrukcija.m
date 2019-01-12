% X os
X = linspace(0,5,100);

% Domena kro�nice
XK = linspace(-pi/2, pi/2, 100);

% To?ka na kro�nici od koder potegnemo tangento
x0 = 0.99;
y0 = (1 - x0^2)^0.5;

% Koeficient in prosti ?len premice
k = -x0/y0;
n = y0 - k*x0;

premica = @(x) k.*x + n;

% Prese?i�?a z y= -1 in y=1
x1 = (-1 - n) / k;
x2 = (1 - n) / k;

% Racionalne kontrolne to?ke kro�nice
B = [0, -1;
    2*x1, -1;
    2*x2, 1;
    0, 1];

% Ute�i
w = [1, 1/(3*x1^(2/3)),  1/(3*x2^(2/3)), 1];

clf;

hold on 

axis equal
axis([0,5,-2,2])

pause;

% Nari�emo vodoravni premici
plot(X, ones(size(X,2),1), 'k');
plot(X, -ones(size(X,2),1), 'k');

pause;

% Nari�emo polkrog
plot(cos(XK), sin(XK), 'b');

pause;

% Nari�emo poljubno tangento na kro�nico in to?ko
plot(X, premica(X), 'm');
plot(x0,y0,'.k', 'MarkerSize', 15)

pause;

% Nari�emo prese?i�?a
plot(x1,-1,'.r', 'MarkerSize', 15)
plot(x2,1, '.r', 'MarkerSize', 15)

pause;

% Nari�emo 2x1, 2x2 ...
plot(2*x1,-1,'.r', 'MarkerSize', 15)
plot(2*x2,1, '.r', 'MarkerSize', 15)

pause;

hold off 

clf;

% Zbri�emo kro�nice in ohranimo vse ostalo
hold on

axis equal
axis([0,5,-2,2])

plot(X, ones(size(X,2),1), 'k');
plot(X, -ones(size(X,2),1), 'k');
plot(X, premica(X), 'm');
plot(x0,y0,'.k', 'MarkerSize', 15)
plot(x1,-1,'.r', 'MarkerSize', 15)
plot(x2,1, '.r', 'MarkerSize', 15)
plot(2*x1,-1,'.r', 'MarkerSize', 15)
plot(2*x2,1, '.r', 'MarkerSize', 15)

pause;

% Nari�emo racionalno bezierjevo krivuljo
plotrbezier(B, w, linspace(0,1,100));

pause;

% Nari�emo �e kro�nico za test
plot(cos(XK), sin(XK), 'g');

