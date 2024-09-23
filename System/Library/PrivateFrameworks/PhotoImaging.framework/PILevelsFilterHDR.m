@implementation PILevelsFilterHDR

+ (id)defaultValueForKey:(id)a3
{
  id v3;
  double v4;
  void *v5;

  v3 = a3;
  v4 = 0.0;
  if ((objc_msgSend(v3, "containsString:", CFSTR("inputBlackSrc")) & 1) == 0
    && (objc_msgSend(v3, "containsString:", CFSTR("inputBlackDst")) & 1) == 0)
  {
    v4 = 0.25;
    if ((objc_msgSend(v3, "containsString:", CFSTR("inputShadowSrc")) & 1) == 0
      && (objc_msgSend(v3, "containsString:", CFSTR("inputShadowDst")) & 1) == 0)
    {
      v4 = 0.5;
      if ((objc_msgSend(v3, "containsString:", CFSTR("inputMidSrc")) & 1) == 0
        && (objc_msgSend(v3, "containsString:", CFSTR("inputMidDst")) & 1) == 0)
      {
        v4 = 0.75;
        if ((objc_msgSend(v3, "containsString:", CFSTR("inputHilightSrc")) & 1) == 0
          && (objc_msgSend(v3, "containsString:", CFSTR("inputHilightDst")) & 1) == 0)
        {
          if ((objc_msgSend(v3, "containsString:", CFSTR("inputWhiteSrc")) & 1) != 0
            || (v4 = 0.0, objc_msgSend(v3, "containsString:", CFSTR("inputWhiteDst"))))
          {
            v4 = 1.0;
          }
        }
      }
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_customAttributesForKey:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "defaultValueForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0C9DE50], &unk_1E50519C8, *MEMORY[0x1E0C9DE48], &unk_1E50519B8, *MEMORY[0x1E0C9DE60], &unk_1E50519C8, *MEMORY[0x1E0C9DE58], v3, *MEMORY[0x1E0C9DE10], v3, *MEMORY[0x1E0C9DE40], *MEMORY[0x1E0C9DED0], *MEMORY[0x1E0C9DE68], 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)customAttributes
{
  void *v3;
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
  id v19;
  id v20;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;

  v19 = (id)MEMORY[0x1E0C99D80];
  objc_msgSend(a1, "_customAttributesForKey:", CFSTR("inputBlackSrcRGB"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_customAttributesForKey:", CFSTR("inputBlackDstRGB"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_customAttributesForKey:", CFSTR("inputShadowSrcRGB"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_customAttributesForKey:", CFSTR("inputShadowDstRGB"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_customAttributesForKey:", CFSTR("inputMidSrcRGB"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_customAttributesForKey:", CFSTR("inputMidDstRGB"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_customAttributesForKey:", CFSTR("inputHilightSrcRGB"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_customAttributesForKey:", CFSTR("inputHilightDstRGB"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_customAttributesForKey:", CFSTR("inputWhiteSrcRGB"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_customAttributesForKey:", CFSTR("inputWhiteDstRGB"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_customAttributesForKey:", CFSTR("inputBlackSrcRed"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_customAttributesForKey:", CFSTR("inputBlackDstRed"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_customAttributesForKey:", CFSTR("inputShadowSrcRed"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_customAttributesForKey:", CFSTR("inputShadowDstRed"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_customAttributesForKey:", CFSTR("inputMidSrcRed"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_customAttributesForKey:", CFSTR("inputMidDstRed"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_customAttributesForKey:", CFSTR("inputHilightSrcRed"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_customAttributesForKey:", CFSTR("inputHilightDstRed"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_customAttributesForKey:", CFSTR("inputWhiteSrcRed"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_customAttributesForKey:", CFSTR("inputWhiteDstRed"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_customAttributesForKey:", CFSTR("inputBlackSrcGreen"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_customAttributesForKey:", CFSTR("inputBlackDstGreen"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_customAttributesForKey:", CFSTR("inputShadowSrcGreen"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_customAttributesForKey:", CFSTR("inputShadowDstGreen"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_customAttributesForKey:", CFSTR("inputMidSrcGreen"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_customAttributesForKey:", CFSTR("inputMidDstGreen"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_customAttributesForKey:", CFSTR("inputHilightSrcGreen"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_customAttributesForKey:", CFSTR("inputHilightDstGreen"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_customAttributesForKey:", CFSTR("inputWhiteSrcGreen"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_customAttributesForKey:", CFSTR("inputWhiteDstGreen"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_customAttributesForKey:", CFSTR("inputBlackSrcBlue"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_customAttributesForKey:", CFSTR("inputBlackDstBlue"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_customAttributesForKey:", CFSTR("inputShadowSrcBlue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_customAttributesForKey:", CFSTR("inputShadowDstBlue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_customAttributesForKey:", CFSTR("inputMidSrcBlue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_customAttributesForKey:", CFSTR("inputMidDstBlue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_customAttributesForKey:", CFSTR("inputHilightSrcBlue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_customAttributesForKey:", CFSTR("inputHilightDstBlue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_customAttributesForKey:", CFSTR("inputWhiteSrcBlue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_customAttributesForKey:", CFSTR("inputWhiteDstBlue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dictionaryWithObjectsAndKeys:", v45, CFSTR("inputBlackSrcRGB"), v44, CFSTR("inputBlackDstRGB"), v43, CFSTR("inputShadowSrcRGB"), v42, CFSTR("inputShadowDstRGB"), v41, CFSTR("inputMidSrcRGB"), v40, CFSTR("inputMidDstRGB"), v39, CFSTR("inputHilightSrcRGB"), v38, CFSTR("inputHilightDstRGB"), v37,
    CFSTR("inputWhiteSrcRGB"),
    v36,
    CFSTR("inputWhiteDstRGB"),
    v35,
    CFSTR("inputBlackSrcRed"),
    v34,
    CFSTR("inputBlackDstRed"),
    v33,
    CFSTR("inputShadowSrcRed"),
    v32,
    CFSTR("inputShadowDstRed"),
    v31,
    CFSTR("inputMidSrcRed"),
    v30,
    CFSTR("inputMidDstRed"),
    v29,
    CFSTR("inputHilightSrcRed"),
    v28,
    CFSTR("inputHilightDstRed"),
    v27,
    CFSTR("inputWhiteSrcRed"),
    v26,
    CFSTR("inputWhiteDstRed"),
    v25,
    CFSTR("inputBlackSrcGreen"),
    v18,
    CFSTR("inputBlackDstGreen"),
    v17,
    CFSTR("inputShadowSrcGreen"),
    v16,
    CFSTR("inputShadowDstGreen"),
    v15,
    CFSTR("inputMidSrcGreen"),
    v14,
    CFSTR("inputMidDstGreen"),
    v13,
    CFSTR("inputHilightSrcGreen"),
    v24,
    CFSTR("inputHilightDstGreen"),
    v12,
    CFSTR("inputWhiteSrcGreen"),
    v23,
    CFSTR("inputWhiteDstGreen"),
    v22);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)P3KernelHDR
{
  if (P3KernelHDR_once != -1)
    dispatch_once(&P3KernelHDR_once, &__block_literal_global_1637);
  return (id)P3KernelHDR_singleton;
}

- (void)setDefaults
{
  uint64_t v3;
  void *v4;
  id v5;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t i;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v3 = 0;
  v29 = *MEMORY[0x1E0C80C00];
  v27 = xmmword_1E5015768;
  v28 = *(_OWORD *)&off_1E5015778;
  do
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    v5 = *(id *)((char *)&v27 + v3);
    objc_msgSend(v4, "numberWithDouble:", 0.0, v27, v28);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("inputBlackSrc"), "stringByAppendingString:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PILevelsFilterHDR setValue:forKey:](self, "setValue:forKey:", v6, v7);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("inputBlackDst"), "stringByAppendingString:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PILevelsFilterHDR setValue:forKey:](self, "setValue:forKey:", v8, v9);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.25);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("inputShadowSrc"), "stringByAppendingString:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PILevelsFilterHDR setValue:forKey:](self, "setValue:forKey:", v10, v11);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.25);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("inputShadowDst"), "stringByAppendingString:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PILevelsFilterHDR setValue:forKey:](self, "setValue:forKey:", v12, v13);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("inputMidSrc"), "stringByAppendingString:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PILevelsFilterHDR setValue:forKey:](self, "setValue:forKey:", v14, v15);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("inputMidDst"), "stringByAppendingString:", v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PILevelsFilterHDR setValue:forKey:](self, "setValue:forKey:", v16, v17);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.75);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("inputHilightSrc"), "stringByAppendingString:", v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PILevelsFilterHDR setValue:forKey:](self, "setValue:forKey:", v18, v19);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.75);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("inputHilightDst"), "stringByAppendingString:", v5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PILevelsFilterHDR setValue:forKey:](self, "setValue:forKey:", v20, v21);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("inputWhiteSrc"), "stringByAppendingString:", v5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PILevelsFilterHDR setValue:forKey:](self, "setValue:forKey:", v22, v23);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("inputWhiteDst"), "stringByAppendingString:", v5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    -[PILevelsFilterHDR setValue:forKey:](self, "setValue:forKey:", v24, v25);
    v3 += 8;
  }
  while (v3 != 32);
  for (i = 24; i != -8; i -= 8)

}

- (double)floatValueForKey:(id)a3 defaultValue:(double)a4 clearIfNotDefault:(BOOL *)a5
{
  void *v7;
  void *v8;
  double v9;
  float v10;

  -[PILevelsFilterHDR valueForKey:](self, "valueForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a4;
  if (v7)
  {
    objc_msgSend(v7, "floatValue");
    v9 = v10;
  }
  if (v9 != a4)
    *a5 = 0;

  return v9;
}

- (id)_LUTImage
{
  char *v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  char *v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  id v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  uint64_t v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  float64x2_t v80;
  int8x16_t v81;
  int8x16_t v82;
  float64x2_t v83;
  float64x2_t v84;
  int8x16_t v85;
  int8x16_t v86;
  float64x2_t v87;
  int64x2_t v88;
  float64x2_t v89;
  float64x2_t v90;
  float64x2_t v91;
  float64x2_t v97;
  int8x16_t v100;
  float64x2_t v101;
  float64x2_t v102;
  float64x2_t v103;
  float64x2_t v104;
  float64x2_t v105;
  float64x2_t v106;
  float64x2_t v107;
  float64x2_t v108;
  float64x2_t v109;
  float64x2_t v110;
  float64x2_t v111;
  float64x2_t v112;
  float64x2_t v113;
  float64x2_t v114;
  float64x2_t v115;
  float64x2_t v116;
  char *v117;
  void *v118;
  uint64_t j;
  uint64_t i;
  vImage_Error v122;
  void *v123;
  void *v124;
  vImage_Error v125;
  NSObject *v126;
  void *v127;
  const void **v128;
  void *specific;
  NSObject *v130;
  _BOOL4 v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  id v136;
  void *v137;
  void *v138;
  PILevelsFilterHDR *v139;
  SEL v140;
  char *v141;
  float64x2_t v142;
  int8x16_t v143;
  int8x16_t v144;
  float64x2_t v145;
  float64x2_t v146;
  int8x16_t v147;
  int8x16_t v148;
  float64x2_t v149;
  float64x2_t v150;
  int8x16_t v151;
  int8x16_t v152;
  float64x2_t v153;
  float64x2_t v154;
  float64x2_t v155;
  uint64_t v156;
  uint64_t v157;
  float64x2_t v158;
  int8x16_t v159;
  int8x16_t v160;
  uint64_t v161;
  uint64_t v162;
  float64x2_t v163;
  uint64_t v164;
  float64x2_t v165;
  uint64_t v166;
  float64x2_t v167;
  vImage_Buffer dest;
  char v169;
  uint8_t buf[4];
  void *v171;
  __int16 v172;
  void *v173;
  __int128 v174;
  const __CFString *v175;
  uint64_t v176;

  v176 = *MEMORY[0x1E0C80C00];
  v174 = xmmword_1E5015788;
  v175 = CFSTR("Blue");
  v3 = (char *)malloc_type_malloc(0x2000uLL, 0x6769F164uLL);
  v169 = 1;
  -[PILevelsFilterHDR floatValueForKey:defaultValue:clearIfNotDefault:](self, "floatValueForKey:defaultValue:clearIfNotDefault:", CFSTR("inputBlackSrcRGB"), &v169, 0.0);
  v5 = v4;
  -[PILevelsFilterHDR floatValueForKey:defaultValue:clearIfNotDefault:](self, "floatValueForKey:defaultValue:clearIfNotDefault:", CFSTR("inputShadowSrcRGB"), &v169, 0.25);
  v164 = v6;
  -[PILevelsFilterHDR floatValueForKey:defaultValue:clearIfNotDefault:](self, "floatValueForKey:defaultValue:clearIfNotDefault:", CFSTR("inputMidSrcRGB"), &v169, 0.5);
  v166 = v7;
  -[PILevelsFilterHDR floatValueForKey:defaultValue:clearIfNotDefault:](self, "floatValueForKey:defaultValue:clearIfNotDefault:", CFSTR("inputHilightSrcRGB"), &v169, 0.75);
  v161 = v8;
  -[PILevelsFilterHDR floatValueForKey:defaultValue:clearIfNotDefault:](self, "floatValueForKey:defaultValue:clearIfNotDefault:", CFSTR("inputWhiteSrcRGB"), &v169, 1.0);
  v10 = v9;
  -[PILevelsFilterHDR floatValueForKey:defaultValue:clearIfNotDefault:](self, "floatValueForKey:defaultValue:clearIfNotDefault:", CFSTR("inputBlackDstRGB"), &v169, 0.0);
  v12 = v11;
  -[PILevelsFilterHDR floatValueForKey:defaultValue:clearIfNotDefault:](self, "floatValueForKey:defaultValue:clearIfNotDefault:", CFSTR("inputShadowDstRGB"), &v169, 0.25);
  v14 = v13;
  -[PILevelsFilterHDR floatValueForKey:defaultValue:clearIfNotDefault:](self, "floatValueForKey:defaultValue:clearIfNotDefault:", CFSTR("inputMidDstRGB"), &v169, 0.5);
  v16 = v15;
  -[PILevelsFilterHDR floatValueForKey:defaultValue:clearIfNotDefault:](self, "floatValueForKey:defaultValue:clearIfNotDefault:", CFSTR("inputHilightDstRGB"), &v169, 0.75);
  v18 = v17;
  -[PILevelsFilterHDR floatValueForKey:defaultValue:clearIfNotDefault:](self, "floatValueForKey:defaultValue:clearIfNotDefault:", CFSTR("inputWhiteDstRGB"), &v169, 1.0);
  if (v5 == 0.0 && *(double *)&v166 == 0.0 && v10 == 0.0)
  {
    if (!v3)
    {
LABEL_33:
      v118 = 0;
      goto LABEL_34;
    }
    v20 = v3;
LABEL_32:
    free(v20);
    goto LABEL_33;
  }
  v21 = 0;
  v22 = (v19 - v12) / (v10 - v5);
  v23 = v12 - v5 * v22;
  v24 = v16 - (v23 + *(double *)&v166 * v22);
  v25 = *(double *)&v164 - *(double *)&v166;
  if (*(double *)&v164 - *(double *)&v166 >= 0.0)
    v26 = 1.0 / (*(double *)&v166 - v10);
  else
    v26 = 1.0 / (*(double *)&v166 - v5);
  v27 = v25 * v26;
  v28 = v27 + 1.0;
  v29 = -((v27 * 2.0 + 3.0) * v27) * v27 + 1.0;
  if (v28 < 0.0)
    v29 = 0.0;
  v30 = v14 - (v23 + *(double *)&v164 * v22 + v29 * v24);
  v31 = *(double *)&v161 - *(double *)&v166;
  if (*(double *)&v161 - *(double *)&v166 >= 0.0)
    v32 = 1.0 / (*(double *)&v166 - v10);
  else
    v32 = 1.0 / (*(double *)&v166 - v5);
  v33 = v31 * v32;
  v34 = v33 + 1.0;
  v35 = -((v33 * 2.0 + 3.0) * v33) * v33 + 1.0;
  if (v34 < 0.0)
    v35 = 0.0;
  v155 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v22, 0);
  v154 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v23, 0);
  v152 = (int8x16_t)vdupq_lane_s64(COERCE__INT64(1.0 / (*(double *)&v166 - v5)), 0);
  v153 = (float64x2_t)vdupq_lane_s64(v166, 0);
  v150 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v24, 0);
  v151 = (int8x16_t)vdupq_lane_s64(COERCE__INT64(1.0 / (*(double *)&v166 - v10)), 0);
  v148 = (int8x16_t)vdupq_lane_s64(COERCE__INT64(*(double *)&v164 - v5), 0);
  v149 = (float64x2_t)vdupq_lane_s64(v164, 0);
  v146 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v30, 0);
  v147 = (int8x16_t)vdupq_lane_s64(*(uint64_t *)&v25, 0);
  v144 = (int8x16_t)vdupq_lane_s64(*(uint64_t *)&v31, 0);
  v145 = (float64x2_t)vdupq_lane_s64(v161, 0);
  v142 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v18 - (v23 + *(double *)&v161 * v22 + v35 * v24)), 0);
  v143 = (int8x16_t)vdupq_lane_s64(COERCE__INT64(*(double *)&v161 - v10), 0);
  v141 = v3;
  do
  {
    v36 = *((id *)&v174 + v21);
    objc_msgSend(CFSTR("inputBlackSrc"), "stringByAppendingString:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[PILevelsFilterHDR floatValueForKey:defaultValue:clearIfNotDefault:](self, "floatValueForKey:defaultValue:clearIfNotDefault:", v37, &v169, 0.0);
    v39 = v38;

    objc_msgSend(CFSTR("inputShadowSrc"), "stringByAppendingString:", v36);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PILevelsFilterHDR floatValueForKey:defaultValue:clearIfNotDefault:](self, "floatValueForKey:defaultValue:clearIfNotDefault:", v40, &v169, 0.25);
    v157 = v41;

    objc_msgSend(CFSTR("inputMidSrc"), "stringByAppendingString:", v36);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[PILevelsFilterHDR floatValueForKey:defaultValue:clearIfNotDefault:](self, "floatValueForKey:defaultValue:clearIfNotDefault:", v42, &v169, 0.5);
    v162 = v43;

    objc_msgSend(CFSTR("inputHilightSrc"), "stringByAppendingString:", v36);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[PILevelsFilterHDR floatValueForKey:defaultValue:clearIfNotDefault:](self, "floatValueForKey:defaultValue:clearIfNotDefault:", v44, &v169, 0.75);
    v156 = v45;

    objc_msgSend(CFSTR("inputWhiteSrc"), "stringByAppendingString:", v36);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[PILevelsFilterHDR floatValueForKey:defaultValue:clearIfNotDefault:](self, "floatValueForKey:defaultValue:clearIfNotDefault:", v46, &v169, 1.0);
    v48 = v47;

    objc_msgSend(CFSTR("inputBlackDst"), "stringByAppendingString:", v36);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[PILevelsFilterHDR floatValueForKey:defaultValue:clearIfNotDefault:](self, "floatValueForKey:defaultValue:clearIfNotDefault:", v49, &v169, 0.0);
    v51 = v50;

    objc_msgSend(CFSTR("inputShadowDst"), "stringByAppendingString:", v36);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[PILevelsFilterHDR floatValueForKey:defaultValue:clearIfNotDefault:](self, "floatValueForKey:defaultValue:clearIfNotDefault:", v52, &v169, 0.25);
    v54 = v53;

    objc_msgSend(CFSTR("inputMidDst"), "stringByAppendingString:", v36);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[PILevelsFilterHDR floatValueForKey:defaultValue:clearIfNotDefault:](self, "floatValueForKey:defaultValue:clearIfNotDefault:", v55, &v169, 0.5);
    v57 = v56;

    objc_msgSend(CFSTR("inputHilightDst"), "stringByAppendingString:", v36);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[PILevelsFilterHDR floatValueForKey:defaultValue:clearIfNotDefault:](self, "floatValueForKey:defaultValue:clearIfNotDefault:", v58, &v169, 0.75);
    v60 = v59;

    objc_msgSend(CFSTR("inputWhiteDst"), "stringByAppendingString:", v36);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[PILevelsFilterHDR floatValueForKey:defaultValue:clearIfNotDefault:](self, "floatValueForKey:defaultValue:clearIfNotDefault:", v61, &v169, 1.0);
    v63 = v62;

    v64 = 0;
    v65 = *(double *)&v156 - *(double *)&v162;
    v66 = 1.0 / (*(double *)&v162 - v48);
    if (*(double *)&v156 - *(double *)&v162 >= 0.0)
      v67 = 1.0 / (*(double *)&v162 - v48);
    else
      v67 = 1.0 / (*(double *)&v162 - v39);
    v68 = v65 * v67;
    v69 = v68 + 1.0;
    v70 = -((v68 * 2.0 + 3.0) * v68) * v68 + 1.0;
    if (v69 < 0.0)
      v70 = 0.0;
    v71 = (v63 - v51) / (v48 - v39);
    v72 = v51 - v39 * v71;
    v73 = v57 - (v72 + *(double *)&v162 * v71);
    v74 = v60 - (v72 + *(double *)&v156 * v71 + v70 * v73);
    v75 = *(double *)&v157 - *(double *)&v162;
    if (*(double *)&v157 - *(double *)&v162 >= 0.0)
      v76 = 1.0 / (*(double *)&v162 - v48);
    else
      v76 = 1.0 / (*(double *)&v162 - v39);
    v77 = v75 * v76;
    v78 = v77 + 1.0;
    v79 = -((v77 * 2.0 + 3.0) * v77) * v77 + 1.0;
    if (v78 < 0.0)
      v79 = 0.0;
    v165 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v72, 0);
    v167 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v71, 0);
    v160 = (int8x16_t)vdupq_lane_s64(COERCE__INT64(1.0 / (*(double *)&v162 - v39)), 0);
    v163 = (float64x2_t)vdupq_lane_s64(v162, 0);
    v158 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v73, 0);
    v159 = (int8x16_t)vdupq_lane_s64(*(uint64_t *)&v66, 0);
    v80 = (float64x2_t)vdupq_lane_s64(v157, 0);
    v81 = (int8x16_t)vdupq_lane_s64(COERCE__INT64(*(double *)&v157 - v39), 0);
    v82 = (int8x16_t)vdupq_lane_s64(*(uint64_t *)&v75, 0);
    v83 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v54 - (v72 + *(double *)&v157 * v71 + v79 * v73)), 0);
    v84 = (float64x2_t)vdupq_lane_s64(v156, 0);
    v85 = (int8x16_t)vdupq_lane_s64(*(uint64_t *)&v65, 0);
    v86 = (int8x16_t)vdupq_lane_s64(COERCE__INT64(*(double *)&v156 - v48), 0);
    v87 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v74, 0);
    v88 = (int64x2_t)xmmword_1A64DDD90;
    do
    {
      v89 = vmulq_f64(vcvtq_f64_s64(v88), (float64x2_t)vdupq_n_s64(0x3F50000000000000uLL));
      v90 = vsubq_f64(v89, v153);
      v91 = vmulq_f64(v90, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v90), v152, v151));
      __asm { FMOV            V23.2D, #1.0 }
      v97 = vaddq_f64(v91, _Q23);
      __asm
      {
        FMOV            V24.2D, #2.0
        FMOV            V25.2D, #3.0
      }
      v100 = (int8x16_t)vmlaq_f64(_Q23, v91, vmulq_f64(v91, vnegq_f64(vmlaq_f64(_Q25, _Q24, v91))));
      v101 = vsubq_f64(v89, v149);
      v102 = vmulq_f64(v101, vdivq_f64(_Q23, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v101), v148, v147)));
      v103 = vmlaq_f64(vmlaq_f64(v154, v155, v89), v150, (float64x2_t)vbicq_s8(v100, (int8x16_t)vcltzq_f64(v97)));
      v104 = vsubq_f64(v89, v145);
      v105 = vmulq_f64(v104, vdivq_f64(_Q23, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v104), v144, v143)));
      v106 = vmlaq_f64(vmlaq_f64(v103, v146, (float64x2_t)vbicq_s8((int8x16_t)vmlaq_f64(_Q23, v102, vmulq_f64(v102, vnegq_f64(vmlaq_f64(_Q25, _Q24, v102)))), (int8x16_t)vcltzq_f64(vaddq_f64(v102, _Q23)))), v142, (float64x2_t)vbicq_s8((int8x16_t)vmlaq_f64(_Q23, v105, vmulq_f64(v105, vnegq_f64(vmlaq_f64(_Q25, _Q24, v105)))), (int8x16_t)vcltzq_f64(vaddq_f64(v105, _Q23))));
      v107 = vsubq_f64(v106, v163);
      v108 = vmulq_f64(v107, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v107), v160, v159));
      v109 = vsubq_f64(v106, v80);
      v110 = vmulq_f64(v109, vdivq_f64(_Q23, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v109), v81, v82)));
      v111 = vmlaq_f64(vmlaq_f64(v165, v167, v106), v158, (float64x2_t)vbicq_s8((int8x16_t)vmlaq_f64(_Q23, v108, vmulq_f64(v108, vnegq_f64(vmlaq_f64(_Q25, _Q24, v108)))), (int8x16_t)vcltzq_f64(vaddq_f64(v108, _Q23))));
      v112 = vsubq_f64(v106, v84);
      v113 = vmulq_f64(v112, vdivq_f64(_Q23, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v112), v85, v86)));
      v114 = vmlaq_f64(vmlaq_f64(v111, v83, (float64x2_t)vbicq_s8((int8x16_t)vmlaq_f64(_Q23, v110, vmulq_f64(v110, vnegq_f64(vmlaq_f64(_Q25, _Q24, v110)))), (int8x16_t)vcltzq_f64(vaddq_f64(v110, _Q23)))), v87, (float64x2_t)vbicq_s8((int8x16_t)vmlaq_f64(_Q23, v113, vmulq_f64(v113, vnegq_f64(vmlaq_f64(_Q25, _Q24, v113)))), (int8x16_t)vcltzq_f64(vaddq_f64(v113, _Q23))));
      v115 = (float64x2_t)vbicq_s8((int8x16_t)v114, (int8x16_t)vcltzq_f64(v114));
      v116 = (float64x2_t)vdupq_n_s64(0x40EFFFE000000000uLL);
      *(int32x2_t *)&_Q23.f64[0] = vmovn_s64(vcvtq_s64_f64((float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v115, _Q23), (int8x16_t)v116, (int8x16_t)vmulq_f64(v115, v116))));
      v88 = vaddq_s64(v88, vdupq_n_s64(2uLL));
      v117 = &v3[v64];
      *(_WORD *)v117 = LOWORD(_Q23.f64[0]);
      *((_WORD *)v117 + 4) = WORD2(_Q23.f64[0]);
      v64 += 16;
    }
    while (v64 != 0x2000);

    ++v21;
    v3 += 2;
  }
  while (v21 != 3);
  if (v169)
  {
    v20 = v141;
    goto LABEL_32;
  }
  for (i = 6; i != 8198; i += 8)
    *(_WORD *)&v141[i] = 0x7FFF;
  dest.data = v141;
  *(_OWORD *)&dest.height = xmmword_1A64DDDA0;
  dest.rowBytes = 0x2000;
  v122 = vImageConvert_16Uto16F(&dest, &dest, 0);
  if (!v122)
  {
    v123 = (void *)MEMORY[0x1E0C9DDC8];
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v141, 0x2000, 1);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "imageWithBitmapData:bytesPerRow:size:format:colorSpace:", v124, 0x2000, *MEMORY[0x1E0C9E080], 0, 1024.0, 1.0);
    v118 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_34:
    for (j = 16; j != -8; j -= 8)

    return v118;
  }
  v125 = v122;
  NUAssertLogger_1622();
  v126 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed converting data to RGBAh: %ld"), v125);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v171 = v127;
    _os_log_error_impl(&dword_1A6382000, v126, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

  }
  v128 = (const void **)MEMORY[0x1E0D51D48];
  specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
  NUAssertLogger_1622();
  v130 = objc_claimAutoreleasedReturnValue();
  v131 = os_log_type_enabled(v130, OS_LOG_TYPE_ERROR);
  if (specific)
  {
    if (v131)
    {
      v134 = dispatch_get_specific(*v128);
      v135 = (void *)MEMORY[0x1E0CB3978];
      v136 = v134;
      objc_msgSend(v135, "callStackSymbols");
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v137, "componentsJoinedByString:", CFSTR("\n"));
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v171 = v134;
      v172 = 2114;
      v173 = v138;
      _os_log_error_impl(&dword_1A6382000, v130, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
  }
  else if (v131)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "componentsJoinedByString:", CFSTR("\n"));
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v171 = v133;
    _os_log_error_impl(&dword_1A6382000, v130, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

  }
  v139 = (PILevelsFilterHDR *)_NUAssertFailHandler();
  return -[PILevelsFilterHDR outputImage](v139, v140);
}

- (id)outputImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  CIImage *v25;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  -[PILevelsFilterHDR _LUTImage](self, "_LUTImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C9DDF0], "samplerWithImage:keysAndValues:", v3, *MEMORY[0x1E0C9E2D0], *MEMORY[0x1E0C9E2C8], 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PILevelsFilterHDR P3KernelHDR](self, "P3KernelHDR");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D52068], "itur2100HLGColorSpace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "CGColorSpace");

    -[CIImage imageByColorMatchingWorkingSpaceToColorSpace:](self->_inputImage, "imageByColorMatchingWorkingSpaceToColorSpace:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0C9DDF0];
    objc_msgSend(v9, "imageByUnpremultiplyingAlpha");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "samplerWithImage:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "definition");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "extent");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v27[0] = v12;
    v27[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "applyWithExtent:roiCallback:arguments:options:", &__block_literal_global_124, v22, v6, v15, v17, v19, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "imageByColorMatchingColorSpaceToWorkingSpace:", v8);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "imageByPremultiplyingAlpha");
    v25 = (CIImage *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v25 = self->_inputImage;
  }

  return v25;
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputImage, a3);
}

- (NSNumber)inputBlackSrcRGB
{
  return self->_inputBlackSrcRGB;
}

- (void)setInputBlackSrcRGB:(id)a3
{
  objc_storeStrong((id *)&self->_inputBlackSrcRGB, a3);
}

- (NSNumber)inputBlackDstRGB
{
  return self->_inputBlackDstRGB;
}

- (void)setInputBlackDstRGB:(id)a3
{
  objc_storeStrong((id *)&self->_inputBlackDstRGB, a3);
}

- (NSNumber)inputShadowSrcRGB
{
  return self->_inputShadowSrcRGB;
}

- (void)setInputShadowSrcRGB:(id)a3
{
  objc_storeStrong((id *)&self->_inputShadowSrcRGB, a3);
}

- (NSNumber)inputShadowDstRGB
{
  return self->_inputShadowDstRGB;
}

- (void)setInputShadowDstRGB:(id)a3
{
  objc_storeStrong((id *)&self->_inputShadowDstRGB, a3);
}

- (NSNumber)inputMidSrcRGB
{
  return self->_inputMidSrcRGB;
}

- (void)setInputMidSrcRGB:(id)a3
{
  objc_storeStrong((id *)&self->_inputMidSrcRGB, a3);
}

- (NSNumber)inputMidDstRGB
{
  return self->_inputMidDstRGB;
}

- (void)setInputMidDstRGB:(id)a3
{
  objc_storeStrong((id *)&self->_inputMidDstRGB, a3);
}

- (NSNumber)inputHilightSrcRGB
{
  return self->_inputHilightSrcRGB;
}

- (void)setInputHilightSrcRGB:(id)a3
{
  objc_storeStrong((id *)&self->_inputHilightSrcRGB, a3);
}

- (NSNumber)inputHilightDstRGB
{
  return self->_inputHilightDstRGB;
}

- (void)setInputHilightDstRGB:(id)a3
{
  objc_storeStrong((id *)&self->_inputHilightDstRGB, a3);
}

- (NSNumber)inputWhiteSrcRGB
{
  return self->_inputWhiteSrcRGB;
}

- (void)setInputWhiteSrcRGB:(id)a3
{
  objc_storeStrong((id *)&self->_inputWhiteSrcRGB, a3);
}

- (NSNumber)inputWhiteDstRGB
{
  return self->_inputWhiteDstRGB;
}

- (void)setInputWhiteDstRGB:(id)a3
{
  objc_storeStrong((id *)&self->_inputWhiteDstRGB, a3);
}

- (NSNumber)inputBlackSrcRed
{
  return self->_inputBlackSrcRed;
}

- (void)setInputBlackSrcRed:(id)a3
{
  objc_storeStrong((id *)&self->_inputBlackSrcRed, a3);
}

- (NSNumber)inputBlackDstRed
{
  return self->_inputBlackDstRed;
}

- (void)setInputBlackDstRed:(id)a3
{
  objc_storeStrong((id *)&self->_inputBlackDstRed, a3);
}

- (NSNumber)inputShadowSrcRed
{
  return self->_inputShadowSrcRed;
}

- (void)setInputShadowSrcRed:(id)a3
{
  objc_storeStrong((id *)&self->_inputShadowSrcRed, a3);
}

- (NSNumber)inputShadowDstRed
{
  return self->_inputShadowDstRed;
}

- (void)setInputShadowDstRed:(id)a3
{
  objc_storeStrong((id *)&self->_inputShadowDstRed, a3);
}

- (NSNumber)inputMidSrcRed
{
  return self->_inputMidSrcRed;
}

- (void)setInputMidSrcRed:(id)a3
{
  objc_storeStrong((id *)&self->_inputMidSrcRed, a3);
}

- (NSNumber)inputMidDstRed
{
  return self->_inputMidDstRed;
}

- (void)setInputMidDstRed:(id)a3
{
  objc_storeStrong((id *)&self->_inputMidDstRed, a3);
}

- (NSNumber)inputHilightSrcRed
{
  return self->_inputHilightSrcRed;
}

- (void)setInputHilightSrcRed:(id)a3
{
  objc_storeStrong((id *)&self->_inputHilightSrcRed, a3);
}

- (NSNumber)inputHilightDstRed
{
  return self->_inputHilightDstRed;
}

- (void)setInputHilightDstRed:(id)a3
{
  objc_storeStrong((id *)&self->_inputHilightDstRed, a3);
}

- (NSNumber)inputWhiteSrcRed
{
  return self->_inputWhiteSrcRed;
}

- (void)setInputWhiteSrcRed:(id)a3
{
  objc_storeStrong((id *)&self->_inputWhiteSrcRed, a3);
}

- (NSNumber)inputWhiteDstRed
{
  return self->_inputWhiteDstRed;
}

- (void)setInputWhiteDstRed:(id)a3
{
  objc_storeStrong((id *)&self->_inputWhiteDstRed, a3);
}

- (NSNumber)inputBlackSrcGreen
{
  return self->_inputBlackSrcGreen;
}

- (void)setInputBlackSrcGreen:(id)a3
{
  objc_storeStrong((id *)&self->_inputBlackSrcGreen, a3);
}

- (NSNumber)inputBlackDstGreen
{
  return self->_inputBlackDstGreen;
}

- (void)setInputBlackDstGreen:(id)a3
{
  objc_storeStrong((id *)&self->_inputBlackDstGreen, a3);
}

- (NSNumber)inputShadowSrcGreen
{
  return self->_inputShadowSrcGreen;
}

- (void)setInputShadowSrcGreen:(id)a3
{
  objc_storeStrong((id *)&self->_inputShadowSrcGreen, a3);
}

- (NSNumber)inputShadowDstGreen
{
  return self->_inputShadowDstGreen;
}

- (void)setInputShadowDstGreen:(id)a3
{
  objc_storeStrong((id *)&self->_inputShadowDstGreen, a3);
}

- (NSNumber)inputMidSrcGreen
{
  return self->_inputMidSrcGreen;
}

- (void)setInputMidSrcGreen:(id)a3
{
  objc_storeStrong((id *)&self->_inputMidSrcGreen, a3);
}

- (NSNumber)inputMidDstGreen
{
  return self->_inputMidDstGreen;
}

- (void)setInputMidDstGreen:(id)a3
{
  objc_storeStrong((id *)&self->_inputMidDstGreen, a3);
}

- (NSNumber)inputHilightSrcGreen
{
  return self->_inputHilightSrcGreen;
}

- (void)setInputHilightSrcGreen:(id)a3
{
  objc_storeStrong((id *)&self->_inputHilightSrcGreen, a3);
}

- (NSNumber)inputHilightDstGreen
{
  return self->_inputHilightDstGreen;
}

- (void)setInputHilightDstGreen:(id)a3
{
  objc_storeStrong((id *)&self->_inputHilightDstGreen, a3);
}

- (NSNumber)inputWhiteSrcGreen
{
  return self->_inputWhiteSrcGreen;
}

- (void)setInputWhiteSrcGreen:(id)a3
{
  objc_storeStrong((id *)&self->_inputWhiteSrcGreen, a3);
}

- (NSNumber)inputWhiteDstGreen
{
  return self->_inputWhiteDstGreen;
}

- (void)setInputWhiteDstGreen:(id)a3
{
  objc_storeStrong((id *)&self->_inputWhiteDstGreen, a3);
}

- (NSNumber)inputBlackSrcBlue
{
  return self->_inputBlackSrcBlue;
}

- (void)setInputBlackSrcBlue:(id)a3
{
  objc_storeStrong((id *)&self->_inputBlackSrcBlue, a3);
}

- (NSNumber)inputBlackDstBlue
{
  return self->_inputBlackDstBlue;
}

- (void)setInputBlackDstBlue:(id)a3
{
  objc_storeStrong((id *)&self->_inputBlackDstBlue, a3);
}

- (NSNumber)inputShadowSrcBlue
{
  return self->_inputShadowSrcBlue;
}

- (void)setInputShadowSrcBlue:(id)a3
{
  objc_storeStrong((id *)&self->_inputShadowSrcBlue, a3);
}

- (NSNumber)inputShadowDstBlue
{
  return self->_inputShadowDstBlue;
}

- (void)setInputShadowDstBlue:(id)a3
{
  objc_storeStrong((id *)&self->_inputShadowDstBlue, a3);
}

- (NSNumber)inputMidSrcBlue
{
  return self->_inputMidSrcBlue;
}

- (void)setInputMidSrcBlue:(id)a3
{
  objc_storeStrong((id *)&self->_inputMidSrcBlue, a3);
}

- (NSNumber)inputMidDstBlue
{
  return self->_inputMidDstBlue;
}

- (void)setInputMidDstBlue:(id)a3
{
  objc_storeStrong((id *)&self->_inputMidDstBlue, a3);
}

- (NSNumber)inputHilightSrcBlue
{
  return self->_inputHilightSrcBlue;
}

- (void)setInputHilightSrcBlue:(id)a3
{
  objc_storeStrong((id *)&self->_inputHilightSrcBlue, a3);
}

- (NSNumber)inputHilightDstBlue
{
  return self->_inputHilightDstBlue;
}

- (void)setInputHilightDstBlue:(id)a3
{
  objc_storeStrong((id *)&self->_inputHilightDstBlue, a3);
}

- (NSNumber)inputWhiteSrcBlue
{
  return self->_inputWhiteSrcBlue;
}

- (void)setInputWhiteSrcBlue:(id)a3
{
  objc_storeStrong((id *)&self->_inputWhiteSrcBlue, a3);
}

- (NSNumber)inputWhiteDstBlue
{
  return self->_inputWhiteDstBlue;
}

- (void)setInputWhiteDstBlue:(id)a3
{
  objc_storeStrong((id *)&self->_inputWhiteDstBlue, a3);
}

- (NSString)inputColorSpace
{
  return self->_inputColorSpace;
}

- (void)setInputColorSpace:(id)a3
{
  objc_storeStrong((id *)&self->_inputColorSpace, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputColorSpace, 0);
  objc_storeStrong((id *)&self->_inputWhiteDstBlue, 0);
  objc_storeStrong((id *)&self->_inputWhiteSrcBlue, 0);
  objc_storeStrong((id *)&self->_inputHilightDstBlue, 0);
  objc_storeStrong((id *)&self->_inputHilightSrcBlue, 0);
  objc_storeStrong((id *)&self->_inputMidDstBlue, 0);
  objc_storeStrong((id *)&self->_inputMidSrcBlue, 0);
  objc_storeStrong((id *)&self->_inputShadowDstBlue, 0);
  objc_storeStrong((id *)&self->_inputShadowSrcBlue, 0);
  objc_storeStrong((id *)&self->_inputBlackDstBlue, 0);
  objc_storeStrong((id *)&self->_inputBlackSrcBlue, 0);
  objc_storeStrong((id *)&self->_inputWhiteDstGreen, 0);
  objc_storeStrong((id *)&self->_inputWhiteSrcGreen, 0);
  objc_storeStrong((id *)&self->_inputHilightDstGreen, 0);
  objc_storeStrong((id *)&self->_inputHilightSrcGreen, 0);
  objc_storeStrong((id *)&self->_inputMidDstGreen, 0);
  objc_storeStrong((id *)&self->_inputMidSrcGreen, 0);
  objc_storeStrong((id *)&self->_inputShadowDstGreen, 0);
  objc_storeStrong((id *)&self->_inputShadowSrcGreen, 0);
  objc_storeStrong((id *)&self->_inputBlackDstGreen, 0);
  objc_storeStrong((id *)&self->_inputBlackSrcGreen, 0);
  objc_storeStrong((id *)&self->_inputWhiteDstRed, 0);
  objc_storeStrong((id *)&self->_inputWhiteSrcRed, 0);
  objc_storeStrong((id *)&self->_inputHilightDstRed, 0);
  objc_storeStrong((id *)&self->_inputHilightSrcRed, 0);
  objc_storeStrong((id *)&self->_inputMidDstRed, 0);
  objc_storeStrong((id *)&self->_inputMidSrcRed, 0);
  objc_storeStrong((id *)&self->_inputShadowDstRed, 0);
  objc_storeStrong((id *)&self->_inputShadowSrcRed, 0);
  objc_storeStrong((id *)&self->_inputBlackDstRed, 0);
  objc_storeStrong((id *)&self->_inputBlackSrcRed, 0);
  objc_storeStrong((id *)&self->_inputWhiteDstRGB, 0);
  objc_storeStrong((id *)&self->_inputWhiteSrcRGB, 0);
  objc_storeStrong((id *)&self->_inputHilightDstRGB, 0);
  objc_storeStrong((id *)&self->_inputHilightSrcRGB, 0);
  objc_storeStrong((id *)&self->_inputMidDstRGB, 0);
  objc_storeStrong((id *)&self->_inputMidSrcRGB, 0);
  objc_storeStrong((id *)&self->_inputShadowDstRGB, 0);
  objc_storeStrong((id *)&self->_inputShadowSrcRGB, 0);
  objc_storeStrong((id *)&self->_inputBlackDstRGB, 0);
  objc_storeStrong((id *)&self->_inputBlackSrcRGB, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

double __32__PILevelsFilterHDR_outputImage__block_invoke(uint64_t a1, int a2)
{
  double result;

  if (a2 == 1)
    return 0.0;
  return result;
}

void __32__PILevelsFilterHDR_P3KernelHDR__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DDD0], "kernelWithString:", CFSTR("kernel vec4 levelsHDR (sampler src, sampler LUT) { vec4 p,r; vec2 c1,c2; float f; p = sample(src, samplerCoord(src)); vec3 neg = min(p.rgb, 0.0); vec3 pos = max(p.rgb, 1.0)-1.0; p.rgb = clamp(p.rgb, 0.0, 1.0); f = p.r * 1024; c1 = vec2(floor(f)+0.5, 0.5); c2 = vec2(ceil(f)+0.5, 0.5); r = mix(sample(LUT,samplerTransform(LUT,c1)), sample(LUT,samplerTransform(LUT,c2)), fract(f)); p.r = r.r; f = p.g * 1024; c1 = vec2(floor(f)+0.5, 0.5); c2 = vec2(ceil(f)+0.5, 0.5); r = mix(sample(LUT,samplerTransform(LUT,c1)), sample(LUT,samplerTransform(LUT,c2)), fract(f)); p.g = r.g; f = p.b * 1024; c1 = vec2(floor(f)+0.5, 0.5); c2 = vec2(ceil(f)+0.5, 0.5); r = mix(sample(LUT,samplerTransform(LUT,c1)), sample(LUT,samplerTransform(LUT,c2)), fract(f)); p.b = r.b; p.rgb = max(p.rgb, 0.0); p.rgb = p.rgb + pos + neg; return p; }"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)P3KernelHDR_singleton;
  P3KernelHDR_singleton = v0;

}

@end
