@implementation PXPhotosDataSourceSettings

- (BOOL)slowBackgroundFetch
{
  return self->_slowBackgroundFetch;
}

+ (PXPhotosDataSourceSettings)sharedInstance
{
  if (sharedInstance_onceToken_210591 != -1)
    dispatch_once(&sharedInstance_onceToken_210591, &__block_literal_global_210592);
  return (PXPhotosDataSourceSettings *)(id)sharedInstance_sharedInstance_210593;
}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotosDataSourceSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXPhotosDataSourceSettings setSlowBackgroundFetch:](self, "setSlowBackgroundFetch:", 0);
  -[PXPhotosDataSourceSettings setDisableKeyAssetCuration:](self, "setDisableKeyAssetCuration:", 0);
  -[PXPhotosDataSourceSettings setDelayChanges:](self, "setDelayChanges:", 0.0);
}

- (void)setSlowBackgroundFetch:(BOOL)a3
{
  self->_slowBackgroundFetch = a3;
}

- (void)setDelayChanges:(double)a3
{
  self->_delayChanges = a3;
}

void __44__PXPhotosDataSourceSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photosDataSource");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_210593;
  sharedInstance_sharedInstance_210593 = v0;

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
  void *v24;
  void *v25;
  _QWORD v26[3];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  v3 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_slowBackgroundFetch);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:valueKeyPath:", CFSTR("Slow Background Fetch"), v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v23;
  v4 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_disableKeyAssetCuration);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowWithTitle:valueKeyPath:", CFSTR("Disable Key Asset Curation"), v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v21;
  v5 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_delayChanges);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rowWithTitle:valueKeyPath:", CFSTR("Delay Changes"), v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "minValue:maxValue:", 0.0, 60.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "px_increment:", 0.1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v8, CFSTR("Data Source"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v9;
  v10 = (void *)MEMORY[0x1E0D83078];
  v11 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rowWithTitle:action:", CFSTR("Restore Defaults"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sectionWithRows:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "moduleWithTitle:contents:", CFSTR("Data Source"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (BOOL)disableKeyAssetCuration
{
  return self->_disableKeyAssetCuration;
}

- (void)setDisableKeyAssetCuration:(BOOL)a3
{
  self->_disableKeyAssetCuration = a3;
}

- (double)delayChanges
{
  return self->_delayChanges;
}

@end
