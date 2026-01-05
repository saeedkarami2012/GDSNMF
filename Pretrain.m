function [H,G]=Pretrain(X,r)
Z = X;
l=max(size(r));
H = cell(l,1);
G = cell(l-1,1);
IterMax=100;
eps=1e-3;
for i=1:l-1
    [H{i},G{i},~]=SymTriFactorization(Z,r(i),IterMax,eps);
    Z = G{i};
end
%---   The last step we approximate G_{l-1} by HH^T using SymNNMF
[H{l},~]=SymNNMF(Z,r(l),IterMax,eps);
