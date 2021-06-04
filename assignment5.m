%inputfile = 'trailer.jpg'; 
%inputfile = 'strawberries.jpg'; 
%inputfile = 'coloredchips.png'; 
%inputfile = 'baby.jpg';
%inputfile = 'flamingos.jpg';
%inputfile = 'indiancorn.jpg';
%inputfile = 'foggysf2.jpg';
inputfile = 'lighthouse.png';



A = imread(inputfile);

[rows,columns,dim]=size(A);
B=im2uint8(rgb2hsv(A));

H=B(:,:,1);
S=B(:,:,2);%histogram equilization
V=B(:,:,3);%histogram stretch

%histogram equilization

pixels = zeros(1,256);
for i=1:rows
    for j=1:columns
        pixels(S(i,j)+1) = pixels(S(i,j)+1) + 1;
    end
end

for i=2:256
    pixels(i) = pixels(i) + pixels(i-1);
end

for i=1:256
    pixels(i) = 255*pixels(i)/pixels(256);
end

pixels = round(pixels);
pixels = uint8(pixels);

for i=1:rows
    for j=1:columns
        S(i,j) = pixels(S(i,j)+1);
    end
end

%histogram stretch

V_max = max(max(V));
V_min = min(min(V));
maximum = 255;
minimum = 0;

V = double(V);
for i=1:rows
    for j=1:columns
        V(i,j) = (double(V(i,j) - V_min)/double(V_max - V_min))*double(maximum - minimum) + double(minimum);
    end
end

V = uint8(V);

B(:,:,1)=H;
B(:,:,2)=S;
B(:,:,3)=V;

C=hsv2rgb(im2double(B));
outstr=strcat('enhanced_',inputfile);
imshow(C);
imwrite(C,outstr);

