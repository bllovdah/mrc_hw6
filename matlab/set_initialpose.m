function set_initialpose(x,y,yaw)

chatpub = rospublisher('/amcl_pose');

msg = rosmessage(chatpub);

q = eul2quat(yaw); %error here

msg.Pose.Pose.Position.X=x;
msg.Pose.Pose.Position.Y=y;
msg.Pose.Pose.Orientation.X= q(2);
msg.Pose.Pose.Orientation.Y= q(3);
msg.Pose.Pose.Orientation.Z= q(4);
msg.Pose.Pose.Orientation.W= q(1);

msg.Pose.Pose.Orientation = [q(2), q(3), q(4), q(1)];
msg.Pose.Pose.Covariance = [0.25, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.25, 0.0,...
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,...
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,...
    0.06853891945200942];

send(chatpub,msg);
end

% %
% Header    
%     Seq     :  154343
%     FrameId :  
%     Stamp      
%       Sec  :  0
%       Nsec :  0
%   Pose      
%     Covariance :  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
%     Pose          
%       Position       
%         X :  0
%         Y :  0
%         Z :  0
%       Orientation    
%         X :  0
%         Y :  0
%         Z :  0
%         W :  0