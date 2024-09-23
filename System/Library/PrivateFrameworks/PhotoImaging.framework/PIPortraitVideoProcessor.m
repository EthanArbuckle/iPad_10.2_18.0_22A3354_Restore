@implementation PIPortraitVideoProcessor

+ (void)_configureRGBColorTexture:(id)a3 format:(int)a4 isHDR:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  NSObject *v12;
  void *v14;
  const void **v15;
  void *specific;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v5 = a5;
  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (*MEMORY[0x1E0C9DFE8] != a4 && *MEMORY[0x1E0C9E080] != a4)
  {
    NUAssertLogger_1893();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected input pixel format"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v14;
      _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v15 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_1893();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v21 = dispatch_get_specific(*v15);
        v22 = (void *)MEMORY[0x1E0CB3978];
        v23 = v21;
        objc_msgSend(v22, "callStackSymbols");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v21;
        v29 = 2114;
        v30 = v25;
        _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v20;
      _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v9 = (_QWORD *)MEMORY[0x1E0D7F5E8];
  if (!v5)
    v9 = (_QWORD *)MEMORY[0x1E0CA8EB8];
  v10 = (_QWORD *)MEMORY[0x1E0CA8EA8];
  if (!v5)
    v10 = (_QWORD *)MEMORY[0x1E0CA8EB0];
  if (*MEMORY[0x1E0C9DFE8] == a4)
    v11 = v10;
  else
    v11 = v9;
  v26 = v7;
  objc_msgSend(v7, "setTransferFunction:", *v11);

}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  int v33;
  int v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  id v50;
  int v51;
  void *v52;
  NSObject *v53;
  int v55;
  NSObject *v56;
  void *v57;
  const void **v58;
  void *v59;
  NSObject *v60;
  _BOOL4 v61;
  NSObject *v62;
  void *v63;
  const void **v64;
  void *v65;
  _BOOL4 v66;
  NSObject *v67;
  void *v68;
  const void **v69;
  void *specific;
  _BOOL4 v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  NSObject *v82;
  void *v83;
  const void **v84;
  void *v85;
  _BOOL4 v86;
  NSObject *v87;
  void *v88;
  const void **v89;
  void *v90;
  _BOOL4 v91;
  NSObject *v92;
  void *v93;
  const void **v94;
  void *v95;
  _BOOL4 v96;
  void *v97;
  void *v98;
  NSObject *v99;
  void *v100;
  const void **v101;
  void *v102;
  NSObject *v103;
  _BOOL4 v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  id v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  id v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  id v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  id v129;
  void *v130;
  void *v131;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  id v145;
  _QWORD v146[4];
  id v147;
  id v148;
  _BYTE *v149;
  id v150;
  _BYTE v151[24];
  int v152;
  uint8_t buf[8];
  uint64_t v154;

  v154 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v145 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "count") != 2 && objc_msgSend(v8, "count"))
  {
    NUAssertLogger_1893();
    v67 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unexpected inputs"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v151 = 138543362;
      *(_QWORD *)&v151[4] = v68;
      _os_log_error_impl(&dword_1A6382000, v67, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v151, 0xCu);

    }
    v69 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_1893();
    v60 = objc_claimAutoreleasedReturnValue();
    v71 = os_log_type_enabled(v60, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v71)
      {
        v107 = dispatch_get_specific(*v69);
        v108 = (void *)MEMORY[0x1E0CB3978];
        v109 = v107;
        objc_msgSend(v108, "callStackSymbols");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "componentsJoinedByString:", CFSTR("\n"));
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v151 = 138543618;
        *(_QWORD *)&v151[4] = v107;
        *(_WORD *)&v151[12] = 2114;
        *(_QWORD *)&v151[14] = v111;
        _os_log_error_impl(&dword_1A6382000, v60, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v151, 0x16u);

      }
      goto LABEL_85;
    }
    if (!v71)
      goto LABEL_85;
    goto LABEL_68;
  }
  v144 = v8;
  objc_msgSend(v9, "metalCommandBuffer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    NUAssertLogger_1893();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("expected a device"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v151 = 138543362;
      *(_QWORD *)&v151[4] = v57;
      _os_log_error_impl(&dword_1A6382000, v56, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v151, 0xCu);

    }
    v58 = (const void **)MEMORY[0x1E0D51D48];
    v59 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_1893();
    v60 = objc_claimAutoreleasedReturnValue();
    v61 = os_log_type_enabled(v60, OS_LOG_TYPE_ERROR);
    if (v59)
    {
      if (v61)
      {
        v72 = dispatch_get_specific(*v58);
        v73 = (void *)MEMORY[0x1E0CB3978];
        v74 = v72;
        objc_msgSend(v73, "callStackSymbols");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "componentsJoinedByString:", CFSTR("\n"));
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v151 = 138543618;
        *(_QWORD *)&v151[4] = v72;
        *(_WORD *)&v151[12] = 2114;
        *(_QWORD *)&v151[14] = v76;
        _os_log_error_impl(&dword_1A6382000, v60, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v151, 0x16u);

      }
      goto LABEL_85;
    }
    if (!v61)
      goto LABEL_85;
    goto LABEL_68;
  }
  objc_msgSend(v9, "metalTexture");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    NUAssertLogger_1893();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("expected a texture"));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v151 = 138543362;
      *(_QWORD *)&v151[4] = v63;
      _os_log_error_impl(&dword_1A6382000, v62, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v151, 0xCu);

    }
    v64 = (const void **)MEMORY[0x1E0D51D48];
    v65 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_1893();
    v60 = objc_claimAutoreleasedReturnValue();
    v66 = os_log_type_enabled(v60, OS_LOG_TYPE_ERROR);
    if (v65)
    {
      if (v66)
      {
        v77 = dispatch_get_specific(*v64);
        v78 = (void *)MEMORY[0x1E0CB3978];
        v79 = v77;
        objc_msgSend(v78, "callStackSymbols");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "componentsJoinedByString:", CFSTR("\n"));
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v151 = 138543618;
        *(_QWORD *)&v151[4] = v77;
        *(_WORD *)&v151[12] = 2114;
        *(_QWORD *)&v151[14] = v81;
        _os_log_error_impl(&dword_1A6382000, v60, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v151, 0x16u);

      }
      goto LABEL_85;
    }
    if (!v66)
      goto LABEL_85;
    goto LABEL_68;
  }
  objc_msgSend(v145, "objectForKeyedSubscript:", CFSTR("aperture"));
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "objectForKeyedSubscript:", CFSTR("focusDistance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "objectForKeyedSubscript:", CFSTR("quality"));
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "objectForKeyedSubscript:", CFSTR("debug"));
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "objectForKeyedSubscript:", CFSTR("isHDR"));
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "objectForKeyedSubscript:", CFSTR("globalMetadata"));
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "objectForKeyedSubscript:", CFSTR("timedMetadata"));
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "metalCommandBuffer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "device");
  v141 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count") == 2)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "metalTexture");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "metalTexture");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D7F5C0], "createRGBA:", v18);
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_configureRGBColorTexture:format:isHDR:", v143, objc_msgSend(v19, "format"), objc_msgSend(v142, "BOOLValue"));

      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "region");
      v21 = NUPixelSizeFromCGSize();
      v23 = v22;

      objc_msgSend(v144, "objectAtIndexedSubscript:", 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "metalTexture");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        objc_msgSend(v144, "objectAtIndexedSubscript:", 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "metalTexture");
        v134 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v144, "objectAtIndexedSubscript:", 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "region");
        v28 = NUPixelSizeFromCGSize();
        v30 = v29;

        goto LABEL_21;
      }
      NUAssertLogger_1893();
      v92 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Expected an input disparity texture"));
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v151 = 138543362;
        *(_QWORD *)&v151[4] = v93;
        _os_log_error_impl(&dword_1A6382000, v92, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v151, 0xCu);

      }
      v94 = (const void **)MEMORY[0x1E0D51D48];
      v95 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      NUAssertLogger_1893();
      v60 = objc_claimAutoreleasedReturnValue();
      v96 = os_log_type_enabled(v60, OS_LOG_TYPE_ERROR);
      if (v95)
      {
        if (v96)
        {
          v122 = dispatch_get_specific(*v94);
          v123 = (void *)MEMORY[0x1E0CB3978];
          v124 = v122;
          objc_msgSend(v123, "callStackSymbols");
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v125, "componentsJoinedByString:", CFSTR("\n"));
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v151 = 138543618;
          *(_QWORD *)&v151[4] = v122;
          *(_WORD *)&v151[12] = 2114;
          *(_QWORD *)&v151[14] = v126;
          _os_log_error_impl(&dword_1A6382000, v60, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v151, 0x16u);

        }
        goto LABEL_85;
      }
      if (v96)
        goto LABEL_68;
LABEL_85:

      _NUAssertFailHandler();
      goto LABEL_89;
    }
    NUAssertLogger_1893();
    v87 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Expected an input color texture"));
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v151 = 138543362;
      *(_QWORD *)&v151[4] = v88;
      _os_log_error_impl(&dword_1A6382000, v87, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v151, 0xCu);

    }
    v89 = (const void **)MEMORY[0x1E0D51D48];
    v90 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_1893();
    v60 = objc_claimAutoreleasedReturnValue();
    v91 = os_log_type_enabled(v60, OS_LOG_TYPE_ERROR);
    if (v90)
    {
      if (v91)
      {
        v117 = dispatch_get_specific(*v89);
        v118 = (void *)MEMORY[0x1E0CB3978];
        v119 = v117;
        objc_msgSend(v118, "callStackSymbols");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v120, "componentsJoinedByString:", CFSTR("\n"));
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v151 = 138543618;
        *(_QWORD *)&v151[4] = v117;
        *(_WORD *)&v151[12] = 2114;
        *(_QWORD *)&v151[14] = v121;
        _os_log_error_impl(&dword_1A6382000, v60, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v151, 0x16u);

      }
      goto LABEL_85;
    }
    if (!v91)
      goto LABEL_85;
LABEL_68:
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "componentsJoinedByString:", CFSTR("\n"));
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v151 = 138543362;
    *(_QWORD *)&v151[4] = v98;
    _os_log_error_impl(&dword_1A6382000, v60, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v151, 0xCu);

    goto LABEL_85;
  }
  objc_msgSend(v145, "objectForKeyedSubscript:", CFSTR("colorPixelBuffer"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "CVPixelBuffer");
  if (!v32)
  {
    NUAssertLogger_1893();
    v82 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing direct source color pixel buffer"));
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v151 = 138543362;
      *(_QWORD *)&v151[4] = v83;
      _os_log_error_impl(&dword_1A6382000, v82, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v151, 0xCu);

    }
    v84 = (const void **)MEMORY[0x1E0D51D48];
    v85 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_1893();
    v60 = objc_claimAutoreleasedReturnValue();
    v86 = os_log_type_enabled(v60, OS_LOG_TYPE_ERROR);
    if (v85)
    {
      if (v86)
      {
        v112 = dispatch_get_specific(*v84);
        v113 = (void *)MEMORY[0x1E0CB3978];
        v114 = v112;
        objc_msgSend(v113, "callStackSymbols");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "componentsJoinedByString:", CFSTR("\n"));
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v151 = 138543618;
        *(_QWORD *)&v151[4] = v112;
        *(_WORD *)&v151[12] = 2114;
        *(_QWORD *)&v151[14] = v116;
        _os_log_error_impl(&dword_1A6382000, v60, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v151, 0x16u);

      }
      goto LABEL_85;
    }
    if (!v86)
      goto LABEL_85;
    goto LABEL_68;
  }
  *(_QWORD *)buf = 0;
  v150 = 0;
  objc_msgSend(MEMORY[0x1E0D7F570], "pixelBufferToLumaChroma:pixelBuffer:outLuma:outChroma:read:write:", v141, v32, buf, &v150, 1, 1);
  objc_msgSend(MEMORY[0x1E0D7F5C0], "createYUV420:chroma:", *(_QWORD *)buf, v150);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v142, "BOOLValue");
  v34 = v33;
  if (v33)
    v35 = 10;
  else
    v35 = 8;
  v36 = (_QWORD *)MEMORY[0x1E0CA8EA8];
  if (!v33)
    v36 = (_QWORD *)MEMORY[0x1E0CA8EB0];
  objc_msgSend(v143, "setTransferFunction:", *v36);
  v37 = (_QWORD *)MEMORY[0x1E0CA2108];
  if (!v34)
    v37 = (_QWORD *)MEMORY[0x1E0CA8D88];
  objc_msgSend(v143, "setColorPrimaries:", *v37);
  v38 = (_QWORD *)MEMORY[0x1E0CA8F00];
  if (!v34)
    v38 = (_QWORD *)MEMORY[0x1E0CA8F18];
  objc_msgSend(v143, "setYCbCrMatrix:", *v38);
  objc_msgSend(v143, "setYCbCrColorDepth:", v35);
  objc_msgSend(v143, "setYCbCrFullRange:", 0);
  v21 = objc_msgSend(v31, "size");
  v23 = v39;
  objc_msgSend(v145, "objectForKeyedSubscript:", CFSTR("disparityPixelBuffer"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "CVPixelBuffer");
  if (!v41)
  {
    NUAssertLogger_1893();
    v99 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing direct source disparity pixel buffer"));
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v151 = 138543362;
      *(_QWORD *)&v151[4] = v100;
      _os_log_error_impl(&dword_1A6382000, v99, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v151, 0xCu);

    }
    v101 = (const void **)MEMORY[0x1E0D51D48];
    v102 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_1893();
    v103 = objc_claimAutoreleasedReturnValue();
    v104 = os_log_type_enabled(v103, OS_LOG_TYPE_ERROR);
    if (v102)
    {
      if (v104)
      {
        v127 = dispatch_get_specific(*v101);
        v128 = (void *)MEMORY[0x1E0CB3978];
        v129 = v127;
        objc_msgSend(v128, "callStackSymbols");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v130, "componentsJoinedByString:", CFSTR("\n"));
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v151 = 138543618;
        *(_QWORD *)&v151[4] = v127;
        *(_WORD *)&v151[12] = 2114;
        *(_QWORD *)&v151[14] = v131;
        _os_log_error_impl(&dword_1A6382000, v103, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v151, 0x16u);

      }
    }
    else if (v104)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "componentsJoinedByString:", CFSTR("\n"));
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v151 = 138543362;
      *(_QWORD *)&v151[4] = v106;
      _os_log_error_impl(&dword_1A6382000, v103, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v151, 0xCu);

    }
    _NUAssertFailHandler();
LABEL_89:
    __break(1u);
  }
  objc_msgSend(MEMORY[0x1E0D7F570], "getMTLTextureFromPixelBuffer:device:", v41, v141);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v40, "size");
  v30 = v42;

LABEL_21:
  v43 = (void *)MEMORY[0x1E0D7F5C0];
  objc_msgSend(v9, "metalTexture");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "createRGBA:", v44);
  v139 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_configureRGBColorTexture:format:isHDR:", v139, objc_msgSend(v9, "format"), objc_msgSend(v142, "BOOLValue"));
  v45 = objc_alloc_init(MEMORY[0x1E0D7F5A0]);
  objc_msgSend(v45, "setSourceColor:", v143);
  objc_msgSend(v45, "setSourceDisparity:", v134);
  objc_msgSend(v45, "setDestinationColor:", v139);
  objc_msgSend(v140, "applyToRenderRequest:", v45);
  objc_msgSend(v137, "applyToRenderRequest:", v45);
  if (v138)
  {
    objc_msgSend(v138, "floatValue");
    objc_msgSend(v45, "setFNumber:");
  }
  if (v13)
  {
    objc_msgSend(v13, "floatValue");
    objc_msgSend(v45, "setFocusDisparity:");
  }
  v46 = v13;
  *(_QWORD *)v151 = 0;
  *(_QWORD *)&v151[8] = v151;
  *(_QWORD *)&v151[16] = 0x2020000000;
  v152 = 0;
  v47 = objc_msgSend(v136, "intValue");
  v48 = objc_msgSend(v135, "integerValue");
  v146[0] = MEMORY[0x1E0C809B0];
  v146[1] = 3221225472;
  v146[2] = __69__PIPortraitVideoProcessor_processWithInputs_arguments_output_error___block_invoke;
  v146[3] = &unk_1E5015860;
  v49 = v45;
  v147 = v49;
  v149 = v151;
  v50 = v9;
  v148 = v50;
  +[PIPortraitVideoRenderer renderOnDevice:colorSize:disparitySize:quality:debugMode:globalRenderingMetadata:usingBlock:](PIPortraitVideoRenderer, "renderOnDevice:colorSize:disparitySize:quality:debugMode:globalRenderingMetadata:usingBlock:", v141, v21, v23, v28, v30, v47, v48, v140, v146);
  v51 = *(_DWORD *)(*(_QWORD *)&v151[8] + 24);
  v52 = v46;
  if (v51)
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_150_1974);
    v53 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      v55 = *(_DWORD *)(*(_QWORD *)&v151[8] + 24);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v55;
      _os_log_error_impl(&dword_1A6382000, v53, OS_LOG_TYPE_ERROR, "CPV rendering failure, returned status %d", buf, 8u);
    }
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], *(int *)(*(_QWORD *)&v151[8] + 24), 0);
      v52 = v46;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  _Block_object_dispose(v151, 8);
  return v51 == 0;
}

+ (int)formatForInputAtIndex:(int)a3
{
  int *v3;
  NSObject *v5;
  void *v6;
  const void **v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  SEL v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v3 = (int *)MEMORY[0x1E0C9E080];
    return *v3;
  }
  if (a3 == 1)
  {
    v3 = (int *)MEMORY[0x1E0C9E098];
    return *v3;
  }
  NUAssertLogger_1893();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid index"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543362;
    v21 = v6;
    _os_log_error_impl(&dword_1A6382000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v20, 0xCu);

  }
  v7 = (const void **)MEMORY[0x1E0D51D48];
  specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
  NUAssertLogger_1893();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
  if (specific)
  {
    if (v10)
    {
      v13 = dispatch_get_specific(*v7);
      v14 = (void *)MEMORY[0x1E0CB3978];
      v15 = v13;
      objc_msgSend(v14, "callStackSymbols");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v13;
      v22 = 2114;
      v23 = v17;
      _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v20, 0x16u);

    }
  }
  else if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543362;
    v21 = v12;
    _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v20, 0xCu);

  }
  v18 = (void *)_NUAssertFailHandler();
  return +[PIPortraitVideoProcessor outputFormat](v18, v19);
}

+ (int)outputFormat
{
  return *MEMORY[0x1E0C9E080];
}

+ (BOOL)outputIsOpaque
{
  return 1;
}

+ (BOOL)synchronizeInputs
{
  return 0;
}

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

+ (BOOL)allowCompressedInputsAndOutputs
{
  return 1;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  void *v6;
  void *v7;
  double v8;
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
  CGRect result;

  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("imageExtents"), a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "CGRectValue");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

+ (id)applyWithInputImage:(id)a3 disparityImage:(id)a4 inputPixelBuffer:(id)a5 disparityPixelBuffer:(id)a6 globalMetadata:(id)a7 timedMetadata:(id)a8 aperture:(id)a9 focusedDisparity:(id)a10 quality:(id)a11 debugMode:(id)a12 isHDR:(BOOL)a13 error:(id *)a14
{
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  unint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double Width;
  double v34;
  double Height;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  NSObject *v58;
  const void **v59;
  const void **v60;
  void *specific;
  NSObject *v62;
  _BOOL4 v63;
  void *v64;
  NSObject *v65;
  const void **v66;
  void *v67;
  int v68;
  void *v69;
  NSObject *v70;
  const void **v71;
  void *v72;
  int v73;
  void *v74;
  const void **v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  id v95;
  unint64_t v96;
  _QWORD v97[2];
  _QWORD v98[2];
  uint8_t buf[4];
  const void **v100;
  __int16 v101;
  void *v102;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v19 = (unint64_t)a3;
  v96 = (unint64_t)a4;
  v20 = (unint64_t)a5;
  v21 = (unint64_t)a6;
  v22 = a7;
  v95 = a8;
  v23 = a9;
  v24 = a10;
  v25 = a11;
  v26 = a12;
  if (!a14)
  {
    NUAssertLogger_1893();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v59 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v100 = v59;
      _os_log_error_impl(&dword_1A6382000, v58, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v60 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_1893();
    v62 = objc_claimAutoreleasedReturnValue();
    v63 = os_log_type_enabled(v62, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v63)
      {
        v76 = dispatch_get_specific(*v60);
        v77 = (void *)MEMORY[0x1E0CB3978];
        v78 = v76;
        objc_msgSend(v77, "callStackSymbols");
        v60 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "componentsJoinedByString:", CFSTR("\n"));
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v100 = (const void **)v76;
        v101 = 2114;
        v102 = v79;
        _os_log_error_impl(&dword_1A6382000, v62, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v63)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "componentsJoinedByString:", CFSTR("\n"));
      v60 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v100 = v60;
      _os_log_error_impl(&dword_1A6382000, v62, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v68 = _NUAssertFailHandler();
    goto LABEL_31;
  }
  if (!(v19 | v20))
  {
    NUAssertLogger_1893();
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "inputImage != nil || inputPixelBuffer != nil");
      v66 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v100 = v66;
      _os_log_error_impl(&dword_1A6382000, v65, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v60 = (const void **)MEMORY[0x1E0D51D48];
    v67 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_1893();
    v62 = objc_claimAutoreleasedReturnValue();
    v68 = os_log_type_enabled(v62, OS_LOG_TYPE_ERROR);
    if (!v67)
    {
      if (v68)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "componentsJoinedByString:", CFSTR("\n"));
        v60 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v100 = v60;
        _os_log_error_impl(&dword_1A6382000, v62, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_33:

      v73 = _NUAssertFailHandler();
      goto LABEL_34;
    }
LABEL_31:
    if (v68)
    {
      v80 = dispatch_get_specific(*v60);
      v81 = (void *)MEMORY[0x1E0CB3978];
      v82 = v80;
      objc_msgSend(v81, "callStackSymbols");
      v60 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "componentsJoinedByString:", CFSTR("\n"));
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v100 = (const void **)v80;
      v101 = 2114;
      v102 = v83;
      _os_log_error_impl(&dword_1A6382000, v62, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_33;
  }
  v27 = v19;
  if (!(v96 | v21))
  {
    NUAssertLogger_1893();
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "disparityImage != nil || disparityPixelBuffer != nil");
      v71 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v100 = v71;
      _os_log_error_impl(&dword_1A6382000, v70, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v60 = (const void **)MEMORY[0x1E0D51D48];
    v72 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_1893();
    v62 = objc_claimAutoreleasedReturnValue();
    v73 = os_log_type_enabled(v62, OS_LOG_TYPE_ERROR);
    if (!v72)
    {
      if (v73)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "componentsJoinedByString:", CFSTR("\n"));
        v75 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v100 = v75;
        _os_log_error_impl(&dword_1A6382000, v62, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_36;
    }
LABEL_34:
    if (v73)
    {
      v84 = dispatch_get_specific(*v60);
      v85 = (void *)MEMORY[0x1E0CB3978];
      v86 = v84;
      objc_msgSend(v85, "callStackSymbols");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "componentsJoinedByString:", CFSTR("\n"));
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v100 = (const void **)v84;
      v101 = 2114;
      v102 = v88;
      _os_log_error_impl(&dword_1A6382000, v62, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_36:

    _NUAssertFailHandler();
  }
  v92 = v26;
  v93 = v25;
  v91 = (void *)v19;
  if (!v19)
  {
    Width = (double)CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend((id)v20, "CVPixelBuffer"));
    Height = (double)CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend((id)v20, "CVPixelBuffer"));
    v29 = 0.0;
    v36 = (void *)v20;
    if (v96)
    {
      v37 = v24;
      v38 = v23;
      objc_msgSend((id)v96, "extent");
      v40 = v47;
      v42 = v48;
      v44 = v49;
      v46 = v50;
      v31 = 0.0;
      v89 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_9;
    }
    v31 = 0.0;
LABEL_11:
    v37 = v24;
    v38 = v23;
    v44 = (double)CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend((id)v21, "CVPixelBuffer"));
    v51 = (void *)v21;
    v46 = (double)CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend((id)v21, "CVPixelBuffer"));
    v40 = 0.0;
    v89 = (void *)MEMORY[0x1E0C9AA60];
    v42 = 0.0;
    goto LABEL_12;
  }
  objc_msgSend((id)v19, "extent");
  v29 = v28;
  v31 = v30;
  Width = v32;
  Height = v34;
  v36 = (void *)v20;
  if (!v96)
    goto LABEL_11;
  v37 = v24;
  v38 = v23;
  objc_msgSend((id)v96, "extent");
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v46 = v45;
  v98[0] = v27;
  v98[1] = v96;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 2);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  v51 = (void *)v21;
LABEL_12:
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithCGRect:", v29, v31, Width, Height);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v97[0] = v52;
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithCGRect:", v40, v42, v44, v46);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v97[1] = v53;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 2);
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v54, "setObject:forKeyedSubscript:", v90, CFSTR("imageExtents"));
  objc_msgSend(v54, "setObject:forKeyedSubscript:", v22, CFSTR("globalMetadata"));
  objc_msgSend(v54, "setObject:forKeyedSubscript:", v95, CFSTR("timedMetadata"));
  objc_msgSend(v54, "setObject:forKeyedSubscript:", v38, CFSTR("aperture"));
  objc_msgSend(v54, "setObject:forKeyedSubscript:", v37, CFSTR("focusDistance"));
  objc_msgSend(v54, "setObject:forKeyedSubscript:", v93, CFSTR("quality"));
  objc_msgSend(v54, "setObject:forKeyedSubscript:", v92, CFSTR("debug"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a13);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setObject:forKeyedSubscript:", v55, CFSTR("isHDR"));

  objc_msgSend(v54, "setObject:forKeyedSubscript:", v36, CFSTR("colorPixelBuffer"));
  objc_msgSend(v54, "setObject:forKeyedSubscript:", v51, CFSTR("disparityPixelBuffer"));
  objc_msgSend(a1, "applyWithExtent:inputs:arguments:error:", v89, v54, a14, v29, v31, Width, Height);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  return v56;
}

void __69__PIPortraitVideoProcessor_processWithInputs_arguments_output_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "setRenderState:", a3);
  objc_msgSend(*(id *)(a1 + 40), "metalCommandBuffer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v6, "encodeRenderTo:withRenderRequest:", v7, *(_QWORD *)(a1 + 32));

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (_DWORD)v5;
  objc_msgSend(*(id *)(a1 + 40), "metalCommandBuffer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addCompletedHandler:", &__block_literal_global_1979);

}

void __69__PIPortraitVideoProcessor_processWithInputs_arguments_output_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (objc_msgSend(v2, "status") == 5)
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_150_1974);
    v3 = (void *)*MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "label");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543618;
      v8 = v5;
      v9 = 2114;
      v10 = v6;
      _os_log_error_impl(&dword_1A6382000, v4, OS_LOG_TYPE_ERROR, "Error executing command buffer '%{public}@': %{public}@", (uint8_t *)&v7, 0x16u);

    }
  }

}

@end
