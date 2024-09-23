@implementation _UIBackdropViewSettingsBlur

- (void)setDefaultValues
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIBackdropViewSettingsBlur;
  -[_UIBackdropViewSettings setDefaultValues](&v4, sel_setDefaultValues);
  -[_UIBackdropViewSettings setBackdropVisible:](self, "setBackdropVisible:", 1);
  -[_UIBackdropViewSettings setGrayscaleTintLevel:](self, "setGrayscaleTintLevel:", 0.0);
  -[_UIBackdropViewSettings setGrayscaleTintAlpha:](self, "setGrayscaleTintAlpha:", 0.0);
  -[_UIBackdropViewSettings setGrayscaleTintMaskAlpha:](self, "setGrayscaleTintMaskAlpha:", 1.0);
  -[_UIBackdropViewSettings setGrayscaleTintMaskImage:](self, "setGrayscaleTintMaskImage:", 0);
  -[_UIBackdropViewSettings setColorTint:](self, "setColorTint:", 0);
  -[_UIBackdropViewSettings setColorTintAlpha:](self, "setColorTintAlpha:", 0.0);
  -[_UIBackdropViewSettings setColorTintMaskAlpha:](self, "setColorTintMaskAlpha:", 1.0);
  -[_UIBackdropViewSettings setColorTintMaskImage:](self, "setColorTintMaskImage:", 0);
  -[_UIBackdropViewSettings setBlurRadius:](self, "setBlurRadius:", 30.0);
  -[_UIBackdropViewSettings setSaturationDeltaFactor:](self, "setSaturationDeltaFactor:", 1.25);
  -[_UIBackdropViewSettings setFilterMaskAlpha:](self, "setFilterMaskAlpha:", 1.0);
  -[_UIBackdropViewSettings setFilterMaskImage:](self, "setFilterMaskImage:", 0);
  +[UIColor whiteColor](UIColor, "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBackdropViewSettings setLegibleColor:](self, "setLegibleColor:", v3);

}

- (void)computeOutputSettingsUsingModel:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIBackdropViewSettingsBlur;
  v4 = a3;
  -[_UIBackdropViewSettings computeOutputSettingsUsingModel:](&v9, sel_computeOutputSettingsUsingModel_, v4);
  objc_msgSend(v4, "colorSettings", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _UIBackdropViewComputeLegibleColorWithColorSettings(v5);
  v7 = v6;

  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v7, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBackdropViewSettings setLegibleColor:](self, "setLegibleColor:", v8);

}

@end
