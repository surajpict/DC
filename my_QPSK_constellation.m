%                          <<Experiment-4 PART-A (QPSK)>>
%                               << Objective-1 >>
% Aim: Simulation study of Performance of QPSK.
% Objective-1: Write a program to plot signal constellation diagram of received 
%              QPSK signal in the presence of AWGN.
% Objective-2: Write a program to plot Practical and Theoretical BER vs SNR graph
%              of received QPSK signal in the presence of AWGN for ML receiver.

% Note: For objective-2, see separate octave files named <my_QPSK_ber_method1.m>
%       and <my_QPSK_ber_method2.m>

clc;
clear all;
close all;
pkg load communications
N = 10000; % Number of bits to be transmitted using QPSK
           % Too large value may slow down the program
x = randi([0,1],1,N); % Random input bits generation
M = 4;     % Number of Symbols in QPSK

% Symbol Generation
yy = [];
for i=1:2:length(x)
  if x(i)==0 && x(i+1)==0
    y = cosd(225)+1j*sind(225);
  elseif x(i)==0 && x(i+1)==1
    y = cosd(135)+1j*sind(135);
  elseif x(i)==1 && x(i+1)==0
    y = cosd(315)+1j*sind(315);
  elseif x(i)==1 && x(i+1)==1
    y = cosd(45)+1j*sind(45);
  endif
% Transmitted Symbols
yy = [yy y];
endfor
scatterplot(yy);    % Constellation Diagram without Noise
EbN0db = 20; % Change this value & run program to see the noisy constellation.
EbN0 = 10^(EbN0db/10);

% AWGN Channel
n = (1/sqrt(2))*[randn(1,length(yy)) + 1j*randn(1,length(yy))];
sigma = sqrt(1/((log2(M))*EbN0));

% Received Symbols
r = yy + sigma*n;   
scatterplot(r);  % Constellation Diagram with Noise