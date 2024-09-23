@implementation UIFont(StocksUICoreText)

- (double)su_languageAwareOutsetsAtScale:()StocksUICoreText
{
  double v0;
  double v2;

  CTFontGetLanguageAwareOutsets();
  UICeilToScale();
  v2 = -v0;
  UICeilToScale();
  UICeilToScale();
  UICeilToScale();
  return v2;
}

@end
