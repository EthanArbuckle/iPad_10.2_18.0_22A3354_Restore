@implementation SBPIPSizingSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBPIPSizingSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  self->_landcapeAspectRatioClosedIntervalLowerBound = 0.0;
  self->_landcapeAspectRatioClosedIntervalUpperBound = 0.7;
  self->_squareAspectRatioClosedIntervalLowerBound = 0.71;
  self->_squareAspectRatioClosedIntervalUpperBound = 1.09;
  self->_portraitAspectRatioClosedIntervalLowerBound = 1.1;
  self->_portraitAspectRatioClosedIntervalUpperBound = 1.79769313e308;
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
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[8];

  v31[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rowWithTitle:action:", CFSTR("Restore Defaults"), v3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_landcapeAspectRatioClosedIntervalLowerBound);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowWithTitle:valueKeyPath:", CFSTR("Landscape range lower bound"), v5);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_landcapeAspectRatioClosedIntervalUpperBound);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rowWithTitle:valueKeyPath:", CFSTR("Landscape range upper bound"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_portraitAspectRatioClosedIntervalLowerBound);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rowWithTitle:valueKeyPath:", CFSTR("Portrait range lower bound"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_portraitAspectRatioClosedIntervalUpperBound);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rowWithTitle:valueKeyPath:", CFSTR("Portrait range upper bound"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_squareAspectRatioClosedIntervalLowerBound);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rowWithTitle:valueKeyPath:", CFSTR("Square range lower bound"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_squareAspectRatioClosedIntervalUpperBound);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "rowWithTitle:valueKeyPath:", CFSTR("Square range upper bound"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0D83070];
  v31[0] = v29;
  v31[1] = v28;
  v31[2] = v8;
  v31[3] = v11;
  v31[4] = v14;
  v31[5] = v17;
  v31[6] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sectionWithRows:title:", v22, CFSTR("Aspect ratios ranges"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x1E0D83070];
  v30 = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "moduleWithTitle:contents:", CFSTR("PIP Aspect Ratios Ranges"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (double)landcapeAspectRatioClosedIntervalLowerBound
{
  return self->_landcapeAspectRatioClosedIntervalLowerBound;
}

- (void)setLandcapeAspectRatioClosedIntervalLowerBound:(double)a3
{
  self->_landcapeAspectRatioClosedIntervalLowerBound = a3;
}

- (double)landcapeAspectRatioClosedIntervalUpperBound
{
  return self->_landcapeAspectRatioClosedIntervalUpperBound;
}

- (void)setLandcapeAspectRatioClosedIntervalUpperBound:(double)a3
{
  self->_landcapeAspectRatioClosedIntervalUpperBound = a3;
}

- (double)portraitAspectRatioClosedIntervalLowerBound
{
  return self->_portraitAspectRatioClosedIntervalLowerBound;
}

- (void)setPortraitAspectRatioClosedIntervalLowerBound:(double)a3
{
  self->_portraitAspectRatioClosedIntervalLowerBound = a3;
}

- (double)portraitAspectRatioClosedIntervalUpperBound
{
  return self->_portraitAspectRatioClosedIntervalUpperBound;
}

- (void)setPortraitAspectRatioClosedIntervalUpperBound:(double)a3
{
  self->_portraitAspectRatioClosedIntervalUpperBound = a3;
}

- (double)squareAspectRatioClosedIntervalLowerBound
{
  return self->_squareAspectRatioClosedIntervalLowerBound;
}

- (void)setSquareAspectRatioClosedIntervalLowerBound:(double)a3
{
  self->_squareAspectRatioClosedIntervalLowerBound = a3;
}

- (double)squareAspectRatioClosedIntervalUpperBound
{
  return self->_squareAspectRatioClosedIntervalUpperBound;
}

- (void)setSquareAspectRatioClosedIntervalUpperBound:(double)a3
{
  self->_squareAspectRatioClosedIntervalUpperBound = a3;
}

@end
