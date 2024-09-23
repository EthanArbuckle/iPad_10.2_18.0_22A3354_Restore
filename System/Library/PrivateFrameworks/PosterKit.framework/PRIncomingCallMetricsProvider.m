@implementation PRIncomingCallMetricsProvider

+ (double)minimumScaleFactor
{
  return 0.8;
}

+ (unint64_t)maximumVerticalTextLength
{
  CGRect v3;

  objc_msgSend(a1, "maximumVerticalTextBounds");
  return +[PRVerticalLabel maximumTextLengthForHeight:](PRVerticalLabel, "maximumTextLengthForHeight:", CGRectGetHeight(v3));
}

+ (double)verticalTextMinYScreenHeightMultiplier
{
  return 0.13;
}

+ (double)verticalTextMaxYScreenHeightMultiplier
{
  return 0.5675;
}

+ (CGRect)maximumVerticalTextBounds
{
  void *v3;
  double Height;
  CGFloat Width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect v13;
  CGRect v14;
  CGRect result;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  Height = CGRectGetHeight(v13);

  objc_msgSend(a1, "maximumHorizontalTextBounds");
  Width = CGRectGetWidth(v14);
  objc_msgSend(a1, "verticalTextMaxYScreenHeightMultiplier");
  v7 = v6;
  objc_msgSend(a1, "verticalTextMinYScreenHeightMultiplier");
  v9 = Height * (v7 - v8);
  v10 = 0.0;
  v11 = 0.0;
  v12 = Width;
  result.size.height = v9;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

+ (BOOL)canApplyKashidaToText:(id)a3 withFont:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v15;
  _QWORD v16[2];
  CGRect v17;

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0CB3498];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  v15 = *MEMORY[0x1E0DC1138];
  v16[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v9, "initWithString:attributes:", v8, v10);
  objc_msgSend(v11, "size");
  v13 = v12;
  objc_msgSend(a1, "maximumHorizontalTextBounds");
  LOBYTE(a1) = v13 < CGRectGetWidth(v17);

  return (char)a1;
}

+ (id)_contentSizeCategoryToFactorMap
{
  if (_contentSizeCategoryToFactorMap_once != -1)
    dispatch_once(&_contentSizeCategoryToFactorMap_once, &__block_literal_global_39);
  return (id)_contentSizeCategoryToFactorMap_mapContentSizeFactor;
}

void __64__PRIncomingCallMetricsProvider__contentSizeCategoryToFactorMap__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[12];
  _QWORD v9[13];

  v9[12] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0DC4930];
  v8[0] = *MEMORY[0x1E0DC4908];
  v8[1] = v0;
  v9[0] = &unk_1E21DCE30;
  v9[1] = &unk_1E21DCE30;
  v1 = *MEMORY[0x1E0DC4918];
  v8[2] = *MEMORY[0x1E0DC4920];
  v8[3] = v1;
  v9[2] = &unk_1E21DCE30;
  v9[3] = &unk_1E21DCE30;
  v2 = *MEMORY[0x1E0DC48F8];
  v8[4] = *MEMORY[0x1E0DC4900];
  v8[5] = v2;
  v9[4] = &unk_1E21DCE48;
  v9[5] = &unk_1E21DCE60;
  v3 = *MEMORY[0x1E0DC48D8];
  v8[6] = *MEMORY[0x1E0DC48F0];
  v8[7] = v3;
  v9[6] = &unk_1E21DCE60;
  v9[7] = &unk_1E21DCE78;
  v4 = *MEMORY[0x1E0DC48C8];
  v8[8] = *MEMORY[0x1E0DC48D0];
  v8[9] = v4;
  v9[8] = &unk_1E21DCE90;
  v9[9] = &unk_1E21DCEA8;
  v5 = *MEMORY[0x1E0DC48B8];
  v8[10] = *MEMORY[0x1E0DC48C0];
  v8[11] = v5;
  v9[10] = &unk_1E21DCEC0;
  v9[11] = &unk_1E21DCED8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 12);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)_contentSizeCategoryToFactorMap_mapContentSizeFactor;
  _contentSizeCategoryToFactorMap_mapContentSizeFactor = v6;

}

+ (double)_deviceTopMargin
{
  if (_deviceTopMargin_once != -1)
    dispatch_once(&_deviceTopMargin_once, &__block_literal_global_12_0);
  return *(double *)&_deviceTopMargin_deviceTopMargin;
}

void __49__PRIncomingCallMetricsProvider__deviceTopMargin__block_invoke()
{
  void *v0;
  double Height;
  double v2;
  CGRect v3;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bounds");
  Height = CGRectGetHeight(v3);

  v2 = 25.0;
  if (Height >= 800.0)
  {
    if (Height == 852.0)
    {
      v2 = 60.0;
    }
    else
    {
      v2 = 60.0;
      if (Height < 930.0)
        v2 = 50.0;
    }
  }
  _deviceTopMargin_deviceTopMargin = *(_QWORD *)&v2;
}

+ (double)horizontalTextMaxYScreenHeightMultiplier
{
  return 0.225;
}

+ (double)horizontalTextEdgePaddingForContentSizeCategory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  double v9;
  void *v10;
  double Width;
  double result;
  CGRect v13;

  v4 = a3;
  objc_msgSend(a1, "_contentSizeCategoryToFactorMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = &unk_1E21DCE30;
  if (v6)
    v7 = v6;
  v8 = v7;

  v9 = (double)(unint64_t)objc_msgSend(v8, "unsignedIntegerValue") * 4.0 + 44.0;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "bounds");
  Width = CGRectGetWidth(v13);

  result = v9 + -4.0;
  if (Width > 375.0)
    return v9;
  return result;
}

+ (id)preferredContentSizeCategory
{
  void *v2;
  void *v3;
  id v4;

  _UIAccessibilityContentSizeCategoryName();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)*MEMORY[0x1E0DC4918];
  v4 = v2;

  return v4;
}

+ (double)horizontalTextEdgePadding
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(a1, "preferredContentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "horizontalTextEdgePaddingForContentSizeCategory:", v3);
  v5 = v4;

  return v5;
}

+ (CGRect)maximumHorizontalTextBounds
{
  void *v3;
  double Width;
  double v5;
  double v6;
  void *v7;
  double Height;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect v17;
  CGRect result;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  Width = CGRectGetWidth(v16);

  objc_msgSend(a1, "horizontalTextEdgePadding");
  v6 = Width + v5 * -2.0;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  Height = CGRectGetHeight(v17);

  objc_msgSend((id)objc_opt_class(), "_deviceTopMargin");
  v10 = v9;
  objc_msgSend(a1, "horizontalTextMaxYScreenHeightMultiplier");
  v12 = -(v10 - Height * v11);
  v13 = 0.0;
  v14 = 0.0;
  v15 = v6;
  result.size.height = v12;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

+ (double)maxVerticalTextHeight
{
  CGRect v3;

  objc_msgSend(a1, "maximumVerticalTextBounds");
  return CGRectGetHeight(v3);
}

+ (double)maxHorizontalTextWidth
{
  CGRect v3;

  objc_msgSend(a1, "maximumHorizontalTextBounds");
  return CGRectGetWidth(v3);
}

@end
