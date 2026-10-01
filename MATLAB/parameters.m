%% DC MOTOR SPEED CONTROL PARAMETERS
% MATLAB/Simulink project
% Closed-loop DC motor speed control using PI controller

clear;
clc;

%% ================= MOTOR PARAMETERS =================

% Armature resistance
Ra = 3.9;                 % Ohm

% Armature inductance
La = 0.01;                % H

% Back EMF constant
Ke = 0.072e-3;            % V/rpm

% Rotor inertia
J = 0.0002;               % kg.m^2

% Rotor viscous damping
B = 0.5e-5;               % N.m.s/rad

%% ================= POWER SUPPLY ====================

MotorVoltage = 12;        % V


%% ================= PI CONTROLLER ====================

Kp = 0.004;
Ki = 0.01;
Kd = 0;

% PI output limits
PI_Max = MotorVoltage;    % 12 V
PI_Min = 0;               % 0 V


%% ================= PWM PARAMETERS ===================

PWM_Frequency = 10000;    % Hz

% Duty-cycle limits
Duty_Max = 1;
Duty_Min = 0;

% PWM resolution for future ESP32 implementation
PWM_Resolution = 8;

% Maximum PWM value for 8-bit resolution
PWM_Max_Count = 2^PWM_Resolution - 1;


%% ================= SPEED REFERENCE ==================

Initial_RPM = 1000;       % RPM

Final_RPM = 2500;         % RPM

Reference_Step_Time = 4;  % seconds


%% ================= LOAD DISTURBANCE =================

Load_Torque = -0.01;      % N.m

Load_Step_Time = 8;       % seconds


%% ================= SIMULATION ======================

Simulation_Stop_Time = 15;    % seconds


%% ================= SENSOR ===========================

% Number of pulses generated per revolution
PPR = 1;


%% ================= DISPLAY ==========================

fprintf('DC Motor PI Speed Control Parameters\n');
fprintf('------------------------------------\n');

fprintf('Motor Voltage : %.2f V\n', MotorVoltage);
fprintf('Kp            : %.4f\n', Kp);
fprintf('Ki            : %.4f\n', Ki);
fprintf('PWM Frequency : %.0f Hz\n', PWM_Frequency);
fprintf('Initial RPM   : %.0f RPM\n', Initial_RPM);
fprintf('Final RPM     : %.0f RPM\n', Final_RPM);
