@implementation UIColor(PUAlphaAdjust)

- (id)pu_colorWithIncreasedAlpha
{
  void *v2;
  double v4;
  double v5;
  double v6;
  double v7[2];

  v7[1] = *(double *)MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1, "getHue:saturation:brightness:alpha:", &v4, &v5, &v6, v7) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", v4, v5, v6, v7[0] + 0.100000001);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(a1, "getWhite:alpha:", &v4, &v5))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", v4, v5 + 0.100000001);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)pu_colorWithIncreasedBrightness
{
  void *v2;
  double v4;
  double v5;
  double v6;
  double v7[2];

  v7[1] = *(double *)MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1, "getHue:saturation:brightness:alpha:", &v4, &v5, &v6, v7) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", v4, v5, v6 + 0.0500000007, v7[0]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(a1, "getWhite:alpha:", &v4, &v5))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", v4 + 0.0500000007, v5);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

@end
