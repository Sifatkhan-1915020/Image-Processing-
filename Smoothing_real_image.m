% Read an image from file
image = imread('brain_tumor.jpg'); % Provide the path to your image file

% Convert the image to grayscale if it's in RGB format
if size(image, 3) == 3
    image = rgb2gray(image);
end

% Display the original image
figure;
subplot(1, 2, 1);
imshow(image);
title('Original Image');

sigma =5; 
kernel_size = 9; 

% Create a Gaussian filter kernel
half_kernel_size = floor(kernel_size / 2);
[x, y] = meshgrid(-half_kernel_size:half_kernel_size, -half_kernel_size:half_kernel_size);
gaussian_kernel = exp(-(x.^2 + y.^2) / (2 * sigma^2)) / (2 * pi * sigma^2);
gaussian_kernel = gaussian_kernel / sum(gaussian_kernel, 'all');
padded_image = padarray(image, [half_kernel_size, half_kernel_size]);
output = zeros(size(image), 'like', image); 
for i = 1:size(image, 1)
    for j = 1:size(image, 2)
        roi = double(padded_image(i:i+kernel_size-1, j:j+kernel_size-1)); 
        output(i, j) = sum(sum(roi .* gaussian_kernel));
    end
end
subplot(1, 2, 2);
imshow(uint8(output)); 
title('Smoothed Image (Gaussian Filter)');
