@implementation IMThemeBlissClassic

- (id)p_tintAndTitleColor
{
  return +[UIColor whiteColor](UIColor, "whiteColor");
}

- (id)backgroundColorForNavigationBar:(id)a3
{
  return +[UIColor bc_darkSystemBackgroundForTraitCollection:](UIColor, "bc_darkSystemBackgroundForTraitCollection:", objc_msgSend(a3, "traitCollection"));
}

- (int64_t)contentStatusBarStyle
{
  return 1;
}

- (int64_t)chromeStatusBarStyle
{
  return 0;
}

@end
