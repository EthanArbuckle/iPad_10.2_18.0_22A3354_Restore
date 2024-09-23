@implementation PIAutoEnhanceFilter

+ (id)customAttributes
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[3];
  _QWORD v9[3];
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10 = CFSTR("inputAlgorithm");
  v2 = *MEMORY[0x1E0C9DE68];
  v9[0] = CFSTR("PIAttributeTypeMode");
  v8[0] = v2;
  v8[1] = CFSTR("PIAttributeAvailableModes");
  v7[0] = CFSTR("Aperture");
  v7[1] = CFSTR("Photos");
  v7[2] = CFSTR("ColorNorm");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = *MEMORY[0x1E0C9DE10];
  v9[1] = v3;
  v9[2] = CFSTR("Aperture");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)autoEnhanceCache
{
  if (autoEnhanceCache_onceToken != -1)
    dispatch_once(&autoEnhanceCache_onceToken, &__block_literal_global_6521);
  return (id)autoEnhanceCache_cache;
}

uint64_t __39__PIAutoEnhanceFilter_autoEnhanceCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)autoEnhanceCache_cache;
  autoEnhanceCache_cache = (uint64_t)v0;

  return objc_msgSend((id)autoEnhanceCache_cache, "setCountLimit:", 16);
}

- (id)outputImage
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v25;
  __CFString *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[PIAutoEnhanceFilter inputImage](self, "inputImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAutoEnhanceFilter inputTargetImage](self, "inputTargetImage");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (void *)v4;
  else
    v6 = v3;
  v7 = v6;

  NSLog(CFSTR("Auto-Enhance input: %llX, target: %llX"), objc_msgSend(v3, "digest"), objc_msgSend(v7, "digest"));
  if (v3)
  {
    -[PIAutoEnhanceFilter inputAlgorithm](self, "inputAlgorithm");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = CFSTR("Aperture");
    if (v8)
      v10 = (__CFString *)v8;
    v11 = v10;

    objc_msgSend((id)objc_opt_class(), "autoEnhanceCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%llX"), v11, objc_msgSend(v7, "digest"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      -[PIAutoEnhanceFilter autoEnhanceFiltersForImage:algorithm:](self, "autoEnhanceFiltersForImage:algorithm:", v7, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v14, v13);
    }
    v25 = v12;
    v26 = v11;
    v15 = v3;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v16 = v14;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v28;
      v20 = *MEMORY[0x1E0C9E1F8];
      do
      {
        v21 = 0;
        v22 = v15;
        do
        {
          if (*(_QWORD *)v28 != v19)
            objc_enumerationMutation(v16);
          v23 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v21);
          objc_msgSend(v23, "setValue:forKey:", v22, v20);
          objc_msgSend(v23, "outputImage");
          v15 = (id)objc_claimAutoreleasedReturnValue();

          ++v21;
          v22 = v15;
        }
        while (v18 != v21);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v18);
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)autoEnhanceFiltersForImage:(id)a3 algorithm:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("Aperture")))
  {
    -[PIAutoEnhanceFilter apertureAutoEnhanceFiltersForImage:](self, "apertureAutoEnhanceFiltersForImage:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("Photos")))
  {
    -[PIAutoEnhanceFilter photosAutoEnhanceFiltersForImage:](self, "photosAutoEnhanceFiltersForImage:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v7, "isEqualToString:", CFSTR("ColorNorm")))
    {
      v9 = 0;
      goto LABEL_8;
    }
    -[PIAutoEnhanceFilter colorNormalizationFiltersForImage:](self, "colorNormalizationFiltersForImage:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
LABEL_8:

  return v9;
}

- (id)apertureAutoEnhanceFiltersForImage:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0C9E0F0];
  v9[0] = *MEMORY[0x1E0C9E0C0];
  v9[1] = v3;
  v10[0] = MEMORY[0x1E0C9AAB0];
  v10[1] = MEMORY[0x1E0C9AAA0];
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "autoAdjustmentFiltersWithOptions:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)colorNormalizationFiltersForImage:(id)a3
{
  id v3;
  PIColorNormalizationFilter *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(PIColorNormalizationFilter);
  -[PIColorNormalizationFilter setInputImage:](v4, "setInputImage:", v3);

  -[PIColorNormalizationFilter outputNormalization](v4, "outputNormalization");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PIColorNormalizationFilter setInputImage:](v4, "setInputImage:", 0);
    -[PIColorNormalizationFilter setInputNormalization:](v4, "setInputNormalization:", v5);
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSLog(CFSTR("*** failed to compute color normalization, ignored"));
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (id)photosAutoEnhanceFiltersForImage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  id v21;
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
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
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
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  id v81;
  id v82;
  id v83;
  id v84;
  const __CFString *v85;
  void *v86;
  _QWORD v87[2];
  _QWORD v88[2];
  _QWORD v89[6];
  _QWORD v90[6];
  const __CFString *v91;
  void *v92;
  _QWORD v93[5];
  _QWORD v94[5];
  _QWORD v95[4];
  _QWORD v96[4];
  uint64_t v97;
  _QWORD v98[3];

  v98[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C9DD90];
  v97 = *MEMORY[0x1E0C9DF88];
  v98[0] = CFSTR("PIAutoEnhanceFilter");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, &v97, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextWithOptions:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v84 = 0;
  objc_msgSend(MEMORY[0x1E0C9DDB8], "extractDataToDictionary:dataExtractor:options:context:colorSpace:error:", v3, CFSTR("CILocalLight"), 0, v6, 0, &v84);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v84;
  v9 = v8;
  if (v7)
  {
    v83 = v8;
    objc_msgSend(MEMORY[0x1E0C9DDB8], "extractDataToDictionary:dataExtractor:options:context:colorSpace:error:", v3, CFSTR("CISmartTone"), 0, v6, 0, &v83);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v83;

    v12 = (void *)MEMORY[0x1E0C9DDC8];
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("autoValue"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v15 = v14;
    v80 = v7;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("localAutoValue"));
    v16 = v3;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValue");
    objc_msgSend(v12, "smartToneAdjustmentsForValue:localLightAutoValue:andStatistics:", v10, v15, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v82 = v11;
      objc_msgSend(MEMORY[0x1E0C9DDB8], "extractDataToDictionary:dataExtractor:options:context:colorSpace:error:", v16, CFSTR("CISmartColor"), 0, v6, 0, &v82);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v82;

      v22 = (void *)MEMORY[0x1E0C9DDC8];
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("satAutoValue"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "doubleValue");
      objc_msgSend(v22, "smartColorAdjustmentsForValue:andStatistics:", v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = v20;
      v3 = v16;
      if (v25)
      {
        v81 = v21;
        objc_msgSend(MEMORY[0x1E0C9DDB8], "extractDataToDictionary:dataExtractor:options:context:colorSpace:error:", v16, CFSTR("CIFaceBalance"), 0, v6, 0, &v81);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v81;

        if (v26)
        {
          v78 = v24;
          v73 = v25;
          v74 = v3;
          v72 = v10;
          v75 = v11;
          v79 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v76 = v26;
          if (objc_msgSend(v26, "count"))
          {
            v27 = (void *)MEMORY[0x1E0C9DDB8];
            v95[0] = CFSTR("inputOrigI");
            objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("OrigI"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v96[0] = v28;
            v95[1] = CFSTR("inputOrigQ");
            objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("OrigQ"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v96[1] = v29;
            v95[2] = CFSTR("inputStrength");
            objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("Strength"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v96[2] = v30;
            v95[3] = CFSTR("inputWarmth");
            objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("Warmth"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v96[3] = v31;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v96, v95, 4);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "filterWithName:withInputParameters:", CFSTR("CIFaceBalance"), v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (v33)
            {
              objc_msgSend(v79, "addObject:", v33);

            }
          }
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("inputShadows"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "doubleValue");
          v36 = v35;

          v37 = (void *)MEMORY[0x1E0C9DDB8];
          v93[0] = CFSTR("inputLocalLight");
          v77 = v19;
          objc_msgSend(v19, "objectForKeyedSubscript:");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v94[0] = v38;
          v93[1] = CFSTR("inputSmartShadows");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", fmax(v36, 0.0));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v94[1] = v39;
          v93[2] = CFSTR("inputLightMap");
          objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("lightMap"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v94[2] = v40;
          v93[3] = CFSTR("inputLightMapWidth");
          objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("lightMapWidth"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v94[3] = v41;
          v93[4] = CFSTR("inputLightMapHeight");
          objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("lightMapHeight"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v94[4] = v42;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, v93, 5);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "filterWithName:withInputParameters:", CFSTR("CILocalLightFilter"), v43);
          v44 = objc_claimAutoreleasedReturnValue();

          if (v44)
            objc_msgSend(v79, "addObject:", v44);
          v71 = (void *)v44;
          v45 = (void *)MEMORY[0x1E0C9DDB8];
          v91 = CFSTR("inputStrength");
          objc_msgSend(v77, "objectForKeyedSubscript:", CFSTR("inputBrightness"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v92 = v46;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "filterWithName:withInputParameters:", CFSTR("CIHighKey"), v47);
          v48 = objc_claimAutoreleasedReturnValue();

          if (v48)
            objc_msgSend(v79, "addObject:", v48);
          v70 = (void *)v48;
          v49 = (void *)MEMORY[0x1E0C9DDB8];
          v89[0] = CFSTR("inputExposure");
          objc_msgSend(v77, "objectForKeyedSubscript:");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v90[0] = v50;
          v89[1] = CFSTR("inputContrast");
          objc_msgSend(v77, "objectForKeyedSubscript:");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v90[1] = v51;
          v89[2] = CFSTR("inputShadows");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", fmin(v36, 0.0));
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v90[2] = v52;
          v89[3] = CFSTR("inputHighlights");
          objc_msgSend(v77, "objectForKeyedSubscript:");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v90[3] = v53;
          v89[4] = CFSTR("inputBlack");
          objc_msgSend(v77, "objectForKeyedSubscript:");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v90[4] = v54;
          v89[5] = CFSTR("inputRawHighlights");
          objc_msgSend(v77, "objectForKeyedSubscript:");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v90[5] = v55;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, v89, 6);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "filterWithName:withInputParameters:", CFSTR("CISmartToneFilter"), v56);
          v57 = objc_claimAutoreleasedReturnValue();

          if (v57)
            objc_msgSend(v79, "addObject:", v57);
          v58 = (void *)v57;
          v59 = (void *)MEMORY[0x1E0C9DDB8];
          v87[0] = CFSTR("inputCast");
          objc_msgSend(v78, "objectForKeyedSubscript:");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v87[1] = CFSTR("inputVibrancy");
          v88[0] = v60;
          objc_msgSend(v78, "objectForKeyedSubscript:");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v88[1] = v61;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, v87, 2);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "filterWithName:withInputParameters:", CFSTR("CISmartColorFilter"), v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = v73;
          if (v63)
            objc_msgSend(v79, "addObject:", v63);
          v64 = (void *)MEMORY[0x1E0C9DDB8];
          v85 = CFSTR("inputAmount");
          objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("inputContrast"));
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = v65;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "filterWithName:withInputParameters:", CFSTR("CIVibrance"), v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = v77;
          v68 = v79;
          if (v67)
            objc_msgSend(v79, "addObject:", v67);

          v3 = v74;
          v11 = v75;
          v10 = v72;
          v24 = v78;
          v26 = v76;
        }
        else
        {
          NSLog(CFSTR("*** failed to compute face balance statistics: %@"), v11);
          v68 = (void *)MEMORY[0x1E0C9AA60];
        }

      }
      else
      {
        NSLog(CFSTR("*** failed to compute smart color statistics: %@"), v21);
        v68 = (void *)MEMORY[0x1E0C9AA60];
        v11 = v21;
      }
      v7 = v80;

    }
    else
    {
      NSLog(CFSTR("*** failed to compute smart tone statistics: %@"), v11);
      v68 = (void *)MEMORY[0x1E0C9AA60];
      v3 = v16;
      v7 = v80;
    }

    v9 = v11;
  }
  else
  {
    NSLog(CFSTR("*** failed to compute smart tone statistics: %@"), v8);
    v68 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v68;
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputImage, a3);
}

- (CIImage)inputTargetImage
{
  return self->_inputTargetImage;
}

- (void)setInputTargetImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputTargetImage, a3);
}

- (NSString)inputAlgorithm
{
  return self->_inputAlgorithm;
}

- (void)setInputAlgorithm:(id)a3
{
  objc_storeStrong((id *)&self->_inputAlgorithm, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputAlgorithm, 0);
  objc_storeStrong((id *)&self->_inputTargetImage, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

@end
