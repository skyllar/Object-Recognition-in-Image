function [svmModels] = multisvmTraining(TrainingSet,GroupTrain)
u=unique(GroupTrain);
numClasses=length(u);

%set the maximum number of iterations
optSVM = statset('MaxIter', 20000,'Display','iter');     

%'method','QP'
%'tolkkt', 0.01

%build models
for k=1:numClasses
    %Vectorized statement that binarizes Group
    %where 1 is the current class and 0 is all other classes
    G1vAll=(strcmp(GroupTrain,u(k)));
    svmModels(k) = svmtrain(TrainingSet,G1vAll,'kktviolationlevel',0.01,'options', optSVM,'tolkkt',1e-3,'kernel_function','mlp');
    disp('-------------->Class Model Generated:-');
    disp(k);
end

save('svmModels','svmModels');
end