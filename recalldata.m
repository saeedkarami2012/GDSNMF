%    Datasets download Link: https://jundongl.github.io/scikit-feature/datasets.html
function [XX,YY,No_sample, No_feat,No_class,Dataset, Type]=recalldata(n)
%% Jaffe: n=1 
%% orlraw10P: n=2 
%% COIL20: n=3
%% TOX171: n=4
%% GLI85: n=5
%% Basehock:  n=6
%% PCMAC:  n=7
%% Citeseer  n=8
%% Cora    n=9
%% Wiki   n=10
%% RELATHE  n=11
%% Yale    n=12
%Datasets={'jaffe';'orlraws10P';'COIL20';'TOX171';'GLI85';'BASEHOCK';'PCMAC'; 'RELATHE';'Yale'};
%%
addpath('./Datasets');  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if n==1
Dataset='jaffe';
Type='Image';
load jaffe
XX=fea;
YY=gnd;
[No_sample,No_feat] = size(XX);
No_class = length(unique(YY));
%
elseif n==2
Dataset='orlraws10P';
Type='Image';
load orlraws10P
XX=X;
YY=Y;
[No_sample,No_feat] = size(XX);
No_class = length(unique(YY));
%
elseif n==3
Dataset='COIL20';
Type='Image';
load COIL20
XX=X;
YY=Y;
[No_sample,No_feat] = size(XX);
No_class = length(unique(YY));
% TOX171
elseif n==4
Dataset='TOX_171';
Type='Biology';
load TOX_171
XX=X;
YY=Y;
[No_sample,No_feat] = size(XX);
No_class = length(unique(YY));
% GLI85
elseif n==5
Dataset='GLI_85';
Type='Biology';
load GLI_85
XX=X;
YY=Y;
[No_sample,No_feat] = size(XX);
No_class = length(unique(YY));
elseif n==6
Dataset='BASEHOCK';
Type='Text';
load BASEHOCK
XX=X; 
YY=Y;
[No_sample,No_feat] = size(XX);
No_class = length(unique(YY));
elseif n==7
Dataset='PCMAC';
Type='Text';
load PCMAC
XX=X; 
YY=Y;
[No_sample,No_feat] = size(XX);
No_class = length(unique(YY));
elseif n==8
Dataset='Citeseer';
Type='CD';
load citeseer
XX=W; 
YY=gnd;
[No_sample,No_feat] = size(XX);
No_class = length(unique(YY));
elseif n==9
Dataset='Cora';
Type='CD';
load cora
XX=W; 
YY=gnd;
[No_sample,No_feat] = size(XX);
No_class = length(unique(YY));
elseif n==10
Dataset='Wiki';
Type='CD';
load wiki
XX=W; 
YY=gnd;
[No_sample,No_feat] = size(XX);
No_class = length(unique(YY));
elseif n==11
Dataset='RELATHE';
Type='Text';
load RELATHE
XX=X; 
YY=Y;
[No_sample,No_feat] = size(XX);
No_class = length(unique(YY));
elseif n==12
Dataset='Yale';
Type='Image';
load Yale_32x32
XX=fea; 
YY=gnd;
[No_sample,No_feat] = size(XX);
No_class = length(unique(YY));
end
end


