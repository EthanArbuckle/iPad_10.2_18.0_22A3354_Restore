@implementation PUIStyleColor

+ (PUIStyleColor)vibrantMaterialColor
{
  if (vibrantMaterialColor_onceToken != -1)
    dispatch_once(&vibrantMaterialColor_onceToken, &__block_literal_global_11);
  return (PUIStyleColor *)(id)vibrantMaterialColor_vibrantMaterialColor;
}

void __37__PUIStyleColor_vibrantMaterialColor__block_invoke()
{
  PUIStyleColor *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [PUIStyleColor alloc];
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.5);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[PUIStyleColor initWithIdentifier:color:preferredStyle:](v0, "initWithIdentifier:color:preferredStyle:", CFSTR("vibrantMaterialColor"), v3, 2);
  v2 = (void *)vibrantMaterialColor_vibrantMaterialColor;
  vibrantMaterialColor_vibrantMaterialColor = v1;

}

+ (PUIStyleColor)vibrantMonochromeColor
{
  if (vibrantMonochromeColor_onceToken != -1)
    dispatch_once(&vibrantMonochromeColor_onceToken, &__block_literal_global_7_0);
  return (PUIStyleColor *)(id)vibrantMonochromeColor_vibrantMonochromeColor;
}

void __39__PUIStyleColor_vibrantMonochromeColor__block_invoke()
{
  PUIStyleColor *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [PUIStyleColor alloc];
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[PUIStyleColor initWithIdentifier:color:preferredStyle:](v0, "initWithIdentifier:color:preferredStyle:", CFSTR("vibrantMonochromeColor"), v3, 2);
  v2 = (void *)vibrantMonochromeColor_vibrantMonochromeColor;
  vibrantMonochromeColor_vibrantMonochromeColor = v1;

}

+ (id)styleStringForStyle:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("default");
  if (a3 == 1)
    v3 = CFSTR("regular");
  if (a3 == 2)
    return CFSTR("vibrant");
  else
    return (id)v3;
}

+ (id)identifierForColorWithValues:(id)a3 style:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "styleStringForStyle:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  -[PUIStyleColor color](self, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = v5;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PUIStyleColor;
    -[PUIStyleColor forwardingTargetForSelector:](&v9, sel_forwardingTargetForSelector_, a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (PUIStyleColor)initWithHue:(double)a3 saturation:(double)a4 luminance:(double)a5 alpha:(double)a6 preferredStyle:(unint64_t)a7 suggested:(BOOL)a8
{
  return -[PUIStyleColor initWithHue:saturation:luminance:alpha:preferredStyle:localizedName:suggested:](self, "initWithHue:saturation:luminance:alpha:preferredStyle:localizedName:suggested:", a7, 0, a8, a3, a4, a5, a6);
}

- (PUIStyleColor)initWithHue:(double)a3 saturation:(double)a4 luminance:(double)a5 alpha:(double)a6 preferredStyle:(unint64_t)a7 localizedName:(id)a8 suggested:(BOOL)a9
{
  _BOOL8 v9;
  id v16;
  PUIColorValues *v17;
  void *v18;
  void *v19;
  PUIStyleColor *v20;

  v9 = a9;
  v16 = a8;
  v17 = -[PUIColorValues initWithHue:saturation:luminance:alpha:]([PUIColorValues alloc], "initWithHue:saturation:luminance:alpha:", a3, a4, a5, a6);
  -[PUIColorValues color](v17, "color");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "identifierForColorWithValues:style:", v17, a7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[PUIStyleColor initWithIdentifier:color:colorValues:preferredStyle:localizedName:suggested:](self, "initWithIdentifier:color:colorValues:preferredStyle:localizedName:suggested:", v19, v18, v17, a7, v16, v9);

  return v20;
}

- (PUIStyleColor)initWithColor:(id)a3
{
  return -[PUIStyleColor initWithColor:preferredStyle:](self, "initWithColor:preferredStyle:", a3, 0);
}

- (PUIStyleColor)initWithColor:(id)a3 preferredStyle:(unint64_t)a4
{
  return -[PUIStyleColor initWithColor:preferredStyle:localizedName:](self, "initWithColor:preferredStyle:localizedName:", a3, a4, 0);
}

- (PUIStyleColor)initWithColor:(id)a3 preferredStyle:(unint64_t)a4 localizedName:(id)a5
{
  return -[PUIStyleColor initWithColor:preferredStyle:localizedName:suggested:](self, "initWithColor:preferredStyle:localizedName:suggested:", a3, a4, a5, 0);
}

- (PUIStyleColor)initWithColor:(id)a3 preferredStyle:(unint64_t)a4 localizedName:(id)a5 suggested:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  PUIColorValues *v12;
  void *v13;
  PUIStyleColor *v14;

  v6 = a6;
  v10 = a5;
  v11 = a3;
  v12 = -[PUIColorValues initWithColor:]([PUIColorValues alloc], "initWithColor:", v11);
  objc_msgSend((id)objc_opt_class(), "identifierForColorWithValues:style:", v12, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PUIStyleColor initWithIdentifier:color:colorValues:preferredStyle:localizedName:suggested:](self, "initWithIdentifier:color:colorValues:preferredStyle:localizedName:suggested:", v13, v11, v12, a4, v10, v6);

  return v14;
}

- (PUIStyleColor)initWithIdentifier:(id)a3 color:(id)a4 preferredStyle:(unint64_t)a5
{
  id v8;
  id v9;
  PUIColorValues *v10;
  PUIStyleColor *v11;

  v8 = a4;
  v9 = a3;
  v10 = -[PUIColorValues initWithColor:]([PUIColorValues alloc], "initWithColor:", v8);
  v11 = -[PUIStyleColor initWithIdentifier:color:colorValues:preferredStyle:](self, "initWithIdentifier:color:colorValues:preferredStyle:", v9, v8, v10, a5);

  return v11;
}

- (PUIStyleColor)initWithPosterColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  PUIStyleColor *v11;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "preferredStyle");
  objc_msgSend(v4, "localizedName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "isSuggested");

  v11 = -[PUIStyleColor initWithIdentifier:color:colorValues:preferredStyle:localizedName:suggested:](self, "initWithIdentifier:color:colorValues:preferredStyle:localizedName:suggested:", v5, v6, v7, v8, v9, v10);
  return v11;
}

- (PUIStyleColor)initWithLUTIdentifier:(id)a3
{
  void *v4;
  PUIStyleColor *v5;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("lutColor-"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PUIStyleColor initWithIdentifier:color:preferredStyle:](self, "initWithIdentifier:color:preferredStyle:", v4, 0, 0);

  return v5;
}

- (PUIStyleColor)initWithIdentifier:(id)a3 color:(id)a4 colorValues:(id)a5 preferredStyle:(unint64_t)a6
{
  return -[PUIStyleColor initWithIdentifier:color:colorValues:preferredStyle:localizedName:](self, "initWithIdentifier:color:colorValues:preferredStyle:localizedName:", a3, a4, a5, a6, 0);
}

- (PUIStyleColor)initWithIdentifier:(id)a3 color:(id)a4 colorValues:(id)a5 preferredStyle:(unint64_t)a6 localizedName:(id)a7
{
  return -[PUIStyleColor initWithIdentifier:color:colorValues:preferredStyle:localizedName:suggested:](self, "initWithIdentifier:color:colorValues:preferredStyle:localizedName:suggested:", a3, a4, a5, a6, a7, 0);
}

- (PUIStyleColor)initWithIdentifier:(id)a3 color:(id)a4 colorValues:(id)a5 preferredStyle:(unint64_t)a6 localizedName:(id)a7 suggested:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  PUIStyleColor *v18;
  uint64_t v19;
  NSString *identifier;
  uint64_t v21;
  void *color;
  uint64_t v23;
  UIColor *v24;
  uint64_t v25;
  NSString *localizedName;
  objc_super v28;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v28.receiver = self;
  v28.super_class = (Class)PUIStyleColor;
  v18 = -[PUIStyleColor init](&v28, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v14, "copy");
    identifier = v18->_identifier;
    v18->_identifier = (NSString *)v19;

    if (v15)
    {
      v21 = objc_msgSend(v15, "copy");
      color = v18->_color;
      v18->_color = (UIColor *)v21;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "vibrantMaterialColor");
      color = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(color, "color");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v18->_color;
      v18->_color = (UIColor *)v23;

    }
    objc_storeStrong((id *)&v18->_colorValues, a5);
    v18->_preferredStyle = a6;
    v25 = objc_msgSend(v17, "copy");
    localizedName = v18->_localizedName;
    v18->_localizedName = (NSString *)v25;

    v18->_suggested = a8;
  }

  return v18;
}

- (BOOL)isVibrantMaterialColor
{
  PUIStyleColor *v3;

  objc_msgSend((id)objc_opt_class(), "vibrantMaterialColor");
  v3 = (PUIStyleColor *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v3 == self;

  return (char)self;
}

- (BOOL)isVibrantMonochromeColor
{
  PUIStyleColor *v3;

  objc_msgSend((id)objc_opt_class(), "vibrantMonochromeColor");
  v3 = (PUIStyleColor *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v3 == self;

  return (char)self;
}

- (BOOL)isLUTBackedColor
{
  void *v2;
  char v3;

  -[PUIStyleColor identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("lutColor-"));

  return v3;
}

- (id)copyWithLuminance:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;

  if (-[PUIStyleColor isVibrantMonochromeColor](self, "isVibrantMonochromeColor")
    || -[PUIStyleColor isVibrantMaterialColor](self, "isVibrantMaterialColor")
    || -[PUIStyleColor isLUTBackedColor](self, "isLUTBackedColor"))
  {
    return self;
  }
  -[PUIStyleColor colorValues](self, "colorValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PUIStyleColor colorValues](self, "colorValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hslValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_alloc((Class)objc_opt_class());
    objc_msgSend(v7, "hue");
    v10 = v9;
    objc_msgSend(v7, "saturation");
    v12 = v11;
    -[PUIStyleColor colorValues](self, "colorValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "alpha");
    v15 = (void *)objc_msgSend(v8, "initWithHue:saturation:luminance:alpha:preferredStyle:suggested:", -[PUIStyleColor preferredStyle](self, "preferredStyle"), -[PUIStyleColor isSuggested](self, "isSuggested"), v10, v12, a3, v14);

    return v15;
  }
  else
  {
    objc_opt_class();
    return (id)objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "initWithPosterColor:", self);
  }
}

- (id)copyWithAlpha:(double)a3
{
  void *v5;
  void *v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;

  if (-[PUIStyleColor isVibrantMonochromeColor](self, "isVibrantMonochromeColor")
    || -[PUIStyleColor isVibrantMaterialColor](self, "isVibrantMaterialColor")
    || -[PUIStyleColor isLUTBackedColor](self, "isLUTBackedColor"))
  {
    return self;
  }
  -[PUIStyleColor color](self, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorWithAlphaComponent:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc((Class)objc_opt_class());
  v8 = -[PUIStyleColor preferredStyle](self, "preferredStyle");
  -[PUIStyleColor localizedName](self, "localizedName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithColor:preferredStyle:localizedName:suggested:", v6, v8, v9, -[PUIStyleColor isSuggested](self, "isSuggested"));

  return v10;
}

- (id)hsbValues
{
  void *v2;
  void *v3;

  -[PUIStyleColor colorValues](self, "colorValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hsbValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hslValues
{
  void *v2;
  void *v3;

  -[PUIStyleColor colorValues](self, "colorValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hslValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)lutIdentifier
{
  void *v3;
  void *v4;

  if (-[PUIStyleColor isLUTBackedColor](self, "isLUTBackedColor"))
  {
    -[PUIStyleColor identifier](self, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("lutColor-"), "length"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)copyAsSuggestedColor
{
  PUIStyleColor *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  PUIStyleColor *v9;

  v3 = [PUIStyleColor alloc];
  -[PUIStyleColor identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIStyleColor color](self, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIStyleColor colorValues](self, "colorValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PUIStyleColor preferredStyle](self, "preferredStyle");
  -[PUIStyleColor localizedName](self, "localizedName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PUIStyleColor initWithIdentifier:color:colorValues:preferredStyle:localizedName:suggested:](v3, "initWithIdentifier:color:colorValues:preferredStyle:localizedName:suggested:", v4, v5, v6, v7, v8, 1);

  return v9;
}

- (BOOL)isEquivalentToColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  -[PUIStyleColor identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = BSEqualStrings();

  if (v7)
  {
    -[PUIStyleColor localizedName](self, "localizedName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = BSEqualStrings();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)contentStyle
{
  return -[PUIStyleColor contentStylePreferringVibrancy:](self, "contentStylePreferringVibrancy:", 0);
}

- (id)contentStylePreferringVibrancy:(BOOL)a3
{
  _BOOL4 v3;
  __objc2_class *v5;
  PUIStyleLUT *v6;
  PUIStyleLUT *v8;
  void *v9;
  _BOOL4 v10;
  uint64_t v11;
  double v12;
  void *v13;
  double v14;
  PUIStyleDiscreteColors *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v3 = a3;
  v18[1] = *MEMORY[0x24BDAC8D0];
  if (!-[PUIStyleColor isVibrantMaterialColor](self, "isVibrantMaterialColor"))
  {
    if (-[PUIStyleColor isVibrantMonochromeColor](self, "isVibrantMonochromeColor"))
    {
      v5 = PUIStyleVibrantMonochrome;
      goto LABEL_5;
    }
    if (-[PUIStyleColor isLUTBackedColor](self, "isLUTBackedColor"))
    {
      v8 = [PUIStyleLUT alloc];
      -[PUIStyleColor lutIdentifier](self, "lutIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[PUIStyleLUT initWithLUTIdentifier:](v8, "initWithLUTIdentifier:", v9);

      return v6;
    }
    v10 = -[PUIStyleColor requiresVibrancyEffectView](self, "requiresVibrancyEffectView");
    if (v10 || !v3)
    {
      if (!v10)
        goto LABEL_12;
    }
    else if (-[PUIStyleColor preferredStyle](self, "preferredStyle"))
    {
LABEL_12:
      v11 = 0;
      v12 = 0.0;
LABEL_15:
      v15 = [PUIStyleDiscreteColors alloc];
      -[PUIStyleColor color](self, "color");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v16;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[PUIStyleDiscreteColors initWithColors:vibrant:supportsVariation:variationValue:](v15, "initWithColors:vibrant:supportsVariation:variationValue:", v17, v11, 1, v12);

      -[PUIStyleLUT setNeedsToResolveVariationFromColorStore:](v6, "setNeedsToResolveVariationFromColorStore:", 1);
      return v6;
    }
    -[PUIStyleColor colorValues](self, "colorValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "alpha");
    v12 = v14;

    v11 = 1;
    goto LABEL_15;
  }
  v5 = PUIStyleVibrantMaterial;
LABEL_5:
  v6 = (PUIStyleLUT *)objc_alloc_init(v5);
  return v6;
}

- (BOOL)requiresVibrancyEffectView
{
  void *v3;

  -[PUIStyleColor colorValues](self, "colorValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alpha");

  return !BSFloatIsOne() || -[PUIStyleColor preferredStyle](self, "preferredStyle") == 2;
}

- (id)vibrancyConfiguration
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _BOOL4 v8;
  id v9;
  void *v10;

  if (-[PUIStyleColor isVibrantMaterialColor](self, "isVibrantMaterialColor"))
  {
    v3 = objc_alloc(MEMORY[0x24BE0BF48]);
    -[PUIStyleColor color](self, "color");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v3;
    v6 = 0;
  }
  else if (-[PUIStyleColor isVibrantMonochromeColor](self, "isVibrantMonochromeColor"))
  {
    v7 = objc_alloc(MEMORY[0x24BE0BF48]);
    -[PUIStyleColor color](self, "color");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v7;
    v6 = 2;
  }
  else
  {
    v8 = -[PUIStyleColor isLUTBackedColor](self, "isLUTBackedColor");
    v9 = objc_alloc(MEMORY[0x24BE0BF48]);
    -[PUIStyleColor color](self, "color");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v9;
    if (v8)
      v6 = 3;
    else
      v6 = 1;
  }
  v10 = (void *)objc_msgSend(v5, "initWithEffectType:backgroundType:color:", v6, 0, v4);

  return v10;
}

- (id)colors
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  -[PUIStyleColor color](self, "color");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)type
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  PUIStyleColor *v4;
  void *v5;
  char isKindOfClass;
  PUIStyleColor *v7;
  _BOOL4 v8;
  _BOOL4 v9;

  v4 = (PUIStyleColor *)a3;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      if (-[PUIStyleColor isEquivalentToColor:](self, "isEquivalentToColor:", v7))
      {
        v8 = -[PUIStyleColor isSuggested](self, "isSuggested");
        v9 = v8 ^ -[PUIStyleColor isSuggested](v7, "isSuggested") ^ 1;
      }
      else
      {
        LOBYTE(v9) = 0;
      }

    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  unint64_t v9;

  v3 = objc_alloc_init(MEMORY[0x24BE0BE28]);
  -[PUIStyleColor identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendString:", v4);

  -[PUIStyleColor localizedName](self, "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendString:", v6);

  v8 = (id)objc_msgSend(v3, "appendBool:", -[PUIStyleColor isSuggested](self, "isSuggested"));
  v9 = objc_msgSend(v3, "hash");

  return v9;
}

- (NSString)description
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  PUIStyleColor *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x24BE0BE10]);
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __28__PUIStyleColor_description__block_invoke;
  v10 = &unk_25154BFC0;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

uint64_t __28__PUIStyleColor_description__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendDescriptionToFormatter:", *(_QWORD *)(a1 + 40));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PUIStyleColor identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("identifier"));

  -[PUIStyleColor color](self, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("color"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[PUIStyleColor preferredStyle](self, "preferredStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("preferredStyle"));

  objc_msgSend(v8, "encodeBool:forKey:", self->_suggested, CFSTR("suggested"));
  if (self->_localizedName)
  {
    -[PUIStyleColor localizedName](self, "localizedName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("localizedName"));

  }
}

- (PUIStyleColor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  PUIStyleColor *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  PUIColorValues *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("vibrantMaterialColor")))
  {
    +[PUIStyleColor vibrantMaterialColor](PUIStyleColor, "vibrantMaterialColor");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("vibrantMonochromeColor")))
    {
      objc_opt_self();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("color"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferredStyle"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "unsignedIntegerValue");

      v12 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("suggested"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedName"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[PUIColorValues initWithColor:]([PUIColorValues alloc], "initWithColor:", v9);
      v7 = -[PUIStyleColor initWithIdentifier:color:colorValues:preferredStyle:localizedName:suggested:]([PUIStyleColor alloc], "initWithIdentifier:color:colorValues:preferredStyle:localizedName:suggested:", v5, v9, v14, v11, v13, v12);

      goto LABEL_7;
    }
    +[PUIStyleColor vibrantMonochromeColor](PUIStyleColor, "vibrantMonochromeColor");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (PUIStyleColor *)v6;
LABEL_7:

  return v7;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PUIStyleColor identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("identifier"));

  -[PUIStyleColor color](self, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("color"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[PUIStyleColor preferredStyle](self, "preferredStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("preferredStyle"));

  objc_msgSend(v8, "encodeBool:forKey:", -[PUIStyleColor isSuggested](self, "isSuggested"), CFSTR("suggested"));
  if (self->_localizedName)
  {
    -[PUIStyleColor localizedName](self, "localizedName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("localizedName"));

  }
}

- (PUIStyleColor)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  PUIStyleColor *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  PUIColorValues *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("vibrantMaterialColor")))
  {
    +[PUIStyleColor vibrantMaterialColor](PUIStyleColor, "vibrantMaterialColor");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("vibrantMonochromeColor")))
    {
      objc_opt_self();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("color"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferredStyle"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "unsignedIntegerValue");

      v12 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("suggested"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedName"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[PUIColorValues initWithColor:]([PUIColorValues alloc], "initWithColor:", v9);
      v7 = -[PUIStyleColor initWithIdentifier:color:colorValues:preferredStyle:localizedName:suggested:]([PUIStyleColor alloc], "initWithIdentifier:color:colorValues:preferredStyle:localizedName:suggested:", v5, v9, v14, v11, v13, v12);

      goto LABEL_7;
    }
    +[PUIStyleColor vibrantMonochromeColor](PUIStyleColor, "vibrantMonochromeColor");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (PUIStyleColor *)v6;
LABEL_7:

  return v7;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v10 = a3;
  -[PUIStyleColor identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v10, "appendObject:withName:", v4, CFSTR("identifier"));

  -[PUIStyleColor color](self, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v10, "appendObject:withName:", v6, CFSTR("color"));

  v8 = (id)objc_msgSend(v10, "appendUnsignedInteger:withName:", -[PUIStyleColor preferredStyle](self, "preferredStyle"), CFSTR("preferredStyle"));
  v9 = (id)objc_msgSend(v10, "appendBool:withName:ifEqualTo:", -[PUIStyleColor isSuggested](self, "isSuggested"), CFSTR("isSuggested"), 1);

}

- (PUIColorValues)colorValues
{
  return self->_colorValues;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (UIColor)color
{
  return self->_color;
}

- (unint64_t)preferredStyle
{
  return self->_preferredStyle;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (BOOL)isSuggested
{
  return self->_suggested;
}

- (void)setSuggested:(BOOL)a3
{
  self->_suggested = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_colorValues, 0);
}

@end
