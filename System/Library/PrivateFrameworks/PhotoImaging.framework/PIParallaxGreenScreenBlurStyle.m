@implementation PIParallaxGreenScreenBlurStyle

- (PIParallaxGreenScreenBlurStyle)initWithColor:(id)a3 clockColor:(id)a4 colorSuggestions:(id)a5
{
  PFParallaxColor *v8;
  id v9;
  id v10;
  void *v11;
  PIParallaxGreenScreenBlurStyle *v12;
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
  v28.super_class = (Class)PIParallaxGreenScreenBlurStyle;
  v12 = -[PIParallaxStyle initWithClockColor:colorSuggestions:](&v28, sel_initWithClockColor_colorSuggestions_, v9, v10);
  color = v12->_color;
  v12->_color = v8;

  return v12;
}

- (id)parameters
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  -[PIParallaxGreenScreenBlurStyle color](self, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxGreenScreenBlurStyle color](self, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "luma");
  v6 = v5;

  v7 = (v6 + -0.2) / 0.6;
  v8 = fmin(fmax(v7 * -2.0 + 1.0, 0.0), 1.0);
  v9 = fmin(fmax(v7 * 2.0 + -1.0, 0.0), 1.0);
  v17[0] = *MEMORY[0x1E0D75620];
  -[PIParallaxStyle clockColor](self, "clockColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0D75638];
  v18[0] = v10;
  v18[1] = v3;
  v12 = *MEMORY[0x1E0D75650];
  v17[1] = v11;
  v17[2] = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v13;
  v17[3] = *MEMORY[0x1E0D75648];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)kind
{
  return (id)*MEMORY[0x1E0D755E8];
}

- (id)recipeIdentifier
{
  return CFSTR("GreenScreenBlur");
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
    -[PIParallaxGreenScreenBlurStyle setColor:](self, "setColor:", v6);

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
  void *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  objc_msgSend(a3, "backgroundColors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x1E0D75170]);
  objc_msgSend(v5, "hue");
  v8 = v7;
  objc_msgSend(v5, "chroma");
  v10 = (void *)objc_msgSend(v6, "initWithLuma:hue:chroma:", 0.5, v8, v9);
  v11 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0D75170], "whiteColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithColor:clockColor:colorSuggestions:", v10, v12, MEMORY[0x1E0C9AA60]);

  return v13;
}

+ (id)styleWithParameters:(id)a3 colorSuggestions:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;

  v6 = *MEMORY[0x1E0D75650];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D75648]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  v15 = -v11;
  if (v14 > 0.0)
    v15 = v14;
  v16 = (v15 + 1.0) * 0.5 * 0.6 + 0.2;
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D75638]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc(MEMORY[0x1E0D75170]);
  objc_msgSend(v17, "hue");
  v20 = v19;
  objc_msgSend(v17, "chroma");
  v22 = (void *)objc_msgSend(v18, "initWithLuma:hue:chroma:", v16, v20, v21);
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D75620]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = v23;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D75170], "whiteColor");
    v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  v25 = v24;

  v26 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithColor:clockColor:colorSuggestions:", v22, v25, v7);
  return v26;
}

@end
