@implementation _UIBackdropViewSettingsReplicator

- (void)setDefaultValues
{
  UIImage *filterMaskImage;
  void *v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UIBackdropViewSettingsReplicator;
  -[_UIBackdropViewSettings setDefaultValues](&v12, sel_setDefaultValues);
  -[_UIBackdropViewSettings setBackdropVisible:](self, "setBackdropVisible:", 1);
  -[_UIBackdropViewSettings setGrayscaleTintLevel:](self, "setGrayscaleTintLevel:", 0.0);
  -[_UIBackdropViewSettings setGrayscaleTintAlpha:](self, "setGrayscaleTintAlpha:", 0.0);
  -[_UIBackdropViewSettings setGrayscaleTintMaskAlpha:](self, "setGrayscaleTintMaskAlpha:", 1.0);
  -[_UIBackdropViewSettings setGrayscaleTintMaskImage:](self, "setGrayscaleTintMaskImage:", 0);
  -[_UIBackdropViewSettings setColorTint:](self, "setColorTint:", 0);
  -[_UIBackdropViewSettings setColorTintAlpha:](self, "setColorTintAlpha:", 0.0);
  -[_UIBackdropViewSettings setColorTintMaskAlpha:](self, "setColorTintMaskAlpha:", 1.0);
  -[_UIBackdropViewSettings setColorTintMaskImage:](self, "setColorTintMaskImage:", 0);
  self->super._blurRadius = 0.0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&self->super._saturationDeltaFactor = _Q0;
  filterMaskImage = self->super._filterMaskImage;
  self->super._filterMaskImage = 0;

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  self->super._scale = v10;

  self->super._requiresColorStatistics = 0;
  +[UIColor whiteColor](UIColor, "whiteColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBackdropViewSettings setLegibleColor:](self, "setLegibleColor:", v11);

}

- (BOOL)requiresBackdropLayer
{
  return 1;
}

- (BOOL)isBackdropVisible
{
  return 1;
}

@end
