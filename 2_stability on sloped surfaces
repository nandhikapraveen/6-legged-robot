clc;
clear all;

close all;
num=1;

den=[1 2 10 0];
p=[1 10 20 100];

sys=tf(num, den);
figure;

step(sys);
title('open loop step response');

for k=1:length(p)
p1 = p(k);

figure;
sys1 = feedback(p1*sys, 1)

subplot(2,1,1);
pzmap(sys1)

title(sprintf('Pole zero map for k = %.2f', p1));
subplot(2,1,2)

step(sys1)
title(sprintf('Step Response for k = %.2f', p1));

end
