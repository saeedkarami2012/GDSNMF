%%Inputs:
%        X=X'*X symmetric dataset
%        S,D   the matrices that we construct for manifold learning
%        alpha  the hyperparameter
%        r=[r1 ..rl]  layers dimensional in Deep factorization
%        maxiter the number of maximum iteration of proposed method
%%
function [Hfinal,E, H] = DeepSymDeg4(X,S,D,r,alpha,maxiter)
l=max(size(r));
[m,~] = size(X); %m=n since X:=X'*X is symmetric
%-------------------------------------
%[H,G]=Pretrain(X,r);
H = cell(l,1);
H{1}=abs(randn(m,r(1)));
for i=2:l
    H{i}=abs(randn(r(i-1),r(i)));
end
%=============================================================================
iter=1;
E(iter) = objDeg4(X,H,S,D,alpha,l);
err = 1;
while (iter<=maxiter && err >= 10^-6)
    for i=1:l
        B=eye();
        A=eye();
        for jj=1:i-1
            B=B*H{jj};
        end
        for jj=i+1:l
            A=A*H{jj};
        end
        AA=A*A';
        BB=B'*B;
        HAA=H{i}*AA;
        numH= B'*X*B*HAA + alpha*B'*S*B*HAA;
        denH= BB*HAA*H{i}'*BB*HAA + alpha*B'*D*B*HAA;
        re1 = numH./max(denH,1e-10);
        re1 = nthroot(re1,4);
        H{i} = H{i}.*re1;
    end
    iter = iter +1;
    E(iter)=objDeg4(X,H,S,D,alpha,l);
    err = abs(E(iter-1)-E(iter))/max(1,E(iter-1));
end
Hfinal=H{1};
for i=2:l
    Hfinal=Hfinal*H{i};
end
end
