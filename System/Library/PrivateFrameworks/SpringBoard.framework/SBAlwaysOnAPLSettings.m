@implementation SBAlwaysOnAPLSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBAlwaysOnAPLSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  self->_overallAPLLimit = 0.15;
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
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Overall"), CFSTR("overallAPLLimit"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minValue:maxValue:", 0.0, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0D83070];
  v12[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWithRows:title:", v5, CFSTR("APL Limits"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D83070];
  v11 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "moduleWithTitle:contents:", CFSTR("Average Pixel Luminance Policies"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (double)overallAPLLimit
{
  return self->_overallAPLLimit;
}

- (void)setOverallAPLLimit:(double)a3
{
  self->_overallAPLLimit = a3;
}

@end
