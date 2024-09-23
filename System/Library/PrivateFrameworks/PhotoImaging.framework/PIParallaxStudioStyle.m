@implementation PIParallaxStudioStyle

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
  v7[1] = *MEMORY[0x1E0D75658];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PIParallaxStudioStyle tonality](self, "tonality"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)kind
{
  return (id)*MEMORY[0x1E0D75608];
}

- (id)recipeIdentifier
{
  if (-[PIParallaxStudioStyle tonality](self, "tonality") == 3)
    return CFSTR("StudioBright");
  else
    return CFSTR("StudioDark");
}

- (BOOL)configureForCategory:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D756B8]);
}

- (BOOL)hasTonalityMode
{
  return 1;
}

- (int64_t)tonality
{
  return self->tonality;
}

- (void)setTonality:(int64_t)a3
{
  self->tonality = a3;
}

+ (id)styleWithColorAnalysis:(id)a3
{
  double v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;

  objc_msgSend(a3, "backgroundLuminance");
  if (v4 < 0.35)
  {
    objc_msgSend(MEMORY[0x1E0D75170], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D75170], "blackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 3;
  }
  v7 = objc_alloc((Class)a1);
  v8 = (void *)objc_msgSend(v7, "initWithClockColor:colorSuggestions:", v5, MEMORY[0x1E0C9AA60]);
  objc_msgSend(v8, "setTonality:", v6);

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
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v19;
  void *v20;
  const void **v21;
  void *specific;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    NUAssertLogger_3149();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "parameters != nil");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v20;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v21 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3149();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v27 = dispatch_get_specific(*v21);
        v28 = (void *)MEMORY[0x1E0CB3978];
        v29 = v27;
        objc_msgSend(v28, "callStackSymbols");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v27;
        v34 = 2114;
        v35 = v31;
        _os_log_error_impl(&dword_1A6382000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v24)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v26;
      _os_log_error_impl(&dword_1A6382000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

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

  v13 = *MEMORY[0x1E0D75658];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D75658]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "integerValue");

  }
  else
  {
    v16 = 3;
  }
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithClockColor:colorSuggestions:", v12, v8);
  objc_msgSend(v17, "setTonality:", v16);

  return v17;
}

@end
