@implementation PRPosterColorValues

- (PRPosterColorValues)initWithColor:(id)a3
{
  id v4;
  void *v5;
  PRPosterColorHSBValues *v6;
  void *v7;
  PRPosterColorValues *v8;
  double v10;

  v4 = a3;
  v5 = v4;
  v10 = 1.0;
  if (v4)
    objc_msgSend(v4, "getWhite:alpha:", 0, &v10);
  v6 = -[PRPosterColorHSBValues initWithColor:]([PRPosterColorHSBValues alloc], "initWithColor:", v5);
  -[PRPosterColorHSBValues hslValues](v6, "hslValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PRPosterColorValues initWithColor:hsbValues:hslValues:alpha:](self, "initWithColor:hsbValues:hslValues:alpha:", v5, v6, v7, v10);

  return v8;
}

- (PRPosterColorValues)initWithHue:(double)a3 saturation:(double)a4 luminance:(double)a5 alpha:(double)a6
{
  PRPosterColorHSLValues *v8;
  void *v9;
  void *v10;
  PRPosterColorValues *v11;

  v8 = -[PRPosterColorHSLValues initWithHue:saturation:luminance:]([PRPosterColorHSLValues alloc], "initWithHue:saturation:luminance:", a3, a4, a5);
  -[PRPosterColorHSLValues hsbValues](v8, "hsbValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "colorWithAlpha:", a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PRPosterColorValues initWithColor:hsbValues:hslValues:alpha:](self, "initWithColor:hsbValues:hslValues:alpha:", v10, v9, v8, a6);

  return v11;
}

- (PRPosterColorValues)initWithColor:(id)a3 hsbValues:(id)a4 hslValues:(id)a5 alpha:(double)a6
{
  id v10;
  id v11;
  id v12;
  PRPosterColorValues *v13;
  uint64_t v14;
  UIColor *color;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PRPosterColorValues;
  v13 = -[PRPosterColorValues init](&v17, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    color = v13->_color;
    v13->_color = (UIColor *)v14;

    objc_storeStrong((id *)&v13->_hsbValues, a4);
    objc_storeStrong((id *)&v13->_hslValues, a5);
    v13->_alpha = a6;
  }

  return v13;
}

- (NSString)identifier
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  -[PRPosterColorValues hslValues](self, "hslValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterColorValues alpha](self, "alpha");
  v5 = v4;
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "hue");
  v8 = v7;
  objc_msgSend(v3, "saturation");
  v10 = v9;
  objc_msgSend(v3, "luminance");
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%.5f:%.5f:%.5f:%.2f"), v8, v10, v11, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (BOOL)isEqual:(id)a3
{
  PRPosterColorValues *v4;
  void *v5;
  char isKindOfClass;
  PRPosterColorValues *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (PRPosterColorValues *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      -[PRPosterColorValues identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterColorValues identifier](v7, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = BSEqualObjects();
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PRPosterColorValues identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)copyWithLuminance:(double)a3
{
  void *v5;
  PRPosterColorValues *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  PRPosterColorValues *v12;

  -[PRPosterColorValues hslValues](self, "hslValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [PRPosterColorValues alloc];
  objc_msgSend(v5, "hue");
  v8 = v7;
  objc_msgSend(v5, "saturation");
  v10 = v9;
  -[PRPosterColorValues alpha](self, "alpha");
  v12 = -[PRPosterColorValues initWithHue:saturation:luminance:alpha:](v6, "initWithHue:saturation:luminance:alpha:", v8, v10, a3, v11);

  return v12;
}

- (id)copyWithAlpha:(double)a3
{
  void *v4;
  PRPosterColorValues *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  PRPosterColorValues *v11;

  -[PRPosterColorValues hslValues](self, "hslValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [PRPosterColorValues alloc];
  objc_msgSend(v4, "hue");
  v7 = v6;
  objc_msgSend(v4, "saturation");
  v9 = v8;
  objc_msgSend(v4, "luminance");
  v11 = -[PRPosterColorValues initWithHue:saturation:luminance:alpha:](v5, "initWithHue:saturation:luminance:alpha:", v7, v9, v10, a3);

  return v11;
}

- (PRPosterColorHSBValues)hsbValues
{
  return self->_hsbValues;
}

- (void)setHsbValues:(id)a3
{
  objc_storeStrong((id *)&self->_hsbValues, a3);
}

- (PRPosterColorHSLValues)hslValues
{
  return self->_hslValues;
}

- (void)setHslValues:(id)a3
{
  objc_storeStrong((id *)&self->_hslValues, a3);
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (double)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_hslValues, 0);
  objc_storeStrong((id *)&self->_hsbValues, 0);
}

@end
