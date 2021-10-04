
function [seg]=segment_image(I)
%function [seg]=segment_image(I)
%
% This function segment an image.
% Parameter:
% I = The Image that need to be segmented.
%

Ig = im2gray(I);
Id = im2double(Ig);

%Mean-Intensity-Calculation-----------------------------------------------

sum = 0;

for i = 1:height(Id)
    for j = 1:width(Id)
        sum = sum + Id(i,j);
    end
end

total = height(Id)*width(Id);
mean = sum/total;

for i = 1:height(Id)
    for j = 1:width(Id)
        if Id(i,j)> mean
            seg(i,j) = 0;
        else
            seg(i,j) = 1;
        end
    end
end

%Gabor-Function-----------------------------------------------------------

gb01 = gabor2(3,0.1,0,0.75,90);
gb02 = gabor2(3,0.1,0,0.75,0);
conv01 = conv2(seg, gb01, 'same');
conv02 = conv2(seg, gb02, 'same');

gb151 = gabor2(3,0.1,15,0.75,90);
gb152 = gabor2(3,0.1,15,0.75,0);
conv151 = conv2(seg, gb151, 'same');
conv152 = conv2(seg, gb152, 'same');

gb301 = gabor2(3,0.1,30,0.75,90);
gb302 = gabor2(3,0.1,30,0.75,0);
conv301 = conv2(seg, gb301, 'same');
conv302 = conv2(seg, gb302, 'same');

gb451 = gabor2(3,0.1,45,0.75,90);
gb452 = gabor2(3,0.1,45,0.75,0);
conv451 = conv2(seg, gb451, 'same');
conv452 = conv2(seg, gb452, 'same');

gb601 = gabor2(3,0.1,60,0.75,90);
gb602 = gabor2(3,0.1,60,0.75,0);
conv601 = conv2(seg, gb601, 'same');
conv602 = conv2(seg, gb602, 'same');

gb751 = gabor2(3,0.1,75,0.75,90);
gb752 = gabor2(3,0.1,75,0.75,0);
conv751 = conv2(seg, gb751, 'same');
conv752 = conv2(seg, gb752, 'same');

gb901 = gabor2(3,0.1,90,0.75,90);
gb902 = gabor2(3,0.1,90,0.75,0);
conv901 = conv2(seg, gb901, 'same');
conv902 = conv2(seg, gb902, 'same');

gb1051 = gabor2(3,0.1,105,0.75,90);
gb1052 = gabor2(3,0.1,105,0.75,0);
conv1051 = conv2(seg, gb1051, 'same');
conv1052 = conv2(seg, gb1052, 'same');

gb1201 = gabor2(3,0.1,120,0.75,90);
gb1202 = gabor2(3,0.1,120,0.75,0);
conv1201 = conv2(seg, gb1201, 'same');
conv1202 = conv2(seg, gb1202, 'same');

gb1351 = gabor2(3,0.1,135,0.75,90);
gb1352 = gabor2(3,0.1,135,0.75,0);
conv1351 = conv2(seg, gb1351, 'same');
conv1352 = conv2(seg, gb1352, 'same');

gb1501 = gabor2(3,0.1,150,0.75,90);
gb1502 = gabor2(3,0.1,150,0.75,0);
conv1501 = conv2(seg, gb1501, 'same');
conv1502 = conv2(seg, gb1502, 'same');

gb1651 = gabor2(3,0.1,165,0.75,90);
gb1652 = gabor2(3,0.1,165,0.75,0);
conv1651 = conv2(seg, gb1651, 'same');
conv1652 = conv2(seg, gb1652, 'same');

for i = 1:height(Id)
    for j = 1:width(Id)
        
       norm0 = sqrt(conv01(i,j)^2 + conv02(i,j)^2);
       norm15 = sqrt(conv151(i,j)^2 + conv152(i,j)^2);
       norm30 = sqrt(conv301(i,j)^2 + conv302(i,j)^2);
       norm45 = sqrt(conv451(i,j)^2 + conv452(i,j)^2);
       norm60 = sqrt(conv601(i,j)^2 + conv602(i,j)^2);
       norm75 = sqrt(conv751(i,j)^2 + conv752(i,j)^2);
       norm90 = sqrt(conv901(i,j)^2 + conv902(i,j)^2);
       norm105 = sqrt(conv1051(i,j)^2 + conv1052(i,j)^2);
       norm120 = sqrt(conv1201(i,j)^2 + conv1202(i,j)^2);
       norm135 = sqrt(conv1351(i,j)^2 + conv1352(i,j)^2);
       norm150 = sqrt(conv1501(i,j)^2 + conv1502(i,j)^2);
       norm165 = sqrt(conv1651(i,j)^2 + conv1652(i,j)^2);
       
       norm(i,j)= max([norm0,norm15,norm30,norm45,norm60,norm75,norm90,norm105,norm120,norm135,norm150,norm165]);
       
    end
end

%Double-To-Binary---------------------------------------------------------

temp = norm;

for i = 1:height(norm)
    for j = 1:width(norm)
        if norm(i,j)> mean
            temp(i,j) = 1;
        else 
            temp(i,j) = 0;
        end
    end
end

%Erosion------------------------------------------------------------------

temp = logical(temp);
seg = bwperim(temp, 8);


