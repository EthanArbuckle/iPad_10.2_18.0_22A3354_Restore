@implementation _UIPointerLiftEffectSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIPointerLiftEffectSettings;
  -[_UIPointerEffectSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[_UIPointerEffectSettings setSlipFactorX:](self, "setSlipFactorX:", 0.055);
  -[_UIPointerEffectSettings setSlipFactorY:](self, "setSlipFactorY:", 0.055);
  -[_UIPointerEffectSettings setScaleUpPoints:](self, "setScaleUpPoints:", 7.6);
  -[_UIPointerEffectSettings setParallaxAmount:](self, "setParallaxAmount:", 1.0);
  -[_UIPointerEffectSettings setDefaultPointerCornerRadius:](self, "setDefaultPointerCornerRadius:", 0.0);
}

+ (BOOL)pointerSlipMatchesContentSlip
{
  return 1;
}

@end
