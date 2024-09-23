@implementation SBRecordingIndicatorSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBRecordingIndicatorSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[SBRecordingIndicatorSettings setSensorType:](self, "setSensorType:", 0);
  -[SBRecordingIndicatorSettings setDelayBeforeFadeOut90:](self, "setDelayBeforeFadeOut90:", 0.01);
  -[SBRecordingIndicatorSettings setFadeOutDuration90:](self, "setFadeOutDuration90:", 0.03);
  -[SBRecordingIndicatorSettings setDelayBeforeFadeIn90:](self, "setDelayBeforeFadeIn90:", 0.25);
  -[SBRecordingIndicatorSettings setFadeInDuration90:](self, "setFadeInDuration90:", 0.2);
  -[SBRecordingIndicatorSettings setDelayBeforeFadeOut180:](self, "setDelayBeforeFadeOut180:", 0.01);
  -[SBRecordingIndicatorSettings setFadeOutDuration180:](self, "setFadeOutDuration180:", 0.03);
  -[SBRecordingIndicatorSettings setDelayBeforeFadeIn180:](self, "setDelayBeforeFadeIn180:", 0.65);
  -[SBRecordingIndicatorSettings setFadeInDuration180:](self, "setFadeInDuration180:", 0.2);
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  void *v40;
  _QWORD v41[4];
  _QWORD v42[4];
  _QWORD v43[3];

  v43[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83020], "rowWithTitle:valueKeyPath:", CFSTR("Sensor Type"), CFSTR("sensorType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "possibleValues:titles:", &unk_1E91CE350, &unk_1E91CE338);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = (void *)MEMORY[0x1E0D83070];
  v43[0] = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionWithRows:title:", v4, CFSTR("Override Sensor State"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Delay Before Fade-out"), CFSTR("delayBeforeFadeOut90"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minValue:maxValue:", 0.0, 1.5);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Fade-out Duration"), CFSTR("fadeOutDuration90"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minValue:maxValue:", 0.0, 1.5);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Delay Before Fade-in"), CFSTR("delayBeforeFadeIn90"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minValue:maxValue:", 0.0, 1.5);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Fade-in Duration"), CFSTR("fadeInDuration90"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minValue:maxValue:", 0.0, 1.5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D83070];
  v42[0] = v36;
  v42[1] = v35;
  v42[2] = v34;
  v42[3] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionWithRows:title:", v10, CFSTR("Rotation Crossfade Settings (90º)"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Delay Before Fade-out"), CFSTR("delayBeforeFadeOut180"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "minValue:maxValue:", 0.0, 1.5);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Fade-out Duration"), CFSTR("fadeOutDuration180"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "minValue:maxValue:", 0.0, 1.5);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Delay Before Fade-in"), CFSTR("delayBeforeFadeIn180"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "minValue:maxValue:", 0.0, 1.5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Fade-in Duration"), CFSTR("fadeInDuration180"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "minValue:maxValue:", 0.0, 1.5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0D83070];
  v41[0] = v32;
  v41[1] = v31;
  v41[2] = v15;
  v41[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sectionWithRows:title:", v19, CFSTR("Rotation Crossfade Settings (180º)"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "rowWithTitle:action:", CFSTR("Restore Defaults"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x1E0D83070];
  v40 = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sectionWithRows:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)MEMORY[0x1E0D83070];
  v39[0] = v37;
  v39[1] = v11;
  v39[2] = v20;
  v39[3] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "moduleWithTitle:contents:", 0, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (int64_t)sensorType
{
  return self->_sensorType;
}

- (void)setSensorType:(int64_t)a3
{
  self->_sensorType = a3;
}

- (double)delayBeforeFadeOut90
{
  return self->_delayBeforeFadeOut90;
}

- (void)setDelayBeforeFadeOut90:(double)a3
{
  self->_delayBeforeFadeOut90 = a3;
}

- (double)fadeOutDuration90
{
  return self->_fadeOutDuration90;
}

- (void)setFadeOutDuration90:(double)a3
{
  self->_fadeOutDuration90 = a3;
}

- (double)delayBeforeFadeIn90
{
  return self->_delayBeforeFadeIn90;
}

- (void)setDelayBeforeFadeIn90:(double)a3
{
  self->_delayBeforeFadeIn90 = a3;
}

- (double)fadeInDuration90
{
  return self->_fadeInDuration90;
}

- (void)setFadeInDuration90:(double)a3
{
  self->_fadeInDuration90 = a3;
}

- (double)delayBeforeFadeOut180
{
  return self->_delayBeforeFadeOut180;
}

- (void)setDelayBeforeFadeOut180:(double)a3
{
  self->_delayBeforeFadeOut180 = a3;
}

- (double)fadeOutDuration180
{
  return self->_fadeOutDuration180;
}

- (void)setFadeOutDuration180:(double)a3
{
  self->_fadeOutDuration180 = a3;
}

- (double)delayBeforeFadeIn180
{
  return self->_delayBeforeFadeIn180;
}

- (void)setDelayBeforeFadeIn180:(double)a3
{
  self->_delayBeforeFadeIn180 = a3;
}

- (double)fadeInDuration180
{
  return self->_fadeInDuration180;
}

- (void)setFadeInDuration180:(double)a3
{
  self->_fadeInDuration180 = a3;
}

@end
