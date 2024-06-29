clear all; close all;
num = [1];

den = [1 2 10 0];

sys=tf(num, den)
figure;

pzmap(sys)
figure;

subplot(3,1,1)
impulse(sys)

title('impulse response');

subplot(3,1,2)
step (num, den)

title('step response');

subplot(3,1,3)
t=[0:0.01:10]; %time axis

u=t/2;
lsimplot(sys,u,t)

title('unit ramp response');
