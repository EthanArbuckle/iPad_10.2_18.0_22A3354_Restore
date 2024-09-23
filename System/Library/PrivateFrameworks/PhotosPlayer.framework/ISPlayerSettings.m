@implementation ISPlayerSettings

- (void)setDefaultValues
{
  double v3;
  uint64_t v4;
  void *v5;
  int v6;
  __int128 *v7;
  uint64_t v8;
  objc_super v9;
  __int128 v10;
  int v11;
  __int128 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)ISPlayerSettings;
  -[PTSettings setDefaultValues](&v9, sel_setDefaultValues);
  -[ISPlayerSettings setVitalityEaseDuration:](self, "setVitalityEaseDuration:", 0.25);
  LODWORD(v3) = 1045220557;
  -[ISPlayerSettings setVitalityEaseMinRate:](self, "setVitalityEaseMinRate:", v3);
  -[ISPlayerSettings setLoopingEnabled:](self, "setLoopingEnabled:", 0);
  -[ISPlayerSettings setCrossfadeEnabled:](self, "setCrossfadeEnabled:", 0);
  v4 = 1;
  -[ISPlayerSettings setAudioEnabled:](self, "setAudioEnabled:", 1);
  -[ISPlayerSettings setPrerollBeforePlaying:](self, "setPrerollBeforePlaying:", 0);
  -[ISPlayerSettings setUseDedicatedQueues:](self, "setUseDedicatedQueues:", 1);
  v5 = (void *)MGGetStringAnswer();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("iPad"));

  if (v6)
  {
    v13 = -1157300313;
    v12 = xmmword_1D2DF5070;
    v11 = -2132668294;
    v10 = xmmword_1D2DF5084;
    v7 = &v10;
    v8 = 0;
    v4 = MGIsDeviceOneOfType();
  }
  -[ISPlayerSettings setAllowFrameBlending:](self, "setAllowFrameBlending:", v4, v7, v8);
  -[ISPlayerSettings setAllowVideoPreRoll:](self, "setAllowVideoPreRoll:", 1);
  -[ISPlayerSettings setShowStateOverlay:](self, "setShowStateOverlay:", 0);
  -[ISPlayerSettings setForceScrubRewindFactor:](self, "setForceScrubRewindFactor:", 2.0);
  -[ISPlayerSettings setForceScrubMinRateChange:](self, "setForceScrubMinRateChange:", 0.01);
  -[ISPlayerSettings setForceScrubMinimumRate:](self, "setForceScrubMinimumRate:", 0.5);
  -[ISPlayerSettings setForceScrubMaximumInteractiveRate:](self, "setForceScrubMaximumInteractiveRate:", 2.0);
  -[ISPlayerSettings setPlayDuringHint:](self, "setPlayDuringHint:", 1);
  -[ISPlayerSettings setPlayIsSticky:](self, "setPlayIsSticky:", 0);
  -[ISPlayerSettings setScaleDuringPlayback:](self, "setScaleDuringPlayback:", 1);
  -[ISPlayerSettings setEasingEnabled:](self, "setEasingEnabled:", 0);
  -[ISPlayerSettings setLongExposureVitality:](self, "setLongExposureVitality:", 1);
}

+ (id)sharedInstance
{
  void *v2;
  void *v3;

  +[ISRootSettings sharedInstance](ISRootSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playerSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)easingEnabled
{
  return self->_easingEnabled;
}

- (void)setEasingEnabled:(BOOL)a3
{
  self->_easingEnabled = a3;
}

- (double)vitalityEaseDuration
{
  return self->_vitalityEaseDuration;
}

- (void)setVitalityEaseDuration:(double)a3
{
  self->_vitalityEaseDuration = a3;
}

- (float)vitalityEaseMinRate
{
  return self->_vitalityEaseMinRate;
}

- (void)setVitalityEaseMinRate:(float)a3
{
  self->_vitalityEaseMinRate = a3;
}

- (int64_t)startBehavior
{
  return self->_startBehavior;
}

- (void)setStartBehavior:(int64_t)a3
{
  self->_startBehavior = a3;
}

- (BOOL)scaleDuringPlayback
{
  return self->_scaleDuringPlayback;
}

- (void)setScaleDuringPlayback:(BOOL)a3
{
  self->_scaleDuringPlayback = a3;
}

- (BOOL)loopingEnabled
{
  return self->_loopingEnabled;
}

- (void)setLoopingEnabled:(BOOL)a3
{
  self->_loopingEnabled = a3;
}

- (BOOL)crossfadeEnabled
{
  return self->_crossfadeEnabled;
}

- (void)setCrossfadeEnabled:(BOOL)a3
{
  self->_crossfadeEnabled = a3;
}

- (BOOL)audioEnabled
{
  return self->_audioEnabled;
}

- (void)setAudioEnabled:(BOOL)a3
{
  self->_audioEnabled = a3;
}

- (BOOL)playIsSticky
{
  return self->_playIsSticky;
}

- (void)setPlayIsSticky:(BOOL)a3
{
  self->_playIsSticky = a3;
}

- (BOOL)longExposureVitality
{
  return self->_longExposureVitality;
}

- (void)setLongExposureVitality:(BOOL)a3
{
  self->_longExposureVitality = a3;
}

- (BOOL)playDuringHint
{
  return self->_playDuringHint;
}

- (void)setPlayDuringHint:(BOOL)a3
{
  self->_playDuringHint = a3;
}

- (BOOL)showStateOverlay
{
  return self->_showStateOverlay;
}

- (void)setShowStateOverlay:(BOOL)a3
{
  self->_showStateOverlay = a3;
}

- (BOOL)prerollBeforePlaying
{
  return self->_prerollBeforePlaying;
}

- (void)setPrerollBeforePlaying:(BOOL)a3
{
  self->_prerollBeforePlaying = a3;
}

- (BOOL)useDedicatedQueues
{
  return self->_useDedicatedQueues;
}

- (void)setUseDedicatedQueues:(BOOL)a3
{
  self->_useDedicatedQueues = a3;
}

- (BOOL)allowFrameBlending
{
  return self->_allowFrameBlending;
}

- (void)setAllowFrameBlending:(BOOL)a3
{
  self->_allowFrameBlending = a3;
}

- (BOOL)allowVideoPreRoll
{
  return self->_allowVideoPreRoll;
}

- (void)setAllowVideoPreRoll:(BOOL)a3
{
  self->_allowVideoPreRoll = a3;
}

- (double)forceScrubRewindFactor
{
  return self->_forceScrubRewindFactor;
}

- (void)setForceScrubRewindFactor:(double)a3
{
  self->_forceScrubRewindFactor = a3;
}

- (double)forceScrubMinRateChange
{
  return self->_forceScrubMinRateChange;
}

- (void)setForceScrubMinRateChange:(double)a3
{
  self->_forceScrubMinRateChange = a3;
}

- (double)forceScrubMinimumRate
{
  return self->_forceScrubMinimumRate;
}

- (void)setForceScrubMinimumRate:(double)a3
{
  self->_forceScrubMinimumRate = a3;
}

- (double)forceScrubMaximumInteractiveRate
{
  return self->_forceScrubMaximumInteractiveRate;
}

- (void)setForceScrubMaximumInteractiveRate:(double)a3
{
  self->_forceScrubMaximumInteractiveRate = a3;
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
  _QWORD v54[2];
  void *v55;
  _QWORD v56[22];

  v56[20] = *MEMORY[0x1E0C80C00];
  v40 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Easing Enabled"), CFSTR("easingEnabled"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v53;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Long Exposure Vitality"), CFSTR("longExposureVitality"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v52;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Vitality Ease Duration"), CFSTR("vitalityEaseDuration"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "minValue:maxValue:", 0.1, 0.5);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "is_increment:", 0.05);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("easingEnabled == YES"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "condition:", v48);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v56[2] = v47;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Vitality Ease Min Rate"), CFSTR("vitalityEaseMinRate"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "minValue:maxValue:", 0.100000001, 1.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "is_increment:", 0.0500000007);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("easingEnabled == YES"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "condition:", v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v56[3] = v42;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Playback Starts…"), CFSTR("startBehavior"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "possibleValues:titles:", &unk_1E945FFC0, &unk_1E945FFD8);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v56[4] = v38;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Scale During Playback"), CFSTR("scaleDuringPlayback"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v56[5] = v37;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Looping Enabled"), CFSTR("loopingEnabled"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v56[6] = v36;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Crossfade Enabled"), CFSTR("crossfadeEnabled"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("loopingEnabled == YES"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "condition:", v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v56[7] = v33;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Audio Enabled"), CFSTR("audioEnabled"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v56[8] = v32;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Sticky Play"), CFSTR("playIsSticky"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v56[9] = v31;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("State Overlay"), CFSTR("showStateOverlay"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v56[10] = v30;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Live Hint"), CFSTR("playDuringHint"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v56[11] = v29;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Use Dedicated Queues"), CFSTR("useDedicatedQueues"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v56[12] = v28;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Preroll Before Playing"), CFSTR("prerollBeforePlaying"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v56[13] = v27;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Frame Blending"), CFSTR("allowFrameBlending"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v56[14] = v26;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Video Preroll"), CFSTR("allowVideoPreRoll"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v56[15] = v25;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Force Scrub Rewind Factor"), CFSTR("forceScrubRewindFactor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "minValue:maxValue:", 0.0, 10.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "is_increment:", 0.00999999978);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v56[16] = v22;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Force Scrub Min Rate Change"), CFSTR("forceScrubMinRateChange"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minValue:maxValue:", 0.0, 0.100000001);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "is_increment:", 0.0000999999975);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v56[17] = v4;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Force Scrub Minimum Rate"), CFSTR("forceScrubMinimumRate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minValue:maxValue:", 0.0, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "is_increment:", 0.100000001);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v56[18] = v7;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Force Scrub Maximum Interactive Rate"), CFSTR("forceScrubMaximumInteractiveRate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minValue:maxValue:", 0.0, 8.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "is_increment:", 0.100000001);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v56[19] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "sectionWithRows:", v11);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D83078];
  v13 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rowWithTitle:action:", CFSTR("Restore Defaults"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sectionWithRows:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0D83078];
  v54[0] = v41;
  v54[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "moduleWithTitle:contents:", CFSTR("Player"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

@end
