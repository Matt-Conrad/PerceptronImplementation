% Matthew Conrad
% 2/5/2018
clear all;
clc;

%% Create the 50 feature vectors for each class. These points are made linearly separable by ignoring points that get close to the other class.
mean1 = [1 1];
mean2 = [0 0];
std = 0.2;

nVectors = 50;

vectors1 = zeros(nVectors,2);
vectors2 = zeros(nVectors,2);

count = 0;
while count < 50
    possible_vector = normrnd(mean1,std);
    if sum(possible_vector) >= 1
        vectors1(count+1,:) = possible_vector;
        count = count + 1;
    end
end

count = 0;
while count < 50
    possible_vector = normrnd(mean2,std);
    if sum(possible_vector) <= 1
        vectors2(count+1,:) = possible_vector;
        count = count + 1;
    end
end

scatter(vectors1(:,1),vectors1(:,2));
hold on;
scatter(vectors2(:,1),vectors2(:,2));
xlim([-1 2]); ylim([-1 2]);

%% Test the Perceptron.m function
% w0 = Perceptron([0,0;0,1],[1,0;1,1],1); % Works for problem 4
w0 = Perceptron(vectors1,vectors2,1);