@implementation PIAutoLoopAnalysisJob

- (BOOL)wantsOutputGeometry
{
  return 1;
}

- (BOOL)wantsOutputVideo
{
  return 1;
}

- (BOOL)wantsCompleteStage
{
  return 0;
}

- (id)cacheKey
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0D52090]);
  -[NURenderJob renderNode](self, "renderNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PIAutoLoopFindVideoSourceNode(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "nu_updateDigest:", v3);
  objc_msgSend(v3, "finalize");
  objc_msgSend(v3, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)scalePolicy
{
  return (id)objc_msgSend(MEMORY[0x1E0D520E0], "oneToOneScalePolicy");
}

- (BOOL)prepare:(id *)a3
{
  void *v5;
  void *v6;
  AVAsset *v7;
  AVAsset *videoSource;
  BOOL v9;
  void *v10;
  void *v11;
  NSObject *v13;
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
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_5009();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v14;
      _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v15 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_5009();
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
  v26.receiver = self;
  v26.super_class = (Class)PIAutoLoopAnalysisJob;
  if (!-[NURenderJob prepare:](&v26, sel_prepare_))
    return 0;
  -[NURenderJob renderNode](self, "renderNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PIAutoLoopFindVideoSourceNode(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "asset:", a3);
    v7 = (AVAsset *)objc_claimAutoreleasedReturnValue();
    videoSource = self->_videoSource;
    self->_videoSource = v7;

    v9 = self->_videoSource != 0;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0D520A0];
    -[NURenderJob renderNode](self, "renderNode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "missingError:object:", CFSTR("unable to find video source node"), v11);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    v9 = 0;
  }

  return v9;
}

- (BOOL)render:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  BOOL v10;
  void *v11;
  void *v12;
  uint64_t v13;
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
  id v28;
  uint64_t v29;
  id location;
  int v31;
  _BYTE buf[12];
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_5009();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v16;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v17 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_5009();
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
        *(_QWORD *)&buf[4] = v23;
        v33 = 2114;
        v34 = v27;
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
      *(_QWORD *)&buf[4] = v22;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
    __break(1u);
  }
  v5 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURLWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0;
  -[PIAutoLoopAnalysisJob videoSource](self, "videoSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  createAutoLoopSettingsForAsset();

  objc_initWeak(&location, self);
  *(_DWORD *)&buf[8] = 2;
  *(_QWORD *)buf = 0x100000000;
  v29 = 0;
  v9 = v31;
  if (v31)
  {
    v10 = 0;
LABEL_13:
    if (v9 == 1)
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "canceledError:object:", CFSTR("canceled"), objc_opt_class());
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0D520A0];
      v13 = autoloopErrorCodeToString();
      objc_msgSend(v12, "failureError:object:", v13, objc_opt_class());
    }
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  objc_copyWeak(&v28, &location);
  v31 = runLiveAnalysisPipeline();
  objc_destroyWeak(&v28);
  if (v31)
  {
    v10 = 0;
  }
  else
  {
    liveAnalysisResultToDictionary();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11 != 0;
    if (v11)
    {
      -[PIAutoLoopAnalysisJob setRecipe:](self, "setRecipe:", v11);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "failureError:object:", CFSTR("could not extract dictionary results"), objc_opt_class());
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  if (v29)
    liveAnalysisResultDestroy();
  v9 = v31;
  if (v31)
    goto LABEL_13;
LABEL_17:
  autoloopSettingsDestroy();
  objc_destroyWeak(&location);

  return v10;
}

- (id)result
{
  _PIAutoLoopAnalysisResult *v3;
  void *v4;

  v3 = objc_alloc_init(_PIAutoLoopAnalysisResult);
  -[PIAutoLoopAnalysisJob recipe](self, "recipe");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PIAutoLoopAnalysisResult setRecipe:](v3, "setRecipe:", v4);

  return v3;
}

- (AVAsset)videoSource
{
  return self->_videoSource;
}

- (void)setVideoSource:(id)a3
{
  objc_storeStrong((id *)&self->_videoSource, a3);
}

- (NSDictionary)recipe
{
  return self->_recipe;
}

- (void)setRecipe:(id)a3
{
  objc_storeStrong((id *)&self->_recipe, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipe, 0);
  objc_storeStrong((id *)&self->_videoSource, 0);
}

uint64_t __32__PIAutoLoopAnalysisJob_render___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = objc_msgSend(WeakRetained, "isCanceled") ^ 1;
  else
    v3 = 0;

  return v3;
}

@end
