# pulseproject
Please visit this repository's website to see the data visualization https://m-hess.github.io/pulseproject/

The visual compares students' perceived self-intelligence (as retrieved from a survey by College Pulse) by 
which school they are endolled in. For more information on the data visit collegepulse.com.

All filess needed to generate this visual are included in this repository. This visual is based on CSV data, 
called Intelligence-11-13-17.csv. This data is wrangled using an R script, PulseProject_Wrangle.R, that I 
wrote to processes the raw CSV data. The R script outputs a new file of clean, formatted data called 
pulseproject_wrangled2.csv. index.html contains JavaScript that generates a data visualization using the d3.js library.
