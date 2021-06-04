# Image-Enhancement
Implement colored image enhancement algorithms 

Color image enhancement is one of the vital emerging techniques in the field of Digital Image Processing. In this paper, we propose Color Image Enhancement using Laplacian filter and Contrast Limited Adaptive Histogram Equalization. The original RGB color image is considered from Computer Vision Group database and is converted to Hue-Saturation-Value (HSV) with Laplace filter applied to S and V components. The processing block which involves local correlation, variance and luminance enhancement are performed on laplacian output of V and S components and the Contrast Limited Adaptive Histogram Equalization (CLAHE) is applied on enhanced luminance component output followed by contrast stretching on S component. Finally, the HSV components are converted to RGB and performance parameter of enhancement is obtained. It is observed that the proposed method obtain better PSNR compared to existing methods