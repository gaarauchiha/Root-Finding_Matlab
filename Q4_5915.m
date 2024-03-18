v0 = 0; 
v_euler(1) = v0;
v_improved_euler(1) = v0;
t0 = 0; 
tf = 12; 
dt = 2; % Delta(t) = 2
t = t0:dt:tf;
v_euler = zeros(1, length(t));
v_improved_euler = zeros(1, length(t));
g = 9.8; 
m = 150; 
C = 0.5;
A = 1.5; 
rho = 1.2; 
a = 3.13;
b = 0.05477;

dvdt = @(v) g - (1/(2*m))*C*A*rho*v^2;

% Euler
for i = 1:(length(t)-1)
    v_euler(i+1) = v_euler(i) + dt*dvdt(v_euler(i));
end

% Improved Euler
for i = 1:(length(t)-1)
    v_star = v_improved_euler(i) + dt*dvdt(v_improved_euler(i));
    v_improved_euler(i+1) = v_improved_euler(i) + dt/2*(dvdt(v_improved_euler(i)) + dvdt(v_star));
end


v_analytical = (a*(exp(2*a*b*t)-1))./(b*(exp(2*a*b*t)+1));

figure
plot(t, v_euler, 'b', t, v_improved_euler, 'r', t, v_analytical, 'g')
legend('Euler', 'Improved Euler', 'Analytical')
xlabel('t')
ylabel('V')
title('Velocity in a fixed density fluid from Burj Khalifa')
