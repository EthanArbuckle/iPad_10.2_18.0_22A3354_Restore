@implementation PIColorNormalizationAutoCalculator

- (PIColorNormalizationAutoCalculator)initWithComposition:(id)a3
{
  PIColorNormalizationAutoCalculator *v3;
  void *v4;
  void *v5;
  __int128 v7;
  uint64_t v8;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)PIColorNormalizationAutoCalculator;
  v3 = -[NURenderRequest initWithComposition:](&v9, sel_initWithComposition_, a3);
  +[PIPipelineFilters stopAtTagIncludeOrientationFilter:](PIPipelineFilters, "stopAtTagIncludeOrientationFilter:", CFSTR("/Master/Source"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderRequest setPipelineFilters:](v3, "setPipelineFilters:", v5);

  -[NURenderRequest setSampleMode:](v3, "setSampleMode:", 2);
  v7 = *MEMORY[0x1E0CA2E68];
  v8 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  -[PIColorNormalizationAutoCalculator setTime:](v3, "setTime:", &v7);
  return v3;
}

- (void)submit:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  const void **v13;
  void *specific;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  void (**v25)(_QWORD, _QWORD);
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_1666();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "completion != nil");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v12;
      _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v13 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_1666();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific(*v13);
        v20 = (void *)MEMORY[0x1E0CB3978];
        v21 = v19;
        objc_msgSend(v20, "callStackSymbols");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v19;
        v29 = 2114;
        v30 = v23;
        _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v18;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v5 = (void (**)(_QWORD, _QWORD))v4;
  v6 = objc_alloc_init(MEMORY[0x1E0CEDD78]);
  objc_msgSend(v6, "setRevision:", 1);
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52350]), "initWithRequest:", self);
    v26 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setVisionRequests:", v8);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52218]), "initWithTargetPixelCount:", 0x400000);
    objc_msgSend(v7, "setScalePolicy:", v9);

    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __45__PIColorNormalizationAutoCalculator_submit___block_invoke;
    v24[3] = &unk_1E5019A68;
    v25 = v5;
    objc_msgSend(v7, "submit:", v24);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "unsupportedError:object:", CFSTR("Feature Unavailable"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v7);
    ((void (**)(_QWORD, void *))v5)[2](v5, v10);

  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 152);
  return self;
}

- (void)setTime:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->time.value = *(_OWORD *)&a3->var0;
  self->time.epoch = var3;
}

void __45__PIColorNormalizationAutoCalculator_submit___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  _QWORD v26[3];
  _QWORD v27[3];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v25 = 0;
  objc_msgSend(a2, "result:", &v25);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v25;
  if (v3)
  {
    objc_msgSend(v3, "observations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v20 = a1;
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      objc_msgSend(v6, "adjustmentKeys");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v22 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
            objc_msgSend(v6, "adjustmentValuesForKey:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v13);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
        }
        while (v10);
      }

      v15 = objc_alloc(MEMORY[0x1E0D522A0]);
      v26[0] = CFSTR("version");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "requestRevision"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v16;
      v27[1] = v7;
      v26[1] = CFSTR("adjustments");
      v26[2] = CFSTR("score");
      v27[2] = &unk_1E50519D8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v15, "initWithResult:", v17);

      a1 = v20;
    }
    else
    {
      v19 = objc_alloc(MEMORY[0x1E0D522A0]);
      objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("No color normalization available"), 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v19, "initWithError:", v7);
    }

  }
  else
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v4);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (BOOL)isAvailable
{
  return 1;
}

+ (id)autoCalculatorWithImageData:(id)a3 orientation:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  PIColorNormalizationAutoCalculator *v11;
  void *v12;
  PIColorNormalizationAutoCalculator *v13;
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
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    NUAssertLogger_1666();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "data != nil");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v16;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v17 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_1666();
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
        v29 = v23;
        v30 = 2114;
        v31 = v27;
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
      v29 = v22;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithData:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[PIPhotoEditHelper imageSourceWithCIImage:orientation:](PIPhotoEditHelper, "imageSourceWithCIImage:orientation:", v7, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = +[PIPhotoEditHelper newComposition](PIPhotoEditHelper, "newComposition");
    v10 = +[PIPhotoEditHelper newCompositionControllerWithComposition:](PIPhotoEditHelper, "newCompositionControllerWithComposition:", v9);

    objc_msgSend(v10, "setSource:mediaType:", v8, 1);
    v11 = [PIColorNormalizationAutoCalculator alloc];
    objc_msgSend(v10, "composition");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PIColorNormalizationAutoCalculator initWithComposition:](v11, "initWithComposition:", v12);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
