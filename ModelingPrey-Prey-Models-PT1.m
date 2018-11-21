%% Homework #3 AMS 333
% Lotka-Volterra Model
RoPrey = 0.04;
RoPred = 0.2;
gamma = 0.0005;
% gamma is the predation constant
epsilon = 0.1;
% epsilon is a constant that describes the relationship
% between the predation rate and predator growth

% Time units are in days
% Populations = # of individuals per square kilometer
% Doubling rate of rabbits
tauPrey = log(2)/ RoPrey ; 
% Using the formula, Rate of growth = log(2)/tau, we find
% That doubling time of rabbits is tau = log(2)/RoPrey
% 17.32 days 
tauPred = log(2)/ RoPred;
% Similarly the death rate of foxes is 3.46 days 

%% Forward Euler
deltaTau = 0.01;
numIterations = 365/deltaTau;
t = 0:deltaTau:365;
R = zeros(size(t));
F = zeros(size(t));
R(1) = 4000; 
F(1) = 80;
for index = 1:numIterations
    R(index+1) = R(index) + fPrey(R(index),RoPrey,gamma,F(index)) * deltaTau;
    F(index+1) = F(index) + fPred(F(index),RoPred,gamma,epsilon,R(index)) * deltaTau;
end

plot(t,F)
hold on
plot(t,R)
legend({'Fox Population','Rabbit Population'}, 'Location','northeast')
xlabel("Time (days)")
ylabel("Population")
title("Lokta Voltera: Initial Rabbits: 4000, Initial Foxes: 80")
hold off
figure(2)

u1v = 0:600:8000;
u2v = 0:10:200;

[u1,u2] = meshgrid(u1v,u2v);

du1dt = RoPrey .*u1 - gamma .* u1 .* u2; %%
du2dt = epsilon * gamma .* u1 .* u2 - u2 .* RoPred;%%

clf;
quiver(u1,u2,du1dt,du2dt,0.5)
axis([0 8000 0 200])
xlabel("Prey Population")
ylabel("Fox Population")
title("Velocity Field Plot of Lokta-Volterra Model")
hold on
plot(R,F)
% Function for prey population differential
function dNprey = fPrey(Nprey,r,gamma,Npred)
% R(index),RoPrey,gamma,F(index)
dNprey = r*Nprey - gamma * Nprey * Npred;
   
end

% Function for predator population differential
function dNpred = fPred(Npred,r,gamma,epsilon,Nprey)

dNpred = epsilon * gamma * Nprey * Npred - r * Npred ;
end