% To solve the symmetric Non-negative matrix factorization  problem   min ||X-HH^T||,  
% Input:  X_{n*n} non-negative  symmetric n-by-n   and k where k<<n.
% Outputs:non-negative matrices H_{n*k}  
function [H,residualVec]=SymNNMF(X,k,IterMax,eps)
n=max(size(X));
H0=X(:,1:k);
H=H0;
residual=eps+1;
iter=1;
residualVec=zeros(IterMax,1);
while (iter <= IterMax) && (residual > eps)
    numH = X*H;
    denH = H*(H')*H;
    rel = numH./max(denH,1e-8);
    rel = nthroot(rel,5);
    H = H.*rel;
    residual=norm(X-H*(H'),'fro');
    residualVec(iter)=residual;
    iter=iter +1;
end
% plot(residualVec(end-floor(end/2):end))
% title('obj fun')