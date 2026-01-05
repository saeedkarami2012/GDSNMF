# GDSNMF
**Graph-Regularized Deep Symmetric Nonnegative Matrix Factorization**

This repository contains the implementation of the method proposed in the paper:

## Citation
If you use this code in your research, please cite:

S. Karami, F. Saberi-Movahed, P. Tiwari, S. Nowaczyk, J. Lehmann, and S. Vahdati,  
*Graph-Regularized Deep Symmetric Nonnegative Matrix Factorization*, 2026.
(BibTeX will be added after publication.)

## Requirements
- MATLAB (tested on R2018b and later)



## Running the Code
To reproduce the experiments reported in the paper:

1. Create a folder named `Datasets` in the root directory of the project.
2. Download or prepare the datasets and place them inside the `Datasets` folder.
3. To run the method on the same datasets used in the paper:
   - Refer to `recalldata.m` for dataset indexing.
   - For example, to run the method on the **JAFFE** dataset, execute:
     ```matlab
     main_Deg4(1)
     ```

The results will be saved automatically in the same directory as a .mat file.

## Notes
- Dataset indices and experimental settings are defined in `recalldata.m`.
- For custom datasets, follow the same data format used in the provided examples.

