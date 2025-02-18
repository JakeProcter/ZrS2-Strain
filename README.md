# ZrS₂-Strain  

This repository contains code and resources for my dissertation on tailoring ZrS₂’s electronic properties via strain engineering using DFT simulations with FHI-aims, ASE, and Python. The study explores how applied strain influences ZrS₂’s band gap and effective mass.  

## Convergence Testing  
To determine an optimal balance between computational efficiency and accuracy, convergence tests were conducted using:  
- **PBE** (light, intermediate, tight) with k-space grids [2, 4, 6, 8, 10, 12, 14].  
- **HSE06** (light, intermediate, tight) with k-space grids [2, 4, 6, 8, 10, 12, 14].  

The most accurate results were obtained with **HSE06 (tight) and k-space 14**, with a computational time of approximately **1619 seconds**. These convergence test files are available in the **Convergence Tests** folder.  

## Strained Geometry Generation  
A Python script in **Python/Strained Geometry** systematically modifies the `geometry.in` file to apply strain ranging from -8% to +8% in integer steps. The resulting strained geometries are stored in **Python/Strained Geometry/Strained_Geometries**.  

## Automated Calculations  
A shell script (`run_aims.sh`) was developed to execute DFT calculations for all 17 strained structures systematically on a remote HPC. This script is located in **Strained_Geometry_Band_Structure**.  

## Band Structure Analysis  
Following the DFT runs, another shell script iterates through the `aims.out` files, generating band structures for each strained configuration. A Python script in **Python/Band Structure Calcs** extracts and plots the band structure data. Processed band structure plots, along with GIFs visualising the evolution of the band structure under strain, are available in **Python/Band Structure Calcs**.     

## Semiconductor-to-Metal Transition  
After observing a decreasing band gap trend with increasing tensile strain, a gradient was calculated to estimate the strain value at which the band gap closes. A Python script in **Python/Semiconductor to Metal** performs this analysis. The predicted strain value was then tested using DFT calculations, confirming a band gap of zero at the estimated strain. All related scripts, results, and visualisations can be found in this section.  


