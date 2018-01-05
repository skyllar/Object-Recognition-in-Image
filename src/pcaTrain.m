function [ trainDataPCA ,final] = pcaTrain( imageMatrix )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    %mushroom_bits=bit_matrix(data);
	
	pcaDimensions= 5;

    cv=cov(imageMatrix);
    [eig_vectors,eig_values]=eig(cv);
    [d,q]=sort(-diag(eig_values));
    %first = eig_vectors(:,q(1));
    %second= eig_vectors(:,q(2));
    
	%third= eig_vectors(:,q(3));
    %fourth= eig_vectors(:,q(4));
   
    final=eig_vectors(:,q(1:pcaDimensions));
    trainDataPCA=imageMatrix * final;
    %save('das');
end