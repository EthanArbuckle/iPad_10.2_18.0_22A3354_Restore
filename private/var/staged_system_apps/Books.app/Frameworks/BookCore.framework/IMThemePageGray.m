@implementation IMThemePageGray

- (IMThemePageGray)init
{
  IMThemePageGray *v2;
  IMThemePageGray *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IMThemePageGray;
  v2 = -[IMThemePage init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    -[IMTheme setTextHighlightType:](v2, "setTextHighlightType:", 2);
    -[IMTheme setAnnotationBlendMode:](v3, "setAnnotationBlendMode:", 3);
    -[IMTheme setAnnotationPageTheme:](v3, "setAnnotationPageTheme:", 2);
    -[IMTheme setShouldInvertContent:](v3, "setShouldInvertContent:", 1);
    -[IMTheme setKeyboardAppearance:](v3, "setKeyboardAppearance:", 1);
    -[IMTheme setContentStatusBarStyle:](v3, "setContentStatusBarStyle:", 1);
    -[IMTheme setImageMultiplyExpandedContentMode:](v3, "setImageMultiplyExpandedContentMode:", 0);
    -[IMTheme setGaijiImageFilter:](v3, "setGaijiImageFilter:", CFSTR("invert(90%%)"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.15));
    -[IMTheme setSpeakScreenHighlightColor:](v3, "setSpeakScreenHighlightColor:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.788235294, 0.792156863, 0.792156863, 1.0));
    -[IMTheme setSpeakScreenUnderlineColor:](v3, "setSpeakScreenUnderlineColor:", v5);

  }
  return v3;
}

- (id)stableIdentifier
{
  return CFSTR("epub-gray");
}

- (int64_t)epubTheme
{
  return 4;
}

@end
