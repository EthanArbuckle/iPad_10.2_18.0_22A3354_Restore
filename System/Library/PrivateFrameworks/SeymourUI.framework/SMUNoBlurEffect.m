@implementation SMUNoBlurEffect

+ (id)effectWithStyle:(int64_t)a3
{
  return (id)objc_msgSend(a1, "_effectWithStyle:tintColor:invertAutomaticStyle:", a3, 0, 0);
}

- (id)effectSettings
{
  void *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SMUNoBlurEffect;
  -[UIBlurEffect effectSettings](&v4, sel_effectSettings);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBlurRadius:", 0.0);
  objc_msgSend(v2, "setUsesBackdropEffectView:", 0);
  return v2;
}

@end
