@implementation UIContentUnavailableConstants_TV

+ (id)sharedConstants
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)sharedConstants___sharedConstants_97;
  if (!sharedConstants___sharedConstants_97)
  {
    v4 = objc_alloc_init((Class)a1);
    v5 = (void *)sharedConstants___sharedConstants_97;
    sharedConstants___sharedConstants_97 = (uint64_t)v4;

    v3 = (void *)sharedConstants___sharedConstants_97;
  }
  return v3;
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
  objc_msgSend(v4, "scaledValueForValue:compatibleWithTraitCollection:", v3, 80.0);
  v6 = v5;

  return +[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", v6);
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
  objc_msgSend(v4, "scaledValueForValue:compatibleWithTraitCollection:", v3, 64.0);
  v6 = v5;

  return +[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", v6);
}

- (id)defaultEmptyImageTintColor
{
  return +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
}

- (id)defaultLoadingImageTintColor
{
  return +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
}

- (id)defaultEmptyTextFontForTraitCollection:(id)a3
{
  return (id)objc_msgSend(off_1E167A828, "preferredFontForTextStyle:compatibleWithTraitCollection:", CFSTR("UICTFontTextStyleEmphasizedHeadline"), a3);
}

- (id)defaultLoadingTextFontForTraitCollection:(id)a3
{
  return (id)objc_msgSend(off_1E167A828, "preferredFontForTextStyle:compatibleWithTraitCollection:", CFSTR("UICTFontTextStyleSubhead"), a3);
}

- (id)defaultEmptyTextColorForTraitCollection:(id)a3
{
  return +[UIColor labelColor](UIColor, "labelColor", a3);
}

- (id)defaultLoadingTextColor
{
  return +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
}

- (id)defaultEmptySecondaryTextFontForTraitCollection:(id)a3
{
  return (id)objc_msgSend(off_1E167A828, "preferredFontForTextStyle:compatibleWithTraitCollection:", CFSTR("UICTFontTextStyleBody"), a3);
}

- (id)defaultSecondaryTextColor
{
  return +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
}

- (id)defaultButtonConfigurationForTraitCollection:(id)a3
{
  void *v3;

  +[UIButtonConfiguration borderedButtonConfiguration](UIButtonConfiguration, "borderedButtonConfiguration", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setButtonSize:", 1);
  objc_msgSend(v3, "setTitleAlignment:", 2);
  objc_msgSend(v3, "_setAlwaysApplyTitleAlignment:", 1);
  return v3;
}

- (BOOL)prefersSideBySideButtonAndSecondaryButton
{
  return 0;
}

- (double)defaultEmptyImageToTextPaddingForTraitCollection:(id)a3
{
  return 32.0;
}

- (double)defaultLoadingImageToTextPaddingForTraitCollection:(id)a3
{
  return 16.0;
}

- (double)defaultEmptyTextToSecondaryTextPaddingForTraitCollection:(id)a3
{
  return 3.0;
}

- (double)defaultEmptyTextToButtonPaddingForTraitCollection:(id)a3
{
  return 32.0;
}

- (double)defaultEmptyButtonToSecondaryButtonPaddingForTraitCollection:(id)a3
{
  return 20.0;
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

- (int64_t)defaultUserInterfaceRenderingMode
{
  return 0;
}

@end
