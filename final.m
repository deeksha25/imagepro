I = imread('image.jpg');
grayimage=rgb2gray(I);

ad=imadjust(grayimage);


filtered=imnoise(ad,'salt & pepper',0);




SE=strel('disk',3);


erosion=imerode(filtered,SE);
dilation=imdilate(filtered,SE);
diff=dilation-erosion;

gradient_image=filtered-diff;
SE2=strel('diamond',3);
new_dilation=imdilate(gradient_image,SE2);

c=edge(new_dilation,'sobel');
figure(1);
imshow(c);

c2=edge(new_dilation,'prewitt');
figure(2);
imshow(c2);


c3=edge(new_dilation,'canny',0.2);
figure(3);
imshow(c3);
