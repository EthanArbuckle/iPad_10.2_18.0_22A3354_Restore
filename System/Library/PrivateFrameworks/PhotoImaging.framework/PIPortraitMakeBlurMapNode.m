@implementation PIPortraitMakeBlurMapNode

- (PIPortraitMakeBlurMapNode)initWithSettings:(id)a3 inputs:(id)a4
{
  id v6;
  id v7;
  uint64_t *v8;
  os_log_t *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  os_log_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  os_log_t v23;
  void *specific;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  objc_class *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (uint64_t *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    goto LABEL_15;
  while (1)
  {
    v9 = (os_log_t *)MEMORY[0x1E0D52380];
    v10 = (void *)*MEMORY[0x1E0D52380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = v10;
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v16;
      _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      v17 = *v8;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
      {
        if (v17 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_12138);
LABEL_7:
        v18 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
        {
          v19 = (void *)MEMORY[0x1E0CB3978];
          v20 = v18;
          objc_msgSend(v19, "callStackSymbols");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v31 = v22;
          _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v17 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_12138);
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
    {
      goto LABEL_7;
    }
    v23 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      v25 = (void *)MEMORY[0x1E0CB3978];
      v26 = specific;
      v20 = v23;
      objc_msgSend(v25, "callStackSymbols");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = specific;
      v32 = 2114;
      v33 = v28;
      _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_12138);
  }
}

- (PIPortraitMakeBlurMapNode)initWithInput:(id)a3 settings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  PIPortraitMakeBlurMapNode *v10;
  NSObject *v12;
  void *v13;
  const void **v14;
  void *specific;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  objc_super v25;
  uint64_t v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    NUAssertLogger_12040();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "input != nil");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v13;
      _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v14 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_12040();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        v20 = dispatch_get_specific(*v14);
        v21 = (void *)MEMORY[0x1E0CB3978];
        v22 = v20;
        objc_msgSend(v21, "callStackSymbols");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v20;
        v30 = 2114;
        v31 = v24;
        _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v19;
      _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v8 = v7;
  v26 = *MEMORY[0x1E0C9E1F8];
  v27 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25.receiver = self;
  v25.super_class = (Class)PIPortraitMakeBlurMapNode;
  v10 = -[NURenderNode initWithSettings:inputs:](&v25, sel_initWithSettings_inputs_, v8, v9);

  return v10;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  uint64_t v61;
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
  void *v74;
  unint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v106;
  uint64_t v107;
  void *v108;
  NSObject *v109;
  void *v110;
  const void **v111;
  void *specific;
  NSObject *v113;
  _BOOL4 v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  id v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  uint64_t v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  id v142;
  id v143;
  id v144;
  id v145;
  _QWORD v146[2];
  _QWORD v147[4];
  uint8_t buf[4];
  void *v149;
  __int16 v150;
  void *v151;
  uint64_t v152;

  v152 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!a5)
  {
    NUAssertLogger_12040();
    v109 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v149 = v110;
      _os_log_error_impl(&dword_1A6382000, v109, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v111 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_12040();
    v113 = objc_claimAutoreleasedReturnValue();
    v114 = os_log_type_enabled(v113, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v114)
      {
        v117 = dispatch_get_specific(*v111);
        v118 = (void *)MEMORY[0x1E0CB3978];
        v119 = v117;
        objc_msgSend(v118, "callStackSymbols");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v120, "componentsJoinedByString:", CFSTR("\n"));
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v149 = v117;
        v150 = 2114;
        v151 = v121;
        _os_log_error_impl(&dword_1A6382000, v113, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v114)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "componentsJoinedByString:", CFSTR("\n"));
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v149 = v116;
      _os_log_error_impl(&dword_1A6382000, v113, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v10 = v9;
  if (objc_msgSend(v9, "evaluationMode") == 1)
  {
    if (objc_msgSend(v10, "auxiliaryImageType") == 1)
    {
      -[PIPortraitNode input](self, "input");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v10, a5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        v27 = 0;
LABEL_53:

        goto LABEL_54;
      }
      -[PIPortraitNode input](self, "input");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "imageProperties:", a5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        v27 = 0;
LABEL_52:

        goto LABEL_53;
      }
      v15 = (void *)objc_msgSend(v10, "copy");
      objc_msgSend(v14, "auxiliaryImagePropertiesForType:", 2);
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        v140 = v12;
        objc_msgSend(v15, "setAuxiliaryImageType:", 2);
        objc_msgSend(v14, "size");
        objc_msgSend(v17, "size");
        v18 = NUScaleToFillSizeInSize();
        objc_msgSend(v15, "setScale:", v18, v19);
        -[PIPortraitNode input](self, "input");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v145 = 0;
        objc_msgSend(v20, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v15, &v145);
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = v145;

        v135 = (void *)v21;
        if (v21)
        {
          v139 = v22;
          objc_msgSend(v14, "auxiliaryImagePropertiesForType:", 3);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v134 = v15;
          if (v23)
          {
            objc_msgSend(v15, "setAuxiliaryImageType:", 3);
            objc_msgSend(v14, "size");
            objc_msgSend(v23, "size");
            v24 = NUScaleToFillSizeInSize();
            objc_msgSend(v15, "setScale:", v24, v25);
            -[PIPortraitNode input](self, "input");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v144 = 0;
            objc_msgSend(v26, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v15, &v144);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v144;

            v131 = v27;
            v12 = v140;
            if (!v27)
            {
              v48 = (void *)MEMORY[0x1E0D520A0];
              -[PIPortraitNode input](self, "input");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to obtain portrait matte aux image"), v49, v28);
              *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_50:

              v15 = v134;
              goto LABEL_51;
            }
            v139 = v28;
            v15 = v134;
          }
          else
          {
            v131 = 0;
          }
          objc_msgSend(v14, "auxiliaryImagePropertiesForType:", 5);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (v35)
          {
            objc_msgSend(v15, "setAuxiliaryImageType:", 5);
            objc_msgSend(v14, "size");
            objc_msgSend(v35, "size");
            v36 = NUScaleToFillSizeInSize();
            objc_msgSend(v15, "setScale:", v36, v37);
            -[PIPortraitNode input](self, "input");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v143 = 0;
            objc_msgSend(v38, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v15, &v143);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v143;

            if (!v27)
            {
              v50 = (void *)MEMORY[0x1E0D520A0];
              -[PIPortraitNode input](self, "input");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to obtain hair matte aux image"), v51, v28);
              *a5 = (id)objc_claimAutoreleasedReturnValue();
              v49 = v131;
LABEL_49:

              v23 = v35;
              v12 = v140;
              goto LABEL_50;
            }
            v139 = v28;
            v15 = v134;
          }
          else
          {
            v27 = 0;
          }
          v130 = v27;
          -[NURenderNode settings](self, "settings");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("glassesMatteAllowed"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v40, "BOOLValue"))
          {
            objc_msgSend(v14, "auxiliaryImagePropertiesForType:", 8);
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            v42 = v41;
            if (v41)
            {
              objc_msgSend(v15, "setAuxiliaryImageType:", 8);
              objc_msgSend(v14, "size");
              objc_msgSend(v41, "size");
              v43 = NUScaleToFillSizeInSize();
              objc_msgSend(v15, "setScale:", v43, v44);
              -[PIPortraitNode input](self, "input");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v142 = 0;
              objc_msgSend(v45, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v15, &v142);
              v46 = objc_claimAutoreleasedReturnValue();
              v47 = v142;

              if (!v46)
              {
                v128 = v41;
                v106 = (void *)MEMORY[0x1E0D520A0];
                -[PIPortraitNode input](self, "input");
                v107 = objc_claimAutoreleasedReturnValue();
                v108 = v106;
                v104 = (void *)v107;
                objc_msgSend(v108, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to obtain glasses matte aux image"), v107, v47);
                v27 = 0;
                *a5 = (id)objc_claimAutoreleasedReturnValue();
                v28 = v47;
                v51 = v130;
                v49 = v131;
LABEL_48:

                v35 = v128;
                goto LABEL_49;
              }
              v132 = v46;
              v139 = v47;
            }
            else
            {
              v132 = 0;
            }
          }
          else
          {

            v132 = 0;
            v42 = v35;
          }
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          -[NURenderNode settings](self, "settings");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("depthInfo"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();

          -[NURenderNode settings](self, "settings");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("focusRect"));
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = v56;
          v127 = v8;
          v128 = v42;
          if (v56)
          {
            v58 = v56;
          }
          else
          {
            objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("focusRect"));
            v58 = (id)objc_claimAutoreleasedReturnValue();
          }
          v59 = v58;

          v126 = v54;
          objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("faces"));
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          -[NURenderNode settings](self, "settings");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("aperture"));
          v61 = objc_claimAutoreleasedReturnValue();
          v62 = (void *)v61;
          if (v61)
            v63 = (void *)v61;
          else
            v63 = &unk_1E5051D98;
          objc_msgSend(v52, "setObject:forKeyedSubscript:", v63, CFSTR("inputAperture"));

          v64 = v52;
          v65 = v59;
          v66 = (void *)v132;
          v129 = v64;
          if (v59)
          {
            v67 = (void *)objc_opt_class();
            objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("x"));
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            v147[0] = v136;
            objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("y"));
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            v147[1] = v124;
            objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("w"));
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            v147[2] = v122;
            objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("h"));
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v147[3] = v68;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v147, 4);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "vectorWithFloats:", v69);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v129, "setObject:forKeyedSubscript:", v70, CFSTR("inputFocusRect"));

            v66 = (void *)v132;
          }
          v125 = v65;
          v71 = v141;
          v133 = v66;
          if (v141)
          {
            v123 = v14;
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v137 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v141, "count"))
            {
              v75 = 0;
              do
              {
                objc_msgSend(v71, "objectAtIndexedSubscript:", v75);
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("leftEyeX"));
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v72, "addObject:", v77);

                objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("leftEyeY"));
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v72, "addObject:", v78);

                objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("rightEyeX"));
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v73, "addObject:", v79);

                objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("rightEyeY"));
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v73, "addObject:", v80);

                objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("noseX"));
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v74, "addObject:", v81);

                objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("noseY"));
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v74, "addObject:", v82);

                objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("chinX"));
                v83 = objc_claimAutoreleasedReturnValue();
                if (v83)
                {
                  v84 = (void *)v83;
                  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("chinY"));
                  v85 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v85)
                  {
                    objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("chinX"));
                    v86 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v137, "addObject:", v86);

                    objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("chinY"));
                    v87 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v137, "addObject:", v87);

                  }
                }

                ++v75;
                v71 = v141;
              }
              while (v75 < objc_msgSend(v141, "count"));
            }
            objc_msgSend((id)objc_opt_class(), "vectorWithFloats:", v72);
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v129, "setObject:forKeyedSubscript:", v88, CFSTR("inputLeftEyePosition"));

            objc_msgSend((id)objc_opt_class(), "vectorWithFloats:", v73);
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v129, "setObject:forKeyedSubscript:", v89, CFSTR("inputRightEyePosition"));

            objc_msgSend((id)objc_opt_class(), "vectorWithFloats:", v74);
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v129, "setObject:forKeyedSubscript:", v90, CFSTR("inputFaceMidPoint"));

            objc_msgSend((id)objc_opt_class(), "vectorWithFloats:", v137);
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v129, "setObject:forKeyedSubscript:", v91, CFSTR("inputChinPosition"));

            v14 = v123;
          }
          v92 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v92, "setObject:forKeyedSubscript:", v140, CFSTR("inputImage"));
          objc_msgSend(v92, "setObject:forKeyedSubscript:", v135, CFSTR("inputShiftmapImage"));
          objc_msgSend(v14, "auxiliaryImagePropertiesForType:", 2);
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v138, "depthCameraCalibrationData");
          v93 = v14;
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v129, "setObject:forKeyedSubscript:", v94, CFSTR("inputCalibrationData"));

          objc_msgSend(v129, "setObject:forKeyedSubscript:", objc_msgSend(v138, "auxiliaryDataInfoMetadata"), CFSTR("inputAuxDataMetadata"));
          objc_msgSend(MEMORY[0x1E0D52268], "scaleMultiplyOfScalar:", 1.0);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v129, "setObject:forKeyedSubscript:", v95, CFSTR("inputScale"));

          v96 = (void *)objc_opt_class();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v93, "size"));
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          v146[0] = v97;
          v98 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v93, "size");
          objc_msgSend(v98, "numberWithInteger:", v99);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          v146[1] = v100;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v146, 2);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "vectorWithFloats:", v101);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v129, "setObject:forKeyedSubscript:", v102, CFSTR("inputOriginalSize"));

          v49 = v131;
          objc_msgSend(v92, "setObject:forKeyedSubscript:", v131, CFSTR("inputMatteImage"));
          objc_msgSend(v92, "setObject:forKeyedSubscript:", v130, CFSTR("inputHairImage"));
          objc_msgSend(v92, "setObject:forKeyedSubscript:", v133, CFSTR("inputGlassesImage"));
          v103 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D520C8]), "initWithFilterName:settings:inputs:", CFSTR("CIDepthEffectMakeBlurMap"), v129, v92);
          v8 = v127;
          objc_msgSend(v103, "resolvedNodeWithCachedInputs:cache:pipelineState:error:", v92, v127, v10, a5);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v14 = v93;
          v104 = v133;

          v51 = v130;
          v28 = v139;
          goto LABEL_48;
        }
        v33 = (void *)MEMORY[0x1E0D520A0];
        -[PIPortraitNode input](self, "input");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to obtain disparity aux image"), v34, v22);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        v27 = 0;
        v12 = v140;
      }
      else
      {
        v31 = (void *)MEMORY[0x1E0D520A0];
        -[PIPortraitNode input](self, "input");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "missingError:object:", CFSTR("Missing depth data"), v32);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        v27 = 0;
      }
LABEL_51:

      goto LABEL_52;
    }
    v29 = (void *)MEMORY[0x1E0D520A0];
    v30 = CFSTR("Portrait Blur Map does not apply to auxiliary images");
  }
  else
  {
    v29 = (void *)MEMORY[0x1E0D520A0];
    v30 = CFSTR("Portrait Blur Map only applies to images");
  }
  objc_msgSend(v29, "unsupportedError:object:", v30, 0);
  v27 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_54:

  return v27;
}

@end
