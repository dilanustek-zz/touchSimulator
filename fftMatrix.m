figure

for p=1:16       %fft for each cell in a 4x4 sensor

Fs = 1/0.7;            % Sampling frequency
T = 1/Fs;             % Sampling period
N = size(mat);
L=N(1,1);              % Length of signal
t = (0:L-1)*T;        % Time vector

C = mat(:,p);

Y = fft(C);
t = 0:0.7:162*0.7;
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;

subplot(4,4,p)

plot(t,C);     %plots raw data
%plot(f,P1);    %plots fft 
%title('Single-Sided Amplitude Spectrum of S(t)')
xlabel('f (Hz)')

ylabel('|P1(f)|')



end




