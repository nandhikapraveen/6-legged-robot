%% Plant transfer function
num = 1;
den = [1 2 10 0];
Gtf(num, den);
[1 2 10 0];

% Loop through different values of K and Z
K_vals = [1 20 100];
z_vals = [1 15 25];

for i = 1:length(K_vals)
  K = K_vals(i);
  for j = 1:length(z_vals)
    z = z_vals(j);

    % Controller transfer function
    DKtf = [1 z];
    C = DKtf(1);

    % Closed-loop transfer function
    T = feedback(C * G, 1);

    % Plot step response
    figure
    step(T)
    title(sprintf('Step Response for K = %d, Z = %d', K, z))

    % Plot Bode Diagram
    figure
    bode(G, C*G)
    legend('Open Loop', 'Closed Loop')
    title(sprintf('Bode Diagram for K = %d, Z = %d', K, z))

  end
end
