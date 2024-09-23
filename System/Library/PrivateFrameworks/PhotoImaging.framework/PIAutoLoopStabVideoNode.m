@implementation PIAutoLoopStabVideoNode

- (PIAutoLoopStabVideoNode)initWithSettings:(id)a3 inputs:(id)a4
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
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_11527);
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
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_11527);
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
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_11527);
  }
}

- (PIAutoLoopStabVideoNode)initWithInput:(id)a3 settings:(id)a4 bakedRecipe:(id)a5
{
  NSDictionary *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  PIAutoLoopStabVideoNode *v13;
  NSDictionary *bakedRecipe;
  objc_super v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = (NSDictionary *)a5;
  v17 = *MEMORY[0x1E0C9E1F8];
  v18[0] = a3;
  v9 = (void *)MEMORY[0x1E0C99D80];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)PIAutoLoopStabVideoNode;
  v13 = -[NURenderNode initWithSettings:inputs:](&v16, sel_initWithSettings_inputs_, v10, v12);

  bakedRecipe = v13->_bakedRecipe;
  v13->_bakedRecipe = v8;

  return v13;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  return 1;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PIAutoLoopStabVideoNode;
  -[NURenderNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](&v10, sel_resolvedNodeWithCachedInputs_settings_pipelineState_error_, a3, a4, a5, a6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    objc_storeStrong((id *)(v7 + 168), self->_bakedRecipe);
  return v8;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
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
  void *v26;
  PIAutoLoopFrameNode *v27;
  void *v28;
  void *v29;
  const __CFDictionary *v30;
  uint64_t v31;
  void *v32;
  PIAutoLoopFrameNode *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  const __CFDictionary *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  const __CFDictionary *v48;
  void *v49;
  PIAutoLoopFrameNode *v50;
  void *v51;
  void *v52;
  char v53;
  NSObject *v54;
  objc_class *v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v65;
  void *v66;
  const void **v67;
  void *specific;
  NSObject *v69;
  _BOOL4 v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  CMTime v86;
  CMTime v87;
  id v88;
  CMTime v89;
  CMTime v90;
  CMTime v91;
  CMTime v92;
  objc_super v93;
  _QWORD v94[2];
  _QWORD v95[2];
  const __CFString *v96;
  void *v97;
  const __CFString *v98;
  void *v99;
  const __CFString *v100;
  void *v101;
  const __CFString *v102;
  PIAutoLoopFrameNode *v103;
  uint8_t v104[16];
  uint64_t v105;
  uint8_t buf[24];
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!a5)
  {
    NUAssertLogger_11492();
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v66;
      _os_log_error_impl(&dword_1A6382000, v65, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v67 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_11492();
    v69 = objc_claimAutoreleasedReturnValue();
    v70 = os_log_type_enabled(v69, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v70)
      {
        v73 = dispatch_get_specific(*v67);
        v74 = (void *)MEMORY[0x1E0CB3978];
        v75 = v73;
        objc_msgSend(v74, "callStackSymbols");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "componentsJoinedByString:", CFSTR("\n"));
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v73;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v77;
        _os_log_error_impl(&dword_1A6382000, v69, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v70)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "componentsJoinedByString:", CFSTR("\n"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v72;
      _os_log_error_impl(&dword_1A6382000, v69, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v10 = v9;
  v11 = objc_msgSend(v9, "evaluationMode");
  if ((v11 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    v12 = v11;
    -[NURenderNode outputImageGeometry:](self, "outputImageGeometry:", a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v35 = 0;
LABEL_39:

      goto LABEL_40;
    }
    v85 = v13;
    -[NURenderNode inputs](self, "inputs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E1F8]);
    v83 = (void *)objc_claimAutoreleasedReturnValue();

    -[PIAutoLoopStabVideoNode bakedRecipe](self, "bakedRecipe");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    memset(buf, 0, sizeof(buf));
    if (!v10 || (objc_msgSend(v10, "time"), (buf[12] & 1) == 0))
    {
      *(_OWORD *)buf = *MEMORY[0x1E0CA2E68];
      *(_QWORD *)&buf[16] = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    }
    *(_OWORD *)v104 = *(_OWORD *)buf;
    v105 = *(_QWORD *)&buf[16];
    PIAutoLoopRecipeGetInstructionAtTime(v15, (uint64_t)v104);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("loopFrameData_frameTransforms"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = v16;
    v18 = (void *)objc_msgSend(v16, "mutableCopy");
    v81 = v15;
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("loopRecipe_stabCropRect"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("loopRecipe_stabCropRect"));

    -[NURenderNode settings](self, "settings");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("cleanAperture"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, CFSTR("cleanAperture"));

    objc_msgSend(v85, "renderScale");
    NUScaleToValue();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v22, CFSTR("videoScale"));

    v84 = v17;
    if (objc_msgSend(v17, "count") == 1)
    {
      v23 = (void *)objc_msgSend(v10, "copy");
      v25 = v82;
      v24 = v83;
      if (v12 == 3)
      {
        objc_msgSend(v10, "videoFrames");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("primary"));
        v27 = (PIAutoLoopFrameNode *)objc_claimAutoreleasedReturnValue();

        if (!v27)
        {
          objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Missing primary video frame"), v10);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_29;
        }
        v102 = CFSTR("video");
        v103 = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v103, &v102, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setVideoFrames:", v28);

      }
      objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("frameTransform_rawTime"));
      v30 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CMTimeMakeFromDictionary(&v92, v30);
      v91 = v92;
      objc_msgSend(v23, "setTime:", &v91);

      objc_msgSend(v83, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v23, a5);
      v31 = objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        v32 = (void *)v31;
        v33 = [PIAutoLoopFrameNode alloc];
        v100 = CFSTR("primary");
        v101 = v32;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v101, &v100, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[NURenderNode initWithSettings:inputs:](v33, "initWithSettings:inputs:", v18, v34);

LABEL_13:
        objc_msgSend(MEMORY[0x1E0D52258], "nodeFromCache:cache:", v27, v8);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setEvaluatedForMode:", objc_msgSend(v10, "evaluationMode"));
LABEL_38:

        v13 = v85;
        goto LABEL_39;
      }

      v27 = 0;
LABEL_29:
      v35 = 0;
      goto LABEL_38;
    }
    if (objc_msgSend(v17, "count") != 2)
    {
      v25 = v82;
      objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:", 1, CFSTR("Unexpected number of frame transforms"), v82);
      v27 = 0;
      v35 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      v24 = v83;
      goto LABEL_38;
    }
    v36 = (void *)objc_msgSend(v10, "copy");
    if (v12 == 3)
    {
      objc_msgSend(v10, "videoFrames");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("primary"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v38)
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Missing primary video frame"), v10);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        v27 = 0;
        v35 = 0;
        v25 = v82;
        v24 = v83;
        goto LABEL_38;
      }
      v98 = CFSTR("video");
      v99 = v38;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v99, &v98, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setVideoFrames:", v39);

    }
    objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("frameTransform_rawTime"));
    v41 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CMTimeMakeFromDictionary(&v90, v41);
    v89 = v90;
    objc_msgSend(v36, "setTime:", &v89);

    v24 = v83;
    objc_msgSend(v83, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v36, a5);
    v42 = objc_claimAutoreleasedReturnValue();
    if (!v42)
    {

      v27 = 0;
      v35 = 0;
      v25 = v82;
      goto LABEL_38;
    }
    v79 = v36;
    v80 = (void *)v42;
    v43 = (void *)objc_msgSend(v10, "copy");
    v25 = v82;
    v78 = v43;
    if (v12 == 3)
    {
      objc_msgSend(v10, "videoFrames");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("secondary"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v45)
      {
        NULogger_11572();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v104 = 138412290;
          *(_QWORD *)&v104[4] = v10;
          _os_log_error_impl(&dword_1A6382000, v54, OS_LOG_TYPE_ERROR, "Missing secondary video frame %@", v104, 0xCu);
        }

        v88 = 0;
        -[PIAutoLoopStabVideoNode _evaluateImageGeometry:](self, "_evaluateImageGeometry:", &v88);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = (objc_class *)MEMORY[0x1E0D52038];
        v56 = v88;
        v57 = [v55 alloc];
        v58 = (void *)MEMORY[0x1E0C9DDC8];
        objc_msgSend(MEMORY[0x1E0C9DD80], "redColor");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "imageWithColor:", v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "scaledExtent");
        objc_msgSend(v60, "imageByCroppingToRect:");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend(v49, "orientation");
        v35 = (void *)objc_msgSend(v57, "initWithImage:settings:orientation:", v61, MEMORY[0x1E0C9AA70], v62);

        v63 = objc_msgSend(v10, "evaluationMode");
        objc_msgSend(v35, "setEvaluatedForMode:", v63);
        v27 = 0;
        v53 = 0;
        v25 = v82;
        v24 = v83;
        goto LABEL_36;
      }
      v96 = CFSTR("video");
      v97 = v45;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setVideoFrames:", v46);

    }
    objc_msgSend(v84, "objectAtIndexedSubscript:", 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("frameTransform_rawTime"));
    v48 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CMTimeMakeFromDictionary(&v87, v48);
    v86 = v87;
    objc_msgSend(v43, "setTime:", &v86);

    objc_msgSend(v83, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v43, a5);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      v50 = [PIAutoLoopFrameNode alloc];
      v94[0] = CFSTR("primary");
      v94[1] = CFSTR("secondary");
      v51 = v80;
      v95[0] = v80;
      v95[1] = v49;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v95, v94, 2);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[NURenderNode initWithSettings:inputs:](v50, "initWithSettings:inputs:", v18, v52);

      v35 = 0;
      v53 = 1;
      goto LABEL_37;
    }
    v27 = 0;
    v53 = 0;
    v35 = 0;
LABEL_36:
    v51 = v80;
LABEL_37:

    if ((v53 & 1) == 0)
      goto LABEL_38;
    goto LABEL_13;
  }
  v93.receiver = self;
  v93.super_class = (Class)PIAutoLoopStabVideoNode;
  -[NURenderNode nodeByReplayingAgainstCache:pipelineState:error:](&v93, sel_nodeByReplayingAgainstCache_pipelineState_error_, v8, v10, a5);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_40:

  return v35;
}

- (id)_evaluateImageGeometry:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v18;
  void *v19;
  const void **v20;
  void *specific;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  _OWORD v31[2];
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_11492();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v19;
      _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v20 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_11492();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v26 = dispatch_get_specific(*v20);
        v27 = (void *)MEMORY[0x1E0CB3978];
        v28 = v26;
        objc_msgSend(v27, "callStackSymbols");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v34 = v26;
        v35 = 2114;
        v36 = v30;
        _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v25;
      _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  -[NURenderNode inputs](self, "inputs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E1F8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0;
  objc_msgSend(v6, "outputImageGeometry:", &v32);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v32;
  if (v7)
  {
    -[PIAutoLoopStabVideoNode bakedRecipe](self, "bakedRecipe");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "orientation");
    v11 = objc_msgSend(v7, "renderScale");
    v13 = v12;
    PIAutoLoopRecipeComputeOutputGeometry(v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc(MEMORY[0x1E0D52170]);
    if (v14)
      objc_msgSend(v14, "extent");
    else
      memset(v31, 0, sizeof(v31));
    v16 = (void *)objc_msgSend(v15, "initWithExtent:renderScale:orientation:spaceMap:roundingPolicy:", v31, v11, v13, v10, 0, 4);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to get input geometry"), self, v8);
    v16 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (id)_evaluateVideoProperties:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFDictionary *v12;
  const __CFDictionary *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  NSObject *v22;
  void *v23;
  const void **v24;
  void *specific;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  CMTime v36;
  CMTime time2;
  CMTime rhs;
  CMTime lhs;
  CMTime time1;
  CMTime v41;
  CMTime v42;
  CMTime v43;
  CMTime v44;
  CMTime buf;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_11492();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v23;
      _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);

    }
    v24 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_11492();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        v30 = dispatch_get_specific(*v24);
        v31 = (void *)MEMORY[0x1E0CB3978];
        v32 = v30;
        objc_msgSend(v31, "callStackSymbols");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v30;
        LOWORD(buf.flags) = 2114;
        *(_QWORD *)((char *)&buf.flags + 2) = v34;
        _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);

      }
    }
    else if (v27)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v29;
      _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  -[NURenderNode inputs](self, "inputs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E1F8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "videoProperties:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    memset(&buf, 0, sizeof(buf));
    objc_msgSend(v7, "livePhotoKeyFrameTime");
    -[PIAutoLoopStabVideoNode bakedRecipe](self, "bakedRecipe");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("loopRecipe_loopParams"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      memset(&v44, 0, sizeof(v44));
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("loopParams_startTime"));
      v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CMTimeMakeFromDictionary(&v44, v12);

      memset(&v43, 0, sizeof(v43));
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("loopParams_duration"));
      v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CMTimeMakeFromDictionary(&v43, v13);

      memset(&v42, 0, sizeof(v42));
      PIAutoLoopRecipeGetFrameDuration(v9, &v42);
      memset(&v41, 0, sizeof(v41));
      lhs = buf;
      rhs = v44;
      CMTimeSubtract(&time1, &lhs, &rhs);
      lhs = v43;
      rhs = v42;
      CMTimeSubtract(&time2, &lhs, &rhs);
      CMTimeMinimum(&v41, &time1, &time2);
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52368]), "initWithProperties:", v8);
      v36 = v41;
      objc_msgSend(v14, "setLivePhotoKeyFrameTime:", &v36);
      -[NURenderNode outputImageGeometry:](self, "outputImageGeometry:", a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        v17 = objc_msgSend(v15, "scaledSize");
        v19 = v18;
        v35[0] = 0;
        v35[1] = 0;
        v35[2] = v17;
        v35[3] = v18;
        objc_msgSend(v14, "setCleanAperture:", v35);
        objc_msgSend(v14, "setSize:", v17, v19);
        v20 = v14;
      }
      else
      {
        v20 = 0;
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Malformed loop recipe, missing loop params"), v9);
      v20 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)_evaluateVideo:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t i;
  void *v15;
  const __CFDictionary *v16;
  const __CFDictionary *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  const __CFDictionary *v23;
  void *v24;
  int v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  const __CFDictionary *v35;
  const __CFDictionary *v36;
  const __CFDictionary *v37;
  void *v38;
  int v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  NSObject *v45;
  void *v46;
  const void **v47;
  void *specific;
  NSObject *v49;
  _BOOL4 v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  id *v60;
  void *v61;
  PIAutoLoopStabVideoNode *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  CMTimeRange v71;
  _BYTE v72[48];
  CMTimeRange rhs;
  CMTimeRange v74;
  id v75;
  CMTime v76;
  CMTimeRange v77;
  CMTimeRange v78;
  id v79;
  CMTime duration;
  CMTime start;
  CMTimeRange v82;
  CMTime v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  CMTimeRange lhs;
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_11492();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(lhs.start.value) = 138543362;
      *(CMTimeValue *)((char *)&lhs.start.value + 4) = (CMTimeValue)v46;
      _os_log_error_impl(&dword_1A6382000, v45, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&lhs, 0xCu);

    }
    v47 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_11492();
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = os_log_type_enabled(v49, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v50)
      {
        v53 = dispatch_get_specific(*v47);
        v54 = (void *)MEMORY[0x1E0CB3978];
        v55 = v53;
        objc_msgSend(v54, "callStackSymbols");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "componentsJoinedByString:", CFSTR("\n"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(lhs.start.value) = 138543618;
        *(CMTimeValue *)((char *)&lhs.start.value + 4) = (CMTimeValue)v53;
        LOWORD(lhs.start.flags) = 2114;
        *(_QWORD *)((char *)&lhs.start.flags + 2) = v57;
        _os_log_error_impl(&dword_1A6382000, v49, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&lhs, 0x16u);

      }
    }
    else if (v50)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "componentsJoinedByString:", CFSTR("\n"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(lhs.start.value) = 138543362;
      *(CMTimeValue *)((char *)&lhs.start.value + 4) = (CMTimeValue)v52;
      _os_log_error_impl(&dword_1A6382000, v49, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&lhs, 0xCu);

    }
    _NUAssertFailHandler();
  }
  -[NURenderNode inputs](self, "inputs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E1F8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "outputVideo:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v41 = 0;
    goto LABEL_38;
  }
  v8 = objc_alloc_init(MEMORY[0x1E0C8B268]);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:", 1, CFSTR("[[AVMutableComposition alloc] init] failed."), self);
    v41 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  v62 = self;
  -[PIAutoLoopStabVideoNode bakedRecipe](self, "bakedRecipe");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D52348], "firstEnabledVideoTrackInAsset:error:", v7, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v41 = 0;
    goto LABEL_36;
  }
  v60 = a3;
  v61 = v7;
  v11 = *MEMORY[0x1E0C8A808];
  objc_msgSend(v8, "addMutableTrackWithMediaType:preferredTrackID:", *MEMORY[0x1E0C8A808], 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addMutableTrackWithMediaType:preferredTrackID:", v11, 1);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v9;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("loopRecipe_frameInstructions"));
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v66 = v12;
  v64 = v13;
  v69 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v84, v89, 16);
  if (!v69)
    goto LABEL_19;
  v68 = *(_QWORD *)v85;
  v58 = v8;
  v59 = v6;
  while (2)
  {
    for (i = 0; i != v69; ++i)
    {
      if (*(_QWORD *)v85 != v68)
        objc_enumerationMutation(v13);
      v15 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
      memset(&lhs, 0, 24);
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("loopFrameData_presTime"));
      v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CMTimeMakeFromDictionary(&lhs.start, v16);

      memset(&rhs, 0, 24);
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("loopFrameData_presDur"));
      v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CMTimeMakeFromDictionary(&rhs.start, v17);

      memset(&v71, 0, 24);
      CMTimeMake(&v71.start, 1, rhs.start.timescale);
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("loopFrameData_frameTransforms"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "count") != 1 && objc_msgSend(v18, "count") != 2)
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:", 1, CFSTR("Unexpected number of frame transforms"), v18);
        *v60 = (id)objc_claimAutoreleasedReturnValue();

        v41 = 0;
        v29 = v13;
        v8 = v58;
        v6 = v59;
        v7 = v61;
        goto LABEL_29;
      }
      objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      memset(&v83, 0, sizeof(v83));
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("frameTransform_rawTime"));
      v20 = objc_claimAutoreleasedReturnValue();
      CMTimeMakeFromDictionary(&v83, (CFDictionaryRef)v20);

      start = v83;
      duration = v71.start;
      CMTimeRangeMake(&v82, &start, &duration);
      v79 = 0;
      start = lhs.start;
      LOBYTE(v20) = objc_msgSend(v12, "insertTimeRange:ofTrack:atTime:error:", &v82, v10, &start, &v79);
      v21 = v79;
      if ((v20 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to update video track"), v62, v21);
        *v60 = (id)objc_claimAutoreleasedReturnValue();
        v42 = v65;
        goto LABEL_31;
      }
      start = lhs.start;
      duration = v71.start;
      CMTimeRangeMake(&v78, &start, &duration);
      start = rhs.start;
      objc_msgSend(v12, "scaleTimeRange:toDuration:", &v78, &start);
      if (objc_msgSend(v18, "count") == 2)
      {
        v67 = v19;
        objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        memset(&start, 0, sizeof(start));
        objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("frameTransform_rawTime"));
        v23 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        CMTimeMakeFromDictionary(&start, v23);

        duration = start;
        v76 = v71.start;
        CMTimeRangeMake(&v77, &duration, &v76);
        v75 = v21;
        duration = lhs.start;
        v24 = v10;
        v25 = objc_msgSend(v65, "insertTimeRange:ofTrack:atTime:error:", &v77, v10, &duration, &v75);
        v26 = v75;

        if (v25)
        {
          duration = lhs.start;
          v76 = v71.start;
          CMTimeRangeMake(&v74, &duration, &v76);
          duration = rhs.start;
          objc_msgSend(v65, "scaleTimeRange:toDuration:", &v74, &duration);

          v10 = v24;
          v12 = v66;
          v19 = v67;
          v13 = v64;
          goto LABEL_17;
        }
        objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to update video track"), v62, v26);
        *v60 = (id)objc_claimAutoreleasedReturnValue();

        v21 = v26;
        v10 = v24;
        v42 = v65;
        v19 = v67;
LABEL_31:

        v41 = 0;
        v43 = v64;
        v29 = v64;
        v8 = v58;
        v6 = v59;
        v7 = v61;
        goto LABEL_35;
      }
      v26 = v21;
LABEL_17:

    }
    v8 = v58;
    v6 = v59;
    v69 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v84, v89, 16);
    if (v69)
      continue;
    break;
  }
LABEL_19:

  v27 = *MEMORY[0x1E0C8A7A0];
  v7 = v61;
  objc_msgSend(v61, "tracksWithMediaType:", *MEMORY[0x1E0C8A7A0]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "firstObject");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    v30 = v10;
    v31 = v8;
    objc_msgSend(v8, "addMutableTrackWithMediaType:preferredTrackID:", v27, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("loopRecipe_loopParams"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      v34 = v33;
      memset(&v83, 0, sizeof(v83));
      objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("loopParams_duration"));
      v35 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CMTimeMakeFromDictionary(&v83, v35);

      memset(&start, 0, sizeof(start));
      objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("loopParams_fadeLen"));
      v36 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CMTimeMakeFromDictionary(&start, v36);

      memset(&duration, 0, sizeof(duration));
      objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("loopParams_startTime"));
      v37 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CMTimeMakeFromDictionary(&duration, v37);

      memset(&v76, 0, sizeof(v76));
      lhs.start = duration;
      rhs.start = start;
      CMTimeAdd(&v76, &lhs.start, &rhs.start);
      memset(&lhs, 0, sizeof(lhs));
      rhs.start = v76;
      v71.start = v83;
      CMTimeRangeMake(&lhs, &rhs.start, &v71.start);
      v38 = (void *)MEMORY[0x1E0D52348];
      objc_msgSend(v29, "timeRange");
      v71 = lhs;
      objc_msgSend(v38, "conformRange:inRange:", &v71, v72);
      lhs = rhs;
      v70 = 0;
      *(_OWORD *)&v71.start.value = *MEMORY[0x1E0CA2E68];
      v71.start.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
      v39 = objc_msgSend(v32, "insertTimeRange:ofTrack:atTime:error:", &rhs, v29, &v71, &v70);
      v40 = v70;
      if (v39)
      {
        objc_msgSend(v32, "setNaturalTimeScale:", objc_msgSend(v29, "naturalTimeScale"));

        v8 = v31;
        v10 = v30;
        v13 = v64;
        goto LABEL_23;
      }
      objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to update audio track"), v62, v40);
      *v60 = (id)objc_claimAutoreleasedReturnValue();

      v41 = 0;
      v8 = v31;
      v9 = v63;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Malformed loop recipe, missing loop params"), v63);
      *v60 = (id)objc_claimAutoreleasedReturnValue();

      v41 = 0;
      v9 = v63;
    }
    v10 = v30;
    v43 = v64;
    v42 = v65;
  }
  else
  {
LABEL_23:
    v41 = v8;
LABEL_29:
    v9 = v63;
    v43 = v13;
    v42 = v65;
  }
LABEL_35:

LABEL_36:
LABEL_37:

LABEL_38:
  return v41;
}

- (BOOL)requiresVideoComposition
{
  return 1;
}

- (id)_evaluateVideoComposition:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFDictionary *v17;
  const __CFDictionary *v18;
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
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  const __CFDictionary *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v46;
  void *v47;
  const void **v48;
  void *specific;
  NSObject *v50;
  _BOOL4 v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  CMTime v64;
  CMTimeRange v65;
  CMTimeRange v66;
  CMTimeRange v67;
  CMTimeRange v68;
  CMTime rhs;
  CMTime lhs;
  CMTime v71;
  CMTime v72;
  _QWORD v73[2];
  _QWORD v74[2];
  _QWORD v75[2];
  CMTime v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_11492();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v76.value) = 138543362;
      *(CMTimeValue *)((char *)&v76.value + 4) = (CMTimeValue)v47;
      _os_log_error_impl(&dword_1A6382000, v46, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v76, 0xCu);

    }
    v48 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_11492();
    v50 = objc_claimAutoreleasedReturnValue();
    v51 = os_log_type_enabled(v50, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v51)
      {
        v54 = dispatch_get_specific(*v48);
        v55 = (void *)MEMORY[0x1E0CB3978];
        v56 = v54;
        objc_msgSend(v55, "callStackSymbols");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "componentsJoinedByString:", CFSTR("\n"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v76.value) = 138543618;
        *(CMTimeValue *)((char *)&v76.value + 4) = (CMTimeValue)v54;
        LOWORD(v76.flags) = 2114;
        *(_QWORD *)((char *)&v76.flags + 2) = v58;
        _os_log_error_impl(&dword_1A6382000, v50, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v76, 0x16u);

      }
    }
    else if (v51)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "componentsJoinedByString:", CFSTR("\n"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v76.value) = 138543362;
      *(CMTimeValue *)((char *)&v76.value + 4) = (CMTimeValue)v53;
      _os_log_error_impl(&dword_1A6382000, v50, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v76, 0xCu);

    }
    _NUAssertFailHandler();
  }
  -[NURenderNode outputVideo:](self, "outputVideo:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "tracksWithMediaType:", *MEMORY[0x1E0C8A808]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NURenderNode inputs](self, "inputs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E1F8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "outputVideoComposition:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "instructions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v13 == 1)
      {
        -[PIAutoLoopStabVideoNode bakedRecipe](self, "bakedRecipe");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("loopRecipe_loopParams"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          memset(&v76, 0, sizeof(v76));
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("loopParams_duration"));
          v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          CMTimeMakeFromDictionary(&v76, v17);

          memset(&v72, 0, sizeof(v72));
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("loopParams_fadeLen"));
          v18 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          CMTimeMakeFromDictionary(&v72, v18);

          memset(&v71, 0, sizeof(v71));
          lhs = v76;
          rhs = v72;
          CMTimeSubtract(&v71, &lhs, &rhs);
          objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_alloc_init(MEMORY[0x1E0D52310]);
          lhs = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
          rhs = v71;
          CMTimeRangeMake(&v68, &lhs, &rhs);
          v67 = v68;
          v61 = v7;
          v60 = v9;
          v22 = v21;
          objc_msgSend(v21, "setTimeRange:", &v67);
          v62 = v16;
          v23 = v19;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v19, "trackID"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v75[0] = v24;
          v63 = v14;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v20, "trackID"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v75[1] = v25;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 2);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setRequiredSourceTrackIDs:", v26);

          v27 = v23;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v23, "trackID"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = v61;
          objc_msgSend(v22, "setSourceIdentifier:forTrackID:", CFSTR("primary"), v28);

          v29 = v20;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v20, "trackID"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setSourceIdentifier:forTrackID:", CFSTR("secondary"), v30);

          v31 = objc_alloc_init(MEMORY[0x1E0D52310]);
          lhs = v71;
          rhs = v72;
          CMTimeRangeMake(&v66, &lhs, &rhs);
          v65 = v66;
          objc_msgSend(v31, "setTimeRange:", &v65);
          v32 = v27;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v27, "trackID"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v74[0] = v33;
          v59 = v29;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v29, "trackID"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v74[1] = v34;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 2);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setRequiredSourceTrackIDs:", v35);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v32, "trackID"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setSourceIdentifier:forTrackID:", CFSTR("primary"), v36);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v29, "trackID"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setSourceIdentifier:forTrackID:", CFSTR("secondary"), v37);

          v38 = objc_alloc_init(MEMORY[0x1E0C8B288]);
          objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("loopRecipe_frameInstructions"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "firstObject");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          memset(&lhs, 0, sizeof(lhs));
          objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("loopFrameData_presDur"));
          v41 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          CMTimeMakeFromDictionary(&lhs, v41);

          v64 = lhs;
          objc_msgSend(v38, "setFrameDuration:", &v64);
          v73[0] = v22;
          v73[1] = v31;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 2);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setInstructions:", v42);

          v16 = v62;
          v14 = v63;

          v9 = v60;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Malformed loop recipe, missing loop params"), v14);
          v38 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_12;
      }
      v43 = (void *)MEMORY[0x1E0D520A0];
      objc_msgSend(v11, "instructions");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "unsupportedError:object:", CFSTR("Unsupported video configuration"), v44);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    v38 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v38 = 0;
LABEL_13:

  return v38;
}

- (BOOL)requiresAudioMix
{
  return 0;
}

- (NSDictionary)bakedRecipe
{
  return self->_bakedRecipe;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bakedRecipe, 0);
}

+ (id)nodeWithInput:(id)a3 recipe:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  id v8;
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
  void *v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  _QWORD v27[4];
  _QWORD v28[2];
  _QWORD v29[4];

  v29[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0D52090]);
  objc_msgSend(v7, "nu_updateDigest:", v8);
  objc_msgSend(v8, "stringValue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "videoProperties:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v9, "cleanAperture");
    v29[0] = v23;
    v28[0] = CFSTR("recipeDigest");
    v28[1] = CFSTR("cleanAperture");
    v26[0] = CFSTR("x");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (_QWORD)v24);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v11;
    v26[1] = CFSTR("y");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *((_QWORD *)&v24 + 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v12;
    v26[2] = CFSTR("w");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (_QWORD)v25);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v13;
    v26[3] = CFSTR("h");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *((_QWORD *)&v25 + 1));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27[3] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    PIAutoLoopRecipeForFlavor(v7, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");

    v19 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInput:settings:bakedRecipe:", v6, v16, v18);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

@end
