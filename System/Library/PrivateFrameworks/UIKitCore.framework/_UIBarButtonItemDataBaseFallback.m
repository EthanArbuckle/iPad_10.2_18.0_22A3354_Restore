@implementation _UIBarButtonItemDataBaseFallback

- (id)backgroundImageForState:(int64_t)a3 style:(int64_t)a4
{
  return 0;
}

- (id)fontForState:(int64_t)a3 style:(int64_t)a4
{
  char v5;
  void *v6;
  const UIFontTextStyle *v7;
  int v8;
  void *v9;
  void *v12;

  if (a4 == 2)
  {
    v8 = _UIBarsUseDynamicType();
    v6 = off_1E167A828;
    if (!v8)
    {
      objc_msgSend(off_1E167A828, "boldSystemFontOfSize:", 17.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      return v9;
    }
    v7 = (const UIFontTextStyle *)UIFontTextStyleEmphasizedBody;
  }
  else
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIBarButtonItemData.m"), 50, CFSTR("Unsupported style %li"), a4);

      v9 = 0;
      return v9;
    }
    v5 = _UIBarsUseDynamicType();
    v6 = off_1E167A828;
    if ((v5 & 1) == 0)
    {
      objc_msgSend(off_1E167A828, "systemFontOfSize:", 17.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      return v9;
    }
    v7 = &UIFontTextStyleBody;
  }
  objc_msgSend(v6, "preferredFontForTextStyle:", *v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  return v9;
}

- (id)colorForState:(int64_t)a3 style:(int64_t)a4
{
  return 0;
}

- (UIOffset)backgroundImagePositionAdjustmentForState:(int64_t)a3 style:(int64_t)a4
{
  double v4;
  double v5;
  UIOffset result;

  v4 = 0.0;
  v5 = 0.0;
  result.vertical = v5;
  result.horizontal = v4;
  return result;
}

- (id)backIndicatorTextStyleForSymbolConfiguration
{
  return CFSTR("UICTFontTextStyleEmphasizedBody");
}

+ (id)fallback
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)fallback_fallback;
  if (!fallback_fallback)
  {
    v3 = objc_opt_new();
    v4 = (void *)fallback_fallback;
    fallback_fallback = v3;

    v2 = (void *)fallback_fallback;
  }
  return v2;
}

- (id)textStyleForSymbolConfiguration
{
  return CFSTR("UICTFontTextStyleBody");
}

- (UIOffset)titlePositionAdjustmentForState:(int64_t)a3 style:(int64_t)a4
{
  double v4;
  double v5;
  UIOffset result;

  v4 = 0.0;
  v5 = 0.0;
  result.vertical = v5;
  result.horizontal = v4;
  return result;
}

@end
