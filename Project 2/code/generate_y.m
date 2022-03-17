clc; clear;
%% parameters
theta = unifrnd(0,2*pi, 1000);
omega_c = 3/4*pi;
A = 4;
t = [-10:0.01:5];
%% data generation
for i = 1:1000
    X(i,:) = A * ( sin(omega_c.*t + theta(i)) +  cos(2*omega_c.*t + theta(i)/3) );
end
%% output
save('y.mat','X','t')
writematrix(X, "x.txt");
writematrix(t, "t.txt");

