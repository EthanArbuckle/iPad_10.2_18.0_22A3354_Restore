@implementation PIParallaxColorWashDuotoneStyle

- (PIParallaxColorWashDuotoneStyle)initWithPrimaryColor:(id)a3 secondaryColor:(id)a4 background:(BOOL)a5 clockColor:(id)a6 colorSuggestions:(id)a7
{
  PFParallaxColor *v12;
  PFParallaxColor *v13;
  id v14;
  id v15;
  void *v16;
  PIParallaxColorWashDuotoneStyle *v17;
  PFParallaxColor *primaryColor;
  PFParallaxColor *v19;
  PFParallaxColor *secondaryColor;
  NSObject *v22;
  const void **v23;
  const void **v24;
  void *specific;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  NSObject *v29;
  const void **v30;
  void *v31;
  int v32;
  void *v33;
  const void **v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  objc_super v44;
  uint8_t buf[4];
  const void **v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v12 = (PFParallaxColor *)a3;
  v13 = (PFParallaxColor *)a4;
  v14 = a6;
  v15 = a7;
  if (!v12)
  {
    NUAssertLogger_3149();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "primaryColor != nil");
      v23 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v46 = v23;
      _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v24 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3149();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        v35 = dispatch_get_specific(*v24);
        v36 = (void *)MEMORY[0x1E0CB3978];
        v37 = v35;
        objc_msgSend(v36, "callStackSymbols");
        v24 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v46 = (const void **)v35;
        v47 = 2114;
        v48 = v38;
        _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v27)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
      v24 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v46 = v24;
      _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v32 = _NUAssertFailHandler();
    goto LABEL_17;
  }
  if (!v13)
  {
    NUAssertLogger_3149();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "secondaryColor != nil");
      v30 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v46 = v30;
      _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v24 = (const void **)MEMORY[0x1E0D51D48];
    v31 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3149();
    v26 = objc_claimAutoreleasedReturnValue();
    v32 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (!v31)
    {
      if (v32)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
        v34 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v46 = v34;
        _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_19;
    }
LABEL_17:
    if (v32)
    {
      v39 = dispatch_get_specific(*v24);
      v40 = (void *)MEMORY[0x1E0CB3978];
      v41 = v39;
      objc_msgSend(v40, "callStackSymbols");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "componentsJoinedByString:", CFSTR("\n"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = (const void **)v39;
      v47 = 2114;
      v48 = v43;
      _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_19:

    _NUAssertFailHandler();
  }
  v16 = v15;
  v44.receiver = self;
  v44.super_class = (Class)PIParallaxColorWashDuotoneStyle;
  v17 = -[PIParallaxStyle initWithClockColor:colorSuggestions:](&v44, sel_initWithClockColor_colorSuggestions_, v14, v15);
  primaryColor = v17->_primaryColor;
  v17->_primaryColor = v12;
  v19 = v12;

  secondaryColor = v17->_secondaryColor;
  v17->_secondaryColor = v13;

  v17->_showsBackground = a5;
  return v17;
}

- (id)parameters
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v10[0] = *MEMORY[0x1E0D75660];
  -[PIParallaxColorWashDuotoneStyle primaryColor](self, "primaryColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = *MEMORY[0x1E0D75668];
  -[PIParallaxColorWashDuotoneStyle secondaryColor](self, "secondaryColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v10[2] = *MEMORY[0x1E0D75620];
  -[PIParallaxStyle clockColor](self, "clockColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  v10[3] = *MEMORY[0x1E0D75618];
  v6 = -[PIParallaxColorWashDuotoneStyle showsBackground](self, "showsBackground");
  v7 = &unk_1E5051A48;
  if (v6)
    v7 = &unk_1E5051A38;
  v11[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)kind
{
  return (id)*MEMORY[0x1E0D755D0];
}

- (id)recipeIdentifier
{
  return (id)*MEMORY[0x1E0D755D0];
}

- (BOOL)configureForCategory:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PIParallaxStyle colorSuggestionForCategory:](self, "colorSuggestionForCategory:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "primaryColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIParallaxColorWashDuotoneStyle setPrimaryColor:](self, "setPrimaryColor:", v6);

    objc_msgSend(v5, "secondaryColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIParallaxColorWashDuotoneStyle setSecondaryColor:](self, "setSecondaryColor:", v7);

  }
  return v5 != 0;
}

- (BOOL)hasColorParameter
{
  return 1;
}

- (BOOL)hasBackgroundParameter
{
  return 1;
}

- (BOOL)showsBackground
{
  return self->_showsBackground;
}

- (void)setShowsBackground:(BOOL)a3
{
  self->_showsBackground = a3;
}

- (PFParallaxColor)primaryColor
{
  return self->_primaryColor;
}

- (void)setPrimaryColor:(id)a3
{
  objc_storeStrong((id *)&self->_primaryColor, a3);
}

- (PFParallaxColor)secondaryColor
{
  return self->_secondaryColor;
}

- (void)setSecondaryColor:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryColor, 0);
  objc_storeStrong((id *)&self->_primaryColor, 0);
}

+ (id)styleWithColorAnalysis:(id)a3
{
  id v4;
  PIParallaxColorSuggester *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  PIParallaxColorSuggester *v17;
  void *v18;
  void *v19;
  NSObject *v21;
  void *v22;
  const void **v23;
  void *specific;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PIParallaxColorSuggester initWithColorAnalysis:]([PIParallaxColorSuggester alloc], "initWithColorAnalysis:", v4);
  objc_msgSend(v4, "backgroundColors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PFMap();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[PIParallaxColorPalette colorWashDuotonePalette](PIParallaxColorPalette, "colorWashDuotonePalette");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxColorSuggester suggestedColorsForColors:fromColorPalette:](v5, "suggestedColorsForColors:fromColorPalette:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  PFMap();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "primaryColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "secondaryColor");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    NUAssertLogger_3149();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to retrieve secondary color from palette"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v22;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v23 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3149();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        v29 = dispatch_get_specific(*v23);
        v30 = (void *)MEMORY[0x1E0CB3978];
        v31 = v29;
        objc_msgSend(v30, "callStackSymbols");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v36 = v29;
        v37 = 2114;
        v38 = v33;
        _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v26)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v28;
      _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v15 = (void *)v14;
  v16 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0D75170], "whiteColor");
  v34 = v4;
  v17 = v5;
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v16, "initWithPrimaryColor:secondaryColor:background:clockColor:colorSuggestions:", v13, v15, 1, v18, v11);

  return v19;
}

+ (id)styleWithParameters:(id)a3 colorSuggestions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  _BOOL8 v15;
  void *v16;
  NSObject *v18;
  void *v19;
  const void **v20;
  void *specific;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    NUAssertLogger_3149();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "parameters != nil");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v19;
      _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v20 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3149();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v26 = dispatch_get_specific(*v20);
        v27 = (void *)MEMORY[0x1E0CB3978];
        v28 = v26;
        objc_msgSend(v27, "callStackSymbols");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v26;
        v33 = 2114;
        v34 = v30;
        _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v25;
      _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v8 = v7;
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D75620]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D75660]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D75668]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D75618]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "doubleValue");
    v15 = v14 < 1.0;
  }
  else
  {
    v15 = 1;
  }
  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPrimaryColor:secondaryColor:background:clockColor:colorSuggestions:", v10, v11, v15, v9, v8);

  return v16;
}

uint64_t __58__PIParallaxColorWashDuotoneStyle_styleWithColorAnalysis___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "suggestionForColor:", a2);
}

id __58__PIParallaxColorWashDuotoneStyle_styleWithColorAnalysis___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v2 = (objc_class *)MEMORY[0x1E0D75170];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "luma");
  v6 = v5;
  objc_msgSend(v3, "hue");
  v8 = v7 + 30.0;
  objc_msgSend(v3, "chroma");
  v10 = v9;

  return (id)objc_msgSend(v4, "initWithLuma:hue:chroma:", v6, v8, v10);
}

@end
