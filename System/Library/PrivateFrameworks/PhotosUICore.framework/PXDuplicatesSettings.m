@implementation PXDuplicatesSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXDuplicatesSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXDuplicatesSettings setShowDuplicateGroupsWithASingleAsset:](self, "setShowDuplicateGroupsWithASingleAsset:", 0);
}

- (void)setShowDuplicateGroupsWithASingleAsset:(BOOL)a3
{
  self->_showDuplicateGroupsWithASingleAsset = a3;
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
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83010], "px_rowWithTitle:action:", CFSTR("Process Identical Duplicates"), &__block_literal_global_8081);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v4 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showDuplicateGroupsWithASingleAsset);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowWithTitle:valueKeyPath:", CFSTR("Show Groups with a Single Asset"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0D83078];
  v14[0] = v8;
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "moduleWithTitle:contents:", CFSTR("Duplicates"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __52__PXDuplicatesSettings_UI__settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v2 = a2;
  +[PXAlertController activityAlertControllerWithTitle:cancelHandler:](PXAlertController, "activityAlertControllerWithTitle:cancelHandler:", CFSTR("Processing..."), &__block_literal_global_142);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = ___ProcessDuplicates_block_invoke_2;
  v6[3] = &unk_1E5148D08;
  v7 = v3;
  v8 = v2;
  v4 = v3;
  v5 = v2;
  objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, v6);

}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (BOOL)showDuplicateGroupsWithASingleAsset
{
  return self->_showDuplicateGroupsWithASingleAsset;
}

+ (PXDuplicatesSettings)sharedInstance
{
  if (sharedInstance_onceToken_290087 != -1)
    dispatch_once(&sharedInstance_onceToken_290087, &__block_literal_global_290088);
  return (PXDuplicatesSettings *)(id)sharedInstance_sharedInstance_290089;
}

void __38__PXDuplicatesSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "duplicatesSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_290089;
  sharedInstance_sharedInstance_290089 = v0;

}

@end
