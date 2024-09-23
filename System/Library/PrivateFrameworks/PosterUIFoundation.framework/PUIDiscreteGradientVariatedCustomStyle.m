@implementation PUIDiscreteGradientVariatedCustomStyle

+ (unint64_t)currentVersion
{
  return 1;
}

+ (id)discreteGradientVariatedColors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[8];

  v11[7] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.917647059, 0.258823529, 0.231372549, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.960784314, 0.882352941, 0.333333333, 1.0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.458823529, 0.984313725, 0.568627451, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v4;
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.435294118, 0.937254902, 0.968627451, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v5;
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0392156863, 0.549019608, 0.960784314, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v6;
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.756862745, 0.392156863, 0.945098039, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[5] = v7;
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 1.0, 0.298039216, 0.262745098, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[6] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (double)minLuminanceForStyle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v3 = a3;
  objc_msgSend(v3, "variationAppliedColors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "pui_minLuminance");
  v7 = v6;
  objc_msgSend(v3, "luminance");
  v9 = v8;

  if (v9 < v7)
  {
    objc_msgSend(&unk_25156B060, "bs_CGFloatValue");
    if (BSFloatGreaterThanOrEqualToFloat())
      v7 = v9;
  }

  return v7;
}

+ (double)maxLuminanceForStyle:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(a3, "variationAppliedColors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "pui_maxLuminance");
  v6 = v5;

  return v6;
}

- (PUIDiscreteGradientVariatedCustomStyle)initWithVariation:(double)a3
{
  return -[PUIDiscreteGradientVariatedCustomStyle initWithVariation:luminance:](self, "initWithVariation:luminance:", a3, 0.5);
}

- (PUIDiscreteGradientVariatedCustomStyle)initWithVariation:(double)a3 luminance:(double)a4
{
  return -[PUIDiscreteGradientVariatedCustomStyle initWithVariation:luminance:saturation:](self, "initWithVariation:luminance:saturation:", a3, a4, 1.0);
}

- (PUIDiscreteGradientVariatedCustomStyle)initWithVariation:(double)a3 luminance:(double)a4 saturation:(double)a5
{
  double v8;
  double v9;
  double v10;

  objc_msgSend((id)objc_opt_class(), "hueForLegacyVariation:", a3);
  v9 = v8;
  objc_msgSend((id)objc_opt_class(), "luminanceForLegacyLuminance:", a4);
  return -[PUIDiscreteGradientVariatedCustomStyle initWithHue:saturation:luminanceValue:](self, "initWithHue:saturation:luminanceValue:", v9, a5, v10);
}

- (PUIDiscreteGradientVariatedCustomStyle)initWithHue:(double)a3 saturation:(double)a4 luminanceValue:(double)a5
{
  objc_class *v9;
  void *v10;
  PUIDiscreteGradientVariatedCustomStyle *v11;
  uint64_t v12;
  NSArray *colors;
  double v14;
  double v15;
  objc_super v17;

  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)PUIDiscreteGradientVariatedCustomStyle;
  v11 = -[PUIStyleCustom initWithIdentifier:localizedName:](&v17, sel_initWithIdentifier_localizedName_, v10, CFSTR("Gradient Variated Custom Style Localized Name"));

  if (v11)
  {
    objc_msgSend((id)objc_opt_class(), "discreteGradientVariatedColors");
    v12 = objc_claimAutoreleasedReturnValue();
    colors = v11->_colors;
    v11->_colors = (NSArray *)v12;

    v11->_hue = a3;
    v11->_luminanceValue = a5;
    v11->_saturation = a4;
    objc_msgSend((id)objc_opt_class(), "variationForHue:", a3);
    v11->_variation = v14;
    objc_msgSend((id)objc_opt_class(), "legacyLuminanceForLuminanceValue:", v11->_luminanceValue);
    v11->_luminance = v15;
    v11->_version = objc_msgSend((id)objc_opt_class(), "currentVersion");
  }
  return v11;
}

- (PUIDiscreteGradientVariatedCustomStyle)init
{
  return -[PUIDiscreteGradientVariatedCustomStyle initWithVariation:](self, "initWithVariation:", 0.0);
}

- (BOOL)isEqual:(id)a3
{
  return -[PUIDiscreteGradientVariatedCustomStyle isEqual:ignoringVariation:](self, "isEqual:ignoringVariation:", a3, 0);
}

- (BOOL)isEqualToStyle:(id)a3
{
  return -[PUIDiscreteGradientVariatedCustomStyle isEqualToStyle:ignoringVariation:](self, "isEqualToStyle:ignoringVariation:", a3, 0);
}

- (BOOL)isEqual:(id)a3 ignoringVariation:(BOOL)a4
{
  _BOOL8 v4;
  PUIDiscreteGradientVariatedCustomStyle *v6;
  BOOL v7;

  v4 = a4;
  v6 = (PUIDiscreteGradientVariatedCustomStyle *)a3;
  if (v6 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    v7 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PUIDiscreteGradientVariatedCustomStyle isEqualToStyle:ignoringVariation:](self, "isEqualToStyle:ignoringVariation:", v6, v4);
  }

  return v7;
}

- (BOOL)isEqualToStyle:(id)a3 ignoringVariation:(BOOL)a4
{
  _BOOL4 v4;
  PUIDiscreteGradientVariatedCustomStyle *v6;
  PUIDiscreteGradientVariatedCustomStyle *v7;
  void *v8;
  void *v9;
  int v10;
  char v11;

  v4 = a4;
  v6 = (PUIDiscreteGradientVariatedCustomStyle *)a3;
  v7 = v6;
  if (v6 == self)
  {
    v11 = 1;
  }
  else
  {
    if (!v6)
      goto LABEL_8;
    if (!_PUIStyleCompareUsingIdentifiers(self, v6, v4))
      goto LABEL_8;
    -[PUIDiscreteGradientVariatedCustomStyle colors](self, "colors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIDiscreteGradientVariatedCustomStyle colors](v7, "colors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToArray:", v9);

    if (!v10)
      goto LABEL_8;
    -[PUIDiscreteGradientVariatedCustomStyle hue](self, "hue");
    -[PUIDiscreteGradientVariatedCustomStyle hue](v7, "hue");
    if (BSFloatEqualToFloat()
      && (-[PUIDiscreteGradientVariatedCustomStyle luminanceValue](self, "luminanceValue"),
          -[PUIDiscreteGradientVariatedCustomStyle luminanceValue](v7, "luminanceValue"),
          BSFloatEqualToFloat()))
    {
      -[PUIDiscreteGradientVariatedCustomStyle saturation](self, "saturation");
      -[PUIDiscreteGradientVariatedCustomStyle saturation](v7, "saturation");
      v11 = BSFloatEqualToFloat();
    }
    else
    {
LABEL_8:
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;

  v3 = objc_alloc_init(MEMORY[0x24BE0BE28]);
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_colors);
  v5 = (id)objc_msgSend(v3, "appendCGFloat:", self->_hue);
  v6 = (id)objc_msgSend(v3, "appendCGFloat:", self->_luminanceValue);
  v7 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_version);
  v8 = objc_msgSend(v3, "hash");

  return v8;
}

- (id)nonVariatedIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  NSStringFromPUIStyleType(-[PUIDiscreteGradientVariatedCustomStyle type](self, "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIDiscreteGradientVariatedCustomStyle colors](self, "colors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_map:", &__block_literal_global_268);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("_"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_hue);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_luminanceValue);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_saturation);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("-%@-hue-%@-lum%@-sat%@"), v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __63__PUIDiscreteGradientVariatedCustomStyle_nonVariatedIdentifier__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(a2, "hash"));
}

- (NSString)identifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)localizedName
{
  return 0;
}

- (unint64_t)type
{
  return 999;
}

- (NSArray)colors
{
  return self->_colors;
}

- (UIColor)luminanceAppliedColor
{
  PUIColorValues *v2;
  void *v3;

  v2 = -[PUIColorValues initWithHue:saturation:luminance:alpha:]([PUIColorValues alloc], "initWithHue:saturation:luminance:alpha:", self->_hue, self->_saturation, self->_luminanceValue, 1.0);
  -[PUIColorValues color](v2, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (NSArray)variationAppliedColors
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  -[PUIDiscreteGradientVariatedCustomStyle variatedColorResettingSaturation:](self, "variatedColorResettingSaturation:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)variatedColorResettingSaturation:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double variation;
  NSArray *colors;
  void *v9;
  void *v10;

  v3 = a3;
  v5 = (void *)objc_opt_class();
  v6 = v5;
  variation = self->_variation;
  colors = self->_colors;
  if (v3)
  {
    objc_msgSend(v5, "variatedColorForVariation:fromColors:usingSaturation:", self->_colors, 0, self->_variation);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_saturation);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "variatedColorForVariation:fromColors:usingSaturation:", colors, v10, variation);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

+ (id)variatedColorForVariation:(double)a3 fromColors:(id)a4 usingSaturation:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  PUIColorValues *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  id v22;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;

  v7 = a4;
  v8 = a5;
  v9 = objc_msgSend(v7, "count");
  v10 = (a3 + 1.0) * 0.5 + 0.0;
  v11 = vcvtmd_s64_f64(v10 / (float)(1.0 / (float)(unint64_t)(v9 - 1)));
  if (v9 - 1 <= (unint64_t)v11)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = 0.0;
    v29 = 0.0;
    v12 = (v10 - (double)v11 / (double)(unint64_t)(v9 - 1))
        / (((double)v11 + 1.0) / (double)(unint64_t)(v9 - 1) - (double)v11 / (double)(unint64_t)(v9 - 1))
        + 0.0;
    v27 = 0.0;
    objc_msgSend(v7, "objectAtIndexedSubscript:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "getRed:green:blue:alpha:", &v29, &v28, &v27, 0);
    v25 = 0.0;
    v26 = 0.0;
    v24 = 0.0;
    objc_msgSend(v7, "objectAtIndexedSubscript:", v11 + 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "getRed:green:blue:alpha:", &v26, &v25, &v24, 0);
    v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6950]), "initWithRed:green:blue:alpha:", v12 * v26 + (1.0 - v12) * v29, v12 * v25 + (1.0 - v12) * v28, v12 * v24 + (1.0 - v12) * v27, 1.0);
    v16 = v15;
    if (v8)
    {
      v17 = -[PUIColorValues initWithColor:]([PUIColorValues alloc], "initWithColor:", v15);
      -[PUIColorValues hslValues](v17, "hslValues");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "luminance");
      v20 = v19;
      objc_msgSend(v8, "bs_CGFloatValue");
      v22 = -[PUIColorValues copyWithLuminance:saturation:](v17, "copyWithLuminance:saturation:", v20, v21);

      objc_msgSend(v22, "color");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v16;
}

- (BOOL)allowsVariation
{
  return 1;
}

- (double)maxVariation
{
  return 1.0;
}

- (double)minVariation
{
  return -1.0;
}

- (double)variation
{
  return self->_variation;
}

- (id)copyWithVariation:(double)a3
{
  double v4;

  objc_msgSend((id)objc_opt_class(), "hueForLegacyVariation:", a3);
  return -[PUIDiscreteGradientVariatedCustomStyle initWithHue:saturation:luminanceValue:]([PUIDiscreteGradientVariatedCustomStyle alloc], "initWithHue:saturation:luminanceValue:", v4, self->_saturation, self->_luminanceValue);
}

- (id)copyWithLuminance:(double)a3
{
  return -[PUIDiscreteGradientVariatedCustomStyle copyWithLuminance:saturation:](self, "copyWithLuminance:saturation:", a3, self->_saturation);
}

- (id)copyWithLuminance:(double)a3 saturation:(double)a4
{
  return -[PUIDiscreteGradientVariatedCustomStyle initWithHue:saturation:luminanceValue:]([PUIDiscreteGradientVariatedCustomStyle alloc], "initWithHue:saturation:luminanceValue:", self->_hue, a4, a3);
}

- (id)copyWithResetSaturation
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  PUIDiscreteGradientVariatedCustomStyle *v7;

  -[PUIDiscreteGradientVariatedCustomStyle variatedColorResettingSaturation:](self, "variatedColorResettingSaturation:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pui_hslValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "saturation");
  v6 = v5;

  v7 = -[PUIDiscreteGradientVariatedCustomStyle initWithHue:saturation:luminanceValue:]([PUIDiscreteGradientVariatedCustomStyle alloc], "initWithHue:saturation:luminanceValue:", self->_hue, v6, self->_luminanceValue);
  return v7;
}

- (id)copyWithVariatedColor:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  PUIDiscreteGradientVariatedCustomStyle *v7;
  double v9;
  double v10;
  double v11;

  v10 = 0.0;
  v11 = 0.0;
  v9 = 0.0;
  v4 = (void *)MEMORY[0x24BDF6950];
  v5 = a3;
  -[PUIDiscreteGradientVariatedCustomStyle colors](self, "colors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pui_determineVarianceAndLuminanceForColor:amongstColors:minLuminance:maxLuminance:outHue:outSaturation:outLuminance:", v5, v6, 0, 0, &v11, &v9, &v10);

  v7 = [PUIDiscreteGradientVariatedCustomStyle alloc];
  return -[PUIDiscreteGradientVariatedCustomStyle initWithHue:saturation:luminanceValue:](v7, "initWithHue:saturation:luminanceValue:", v11, v9, v10);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PUIDiscreteGradientVariatedCustomStyle initWithHue:saturation:luminanceValue:](+[PUIDiscreteGradientVariatedCustomStyle allocWithZone:](PUIDiscreteGradientVariatedCustomStyle, "allocWithZone:", a3), "initWithHue:saturation:luminanceValue:", self->_hue, self->_saturation, self->_luminanceValue);
}

- (BOOL)isSupportedSystemStyle
{
  return 0;
}

- (BOOL)isSupportedBackgroundStyle
{
  return 0;
}

- (BOOL)desiresVibrancyEffectView
{
  return 0;
}

- (int64_t)vibrancyEffectType
{
  return 0;
}

- (UIColor)vibrancyEffectColor
{
  return 0;
}

- (id)lutIdentifier
{
  return 0;
}

+ (double)luminanceForLegacyLuminance:(double)a3
{
  return (a3 + -2.0) * -0.25 + 0.0;
}

+ (double)hueForLegacyVariation:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  objc_msgSend(a1, "discreteGradientVariatedColors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "variatedColorForVariation:fromColors:usingSaturation:", v5, 0, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "pui_hslValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hue");
  v9 = v8;

  return v9;
}

+ (double)variationForHue:(double)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  v4 = (void *)MEMORY[0x24BDF6950];
  objc_msgSend(a1, "discreteGradientVariatedColors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pui_determineVarianceForHue:forColors:", v5, a3);
  v7 = v6;

  return v7;
}

+ (double)legacyLuminanceForLuminanceValue:(double)a3
{
  return a3 * -4.0 + 2.0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUIDiscreteGradientVariatedCustomStyle)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  PUIDiscreteGradientVariatedCustomStyle *v23;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_version"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_hue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_luminanceValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_saturation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_CGFloatValue");
  v10 = v9;
  objc_msgSend(v8, "bs_CGFloatValue");
  v12 = v11;
  objc_msgSend(v6, "bs_CGFloatValue");
  if (v5)
  {
    v14 = v13;
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_variation"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bs_CGFloatValue");
    v17 = v16;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_luminance"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bs_CGFloatValue");
    v20 = v19;
    objc_msgSend((id)objc_opt_class(), "hueForLegacyVariation:", v17);
    v14 = v21;
    objc_msgSend((id)objc_opt_class(), "luminanceForLegacyLuminance:", v20);
    v10 = v22;

  }
  v23 = -[PUIDiscreteGradientVariatedCustomStyle initWithHue:saturation:luminanceValue:](self, "initWithHue:saturation:luminanceValue:", v14, v12, v10);

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t version;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (void *)MEMORY[0x24BDD16E0];
  version = self->_version;
  v6 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", version);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("_version"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_hue);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("_hue"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_luminanceValue);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("_luminanceValue"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_luminance);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v10, CFSTR("_luminance"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_saturation);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v11, CFSTR("_saturation"));

}

- (double)hue
{
  return self->_hue;
}

- (double)luminanceValue
{
  return self->_luminanceValue;
}

- (double)luminance
{
  return self->_luminance;
}

- (double)saturation
{
  return self->_saturation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colors, 0);
}

@end
