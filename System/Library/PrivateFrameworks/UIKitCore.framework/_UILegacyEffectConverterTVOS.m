@implementation _UILegacyEffectConverterTVOS

- (id)backdropSettingsForBlurStyle:(int64_t)a3
{
  int64_t v3;
  int64_t v4;
  BOOL v5;

  v3 = -2;
  if (a3 <= 500)
  {
    switch(a3)
    {
      case 0:
LABEL_5:
        a3 = 4003;
        break;
      case 1:
LABEL_15:
        a3 = 4001;
        break;
      case 2:
LABEL_16:
        a3 = 4006;
        break;
      case 3:
LABEL_17:
        a3 = 4008;
        break;
      default:
        v4 = 2050;
        if (a3 == 100)
          v3 = 2080;
        v5 = a3 == 99;
LABEL_12:
        if (v5)
          a3 = v4;
        else
          a3 = v3;
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 4000:
      case 4012:
        a3 = 4000;
        break;
      case 4001:
        goto LABEL_15;
      case 4002:
      case 4004:
      case 4007:
      case 4009:
      case 4010:
      case 4011:
        return +[_UIBackdropViewSettings settingsForPrivateStyle:](_UIBackdropViewSettings, "settingsForPrivateStyle:", a3);
      case 4003:
        goto LABEL_5;
      case 4005:
      case 4013:
      case 4016:
        a3 = 4005;
        break;
      case 4006:
        goto LABEL_16;
      case 4008:
        goto LABEL_17;
      case 4014:
        a3 = 4012;
        break;
      case 4015:
        a3 = 4013;
        break;
      case 4017:
        a3 = 4014;
        break;
      case 4018:
        a3 = 4015;
        break;
      default:
        v4 = 3901;
        if (a3 == 502)
          v3 = 3902;
        v5 = a3 == 501;
        goto LABEL_12;
    }
  }
  return +[_UIBackdropViewSettings settingsForPrivateStyle:](_UIBackdropViewSettings, "settingsForPrivateStyle:", a3);
}

- (id)vibrancyConfigForHighQualityVibrancyStyle:(int64_t)a3
{
  id v3;
  void *v4;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  v3 = 0;
  switch(a3)
  {
    case 4000:
    case 4001:
    case 4002:
    case 4003:
    case 4004:
    case 4014:
      goto LABEL_7;
    case 4005:
    case 4006:
    case 4007:
    case 4008:
    case 4009:
    case 4010:
    case 4011:
    case 4015:
      goto LABEL_2;
    case 4012:
      +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.156862745, 0.3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIVisualEffectLayerConfig layerWithFillColor:opacity:filterType:](_UIVisualEffectLayerConfig, "layerWithFillColor:opacity:filterType:", v7, *MEMORY[0x1E0CD2EA0], 1.0);
      v3 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    case 4013:
      +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.156862745, 0.3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIVisualEffectLayerConfig layerWithFillColor:opacity:filterType:](_UIVisualEffectLayerConfig, "layerWithFillColor:opacity:filterType:", v12, *MEMORY[0x1E0CD2EA0], 1.0);
      v3 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_2;
    case 4016:
      -[_UILegacyEffectConverterTVOS vibrancyConfigForLowQualityVibrancyStyle:](self, "vibrancyConfigForLowQualityVibrancyStyle:", 4016);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      return v10;
    default:
      if ((unint64_t)a3 < 2)
      {
LABEL_7:
        +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.666666667, 0.666666667, 0.666666667, 1.0);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = (id *)MEMORY[0x1E0CD2E98];
      }
      else
      {
        v6 = 0;
        v4 = 0;
        if ((unint64_t)(a3 - 2) >= 2)
          goto LABEL_9;
LABEL_2:
        +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.274509804, 0.274509804, 0.274509804, 1.0);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = (id *)MEMORY[0x1E0CD2EA0];
      }
      v6 = v3;
      v3 = *v5;
LABEL_9:
      +[_UIVisualEffectTintLayerConfig layerWithTintColor:filterType:](_UIVisualEffectTintLayerConfig, "layerWithTintColor:filterType:", v4, v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIVisualEffectConfig configWithContentConfig:](_UIVisualEffectConfig, "configWithContentConfig:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v6)
        objc_msgSend(v9, "addLayerConfig:", v6);

      return v10;
  }
}

- (id)vibrancyConfigForLowQualityVibrancyStyle:(int64_t)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = 0;
  if (a3 > 3999)
  {
    switch(a3)
    {
      case 4000:
      case 4001:
      case 4002:
      case 4004:
      case 4014:
        goto LABEL_3;
      case 4003:
        goto LABEL_8;
      case 4005:
      case 4006:
      case 4007:
      case 4008:
      case 4009:
      case 4010:
      case 4011:
      case 4015:
        goto LABEL_11;
      case 4012:
        +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.2);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_3;
      case 4013:
        +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.2);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      case 4016:
        +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.2);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIColor whiteColor](UIColor, "whiteColor");
        v4 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      default:
        v5 = 0;
        break;
    }
    goto LABEL_13;
  }
  if ((unint64_t)(a3 - 2) < 2)
  {
LABEL_11:
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.65);
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (!a3)
  {
LABEL_8:
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0352941176, 0.0784313725, 0.121568627, 0.45);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 0;
    goto LABEL_13;
  }
  v5 = 0;
  if (a3 == 1)
  {
LABEL_3:
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0352941176, 0.0784313725, 0.121568627, 0.6);
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v5 = (void *)v4;
  }
LABEL_13:
  +[_UIVisualEffectTintLayerConfig layerWithTintColor:](_UIVisualEffectTintLayerConfig, "layerWithTintColor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIVisualEffectConfig configWithContentConfig:](_UIVisualEffectConfig, "configWithContentConfig:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[_UIVisualEffectLayerConfig layerWithFillColor:opacity:filterType:](_UIVisualEffectLayerConfig, "layerWithFillColor:opacity:filterType:", v3, 0, 1.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addLayerConfig:", v8);

  }
  return v7;
}

- (id)vibrancyConfigForReducedTransperancyVibrancyStyle:(int64_t)a3
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = 0;
  v4 = 0;
  switch(a3)
  {
    case 4000:
      goto LABEL_29;
    case 4001:
    case 4014:
LABEL_6:
      v5 = 0.368627451;
      v6 = 0.396078431;
      v7 = 0.411764706;
      goto LABEL_13;
    case 4002:
      v5 = 0.4;
      v6 = 0.431372549;
      v7 = 0.447058824;
      goto LABEL_13;
    case 4003:
LABEL_5:
      v5 = 0.490196078;
      v6 = 0.525490196;
      v7 = 0.545098039;
      goto LABEL_13;
    case 4004:
      v5 = 0.235294118;
      v6 = 0.254901961;
      v7 = 0.262745098;
      goto LABEL_13;
    case 4005:
      goto LABEL_26;
    case 4006:
    case 4015:
LABEL_7:
      v5 = 0.450980392;
      v6 = 0.48627451;
      v7 = 0.505882353;
      goto LABEL_13;
    case 4007:
      v5 = 0.470588235;
      v6 = 0.509803922;
      v7 = 0.529411765;
      goto LABEL_13;
    case 4008:
LABEL_8:
      v5 = 0.392156863;
      v6 = 0.423529412;
      v7 = 0.439215686;
      goto LABEL_13;
    case 4009:
      v5 = 0.435294118;
      v6 = 0.466666667;
      v7 = 0.48627451;
LABEL_13:
      +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v5, v6, v7, 1.0);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 4010:
      +[UIColor whiteColor](UIColor, "whiteColor");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 4011:
      +[UIColor blackColor](UIColor, "blackColor");
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_14:
      v9 = (void *)v8;
      v3 = 0;
      goto LABEL_15;
    case 4012:
      if (_AXSEnhanceBackgroundContrastEnabled())
        +[UIColor whiteColor](UIColor, "whiteColor");
      else
        +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.3);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_29:
      +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.207843137, 0.223529412, 0.231372549, 1.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 4013:
    case 4016:
      if (_AXSEnhanceBackgroundContrastEnabled())
        +[UIColor lightGrayColor](UIColor, "lightGrayColor");
      else
        +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.05);
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_26:
      +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.584313725, 0.611764706, 0.62745098, 1.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = (void *)v4;
LABEL_15:
      +[_UIVisualEffectTintLayerConfig layerWithTintColor:](_UIVisualEffectTintLayerConfig, "layerWithTintColor:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIVisualEffectConfig configWithContentConfig:](_UIVisualEffectConfig, "configWithContentConfig:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        +[_UIVisualEffectLayerConfig layerWithFillColor:opacity:filterType:](_UIVisualEffectLayerConfig, "layerWithFillColor:opacity:filterType:", v3, 0, 1.0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addLayerConfig:", v12);

      }
      break;
    default:
      switch(a3)
      {
        case 0:
          goto LABEL_5;
        case 1:
          goto LABEL_6;
        case 2:
          goto LABEL_7;
        case 3:
          goto LABEL_8;
        default:
          -[_UILegacyEffectConverterTVOS vibrancyConfigForLowQualityVibrancyStyle:](self, "vibrancyConfigForLowQualityVibrancyStyle:");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          break;
      }
      break;
  }
  return v11;
}

@end
