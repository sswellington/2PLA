# 2PLA: A Two-Phase Learning Approach

**WARNING:** Before we get started, please notice *2PLA* is **NOT** a clinical software. It is built for reproducibility and demonstration purposes **ONLY**.

This repository contains the *2PLA* (Two-Phase Learning Approach), a method that combines supervised and unsupervised learning strategies for enhancing the segmentation of dermatological wounds.

Given an ulcer photo captured according to a fixed protocol, *2PLA* first phase performs a pixelwise classification of points of interest, whereas pre-processing filters are employed for the smoothing of image noise.

The cleaned image is then further sent to the *2PLA* divide-and-conquer second phase. It builds upon SLIC superpixel construction algorithm for dividing the lower limp into regions of interest with well-defined borders, and clusters the superpixels by taking advantage of the similarity-based DBSCAN algorithm.

<p align="center">
<img src="Figure 1.png">
</p>

### 1. Minimum Requirements

* Matlab R2018b.
* Screen resolution: 1920×1080 (or higher).
* 350 MB free disk space.
* 4 GB RAM.
* Intel i5 4th generation core processor.

### 2. Folder Description

The content of this repository is organized as follows:

* dataset: pixels extracted from various sample values of images of ULCER_SET dataset [1] and employed for the tuning and evaluation of our approach.
* image: 6 images processed by the first phase of the method and the same images processed by the second phase of the method.
* src: implementation of *2PLA*, where the *main* function implements *Algorithm 1* of the submitted paper. 

### 3. Third-party software and data

* This demonstration includes third-party software from Matlab. It uses both ANN and DBSCAN native packages. SLIC superpixel implementation was used as is provided in the [Peter Kovesi's original code](https://www.peterkovesi.com/matlabfns/index.html), which is similar to the [Matlab Toolbox](https://www.mathworks.com/help/images/ref/superpixels.html).

* Images employed in the experiments are derived from ULCER_SET dataset [1]. To obtain the original dataset, please contact the authors and request their permission.

### 3. Additional Information and Legal Note

The code is provided 'as is' and any expressed or implied warranties, including but not limited to, the implied warranties of merchantability and fitness for a particular purpose are disclaimed. In no event shall the authors of this software or its contributors be liable for any direct, indirect, incidental, special, exemplary, or consequential damages (including but not limited to, procurement of substitutive goods or services, loss of use, data, or profits; or business interruption) however caused and on any theory of liability wheter in contract, strict liability, or tort (including negligence or otherwise) arising in any way out of the use of this demonstration, even if advised of the possibility of such damage.

Again, *2PLA* is **NOT** a clinical software.

### References

[1] S. M. Pereira, M. A. C. Frade, R. M. Rangayyan, and P. M. Azevedo-Marques. Classification of color images of dermatological ulcers. Journal of Biomedicine and Health, 17(1):136–142, 2013.
