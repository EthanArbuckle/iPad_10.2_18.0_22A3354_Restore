@implementation PXWorkaroundSettings

- (void)setDefaultValues
{
  _BOOL8 v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXWorkaroundSettings;
  -[PTSettings setDefaultValues](&v5, sel_setDefaultValues);
  if (PXIsOLEDDevice_onceToken != -1)
    dispatch_once(&PXIsOLEDDevice_onceToken, &__block_literal_global_31741);
  if (PXIsOLEDDevice_isOLEDDevice)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "userInterfaceIdiom") == 0;

  }
  -[PXWorkaroundSettings setShouldWorkAround53118165:](self, "setShouldWorkAround53118165:", v3);
  -[PXWorkaroundSettings setShouldWorkAround92398340:](self, "setShouldWorkAround92398340:", 1);
  -[PXWorkaroundSettings setShouldWorkAround102440195:](self, "setShouldWorkAround102440195:", 1);
  -[PXWorkaroundSettings setShouldWorkAround104295292:](self, "setShouldWorkAround104295292:", 1);
  -[PXWorkaroundSettings setShouldWorkAround128269285:](self, "setShouldWorkAround128269285:", 1);
}

- (void)setShouldWorkAround92398340:(BOOL)a3
{
  self->_shouldWorkAround92398340 = a3;
}

- (void)setShouldWorkAround53118165:(BOOL)a3
{
  self->_shouldWorkAround53118165 = a3;
}

- (void)setShouldWorkAround104295292:(BOOL)a3
{
  self->_shouldWorkAround104295292 = a3;
}

- (void)setShouldWorkAround102440195:(BOOL)a3
{
  self->_shouldWorkAround102440195 = a3;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (int64_t)version
{
  return 1;
}

- (BOOL)shouldWorkAround53118165
{
  return self->_shouldWorkAround53118165;
}

- (BOOL)shouldWorkAround92398340
{
  return self->_shouldWorkAround92398340;
}

- (BOOL)shouldWorkAround102440195
{
  return self->_shouldWorkAround102440195;
}

- (BOOL)shouldWorkAround104295292
{
  return self->_shouldWorkAround104295292;
}

- (BOOL)shouldWorkAround126757137
{
  return self->_shouldWorkAround126757137;
}

- (void)setShouldWorkAround126757137:(BOOL)a3
{
  self->_shouldWorkAround126757137 = a3;
}

- (BOOL)shouldWorkAround128269285
{
  return self->_shouldWorkAround128269285;
}

- (void)setShouldWorkAround128269285:(BOOL)a3
{
  self->_shouldWorkAround128269285 = a3;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_83670 != -1)
    dispatch_once(&sharedInstance_onceToken_83670, &__block_literal_global_83671);
  return (id)sharedInstance_sharedInstance_83672;
}

void __38__PXWorkaroundSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "workaroundSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_83672;
  sharedInstance_sharedInstance_83672 = v0;

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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  v3 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_shouldWorkAround53118165);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:valueKeyPath:", CFSTR("53118165"), v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v22;
  v4 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_shouldWorkAround92398340);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowWithTitle:valueKeyPath:", CFSTR("92398340"), v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v20;
  v5 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_shouldWorkAround102440195);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rowWithTitle:valueKeyPath:", CFSTR("102440195"), v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v6;
  v7 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_shouldWorkAround104295292);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rowWithTitle:valueKeyPath:", CFSTR("104295292"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v9;
  v10 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_shouldWorkAround128269285);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rowWithTitle:valueKeyPath:", CFSTR("128269285 (status bar & safe area inset)"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v14;
  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "moduleWithTitle:contents:", CFSTR("Workarounds"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

@end
