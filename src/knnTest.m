
    
function[outputLabels] = knnTest(model,finalPcaTestMatrix,range)
outputLabels = predict(model,finalPcaTestMatrix);
save( strcat('KNN5outputLabels',num2str(range)), 'outputLabels');
%('accuracy:');
%disp(sum(strcmp(od1,testExpLabels))/10000);
end