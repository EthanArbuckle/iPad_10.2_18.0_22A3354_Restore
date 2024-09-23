@implementation UIColor(SBWallpaper)

+ (id)sb_colorWithRGBHexString:()SBWallpaper
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;

  v4 = (objc_class *)MEMORY[0x1E0CB3900];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithString:", v5);

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("#"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCharactersToBeSkipped:", v7);

  v10 = 0;
  if (objc_msgSend(v6, "scanHexInt:", &v10))
  {
    objc_msgSend(a1, "colorWithRed:green:blue:alpha:", (double)BYTE2(v10) / 255.0, (double)BYTE1(v10) / 255.0, (double)v10 / 255.0, 1.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)sb_RGBHexString
{
  double v2;
  double v3;
  double v4;

  v3 = 0.0;
  v4 = 0.0;
  v2 = 0.0;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v4, &v3, &v2, 0);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#%X%X%X"), (int)(v4 * 255.0), (int)(v3 * 255.0), (int)(v2 * 255.0));
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
