@implementation PUCompositeVideoSettings

- (void)setNonStitchingFadeDuration:(double)a3
{
  self->_nonStitchingFadeDuration = a3;
}

- (void)setDefaultValues
{
  -[PUCompositeVideoSettings setUseFrameBlending:](self, "setUseFrameBlending:", 0);
  -[PUCompositeVideoSettings setCropMode:](self, "setCropMode:", 0);
  -[PUCompositeVideoSettings setStitchingFadeDuration:](self, "setStitchingFadeDuration:", 0.25);
  -[PUCompositeVideoSettings setNonStitchingFadeDuration:](self, "setNonStitchingFadeDuration:", 0.5);
}

- (void)setUseFrameBlending:(BOOL)a3
{
  self->_useFrameBlending = a3;
}

- (void)setStitchingFadeDuration:(double)a3
{
  self->_stitchingFadeDuration = a3;
}

- (void)setCropMode:(int64_t)a3
{
  self->_cropMode = a3;
}

+ (PUCompositeVideoSettings)sharedInstance
{
  if (sharedInstance_onceToken_91082 != -1)
    dispatch_once(&sharedInstance_onceToken_91082, &__block_literal_global_91083);
  return (PUCompositeVideoSettings *)(id)sharedInstance_sharedInstance_91084;
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
  _QWORD v25[3];
  void *v26;
  void *v27;
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D830B8];
  objc_msgSend(MEMORY[0x1E0D830D0], "rowWithTitle:valueKeyPath:", CFSTR("Stitch Fade"), CFSTR("stitchingFadeDuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minValue:maxValue:", 0.0, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v4;
  objc_msgSend(MEMORY[0x1E0D830D0], "rowWithTitle:valueKeyPath:", CFSTR("Concat Fade"), CFSTR("nonStitchingFadeDuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minValue:maxValue:", 0.0, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v6;
  objc_msgSend(MEMORY[0x1E0D830B0], "rowWithTitle:valueKeyPath:", CFSTR("Crop Mode"), CFSTR("cropMode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "possibleValues:titles:", &unk_1E59BA930, &unk_1E59BA948);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v9, CFSTR("Rendering"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0D830B8];
  objc_msgSend(MEMORY[0x1E0D830D8], "rowWithTitle:valueKeyPath:", CFSTR("Use Frame Blending In Preview"), CFSTR("useFrameBlending"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sectionWithRows:title:", v13, CFSTR("Playback"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0D83078];
  v16 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rowWithTitle:action:", CFSTR("Restore Defaults"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sectionWithRows:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0D83078];
  v25[0] = v10;
  v25[1] = v14;
  v25[2] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "moduleWithTitle:contents:", CFSTR("Composite Video"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

void __42__PUCompositeVideoSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "compositeVideoSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_91084;
  sharedInstance_sharedInstance_91084 = v0;

}

- (id)parentSettings
{
  return +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
}

- (BOOL)useFrameBlending
{
  return self->_useFrameBlending;
}

- (int64_t)cropMode
{
  return self->_cropMode;
}

- (double)stitchingFadeDuration
{
  return self->_stitchingFadeDuration;
}

- (double)nonStitchingFadeDuration
{
  return self->_nonStitchingFadeDuration;
}

@end
