f = @(x) 8*cos(x).^3 + 4*x/5 - 9;

% f' for NR method
fprime = @(x) -24*cos(x).^2.*sin(x) + 4/5;

a = 6;
b = 9;
x0 = 5;

tol = 10^-4;

% Bisection method
c = (a + b)/2;
while abs(f(c)) >= tol
    if f(a)*f(c) < 0
        b = c;
    else
        a = c;
    end
    c = (a + b)/2;
end
root_bisection = c;

% False Position method
c = (a*f(b) - b*f(a))/(f(b) - f(a));
while abs(f(c)) >= tol
    if f(a)*f(c) < 0
        b = c;
    else
        a = c;
    end
    c = (a*f(b) - b*f(a))/(f(b) - f(a));
end
root_false_position = c;

% Secant method
x = [a, b];
while abs(f(x(end))) >= tol
    x(end+1) = x(end) - f(x(end))*(x(end) - x(end-1))/(f(x(end)) - f(x(end-1)));
end
root_secant = x(end);

% Newton-Raphson method
x = x0;
while abs(f(x)) >= tol
    x = x - f(x)/fprime(x);
end
root_newton_raphson = x;

fprintf('Root:  Bisection method: %.4f\n', root_bisection);
fprintf('Root:  False Position method: %.4f\n', root_false_position);
fprintf('Root:  Secant method: %.4f\n', root_secant);
fprintf('Root: found by Newton-Raphson method: %.4f\n', root_newton_raphson);

x = linspace(-10, 10, 1000);
y = f(x);


figure
plot(x, y, 'b')
hold on
plot(root_bisection, f(root_bisection), 'ro')
plot(root_false_position, f(root_false_position), 'go')
plot(root_secant, f(root_secant), 'yo')
plot(root_newton_raphson, f(root_newton_raphson), 'mo')
line([min(x) max(x)], [0 0], 'Color', 'k')
legend('f(x)', 'Bisection', 'False Position', 'Secant', 'Newton-Raphson')
xlabel('x')
ylabel('f(x)')
title('Roots of function f(x)')
hold off