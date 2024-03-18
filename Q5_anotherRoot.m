% NR_Different initial Value
f = @(x) 8*cos(x).^3 + 4*x/5 - 9;
fprime = @(x) -24*cos(x).^2.*sin(x) + 4/5;

x0 = 5.5;

tol = 10^-4;
x = x0;
while abs(f(x)) >= tol
    x = x - f(x)/fprime(x);
end
root_newton_raphson = x;

fprintf('Another Root by NR method: %.4f\n', root_newton_raphson);

