@implementation _UILegacyEffectConverterIOS

- (id)backdropSettingsForBlurStyle:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = -2;
  v4 = 3901;
  v5 = 3902;
  if (a3 != 502)
    v5 = -2;
  if (a3 != 501)
    v4 = v5;
  v6 = 2050;
  v7 = 2080;
  if (a3 != 100)
    v7 = -2;
  if (a3 != 99)
    v6 = v7;
  if (a3 <= 500)
    v4 = v6;
  if (a3 == 1)
    v3 = 2020;
  if (!a3)
    v3 = 2010;
  if ((unint64_t)(a3 - 2) < 2)
    v3 = 2030;
  if (a3 <= 98)
    v8 = v3;
  else
    v8 = v4;
  return +[_UIBackdropViewSettings settingsForPrivateStyle:](_UIBackdropViewSettings, "settingsForPrivateStyle:", v8);
}

- (id)vibrancyConfigForHighQualityVibrancyStyle:(int64_t)a3
{
  void *v3;
  void *v4;
  id *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;

  if (!a3)
  {
    +[UIColor _vibrantLightDividerBurnColor](UIColor, "_vibrantLightDividerBurnColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor _vibrantLightDividerDarkeningColor](UIColor, "_vibrantLightDividerDarkeningColor");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v4 = (void *)v6;
    v5 = (id *)MEMORY[0x1E0CD2F20];
    goto LABEL_8;
  }
  if (a3 == 1)
  {
    +[UIColor _vibrantLightFillBurnColor](UIColor, "_vibrantLightFillBurnColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor _vibrantLightFillDarkeningColor](UIColor, "_vibrantLightFillDarkeningColor");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (a3 != 2)
  {
    v3 = 0;
    v7 = 0;
    v4 = 0;
    goto LABEL_11;
  }
  +[UIColor _vibrantDarkFillDodgeColor](UIColor, "_vibrantDarkFillDodgeColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id *)MEMORY[0x1E0CD2F18];
LABEL_8:
  v7 = *v5;
  if (!v7)
  {
LABEL_11:
    v8 = 0;
    goto LABEL_12;
  }
  +[_UIVisualEffectVibrantLayerConfig layerWithVibrantColor:tintColor:filterType:filterAttributes:](_UIVisualEffectVibrantLayerConfig, "layerWithVibrantColor:tintColor:filterType:filterAttributes:", v3, v4, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
  +[_UIVisualEffectConfig configWithContentConfig:](_UIVisualEffectConfig, "configWithContentConfig:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)vibrancyConfigForLowQualityVibrancyStyle:(int64_t)a3
{
  uint64_t v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;

  if (!a3)
  {
    v4 = 0.45;
LABEL_7:
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0352941176, 0.0784313725, 0.121568627, v4);
    v3 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (a3 == 1)
  {
    v4 = 0.6;
    goto LABEL_7;
  }
  if (a3 != 2)
  {
    v5 = 0;
    goto LABEL_10;
  }
  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.65);
  v3 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v5 = (void *)v3;
LABEL_10:
  +[_UIVisualEffectTintLayerConfig layerWithTintColor:](_UIVisualEffectTintLayerConfig, "layerWithTintColor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIVisualEffectConfig configWithContentConfig:](_UIVisualEffectConfig, "configWithContentConfig:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
