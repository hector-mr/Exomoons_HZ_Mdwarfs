#!/usr/local/bin/bash


# IMPORTANT: READ
# for planet in ${!mplanet_vals[@]}; do          allows to iterate over both array index and element
# [mplanet10th]=-1.3066                          assigns -1.3066 to index 0, whose name is mplanet10th
# ${rplanet_vals[${system}]}                     so this is needed to print rplanet[0], equivalent to rplanet[mplanet10th], and so on


# Careful: replace -A by -a // https://stackoverflow.com/questions/28179409/bash-array-assignment-fails-if-you-declare-the-array-in-advance



# Parameters that vary in each directory

declare -a mplanet_vals=( 6.65 19.66 114.00 4.01 6.80 23.54 7.60 6.40 4.80 53.00 2.89 9.90 11.10 8.43 96.70 5.95 1.27 24.70 3.41 3.80 2.70 2.70 4.40 8.70 12.20 1.61 5.40 760.90 241.50 0.38 0.76 1.16 1.45 )

declare -a rplanet_vals=( 1.43 4.68 13.22 1.70 2.51 5.36 2.67 2.40 2.03 8.49 1.50 3.15 1.51 2.38 12.02 2.25 1.09 5.22 1.69 1.81 1.43 1.42 1.97 2.85 3.57 1.17 2.19 13.26 14.04 0.77 0.92 1.04 1.13 )

declare -a k2planet_vals=( 0.30 1.50 1.50 0.40 0.81 1.50 0.89 0.75 0.57 1.50 0.30 1.13 0.31 0.74 1.50 0.68 0.30 1.50 0.40 0.46 0.30 0.30 0.54 0.98 1.34 0.30 0.65 1.50 1.50 0.30 0.30 0.30 0.30 )

declare -a Qplanet_vals=( 1.00e2 2.29e4 1.00e6 1.83e2 1.21e3 4.19e4 1.63e3 9.75e2 4.33e2 3.21e5 1.00e2 3.64e3 1.03e2 9.36e2 1.00e6 7.13e2 1.00e2 3.72e4 1.78e2 2.49e2 1.00e2 1.00e2 3.75e2 2.24e3 6.68e3 1.00e2 6.26e2 1.00e6 1.00e6 1.00e2 1.00e2 1.00e2 1.00e2 )

declare -a lambdaplanet_vals=( 0.370 0.233 0.254 0.358 0.311 0.235 0.301 0.317 0.339 0.246 0.370 0.273 0.369 0.318 0.254 0.326 0.370 0.235 0.359 0.352 0.370 0.370 0.342 0.291 0.248 0.370 0.329 0.254 0.254 0.370 0.370 0.370 0.370 )

declare -a tauplanet_vals=( 7.66e1 3.34e-1 7.66e-3 4.17e1 6.32e0 1.83e-1 4.68e0 7.85e0 1.77e1 2.38e-2 7.66e1 2.10e0 7.41e1 8.18e0 7.66e-3 1.07e1 7.66e1 2.06e-1 4.30e1 3.08e1 7.66e1 7.66e1 2.04e1 3.41e0 1.15e0 7.66e1 1.22e1 7.66e-3 7.66e-3 7.66e1 7.66e1 7.66e1 7.66e1 )

declare -a mstar_vals=( 0.1824 0.5763 0.6174 0.5035 0.4054 0.4507 0.4507 0.4092 0.2787 0.6348 0.2946 0.3595 0.5506 0.4446 0.3456 0.3036 0.1238 0.6314 0.3022 0.3268 0.3268 0.3268 0.2743 0.2743 0.4745 0.5493 0.4404 0.3381 0.3381 0.0898 0.0898 0.0898 0.0898 )

declare -a rstar_vals=( 0.2306 0.5535 0.6275 0.6208 0.4245 0.4517 0.4517 0.4237 0.2754 0.6390 0.3237 0.3856 0.5381 0.4419 0.3984 0.3000 0.1666 0.6849 0.3183 0.3325 0.3325 0.3325 0.2932 0.2932 0.4909 0.5236 0.4393 0.3699 0.3699 0.1236 0.1236 0.1236 0.1236 )

declare -a a_vals=( 0.087 0.291 0.250 0.164 0.125 0.143 0.194 0.129 0.168 0.457 0.091 0.119 0.208 0.143 0.166 0.091 0.049 0.319 0.089 0.125 0.213 0.156 0.080 0.176 0.336 0.432 0.163 0.214 0.134 0.021 0.028 0.037 0.045 )

declare -A model_vals=( [CPL]=CPL [CTL]=CTL)


# Generate the directories

for system in ${!mplanet_vals[@]}; do

    mkdir ${system}

            for tidalmodel in ${!model_vals[@]}; do

                mkdir ${system}/${tidalmodel} # Tidal model subdirectories

                cp tide.in ./${system}/${tidalmodel}/tide.in # Copy tide.in file to each subdirectory

                cd ${system}/${tidalmodel} # Access each subdirectory


                # Replace text : sed -i s"#original#new#"g file
                # Use s"###"g instead of s'///'g to replace string with array variable


                sed -i s"#dSecondaryMass	      -1.27#dSecondaryMass	      -${mplanet_vals[${system}]}#"g tide.in
                sed -i s"#dSecondaryRadius      -1.7#dSecondaryRadius      -${rplanet_vals[${system}]}#"g tide.in
                sed -i s"#dSecondaryK2	      0.3#dSecondaryK2	      ${k2planet_vals[${system}]}#"g tide.in
                sed -i s"#dSecondaryQ	      12.0#dSecondaryQ	      ${Qplanet_vals[${system}]}#"g tide.in
                sed -i s"#dSecondaryRadGyra     0.5#dSecondaryRadGyra     ${lambdaplanet_vals[${system}]}#"g tide.in
                sed -i s"#dSecondaryTau	      -648#dSecondaryTau	      -${tauplanet_vals[${system}]}#"g tide.in
                #sed -i s"#dSecondarySpinPeriod  -1.0#dSecondarySpinPeriod  -${Protplanet_vals[${system}]}#"g tide.in
                sed -i s"#dPrimaryMass          0.12#dPrimaryMass          ${mstar_vals[${system}]}#"g tide.in
                sed -i s"#dPrimaryRadius        -0.14#dPrimaryRadius        -${rstar_vals[${system}]}#"g tide.in 
                sed -i s"#dSemi                 0.05#dSemi                 ${a_vals[${system}]}#"g tide.in 
                sed -i s"#sTideModel	CTL#sTideModel	${model_vals[${tidalmodel}]}#"g tide.in


                cd ..

                cd ..


    done

done