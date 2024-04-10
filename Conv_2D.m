image = [1, 2, 3, 4, 5, 6, 7, 8, 9;
         1, 2, 3, 4, 5, 6, 7, 8, 9;
         1, 2, 3, 4, 5, 6, 7, 8, 9;
         1, 2, 3, 4, 5, 6, 7, 8, 9;
         1, 2, 3, 4, 5, 6, 7, 8, 9;
         1, 2, 3, 4, 5, 6, 7, 8, 9;
         1, 2, 3, 4, 5, 6, 7, 8, 9;
         1, 2, 3, 4, 5, 6, 7, 8, 9;
         1, 2, 3, 4, 5, 6, 7, 8, 9]

 filter=[1,1,1;
         1,1,1;
         1,1,1;]
     
 %size of the image 
 
 [img_row,img_col]=size(image)
 [filter_row,filter_col]=size(filter)
 
pad_rows=floor((filter_row)/2)
pad_cols=floor((filter_col)/2)

padded_image=padarray(image,[pad_rows,pad_cols])

output=zeros(size(image));

%2D conv 

for i=1:img_row
    for j=1:img_col
        roi=padded_image(i:i+filter_row-1,j:j+filter_col-1);
        output(i,j)=sum(sum(roi.*filter))
    end 
end

subplot 211
imshow(image,[])
colormap(gray)

subplot 212
imshow(output,[])
colormap(gray)


