@implementation UIColor(TVMLKitAdditions)

+ (id)tvmlkit_keyColor
{
  void *v0;
  id v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.109803922, 0.733333333, 1.0, 1.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.556862745, 0.756862745, 1.0);
    v1 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = v0;
  }
  v2 = v1;

  return v2;
}

+ (id)tv_opacityColorForType:()TVMLKitAdditions userInterfaceStyle:
{
  double v4;
  void *v5;
  double v6;

  v4 = 0.0;
  if (a4 == 2)
  {
    if (a3 <= 2)
      v4 = dbl_222E76F48[a3];
    v5 = (void *)MEMORY[0x24BDF6950];
    v6 = 1.0;
  }
  else
  {
    if (a3 <= 2)
      v4 = dbl_222E76F60[a3];
    v5 = (void *)MEMORY[0x24BDF6950];
    v6 = 0.0;
  }
  objc_msgSend(v5, "colorWithWhite:alpha:", v6, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
