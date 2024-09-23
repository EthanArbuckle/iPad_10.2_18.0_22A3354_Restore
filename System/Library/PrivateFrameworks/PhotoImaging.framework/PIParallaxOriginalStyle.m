@implementation PIParallaxOriginalStyle

- (PIParallaxOriginalStyle)initWithColorAnalysis:(id)a3
{
  id v4;
  PIParallaxOriginalStyle *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "styleWithColorAnalysis:", v4);
  v5 = (PIParallaxOriginalStyle *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)parameters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v9[0] = *MEMORY[0x1E0D75620];
  -[PIParallaxStyle clockColor](self, "clockColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = *MEMORY[0x1E0D75630];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[PIParallaxStyle clockVibrancy](self, "clockVibrancy");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  v9[2] = *MEMORY[0x1E0D75640];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PIParallaxOriginalStyle headroomLook](self, "headroomLook"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)kind
{
  return (id)*MEMORY[0x1E0D75600];
}

- (id)recipeIdentifier
{
  return CFSTR("Original");
}

- (BOOL)configureForCategory:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D756B8]);
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
  id v4;
  double v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  id v20;
  id v21;
  double v23;
  _QWORD v24[4];
  id v25;

  v4 = a3;
  objc_msgSend(v4, "backgroundLuminance");
  if (v5 < 0.35)
    v6 = 1;
  else
    v6 = 2;
  v7 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0D75170], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithClockColor:colorSuggestions:", v8, MEMORY[0x1E0C9AA60]);

  objc_msgSend(v9, "setHeadroomLook:", v6);
  if ((PFPosterEnableSmartTextColor() & 1) != 0)
  {
    objc_msgSend(v4, "foregroundColors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PFFilter();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(v4, "clockAreaColors");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __50__PIParallaxOriginalStyle_styleWithColorAnalysis___block_invoke_2;
      v24[3] = &unk_1E5015A50;
      v14 = v13;
      v25 = v14;
      objc_msgSend(v11, "sortedArrayUsingComparator:", v24);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v14)
      {
        objc_msgSend(v16, "deltaE94DistanceToColor:", v14);
        v19 = 0.0;
        if (v18 >= 2.0)
        {
          if (v18 >= 4.0)
          {
            if (v18 >= 30.0)
            {
              objc_msgSend(v17, "luma");
              if (v23 >= 0.5)
                v19 = 0.85;
              else
                v19 = 1.0;
            }
            else
            {
              v19 = 0.6;
            }
          }
          else
          {
            v19 = 0.1;
          }
        }
      }
      else
      {
        v19 = 0.8;
      }
      v21 = objc_alloc((Class)a1);
      v20 = (id)objc_msgSend(v21, "initWithClockColor:vibrancy:colorSuggestions:", v17, MEMORY[0x1E0C9AA60], v19);
      objc_msgSend(v20, "setHeadroomLook:", v6);

      v11 = v15;
    }
    else
    {
      v20 = v9;
    }

  }
  else
  {
    v20 = v9;
  }

  return v20;
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
  id v16;
  id v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v26;
  void *v27;
  const void **v28;
  void *specific;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    NUAssertLogger_3149();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "parameters != nil");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v27;
      _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v28 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3149();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v31)
      {
        v34 = dispatch_get_specific(*v28);
        v35 = (void *)MEMORY[0x1E0CB3978];
        v36 = v34;
        objc_msgSend(v35, "callStackSymbols");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v34;
        v41 = 2114;
        v42 = v38;
        _os_log_error_impl(&dword_1A6382000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v31)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v33;
      _os_log_error_impl(&dword_1A6382000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

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

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D75630]);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = &unk_1E5051A28;
  if (v13)
    v15 = (void *)v13;
  v16 = v15;

  v17 = objc_alloc((Class)a1);
  objc_msgSend(v16, "doubleValue");
  v19 = v18;

  v20 = (void *)objc_msgSend(v17, "initWithClockColor:vibrancy:colorSuggestions:", v12, v8, v19);
  v21 = *MEMORY[0x1E0D75640];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D75640]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "integerValue");

  }
  else
  {
    v24 = 1;
  }
  objc_msgSend(v20, "setHeadroomLook:", v24);

  return v20;
}

uint64_t __50__PIParallaxOriginalStyle_styleWithColorAnalysis___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "deltaE94DistanceToColor:", v5);
  v8 = v7;
  objc_msgSend(v6, "deltaE94DistanceToColor:", *(_QWORD *)(a1 + 32));
  v10 = v9;

  if (v8 > v10)
    return -1;
  else
    return v8 < v10;
}

BOOL __50__PIParallaxOriginalStyle_styleWithColorAnalysis___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  _BOOL4 v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _BOOL4 v9;
  _BOOL8 v10;

  v2 = a2;
  objc_msgSend(v2, "hue");
  if (v3 >= 30.0)
  {
    objc_msgSend(v2, "hue");
    v4 = v5 > 100.0;
  }
  else
  {
    v4 = 1;
  }
  objc_msgSend(v2, "chroma");
  v7 = v6;
  objc_msgSend(v2, "luma");
  v9 = v7 > 0.3 && v4;
  v10 = v8 > 0.25 && v9;

  return v10;
}

@end
