@implementation UIFont(VideosUI)

+ (id)vui_fontFromTextLayout:()VideosUI
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  float v14;
  float v15;
  double v16;
  double v17;
  void *v18;
  const __CFString *v19;
  const __CFString **v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "textStyle");
  v5 = objc_msgSend(v3, "maximumContentSizeCategory");
  objc_msgSend(MEMORY[0x1E0DC69B0], "uiContentSizeCategoryFor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "fontWeight");
  objc_msgSend(v3, "fontSize");
  v9 = v8;
  v10 = objc_msgSend(v3, "fontTraits");
  objc_msgSend((id)objc_opt_class(), "_fontFromTextStyle:maximumContentSizeCategory:fontWeight:fontSize:symbolicTraits:fontFeature:", v4, v6, v7, v10, objc_msgSend(v3, "fontFeature"), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    goto LABEL_24;
  objc_msgSend(v3, "fontFamily");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "uifontWeightFromFontWeight:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");
  v15 = v14;
  if (v9 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontSize");
    v9 = v16;
  }
  v17 = v15;
  if (objc_msgSend(v12, "length") && objc_msgSend(v12, "isEqualToString:", CFSTR("SFRounded")))
  {
    v18 = (void *)MEMORY[0x1E0DC1350];
    v19 = CFSTR("NSCTFontUIFontDesignRounded");
LABEL_14:
    objc_msgSend(v18, "systemFontOfSize:weight:design:", v19, v9, v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "fontDescriptor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (objc_msgSend(v12, "length") && objc_msgSend(v12, "isEqualToString:", CFSTR("SFCompactRounded")))
  {
    v18 = (void *)MEMORY[0x1E0DC1350];
    v20 = (const __CFString **)MEMORY[0x1E0CA8428];
LABEL_13:
    v19 = *v20;
    goto LABEL_14;
  }
  if (objc_msgSend(v12, "length") && objc_msgSend(v12, "isEqualToString:", CFSTR("SFPro")))
  {
    v18 = (void *)MEMORY[0x1E0DC1350];
    v20 = (const __CFString **)MEMORY[0x1E0CA8430];
    goto LABEL_13;
  }
  if (!objc_msgSend(v12, "length"))
    goto LABEL_30;
  if (v13 && *MEMORY[0x1E0DC1440] != v17)
  {
    v27 = objc_alloc(MEMORY[0x1E0DC1358]);
    v28 = *MEMORY[0x1E0DC13C0];
    v32 = v13;
    v33[0] = v28;
    v31 = *MEMORY[0x1E0DC1458];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = *MEMORY[0x1E0DC1378];
    v34[0] = v21;
    v34[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v27, "initWithFontAttributes:", v29);

LABEL_15:
    if (v22)
      goto LABEL_16;
LABEL_30:
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", v9, v17);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "fontDescriptor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!(_DWORD)v10)
      goto LABEL_18;
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0DC1358], "fontDescriptorWithName:size:", v12, v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
    goto LABEL_30;
LABEL_16:
  if ((_DWORD)v10)
  {
LABEL_17:
    objc_msgSend(v22, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v22, "symbolicTraits") | v10);
    v23 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)v23;
  }
LABEL_18:
  objc_msgSend((id)objc_opt_class(), "_uiFontAttributesForFeature:", objc_msgSend(v3, "fontFeature"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    objc_msgSend(v22, "fontDescriptorByAddingAttributes:", v24);
    v25 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)v25;
  }
  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v22, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

LABEL_24:
  return v11;
}

+ (id)_fontFromTextStyle:()VideosUI maximumContentSizeCategory:fontWeight:fontSize:symbolicTraits:fontFeature:
{
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  int v27;
  int v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v14 = a5;
  objc_msgSend(a1, "uiFontTextStyleFromTextStyle:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");
  if (a4 == 23)
  {
    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:maximumContentSizeCategory:", v15, 256, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_22:
    v18 = 0;
    goto LABEL_23;
  }
  if (!v16)
    goto LABEL_22;
  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", v15, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v18 = v17;
  if (!v17)
  {
LABEL_23:
    v32 = 0;
    goto LABEL_26;
  }
  objc_msgSend(v17, "fontDescriptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "uifontWeightFromFontWeight:", a6);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v20 && v19)
  {
    v35 = (void *)v20;
    v22 = *MEMORY[0x1E0DC13C0];
    objc_msgSend(v19, "objectForKey:", *MEMORY[0x1E0DC13C0]);
    v34 = a8;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "mutableCopy");

    objc_msgSend(v24, "setObject:forKey:", v35, *MEMORY[0x1E0DC1458]);
    v36 = v22;
    v37[0] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fontDescriptorByAddingAttributes:", v25);
    v26 = objc_claimAutoreleasedReturnValue();

    a8 = v34;
    v19 = (void *)v26;
    v21 = v35;
  }
  v27 = a7 | 2;
  if (a6 != 10)
    v27 = a7;
  if (a8 == 3)
    v28 = v27 | 0x8000;
  else
    v28 = v27;
  if (v28 && v19)
  {
    objc_msgSend(v19, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v19, "symbolicTraits") | v28);
    v29 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v29;
  }
  objc_msgSend((id)objc_opt_class(), "_uiFontAttributesForFeature:", a8);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    objc_msgSend(v19, "fontDescriptorByAddingAttributes:", v30);
    v31 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v31;
  }
  if (v19)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v19, a2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = 0;
  }

LABEL_26:
  return v32;
}

+ (char)uifontWeightFromFontWeight:()VideosUI
{
  BOOL IsBoldTextEnabled;
  void *v5;
  void *v6;

  if (uifontWeightFromFontWeight__onceToken != -1)
    dispatch_once(&uifontWeightFromFontWeight__onceToken, &__block_literal_global_12);
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  if ((unint64_t)(a3 - 10) <= 0xFFFFFFFFFFFFFFFDLL && IsBoldTextEnabled)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC1420]);
    a3 = (char *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    v5 = (void *)uifontWeightFromFontWeight__sFontWeightMap;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    a3 = (char *)objc_claimAutoreleasedReturnValue();

  }
  return a3;
}

+ (id)uiFontTextStyleFromTextStyle:()VideosUI
{
  void *v4;
  void *v5;
  void *v6;

  if (uiFontTextStyleFromTextStyle__onceToken != -1)
    dispatch_once(&uiFontTextStyleFromTextStyle__onceToken, &__block_literal_global_19);
  if (a3 == -1)
  {
    v6 = 0;
  }
  else
  {
    v4 = (void *)uiFontTextStyleFromTextStyle__sTextStyleMap;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (id)_uiFontAttributesForFeature:()VideosUI
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  if (a3 == 1)
    v3 = 1;
  else
    v3 = 2;
  v18 = *MEMORY[0x1E0DC1380];
  v5 = *MEMORY[0x1E0DC13D0];
  v15[0] = *MEMORY[0x1E0DC13D8];
  v4 = v15[0];
  v15[1] = v5;
  v16[0] = &unk_1EA0B8F68;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  v13[1] = v5;
  v14[0] = &unk_1EA0B8F80;
  v13[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (uint64_t)vui_fontFromTextStyle:()VideosUI fontWeight:fontSize:symbolicTraits:
{
  return objc_msgSend((id)objc_opt_class(), "_fontFromTextStyle:maximumContentSizeCategory:fontWeight:fontSize:symbolicTraits:fontFeature:", a4, *MEMORY[0x1E0DC4938], a5, a6, 0, a1);
}

- (uint64_t)baselineHeight
{
  objc_msgSend(a1, "ascender");
  return VUIRoundValue();
}

- (uint64_t)topMarginWithBaselineMargin:()VideosUI traitCollection:
{
  +[VUIUtilities scaleContentSizeValue:forTraitCollection:](VUIUtilities, "scaleContentSizeValue:forTraitCollection:");
  objc_msgSend(a1, "ascender");
  return VUIRoundValue();
}

- (uint64_t)bottomMarginWithBaselineMargin:()VideosUI traitCollection:
{
  +[VUIUtilities scaleContentSizeValue:forTraitCollection:](VUIUtilities, "scaleContentSizeValue:forTraitCollection:");
  objc_msgSend(a1, "descender");
  return VUIRoundValue();
}

- (uint64_t)topMarginToFont:()VideosUI withBaselineMargin:traitCollection:
{
  id v8;

  v8 = a4;
  +[VUIUtilities scaleContentSizeValue:forTraitCollection:](VUIUtilities, "scaleContentSizeValue:forTraitCollection:", a5, a2);
  objc_msgSend(a1, "ascender");
  objc_msgSend(v8, "descender");

  return VUIRoundValue();
}

@end
