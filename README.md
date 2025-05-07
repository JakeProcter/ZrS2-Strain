# ZrS₂-Strain  

This repository contains code and resources for my dissertation on tailoring ZrS₂’s electronic properties via strain engineering using DFT simulations with FHI-aims, ASE, and Python. The study explores how applied strain influences ZrS₂’s band gap and effective mass. All methods and results are documented in the report. 

### Band Structure Visualisations:
Below are the GIFs showing the evolution of the band structure under different types of strain.

1. **C-axis Strain (-8% to +8%)**  
   <img src="Python/C_Strain/Band%20Structure%20Plot%20Gifs/gif_3_-8_to_+8_percent.gif" width="350"/>

2. **A-B Strain (-8% to +8%)**  
   <img src="Python/A_B_Strain/Band%20Structure%20Plot%20Gifs/gif_3_-8_to_+8_percent.gif" width="350"/>

## Semiconductor-to-Metal Transition
A linear decrease was observed with increasing tensile strain, so a line of best fit was plotted to estimate the strain at which a semiconductor-to-metal transition would occur. This strain value was then implemented into a geometry file, and a DFT calculation was performed. The added point of **0.02** eV at -12.34% strain suggests that a semiconductor-to-metal transition would take place.

<img src="Python/Semiconductor%20to%20Metal/Strained%20Plots/strain_vs_HOMO_LUMO.png" width="350"/>

After observing a decreasing band gap trend with increasing tensile strain, a gradient was calculated to estimate the strain value at which the band gap closes. This was confirmed using DFT calculations, resulting in a zero band gap at the estimated strain value.

## Effective Mass and Carrier Mobility

### C-axis Strain Effective Mass and Carrier Mobility
The effective mass of carriers under c-axis strain and their corresponding carrier mobility are calculated and plotted below:

- **Effective Mass (C-axis Strain):**  
  <img src="Python/Effective%20Mass/C-Strain/C_Effmass.png" width="350"/>

- **Carrier Mobility (C-axis Strain):**  
  <img src="Python/Effective%20Mass/C-Strain/C_Mobility.png" width="350"/>

### A-B Strain Effective Mass and Carrier Mobility
Similarly, the effective mass and carrier mobility for A-B strain are shown below:

- **Effective Mass (A-B Strain):**  
  <img src="Python/Effective%20Mass/A-B-Strain/AB_Effmass.png" width="350"/>

- **Carrier Mobility (A-B Strain):**  
  <img src="Python/Effective%20Mass/A-B-Strain/AB_Mobility.png" width="350"/>

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
