@implementation PUIStyleColorPickerConstantColor

+ (double)luminanceForPosterColor:(id)a3 withAppliedVariation:(double)a4
{
  double v4;
  void *v5;
  double v6;
  double v7;
  double result;

  v4 = a4 * -0.25;
  objc_msgSend(a3, "hslValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "luminance");
  v7 = v6;

  result = fmax(v7 + v4, 0.0);
  if (result > 1.0)
    return 1.0;
  return result;
}

- (PUIStyleColorPickerConstantColor)init
{
  void *v3;
  PUIStyleColorPickerConstantColor *v4;

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PUIStyleColorPickerConstantColor initWithBaseUIColor:](self, "initWithBaseUIColor:", v3);

  return v4;
}

- (PUIStyleColorPickerConstantColor)initWithBaseUIColor:(id)a3
{
  return -[PUIStyleColorPickerConstantColor initWithBaseUIColor:initialVariation:](self, "initWithBaseUIColor:initialVariation:", a3, 0.0);
}

- (PUIStyleColorPickerConstantColor)initWithBaseUIColor:(id)a3 initialVariation:(double)a4
{
  id v6;
  PUIStyleColor *v7;
  PUIStyleColorPickerConstantColor *v8;

  v6 = a3;
  v7 = -[PUIStyleColor initWithColor:preferredStyle:]([PUIStyleColor alloc], "initWithColor:preferredStyle:", v6, 0);

  v8 = -[PUIStyleColorPickerConstantColor initWithColor:initialVariation:](self, "initWithColor:initialVariation:", v7, a4);
  return v8;
}

- (PUIStyleColorPickerConstantColor)initWithColor:(id)a3 initialVariation:(double)a4
{
  id v6;
  PUIStyleColorPickerConstantColor *v7;
  uint64_t v8;
  PUIStyleColor *color;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUIStyleColorPickerConstantColor;
  v7 = -[PUIStyleColorPickerConstantColor init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    color = v7->_color;
    v7->_color = (PUIStyleColor *)v8;

    v7->_initialVariation = a4;
  }

  return v7;
}

- (NSString)localizedName
{
  return -[PUIStyleColor localizedName](self->_color, "localizedName");
}

- (PUIStyleColor)baseColor
{
  return self->_color;
}

- (PUIStyleColor)leftSliderColor
{
  return (PUIStyleColor *)-[PUIStyleColorPickerConstantColor colorWithVariation:](self, "colorWithVariation:", -1.0);
}

- (PUIStyleColor)rightSliderColor
{
  return (PUIStyleColor *)-[PUIStyleColorPickerConstantColor colorWithVariation:](self, "colorWithVariation:", 1.0);
}

- (PUIStyleColorPickerConstantColor)colorWithVariation:(double)a3
{
  objc_msgSend((id)objc_opt_class(), "luminanceForPosterColor:withAppliedVariation:", self->_color, a3);
  return (PUIStyleColorPickerConstantColor *)-[PUIStyleColor copyWithLuminance:](self->_color, "copyWithLuminance:");
}

- (BOOL)isCustomColor
{
  return 0;
}

- (BOOL)isVibrantColor
{
  return 0;
}

- (double)variationForLuminance:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double result;
  double v19;

  -[PUIStyleColorPickerConstantColor baseColor](self, "baseColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hslValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "luminance");
  v8 = v7;

  -[PUIStyleColorPickerConstantColor leftSliderColor](self, "leftSliderColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hslValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "luminance");
  v12 = v11;

  if (v12 <= 1.0)
    v13 = v12;
  else
    v13 = 1.0;
  -[PUIStyleColorPickerConstantColor rightSliderColor](self, "rightSliderColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hslValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "luminance");
  v17 = v16;

  result = 0.0;
  v19 = fmax(v17, 0.0);
  if (v19 <= a3 && v8 >= a3)
    return (a3 - v19) / (v8 - v19) + -1.0;
  if (v13 >= a3 && v8 <= a3)
    return 1.0 - (a3 - v8) / (v13 - v8);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  PUIStyleColorPickerConstantColor *v4;
  void *v5;
  char isKindOfClass;
  PUIStyleColorPickerConstantColor *v7;
  void *v8;
  void *v9;
  int v10;
  double v11;
  double v12;
  double v13;
  char v14;
  void *v16;
  void *v17;

  v4 = (PUIStyleColorPickerConstantColor *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      -[PUIStyleColorPickerConstantColor baseColor](self, "baseColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUIStyleColorPickerConstantColor baseColor](v7, "baseColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = BSEqualObjects();

      if (v10
        && (-[PUIStyleColorPickerConstantColor initialVariation](self, "initialVariation"),
            v12 = v11,
            -[PUIStyleColorPickerConstantColor initialVariation](v7, "initialVariation"),
            v12 == v13))
      {
        -[PUIStyleColorPickerConstantColor localizedName](self, "localizedName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUIStyleColorPickerConstantColor localizedName](v7, "localizedName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = BSEqualStrings();

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  unint64_t v9;

  v3 = objc_alloc_init(MEMORY[0x24BE0BE28]);
  -[PUIStyleColorPickerConstantColor color](self, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  -[PUIStyleColorPickerConstantColor initialVariation](self, "initialVariation");
  v6 = (id)objc_msgSend(v3, "appendCGFloat:");
  if (self->_localizedName)
  {
    -[PUIStyleColorPickerConstantColor localizedName](self, "localizedName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v3, "appendObject:", v7);

  }
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
  PUIStyleColorPickerConstantColor *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x24BE0BE10]);
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __47__PUIStyleColorPickerConstantColor_description__block_invoke;
  v10 = &unk_25154BFC0;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

uint64_t __47__PUIStyleColorPickerConstantColor_description__block_invoke(uint64_t a1)
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
  id v5;

  v5 = a3;
  -[PUIStyleColorPickerConstantColor color](self, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("color"));

  -[PUIStyleColorPickerConstantColor initialVariation](self, "initialVariation");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("initialVariation"));

}

- (PUIStyleColorPickerConstantColor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  PUIStyleColorPickerConstantColor *v9;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("color"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("initialVariation"));
  v8 = v7;

  v9 = -[PUIStyleColorPickerConstantColor initWithColor:initialVariation:](self, "initWithColor:initialVariation:", v6, v8);
  return v9;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PUIStyleColorPickerConstantColor color](self, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("color"));

  -[PUIStyleColorPickerConstantColor initialVariation](self, "initialVariation");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("initialVariation"));

}

- (PUIStyleColorPickerConstantColor)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  PUIStyleColorPickerConstantColor *v9;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("color"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("initialVariation"));
  v8 = v7;

  v9 = -[PUIStyleColorPickerConstantColor initWithColor:initialVariation:](self, "initWithColor:initialVariation:", v6, v8);
  return v9;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;

  v7 = a3;
  -[PUIStyleColorPickerConstantColor color](self, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v7, "appendObject:withName:", v4, CFSTR("color"));

  -[PUIStyleColorPickerConstantColor initialVariation](self, "initialVariation");
  v6 = (id)objc_msgSend(v7, "appendDouble:withName:decimalPrecision:", CFSTR("initialVariation"), 5);

}

- (double)initialVariation
{
  return self->_initialVariation;
}

- (PUIStyleColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_baseColor, 0);
}

@end
