@implementation PIParallaxStyle

- (PIParallaxStyle)init
{
  void *v3;
  PIParallaxStyle *v4;

  objc_msgSend(MEMORY[0x1E0D75170], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PIParallaxStyle initWithClockColor:colorSuggestions:](self, "initWithClockColor:colorSuggestions:", v3, MEMORY[0x1E0C9AA60]);

  return v4;
}

- (PIParallaxStyle)initWithClockColor:(id)a3 colorSuggestions:(id)a4
{
  PFParallaxColor *v6;
  id v7;
  void *v8;
  PIParallaxStyle *v9;
  PFParallaxColor *clockColor;
  PFParallaxColor *v11;
  uint64_t v12;
  NSArray *colorSuggestions;
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
  v6 = (PFParallaxColor *)a3;
  v7 = a4;
  if (!v6)
  {
    NUAssertLogger_3149();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "clockColor != nil");
      v16 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v16;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v17 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3149();
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
  v8 = v7;
  if (!v7)
  {
    NUAssertLogger_3149();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "suggestions != nil");
      v23 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v23;
      _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v17 = (const void **)MEMORY[0x1E0D51D48];
    v24 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3149();
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
  v37.receiver = self;
  v37.super_class = (Class)PIParallaxStyle;
  v9 = -[PIParallaxStyle init](&v37, sel_init);
  clockColor = v9->_clockColor;
  v9->_clockColor = v6;
  v11 = v6;

  v12 = objc_msgSend(v8, "copy");
  colorSuggestions = v9->_colorSuggestions;
  v9->_colorSuggestions = (NSArray *)v12;

  v9->_clockVibrancy = 0.0;
  return v9;
}

- (PIParallaxStyle)initWithClockColor:(id)a3 vibrancy:(double)a4 colorSuggestions:(id)a5
{
  PIParallaxStyle *result;

  result = -[PIParallaxStyle initWithClockColor:colorSuggestions:](self, "initWithClockColor:colorSuggestions:", a3, a5);
  result->_clockVibrancy = a4;
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PIParallaxStyle parameters](self, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; parameters = %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PIParallaxStyle *v4;
  PIParallaxStyle *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (PIParallaxStyle *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PIParallaxStyle kind](self, "kind");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PIParallaxStyle kind](v5, "kind");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

      if (v8)
      {
        -[PIParallaxStyle bakedStyle](self, "bakedStyle");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PIParallaxStyle bakedStyle](v5, "bakedStyle");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PIParallaxStyle kind](self, "kind");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)bakedStyle
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0D751A0]);
  -[PIParallaxStyle kind](self, "kind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxStyle parameters](self, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxStyle colorSuggestions](self, "colorSuggestions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithKind:parameters:colorSuggestions:", v4, v5, v6);

  return v7;
}

- (NSDictionary)parameters
{
  _QWORD *v2;
  os_log_t *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  os_log_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  os_log_t v16;
  void *specific;
  void *v18;
  id v19;
  void *v20;
  objc_class *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  _QWORD *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    goto LABEL_15;
  while (1)
  {
    v3 = (os_log_t *)MEMORY[0x1E0D52380];
    v4 = (void *)*MEMORY[0x1E0D52380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = v4;
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v9;
      _os_log_error_impl(&dword_1A6382000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      v10 = *v2;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
      {
        if (v10 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_278);
LABEL_7:
        v11 = *v3;
        if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
        {
          v12 = (void *)MEMORY[0x1E0CB3978];
          v13 = v11;
          objc_msgSend(v12, "callStackSymbols");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v23 = v15;
          _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v10 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_278);
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
    {
      goto LABEL_7;
    }
    v16 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      v18 = (void *)MEMORY[0x1E0CB3978];
      v19 = specific;
      v13 = v16;
      objc_msgSend(v18, "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
      v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = specific;
      v24 = 2114;
      v25 = v2;
      _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_278);
  }
}

- (NSString)kind
{
  _QWORD *v2;
  os_log_t *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  os_log_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  os_log_t v16;
  void *specific;
  void *v18;
  id v19;
  void *v20;
  objc_class *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  _QWORD *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    goto LABEL_15;
  while (1)
  {
    v3 = (os_log_t *)MEMORY[0x1E0D52380];
    v4 = (void *)*MEMORY[0x1E0D52380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = v4;
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v9;
      _os_log_error_impl(&dword_1A6382000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      v10 = *v2;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
      {
        if (v10 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_278);
LABEL_7:
        v11 = *v3;
        if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
        {
          v12 = (void *)MEMORY[0x1E0CB3978];
          v13 = v11;
          objc_msgSend(v12, "callStackSymbols");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v23 = v15;
          _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v10 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_278);
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
    {
      goto LABEL_7;
    }
    v16 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      v18 = (void *)MEMORY[0x1E0CB3978];
      v19 = specific;
      v13 = v16;
      objc_msgSend(v18, "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
      v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = specific;
      v24 = 2114;
      v25 = v2;
      _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_278);
  }
}

- (NSString)recipeIdentifier
{
  _QWORD *v2;
  os_log_t *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  os_log_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  os_log_t v16;
  void *specific;
  void *v18;
  id v19;
  void *v20;
  objc_class *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  _QWORD *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    goto LABEL_15;
  while (1)
  {
    v3 = (os_log_t *)MEMORY[0x1E0D52380];
    v4 = (void *)*MEMORY[0x1E0D52380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = v4;
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v9;
      _os_log_error_impl(&dword_1A6382000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      v10 = *v2;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
      {
        if (v10 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_278);
LABEL_7:
        v11 = *v3;
        if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
        {
          v12 = (void *)MEMORY[0x1E0CB3978];
          v13 = v11;
          objc_msgSend(v12, "callStackSymbols");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v23 = v15;
          _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v10 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_278);
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
    {
      goto LABEL_7;
    }
    v16 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      v18 = (void *)MEMORY[0x1E0CB3978];
      v19 = specific;
      v13 = v16;
      objc_msgSend(v18, "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
      v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = specific;
      v24 = 2114;
      v25 = v2;
      _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_278);
  }
}

- (NSString)inactiveRecipeIdentifier
{
  void *v2;
  void *v3;

  -[PIParallaxStyle recipeIdentifier](self, "recipeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("-Inactive"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)clockFont
{
  void *v2;
  void *v3;

  -[PIParallaxStyle kind](self, "kind");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PIParallaxStyleClockFontForKind(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isSegmented
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1E0D751A0];
  -[PIParallaxStyle kind](self, "kind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "isSegmentedStyle:", v3);

  return (char)v2;
}

- (BOOL)hasTonalityMode
{
  return 0;
}

- (BOOL)hasColorParameter
{
  return 0;
}

- (BOOL)hasBackgroundParameter
{
  return 0;
}

- (BOOL)hasHeadroomLook
{
  return 0;
}

- (id)filter
{
  void *v3;
  void *v4;
  void *v5;

  -[PIParallaxStyle recipeIdentifier](self, "recipeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIParallaxStyle _filterForRecipeIdentifier:](PIParallaxStyle, "_filterForRecipeIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PIParallaxStyle parameters](self, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setParameters:", v5);

  return v4;
}

- (id)inactiveFilter
{
  void *v3;
  void *v4;
  void *v5;

  -[PIParallaxStyle inactiveRecipeIdentifier](self, "inactiveRecipeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIParallaxStyle _filterForRecipeIdentifier:](PIParallaxStyle, "_filterForRecipeIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PIParallaxStyle parameters](self, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setParameters:", v5);

  return v4;
}

- (PIParallaxStyleRecipe)recipe
{
  void *v2;
  PIParallaxStyleRecipe *v3;

  -[PIParallaxStyle recipeIdentifier](self, "recipeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIParallaxStyleRecipeRegistry recipeForIdentifier:](PIParallaxStyleRecipeRegistry, "recipeForIdentifier:", v2);
  v3 = (PIParallaxStyleRecipe *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    v3 = objc_alloc_init(PIParallaxStyleRecipe);
  return v3;
}

- (id)colorSuggestionForCategory:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D756C0])
    || objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D756B0]))
  {
    -[PIParallaxStyle colorSuggestions](self, "colorSuggestions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PFFind();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)configureForCategory:(id)a3
{
  id v3;
  _QWORD *v4;
  os_log_t *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  os_log_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  os_log_t v18;
  void *specific;
  void *v20;
  id v21;
  void *v22;
  objc_class *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  _QWORD *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (_QWORD *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    goto LABEL_15;
  while (1)
  {
    v5 = (os_log_t *)MEMORY[0x1E0D52380];
    v6 = (void *)*MEMORY[0x1E0D52380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = v6;
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v11;
      _os_log_error_impl(&dword_1A6382000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      v12 = *v4;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
      {
        if (v12 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_278);
LABEL_7:
        v13 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
        {
          v14 = (void *)MEMORY[0x1E0CB3978];
          v15 = v13;
          objc_msgSend(v14, "callStackSymbols");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v25 = v17;
          _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v12 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_278);
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
    {
      goto LABEL_7;
    }
    v18 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      v20 = (void *)MEMORY[0x1E0CB3978];
      v21 = specific;
      v15 = v18;
      objc_msgSend(v20, "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = specific;
      v26 = 2114;
      v27 = v4;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_278);
  }
}

- (id)defaultDominantColorWithAnalysis:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "colors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (PFParallaxColor)clockColor
{
  return self->_clockColor;
}

- (void)setClockColor:(id)a3
{
  objc_storeStrong((id *)&self->_clockColor, a3);
}

- (double)clockVibrancy
{
  return self->_clockVibrancy;
}

- (NSArray)colorSuggestions
{
  return self->_colorSuggestions;
}

- (void)setColorSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_colorSuggestions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clockColor, 0);
  objc_storeStrong((id *)&self->_colorSuggestions, 0);
}

uint64_t __46__PIParallaxStyle_colorSuggestionForCategory___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "primaryColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCool");

  return v3;
}

uint64_t __46__PIParallaxStyle_colorSuggestionForCategory___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "primaryColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isWarm");

  return v3;
}

+ (PIParallaxStyle)styleWithColorAnalysis:(id)a3
{
  id v3;
  _QWORD *v4;
  os_log_t *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  os_log_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  os_log_t v18;
  void *specific;
  void *v20;
  id v21;
  void *v22;
  objc_class *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  _QWORD *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (_QWORD *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    goto LABEL_15;
  while (1)
  {
    v5 = (os_log_t *)MEMORY[0x1E0D52380];
    v6 = (void *)*MEMORY[0x1E0D52380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = v6;
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v11;
      _os_log_error_impl(&dword_1A6382000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      v12 = *v4;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
      {
        if (v12 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_278);
LABEL_7:
        v13 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
        {
          v14 = (void *)MEMORY[0x1E0CB3978];
          v15 = v13;
          objc_msgSend(v14, "callStackSymbols");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v25 = v17;
          _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v12 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_278);
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
    {
      goto LABEL_7;
    }
    v18 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      v20 = (void *)MEMORY[0x1E0CB3978];
      v21 = specific;
      v15 = v18;
      objc_msgSend(v20, "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = specific;
      v26 = 2114;
      v27 = v4;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_278);
  }
}

+ (id)_filterForRecipeIdentifier:(id)a3
{
  void *v3;
  PIParallaxRecipeFilter *v4;

  +[PIParallaxStyleRecipeRegistry recipeForIdentifier:](PIParallaxStyleRecipeRegistry, "recipeForIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[PIParallaxRecipeFilter initWithRecipe:]([PIParallaxRecipeFilter alloc], "initWithRecipe:", v3);
  else
    v4 = 0;

  return v4;
}

+ (id)defaultStyleForKind:(id)a3 colorAnalysis:(id)a4
{
  id v5;
  id v6;
  __objc2_class **v7;
  void *v8;
  NSObject *v10;
  void *v11;
  const void **v12;
  void *specific;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  SEL v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D75600]) & 1) != 0)
  {
    v7 = off_1E5013000;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D75608]) & 1) != 0)
  {
    v7 = off_1E5013020;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D755B8]) & 1) != 0)
  {
    v7 = off_1E5012F60;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D755B0]) & 1) != 0)
  {
    v7 = off_1E5012F58;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D755C8]) & 1) != 0
         || (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D755C0]) & 1) != 0)
  {
    v7 = off_1E5012F88;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D755D8]) & 1) != 0)
  {
    v7 = off_1E5012FA8;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D755D0]) & 1) != 0)
  {
    v7 = off_1E5012FA0;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D755E0]) & 1) != 0)
  {
    v7 = off_1E5012FD0;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D755F8]) & 1) != 0)
  {
    v7 = off_1E5012FC8;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D755E8]) & 1) != 0)
  {
    v7 = off_1E5012FB8;
  }
  else
  {
    if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D755F0]) & 1) == 0)
    {
      NUAssertLogger_3149();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown style kind: %@"), v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v28 = v11;
        _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      v12 = (const void **)MEMORY[0x1E0D51D48];
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      NUAssertLogger_3149();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v15)
        {
          v18 = dispatch_get_specific(*v12);
          v19 = (void *)MEMORY[0x1E0CB3978];
          v20 = v18;
          objc_msgSend(v19, "callStackSymbols");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v28 = v18;
          v29 = 2114;
          v30 = v22;
          _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        }
      }
      else if (v15)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v28 = v17;
        _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      v23 = (void *)_NUAssertFailHandler();
      +[PIParallaxStyle styleWithParameters:colorSuggestions:](v23, v24, v25, v26);
    }
    v7 = off_1E5012FC0;
  }
  -[__objc2_class styleWithColorAnalysis:](*v7, "styleWithColorAnalysis:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (PIParallaxStyle)styleWithParameters:(id)a3 colorSuggestions:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  os_log_t *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  os_log_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  os_log_t v21;
  void *specific;
  void *v23;
  id v24;
  void *v25;
  objc_class *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  _QWORD *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (_QWORD *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    goto LABEL_15;
  while (1)
  {
    v8 = (os_log_t *)MEMORY[0x1E0D52380];
    v9 = (void *)*MEMORY[0x1E0D52380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = v9;
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v14;
      _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      v15 = *v7;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
      {
        if (v15 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_278);
LABEL_7:
        v16 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
        {
          v17 = (void *)MEMORY[0x1E0CB3978];
          v18 = v16;
          objc_msgSend(v17, "callStackSymbols");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v28 = v20;
          _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v15 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_278);
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
    {
      goto LABEL_7;
    }
    v21 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      v23 = (void *)MEMORY[0x1E0CB3978];
      v24 = specific;
      v18 = v21;
      objc_msgSend(v23, "callStackSymbols");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
      v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = specific;
      v29 = 2114;
      v30 = v7;
      _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_278);
  }
}

+ (PIParallaxStyle)styleWithBakedStyle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  __objc2_class **v7;
  void *v8;
  NSObject *v10;
  void *v11;
  const void **v12;
  void *specific;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  SEL v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "kind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorSuggestions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D75600]) & 1) != 0)
  {
    v7 = off_1E5013000;
LABEL_12:
    -[__objc2_class styleWithParameters:colorSuggestions:](*v7, "styleWithParameters:colorSuggestions:", v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return (PIParallaxStyle *)v8;
  }
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D75608]) & 1) != 0)
  {
LABEL_4:
    v7 = off_1E5013020;
    goto LABEL_12;
  }
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D755B8]) & 1) != 0)
    goto LABEL_6;
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D755B0]) & 1) != 0)
  {
    v7 = off_1E5012F58;
    goto LABEL_12;
  }
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D755C8]) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D755C0]) & 1) != 0)
  {
    v7 = off_1E5012F88;
    goto LABEL_12;
  }
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D755D8]) & 1) != 0)
  {
    v7 = off_1E5012FA8;
    goto LABEL_12;
  }
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D755D0]) & 1) != 0)
  {
    v7 = off_1E5012FA0;
    goto LABEL_12;
  }
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D755E0]) & 1) != 0)
  {
    v7 = off_1E5012FD0;
    goto LABEL_12;
  }
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D755F8]) & 1) != 0)
  {
    v7 = off_1E5012FC8;
    goto LABEL_12;
  }
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D755E8]) & 1) != 0)
  {
    v7 = off_1E5012FB8;
    goto LABEL_12;
  }
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D755F0]) & 1) != 0)
  {
    v7 = off_1E5012FC0;
    goto LABEL_12;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("StudioBright")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("StudioDark")) & 1) != 0)
  {
    goto LABEL_4;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("BlackWhiteHighKey")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("BlackWhiteStage")) & 1) != 0)
  {
LABEL_6:
    v7 = off_1E5012F60;
    goto LABEL_12;
  }
  NUAssertLogger_3149();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown style kind: %@"), v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v11;
    _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

  }
  v12 = (const void **)MEMORY[0x1E0D51D48];
  specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
  NUAssertLogger_3149();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
  if (specific)
  {
    if (v15)
    {
      v18 = dispatch_get_specific(*v12);
      v19 = (void *)MEMORY[0x1E0CB3978];
      v20 = v18;
      objc_msgSend(v19, "callStackSymbols");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v18;
      v28 = 2114;
      v29 = v22;
      _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
  }
  else if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v17;
    _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

  }
  v23 = (void *)_NUAssertFailHandler();
  return (PIParallaxStyle *)+[PIParallaxStyle colorPaletteWithStyleKind:](v23, v24, v25);
}

+ (id)colorPaletteWithStyleKind:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if (!objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D755C8]))
  {
    if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D755D8]))
    {
      +[PIParallaxColorPalette colorWashSinglePalette](PIParallaxColorPalette, "colorWashSinglePalette");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D755D0]))
    {
      +[PIParallaxColorPalette colorWashDuotonePalette](PIParallaxColorPalette, "colorWashDuotonePalette");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D755E0]))
    {
      +[PIParallaxColorPalette greenScreenMutedPalette](PIParallaxColorPalette, "greenScreenMutedPalette");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    if (!objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D755F8])
      && !objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D755F0]))
    {
      v5 = 0;
      goto LABEL_10;
    }
  }
  +[PIParallaxColorPalette greenScreenVibrantPalette](PIParallaxColorPalette, "greenScreenVibrantPalette");
  v4 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v5 = (void *)v4;
LABEL_10:

  return v5;
}

+ (id)defaultOriginalStyle
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0D75170], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithClockColor:colorSuggestions:", v3, MEMORY[0x1E0C9AA60]);

  return v4;
}

@end
