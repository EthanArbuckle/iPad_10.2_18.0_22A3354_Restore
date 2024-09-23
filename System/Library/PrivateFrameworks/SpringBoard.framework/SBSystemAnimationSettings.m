@implementation SBSystemAnimationSettings

- (void)setDefaultValues
{
  double v2;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  LODWORD(v2) = 1050253722;
  -[SBSystemAnimationSettings setAssistantAnimationDuration:](self, "setAssistantAnimationDuration:", v2);
  LODWORD(v4) = 0.5;
  -[SBSystemAnimationSettings setAssistantDismissAnimationDurationOverApp:](self, "setAssistantDismissAnimationDurationOverApp:", v4);
  LODWORD(v5) = 1109393408;
  -[SBSystemAnimationSettings setAssistantBottomEdgeDismissThreshold:](self, "setAssistantBottomEdgeDismissThreshold:", v5);
  LODWORD(v6) = 1137180672;
  -[SBSystemAnimationSettings setAssistantBottomEdgeDismissVelocity:](self, "setAssistantBottomEdgeDismissVelocity:", v6);
  LODWORD(v7) = 1053609165;
  -[SBSystemAnimationSettings setSpotlightNoninteractiveAnimationDuration:](self, "setSpotlightNoninteractiveAnimationDuration:", v7);
  -[SBSystemAnimationSettings slideoverDosidoAnimationSettings](self, "slideoverDosidoAnimationSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAnimationType:", 1);

  -[SBSystemAnimationSettings slideoverDosidoAnimationSettings](self, "slideoverDosidoAnimationSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelay:", 0.0);

  -[SBSystemAnimationSettings slideoverDosidoAnimationSettings](self, "slideoverDosidoAnimationSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDuration:", 0.58);

  -[SBSystemAnimationSettings slideoverDosidoAnimationSettings](self, "slideoverDosidoAnimationSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMass:", 4.0);

  -[SBSystemAnimationSettings slideoverDosidoAnimationSettings](self, "slideoverDosidoAnimationSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setStiffness:", 1000.0);

  -[SBSystemAnimationSettings slideoverDosidoAnimationSettings](self, "slideoverDosidoAnimationSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDamping:", 500.0);

  -[SBSystemAnimationSettings slideoverDosidoAnimationSettings](self, "slideoverDosidoAnimationSettings");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCurve:", 0x10000);

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
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[6];
  void *v42;
  _QWORD v43[2];
  _QWORD v44[6];
  _QWORD v45[3];

  v45[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Wake Animation"), CFSTR("wakeAnimationSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:", v4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Siri Present/Dismiss Duration"), CFSTR("assistantAnimationDuration"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "minValue:maxValue:", 0.0, 1.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v38;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Siri Present/Dismiss Duration"), CFSTR("assistantAnimationDuration"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "between:and:", 0.0, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v5;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Siri Dismiss Duration (over app)"), CFSTR("assistantDismissAnimationDurationOverApp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minValue:maxValue:", 0.0, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v7;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Siri Dismiss Duration (over app)"), CFSTR("assistantDismissAnimationDurationOverApp"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "between:and:", 0.0, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v44[3] = v9;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Siri Dismiss Bottom Edge Threshold"), CFSTR("assistantBottomEdgeDismissThreshold"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "between:and:", 0.0, 1000.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v44[4] = v11;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Siri Dismiss Bottom Edge Velocity"), CFSTR("assistantBottomEdgeDismissVelocity"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "between:and:", 0.0, 9000.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v44[5] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83070], "sectionWithRows:title:", v14, CFSTR("Siri"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Spotlight Non-interactive Animation"), CFSTR("spotlightNoninteractiveAnimationDuration"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "minValue:maxValue:", 0.0, 1.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v17;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Spotlight Non-interactive Animation"), CFSTR("spotlightNoninteractiveAnimationDuration"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "between:and:", 0.0, 1.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83070], "sectionWithRows:title:", v20, CFSTR("Spotlight"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0DA9D80], "_moduleWithSectionTitle:delay:frameRate:", CFSTR("Slideover Dosido"), 0, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "submoduleWithModule:childSettingsKeyPath:", v23, CFSTR("slideoverDosidoAnimationSettings"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)MEMORY[0x1E0D83070];
  +[SBEntityRemovalAnimationSettings settingsControllerModule](SBEntityRemovalAnimationSettings, "settingsControllerModule");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "submoduleWithModule:childSettingsKeyPath:", v26, CFSTR("entityRemovalAnimationSettings"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "rowWithTitle:action:", CFSTR("Restore Defaults"), v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83070], "sectionWithRows:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)MEMORY[0x1E0D83070];
  v41[0] = v40;
  v41[1] = v15;
  v41[2] = v21;
  v41[3] = v27;
  v41[4] = v24;
  v41[5] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 6);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "moduleWithTitle:contents:", CFSTR("System Animations"), v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

- (float)assistantAnimationDuration
{
  return self->_assistantAnimationDuration;
}

- (void)setAssistantAnimationDuration:(float)a3
{
  self->_assistantAnimationDuration = a3;
}

- (float)assistantDismissAnimationDurationOverApp
{
  return self->_assistantDismissAnimationDurationOverApp;
}

- (void)setAssistantDismissAnimationDurationOverApp:(float)a3
{
  self->_assistantDismissAnimationDurationOverApp = a3;
}

- (float)assistantBottomEdgeDismissThreshold
{
  return self->_assistantBottomEdgeDismissThreshold;
}

- (void)setAssistantBottomEdgeDismissThreshold:(float)a3
{
  self->_assistantBottomEdgeDismissThreshold = a3;
}

- (float)assistantBottomEdgeDismissVelocity
{
  return self->_assistantBottomEdgeDismissVelocity;
}

- (void)setAssistantBottomEdgeDismissVelocity:(float)a3
{
  self->_assistantBottomEdgeDismissVelocity = a3;
}

- (float)spotlightNoninteractiveAnimationDuration
{
  return self->_spotlightNoninteractiveAnimationDuration;
}

- (void)setSpotlightNoninteractiveAnimationDuration:(float)a3
{
  self->_spotlightNoninteractiveAnimationDuration = a3;
}

- (SBFAnimationSettings)slideoverDosidoAnimationSettings
{
  return self->_slideoverDosidoAnimationSettings;
}

- (void)setSlideoverDosidoAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_slideoverDosidoAnimationSettings, a3);
}

- (SBEntityRemovalAnimationSettings)entityRemovalAnimationSettings
{
  return self->_entityRemovalAnimationSettings;
}

- (void)setEntityRemovalAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_entityRemovalAnimationSettings, a3);
}

- (SBFWakeAnimationSettings)wakeAnimationSettings
{
  return self->_wakeAnimationSettings;
}

- (void)setWakeAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_wakeAnimationSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wakeAnimationSettings, 0);
  objc_storeStrong((id *)&self->_entityRemovalAnimationSettings, 0);
  objc_storeStrong((id *)&self->_slideoverDosidoAnimationSettings, 0);
}

@end
