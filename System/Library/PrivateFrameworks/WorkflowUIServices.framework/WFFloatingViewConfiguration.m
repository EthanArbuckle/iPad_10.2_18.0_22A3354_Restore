@implementation WFFloatingViewConfiguration

- (double)cornerRadius
{
  return self->_cornerRadius;
}

+ (id)materialWorkflowConfiguration
{
  void *v2;
  double v3;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setCornerRadius:", 19.0);
  LODWORD(v3) = 0;
  objc_msgSend(v2, "setShadowOpacity:", v3);
  objc_msgSend(v2, "setGradientDirection:", 4);
  return v2;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (void)setShadowOpacity:(float)a3
{
  self->_shadowOpacity = a3;
}

- (void)setGradientDirection:(int64_t)a3
{
  self->_gradientDirection = a3;
}

- (WFFloatingViewConfiguration)init
{
  WFFloatingViewConfiguration *v2;
  WFFloatingViewConfiguration *v3;
  WFFloatingViewConfiguration *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFFloatingViewConfiguration;
  v2 = -[WFFloatingViewConfiguration init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_scalingFactor = 0.970000029;
    v4 = v2;
  }

  return v3;
}

+ (id)widgetWorkflowConfiguration
{
  void *v2;
  double v3;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setCornerRadius:", 9.0);
  LODWORD(v3) = 0;
  objc_msgSend(v2, "setShadowOpacity:", v3);
  objc_msgSend(v2, "setGradientDirection:", 4);
  return v2;
}

+ (id)bannerImageConfiguration
{
  void *v2;
  double v3;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setCornerRadius:", 13.0);
  LODWORD(v3) = 0;
  objc_msgSend(v2, "setShadowOpacity:", v3);
  return v2;
}

+ (id)paletteColorConfiguration
{
  void *v2;
  double v3;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setUsePillCornerRadius:", 1);
  objc_msgSend(v2, "setColorizesShadow:", 1);
  objc_msgSend(v2, "setShadowOffset:", 0.0, 2.0);
  LODWORD(v3) = 1036831949;
  objc_msgSend(v2, "setShadowOpacity:", v3);
  objc_msgSend(v2, "setShadowRadius:", 5.0);
  objc_msgSend(v2, "setGradientDirection:", 4);
  return v2;
}

- (int64_t)gradientDirection
{
  return self->_gradientDirection;
}

- (BOOL)usePillCornerRadius
{
  return self->_usePillCornerRadius;
}

- (void)setUsePillCornerRadius:(BOOL)a3
{
  self->_usePillCornerRadius = a3;
}

- (BOOL)appliesCornerRadiusDuringTouchDownOnly
{
  return self->_appliesCornerRadiusDuringTouchDownOnly;
}

- (void)setAppliesCornerRadiusDuringTouchDownOnly:(BOOL)a3
{
  self->_appliesCornerRadiusDuringTouchDownOnly = a3;
}

- (float)shadowOpacity
{
  return self->_shadowOpacity;
}

- (CGSize)shadowOffset
{
  double width;
  double height;
  CGSize result;

  width = self->_shadowOffset.width;
  height = self->_shadowOffset.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setShadowOffset:(CGSize)a3
{
  self->_shadowOffset = a3;
}

- (double)shadowRadius
{
  return self->_shadowRadius;
}

- (void)setShadowRadius:(double)a3
{
  self->_shadowRadius = a3;
}

- (BOOL)colorizesShadow
{
  return self->_colorizesShadow;
}

- (void)setColorizesShadow:(BOOL)a3
{
  self->_colorizesShadow = a3;
}

- (double)scalingFactor
{
  return self->_scalingFactor;
}

- (void)setScalingFactor:(double)a3
{
  self->_scalingFactor = a3;
}

@end
