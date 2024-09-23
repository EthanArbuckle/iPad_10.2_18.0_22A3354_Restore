@implementation UIContentUnavailableConstants_IOS

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
  return 0;
}

- (id)defaultSecondaryTextColor
{
  return +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
}

- (double)defaultEmptyTextToSecondaryTextPaddingForTraitCollection:(id)a3
{
  return 3.0;
}

- (double)defaultEmptyTextToButtonPaddingForTraitCollection:(id)a3
{
  return 20.0;
}

- (id)defaultEmptySecondaryTextFontForTraitCollection:(id)a3
{
  return (id)objc_msgSend(off_1E167A828, "preferredFontForTextStyle:compatibleWithTraitCollection:", CFSTR("UICTFontTextStyleSubhead"), a3);
}

- (double)defaultEmptyButtonToSecondaryButtonPaddingForTraitCollection:(id)a3
{
  return 15.0;
}

- (NSDirectionalEdgeInsets)defaultDirectionalLayoutMarginsForTraitCollection:(id)a3
{
  NSString *v3;
  NSComparisonResult v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSDirectionalEdgeInsets result;

  objc_msgSend(a3, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  v4 = UIContentSizeCategoryCompareToCategory(v3, CFSTR("UICTContentSizeCategoryAccessibilityM"));

  v5 = 16.0;
  if (v4 == NSOrderedAscending)
    v5 = 32.0;
  v6 = 16.0;
  v7 = 16.0;
  v8 = v5;
  result.trailing = v8;
  result.bottom = v7;
  result.leading = v5;
  result.top = v6;
  return result;
}

- (id)defaultLoadingTextFontForTraitCollection:(id)a3
{
  return (id)objc_msgSend(off_1E167A828, "preferredFontForTextStyle:compatibleWithTraitCollection:", CFSTR("UICTFontTextStyleSubhead"), a3);
}

- (id)defaultLoadingTextColor
{
  return +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
}

- (double)defaultLoadingImageToTextPaddingForTraitCollection:(id)a3
{
  return 8.0;
}

- (id)defaultLoadingImageTintColor
{
  return +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
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

- (id)defaultEmptyTextFontForTraitCollection:(id)a3
{
  return (id)objc_msgSend(off_1E167A828, "preferredFontForTextStyle:compatibleWithTraitCollection:", CFSTR("UICTFontTextStyleEmphasizedTitle2"), a3);
}

- (id)defaultEmptyTextColorForTraitCollection:(id)a3
{
  return +[UIColor labelColor](UIColor, "labelColor", a3);
}

- (double)defaultEmptyImageToTextPaddingForTraitCollection:(id)a3
{
  return 15.0;
}

- (id)defaultEmptyImageTintColor
{
  return +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
}

- (id)defaultEmptyImageSymbolConfigurationForTraitCollection:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;

  v3 = a3;
  +[UIFontMetrics defaultMetrics](UIFontMetrics, "defaultMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValueForValue:compatibleWithTraitCollection:", v3, 48.0);
  v6 = v5;

  return +[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", v6);
}

- (int64_t)defaultUserInterfaceRenderingMode
{
  return 0;
}

+ (id)sharedConstants
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIContentUnavailableConstants.m"), 48, CFSTR("Attempted to instantiate an instance of UIContentUnavailableConstants_IOS - use UIContentUnavailableConstants_Phone or UIContentUnavailableConstants_Pad instead"));

  return 0;
}

@end
