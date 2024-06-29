num = 1;
den = [1 2 10 0];
sys = tf(num, den);

% Loop through different values of K and Z
K_vals = [1 15 25];
z_vals = [1 20 100];

for i = 1:length(K_vals)
  for j = 1:length(z_vals)
    K = K_vals(i);
    zz_vals(j) = z_vals(j); % typo assuming this should be z_vals

    % Controllertransferfunction
    DKtf = tf([1 z_vals(j)], [10]);
    EKtf = tf([1 z_vals(j)], 1);

    % Closed-loop transferfunction
    T = feedback(DKtf*sys, 1);
    W = feedback(EKtf*sys,1);

    figure                                                           
    subplot(4,1,1);
    step(T)
    title(sprintf('Step Response for K %d, Z%d", K, z))

    subplot(4,1,2);
    M = feedback(K*sys,1);
    step(M)
    title(sprintf('Step Response(only gain) for K %d, Z %d", K, z))

    subplot(4,1,3);
    N = feedback(EKtf*sys,1);

    %Plotstep response using gain K
    step(N)
    title(sprintf('Step Response(K(s+z)) for K %d, Z= %d', K, z))

    subplot(4,1,4);
    %Plotroot locus
    rlocus (DKtf*sys)
    hold on

    rlocus (T)
    title(sprintf("Root Locusfor K=%d, Z= %d", K,z))

    legend("Open Loop', 'Closed Loop').
  end
end
