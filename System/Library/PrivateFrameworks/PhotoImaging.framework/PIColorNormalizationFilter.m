@implementation PIColorNormalizationFilter

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PIColorNormalizationFilter inputNormalization](self, "inputNormalization");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PIColorNormalizationFilter *v4;
  PIColorNormalizationFilter *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (PIColorNormalizationFilter *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PIColorNormalizationFilter inputNormalization](self, "inputNormalization");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PIColorNormalizationFilter inputNormalization](v5, "inputNormalization");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)outputImage
{
  PFStoryRecipeDisplayAssetNormalization *inputNormalization;
  PFStoryRecipeDisplayAssetNormalization *v4;
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
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  inputNormalization = self->inputNormalization;
  if (!inputNormalization)
    return 0;
  v4 = inputNormalization;
  -[PIColorNormalizationFilter inputImage](self, "inputImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = CFSTR("temperature");
  -[PFStoryRecipeDisplayAssetNormalization tempTintProperties](v4, "tempTintProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("inputTemperature"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = CFSTR("tint");
  v20[0] = v7;
  -[PFStoryRecipeDisplayAssetNormalization tempTintProperties](v4, "tempTintProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("inputTint"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageByApplyingFilter:withInputParameters:", CFSTR("PITempTintFilter"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PFStoryRecipeDisplayAssetNormalization highKeyProperties](v4, "highKeyProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imageByApplyingFilter:withInputParameters:", CFSTR("PIHighKey"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PFStoryRecipeDisplayAssetNormalization smartToneProperties](v4, "smartToneProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "imageByApplyingFilter:withInputParameters:", CFSTR("CISmartToneFilter"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[PFStoryRecipeDisplayAssetNormalization smartColorProperties](v4, "smartColorProperties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "imageByApplyingFilter:withInputParameters:", CFSTR("CISmartColorFilter"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (PFStoryRecipeDisplayAssetNormalization)outputNormalization
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v29;
  NSObject *v30;
  id v31;
  void *v32;
  unint64_t v33;
  void *v34;
  os_signpost_id_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  uint8_t buf[8];
  _BYTE v42[128];
  _QWORD v43[3];

  v43[1] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return (PFStoryRecipeDisplayAssetNormalization *)0;
  +[PIColorNormalizationFilter logger](PIColorNormalizationFilter, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, self);
  v5 = v3;
  v6 = v5;
  v7 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PIColorNormalizationAnalysis", (const char *)&unk_1A650ABB5, buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D520B0], "sharedFactory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "visionSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x1E0CEDF70]);
  v11 = (void *)objc_msgSend(v10, "initWithCIImage:options:session:", self->inputImage, MEMORY[0x1E0C9AA70], v9);
  v12 = objc_alloc_init(MEMORY[0x1E0CEDD78]);
  objc_msgSend(v12, "setRevision:", 1);
  v43[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  v14 = objc_msgSend(v11, "performRequests:error:", v13, &v40);
  v15 = v40;

  v16 = 0;
  if (v14)
  {
    objc_msgSend(v12, "results");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v31 = v15;
      v32 = v11;
      v33 = v4 - 1;
      v34 = v9;
      v35 = v4;
      v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      objc_msgSend(v18, "adjustmentKeys");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v37 != v23)
              objc_enumerationMutation(v20);
            v25 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
            objc_msgSend(v18, "adjustmentValuesForKey:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setObject:forKeyedSubscript:", v26, v25);

          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
        }
        while (v22);
      }

      PFStoryRecipeDisplayAssetNormalizationDataFromMediaAnalysisDictionaryAndRevision();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D752C0]), "initWithAnalysisData:", v27);
      else
        v16 = 0;
      v9 = v34;
      v4 = v35;
      v15 = v31;
      v11 = v32;

      v7 = v33;
    }
    else
    {
      v16 = 0;
    }

  }
  v29 = v6;
  v30 = v29;
  if (v7 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v30, OS_SIGNPOST_INTERVAL_END, v4, "PIColorNormalizationAnalysis", (const char *)&unk_1A650ABB5, buf, 2u);
  }

  return (PFStoryRecipeDisplayAssetNormalization *)v16;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_storeStrong((id *)&self->inputImage, a3);
}

- (PFStoryRecipeDisplayAssetNormalization)inputNormalization
{
  return self->inputNormalization;
}

- (void)setInputNormalization:(id)a3
{
  objc_storeStrong((id *)&self->inputNormalization, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputNormalization, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

+ (id)logger
{
  if (logger_s_once != -1)
    dispatch_once(&logger_s_once, &__block_literal_global_314);
  return (id)logger_s_logger;
}

+ (BOOL)isAnalysisAvailable
{
  return 1;
}

+ (id)colorCubeForNormalization:(id)a3 dimension:(int64_t)a4 targetColorSpace:(CGColorSpace *)a5
{
  id v7;
  void *v8;
  PIColorNormalizationFilter *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  CGColorSpaceRef v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v21;
  const void **v22;
  const void **v23;
  void *specific;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  NSObject *v28;
  const void **v29;
  void *v30;
  int v31;
  void *v32;
  const void **v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  PIColorNormalizationFilter *v43;
  _QWORD v44[4];
  _QWORD v45[4];
  uint8_t buf[4];
  const void **v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    NUAssertLogger_306();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "normalization != nil");
      v22 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v22;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v23 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_306();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        v34 = dispatch_get_specific(*v23);
        v35 = (void *)MEMORY[0x1E0CB3978];
        v36 = v34;
        objc_msgSend(v35, "callStackSymbols");
        v23 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = (const void **)v34;
        v48 = 2114;
        v49 = v37;
        _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v26)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
      v23 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v23;
      _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v31 = _NUAssertFailHandler();
    goto LABEL_17;
  }
  if (!a5)
  {
    NUAssertLogger_306();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "colorSpace != NULL");
      v29 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v29;
      _os_log_error_impl(&dword_1A6382000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v23 = (const void **)MEMORY[0x1E0D51D48];
    v30 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_306();
    v25 = objc_claimAutoreleasedReturnValue();
    v31 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (!v30)
    {
      if (v31)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
        v33 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v47 = v33;
        _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_19;
    }
LABEL_17:
    if (v31)
    {
      v38 = dispatch_get_specific(*v23);
      v39 = (void *)MEMORY[0x1E0CB3978];
      v40 = v38;
      objc_msgSend(v39, "callStackSymbols");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "componentsJoinedByString:", CFSTR("\n"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = (const void **)v38;
      v48 = 2114;
      v49 = v42;
      _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_19:

    _NUAssertFailHandler();
  }
  v8 = v7;
  v9 = objc_alloc_init(PIColorNormalizationFilter);
  -[PIColorNormalizationFilter setInputNormalization:](v9, "setInputNormalization:", v8);
  v10 = (void *)MEMORY[0x1E0C9DD90];
  v11 = *MEMORY[0x1E0C9DF88];
  v45[0] = CFSTR("PIColorNormalization");
  v12 = *MEMORY[0x1E0C9DFC0];
  v44[0] = v11;
  v44[1] = v12;
  v13 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA00]);
  v14 = *MEMORY[0x1E0C9DF58];
  v45[1] = v13;
  v45[2] = MEMORY[0x1E0C9AAA0];
  v15 = *MEMORY[0x1E0C9DF50];
  v44[2] = v14;
  v44[3] = v15;
  v45[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contextWithOptions:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pi_createColorCubeDataForFilters:dimension:colorSpace:", v18, a4, a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

void __36__PIColorNormalizationFilter_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("PhotoImaging", "PIColorNormalizationFilter");
  v1 = (void *)logger_s_logger;
  logger_s_logger = (uint64_t)v0;

}

@end
