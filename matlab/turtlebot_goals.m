%Assignment 6 Exercise 3
%Lovdahl

% Init ROS (roslaunch nav)
% Launch RVIZ
% SSH to Turtlebot and sync time
% Est action client
% Est a message type
% Build msg
% Include Frame ref in msg
% Send msg and wait for feedback
% Achieve goal
% New msg

%% Init
rosaction list

%% Connect to move_base action server
% This initiates the client and prints out some diagnostic information
[client,goalMsg] = rosactionclient('/move_base')
waitForServer(client);

% Is the client connected to the server?
client.IsServerConnected

%% Setup call back functions for the action client
client.ActivationFcn=@(~)disp('Goal active');
client.FeedbackFcn=@(~,msg)fprintf('Feedback: X=%.2f, Y=%.2f, yaw=%.2f, pitch=%.2f, roll=%.2f  \n',msg.BasePosition.Pose.Position.X,...
    msg.BasePosition.Pose.Position.Y,quat2eul([msg.BasePosition.Pose.Orientation.W,...
    msg.BasePosition.Pose.Orientation.X,msg.BasePosition.Pose.Orientation.Y, ...
    msg.BasePosition.Pose.Orientation.Z]));

client.FeedbackFcn=@(~,msg)fprintf('Feedback: X=%.2f\n',msg.BasePosition.Pose.Position.X);
client.ResultFcn=@(~,res)fprintf('Result received: State: <%s>, StatusText: <%s>\n',res.State,res.StatusText);

%% Initial pose
x=0;
y=0;
yaw=[0 0 0];
set_initialpose(x,y,yaw);

%% Goal A: Populate the goal to be sent to the server
% A good way to determine the syntax is to use tab-complete in the command
% window
goalMsg.TargetPose.Header.FrameId = 'map';
goalMsg.TargetPose.Pose.Position.X = 3.00;
goalMsg.TargetPose.Pose.Position.Y = -1.79;
goalMsg.TargetPose.Pose.Orientation.W=0.50;
goalMsg.TargetPose.Pose.Orientation.X=0;
goalMsg.TargetPose.Pose.Orientation.Y=0;
goalMsg.TargetPose.Pose.Orientation.Z=0.86;

%% Start the action and wait for it to finish - successfully or not
resultmsg = sendGoalAndWait(client,goalMsg);
fprintf('Action completed: State: <%s>, StatusText: <%s>\n',resultmsg.State,resultmsg.StatusText);
cancelAllGoals(client)
delete(client)
clear goalMsg
%% Goal B: Populate the goal to be sent to the server
% A good way to determine the syntax is to use tab-complete in the command
% window
[client,goalMsg] = rosactionclient('/move_base')
waitForServer(client);

% Is the client connected to the server?
client.IsServerConnected

%% Setup call back functions for the action client
client.ActivationFcn=@(~)disp('Goal active');
client.FeedbackFcn=@(~,msg)fprintf('Feedback: X=%.2f, Y=%.2f, yaw=%.2f, pitch=%.2f, roll=%.2f  \n',msg.BasePosition.Pose.Position.X,...
    msg.BasePosition.Pose.Position.Y,quat2eul([msg.BasePosition.Pose.Orientation.W,...
    msg.BasePosition.Pose.Orientation.X,msg.BasePosition.Pose.Orientation.Y, ...
    msg.BasePosition.Pose.Orientation.Z]));

client.FeedbackFcn=@(~,msg)fprintf('Feedback: X=%.2f\n',msg.BasePosition.Pose.Position.X);
client.ResultFcn=@(~,res)fprintf('Result received: State: <%s>, StatusText: <%s>\n',res.State,res.StatusText);
goalMsg.TargetPose.Header.FrameId = 'map';
goalMsg.TargetPose.Pose.Position.X = 4.99;
goalMsg.TargetPose.Pose.Position.Y = 0.18;
goalMsg.TargetPose.Pose.Orientation.W= 0.41;
goalMsg.TargetPose.Pose.Orientation.X= 0;
goalMsg.TargetPose.Pose.Orientation.Y= 0;
goalMsg.TargetPose.Pose.Orientation.Z= 0.90;

resultmsg = sendGoalAndWait(client,goalMsg);
fprintf('Action completed: State: <%s>, StatusText: <%s>\n',resultmsg.State,resultmsg.StatusText);
cancelAllGoals(client)
delete(client)
clear goalMsg
%% Goal C: Populate the goal to be sent to the server
% A good way to determine the syntax is to use tab-complete in the command
% window
[client,goalMsg] = rosactionclient('/move_base')
waitForServer(client);

% Is the client connected to the server?
client.IsServerConnected

%% Setup call back functions for the action client
client.ActivationFcn=@(~)disp('Goal active');
client.FeedbackFcn=@(~,msg)fprintf('Feedback: X=%.2f, Y=%.2f, yaw=%.2f, pitch=%.2f, roll=%.2f  \n',msg.BasePosition.Pose.Position.X,...
    msg.BasePosition.Pose.Position.Y,quat2eul([msg.BasePosition.Pose.Orientation.W,...
    msg.BasePosition.Pose.Orientation.X,msg.BasePosition.Pose.Orientation.Y, ...
    msg.BasePosition.Pose.Orientation.Z]));

client.FeedbackFcn=@(~,msg)fprintf('Feedback: X=%.2f\n',msg.BasePosition.Pose.Position.X);
client.ResultFcn=@(~,res)fprintf('Result received: State: <%s>, StatusText: <%s>\n',res.State,res.StatusText);
goalMsg.TargetPose.Header.FrameId = 'map';
goalMsg.TargetPose.Pose.Position.X = 2.67;
goalMsg.TargetPose.Pose.Position.Y = 2.84;
goalMsg.TargetPose.Pose.Orientation.W= 0.63;
goalMsg.TargetPose.Pose.Orientation.X= 0;
goalMsg.TargetPose.Pose.Orientation.Y= 0;
goalMsg.TargetPose.Pose.Orientation.Z= 0.77;

resultmsg = sendGoalAndWait(client,goalMsg);
fprintf('Action completed: State: <%s>, StatusText: <%s>\n',resultmsg.State,resultmsg.StatusText);
cancelAllGoals(client)
delete(client)
clear goalMsg
%% Goal D: Populate the goal to be sent to the server
% A good way to determine the syntax is to use tab-complete in the command
% window
[client,goalMsg] = rosactionclient('/move_base')
waitForServer(client);

% Is the client connected to the server?
client.IsServerConnected

%% Setup call back functions for the action client
client.ActivationFcn=@(~)disp('Goal active');
client.FeedbackFcn=@(~,msg)fprintf('Feedback: X=%.2f, Y=%.2f, yaw=%.2f, pitch=%.2f, roll=%.2f  \n',msg.BasePosition.Pose.Position.X,...
    msg.BasePosition.Pose.Position.Y,quat2eul([msg.BasePosition.Pose.Orientation.W,...
    msg.BasePosition.Pose.Orientation.X,msg.BasePosition.Pose.Orientation.Y, ...
    msg.BasePosition.Pose.Orientation.Z]));

client.FeedbackFcn=@(~,msg)fprintf('Feedback: X=%.2f\n',msg.BasePosition.Pose.Position.X);
client.ResultFcn=@(~,res)fprintf('Result received: State: <%s>, StatusText: <%s>\n',res.State,res.StatusText);
goalMsg.TargetPose.Header.FrameId = 'map';
goalMsg.TargetPose.Pose.Position.X = -0.11;
goalMsg.TargetPose.Pose.Position.Y = -0.94;
goalMsg.TargetPose.Pose.Orientation.W= 0.95;
goalMsg.TargetPose.Pose.Orientation.X= 0;
goalMsg.TargetPose.Pose.Orientation.Y= 0;
goalMsg.TargetPose.Pose.Orientation.Z= 17.3;

sendGoalAndWait(client,goalMsg);
% fprintf('Action completed: State: <%s>, StatusText: <%s>\n',resultmsg.State,resultmsg.StatusText);
cancelAllGoals(client)
delete(client)
clear goalMsg

%% Shutdown
rosshutdown()
delete(client)