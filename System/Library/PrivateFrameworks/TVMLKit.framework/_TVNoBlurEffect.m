@implementation _TVNoBlurEffect

- (id)effectSettings
{
  void *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVNoBlurEffect;
  -[UIBlurEffect effectSettings](&v4, sel_effectSettings);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBlurRadius:", 0.0);
  objc_msgSend(v2, "setUsesBackdropEffectView:", 0);
  return v2;
}

@end
