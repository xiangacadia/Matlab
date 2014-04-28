
image = imread('123.jpg');
dim = size(image);
Timage = 255*ones(dim(1), dim(2), 'uint8');
image1 = imsubtract(Timage,image);
imshow(image1,[]);
image2 = medfilt2(image1,[2 2]);
figure,imshow(image2,[]);
image2 = imadjust(image2);
bw = im2bw(image2, 0.3);
figure,imshow(bw,[])


bw = bwareaopen(bw, 8);
figure,imshow(bw,[])
[labeled,numObjects] = bwlabel(bw,8);
RGB_label=label2rgb(labeled,@spring,'c','shuffle');
imshow(RGB_label,[])

chrdata = regionprops(labeled,'basic')
allchrs = [chrdata.Area];

num = size(allchrs)

nbins = 20;

figure,hist(allchrs,nbins);

title(num(2))