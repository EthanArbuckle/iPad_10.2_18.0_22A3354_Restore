@implementation PIParallaxBlackWhiteMonoStyle

- (id)parameters
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = *MEMORY[0x1E0D75620];
  -[PIParallaxStyle clockColor](self, "clockColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v7[1] = *MEMORY[0x1E0D75640];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PIParallaxBlackWhiteMonoStyle headroomLook](self, "headroomLook"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)kind
{
  return (id)*MEMORY[0x1E0D755B0];
}

- (id)recipeIdentifier
{
  return CFSTR("BlackWhiteMono");
}

- (BOOL)configureForCategory:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D756A8]);
}

- (id)defaultDominantColorWithAnalysis:(id)a3
{
  double v3;

  objc_msgSend(a3, "luminance");
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D75170]), "initWithRed:green:blue:", v3, v3, v3);
}

- (BOOL)hasHeadroomLook
{
  return 1;
}

- (int64_t)headroomLook
{
  return self->headroomLook;
}

- (void)setHeadroomLook:(int64_t)a3
{
  self->headroomLook = a3;
}

+ (id)styleWithColorAnalysis:(id)a3
{
  double v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "backgroundLuminance");
  if (v4 < 0.35)
    v5 = 1;
  else
    v5 = 2;
  v6 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0D75170], "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithClockColor:colorSuggestions:", v7, MEMORY[0x1E0C9AA60]);

  objc_msgSend(v8, "setHeadroomLook:", v5);
  return v8;
}

+ (id)styleWithParameters:(id)a3 colorSuggestions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
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
  v7 = a4;
  if (!v6)
  {
    NUAssertLogger_3149();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "parameters != nil");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v21;
      _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v22 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3149();
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
  v8 = v7;
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D75620]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D75170], "whiteColor");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  v13 = objc_alloc((Class)a1);
  v14 = (void *)objc_msgSend(v13, "initWithClockColor:colorSuggestions:", v12, MEMORY[0x1E0C9AA60]);
  v15 = *MEMORY[0x1E0D75640];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D75640]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "integerValue");

  }
  else
  {
    v18 = 1;
  }
  objc_msgSend(v14, "setHeadroomLook:", v18);

  return v14;
}

@end
