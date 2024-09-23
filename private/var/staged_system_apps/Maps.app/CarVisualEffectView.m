@implementation CarVisualEffectView

+ (BOOL)isDisablingBlur
{
  return GEOConfigGetBOOL(MapsConfig_CarPlayDisableBlur, off_1014B4D98);
}

+ (void)setDisableBlur:(BOOL)a3
{
  GEOConfigSetBOOL(MapsConfig_CarPlayDisableBlur, off_1014B4D98, a3);
}

- (CarVisualEffectView)initWithEffect:(id)a3
{
  CarVisualEffectView *v3;
  CarVisualEffectView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CarVisualEffectView;
  v3 = -[CarVisualEffectView initWithEffect:](&v6, "initWithEffect:", a3);
  v4 = v3;
  if (v3)
    -[CarVisualEffectView setAllowsBlurring:](v3, "setAllowsBlurring:", objc_msgSend((id)objc_opt_class(v3), "isDisablingBlur") ^ 1);
  return v4;
}

- (CarVisualEffectView)initWithCoder:(id)a3
{
  CarVisualEffectView *v3;
  CarVisualEffectView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CarVisualEffectView;
  v3 = -[CarVisualEffectView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[CarVisualEffectView setAllowsBlurring:](v3, "setAllowsBlurring:", objc_msgSend((id)objc_opt_class(v3), "isDisablingBlur") ^ 1);
  return v4;
}

@end
