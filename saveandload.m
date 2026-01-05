%   NOtation!!!   if you run this all saved information in SOur.mat will be
%   lost
clc
clear 
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N_datasets=20;
alpha=[1e-5 1e-3  1e-1 1 1e+1 1e+3 1e+5 1e+7];      
N_alpha=length(alpha);
rSize=7;   % number of different Layers  or k in FS
%k=[2 3 5 10 15];
N_k=5;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55
ACCmean=zeros(N_alpha,N_k,rSize,N_datasets);
NMImean=zeros(N_alpha,N_k,rSize,N_datasets);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
save('SOur.mat','ACCmean','NMImean')
