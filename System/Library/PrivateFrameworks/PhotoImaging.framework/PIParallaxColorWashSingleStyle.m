@implementation PIParallaxColorWashSingleStyle

- (PIParallaxColorWashSingleStyle)initWithColor:(id)a3 background:(BOOL)a4 clockColor:(id)a5 suggestions:(id)a6
{
  PFParallaxColor *v10;
  id v11;
  id v12;
  void *v13;
  PIParallaxColorWashSingleStyle *v14;
  PFParallaxColor *color;
  NSObject *v17;
  void *v18;
  const void **v19;
  void *specific;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  objc_super v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = (PFParallaxColor *)a3;
  v11 = a5;
  v12 = a6;
  if (!v10)
  {
    NUAssertLogger_3149();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "color != nil");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v18;
      _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v19 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3149();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v25 = dispatch_get_specific(*v19);
        v26 = (void *)MEMORY[0x1E0CB3978];
        v27 = v25;
        objc_msgSend(v26, "callStackSymbols");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v25;
        v33 = 2114;
        v34 = v29;
        _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v22)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v24;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v13 = v12;
  v30.receiver = self;
  v30.super_class = (Class)PIParallaxColorWashSingleStyle;
  v14 = -[PIParallaxStyle initWithClockColor:colorSuggestions:](&v30, sel_initWithClockColor_colorSuggestions_, v11, v12);
  color = v14->_color;
  v14->_color = v10;

  v14->_showsBackground = a4;
  return v14;
}

- (id)parameters
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v9[0] = *MEMORY[0x1E0D75638];
  -[PIParallaxColorWashSingleStyle color](self, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = *MEMORY[0x1E0D75620];
  -[PIParallaxStyle clockColor](self, "clockColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = *MEMORY[0x1E0D75618];
  v5 = -[PIParallaxColorWashSingleStyle showsBackground](self, "showsBackground");
  v6 = &unk_1E5051A48;
  if (v5)
    v6 = &unk_1E5051A38;
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)kind
{
  return (id)*MEMORY[0x1E0D755D8];
}

- (id)recipeIdentifier
{
  return (id)*MEMORY[0x1E0D755D8];
}

- (BOOL)configureForCategory:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[PIParallaxStyle colorSuggestionForCategory:](self, "colorSuggestionForCategory:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "primaryColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIParallaxColorWashSingleStyle setColor:](self, "setColor:", v6);

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

- (PFParallaxColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (BOOL)showsBackground
{
  return self->_showsBackground;
}

- (void)setShowsBackground:(BOOL)a3
{
  self->_showsBackground = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

+ (id)styleWithColorAnalysis:(id)a3
{
  id v4;
  PIParallaxColorSuggester *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  v5 = -[PIParallaxColorSuggester initWithColorAnalysis:]([PIParallaxColorSuggester alloc], "initWithColorAnalysis:", v4);
  -[PIParallaxColorSuggester addRuleWithHueMin:hueMax:suggestion:](v5, "addRuleWithHueMin:hueMax:suggestion:", &__block_literal_global_212, 50.0, 110.0);
  objc_msgSend(v4, "backgroundColors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[PIGlobalSettings globalSettings](PIGlobalSettings, "globalSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "parallaxStyleAvoidColorWashBrownOverride");

  if (v8)
  {
    PFMap();
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
  }
  +[PIParallaxColorPalette colorWashSinglePalette](PIParallaxColorPalette, "colorWashSinglePalette");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxColorSuggester suggestedColorsForColors:fromColorPalette:](v5, "suggestedColorsForColors:fromColorPalette:", v6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  PFMap();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc((Class)a1);
  objc_msgSend(v11, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D75170], "whiteColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v13, "initWithColor:background:clockColor:suggestions:", v14, 1, v15, v12);

  return v16;
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
  double v13;
  _BOOL8 v14;
  void *v15;
  NSObject *v17;
  void *v18;
  const void **v19;
  void *specific;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    NUAssertLogger_3149();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "parameters != nil");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v18;
      _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v19 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3149();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v25 = dispatch_get_specific(*v19);
        v26 = (void *)MEMORY[0x1E0CB3978];
        v27 = v25;
        objc_msgSend(v26, "callStackSymbols");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v25;
        v32 = 2114;
        v33 = v29;
        _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v22)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v24;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v8 = v7;
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D75638]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D75620]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D75618]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "doubleValue");
    v14 = v13 < 1.0;
  }
  else
  {
    v14 = 1;
  }
  v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithColor:background:clockColor:suggestions:", v9, v14, v10, v8);

  return v15;
}

id __57__PIParallaxColorWashSingleStyle_styleWithColorAnalysis___block_invoke_3(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0D751C8];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithPrimaryColor:secondaryColor:", v3, 0);

  return v4;
}

id __57__PIParallaxColorWashSingleStyle_styleWithColorAnalysis___block_invoke_2(uint64_t a1, void *a2)
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
  v8 = v7 + -30.0;
  objc_msgSend(v3, "chroma");
  v10 = v9;

  return (id)objc_msgSend(v4, "initWithLuma:hue:chroma:", v6, v8, v10);
}

id __57__PIParallaxColorWashSingleStyle_styleWithColorAnalysis___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;

  v4 = a2;
  objc_msgSend(a3, "foregroundLuminance");
  if (v5 < 0.67)
  {
    objc_msgSend(v4, "hue");
    v7 = v6;
    objc_msgSend(v4, "hue");
    v9 = 30.0;
    if (v7 < 80.0)
      v9 = -30.0;
    v10 = v8 + v9;
    v11 = objc_alloc(MEMORY[0x1E0D75170]);
    objc_msgSend(v4, "luma");
    v13 = v12;
    objc_msgSend(v4, "chroma");
    v15 = objc_msgSend(v11, "initWithLuma:hue:chroma:", v13, v10, v14);

    v4 = (id)v15;
  }
  return v4;
}

@end
