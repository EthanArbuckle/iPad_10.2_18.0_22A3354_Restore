@implementation PREditingColorItem

+ (id)vibrantMaterialItem
{
  PREditorColorPickerConstantColor *v2;
  void *v3;
  PREditorColorPickerConstantColor *v4;
  PREditingColorItem *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v2 = [PREditorColorPickerConstantColor alloc];
  +[PRPosterColor vibrantMaterialColor](PRPosterColor, "vibrantMaterialColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PREditorColorPickerConstantColor initWithColor:initialVariation:](v2, "initWithColor:initialVariation:", v3, 0.0);

  v5 = -[PREditingColorItem initWithPickerColor:variation:context:]([PREditingColorItem alloc], "initWithPickerColor:variation:context:", v4, 1, 0.0);
  -[PREditingColorItem setShowsSlider:](v5, "setShowsSlider:", 0);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0DC3890]);
  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("material"), v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithImage:", v8);

  objc_msgSend(v9, "setContentMode:", 1);
  -[PREditingColorItem setItemView:](v5, "setItemView:", v9);

  return v5;
}

+ (id)suggestedColorItemWithColor:(id)a3 context:(unint64_t)a4
{
  id v6;
  double v7;
  __objc2_class **v8;
  void *v9;
  PREditingColorItem *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CGRect v19;
  CGRect v20;

  v6 = a3;
  if (a4 == 1)
    v7 = 1.0;
  else
    v7 = 0.0;
  v8 = off_1E2181358;
  if (a4 != 1)
    v8 = off_1E2181350;
  v9 = (void *)objc_msgSend(objc_alloc(*v8), "initWithColor:initialVariation:", v6, v7);
  v10 = -[PREditingColorItem initWithPickerColor:variation:context:]([PREditingColorItem alloc], "initWithPickerColor:variation:context:", v9, 0, v7);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, 30.0, 30.0);
  objc_msgSend(v6, "color");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v12);

  v13 = objc_alloc(MEMORY[0x1E0DC3890]);
  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("sparkles"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithImage:", v14);

  objc_msgSend(v6, "color");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_legibleIconColorForBackgroundColor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTintColor:", v17);

  objc_msgSend(v11, "bounds");
  v20 = CGRectInset(v19, 6.0, 6.0);
  objc_msgSend(v15, "setFrame:", v20.origin.x, v20.origin.y, v20.size.width, v20.size.height);
  objc_msgSend(v15, "setContentMode:", 1);
  objc_msgSend(v11, "addSubview:", v15);
  objc_msgSend(v15, "setAutoresizingMask:", 18);
  -[PREditingColorItem setItemView:](v10, "setItemView:", v11);

  return v10;
}

- (PREditingColorItem)initWithPickerColor:(id)a3 variation:(double)a4 context:(unint64_t)a5
{
  id v9;
  PREditingColorItem *v10;
  PREditingColorItem *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PREditingColorItem;
  v10 = -[PREditingColorItem init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_pickerColor, a3);
    v11->_pickerRespondsToDisplayColorSelector = objc_opt_respondsToSelector() & 1;
    v11->_variation = a4;
    v11->_showsSlider = 1;
    v11->_context = a5;
  }

  return v11;
}

- (PRPosterColor)baseColor
{
  void *v2;
  void *v3;

  -[PREditingColorItem pickerColor](self, "pickerColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "baseColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PRPosterColor *)v3;
}

- (NSString)localizedName
{
  void *v2;
  void *v3;

  -[PREditingColorItem pickerColor](self, "pickerColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (PRPosterColor)color
{
  void *v3;
  void *v4;

  -[PREditingColorItem pickerColor](self, "pickerColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithVariation:", self->_variation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PRPosterColor *)v4;
}

- (PRPosterColor)displayColor
{
  _BOOL4 pickerRespondsToDisplayColorSelector;
  void *v4;
  void *v5;
  double variation;
  void *v7;

  pickerRespondsToDisplayColorSelector = self->_pickerRespondsToDisplayColorSelector;
  -[PREditingColorItem pickerColor](self, "pickerColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  variation = self->_variation;
  if (pickerRespondsToDisplayColorSelector)
    objc_msgSend(v4, "displayColorWithVariation:", variation);
  else
    objc_msgSend(v4, "colorWithVariation:", variation);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (PRPosterColor *)v7;
}

- (BOOL)isEqual:(id)a3
{
  PREditingColorItem *v4;
  PREditingColorItem *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;

  v4 = (PREditingColorItem *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PREditingColorItem baseColor](self, "baseColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PREditingColorItem baseColor](v5, "baseColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (BSEqualObjects())
      {
        -[PREditingColorItem variation](self, "variation");
        v9 = v8;
        -[PREditingColorItem variation](v5, "variation");
        v11 = v9 == v10;
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PREditingColorItem baseColor](self, "baseColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingColorItem variation](self, "variation");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<PREditingColorItem: %p> Base Color: %@ Variation: %.5f"), self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_legibleIconColorForBackgroundColor:(id)a3
{
  void *v3;
  int v4;
  double v5;
  void *v6;
  double v8;
  uint64_t v9;
  uint64_t v10;

  v9 = 0;
  v10 = 0;
  v8 = 0.0;
  objc_msgSend(a3, "colorWithAlphaComponent:", 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "getHue:saturation:brightness:alpha:", &v10, &v9, &v8, 0);

  if (v4 && (v5 = v8, v8 >= 0.9))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (BOOL)isFromUIKitColorPicker
{
  return self->_fromUIKitColorPicker;
}

- (void)setFromUIKitColorPicker:(BOOL)a3
{
  self->_fromUIKitColorPicker = a3;
}

- (BOOL)shouldShowSlider
{
  return self->_showsSlider;
}

- (void)setShowsSlider:(BOOL)a3
{
  self->_showsSlider = a3;
}

- (PREditorColorPickerColor)pickerColor
{
  return self->_pickerColor;
}

- (double)variation
{
  return self->_variation;
}

- (void)setVariation:(double)a3
{
  self->_variation = a3;
}

- (UIView)itemView
{
  return self->_itemView;
}

- (void)setItemView:(id)a3
{
  objc_storeStrong((id *)&self->_itemView, a3);
}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (BOOL)pickerRespondsToDisplayColorSelector
{
  return self->_pickerRespondsToDisplayColorSelector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemView, 0);
  objc_storeStrong((id *)&self->_pickerColor, 0);
}

@end
