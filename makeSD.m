function [L,D,S] = makeSD(X,option)
S = constructW(X,option);
D = diag(sum(S));
S=full(S);
D=full(D);
L = D - S;
end