run('C:\Users\Apratim\Documents\MATLAB\imofy\vlfeat-0.9.19-bin\vlfeat-0.9.19\toolbox\vl_setup.m');

chunkSize=50000;
for chunk=2:4
testDataSIFT=zeros(chunkSize*64,128);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
totalindex=1;
    %reason 80% train data 20% test data
    start=(chunk-1)*chunkSize+1;
    last = (chunk)*chunkSize;
    for index=start:last
        if mod(index,1000) == 0
            disp(index);
            disp(chunk);
        end
        
        I=imageMatrixTest(:,:,:,index);
        I=single(rgb2gray(I));
        for xcoord=2:4:30
            for ycoord=2:4:30
                fc=[xcoord;ycoord;2;0];
                [~,d]=vl_sift(I,'frames',fc);
                testDataSIFT(totalindex,:)=d(:,1);
                totalindex=totalindex+1;
            end
        end
    end
     varName = strcat('testDataSIFT',num2str(last));
    save(varName,'testDataSIFT','-v7.3') ;
    clear('testDataSIFT');
end 
   