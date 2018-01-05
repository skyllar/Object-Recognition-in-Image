u=unique(train_labels);
trainingLabelNum=zeros(40000,1);
for i=1:10
    index=find( strcmp( train_labels, u(i)) == 1);
    train_labelsNum(index,1)=i;
end
