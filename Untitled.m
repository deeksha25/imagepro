clear all;
y = rgb2gray((imread('image.jpg')));
y = im2double(y);


PSF = fspecial('disk', 8);
yblur = conv2(y,PSF);
figure();
subplot(2,1,1); imshow(y); title('actual image');
subplot(2,1,2); imshow(yblur); title('blurred image');
y2BlurredNoisy = imnoise(yblur,'gaussian',0,.0000000000001);
y3BlurredNoisy = imnoise(yblur,'gaussian',0,.00000000001);
subplot(2,4,2); imshow(y2BlurredNoisy); title('imagep 1');
subplot(2,4,3); imshow(y3BlurredNoisy); title('imagep2');


%fourier transform of images
Y1 = fft2(yblur);
Y2 = fft2(y2BlurredNoisy);
Y3 = fft2(y3BlurredNoisy);
newh = zeros(size(yblur));
psfsize = size(PSF);
newh(1: psfsize(1), 1:psfsize(2))= PSF;
H = fft2(newh);
y1deblurred = ifft2(Y1./H);
y2deblurred = ifft2(Y2./H);
y3deblurred = ifft2(Y3./H);
subplot(2,4,5);imshow(y1deblurred);title('no noise');
y1deblurred=rgb2gray((imwrite(imag2.jpg)));

subplot(2,4,6);imshow(y2deblurred);title('imgp1');
subplot(2,4,7);imshow(y3deblurred);title('imgp2');
