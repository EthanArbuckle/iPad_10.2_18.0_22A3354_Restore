@implementation PIParallaxGreenScreenStyle

- (PIParallaxGreenScreenStyle)initWithColor:(id)a3 clockColor:(id)a4 colorSuggestions:(id)a5
{
  PFParallaxColor *v8;
  id v9;
  id v10;
  void *v11;
  PIParallaxGreenScreenStyle *v12;
  PFParallaxColor *color;
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
  objc_super v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = (PFParallaxColor *)a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    NUAssertLogger_3149();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "color != nil");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v16;
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
        v23 = dispatch_get_specific(*v17);
        v24 = (void *)MEMORY[0x1E0CB3978];
        v25 = v23;
        objc_msgSend(v24, "callStackSymbols");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v23;
        v31 = 2114;
        v32 = v27;
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
      v30 = v22;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v11 = v10;
  v28.receiver = self;
  v28.super_class = (Class)PIParallaxGreenScreenStyle;
  v12 = -[PIParallaxStyle initWithClockColor:colorSuggestions:](&v28, sel_initWithClockColor_colorSuggestions_, v9, v10);
  color = v12->_color;
  v12->_color = v8;

  return v12;
}

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
  v7[1] = *MEMORY[0x1E0D75638];
  -[PIParallaxGreenScreenStyle color](self, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)kind
{
  return (id)*MEMORY[0x1E0D755E0];
}

- (id)recipeIdentifier
{
  return CFSTR("GreenScreenGradient");
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
    -[PIParallaxGreenScreenStyle setColor:](self, "setColor:", v6);

  }
  return v5 != 0;
}

- (BOOL)hasColorParameter
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
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = -[PIParallaxColorSuggester initWithColorAnalysis:]([PIParallaxColorSuggester alloc], "initWithColorAnalysis:", v4);
  objc_msgSend(v4, "backgroundColors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[PIParallaxColorPalette greenScreenMutedPalette](PIParallaxColorPalette, "greenScreenMutedPalette");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxColorSuggester suggestedColorsForColors:fromColorPalette:](v5, "suggestedColorsForColors:fromColorPalette:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  PFMap();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "primaryColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0D75170], "whiteColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithColor:clockColor:colorSuggestions:", v11, v13, v9);

  return v14;
}

+ (id)styleWithParameters:(id)a3 colorSuggestions:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v6 = *MEMORY[0x1E0D75638];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D75620]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D75170], "whiteColor");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithColor:clockColor:colorSuggestions:", v9, v12, v7);
  return v13;
}

id __53__PIParallaxGreenScreenStyle_styleWithColorAnalysis___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0D751C8];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithPrimaryColor:secondaryColor:", v3, 0);

  return v4;
}

@end
