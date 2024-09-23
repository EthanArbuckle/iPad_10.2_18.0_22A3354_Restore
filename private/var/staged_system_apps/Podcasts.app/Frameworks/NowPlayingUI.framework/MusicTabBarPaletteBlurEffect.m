@implementation MusicTabBarPaletteBlurEffect

+ (id)effectWithStyle:(int64_t)a3
{
  id v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___MusicTabBarPaletteBlurEffect;
  v3 = objc_msgSendSuper2(&v5, "effectWithStyle:", a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (id)effectSettings
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MusicTabBarPaletteBlurEffect;
  v2 = -[MusicTabBarPaletteBlurEffect effectSettings](&v7, "effectSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  if (!UIAccessibilityIsReduceTransparencyEnabled())
    objc_msgSend(v3, "setGrayscaleTintAlpha:", 0.72);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0588235294, 0.0, 0.0, 1.0));
  objc_msgSend(v3, "setColorTint:", v4);

  objc_msgSend(v3, "setColorTintAlpha:", 0.03);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_UIBackdropViewSettings settingsForPrivateStyle:graphicsQuality:](_UIBackdropViewSettings, "settingsForPrivateStyle:graphicsQuality:", 2020, objc_msgSend(v3, "graphicsQuality")));
  objc_msgSend(v5, "blurRadius");
  objc_msgSend(v3, "setBlurRadius:");

  return v3;
}

@end
