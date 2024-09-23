@implementation PXMacSyncedAlbumsSettings

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXMacSyncedAlbumsSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXMacSyncedAlbumsSettings setSimulationMode:](self, "setSimulationMode:", 0);
}

- (int64_t)simulationMode
{
  return self->_simulationMode;
}

- (void)setSimulationMode:(int64_t)a3
{
  self->_simulationMode = a3;
}

+ (PXMacSyncedAlbumsSettings)sharedInstance
{
  if (sharedInstance_onceToken_195942 != -1)
    dispatch_once(&sharedInstance_onceToken_195942, &__block_literal_global_195943);
  return (PXMacSyncedAlbumsSettings *)(id)sharedInstance_sharedInstance_195944;
}

+ (id)settingsControllerModule
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = (void *)MEMORY[0x1E0D83078];
  v4 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_simulationMode);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowWithTitle:valueKeyPath:", CFSTR("Simulation"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "possibleValues:titles:", &unk_1E53EA158, &unk_1E53EA170);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionWithRows:title:", v8, CFSTR("General"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v9);

  objc_msgSend(MEMORY[0x1E0D83078], "moduleWithTitle:contents:", CFSTR("Mac Synced Albums"), v2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __43__PXMacSyncedAlbumsSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "macSyncedAlbumsSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_195944;
  sharedInstance_sharedInstance_195944 = v0;

}

@end
