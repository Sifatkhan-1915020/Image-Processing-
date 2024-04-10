
image = imread('brain_tumor.jpg');
if size(image, 3) == 3
    image = rgb2gray(image);
end

figure;
subplot(1, 3, 1);
imshow(image);
title('Original Image');
window_size = 3; 
pad_amount = floor(window_size / 2);
padded_image = padarray(image, [pad_amount, pad_amount]);
max_output = zeros(size(image));
min_output = zeros(size(image));
for i = 1:size(image, 1)
    for j = 1:size(image, 2)
        neighborhood = padded_image(i:i+window_size-1, j:j+window_size-1);
        max_output(i, j) = max(neighborhood(:));
        min_output(i, j) = min(neighborhood(:));
    end
end

subplot(1, 3, 2);
imshow(uint8(max_output)); 
title('Maximum Filtered Image');

subplot(1, 3, 3);
imshow(uint8(min_output)); 
title('Minimum Filtered Image');
