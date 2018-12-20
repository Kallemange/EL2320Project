function z=observe_features(truepose, features)
%Camera observation range
%---------------
%Currently not observing feature angle
%---------------
R=10;
%Distance to features in x and y squared
dist_vec=(features-truepose(1:2));
dist_vec2=dist_vec.^2;
%Distance squared
r_squared=dist_vec2(1,:)+dist_vec2(2,:);
%Distance, choose close features
r=r_squared.^0.5;
idx=find(r<R);
bearing=atan2(dist_vec(2,idx),dist_vec(1,idx)-truepose(3));
%bearing=atan2(M(2,j)-x(2),M(1,j)-x(1))-x(3);
bearing=mod(bearing+pi,2*pi)-pi;
z=[r(idx); bearing];