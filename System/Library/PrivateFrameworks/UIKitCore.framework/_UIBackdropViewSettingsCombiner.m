@implementation _UIBackdropViewSettingsCombiner

- (BOOL)isBackdropVisible
{
  return 1;
}

- (void)setWeighting:(double)a3
{
  self->_weighting = a3;
}

- (void)computeOutputSettingsUsingModel:(id)a3
{
  _QWORD *v4;
  _UIBackdropViewSettings *v5;
  _UIBackdropViewSettings *outputSettingsA;
  void *v7;
  _UIBackdropViewSettings *v8;
  _UIBackdropViewSettings *outputSettingsB;
  _UIBackdropColorSettings **p_colorSettings;
  _UIBackdropViewSettings *inputSettingsA;
  _UIBackdropViewSettings *inputSettingsB;
  double v13;
  double v14;
  _UIBackdropViewSettings *v15;
  double grayscaleTintAlpha;
  double grayscaleTintLevel;
  UIColor *v18;
  _UIBackdropViewSettings *v19;
  double zoom;
  _UIBackdropViewSettings *v21;
  double v22;
  UIColor *v23;
  _UIBackdropViewSettings *v24;
  double v25;
  double v26;
  double v27;
  double weighting;
  UIColor *v29;
  UIColor *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  UIColor *v35;
  UIColor *colorTint;
  UIColor *v37;
  UIColor *legibleColor;
  double v39;
  double v40;
  double colorTintAlpha;
  double blurRadius;
  double saturationDeltaFactor;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;

  v4 = a3;
  if (!self->_outputSettingsA)
  {
    v5 = (_UIBackdropViewSettings *)objc_alloc_init((Class)objc_opt_class());
    outputSettingsA = self->_outputSettingsA;
    self->_outputSettingsA = v5;

  }
  if (self->_outputSettingsB)
  {
    if (v4)
    {
LABEL_5:
      v7 = (void *)v4[6];
      goto LABEL_8;
    }
  }
  else
  {
    v8 = (_UIBackdropViewSettings *)objc_alloc_init((Class)objc_opt_class());
    outputSettingsB = self->_outputSettingsB;
    self->_outputSettingsB = v8;

    if (v4)
      goto LABEL_5;
  }
  v7 = 0;
LABEL_8:
  p_colorSettings = &self->super._colorSettings;
  objc_storeStrong((id *)&self->super._colorSettings, v7);
  inputSettingsA = self->_inputSettingsA;
  if (inputSettingsA)
    objc_storeStrong((id *)&inputSettingsA->_colorSettings, *p_colorSettings);
  inputSettingsB = self->_inputSettingsB;
  if (inputSettingsB)
    objc_storeStrong((id *)&inputSettingsB->_colorSettings, *p_colorSettings);
  -[_UIBackdropViewSettings computeOutputSettingsUsingModel:](self->_outputSettingsA, "computeOutputSettingsUsingModel:", self->_inputSettingsA);
  -[_UIBackdropViewSettings computeOutputSettingsUsingModel:](self->_outputSettingsB, "computeOutputSettingsUsingModel:", self->_inputSettingsB);
  v13 = 0.0;
  v14 = 1.0;
  self->_weighting = fmin(fmax(self->_weighting, 0.0), 1.0);
  v15 = self->_outputSettingsA;
  if (v15)
  {
    grayscaleTintLevel = v15->_grayscaleTintLevel;
    grayscaleTintAlpha = v15->_grayscaleTintAlpha;
    v18 = v15->_colorTint;
    v19 = self->_outputSettingsA;
    colorTintAlpha = v19->_colorTintAlpha;
    blurRadius = v19->_blurRadius;
    saturationDeltaFactor = v19->_saturationDeltaFactor;
    zoom = v19->_zoom;
  }
  else
  {
    v18 = 0;
    grayscaleTintLevel = 0.0;
    grayscaleTintAlpha = 0.0;
    colorTintAlpha = 0.0;
    blurRadius = 0.0;
    saturationDeltaFactor = 1.0;
    zoom = 0.0;
  }
  v44 = zoom;
  v21 = self->_outputSettingsB;
  if (v21)
  {
    v13 = v21->_grayscaleTintLevel;
    v22 = v21->_grayscaleTintAlpha;
    v23 = v21->_colorTint;
    v24 = self->_outputSettingsB;
    v25 = v24->_colorTintAlpha;
    v26 = v24->_blurRadius;
    v14 = v24->_saturationDeltaFactor;
    v27 = v24->_zoom;
  }
  else
  {
    v23 = 0;
    v22 = 0.0;
    v25 = 0.0;
    v26 = 0.0;
    v27 = 0.0;
  }
  v39 = v27;
  self->super._grayscaleTintLevel = v13 * self->_weighting + grayscaleTintLevel * (1.0 - self->_weighting);
  self->super._grayscaleTintAlpha = v22 * self->_weighting + grayscaleTintAlpha * (1.0 - self->_weighting);
  weighting = self->_weighting;
  v29 = v18;
  v30 = v23;
  v52 = 0.0;
  v53 = 0.0;
  v50 = 0.0;
  v51 = 0.0;
  if (!-[UIColor getRed:green:blue:alpha:](v29, "getRed:green:blue:alpha:", &v53, &v52, &v51, &v50))
  {
    v49 = 0.0;
    -[UIColor getWhite:alpha:](v29, "getWhite:alpha:", &v49, &v50);
    v51 = v49;
    v52 = v49;
    v53 = v49;
  }
  v31 = 1.0 - weighting;
  v48 = 0.0;
  v49 = 0.0;
  v46 = 0.0;
  v47 = 0.0;
  if (-[UIColor getRed:green:blue:alpha:](v30, "getRed:green:blue:alpha:", &v49, &v48, &v47, &v46, *(_QWORD *)&v39))
  {
    v33 = v48;
    v32 = v49;
    v34 = v47;
  }
  else
  {
    v45 = 0.0;
    -[UIColor getWhite:alpha:](v30, "getWhite:alpha:", &v45, &v46);
    v33 = v45;
    v47 = v45;
    v48 = v45;
    v49 = v45;
    v34 = v45;
    v32 = v45;
  }
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", (1.0 - v31) * v32 + v31 * v53, (1.0 - v31) * v34 + v31 * v52, (1.0 - v31) * v33 + v31 * v51, v31 * v50 + (1.0 - v31) * v46);
  v35 = (UIColor *)objc_claimAutoreleasedReturnValue();

  colorTint = self->super._colorTint;
  self->super._colorTint = v35;

  self->super._colorTintAlpha = v25 * self->_weighting + colorTintAlpha * (1.0 - self->_weighting);
  self->super._blurRadius = v26 * self->_weighting + blurRadius * (1.0 - self->_weighting);
  self->super._saturationDeltaFactor = v14 * self->_weighting + saturationDeltaFactor * (1.0 - self->_weighting);
  self->super._zoom = v40 * self->_weighting + v44 * (1.0 - self->_weighting);
  if (!self->_outputSettingsA && !self->_outputSettingsB)
    self->super._scale = 1.0;
  _UIBackdropViewComputeLegibleColorWithColorSettings(self->super._colorSettings);
  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:");
  v37 = (UIColor *)objc_claimAutoreleasedReturnValue();
  legibleColor = self->super._legibleColor;
  self->super._legibleColor = v37;

  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void)setInputSettingsB:(id)a3
{
  objc_storeStrong((id *)&self->_inputSettingsB, a3);
}

- (void)setInputSettingsA:(id)a3
{
  objc_storeStrong((id *)&self->_inputSettingsA, a3);
}

- (_UIBackdropViewSettings)inputSettingsB
{
  return self->_inputSettingsB;
}

- (_UIBackdropViewSettings)inputSettingsA
{
  return self->_inputSettingsA;
}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIBackdropViewSettingsCombiner;
  -[_UIBackdropViewSettings setDefaultValues](&v3, sel_setDefaultValues);
  self->super._requiresColorStatistics = 0;
}

- (void)copyAdditionalSettingsFromSettings:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIBackdropViewSettingsCombiner;
  -[_UIBackdropViewSettings copyAdditionalSettingsFromSettings:](&v12, sel_copyAdditionalSettingsFromSettings_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "inputSettingsA");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIBackdropViewSettings settingsPreservingHintsFromSettings:graphicsQuality:](_UIBackdropViewSettings, "settingsPreservingHintsFromSettings:graphicsQuality:", v6, -[_UIBackdropViewSettings graphicsQuality](self, "graphicsQuality"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBackdropViewSettingsCombiner setInputSettingsA:](self, "setInputSettingsA:", v7);

    objc_msgSend(v5, "inputSettingsB");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIBackdropViewSettings settingsPreservingHintsFromSettings:graphicsQuality:](_UIBackdropViewSettings, "settingsPreservingHintsFromSettings:graphicsQuality:", v8, -[_UIBackdropViewSettings graphicsQuality](self, "graphicsQuality"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBackdropViewSettingsCombiner setInputSettingsB:](self, "setInputSettingsB:", v9);

    objc_msgSend(v5, "weighting");
    v11 = v10;

    -[_UIBackdropViewSettingsCombiner setWeighting:](self, "setWeighting:", v11);
  }

}

- (double)weighting
{
  return self->_weighting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputSettingsB, 0);
  objc_storeStrong((id *)&self->_outputSettingsA, 0);
  objc_storeStrong((id *)&self->_inputSettingsB, 0);
  objc_storeStrong((id *)&self->_inputSettingsA, 0);
}

- (void)setRequiresColorStatistics:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIBackdropViewSettingsCombiner;
  -[_UIBackdropViewSettings setRequiresColorStatistics:](&v3, sel_setRequiresColorStatistics_, 0);
}

- (BOOL)requiresBackdropLayer
{
  return 1;
}

- (_UIBackdropViewSettings)outputSettingsA
{
  return self->_outputSettingsA;
}

- (void)setOutputSettingsA:(id)a3
{
  objc_storeStrong((id *)&self->_outputSettingsA, a3);
}

- (_UIBackdropViewSettings)outputSettingsB
{
  return self->_outputSettingsB;
}

- (void)setOutputSettingsB:(id)a3
{
  objc_storeStrong((id *)&self->_outputSettingsB, a3);
}

@end
