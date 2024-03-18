f = @(x) 8*cos(x).^3 + 4*x/5 - 9;
fprime = @(x) -24*cos(x).^2.*sin(x) + 4/5;

tol = 10^-4;
convergence_bisection = [];
convergence_false_position = [];
convergence_secant = [];
convergence_newton_raphson = [];

% Bisection
a = 6;
b = 9;
c = (a + b)/2;
while abs(f(c)) >= tol
    convergence_bisection = [convergence_bisection, c];
    if f(a)*f(c) < 0
        b = c;
    else
        a = c;
    end
    c = (a + b)/2;
end

% False Position
a = 6;
b = 9;
c = (a*f(b) - b*f(a))/(f(b) - f(a));
while abs(f(c)) >= tol
    convergence_false_position = [convergence_false_position, c];
    if f(a)*f(c) < 0
        b = c;
    else
        a = c;
    end
    c = (a*f(b) - b*f(a))/(f(b) - f(a));
end

% Secant 
a = 6;
b = 9;
x = [a, b];
while abs(f(x(end))) >= tol
    x(end+1) = x(end) - f(x(end))*(x(end) - x(end-1))/(f(x(end)) - f(x(end-1)));
    convergence_secant = [convergence_secant, x(end)];
end

% Newton-Raphson 
x = 5;
while abs(f(x)) >= tol
    x = x - f(x)/fprime(x);
    convergence_newton_raphson = [convergence_newton_raphson, x];
end

figure
plot(1:length(convergence_bisection), convergence_bisection, 'r', 1:length(convergence_false_position), convergence_false_position, 'g', 1:length(convergence_secant), convergence_secant, 'b', 1:length(convergence_newton_raphson), convergence_newton_raphson, 'm')
legend('Bisection', 'False Position', 'Secant', 'Newton-Raphson')
xlabel('# of iteration')
ylabel('Root')
title('Convergence history')
