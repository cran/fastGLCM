## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = TRUE,
  echo = TRUE)

## -----------------------------------------------------------------------------

require(fastGLCM)
require(OpenImageR)
require(utils)

temp_dir = tempdir(check = FALSE)
# temp_dir

zip_file = system.file('images', 'JAXA_Joso-City2_PAN.tif.zip', package = "fastGLCM")
utils::unzip(zip_file, exdir = temp_dir)
path_extracted = file.path(temp_dir, 'JAXA_Joso-City2_PAN.tif')

im = readImage(path = path_extracted)
dim(im)


## -----------------------------------------------------------------------------

imageShow(im)


## -----------------------------------------------------------------------------

#....................................................
# the pixel values will be adjusted between 0 and 255
#....................................................

im = resizeImage(im, 500, 500, 'nearest')
im = OpenImageR::norm_matrix_range(im, 0, 255)

#---------------------------------
# computation of all GLCM features
#---------------------------------

methods = c('mean',
            'std',
            'contrast',
            'dissimilarity',
            'homogeneity',
            'ASM',
            'energy',
            'max',
            'entropy')

res_glcm = fastGLCM_Rcpp(data = im,
                         methods = methods,
                         levels = 8,
                         kernel_size = 5,
                         distance = 1.0,
                         angle = 0.0,
                         threads = 1,
                         verbose = TRUE)

if (file.exists(path_extracted)) file.remove(path_extracted)

str(res_glcm)


## ----eval = FALSE-------------------------------------------------------------
# 
# plot_multi_images(list_images = res_glcm,
#                   par_ROWS = 2,
#                   par_COLS = 5,
#                   titles = methods)
# 

