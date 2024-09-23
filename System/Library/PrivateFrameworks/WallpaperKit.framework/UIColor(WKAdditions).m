@implementation UIColor(WKAdditions)

+ (id)wk_colorWithHexString:()WKAdditions
{
  id v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  int v20;
  double v21[3];
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("#")) && (unint64_t)objc_msgSend(v3, "length") >= 2)
  {
    objc_msgSend(v3, "substringFromIndex:", 1);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v4;
  }
  if (objc_msgSend(v3, "length") == 3)
  {
    v5 = 1;
    v6 = 3;
    v7 = 1;
  }
  else if (objc_msgSend(v3, "length") == 4)
  {
    v7 = 1;
    v6 = 4;
    v5 = 1;
  }
  else
  {
    if (objc_msgSend(v3, "length") == 6)
    {
      v5 = 0;
      v6 = 3;
    }
    else
    {
      if (objc_msgSend(v3, "length") != 8)
      {
LABEL_19:
        v18 = 0;
        goto LABEL_20;
      }
      v5 = 0;
      v6 = 4;
    }
    v7 = 2;
  }
  v8 = 0;
  v9 = 0;
  v22 = 1.0;
  v10 = 8 * v6;
  v11 = 1;
  do
  {
    v12 = v3;
    objc_msgSend(v3, "substringWithRange:", v8, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v5)
    {
      objc_msgSend(v13, "stringByAppendingString:", v13);
      v15 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v15;
    }
    objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v11 &= objc_msgSend(v16, "scanHexInt:", &v20);
    LODWORD(v17) = v20;
    v21[v9 / 8] = (double)v17 / 255.0;

    v9 += 8;
    v8 += v7;
    v3 = v12;
  }
  while (v10 != v9);
  if ((v11 & 1) == 0)
    goto LABEL_19;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v21[0], v21[1], v21[2], v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

  return v18;
}

- (id)wk_colorHexString
{
  CGColor *v1;
  void *v2;
  const CGFloat *Components;
  double Alpha;
  uint64_t v5;

  v1 = (CGColor *)objc_msgSend(objc_retainAutorelease(a1), "CGColor");
  if (CGColorGetNumberOfComponents(v1) >= 3)
  {
    Components = CGColorGetComponents(v1);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#%02lX%02lX%02lX"), llround(*Components * 255.0), llround(Components[1] * 255.0), llround(Components[2] * 255.0));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    Alpha = CGColorGetAlpha(v1);
    if (Alpha < 1.0)
    {
      objc_msgSend(v2, "stringByAppendingFormat:", CFSTR("%02lX"), llround(Alpha * 255.0));
      v5 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v5;
    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)wk_interpolatedToColor:()WKAdditions progress:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;

  v6 = objc_retainAutorelease(a1);
  v7 = a4;
  objc_msgSend(v6, "CGColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_retainAutorelease(v7);
  objc_msgSend(v9, "CGColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  *(float *)&v11 = a2;
  objc_msgSend(v8, "CA_interpolateValue:byFraction:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
