@implementation PXDocumentMenuSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXDocumentMenuSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXDocumentMenuSettings setActionsMenuLocation:](self, "setActionsMenuLocation:", 1);
  -[PXDocumentMenuSettings setShowAddToSharedAlbumAction:](self, "setShowAddToSharedAlbumAction:", 0);
  -[PXDocumentMenuSettings setExcludeActionsFromShareSheet:](self, "setExcludeActionsFromShareSheet:", 1);
  -[PXDocumentMenuSettings setEnableActionsMenuOnPad:](self, "setEnableActionsMenuOnPad:", 1);
  -[PXDocumentMenuSettings setEnableActionsMenuOnPhone:](self, "setEnableActionsMenuOnPhone:", 1);
}

- (void)setShowAddToSharedAlbumAction:(BOOL)a3
{
  self->_showAddToSharedAlbumAction = a3;
}

- (void)setExcludeActionsFromShareSheet:(BOOL)a3
{
  self->_excludeActionsFromShareSheet = a3;
}

- (void)setEnableActionsMenuOnPhone:(BOOL)a3
{
  self->_enableActionsMenuOnPhone = a3;
}

- (void)setEnableActionsMenuOnPad:(BOOL)a3
{
  self->_enableActionsMenuOnPad = a3;
}

- (void)setActionsMenuLocation:(int64_t)a3
{
  self->_actionsMenuLocation = a3;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (BOOL)showAddToSharedAlbumAction
{
  return self->_showAddToSharedAlbumAction;
}

- (BOOL)excludeActionsFromShareSheet
{
  return self->_excludeActionsFromShareSheet;
}

- (BOOL)enableActionsMenuOnPad
{
  return self->_enableActionsMenuOnPad;
}

- (BOOL)enableActionsMenuOnPhone
{
  return self->_enableActionsMenuOnPhone;
}

- (int64_t)actionsMenuLocation
{
  return self->_actionsMenuLocation;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_53923 != -1)
    dispatch_once(&sharedInstance_onceToken_53923, &__block_literal_global_53924);
  return (id)sharedInstance_sharedInstance_53925;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Actions Location"), CFSTR("actionsMenuLocation"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "possibleValues:titles:", &unk_1E53E8E98, &unk_1E53E8EB0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v21;
  v3 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableActionsMenuOnPad);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:valueKeyPath:", CFSTR("Enable Actions Menu on iPad"), v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v19;
  v4 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableActionsMenuOnPhone);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowWithTitle:valueKeyPath:", CFSTR("Enable Actions Menu on iPhone"), v18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v5;
  v6 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showAddToSharedAlbumAction);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rowWithTitle:valueKeyPath:", CFSTR("Show Add To Shared Album Action"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v8;
  v9 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_excludeActionsFromShareSheet);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rowWithTitle:valueKeyPath:", CFSTR("Exclude actions from Share Sheet"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v12, CFSTR("Actions Settings"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v13;
  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "moduleWithTitle:contents:", CFSTR("In-App Actions"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __40__PXDocumentMenuSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documentMenuSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_53925;
  sharedInstance_sharedInstance_53925 = v0;

}

@end
