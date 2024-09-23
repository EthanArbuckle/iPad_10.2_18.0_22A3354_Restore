@implementation _UIBackdropViewSettingsColored

- (void)setDefaultValues
{
  int64_t v3;
  UIColor *v4;
  uint64_t *v5;
  uint64_t *v6;
  double v7;
  int v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIBackdropViewSettingsColored;
  -[_UIBackdropViewSettings setDefaultValues](&v10, sel_setDefaultValues);
  v3 = -[_UIBackdropViewSettings graphicsQuality](self, "graphicsQuality");
  if (v3 == 10)
  {
    -[_UIBackdropViewSettings setRequiresColorStatistics:](self, "setRequiresColorStatistics:", 0);
    -[_UIBackdropViewSettings setBackdropVisible:](self, "setBackdropVisible:", 0);
    -[_UIBackdropViewSettings setUsesBackdropEffectView:](self, "setUsesBackdropEffectView:", 0);
    -[_UIBackdropViewSettings setUsesGrayscaleTintView:](self, "setUsesGrayscaleTintView:", 0);
    -[_UIBackdropViewSettings setColorTint:](self, "setColorTint:", 0);
    -[_UIBackdropViewSettings setColorTintAlpha:](self, "setColorTintAlpha:", 0.86);
    v8 = _AXSEnhanceBackgroundContrastEnabled();
    v7 = 1.0;
    v5 = &_UIBackdropViewSettingsSaturationDeltaFactorNone;
    v6 = &_UIBackdropViewSettingsBlurRadiusNone;
    if (!v8)
    {
LABEL_6:
      -[_UIBackdropViewSettings setColorTintMaskAlpha:](self, "setColorTintMaskAlpha:", 1.0);
      -[_UIBackdropViewSettings setColorTintMaskImage:](self, "setColorTintMaskImage:", 0);
      -[_UIBackdropViewSettings setBlurRadius:](self, "setBlurRadius:", *(double *)v6);
      -[_UIBackdropViewSettings setSaturationDeltaFactor:](self, "setSaturationDeltaFactor:", *(double *)v5);
      -[_UIBackdropViewSettings setFilterMaskAlpha:](self, "setFilterMaskAlpha:", 1.0);
      -[_UIBackdropViewSettings setFilterMaskImage:](self, "setFilterMaskImage:", 0);
      goto LABEL_7;
    }
LABEL_5:
    -[_UIBackdropViewSettings setColorTintAlpha:](self, "setColorTintAlpha:", v7);
    goto LABEL_6;
  }
  if (v3 == 100)
  {
    -[_UIBackdropViewSettings setRequiresColorStatistics:](self, "setRequiresColorStatistics:", 0);
    -[_UIBackdropViewSettings setBackdropVisible:](self, "setBackdropVisible:", 1);
    -[_UIBackdropViewSettings setGrayscaleTintLevel:](self, "setGrayscaleTintLevel:", 0.97);
    -[_UIBackdropViewSettings setGrayscaleTintAlpha:](self, "setGrayscaleTintAlpha:", 0.0);
    -[_UIBackdropViewSettings setGrayscaleTintMaskAlpha:](self, "setGrayscaleTintMaskAlpha:", 1.0);
    -[_UIBackdropViewSettings setGrayscaleTintMaskImage:](self, "setGrayscaleTintMaskImage:", 0);
    v4 = -[UIColor initWithRed:green:blue:alpha:]([UIColor alloc], "initWithRed:green:blue:alpha:", 0.0196078431, 0.0196078431, 0.0196078431, 1.0);
    -[_UIBackdropViewSettings setColorTint:](self, "setColorTint:", v4);

    v5 = &_UIBackdropViewSettingsSaturationDeltaFactorDesaturate;
    v6 = &_UIBackdropViewSettingsBlurRadiusSmall;
    v7 = 0.6;
    goto LABEL_5;
  }
LABEL_7:
  +[UIColor whiteColor](UIColor, "whiteColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBackdropViewSettings setLegibleColor:](self, "setLegibleColor:", v9);

}

- (void)computeOutputSettingsUsingModel:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  double v7;
  double v8;
  int64_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)_UIBackdropViewSettingsColored;
  -[_UIBackdropViewSettings computeOutputSettingsUsingModel:](&v30, sel_computeOutputSettingsUsingModel_, v4);
  if (-[_UIBackdropViewSettings isEnabled](self, "isEnabled"))
  {
    if (!-[_UIBackdropViewSettings isSelected](self, "isSelected")
      || -[_UIBackdropViewSettings isHighlighted](self, "isHighlighted"))
    {
      v5 = -[_UIBackdropViewSettings isHighlighted](self, "isHighlighted");
      objc_msgSend(v4, "colorTint");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIBackdropViewSettings setColorTint:](self, "setColorTint:", v6);

      if (v5)
      {
        objc_msgSend(v4, "colorTintAlpha");
        v8 = v7 * 0.6;
LABEL_28:
        -[_UIBackdropViewSettings setColorTintAlpha:](self, "setColorTintAlpha:", v8);
        goto LABEL_31;
      }
      objc_msgSend(v4, "colorSettings");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "averageBrightness");
      v12 = v11;

      objc_msgSend(v4, "colorSettings");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "averageSaturation");
      v15 = v14;

      if (v12 < 0.5)
      {
        objc_msgSend(v4, "grayscaleTintAlpha");
        -[_UIBackdropViewSettings setGrayscaleTintAlpha:](self, "setGrayscaleTintAlpha:", fmin((0.5 - v12) * 1.25 + v16, 0.96));
      }
      if (v15 > 0.7)
      {
        -[_UIBackdropViewSettings grayscaleTintAlpha](self, "grayscaleTintAlpha");
        -[_UIBackdropViewSettings setGrayscaleTintAlpha:](self, "setGrayscaleTintAlpha:", fmin((v15 + -0.7) * 1.75 + v17, 0.96));
      }
      objc_msgSend(v4, "colorTint");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      _UIBackdropViewSettingsColorAcceptGreen();
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18 == v19)
      {
        v28 = 0.0;
        v29 = 0;
        objc_msgSend(v4, "colorTint", 0, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "getRed:green:blue:alpha:", &v29, &v28, &v27, &v26);

        if (v28 > 0.95)
        {
          if (v12 > 0.7)
          {
            objc_msgSend(v4, "colorTintAlpha", v28);
            -[_UIBackdropViewSettings setColorTintAlpha:](self, "setColorTintAlpha:", fmin((v12 + -0.7) * 0.9 + v21, 0.96));
            -[_UIBackdropViewSettings setGrayscaleTintLevel:](self, "setGrayscaleTintLevel:", 0.0);
            -[_UIBackdropViewSettings setGrayscaleTintAlpha:](self, "setGrayscaleTintAlpha:", fmin(v12 + -0.7 + v12 + -0.7, 0.96));
          }
          if (v15 > 0.7)
          {
            -[_UIBackdropViewSettings colorTintAlpha](self, "colorTintAlpha");
            -[_UIBackdropViewSettings setColorTintAlpha:](self, "setColorTintAlpha:", fmin(v15 + -0.7 + v22, 0.96));
          }
        }
      }
      if (v12 <= 0.9)
      {
        +[UIColor whiteColor](UIColor, "whiteColor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIBackdropViewSettings setLegibleColor:](self, "setLegibleColor:", v23);
      }
      else
      {
        +[UIColor blackColor](UIColor, "blackColor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "colorWithAlphaComponent:", 0.4);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIBackdropViewSettings setLegibleColor:](self, "setLegibleColor:", v24);

      }
      goto LABEL_31;
    }
    if (qword_1ECD7CB78 != -1)
      dispatch_once(&qword_1ECD7CB78, &__block_literal_global_4_0);
    -[_UIBackdropViewSettings setColorTint:](self, "setColorTint:", qword_1ECD7CB80);
    v25 = -[_UIBackdropViewSettings graphicsQuality](self, "graphicsQuality");
    if (v25 == 10)
    {
      v8 = 0.96;
      goto LABEL_28;
    }
    if (v25 != 100)
      goto LABEL_31;
LABEL_27:
    v8 = 0.75;
    goto LABEL_28;
  }
  if (_MergedGlobals_943 != -1)
    dispatch_once(&_MergedGlobals_943, &__block_literal_global_30);
  -[_UIBackdropViewSettings setColorTint:](self, "setColorTint:", qword_1ECD7CB70);
  v9 = -[_UIBackdropViewSettings graphicsQuality](self, "graphicsQuality");
  if (v9 == 10)
    goto LABEL_27;
  if (v9 == 100)
  {
    v8 = 0.2;
    goto LABEL_28;
  }
LABEL_31:

}

@end
