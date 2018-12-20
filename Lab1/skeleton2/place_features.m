function [feature_list]=place_features(z, mu, feature_list)
angle=z(2,:)-mu(3);
x=z(1,:).*cos(angle)+mu(1);
y=z(1,:).*sin(angle)+mu(2);
for j=1:length(z(1,:))
        dist=sqrt((x(j)-feature_list(1,:)).^2+(y(j)-feature_list(2,:)).^2);
        if (min(dist)>2)
            feature_list=[feature_list [x(j); y(j)]];
            plot(x(j), y(j), '*');
        end
                
end
%keyboard

out=0;