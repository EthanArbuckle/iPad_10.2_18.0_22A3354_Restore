@implementation PXGridSettings

- (int64_t)weightingScheme
{
  return self->_weightingScheme;
}

+ (PXGridSettings)sharedInstance
{
  if (sharedInstance_onceToken_113195 != -1)
    dispatch_once(&sharedInstance_onceToken_113195, &__block_literal_global_113196);
  return (PXGridSettings *)(id)sharedInstance_sharedInstance_113197;
}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGridSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXGridSettings setDisableSelectionOverlayView:](self, "setDisableSelectionOverlayView:", 0);
  -[PXGridSettings setWeightingScheme:](self, "setWeightingScheme:", 0);
  -[PXGridSettings setEnableAutomaticTransitionToSelectMode:](self, "setEnableAutomaticTransitionToSelectMode:", 0);
  -[PXGridSettings setSimulateLongTitles:](self, "setSimulateLongTitles:", 0);
  -[PXGridSettings setSimulatedNumberOfLocations:](self, "setSimulatedNumberOfLocations:", 0);
}

- (void)setWeightingScheme:(int64_t)a3
{
  self->_weightingScheme = a3;
}

- (void)setSimulatedNumberOfLocations:(int64_t)a3
{
  self->_simulatedNumberOfLocations = a3;
}

- (void)setSimulateLongTitles:(BOOL)a3
{
  self->_simulateLongTitles = a3;
}

- (void)setEnableAutomaticTransitionToSelectMode:(BOOL)a3
{
  self->_enableAutomaticTransitionToSelectMode = a3;
}

- (void)setDisableSelectionOverlayView:(BOOL)a3
{
  self->_disableSelectionOverlayView = a3;
}

void __32__PXGridSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "grid");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_113197;
  sharedInstance_sharedInstance_113197 = v0;

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
  _QWORD v20[2];
  _QWORD v21[6];

  v21[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Disable Selection Overlay"), CFSTR("disableSelectionOverlayView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v19;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Layout Weight"), CFSTR("weightingScheme"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "possibleValues:titles:", &unk_1E53E9498, &unk_1E53E94B0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v4;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Automatic Transition To Select Mode"), CFSTR("enableAutomaticTransitionToSelectMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v5;
  v6 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_simulateLongTitles);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rowWithTitle:valueKeyPath:", CFSTR("Fake Long Titles"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v8;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Fake Locations"), CFSTR("simulatedNumberOfLocations"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minValue:maxValue:", 0.0, 10.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "px_increment:", 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v12, CFSTR("Settings"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0D83078];
  v20[0] = v13;
  v20[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "moduleWithTitle:contents:", CFSTR("Grid"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (BOOL)disableSelectionOverlayView
{
  return self->_disableSelectionOverlayView;
}

- (BOOL)enableAutomaticTransitionToSelectMode
{
  return self->_enableAutomaticTransitionToSelectMode;
}

- (BOOL)simulateLongTitles
{
  return self->_simulateLongTitles;
}

- (int64_t)simulatedNumberOfLocations
{
  return self->_simulatedNumberOfLocations;
}

@end
