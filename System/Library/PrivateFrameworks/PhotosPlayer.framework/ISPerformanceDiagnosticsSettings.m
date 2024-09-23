@implementation ISPerformanceDiagnosticsSettings

- (void)setShouldTracePerformance:(BOOL)a3
{
  *(&self->super.super.__isObservingChildren + 1) = a3;
}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISPerformanceDiagnosticsSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[ISPerformanceDiagnosticsSettings setShouldTracePerformance:](self, "setShouldTracePerformance:", 0);
}

- (BOOL)shouldTracePerformance
{
  return *(&self->super.super.__isObservingChildren + 1);
}

+ (id)sharedInstance
{
  void *v2;
  void *v3;

  +[ISRootSettings sharedInstance](ISRootSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performanceDiagnosticsSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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
  _QWORD v16[2];
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Trace Performance"), CFSTR("shouldTracePerformance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0D83078];
  v7 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rowWithTitle:action:", CFSTR("Restore Defaults"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionWithRows:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D83078];
  v16[0] = v5;
  v16[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "moduleWithTitle:contents:", CFSTR("Performance Diagnostics"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
