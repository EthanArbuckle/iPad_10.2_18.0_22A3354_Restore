@implementation SBMedusa1oSettings

- (double)rotationSlowdownFactor
{
  return self->_rotationSlowdownFactor;
}

- (void)setDefaultValues
{
  -[SBMedusa1oSettings setDebugRotationCenter:](self, "setDebugRotationCenter:", 0);
  -[SBMedusa1oSettings setDebugColorRotationRegions:](self, "setDebugColorRotationRegions:", 0);
  -[SBMedusa1oSettings setClipRotationRegions:](self, "setClipRotationRegions:", 0);
  -[SBMedusa1oSettings setZoomOutRotationFactor:](self, "setZoomOutRotationFactor:", 1.0);
  -[SBMedusa1oSettings setRotationSlowdownFactor:](self, "setRotationSlowdownFactor:", 1.0);
  -[SBMedusa1oSettings setFencesRotation:](self, "setFencesRotation:", 1);
  -[SBMedusa1oSettings setGapSwipeBuffer:](self, "setGapSwipeBuffer:", 40.0);
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[7];

  v34[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Color Rotation Center"), CFSTR("debugRotationCenter"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Color Rotation Regions"), CFSTR("debugColorRotationRegions"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Clip Rotation Regions"), CFSTR("clipRotationRegions"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Zoom Out During Rotation"), CFSTR("zoomOutRotationFactor"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMinValue:", 1.0);
  v3 = v2;
  v24 = v2;
  objc_msgSend(v2, "setMaxValue:", 3.0);
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Rotation Slowdown Factor"), CFSTR("rotationSlowdownFactor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMinValue:", 1.0);
  objc_msgSend(v4, "setMaxValue:", 30.0);
  v5 = (void *)MEMORY[0x1E0D83070];
  v34[0] = v29;
  v34[1] = v28;
  v34[2] = v27;
  v34[3] = v3;
  v34[4] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionWithRows:title:", v6, CFSTR("Debugging Aids"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Fence Rotation"), CFSTR("fencesRotation"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D83070];
  v33 = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionWithRows:title:", v8, CFSTR("Animations"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Buffer"), CFSTR("gapSwipeBuffer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMinValue:", 0.0);
  objc_msgSend(v10, "setMaxValue:", 200.0);
  v11 = (void *)MEMORY[0x1E0D83070];
  v32 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sectionWithRows:title:", v12, CFSTR("GapSwipe"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rowWithTitle:action:", CFSTR("Restore Defaults"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0D83070];
  v31 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sectionWithRows:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0D83070];
  v30[0] = v25;
  v30[1] = v9;
  v30[2] = v13;
  v30[3] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "moduleWithTitle:contents:", CFSTR("Medusa 1.0"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (BOOL)debugRotationCenter
{
  return self->_debugRotationCenter;
}

- (void)setDebugRotationCenter:(BOOL)a3
{
  self->_debugRotationCenter = a3;
}

- (BOOL)debugColorRotationRegions
{
  return self->_debugColorRotationRegions;
}

- (void)setDebugColorRotationRegions:(BOOL)a3
{
  self->_debugColorRotationRegions = a3;
}

- (BOOL)clipRotationRegions
{
  return self->_clipRotationRegions;
}

- (void)setClipRotationRegions:(BOOL)a3
{
  self->_clipRotationRegions = a3;
}

- (double)zoomOutRotationFactor
{
  return self->_zoomOutRotationFactor;
}

- (void)setZoomOutRotationFactor:(double)a3
{
  self->_zoomOutRotationFactor = a3;
}

- (void)setRotationSlowdownFactor:(double)a3
{
  self->_rotationSlowdownFactor = a3;
}

- (BOOL)fencesRotation
{
  return self->_fencesRotation;
}

- (void)setFencesRotation:(BOOL)a3
{
  self->_fencesRotation = a3;
}

- (unint64_t)millisecondsBetweenResizeSteps
{
  return self->_millisecondsBetweenResizeSteps;
}

- (void)setMillisecondsBetweenResizeSteps:(unint64_t)a3
{
  self->_millisecondsBetweenResizeSteps = a3;
}

- (double)gapSwipeBuffer
{
  return self->_gapSwipeBuffer;
}

- (void)setGapSwipeBuffer:(double)a3
{
  self->_gapSwipeBuffer = a3;
}

@end
