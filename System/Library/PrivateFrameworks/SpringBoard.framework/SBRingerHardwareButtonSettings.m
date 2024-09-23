@implementation SBRingerHardwareButtonSettings

- (void)setDefaultValues
{
  SBRingerButtonParameters *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBRingerHardwareButtonSettings;
  -[PTSettings setDefaultValues](&v4, sel_setDefaultValues);
  v3 = objc_alloc_init(SBRingerButtonParameters);
  -[SBRingerHardwareButtonSettings setRingerButtonParameters:](self, "setRingerButtonParameters:", v3);

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
  void *v17;
  _QWORD v18[2];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Long press time"), CFSTR("longPressTime"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "between:and:", 0.0, 10.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("In-pocket long press time"), CFSTR("longPressTimeWhenSuppressed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "between:and:", 0.0, 10.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v17);
  objc_msgSend(v5, "addObject:", v4);
  objc_msgSend(MEMORY[0x1E0D83070], "sectionWithRows:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D83070];
  v8 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rowWithTitle:action:", CFSTR("Restore Defaults"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionWithRows:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D83070];
  v18[0] = v6;
  v18[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "moduleWithTitle:contents:", CFSTR("Ringer Button"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (SBRingerButtonParameters)ringerButtonParameters
{
  SBRingerButtonParameters *v3;

  v3 = objc_alloc_init(SBRingerButtonParameters);
  -[SBRingerButtonParameters setLongPressTime:]((uint64_t)v3, self->_longPressTime);
  -[SBRingerButtonParameters setLongPressTimeWhenSuppressed:]((uint64_t)v3, self->_longPressTimeWhenSuppressed);
  return v3;
}

- (void)setRingerButtonParameters:(id)a3
{
  id v4;
  double v5;

  v4 = a3;
  self->_longPressTime = -[SBRingerButtonParameters longPressTime]((uint64_t)v4);
  v5 = -[SBRingerButtonParameters longPressTimeWhenSuppressed]((uint64_t)v4);

  self->_longPressTimeWhenSuppressed = v5;
}

- (double)longPressTime
{
  return self->_longPressTime;
}

- (void)setLongPressTime:(double)a3
{
  self->_longPressTime = a3;
}

- (double)longPressTimeWhenSuppressed
{
  return self->_longPressTimeWhenSuppressed;
}

- (void)setLongPressTimeWhenSuppressed:(double)a3
{
  self->_longPressTimeWhenSuppressed = a3;
}

@end
