@implementation SHPalette

+ (double)contentsScale
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;

  return v4;
}

+ (id)default
{
  void *v2;
  SHPalette *v3;
  void *v4;

  v2 = (void *)__defaultPalette;
  if (!__defaultPalette)
  {
    v3 = objc_alloc_init(SHPalette);
    v4 = (void *)__defaultPalette;
    __defaultPalette = (uint64_t)v3;

    v2 = (void *)__defaultPalette;
  }
  return v2;
}

- (CGColor)shazamColorNearBlack
{
  void *v2;
  CGColor *v3;

  NSStringFromSelector(a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[SHPalette sh_colorNamed:](SHPalette, "sh_colorNamed:", v2);

  return v3;
}

- (CGColor)listeningButtonBackgroundColor
{
  void *v2;
  CGColor *v3;

  NSStringFromSelector(a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[SHPalette sh_colorNamed:](SHPalette, "sh_colorNamed:", v2);

  return v3;
}

- (CGColor)listeningButtonTopBorderColor
{
  void *v2;
  CGColor *v3;

  NSStringFromSelector(a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[SHPalette sh_colorNamed:](SHPalette, "sh_colorNamed:", v2);

  return v3;
}

- (CGColor)listeningButtonShazamShapeColor
{
  void *v2;
  CGColor *v3;

  NSStringFromSelector(a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[SHPalette sh_colorNamed:](SHPalette, "sh_colorNamed:", v2);

  return v3;
}

- (CGColor)listeningButtonBackgroundTransparentColor
{
  void *v2;
  CGColor *v3;

  NSStringFromSelector(a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[SHPalette sh_colorNamed:](SHPalette, "sh_colorNamed:", v2);

  return v3;
}

- (CGColor)listeningCircleColor
{
  void *v2;
  CGColor *v3;

  NSStringFromSelector(a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[SHPalette sh_colorNamed:](SHPalette, "sh_colorNamed:", v2);

  return v3;
}

- (CGColor)appTintColor
{
  void *v2;
  CGColor *v3;

  NSStringFromSelector(a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[SHPalette sh_colorNamed:](SHPalette, "sh_colorNamed:", v2);

  return v3;
}

- (CGColor)clearColor
{
  return -[SHPalette R:G:B:A:](self, "R:G:B:A:", 1.0, 1.0, 1.0, 0.0);
}

- (CGColor)blackColor
{
  return -[SHPalette R:G:B:A:](self, "R:G:B:A:", 0.0, 0.0, 0.0, 1.0);
}

- (CGColor)alternateTintColor
{
  void *v2;
  CGColor *v3;

  NSStringFromSelector(a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[SHPalette sh_colorNamed:](SHPalette, "sh_colorNamed:", v2);

  return v3;
}

- (CGColor)R:(double)a3 G:(double)a4 B:(double)a5 A:(double)a6
{
  CGColorRef SRGB;

  SRGB = CGColorCreateSRGB(a3, a4, a5, a6);
  CFAutorelease(SRGB);
  return SRGB;
}

+ (CGColor)sh_colorNamed:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  CGColor *v9;

  v3 = (void *)MEMORY[0x24BEBD4B8];
  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = a3;
  objc_msgSend(v4, "sh_UIBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorNamed:inBundle:compatibleWithTraitCollection:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_retainAutorelease(v7);
  v9 = (CGColor *)objc_msgSend(v8, "CGColor");

  return v9;
}

@end
