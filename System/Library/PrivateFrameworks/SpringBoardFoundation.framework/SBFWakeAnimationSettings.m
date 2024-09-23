@implementation SBFWakeAnimationSettings

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
  id v26;

  self->_backlightFadeDuration = 0.185;
  self->_speedMultiplierForWake = 1.0;
  self->_speedMultiplierForLiftToWake = 1.0;
  self->_speedMultiplierForMagicKeyboardExtended = 0.3;
  self->_awakeColorBrightness = 0.0;
  self->_awakeDateAlpha = 1.0;
  self->_sleepColorBrightness = -1.0;
  -[SBFWakeAnimationSettings contentWakeSettings](self, "contentWakeSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAnimationType:", 0);

  -[SBFWakeAnimationSettings contentWakeSettings](self, "contentWakeSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelay:", 0.0);

  -[SBFWakeAnimationSettings contentWakeSettings](self, "contentWakeSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDuration:", 0.185);

  -[SBFWakeAnimationSettings contentWakeSettings](self, "contentWakeSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCurve:", 393216);

  -[SBFWakeAnimationSettings contentWakeSettings](self, "contentWakeSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "controlPoint1Settings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPointValue:", 0.25, 0.1);

  -[SBFWakeAnimationSettings contentWakeSettings](self, "contentWakeSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "controlPoint2Settings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPointValue:", 0.25, 1.0);

  -[SBFWakeAnimationSettings awakeWallpaperFilterSettings](self, "awakeWallpaperFilterSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAnimationType:", 0);

  -[SBFWakeAnimationSettings awakeWallpaperFilterSettings](self, "awakeWallpaperFilterSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDelay:", 0.0);

  -[SBFWakeAnimationSettings awakeWallpaperFilterSettings](self, "awakeWallpaperFilterSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDuration:", 0.65);

  -[SBFWakeAnimationSettings awakeWallpaperFilterSettings](self, "awakeWallpaperFilterSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCurve:", 393216);

  -[SBFWakeAnimationSettings awakeWallpaperFilterSettings](self, "awakeWallpaperFilterSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "controlPoint1Settings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPointValue:", 0.25, 0.1);

  -[SBFWakeAnimationSettings awakeWallpaperFilterSettings](self, "awakeWallpaperFilterSettings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "controlPoint2Settings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setPointValue:", 0.25, 1.0);

  -[SBFWakeAnimationSettings sleepWallpaperFilterSettings](self, "sleepWallpaperFilterSettings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAnimationType:", 0);

  -[SBFWakeAnimationSettings sleepWallpaperFilterSettings](self, "sleepWallpaperFilterSettings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDelay:", 0.0);

  -[SBFWakeAnimationSettings sleepWallpaperFilterSettings](self, "sleepWallpaperFilterSettings");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setDuration:", 0.65);

  -[SBFWakeAnimationSettings sleepWallpaperFilterSettings](self, "sleepWallpaperFilterSettings");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCurve:", 393216);

  -[SBFWakeAnimationSettings sleepWallpaperFilterSettings](self, "sleepWallpaperFilterSettings");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "controlPoint1Settings");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setPointValue:", 0.25, 0.1);

  -[SBFWakeAnimationSettings sleepWallpaperFilterSettings](self, "sleepWallpaperFilterSettings");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "controlPoint2Settings");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setPointValue:", 0.25, 1.0);

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
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[5];
  void *v45;
  _QWORD v46[2];
  void *v47;
  _QWORD v48[2];
  _QWORD v49[6];

  v49[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Backlight Fade Duration"), CFSTR("backlightFadeDuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minValue:maxValue:", 0.0, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v4;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Backlight Fade In Speed Multiplier"), CFSTR("speedMultiplierForWake"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minValue:maxValue:", 0.0, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v6;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Lift-to-Wake Speed Multiplier"), CFSTR("speedMultiplierForLiftToWake"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minValue:maxValue:", 0.0, 10.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v8;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Magic Keyboard (Extended Wake) Speed Multiplier"), CFSTR("speedMultiplierForMagicKeyboardExtended"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minValue:maxValue:", 0.0, 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v11, CFSTR("Backlight Fades"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Awake Color Brightness"), CFSTR("awakeColorBrightness"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "minValue:maxValue:", -1.0, 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v14;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Awake Date Alpha"), CFSTR("awakeDateAlpha"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "minValue:maxValue:", 0.0, 1.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sectionWithRows:title:", v17, CFSTR("Awake Values"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Sleep Color Brightness"), CFSTR("sleepColorBrightness"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "minValue:maxValue:", -1.0, 1.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sectionWithRows:title:", v21, CFSTR("Sleep Values"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0D83070];
  +[SBFAnimationSettings _moduleWithSectionTitle:delay:frameRate:](SBFAnimationSettings, "_moduleWithSectionTitle:delay:frameRate:", CFSTR("Awake Content Animation"), 1, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "submoduleWithModule:childSettingsKeyPath:", v23, CFSTR("contentWakeSettings"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x1E0D83070];
  +[SBFAnimationSettings _moduleWithSectionTitle:delay:frameRate:](SBFAnimationSettings, "_moduleWithSectionTitle:delay:frameRate:", CFSTR("Awake Wallpaper Filter Animation"), 1, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "submoduleWithModule:childSettingsKeyPath:", v25, CFSTR("awakeWallpaperFilterSettings"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)MEMORY[0x1E0D83070];
  v46[0] = v40;
  v46[1] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "moduleWithTitle:contents:", CFSTR("Awake"), v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (void *)MEMORY[0x1E0D83070];
  +[SBFAnimationSettings _moduleWithSectionTitle:delay:frameRate:](SBFAnimationSettings, "_moduleWithSectionTitle:delay:frameRate:", CFSTR("Sleep Wallpaper Filter Animation"), 1, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "submoduleWithModule:childSettingsKeyPath:", v31, CFSTR("sleepWallpaperFilterSettings"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = (void *)MEMORY[0x1E0D83070];
  v45 = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "moduleWithTitle:contents:", CFSTR("Undim"), v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = (void *)MEMORY[0x1E0D83070];
  v44[0] = v43;
  v44[1] = v42;
  v44[2] = v29;
  v44[3] = v41;
  v44[4] = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 5);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "moduleWithTitle:contents:", CFSTR("Screen Dim/Undim Animation"), v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

- (double)backlightFadeDuration
{
  return self->_backlightFadeDuration;
}

- (void)setBacklightFadeDuration:(double)a3
{
  self->_backlightFadeDuration = a3;
}

- (double)speedMultiplierForWake
{
  return self->_speedMultiplierForWake;
}

- (void)setSpeedMultiplierForWake:(double)a3
{
  self->_speedMultiplierForWake = a3;
}

- (double)speedMultiplierForLiftToWake
{
  return self->_speedMultiplierForLiftToWake;
}

- (void)setSpeedMultiplierForLiftToWake:(double)a3
{
  self->_speedMultiplierForLiftToWake = a3;
}

- (double)speedMultiplierForMagicKeyboardExtended
{
  return self->_speedMultiplierForMagicKeyboardExtended;
}

- (void)setSpeedMultiplierForMagicKeyboardExtended:(double)a3
{
  self->_speedMultiplierForMagicKeyboardExtended = a3;
}

- (SBFAnimationSettings)contentWakeSettings
{
  return self->_contentWakeSettings;
}

- (void)setContentWakeSettings:(id)a3
{
  objc_storeStrong((id *)&self->_contentWakeSettings, a3);
}

- (double)awakeColorBrightness
{
  return self->_awakeColorBrightness;
}

- (void)setAwakeColorBrightness:(double)a3
{
  self->_awakeColorBrightness = a3;
}

- (double)awakeDateAlpha
{
  return self->_awakeDateAlpha;
}

- (void)setAwakeDateAlpha:(double)a3
{
  self->_awakeDateAlpha = a3;
}

- (SBFAnimationSettings)awakeWallpaperFilterSettings
{
  return self->_awakeWallpaperFilterSettings;
}

- (void)setAwakeWallpaperFilterSettings:(id)a3
{
  objc_storeStrong((id *)&self->_awakeWallpaperFilterSettings, a3);
}

- (double)sleepColorBrightness
{
  return self->_sleepColorBrightness;
}

- (void)setSleepColorBrightness:(double)a3
{
  self->_sleepColorBrightness = a3;
}

- (SBFAnimationSettings)sleepWallpaperFilterSettings
{
  return self->_sleepWallpaperFilterSettings;
}

- (void)setSleepWallpaperFilterSettings:(id)a3
{
  objc_storeStrong((id *)&self->_sleepWallpaperFilterSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepWallpaperFilterSettings, 0);
  objc_storeStrong((id *)&self->_awakeWallpaperFilterSettings, 0);
  objc_storeStrong((id *)&self->_contentWakeSettings, 0);
}

@end
