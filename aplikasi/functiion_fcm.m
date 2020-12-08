%%load fcmdata.dat
clc
clear all;
x=xlsread('C:\Users\Ms\Desktop\penelitian\aplikasi\aplikasi\data tabel\try.xlsx');
[centers,U] = fcm(x,3);
maxU = max(U);
index1 = find(U(1,:) == maxU);
index2 = find(U(2,:) == maxU);
index3 = find(U(3,:) == maxU);
plot(x(index1,1),x(index1,3),'og')
hold on
plot(x(index2,1),x(index2,3),'oy')
plot(x(index3,1),x(index3,3),'or')
plot(centers(1,1),centers(1,3),'xg','MarkerSize',15,'LineWidth',3)
plot(centers(2,1),centers(2,3),'xy','MarkerSize',15,'LineWidth',3)
plot(centers(3,1),centers(3,3),'xr','MarkerSize',15,'LineWidth',3)
legend('cluster segar','cluster peralihan','cluster pembusukan')
hold off