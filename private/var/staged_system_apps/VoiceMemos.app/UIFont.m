@implementation UIFont

+ (id)scaledMonospacedSystemFontOfSize:(double)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont monospacedDigitSystemFontOfSize:weight:](UIFont, "monospacedDigitSystemFontOfSize:weight:", a3, UIFontWeightRegular));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontMetrics defaultMetrics](UIFontMetrics, "defaultMetrics"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scaledFontForFont:", v3));

  return v5;
}

+ (id)scaledSystemFontOfSize:(double)a3 weight:(double)a4
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontMetrics defaultMetrics](UIFontMetrics, "defaultMetrics"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "scaledFontForFont:", v4));

  return v6;
}

+ (id)scaledSystemFontOfSize:(double)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontMetrics defaultMetrics](UIFontMetrics, "defaultMetrics"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scaledFontForFont:", v3));

  return v5;
}

+ (id)rcs_dynamicMonospacedTitle0Font
{
  void *v2;
  void *v3;
  NSString *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "traitCollection"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredContentSizeCategory"));

  if (UIContentSizeCategoryIsAccessibilityCategory(v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithPreferredContentSizeCategory:](UITraitCollection, "traitCollectionWithPreferredContentSizeCategory:", UIContentSizeCategoryExtraExtraExtraLarge));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:](UIFont, "preferredFontForTextStyle:compatibleWithTraitCollection:", UIFontTextStyleLargeTitle, v5));

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleLargeTitle));
  }
  v7 = sub_100060228(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

+ (id)rcs_monospacedSubheadlineFont
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline));
  v3 = sub_100060228(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (NSString)rc_textStyle
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIFont fontDescriptor](self, "fontDescriptor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fontAttributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", UIFontDescriptorTextStyleAttribute));

  return (NSString *)v4;
}

@end
