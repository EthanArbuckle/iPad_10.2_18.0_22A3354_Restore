@implementation PXMapSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXMapSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXMapSettings setEnableCuratedPlacesAlbumSnapshot:](self, "setEnableCuratedPlacesAlbumSnapshot:", 1);
}

- (void)setEnableCuratedPlacesAlbumSnapshot:(BOOL)a3
{
  self->_enableCuratedPlacesAlbumSnapshot = a3;
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
  v2 = (void *)MEMORY[0x1E0D83078];
  v3 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableCuratedPlacesAlbumSnapshot);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:valueKeyPath:", CFSTR("Enable Curated Places Album Snapshot"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0D83078];
  v13[0] = v7;
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "moduleWithTitle:contents:", CFSTR("Maps"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (BOOL)enableCuratedPlacesAlbumSnapshot
{
  return self->_enableCuratedPlacesAlbumSnapshot;
}

+ (PXMapSettings)sharedInstance
{
  if (sharedInstance_onceToken_300190 != -1)
    dispatch_once(&sharedInstance_onceToken_300190, &__block_literal_global_300191);
  return (PXMapSettings *)(id)sharedInstance_sharedInstance_300192;
}

void __31__PXMapSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mapSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_300192;
  sharedInstance_sharedInstance_300192 = v0;

}

@end
