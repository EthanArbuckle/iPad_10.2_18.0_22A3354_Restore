@implementation PUIrisSettings

- (void)setShouldAlwaysBadge:(BOOL)a3
{
  self->_shouldAlwaysBadge = a3;
}

- (void)setDefaultValues
{
  -[PUIrisSettings setShowStatusBorder:](self, "setShowStatusBorder:", 0);
  -[PUIrisSettings setVitalityAllowed:](self, "setVitalityAllowed:", 1);
  -[PUIrisSettings setShouldAlwaysBadge:](self, "setShouldAlwaysBadge:", 0);
}

- (void)setVitalityAllowed:(BOOL)a3
{
  self->_vitalityAllowed = a3;
}

- (void)setShowStatusBorder:(BOOL)a3
{
  self->_showStatusBorder = a3;
}

- (id)parentSettings
{
  return +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
}

- (void)restoreDefaultValues
{
  void *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUIrisSettings;
  -[PXSettings restoreDefaultValues](&v3, sel_restoreDefaultValues);
  objc_msgSend((id)objc_opt_class(), "_photosPlayerRootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "restoreDefaultValues");

}

- (void)performPostSaveActions
{
  void *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUIrisSettings;
  -[PXSettings performPostSaveActions](&v3, sel_performPostSaveActions);
  objc_msgSend((id)objc_opt_class(), "_photosPlayerRootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "save");

}

- (BOOL)showStatusBorder
{
  return self->_showStatusBorder;
}

- (BOOL)isVitalityAllowed
{
  return self->_vitalityAllowed;
}

- (BOOL)shouldAlwaysBadge
{
  return self->_shouldAlwaysBadge;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_43583 != -1)
    dispatch_once(&sharedInstance_onceToken_43583, &__block_literal_global_43584);
  return (id)sharedInstance_sharedInstance_43585;
}

+ (id)_photosPlayerRootSettings
{
  return -[objc_class sharedInstance](NSClassFromString(CFSTR("ISRootSettings")), "sharedInstance");
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[5];
  _QWORD v28[4];
  void *v29;
  _QWORD v30[3];
  void *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __42__PUIrisSettings_settingsControllerModule__block_invoke;
  v27[3] = &__block_descriptor_40_e17___ISSettings_8__0l;
  v27[4] = a1;
  objc_msgSend(MEMORY[0x1E0D83010], "pu_rowWithTitle:settingsProvider:", CFSTR("PhotosPlayer Settings"), v27);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Status Border"), CFSTR("showStatusBorder"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionWithRows:title:", v8, CFSTR("Live Photo View"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Vitality"), CFSTR("vitalityAllowed"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v11;
  objc_msgSend(MEMORY[0x1E0D83010], "pu_rowWithTitle:settingsProvider:", CFSTR("Vitality Settings"), &__block_literal_global_24);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "conditionFormat:", CFSTR("isVitalityAllowed != 0"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v13;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Always Badge"), CFSTR("shouldAlwaysBadge"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sectionWithRows:title:", v15, CFSTR("Vitality"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0D83078];
  v18 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "rowWithTitle:action:", CFSTR("Restore Defaults"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sectionWithRows:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0D83078];
  v28[0] = v9;
  v28[1] = v5;
  v28[2] = v16;
  v28[3] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "moduleWithTitle:contents:", CFSTR("Iris"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

uint64_t __42__PUIrisSettings_settingsControllerModule__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_photosPlayerRootSettings");
}

uint64_t __42__PUIrisSettings_settingsControllerModule__block_invoke_2()
{
  return objc_msgSend(MEMORY[0x1E0D78288], "sharedInstance");
}

void __32__PUIrisSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "irisSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_43585;
  sharedInstance_sharedInstance_43585 = v0;

}

@end
