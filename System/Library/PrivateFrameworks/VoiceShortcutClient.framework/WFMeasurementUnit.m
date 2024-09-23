@implementation WFMeasurementUnit

+ (id)availableUnitTypes
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  objc_msgSend(a1, "unitTypeMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__WFMeasurementUnit_availableUnitTypes__block_invoke;
  v7[3] = &__block_descriptor_40_e31_q24__0__NSString_8__NSString_16l;
  v7[4] = a1;
  objc_msgSend(v4, "sortedArrayUsingComparator:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (Class)unitClassForUnitType:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v10;

  v5 = a3;
  objc_msgSend(a1, "unitTypeMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "objectForKey:", v5);

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFMeasurementUnit.m"), 48, CFSTR("Invalid unit type: %@"), v5);

  }
  v8 = v7;

  return v8;
}

+ (id)localizedStringForUnitType:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;

  v3 = a3;
  v4 = CFSTR("Acceleration");
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Acceleration")) & 1) != 0)
    goto LABEL_23;
  v4 = CFSTR("Angle");
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Angle")) & 1) != 0)
    goto LABEL_23;
  v4 = CFSTR("Area");
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Area")) & 1) != 0)
    goto LABEL_23;
  v4 = CFSTR("Concentration Mass");
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Concentration Mass")) & 1) != 0)
    goto LABEL_23;
  v4 = CFSTR("Dispersion");
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Dispersion")) & 1) != 0)
    goto LABEL_23;
  v4 = CFSTR("Duration");
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Duration")) & 1) != 0)
    goto LABEL_23;
  v4 = CFSTR("Electric Charge");
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Electric Charge")) & 1) != 0)
    goto LABEL_23;
  v4 = CFSTR("Electric Current");
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Electric Current")) & 1) != 0)
    goto LABEL_23;
  v4 = CFSTR("Electric Potential Difference");
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Electric Potential Difference")) & 1) != 0)
    goto LABEL_23;
  v4 = CFSTR("Electric Resistance");
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Electric Resistance")) & 1) != 0)
    goto LABEL_23;
  v4 = CFSTR("Energy");
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Energy")) & 1) != 0)
    goto LABEL_23;
  v4 = CFSTR("Frequency");
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Frequency")) & 1) != 0)
    goto LABEL_23;
  v4 = CFSTR("Fuel Efficiency");
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Fuel Efficiency")) & 1) != 0)
    goto LABEL_23;
  v4 = CFSTR("Illuminance");
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Illuminance")) & 1) != 0)
    goto LABEL_23;
  v4 = CFSTR("Information Storage");
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Information Storage")) & 1) != 0
    || (v4 = CFSTR("Length"), (objc_msgSend(v3, "isEqualToString:", CFSTR("Length")) & 1) != 0)
    || (v4 = CFSTR("Mass"), (objc_msgSend(v3, "isEqualToString:", CFSTR("Mass")) & 1) != 0)
    || (v4 = CFSTR("Power"), (objc_msgSend(v3, "isEqualToString:", CFSTR("Power")) & 1) != 0)
    || (v4 = CFSTR("Pressure"), (objc_msgSend(v3, "isEqualToString:", CFSTR("Pressure")) & 1) != 0)
    || (v4 = CFSTR("Speed"), (objc_msgSend(v3, "isEqualToString:", CFSTR("Speed")) & 1) != 0)
    || (v4 = CFSTR("Temperature"), (objc_msgSend(v3, "isEqualToString:", CFSTR("Temperature")) & 1) != 0)
    || (v4 = CFSTR("Volume"), objc_msgSend(v3, "isEqualToString:", CFSTR("Volume"))))
  {
LABEL_23:
    WFLocalizedString(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)unitTypeForUnitClass:(Class)a3
{
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__4956;
  v12 = __Block_byref_object_dispose__4957;
  v13 = 0;
  objc_msgSend(a1, "unitTypeMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__WFMeasurementUnit_unitTypeForUnitClass___block_invoke;
  v7[3] = &unk_1E5FC5CD0;
  v7[4] = &v8;
  v7[5] = a3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

+ (id)unitTypeMap
{
  if (unitTypeMap_onceToken != -1)
    dispatch_once(&unitTypeMap_onceToken, &__block_literal_global_4955);
  return (id)unitTypeMap_unitTypeMap;
}

+ (id)availableUnitsForUnitType:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD *v22;
  void *v24;
  void **v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  id v130;
  uint64_t v131;
  id v132;
  _QWORD v133[31];
  _QWORD v134[3];
  _QWORD v135[4];
  _QWORD v136[10];
  _QWORD v137[11];
  _QWORD v138[16];
  _QWORD v139[22];
  _QWORD v140[9];
  void *v141;
  _QWORD v142[3];
  _QWORD v143[9];
  _QWORD v144[5];
  _QWORD v145[5];
  _QWORD v146[5];
  _QWORD v147[5];
  _QWORD v148[6];
  _QWORD v149[7];
  void *v150;
  _QWORD v151[3];
  _QWORD v152[14];
  _QWORD v153[6];
  _QWORD v154[4];

  v154[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Acceleration")))
  {
    objc_msgSend(MEMORY[0x1E0CB3A58], "metersPerSecondSquared");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v154[0] = v4;
    objc_msgSend(MEMORY[0x1E0CB3A58], "gravity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v154[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v154, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

    goto LABEL_13;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Angle")))
  {
    objc_msgSend(MEMORY[0x1E0CB3A60], "degrees");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v153[0] = v4;
    objc_msgSend(MEMORY[0x1E0CB3A60], "arcMinutes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v153[1] = v5;
    objc_msgSend(MEMORY[0x1E0CB3A60], "arcSeconds");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v153[2] = v7;
    objc_msgSend(MEMORY[0x1E0CB3A60], "radians");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v153[3] = v8;
    objc_msgSend(MEMORY[0x1E0CB3A60], "gradians");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v153[4] = v9;
    objc_msgSend(MEMORY[0x1E0CB3A60], "revolutions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v153[5] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v153, 6);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
    goto LABEL_12;
  }
  if (!objc_msgSend(v3, "isEqualToString:", CFSTR("Area")))
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("Concentration Mass")))
    {
      objc_msgSend(MEMORY[0x1E0CB3A70], "gramsPerLiter");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v151[0] = v4;
      objc_msgSend(MEMORY[0x1E0CB3A70], "milligramsPerDeciliter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v151[1] = v5;
      objc_msgSend(MEMORY[0x1E0CB3A70], "wf_microgramsPerCubicMeter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v151[2] = v7;
      v21 = (void *)MEMORY[0x1E0C99D20];
      v22 = v151;
LABEL_10:
      objc_msgSend(v21, "arrayWithObjects:count:", v22, 3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("Dispersion")))
    {
      objc_msgSend(MEMORY[0x1E0CB3A80], "partsPerMillion");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v150 = v4;
      v24 = (void *)MEMORY[0x1E0C99D20];
      v25 = &v150;
LABEL_17:
      objc_msgSend(v24, "arrayWithObjects:count:", v25, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("Duration")))
    {
      objc_msgSend(MEMORY[0x1E0CB3A88], "milliseconds");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v149[0] = v4;
      objc_msgSend(MEMORY[0x1E0CB3A88], "microseconds");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v149[1] = v26;
      objc_msgSend(MEMORY[0x1E0CB3A88], "nanoseconds");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v149[2] = v27;
      objc_msgSend(MEMORY[0x1E0CB3A88], "picoseconds");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v149[3] = v28;
      objc_msgSend(MEMORY[0x1E0CB3A88], "seconds");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v149[4] = v29;
      objc_msgSend(MEMORY[0x1E0CB3A88], "minutes");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v149[5] = v30;
      objc_msgSend(MEMORY[0x1E0CB3A88], "hours");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v149[6] = v31;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v149, 7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_13;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("Electric Charge")))
    {
      objc_msgSend(MEMORY[0x1E0CB3A90], "coulombs");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v148[0] = v4;
      objc_msgSend(MEMORY[0x1E0CB3A90], "megaampereHours");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v148[1] = v32;
      objc_msgSend(MEMORY[0x1E0CB3A90], "kiloampereHours");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v148[2] = v33;
      objc_msgSend(MEMORY[0x1E0CB3A90], "ampereHours");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v148[3] = v34;
      objc_msgSend(MEMORY[0x1E0CB3A90], "milliampereHours");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v148[4] = v35;
      objc_msgSend(MEMORY[0x1E0CB3A90], "microampereHours");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v148[5] = v36;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v148, 6);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_13;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("Electric Current")))
    {
      objc_msgSend(MEMORY[0x1E0CB3A98], "megaamperes");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v147[0] = v4;
      objc_msgSend(MEMORY[0x1E0CB3A98], "kiloamperes");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v147[1] = v5;
      objc_msgSend(MEMORY[0x1E0CB3A98], "amperes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v147[2] = v7;
      objc_msgSend(MEMORY[0x1E0CB3A98], "milliamperes");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v147[3] = v37;
      objc_msgSend(MEMORY[0x1E0CB3A98], "microamperes");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v147[4] = v38;
      v39 = (void *)MEMORY[0x1E0C99D20];
      v40 = v147;
LABEL_30:
      objc_msgSend(v39, "arrayWithObjects:count:", v40, 5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("Electric Potential Difference")))
    {
      objc_msgSend(MEMORY[0x1E0CB3AA0], "megavolts");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v146[0] = v4;
      objc_msgSend(MEMORY[0x1E0CB3AA0], "kilovolts");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v146[1] = v5;
      objc_msgSend(MEMORY[0x1E0CB3AA0], "volts");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v146[2] = v7;
      objc_msgSend(MEMORY[0x1E0CB3AA0], "millivolts");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v146[3] = v37;
      objc_msgSend(MEMORY[0x1E0CB3AA0], "microvolts");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v146[4] = v38;
      v39 = (void *)MEMORY[0x1E0C99D20];
      v40 = v146;
      goto LABEL_30;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("Electric Resistance")))
    {
      objc_msgSend(MEMORY[0x1E0CB3AA8], "megaohms");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v145[0] = v4;
      objc_msgSend(MEMORY[0x1E0CB3AA8], "kiloohms");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v145[1] = v5;
      objc_msgSend(MEMORY[0x1E0CB3AA8], "ohms");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v145[2] = v7;
      objc_msgSend(MEMORY[0x1E0CB3AA8], "milliohms");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v145[3] = v37;
      objc_msgSend(MEMORY[0x1E0CB3AA8], "microohms");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v145[4] = v38;
      v39 = (void *)MEMORY[0x1E0C99D20];
      v40 = v145;
      goto LABEL_30;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("Energy")))
    {
      objc_msgSend(MEMORY[0x1E0CB3AB0], "kilojoules");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v144[0] = v4;
      objc_msgSend(MEMORY[0x1E0CB3AB0], "joules");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v144[1] = v5;
      objc_msgSend(MEMORY[0x1E0CB3AB0], "kilocalories");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v144[2] = v7;
      objc_msgSend(MEMORY[0x1E0CB3AB0], "calories");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v144[3] = v37;
      objc_msgSend(MEMORY[0x1E0CB3AB0], "kilowattHours");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v144[4] = v38;
      v39 = (void *)MEMORY[0x1E0C99D20];
      v40 = v144;
      goto LABEL_30;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("Frequency")))
    {
      objc_msgSend(MEMORY[0x1E0CB3AB8], "terahertz");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v143[0] = v4;
      objc_msgSend(MEMORY[0x1E0CB3AB8], "gigahertz");
      v131 = objc_claimAutoreleasedReturnValue();
      v143[1] = v131;
      objc_msgSend(MEMORY[0x1E0CB3AB8], "megahertz");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v143[2] = v41;
      objc_msgSend(MEMORY[0x1E0CB3AB8], "kilohertz");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v143[3] = v42;
      objc_msgSend(MEMORY[0x1E0CB3AB8], "hertz");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v143[4] = v43;
      objc_msgSend(MEMORY[0x1E0CB3AB8], "millihertz");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v143[5] = v44;
      objc_msgSend(MEMORY[0x1E0CB3AB8], "microhertz");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v143[6] = v45;
      objc_msgSend(MEMORY[0x1E0CB3AB8], "nanohertz");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v143[7] = v46;
      objc_msgSend(MEMORY[0x1E0CB3AB8], "framesPerSecond");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v143[8] = v47;
      v48 = (void *)MEMORY[0x1E0C99D20];
      v49 = v143;
LABEL_33:
      objc_msgSend(v48, "arrayWithObjects:count:", v49, 9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)v131;
      goto LABEL_7;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("Fuel Efficiency")))
    {
      objc_msgSend(MEMORY[0x1E0CB3AC0], "litersPer100Kilometers");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v142[0] = v4;
      objc_msgSend(MEMORY[0x1E0CB3AC0], "milesPerImperialGallon");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v142[1] = v5;
      objc_msgSend(MEMORY[0x1E0CB3AC0], "milesPerGallon");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v142[2] = v7;
      v21 = (void *)MEMORY[0x1E0C99D20];
      v22 = v142;
      goto LABEL_10;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("Illuminance")))
    {
      objc_msgSend(MEMORY[0x1E0CB3AC8], "lux");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v141 = v4;
      v24 = (void *)MEMORY[0x1E0C99D20];
      v25 = &v141;
      goto LABEL_17;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("Information Storage")))
    {
      objc_msgSend(MEMORY[0x1E0CB3AD0], "bytes");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v140[0] = v4;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "kilobytes");
      v131 = objc_claimAutoreleasedReturnValue();
      v140[1] = v131;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "megabytes");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v140[2] = v41;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "gigabytes");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v140[3] = v42;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "terabytes");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v140[4] = v43;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "petabytes");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v140[5] = v44;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "exabytes");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v140[6] = v45;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "zettabytes");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v140[7] = v46;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "yottabytes");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v140[8] = v47;
      v48 = (void *)MEMORY[0x1E0C99D20];
      v49 = v140;
      goto LABEL_33;
    }
    v132 = v3;
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("Length")))
    {
      objc_msgSend(MEMORY[0x1E0CB3AD8], "megameters");
      v126 = objc_claimAutoreleasedReturnValue();
      v139[0] = v126;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "kilometers");
      v123 = objc_claimAutoreleasedReturnValue();
      v139[1] = v123;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "hectometers");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      v139[2] = v121;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "decameters");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      v139[3] = v119;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "meters");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      v139[4] = v117;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "decimeters");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v139[5] = v115;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "centimeters");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v139[6] = v114;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "millimeters");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v139[7] = v113;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "micrometers");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v139[8] = v112;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "nanometers");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v139[9] = v111;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "picometers");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v139[10] = v110;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "inches");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      v139[11] = v109;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "feet");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v139[12] = v108;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "yards");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v139[13] = v50;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "miles");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v139[14] = v51;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "scandinavianMiles");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v139[15] = v52;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "lightyears");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v139[16] = v53;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "nauticalMiles");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v139[17] = v54;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "fathoms");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v139[18] = v55;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "furlongs");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v139[19] = v56;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "astronomicalUnits");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v139[20] = v57;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "parsecs");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v139[21] = v58;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v139, 22);
      v59 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v59;
      v4 = (void *)v126;

LABEL_42:
LABEL_45:

      v69 = (void *)v123;
LABEL_46:

LABEL_47:
      v3 = v132;
      goto LABEL_13;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("Mass")))
    {
      objc_msgSend(MEMORY[0x1E0CB3AE0], "kilograms");
      v127 = objc_claimAutoreleasedReturnValue();
      v138[0] = v127;
      objc_msgSend(MEMORY[0x1E0CB3AE0], "grams");
      v123 = objc_claimAutoreleasedReturnValue();
      v138[1] = v123;
      objc_msgSend(MEMORY[0x1E0CB3AE0], "decigrams");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      v138[2] = v121;
      objc_msgSend(MEMORY[0x1E0CB3AE0], "centigrams");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      v138[3] = v119;
      objc_msgSend(MEMORY[0x1E0CB3AE0], "milligrams");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      v138[4] = v117;
      objc_msgSend(MEMORY[0x1E0CB3AE0], "micrograms");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v138[5] = v115;
      objc_msgSend(MEMORY[0x1E0CB3AE0], "nanograms");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v138[6] = v114;
      objc_msgSend(MEMORY[0x1E0CB3AE0], "picograms");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v138[7] = v60;
      objc_msgSend(MEMORY[0x1E0CB3AE0], "ounces");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v138[8] = v61;
      objc_msgSend(MEMORY[0x1E0CB3AE0], "poundsMass");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v138[9] = v62;
      objc_msgSend(MEMORY[0x1E0CB3AE0], "stones");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v138[10] = v63;
      objc_msgSend(MEMORY[0x1E0CB3AE0], "metricTons");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v138[11] = v64;
      objc_msgSend(MEMORY[0x1E0CB3AE0], "shortTons");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v138[12] = v65;
      objc_msgSend(MEMORY[0x1E0CB3AE0], "carats");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v138[13] = v66;
      objc_msgSend(MEMORY[0x1E0CB3AE0], "ouncesTroy");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v138[14] = v67;
      objc_msgSend(MEMORY[0x1E0CB3AE0], "slugs");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v138[15] = v68;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v138, 16);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = (void *)v127;
      goto LABEL_45;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("Power")))
    {
      objc_msgSend(MEMORY[0x1E0CB3AE8], "terawatts");
      v70 = objc_claimAutoreleasedReturnValue();
      v137[0] = v70;
      objc_msgSend(MEMORY[0x1E0CB3AE8], "gigawatts");
      v128 = objc_claimAutoreleasedReturnValue();
      v137[1] = v128;
      objc_msgSend(MEMORY[0x1E0CB3AE8], "megawatts");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v137[2] = v124;
      objc_msgSend(MEMORY[0x1E0CB3AE8], "kilowatts");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v137[3] = v71;
      objc_msgSend(MEMORY[0x1E0CB3AE8], "watts");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v137[4] = v72;
      objc_msgSend(MEMORY[0x1E0CB3AE8], "milliwatts");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v137[5] = v73;
      objc_msgSend(MEMORY[0x1E0CB3AE8], "microwatts");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v137[6] = v74;
      objc_msgSend(MEMORY[0x1E0CB3AE8], "nanowatts");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v137[7] = v75;
      objc_msgSend(MEMORY[0x1E0CB3AE8], "picowatts");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v137[8] = v76;
      objc_msgSend(MEMORY[0x1E0CB3AE8], "femtowatts");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v137[9] = v77;
      objc_msgSend(MEMORY[0x1E0CB3AE8], "horsepower");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v137[10] = v78;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v137, 11);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = (void *)v70;
    }
    else
    {
      if (!objc_msgSend(v3, "isEqualToString:", CFSTR("Pressure")))
      {
        if (objc_msgSend(v3, "isEqualToString:", CFSTR("Speed")))
        {
          objc_msgSend(MEMORY[0x1E0CB3AF8], "metersPerSecond");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          v135[0] = v4;
          objc_msgSend(MEMORY[0x1E0CB3AF8], "kilometersPerHour");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v135[1] = v87;
          objc_msgSend(MEMORY[0x1E0CB3AF8], "milesPerHour");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          v135[2] = v88;
          objc_msgSend(MEMORY[0x1E0CB3AF8], "knots");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v135[3] = v89;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v135, 4);
          v6 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          if (!objc_msgSend(v3, "isEqualToString:", CFSTR("Temperature")))
          {
            if (!objc_msgSend(v3, "isEqualToString:", CFSTR("Volume")))
            {
              v6 = (void *)MEMORY[0x1E0C9AA60];
              goto LABEL_14;
            }
            objc_msgSend(MEMORY[0x1E0CB3B08], "megaliters");
            v129 = objc_claimAutoreleasedReturnValue();
            v133[0] = v129;
            objc_msgSend(MEMORY[0x1E0CB3B08], "kiloliters");
            v123 = objc_claimAutoreleasedReturnValue();
            v133[1] = v123;
            objc_msgSend(MEMORY[0x1E0CB3B08], "liters");
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            v133[2] = v121;
            objc_msgSend(MEMORY[0x1E0CB3B08], "deciliters");
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            v133[3] = v119;
            objc_msgSend(MEMORY[0x1E0CB3B08], "centiliters");
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            v133[4] = v117;
            objc_msgSend(MEMORY[0x1E0CB3B08], "milliliters");
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            v133[5] = v115;
            objc_msgSend(MEMORY[0x1E0CB3B08], "cubicKilometers");
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            v133[6] = v114;
            objc_msgSend(MEMORY[0x1E0CB3B08], "cubicMeters");
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            v133[7] = v113;
            objc_msgSend(MEMORY[0x1E0CB3B08], "cubicDecimeters");
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            v133[8] = v112;
            objc_msgSend(MEMORY[0x1E0CB3B08], "cubicCentimeters");
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            v133[9] = v111;
            objc_msgSend(MEMORY[0x1E0CB3B08], "cubicMillimeters");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            v133[10] = v110;
            objc_msgSend(MEMORY[0x1E0CB3B08], "cubicInches");
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            v133[11] = v109;
            objc_msgSend(MEMORY[0x1E0CB3B08], "cubicFeet");
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            v133[12] = v108;
            objc_msgSend(MEMORY[0x1E0CB3B08], "cubicYards");
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            v133[13] = v107;
            objc_msgSend(MEMORY[0x1E0CB3B08], "cubicMiles");
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            v133[14] = v106;
            objc_msgSend(MEMORY[0x1E0CB3B08], "acreFeet");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            v133[15] = v105;
            objc_msgSend(MEMORY[0x1E0CB3B08], "bushels");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            v133[16] = v104;
            objc_msgSend(MEMORY[0x1E0CB3B08], "teaspoons");
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            v133[17] = v103;
            objc_msgSend(MEMORY[0x1E0CB3B08], "tablespoons");
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            v133[18] = v102;
            objc_msgSend(MEMORY[0x1E0CB3B08], "fluidOunces");
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            v133[19] = v101;
            objc_msgSend(MEMORY[0x1E0CB3B08], "cups");
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            v133[20] = v100;
            objc_msgSend(MEMORY[0x1E0CB3B08], "pints");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            v133[21] = v99;
            objc_msgSend(MEMORY[0x1E0CB3B08], "quarts");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            v133[22] = v90;
            objc_msgSend(MEMORY[0x1E0CB3B08], "gallons");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            v133[23] = v91;
            objc_msgSend(MEMORY[0x1E0CB3B08], "imperialTeaspoons");
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            v133[24] = v92;
            objc_msgSend(MEMORY[0x1E0CB3B08], "imperialTablespoons");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            v133[25] = v93;
            objc_msgSend(MEMORY[0x1E0CB3B08], "imperialFluidOunces");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            v133[26] = v94;
            objc_msgSend(MEMORY[0x1E0CB3B08], "imperialPints");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            v133[27] = v95;
            objc_msgSend(MEMORY[0x1E0CB3B08], "imperialQuarts");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            v133[28] = v96;
            objc_msgSend(MEMORY[0x1E0CB3B08], "imperialGallons");
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            v133[29] = v97;
            objc_msgSend(MEMORY[0x1E0CB3B08], "metricCups");
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            v133[30] = v98;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v133, 31);
            v6 = (void *)objc_claimAutoreleasedReturnValue();

            v4 = (void *)v129;
            goto LABEL_42;
          }
          objc_msgSend(MEMORY[0x1E0CB3B00], "kelvin");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          v134[0] = v4;
          objc_msgSend(MEMORY[0x1E0CB3B00], "celsius");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v134[1] = v87;
          objc_msgSend(MEMORY[0x1E0CB3B00], "fahrenheit");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          v134[2] = v88;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v134, 3);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_47;
      }
      objc_msgSend(MEMORY[0x1E0CB3AF0], "newtonsPerMetersSquared");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v136[0] = v4;
      objc_msgSend(MEMORY[0x1E0CB3AF0], "gigapascals");
      v128 = objc_claimAutoreleasedReturnValue();
      v136[1] = v128;
      objc_msgSend(MEMORY[0x1E0CB3AF0], "megapascals");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v136[2] = v79;
      objc_msgSend(MEMORY[0x1E0CB3AF0], "kilopascals");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v136[3] = v80;
      objc_msgSend(MEMORY[0x1E0CB3AF0], "hectopascals");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v136[4] = v81;
      objc_msgSend(MEMORY[0x1E0CB3AF0], "inchesOfMercury");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v136[5] = v82;
      objc_msgSend(MEMORY[0x1E0CB3AF0], "bars");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v136[6] = v83;
      objc_msgSend(MEMORY[0x1E0CB3AF0], "millibars");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v136[7] = v84;
      objc_msgSend(MEMORY[0x1E0CB3AF0], "millimetersOfMercury");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v136[8] = v85;
      objc_msgSend(MEMORY[0x1E0CB3AF0], "poundsForcePerSquareInch");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v136[9] = v86;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v136, 10);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v69 = (void *)v128;
    goto LABEL_46;
  }
  objc_msgSend(MEMORY[0x1E0CB3A68], "squareMegameters");
  v125 = objc_claimAutoreleasedReturnValue();
  v152[0] = v125;
  objc_msgSend(MEMORY[0x1E0CB3A68], "squareKilometers");
  v122 = objc_claimAutoreleasedReturnValue();
  v152[1] = v122;
  objc_msgSend(MEMORY[0x1E0CB3A68], "squareMeters");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v152[2] = v120;
  objc_msgSend(MEMORY[0x1E0CB3A68], "squareCentimeters");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v152[3] = v118;
  objc_msgSend(MEMORY[0x1E0CB3A68], "squareMillimeters");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v152[4] = v116;
  objc_msgSend(MEMORY[0x1E0CB3A68], "squareMicrometers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v152[5] = v11;
  objc_msgSend(MEMORY[0x1E0CB3A68], "squareNanometers");
  v130 = v3;
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v152[6] = v12;
  objc_msgSend(MEMORY[0x1E0CB3A68], "squareInches");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v152[7] = v13;
  objc_msgSend(MEMORY[0x1E0CB3A68], "squareFeet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v152[8] = v14;
  objc_msgSend(MEMORY[0x1E0CB3A68], "squareYards");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v152[9] = v15;
  objc_msgSend(MEMORY[0x1E0CB3A68], "squareMiles");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v152[10] = v16;
  objc_msgSend(MEMORY[0x1E0CB3A68], "acres");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v152[11] = v17;
  objc_msgSend(MEMORY[0x1E0CB3A68], "ares");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v152[12] = v18;
  objc_msgSend(MEMORY[0x1E0CB3A68], "hectares");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v152[13] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v152, 14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)v125;
  v3 = v130;

  v20 = (void *)v122;
LABEL_7:

LABEL_13:
LABEL_14:

  return v6;
}

+ (BOOL)usesMetricSystemForUnitType:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  char v7;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "countryCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("GB"));

  if (a3 == CFSTR("Length") && (v6 & 1) != 0)
    v7 = 0;
  else
    v7 = objc_msgSend(v4, "usesMetricSystem");

  return v7;
}

+ (id)defaultUnitForUnitType:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[3];
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  const __CFString *v43;
  const __CFString *v44;
  const __CFString *v45;
  const __CFString *v46;
  const __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  const __CFString *v50;
  const __CFString *v51;
  const __CFString *v52;
  _QWORD v53[2];
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)defaultUnitForUnitType__unitDefaultsMap;
  if (!defaultUnitForUnitType__unitDefaultsMap)
  {
    v6 = objc_msgSend(a1, "usesMetricSystemForUnitType:", v4);
    v33[0] = CFSTR("Acceleration");
    if (v6)
      objc_msgSend(MEMORY[0x1E0CB3A58], "metersPerSecondSquared");
    else
      objc_msgSend(MEMORY[0x1E0CB3A58], "gravity");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v32;
    v33[1] = CFSTR("Angle");
    objc_msgSend(MEMORY[0x1E0CB3A60], "degrees");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v53[1] = v31;
    v33[2] = CFSTR("Area");
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3A68], "squareMeters");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v30;
      v34 = CFSTR("Concentration Mass");
      objc_msgSend(MEMORY[0x1E0CB3A70], "milligramsPerDeciliter");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A68], "squareFeet");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v30;
      v34 = CFSTR("Concentration Mass");
      objc_msgSend(MEMORY[0x1E0CB3A70], "gramsPerLiter");
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v29;
    v35 = CFSTR("Dispersion");
    objc_msgSend(MEMORY[0x1E0CB3A80], "partsPerMillion");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v28;
    v36 = CFSTR("Duration");
    objc_msgSend(MEMORY[0x1E0CB3A88], "minutes");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v27;
    v37 = CFSTR("Electric Charge");
    objc_msgSend(MEMORY[0x1E0CB3A90], "ampereHours");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v26;
    v38 = CFSTR("Electric Current");
    objc_msgSend(MEMORY[0x1E0CB3A98], "amperes");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v25;
    v39 = CFSTR("Electric Potential Difference");
    objc_msgSend(MEMORY[0x1E0CB3AA0], "volts");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v24;
    v40 = CFSTR("Electric Resistance");
    objc_msgSend(MEMORY[0x1E0CB3AA8], "ohms");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v23;
    v41 = CFSTR("Energy");
    objc_msgSend(MEMORY[0x1E0CB3AB0], "joules");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v22;
    v42 = CFSTR("Frequency");
    objc_msgSend(MEMORY[0x1E0CB3AB8], "hertz");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v21;
    v43 = CFSTR("Fuel Efficiency");
    if (v6)
      objc_msgSend(MEMORY[0x1E0CB3AC0], "litersPer100Kilometers");
    else
      objc_msgSend(MEMORY[0x1E0CB3AC0], "milesPerGallon");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v20;
    v44 = CFSTR("Illuminance");
    objc_msgSend(MEMORY[0x1E0CB3AC8], "lux");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v19;
    v45 = CFSTR("Information Storage");
    objc_msgSend(MEMORY[0x1E0CB3AD0], "megabytes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v7;
    v46 = CFSTR("Length");
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3AD8], "meters");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = v8;
      v47 = CFSTR("Mass");
      objc_msgSend(MEMORY[0x1E0CB3AE0], "grams");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3AD8], "feet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = v8;
      v47 = CFSTR("Mass");
      objc_msgSend(MEMORY[0x1E0CB3AE0], "poundsMass");
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v9;
    v48 = CFSTR("Power");
    objc_msgSend(MEMORY[0x1E0CB3AE8], "watts");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v10;
    v49 = CFSTR("Pressure");
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3AF0], "millibars");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = v11;
      v50 = CFSTR("Speed");
      objc_msgSend(MEMORY[0x1E0CB3AF8], "kilometersPerHour");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = v12;
      v51 = CFSTR("Temperature");
      objc_msgSend(MEMORY[0x1E0CB3B00], "celsius");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = v13;
      v52 = CFSTR("Volume");
      objc_msgSend(MEMORY[0x1E0CB3B08], "liters");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3AF0], "inchesOfMercury");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = v11;
      v50 = CFSTR("Speed");
      objc_msgSend(MEMORY[0x1E0CB3AF8], "milesPerHour");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = v12;
      v51 = CFSTR("Temperature");
      objc_msgSend(MEMORY[0x1E0CB3B00], "fahrenheit");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = v13;
      v52 = CFSTR("Volume");
      objc_msgSend(MEMORY[0x1E0CB3B08], "cups");
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v33, 22);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)defaultUnitForUnitType__unitDefaultsMap;
    defaultUnitForUnitType__unitDefaultsMap = v15;

    v5 = (void *)defaultUnitForUnitType__unitDefaultsMap;
  }
  objc_msgSend(v5, "objectForKey:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)unitFromString:(id)a3 unitType:(id)a4 caseSensitive:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD aBlock[4];
  id v29;
  id v30;
  id v31;
  BOOL v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("m3"), CFSTR("m³"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc_init(MEMORY[0x1E0CB3760]);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__WFMeasurementUnit_unitFromString_unitType_caseSensitive___block_invoke;
    aBlock[3] = &unk_1E5FC5D18;
    v31 = a1;
    v12 = v11;
    v29 = v12;
    v8 = v10;
    v30 = v8;
    v32 = a5;
    v13 = _Block_copy(aBlock);
    v14 = (void (**)(_QWORD, _QWORD))v13;
    if (v9)
    {
      (*((void (**)(void *, id))v13 + 2))(v13, v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      objc_msgSend(a1, "unitTypeMap", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "allKeys");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v25;
        while (2)
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v25 != v20)
              objc_enumerationMutation(v17);
            v14[2](v14, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v21));
            v22 = objc_claimAutoreleasedReturnValue();
            if (v22)
            {
              v15 = (void *)v22;
              goto LABEL_15;
            }
            ++v21;
          }
          while (v19 != v21);
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
          if (v19)
            continue;
          break;
        }
      }
      v15 = 0;
LABEL_15:

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)unitFromString:(id)a3
{
  return (id)objc_msgSend(a1, "unitFromString:unitType:caseSensitive:", a3, 0, 0);
}

+ (id)unitTypeFromLinkMeasurementUnitType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x15)
    return 0;
  else
    return *(&off_1E5FC5D38 + a3 - 1);
}

+ (id)unitTypeFromIntentSlotValueType:(int64_t)a3
{
  id result;

  result = 0;
  switch(a3)
  {
    case ' ':
    case '!':
      result = CFSTR("Temperature");
      break;
    case '"':
    case '#':
    case '$':
    case '%':
      return result;
    case '&':
      result = CFSTR("Mass");
      break;
    case '\'':
      result = CFSTR("Volume");
      break;
    case '(':
      result = CFSTR("Speed");
      break;
    case ')':
      result = CFSTR("Energy");
      break;
    default:
      if ((unint64_t)(a3 - 19) >= 2)
        result = 0;
      else
        result = CFSTR("Length");
      break;
  }
  return result;
}

id __59__WFMeasurementUnit_unitFromString_unitType_caseSensitive___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 48), "availableUnitsForUnitType:", a2);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "stringFromUnit:", v8, (_QWORD)v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(*(id *)(a1 + 40), "compare:options:", v9, *(_BYTE *)(a1 + 56) == 0)
          || (v10 = *(void **)(a1 + 40),
              objc_msgSend(v8, "symbol"),
              v11 = (void *)objc_claimAutoreleasedReturnValue(),
              LOBYTE(v10) = objc_msgSend(v10, "isEqualToString:", v11),
              v11,
              (v10 & 1) != 0))
        {
          v12 = v8;

          goto LABEL_13;
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v12 = 0;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v12 = 0;
  }
LABEL_13:

  return v12;
}

void __32__WFMeasurementUnit_unitTypeMap__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[22];
  _QWORD v3[23];

  v3[22] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("Acceleration");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("Angle");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("Area");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("Concentration Mass");
  v3[3] = objc_opt_class();
  v2[4] = CFSTR("Dispersion");
  v3[4] = objc_opt_class();
  v2[5] = CFSTR("Duration");
  v3[5] = objc_opt_class();
  v2[6] = CFSTR("Electric Charge");
  v3[6] = objc_opt_class();
  v2[7] = CFSTR("Electric Current");
  v3[7] = objc_opt_class();
  v2[8] = CFSTR("Electric Potential Difference");
  v3[8] = objc_opt_class();
  v2[9] = CFSTR("Electric Resistance");
  v3[9] = objc_opt_class();
  v2[10] = CFSTR("Energy");
  v3[10] = objc_opt_class();
  v2[11] = CFSTR("Frequency");
  v3[11] = objc_opt_class();
  v2[12] = CFSTR("Fuel Efficiency");
  v3[12] = objc_opt_class();
  v2[13] = CFSTR("Illuminance");
  v3[13] = objc_opt_class();
  v2[14] = CFSTR("Information Storage");
  v3[14] = objc_opt_class();
  v2[15] = CFSTR("Length");
  v3[15] = objc_opt_class();
  v2[16] = CFSTR("Mass");
  v3[16] = objc_opt_class();
  v2[17] = CFSTR("Power");
  v3[17] = objc_opt_class();
  v2[18] = CFSTR("Pressure");
  v3[18] = objc_opt_class();
  v2[19] = CFSTR("Speed");
  v3[19] = objc_opt_class();
  v2[20] = CFSTR("Temperature");
  v3[20] = objc_opt_class();
  v2[21] = CFSTR("Volume");
  v3[21] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 22);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)unitTypeMap_unitTypeMap;
  unitTypeMap_unitTypeMap = v0;

}

void __42__WFMeasurementUnit_unitTypeForUnitClass___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8;

  v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 40), "isSubclassOfClass:", a3))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

uint64_t __39__WFMeasurementUnit_availableUnitTypes__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "localizedStringForUnitType:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "localizedStringForUnitType:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "compare:", v8);
  return v9;
}

@end
