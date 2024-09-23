@implementation UIColor(SBHAdditions)

- (CGColor)sbh_isGrayscale
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

- (uint64_t)sbh_colorfulness
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (objc_msgSend(a1, "sbh_isGrayscale"))
    return objc_msgSend(a1, "sbh_perceivedLightness");
  v5 = 0;
  v6 = 0;
  v3 = 0;
  v4 = 0;
  objc_msgSend(a1, "getHue:saturation:brightness:alpha:", &v6, &v5, &v4, &v3);
  return objc_msgSend(a1, "sbh_perceivedLightness");
}

- (uint64_t)sbh_perceivedLightness
{
  objc_msgSend(objc_retainAutorelease(a1), "CGColor");
  return MTCGColorPerceivedLightness();
}

+ (uint64_t)sbh_randomColor
{
  double v2;
  double v3;

  v2 = (double)arc4random_uniform(0xFEu) / 255.0;
  v3 = (double)arc4random_uniform(0xFEu) / 255.0;
  return objc_msgSend(a1, "colorWithRed:green:blue:alpha:", v2, v3, (double)arc4random_uniform(0xFEu) / 255.0, 1.0);
}

+ (uint64_t)sbh_brightColorWithRandomHue
{
  return objc_msgSend(a1, "colorWithHue:saturation:brightness:alpha:", (double)arc4random_uniform(0xFEu) / 255.0, 1.0, 1.0, 1.0);
}

+ (id)sbh_colorWithHexString:()SBHAdditions
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned int v10;

  v3 = a3;
  if (!v3)
  {
    v5 = 0;
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  v4 = v3;
  objc_msgSend(v3, "uppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "hasPrefix:", CFSTR("#")))
  {
    objc_msgSend(v5, "substringFromIndex:", 1);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  if (objc_msgSend(v5, "length") != 6)
    goto LABEL_9;
  objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setScanLocation:", 0);
  v10 = 0;
  v8 = 0;
  if (objc_msgSend(v7, "scanHexInt:", &v10))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", (float)((float)(unsigned __int16)(-255 * ((unsigned __int16)((32897 * HIWORD(v10)) >> 16) >> 7)+ HIWORD(v10))/ 255.0), (float)((float)(-255 * (v10 / 0xFF00) + (v10 >> 8)) / 255.0), (float)((float)v10 / 255.0), 1.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_10:
  return v8;
}

@end
