image = imread('brain_tumor.jpg');
if size(image, 3) == 3
    image = rgb2gray(image);
end
figure;
subplot(1, 2, 1);
imshow(image);
title('Original Image');
laplacian_filter = [1 1 1 1 1;1 1 0 0 0; 1  -1  -1  1 1;-1 -1 -1 -1 -1;0 0 0 -1 -1]; % 5x5 Laplacian filter
pad_amount = floor(size(laplacian_filter,1)/2);
padded_image = padarray(image, [pad_amount, pad_amount]);
output_image = zeros(size(image));
for i = 1:size(image, 1)
    for j = 1:size(image, 2)
        
        neighborhood = double(padded_image(i:i+2*pad_amount, j:j+2*pad_amount));
        
        
        output_image(i, j) = sum(sum(neighborhood .* laplacian_filter));
    end
end

subplot(1, 2, 2);
imshow(uint8(output_image)); 
title('High-pass Filtered Image (Laplacian)');
