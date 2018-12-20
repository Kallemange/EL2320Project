% function [c,outlier, nu_bar, H_bar] = batch_associate(mu_bar,sigma_bar,z,M,Lambda_m,Q)
% This function should perform the maximum likelihood association and outlier detection.
% Note that the bearing error lies in the interval [-pi,pi)
%           mu_bar(t)           3X1
%           sigma_bar(t)        3X3
%           Q                   2X2
%           z(t)                2Xn
%           M                   2XN
%           Lambda_m            1X1
% Outputs: 
%           c(t)                1Xn
%           outlier             1Xn
%           nu_bar(t)           2nX1
%           H_bar(t)            2nX3
function [c,outlier, nu_bar, H_bar] = batch_associate(mu_bar,sigma_bar,z,M,Lambda_m,Q)
% FILL IN HERE
n=size(z,2);
N=size(M,2);
for i=1:n
    for j=1:N
        z_hat=observation_model(mu_bar,M,j);
        H(:,:,j)=jacobian_observation_model(mu_bar,M,j,z_hat,1);
        S(:,:,j)=H(:,:,j)*sigma_bar*H(:,:,j)'+Q;
        nu(:,j)=z(:,i)-z_hat;
        nu(2,j)=mod(nu(2,j)+pi,2*pi)-pi;
        D(j)=nu(:,j)'*inv(S(:,:,j))*nu(:,j);
        phi(j)=det(2*pi*S(:,:,j)).^(-0.5)*exp(-0.5*D(j));
    end
    c(i)=find(phi==max(phi));
    outlier(i)=(D(c(i))>=Lambda_m);
    nu_bar(:,i)=nu(:,c(i));
    H_bar(:,:,i)=H(:,:,c(i));
end
 H_temp = permute(H_bar,[1 3 2]);
 H_bar = reshape(H_temp,[],size(H_bar,2),1);
end
