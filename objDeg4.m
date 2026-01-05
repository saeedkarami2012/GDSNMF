function f = objDeg4(X,H,S,D,alpha,l)
[~,n]=size(X);
P=H{1};
for i=2:l
P=P*H{i};
end
f=(norm(X-P*P','fro')^2)/n;
f=f+2*alpha*trace(P'*(D-S)*P);
end