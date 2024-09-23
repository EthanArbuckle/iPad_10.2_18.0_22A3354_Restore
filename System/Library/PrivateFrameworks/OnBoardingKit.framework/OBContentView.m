@implementation OBContentView

- (OBContentView)initWithFrame:(CGRect)a3 aboveHeaderLayout:(BOOL)a4
{
  _BOOL4 v4;
  OBContentView *v5;
  OBContentView *v6;
  void *v7;
  objc_super v9;
  objc_super v10;

  v4 = a4;
  v10.receiver = self;
  v10.super_class = (Class)OBContentView;
  v5 = -[OBContentView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_aboveHeaderLayout = v4;
    v5->_customizedBackgroundColor = 0;
    if (v4)
    {
      -[OBContentView _defaultColorForCurrentTraitCollection](v5, "_defaultColorForCurrentTraitCollection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9.receiver = v6;
      v9.super_class = (Class)OBContentView;
      -[OBContentView setBackgroundColor:](&v9, sel_setBackgroundColor_, v7);

    }
  }
  return v6;
}

- (OBContentView)initWithFrame:(CGRect)a3
{
  return -[OBContentView initWithFrame:aboveHeaderLayout:](self, "initWithFrame:aboveHeaderLayout:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[OBContentView setCustomizedBackgroundColor:](self, "setCustomizedBackgroundColor:", 1);
  v6.receiver = self;
  v6.super_class = (Class)OBContentView;
  -[OBContentView setBackgroundColor:](&v6, sel_setBackgroundColor_, v4);
  -[OBContentView bleedView](self, "bleedView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (void)setBleedView:(id)a3
{
  UIView **p_bleedView;
  id WeakRetained;
  id v6;

  p_bleedView = &self->_bleedView;
  objc_storeWeak((id *)&self->_bleedView, a3);
  -[OBContentView backgroundColor](self, "backgroundColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)p_bleedView);
  objc_msgSend(WeakRetained, "setBackgroundColor:", v6);

}

- (UIColor)darkColor
{
  UIColor *darkColor;
  UIColor *v4;
  UIColor *v5;

  darkColor = self->_darkColor;
  if (!darkColor)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_darkColor;
    self->_darkColor = v4;

    darkColor = self->_darkColor;
  }
  return darkColor;
}

- (UIColor)lightColor
{
  UIColor *lightColor;
  UIColor *v4;
  UIColor *v5;

  lightColor = self->_lightColor;
  if (!lightColor)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.843137255, 0.843137255, 0.843137255, 1.0);
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_lightColor;
    self->_lightColor = v4;

    lightColor = self->_lightColor;
  }
  return lightColor;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OBContentView;
  -[OBContentView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, a3);
  if (!-[OBContentView customizedBackgroundColor](self, "customizedBackgroundColor"))
  {
    if (-[OBContentView aboveHeaderLayout](self, "aboveHeaderLayout"))
    {
      -[OBContentView _defaultColorForCurrentTraitCollection](self, "_defaultColorForCurrentTraitCollection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v7.receiver = self;
      v7.super_class = (Class)OBContentView;
      -[OBContentView setBackgroundColor:](&v7, sel_setBackgroundColor_, v4);

      -[OBContentView _defaultColorForCurrentTraitCollection](self, "_defaultColorForCurrentTraitCollection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBContentView bleedView](self, "bleedView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setBackgroundColor:", v5);

    }
  }
}

- (id)_defaultColorForCurrentTraitCollection
{
  void *v3;
  uint64_t v4;

  -[OBContentView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (v4 == 2)
    -[OBContentView darkColor](self, "darkColor");
  else
    -[OBContentView lightColor](self, "lightColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_colorIsDefault:(id)a3
{
  id v4;
  CGColor *v5;
  id v6;
  id v7;
  CGColor *v8;
  id v9;

  v4 = objc_retainAutorelease(a3);
  v5 = (CGColor *)objc_msgSend(v4, "CGColor");
  -[OBContentView darkColor](self, "darkColor");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  LOBYTE(v5) = CGColorEqualToColor(v5, (CGColorRef)objc_msgSend(v6, "CGColor"));

  v7 = objc_retainAutorelease(v4);
  v8 = (CGColor *)objc_msgSend(v7, "CGColor");

  -[OBContentView lightColor](self, "lightColor");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  LOBYTE(v7) = CGColorEqualToColor(v8, (CGColorRef)objc_msgSend(v9, "CGColor"));

  return v5 | v7;
}

- (UIView)bleedView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_bleedView);
}

- (void)setLightColor:(id)a3
{
  objc_storeStrong((id *)&self->_lightColor, a3);
}

- (void)setDarkColor:(id)a3
{
  objc_storeStrong((id *)&self->_darkColor, a3);
}

- (BOOL)aboveHeaderLayout
{
  return self->_aboveHeaderLayout;
}

- (void)setAboveHeaderLayout:(BOOL)a3
{
  self->_aboveHeaderLayout = a3;
}

- (BOOL)customizedBackgroundColor
{
  return self->_customizedBackgroundColor;
}

- (void)setCustomizedBackgroundColor:(BOOL)a3
{
  self->_customizedBackgroundColor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkColor, 0);
  objc_storeStrong((id *)&self->_lightColor, 0);
  objc_destroyWeak((id *)&self->_bleedView);
}

@end
