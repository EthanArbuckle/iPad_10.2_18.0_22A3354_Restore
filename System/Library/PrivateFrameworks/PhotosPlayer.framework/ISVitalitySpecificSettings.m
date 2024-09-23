@implementation ISVitalitySpecificSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISVitalitySpecificSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[ISVitalitySpecificSettings setBehavior:](self, "setBehavior:", 4);
  -[ISVitalitySpecificSettings setPreDuration:](self, "setPreDuration:", 0.65);
  -[ISVitalitySpecificSettings setPlaybackRate:](self, "setPlaybackRate:", 1.0);
  -[ISVitalitySpecificSettings setEndTimeOffset:](self, "setEndTimeOffset:", -0.135);
  -[ISVitalitySpecificSettings setMinimumVisibilityFactor:](self, "setMinimumVisibilityFactor:", 0.7);
  -[ISVitalitySpecificSettings setMaximumDelayBeforePlayback:](self, "setMaximumDelayBeforePlayback:", 0.2);
  -[ISVitalitySpecificSettings setPostDuration:](self, "setPostDuration:", 0.0);
  -[ISVitalitySpecificSettings setStartSeekTolerance:](self, "setStartSeekTolerance:", 0.3);
  -[ISVitalitySpecificSettings setMinimumPhotoTransitionDuration:](self, "setMinimumPhotoTransitionDuration:", 0.25);
  -[ISVitalitySpecificSettings setMaxVitalityDelay:](self, "setMaxVitalityDelay:", 0.1);
}

- (void)setStartSeekTolerance:(double)a3
{
  self->_startSeekTolerance = a3;
}

- (void)setPreDuration:(double)a3
{
  self->_preDuration = a3;
}

- (void)setPostDuration:(double)a3
{
  self->_postDuration = a3;
}

- (void)setPlaybackRate:(double)a3
{
  self->_playbackRate = a3;
}

- (void)setMinimumVisibilityFactor:(double)a3
{
  self->_minimumVisibilityFactor = a3;
}

- (void)setMinimumPhotoTransitionDuration:(double)a3
{
  self->_minimumPhotoTransitionDuration = a3;
}

- (void)setMaximumDelayBeforePlayback:(double)a3
{
  self->_maximumDelayBeforePlayback = a3;
}

- (void)setMaxVitalityDelay:(double)a3
{
  self->_maxVitalityDelay = a3;
}

- (void)setEndTimeOffset:(double)a3
{
  self->_endTimeOffset = a3;
}

- (void)setBehavior:(int64_t)a3
{
  self->_behavior = a3;
}

- (int64_t)behavior
{
  return self->_behavior;
}

- (double)preDuration
{
  return self->_preDuration;
}

- (double)postDuration
{
  return self->_postDuration;
}

- (double)startSeekTolerance
{
  return self->_startSeekTolerance;
}

- (double)playbackRate
{
  return self->_playbackRate;
}

- (double)endTimeOffset
{
  return self->_endTimeOffset;
}

- (double)minimumVisibilityFactor
{
  return self->_minimumVisibilityFactor;
}

- (double)maximumDelayBeforePlayback
{
  return self->_maximumDelayBeforePlayback;
}

- (double)maxVitalityDelay
{
  return self->_maxVitalityDelay;
}

- (double)minimumPhotoTransitionDuration
{
  return self->_minimumPhotoTransitionDuration;
}

+ (ISVitalitySpecificSettings)sharedInstance
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
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
  _QWORD v51[12];

  v51[10] = *MEMORY[0x1E0C80C00];
  v35 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Max Delay"), CFSTR("maxVitalityDelay"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "minValue:maxValue:", 0.0, 0.25);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "is_increment:", 0.05);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v47;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Min. Photo Transition Duration"), CFSTR("minimumPhotoTransitionDuration"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "minValue:maxValue:", 0.0, 1.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "is_increment:", 0.05);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v44;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Behavior"), CFSTR("behavior"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "possibleValues:titles:", &unk_1E945FFF0, &unk_1E9460008);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v51[2] = v42;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Start Seek Tolerance"), CFSTR("startSeekTolerance"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "minValue:maxValue:", 0.0, 2.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  __54__ISVitalitySpecificSettings_settingsControllerModule__block_invoke(&unk_1E9460020);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "condition:", v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v51[3] = v38;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Post Duration"), CFSTR("postDuration"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "minValue:maxValue:", 0.0, 2.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  __54__ISVitalitySpecificSettings_settingsControllerModule__block_invoke(&unk_1E9460038);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "condition:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v51[4] = v32;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Pre Duration"), CFSTR("preDuration"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "minValue:maxValue:", 0.2, 1.6);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "is_increment:", 0.05);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  __54__ISVitalitySpecificSettings_settingsControllerModule__block_invoke(&unk_1E9460050);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "condition:", v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v51[5] = v27;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Playback Rate"), CFSTR("playbackRate"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "minValue:maxValue:", 0.5, 3.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "is_increment:", 0.1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  __54__ISVitalitySpecificSettings_settingsControllerModule__block_invoke(&unk_1E9460068);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "condition:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v51[6] = v22;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("End Time Offset"), CFSTR("endTimeOffset"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "minValue:maxValue:", -0.5, 0.1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "is_increment:", 0.05);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  __54__ISVitalitySpecificSettings_settingsControllerModule__block_invoke(&unk_1E9460080);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "condition:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v51[7] = v17;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Minimum Visibility"), CFSTR("minimumVisibilityFactor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "minValue:maxValue:", 0.0, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "is_increment:", 0.05);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __54__ISVitalitySpecificSettings_settingsControllerModule__block_invoke(&unk_1E9460098);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "condition:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v51[8] = v5;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Maximum Delay Before Playback"), CFSTR("maximumDelayBeforePlayback"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minValue:maxValue:", 0.0, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "is_increment:", 0.01);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __54__ISVitalitySpecificSettings_settingsControllerModule__block_invoke(&unk_1E94600B0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "condition:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v51[9] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "sectionWithRows:title:", v11, CFSTR("Settings"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D83078];
  v50 = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "moduleWithTitle:contents:", CFSTR("Vitality Behavior"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __54__ISVitalitySpecificSettings_settingsControllerModule__block_invoke(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("behavior == %@"), *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
