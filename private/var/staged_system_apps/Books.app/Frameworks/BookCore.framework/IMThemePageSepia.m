@implementation IMThemePageSepia

- (IMThemePageSepia)init
{
  IMThemePageSepia *v2;
  IMThemePageSepia *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IMThemePageSepia;
  v2 = -[IMThemePage init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    -[IMTheme setAnnotationPageTheme:](v2, "setAnnotationPageTheme:", 1);
    -[IMTheme setTextHighlightType:](v3, "setTextHighlightType:", 1);
    -[IMTheme setKeyboardAppearance:](v3, "setKeyboardAppearance:", 2);
    -[IMTheme setOverlayContentBackgroundColor:](v3, "setOverlayContentBackgroundColor:", 1);
    -[IMTheme setGaijiImageFilter:](v3, "setGaijiImageFilter:", CFSTR("invert(25%%)"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.15));
    -[IMTheme setSpeakScreenHighlightColor:](v3, "setSpeakScreenHighlightColor:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0));
    -[IMTheme setSpeakScreenUnderlineColor:](v3, "setSpeakScreenUnderlineColor:", v5);

  }
  return v3;
}

- (id)stableIdentifier
{
  return CFSTR("epub-sepia");
}

- (int64_t)epubTheme
{
  return 3;
}

@end
