function b = bezier(B, t)

n = length(B') - 1;

b = [];
for j = 1:length(t)
    b = [b; decasteljau(B, t(j), n)];
end

end