@implementation PISemanticStyleFilter

+ (id)_computeAlphaAwareHistogramForImage:(id)a3 context:(id)a4 colorSpace:(CGColorSpace *)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  NSObject *v30;
  void *v31;
  const void **v32;
  void *specific;
  NSObject *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  uint8_t buf[40];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!a6)
  {
    NUAssertLogger_16179();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v31;
      _os_log_error_impl(&dword_1A6382000, v30, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v32 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_16179();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v35)
      {
        v38 = dispatch_get_specific(*v32);
        v39 = (void *)MEMORY[0x1E0CB3978];
        v40 = v38;
        objc_msgSend(v39, "callStackSymbols");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "componentsJoinedByString:", CFSTR("\n"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v38;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v42;
        _os_log_error_impl(&dword_1A6382000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v35)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v37;
      _os_log_error_impl(&dword_1A6382000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v11 = v10;
  v12 = objc_alloc_init(MEMORY[0x1E0D51FE8]);
  LODWORD(v13) = *(_DWORD *)(MEMORY[0x1E0D51D50] + 48);
  LODWORD(v14) = *(_DWORD *)(MEMORY[0x1E0D51D50] + 52);
  LODWORD(v15) = *(_DWORD *)(MEMORY[0x1E0D51D50] + 56);
  LODWORD(v16) = *(_DWORD *)(MEMORY[0x1E0D51D50] + 60);
  objc_msgSend(v12, "setLuminanceWeights:", v13, v14, v15, v16);
  memset(buf, 0, 32);
  objc_msgSend(v9, "extent");
  NUPixelRectFromCGRect();
  objc_msgSend(MEMORY[0x1E0D52220], "BGRA8");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "alignedRowBytesForWidth:", 0);

  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 0);
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v20 = objc_msgSend(v19, "mutableBytes");
  objc_msgSend(v9, "extent");
  objc_msgSend(v11, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v9, v20, v18, *MEMORY[0x1E0C9E000], a5);
  v21 = objc_alloc(MEMORY[0x1E0D52008]);
  objc_msgSend(MEMORY[0x1E0D52220], "BGRA8");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_retainAutorelease(v19);
  v24 = (void *)objc_msgSend(v21, "initWithSize:format:rowBytes:bytes:", (unsigned __int128)0, v22, v18, objc_msgSend(v23, "bytes"));

  v43 = 0;
  objc_msgSend(v12, "computeHistogramFromBuffer:error:", v24, &v43);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
    v26 = (void *)MEMORY[0x1E0D520A0];
    v27 = v43;
    objc_msgSend(v26, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to compute histogram"), v12, v27);
    v28 = (id)objc_claimAutoreleasedReturnValue();

    *a6 = v28;
  }

  return v25;
}

+ (id)_computeSmartToneStatsFromHistogram:(id)a3
{
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  long double v7;
  long double v8;
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
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v38;
  double v39;
  void *v40;
  void *v41;
  _QWORD v42[10];
  _QWORD v43[12];

  v43[10] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "luminance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "binCount") <= 512)
  {
    v4 = objc_msgSend(v3, "binCount");
    if (v4 < 1)
    {
      v8 = 0.0;
      v7 = 0.0;
      goto LABEL_6;
    }
  }
  else
  {
    v4 = 512;
  }
  v5 = 0;
  v6 = v4;
  v7 = 0.0;
  v8 = 0.0;
  do
  {
    v9 = fmin((double)(int)v5 / 255.0, 1.0);
    v10 = (double)*(uint64_t *)(objc_msgSend(v3, "values") + 8 * v5);
    v11 = v10 / (double)objc_msgSend(v3, "sampleCount");
    v7 = v7 + v11 * log(v9 + 0.00392156863);
    v8 = v8 + v11 * log(1.0 - v9 + 0.00392156863);
    ++v5;
  }
  while (v6 != v5);
LABEL_6:
  v12 = exp(v7);
  v13 = exp(v8);
  objc_msgSend(v3, "percentile:", 0.02);
  v15 = v14;
  objc_msgSend(v3, "percentile:", 0.1);
  v17 = v16;
  objc_msgSend(v3, "percentile:", 0.25);
  v19 = v18;
  objc_msgSend(v3, "percentile:", 0.5);
  v21 = v20;
  objc_msgSend(v3, "percentile:", 0.75);
  v38 = v22;
  objc_msgSend(v3, "percentile:", 0.98);
  v39 = v23;
  objc_msgSend(v3, "percentile:", 0.001);
  v25 = v24 * ((sqrt(v24) * -0.65 + 1.0) * 0.85);
  objc_msgSend(v3, "percentile:", 1.0);
  v27 = v26;
  v42[0] = CFSTR("tonalRange");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v41;
  v42[1] = CFSTR("highKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v40;
  v42[2] = CFSTR("p02");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v28;
  v42[3] = CFSTR("p10");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v29;
  v42[4] = CFSTR("p25");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = v30;
  v42[5] = CFSTR("p50");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v21);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v43[5] = v31;
  v42[6] = CFSTR("p75");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v38);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v43[6] = v32;
  v42[7] = CFSTR("p98");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v39);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v43[7] = v33;
  v42[8] = CFSTR("blackPoint");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v43[8] = v34;
  v42[9] = CFSTR("whitePoint");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v43[9] = v35;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 10);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

+ (id)stylePriorDataForCast:(id)a3 tone:(float)a4 color:(float)a5 intensity:(float)a6 priorStrength:(float)a7
{
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _OWORD v21[3];

  v11 = a3;
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v16 = 0;
  }
  else
  {
    *(float *)&v12 = a4;
    *(float *)&v13 = a5;
    *(float *)&v14 = a6;
    *(float *)&v15 = a7;
    objc_msgSend(MEMORY[0x1E0D08AB8], "calculatePriorCCMforCast:tone:color:intensity:priorStrength:", v11, v12, v13, v14, v15);
    v21[0] = v17;
    v21[1] = v18;
    v21[2] = v19;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v21, 48);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

+ (id)CMISmartStyleTuningParameterVariantFromKey:(id)a3
{
  unsigned int v3;
  id *v4;

  v3 = objc_msgSend(a3, "intValue") - 2;
  if (v3 > 6)
    v4 = (id *)MEMORY[0x1E0D08A10];
  else
    v4 = (id *)qword_1E5018AB8[v3];
  return *v4;
}

- (BOOL)isAvailable
{
  return 1;
}

- (id)curveImageWithData:(id)a3
{
  id v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (double)((unint64_t)objc_msgSend(v3, "length") >> 2);
  v11[0] = *MEMORY[0x1E0C9E110];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = *MEMORY[0x1E0C9E120];
  v12[0] = v5;
  v12[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0C9DDC8];
  v8 = objc_msgSend(v3, "length");
  objc_msgSend(v7, "imageWithBitmapData:bytesPerRow:size:format:options:", v3, v8, *MEMORY[0x1E0C9E090], v6, v4, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_lightMapImageWithData:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  unsigned int v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[PISemanticStyleFilter inputLightMapWidth](self, "inputLightMapWidth");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v7 = (void *)v5;
    else
      v7 = &unk_1E5051520;
    v8 = v7;

    -[PISemanticStyleFilter inputLightMapHeight](self, "inputLightMapHeight");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (void *)v9;
    else
      v11 = &unk_1E5051520;
    v12 = v11;

    v13 = objc_msgSend(v8, "intValue");
    v14 = objc_msgSend(v12, "intValue");

    v28[0] = *MEMORY[0x1E0C9E110];
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = *MEMORY[0x1E0C9E120];
    v29[0] = v15;
    v29[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 2 * v13;
    if ((double)v14 * (double)(unint64_t)v17 == (double)(unint64_t)objc_msgSend(v4, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithBitmapData:bytesPerRow:size:format:options:", v4, 2 * v13, *MEMORY[0x1E0C9E098], v16, (double)(int)v13, (double)v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_338);
      v18 = (void *)*MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
      {
        v21 = v18;
        v22 = 134218496;
        v23 = objc_msgSend(v4, "length");
        v24 = 2048;
        v25 = v17;
        v26 = 2048;
        v27 = v14;
        _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Light Map dimension mismatch: %lu, expected %lu * %lu", (uint8_t *)&v22, 0x20u);

      }
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)outputImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _BOOL8 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
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
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  NSObject *v74;
  const void **v75;
  const void **v76;
  void *specific;
  NSObject *v78;
  _BOOL4 v79;
  void *v80;
  NSObject *v81;
  const void **v82;
  void *v83;
  int v84;
  void *v85;
  NSObject *v86;
  const void **v87;
  void *v88;
  int v89;
  void *v90;
  NSObject *v91;
  const void **v92;
  void *v93;
  int v94;
  void *v95;
  NSObject *v96;
  const void **v97;
  void *v98;
  int v99;
  void *v100;
  NSObject *v101;
  const void **v102;
  void *v103;
  int v104;
  void *v105;
  NSObject *v106;
  const void **v107;
  void *v108;
  int v109;
  void *v110;
  NSObject *v111;
  const void **v112;
  void *v113;
  int v114;
  void *v115;
  const void **v116;
  void *v117;
  void *v118;
  id v119;
  void *v120;
  void *v121;
  void *v122;
  id v123;
  void *v124;
  void *v125;
  void *v126;
  id v127;
  void *v128;
  void *v129;
  void *v130;
  id v131;
  void *v132;
  void *v133;
  void *v134;
  id v135;
  void *v136;
  void *v137;
  void *v138;
  id v139;
  void *v140;
  void *v141;
  void *v142;
  id v143;
  void *v144;
  void *v145;
  void *v146;
  id v147;
  void *v148;
  void *v149;
  NSObject *v150;
  const void **v151;
  const void **v152;
  void *v153;
  NSObject *v154;
  _BOOL4 v155;
  void *v156;
  NSObject *v157;
  const void **v158;
  void *v159;
  int v160;
  void *v161;
  const void **v162;
  void *v163;
  void *v164;
  id v165;
  void *v166;
  void *v167;
  void *v168;
  id v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  uint64_t v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  uint8_t v185[128];
  uint8_t buf[4];
  const void **v187;
  __int16 v188;
  void *v189;
  uint64_t v190;

  v190 = *MEMORY[0x1E0C80C00];
  -[PISemanticStyleFilter inputImage](self, "inputImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    NUAssertLogger_16179();
    v74 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "self.inputImage != nil");
      v75 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v187 = v75;
      _os_log_error_impl(&dword_1A6382000, v74, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v76 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_16179();
    v78 = objc_claimAutoreleasedReturnValue();
    v79 = os_log_type_enabled(v78, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v79)
      {
        v117 = dispatch_get_specific(*v76);
        v118 = (void *)MEMORY[0x1E0CB3978];
        v119 = v117;
        objc_msgSend(v118, "callStackSymbols");
        v76 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "componentsJoinedByString:", CFSTR("\n"));
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v187 = (const void **)v117;
        v188 = 2114;
        v189 = v120;
        _os_log_error_impl(&dword_1A6382000, v78, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v79)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "componentsJoinedByString:", CFSTR("\n"));
      v76 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v187 = v76;
      _os_log_error_impl(&dword_1A6382000, v78, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v84 = _NUAssertFailHandler();
    goto LABEL_83;
  }
  -[PISemanticStyleFilter inputSubjectMatteImage](self, "inputSubjectMatteImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    NUAssertLogger_16179();
    v81 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "self.inputSubjectMatteImage != nil");
      v82 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v187 = v82;
      _os_log_error_impl(&dword_1A6382000, v81, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v76 = (const void **)MEMORY[0x1E0D51D48];
    v83 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_16179();
    v78 = objc_claimAutoreleasedReturnValue();
    v84 = os_log_type_enabled(v78, OS_LOG_TYPE_ERROR);
    if (!v83)
    {
      if (v84)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "componentsJoinedByString:", CFSTR("\n"));
        v76 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v187 = v76;
        _os_log_error_impl(&dword_1A6382000, v78, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_85:

      v89 = _NUAssertFailHandler();
      goto LABEL_86;
    }
LABEL_83:
    if (v84)
    {
      v121 = dispatch_get_specific(*v76);
      v122 = (void *)MEMORY[0x1E0CB3978];
      v123 = v121;
      objc_msgSend(v122, "callStackSymbols");
      v76 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "componentsJoinedByString:", CFSTR("\n"));
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v187 = (const void **)v121;
      v188 = 2114;
      v189 = v124;
      _os_log_error_impl(&dword_1A6382000, v78, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_85;
  }
  -[PISemanticStyleFilter inputSkinMatteImage](self, "inputSkinMatteImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    NUAssertLogger_16179();
    v86 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "self.inputSkinMatteImage != nil");
      v87 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v187 = v87;
      _os_log_error_impl(&dword_1A6382000, v86, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v76 = (const void **)MEMORY[0x1E0D51D48];
    v88 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_16179();
    v78 = objc_claimAutoreleasedReturnValue();
    v89 = os_log_type_enabled(v78, OS_LOG_TYPE_ERROR);
    if (!v88)
    {
      if (v89)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "componentsJoinedByString:", CFSTR("\n"));
        v76 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v187 = v76;
        _os_log_error_impl(&dword_1A6382000, v78, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_88:

      v94 = _NUAssertFailHandler();
      goto LABEL_89;
    }
LABEL_86:
    if (v89)
    {
      v125 = dispatch_get_specific(*v76);
      v126 = (void *)MEMORY[0x1E0CB3978];
      v127 = v125;
      objc_msgSend(v126, "callStackSymbols");
      v76 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "componentsJoinedByString:", CFSTR("\n"));
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v187 = (const void **)v125;
      v188 = 2114;
      v189 = v128;
      _os_log_error_impl(&dword_1A6382000, v78, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_88;
  }
  -[PISemanticStyleFilter inputSkyMatteImage](self, "inputSkyMatteImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    NUAssertLogger_16179();
    v91 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "self.inputSkyMatteImage != nil");
      v92 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v187 = v92;
      _os_log_error_impl(&dword_1A6382000, v91, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v76 = (const void **)MEMORY[0x1E0D51D48];
    v93 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_16179();
    v78 = objc_claimAutoreleasedReturnValue();
    v94 = os_log_type_enabled(v78, OS_LOG_TYPE_ERROR);
    if (!v93)
    {
      if (v94)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "componentsJoinedByString:", CFSTR("\n"));
        v76 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v187 = v76;
        _os_log_error_impl(&dword_1A6382000, v78, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_91:

      v99 = _NUAssertFailHandler();
      goto LABEL_92;
    }
LABEL_89:
    if (v94)
    {
      v129 = dispatch_get_specific(*v76);
      v130 = (void *)MEMORY[0x1E0CB3978];
      v131 = v129;
      objc_msgSend(v130, "callStackSymbols");
      v76 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "componentsJoinedByString:", CFSTR("\n"));
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v187 = (const void **)v129;
      v188 = 2114;
      v189 = v132;
      _os_log_error_impl(&dword_1A6382000, v78, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_91;
  }
  -[PISemanticStyleFilter inputLinearThumbnailImage](self, "inputLinearThumbnailImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    NUAssertLogger_16179();
    v96 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "self.inputLinearThumbnailImage != nil");
      v97 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v187 = v97;
      _os_log_error_impl(&dword_1A6382000, v96, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v76 = (const void **)MEMORY[0x1E0D51D48];
    v98 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_16179();
    v78 = objc_claimAutoreleasedReturnValue();
    v99 = os_log_type_enabled(v78, OS_LOG_TYPE_ERROR);
    if (!v98)
    {
      if (v99)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "componentsJoinedByString:", CFSTR("\n"));
        v76 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v187 = v76;
        _os_log_error_impl(&dword_1A6382000, v78, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_94:

      v104 = _NUAssertFailHandler();
      goto LABEL_95;
    }
LABEL_92:
    if (v99)
    {
      v133 = dispatch_get_specific(*v76);
      v134 = (void *)MEMORY[0x1E0CB3978];
      v135 = v133;
      objc_msgSend(v134, "callStackSymbols");
      v76 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "componentsJoinedByString:", CFSTR("\n"));
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v187 = (const void **)v133;
      v188 = 2114;
      v189 = v136;
      _os_log_error_impl(&dword_1A6382000, v78, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_94;
  }
  -[PISemanticStyleFilter inputGainMapImage](self, "inputGainMapImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    NUAssertLogger_16179();
    v101 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "self.inputGainMapImage != nil");
      v102 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v187 = v102;
      _os_log_error_impl(&dword_1A6382000, v101, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v76 = (const void **)MEMORY[0x1E0D51D48];
    v103 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_16179();
    v78 = objc_claimAutoreleasedReturnValue();
    v104 = os_log_type_enabled(v78, OS_LOG_TYPE_ERROR);
    if (!v103)
    {
      if (v104)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "componentsJoinedByString:", CFSTR("\n"));
        v76 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v187 = v76;
        _os_log_error_impl(&dword_1A6382000, v78, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_97:

      v109 = _NUAssertFailHandler();
      goto LABEL_98;
    }
LABEL_95:
    if (v104)
    {
      v137 = dispatch_get_specific(*v76);
      v138 = (void *)MEMORY[0x1E0CB3978];
      v139 = v137;
      objc_msgSend(v138, "callStackSymbols");
      v76 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "componentsJoinedByString:", CFSTR("\n"));
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v187 = (const void **)v137;
      v188 = 2114;
      v189 = v140;
      _os_log_error_impl(&dword_1A6382000, v78, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_97;
  }
  -[PISemanticStyleFilter inputTRCData](self, "inputTRCData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    NUAssertLogger_16179();
    v106 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "self.inputTRCData != nil");
      v107 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v187 = v107;
      _os_log_error_impl(&dword_1A6382000, v106, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v76 = (const void **)MEMORY[0x1E0D51D48];
    v108 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_16179();
    v78 = objc_claimAutoreleasedReturnValue();
    v109 = os_log_type_enabled(v78, OS_LOG_TYPE_ERROR);
    if (!v108)
    {
      if (v109)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "componentsJoinedByString:", CFSTR("\n"));
        v76 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v187 = v76;
        _os_log_error_impl(&dword_1A6382000, v78, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_100:

      v114 = _NUAssertFailHandler();
      goto LABEL_101;
    }
LABEL_98:
    if (v109)
    {
      v141 = dispatch_get_specific(*v76);
      v142 = (void *)MEMORY[0x1E0CB3978];
      v143 = v141;
      objc_msgSend(v142, "callStackSymbols");
      v76 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "componentsJoinedByString:", CFSTR("\n"));
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v187 = (const void **)v141;
      v188 = 2114;
      v189 = v144;
      _os_log_error_impl(&dword_1A6382000, v78, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_100;
  }
  -[PISemanticStyleFilter inputTRCData](self, "inputTRCData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PISemanticStyleFilter curveImageWithData:](self, "curveImageWithData:", v10);
  v11 = objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    NUAssertLogger_16179();
    v111 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to generate TRC image"));
      v112 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v187 = v112;
      _os_log_error_impl(&dword_1A6382000, v111, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v76 = (const void **)MEMORY[0x1E0D51D48];
    v113 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_16179();
    v78 = objc_claimAutoreleasedReturnValue();
    v114 = os_log_type_enabled(v78, OS_LOG_TYPE_ERROR);
    if (!v113)
    {
      if (v114)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "componentsJoinedByString:", CFSTR("\n"));
        v116 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v187 = v116;
        _os_log_error_impl(&dword_1A6382000, v78, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_103:

      _NUAssertFailHandler();
      goto LABEL_104;
    }
LABEL_101:
    if (v114)
    {
      v145 = dispatch_get_specific(*v76);
      v146 = (void *)MEMORY[0x1E0CB3978];
      v147 = v145;
      objc_msgSend(v146, "callStackSymbols");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "componentsJoinedByString:", CFSTR("\n"));
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v187 = (const void **)v145;
      v188 = 2114;
      v189 = v149;
      _os_log_error_impl(&dword_1A6382000, v78, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_103;
  }
  -[PISemanticStyleFilter inputLightMapData](self, "inputLightMapData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[PISemanticStyleFilter inputLinearLightMapData](self, "inputLinearLightMapData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[PISemanticStyleFilter inputStatistics](self, "inputStatistics");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14 != 0;

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  -[PISemanticStyleFilter inputLightMapData](self, "inputLightMapData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PISemanticStyleFilter _lightMapImageWithData:](self, "_lightMapImageWithData:", v16);
  v17 = objc_claimAutoreleasedReturnValue();

  -[PISemanticStyleFilter inputLinearLightMapData](self, "inputLinearLightMapData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PISemanticStyleFilter _lightMapImageWithData:](self, "_lightMapImageWithData:", v18);
  v19 = objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    if (v17)
    {
      if (v19)
        goto LABEL_18;
      NUAssertLogger_16179();
      v157 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v157, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to generate linear lightmap image"));
        v158 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v187 = v158;
        _os_log_error_impl(&dword_1A6382000, v157, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      v152 = (const void **)MEMORY[0x1E0D51D48];
      v159 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      NUAssertLogger_16179();
      v154 = objc_claimAutoreleasedReturnValue();
      v160 = os_log_type_enabled(v154, OS_LOG_TYPE_ERROR);
      if (!v159)
      {
        if (v160)
        {
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v161, "componentsJoinedByString:", CFSTR("\n"));
          v162 = (const void **)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v187 = v162;
          _os_log_error_impl(&dword_1A6382000, v154, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

        }
        goto LABEL_119;
      }
LABEL_117:
      if (v160)
      {
        v167 = dispatch_get_specific(*v152);
        v168 = (void *)MEMORY[0x1E0CB3978];
        v169 = v167;
        objc_msgSend(v168, "callStackSymbols");
        v170 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v170, "componentsJoinedByString:", CFSTR("\n"));
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v187 = (const void **)v167;
        v188 = 2114;
        v189 = v171;
        _os_log_error_impl(&dword_1A6382000, v154, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
LABEL_119:

      _NUAssertFailHandler();
    }
LABEL_104:
    NUAssertLogger_16179();
    v150 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to generate lightmap image"));
      v151 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v187 = v151;
      _os_log_error_impl(&dword_1A6382000, v150, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v152 = (const void **)MEMORY[0x1E0D51D48];
    v153 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_16179();
    v154 = objc_claimAutoreleasedReturnValue();
    v155 = os_log_type_enabled(v154, OS_LOG_TYPE_ERROR);
    if (v153)
    {
      if (v155)
      {
        v163 = dispatch_get_specific(*v152);
        v164 = (void *)MEMORY[0x1E0CB3978];
        v165 = v163;
        objc_msgSend(v164, "callStackSymbols");
        v152 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v152, "componentsJoinedByString:", CFSTR("\n"));
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v187 = (const void **)v163;
        v188 = 2114;
        v189 = v166;
        _os_log_error_impl(&dword_1A6382000, v154, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v155)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "componentsJoinedByString:", CFSTR("\n"));
      v152 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v187 = v152;
      _os_log_error_impl(&dword_1A6382000, v154, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v160 = _NUAssertFailHandler();
    goto LABEL_117;
  }
LABEL_18:
  v177 = (void *)v19;
  -[PISemanticStyleFilter inputImage](self, "inputImage");
  v178 = (void *)v17;
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PISemanticStyleFilter inputSubjectMatteImage](self, "inputSubjectMatteImage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PISemanticStyleFilter inputSkinMatteImage](self, "inputSkinMatteImage");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PISemanticStyleFilter inputSkyMatteImage](self, "inputSkyMatteImage");
  v179 = (void *)v11;
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PISemanticStyleFilter inputLinearThumbnailImage](self, "inputLinearThumbnailImage");
  v24 = objc_claimAutoreleasedReturnValue();
  -[PISemanticStyleFilter inputGainMapImage](self, "inputGainMapImage");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  __36__PISemanticStyleFilter_outputImage__block_invoke(v21, v20);
  v26 = v15;
  v27 = objc_claimAutoreleasedReturnValue();

  __36__PISemanticStyleFilter_outputImage__block_invoke(v22, v20);
  v28 = objc_claimAutoreleasedReturnValue();

  __36__PISemanticStyleFilter_outputImage__block_invoke(v23, v20);
  v29 = objc_claimAutoreleasedReturnValue();

  __36__PISemanticStyleFilter_outputImage__block_invoke(v25, v20);
  v30 = objc_claimAutoreleasedReturnValue();

  v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v174 = v20;
  objc_msgSend(v31, "addObject:", v20);
  v176 = (void *)v27;
  objc_msgSend(v31, "addObject:", v27);
  v173 = (void *)v28;
  objc_msgSend(v31, "addObject:", v28);
  v172 = (void *)v29;
  objc_msgSend(v31, "addObject:", v29);
  v175 = (void *)v24;
  v32 = v24;
  v33 = (void *)v30;
  objc_msgSend(v31, "addObject:", v32);
  objc_msgSend(v31, "addObject:", v30);
  objc_msgSend(v31, "addObject:", v179);
  if (v26)
  {
    objc_msgSend(v31, "addObject:", v178);
    objc_msgSend(v31, "addObject:", v177);
  }
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v31, "count"));
  v181 = 0u;
  v182 = 0u;
  v183 = 0u;
  v184 = 0u;
  v35 = v31;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v181, v185, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v182;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v182 != v38)
          objc_enumerationMutation(v35);
        v40 = (void *)MEMORY[0x1E0C9DDF8];
        objc_msgSend(*(id *)(*((_QWORD *)&v181 + 1) + 8 * i), "extent");
        objc_msgSend(v40, "vectorWithCGRect:");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addObject:", v41);

      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v181, v185, 16);
    }
    while (v37);
  }

  v42 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v42, "setObject:forKeyedSubscript:", v34, CFSTR("extents"));
  v43 = (void *)MEMORY[0x1E0CB37E8];
  -[PISemanticStyleFilter inputToneBias](self, "inputToneBias");
  objc_msgSend(v43, "numberWithDouble:");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setObject:forKeyedSubscript:", v44, CFSTR("tone"));

  v45 = (void *)MEMORY[0x1E0CB37E8];
  -[PISemanticStyleFilter inputColorBias](self, "inputColorBias");
  objc_msgSend(v45, "numberWithDouble:");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setObject:forKeyedSubscript:", v46, CFSTR("color"));

  -[PISemanticStyleFilter inputCast](self, "inputCast");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setObject:forKeyedSubscript:", v47, CFSTR("cast"));

  v48 = (void *)MEMORY[0x1E0CB37E8];
  -[PISemanticStyleFilter inputIntensity](self, "inputIntensity");
  objc_msgSend(v48, "numberWithDouble:");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setObject:forKeyedSubscript:", v49, CFSTR("intensity"));

  -[PISemanticStyleFilter inputSRLCurveParameter](self, "inputSRLCurveParameter");
  v50 = objc_claimAutoreleasedReturnValue();
  v51 = (void *)v50;
  if (v50)
    v52 = (void *)v50;
  else
    v52 = &unk_1E5051FD8;
  objc_msgSend(v42, "setObject:forKeyedSubscript:", v52, CFSTR("srlCurveParameter"));

  -[PISemanticStyleFilter inputSceneType](self, "inputSceneType");
  v53 = objc_claimAutoreleasedReturnValue();
  v54 = (void *)v53;
  if (v53)
    v55 = (void *)v53;
  else
    v55 = &unk_1E5051538;
  objc_msgSend(v42, "setObject:forKeyedSubscript:", v55, CFSTR("sceneType"));

  -[PISemanticStyleFilter inputStatistics](self, "inputStatistics");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setObject:forKeyedSubscript:", v56, CFSTR("stats"));

  v57 = (void *)MEMORY[0x1E0CB37E8];
  -[PISemanticStyleFilter inputBaselineExposure](self, "inputBaselineExposure");
  objc_msgSend(v57, "numberWithDouble:");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setObject:forKeyedSubscript:", v58, CFSTR("baselineExposure"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v26);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setObject:forKeyedSubscript:", v59, CFSTR("useLightMap"));

  v60 = (void *)objc_opt_class();
  -[PISemanticStyleFilter tuningType](self, "tuningType");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "CMISmartStyleTuningParameterVariantFromKey:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setObject:forKeyedSubscript:", v62, CFSTR("tuningType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PISemanticStyleFilter useStyleEngine](self, "useStyleEngine"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setObject:forKeyedSubscript:", v63, CFSTR("useStyleEngine"));

  -[PISemanticStyleFilter brightnessValue](self, "brightnessValue");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setObject:forKeyedSubscript:", v64, CFSTR("brightnessValue"));

  -[PISemanticStyleFilter baseGain](self, "baseGain");
  v65 = objc_claimAutoreleasedReturnValue();
  v66 = (void *)v65;
  if (v65)
    v67 = (void *)v65;
  else
    v67 = &unk_1E5051FE8;
  objc_msgSend(v42, "setObject:forKeyedSubscript:", v67, CFSTR("baseGain"));

  -[PISemanticStyleFilter faceBasedGlobalExposureBoostRatio](self, "faceBasedGlobalExposureBoostRatio");
  v68 = objc_claimAutoreleasedReturnValue();
  v69 = (void *)v68;
  if (v68)
    v70 = (void *)v68;
  else
    v70 = &unk_1E5051FE8;
  objc_msgSend(v42, "setObject:forKeyedSubscript:", v70, CFSTR("faceBasedGlobalExposureBoostRatio"));

  -[PISemanticStyleFilter inputImage](self, "inputImage");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "extent");
  v180 = 0;
  +[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:](PISemanticStyleProcessor, "applyWithExtent:inputs:arguments:error:", v35, v42, &v180);
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  return v72;
}

- (id)gtcKernel
{
  if (gtcKernel_once != -1)
    dispatch_once(&gtcKernel_once, &__block_literal_global_153);
  return (id)gtcKernel_singleton;
}

- (id)extractDataToDictionary:(id)a3 options:(id)a4 context:(id)a5 colorSpace:(CGColorSpace *)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  float v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  _QWORD v52[4];
  _QWORD v53[3];
  _QWORD v54[5];

  v54[3] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v51 = 0;
  objc_msgSend((id)objc_opt_class(), "_computeAlphaAwareHistogramForImage:context:colorSpace:error:", v12, v14, a6, &v51);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v51;
  if (v15)
  {
    v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend((id)objc_opt_class(), "_computeSmartToneStatsFromHistogram:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addEntriesFromDictionary:", v18);
    objc_msgSend(v13, "objectForKeyedSubscript:", PISemanticStyleFilterStatsLocalOption);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "BOOLValue");

    if (v20)
    {
      v49 = v18;
      v50 = v16;
      objc_msgSend(v13, "objectForKeyedSubscript:", PISemanticStyleFilterStatsBaselineExposureOption);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v21;
      if (v21)
      {
        objc_msgSend(v21, "floatValue");
        v53[0] = CFSTR("inputRVector");
        v23 = v22;
        objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", v22, 0.0, 0.0, 0.0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v54[0] = v24;
        v53[1] = CFSTR("inputGVector");
        objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, v23, 0.0, 0.0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v54[1] = v25;
        v53[2] = CFSTR("inputBVector");
        objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 0.0, v23, 0.0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v54[2] = v26;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 3);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorMatrix"), v27);
        v28 = objc_claimAutoreleasedReturnValue();

        v12 = (id)v28;
      }
      objc_msgSend(v13, "objectForKeyedSubscript:", PISemanticStyleFilterStatsGlobalToneCurveOption);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        -[PISemanticStyleFilter curveImageWithData:](self, "curveImageWithData:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:", 0.0, 1.0);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "extent");
        objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:", (v31 + -1.0) / v31, 0.5 / v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "imageByUnpremultiplyingAlpha");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        -[PISemanticStyleFilter gtcKernel](self, "gtcKernel");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "extent");
        v36 = v35;
        v38 = v37;
        v40 = v39;
        v42 = v41;
        v52[0] = v33;
        v52[1] = v30;
        v52[2] = v47;
        v52[3] = v32;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 4);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "applyWithExtent:arguments:", v43, v36, v38, v40, v42);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v44, "imageByPremultiplyingAlpha");
        v12 = (id)objc_claimAutoreleasedReturnValue();

      }
      v18 = v49;
      objc_msgSend(v12, "localLightStatisticsNoProxy");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addEntriesFromDictionary:", v45);

      v16 = v50;
    }

  }
  else if (a7)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to compute histogram"), v12, v16);
    v17 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputImage, a3);
}

- (CIImage)inputSubjectMatteImage
{
  return self->_inputSubjectMatteImage;
}

- (void)setInputSubjectMatteImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputSubjectMatteImage, a3);
}

- (CIImage)inputSkinMatteImage
{
  return self->_inputSkinMatteImage;
}

- (void)setInputSkinMatteImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputSkinMatteImage, a3);
}

- (CIImage)inputSkyMatteImage
{
  return self->_inputSkyMatteImage;
}

- (void)setInputSkyMatteImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputSkyMatteImage, a3);
}

- (CIImage)inputLinearThumbnailImage
{
  return self->_inputLinearThumbnailImage;
}

- (void)setInputLinearThumbnailImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputLinearThumbnailImage, a3);
}

- (CIImage)inputGainMapImage
{
  return self->_inputGainMapImage;
}

- (void)setInputGainMapImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputGainMapImage, a3);
}

- (double)inputToneBias
{
  return self->_inputToneBias;
}

- (void)setInputToneBias:(double)a3
{
  self->_inputToneBias = a3;
}

- (double)inputColorBias
{
  return self->_inputColorBias;
}

- (void)setInputColorBias:(double)a3
{
  self->_inputColorBias = a3;
}

- (NSString)inputCast
{
  return self->_inputCast;
}

- (void)setInputCast:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (double)inputIntensity
{
  return self->_inputIntensity;
}

- (void)setInputIntensity:(double)a3
{
  self->_inputIntensity = a3;
}

- (NSNumber)inputSceneType
{
  return self->_inputSceneType;
}

- (void)setInputSceneType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSDictionary)inputStatistics
{
  return self->_inputStatistics;
}

- (void)setInputStatistics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (double)inputBaselineExposure
{
  return self->_inputBaselineExposure;
}

- (void)setInputBaselineExposure:(double)a3
{
  self->_inputBaselineExposure = a3;
}

- (NSData)inputTRCData
{
  return self->_inputTRCData;
}

- (void)setInputTRCData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSNumber)inputSRLCurveParameter
{
  return self->_inputSRLCurveParameter;
}

- (void)setInputSRLCurveParameter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSData)inputLightMapData
{
  return self->_inputLightMapData;
}

- (void)setInputLightMapData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSData)inputLinearLightMapData
{
  return self->_inputLinearLightMapData;
}

- (void)setInputLinearLightMapData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSNumber)inputLightMapWidth
{
  return self->_inputLightMapWidth;
}

- (void)setInputLightMapWidth:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSNumber)inputLightMapHeight
{
  return self->_inputLightMapHeight;
}

- (void)setInputLightMapHeight:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSNumber)brightnessValue
{
  return self->_brightnessValue;
}

- (void)setBrightnessValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSNumber)tuningType
{
  return self->_tuningType;
}

- (void)setTuningType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSNumber)baseGain
{
  return self->_baseGain;
}

- (void)setBaseGain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSNumber)faceBasedGlobalExposureBoostRatio
{
  return self->_faceBasedGlobalExposureBoostRatio;
}

- (void)setFaceBasedGlobalExposureBoostRatio:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (BOOL)useStyleEngine
{
  return self->_useStyleEngine;
}

- (void)setUseStyleEngine:(BOOL)a3
{
  self->_useStyleEngine = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceBasedGlobalExposureBoostRatio, 0);
  objc_storeStrong((id *)&self->_baseGain, 0);
  objc_storeStrong((id *)&self->_tuningType, 0);
  objc_storeStrong((id *)&self->_brightnessValue, 0);
  objc_storeStrong((id *)&self->_inputLightMapHeight, 0);
  objc_storeStrong((id *)&self->_inputLightMapWidth, 0);
  objc_storeStrong((id *)&self->_inputLinearLightMapData, 0);
  objc_storeStrong((id *)&self->_inputLightMapData, 0);
  objc_storeStrong((id *)&self->_inputSRLCurveParameter, 0);
  objc_storeStrong((id *)&self->_inputTRCData, 0);
  objc_storeStrong((id *)&self->_inputStatistics, 0);
  objc_storeStrong((id *)&self->_inputSceneType, 0);
  objc_storeStrong((id *)&self->_inputCast, 0);
  objc_storeStrong((id *)&self->_inputGainMapImage, 0);
  objc_storeStrong((id *)&self->_inputLinearThumbnailImage, 0);
  objc_storeStrong((id *)&self->_inputSkyMatteImage, 0);
  objc_storeStrong((id *)&self->_inputSkinMatteImage, 0);
  objc_storeStrong((id *)&self->_inputSubjectMatteImage, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

void __34__PISemanticStyleFilter_gtcKernel__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("float gtc_sample_r(float x, sampler2D table, vec2 domain, vec2 normalizer) { x = (x - domain.x) / (domain.y - domain.x); x = clamp(x, 0.0001, 0.9999); x = normalizer.x * x + normalizer.y; return texture2D(table, vec2(x, 0.5)).r; } kernel vec4 gtc_rgb(__sample color, sampler2D table, vec2 domain, vec2 normalizer) { vec4 pixel = color; pixel.r = gtc_sample_r(pixel.r, table, domain, normalizer); pixel.g = gtc_sample_r(pixel.g, table, domain, normalizer); pixel.b = gtc_sample_r(pixel.b, table, domain, normalizer); return pixel; }"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)gtcKernel_singleton;
  gtcKernel_singleton = v0;

}

id __36__PISemanticStyleFilter_outputImage__block_invoke(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;

  v3 = a2;
  v4 = a1;
  objc_msgSend(v4, "extent");
  objc_msgSend(v3, "extent");

  NUCGAffineTransformByMappingFromRectToRect();
  objc_msgSend(v4, "imageByApplyingTransform:", &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
