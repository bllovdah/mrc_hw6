close all
clc
clear all

bag = rosbag('~/mrc_hw6_data/hw6.bag');

bag.AvailableTopics;

%%%

% Read the image
ifile = '~/map.pgm';   % Image file name
I=imread(ifile);
%  
% % Set the size scaling
xWorldLimits = [-10 9.2];
yWorldLimits = [-10 9.2];
RI = imref2d(size(I),xWorldLimits,yWorldLimits)

%ODOM X and Y
odom_select = select(bag,'Topic','/odom');
ts_odom = timeseries(odom_select,'Pose.Pose.Position.X','Pose.Pose.Position.Y');
x1 = ts_odom.Data(:,1);
y1 = ts_odom.Data(:,2);
 
% Select by topic: ACML
amcl_select = select(bag,'Topic','/amcl_pose');
%  
% % Create time series object
ts_amcl = timeseries(amcl_select,'Pose.Pose.Position.X','Pose.Pose.Position.Y');
x2 = ts_amcl.Data(:,1);
y2 = ts_amcl.Data(:,2);
 
% Select by topic
goal_select = select(bag,'Topic','/move_base/goal');
 
% Create time series object
ts_goal = timeseries(goal_select,'Goal.TargetPose.Pose.Position.X',...
    'Goal.TargetPose.Pose.Position.Y','Goal.TargetPose.Pose.Orientation.W',...
    'Goal.TargetPose.Pose.Orientation.X','Goal.TargetPose.Pose.Orientation.Y',...
    'Goal.TargetPose.Pose.Orientation.Z');
x3 = ts_goal.Data(:,1);
y3 = ts_goal.Data(:,2);

figure;
imshow(flipud(I),RI)
set(gca,'YDir','normal')
hold on
plot(x1,y1)
hold on
plot(x2,y2)
hold on
plot(x3,y3,'r*')
legend ('Odomotry','ACML','Goal Pts');

