function [finalPcaTestMatrix]=clubRowValuesTest(testDataPCA,range)
pcaDimensions= 5;

finalPcaTestMatrix = zeros(50000,pcaDimensions * 64);
for i = 1:50000
    k = 1;
    for j = 1:64
		
       finalPcaTestMatrix(i,k:k+pcaDimensions-1) =testDataPCA((i-1)*64 + j,1:pcaDimensions);
	   %{
       k = k + 1;
       finalPcaTestMatrix(i,k) = dummyPcaTest((i-1)*64 + j,2);
       k = k + 1;
       finalPcaTestMatrix(i,k) = dummyPcaTest((i-1)*64 + j,3);
       k = k + 1;
      finalPcaTestMatrix(i,k) = dummyPcaTest((i-1)*64 + j,4);
       k = k + 1;
	   %}
	   k = k+pcaDimensions;
    end
end

save( strcat('finalPcaTestMatrix',num2str(range)),'finalPcaTestMatrix');
end