@implementation PIParallaxLegacyPosterStyle

+ (void)initialize
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__PIParallaxLegacyPosterStyle_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, block);
}

+ (id)applyInactiveStyleToImage:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v20;
  void *v21;
  const void **v22;
  void *specific;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_7646();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "image != nil");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v21;
      _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v22 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_7646();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        v28 = dispatch_get_specific(*v22);
        v29 = (void *)MEMORY[0x1E0CB3978];
        v30 = v28;
        objc_msgSend(v29, "callStackSymbols");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v34 = v28;
        v35 = 2114;
        v36 = v32;
        _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v25)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v27;
      _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v7 = v6;
  +[PIParallaxStyle defaultOriginalStyle](PIParallaxOriginalStyle, "defaultOriginalStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "inactiveFilter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (id)s_log;
    v11 = v10;
    v12 = s_signpost;
    if ((unint64_t)(s_signpost - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6382000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PIParallaxLegacyPosterStyle.localLight", (const char *)&unk_1A650ABB5, buf, 2u);
    }

    objc_msgSend(a1, "_localLightDataForImage:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)s_log;
    v15 = v14;
    v16 = s_signpost;
    if ((unint64_t)(s_signpost - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6382000, v15, OS_SIGNPOST_INTERVAL_END, v16, "PIParallaxLegacyPosterStyle.localLight", (const char *)&unk_1A650ABB5, buf, 2u);
    }

    objc_msgSend(v7, "extent");
    objc_msgSend(v9, "setVisibleFrame:");
    objc_msgSend(v9, "setRenderScale:", 1.0);
    objc_msgSend(v9, "setLocalLightData:", v13);
    objc_msgSend(v9, "setInputGuideImage:", v7);
    objc_msgSend(v9, "setInputBackgroundImage:", v7);
    objc_msgSend(v9, "outputBackgroundImage");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (a4 && !v17)
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "failureError:object:", CFSTR("Failed to produce background image with filter"), v9);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "resourceUnavailableError:object:", CFSTR("Inactive filter is not available"), 0);
    v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)_localLightDataForImage:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  CGFloat v8;
  void *v9;
  void *v10;
  CGAffineTransform v12;
  CGAffineTransform v13;

  v3 = (objc_class *)MEMORY[0x1E0D52218];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithTargetPixelCount:", 0x40000);
  objc_msgSend(v4, "extent");
  v6 = NUPixelSizeFromCGSize();
  objc_msgSend(v5, "scaleForImageSize:", v6, v7);
  NUScaleToDouble();
  memset(&v13, 0, sizeof(v13));
  CGAffineTransformMakeScale(&v13, v8, v8);
  v12 = v13;
  objc_msgSend(v4, "imageByApplyingTransform:", &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "localLightStatisticsNoProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

os_signpost_id_t __41__PIParallaxLegacyPosterStyle_initialize__block_invoke(uint64_t a1)
{
  os_log_t v2;
  void *v3;
  os_signpost_id_t result;

  v2 = os_log_create("com.apple.photos.PhotoImaging", "legacyPosterStyle");
  v3 = (void *)s_log;
  s_log = (uint64_t)v2;

  result = os_signpost_id_make_with_pointer((os_log_t)s_log, *(const void **)(a1 + 32));
  s_signpost = result;
  return result;
}

@end
