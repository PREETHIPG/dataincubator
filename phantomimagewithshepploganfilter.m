%creation of phantom
P=phantom(256);
%diplay of phantom 
figure(1)
imagesc(P);
colormap(gray);
%definition for theta1
theta1 = 0:10:170; 
[R1,xp] = radon(P,theta1);
%display of radon transform theta1
figure(2);
imagesc(theta1,xp,R1); 
colormap(hot); 
colorbar
%axes title for theta1
xlabel('\theta1');
ylabel('x\prime');
%definition for theta2
theta2 = 0:5:175;  
[R2,xp] = radon(P,theta2);
%display of radon transform theta2
figure(3);
imagesc(theta2,xp,R2); 
colormap(hot); 
colorbar
%axes title for theta2
xlabel('\theta2'); 
ylabel('x\prime');
%definition for theta3
theta3 = 0:2:178;  
[R3,xp] = radon(P,theta3);
%display of radon transform theta3
figure(4); 
imagesc(theta3,xp,R3); 
colormap(hot); 
colorbar
%axes title for theta3
xlabel('\theta3');
ylabel('x\prime');
%inverse radon transform
I1 = iradon(R1,theta1,'Shepp-Logan');
figure(5);
imshow(I1)
I2 = iradon(R2,theta2,'Shepp-Logan');
figure(6);
imshow(I2)
I3 = iradon(R3,theta3,'Shepp-Logan');
figure(7);
imshow(I3);
%I1]=iradon(R1,theta1,'Ram-Lak');
%I2]= iradon(R2,theta2,'Shepp-Logan');
MSE1=0;
MSE2=0;
for i=1:256
    for j=1:256
        MSE1=MSE1+(P(i,j)-I1(i,j)).*2
        MSE2=MSE1+(P(i,j)-I1(i,j)).*2
    end
end










































































