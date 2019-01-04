function result = ann(image)

load netLM;

sizeLine = size(image,1);
sizeColumn = size(image,2);
pixel = [0,0,0];

for i = 1 : sizeLine 
    for j = 1 : sizeColumn
        
        pixel(:) = image(i,j,:);  
        labeled = netLM( pixel');
        
        if (labeled < 0.5)
            
            image(i,j,:) = 0;
        end
    end
end

result = image;
