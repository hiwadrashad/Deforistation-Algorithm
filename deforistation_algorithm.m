predeforistation = imread("images/deforisitation-pre.png");
title("pre-deforistation")
postdeforistation = imread("images/deforisitation-post.png");
title("post-deforistation")
imshowpair(predeforistation,postdeforistation,"montage");
title("pre vs post deforistation")
graypredeforistation = im2gray(predeforistation);
imshow(graypredeforistation);
title("pre deforistation gray scale");
graypostdeforistation = im2gray(postdeforistation);
imshow(graypostdeforistation);
title("post deforistation gray scale");
imhist(graypredeforistation);
title("grayscale histogram pre-deforistation");
imhist(graypostdeforistation);
title("grayscale histogram post-deforistation");
adjpreforestation = imadjust(graypredeforistation);
adjpostforestation = imadjust(graypostdeforistation);
%imageSegmenter; not available on online version do this trough external app%
imwrite(adjpreforestation, 'adjpreforestationimg.png');
imwrite(adjpostforestation, 'adjpostforestationimg.png');
% convert to img, download and apply image segmentation &
propspre = regionprops("table",adjpreforestation,"Area");
areaPixelsPre = sum(propspre.Area);
propspost = regionprops("table",adjpostforestation,"Area");
areaPixelsPost = sum(propspost.Area);
Title = [ 2];
Deforistation = [areaPixelsPre areaPixelsPost];
DeforistationTable = table(Title,Deforistation);
bar(Title,Deforistation);
