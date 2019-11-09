# Exomoons_HZ_Mdwarfs

Calculations from Martínez-Rodríguez et al. (2019)
https://arxiv.org/abs/1910.12054


This repository is structured as follows:


- Main IPython notebook ./HZ_exo.ipynb: Necessary to reproduce all the figures from the paper. This comprises the following: habitability zones from the one-dimensional radiative transfer equation (not included in the paper), interpolations to find k2, Q and lambda for all the exoplanets in our sample, Figure 2, exomoon stability and migration, Figure 4, Figure 3, exomoon detection by radial velocity (not included in the paper), Figure 1, tidal-locking timescale calculations, and Figure 5 (limit for for the exomoon migration timescale using a_Roche and a_crit).

- Directory ./data_Kop: Includes habitability zone boundaries from Kopparapu et al. (2014) (see https://ui.adsabs.harvard.edu/abs/2014ApJ...787L..29K/abstract).

- Directory ./Input_tables: Includes tables with stellar and planetary data (see Appendix A in the paper), as well as a table with stellar data from the literature (see Figure 1 in the paper), and tidal locking timescales for each potentially habitable exoplanet-exomoon system in our sample.

- Directory ./Output_tables: Information about all the potentially habitable exoplanet-exomoon systems in our sample for the two cases discussed in the paper, P0=Porb (see Table 4 in the paper) and P0=3h.

- Directory ./TidalQ_vplanet: Necessary to calculate the tidal heating for the four exoplanet-exomoon systems in Table 4 (see https://github.com/VirtualPlanetaryLaboratory/vplanet).

- Directory ./tlock_eqtide: Necessary to calculate the tidal locking timescales for each potentially habitable exoplanet-exomoon system in our sample (see https://github.com/RoryBarnes/EqTide).


License under https://doi.org/10.5281/zenodo.3533659
