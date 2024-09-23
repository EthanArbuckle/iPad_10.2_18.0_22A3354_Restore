@implementation _UIWindowSceneActivationSettings

- (void)setDefaultValues
{
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
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_UIWindowSceneActivationSettings;
  -[PTSettings setDefaultValues](&v13, sel_setDefaultValues);
  -[_UIWindowSceneActivationSettings setPinchActivationScaleThreshold:](self, "setPinchActivationScaleThreshold:", 1.5);
  -[_UIWindowSceneActivationSettings setPinchEndingProjectionDuration:](self, "setPinchEndingProjectionDuration:", 0.15);
  -[_UIWindowSceneActivationSettings setPinchPlatterMaxShadowIntensity:](self, "setPinchPlatterMaxShadowIntensity:", 0.5);
  -[_UIWindowSceneActivationSettings setPinchEndPlatterVelocityMultiplier:](self, "setPinchEndPlatterVelocityMultiplier:", 5.0);
  -[_UIWindowSceneActivationSettings pinchInteractiveScale](self, "pinchInteractiveScale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDampingRatio:", 0.85);

  -[_UIWindowSceneActivationSettings pinchInteractiveScale](self, "pinchInteractiveScale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResponse:", 0.25);

  -[_UIWindowSceneActivationSettings pinchSettle](self, "pinchSettle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDampingRatio:", 0.85);

  -[_UIWindowSceneActivationSettings pinchSettle](self, "pinchSettle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setResponse:", 0.45);

  -[_UIWindowSceneActivationSettings pinchShadow](self, "pinchShadow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDampingRatio:", 1.0);

  -[_UIWindowSceneActivationSettings pinchShadow](self, "pinchShadow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setResponse:", 0.4);

  -[_UIWindowSceneActivationSettings morph](self, "morph");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDampingRatio:", 1.0);

  -[_UIWindowSceneActivationSettings morph](self, "morph");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setResponse:", 0.336);

  -[_UIWindowSceneActivationSettings morphMenuDismissal](self, "morphMenuDismissal");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDampingRatio:", 1.0);

  -[_UIWindowSceneActivationSettings morphMenuDismissal](self, "morphMenuDismissal");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setResponse:", 0.1);

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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[2];
  _QWORD v31[11];

  v31[9] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Activation Scale Threshold"), CFSTR("pinchActivationScaleThreshold"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "between:and:", 0.0, 5.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "precision:", 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v26;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("End Projection Duration"), CFSTR("pinchEndingProjectionDuration"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "between:and:", 0.0, 1.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "precision:", 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v23;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Platter Shadow Intensity"), CFSTR("pinchPlatterMaxShadowIntensity"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "between:and:", 0.0, 1.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "precision:", 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v20;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Ending Animation Platter Position Velocity Multiplier"), CFSTR("pinchEndPlatterVelocityMultiplier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "between:and:", 0.0, 100.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "precision:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v5;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Interactive Scale Animation"), CFSTR("pinchInteractiveScale"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31[4] = v6;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Scale Settle Animation"), CFSTR("pinchSettle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31[5] = v7;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Shadow Animation"), CFSTR("pinchShadow"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31[6] = v8;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Center Window Morph Animation"), CFSTR("morph"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31[7] = v9;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Morph Menu Dismissal Animation"), CFSTR("morphMenuDismissal"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v11, CFSTR("In-App Pinch Interaction"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D83078];
  v30[0] = v12;
  objc_msgSend(MEMORY[0x1E0D83010], "restoreDefaultSettingsButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sectionWithRows:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "moduleWithTitle:contents:", 0, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (double)pinchActivationScaleThreshold
{
  return self->_pinchActivationScaleThreshold;
}

- (void)setPinchActivationScaleThreshold:(double)a3
{
  self->_pinchActivationScaleThreshold = a3;
}

- (double)pinchEndingProjectionDuration
{
  return self->_pinchEndingProjectionDuration;
}

- (void)setPinchEndingProjectionDuration:(double)a3
{
  self->_pinchEndingProjectionDuration = a3;
}

- (double)pinchPlatterMaxShadowIntensity
{
  return self->_pinchPlatterMaxShadowIntensity;
}

- (void)setPinchPlatterMaxShadowIntensity:(double)a3
{
  self->_pinchPlatterMaxShadowIntensity = a3;
}

- (double)pinchEndPlatterVelocityMultiplier
{
  return self->_pinchEndPlatterVelocityMultiplier;
}

- (void)setPinchEndPlatterVelocityMultiplier:(double)a3
{
  self->_pinchEndPlatterVelocityMultiplier = a3;
}

- (_UISpringAnimationPrototypeSettings)pinchInteractiveScale
{
  return self->_pinchInteractiveScale;
}

- (void)setPinchInteractiveScale:(id)a3
{
  objc_storeStrong((id *)&self->_pinchInteractiveScale, a3);
}

- (_UISpringAnimationPrototypeSettings)pinchSettle
{
  return self->_pinchSettle;
}

- (void)setPinchSettle:(id)a3
{
  objc_storeStrong((id *)&self->_pinchSettle, a3);
}

- (_UISpringAnimationPrototypeSettings)pinchShadow
{
  return self->_pinchShadow;
}

- (void)setPinchShadow:(id)a3
{
  objc_storeStrong((id *)&self->_pinchShadow, a3);
}

- (_UISpringAnimationPrototypeSettings)morph
{
  return self->_morph;
}

- (void)setMorph:(id)a3
{
  objc_storeStrong((id *)&self->_morph, a3);
}

- (_UISpringAnimationPrototypeSettings)morphMenuDismissal
{
  return self->_morphMenuDismissal;
}

- (void)setMorphMenuDismissal:(id)a3
{
  objc_storeStrong((id *)&self->_morphMenuDismissal, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_morphMenuDismissal, 0);
  objc_storeStrong((id *)&self->_morph, 0);
  objc_storeStrong((id *)&self->_pinchShadow, 0);
  objc_storeStrong((id *)&self->_pinchSettle, 0);
  objc_storeStrong((id *)&self->_pinchInteractiveScale, 0);
}

@end
