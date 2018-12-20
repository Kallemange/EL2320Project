%Testing the datasets
runlocalization_track('so_o3_ie.txt', 'map_o3.txt', 1, 1, 1, 2)
%Setting the values in init to:
%Q=0.01
%R=0.01
% mean error(x, y, theta)=(0.000256, 0.000086, 0.000520)
% mean absolute error=(0.003236, 0.003893, 0.002551)
% total_time =20.000466

%%
runlocalization_track('so_pb_10_outlier.txt', 'map_pent_big_10.txt', 1, 1, 1, 2)
%Setting the values in init to:
%Q=0.2^2
%R=0.01^2
% mean error(x, y, theta)=(0.014452, -0.002937, -0.019592)
% mean absolute error=(0.047913, 0.045565, 0.052118)
% total_time =44.323168

%%
runlocalization_track('so_pb_40_no.txt', 'map_pent_big_40.txt', 1, 1, 1, 2)
%Version 1, in ekf_localize: change Batch=0
%Q=0.1
%R=diag(1);
%Outputs:
% mean error(x, y, theta)=(-2.618506, -1.733604, 0.439642)
% mean absolute error=(4.462436, 4.795607, 0.440101)
% total_time =8.374012

%V2 Batch=1
%Q=0.1^2
% %R=diag(1);
% mean error(x, y, theta)=(-0.026019, -0.022660, 0.018390)
% mean absolute error=(0.080351, 0.088318, 0.047883)
% total_time =5.529926
