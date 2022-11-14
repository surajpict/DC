%                          <<Experiment-4 PART-A (QPSK)>>%                           << Objective-2 (Method-1) >>% Aim: Simulation study of Performance of QPSK.% Objective-1: Write a program to plot signal constellation diagram of received %              QPSK signal in the presence of AWGN.% Objective-2: Write a program to plot Practical and Theoretical BER vs SNR graph%              of received QPSK signal in the presence of AWGN for ML receiver.% Note: For objective-1, see separate octave file named <my_QPSK_constellation.m>%       and alternative method for objective-2 see file <my_QPSK_ber_method2.m>.clc;clear all;close all;pkg load communicationsN = 10000; % Number of bits to be transmitted using QPSK           % Too large value may slow down the programx = randi([0,1],1,N); % Random input bits generationM = 4;     % Number of Symbols in QPSK% Symbol Generationyy = [];for i=1:2:length(x)  if x(i)==0 && x(i+1)==0    y = cosd(225)+1j*sind(225);  elseif x(i)==0 && x(i+1)==1    y = cosd(135)+1j*sind(135);  elseif x(i)==1 && x(i+1)==0    y = cosd(315)+1j*sind(315);  elseif x(i)==1 && x(i+1)==1    y = cosd(45)+1j*sind(45);  endif% Transmitted Symbolsyy = [yy y];endfor% Detection Method-1ber_simulated = [];ber_theoretical = [];for EbN0db = 0:15EbN0 = 10^(EbN0db/10);n = (1/sqrt(2))*[randn(1,length(yy)) + 1j*randn(1,length(yy))]; % AWGNsigma = sqrt(1/((log2(M))*EbN0)); % Symbol energy is normalized to Unityr = yy + sigma*n; % Received symbolsI = (real(r)>0);  % In-phase component detectionQ = (imag(r)>0);  % Q-phase component detection% Estimation of Bitsx_estimated = [];for i=1:length(r)  x_estimated = [x_estimated I(i) Q(i)];  endfor% BER Computationber_simulated =[ber_simulated sum(x~=x_estimated)/N];  ber_theoretical = [ber_theoretical 0.5*erfc(sqrt(EbN0))];endfor% BER PlottingEbN0db = 0:15;semilogy(EbN0db, ber_simulated, 'ro-', EbN0db, ber_theoretical, 'k>-');title('BER vs Eb/N0 Plot for QPSK');xlabel('Eb/N0(dB)');ylabel('BER');grid on;legend('Simulated','Theoretical');axis([0 15 10^-3 10^0]);