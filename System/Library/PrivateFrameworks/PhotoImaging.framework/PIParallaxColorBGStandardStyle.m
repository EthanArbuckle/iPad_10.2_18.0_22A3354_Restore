@implementation PIParallaxColorBGStandardStyle

- (PIParallaxColorBGStandardStyle)initWithColor:(id)a3 background:(BOOL)a4 clockColor:(id)a5 colorSuggestions:(id)a6
{
  PFParallaxColor *v10;
  id v11;
  id v12;
  void *v13;
  PIParallaxColorBGStandardStyle *v14;
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "backgroundColor != nil");
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
  v30.super_class = (Class)PIParallaxColorBGStandardStyle;
  v14 = -[PIParallaxStyle initWithClockColor:colorSuggestions:](&v30, sel_initWithClockColor_colorSuggestions_, v11, v12);
  color = v14->_color;
  v14->_color = v10;

  v14->_showsBackground = a4;
  return v14;
}

- (id)parameters
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  NSObject *v24;
  void *v25;
  _QWORD v26[5];
  _QWORD v27[5];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D75170]);
  -[PIParallaxColorBGStandardStyle color](self, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hue");
  v5 = (void *)objc_msgSend(v3, "initWithHue:tone:");

  -[PIParallaxColorBGStandardStyle color](self, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tone");
  v8 = v7;

  v9 = (v8 + -0.2) / 0.6;
  v10 = fmax(v9 * -2.0 + 1.0, 0.0);
  v11 = fmax(v9 * 2.0 + -1.0, 0.0);
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_279);
  v12 = fmin(v10, 1.0);
  v13 = fmin(v11, 1.0);
  v14 = (void *)*MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEBUG))
  {
    v24 = v14;
    -[PIParallaxColorBGStandardStyle color](self, "color");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v29 = v25;
    v30 = 2112;
    v31 = v5;
    v32 = 2048;
    v33 = v12;
    v34 = 2048;
    v35 = v13;
    _os_log_debug_impl(&dword_1A6382000, v24, OS_LOG_TYPE_DEBUG, "ColorBG color: %@ -> neutral: %@ lowKey: %0.3f highKey: %0.3f", buf, 0x2Au);

  }
  -[PIParallaxStyle clockColor](self, "clockColor", *MEMORY[0x1E0D75620]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0D75638];
  v27[0] = v15;
  v27[1] = v5;
  v17 = *MEMORY[0x1E0D75650];
  v26[1] = v16;
  v26[2] = v17;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v18;
  v26[3] = *MEMORY[0x1E0D75648];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v19;
  v26[4] = *MEMORY[0x1E0D75618];
  v20 = -[PIParallaxColorBGStandardStyle showsBackground](self, "showsBackground");
  v21 = &unk_1E5051A48;
  if (v20)
    v21 = &unk_1E5051A38;
  v27[4] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)kind
{
  return (id)*MEMORY[0x1E0D755C8];
}

- (id)recipeIdentifier
{
  return CFSTR("ColorBGStandard");
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
    -[PIParallaxColorBGStandardStyle setColor:](self, "setColor:", v6);

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

+ (double)lowKeyTone
{
  return 0.2;
}

+ (double)neutralTone
{
  return 0.5;
}

+ (double)highKeyTone
{
  return 0.8;
}

+ (id)styleWithColorAnalysis:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  PIParallaxColorSuggester *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  __CFString *v22;
  NSObject *v23;
  uint64_t v24;
  uint8_t buf[4];
  __CFString *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PIGlobalSettings globalSettings](PIGlobalSettings, "globalSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "parallaxStyleKeyLevelOverride");

  if (!v6)
  {
    objc_msgSend(v4, "backgroundLuminance");
    v8 = 3;
    if (v7 < 0.67)
      v8 = 2;
    if (v7 < 0.33)
      v9 = 1;
    else
      v9 = v8;
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_279);
    v10 = (void *)*MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEBUG))
    {
      v22 = off_1E5015C38[v9 - 1];
      v23 = v10;
      objc_msgSend(v4, "backgroundLuminance");
      *(_DWORD *)buf = 138412546;
      v26 = v22;
      v27 = 2048;
      v28 = v24;
      _os_log_debug_impl(&dword_1A6382000, v23, OS_LOG_TYPE_DEBUG, "ColorBGStandard: suggested %@ for background luminance of %.2f", buf, 0x16u);

    }
  }
  v11 = -[PIParallaxColorSuggester initWithColorAnalysis:]([PIParallaxColorSuggester alloc], "initWithColorAnalysis:", v4);
  objc_msgSend(v4, "backgroundColors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIParallaxColorPalette greenScreenVibrantPalette](PIParallaxColorPalette, "greenScreenVibrantPalette");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxColorSuggester suggestedColorsForColors:fromColorPalette:](v11, "suggestedColorsForColors:fromColorPalette:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  PFMap();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "primaryColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0D75170], "whiteColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithColor:background:clockColor:colorSuggestions:", v17, 1, v19, v15);

  return v20;
}

+ (id)styleWithParameters:(id)a3 colorSuggestions:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  _BOOL8 v27;
  void *v28;

  v6 = a3;
  v7 = *MEMORY[0x1E0D75638];
  v8 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D75650]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D75648]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  v16 = -v12;
  if (v15 > 0.0)
    v16 = v15;
  v17 = (v16 + 1.0) * 0.5 * 0.6 + 0.2;
  objc_msgSend(v9, "hue");
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75170]), "initWithHue:tone:", v18, v17);
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D75620]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    v22 = v20;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D75170], "whiteColor");
    v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  v23 = v22;

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D75618]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    objc_msgSend(v24, "doubleValue");
    v27 = v26 < 1.0;
  }
  else
  {
    v27 = 1;
  }
  v28 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithColor:background:clockColor:colorSuggestions:", v19, v27, v23, v8);

  return v28;
}

id __57__PIParallaxColorBGStandardStyle_styleWithColorAnalysis___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  double v6;
  double v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x1E0D75170];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(v4, "hue");
  v7 = v6;

  v8 = (void *)objc_msgSend(v5, "initWithHue:tone:", v7, *(double *)(a1 + 32));
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D751C8]), "initWithPrimaryColor:secondaryColor:", v8, 0);

  return v9;
}

@end
