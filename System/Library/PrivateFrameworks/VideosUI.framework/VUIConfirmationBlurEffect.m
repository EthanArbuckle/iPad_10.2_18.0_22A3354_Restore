@implementation VUIConfirmationBlurEffect

+ (id)effectWithStyle:(int64_t)a3
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___VUIConfirmationBlurEffect;
  objc_msgSendSuper2(&v4, sel_effectWithStyle_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)effectSettings
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VUIConfirmationBlurEffect;
  -[UIBlurEffect effectSettings](&v7, sel_effectSettings);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setScale:", 0.5);
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    v3 = 0.0;
    objc_msgSend(v2, "setBlurRadius:", 0.0);
    v4 = 0.4;
  }
  else
  {
    objc_msgSend(v2, "setBlurRadius:", 8.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setColorTint:", v5);

    objc_msgSend(v2, "setColorTintAlpha:", 0.2);
    v3 = 0.025;
    v4 = 0.1;
  }
  objc_msgSend(v2, "setGrayscaleTintLevel:", 0.0);
  objc_msgSend(v2, "setGrayscaleTintAlpha:", v4);
  objc_msgSend(v2, "setZoom:", v3);
  return v2;
}

@end
