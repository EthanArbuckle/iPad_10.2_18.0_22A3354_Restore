@implementation UIColor(DarkeningColor)

- (id)darkerColorByPercentage:()DarkeningColor
{
  int v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;

  v6 = 0.0;
  v7 = 0.0;
  v4 = 0;
  v5 = 0;
  v1 = objc_msgSend(a1, "getHue:saturation:brightness:alpha:", &v7, &v6, &v5, &v4);
  v2 = 0;
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", v7, v6);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)colorByAlteringOpacityToPercentage:()DarkeningColor
{
  int v3;
  void *v4;
  uint64_t v6;
  double v7;
  double v8;
  double v9;

  v8 = 0.0;
  v9 = 0.0;
  v6 = 0;
  v7 = 0.0;
  v3 = objc_msgSend(a1, "getRed:green:blue:alpha:", &v9, &v8, &v7, &v6);
  v4 = 0;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v9, v8, v7, a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

@end
