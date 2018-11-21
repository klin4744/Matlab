function[X] = fwdEulerExercise

deltaTau = 0.1;
maxT = 3;
X_initial = 1;

t = 0:deltaTau:3; %% create row vector for :
X = zeros(size(t));
numIterations = maxT/deltaTau;

X(1) = X_initial;
%% Use "for" loop to implement the iterations
for index = 1:numIterations
    X(index+1) = X(index) + f(X(index)) * deltaTau;
end

plot(t,X)
xlabel('t')
ylabel('y')

hold on 
plot(t,exp(-2*t))
hold off

function dx_dt=f(x)
  gamma = 2;
  dx_dt = -gamma * x;
