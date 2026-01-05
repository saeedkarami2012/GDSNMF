% To solve the symmetric Tri-factorization  problem   min ||X-HGH^T||,  
% Input:  X_{n*n} non-negative  symmetric n-by-n   and k where k<<n.
% Outputs: non-negative matrices H_{n*k}  and G_{k*k}
function [H,G,residualVec]=SymTriFactorization(X,k,IterMax,eps)
n=max(size(X));
H=rand(n,k);
G=rand(k,k);
G=(G+G');         % If initial G is taken symmetric---> then all G's in iterations will be symmetric
residual=eps+1;
iter=1;
residualVec=zeros(IterMax,1);
while (iter <= IterMax) && (residual > eps)
    numG = H'*X*H;
    HH=H'*H;
    denG = HH*G*HH;
    re1 = numG./max(denG,1e-8);
    re1 = nthroot(re1,2);
    G = G.*re1;
    numH = X*H*G' + X'*H*G;
    denH = H*G*HH*G' + H*G'*HH*G;
    rel2 = numH./max(denH,1e-8);
    rel2 = nthroot(rel2,2);
    H = H.*rel2;
    residual=norm(X-H*G*H','fro');
    residualVec(iter)=residual;
    iter=iter +1;
end
% figure
% plot(residualVec(end-floor(end/2):end))
% title('Res vec of SymTriFactorization')
% hold on;