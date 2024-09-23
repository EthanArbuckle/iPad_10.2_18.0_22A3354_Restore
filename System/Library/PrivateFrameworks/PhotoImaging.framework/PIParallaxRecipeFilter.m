@implementation PIParallaxRecipeFilter

- (PIParallaxRecipeFilter)initWithRecipe:(id)a3
{
  PIParallaxStyleRecipe *v4;
  PIParallaxRecipeFilter *v5;
  PIParallaxStyleRecipe *recipe;
  PIParallaxStyleRecipe *v7;
  NSDictionary *parameters;
  objc_super v10;

  v4 = (PIParallaxStyleRecipe *)a3;
  v10.receiver = self;
  v10.super_class = (Class)PIParallaxRecipeFilter;
  v5 = -[PIParallaxRecipeFilter init](&v10, sel_init);
  recipe = v5->_recipe;
  v5->_recipe = v4;
  v7 = v4;

  parameters = v5->_parameters;
  v5->_parameters = (NSDictionary *)MEMORY[0x1E0C9AA70];

  return v5;
}

- (id)outputBackgroundImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PIParallaxFilter inputBackgroundImage](self, "inputBackgroundImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PIParallaxRecipeFilter recipe](self, "recipe");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backgroundFilters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIParallaxFilter inputBackgroundImage](self, "inputBackgroundImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIParallaxRecipeFilter _evaluateImageWithFilterDefinitions:inputImage:](self, "_evaluateImageWithFilterDefinitions:inputImage:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)outputForegroundImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PIParallaxFilter inputForegroundImage](self, "inputForegroundImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PIParallaxRecipeFilter recipe](self, "recipe");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "foregroundFilters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIParallaxFilter inputForegroundImage](self, "inputForegroundImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIParallaxRecipeFilter _evaluateImageWithFilterDefinitions:inputImage:](self, "_evaluateImageWithFilterDefinitions:inputImage:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)outputMatteImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PIParallaxFilter inputMatteImage](self, "inputMatteImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PIParallaxRecipeFilter recipe](self, "recipe");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "matteFilters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIParallaxFilter inputMatteImage](self, "inputMatteImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIParallaxRecipeFilter _evaluateImageWithFilterDefinitions:inputImage:](self, "_evaluateImageWithFilterDefinitions:inputImage:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (NSDictionary)resolvedParameters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  -[PIParallaxRecipeFilter recipe](self, "recipe");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[PIParallaxRecipeFilter parameters](self, "parameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__PIParallaxRecipeFilter_resolvedParameters__block_invoke;
  v9[3] = &unk_1E5017078;
  v7 = v5;
  v10 = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v9);

  return (NSDictionary *)v7;
}

- (id)_evaluateImageWithFilterDefinitions:(id)a3 inputImage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PIParallaxStyleEvaluationContext *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  dispatch_once_t *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v30;
  const void **v31;
  const void **v32;
  void *specific;
  NSObject *v34;
  _BOOL4 v35;
  void *v36;
  NSObject *v37;
  const void **v38;
  void *v39;
  int v40;
  void *v41;
  NSObject *v42;
  const void **v43;
  void *v44;
  int v45;
  void *v46;
  const void **v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t v67[128];
  uint8_t buf[4];
  const void **v69;
  __int16 v70;
  id v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    NUAssertLogger_9336();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "definitions != nil");
      v31 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v69 = v31;
      _os_log_error_impl(&dword_1A6382000, v30, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v32 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_9336();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v35)
      {
        v48 = dispatch_get_specific(*v32);
        v49 = (void *)MEMORY[0x1E0CB3978];
        v50 = v48;
        objc_msgSend(v49, "callStackSymbols");
        v32 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v69 = (const void **)v48;
        v70 = 2114;
        v71 = v51;
        _os_log_error_impl(&dword_1A6382000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v35)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
      v32 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v69 = v32;
      _os_log_error_impl(&dword_1A6382000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v40 = _NUAssertFailHandler();
    goto LABEL_36;
  }
  v8 = v7;
  if (!v7)
  {
    NUAssertLogger_9336();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "inputImage != nil");
      v38 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v69 = v38;
      _os_log_error_impl(&dword_1A6382000, v37, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v32 = (const void **)MEMORY[0x1E0D51D48];
    v39 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_9336();
    v34 = objc_claimAutoreleasedReturnValue();
    v40 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (!v39)
    {
      if (v40)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "componentsJoinedByString:", CFSTR("\n"));
        v32 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v69 = v32;
        _os_log_error_impl(&dword_1A6382000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_38:

      v45 = _NUAssertFailHandler();
      goto LABEL_39;
    }
LABEL_36:
    if (v40)
    {
      v52 = dispatch_get_specific(*v32);
      v53 = (void *)MEMORY[0x1E0CB3978];
      v54 = v52;
      objc_msgSend(v53, "callStackSymbols");
      v32 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v69 = (const void **)v52;
      v70 = 2114;
      v71 = v55;
      _os_log_error_impl(&dword_1A6382000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_38;
  }
  v9 = objc_alloc_init(PIParallaxStyleEvaluationContext);
  -[PIParallaxRecipeFilter resolvedParameters](self, "resolvedParameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxStyleEvaluationContext setParameters:](v9, "setParameters:", v10);

  -[PIParallaxFilter inputGuideImage](self, "inputGuideImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxStyleEvaluationContext setGuideImage:](v9, "setGuideImage:", v11);

  -[PIParallaxStyleEvaluationContext setInputImage:](v9, "setInputImage:", v8);
  v61 = v8;
  objc_msgSend(v8, "imageByClampingToExtent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxStyleEvaluationContext setOutputImage:](v9, "setOutputImage:", v12);

  -[PIParallaxFilter inputMatteImage](self, "inputMatteImage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxStyleEvaluationContext setMatteImage:](v9, "setMatteImage:", v13);

  -[PIParallaxFilter inputBackgroundImage](self, "inputBackgroundImage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxStyleEvaluationContext setBackgroundImage:](v9, "setBackgroundImage:", v14);

  -[PIParallaxFilter visibleFrame](self, "visibleFrame");
  -[PIParallaxStyleEvaluationContext setVisibleRect:](v9, "setVisibleRect:");
  -[PIParallaxFilter renderScale](self, "renderScale");
  -[PIParallaxStyleEvaluationContext setRenderScale:](v9, "setRenderScale:");
  -[PIParallaxFilter localLightData](self, "localLightData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxStyleEvaluationContext setLocalLightData:](v9, "setLocalLightData:", v15);

  -[PIParallaxFilter cache](self, "cache");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxStyleEvaluationContext setCache:](v9, "setCache:", v16);

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v17 = v6;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
  if (v18)
  {
    v19 = v18;
    v20 = (dispatch_once_t *)MEMORY[0x1E0D52390];
    v21 = *(_QWORD *)v64;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v64 != v21)
          objc_enumerationMutation(v17);
        v23 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v22);
        v62 = 0;
        objc_msgSend(v23, "evaluateWithContext:error:", v9, &v62);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v62;
        if (v24)
        {
          -[PIParallaxStyleEvaluationContext setOutputImage:](v9, "setOutputImage:", v24);
        }
        else
        {
          if (*v20 != -1)
            dispatch_once(v20, &__block_literal_global_9351);
          v26 = *MEMORY[0x1E0D52398];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v69 = (const void **)v23;
            v70 = 2112;
            v71 = v25;
            _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "Error evaluating filter definition: %@, error: %@", buf, 0x16u);
          }
        }

        ++v22;
      }
      while (v19 != v22);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
    }
    while (v19);
  }

  -[PIParallaxStyleEvaluationContext outputImage](v9, "outputImage");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "extent");
  objc_msgSend(v27, "imageByCroppingToRect:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
  {
    NUAssertLogger_9336();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to produce an image"));
      v43 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v69 = v43;
      _os_log_error_impl(&dword_1A6382000, v42, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v32 = (const void **)MEMORY[0x1E0D51D48];
    v44 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_9336();
    v34 = objc_claimAutoreleasedReturnValue();
    v45 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (!v44)
    {
      if (v45)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "componentsJoinedByString:", CFSTR("\n"));
        v47 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v69 = v47;
        _os_log_error_impl(&dword_1A6382000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_41;
    }
LABEL_39:
    if (v45)
    {
      v56 = dispatch_get_specific(*v32);
      v57 = (void *)MEMORY[0x1E0CB3978];
      v58 = v56;
      objc_msgSend(v57, "callStackSymbols");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "componentsJoinedByString:", CFSTR("\n"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v69 = (const void **)v56;
      v70 = 2114;
      v71 = v60;
      _os_log_error_impl(&dword_1A6382000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_41:

    _NUAssertFailHandler();
  }

  return v28;
}

- (PIParallaxStyleRecipe)recipe
{
  return self->_recipe;
}

- (void)setRecipe:(id)a3
{
  objc_storeStrong((id *)&self->_recipe, a3);
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_recipe, 0);
}

void __44__PIParallaxRecipeFilter_resolvedParameters__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  PIParallaxStyleColorParameter *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PIParallaxStyleColorParameter *v19;
  NSObject *v20;
  void *v21;
  int v22;
  PIParallaxStyleNumberParameter *v23;
  NSObject *v24;
  const char *v25;
  int v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "type");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("color"));

    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v6;
        v12 = [PIParallaxStyleColorParameter alloc];
        v13 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v11, "red");
        objc_msgSend(v13, "numberWithDouble:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v11, "green");
        objc_msgSend(v15, "numberWithDouble:");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v11, "blue");
        objc_msgSend(v17, "numberWithDouble:");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[PIParallaxStyleColorParameter initWithRed:green:blue:alpha:](v12, "initWithRed:green:blue:alpha:", v14, v16, v18, &unk_1E5051D48);

        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v19, v5);
        goto LABEL_19;
      }
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_9351);
      v24 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
      {
        v26 = 138543618;
        v27 = v5;
        v28 = 2114;
        v29 = v6;
        v25 = "Parameter %{public}@ is not a valid color value: %{public}@";
LABEL_21:
        _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&v26, 0x16u);
      }
    }
    else
    {
      objc_msgSend(v8, "type");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("number"));

      if (v22)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v23 = -[PIParallaxStyleNumberParameter initWithNumber:]([PIParallaxStyleNumberParameter alloc], "initWithNumber:", v6);
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v23, v5);

          goto LABEL_19;
        }
        if (*MEMORY[0x1E0D52390] != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_9351);
        v24 = *MEMORY[0x1E0D52398];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
        {
          v26 = 138543618;
          v27 = v5;
          v28 = 2114;
          v29 = v6;
          v25 = "Parameter %{public}@ is not a valid number value: %{public}@";
          goto LABEL_21;
        }
      }
    }
  }
  else
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_9351);
    v20 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEBUG))
    {
      v26 = 138543362;
      v27 = v5;
      _os_log_debug_impl(&dword_1A6382000, v20, OS_LOG_TYPE_DEBUG, "Unsupported filter parameter: %{public}@", (uint8_t *)&v26, 0xCu);
    }
  }
LABEL_19:

}

@end
