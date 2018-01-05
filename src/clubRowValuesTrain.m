pcaDimensions= 5;

finalPcaTrainingMatrix = zeros(50000,pcaDimensions * 64);

for i = 1:50000
    k = 1;
    for j = 1:64
		finalPcaTrainingMatrix(i,k:k+pcaDimensions-1) =trainDataPCA((i-1)*64 + j,1:pcaDimensions);
		 
       %finalPcaTrainingMatrix(i,k) = pcaTrainingMatrix((i-1)*64 + j,1);
       %k = k + 1;
       %finalPcaTrainingMatrix(i,k) = pcaTrainingMatrix((i-1)*64 + j,2);
       %k = k + 1;
       %finalPcaTrainingMatrix(i,k) = pcaTrainingMatrix((i-1)*64 + j,3);
       %k = k + 1;
       %finalPcaTrainingMatrix(i,k) = pcaTrainingMatrix((i-1)*64 + j,4);
       %k = k + 1;
		k = k+pcaDimensions;

    end
end

save('finalPcaTrainingMatrix','finalPcaTrainingMatrix');