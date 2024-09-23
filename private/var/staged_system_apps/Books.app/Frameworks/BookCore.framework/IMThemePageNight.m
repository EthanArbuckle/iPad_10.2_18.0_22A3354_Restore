@implementation IMThemePageNight

- (IMThemePageNight)init
{
  IMThemePageNight *v2;
  IMThemePageNight *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IMThemePageNight;
  v2 = -[IMThemePageGray init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    -[IMTheme setShouldInvertContent:](v2, "setShouldInvertContent:", 1);
    -[IMTheme setAnnotationBlendMode:](v3, "setAnnotationBlendMode:", 2);
    -[IMTheme setAnnotationPageTheme:](v3, "setAnnotationPageTheme:", 3);
    -[IMTheme setTextHighlightType:](v3, "setTextHighlightType:", 3);
    -[IMTheme setPageTurnSpineAlpha:](v3, "setPageTurnSpineAlpha:", 0.04);
    -[IMTheme setKeyboardAppearance:](v3, "setKeyboardAppearance:", 1);
    -[IMTheme setContentStatusBarStyle:](v3, "setContentStatusBarStyle:", 1);
    -[IMTheme setImageMultiplyExpandedContentMode:](v3, "setImageMultiplyExpandedContentMode:", 0);
    -[IMTheme setGaijiImageFilter:](v3, "setGaijiImageFilter:", CFSTR("invert(65%%)"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.15));
    -[IMTheme setSpeakScreenHighlightColor:](v3, "setSpeakScreenHighlightColor:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.690196078, 0.690196078, 0.690196078, 1.0));
    -[IMTheme setSpeakScreenUnderlineColor:](v3, "setSpeakScreenUnderlineColor:", v5);

  }
  return v3;
}

- (BOOL)isNight:(id)a3
{
  return 1;
}

- (id)stableIdentifier
{
  return CFSTR("epub-night");
}

- (int64_t)epubTheme
{
  return 5;
}

@end
