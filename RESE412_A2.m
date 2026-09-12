%% RESE412 Assignment 2 - Initialisation Script
clear;
clc;

%% System parameters
f = 50;                 % Grid frequency [Hz]
V_grid = 110e3;         % Grid voltage, line-to-line RMS [V]

%% Bus 5 base load
V_load = 110e3;
P_load = 500e3;
Q_load = 150e3;

kr = 3.2;
kl = 3.3;
kc = 0.6;

%% Secondary load switching
t_switch = 2;       % Secondary load connection time [s]

%% Transformer parameters
S_tr = 1.5e6;          % Transformer rated power [VA]
f_tr = 50;             % Transformer rated frequency [Hz]

V_HV = 110e3;          % High-voltage winding L-L RMS [V]
V_LV = 11e3;           % Low-voltage winding L-L RMS [V]

R_tr_total = 0.004;    % Total winding resistance [pu]
L_tr_total = 0.08;     % Total leakage inductance [pu]

R_tr_1 = R_tr_total/2; % HV winding resistance [pu]
R_tr_2 = R_tr_total/2; % LV winding resistance [pu]

L_tr_1 = L_tr_total/2; % HV leakage inductance [pu]
L_tr_2 = L_tr_total/2; % LV leakage inductance [pu]

R_mag = 500;           % Magnetisation resistance [pu]
L_mag = 500;           % Magnetisation inductance [pu]

%% Bus 1-2 transmission line
% The 30 km line is split into two cascaded 15 km PI sections

L12_1 = 15;                  % First PI section length [km]
L12_2 = 15;                  % Second PI section length [km]

r1_12 = 0.115;               % Positive-sequence resistance [Ohm/km]
r0_12 = kr*r1_12;            % Zero-sequence resistance [Ohm/km]

l1_12 = 1.05e-3;             % Positive-sequence inductance [H/km]
l0_12 = kl*l1_12;            % Zero-sequence inductance [H/km]

c1_12 = 9e-9;                % Positive-sequence capacitance [F/km]
c0_12 = kc*c1_12;            % Zero-sequence capacitance [F/km]


%% Bus 2-3 transmission line
L23 = 15;                  % Line length [km]

r1_23 = 0.115;             % Positive-sequence resistance [Ohm/km]
r0_23 = kr*r1_23;          % Zero-sequence resistance [Ohm/km]

l1_23 = 1.05e-3;           % Positive-sequence inductance [H/km]
l0_23 = kl*l1_23;          % Zero-sequence inductance [H/km]

c1_23 = 9e-9;              % Positive-sequence capacitance [F/km]
c0_23 = kc*c1_23;          % Zero-sequence capacitance [F/km]


%% Bus 2-5 transmission line
L25 = 10;                  % Line length [km]

r1_25 = 0.180;             % Positive-sequence resistance [Ohm/km]
r0_25 = kr*r1_25;          % Zero-sequence resistance [Ohm/km]

l1_25 = 0.95e-3;           % Positive-sequence inductance [H/km]
l0_25 = kl*l1_25;          % Zero-sequence inductance [H/km]

c1_25 = 8.5e-9;            % Positive-sequence capacitance [F/km]
c0_25 = kc*c1_25;          % Zero-sequence capacitance [F/km]
%% Inverter parameters
P_rated = 1e6;          % Inverter rated active power [W]
S_rated = 1e6;          % Inverter rated apparent power [VA]
V_POC = 11e3;           % Inverter POC voltage, line-to-line RMS [V]

%% Grid strength
SCR = 1.5;                % Short Circuit Ratio
XR = 8;                 % X/R ratio

%% Short-circuit level
S_sc = SCR * P_rated;   % Short-circuit apparent power [VA]

%% Grid impedance
V_POC_src = V_grid;                  % source connects at 110 kV
Z_sc = V_POC_src^2 / S_sc;

X_g = Z_sc / sqrt(1 + (1/XR)^2);
R_g = X_g / XR;

%% Grid inductance
L_g = X_g / (2*pi*f);

%% Display values
fprintf('SCR = %.2f\n', SCR);
fprintf('X/R = %.2f\n', XR);
fprintf('S_sc = %.3f MVA\n', S_sc/1e6);
fprintf('Z_sc = %.6f Ohm\n', Z_sc);
fprintf('R_g = %.6f Ohm\n', R_g);
fprintf('X_g = %.6f Ohm\n', X_g);
fprintf('L_g = %.6f H\n', L_g);

