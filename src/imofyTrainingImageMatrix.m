%% Runs imofy
loadTrainingData

%% Create test vector

index = 1;
trainKNN = zeros(50000*64,48);
for image_id = 1:50000
    
    im = imageMatrix(:,:,:,image_id);
    
    for i = 1:4:32
        start_var = i:i+3;
        for j = 1:12:96,
            end_var = j:j+11;
                   
            b = im(start_var,end_var);
            trainKNN(index,:) = horzcat(b(1:48));
            index = index + 1;
        
            %for k = 1:length(b)
            %    fprintf(fo,'%d,' , b(k));
            %end
            %fprintf(fo,'%s\n' , 'class');
        end
    end
    %disp(image_id);
end

temp_array = dataset2cell(classArray);
class_temp = temp_array(2:50001);
index = 1;
classLabelKNN = cell(1,50000*64);
for image_id = 1:length(class_temp)
    for i = 1:64
        classLabelKNN(index) = class_temp(image_id);
        index = index + 1;
    end
end