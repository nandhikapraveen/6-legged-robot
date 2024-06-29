num = [1];
den = [1 2 10 0];

sys
% Step response of the open loop system
= tf(num, den);

figure;
step(sys);

title('Open-loop step response');
% Closed-loop step response for different values of k

k1
for i = 1:length(k1)
= [1,10,20,100];

k
sys_cl = feedback (k*sys,1);
= k1(i);

figure;
step(sys_cl);

title(sprintf('Closed-loop step response for k = %.1f', k));
% Compute and print the rise time, settling time, and overshoot

info = stepinfo (sys_cl);
fprintf('k = %.2f: rise time = %.2f, settling time = %.2f, overshoot = %.2f%%\n k, info. RiseTime, info. Settling Time, info. Overshoot);

end                                               
