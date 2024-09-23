@implementation _UINavigationBarTVVisualStyle

- (id)timingFunctionForAnimationInView:(id)a3 withKeyPath:(id)a4 isInteractive:(BOOL)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058], a4, a5);
}

- (double)headingFontSize
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleTitle2"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pointSize");
  v4 = v3;

  return v4;
}

- (double)buttonHeight
{
  return 70.0;
}

- (double)barHeight
{
  double v2;

  -[_UINavigationBarTVVisualStyle navigationItemBaselineOffset](self, "navigationItemBaselineOffset");
  return v2 + 111.0;
}

- (double)interItemSpace
{
  return 24.0;
}

- (double)leftTitleMargin
{
  return 35.0;
}

- (double)buttonImagePadding
{
  double v2;

  -[_UINavigationBarTVVisualStyle leftTitleMargin](self, "leftTitleMargin");
  return v2 + v2;
}

- (double)navigationItemBaselineOffset
{
  double v3;
  double v4;
  double v5;

  -[_UINavigationBarTVVisualStyle buttonContentEdgeInsets](self, "buttonContentEdgeInsets");
  v4 = v3;
  -[_UINavigationBarTVVisualStyle topMargin](self, "topMargin");
  return v4 + v5 + 2.0;
}

- (double)topMargin
{
  return 12.0;
}

- (UIEdgeInsets)buttonContentEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 40.0;
  v3 = 20.0;
  v4 = 20.0;
  v5 = 40.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v2;
  result.top = v3;
  return result;
}

- (id)buttonFontForStyle:(int64_t)a3
{
  return (id)objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleHeadline"));
}

- (id)defaultTitleColorForUserInterfaceStyle:(int64_t)a3 barStyle:(int64_t)a4
{
  double v4;
  double v5;

  if (a3 == 2)
  {
    v4 = 1.0;
    v5 = 0.25;
  }
  else
  {
    v5 = 0.4;
    v4 = 0.0;
  }
  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
