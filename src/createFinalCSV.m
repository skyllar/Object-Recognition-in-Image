function [] = createFinalCSV (outputLabels,range)

csvPath  = 'new csv\';
csvN = strcat('final_csv',num2str(range));
csvName = strcat(csvN,'.csv');
finalPath = strcat(csvPath,csvName);
fi = fopen(finalPath,'w');

fprintf(fi,'id,label\n');

for i = 1:length(outputLabels)
    fprintf(fi,'%d,%s\n',range-50000+i,outputLabels{i,1});
end

fclose(fi);

end