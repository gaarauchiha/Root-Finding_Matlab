% Complete the definitions of f and fprime (add your formula after the @(x) )
f = @(x) x - cos(x);
fprime = @(x) 1 + sin(x);

% Add your initial root estimate
x = 0.75;

iter = 0; % Start with 0 iterations
deltax = 10^-8; % Assign initial step value >= tolerance

%%%%%%%%% Newton's Method %%%%%%%%%%%%%
% Add your loop condition below
while   abs(deltax) >= 10^-8
    % Calculate deltax
    deltax = -f(x)/fprime(x);
    % update x
    x = x + deltax;
    % update the iteration count 
    iter = iter+1;
    % Exit the loop if Newton's Method does not converge
    if iter >= 100
        fprintf('Maximum number of iterations reached.\n')
        break;
    end
end

% Print out the results
fprintf('Newton''s Method converged in %d iterations.\nFinal root estimate: %g',iter,x);