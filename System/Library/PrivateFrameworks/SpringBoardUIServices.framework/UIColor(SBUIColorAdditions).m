@implementation UIColor(SBUIColorAdditions)

+ (id)sbui_systemColorNamed:()SBUIColorAdditions
{
  SEL v3;
  void *v4;
  id v5;

  if (aSelectorName)
  {
    v3 = NSSelectorFromString(aSelectorName);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = (void *)objc_msgSend(MEMORY[0x1E0CEA478], "performSelector:", v3);
    else
      v4 = 0;
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (uint64_t)sbui_randomColor
{
  void *v0;
  double v1;
  double v2;

  v0 = (void *)objc_opt_class();
  v1 = (double)arc4random_uniform(0xFEu) / 255.0;
  v2 = (double)arc4random_uniform(0xFEu) / 255.0;
  return objc_msgSend(v0, "colorWithRed:green:blue:alpha:", v1, v2, (double)arc4random_uniform(0xFEu) / 255.0, 1.0);
}

- (CGColor)sb_isGrayscale
{
  id v1;
  CGColor *result;
  CGColorSpace *v3;
  double v4;
  double v5;
  double v6;

  v1 = objc_retainAutorelease(a1);
  result = (CGColor *)objc_msgSend(v1, "CGColor");
  if (result)
  {
    result = CGColorGetColorSpace(result);
    if (result)
    {
      v3 = result;
      result = (CGColor *)1;
      if (CGColorSpaceGetType())
      {
        if (CGColorSpaceGetModel(v3))
        {
          v5 = 0.0;
          v6 = 0.0;
          v4 = 0.0;
          if (!objc_msgSend(v1, "getRed:green:blue:alpha:", &v6, &v5, &v4, 0) || v6 != v5 || v5 != v4)
            return 0;
        }
      }
    }
  }
  return result;
}

- (double)sb_brightness
{
  uint64_t v2;
  double v3;
  uint64_t v4;
  uint64_t v5;

  v5 = 0;
  v3 = 0.0;
  v4 = 0;
  v2 = 0;
  objc_msgSend(a1, "getHue:saturation:brightness:alpha:", &v5, &v4, &v3, &v2);
  return v3;
}

@end
