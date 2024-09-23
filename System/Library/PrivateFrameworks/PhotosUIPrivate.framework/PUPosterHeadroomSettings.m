@implementation PUPosterHeadroomSettings

- (id)parentSettings
{
  return +[PUPosterSettings sharedInstance](PUPosterSettings, "sharedInstance");
}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPosterHeadroomSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PUPosterHeadroomSettings setFadeAnimationDuration:](self, "setFadeAnimationDuration:", 0.300000012);
  -[PUPosterHeadroomSettings setBlurVisibilityFraction:](self, "setBlurVisibilityFraction:", 1.0);
  -[PUPosterHeadroomSettings setBlurRadius:](self, "setBlurRadius:", 7.0);
  -[PUPosterHeadroomSettings setBlurMaskTopLocation:](self, "setBlurMaskTopLocation:", 0.49000001);
  -[PUPosterHeadroomSettings setBlurMaskHeight:](self, "setBlurMaskHeight:", 300.0);
  -[PUPosterHeadroomSettings setFalloffHeight:](self, "setFalloffHeight:", 0.180000007);
  -[PUPosterHeadroomSettings setGradientHeight:](self, "setGradientHeight:", 1.0);
  -[PUPosterHeadroomSettings setGradientWhite:](self, "setGradientWhite:", 0.0);
  -[PUPosterHeadroomSettings setHighKeyGradientWhite:](self, "setHighKeyGradientWhite:", 1.0);
  -[PUPosterHeadroomSettings setBottomGradientAlpha:](self, "setBottomGradientAlpha:", 0.75999999);
  -[PUPosterHeadroomSettings setBottomGradientTopLocation:](self, "setBottomGradientTopLocation:", 0.330000013);
  -[PUPosterHeadroomSettings setBottomGradientBottomLocation:](self, "setBottomGradientBottomLocation:", 1.0);
  -[PUPosterHeadroomSettings setTopGradientAlpha:](self, "setTopGradientAlpha:", 0.709999979);
  -[PUPosterHeadroomSettings setTopGradientTopLocation:](self, "setTopGradientTopLocation:", 0.300000012);
  -[PUPosterHeadroomSettings setTopGradientBottomLocation:](self, "setTopGradientBottomLocation:", 1.0);
  -[PUPosterHeadroomSettings setUseSoftLightBlendingModeForTopGradient:](self, "setUseSoftLightBlendingModeForTopGradient:", 1);
}

- (void)setBlurRadius:(double)a3
{
  id v4;

  if (vabdd_f64(self->_blurRadius, a3) > 0.00000999999975)
  {
    self->_blurRadius = a3;
    objc_msgSend(MEMORY[0x1E0D711D8], "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBlurRadius:", a3);

  }
}

- (void)setBlurMaskTopLocation:(double)a3
{
  id v4;

  if (vabdd_f64(self->_blurMaskTopLocation, a3) > 0.00000999999975)
  {
    self->_blurMaskTopLocation = a3;
    objc_msgSend(MEMORY[0x1E0D711D8], "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBlurMaskTopLocation:", a3);

  }
}

- (void)setFalloffHeight:(double)a3
{
  id v4;

  if (vabdd_f64(self->_falloffHeight, a3) > 0.00000999999975)
  {
    self->_falloffHeight = a3;
    objc_msgSend(MEMORY[0x1E0D711D8], "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFalloffHeight:", a3);

  }
}

- (void)setGradientHeight:(double)a3
{
  id v4;

  if (vabdd_f64(self->_gradientHeight, a3) > 0.00000999999975)
  {
    self->_gradientHeight = a3;
    objc_msgSend(MEMORY[0x1E0D711D8], "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setGradientHeight:", a3);

  }
}

- (void)setGradientWhite:(double)a3
{
  id v4;

  if (vabdd_f64(self->_gradientWhite, a3) > 0.00000999999975)
  {
    self->_gradientWhite = a3;
    objc_msgSend(MEMORY[0x1E0D711D8], "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setGradientWhite:", a3);

  }
}

- (void)setHighKeyGradientWhite:(double)a3
{
  id v4;

  if (vabdd_f64(self->_highKeyGradientWhite, a3) > 0.00000999999975)
  {
    self->_highKeyGradientWhite = a3;
    objc_msgSend(MEMORY[0x1E0D711D8], "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHighKeyGradientWhite:", a3);

  }
}

- (void)setBottomGradientAlpha:(double)a3
{
  id v4;

  if (vabdd_f64(self->_bottomGradientAlpha, a3) > 0.00000999999975)
  {
    self->_bottomGradientAlpha = a3;
    objc_msgSend(MEMORY[0x1E0D711D8], "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBottomGradientAlpha:", a3);

  }
}

- (void)setBottomGradientTopLocation:(double)a3
{
  id v4;

  if (vabdd_f64(self->_bottomGradientTopLocation, a3) > 0.00000999999975)
  {
    self->_bottomGradientTopLocation = a3;
    objc_msgSend(MEMORY[0x1E0D711D8], "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBottomGradientTopLocation:", a3);

  }
}

- (void)setBottomGradientBottomLocation:(double)a3
{
  id v4;

  if (vabdd_f64(self->_bottomGradientBottomLocation, a3) > 0.00000999999975)
  {
    self->_bottomGradientBottomLocation = a3;
    objc_msgSend(MEMORY[0x1E0D711D8], "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBottomGradientBottomLocation:", a3);

  }
}

- (void)setTopGradientAlpha:(double)a3
{
  id v4;

  if (vabdd_f64(self->_topGradientAlpha, a3) > 0.00000999999975)
  {
    self->_topGradientAlpha = a3;
    objc_msgSend(MEMORY[0x1E0D711D8], "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTopGradientAlpha:", a3);

  }
}

- (void)setTopGradientTopLocation:(double)a3
{
  id v4;

  if (vabdd_f64(self->_topGradientTopLocation, a3) > 0.00000999999975)
  {
    self->_topGradientTopLocation = a3;
    objc_msgSend(MEMORY[0x1E0D711D8], "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTopGradientTopLocation:", a3);

  }
}

- (void)setTopGradientBottomLocation:(double)a3
{
  id v4;

  if (vabdd_f64(self->_topGradientBottomLocation, a3) > 0.00000999999975)
  {
    self->_topGradientBottomLocation = a3;
    objc_msgSend(MEMORY[0x1E0D711D8], "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTopGradientBottomLocation:", a3);

  }
}

- (void)setUseSoftLightBlendingModeForTopGradient:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_useSoftLightBlendingModeForTopGradient != a3)
  {
    v3 = a3;
    self->_useSoftLightBlendingModeForTopGradient = a3;
    objc_msgSend(MEMORY[0x1E0D711D8], "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUseSoftLightBlendingModeForTopGradient:", v3);

  }
}

- (double)fadeAnimationDuration
{
  return self->_fadeAnimationDuration;
}

- (void)setFadeAnimationDuration:(double)a3
{
  self->_fadeAnimationDuration = a3;
}

- (double)blurVisibilityFraction
{
  return self->_blurVisibilityFraction;
}

- (void)setBlurVisibilityFraction:(double)a3
{
  self->_blurVisibilityFraction = a3;
}

- (double)blurRadius
{
  return self->_blurRadius;
}

- (double)blurMaskHeight
{
  return self->_blurMaskHeight;
}

- (void)setBlurMaskHeight:(double)a3
{
  self->_blurMaskHeight = a3;
}

- (double)blurMaskTopLocation
{
  return self->_blurMaskTopLocation;
}

- (double)falloffHeight
{
  return self->_falloffHeight;
}

- (double)gradientHeight
{
  return self->_gradientHeight;
}

- (double)gradientWhite
{
  return self->_gradientWhite;
}

- (double)highKeyGradientWhite
{
  return self->_highKeyGradientWhite;
}

- (double)bottomGradientAlpha
{
  return self->_bottomGradientAlpha;
}

- (double)bottomGradientTopLocation
{
  return self->_bottomGradientTopLocation;
}

- (double)bottomGradientBottomLocation
{
  return self->_bottomGradientBottomLocation;
}

- (double)topGradientAlpha
{
  return self->_topGradientAlpha;
}

- (double)topGradientTopLocation
{
  return self->_topGradientTopLocation;
}

- (double)topGradientBottomLocation
{
  return self->_topGradientBottomLocation;
}

- (BOOL)useSoftLightBlendingModeForTopGradient
{
  return self->_useSoftLightBlendingModeForTopGradient;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_91378 != -1)
    dispatch_once(&sharedInstance_onceToken_91378, &__block_literal_global_91379);
  return (id)sharedInstance_sharedInstance_91380;
}

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[2];
  void *v59;
  _QWORD v60[17];

  v60[15] = *MEMORY[0x1E0C80C00];
  v42 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Fade Animation Duration"), CFSTR("fadeAnimationDuration"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "minValue:maxValue:", 0.0, 2.0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "pu_increment:", 0.00999999978);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v55;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Blur Visibility Fraction"), CFSTR("blurVisibilityFraction"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "minValue:maxValue:", 0.0500000007, 1.0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "pu_increment:", 0.0500000007);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = v52;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Blur Radius"), CFSTR("blurRadius"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "minValue:maxValue:", 0.0, 50.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "pu_increment:", 0.5);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v60[2] = v49;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Blur Mask Top Location"), CFSTR("blurMaskTopLocation"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "minValue:maxValue:", 0.0, 1.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "pu_increment:", 0.00999999978);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v60[3] = v46;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Falloff Height"), CFSTR("falloffHeight"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "minValue:maxValue:", 0.0, 1.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "pu_increment:", 0.00999999978);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v60[4] = v41;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Gradient Height"), CFSTR("gradientHeight"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "minValue:maxValue:", 0.0500000007, 1.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "pu_increment:", 0.00999999978);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v60[5] = v38;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Gradient White"), CFSTR("gradientWhite"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "minValue:maxValue:", 0.0, 1.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "pu_increment:", 0.00999999978);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v60[6] = v35;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("High Key Gradient White"), CFSTR("highKeyGradientWhite"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "minValue:maxValue:", 0.0, 1.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "pu_increment:", 0.00999999978);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v60[7] = v32;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("First Gradient Alpha"), CFSTR("bottomGradientAlpha"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "minValue:maxValue:", 0.0, 1.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "pu_increment:", 0.00999999978);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v60[8] = v29;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("First Gradient Top Point"), CFSTR("bottomGradientTopLocation"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "minValue:maxValue:", 0.0, 1.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "pu_increment:", 0.00999999978);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v60[9] = v26;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("First Gradient Bottom Point"), CFSTR("bottomGradientBottomLocation"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "minValue:maxValue:", 0.0, 1.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "pu_increment:", 0.00999999978);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v60[10] = v23;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Second Gradient Alpha"), CFSTR("topGradientAlpha"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "minValue:maxValue:", 0.0, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pu_increment:", 0.00999999978);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v60[11] = v3;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Second Gradient Top Point"), CFSTR("topGradientTopLocation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minValue:maxValue:", 0.0, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pu_increment:", 0.00999999978);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v60[12] = v6;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Second Gradient Bottom Point"), CFSTR("topGradientBottomLocation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minValue:maxValue:", 0.0, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pu_increment:", 0.00999999978);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v60[13] = v9;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Enable Soft Light Blending"), CFSTR("useSoftLightBlendingModeForTopGradient"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v60[14] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "sectionWithRows:", v11);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D83078];
  v13 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rowWithTitle:action:", CFSTR("Restore Defaults"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sectionWithRows:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0D83078];
  v58[0] = v43;
  v58[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "moduleWithTitle:contents:", CFSTR("Headroom"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

void __42__PUPosterHeadroomSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PUPosterSettings sharedInstance](PUPosterSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "headroomSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_91380;
  sharedInstance_sharedInstance_91380 = v0;

}

@end
