function [ w0 ] = Perceptron(class1,class2,p)
%PERCEPTRON Implements the perceptron algorithm.
%   Inputs:
%   -class1 = list of points from class1
%   -class2 = list of points from class2
%   -p      = penalty weighting
%   Outputs:
%   -w0     = weight vector that defines the hyperplane
nClass1 = size(class1,1);
nClass2 = size(class2,1);
N = nClass1 + nClass2;

vectorList = [class1 ; class2];

count = 0; % The count of points with no correction
index = 1; % The index of the current point

w0 = [0 0 0]';

while count < N % cycle until all N points have passed without correction
    x0 = [vectorList(index,:) 1]'; % current point
    flag = w0' * x0;
    
    if (index <= nClass1) && (flag <= 0) % class 1 point needs correction
        w0 = w0 + p*x0;
        count = 0;
    elseif (index > nClass1) && (flag >= 0) % class 2 point needs correction
        w0 = w0 - p*x0;
        count = 0;
    else
        count = count + 1; % increment every time a point is classified correctly
    end
    
    index = index + 1; % Increment to the next point
    
    % in case you reach the end of the points list
    if index > N
        index = 1;
    end
end

y_intercept = [0,-w0(3)/w0(2)];
x_intercept = [-w0(3)/w0(1),0];
linePoints = [y_intercept;x_intercept];
disp(linePoints);
scatter(class1(:,1),class1(:,2));
hold on;
scatter(class2(:,1),class2(:,2));
plot(linePoints(:,1),linePoints(:,2),'-');
xlim([-1 2]); ylim([-1 2]);

