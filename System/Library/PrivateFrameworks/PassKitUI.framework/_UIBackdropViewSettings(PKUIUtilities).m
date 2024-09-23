@implementation _UIBackdropViewSettings(PKUIUtilities)

+ (void)pkui_createTransparentSettingsFromSettings:()PKUIUtilities
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  void *v18;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v5 = 0;
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0DC4030], "settingsForPrivateStyle:graphicsQuality:", -2, objc_msgSend(v3, "graphicsQuality"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "grayscaleTintAlpha");
  if (v6 > 0.0)
  {
    objc_msgSend(v4, "grayscaleTintLevel");
    objc_msgSend(v5, "setGrayscaleTintLevel:");
    objc_msgSend(v5, "setGrayscaleTintAlpha:", 0.0);
    objc_msgSend(v4, "grayscaleTintMaskAlpha");
    v8 = v7;
    if (v7 <= 0.0)
      goto LABEL_8;
    goto LABEL_7;
  }
  objc_msgSend(v4, "grayscaleTintMaskAlpha");
  v8 = v9;
  if (v9 > 0.0)
  {
LABEL_7:
    objc_msgSend(v4, "grayscaleTintMaskImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setGrayscaleTintMaskImage:", v10);

    objc_msgSend(v5, "setGrayscaleTintMaskAlpha:", v8);
LABEL_8:
    objc_msgSend(v5, "setLightenGrayscaleWithSourceOver:", objc_msgSend(v4, "lightenGrayscaleWithSourceOver"));
  }
  objc_msgSend(v4, "colorTint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColorTint:", v11);
  if (v11)
    objc_msgSend(v5, "setColorTintAlpha:", 0.0);
  objc_msgSend(v4, "colorBurnTintAlpha");
  if (v12 > 0.0)
  {
    objc_msgSend(v4, "colorBurnTintLevel");
    objc_msgSend(v5, "setColorBurnTintLevel:");
    objc_msgSend(v5, "setColorBurnTintAlpha:", 0.0);
  }
  objc_msgSend(v4, "darkeningTintAlpha");
  if (v13 > 0.0)
  {
    objc_msgSend(v5, "setDarkenWithSourceOver:", objc_msgSend(v4, "darkenWithSourceOver"));
    objc_msgSend(v4, "darkeningTintHue");
    objc_msgSend(v5, "setDarkeningTintHue:");
    objc_msgSend(v4, "darkeningTintSaturation");
    objc_msgSend(v5, "setDarkeningTintSaturation:");
    objc_msgSend(v4, "darkeningTintBrightness");
    objc_msgSend(v5, "setDarkeningTintBrightness:");
    objc_msgSend(v5, "setDarkeningTintAlpha:", 0.0);
  }
  objc_msgSend(v4, "filterMaskAlpha");
  if (v14 > 0.0)
  {
    v15 = v14;
    objc_msgSend(v4, "filterMaskImage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFilterMaskImage:", v16);

    objc_msgSend(v5, "setFilterMaskAlpha:", v15);
  }
  objc_msgSend(v4, "saturationDeltaFactor");
  if (v17 < 1.0)
    objc_msgSend(v5, "setSaturationDeltaFactor:", 1.0);
  objc_msgSend(v4, "legibleColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLegibleColor:", v18);

LABEL_20:
  return v5;
}

@end
