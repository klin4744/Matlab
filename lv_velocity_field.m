function lv_velocity_field
alpha = 0.04;
beta = 0.2;
gamma = 5e-4;
epsilon = 0.1;

max_U = 8000;
max_V = 160;
N = 7;

range_U = linspace(0,max_U,N);
range_V = linspace(0,max_V,N);

%% Use the meshgrid function to generate two matrices (UU and VV) of U and V values
[uu,vv] = meshgrid(range_U,range_V);
vel_U = alpha .* uu - gamma .* uu .* vv; %% corresponding matrix of U velocites
vel_V = epsilon * gamma .* uu .* vv - beta .* vv; %% V velocites

h = quiver(range_U,range_V,vel_U,vel_V,0.2);
set (h, "maxheadsize", 0.05);

end
