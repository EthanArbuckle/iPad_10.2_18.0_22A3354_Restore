@implementation PXTilingSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXTilingSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXTilingSettings setFlipLayoutsHorizontally:](self, "setFlipLayoutsHorizontally:", 0);
}

- (void)setFlipLayoutsHorizontally:(BOOL)a3
{
  self->_flipLayoutsHorizontally = a3;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (BOOL)flipLayoutsHorizontally
{
  return self->_flipLayoutsHorizontally;
}

+ (PXTilingSettings)sharedInstance
{
  if (sharedInstance_onceToken_124699 != -1)
    dispatch_once(&sharedInstance_onceToken_124699, &__block_literal_global_124700);
  return (PXTilingSettings *)(id)sharedInstance_sharedInstance_124701;
}

void __34__PXTilingSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tiling");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_124701;
  sharedInstance_sharedInstance_124701 = v0;

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
  _QWORD v11[2];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Flip Layouts Horizontally"), CFSTR("flipLayoutsHorizontally"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v4, CFSTR("Settings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D83078];
  v11[0] = v5;
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "moduleWithTitle:contents:", CFSTR("Tiling"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
