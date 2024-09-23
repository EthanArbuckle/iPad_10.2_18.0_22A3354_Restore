@implementation _PIParallaxClockMaterialJob

- (BOOL)wantsRenderStage
{
  return 1;
}

- (BOOL)wantsOutputImage
{
  return 0;
}

- (BOOL)wantsOutputGeometry
{
  return 0;
}

- (BOOL)wantsCompleteStage
{
  return 0;
}

- (id)scalePolicy
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D52218]), "initWithTargetPixelCount:", 0x80000);
}

- (BOOL)render:(id *)a3
{
  void *v5;
  void *v6;
  PIParallaxLuminanceCalculator *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
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
  if (!a3)
  {
    NUAssertLogger_2642();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v16;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v17 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_2642();
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
  -[NURenderJob renderer:](self, "renderer:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[_PIParallaxClockMaterialJob clockMaterialRequest](self, "clockMaterialRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(PIParallaxLuminanceCalculator);
    objc_msgSend(v6, "layerStack");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v6, "layerStack");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "style");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PIParallaxLuminanceCalculator calculateClockLuminanceValuesForLayerStack:style:renderer:error:](v7, "calculateClockLuminanceValuesForLayerStack:style:renderer:error:", v9, v10, v5, a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PIParallaxClockMaterialJob setLuminanceValue:](self, "setLuminanceValue:", v11);

      -[_PIParallaxClockMaterialJob luminanceValue](self, "luminanceValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12 != 0;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Request needs either a layerStack or a segmentationItem"), v6);
      v13 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)result
{
  _PIParallaxClockMaterialResult *v3;
  void *v4;
  _PIParallaxClockMaterialResult *v5;

  v3 = [_PIParallaxClockMaterialResult alloc];
  -[_PIParallaxClockMaterialJob luminanceValue](self, "luminanceValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v5 = -[_PIParallaxClockMaterialResult initWithClockAreaLuminance:](v3, "initWithClockAreaLuminance:");

  return v5;
}

- (NSNumber)luminanceValue
{
  return self->_luminanceValue;
}

- (void)setLuminanceValue:(id)a3
{
  objc_storeStrong((id *)&self->_luminanceValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_luminanceValue, 0);
}

@end
