@implementation PUAlbumListSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUAlbumListSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PUAlbumListSettings setShouldUseEditorialLayout:](self, "setShouldUseEditorialLayout:", 0);
  -[PUAlbumListSettings setAllowNavigationTitleEditing:](self, "setAllowNavigationTitleEditing:", 0);
}

- (void)setShouldUseEditorialLayout:(BOOL)a3
{
  self->_shouldUseEditorialLayout = a3;
}

- (void)setAllowNavigationTitleEditing:(BOOL)a3
{
  self->_allowNavigationTitleEditing = a3;
}

- (id)parentSettings
{
  return +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
}

- (BOOL)shouldUseEditorialLayout
{
  return self->_shouldUseEditorialLayout;
}

- (BOOL)allowNavigationTitleEditing
{
  return self->_allowNavigationTitleEditing;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_8446 != -1)
    dispatch_once(&sharedInstance_onceToken_8446, &__block_literal_global_8447);
  return (id)sharedInstance_sharedInstance_8448;
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
  _QWORD v18[3];
  void *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Use Editorial Layout"), CFSTR("shouldUseEditorialLayout"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D83078];
  v21[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionWithRows:title:", v4, CFSTR("Shared Album Tile Settings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Title Editing in Navigation Bar"), CFSTR("allowNavigationTitleEditing"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:", v7, CFSTR("Albums Settings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rowWithTitle:action:", CFSTR("Restore Defaults"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0D83078];
  v18[0] = v5;
  v18[1] = v8;
  v18[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "moduleWithTitle:contents:", CFSTR("Album List Settings"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __37__PUAlbumListSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "albumListSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_8448;
  sharedInstance_sharedInstance_8448 = v0;

}

@end
