@implementation UIColor(PosterUIFoundation)

+ (id)pui_wallpaperColorForName:()PosterUIFoundation
{
  NSString *v3;
  SEL v4;
  void *v5;

  objc_msgSend(a3, "stringByAppendingString:", CFSTR("Color"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  v4 = NSSelectorFromString(v3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "performSelector:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (uint64_t)pui_determineVarianceAndLuminanceForColor:()PosterUIFoundation amongstColors:outVariance:outLuminance:outSaturation:
{
  return objc_msgSend(a1, "pui_determineVarianceAndLuminanceForColor:amongstColors:minLuminance:maxLuminance:outVariance:outLuminance:outSaturation:", a3, a4, 0, 0, a5, a6, a7);
}

+ (double)pui_determineVarianceAndLuminanceForColor:()PosterUIFoundation amongstColors:minLuminance:maxLuminance:outVariance:outLuminance:outSaturation:
{
  double result;
  double v11;

  v11 = 0.0;
  objc_msgSend(a1, "pui_determineVarianceAndLuminanceForColor:amongstColors:minLuminance:maxLuminance:outHue:outSaturation:outLuminance:", a3, a4, a5, a6, &v11, a9, a8);
  if (a7)
  {
    result = v11 * 4.0 / 0.1 + -2.0;
    *a7 = result;
  }
  return result;
}

+ (void)pui_determineVarianceAndLuminanceForColor:()PosterUIFoundation amongstColors:minLuminance:maxLuminance:outHue:outSaturation:outLuminance:
{
  void *v12;
  id v13;
  id v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  PUIColorValues *v26;

  if (a6)
    v12 = a6;
  else
    v12 = &unk_25156B050;
  v13 = a5;
  v14 = a3;
  objc_msgSend(v12, "bs_CGFloatValue");
  v16 = v15;
  if (v13)
    v17 = v13;
  else
    v17 = &unk_25156B060;
  objc_msgSend(v17, "bs_CGFloatValue");
  v19 = v18;

  v26 = -[PUIColorValues initWithColor:]([PUIColorValues alloc], "initWithColor:", v14);
  -[PUIColorValues hslValues](v26, "hslValues");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "saturation");
  v22 = v21;
  objc_msgSend(v20, "hue");
  v24 = v23;
  objc_msgSend(v20, "luminance");
  if (a7)
    *a7 = v24;
  if (a8)
    *a8 = v22;
  if (a9)
    *a9 = fmax(v19, fmin(v25, v16));

}

+ (double)pui_determineVarianceForHue:()PosterUIFoundation forColors:
{
  id v5;
  unint64_t v6;
  double v7;
  char v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  PUIColorValues *v13;
  PUIColorValues *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  BOOL v21;
  char v22;
  char v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  unint64_t v30;

  v5 = a4;
  v6 = objc_msgSend(v5, "count");
  v7 = -1.0;
  if (v6 >= 2)
  {
    v8 = 0;
    v9 = 0;
    v30 = v6 - 1;
    while (1)
    {
      v10 = v9 + 1;
      objc_msgSend(v5, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", v9 + 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[PUIColorValues initWithColor:]([PUIColorValues alloc], "initWithColor:", v11);
      v14 = -[PUIColorValues initWithColor:]([PUIColorValues alloc], "initWithColor:", v12);
      -[PUIColorValues hslValues](v13, "hslValues");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "hue");
      v17 = v16;

      -[PUIColorValues hslValues](v14, "hslValues");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "hue");
      v20 = v19;

      v21 = v20 <= a1;
      if (v17 <= a1)
      {
        v22 = 1;
      }
      else
      {
        v21 = 0;
        v22 = 0;
      }
      if (v20 < a1)
        v22 = 0;
      if (v17 < v20)
        v23 = v22;
      else
        v23 = v21;
      if (v17 >= v20)
        v8 = 1;

      if ((v23 & 1) != 0)
        break;
      ++v9;
      if (v30 == v10)
        goto LABEL_22;
    }
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v24 = (a1 - v17) / (v20 - v17);
      v25 = a1 + 1.0;
      if (v17 <= a1)
        v25 = a1;
      v26 = (v25 - v17) / (v20 + 1.0 - v17);
      if ((v8 & 1) != 0)
        v24 = v26;
      v27 = (double)v9 / (double)v30;
      v28 = (double)(v9 + 1) / (double)v30 - v27;
      v7 = v27 + v28 * (v24 + 0.0) + v27 + v28 * (v24 + 0.0) + -1.0;
    }
  }
LABEL_22:

  return v7;
}

- (id)pui_hslValues
{
  PUIColorValues *v1;
  void *v2;

  v1 = -[PUIColorValues initWithColor:]([PUIColorValues alloc], "initWithColor:", a1);
  -[PUIColorValues hslValues](v1, "hslValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)pui_hsbValues
{
  PUIColorValues *v1;
  void *v2;

  v1 = -[PUIColorValues initWithColor:]([PUIColorValues alloc], "initWithColor:", a1);
  -[PUIColorValues hsbValues](v1, "hsbValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)pui_minLuminance
{
  void *v1;

  objc_msgSend(a1, "pui_hslValues");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "luminance");

}

- (double)pui_maxLuminance
{
  return 1.0;
}

- (id)pui_invertColor
{
  CGColor *v1;
  size_t NumberOfComponents;
  const CGFloat *Components;
  const CGFloat *v4;
  CGColorSpace *ColorSpace;
  CGColor *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v1 = (CGColor *)objc_msgSend(objc_retainAutorelease(a1), "CGColor");
  NumberOfComponents = CGColorGetNumberOfComponents(v1);
  Components = CGColorGetComponents(v1);
  v4 = (const CGFloat *)((char *)v9 - ((8 * NumberOfComponents + 15) & 0xFFFFFFFFFFFFFFF0));
  if ((uint64_t)(NumberOfComponents - 1) >= 0)
  {
    do
    {
      v4[NumberOfComponents - 1] = 1.0 - Components[NumberOfComponents - 1];
      --NumberOfComponents;
    }
    while (NumberOfComponents);
  }
  ColorSpace = CGColorGetColorSpace(v1);
  v6 = CGColorCreate(ColorSpace, v4);
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithCGColor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CGColorRelease(v6);
  return v7;
}

@end
