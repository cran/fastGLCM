
## fastGLCM

<br>

Fast GLCM feature texture computation. This R package includes two GLCM implementations: 

* An Rcpp Armadillo implementation which is parallelized and modified to return all GLCM features at once. Preferably use this version but be aware that there is a difference when computing the convolution between the OpenCV (python fastGLCM implementation) and the Armadillo library (Rcpp implementation). OpenCV performs interpolation in the image boundaries whereas Armadillo does not. For big images there is no visual difference but it's visible in small imagery.
* A fast GLCM feature texture computation based on *python numpy arrays* (for more information see the ['fastGLCM' Python Code Github Repository](https://github.com/tzm030329/GLCM)). To use this version, you will need to have Python configured in your Operating System and the [reticulate](https://github.com/rstudio/reticulate) R package installed.

More details on the functionality of *fastGLCM* can be found in the package [Documentation](https://mlampros.github.io/fastGLCM/reference/index.html), [Vignette](https://mlampros.github.io/fastGLCM/articles/fastGLCM_Functionality.html) and [blog-post](http://mlampros.github.io/2022/08/16/gray_level_co_occurrence_matrix/)

<br>

### Installation:

<br>

To install the package from CRAN use, 

```R
install.packages("fastGLCM")

```
<br>

and to download the latest version of the package from Github,

```R
remotes::install_github('mlampros/fastGLCM')

```

<br>

#### **Docker Image**

<br>

**Docker images** of the *fastGLCM* package are available to download from my [dockerhub](https://hub.docker.com/r/mlampros/fastglcm) account. The images come with *Rstudio* and the *R-development* version (latest) installed. The whole process was tested on Ubuntu 18.04. To **pull** & **run** the image do the following,

<br>

```R

docker pull mlampros/fastglcm:rstudiodev

docker run -d --name rstudio_dev -e USER=rstudio -e PASSWORD=give_here_your_password --rm -p 8787:8787 mlampros/fastglcm:rstudiodev

```

<br>

The user can also **bind** a home directory / folder to the image to use its files by specifying the **-v** command,

<br>

```R

docker run -d --name rstudio_dev -e USER=rstudio -e PASSWORD=give_here_your_password --rm -p 8787:8787 -v /home/YOUR_DIR:/home/rstudio/YOUR_DIR mlampros/fastglcm:rstudiodev


```

<br>

The **USER** defaults to *rstudio* but you have to give your **PASSWORD** of preference (see [https://rocker-project.org](https://rocker-project.org/) for more information).

<br>

Open your web-browser and depending where the docker image was *build / run* give, 

<br>

**1st. Option** on your personal computer,

<br>

```R
http://0.0.0.0:8787 

```

<br>

**2nd. Option** on a cloud instance, 

<br>

```R
http://Public DNS:8787

```

<br>

to access the Rstudio console in order to give your username and password.

<br>

### **Similar Projects:**

* https://github.com/azvoleff/glcm  (*RcppArmadillo Implementation*)
* https://github.com/ailich/GLCMTextures  (*Rcpp and RcppArmadillo Implementation*)

<br>

### Citation:

<br>

If you use the code of this repository in your paper or research please cite both **fastGLCM** and the **original articles** (see CITATION) `https://CRAN.R-project.org/package=fastGLCM`:

<br>

```R
@Manual{,
  title = {{fastGLCM}: Fast Gray Level Co-occurrence Matrix computation (GLCM) using R},
  author = {Lampros Mouselimis},
  year = {2022},
  note = {R package version 1.0.2},
  url = {https://CRAN.R-project.org/package=fastGLCM},
}
```

<br>
