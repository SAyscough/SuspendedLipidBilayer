# Suspended Phospholipid Bilayers
Sophie Ayscough*, Max Skoda, Luke Clifton, Simon Titmuss

sophie.ayscough@ess.eu

 ![arXiv](https://img.shields.io/badge/Chemrxiv-10.26434%2Fchemrxiv--2022--250v6-red)
 
 
 
## ESI for "Suspended phospholipid bilayers: a new and versatile biological membrane model"
This is the Electronic supplmentary information for the article "Suspended phospholipid bilayers: a new and versatile biological membrane model". This ESI provides the data and models used for the analysis of neutron reflectivity data in the article, and the Reflection Absorption Infrared Spectroscopy (RAIRS) Data displayed in the supplementary information. The RAIRS data is given as the integrated area of the CH$_2$/CD$_2$ asymmetric stretch bands against time. 

10.26434/chemrxiv-2022-250v6

The full neutron reflectometry data set can be accesed at ISIS: 
Dr Simon Titmuss et al; (2019): Lipid bilayers suspended beneath the air/water interface for neutron reflectivity investigation of mechanosensitive ion channels, STFC ISIS Neutron and Muon Source, https://doi.org/10.5286/ISIS.E.RB1910569-1


## For formation of first suspended bilayer:

**54578**
DODAB monolayer

[Data file: 54578_IvsQ_binned.dat , Rascal fitting file: 578_mono.mat , model file:lipidapmmodel_dodabonly.m] 



**54579**
1 hr from the start of liposome addition

[Data file: 54579_IVsQ_binned.dat, Rascal fitting file: 579_db.mat , model file: lipidapmmodel_doublebilayerhyd_diff_dodab.m] 



**54580_81**
1.5 hrs from the start of liposome addition

[Data file:54580_81.dat , Rascal fitting file 580_81_db.mat: , model file: lipidapmmodel_doublebilayerhyd_dodab.m ] 



**54583_84**
After addition of 300 mM NaCl

[Data file:54583_84.dat , Rascal fitting file: 583_84_db_300mMNaCl.mat, model file: lipidapmmodel_doublebilayerhyd_dodab.m] 



**54586_87**
After addition of 150 mM NaCl

[Data file:54586_87.dat , Rascal fitting file: 586_87_bilanddiff.mat , model file:lipidapmmodel_bilayerhyd_diff_dodab.m] 

## For the second final formed bilayer

**54696_97, 54699_00**
Bilayer measured with D2O and 42% D2O 58% H2O subphase.

[Data files: 54696_97.dat, 54699_00.dat , Rascal fitting file: FinalAirWaterBil.mat , model file:volumemodel_sdodab_bilayeronly_300420.m] 

The model for fitting the second final formed bilayer without describing a monolayer, fits shown in the supplementary information: [file:volumemodel_nododab_bilayeronly_300420.m]

## Acknowledgements
We thank ISIS for use of the INTER reflectometer (DOI: 10.5286/ISIS.E.RB1910569) and user labs including the ISIS Biolabs and for use of the iS50 Thermo-Nicolet Fourier Transform Infrared Spectrometer (FT-IR). We also thank Diamond Light Source for beamtime on IO7 (SI22995-1) that allowed for further testing of trough design and bilayer assembly (data not shown in this paper), with special thanks to Jonathan Rawle Instrument Scientist and Andrew McCluskey for data fitting discussions. We would also like to thank Jacob Simms, senior mechanical support technician at ISIS for aiding in the design and fabrication of our final reflectometry trough design, in particular for the technical drawings. We thank the mechanical workshop in the School of Physics \& Astronomy, at the University of Edinburgh for fabrication of initial reflectometry trough prototypes. Sophie Ayscough was supported by the EPSRC CDT on ``Soft and Functional Interfaces'' (EP/L015536/1) and an ISIS Facility Development Studentship.
