@implementation TPSAppearance

+ (id)defaultBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
}

+ (BOOL)isPhoneUI
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 0;

  return v3;
}

+ (BOOL)isMacUI
{
  if (isMacUI_onceToken != -1)
    dispatch_once(&isMacUI_onceToken, &__block_literal_global_2);
  return isMacUI_isMacIdiom;
}

void __24__TPSAppearance_isMacUI__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  isMacUI_isMacIdiom = objc_msgSend(v0, "userInterfaceIdiom") == 5;

}

+ (double)displayMultiplier
{
  if (displayMultiplier_predicate[0] != -1)
    dispatch_once(displayMultiplier_predicate, &__block_literal_global_1);
  return *(double *)&displayMultiplier_gDisplayMultiplier;
}

double __34__TPSAppearance_displayMultiplier__block_invoke()
{
  double result;
  double Width;
  double Height;
  id v3;
  CGRect v4;
  CGRect v5;

  if (+[TPSAppearance isPhoneUI](TPSAppearance, "isPhoneUI"))
  {
    displayMultiplier_gDisplayMultiplier = 0x3FF0000000000000;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    Width = CGRectGetWidth(v4);
    objc_msgSend(v3, "bounds");
    Height = CGRectGetHeight(v5);
    if (Width < Height)
      Height = Width;
    *(double *)&displayMultiplier_gDisplayMultiplier = Height / 768.0;

  }
  return result;
}

+ (double)buttonHeight
{
  return 44.0;
}

+ (double)introOutroTitleTopPadding
{
  return 60.0;
}

+ (id)defaultLabelColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
}

+ (id)secondaryLabelColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
}

+ (id)secondaryBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "secondarySystemBackgroundColor");
}

+ (id)language
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEB7D20], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "language");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)titleLabelFont
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BEBD5F0]);
  v4 = (void *)objc_msgSend(v3, "initForTextStyle:", *MEMORY[0x24BEBE248]);
  objc_msgSend(a1, "systemFontOfSize:weight:", 22.0, *MEMORY[0x24BEBB610]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledFontForFont:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)defaultTextLabelFont
{
  return (id)objc_msgSend(a1, "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
}

+ (id)boldTextFont
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *MEMORY[0x24BEBE220];
  objc_msgSend(a1, "language");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "preferredFontForTextStyle:symoblicTraits:languageCode:", v3, 2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)italicTextFont
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *MEMORY[0x24BEBE220];
  objc_msgSend(a1, "language");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "preferredFontForTextStyle:symoblicTraits:languageCode:", v3, 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)footnoteBoldTextFont
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *MEMORY[0x24BEBE1F0];
  objc_msgSend(a1, "language");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "preferredFontForTextStyle:symoblicTraits:languageCode:", v3, 2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)footnoteItalicTextFont
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *MEMORY[0x24BEBE1F0];
  objc_msgSend(a1, "language");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "preferredFontForTextStyle:symoblicTraits:languageCode:", v3, 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)bodyFont
{
  return (id)objc_msgSend(a1, "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
}

+ (id)footnoteFont
{
  return (id)objc_msgSend(a1, "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
}

+ (id)headlineFont
{
  return (id)objc_msgSend(a1, "preferredFontForTextStyle:", *MEMORY[0x24BEBE200]);
}

+ (id)subheadlineFont
{
  return (id)objc_msgSend(a1, "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
}

+ (id)preferredFontForTextStyle:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "language");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "preferredFontForTextStyle:languageCode:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)preferredFontForTextStyle:(id)a3 languageCode:(id)a4
{
  return (id)objc_msgSend(a1, "preferredFontForTextStyle:symoblicTraits:languageCode:", a3, 0, a4);
}

+ (id)preferredFontForTextStyle:(id)a3 symoblicTraits:(unsigned int)a4 languageCode:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x24BEBB520], "tps_preferredFontForTextStyle:symoblicTraits:languageCode:", a3, *(_QWORD *)&a4, a5);
}

+ (id)systemFontOfSize:(double)a3 weight:(double)a4
{
  void *v6;
  void *v7;
  void *v8;

  v6 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend(a1, "language");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tps_fontWithSize:weight:languageCode:", v7, a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)initAppearanceWithTraits:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v7;
  TPSAppearance *v8;
  TPSAppearance *v9;
  objc_super v11;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPSAppearance;
  v8 = -[TPSAppearance init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[TPSAppearance setSize:](v8, "setSize:", width, height);
    -[TPSAppearance setTraitCollection:](v9, "setTraitCollection:", v7);
    -[TPSAppearance updateAppearanceWithSize:](v9, "updateAppearanceWithSize:", width, height);
  }

  return v9;
}

- (BOOL)isCompactLayout
{
  return -[TPSAppearance mediaSizeType](self, "mediaSizeType") == 1;
}

- (void)setTraitCollection:(id)a3
{
  UITraitCollection *v5;
  UITraitCollection *v6;

  v5 = (UITraitCollection *)a3;
  if (self->_traitCollection != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_traitCollection, a3);
    -[TPSAppearance updateMediaSizeType](self, "updateMediaSizeType");
    v5 = v6;
  }

}

- (void)updateMediaSizeType
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _BOOL8 v8;

  -[TPSAppearance traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "verticalSizeClass");

  -[TPSAppearance traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "horizontalSizeClass");

  v8 = v6 == 1 || v4 == 1;
  -[TPSAppearance setMediaSizeType:](self, "setMediaSizeType:", v8);
}

- (void)updateAppearanceWithSize:(CGSize)a3
{
  self->_size = a3;
}

- (BOOL)sideAppMode
{
  double v2;

  -[TPSAppearance sizeToScreenRatio](self, "sizeToScreenRatio");
  return v2 < 0.49;
}

- (double)displayScale
{
  double v3;
  void *v4;
  double v5;
  double v6;
  double result;

  -[UITraitCollection displayScale](self->_traitCollection, "displayScale");
  if (v3 > 0.0)
  {
    -[UITraitCollection displayScale](self->_traitCollection, "displayScale");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scale");
    v6 = v5;

    return v6;
  }
  return result;
}

- (double)displayMultiplierWithValue:(double)a3
{
  double v4;

  +[TPSAppearance displayMultiplier](TPSAppearance, "displayMultiplier");
  return ceil(v4 * a3);
}

- (double)nativeSizeForValue:(double)a3
{
  double v4;

  -[TPSAppearance displayScale](self, "displayScale");
  return a3 / v4;
}

- (double)heightToWidthRatioFromSizes:(id)a3 mediaSizeType:(unint64_t)a4 defaultValue:(double)a5
{
  double result;

  objc_msgSend(a3, "heightToWidthRatioForViewMode:", a4 == 0);
  if (result <= 0.0)
    return a5;
  return result;
}

- (CGSize)sizeWithSizes:(id)a3 mediaSizeType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  double v12;
  double v13;
  void *v14;
  float v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  v6 = a3;
  v7 = v6;
  if (a4)
    objc_msgSend(v6, "compact");
  else
    objc_msgSend(v6, "regular");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "width");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    -[TPSAppearance nativeSizeForValue:](self, "nativeSizeForValue:", v11);
    v13 = v12;

    objc_msgSend(v9, "height");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "floatValue");
    -[TPSAppearance nativeSizeForValue:](self, "nativeSizeForValue:", v15);
    v17 = v16;

  }
  else
  {
    v13 = 0.0;
    v17 = 0.0;
  }

  v18 = v13;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (unint64_t)mediaSizeType
{
  return self->_mediaSizeType;
}

- (void)setMediaSizeType:(unint64_t)a3
{
  self->_mediaSizeType = a3;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (double)sizeToScreenRatio
{
  return self->_sizeToScreenRatio;
}

- (void)setSizeToScreenRatio:(double)a3
{
  self->_sizeToScreenRatio = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
}

@end
