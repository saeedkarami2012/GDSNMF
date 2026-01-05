%% DeepSym: Deep Symmetric based on degree 4 objective function which has one hyper-parameter alpha
% 1/5/2026
% s.karami@iasbs.ac.ir
% saeedkarami2012@gmail.com
% 
function main_Deg4(nn)
% clc
% clear
clearvars -except nn
%close all;
addpath('./Datasets');  
%--------------------------------------- loading dataset --------------------------------------------
[XX,gnd,~, ~,cl,DatasetName, Type]=recalldata(nn);
text = "---------- Our code started to run on dataset %d: %s at the time %s. -------------";
t1 = datetime('now','Format','HH:mm:ss');
sprintf(text,nn,DatasetName,t1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
S=load('SOur');
ACCmean=S.ACCmean;
NMImean=S.NMImean;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if strcmp(Type,'CD')   %   CD datasets
    XXX=XX;
else
    X = NormalizeFea(XX,1);  %   Non-CD datasets
    X=X';
    XXX=(X')*(X); % must be symmetric n-by-n matrix where n is number of samples
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if strcmp(Type,'CD')
    %r=[256 cl;256 10;256 20;256 30];               % for Wiki 
    r=[256 64 cl;256 64 10;256 64 20;256 64 30];    % for citeseer and Cora
    rSize=4;                                                      
else
    r=[150 10;150 20;150 30;150 40;150 50;150 60;150 70];           % for non-CD datasets
    rSize=7;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
alpha=[1e-5 1e-3  1e-1 1 1e+1 1e+3 1e+5 1e+7];  
kk=[2 3 5 10 15];
maxiter=1000;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Deep Symmetric method:    clustering via Kmeans
for iii=1:rSize
    fprintf('Layer %d:.... \n', iii);
    rr=r(iii,:);  
    for ii=1:length(kk)
        %%  Constrcution of the affinity matrix S ---> For CD datasets  comments the following lines
        fprintf('N_neighbours %d: \n', kk(ii));
        if strcmp(Type,'CD')
            S=XX;   %similarity matrix for CD datasets
            D=diag(sum(S,2));
        else
           options = [];
           options.NeighborMode = 'KNN';
           options.k = kk(ii);
           options.WeightMode = 'Binary';
           options.t = 1;
           [~,D,S] = makeSD(X',options);
        end
        for i=1:length(alpha)      % Grid Search for alpha
            [Hfinal,~,~] = DeepSymDeg4(XXX,S,D,rr,alpha(i),maxiter);
            tempNMI=zeros(20,1);
            tempACC=zeros(20,1);
            for j = 1:20
                IDX=[];                   % X \approx HH^T---> V=H^T;---> x_(i) \approx v_(i)  the i^th column of V.
                IDX = kmeans(Hfinal,cl);  % The columns of V=H^T are sample vectors and we cluster samples. But Kmeans clusters the rows. So we cluster V^T=(H^T)^T=H by kmeans.
                tempNMI(j) = nmi(gnd,IDX);           %%NMI
                tempACC(j) = clusterAccMea(gnd,IDX); %%ACC
            end
         %%%%%%%%
            ACCmean(i,ii,iii,nn) = mean(tempACC);
            NMImean(i,ii,iii,nn) = mean(tempNMI);
         %%%%%%%%%
         fprintf('... reg_parameter %d was done. \n', alpha(i));
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Saving   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    save('SOur.mat','ACCmean','NMImean')
    fprintf('Seletion  for Layer r(%d,:)  finished --- Information saved \n', iii);
%%%%
end
%----------------------------   display end  -------------------------------------
text = "---------- Our code has finished runing on dataset %d: %s at the time %s. -------------";
t1 = datetime('now','Format','HH:mm:ss');
sprintf(text,nn,DatasetName,t1)
