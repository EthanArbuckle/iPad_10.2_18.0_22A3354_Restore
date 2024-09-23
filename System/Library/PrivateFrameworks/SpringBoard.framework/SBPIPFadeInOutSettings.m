@implementation SBPIPFadeInOutSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBPIPFadeInOutSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[SBFAnimationSettings setAnimationType:](self->_fadeInOutAnimationSettings, "setAnimationType:", 1);
  -[SBFAnimationSettings setCurve:](self->_fadeInOutAnimationSettings, "setCurve:", 196608);
  -[SBFAnimationSettings setDuration:](self->_fadeInOutAnimationSettings, "setDuration:", 0.8);
  -[SBFAnimationSettings setMass:](self->_fadeInOutAnimationSettings, "setMass:", 2.0);
  -[SBFAnimationSettings setStiffness:](self->_fadeInOutAnimationSettings, "setStiffness:", 300.0);
  -[SBFAnimationSettings setDamping:](self->_fadeInOutAnimationSettings, "setDamping:", 50.0);
  self->_fadeInInitialScale = 0.8;
  self->_fadeInInitialBlurRadius = 60.0;
  self->_fadeOutFinalScale = 0.8;
  self->_fadeOutFinalBlurRadius = 60.0;
}

- ($1AB5FA073B851C12C2339EC22442E995)fadeInInitialValues
{
  double fadeInInitialScale;
  double fadeInInitialOpacity;
  double fadeInInitialBlurRadius;
  $1AB5FA073B851C12C2339EC22442E995 result;

  fadeInInitialScale = self->_fadeInInitialScale;
  fadeInInitialOpacity = self->_fadeInInitialOpacity;
  fadeInInitialBlurRadius = self->_fadeInInitialBlurRadius;
  result.var2 = fadeInInitialBlurRadius;
  result.var1 = fadeInInitialOpacity;
  result.var0 = fadeInInitialScale;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)fadeOutFinalValues
{
  double fadeOutFinalScale;
  double fadeOutFinalOpacity;
  double fadeOutFinalBlurRadius;
  $1AB5FA073B851C12C2339EC22442E995 result;

  fadeOutFinalScale = self->_fadeOutFinalScale;
  fadeOutFinalOpacity = self->_fadeOutFinalOpacity;
  fadeOutFinalBlurRadius = self->_fadeOutFinalBlurRadius;
  result.var2 = fadeOutFinalBlurRadius;
  result.var1 = fadeOutFinalOpacity;
  result.var0 = fadeOutFinalScale;
  return result;
}

+ (BOOL)ignoresKey:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("fadeInInitialValues")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("fadeOutFinalValues"));

  return v4;
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
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[3];
  _QWORD v29[3];
  _QWORD v30[4];

  v30[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0DA9D80], "_moduleWithSectionTitle:delay:frameRate:", CFSTR("Fade-In/Out animation"), 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_fadeInOutAnimationSettings);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "submoduleWithModule:childSettingsKeyPath:", v3, v4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Scale"), CFSTR("fadeInInitialScale"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minValue:maxValue:", 0.0, 1.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Opacity"), CFSTR("fadeInInitialOpacity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minValue:maxValue:", 0.0, 1.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Blur Radius"), CFSTR("fadeInInitialBlurRadius"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minValue:maxValue:", 0.0, 90.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D83070];
  v30[0] = v25;
  v30[1] = v26;
  v30[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionWithRows:title:", v10, CFSTR("Fade-In Initial Values"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Scale"), CFSTR("fadeOutFinalScale"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "minValue:maxValue:", 0.0, 1.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Opacity"), CFSTR("fadeOutFinalOpacity"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "minValue:maxValue:", 0.0, 1.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Blur Radius"), CFSTR("fadeOutFinalBlurRadius"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "minValue:maxValue:", 0.0, 90.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0D83070];
  v29[0] = v15;
  v29[1] = v13;
  v29[2] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sectionWithRows:title:", v19, CFSTR("Fade-Out Final Values"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0D83070];
  v28[0] = v11;
  v28[1] = v20;
  v28[2] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "moduleWithTitle:contents:", CFSTR("Fade-In/Out Settings"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (SBFAnimationSettings)fadeInOutAnimationSettings
{
  return self->_fadeInOutAnimationSettings;
}

- (void)setFadeInOutAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_fadeInOutAnimationSettings, a3);
}

- (double)fadeInInitialScale
{
  return self->_fadeInInitialScale;
}

- (void)setFadeInInitialScale:(double)a3
{
  self->_fadeInInitialScale = a3;
}

- (double)fadeInInitialOpacity
{
  return self->_fadeInInitialOpacity;
}

- (void)setFadeInInitialOpacity:(double)a3
{
  self->_fadeInInitialOpacity = a3;
}

- (double)fadeInInitialBlurRadius
{
  return self->_fadeInInitialBlurRadius;
}

- (void)setFadeInInitialBlurRadius:(double)a3
{
  self->_fadeInInitialBlurRadius = a3;
}

- (double)fadeOutFinalScale
{
  return self->_fadeOutFinalScale;
}

- (void)setFadeOutFinalScale:(double)a3
{
  self->_fadeOutFinalScale = a3;
}

- (double)fadeOutFinalOpacity
{
  return self->_fadeOutFinalOpacity;
}

- (void)setFadeOutFinalOpacity:(double)a3
{
  self->_fadeOutFinalOpacity = a3;
}

- (double)fadeOutFinalBlurRadius
{
  return self->_fadeOutFinalBlurRadius;
}

- (void)setFadeOutFinalBlurRadius:(double)a3
{
  self->_fadeOutFinalBlurRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fadeInOutAnimationSettings, 0);
}

@end
