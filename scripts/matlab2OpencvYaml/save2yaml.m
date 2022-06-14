% .m文件，保存参数到yaml，注意相机相对位姿取逆
height = stereoParams.CameraParameters1.ImageSize(1);
width = stereoParams.CameraParameters1.ImageSize(2);
RD1 = stereoParams.CameraParameters1.RadialDistortion;
TD1 = stereoParams.CameraParameters1.TangentialDistortion;
D1 = [RD1(1), RD1(2), TD1(1), TD1(2), 0];
K1 = stereoParams.CameraParameters1.IntrinsicMatrix;
M1 = K1';

RD2 = stereoParams.CameraParameters2.RadialDistortion;
TD2 = stereoParams.CameraParameters2.TangentialDistortion;
D2 = [RD2(1), RD2(2), TD2(1), TD2(2), 0];
K2 = stereoParams.CameraParameters2.IntrinsicMatrix;
M2 = K2';

rot = stereoParams.RotationOfCamera2;
trans = stereoParams.TranslationOfCamera2;
Rot = rot';
Trans = trans;

T=eye(4);
T(1:3,1:3)=rot;
T(1:3,4)=trans;
TMatrix = T;

fx = stereoParams.CameraParameters2.IntrinsicMatrix(1,1);   % 单位:pixel
baseline = norm(stereoParams.TranslationOfCamera2)/1000;    % 单位:m

%自己先手动新建一个result文件夹保存
fileName = './out/endoscope_calibration.yaml';
matlab2opencv(width, fileName);
matlab2opencv(height, fileName, 'a');
matlab2opencv(baseline, fileName, 'a');
matlab2opencv(fx, fileName, 'a');
matlab2opencv(Rot, fileName, 'a');
matlab2opencv(Trans, fileName, 'a');
matlab2opencv(TMatrix, fileName, 'a');
matlab2opencv(M1, fileName, 'a');
matlab2opencv(D1, fileName, 'a');
matlab2opencv(M2, fileName, 'a');
matlab2opencv(D2, fileName, 'a');
