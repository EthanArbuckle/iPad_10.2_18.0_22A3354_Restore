@implementation PRIncomingCallFontsProvider

+ (UIFont)defaultNameFont
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC1350], "pr_defaultTimeFontForRole:", CFSTR("PRPosterRoleIncomingCall"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return (UIFont *)v5;
}

+ (UIFont)defaultStatusFont
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(a1, "defaultStatusFontSize");
  return (UIFont *)objc_msgSend(v2, "monospacedDigitSystemFontOfSize:weight:");
}

+ (double)defaultEmphasizedNameFontSize
{
  double result;

  objc_msgSend(a1, "_deviceBasedFontSizeForSize:", 76.0);
  return result;
}

+ (double)defaultStatusFontSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B58]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pointSize");
  v5 = v4;
  objc_msgSend(a1, "defaultSecondaryNameFontSize");
  v7 = fmin(v5, v6);

  return v7;
}

+ (double)defaultSecondaryNameFontSize
{
  double result;

  objc_msgSend(a1, "_deviceBasedFontSizeForSize:", 48.0);
  return result;
}

+ (double)_deviceBasedFontSizeForSize:(double)a3
{
  void *v4;
  CGRect v6;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  if (CGRectGetWidth(v6) <= 375.0)
    a3 = a3 * 0.9;

  return a3;
}

+ (id)_cjkFontSizeMap
{
  if (_cjkFontSizeMap_once != -1)
    dispatch_once(&_cjkFontSizeMap_once, &__block_literal_global_17);
  return (id)_cjkFontSizeMap_cjkFontSizeMap;
}

void __46__PRIncomingCallFontsProvider__cjkFontSizeMap__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[6];
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[6];
  _QWORD v8[2];
  _QWORD v9[4];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E21DCC50;
  v6[0] = &unk_1E21DCC68;
  v6[1] = &unk_1E21DCC80;
  v7[0] = &unk_1E21DD258;
  v7[1] = &unk_1E21DD268;
  v6[2] = &unk_1E21DCC98;
  v6[3] = &unk_1E21DCCB0;
  v7[2] = &unk_1E21DD278;
  v7[3] = &unk_1E21DD288;
  v6[4] = &unk_1E21DCCC8;
  v6[5] = &unk_1E21DCCE0;
  v7[4] = &unk_1E21DD288;
  v7[5] = &unk_1E21DD288;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 6);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = &unk_1E21DCCF8;
  v9[0] = v0;
  v4[0] = &unk_1E21DCC68;
  v4[1] = &unk_1E21DCC80;
  v5[0] = &unk_1E21DD258;
  v5[1] = &unk_1E21DD268;
  v4[2] = &unk_1E21DCC98;
  v4[3] = &unk_1E21DCCB0;
  v5[2] = &unk_1E21DD278;
  v5[3] = &unk_1E21DD288;
  v4[4] = &unk_1E21DCCC8;
  v4[5] = &unk_1E21DCCE0;
  v5[4] = &unk_1E21DD298;
  v5[5] = &unk_1E21DD2A8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_cjkFontSizeMap_cjkFontSizeMap;
  _cjkFontSizeMap_cjkFontSizeMap = v2;

}

+ (double)idealEmphasizedFontSizeForName:(id)a3 usingLayout:(unint64_t)a4
{
  id v6;
  double v7;
  double v8;

  v6 = a3;
  if (objc_msgSend(v6, "pr_isSuitableForVerticalLayout"))
    objc_msgSend(a1, "_idealEmphasizedFontSizeForForVerticalName:layout:", v6, a4);
  else
    objc_msgSend(a1, "defaultEmphasizedNameFontSize");
  v8 = v7;

  return v8;
}

+ (double)idealEmphasizedFontSizeForName:(id)a3 status:(id)a4 usingLayout:(unint64_t)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;

  v8 = a3;
  v9 = a4;
  if (v9)
  {
    if (!objc_msgSend(v8, "pr_isSuitableForVerticalLayout"))
    {
      objc_msgSend(a1, "defaultStatusFont");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "defaultStatusFontSize");
      objc_msgSend(v12, "fontWithSize:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "idealEmphasizedFontSizeForHorizontalName:nonEmphasizedText:nonEmphasizedFont:emphasizedNameIsTopName:", v8, v9, v13, 0);
      v11 = v14;

      goto LABEL_7;
    }
    objc_msgSend(a1, "_idealEmphasizedFontSizeForForVerticalName:layout:", v8, a5);
  }
  else
  {
    objc_msgSend(a1, "idealEmphasizedFontSizeForName:usingLayout:", v8, a5);
  }
  v11 = v10;
LABEL_7:

  return v11;
}

+ (double)idealEmphasizedFontSizeForHorizontalName:(id)a3 nonEmphasizedText:(id)a4 nonEmphasizedFont:(id)a5 emphasizedNameIsTopName:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  double v17;
  double v18;
  double Height;
  double v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  double v25;
  double v26;
  id v27;
  id v28;
  double v29;
  double v30;
  CGRect v32;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v6)
    v13 = v10;
  else
    v13 = v11;
  if (v6)
    v14 = v11;
  else
    v14 = v10;
  v15 = v13;
  v16 = v14;
  objc_msgSend(a1, "glyphBoundsForText:usingFont:", v11, v12);
  v18 = v17;
  +[PRIncomingCallMetricsProvider maximumHorizontalTextBounds](PRIncomingCallMetricsProvider, "maximumHorizontalTextBounds");
  Height = CGRectGetHeight(v32);
  objc_msgSend(a1, "defaultEmphasizedNameFontSize");
  v21 = v20;
  if (Height < 2147483650.0)
  {
    do
    {
      objc_msgSend(a1, "defaultSecondaryNameFontSize");
      if (v21 < v22)
        break;
      v21 = v21 + -1.0;
      objc_msgSend(a1, "defaultNameFont");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "fontWithSize:", v21);
      v24 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "glyphBoundsForText:usingFont:", v10, v24);
      v26 = v25;
      v27 = v6 ? v24 : v12;
      v28 = v6 ? v12 : v24;
      +[PRIncomingCallTextViewConfigurationMetrics idealSpaceBetweenTopText:topFont:bottomText:bottomFont:](PRIncomingCallTextViewConfigurationMetrics, "idealSpaceBetweenTopText:topFont:bottomText:bottomFont:", v15, v27, v16, v28);
      v30 = v18 + v26 + v29;

    }
    while (v30 > Height);
  }

  return v21;
}

+ (double)_idealEmphasizedFontSizeForForVerticalName:(id)a3 layout:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  float v19;
  double v20;
  double v21;
  double v22;

  v6 = a3;
  objc_msgSend(a1, "_cjkFontSizeMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9
    && (objc_msgSend(v9, "allKeys"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "count"),
        v10,
        v11))
  {
    objc_msgSend(v9, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "valueForKeyPath:", CFSTR("@max.unsignedIntegerValue"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "unsignedIntegerValue");

    v15 = objc_msgSend(v6, "length");
    if (v15 >= v14)
      v16 = v14;
    else
      v16 = v15;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v18, "floatValue");
      objc_msgSend(a1, "_deviceBasedFontSizeForSize:", v19);
    }
    else
    {
      objc_msgSend(a1, "defaultEmphasizedNameFontSize");
    }
    v22 = v20;

  }
  else
  {
    objc_msgSend(a1, "defaultEmphasizedNameFontSize");
    v22 = v21;
  }

  return v22;
}

+ (double)glyphBoundsForText:(id)a3 usingFont:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  const __CFAttributedString *v10;
  const __CTLine *v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v16;
  uint64_t v18;
  _QWORD v19[2];
  CGRect BoundsWithOptions;
  CGRect v21;

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0CB3498];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  v18 = *MEMORY[0x1E0CA8188];
  v19[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (const __CFAttributedString *)objc_msgSend(v8, "initWithString:attributes:", v7, v9);
  v11 = CTLineCreateWithAttributedString(v10);
  BoundsWithOptions = CTLineGetBoundsWithOptions(v11, 8uLL);
  x = BoundsWithOptions.origin.x;
  y = BoundsWithOptions.origin.y;
  width = BoundsWithOptions.size.width;
  height = BoundsWithOptions.size.height;
  CFRelease(v11);
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  v16 = CGRectGetHeight(v21);

  return v16;
}

+ (id)timeFontIdentifiersForText:(id)a3 availableFonts:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const __CFString *v25;
  _QWORD v26[3];
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB3500];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "alphanumericCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invertedSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsSeparatedByCharactersInSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsJoinedByString:", &stru_1E2186E08);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "length"))
    v13 = v12;
  else
    v13 = v8;
  v14 = v13;

  objc_msgSend(a1, "_renderCompatibleIdentifiersForTimeFontIdentifiers:text:", v7, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v15, "count"))
  {
    v28[0] = CFSTR("PRTimeFontIdentifierSFArabic");
    v28[1] = CFSTR("PRTimeFontIdentifierSFArabicRounded");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_renderCompatibleIdentifiersForTimeFontIdentifiers:text:", v17, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v18, "count"))
    {
      v16 = (void *)objc_msgSend(v18, "copy");
LABEL_17:

      v15 = v18;
      goto LABEL_18;
    }
    v27[0] = CFSTR("PRTimeFontIdentifierSFHebrew");
    v27[1] = CFSTR("PRTimeFontIdentifierSFHebrewRounded");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_renderCompatibleIdentifiersForTimeFontIdentifiers:text:", v19, v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v20, "count"))
    {
      v21 = objc_msgSend(v20, "copy");
    }
    else
    {
      if (_os_feature_enabled_impl())
      {
        v26[0] = CFSTR("PRTimeFontIdentifierNovember");
        v26[1] = CFSTR("PRTimeFontIdentifierOctober");
        v26[2] = CFSTR("PRTimeFontIdentifierNovemberCondensed");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 3);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_renderCompatibleIdentifiersForTimeFontIdentifiers:text:", v22, v14);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v23, "count"))
        {
          v16 = (void *)objc_msgSend(v23, "copy");

          v20 = v23;
LABEL_16:

          v18 = v20;
          goto LABEL_17;
        }

        v20 = v23;
      }
      v25 = CFSTR("PRTimeFontIdentifierSFPro");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
      v21 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v21;
    goto LABEL_16;
  }
  v16 = (void *)objc_msgSend(v15, "copy");
LABEL_18:

  return v16;
}

+ (id)_renderCompatibleIdentifiersForTimeFontIdentifiers:(id)a3 text:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __87__PRIncomingCallFontsProvider__renderCompatibleIdentifiersForTimeFontIdentifiers_text___block_invoke;
  v10[3] = &unk_1E2184B98;
  v11 = v6;
  v12 = a1;
  v7 = v6;
  objc_msgSend(a3, "bs_filter:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __87__PRIncomingCallFontsProvider__renderCompatibleIdentifiersForTimeFontIdentifiers_text___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "_canTextBePartiallyRenderedForTimeFontIdentifier:text:", a2, *(_QWORD *)(a1 + 32));
}

+ (BOOL)_canTextBePartiallyRenderedForTimeFontIdentifier:(id)a3 text:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  PRFontNameForTimeFontIdentifier(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "_canTextBePartiallyRenderedForFontWithName:text:", v7, v6);

  return (char)a1;
}

+ (BOOL)_canTextBePartiallyRenderedForFont:(id)a3 text:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a3, "fontName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "_canTextBePartiallyRenderedForFontWithName:text:", v7, v6);

  return (char)a1;
}

+ (BOOL)_canTextBePartiallyRenderedForFontWithName:(id)a3 text:(id)a4
{
  void *v6;
  id v7;

  v6 = (void *)MEMORY[0x1E0DC1350];
  v7 = a4;
  LOBYTE(a3) = objc_msgSend(a1, "_canTextBePartiallyRenderedForFontRef:text:", objc_msgSend(v6, "pr_fontWithName:forRole:includingFallbackFonts:", a3, CFSTR("PRPosterRoleIncomingCall"), 0), v7);

  return (char)a3;
}

+ (BOOL)_canTextBePartiallyRenderedForFontRef:(__CTFont *)a3 text:(id)a4
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unsigned __int16 *v9;
  uint64_t v10;
  int v11;
  BOOL v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_msgSend(v5, "length");
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v7 = (2 * v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  v8 = objc_msgSend(v5, "getCharacters:range:", (char *)v14 - v7, 0, v6);
  MEMORY[0x1E0C80A78](v8);
  v9 = (unsigned __int16 *)((char *)v14 - v7);
  if (CTFontGetGlyphsForCharacters(a3, (const UniChar *)((char *)v14 - v7), (CGGlyph *)((char *)v14 - v7), v6))
  {
    LOBYTE(v6) = 1;
  }
  else if (v6)
  {
    v10 = v6 - 1;
    do
    {
      v11 = *v9++;
      LOBYTE(v6) = v11 != 0;
      if (v11)
        v12 = 1;
      else
        v12 = v10 == 0;
      --v10;
    }
    while (!v12);
  }

  return v6;
}

+ ($721907E0E1CDE8B6CD3FA271A8B25860)_sampleFallbackForFont:(id)a3
{
  id v3;
  __CFString *v4;
  $721907E0E1CDE8B6CD3FA271A8B25860 result;

  v3 = a3;
  v4 = CFSTR("Aa");
  result.var1 = v3;
  result.var0 = v4;
  return result;
}

+ ($721907E0E1CDE8B6CD3FA271A8B25860)sampleStringForFont:(id)a3 displayingText:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  $721907E0E1CDE8B6CD3FA271A8B25860 result;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(a1, "_canTextBePartiallyRenderedForFont:text:", v6, v7))
  {
    v8 = objc_msgSend(a1, "_sampleStringForFont:", v6);
    v10 = v9;
  }
  else
  {
    objc_msgSend(a1, "_fallbackFontsForFont:displayingText:", v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      v13 = objc_msgSend(a1, "_sampleStringForFont:", v12);
    else
      v13 = objc_msgSend(a1, "_sampleFallbackForFont:", v6);
    v8 = v13;
    v10 = v14;

  }
  v15 = (void *)v8;
  v16 = v10;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

+ ($721907E0E1CDE8B6CD3FA271A8B25860)_sampleStringForFont:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  $721907E0E1CDE8B6CD3FA271A8B25860 result;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v4, "fontName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "pr_fontWithName:forRole:includingFallbackFonts:", v6, CFSTR("PRPosterRoleIncomingCall"), 0);

  objc_msgSend(a1, "_preferredLanguageForFont:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)CTCopySampleStringForLanguage();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
    v12 = v4;
  }
  else
  {
    v11 = (id)objc_msgSend(a1, "_sampleFallbackForFont:", v4);
    v12 = v13;
  }

  v14 = v11;
  v15 = v12;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

+ (id)_preferredLanguageForFont:(__CTFont *)a3
{
  void *v4;
  void *v5;
  CFTypeRef v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  const __CFArray *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *, uint64_t, _BYTE *);
  void *v27;
  const __CFArray *v28;
  uint64_t *v29;
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_map:", &__block_literal_global_33);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = CTFontCopyAttribute(a3, (CFStringRef)*MEMORY[0x1E0CA82C8]);
  v7 = (void *)v6;
  v8 = (void *)MEMORY[0x1E0C9AA60];
  if (v6)
    v8 = (void *)v6;
  v9 = v8;

  if (!objc_msgSend(v9, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v11;
  }
  if (objc_msgSend(v9, "count") == 1)
  {
    objc_msgSend(v9, "firstObject");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__0;
    v37 = __Block_byref_object_dispose__0;
    v38 = 0;
    v13 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __57__PRIncomingCallFontsProvider__preferredLanguageForFont___block_invoke_34;
    v30[3] = &unk_1E2184C00;
    v14 = v9;
    v31 = v14;
    v32 = &v33;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v30);
    v15 = (void *)v34[5];
    if (v15)
    {
      v12 = v15;
    }
    else
    {
      v24 = v13;
      v25 = 3221225472;
      v26 = __57__PRIncomingCallFontsProvider__preferredLanguageForFont___block_invoke_2;
      v27 = &unk_1E2184C00;
      v16 = CTFontCopySupportedLanguages(a3);
      v28 = v16;
      v29 = &v33;
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v24);
      v17 = (void *)v34[5];
      if (v17)
      {
        v12 = v17;
      }
      else
      {
        objc_msgSend(v14, "firstObject", v24, v25, v26, v27);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          v12 = v18;
        }
        else
        {
          -[__CFArray firstObject](v16, "firstObject");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (v20)
          {
            v22 = v20;
          }
          else
          {
            objc_msgSend(v5, "firstObject");
            v22 = (id)objc_claimAutoreleasedReturnValue();
          }
          v12 = v22;

        }
      }

    }
    _Block_object_dispose(&v33, 8);

  }
  return v12;
}

id __57__PRIncomingCallFontsProvider__preferredLanguageForFont___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "languageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __57__PRIncomingCallFontsProvider__preferredLanguageForFont___block_invoke_34(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __57__PRIncomingCallFontsProvider__preferredLanguageForFont___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

+ (id)_fallbackFontsForFont:(id)a3 displayingText:(id)a4
{
  id v5;
  id v6;
  const __CTLine *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v22 = *MEMORY[0x1E0CA8188];
  v23[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v7 = (const __CTLine *)CTLineCreateWithString();
  CTLineGetGlyphRuns(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        CTRunGetFont();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v15, v17);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  CFRelease(v7);
  return v9;
}

@end
