@implementation UIColor(MTColorTheme)

+ (id)primaryTextColorForTheme:()MTColorTheme
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a3, "primaryTextColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

+ (id)secondaryTextColorForTheme:()MTColorTheme
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "primaryTextColorForTheme:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "colorWithAlphaComponent:", 0.55);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)backgroundColorForTheme:()MTColorTheme
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a3, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

+ (id)selectedBackgroundColorForTheme:()MTColorTheme
{
  id v4;
  void *v5;
  char v6;
  double v7;
  double v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "backgroundColorForTheme:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isBackgroundDark");

  if ((v6 & 1) != 0)
  {
    v7 = 0.1;
    v8 = 1.0;
  }
  else
  {
    v7 = 0.15;
    v8 = 0.0;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_colorBlendedWithColor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (uint64_t)separatorColorForTheme:()MTColorTheme
{
  return objc_msgSend(a1, "separatorColorForDarkBackground:", objc_msgSend(a3, "isBackgroundDark"));
}

+ (uint64_t)artworkBorderColorForTheme:()MTColorTheme
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "artworkBorderColorForDarkBackground:", objc_msgSend(a3, "isBackgroundDark"));
}

+ (id)moreBackgroundColorForTheme:()MTColorTheme
{
  id v4;
  void *v5;
  char v6;
  double v7;
  double v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "backgroundColorForTheme:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isBackgroundDark");

  if ((v6 & 1) != 0)
  {
    v7 = 0.18;
    v8 = 1.0;
  }
  else
  {
    v7 = 0.13;
    v8 = 0.0;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_colorBlendedWithColor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)tintColorForTheme:()MTColorTheme
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a3, "secondaryTextColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "appTintColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

+ (id)barsTintColorForTheme:()MTColorTheme
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a3, "secondaryTextColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "appTintColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

@end
