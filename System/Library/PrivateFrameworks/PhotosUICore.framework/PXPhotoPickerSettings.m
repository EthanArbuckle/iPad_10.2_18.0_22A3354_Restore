@implementation PXPhotoPickerSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotoPickerSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXPhotoPickerSettings setUseNavBarAnimatedTransition:](self, "setUseNavBarAnimatedTransition:", 1);
}

- (void)setUseNavBarAnimatedTransition:(BOOL)a3
{
  self->_useNavBarAnimatedTransition = a3;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (BOOL)useNavBarAnimatedTransition
{
  return self->_useNavBarAnimatedTransition;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_32873 != -1)
    dispatch_once(&sharedInstance_onceToken_32873, &__block_literal_global_32874);
  return (id)sharedInstance_sharedInstance_32875;
}

void __39__PXPhotoPickerSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoPickerSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_32875;
  sharedInstance_sharedInstance_32875 = v0;

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
  _QWORD v13[2];
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D830B8];
  v4 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_useNavBarAnimatedTransition);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowWithTitle:valueKeyPath:", CFSTR("Use Nav Bar Transition"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionWithRows:title:", v7, CFSTR("Grid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D83078];
  v13[0] = v8;
  v13[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "moduleWithTitle:contents:", CFSTR("Diagnostics"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
