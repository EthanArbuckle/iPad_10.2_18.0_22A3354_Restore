@implementation SBHLibraryWaveZoomSettings

- (void)setDefaultValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBHLibraryWaveZoomSettings;
  -[SBHIconZoomSettings setDefaultValues](&v9, sel_setDefaultValues);
  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCurve:", 196608);

  -[SBHLibraryWaveZoomSettings setInterPodWaveDelay:](self, "setInterPodWaveDelay:", 0.02);
  -[SBHIconZoomSettings setLabelAlphaWithZoom:](self, "setLabelAlphaWithZoom:", 1);
  -[SBHLibraryWaveZoomSettings setSearchScale:](self, "setSearchScale:", 0.945);
  -[SBHLibraryWaveZoomSettings podFadeSettings](self, "podFadeSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnimationType:", 1);

  -[SBHLibraryWaveZoomSettings podFadeSettings](self, "podFadeSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMass:", 1.0);

  -[SBHLibraryWaveZoomSettings podFadeSettings](self, "podFadeSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStiffness:", 885.288);

  -[SBHLibraryWaveZoomSettings podFadeSettings](self, "podFadeSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDamping:", 59.5076);

  -[SBHLibraryWaveZoomSettings podFadeSettings](self, "podFadeSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCurve:", 196608);

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
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;
  _QWORD v31[7];
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  v30.receiver = a1;
  v30.super_class = (Class)&OBJC_METACLASS___SBHLibraryWaveZoomSettings;
  objc_msgSendSuper2(&v30, sel_settingsControllerModule);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "submoduleWithModule:childSettingsKeyPath:", v3, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0D83078];
  __54__SBHLibraryWaveZoomSettings_settingsControllerModule__block_invoke();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWithRows:title:", v5, CFSTR("Primary Settings"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0D83078];
  __54__SBHLibraryWaveZoomSettings_settingsControllerModule__block_invoke_2();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionWithRows:title:", v7, CFSTR("Retargeting Interpolation Settings"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0D83078];
  __54__SBHLibraryWaveZoomSettings_settingsControllerModule__block_invoke_3();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionWithRows:title:", v9, CFSTR("Pod Z-Effect [Scale + Y] Curve Settings"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0DA9D80], "_moduleWithSectionTitle:delay:frameRate:", CFSTR("Lower Pod Fade Settings"), 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "submoduleWithModule:childSettingsKeyPath:", v12, CFSTR("podFadeSettings"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0D83078];
  __54__SBHLibraryWaveZoomSettings_settingsControllerModule__block_invoke_4();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sectionWithRows:title:", v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0D83078];
  v18 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "action");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "rowWithTitle:action:", CFSTR("Restore Defaults"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sectionWithRows:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0D83078];
  v31[0] = v29;
  v31[1] = v28;
  v31[2] = v10;
  v31[3] = v13;
  v31[4] = v16;
  v31[5] = v27;
  v31[6] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "moduleWithTitle:contents:", 0, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

id __54__SBHLibraryWaveZoomSettings_settingsControllerModule__block_invoke()
{
  void *v0;
  void *v1;
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
  _QWORD v20[7];

  v20[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Inter-Pod Wave Delay"), CFSTR("interPodWaveDelay"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "between:and:", 0.0, 1.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "precision:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Upper Pod Relative Crossfade Duration"), CFSTR("upperPodRelativeCrossfadeDuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "between:and:", 0.0, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "precision:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Upper Pod Relative Stack Alpha Duration"), CFSTR("upperPodRelativeStackAlphaDuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "between:and:", 0.0, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "precision:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Relative Background Duration"), CFSTR("relativeBackgroundDuration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "between:and:", 0.0, 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "precision:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Relative Search Duration"), CFSTR("relativeSearchDuration"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "between:and:", 0.0, 1.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "precision:", 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Search Bar Scale"), CFSTR("searchScale"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "between:and:", 0.5, 1.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "precision:", 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = v2;
  v20[1] = v5;
  v20[2] = v8;
  v20[3] = v11;
  v20[4] = v14;
  v20[5] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

id __54__SBHLibraryWaveZoomSettings_settingsControllerModule__block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Retargeted Mass Settings"), CFSTR("retargetedMassSettings"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Retargeted Stiffness Settings"), CFSTR("retargetedStiffnessSettings"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Retargeted Initial Velocity Settings"), CFSTR("retargetedInitialVelocitySettings"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Retargeted Basic Duration Settings"), CFSTR("retargetedBasicDurationSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v0;
  v6[1] = v1;
  v6[2] = v2;
  v6[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __54__SBHLibraryWaveZoomSettings_settingsControllerModule__block_invoke_3()
{
  void *v0;
  void *v1;
  void *v2;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Curve Control Point 1"), CFSTR("zEffectControlPoint1Settings"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Curve Control Point 2"), CFSTR("zEffectControlPoint2Settings"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  v4[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __54__SBHLibraryWaveZoomSettings_settingsControllerModule__block_invoke_4()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Lower Pod Relative Fade Delay"), CFSTR("podRelativeFadeDelay"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "between:and:", 0.0, 1.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "precision:", 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)interPodWaveDelay
{
  return self->_interPodWaveDelay;
}

- (void)setInterPodWaveDelay:(double)a3
{
  self->_interPodWaveDelay = a3;
}

- (double)upperPodRelativeCrossfadeDuration
{
  return self->_upperPodRelativeCrossfadeDuration;
}

- (void)setUpperPodRelativeCrossfadeDuration:(double)a3
{
  self->_upperPodRelativeCrossfadeDuration = a3;
}

- (double)upperPodRelativeStackAlphaDuration
{
  return self->_upperPodRelativeStackAlphaDuration;
}

- (void)setUpperPodRelativeStackAlphaDuration:(double)a3
{
  self->_upperPodRelativeStackAlphaDuration = a3;
}

- (double)relativeBackgroundDuration
{
  return self->_relativeBackgroundDuration;
}

- (void)setRelativeBackgroundDuration:(double)a3
{
  self->_relativeBackgroundDuration = a3;
}

- (double)relativeSearchDuration
{
  return self->_relativeSearchDuration;
}

- (void)setRelativeSearchDuration:(double)a3
{
  self->_relativeSearchDuration = a3;
}

- (double)searchScale
{
  return self->_searchScale;
}

- (void)setSearchScale:(double)a3
{
  self->_searchScale = a3;
}

- (double)podRelativeFadeDelay
{
  return self->_podRelativeFadeDelay;
}

- (void)setPodRelativeFadeDelay:(double)a3
{
  self->_podRelativeFadeDelay = a3;
}

- (SBFAnimationSettings)podFadeSettings
{
  return self->_podFadeSettings;
}

- (void)setPodFadeSettings:(id)a3
{
  objc_storeStrong((id *)&self->_podFadeSettings, a3);
}

- (PTPointSettings)zEffectControlPoint1Settings
{
  return self->_zEffectControlPoint1Settings;
}

- (void)setZEffectControlPoint1Settings:(id)a3
{
  objc_storeStrong((id *)&self->_zEffectControlPoint1Settings, a3);
}

- (PTPointSettings)zEffectControlPoint2Settings
{
  return self->_zEffectControlPoint2Settings;
}

- (void)setZEffectControlPoint2Settings:(id)a3
{
  objc_storeStrong((id *)&self->_zEffectControlPoint2Settings, a3);
}

- (SBHInterpolationSettings)retargetedMassSettings
{
  return self->_retargetedMassSettings;
}

- (void)setRetargetedMassSettings:(id)a3
{
  objc_storeStrong((id *)&self->_retargetedMassSettings, a3);
}

- (SBHInterpolationSettings)retargetedStiffnessSettings
{
  return self->_retargetedStiffnessSettings;
}

- (void)setRetargetedStiffnessSettings:(id)a3
{
  objc_storeStrong((id *)&self->_retargetedStiffnessSettings, a3);
}

- (SBHInterpolationSettings)retargetedInitialVelocitySettings
{
  return self->_retargetedInitialVelocitySettings;
}

- (void)setRetargetedInitialVelocitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_retargetedInitialVelocitySettings, a3);
}

- (SBHInterpolationSettings)retargetedBasicDurationSettings
{
  return self->_retargetedBasicDurationSettings;
}

- (void)setRetargetedBasicDurationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_retargetedBasicDurationSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retargetedBasicDurationSettings, 0);
  objc_storeStrong((id *)&self->_retargetedInitialVelocitySettings, 0);
  objc_storeStrong((id *)&self->_retargetedStiffnessSettings, 0);
  objc_storeStrong((id *)&self->_retargetedMassSettings, 0);
  objc_storeStrong((id *)&self->_zEffectControlPoint2Settings, 0);
  objc_storeStrong((id *)&self->_zEffectControlPoint1Settings, 0);
  objc_storeStrong((id *)&self->_podFadeSettings, 0);
}

@end
