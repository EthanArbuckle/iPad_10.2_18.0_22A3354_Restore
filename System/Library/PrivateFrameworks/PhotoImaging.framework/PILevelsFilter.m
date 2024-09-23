@implementation PILevelsFilter

+ (id)P3Kernel
{
  if (P3Kernel_onceToken != -1)
    dispatch_once(&P3Kernel_onceToken, &__block_literal_global_17434);
  return (id)P3Kernel_P3Kernel;
}

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
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0C9DE50], &unk_1E5052038, *MEMORY[0x1E0C9DE48], &unk_1E5052028, *MEMORY[0x1E0C9DE60], &unk_1E5052038, *MEMORY[0x1E0C9DE58], v3, *MEMORY[0x1E0C9DE10], v3, *MEMORY[0x1E0C9DE40], *MEMORY[0x1E0C9DED0], *MEMORY[0x1E0C9DE68], 0);
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

void __26__PILevelsFilter_P3Kernel__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DDD0], "kernelWithString:", CFSTR("kernel vec4 levelsNewGammaForP3 (sampler src, sampler LUT)\n{\nvec4\tp,r;\nvec2\tc1,c2;\nfloat\tf;\np  = sample(src, samplerCoord(src));\nvec3 neg = min(p.rgb, 0.0);\nvec3 pos = max(p.rgb, 1.0)-1.0;\np.rgb = clamp(p.rgb, 0.0, 1.0);\nf = p.r * 255.0 + 256.0;\nc1 = vec2(floor(f)+0.5, 0.5);\nc2 = vec2(ceil(f)+0.5, 0.5);\nr = mix(sample(LUT,samplerTransform(LUT,c1)), sample(LUT,samplerTransform(LUT,c2)), fract(f));\np.r = r.r * 4.0 - 1.0;\nf = p.g * 255.0 + 256.0;\nc1 = vec2(floor(f)+0.5, 0.5);\nc2 = vec2(ceil(f)+0.5, 0.5);\nr = mix(sample(LUT,samplerTransform(LUT,c1)), sample(LUT,samplerTransform(LUT,c2)), fract(f));\np.g = r.g * 4.0 - 1.0;\nf = p.b * 255.0 + 256.0;\nc1 = vec2(floor(f)+0.5, 0.5);\nc2 = vec2(ceil(f)+0.5, 0.5);\nr = mix(sample(LUT,samplerTransform(LUT,c1)), sample(LUT,samplerTransform(LUT,c2)), fract(f));\np.b = r.b * 4.0 - 1.0;\np.rgb = max(p.rgb, 0.0);\np.rgb = p.rgb + pos + neg;\nreturn p;\n}\n\n"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)P3Kernel_P3Kernel;
  P3Kernel_P3Kernel = v0;

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
  v27 = xmmword_1E5018CD0;
  v28 = *(_OWORD *)&off_1E5018CE0;
  do
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    v5 = *(id *)((char *)&v27 + v3);
    objc_msgSend(v4, "numberWithDouble:", 0.0, v27, v28);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("inputBlackSrc"), "stringByAppendingString:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PILevelsFilter setValue:forKey:](self, "setValue:forKey:", v6, v7);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("inputBlackDst"), "stringByAppendingString:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PILevelsFilter setValue:forKey:](self, "setValue:forKey:", v8, v9);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.25);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("inputShadowSrc"), "stringByAppendingString:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PILevelsFilter setValue:forKey:](self, "setValue:forKey:", v10, v11);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.25);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("inputShadowDst"), "stringByAppendingString:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PILevelsFilter setValue:forKey:](self, "setValue:forKey:", v12, v13);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("inputMidSrc"), "stringByAppendingString:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PILevelsFilter setValue:forKey:](self, "setValue:forKey:", v14, v15);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("inputMidDst"), "stringByAppendingString:", v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PILevelsFilter setValue:forKey:](self, "setValue:forKey:", v16, v17);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.75);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("inputHilightSrc"), "stringByAppendingString:", v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PILevelsFilter setValue:forKey:](self, "setValue:forKey:", v18, v19);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.75);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("inputHilightDst"), "stringByAppendingString:", v5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PILevelsFilter setValue:forKey:](self, "setValue:forKey:", v20, v21);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("inputWhiteSrc"), "stringByAppendingString:", v5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PILevelsFilter setValue:forKey:](self, "setValue:forKey:", v22, v23);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("inputWhiteDst"), "stringByAppendingString:", v5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    -[PILevelsFilter setValue:forKey:](self, "setValue:forKey:", v24, v25);
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

  -[PILevelsFilter valueForKey:](self, "valueForKey:", a3);
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
  void *v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  double v61;
  double v62;
  uint64_t v63;
  double v64;
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
  int64x2_t v78;
  float64x2_t v79;
  float64x2_t v80;
  float64x2_t v81;
  float64x2_t v89;
  float64x2_t v90;
  float64x2_t v91;
  float64x2_t v92;
  float64x2_t v93;
  float64x2_t v94;
  float64x2_t v95;
  float64x2_t v96;
  float64x2_t v97;
  float64x2_t v98;
  float64x2_t v99;
  float64x2_t v100;
  float64x2_t v101;
  float64x2_t v102;
  float64x2_t v103;
  float64x2_t v104;
  float64x2_t v106;
  float64x2_t v108;
  float64x2_t v109;
  char *v110;
  uint64_t i;
  vImage_Error v112;
  void *v113;
  void *v114;
  uint64_t j;
  vImage_Error v117;
  NSObject *v118;
  void *v119;
  const void **v120;
  void *specific;
  NSObject *v122;
  _BOOL4 v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  id v128;
  void *v129;
  void *v130;
  PILevelsFilter *v131;
  SEL v132;
  char *v133;
  float64x2_t v134;
  int8x16_t v135;
  int8x16_t v136;
  float64x2_t v137;
  float64x2_t v138;
  int8x16_t v139;
  int8x16_t v140;
  float64x2_t v141;
  float64x2_t v142;
  int8x16_t v143;
  int8x16_t v144;
  float64x2_t v145;
  float64x2_t v146;
  float64x2_t v147;
  float64x2_t v148;
  int8x16_t v149;
  int8x16_t v150;
  float64x2_t v151;
  float64x2_t v152;
  int8x16_t v153;
  int8x16_t v154;
  float64x2_t v155;
  float64x2_t v156;
  int8x16_t v157;
  int8x16_t v158;
  float64x2_t v159;
  float64x2_t v160;
  float64x2_t v161;
  float64x2_t v162;
  double v163;
  long double v164;
  uint64_t __x;
  uint64_t __xa;
  float64x2_t __xb;
  float64x2_t __xc;
  uint64_t v169;
  uint64_t v170;
  long double v171;
  float64x2_t v172;
  uint64_t v173;
  uint64_t v174;
  int64x2_t v175;
  vImage_Buffer dest;
  char v177;
  uint8_t buf[4];
  void *v179;
  __int16 v180;
  void *v181;
  __int128 v182;
  const __CFString *v183;
  uint64_t v184;

  v184 = *MEMORY[0x1E0C80C00];
  v182 = xmmword_1E5018CF0;
  v183 = CFSTR("Blue");
  v3 = (char *)malloc_type_malloc(0x2000uLL, 0x6B09AF81uLL);
  v177 = 1;
  -[PILevelsFilter floatValueForKey:defaultValue:clearIfNotDefault:](self, "floatValueForKey:defaultValue:clearIfNotDefault:", CFSTR("inputBlackSrcRGB"), &v177, 0.0);
  v5 = v4;
  -[PILevelsFilter floatValueForKey:defaultValue:clearIfNotDefault:](self, "floatValueForKey:defaultValue:clearIfNotDefault:", CFSTR("inputShadowSrcRGB"), &v177, 0.25);
  v169 = v6;
  -[PILevelsFilter floatValueForKey:defaultValue:clearIfNotDefault:](self, "floatValueForKey:defaultValue:clearIfNotDefault:", CFSTR("inputMidSrcRGB"), &v177, 0.5);
  v173 = v7;
  -[PILevelsFilter floatValueForKey:defaultValue:clearIfNotDefault:](self, "floatValueForKey:defaultValue:clearIfNotDefault:", CFSTR("inputHilightSrcRGB"), &v177, 0.75);
  __x = v8;
  -[PILevelsFilter floatValueForKey:defaultValue:clearIfNotDefault:](self, "floatValueForKey:defaultValue:clearIfNotDefault:", CFSTR("inputWhiteSrcRGB"), &v177, 1.0);
  v10 = v9;
  -[PILevelsFilter floatValueForKey:defaultValue:clearIfNotDefault:](self, "floatValueForKey:defaultValue:clearIfNotDefault:", CFSTR("inputBlackDstRGB"), &v177, 0.0);
  v12 = v11;
  -[PILevelsFilter floatValueForKey:defaultValue:clearIfNotDefault:](self, "floatValueForKey:defaultValue:clearIfNotDefault:", CFSTR("inputShadowDstRGB"), &v177, 0.25);
  v14 = v13;
  -[PILevelsFilter floatValueForKey:defaultValue:clearIfNotDefault:](self, "floatValueForKey:defaultValue:clearIfNotDefault:", CFSTR("inputMidDstRGB"), &v177, 0.5);
  v16 = v15;
  -[PILevelsFilter floatValueForKey:defaultValue:clearIfNotDefault:](self, "floatValueForKey:defaultValue:clearIfNotDefault:", CFSTR("inputHilightDstRGB"), &v177, 0.75);
  v18 = v17;
  -[PILevelsFilter floatValueForKey:defaultValue:clearIfNotDefault:](self, "floatValueForKey:defaultValue:clearIfNotDefault:", CFSTR("inputWhiteDstRGB"), &v177, 1.0);
  if (v5 == 0.0 && *(double *)&v173 == 0.0 && v10 == 0.0)
  {
    if (!v3)
      goto LABEL_37;
    v20 = v3;
    goto LABEL_32;
  }
  v21 = 0;
  v22 = (v19 - v12) / (v10 - v5);
  v23 = v12 - v5 * v22;
  v24 = v16 - (v23 + *(double *)&v173 * v22);
  v25 = *(double *)&v169 - *(double *)&v173;
  if (*(double *)&v169 - *(double *)&v173 >= 0.0)
    v26 = 1.0 / (*(double *)&v173 - v10);
  else
    v26 = 1.0 / (*(double *)&v173 - v5);
  v27 = v25 * v26;
  v28 = v27 + 1.0;
  v29 = -((v27 * 2.0 + 3.0) * v27) * v27 + 1.0;
  if (v28 < 0.0)
    v29 = 0.0;
  v30 = v14 - (v23 + *(double *)&v169 * v22 + v29 * v24);
  v31 = *(double *)&__x - *(double *)&v173;
  if (*(double *)&__x - *(double *)&v173 >= 0.0)
    v32 = 1.0 / (*(double *)&v173 - v10);
  else
    v32 = 1.0 / (*(double *)&v173 - v5);
  v33 = v31 * v32;
  v34 = v33 + 1.0;
  v35 = -((v33 * 2.0 + 3.0) * v33) * v33 + 1.0;
  if (v34 < 0.0)
    v35 = 0.0;
  v147 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v22, 0);
  v146 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v23, 0);
  v144 = (int8x16_t)vdupq_lane_s64(COERCE__INT64(1.0 / (*(double *)&v173 - v5)), 0);
  v145 = (float64x2_t)vdupq_lane_s64(v173, 0);
  v142 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v24, 0);
  v143 = (int8x16_t)vdupq_lane_s64(COERCE__INT64(1.0 / (*(double *)&v173 - v10)), 0);
  v140 = (int8x16_t)vdupq_lane_s64(COERCE__INT64(*(double *)&v169 - v5), 0);
  v141 = (float64x2_t)vdupq_lane_s64(v169, 0);
  v138 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v30, 0);
  v139 = (int8x16_t)vdupq_lane_s64(*(uint64_t *)&v25, 0);
  v136 = (int8x16_t)vdupq_lane_s64(*(uint64_t *)&v31, 0);
  v137 = (float64x2_t)vdupq_lane_s64(__x, 0);
  v134 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v18 - (v23 + *(double *)&__x * v22 + v35 * v24)), 0);
  v135 = (int8x16_t)vdupq_lane_s64(COERCE__INT64(*(double *)&__x - v10), 0);
  v133 = v3;
  do
  {
    v36 = *((id *)&v182 + v21);
    objc_msgSend(CFSTR("inputBlackSrc"), "stringByAppendingString:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[PILevelsFilter floatValueForKey:defaultValue:clearIfNotDefault:](self, "floatValueForKey:defaultValue:clearIfNotDefault:", v37, &v177, 0.0);
    v39 = v38;

    objc_msgSend(CFSTR("inputShadowSrc"), "stringByAppendingString:", v36);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PILevelsFilter floatValueForKey:defaultValue:clearIfNotDefault:](self, "floatValueForKey:defaultValue:clearIfNotDefault:", v40, &v177, 0.25);
    v174 = v41;

    objc_msgSend(CFSTR("inputMidSrc"), "stringByAppendingString:", v36);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[PILevelsFilter floatValueForKey:defaultValue:clearIfNotDefault:](self, "floatValueForKey:defaultValue:clearIfNotDefault:", v42, &v177, 0.5);
    v170 = v43;

    objc_msgSend(CFSTR("inputHilightSrc"), "stringByAppendingString:", v36);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[PILevelsFilter floatValueForKey:defaultValue:clearIfNotDefault:](self, "floatValueForKey:defaultValue:clearIfNotDefault:", v44, &v177, 0.75);
    __xa = v45;

    objc_msgSend(CFSTR("inputWhiteSrc"), "stringByAppendingString:", v36);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[PILevelsFilter floatValueForKey:defaultValue:clearIfNotDefault:](self, "floatValueForKey:defaultValue:clearIfNotDefault:", v46, &v177, 1.0);
    v48 = v47;

    objc_msgSend(CFSTR("inputBlackDst"), "stringByAppendingString:", v36);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[PILevelsFilter floatValueForKey:defaultValue:clearIfNotDefault:](self, "floatValueForKey:defaultValue:clearIfNotDefault:", v49, &v177, 0.0);
    v51 = v50;

    objc_msgSend(CFSTR("inputShadowDst"), "stringByAppendingString:", v36);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[PILevelsFilter floatValueForKey:defaultValue:clearIfNotDefault:](self, "floatValueForKey:defaultValue:clearIfNotDefault:", v52, &v177, 0.25);
    v163 = v53;

    objc_msgSend(CFSTR("inputMidDst"), "stringByAppendingString:", v36);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[PILevelsFilter floatValueForKey:defaultValue:clearIfNotDefault:](self, "floatValueForKey:defaultValue:clearIfNotDefault:", v54, &v177, 0.5);
    v56 = v55;

    objc_msgSend(CFSTR("inputHilightDst"), "stringByAppendingString:", v36);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[PILevelsFilter floatValueForKey:defaultValue:clearIfNotDefault:](self, "floatValueForKey:defaultValue:clearIfNotDefault:", v57, &v177, 0.75);
    v59 = v58;

    objc_msgSend(CFSTR("inputWhiteDst"), "stringByAppendingString:", v36);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[PILevelsFilter floatValueForKey:defaultValue:clearIfNotDefault:](self, "floatValueForKey:defaultValue:clearIfNotDefault:", v60, &v177, 1.0);
    v62 = v61;

    v63 = 0;
    v64 = *(double *)&__xa - *(double *)&v170;
    if (*(double *)&__xa - *(double *)&v170 >= 0.0)
      v65 = 1.0 / (*(double *)&v170 - v48);
    else
      v65 = 1.0 / (*(double *)&v170 - v39);
    v66 = v64 * v65;
    v67 = v66 + 1.0;
    v68 = -((v66 * 2.0 + 3.0) * v66) * v66 + 1.0;
    if (v67 < 0.0)
      v68 = 0.0;
    v69 = (v62 - v51) / (v48 - v39);
    v70 = v51 - v39 * v69;
    v71 = v56 - (v70 + *(double *)&v170 * v69);
    v72 = v59 - (v70 + *(double *)&__xa * v69 + v68 * v71);
    v73 = *(double *)&v174 - *(double *)&v170;
    if (*(double *)&v174 - *(double *)&v170 >= 0.0)
      v74 = 1.0 / (*(double *)&v170 - v48);
    else
      v74 = 1.0 / (*(double *)&v170 - v39);
    v75 = v73 * v74;
    v76 = v75 + 1.0;
    v77 = -((v75 * 2.0 + 3.0) * v75) * v75 + 1.0;
    if (v76 < 0.0)
      v77 = 0.0;
    v161 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v69, 0);
    v160 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v70, 0);
    v158 = (int8x16_t)vdupq_lane_s64(COERCE__INT64(1.0 / (*(double *)&v170 - v39)), 0);
    v159 = (float64x2_t)vdupq_lane_s64(v170, 0);
    v156 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v71, 0);
    v157 = (int8x16_t)vdupq_lane_s64(COERCE__INT64(1.0 / (*(double *)&v170 - v48)), 0);
    v154 = (int8x16_t)vdupq_lane_s64(COERCE__INT64(*(double *)&v174 - v39), 0);
    v155 = (float64x2_t)vdupq_lane_s64(v174, 0);
    v152 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v163 - (v70 + *(double *)&v174 * v69 + v77 * v71)), 0);
    v153 = (int8x16_t)vdupq_lane_s64(*(uint64_t *)&v73, 0);
    v150 = (int8x16_t)vdupq_lane_s64(*(uint64_t *)&v64, 0);
    v151 = (float64x2_t)vdupq_lane_s64(__xa, 0);
    v148 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v72, 0);
    v149 = (int8x16_t)vdupq_lane_s64(COERCE__INT64(*(double *)&__xa - v48), 0);
    v78 = (int64x2_t)xmmword_1A64DDD90;
    do
    {
      v175 = v78;
      __xb = vdivq_f64(vaddq_f64(vcvtq_f64_s64(v78), (float64x2_t)vdupq_n_s64(0xC070000000000000)), (float64x2_t)vdupq_n_s64(0x406FE00000000000uLL));
      v171 = pow(__xb.f64[1], 0.454545438);
      v79.f64[0] = pow(__xb.f64[0], 0.454545438);
      v79.f64[1] = v171;
      v80 = vsubq_f64(v79, v145);
      v81 = vmulq_f64(v80, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v80), v144, v143));
      __asm
      {
        FMOV            V7.2D, #1.0
        FMOV            V2.2D, #2.0
        FMOV            V5.2D, #3.0
      }
      v89 = vmlaq_f64(vmlaq_f64(v146, v147, v79), v142, (float64x2_t)vbicq_s8((int8x16_t)vmlaq_f64(_Q7, v81, vmulq_f64(v81, vnegq_f64(vmlaq_f64(_Q5, _Q2, v81)))), (int8x16_t)vcltzq_f64(vaddq_f64(v81, _Q7))));
      v90 = vsubq_f64(v79, v141);
      v91 = _Q7;
      __xc = _Q7;
      v92 = vmulq_f64(v90, vdivq_f64(_Q7, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v90), v140, v139)));
      v93 = vsubq_f64(v79, v137);
      v94 = vmulq_f64(v93, vdivq_f64(_Q7, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v93), v136, v135)));
      v95 = vmlaq_f64(vmlaq_f64(v89, v138, (float64x2_t)vbicq_s8((int8x16_t)vmlaq_f64(_Q7, v92, vmulq_f64(v92, vnegq_f64(vmlaq_f64(_Q5, _Q2, v92)))), (int8x16_t)vcltzq_f64(vaddq_f64(v92, _Q7)))), v134, (float64x2_t)vbicq_s8((int8x16_t)vmlaq_f64(_Q7, v94, vmulq_f64(v94, vnegq_f64(vmlaq_f64(_Q5, _Q2, v94)))), (int8x16_t)vcltzq_f64(vaddq_f64(v94, _Q7))));
      v96 = vsubq_f64(v95, v159);
      v97 = vmulq_f64(v96, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v96), v158, v157));
      v98 = vmlaq_f64(vmlaq_f64(v160, v161, v95), v156, (float64x2_t)vbicq_s8((int8x16_t)vmlaq_f64(v91, v97, vmulq_f64(v97, vnegq_f64(vmlaq_f64(_Q5, _Q2, v97)))), (int8x16_t)vcltzq_f64(vaddq_f64(v97, v91))));
      v99 = vsubq_f64(v95, v155);
      v100 = vmulq_f64(v99, vdivq_f64(v91, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v99), v154, v153)));
      v172 = _Q5;
      v101 = vmlaq_f64(v98, v152, (float64x2_t)vbicq_s8((int8x16_t)vmlaq_f64(v91, v100, vmulq_f64(v100, vnegq_f64(vmlaq_f64(_Q5, _Q2, v100)))), (int8x16_t)vcltzq_f64(vaddq_f64(v100, v91))));
      v102 = vsubq_f64(v95, v151);
      v103 = vmulq_f64(v102, vdivq_f64(v91, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v102), v150, v149)));
      v162 = vmlaq_f64(v101, v148, (float64x2_t)vbicq_s8((int8x16_t)vmlaq_f64(v91, v103, vmulq_f64(v103, vnegq_f64(vmlaq_f64(_Q5, _Q2, v103)))), (int8x16_t)vcltzq_f64(vaddq_f64(v103, v91))));
      v164 = pow(v162.f64[1], 2.20000005);
      v104.f64[0] = pow(v162.f64[0], 2.20000005);
      v104.f64[1] = v164;
      __asm { FMOV            V1.2D, #-1.0 }
      v106 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(_Q1, v104), (int8x16_t)_Q1, (int8x16_t)v104);
      __asm { FMOV            V2.2D, #0.25 }
      v108 = vmulq_f64(vaddq_f64(v106, __xc), _Q2);
      v109 = (float64x2_t)vdupq_n_s64(0x40EFFFE000000000uLL);
      *(int32x2_t *)&v106.f64[0] = vmovn_s64(vcvtq_s64_f64((float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v106, v172), (int8x16_t)v109, (int8x16_t)vmulq_f64(v108, v109))));
      v110 = &v3[v63];
      *(_WORD *)v110 = LOWORD(v106.f64[0]);
      *((_WORD *)v110 + 4) = WORD2(v106.f64[0]);
      v78 = vaddq_s64(v175, vdupq_n_s64(2uLL));
      v63 += 16;
    }
    while (v63 != 0x2000);

    ++v21;
    v3 += 2;
  }
  while (v21 != 3);
  if (v177)
  {
    v20 = v133;
LABEL_32:
    free(v20);
    v3 = 0;
    goto LABEL_37;
  }
  for (i = 6; i != 8198; i += 8)
    *(_WORD *)&v133[i] = 0x7FFF;
  dest.data = v133;
  *(_OWORD *)&dest.height = xmmword_1A64DDDA0;
  dest.rowBytes = 0x2000;
  v112 = vImageConvert_16Uto16F(&dest, &dest, 0);
  if (!v112)
  {
    v113 = (void *)MEMORY[0x1E0C9DDC8];
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v133, 0x2000, 1);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "imageWithBitmapData:bytesPerRow:size:format:colorSpace:", v114, 0x2000, *MEMORY[0x1E0C9E080], 0, 1024.0, 1.0);
    v3 = (char *)objc_claimAutoreleasedReturnValue();

LABEL_37:
    for (j = 16; j != -8; j -= 8)

    return v3;
  }
  v117 = v112;
  NUAssertLogger_17665();
  v118 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed converting data to RGBAh: %ld"), v117);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v179 = v119;
    _os_log_error_impl(&dword_1A6382000, v118, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

  }
  v120 = (const void **)MEMORY[0x1E0D51D48];
  specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
  NUAssertLogger_17665();
  v122 = objc_claimAutoreleasedReturnValue();
  v123 = os_log_type_enabled(v122, OS_LOG_TYPE_ERROR);
  if (specific)
  {
    if (v123)
    {
      v126 = dispatch_get_specific(*v120);
      v127 = (void *)MEMORY[0x1E0CB3978];
      v128 = v126;
      objc_msgSend(v127, "callStackSymbols");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "componentsJoinedByString:", CFSTR("\n"));
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v179 = v126;
      v180 = 2114;
      v181 = v130;
      _os_log_error_impl(&dword_1A6382000, v122, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
  }
  else if (v123)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "componentsJoinedByString:", CFSTR("\n"));
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v179 = v125;
    _os_log_error_impl(&dword_1A6382000, v122, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

  }
  v131 = (PILevelsFilter *)_NUAssertFailHandler();
  return -[PILevelsFilter outputImage](v131, v132);
}

- (id)outputImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CGColorSpace *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  CIImage *v24;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  -[PILevelsFilter _LUTImage](self, "_LUTImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C9DDF0], "samplerWithImage:keysAndValues:", v3, *MEMORY[0x1E0C9E2D0], *MEMORY[0x1E0C9E2C8], 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "P3Kernel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D928]);
    -[CIImage imageByColorMatchingWorkingSpaceToColorSpace:](self->_inputImage, "imageByColorMatchingWorkingSpaceToColorSpace:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0C9DDF0];
    objc_msgSend(v8, "imageByUnpremultiplyingAlpha");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "samplerWithImage:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "definition");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "extent");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v26[0] = v11;
    v26[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "applyWithExtent:roiCallback:arguments:options:", &__block_literal_global_124_17663, v21, v6, v14, v16, v18, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "imageByColorMatchingColorSpaceToWorkingSpace:", v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    CGColorSpaceRelease(v7);
    objc_msgSend(v23, "imageByPremultiplyingAlpha");
    v24 = (CIImage *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v24 = self->_inputImage;
  }

  return v24;
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

double __29__PILevelsFilter_outputImage__block_invoke(uint64_t a1, int a2)
{
  double result;

  if (a2 == 1)
    return 0.0;
  return result;
}

@end
