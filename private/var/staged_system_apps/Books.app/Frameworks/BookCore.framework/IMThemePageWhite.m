@implementation IMThemePageWhite

- (IMThemePageWhite)init
{
  IMThemePageWhite *v2;
  IMThemePageWhite *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IMThemePageWhite;
  v2 = -[IMThemePage init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[IMTheme setAnnotationPageTheme:](v2, "setAnnotationPageTheme:", 0);
    -[IMTheme setKeyboardAppearance:](v3, "setKeyboardAppearance:", 2);
    -[IMTheme setOverlayContentBackgroundColor:](v3, "setOverlayContentBackgroundColor:", 1);
  }
  return v3;
}

- (id)stableIdentifier
{
  return CFSTR("epub-white");
}

- (int64_t)epubTheme
{
  return 2;
}

@end
