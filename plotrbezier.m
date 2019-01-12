function x = plotrbezier(B,w,t)

disp(B)
disp(w)

tocke = rbezier(B,w,t);

d = size(B);
n = d(1) - 1;

hold on 

plot(B(:,1),B(:,2),'.b', 'MarkerSize', 25)
plot(B(:,1),B(:,2),'k', 'MarkerSize', 25, 'LineWidth', 2)

plot(tocke(:,1),tocke(:,2), 'b')

% Farinove toèke

Farin = [];

for i=1:n
    tocka = w(i)/(w(i)+w(i+1)).*B(i,:) + w(i+1)/(w(i)+w(i+1)).*B(i+1,:);
    Farin = [Farin; tocka];
end

plot(Farin(:,1),Farin(:,2),'*r', 'MarkerSize', 15);

x = 0;

end