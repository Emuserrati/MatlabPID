% Define the equations of motion
function dX = myODE(t, X, m, k, c)
    % X = [x, v]
    dX = zeros(2, 1);
    dX(1) = X(2);
    dX(2) = -(k/m)*X(1) - (c/m)*X(2);
end

% Define initial conditions and time range
X0 = [0; 10]; % Initial position and velocity
tspan = [0 10]; % Time range
m = 1000; % Mass of the car in kg
k = 10000; % Spring constant in N/m
c = 100; % Damping constant in N*s/m

% Solve ODE using ode45
[t, X] = ode45(@(t,X) myODE(t,X,m,k,c), tspan, X0);

% Plot the solution
figure;
subplot(2,1,1);
plot(t, X(:,1));
xlabel('Time');
ylabel('Position');
subplot(2,1,2);
plot(t, X(:,2));
xlabel('Time');
ylabel('Velocity');
