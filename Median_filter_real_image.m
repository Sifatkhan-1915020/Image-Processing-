image=imread('balloons_noisy.png')

if size(image,3)==3
   image=rgb2gray(image);
end

figure(1)
imshow(image)
title('orginal gray image')

window_size=6;
pad_amount=floor(window_size/2);
padded_image=padarray(image,[pad_amount,pad_amount]);

output=zeros(size(image));

for i=1:size(image,1)
    for j=1:size(image,2)
        neighborhood=padded_image(i:i+window_size-1,j:j+window_size-1);
        median_value=double(median(neighborhood(:)));
        output(i,j)=median_value;
    end 
end

figure(2)
output_rgb = repmat(uint8(output), [1, 1, 3]);
imshow(output_rgb);
title('smoothed Image(median filter)')