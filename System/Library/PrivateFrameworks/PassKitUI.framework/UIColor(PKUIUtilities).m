@implementation UIColor(PKUIUtilities)

+ (uint64_t)colorWithPKColor:()PKUIUtilities
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "pkui_colorWithPKColor:");
}

+ (id)pkui_colorWithPKColor:()PKUIUtilities
{
  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", objc_msgSend(objc_retainAutorelease(a3), "CGColor"));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)pkui_osloErrorColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
}

+ (id)pkui_blendFromColor:()PKUIUtilities toColor:withProgress:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t BlendedLinearColor;
  const void *v10;

  v5 = a4;
  objc_msgSend(a3, "pkui_extendedLinearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pkui_extendedLinearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  if (v6 && v7)
  {
    objc_msgSend(objc_retainAutorelease(v6), "CGColor");
    objc_msgSend(objc_retainAutorelease(v7), "CGColor");
    BlendedLinearColor = PKColorCreateBlendedLinearColor();
    if (BlendedLinearColor)
    {
      v10 = (const void *)BlendedLinearColor;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", BlendedLinearColor);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(v10);
      if (v8)
        objc_setAssociatedObject(v8, &PKUIExtendedLinearColorKey, v8, 0);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)pkui_linearColor
{
  void *v2;
  id v3;
  uint64_t CopyByMatchingLinearSRGB;
  const void *v6;

  objc_getAssociatedObject(a1, &pkui_linearColor_PKUILinearColorKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(objc_retainAutorelease(a1), "CGColor");
    CopyByMatchingLinearSRGB = PKColorCreateCopyByMatchingLinearSRGB();
    if (CopyByMatchingLinearSRGB)
    {
      v6 = (const void *)CopyByMatchingLinearSRGB;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", CopyByMatchingLinearSRGB);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(v6);
      if (v2)
        objc_setAssociatedObject(v2, &pkui_linearColor_PKUILinearColorKey, v2, 0);
    }
    else
    {
      v2 = 0;
    }
  }
  v3 = v2;

  return v3;
}

- (id)pkui_extendedLinearColor
{
  void *v2;
  id v3;
  uint64_t CopyByMatchingExtendedLinearSRGB;
  const void *v6;

  objc_getAssociatedObject(a1, &PKUIExtendedLinearColorKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(objc_retainAutorelease(a1), "CGColor");
    CopyByMatchingExtendedLinearSRGB = PKColorCreateCopyByMatchingExtendedLinearSRGB();
    if (CopyByMatchingExtendedLinearSRGB)
    {
      v6 = (const void *)CopyByMatchingExtendedLinearSRGB;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", CopyByMatchingExtendedLinearSRGB);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(v6);
      if (v2)
        objc_setAssociatedObject(v2, &PKUIExtendedLinearColorKey, v2, 0);
    }
    else
    {
      v2 = 0;
    }
  }
  v3 = v2;

  return v3;
}

+ (id)pkui_colorWithHexString:()PKUIUtilities
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;

  v3 = (void *)MEMORY[0x1E0CB3500];
  v4 = a3;
  objc_msgSend(v3, "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("#"), &stru_1E3E7D690);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length") == 6)
  {
    v11 = 0;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v7);
    objc_msgSend(v8, "scanHexInt:", &v11);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", (double)BYTE2(v11) / 255.0, (double)BYTE1(v11) / 255.0, (double)v11 / 255.0, 1.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
