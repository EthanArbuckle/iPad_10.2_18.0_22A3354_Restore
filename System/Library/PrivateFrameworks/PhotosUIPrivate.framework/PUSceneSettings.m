@implementation PUSceneSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUSceneSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PUSceneSettings setShowConfidenceOverlay:](self, "setShowConfidenceOverlay:", 1);
  -[PUSceneSettings setInspectorSortOrder:](self, "setInspectorSortOrder:", 0);
}

- (void)setShowConfidenceOverlay:(BOOL)a3
{
  self->_showConfidenceOverlay = a3;
}

- (void)setInspectorSortOrder:(unint64_t)a3
{
  self->_inspectorSortOrder = a3;
}

- (id)parentSettings
{
  return +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
}

- (BOOL)showConfidenceOverlay
{
  return self->_showConfidenceOverlay;
}

- (unint64_t)inspectorSortOrder
{
  return self->_inspectorSortOrder;
}

+ (PUSceneSettings)sharedInstance
{
  if (sharedInstance_onceToken_83217 != -1)
    dispatch_once(&sharedInstance_onceToken_83217, &__block_literal_global_83218);
  return (PUSceneSettings *)(id)sharedInstance_sharedInstance_83219;
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
  void *v18;
  _QWORD v20[3];
  void *v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Confidence Overlay"), CFSTR("showConfidenceOverlay"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v4, CFSTR("Scene Inspector Grid View"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83010], "pu_rowWithTitle:action:", CFSTR("Scene Inspector"), &__block_literal_global_13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D83078];
  v22 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionWithRows:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D83078];
  v11 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rowWithTitle:action:", CFSTR("Restore Defaults"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sectionWithRows:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0D83078];
  v20[0] = v5;
  v20[1] = v9;
  v20[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "moduleWithTitle:contents:", CFSTR("Scenes Settings"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

void __43__PUSceneSettings_settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PUNavigationController *v3;
  PUSceneDebugInspectorViewController *v4;

  v2 = a2;
  v4 = -[PUSceneDebugInspectorViewController initWithStyle:]([PUSceneDebugInspectorViewController alloc], "initWithStyle:", 0);
  v3 = -[PUNavigationController initWithRootViewController:]([PUNavigationController alloc], "initWithRootViewController:", v4);
  objc_msgSend(v2, "presentViewController:animated:completion:", v3, 1, 0);

}

void __33__PUSceneSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sceneSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_83219;
  sharedInstance_sharedInstance_83219 = v0;

}

@end
