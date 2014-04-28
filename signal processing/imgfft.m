img   = imread('123.jpg','jpg');

% Scale data and display as image.
imagesc(img)

% Shift zero-frequency component to center of spectrum.
img   = fftshift(img(:,:,1));

% Two-dimensional discrete Fourier Transform.
F     = fft2(img);

figure;

% plot
imagesc(300*log(1+abs(fftshift(F)))); colormap(gray); 
title('magnitude spectrum');