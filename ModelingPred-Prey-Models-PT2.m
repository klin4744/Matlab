%% Homework #3 AMS 333
% Lotka-Volterra Model
alpha = 0.04;
beta = 0.2;
s = 0.0005;
K = 10,000;
h=0.2
% gamma is the predation constant
epsilon = 0.1;


%% Forward Euler
deltaTau = 0.01;
numIterations = 365/deltaTau;
t = 0:deltaTau:365;
U = zeros(size(t));
V = zeros(size(t));
U(1) = 200; 
V(1) = 50;
for index = 1:numIterations
    U(index+1) = U(index) + fPrey(U(index),alpha,beta,V(index),s,h,K,epsilon) * deltaTau;
    V(index+1) = V(index) + fPred(U(index),alpha,beta,V(index),s,h,K,epsilon) * deltaTau;
end

plot(t,V)
hold on
plot(t,U)
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
plot(U,V)
% Function for prey population differential
% U(index),alpha,beta,V(index),s,h,K
function dNprey = fPrey(U,alpha,beta,V,s,h,k,epsilon)

dNprey = alpha*(1 - U/K) * U - s*U/(1 + s*h*U) * U * V
   
end

% Function for predator population differential
function dNpred = fPred(U,alpha,beta,V,s,h,k,epsilon)

dNpred =  s*U/(1 + s*h*U)* epsilon * U * V - beta * V
end