@implementation PUIStyleColorPickerVibrantColor

+ (double)luminanceForPosterColor:(id)a3 withAppliedVariation:(double)a4
{
  double v4;
  void *v5;
  double v6;
  double v7;
  double result;

  v4 = ((a4 + 1.0) * 0.5 + -1.0) * -0.25;
  objc_msgSend(a3, "hslValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "luminance");
  v7 = v6;

  result = fmax(v7 + v4, 0.0);
  if (result > 1.0)
    return 1.0;
  return result;
}

- (PUIStyleColorPickerVibrantColor)initWithColor:(id)a3 initialVariation:(double)a4
{
  id v7;
  PUIStyleColorPickerVibrantColor *v8;
  PUIStyleColorPickerVibrantColor *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUIStyleColorPickerVibrantColor;
  v8 = -[PUIStyleColorPickerVibrantColor init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_color, a3);
    v9->_initialVariation = a4;
  }

  return v9;
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
  return (PUIStyleColor *)-[PUIStyleColorPickerVibrantColor displayColorWithVariation:](self, "displayColorWithVariation:", -1.0);
}

- (PUIStyleColor)rightSliderColor
{
  return (PUIStyleColor *)-[PUIStyleColorPickerVibrantColor displayColorWithVariation:](self, "displayColorWithVariation:", 1.0);
}

- (PUIStyleColorPickerVibrantColor)colorWithVariation:(double)a3
{
  return (PUIStyleColorPickerVibrantColor *)-[PUIStyleColor copyWithAlpha:](self->_color, "copyWithAlpha:", (a3 + 1.0) * 0.5 + 0.0);
}

- (id)displayColorWithVariation:(double)a3
{
  objc_msgSend((id)objc_opt_class(), "luminanceForPosterColor:withAppliedVariation:", self->_color, a3);
  return -[PUIStyleColor copyWithLuminance:](self->_color, "copyWithLuminance:");
}

- (BOOL)isCustomColor
{
  return 0;
}

- (BOOL)isVibrantColor
{
  return 1;
}

- (double)variationForAlpha:(double)a3
{
  return a3 + a3 + -1.0;
}

- (BOOL)isEqual:(id)a3
{
  PUIStyleColorPickerVibrantColor *v4;
  void *v5;
  char isKindOfClass;
  PUIStyleColorPickerVibrantColor *v7;
  void *v8;
  void *v9;
  int v10;
  double v11;
  double v12;
  double v13;
  char v14;
  void *v16;
  void *v17;

  v4 = (PUIStyleColorPickerVibrantColor *)a3;
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
      -[PUIStyleColorPickerVibrantColor color](self, "color");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUIStyleColorPickerVibrantColor color](v7, "color");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = BSEqualObjects();

      if (v10
        && (-[PUIStyleColorPickerVibrantColor initialVariation](self, "initialVariation"),
            v12 = v11,
            -[PUIStyleColorPickerVibrantColor initialVariation](v7, "initialVariation"),
            v12 == v13))
      {
        -[PUIStyleColorPickerVibrantColor localizedName](self, "localizedName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUIStyleColorPickerVibrantColor localizedName](v7, "localizedName");
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
  -[PUIStyleColorPickerVibrantColor color](self, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  -[PUIStyleColorPickerVibrantColor initialVariation](self, "initialVariation");
  v6 = (id)objc_msgSend(v3, "appendCGFloat:");
  if (self->_localizedName)
  {
    -[PUIStyleColorPickerVibrantColor localizedName](self, "localizedName");
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
  PUIStyleColorPickerVibrantColor *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x24BE0BE10]);
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __46__PUIStyleColorPickerVibrantColor_description__block_invoke;
  v10 = &unk_25154BFC0;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

uint64_t __46__PUIStyleColorPickerVibrantColor_description__block_invoke(uint64_t a1)
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
  -[PUIStyleColorPickerVibrantColor color](self, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("color"));

  -[PUIStyleColorPickerVibrantColor initialVariation](self, "initialVariation");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("initialVariation"));

}

- (PUIStyleColorPickerVibrantColor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  PUIStyleColorPickerVibrantColor *v9;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("color"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("initialVariation"));
  v8 = v7;

  v9 = -[PUIStyleColorPickerVibrantColor initWithColor:initialVariation:](self, "initWithColor:initialVariation:", v6, v8);
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
  -[PUIStyleColorPickerVibrantColor color](self, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("color"));

  -[PUIStyleColorPickerVibrantColor initialVariation](self, "initialVariation");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("initialVariation"));

}

- (PUIStyleColorPickerVibrantColor)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  PUIStyleColorPickerVibrantColor *v9;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("color"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("initialVariation"));
  v8 = v7;

  v9 = -[PUIStyleColorPickerVibrantColor initWithColor:initialVariation:](self, "initWithColor:initialVariation:", v6, v8);
  return v9;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;

  v7 = a3;
  -[PUIStyleColorPickerVibrantColor color](self, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v7, "appendObject:withName:", v4, CFSTR("color"));

  -[PUIStyleColorPickerVibrantColor initialVariation](self, "initialVariation");
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
}

@end
