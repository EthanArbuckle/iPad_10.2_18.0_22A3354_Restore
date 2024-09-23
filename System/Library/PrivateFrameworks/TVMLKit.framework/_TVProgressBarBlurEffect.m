@implementation _TVProgressBarBlurEffect

- (id)effectSettings
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TVProgressBarBlurEffect;
  -[UIBlurEffect effectSettings](&v5, sel_effectSettings);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setColorTint:", v3);

  objc_msgSend(v2, "setColorTintAlpha:", 0.25);
  objc_msgSend(v2, "setSaturationDeltaFactor:", 1.6);
  objc_msgSend(v2, "setBlurRadius:", 30.0);
  return v2;
}

@end
