@implementation ISVitalitySettings

- (ISVitalitySpecificSettings)activityViewSettings
{
  return self->_activityViewSettings;
}

- (ISVitalitySpecificSettings)oneUpSettings
{
  return self->_oneUpSettings;
}

- (ISVitalitySpecificSettings)orbPreviewSettings
{
  return self->_orbPreviewSettings;
}

- (void)setDefaultValues
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ISVitalitySettings;
  -[PTSettings setDefaultValues](&v8, sel_setDefaultValues);
  -[ISVitalitySettings setUseLegacyBehavior:](self, "setUseLegacyBehavior:", 0);
  -[ISVitalitySettings setShouldPreroll:](self, "setShouldPreroll:", 1);
  LODWORD(v3) = 0;
  -[ISVitalitySettings setVitalityTransitionScoreMinimumValueForPlayback:](self, "setVitalityTransitionScoreMinimumValueForPlayback:", v3);
  -[ISVitalitySettings oneUpSettings](self, "oneUpSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMinimumVisibilityFactor:", 0.05);
  -[ISVitalitySettings shareViewSettings](self, "shareViewSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMinimumVisibilityFactor:", 0.7);
  -[ISVitalitySettings activityViewSettings](self, "activityViewSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPreDuration:", 0.35);
  objc_msgSend(v6, "setMinimumVisibilityFactor:", 0.7);
  -[ISVitalitySettings orbPreviewSettings](self, "orbPreviewSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreDuration:", 0.65);
  objc_msgSend(v7, "setPlaybackRate:", 1.0);

}

- (int64_t)behavior
{
  void *v4;
  int64_t v5;

  if (-[ISVitalitySettings useLegacyBehavior](self, "useLegacyBehavior"))
    return 0;
  -[ISVitalitySettings _defaultSettings](self, "_defaultSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "behavior");

  return v5;
}

- (double)preDuration
{
  void *v4;
  double v5;
  double v6;

  if (-[ISVitalitySettings useLegacyBehavior](self, "useLegacyBehavior"))
    return 1.5;
  -[ISVitalitySettings _defaultSettings](self, "_defaultSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preDuration");
  v6 = v5;

  return v6;
}

- (double)postDuration
{
  void *v4;
  double v5;
  double v6;

  if (-[ISVitalitySettings useLegacyBehavior](self, "useLegacyBehavior"))
    return 1.5;
  -[ISVitalitySettings _defaultSettings](self, "_defaultSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postDuration");
  v6 = v5;

  return v6;
}

- (double)minimumPhotoTransitionDuration
{
  void *v2;
  double v3;
  double v4;

  -[ISVitalitySettings _defaultSettings](self, "_defaultSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minimumPhotoTransitionDuration");
  v4 = v3;

  return v4;
}

- (double)playbackRate
{
  void *v2;
  double v3;
  double v4;

  -[ISVitalitySettings _defaultSettings](self, "_defaultSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playbackRate");
  v4 = v3;

  return v4;
}

- (double)endTimeOffset
{
  void *v2;
  double v3;
  double v4;

  -[ISVitalitySettings _defaultSettings](self, "_defaultSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endTimeOffset");
  v4 = v3;

  return v4;
}

- (double)minimumVisibilityFactor
{
  void *v2;
  double v3;
  double v4;

  -[ISVitalitySettings _defaultSettings](self, "_defaultSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minimumVisibilityFactor");
  v4 = v3;

  return v4;
}

- (double)maximumDelayBeforePlayback
{
  void *v2;
  double v3;
  double v4;

  -[ISVitalitySettings _defaultSettings](self, "_defaultSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maximumDelayBeforePlayback");
  v4 = v3;

  return v4;
}

- (double)maxVitalityDelay
{
  void *v2;
  double v3;
  double v4;

  -[ISVitalitySettings _defaultSettings](self, "_defaultSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maxVitalityDelay");
  v4 = v3;

  return v4;
}

- (BOOL)shouldPreroll
{
  return self->_shouldPreroll;
}

- (void)setShouldPreroll:(BOOL)a3
{
  self->_shouldPreroll = a3;
}

- (float)vitalityTransitionScoreMinimumValueForPlayback
{
  return self->_vitalityTransitionScoreMinimumValueForPlayback;
}

- (void)setVitalityTransitionScoreMinimumValueForPlayback:(float)a3
{
  self->_vitalityTransitionScoreMinimumValueForPlayback = a3;
}

- (BOOL)useLegacyBehavior
{
  return self->_useLegacyBehavior;
}

- (void)setUseLegacyBehavior:(BOOL)a3
{
  self->_useLegacyBehavior = a3;
}

- (void)setOneUpSettings:(id)a3
{
  objc_storeStrong((id *)&self->_oneUpSettings, a3);
}

- (ISVitalitySpecificSettings)shareViewSettings
{
  return self->_shareViewSettings;
}

- (void)setShareViewSettings:(id)a3
{
  objc_storeStrong((id *)&self->_shareViewSettings, a3);
}

- (void)setActivityViewSettings:(id)a3
{
  objc_storeStrong((id *)&self->_activityViewSettings, a3);
}

- (void)setOrbPreviewSettings:(id)a3
{
  objc_storeStrong((id *)&self->_orbPreviewSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orbPreviewSettings, 0);
  objc_storeStrong((id *)&self->_activityViewSettings, 0);
  objc_storeStrong((id *)&self->_shareViewSettings, 0);
  objc_storeStrong((id *)&self->_oneUpSettings, 0);
}

+ (ISVitalitySettings)sharedInstance
{
  void *v2;
  void *v3;

  +[ISRootSettings sharedInstance](ISRootSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vitalitySettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ISVitalitySettings *)v3;
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
  _QWORD v26[3];
  void *v27;
  _QWORD v28[3];
  _QWORD v29[5];

  v29[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Use Legacy Behavior"), CFSTR("useLegacyBehavior"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v3;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Preroll"), CFSTR("shouldPreroll"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v4;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Min Vitality Score"), CFSTR("vitalityTransitionScoreMinimumValueForPlayback"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minValue:maxValue:", 0.0, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v6;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Preroll"), CFSTR("shouldPreroll"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("One Up"), CFSTR("oneUpSettings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v11;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Share View"), CFSTR("shareViewSettings"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v12;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Activity View"), CFSTR("activityViewSettings"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sectionWithRows:title:conditionFormat:", v14, CFSTR("Specific Settings"), CFSTR("useLegacyBehavior == 0"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0D83078];
  v17 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "rowWithTitle:action:", CFSTR("Restore Defaults"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sectionWithRows:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0D83078];
  v26[0] = v9;
  v26[1] = v15;
  v26[2] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "moduleWithTitle:contents:", CFSTR("Vitality"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

@end
