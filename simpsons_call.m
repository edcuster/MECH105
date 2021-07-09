% Two important quantities when studying fermentation are the carbon dioxide
% evolution rate (g/h) and the oxygen uptake rate (g/h). These are calculated
% from expiremental analysis of the inlet and exit gases of the fermentor, and the
% flow rates, temperature, and pressure of these gases
% Time of Fermentation (hours)
time = [140 141 142 143 144 145 146 147 148 149];
% Carbon Dioxide Evolution Rate (g/hour)
CO2evo = [15.72 15.53 15.19 16.56 16.21 17.39 17.36 17.42 17.60 17.75];
% Oxygen Uptake Rate (g/hour)
OxUp = [15.59 16.16 15.35 15.13 14.20 14.23 14.29 12.74 14.74 13.68];

% Using your function in part 1, and the data table below, calculate the total
% amount of carbon dioxide produced and oxygen consumed during fermentation.
% Compare to the value that the MATLAB function trapz() computes. You would
% expect the solutions it be similar but not identical

% using the matlab solution
total_CO2_trap = trapz(time, CO2evo)
total_Ox_trap = trapz(time, OxUp)

% using the matlab solution
total_CO2_simp = Simpson(time,CO2evo)
total_Ox_simp = Simpson(time, OxUp)