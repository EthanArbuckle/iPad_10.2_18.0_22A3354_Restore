@implementation UIFont(IC)

+ (id)ic_preferredFontForTextStyle:()IC maxContentSizeCategory:
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;

  v6 = (void *)MEMORY[0x1E0DC37F8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "defaultMetrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ic_pointSizeForTextStyle:contentSizeCategory:", v8, v7);
  v11 = v10;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "scaledFontForFont:maximumPointSize:", v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)ic_preferredSingleLineAFontForTextStyle:()IC
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "preferredFontForTextStyle:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ic_fontWithSingleLineA");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)ic_fontWithSingleLineA
{
  ICFontCacheKey *v2;
  id v3;
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[2];
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (ic_fontWithSingleLineA_onceToken != -1)
    dispatch_once(&ic_fontWithSingleLineA_onceToken, &__block_literal_global_27);
  v2 = -[ICFontCacheKey initWithFont:]([ICFontCacheKey alloc], "initWithFont:", a1);
  if (objc_msgSend(a1, "ic_fontHasSingleLineA"))
  {
    v3 = a1;
  }
  else
  {
    objc_msgSend((id)ic_fontWithSingleLineA_singleLineACache, "objectForKey:", v2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLForKey:", *MEMORY[0x1E0D643D8]);

    if (v6)
    {
      v4 = a1;
      if (!v4)
        goto LABEL_11;
    }
    else
    {
      v17 = *MEMORY[0x1E0DC1380];
      v7 = *MEMORY[0x1E0DC13D0];
      v14[0] = *MEMORY[0x1E0DC13D8];
      v14[1] = v7;
      v15[0] = &unk_1E5C71D78;
      v15[1] = &unk_1E5C71D90;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "fontDescriptor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "fontDescriptorByAddingAttributes:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v12, 0.0);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)ic_fontWithSingleLineA_singleLineACache, "setObject:forKey:", v4, v2);

      if (!v4)
LABEL_11:
        objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((singleLineAFont) != nil)", "-[UIFont(IC) ic_fontWithSingleLineA]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "singleLineAFont");
    }
  }

  return v4;
}

- (uint64_t)ic_fontHasSingleLineA
{
  return CTFontHasFeatureSettingWithTypeAndSelector();
}

+ (double)ic_pointSizeForTextStyle:()IC contentSizeCategory:
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  if (a3 && a4)
  {
    v4 = (void *)CTFontDescriptorCreateWithTextStyle();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  objc_msgSend(v4, "pointSize");
  v7 = v6;

  return v7;
}

+ (id)ic_preferredFontForBodyTextWithContentSizeCategory:()IC isForPrint:
{
  void *v5;
  double v6;
  void *v7;

  objc_msgSend(a1, "ic_fontDescriptorForBodyTextWithContentSizeCategory:useSingleLineA:bold:", a3, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0.0;
  if (a4)
    v6 = 12.0;
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)ic_fontDescriptorForBodyTextWithContentSizeCategory:()IC useSingleLineA:bold:
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v20;
  _QWORD v21[2];
  uint64_t v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[2];
  void *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    v8 = CTFontDescriptorCreateWithTextStyle();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4A88]);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (a4)
  {
    v27 = *MEMORY[0x1E0DC1380];
    v11 = *MEMORY[0x1E0DC13D0];
    v24[0] = *MEMORY[0x1E0DC13D8];
    v24[1] = v11;
    v25[0] = &unk_1E5C71D78;
    v25[1] = &unk_1E5C71D90;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addEntriesFromDictionary:", v14);

  }
  if (a5)
  {
    v22 = *MEMORY[0x1E0DC13C0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC1420], *MEMORY[0x1E0DC13C8], *MEMORY[0x1E0DC1458], *MEMORY[0x1E0DC13F8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addEntriesFromDictionary:", v17);

  }
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v9, "fontDescriptorByAddingAttributes:", v10);
    v18 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v18;
  }

  return v9;
}

+ (id)ic_preferredFontForStyle:()IC symbolicTraits:
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_fontByAddingSymbolicTraits:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)ic_fontByAddingSymbolicTraits:()IC
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "fontDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontDescriptorWithSymbolicTraits:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(a1, "pointSize");
  objc_msgSend(v7, "fontWithDescriptor:size:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (uint64_t)ic_preferredFontForTitleTextWithContentSizeCategory:()IC isForPrint:
{
  return objc_msgSend(a1, "ic_preferredFontForTitleTextWithContentSizeCategory:isForPrint:isReducedSize:", a3, a4, 0);
}

+ (id)ic_preferredFontForTextStyle:()IC adjustedForDefaultSize:maxSize:
{
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;

  v7 = a5;
  v8 = (void *)CTFontDescriptorCreateWithTextStyle();
  objc_msgSend(v8, "pointSize");
  v10 = a1 - v9;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "pointSize");
  v13 = v10 + v12;
  if (v13 >= a2)
    v13 = a2;
  objc_msgSend(v11, "fontWithSize:", ceil(v13));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)ic_preferredFontForStyle:()IC withFontWeight:maxContentSizeCategory:
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = (void *)MEMORY[0x1E0DC1358];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "preferredFontDescriptorWithTextStyle:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ic_pointSizeForTextStyle:contentSizeCategory:", v8, v7);
  v11 = v10;

  v12 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v9, "pointSize");
  objc_msgSend(v12, "systemFontOfSize:weight:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC37F8], "metricsForTextStyle:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "scaledFontForFont:maximumPointSize:", v13, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (uint64_t)ic_preferredFontForStyle:()IC withFontWeight:
{
  return objc_msgSend(a1, "ic_preferredFontForStyle:withFontWeight:maxContentSizeCategory:", a3, *MEMORY[0x1E0DC48B8]);
}

+ (id)ic_preferredFontForHeadingTextWithContentSizeCategory:()IC isForPrint:
{
  void *v5;
  double v6;
  double v7;
  void *v8;

  objc_msgSend(a1, "ic_fontDescriptorForBodyTextWithContentSizeCategory:useSingleLineA:bold:", a3, 1, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pointSize");
  v7 = round(v6 * 1.29411765);
  if (a4)
    v7 = 14.0;
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (uint64_t)ic_preferredFontForDateText
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForDateTextWithZoomFactor:", 1.0);
}

+ (id)ic_preferredFontForDateTextWithZoomFactor:()IC
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v2, "pointSize");
  objc_msgSend(v3, "systemFontOfSize:", round(v4 * 0.882352941 * a1));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_fontWithSingleLineA");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)ic_fontWithoutSingleLineA
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v1 = a1;
  if (objc_msgSend(v1, "ic_fontHasSingleLineA"))
  {
    objc_msgSend(v1, "fontDescriptor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "fontAttributes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    objc_msgSend(v4, "removeObjectForKey:", *MEMORY[0x1E0DC1380]);
    objc_msgSend(MEMORY[0x1E0DC1358], "fontDescriptorWithFontAttributes:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v5, 0.0);
    v6 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v6;
  }
  return v1;
}

- (id)ic_fontWithTabularNumbers
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[2];
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fontDescriptor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0DC1380];
  v2 = *MEMORY[0x1E0DC13D0];
  v9[0] = *MEMORY[0x1E0DC13D8];
  v9[1] = v2;
  v10[0] = &unk_1E5C71DA8;
  v10[1] = &unk_1E5C71DC0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fontDescriptorByAddingAttributes:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v6, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)ic_fontConvertedToSize:()IC
{
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = objc_msgSend(a1, "ic_fontHasSingleLineA");
  v5 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(a1, "fontDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontWithDescriptor:size:", v6, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v7, "ic_fontWithSingleLineA");
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  return v7;
}

+ (uint64_t)ic_preferredFontForTitleText
{
  return objc_msgSend(a1, "ic_preferredFontForTitleTextWithContentSizeCategory:", 0);
}

+ (uint64_t)ic_preferredFontForHeadingText
{
  return objc_msgSend(a1, "ic_preferredFontForHeadingTextWithContentSizeCategory:", 0);
}

+ (uint64_t)ic_preferredFontForSubheadingText
{
  return objc_msgSend(a1, "ic_preferredFontForSubheadingTextWithContentSizeCategory:", 0);
}

+ (uint64_t)ic_preferredFontForBodyText
{
  return objc_msgSend(a1, "ic_preferredFontForBodyTextWithContentSizeCategory:", 0);
}

+ (uint64_t)ic_preferredFontForFixedWidthText
{
  return objc_msgSend(a1, "ic_preferredFontForFixedWidthTextWithContentSizeCategory:", 0);
}

+ (id)ic_preferredFontForCompatibilityBannerText
{
  void *v0;
  void *v1;
  double v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v0, "pointSize");
  objc_msgSend(v1, "systemFontOfSize:", round(v2 * 0.882352941));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)ic_preferredFontForStyle:()IC symbolicTraits:maxContentSizeCategory:
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForTextStyle:maxContentSizeCategory:", a3, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ic_fontByAddingSymbolicTraits:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)ic_listViewTitleFont
{
  void *v0;
  void *v1;

  objc_msgSend((id)objc_opt_class(), "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "ic_fontWithSingleLineA");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)ic_listViewDetailFont
{
  void *v0;
  void *v1;

  objc_msgSend((id)objc_opt_class(), "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B08]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "ic_fontWithSingleLineA");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)ic_attachmentBrowserTitleFont
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4B60], 2, 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "fontWithDescriptor:size:", v0, 0.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)ic_attachmentBrowserSeeAllButtonFont
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "ic_fontWithSingleLineA");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)ic_gridViewSectionTitleFont
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 17.0, *MEMORY[0x1E0DC1448]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC37F8], "defaultMetrics");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scaledFontForFont:", v0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "ic_fontWithSingleLineA");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)ic_gridViewNoteTitleFont
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "systemFontOfSize:", 15.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "ic_fontWithSingleLineA");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC37F8], "defaultMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledFontForFont:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)ic_gridViewNoteSubtitleFont
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "systemFontOfSize:", 12.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "ic_fontWithSingleLineA");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC37F8], "defaultMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledFontForFont:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)ic_groupInsetHeaderFont
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B60]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v0, "pointSize");
  objc_msgSend(v1, "systemFontOfSize:weight:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_fontWithSingleLineA");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)ic_navBarButtonFontUsingSingleLineA:()IC
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend((id)objc_opt_class(), "systemFontOfSize:", 17.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((a3 & 1) != 0)
  {
    objc_msgSend(v4, "ic_fontWithSingleLineA");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v4;
  }
  v7 = v6;

  return v7;
}

+ (id)ic_recentlyDeletedHeaderFont
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "ic_preferredSystemFontWithBaseSize:withContentSizeCategory:minSize:", v1, 13.0, 13.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "ic_fontWithSingleLineA");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (double)ic_pointSizeForBodyTextWithContentSizeCategory:()IC
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(a1, "ic_fontDescriptorForBodyTextWithContentSizeCategory:useSingleLineA:bold:", a3, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pointSize");
  v5 = v4;

  return v5;
}

+ (uint64_t)ic_preferredFontForTitleTextWithContentSizeCategory:()IC
{
  return objc_msgSend(a1, "ic_preferredFontForTitleTextWithContentSizeCategory:isForPrint:", a3, 0);
}

+ (id)ic_preferredFontForTitleTextWithContentSizeCategory:()IC isForPrint:isReducedSize:
{
  void *v7;
  double v8;
  double v9;
  void *v10;

  objc_msgSend(a1, "ic_fontDescriptorForBodyTextWithContentSizeCategory:useSingleLineA:bold:", a3, 1, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pointSize");
  if ((a4 & 1) == 0)
  {
    if (a5)
      v9 = 1.41176471;
    else
      v9 = 1.64705882;
    v8 = round(v8 * v9);
  }
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (uint64_t)ic_preferredFontForHeadingTextWithContentSizeCategory:()IC
{
  return objc_msgSend(a1, "ic_preferredFontForHeadingTextWithContentSizeCategory:isForPrint:", a3, 0);
}

+ (uint64_t)ic_preferredFontForSubheadingTextWithContentSizeCategory:()IC
{
  return objc_msgSend(a1, "ic_preferredFontForSubheadingTextWithContentSizeCategory:isForPrint:", a3, 0);
}

+ (id)ic_preferredFontForSubheadingTextWithContentSizeCategory:()IC isForPrint:
{
  void *v5;
  double v6;
  void *v7;

  objc_msgSend(a1, "ic_fontDescriptorForBodyTextWithContentSizeCategory:useSingleLineA:bold:", a3, 1, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0.0;
  if (a4)
    v6 = 12.0;
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)ic_preferredFontForBodyTextWithContentSizeCategory:()IC
{
  return objc_msgSend(a1, "ic_preferredFontForBodyTextWithContentSizeCategory:isForPrint:", a3, 0);
}

+ (id)ic_preferredFontForBodyTextWithContentSizeCategory:()IC useSingleLineA:
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "ic_fontDescriptorForBodyTextWithContentSizeCategory:useSingleLineA:bold:", a3, a4, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v4, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)ic_preferredFontForBodyTextWithMaximumContentSizeCategory:()IC
{
  void *v4;
  void *v5;

  ICContentSizeCategoryMinSystemPreferenceAnd(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ic_pointSizeForBodyTextWithContentSizeCategory:", v4);
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (uint64_t)ic_preferredFontForFixedWidthTextWithContentSizeCategory:()IC
{
  double v1;

  objc_msgSend(a1, "ic_pointSizeForBodyTextWithContentSizeCategory:");
  return objc_msgSend(MEMORY[0x1E0DC1350], "monospacedSystemFontOfSize:weight:", v1 * 0.882352941, *MEMORY[0x1E0DC1440]);
}

+ (double)ic_fontSizeForHeaderImport
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "ic_preferredFontForSubheadingText");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pointSize");
  v3 = v2;

  return v3;
}

+ (double)ic_fontSizeForSubheaderImport
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "ic_preferredFontForBodyText");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pointSize");
  v3 = v2;

  return v3;
}

+ (uint64_t)ic_preferredFontForTextStyle:()IC adjustedForDefaultSize:
{
  return objc_msgSend(a1, "ic_preferredFontForTextStyle:adjustedForDefaultSize:maxSize:", a3, 1.79769313e308);
}

+ (id)ic_preferredSystemFontWithBaseSize:()IC withContentSizeCategory:minSize:
{
  double v4;
  double v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "ic_preferredFontSizeWithBaseSize:withContentSizeCategory:minSize:maxSize:", a2, a3, a2 * 1.8);
  v5 = v4;
  objc_msgSend((id)objc_opt_class(), "systemFontOfSize:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontWithSize:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (double)ic_preferredFontSizeWithBaseSize:()IC withContentSizeCategory:minSize:maxSize:
{
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  BOOL v14;
  double v15;
  void **v16;
  void *v17;
  void **v18;
  double v19;
  float v20;

  v9 = a6;
  v10 = (void *)*MEMORY[0x1E0DC4918];
  if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0DC4918]) & 1) == 0)
  {
    ICContentSizeCategories();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "indexOfObject:", v9);
    v13 = objc_msgSend(v11, "indexOfObject:", v10);
    v14 = v12 >= v13;
    if (v12 >= v13)
      v15 = a3 - a1;
    else
      v15 = a1 - a2;
    v16 = (void **)MEMORY[0x1E0DC4908];
    if (v12 >= v13)
      v16 = (void **)MEMORY[0x1E0DC4900];
    v17 = *v16;
    v18 = (void **)MEMORY[0x1E0DC4920];
    if (v14)
      v18 = (void **)MEMORY[0x1E0DC48B8];
    v19 = v15 / (double)ICContentSizeCategoryStepsBetweenCategories(v17, *v18);
    v20 = a1 + v19 * (double)ICContentSizeCategoryStepsBetweenCategories(v10, v9);
    a1 = roundf(v20);

  }
  return a1;
}

- (uint64_t)ic_hasSymbolicBoldTrait
{
  return objc_msgSend(a1, "ic_hasSymbolicTrait:", 2);
}

- (uint64_t)ic_hasSymbolicItalicTrait
{
  return objc_msgSend(a1, "ic_hasSymbolicTrait:", 1);
}

- (BOOL)ic_hasSymbolicTrait:()IC
{
  void *v4;
  int v5;

  objc_msgSend(a1, "fontDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "symbolicTraits");

  return (v5 & a3) != 0;
}

- (uint64_t)ic_fontWithSymbolicBoldTrait
{
  return objc_msgSend(a1, "ic_fontByAddingSymbolicTraits:", 2);
}

- (id)ic_fontWithRoundedDesign
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "fontDescriptor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fontDescriptorWithDesign:", *MEMORY[0x1E0DC13A8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)ic_preferredFontForStyle:()IC contentSizeCategory:isForPrint:
{
  id v7;
  uint64_t v8;
  void *v9;

  v7 = a4;
  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForTitleTextWithContentSizeCategory:isForPrint:", v7, a5);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 1:
      objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForHeadingTextWithContentSizeCategory:isForPrint:", v7, a5);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 2:
      objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForSubheadingTextWithContentSizeCategory:isForPrint:", v7, a5);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 3:
    case 5:
      goto LABEL_4;
    case 4:
      objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForFixedWidthTextWithContentSizeCategory:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    default:
      if ((a3 - 100) >= 4)
        goto LABEL_6;
LABEL_4:
      objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForBodyTextWithContentSizeCategory:isForPrint:", v7, a5);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_5:
      v9 = (void *)v8;
      if (!v8)
      {
LABEL_6:
        objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((result) != nil)", "+[UIFont(IC) ic_preferredFontForStyle:contentSizeCategory:isForPrint:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "result");
        v9 = 0;
      }

      return v9;
  }
}

@end
