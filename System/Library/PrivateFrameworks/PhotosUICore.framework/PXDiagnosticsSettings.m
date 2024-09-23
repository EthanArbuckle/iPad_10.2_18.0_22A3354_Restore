@implementation PXDiagnosticsSettings

- (BOOL)enableContextualGesture
{
  return self->_enableContextualGesture;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_20880 != -1)
    dispatch_once(&sharedInstance_onceToken_20880, &__block_literal_global_20881);
  return (id)sharedInstance_sharedInstance_20882;
}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXDiagnosticsSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXDiagnosticsSettings setEnableContextualGesture:](self, "setEnableContextualGesture:", 1);
  -[PXDiagnosticsSettings setEnableInternalSettingsService:](self, "setEnableInternalSettingsService:", 1);
  -[PXDiagnosticsSettings setEnableGenericService:](self, "setEnableGenericService:", 0);
  -[PXDiagnosticsSettings setEnableGraphService:](self, "setEnableGraphService:", 1);
  -[PXDiagnosticsSettings setEnableTitleFontService:](self, "setEnableTitleFontService:", 0);
  -[PXDiagnosticsSettings setEnableCompleteMyMomentService:](self, "setEnableCompleteMyMomentService:", 1);
  -[PXDiagnosticsSettings setEnableDebugDictionaryService:](self, "setEnableDebugDictionaryService:", 1);
  -[PXDiagnosticsSettings setEnableScrollService:](self, "setEnableScrollService:", 0);
  -[PXDiagnosticsSettings setScrollSpeed:](self, "setScrollSpeed:", 20.0);
  -[PXDiagnosticsSettings setScrollIterations:](self, "setScrollIterations:", 0);
}

- (void)setScrollSpeed:(double)a3
{
  self->_scrollSpeed = a3;
}

- (void)setScrollIterations:(int64_t)a3
{
  self->_scrollIterations = a3;
}

- (void)setEnableTitleFontService:(BOOL)a3
{
  self->_enableTitleFontService = a3;
}

- (void)setEnableScrollService:(BOOL)a3
{
  self->_enableScrollService = a3;
}

- (void)setEnableInternalSettingsService:(BOOL)a3
{
  self->_enableInternalSettingsService = a3;
}

- (void)setEnableGraphService:(BOOL)a3
{
  self->_enableGraphService = a3;
}

- (void)setEnableGenericService:(BOOL)a3
{
  self->_enableGenericService = a3;
}

- (void)setEnableDebugDictionaryService:(BOOL)a3
{
  self->_enableDebugDictionaryService = a3;
}

- (void)setEnableContextualGesture:(BOOL)a3
{
  self->_enableContextualGesture = a3;
}

- (void)setEnableCompleteMyMomentService:(BOOL)a3
{
  self->_enableCompleteMyMomentService = a3;
}

void __39__PXDiagnosticsSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "diagnostics");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_20882;
  sharedInstance_sharedInstance_20882 = v0;

}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (BOOL)enableInternalSettingsService
{
  return self->_enableInternalSettingsService;
}

- (BOOL)enableGenericService
{
  return self->_enableGenericService;
}

- (BOOL)enableGraphService
{
  return self->_enableGraphService;
}

- (BOOL)enableTitleFontService
{
  return self->_enableTitleFontService;
}

- (BOOL)enableCompleteMyMomentService
{
  return self->_enableCompleteMyMomentService;
}

- (BOOL)enableDebugDictionaryService
{
  return self->_enableDebugDictionaryService;
}

- (BOOL)enableScrollService
{
  return self->_enableScrollService;
}

- (double)scrollSpeed
{
  return self->_scrollSpeed;
}

- (int64_t)scrollIterations
{
  return self->_scrollIterations;
}

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  _QWORD v44[3];
  _QWORD v45[7];
  _QWORD v46[4];

  v46[2] = *MEMORY[0x1E0C80C00];
  +[PXDiagnosticsController sharedController](PXDiagnosticsController, "sharedController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D83078];
  v4 = (void *)MEMORY[0x1E0D83010];
  v5 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __53__PXDiagnosticsSettings_UI__settingsControllerModule__block_invoke;
  v41[3] = &unk_1E5149198;
  v6 = v2;
  v42 = v6;
  objc_msgSend(v4, "px_rowWithTitle:postDismissalAction:", CFSTR("Present Contextual Diagnostics"), v41);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v7;
  v8 = (void *)MEMORY[0x1E0D83048];
  v39[0] = v5;
  v39[1] = 3221225472;
  v39[2] = __53__PXDiagnosticsSettings_UI__settingsControllerModule__block_invoke_2;
  v39[3] = &unk_1E512E798;
  v40 = v6;
  v38 = v6;
  objc_msgSend(v8, "px_rowWithTitle:action:", CFSTR("Generic Service"), v39);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "conditionFormat:", CFSTR("enableGenericService != 0"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionWithRows:", v11);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Gesture (4-Finger Double-Tap)"), CFSTR("enableContextualGesture"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v13;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Internal Settings"), CFSTR("enableInternalSettingsService"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v14;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Generic Service"), CFSTR("enableGenericService"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v15;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Graph Service"), CFSTR("enableGraphService"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v45[3] = v16;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Title Font Service"), CFSTR("enableTitleFontService"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v45[4] = v17;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Complete My Moment Service"), CFSTR("enableCompleteMyMomentService"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v45[5] = v18;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Debug Dictionary Service"), CFSTR("enableDebugDictionaryService"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v45[6] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sectionWithRows:title:", v20, CFSTR("Settings"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Scroll Stress"), CFSTR("enableScrollService"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v22;
  objc_msgSend(MEMORY[0x1E0D830B0], "rowWithTitle:valueKeyPath:", CFSTR("Scroll Speed (pt/f)"), CFSTR("scrollSpeed"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "px_possibleValues:", &unk_1E53E9A50);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "conditionFormat:", CFSTR("enableScrollService != 0"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v25;
  objc_msgSend(MEMORY[0x1E0D830B0], "rowWithTitle:valueKeyPath:", CFSTR("Iterations"), CFSTR("scrollIterations"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "px_possibleValues:", &unk_1E53E9A68);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "conditionFormat:", CFSTR("enableScrollService != 0"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sectionWithRows:title:", v29, CFSTR("Scroll"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)MEMORY[0x1E0D83078];
  v43[0] = v37;
  v43[1] = v36;
  v43[2] = v30;
  v43[3] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "moduleWithTitle:contents:", CFSTR("Diagnostics"), v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

uint64_t __53__PXDiagnosticsSettings_UI__settingsControllerModule__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentContextualDiagnostics");
}

void __53__PXDiagnosticsSettings_UI__settingsControllerModule__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  PXGenericDiagnosticsService *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "currentItemProviders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXDiagnosticsService initWithItemProviders:]([PXGenericDiagnosticsService alloc], "initWithItemProviders:", v3);
  if (-[PXGenericDiagnosticsService canProvideSettingsViewController](v4, "canProvideSettingsViewController"))
  {
    -[PXGenericDiagnosticsService settingsViewController](v4, "settingsViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pushViewController:animated:", v5, 1);

  }
}

@end
