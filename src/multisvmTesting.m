
function [result] = multisvmTesting(TestSet,models,GroupTrain)
result = cell(length(TestSet(:,1)),1);
u=unique(GroupTrain);

%classify test cases
for j=1:size(TestSet,1)
    k=1;
    while k<=10
        if(svmclassify(models(k),TestSet(j,:))) 
            break;
        end
        k=k+1;
    end
    if k == 11
        k=1;
    end
    result(j) = u(k);
    if mod(j,1000) == 0
        disp(j);
    end
end
    save('svmResult','result');
end