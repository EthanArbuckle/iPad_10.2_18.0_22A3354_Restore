@implementation PUPerformanceDiagnosticsSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPerformanceDiagnosticsSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PUPerformanceDiagnosticsSettings setShouldTracePerformance:](self, "setShouldTracePerformance:", 0);
  -[PUPerformanceDiagnosticsSettings setScrollTestRampUpDuration:](self, "setScrollTestRampUpDuration:", 0.8);
  -[PUPerformanceDiagnosticsSettings setScrollTestCPUWarmupDuration:](self, "setScrollTestCPUWarmupDuration:", 0.0);
  -[PUPerformanceDiagnosticsSettings setScrollTestCPUSustainDuration:](self, "setScrollTestCPUSustainDuration:", 0.0);
}

- (void)setShouldTracePerformance:(BOOL)a3
{
  self->_shouldTracePerformance = a3;
}

- (void)setScrollTestRampUpDuration:(double)a3
{
  self->_scrollTestRampUpDuration = a3;
}

- (void)setScrollTestCPUWarmupDuration:(double)a3
{
  self->_scrollTestCPUWarmupDuration = a3;
}

- (void)setScrollTestCPUSustainDuration:(double)a3
{
  self->_scrollTestCPUSustainDuration = a3;
}

- (id)parentSettings
{
  return +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
}

- (BOOL)shouldTracePerformance
{
  return self->_shouldTracePerformance;
}

- (double)scrollTestRampUpDuration
{
  return self->_scrollTestRampUpDuration;
}

- (double)scrollTestCPUWarmupDuration
{
  return self->_scrollTestCPUWarmupDuration;
}

- (double)scrollTestCPUSustainDuration
{
  return self->_scrollTestCPUSustainDuration;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_57633 != -1)
    dispatch_once(&sharedInstance_onceToken_57633, &__block_literal_global_57634);
  return (id)sharedInstance_sharedInstance_57635;
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
  void *v26;
  void *v27;
  _QWORD v28[3];
  void *v29;
  _QWORD v30[3];
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Trace Performance"), CFSTR("shouldTracePerformance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:", v4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Ramp Up Duration"), CFSTR("scrollTestRampUpDuration"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "minValue:maxValue:", 0.0, 3.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pu_increment:", 0.0500000007);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v7;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("CPU Warmup Duration"), CFSTR("scrollTestCPUWarmupDuration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minValue:maxValue:", 0.0, 3.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pu_increment:", 0.100000001);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v10;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("CPU Sustain Duration"), CFSTR("scrollTestCPUSustainDuration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minValue:maxValue:", 0.0, 3.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pu_increment:", 0.100000001);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionWithRows:title:", v14, CFSTR("PPT Scroll Tests"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0D83078];
  v17 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "rowWithTitle:action:", CFSTR("Restore Defaults"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sectionWithRows:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0D83078];
  v28[0] = v27;
  v28[1] = v15;
  v28[2] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "moduleWithTitle:contents:", CFSTR("Performance Diagnostics"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

void __50__PUPerformanceDiagnosticsSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performanceDiagnosticsSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_57635;
  sharedInstance_sharedInstance_57635 = v0;

}

@end
