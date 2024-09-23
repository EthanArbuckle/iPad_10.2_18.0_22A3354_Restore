@implementation PISemanticStyleApplyNode

- (PISemanticStyleApplyNode)initWithSettings:(id)a3 inputs:(id)a4
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
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_7990);
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
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_7990);
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
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_7990);
  }
}

- (PISemanticStyleApplyNode)initWithInput:(id)a3 style:(id)a4 thumbnail:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  PISemanticStyleApplyNode *v13;
  NSObject *v15;
  const void **v16;
  const void **v17;
  void *specific;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  NSObject *v22;
  const void **v23;
  void *v24;
  int v25;
  void *v26;
  const void **v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  objc_super v37;
  uint8_t buf[4];
  const void **v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    NUAssertLogger_7964();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "input != nil");
      v16 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v16;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v17 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_7964();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        v28 = dispatch_get_specific(*v17);
        v29 = (void *)MEMORY[0x1E0CB3978];
        v30 = v28;
        objc_msgSend(v29, "callStackSymbols");
        v17 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v39 = (const void **)v28;
        v40 = 2114;
        v41 = v31;
        _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
      v17 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v17;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v25 = _NUAssertFailHandler();
    goto LABEL_17;
  }
  if (!v9)
  {
    NUAssertLogger_7964();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "style != nil");
      v23 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v23;
      _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v17 = (const void **)MEMORY[0x1E0D51D48];
    v24 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_7964();
    v19 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (!v24)
    {
      if (v25)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
        v27 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v39 = v27;
        _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_19;
    }
LABEL_17:
    if (v25)
    {
      v32 = dispatch_get_specific(*v17);
      v33 = (void *)MEMORY[0x1E0CB3978];
      v34 = v32;
      objc_msgSend(v33, "callStackSymbols");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "componentsJoinedByString:", CFSTR("\n"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = (const void **)v32;
      v40 = 2114;
      v41 = v36;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_19:

    _NUAssertFailHandler();
  }
  v11 = v10;
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, CFSTR("input"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, CFSTR("style"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("thumbnail"));
  v37.receiver = self;
  v37.super_class = (Class)PISemanticStyleApplyNode;
  v13 = -[NURenderNode initWithSettings:inputs:](&v37, sel_initWithSettings_inputs_, &unk_1E5058FF8, v12);

  return v13;
}

- (NURenderNode)inputNode
{
  return (NURenderNode *)-[NURenderNode inputForKey:](self, "inputForKey:", CFSTR("input"));
}

- (PISemanticStyleLearnNode)styleNode
{
  return (PISemanticStyleLearnNode *)-[NURenderNode inputForKey:](self, "inputForKey:", CFSTR("style"));
}

- (NURenderNode)thumbnailNode
{
  return (NURenderNode *)-[NURenderNode inputForKey:](self, "inputForKey:", CFSTR("thumbnail"));
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  return objc_msgSend(a3, "evaluationMode") == 0;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PISemanticStyleApplyNode;
  -[NURenderNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](&v7, sel_resolvedNodeWithCachedInputs_settings_pipelineState_error_, a3, a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id *v24;
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
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
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
  id *v58;
  __int128 v59;
  uint64_t v60;
  __int128 v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  objc_super v67;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "evaluationMode"))
  {
    if (objc_msgSend(v9, "auxiliaryImageType") == 1)
    {
      v58 = a5;
      -[PISemanticStyleApplyNode styleNode](self, "styleNode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "settings");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("cast"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      PISemanticStyleCastFromString(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[PISemanticStyleApplyNode styleNode](self, "styleNode");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "settings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("tone"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "floatValue");
      -[PISemanticStyleApplyNode styleNode](self, "styleNode");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "settings");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("color"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "floatValue");
      v57 = v13;
      LODWORD(v13) = objc_msgSend(v13, "isEqualToString:", CFSTR("None"));

      if ((_DWORD)v13)
      {
        -[PISemanticStyleApplyNode inputNode](self, "inputNode");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        v22 = v8;
        v23 = v9;
        v24 = v58;
LABEL_9:
        objc_msgSend(v20, "nodeByReplayingAgainstCache:pipelineState:error:", v22, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_24:
        goto LABEL_25;
      }
      if (objc_msgSend(v9, "evaluationMode") == 2)
      {
        -[PISemanticStyleApplyNode styleNode](self, "styleNode");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        v22 = v8;
        v23 = v9;
        v24 = v58;
        goto LABEL_9;
      }
      if (objc_msgSend(v9, "evaluationMode") == 1)
      {
        if (v9)
        {
          objc_msgSend(v9, "time");
          if ((v65 & 0x100000000) != 0)
          {
            -[PISemanticStyleApplyNode inputNode](self, "inputNode");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v9, v58);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v28)
            {
              v25 = 0;
LABEL_23:

              goto LABEL_24;
            }
            objc_msgSend(v28, "imageProperties:", v58);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v29;
            if (!v29)
            {
              v25 = 0;
LABEL_38:

              goto LABEL_23;
            }
            objc_msgSend(v29, "semanticStyleProperties");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = v31;
            if (v31)
            {
              objc_msgSend(v31, "keyTime");
              if ((v63 & 1) != 0)
              {
                v42 = (void *)objc_msgSend(v9, "copy");
                objc_msgSend(v32, "keyTime");
                v59 = v61;
                v60 = v62;
                objc_msgSend(v42, "setTime:", &v59);
                objc_msgSend(v42, "setMediaComponentType:", 2);
                objc_msgSend(v42, "setDoNotOverride:", 1);
                -[PISemanticStyleApplyNode styleNode](self, "styleNode");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v42, v58);
                v44 = (void *)objc_claimAutoreleasedReturnValue();

                if (v44)
                {
                  -[PISemanticStyleApplyNode thumbnailNode](self, "thumbnailNode");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  v46 = v45;
                  if (v45)
                  {
                    objc_msgSend(v45, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v9, v58);
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    -[PISemanticStyleApplyNode inputNode](self, "inputNode");
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v48, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v9, v58);
                    v47 = (void *)objc_claimAutoreleasedReturnValue();

                  }
                  v49 = (void *)MEMORY[0x1E0D52270];
                  objc_msgSend(v44, "settings");
                  v56 = v44;
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "styleTransferThumbnailNodeWithInput:settings:", v47, v50);
                  v51 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v51, "inputs");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v51, "resolvedNodeWithCachedInputs:cache:pipelineState:error:", v52, v8, v9, v58);
                  v53 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(MEMORY[0x1E0D52270], "styleTransferApplyNodeWithInput:thumbnail:target:settings:", v28, v53, v56, MEMORY[0x1E0C9AA70]);
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v54, "inputs");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v54, "resolvedNodeWithCachedInputs:cache:pipelineState:error:", v55, v8, v9, v58);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();

                  v44 = v56;
                }
                else
                {
                  v25 = 0;
                }

                goto LABEL_37;
              }
              objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid key time"), v32);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Missing semantic style properties"), v30);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v25 = 0;
            *v58 = v33;
LABEL_37:

            goto LABEL_38;
          }
        }
        else
        {
          v64 = 0;
          v65 = 0;
          v66 = 0;
        }
      }
      -[PISemanticStyleApplyNode thumbnailNode](self, "thumbnailNode");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34;
      if (v34)
      {
        v36 = v34;
      }
      else
      {
        -[PISemanticStyleApplyNode inputNode](self, "inputNode");
        v36 = (id)objc_claimAutoreleasedReturnValue();
      }
      v28 = v36;

      v37 = (void *)MEMORY[0x1E0D52270];
      -[PISemanticStyleApplyNode inputNode](self, "inputNode");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[PISemanticStyleApplyNode styleNode](self, "styleNode");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "styleTransferApplyNodeWithInput:thumbnail:target:settings:", v38, v28, v39, MEMORY[0x1E0C9AA70]);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v40, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v9, v58);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_23;
    }
    -[PISemanticStyleApplyNode inputNode](self, "inputNode");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v9, a5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v67.receiver = self;
    v67.super_class = (Class)PISemanticStyleApplyNode;
    -[NURenderNode nodeByReplayingAgainstCache:pipelineState:error:](&v67, sel_nodeByReplayingAgainstCache_pipelineState_error_, v8, v9, a5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_25:

  return v25;
}

@end
