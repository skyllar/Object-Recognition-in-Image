# Object-Recognition-in-Image (Using Simple Bag-Of-Words model)
Problem Statement:
Given a training dataset and a test dataset, both containing 32 x 32 px color images of various objects; the task is to label each image with one of the 10 classes. The 10 object classes are: 

Object Classes - CIFAR-10
Airplane	Automobile	Bird	Cat	Deer
Dog	Frog	Horse	Ship	Truck

Data Input:
	The dataset consist of 60,000 32x32 px color images in 10 classes, with 6000 images per class. There are 50,000 training images and 10,000 test images.
Data Output:
	The output of the project should be classes associated with each of 10,000 test 32x32 px images.

Kaggle rank and score achieved through our Appraoch:
1.	Rank: 140 
2.	Score: 0.39020

Approach Discussion:
	The given training dataset consist of 32x32 colored images of 10 classes of objects defined above. The process of classification of the test data requires “learning” on the training data and applying a model on the “test” data. So the complete process can be divided into following sub processes:
  
Step1: Creating Feature Vector for Training Data.
	Each of the 32x32 image is divided into 4x4 chunk to get in all 64 sub-images.  Center of each sub-image is chosen as an interesting point and radius chosen as 2px for Scale Invariant Feature Transform. This process outputs a local descriptor consisting of 128 double values that represent one sub-image. So in all for one image, a matrix of dimension 64 x 128 is generated.
	Since the number of dimensions is too high, Principal Component Analysis is applied on this matrix to reduce the dimensionality to 5.

Steps are as follows:
1.	Each 32x32 training-image is divided into 4x4 sub-part.
2.	Now, each 4x4 sub-image center is taken as an interesting point.
3.	Thus, total 64 interesting points passed to SIFT to obtain feature vector for an image.
4.	Each center generates 128 length vector.
5.	For each image we get 64x128 feature representation.
6.	This is done for all test images. (Total = (50000x64) * 128)
7.	Use Eigen values already obtained (after applying PCA on training data) to reduce dimensions of training image.
a.	Number of principal components used  =  5
8.	So final feature vector : (50000x64) x 5
9.	Club: (50000x (64x5)) Each row is feature vector of each image.

Step2: Classification-Model generation on Training Data.
1.	ClassificationKNN.fit(X) returns a classification model based on feature X.
2.	Parameters:
a.	Number of nearest neighbors to find (k) – 21
b.	Distance metric - Euclidean

Step3: Creating Feature Vector for Test Data.
To handle large test-set of 300,000 images, divide it into 6 parts each containing 50,000 images. Now, process every part of 50,000 images in the following way:
1.	Each 32x32 test-image is divided into 4x4 sub-part.
2.	Now, each 4x4 sub-image center is taken as an interesting point.
3.	Thus, total 64 interesting points passed to SIFT to obtain feature vector for an image.
4.	Each center generates 128 length vector.
5.	For each image we get 64x128 feature representation.
6.	This is done for all test images. (Total = (50000x64) * 128).
7.	Use Eigen values already obtained (after applying PCA on training data) to reduce dimensions of test image.
a.	Number of principal components used =  5
8.	So final feature vector : (50000x64) x 5
9.	Club: (50000x (64x5)) Each row is feature vector of each image.
Thus we will have, 6 parts each of size (50000x (64x5)) that represents whole test data.

Step4: Applying classification on Test Data.
1.	Apply KNN classification with K = 21 to get final classification label.
2.	Thus we get the final classification of the 300,000 test images.
