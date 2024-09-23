@implementation PIRetouchCompositeNode

- (PIRetouchCompositeNode)initWithSettings:(id)a3 inputs:(id)a4
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
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_223_4613);
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
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_223_4613);
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
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_223_4613);
  }
}

- (PIRetouchCompositeNode)initWithScale:(id)a3 sampleMode:(int64_t)a4 input:(id)a5 retouch:(id)a6
{
  int64_t var1;
  int64_t var0;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  PIRetouchCompositeNode *v18;
  NSObject *v20;
  const void **v21;
  const void **v22;
  void *specific;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  NSObject *v27;
  const void **v28;
  void *v29;
  int v30;
  void *v31;
  const void **v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  objc_super v42;
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[3];
  _QWORD v46[3];
  uint8_t buf[4];
  const void **v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  var1 = a3.var1;
  var0 = a3.var0;
  v51 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a6;
  if ((NUScaleIsValid() & 1) == 0)
  {
    NUAssertLogger_4602();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "NUScaleIsValid(scale)");
      v21 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v21;
      _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v22 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_4602();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        v33 = dispatch_get_specific(*v22);
        v34 = (void *)MEMORY[0x1E0CB3978];
        v35 = v33;
        objc_msgSend(v34, "callStackSymbols");
        v22 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v48 = (const void **)v33;
        v49 = 2114;
        v50 = v36;
        _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v25)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
      v22 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v22;
      _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v30 = _NUAssertFailHandler();
    goto LABEL_17;
  }
  if (!a4)
  {
    NUAssertLogger_4602();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "sampleMode != NUSampleModeDefault");
      v28 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v28;
      _os_log_error_impl(&dword_1A6382000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v22 = (const void **)MEMORY[0x1E0D51D48];
    v29 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_4602();
    v24 = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (!v29)
    {
      if (v30)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
        v32 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v48 = v32;
        _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_19;
    }
LABEL_17:
    if (v30)
    {
      v37 = dispatch_get_specific(*v22);
      v38 = (void *)MEMORY[0x1E0CB3978];
      v39 = v37;
      objc_msgSend(v38, "callStackSymbols");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "componentsJoinedByString:", CFSTR("\n"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v48 = (const void **)v37;
      v49 = 2114;
      v50 = v41;
      _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_19:

    _NUAssertFailHandler();
  }
  v45[0] = CFSTR("scale");
  NUScaleToString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v13;
  v45[1] = CFSTR("sampleMode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = CFSTR("__dominantInputSettingsKey");
  v15 = *MEMORY[0x1E0C9E190];
  v46[1] = v14;
  v46[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v43[0] = *MEMORY[0x1E0C9E1F8];
  v43[1] = v15;
  v44[0] = v12;
  v44[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v42.receiver = self;
  v42.super_class = (Class)PIRetouchCompositeNode;
  v18 = -[NURenderNode initWithSettings:inputs:](&v42, sel_initWithSettings_inputs_, v16, v17);
  v18->_scale.numerator = var0;
  v18->_scale.denominator = var1;
  v18->_sampleMode = a4;

  return v18;
}

- (NURenderNode)inputNode
{
  void *v2;
  void *v3;

  -[NURenderNode inputs](self, "inputs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E190]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NURenderNode *)v3;
}

- (PIRetouchCacheNode)retouchNode
{
  void *v2;
  void *v3;

  -[NURenderNode inputs](self, "inputs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E1F8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PIRetouchCacheNode *)v3;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  return (unint64_t)objc_msgSend(a3, "evaluationMode") < 2;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PIRetouchCompositeNode;
  -[NURenderNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](&v9, sel_resolvedNodeWithCachedInputs_settings_pipelineState_error_, a3, a4, a5, a6);
  v7 = objc_claimAutoreleasedReturnValue();
  *($F9703ADC4DD3124DE91DE417D7636CC9 *)(v7 + 168) = self->_scale;
  *(_QWORD *)(v7 + 184) = self->_sampleMode;
  return (id)v7;
}

- (id)_evaluateImage:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t numerator;
  int64_t denominator;
  double v12;
  CGFloat v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  uint64_t (*v25)(uint64_t, uint64_t);
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id result;
  NSObject *v36;
  void *v37;
  const void **v38;
  void *specific;
  NSObject *v40;
  _BOOL4 v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  int64_t v51;
  int64_t v52;
  void *v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  uint64_t v55;
  void *v56;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  _BYTE *v61;
  int64_t v62;
  int64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  CGAffineTransform v69;
  _BYTE buf[24];
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  _QWORD v77[4];

  v77[1] = *MEMORY[0x1E0C80C00];
  -[PIRetouchCompositeNode retouchNode](self, "retouchNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outputImage:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "outputImageGeometry:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[PIRetouchCompositeNode inputNode](self, "inputNode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "outputImage:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v8, "outputImageGeometry:", a3);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        if (v56)
        {
          numerator = self->_scale.numerator;
          denominator = self->_scale.denominator;
          NUScaleToDouble();
          v13 = v12;
          v51 = denominator;
          v52 = numerator;
          if ((NUScaleEqual() & 1) == 0)
          {
            switch(self->_sampleMode)
            {
              case 0:
                NUAssertLogger_4602();
                v36 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unspecified sample mode"));
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  *(_QWORD *)&buf[4] = v37;
                  _os_log_error_impl(&dword_1A6382000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

                }
                v38 = (const void **)MEMORY[0x1E0D51D48];
                specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
                NUAssertLogger_4602();
                v40 = objc_claimAutoreleasedReturnValue();
                v41 = os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);
                if (specific)
                {
                  if (v41)
                  {
                    v44 = dispatch_get_specific(*v38);
                    v45 = (void *)MEMORY[0x1E0CB3978];
                    v46 = v44;
                    objc_msgSend(v45, "callStackSymbols");
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v47, "componentsJoinedByString:", CFSTR("\n"));
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    *(_QWORD *)&buf[4] = v44;
                    *(_WORD *)&buf[12] = 2114;
                    *(_QWORD *)&buf[14] = v48;
                    _os_log_error_impl(&dword_1A6382000, v40, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

                  }
                }
                else if (v41)
                {
                  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v42, "componentsJoinedByString:", CFSTR("\n"));
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  *(_QWORD *)&buf[4] = v43;
                  _os_log_error_impl(&dword_1A6382000, v40, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

                }
                _NUAssertFailHandler();
                __break(1u);
                return result;
              case 1:
                objc_msgSend(v6, "imageBySamplingNearest");
                v17 = objc_claimAutoreleasedReturnValue();

                v6 = (id)v17;
                goto LABEL_13;
              case 2:
LABEL_13:
                v18 = (void *)MEMORY[0x1E0C9DDB8];
                v74 = *MEMORY[0x1E0C9E280];
                v19 = (void *)MEMORY[0x1E0CB3478];
                CGAffineTransformMakeScale(&v69, v13, v13);
                objc_msgSend(v19, "nu_transformWithCGAffineTransform:", &v69);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v75 = v20;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "filterWithName:withInputParameters:", CFSTR("CIAffineTransform"), v21);
                v50 = objc_claimAutoreleasedReturnValue();
                goto LABEL_15;
              case 3:
                v22 = (void *)MEMORY[0x1E0C9DDB8];
                v76 = *MEMORY[0x1E0C9E268];
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v77[0] = v20;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, &v76, 1);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "filterWithName:withInputParameters:", CFSTR("CILanczosScaleTransform"), v21);
                v50 = objc_claimAutoreleasedReturnValue();
LABEL_15:

                v14 = objc_msgSend(v7, "scaledSize", v50);
                goto LABEL_16;
              default:
                break;
            }
          }
          v14 = objc_msgSend(v7, "scaledSize", 0);
LABEL_16:
          v54 = v15;
          v55 = v14;
          v23 = objc_msgSend(v56, "scaledSize");
          v25 = v24;
          objc_msgSend(v5, "outputRegion");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = 0;
          *(_QWORD *)&buf[16] = v55;
          v71 = v54;
          objc_msgSend(v26, "regionByFlippingInRect:", buf);
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v53, "regionByScalingBy:withRounding:", 0, v13, v13);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = 0;
          *(_QWORD *)&buf[16] = v23;
          v71 = v25;
          objc_msgSend(v27, "regionByClippingToRect:", buf);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v29 = objc_msgSend(v5, "padding");
          v30 = vcvtpd_s64_f64(v13 * (double)v29);
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = 0;
          *(_QWORD *)&buf[16] = v23;
          v71 = v25;
          objc_msgSend(v28, "regionByShrinkingBy:inRect:", v30, v30, buf);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v31, "regionWithSubregionsOfMinimumDensity:", 0.5);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v71 = __Block_byref_object_copy__4600;
          v72 = __Block_byref_object_dispose__4601;
          v73 = v9;
          v57[0] = MEMORY[0x1E0C809B0];
          v57[1] = 3221225472;
          v57[2] = __41__PIRetouchCompositeNode__evaluateImage___block_invoke;
          v57[3] = &unk_1E5016108;
          v62 = v52;
          v63 = v51;
          v64 = v29;
          v6 = v6;
          v58 = v6;
          v33 = v49;
          v59 = v33;
          v65 = 0;
          v66 = 0;
          v67 = v55;
          v68 = v54;
          v34 = v31;
          v60 = v34;
          v61 = buf;
          objc_msgSend(v32, "enumerateRects:", v57);
          v16 = *(id *)(*(_QWORD *)&buf[8] + 40);

          _Block_object_dispose(buf, 8);
        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __41__PIRetouchCompositeNode__evaluateImage___block_invoke(uint64_t a1, __int128 *a2)
{
  __int128 v4;
  void *v5;
  id v6;
  __int128 v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;

  v27 = 0u;
  v28 = 0u;
  NUScaleInvert();
  v4 = a2[1];
  v25 = *a2;
  v26 = v4;
  NUPixelRectScaleRational();
  v23 = 0u;
  v24 = 0u;
  NUPixelRectDilate();
  v27 = v25;
  v28 = v26;
  v5 = *(void **)(a1 + 32);
  NUPixelRectToCGRect();
  objc_msgSend(v5, "imageByCroppingToRect:");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 40))
  {
    v7 = *(_OWORD *)(a1 + 104);
    v25 = *(_OWORD *)(a1 + 88);
    v26 = v7;
    NUPixelRectToCGRect();
    objc_msgSend(v6, "imageByClampingToRect:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v8, *MEMORY[0x1E0C9E1F8]);
    objc_msgSend(*(id *)(a1 + 40), "outputImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = *(void **)(a1 + 48);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __41__PIRetouchCompositeNode__evaluateImage___block_invoke_2;
    v18[3] = &unk_1E50160E0;
    v11 = a2[1];
    v21 = *a2;
    v22 = v11;
    v6 = v9;
    v12 = *(_QWORD *)(a1 + 56);
    v19 = v6;
    v20 = v12;
    objc_msgSend(v10, "enumerateRects:", v18);
    v13 = v19;
  }
  else
  {
    v14 = a2[1];
    v25 = *a2;
    v26 = v14;
    NUPixelRectToCGRect();
    objc_msgSend(v6, "imageByCroppingToRect:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "imageByCompositingOverImage:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

  }
}

void __41__PIRetouchCompositeNode__evaluateImage___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;

  v7 = *(_OWORD *)(a1 + 48);
  v8 = *(_OWORD *)(a1 + 64);
  NUPixelRectIntersection();
  if ((NUPixelRectIsEmpty() & 1) == 0)
  {
    v2 = *(void **)(a1 + 32);
    NUPixelRectToCGRect();
    objc_msgSend(v2, "imageByCroppingToRect:", v7, v8, 0, 0, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageByCompositingOverImage:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

@end
