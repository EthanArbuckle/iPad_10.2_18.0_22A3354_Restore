@implementation PISemanticStyleLearnNode

- (id)styleSettingsForPipelineState:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  int v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  _QWORD *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSObject *v42;
  void *v43;
  const void **v44;
  void *specific;
  NSObject *v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  PISemanticStyleLearnNode *v55;
  SEL v56;
  id v57;
  char v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;
  $0AC6E346AE4835514AAA8AC86D8F4844 v64;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "evaluationMode") == 3 || v4 && (objc_msgSend(v4, "time"), (v58 & 1) != 0))
  {
    v5 = (void *)MEMORY[0x1E0D522F8];
    v6 = objc_msgSend(v4, "scale");
    objc_msgSend(v5, "semanticStyleVideoSettingsForScale:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v12 = v8;
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D51FC8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("StylePriorStrength"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "floatValue");
    v16 = v15;

    -[NURenderNode settings](self, "settings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("cast"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[NURenderNode settings](self, "settings");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("tone"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "floatValue");
    v22 = v21;

    -[NURenderNode settings](self, "settings");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("color"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "floatValue");
    v26 = v25;

    -[NURenderNode settings](self, "settings");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("intensity"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "floatValue");
    v30 = v29;

    LODWORD(v31) = v22;
    LODWORD(v32) = v26;
    LODWORD(v33) = v30;
    LODWORD(v34) = v16;
    +[PISemanticStyleFilter stylePriorDataForCast:tone:color:intensity:priorStrength:](PISemanticStyleFilter, "stylePriorDataForCast:tone:color:intensity:priorStrength:", v18, v31, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      v36 = (void *)objc_msgSend(v12, "mutableCopy");
      v37 = (_QWORD *)MEMORY[0x1E0D51FC0];
      objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D51FC0]);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (void *)objc_msgSend(v38, "mutableCopy");

      objc_msgSend(v39, "setObject:forKeyedSubscript:", v35, CFSTR("priorMatrix"));
      objc_msgSend(v36, "setObject:forKeyedSubscript:", v39, *v37);
      v40 = objc_msgSend(v36, "copy");

      v12 = (void *)v40;
    }

    return v12;
  }
  if (objc_msgSend(v4, "evaluationMode") == 1)
  {
    v9 = (void *)MEMORY[0x1E0D522F8];
    v10 = objc_msgSend(v4, "scale");
    objc_msgSend(v9, "semanticStyleImageSettingsForScale:", v10, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  NUAssertLogger_7964();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected pipeline state"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v60 = v43;
    _os_log_error_impl(&dword_1A6382000, v42, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

  }
  v44 = (const void **)MEMORY[0x1E0D51D48];
  specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
  NUAssertLogger_7964();
  v46 = objc_claimAutoreleasedReturnValue();
  v47 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);
  if (specific)
  {
    if (v47)
    {
      v50 = dispatch_get_specific(*v44);
      v51 = (void *)MEMORY[0x1E0CB3978];
      v52 = v50;
      objc_msgSend(v51, "callStackSymbols");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "componentsJoinedByString:", CFSTR("\n"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v60 = v50;
      v61 = 2114;
      v62 = v54;
      _os_log_error_impl(&dword_1A6382000, v46, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
  }
  else if (v47)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "componentsJoinedByString:", CFSTR("\n"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v60 = v49;
    _os_log_error_impl(&dword_1A6382000, v46, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

  }
  v55 = (PISemanticStyleLearnNode *)_NUAssertFailHandler();
  return -[PISemanticStyleLearnNode thumbnailSettingsWithStyleSettings:thumbnailSize:](v55, v56, v57, v64);
}

- (id)thumbnailSettingsWithStyleSettings:(id)a3 thumbnailSize:(id)a4
{
  int64_t var1;
  int64_t var0;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  var1 = a4.var1;
  var0 = a4.var0;
  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_7964();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "settings != nil");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v13;
      _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v14 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_7964();
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
        v26 = v20;
        v27 = 2114;
        v28 = v24;
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
      v26 = v19;
      _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v7 = v6;
  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", var0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("thumbnailWidth"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", var1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("thumbnailHeight"));

  return v8;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  PISemanticStyleRenderNode *v11;
  void *v12;
  void *v13;
  PISemanticStyleRenderNode *v14;
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
  PISemanticStyleRenderNode *v28;
  void *v29;
  NSObject *v31;
  void *v32;
  const void **v33;
  void *specific;
  NSObject *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  const void **v41;
  void *v42;
  NSObject *v43;
  _BOOL4 v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  PISemanticStyleRenderNode *v59;
  objc_super v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  objc_super v64;
  int buf;
  uint8_t buf_4[8];
  __int16 v67;
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!a5)
  {
    NUAssertLogger_7964();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      buf = 138543362;
      *(_QWORD *)buf_4 = v32;
      _os_log_error_impl(&dword_1A6382000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);

    }
    v33 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_7964();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v36)
      {
        v47 = dispatch_get_specific(*v33);
        v48 = (void *)MEMORY[0x1E0CB3978];
        v49 = v47;
        objc_msgSend(v48, "callStackSymbols");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "componentsJoinedByString:", CFSTR("\n"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        buf = 138543618;
        *(_QWORD *)buf_4 = v47;
        v67 = 2114;
        v68 = v51;
        _os_log_error_impl(&dword_1A6382000, v35, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);

      }
    }
    else if (v36)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      buf = 138543362;
      *(_QWORD *)buf_4 = v38;
      _os_log_error_impl(&dword_1A6382000, v35, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);

    }
    _NUAssertFailHandler();
LABEL_36:
    __break(1u);
  }
  v10 = v9;
  if (objc_msgSend(v9, "auxiliaryImageType") != 1)
  {
    NUAssertLogger_7964();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ cannot be applied to aux images"), objc_opt_class());
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      buf = 138543362;
      *(_QWORD *)buf_4 = v40;
      _os_log_error_impl(&dword_1A6382000, v39, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);

    }
    v41 = (const void **)MEMORY[0x1E0D51D48];
    v42 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_7964();
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = os_log_type_enabled(v43, OS_LOG_TYPE_ERROR);
    if (v42)
    {
      if (v44)
      {
        v52 = dispatch_get_specific(*v41);
        v53 = (void *)MEMORY[0x1E0CB3978];
        v54 = v52;
        objc_msgSend(v53, "callStackSymbols");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "componentsJoinedByString:", CFSTR("\n"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        buf = 138543618;
        *(_QWORD *)buf_4 = v52;
        v67 = 2114;
        v68 = v56;
        _os_log_error_impl(&dword_1A6382000, v43, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);

      }
    }
    else if (v44)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "componentsJoinedByString:", CFSTR("\n"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      buf = 138543362;
      *(_QWORD *)buf_4 = v46;
      _os_log_error_impl(&dword_1A6382000, v43, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);

    }
    objc_opt_class();
    _NUAssertFailHandler();
    goto LABEL_36;
  }
  if (objc_msgSend(v10, "evaluationMode"))
  {
    v11 = [PISemanticStyleRenderNode alloc];
    -[PISemanticStyleRenderNode input](self, "input");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NURenderNode settings](self, "settings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PISemanticStyleRenderNode initWithInput:settings:](v11, "initWithInput:settings:", v12, v13);

    v59 = v14;
    if (objc_msgSend(v10, "evaluationMode") == 2)
    {
      -[PISemanticStyleRenderNode nodeByReplayingAgainstCache:pipelineState:error:](v14, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v10, a5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PISemanticStyleLearnNode styleSettingsForPipelineState:](self, "styleSettingsForPipelineState:", v10);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[NURenderNode settings](self, "settings");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v16, "mutableCopy");

      objc_msgSend(v17, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("useStyleEngine"));
      if (objc_msgSend(v10, "evaluationMode") == 3)
      {
        v61 = 0;
        v62 = 0;
        v63 = 0;
        if (v10)
          objc_msgSend(v10, "time");
        objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("invalid frame time"), v10);
        v15 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v10, "evaluationMode") == 1)
      {
        -[PISemanticStyleRenderNode input](self, "input");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "imageProperties:", a5);
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v57, "auxiliaryImagePropertiesForType:", 11);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19)
        {
          v21 = objc_msgSend(v19, "size");
          v23 = v22;
        }
        else
        {
          v23 = 192;
          v21 = 256;
        }
        -[PISemanticStyleLearnNode thumbnailSettingsWithStyleSettings:thumbnailSize:](self, "thumbnailSettingsWithStyleSettings:thumbnailSize:", v58, v21, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)MEMORY[0x1E0D52270];
        -[PISemanticStyleRenderNode input](self, "input");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "styleTransferThumbnailNodeWithInput:settings:", v26, v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = -[PISemanticStyleRenderNode initWithInput:settings:]([PISemanticStyleRenderNode alloc], "initWithInput:settings:", v27, v17);
        objc_msgSend(MEMORY[0x1E0D52270], "styleTransferLearnNodeWithInput:target:settings:", v27, v28, v58);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v10, a5);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v60.receiver = self;
        v60.super_class = (Class)PISemanticStyleLearnNode;
        -[PISemanticStyleRenderNode nodeByReplayingAgainstCache:pipelineState:error:](&v60, sel_nodeByReplayingAgainstCache_pipelineState_error_, v8, v10, a5);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
  }
  else
  {
    v64.receiver = self;
    v64.super_class = (Class)PISemanticStyleLearnNode;
    -[PISemanticStyleRenderNode nodeByReplayingAgainstCache:pipelineState:error:](&v64, sel_nodeByReplayingAgainstCache_pipelineState_error_, v8, v10, a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PISemanticStyleLearnNode;
  -[PISemanticStyleRenderNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](&v7, sel_resolvedNodeWithCachedInputs_settings_pipelineState_error_, a3, a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

double __76__PISemanticStyleLearnNode_nodeByReplayingAgainstCache_pipelineState_error___block_invoke(uint64_t a1, CMTime *a2)
{
  void *v3;
  Float64 Seconds;
  CMTime v6;
  CMTime lhs;
  CMTime time;
  CMTime v9;

  memset(&v9, 0, sizeof(v9));
  v3 = *(void **)(a1 + 32);
  if (v3)
    objc_msgSend(v3, "time");
  lhs = *a2;
  v6 = v9;
  CMTimeSubtract(&time, &lhs, &v6);
  Seconds = CMTimeGetSeconds(&time);
  return exp(Seconds * Seconds / -0.08);
}

void __76__PISemanticStyleLearnNode_nodeByReplayingAgainstCache_pipelineState_error___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[3];
  id v19;

  objc_msgSend(*(id *)(a1 + 32), "updatePipelineStateForWindowedSampleIndex:", a2);
  v5 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 32);
  v19 = 0;
  objc_msgSend(v5, "nodeByReplayingAgainstCache:pipelineState:error:", v6, v7, &v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v19;
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v8);
    v10 = (void *)MEMORY[0x1E0CB37E8];
    v11 = *(void **)(a1 + 64);
    v12 = *(_QWORD *)(a1 + 72);
    v13 = *(void **)(a1 + 32);
    if (v13)
      objc_msgSend(v13, "time");
    else
      memset(v18, 0, sizeof(v18));
    (*(void (**)(uint64_t, _QWORD *))(v12 + 16))(v12, v18);
    objc_msgSend(v10, "numberWithDouble:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v17);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to evaluate keyframe learn node"), *(_QWORD *)(a1 + 40), v9);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    *a3 = 1;
  }

}

id __76__PISemanticStyleLearnNode_nodeByReplayingAgainstCache_pipelineState_error___block_invoke_158(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v6 = a2;
  v7 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "doubleValue");
  v9 = v8;
  objc_msgSend(v6, "doubleValue");
  v10 = v7;
  if (v9 < v11)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  v12 = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "unsignedIntegerValue") + 1);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  return v12;
}

@end
