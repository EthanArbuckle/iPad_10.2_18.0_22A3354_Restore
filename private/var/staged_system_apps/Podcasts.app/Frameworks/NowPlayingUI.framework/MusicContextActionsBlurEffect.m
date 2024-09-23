@implementation MusicContextActionsBlurEffect

+ (int64_t)blurEffectStyleWithPrivateStyle:(int64_t)a3
{
  return a3;
}

+ (id)effectWithStyle:(int64_t)a3
{
  id v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___MusicContextActionsBlurEffect;
  v3 = objc_msgSendSuper2(&v5, "effectWithStyle:", a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (id)effectSettings
{
  id v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MusicContextActionsBlurEffect;
  v2 = -[MusicContextActionsBlurEffect effectSettings](&v8, "effectSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  objc_msgSend(v3, "setScale:", 0.5);
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    v4 = 0.0;
    objc_msgSend(v3, "setBlurRadius:", 0.0);
    v5 = 0.4;
  }
  else
  {
    objc_msgSend(v3, "setBlurRadius:", 8.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    objc_msgSend(v3, "setColorTint:", v6);

    objc_msgSend(v3, "setColorTintAlpha:", 0.2);
    v4 = 0.025;
    v5 = 0.1;
  }
  objc_msgSend(v3, "setGrayscaleTintLevel:", 0.0);
  objc_msgSend(v3, "setGrayscaleTintAlpha:", v5);
  objc_msgSend(v3, "setZoom:", v4);
  return v3;
}

@end
