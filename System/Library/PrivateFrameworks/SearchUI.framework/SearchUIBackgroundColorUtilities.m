@implementation SearchUIBackgroundColorUtilities

+ (void)resolvedColoringForColorRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = resolvedColoringForColorRequest_completionHandler__onceToken;
  v6 = a4;
  v7 = a3;
  v9 = v7;
  if (v5 == -1)
  {
    v8 = v7;
  }
  else
  {
    dispatch_once(&resolvedColoringForColorRequest_completionHandler__onceToken, &__block_literal_global_30);
    v8 = v9;
  }
  objc_msgSend((id)resolvedColoringForColorRequest_completionHandler__colorCache, "getObjectForKey:completionHandler:", v8, v6);

}

void __86__SearchUIBackgroundColorUtilities_resolvedColoringForColorRequest_completionHandler___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)resolvedColoringForColorRequest_completionHandler__colorCache;
  resolvedColoringForColorRequest_completionHandler__colorCache = v0;

}

+ (void)computeResolvedColoringForColorRequest:(id)a3 completionHandler:(id)a4
{
  void *v4;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  char v26;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "appearance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isDark");

  if ((_DWORD)v10)
  {
    objc_msgSend(v7, "sfColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "darkModeColor");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(v7, "sfColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "darkModeColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
      goto LABEL_6;
    }
  }
  objc_msgSend(v7, "sfColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v10)
    goto LABEL_5;
LABEL_6:
  v15 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v14, "searchUI_colorGeneratorClass")), "initWithSFColor:", v14);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __93__SearchUIBackgroundColorUtilities_computeResolvedColoringForColorRequest_completionHandler___block_invoke;
  v20[3] = &unk_1EA1F8278;
  v24 = v8;
  v25 = a1;
  v21 = v7;
  v22 = v15;
  v26 = v10;
  v23 = v14;
  v16 = v8;
  v17 = v14;
  v18 = v15;
  v19 = v7;
  objc_msgSend(v18, "generateUIColorsIsDark:completionHandler:", v10, v20);

}

void __93__SearchUIBackgroundColorUtilities_computeResolvedColoringForColorRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _BOOL8 v10;
  uint64_t v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 64), "isDefaultUIColorInUIColors:", v3);
  objc_msgSend(*(id *)(a1 + 32), "sfColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "colorTintStyle");

  if (!(_DWORD)v6)
    v6 = objc_msgSend(*(id *)(a1 + 40), "defaultTintStyle");
  objc_msgSend(*(id *)(a1 + 64), "tintedUIColorsFromUIColors:withColorRequest:tintStyle:", v3, *(_QWORD *)(a1 + 32), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "averageColorOfUIColors:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v6 == 1)
  {
    if ((objc_msgSend(*(id *)(a1 + 64), "backgroundColorPrefersWhiteForegroundText:", v8) & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_6;
    }
  }
  else if (!*(_BYTE *)(a1 + 72))
  {
LABEL_6:
    v9 = 0;
    v10 = 0;
    goto LABEL_9;
  }
  v18 = 0.0;
  objc_msgSend(v8, "getHue:saturation:brightness:alpha:", 0, 0, &v18, 0);
  v10 = v18 < 0.02;
  v9 = 1;
LABEL_9:
  v17 = 0.0;
  v18 = 0.0;
  v15 = 0.0;
  v16 = 0.0;
  objc_msgSend(v8, "getRed:green:blue:alpha:", &v18, &v17, &v16, &v15);
  if (v15 == 1.0)
  {
    if (v18 == 0.0 && v17 == 0.0 && v16 == 0.0)
    {
      v11 = 0;
    }
    else
    {
      v12 = v18 != 1.0;
      if (v17 != 1.0)
        v12 = 1;
      v11 = v16 != 1.0 || v12;
    }
  }
  else
  {
    v11 = 1;
  }
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setTintedUIColors:", v7);
  objc_msgSend(v13, "setOriginalUIColors:", v3);
  if ((v4 & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DBD910], "bestAppearanceForSystem");
  else
    objc_msgSend(MEMORY[0x1E0DBD910], "appearanceWithVibrancyEnabled:isDark:", v11, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBestForegroundAppearanceForBackgroundColors:", v14);

  objc_msgSend(v13, "setColorRequest:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v13, "setPreferKeylineForShadowBasedViews:", v10);
  objc_msgSend(v13, "setTintStyle:", v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

+ (void)overrideAppearance:(id)a3 onView:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  id v13;

  v13 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0DBD910], "bestAppearanceForView:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "defaultBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  objc_msgSend(MEMORY[0x1E0DBD910], "bestAppearanceForSystem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "isEqual:", v11);

  if (!objc_msgSend(v7, "isEqual:", v13) || ((v10 ^ 1 | v12) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DBD910], "disableAppearanceOverrideForView:", v6);
    objc_msgSend(v13, "overrideAppearanceForView:", v6);
  }

}

+ (UIColor)defaultBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
}

+ (BOOL)backgroundColorPrefersWhiteForegroundText:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;

  v3 = (void *)MEMORY[0x1E0DC3658];
  v4 = a3;
  objc_msgSend(v3, "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_colorDifferenceFromColor:", v5);
  v7 = v6;

  return v7 > 1.15;
}

+ (id)randomColor
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setRedComponent:", (double)(arc4random() % 0xFF) / 255.0);
  objc_msgSend(v2, "setGreenComponent:", (double)(arc4random() % 0xFF) / 255.0);
  objc_msgSend(v2, "setBlueComponent:", (double)(arc4random() % 0xFF) / 255.0);
  return v2;
}

+ (id)disambiguationInnerPlatterColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setColorTintStyle:", 1);
  objc_msgSend(v2, "setRedComponent:", 1.0);
  objc_msgSend(v2, "setGreenComponent:", 1.0);
  objc_msgSend(v2, "setBlueComponent:", 1.0);
  objc_msgSend(v2, "setAlphaComponent:", 1.0);
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "setDarkModeColor:", v3);

  objc_msgSend(v2, "darkModeColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColorTintStyle:", 1);

  objc_msgSend(v2, "darkModeColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRedComponent:", 0.99);

  objc_msgSend(v2, "darkModeColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setGreenComponent:", 0.98);

  objc_msgSend(v2, "darkModeColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBlueComponent:", 1.0);

  objc_msgSend(v2, "darkModeColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlphaComponent:", 0.12);

  return v2;
}

+ (id)tintedUIColorsFromUIColors:(id)a3 withColorRequest:(id)a4 tintStyle:(int)a5
{
  id v8;
  void *v9;
  int v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  double v29;
  double v30;
  int v31;
  char v32;

  v8 = a3;
  objc_msgSend(a4, "appearance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isDark");

  if (a5 == 2)
  {
    v16 = objc_msgSend(MEMORY[0x1E0DBDA48], "isPhone");
    v17 = 0.85;
    v18 = 0.7;
    if (v16)
      v17 = 0.7;
    else
      v18 = 0.5;
    if (v10)
      v11 = v18;
    else
      v11 = v17;
    v12 = v11;
  }
  else
  {
    v11 = 0.0;
    if (a5 == 3)
    {
      if (v10)
        v12 = 0.8;
      else
        v12 = 0.92;
      if (v10)
        v11 = 0.32;
      else
        v11 = 0.35;
      if (objc_msgSend(v8, "count") == 1)
      {
        objc_msgSend(v8, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v13, "copy");
        objc_msgSend(v8, "arrayByAddingObject:", v14);
        v15 = objc_claimAutoreleasedReturnValue();

        v8 = (id)v15;
      }
    }
    else
    {
      v12 = 0.0;
    }
  }
  v19 = (void *)objc_opt_new();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __90__SearchUIBackgroundColorUtilities_tintedUIColorsFromUIColors_withColorRequest_tintStyle___block_invoke;
  v25[3] = &unk_1EA1F82A0;
  v31 = a5;
  v32 = v10 ^ 1;
  v28 = a1;
  v26 = v8;
  v29 = v12;
  v30 = v11;
  v20 = v19;
  v27 = v20;
  v21 = v8;
  objc_msgSend(v21, "enumerateObjectsUsingBlock:", v25);
  v22 = v27;
  v23 = v20;

  return v23;
}

void __90__SearchUIBackgroundColorUtilities_tintedUIColorsFromUIColors_withColorRequest_tintStyle___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;

  v5 = a2;
  v22 = 0.0;
  v23 = 0.0;
  v21 = 0.0;
  if ((*(_DWORD *)(a1 + 72) & 0xFFFFFFFE) == 2)
  {
    objc_msgSend(*(id *)(a1 + 48), "rgbCompatibleColorForColor:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0.0;
    v20 = 0.0;
    v18 = 0.0;
    objc_msgSend(v6, "getRed:green:blue:alpha:", &v20, &v19, &v18, 0);
    objc_msgSend(*(id *)(a1 + 48), "tintedRGBValueForValue:isLight:colorTintStyle:", *(unsigned __int8 *)(a1 + 76), *(unsigned int *)(a1 + 72), v20);
    v20 = v7;
    objc_msgSend(*(id *)(a1 + 48), "tintedRGBValueForValue:isLight:colorTintStyle:", *(unsigned __int8 *)(a1 + 76), *(unsigned int *)(a1 + 72), v19);
    v19 = v8;
    objc_msgSend(*(id *)(a1 + 48), "tintedRGBValueForValue:isLight:colorTintStyle:", *(unsigned __int8 *)(a1 + 76), *(unsigned int *)(a1 + 72), v18);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v20, v19, v9, 1.0, *(_QWORD *)&v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "getHue:saturation:brightness:alpha:", &v23, &v22, &v21, 0);
    v11 = dbl_1DAE1D840[*(_BYTE *)(a1 + 76) == 0];
    v12 = 0.5;
    if (!*(_BYTE *)(a1 + 76))
      v12 = 0.0;
    if (*(_DWORD *)(a1 + 72) == 3)
      v11 = v12;
    v22 = v22 / (1.0 - (v11 - v22 * v11));

    v5 = v10;
  }
  v13 = objc_msgSend(*(id *)(a1 + 32), "count");
  v14 = *(double *)(a1 + 56);
  if (v13 != 1)
  {
    if (v14 == 0.0 && *(double *)(a1 + 64) == 0.0)
    {
      v14 = 0.0;
    }
    else
    {
      v15 = objc_msgSend(*(id *)(a1 + 32), "count");
      v14 = *(double *)(a1 + 64) * ((double)a3 / (double)(unint64_t)(v15 - 1))
          + *(double *)(a1 + 56) * (1.0 - (double)a3 / (double)(unint64_t)(v15 - 1));
    }
  }
  if (*(_DWORD *)(a1 + 72) == 1)
  {
    v16 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", v23, v22, v21, v14);
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v16);

}

+ (BOOL)isDefaultUIColorInUIColors:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "defaultBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5 == v6;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)hexStringFromColor:(id)a3
{
  const CGFloat *Components;
  float v4;
  unint64_t v5;
  float v6;
  unint64_t v7;
  float v8;
  unint64_t v10;

  if (!a3)
    return 0;
  Components = CGColorGetComponents((CGColorRef)objc_msgSend(objc_retainAutorelease(a3), "CGColor"));
  v4 = *Components * 255.0;
  v5 = llroundf(v4);
  v6 = Components[1] * 255.0;
  v7 = llroundf(v6);
  v8 = Components[2] * 255.0;
  v10 = llroundf(v8);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#%02lX%02lX%02lX%02lX"), v5, v7, v10, v10);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)colorWithHexString:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v8;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("#")))
  {
    objc_msgSend(v3, "substringFromIndex:", 1);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v4;
  }
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScanLocation:", 0);
  objc_msgSend(v5, "scanHexInt:", &v8);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", (double)BYTE2(v8) / 255.0, (double)BYTE1(v8) / 255.0, (double)v8 / 255.0, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (double)tintedRGBValueForValue:(double)a3 isLight:(BOOL)a4 colorTintStyle:(int)a5
{
  _BOOL4 v5;
  double v7;
  double v8;
  int v10;
  double v11;
  double v12;

  v5 = a4;
  if (a5 == 3)
  {
    v7 = 0.6;
    if (a4)
      v7 = 0.67;
    v8 = 0.33;
    if (!a4)
      v8 = 0.0;
    return v8 + v7 * a3;
  }
  else
  {
    v10 = objc_msgSend(MEMORY[0x1E0DBDA48], "isPhone");
    v11 = 0.85;
    if (v10)
      v11 = 0.4;
    v12 = 0.6;
    if (!v10)
      v12 = 0.25;
    if (!v5)
      v11 = v12;
    return (1.0 - v11) * a3 + v11 * (double)v5;
  }
}

+ (id)rgbCompatibleColorForColor:(id)a3
{
  return a3;
}

+ (id)averageColorOfUIColors:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t i;
  void *v13;
  unint64_t v14;
  void *v15;
  double v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    v8 = 0.0;
    v9 = 0.0;
    v10 = 0.0;
    v11 = 0.0;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(a1, "rgbCompatibleColorForColor:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 0.0;
        v20 = 0.0;
        v17 = 0.0;
        v18 = 0.0;
        objc_msgSend(v13, "getRed:green:blue:alpha:", &v20, &v19, &v18, &v17);
        v11 = v11 + v20;
        v10 = v10 + v19;
        v9 = v9 + v18;
        v8 = v8 + v17;

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 0.0;
    v9 = 0.0;
    v10 = 0.0;
    v11 = 0.0;
  }
  v14 = objc_msgSend(v4, "count");
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v11 / (double)v14, v10 / (double)v14, v9 / (double)v14, v8 / (double)v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
