%% Runs imofy
%%loadTestData

%% Create test vector
index = 1;
testKNN300000 = zeros(50000*64,48);
for image_id = 250001:300000
    
    im = imageMatrixTest(:,:,:,image_id);
    
    for i = 1:4:32
        start_var = i:i+3;
        for j = 1:12:96,
            end_var = j:j+11;
                   
            b = im(start_var,end_var);
            testKNN300000(index,:) = horzcat(b(1:48));
            index = index + 1;
        
            %for k = 1:length(b)
            %    fprintf(fo,'%d,' , b(k));
            %end
            %fprintf(fo,'%s\n' , 'class');
        end
    end
    %disp(image_id);
end