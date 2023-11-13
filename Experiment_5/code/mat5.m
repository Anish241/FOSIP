% Load audio data from the MP3 files
[x1, Fs1] = audioread('Sample_audio.aac');
sound(x1, Fs1);
pause(length(x1) / Fs1);
% Step 3: Design FIR Low Pass Filter using MATLAB filter design Tool
Fpass = 2000; % Passband frequency
Fstop = 3000; % Stopband frequency
Rp = 1; % Passband ripple in dB
Rs = 60; % Stopband attenuation in dB
h = fdesign.lowpass('Fp,Fst,Ap,Ast', Fpass, Fstop, Rp, Rs, Fs1);
Hd = design(h, 'equiripple');
% Display the filter design GUI to fine-tune the filter design
fvtool(Hd);

% Step 4: Filter the audio signals x1 and x2 using linear convolution
y1 = filter(Hd, x1);
% Step 5: Play the filtered signals and observe the quality of sound
sound(y1, Fs1);

% Plot the original and filtered audio signals for the first audio file
t1 = (0:length(x1)-1) / Fs1;
t2 = (0:length(y1)-1) / Fs1;

figure;
subplot(2, 1, 1);
plot(t1, x1);
title('Original Audio Signal');
xlabel('Time (s)');
subplot(2, 1, 2);
plot(t2, y1);
title('Filtered Audio Signal');
xlabel('Time (s)');
