@implementation WBSThemeColorUtilities

+ (id)overrideTabColorForThemeColor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v8;
  double v9;
  double v10;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "safari_meetsThresholdForDarkAppearance"))
  {
    v9 = 0.0;
    v10 = 0.0;
    v8 = 0.0;
    objc_msgSend(v4, "safari_sRGBColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getHue:saturation:brightness:alpha:", &v10, &v9, &v8, 0);

    v6 = 0;
    if (v8 >= 0.9 && v9 >= 0.8)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithHue:saturation:brightness:alpha:", v10, v9 * 0.83, v8, 1.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)shouldOverrideTintColorForThemeColor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  double v8;
  double v9;
  double v10;

  v3 = a3;
  v4 = v3;
  if (v3
    && (v9 = 0.0,
        v10 = 0.0,
        objc_msgSend(v3, "safari_sRGBColor"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "getHue:saturation:brightness:alpha:", 0, &v10, &v9, 0),
        v5,
        v9 >= 0.15))
  {
    objc_msgSend(v4, "safari_grayscaleComponent", v9);
    v6 = v8 < 0.8 || v10 > 0.4;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)shouldIgnoreThemeColorForContrastWithActiveTab:(id)a3 privateBrowsingEnabled:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  double v7;
  BOOL v8;
  double v9;
  double v10;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if (!v5)
    goto LABEL_6;
  if (!v4)
  {
    objc_msgSend(v5, "safari_saturation");
    if (v9 < 0.05)
    {
      objc_msgSend(v6, "safari_grayscaleComponent");
      v8 = v10 > 0.97;
      goto LABEL_7;
    }
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v5, "safari_grayscaleComponent");
  v8 = v7 < 0.2;
LABEL_7:

  return v8;
}

+ (id)updateThemeColorForWebView:(id)a3 darkModeEnabled:(BOOL)a4
{
  return (id)objc_msgSend(a1, "updateThemeColorForWebView:darkModeEnabled:allowFallbackColors:updateUnderPageBackgroundColor:", a3, a4, 1, 1);
}

+ (id)updateThemeColorForWebView:(id)a3 darkModeEnabled:(BOOL)a4 allowFallbackColors:(BOOL)a5 updateUnderPageBackgroundColor:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  _BOOL4 v18;
  void *v19;
  int v20;
  void *v21;
  double v22;
  BOOL v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  NSObject *v38;
  id v39;
  int v40;
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v48 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  objc_msgSend(v9, "themeColor");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUnderPageBackgroundColor:", 0);
  objc_msgSend(v9, "underPageBackgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = WBS_LOG_CHANNEL_PREFIXThemeColor();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = v12;
    objc_msgSend(v9, "URL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_sampledPageTopColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 138740739;
    v41 = v14;
    v42 = 2113;
    v43 = v10;
    v44 = 2113;
    v45 = v15;
    v46 = 2113;
    v47 = v11;
    _os_log_impl(&dword_1A840B000, v13, OS_LOG_TYPE_INFO, "Updating theme color for \"%{sensitive}@\" (themeColor: %{private}@, _sampledPageTopColor: %{private}@, underPageBackgroundColor: %{private}@)", (uint8_t *)&v40, 0x2Au);

  }
  objc_msgSend(v10, "safari_grayscaleComponent");
  v17 = v16;
  if (v10 && v16 < 1.0)
  {
    v18 = 0;
    v19 = 0;
    v20 = 0;
  }
  else
  {
    if (sampledPageTopColorEnabled_onceToken != -1)
      dispatch_once(&sampledPageTopColorEnabled_onceToken, &__block_literal_global_48);
    v20 = sampledPageTopColorEnabled_sampledPageTopColorEnabled;
    if (sampledPageTopColorEnabled_sampledPageTopColorEnabled)
    {
      objc_msgSend(v9, "_sampledPageTopColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v21;
      v20 = 0;
      v18 = v21 != 0;
      if (v17 >= 1.0 && v21)
      {
        v20 = objc_msgSend(v21, "safari_isOffWhite") ^ 1;
        v18 = 1;
      }
    }
    else
    {
      v18 = 0;
      v19 = 0;
    }
  }
  if (!v10)
    v20 = 1;
  if (v20 == 1 && v7)
  {
    if (objc_msgSend(v19, "safari_meetsThresholdForDarkAppearance"))
    {
      objc_msgSend(v19, "safari_luminance");
      v23 = v22 < 0.25;
      if (!v18)
        goto LABEL_19;
    }
    else
    {
      v23 = 0;
      if (!v18)
      {
LABEL_19:
        if (v10)
          goto LABEL_32;
LABEL_31:
        v10 = v11;
        v6 = 0;
        goto LABEL_32;
      }
    }
    if (!objc_msgSend(v11, "safari_isOffWhite")
      || !v23 && !objc_msgSend(v19, "safari_isOffWhite"))
    {
      if (v10)
        goto LABEL_32;
      v29 = WBS_LOG_CHANNEL_PREFIXThemeColor();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v30 = v29;
        describeColor(v11);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        describeColor(v19);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 138543618;
        v41 = v31;
        v42 = 2114;
        v43 = v32;
        _os_log_impl(&dword_1A840B000, v30, OS_LOG_TYPE_INFO, "Using background color (%{public}@); ignoring sampled color (%{public}@)",
          (uint8_t *)&v40,
          0x16u);

      }
      goto LABEL_31;
    }
    v24 = WBS_LOG_CHANNEL_PREFIXThemeColor();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
    if (v10)
    {
      if (!v25)
        goto LABEL_45;
      v26 = v24;
      describeColor(v19);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      describeColor(v10);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 138543618;
      v41 = v27;
      v42 = 2114;
      v43 = v28;
      _os_log_impl(&dword_1A840B000, v26, OS_LOG_TYPE_INFO, "Using sampled color (%{public}@); ignoring theme color (%{public}@)",
        (uint8_t *)&v40,
        0x16u);

    }
    else
    {
      if (!v25)
        goto LABEL_45;
      v38 = v24;
      describeColor(v19);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 138543362;
      v41 = v27;
      _os_log_impl(&dword_1A840B000, v38, OS_LOG_TYPE_INFO, "Using sampled color (%{public}@)", (uint8_t *)&v40, 0xCu);

    }
LABEL_45:
    v39 = v19;

    v10 = v39;
    if (!v8)
      goto LABEL_34;
    goto LABEL_33;
  }
LABEL_32:
  if (!v8)
  {
LABEL_34:
    if (v6)
      objc_msgSend(v9, "setUnderPageBackgroundColor:", v10);
    v33 = v10;
    goto LABEL_41;
  }
LABEL_33:
  if ((objc_msgSend(v10, "safari_meetsThresholdForDarkAppearance") & 1) != 0)
    goto LABEL_34;
  if (v10)
  {
    v34 = WBS_LOG_CHANNEL_PREFIXThemeColor();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      v35 = v34;
      objc_msgSend(v10, "safari_grayscaleComponent");
      v40 = 134217984;
      v41 = v36;
      _os_log_impl(&dword_1A840B000, v35, OS_LOG_TYPE_INFO, "Ignoring color because it's too light and dark mode is enabled (grayscale: %.2f)", (uint8_t *)&v40, 0xCu);

    }
  }
  v33 = 0;
LABEL_41:

  return v33;
}

@end
