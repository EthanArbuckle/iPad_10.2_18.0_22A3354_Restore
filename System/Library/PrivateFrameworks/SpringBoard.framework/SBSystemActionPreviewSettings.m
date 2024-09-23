@implementation SBSystemActionPreviewSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBSystemActionPreviewSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[SBSystemActionPreviewSettings setMinimumPreviewInterval:](self, "setMinimumPreviewInterval:", 1.5);
  -[SBSystemActionPreviewSettings setAdditionalUrgencyInterval:](self, "setAdditionalUrgencyInterval:", 0.5);
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
  _QWORD v19[2];
  void *v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Minimum Preview Interval"), CFSTR("minimumPreviewInterval"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "between:and:", 0.0, 10.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v4;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Additional Urgency Interval"), CFSTR("additionalUrgencyInterval"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "between:and:", 0.0, 10.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v7, CFSTR("Timing"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D83070];
  v10 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rowWithTitle:action:", CFSTR("Restore Defaults"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionWithRows:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0D83070];
  v19[0] = v14;
  v19[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "moduleWithTitle:contents:", CFSTR("Previews"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (double)minimumPreviewInterval
{
  return self->_minimumPreviewInterval;
}

- (void)setMinimumPreviewInterval:(double)a3
{
  self->_minimumPreviewInterval = a3;
}

- (double)additionalUrgencyInterval
{
  return self->_additionalUrgencyInterval;
}

- (void)setAdditionalUrgencyInterval:(double)a3
{
  self->_additionalUrgencyInterval = a3;
}

@end
