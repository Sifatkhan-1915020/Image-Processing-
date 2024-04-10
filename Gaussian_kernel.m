image = randi([0, 255], 100, 100);
sigma = 1; %std dev
kernel_size = 5; 
half_kernel_size = floor(kernel_size / 2);
[x, y] = meshgrid(-half_kernel_size:half_kernel_size, -half_kernel_size:half_kernel_size);
gaussian_kernel = exp(-(x.^2 + y.^2) / (2 * sigma^2)) / (2 * pi * sigma^2);
gaussian_kernel = gaussian_kernel / sum(gaussian_kernel, 'all');
padded_image = padarray(image, [half_kernel_size, half_kernel_size]);
output = zeros(size(image));
for i = 1:size(image, 1)
    for j = 1:size(image, 2)
        roi = padded_image(i:i+kernel_size-1, j:j+kernel_size-1);
        output(i, j) = sum(sum(roi .* gaussian_kernel));
    end
end

% Display the output
figure;
subplot(1, 2, 1);
imshow(image, []);
title('Original Image');

subplot(1, 2, 2);
imshow(output, []);
title('Smoothed Image (Gaussian Filter)');
