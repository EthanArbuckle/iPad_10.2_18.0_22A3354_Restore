@implementation PIVideoReframeNode

- (PIVideoReframeNode)initWithKeyframes:(id)a3 stabCropRect:(id *)a4 input:(id)a5
{
  id v9;
  id v10;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  PITimeVaryingPipelineStateSetting *v12;
  void *v13;
  void *v14;
  PIVideoReframeNode *v15;
  PIReframeKeyframeSequence *v16;
  $0AC6E346AE4835514AAA8AC86D8F4844 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  _OWORD v26[2];
  objc_super v27;
  $0AC6E346AE4835514AAA8AC86D8F4844 var0;
  $0AC6E346AE4835514AAA8AC86D8F4844 v29;
  uint64_t v30;
  id v31;
  const __CFString *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  var1 = a4->var1;
  var0 = a4->var0;
  v29 = var1;
  if (NUPixelRectIsEmpty())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PIVideoReframeNode.m"), 62, CFSTR("invalid crop rect"));

  }
  v32 = CFSTR("pipelineState");
  v12 = objc_alloc_init(PITimeVaryingPipelineStateSetting);
  v33[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = *MEMORY[0x1E0C9E1F8];
  v31 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27.receiver = self;
  v27.super_class = (Class)PIVideoReframeNode;
  v15 = -[NURenderNode initWithSettings:inputs:](&v27, sel_initWithSettings_inputs_, v13, v14);
  if (v15)
  {
    v16 = -[PIReframeKeyframeSequence initWithKeyframeArray:]([PIReframeKeyframeSequence alloc], "initWithKeyframeArray:", v9);
    -[PIVideoReframeNode setKeyframeSequence:](v15, "setKeyframeSequence:", v16);

    v17 = a4->var1;
    v26[0] = a4->var0;
    v26[1] = v17;
    -[PIVideoReframeNode setStabCropRect:](v15, "setStabCropRect:", v26);
    if (NUIsAppleInternal())
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "dictionaryForKey:", CFSTR("PURootSettings"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "objectForKey:", CFSTR("PXSettingsArchiveKey"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "objectForKey:", CFSTR("photoEditingSettings"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "objectForKey:", CFSTR("showStabilizationWatermark"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(v21, "objectForKey:", CFSTR("showStabilizationWatermark"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v22) = objc_msgSend(v23, "BOOLValue");

      }
      v15->_shouldApplyWatermark = (char)v22;
    }
  }

  return v15;
}

- (PIVideoReframeNode)initWithSettings:(id)a3 inputs:(id)a4
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
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_109);
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
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_109);
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
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_109);
  }
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "evaluationMode");
  return (v3 < 4) & (0xBu >> (v3 & 0xF));
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  $5BB7312FFE32F1AB3F1F5957C99A58B3 size;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  _OWORD v19[2];
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PIVideoReframeNode;
  -[NURenderNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](&v20, sel_resolvedNodeWithCachedInputs_settings_pipelineState_error_, a3, a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderNode inputs](self, "inputs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E1F8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "videoProperties:", a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[NURenderNode outputVideoComposition:](self, "outputVideoComposition:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v8, "setKeyframeSequence:", self->_keyframeSequence);
    size = self->_stabCropRect.size;
    v19[0] = self->_stabCropRect.origin;
    v19[1] = size;
    objc_msgSend(v8, "setStabCropRect:", v19);
    objc_msgSend(v8, "setShouldApplyWatermark:", self->_shouldApplyWatermark);
    objc_msgSend(v8, "setInputVideoProperties:", v11);
    if (v12)
    {
      objc_msgSend(v12, "frameDuration");
    }
    else
    {
      v17 = 0uLL;
      v18 = 0;
    }
    v15 = v17;
    v16 = v18;
    objc_msgSend(v8, "setFrameDuration:", &v15);
  }

  return v8;
}

- (BOOL)requiresVideoComposition
{
  return 1;
}

- (id)_evaluateVideoProperties:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v15;
  void *v16;
  const void **v17;
  void *specific;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_19395();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v16;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v17 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_19395();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        v23 = dispatch_get_specific(*v17);
        v24 = (void *)MEMORY[0x1E0CB3978];
        v25 = v23;
        objc_msgSend(v24, "callStackSymbols");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v23;
        v31 = 2114;
        v32 = v27;
        _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v22;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  -[NURenderNode inputs](self, "inputs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E1F8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "videoProperties:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[NURenderNode outputImageGeometry:](self, "outputImageGeometry:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = objc_msgSend(v8, "scaledSize");
      v12 = v11;
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52368]), "initWithProperties:", v7);
      v28[0] = 0;
      v28[1] = 0;
      v28[2] = v10;
      v28[3] = v12;
      objc_msgSend(v13, "setCleanAperture:", v28);
      objc_msgSend(v13, "setSize:", v10, v12);
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_evaluateImageGeometry:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v16;
  void *v17;
  const void **v18;
  void *specific;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  _OWORD v29[2];
  id v30;
  uint8_t buf[40];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_19395();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v17;
      _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v18 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_19395();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v24 = dispatch_get_specific(*v18);
        v25 = (void *)MEMORY[0x1E0CB3978];
        v26 = v24;
        objc_msgSend(v25, "callStackSymbols");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v24;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v28;
        _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v23;
      _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  -[NURenderNode inputs](self, "inputs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E1F8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0;
  objc_msgSend(v6, "outputImageGeometry:", &v30);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v30;
  if (v7)
  {
    memset(buf, 0, 32);
    -[PIVideoReframeNode stabCropRect](self, "stabCropRect");
    *(_OWORD *)buf = *MEMORY[0x1E0D51E30];
    v9 = objc_alloc(MEMORY[0x1E0D52170]);
    v10 = objc_msgSend(v7, "renderScale");
    v12 = v11;
    v13 = objc_msgSend(v7, "orientation");
    v29[0] = *(_OWORD *)buf;
    v29[1] = *(_OWORD *)&buf[16];
    v14 = (void *)objc_msgSend(v9, "initWithExtent:renderScale:orientation:", v29, v10, v12, v13);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to get input geometry"), self, v8);
    v14 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (BOOL)canPropagateOriginalLivePhotoMetadataTrack
{
  return 0;
}

- (id)_evaluateImage:(id *)a3
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
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
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  uint32x4_t v36;
  uint64_t v37;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  __int128 v42;
  uint64_t v43;
  __int128 v44;
  uint64_t v45;
  id v46;
  id v47;
  id v48;

  -[NURenderNode inputForKey:](self, "inputForKey:", *MEMORY[0x1E0C9E1F8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  objc_msgSend(v5, "outputImage:", &v48);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v48;
  if (v6)
  {
    v47 = 0;
    -[NURenderNode outputImageGeometry:](self, "outputImageGeometry:", &v47);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v47;

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Could not get the input geometry"), self, v9);
      v13 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      v7 = v9;
LABEL_18:

      goto LABEL_19;
    }
    v46 = 0;
    -[NURenderNode imageProperties:](self, "imageProperties:", &v46);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v46;

    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Could not get the input image properties"), self, v7);
      v13 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

      goto LABEL_18;
    }
    -[NURenderNode settings](self, "settings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("pipelineState"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = 0uLL;
    v45 = 0;
    if (v12)
    {
      objc_msgSend(v12, "rawTime");
      if ((BYTE12(v44) & 1) != 0)
      {
LABEL_12:
        -[PIVideoReframeNode inputVideoProperties](self, "inputVideoProperties");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
          objc_msgSend(v14, "cleanAperture");
        NUPixelRectToCGRect();
        v17 = v16;
        v19 = v18;
        v21 = v20;
        v23 = v22;

        -[PIVideoReframeNode stabCropRect](self, "stabCropRect");
        NUPixelRectToCGRect();
        v25 = v24;
        v27 = v26;
        v29 = v28;
        v31 = v30;
        -[PIVideoReframeNode keyframeSequence](self, "keyframeSequence");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v44;
        v43 = v45;
        objc_msgSend(v32, "homographyAtTime:", &v42);
        v33.i32[3] = 0;
        v34.i32[3] = 0;
        v39 = v34;
        v40 = v33;
        v35.i32[3] = 0;
        v41 = v35;

        v36 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(v40, *MEMORY[0x1E0C83FE8]), (int8x16_t)vceqq_f32(v39, *(float32x4_t *)(MEMORY[0x1E0C83FE8] + 16))), (int8x16_t)vceqq_f32(v41, *(float32x4_t *)(MEMORY[0x1E0C83FE8] + 32)));
        v36.i32[3] = v36.i32[2];
        if ((vminvq_u32(v36) & 0x80000000) == 0)
        {
          -[PIVideoReframeNode _stabilizeImage:cleanRect:cropRect:transform:geometry:](self, "_stabilizeImage:cleanRect:cropRect:transform:geometry:", v6, v8, v17, v19, v21, v23, v25, v27, v29, v31, *(_OWORD *)&v40, *(_OWORD *)&v39, *(_OWORD *)&v41);
          v37 = objc_claimAutoreleasedReturnValue();

          v6 = (id)v37;
        }
        v6 = v6;

        v13 = v6;
        goto LABEL_17;
      }
      objc_msgSend(v12, "time");
    }
    else
    {
      v42 = 0uLL;
      v43 = 0;
    }
    v44 = v42;
    v45 = v43;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Could not get the input image"), self, v7);
  v13 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v13;
}

- (id)_stabilizeImage:(void *)a3 cleanRect:(void *)a4 cropRect:(uint64_t)a5 transform:(uint64_t)a6 geometry:(uint64_t)a7
{
  id v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double MinX;
  double MaxY;
  double MaxX;
  double v25;
  double v26;
  double MinY;
  double v28;
  CGFloat v29;
  float v30;
  float v31;
  int32x4_t v32;
  float64x2_t v33;
  float v34;
  int32x4_t v35;
  float v36;
  int32x4_t v37;
  int32x4_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  float64x2_t v56;
  float64x2_t v57;
  float64x2_t v58;
  double v59;
  CGAffineTransform v60;
  CGAffineTransform v61;
  _QWORD v62[4];
  _QWORD v63[5];
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  v63[4] = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a3;
  objc_msgSend(v13, "renderScale");
  NUScaleToDouble();
  v59 = v15;
  NUScaleRect();
  v17 = v16;
  v19 = v18;
  objc_msgSend(v14, "imageByCroppingToRect:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  CGAffineTransformMakeTranslation(&v61, -v17, -v19);
  objc_msgSend(v20, "imageByApplyingTransform:", &v61);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "extent");
  MinX = CGRectGetMinX(v64);
  objc_msgSend(v21, "extent");
  MaxY = CGRectGetMaxY(v65);
  objc_msgSend(v21, "extent");
  MaxX = CGRectGetMaxX(v66);
  objc_msgSend(v21, "extent");
  v25 = CGRectGetMaxY(v67);
  objc_msgSend(v21, "extent");
  v26 = CGRectGetMinX(v68);
  objc_msgSend(v21, "extent");
  MinY = CGRectGetMinY(v69);
  objc_msgSend(v21, "extent");
  v28 = CGRectGetMaxX(v70);
  objc_msgSend(v21, "extent");
  v29 = CGRectGetMinY(v71);
  v30 = MinX / v59;
  v31 = MaxY / v59;
  v32 = (int32x4_t)vaddq_f32(a11, vmlaq_n_f32(vmulq_n_f32(a9, v30), a10, v31));
  v33 = vmulq_n_f64(vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v32.i8, (float32x2_t)vdup_laneq_s32(v32, 2))), v59);
  *(float *)v32.i32 = MaxX / v59;
  v34 = v25 / v59;
  v35 = (int32x4_t)vaddq_f32(a11, vmlaq_n_f32(vmulq_n_f32(a9, *(float *)v32.i32), a10, v34));
  v57 = vmulq_n_f64(vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v35.i8, (float32x2_t)vdup_laneq_s32(v35, 2))), v59);
  *(float *)v35.i32 = v26 / v59;
  v36 = MinY / v59;
  v37 = (int32x4_t)vaddq_f32(a11, vmlaq_n_f32(vmulq_n_f32(a9, *(float *)v35.i32), a10, v36));
  v56 = vmulq_n_f64(vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v37.i8, (float32x2_t)vdup_laneq_s32(v37, 2))), v59);
  *(float *)v37.i32 = v28 / v59;
  *(float *)&v29 = v29 / v59;
  v38 = (int32x4_t)vaddq_f32(a11, vmlaq_n_f32(vmulq_n_f32(a9, *(float *)v37.i32), a10, *(float *)&v29));
  v58 = vmulq_n_f64(vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v38.i8, (float32x2_t)vdup_laneq_s32(v38, 2))), v59);
  v62[0] = CFSTR("inputTopLeft");
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithCGPoint:", *(_OWORD *)&v33);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v39;
  v62[1] = CFSTR("inputTopRight");
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithCGPoint:", *(_OWORD *)&v57);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v63[1] = v40;
  v62[2] = CFSTR("inputBottomLeft");
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithCGPoint:", *(_OWORD *)&v56);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v63[2] = v41;
  v62[3] = CFSTR("inputBottomRight");
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithCGPoint:", *(_OWORD *)&v58);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v63[3] = v42;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 4);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "imageByApplyingFilter:withInputParameters:", CFSTR("CIPerspectiveTransform"), v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  NUScaleRect();
  v46 = v45;
  v48 = v47;
  v49 = objc_msgSend(v13, "scaledSize");
  v51 = v50;

  objc_msgSend(v44, "imageByCroppingToRect:", v46, v48, (double)v49, (double)v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  CGAffineTransformMakeTranslation(&v60, -v46, -v48);
  objc_msgSend(v52, "imageByApplyingTransform:", &v60);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 168))
  {
    objc_msgSend(v53, "pi_imageByApplyingStabilizationWatermark");
    v54 = objc_claimAutoreleasedReturnValue();

    v53 = (void *)v54;
  }

  return v53;
}

- (PIReframeKeyframeSequence)keyframeSequence
{
  return self->_keyframeSequence;
}

- (void)setKeyframeSequence:(id)a3
{
  objc_storeStrong((id *)&self->_keyframeSequence, a3);
}

- ($B5E4F2499D3E0A90C7E8AF059312C337)stabCropRect
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v3;

  v3 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self[7].var0.var1;
  retstr->var0 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self[6].var1.var1;
  retstr->var1 = v3;
  return self;
}

- (void)setStabCropRect:(id *)a3
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;

  var1 = a3->var1;
  self->_stabCropRect.origin = ($86B46DF249C2B4242DBB096758D29184)a3->var0;
  self->_stabCropRect.size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)var1;
}

- (NUVideoProperties)inputVideoProperties
{
  return self->_inputVideoProperties;
}

- (void)setInputVideoProperties:(id)a3
{
  objc_storeStrong((id *)&self->_inputVideoProperties, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[8];
  return self;
}

- (void)setFrameDuration:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_frameDuration.value = *(_OWORD *)&a3->var0;
  self->_frameDuration.epoch = var3;
}

- (BOOL)shouldApplyWatermark
{
  return self->_shouldApplyWatermark;
}

- (void)setShouldApplyWatermark:(BOOL)a3
{
  self->_shouldApplyWatermark = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputVideoProperties, 0);
  objc_storeStrong((id *)&self->_keyframeSequence, 0);
}

@end
