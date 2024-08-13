%定义常量
v = 12;    % Wind speed in m/s
m_ball = 1200;  %球的质量（公斤）

V_ball = 0; 


syms L

% L = 22.05;  % 链接长度（米）
delta = 7; % 链条的线密度
m_link = L * delta ;

rho_link = 7800;  % Density of the link in kg/m^3
V_link = m_link / rho_link;

m_buoy = 1000;  %浮标质量（kg）

M = 1140 + m_ball + m_link;    % Total mass in kg
g = 9.81;  % Gravitational acceleration in m/s^2
rho = 1025;  % Seawater density in kg/m^3
V_submerged = 0.025*pi + V_link + V_ball;   %淹没体积（m^3）
m_submerged = M - m_buoy;    % Mass submerged in kg

% syms v M g rho V_submerged m_submerged

% Define variables
syms h F_anchorX F_anchorY  F_pipeX F_pipeY 

% Define wind and buoyancy force functions
F_wind = @(h) 0.625 * 2 * (2 - h) * v^2;  % Wind force
F_buoyancy = @(V) rho * g * V;  % Buoyancy force

% Define equations
eq1 = F_wind(h) == F_anchorX;
eq2 = F_anchorY + M*g == F_buoyancy(pi*h + V_submerged);

eq3 = F_wind(h) == F_pipeX;
eq4 = F_pipeY + m_buoy*g == F_buoyancy(pi*h);

eq5 = F_buoyancy(V_submerged) + F_pipeY == m_submerged*g + F_anchorY;
eq6 = F_pipeX == F_anchorX;

% Solve the system of equations
eqs = [eq1, eq2, eq3, eq4, eq5, eq6];

disp(eqs, '\n');



% sol = solve(eqs, [h, F_anchorX, F_anchorY, F_pipeX, F_pipeY, L]);

% 求数值解
sol = vpasolve(eqs, [h, F_anchorX, F_anchorY, F_pipeX, F_pipeY, L]);

% Display the solutions
disp(sol);
