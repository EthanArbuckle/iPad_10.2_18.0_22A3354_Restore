@implementation UIContentUnavailableConstants_Mac

+ (id)sharedConstants
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)sharedConstants___sharedConstants_93;
  if (!sharedConstants___sharedConstants_93)
  {
    v4 = objc_alloc_init((Class)a1);
    v5 = (void *)sharedConstants___sharedConstants_93;
    sharedConstants___sharedConstants_93 = (uint64_t)v4;

    v3 = (void *)sharedConstants___sharedConstants_93;
  }
  return v3;
}

- (id)defaultEmptyImageSymbolConfigurationForTraitCollection:(id)a3
{
  id v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  v3 = a3;
  if (objc_msgSend(v3, "horizontalSizeClass") == 2)
    v4 = 36.0;
  else
    v4 = 52.0;
  +[UIFontMetrics defaultMetrics](UIFontMetrics, "defaultMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scaledValueForValue:compatibleWithTraitCollection:", v3, v4);
  v7 = v6;

  return +[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", v7);
}

- (id)defaultLoadingImageSymbolConfigurationForTraitCollection:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;

  v3 = a3;
  +[UIFontMetrics defaultMetrics](UIFontMetrics, "defaultMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValueForValue:compatibleWithTraitCollection:", v3, 32.0);
  v6 = v5;

  return +[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", v6);
}

- (id)defaultEmptyImageTintColor
{
  return +[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor");
}

- (id)defaultLoadingImageTintColor
{
  return +[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor");
}

- (id)defaultEmptyTextFontForTraitCollection:(id)a3
{
  id v3;
  uint64_t v4;
  __CFString **v5;
  void *v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "horizontalSizeClass");
  v5 = UIFontTextStyleEmphasizedLargeTitle;
  if (v4 != 2)
    v5 = UIFontTextStyleEmphasizedTitle2;
  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:compatibleWithTraitCollection:", *v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)defaultLoadingTextFontForTraitCollection:(id)a3
{
  return (id)objc_msgSend(off_1E167A828, "preferredFontForTextStyle:compatibleWithTraitCollection:", CFSTR("UICTFontTextStyleSubhead"), a3);
}

- (id)defaultEmptyTextColorForTraitCollection:(id)a3
{
  if (objc_msgSend(a3, "horizontalSizeClass") == 2)
    +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
  else
    +[UIColor labelColor](UIColor, "labelColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)defaultLoadingTextColor
{
  return +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
}

- (id)defaultEmptySecondaryTextFontForTraitCollection:(id)a3
{
  id v3;
  uint64_t v4;
  const UIFontTextStyle *v5;
  void *v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "horizontalSizeClass");
  v5 = &UIFontTextStyleBody;
  if (v4 != 2)
    v5 = &UIFontTextStyleSubheadline;
  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:compatibleWithTraitCollection:", *v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)defaultSecondaryTextColor
{
  return +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
}

- (id)defaultButtonConfigurationForTraitCollection:(id)a3
{
  void *v3;

  +[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setButtonSize:", 1);
  objc_msgSend(v3, "setMacIdiomStyle:", 1);
  objc_msgSend(v3, "setTitleAlignment:", 2);
  objc_msgSend(v3, "_setAlwaysApplyTitleAlignment:", 1);
  return v3;
}

- (BOOL)prefersSideBySideButtonAndSecondaryButton
{
  return 1;
}

- (double)defaultEmptyImageToTextPaddingForTraitCollection:(id)a3
{
  uint64_t v3;
  double result;

  v3 = objc_msgSend(a3, "horizontalSizeClass");
  result = 10.0;
  if (v3 == 2)
    return 22.0;
  return result;
}

- (double)defaultLoadingImageToTextPaddingForTraitCollection:(id)a3
{
  return 10.0;
}

- (double)defaultEmptyTextToSecondaryTextPaddingForTraitCollection:(id)a3
{
  uint64_t v3;
  double result;

  v3 = objc_msgSend(a3, "horizontalSizeClass");
  result = 3.0;
  if (v3 == 2)
    return 12.0;
  return result;
}

- (double)defaultEmptyTextToButtonPaddingForTraitCollection:(id)a3
{
  uint64_t v3;
  double result;

  v3 = objc_msgSend(a3, "horizontalSizeClass");
  result = 10.0;
  if (v3 == 2)
    return 12.0;
  return result;
}

- (double)defaultEmptyButtonToSecondaryButtonPaddingForTraitCollection:(id)a3
{
  return 6.0;
}

- (NSDirectionalEdgeInsets)defaultDirectionalLayoutMarginsForTraitCollection:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  NSDirectionalEdgeInsets result;

  v3 = 20.0;
  v4 = 20.0;
  v5 = 20.0;
  v6 = 20.0;
  result.trailing = v6;
  result.bottom = v5;
  result.leading = v4;
  result.top = v3;
  return result;
}

- (int64_t)defaultUserInterfaceRenderingMode
{
  return 0;
}

@end
