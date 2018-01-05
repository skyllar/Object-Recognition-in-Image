model = ClassificationKNN.fit(finalPcaTrainingMatrix,trainingLabelCell,'NumNeighbors',21,'Distance','euclidean');
save('KNN5model','model');
disp('training done..');
