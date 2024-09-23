@implementation PXFooterSettings

- (void)setDefaultValues
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXFooterSettings;
  -[PTSettings setDefaultValues](&v4, sel_setDefaultValues);
  -[PXFooterSettings setShouldAlternateTitleWithGridCycle:](self, "setShouldAlternateTitleWithGridCycle:", 1);
  -[PXFooterSettings setAlternateTitleGridCycleCount:](self, "setAlternateTitleGridCycleCount:", 2);
  -[PXFooterSettings setAlternateTitleGridCycleDelay:](self, "setAlternateTitleGridCycleDelay:", 0.1);
  -[PXFooterSettings setAlternateTitleCyclingInterval:](self, "setAlternateTitleCyclingInterval:", 4.0);
  -[PXFooterSettings setAnimationDelay:](self, "setAnimationDelay:", 2.0);
  LODWORD(v3) = 1036831949;
  -[PXFooterSettings setMinimumDisplayedProgress:](self, "setMinimumDisplayedProgress:", v3);
  -[PXFooterSettings setSimulateImportantInformation:](self, "setSimulateImportantInformation:", 0);
  -[PXFooterSettings setSimulateAnimatedIconMode:](self, "setSimulateAnimatedIconMode:", 0);
  -[PXFooterSettings setSimulatedAnimatedIconMode:](self, "setSimulatedAnimatedIconMode:", 0);
  -[PXFooterSettings setShowFilterView:](self, "setShowFilterView:", 1);
}

- (void)setSimulatedAnimatedIconMode:(int64_t)a3
{
  self->_simulatedAnimatedIconMode = a3;
}

- (void)setSimulateImportantInformation:(BOOL)a3
{
  self->_simulateImportantInformation = a3;
}

- (void)setSimulateAnimatedIconMode:(BOOL)a3
{
  self->_simulateAnimatedIconMode = a3;
}

- (void)setShowFilterView:(BOOL)a3
{
  self->_showFilterView = a3;
}

- (void)setShouldAlternateTitleWithGridCycle:(BOOL)a3
{
  self->_shouldAlternateTitleWithGridCycle = a3;
}

- (void)setMinimumDisplayedProgress:(float)a3
{
  self->_minimumDisplayedProgress = a3;
}

- (void)setAnimationDelay:(double)a3
{
  self->_animationDelay = a3;
}

- (void)setAlternateTitleGridCycleDelay:(double)a3
{
  self->_alternateTitleGridCycleDelay = a3;
}

- (void)setAlternateTitleGridCycleCount:(int64_t)a3
{
  self->_alternateTitleGridCycleCount = a3;
}

- (void)setAlternateTitleCyclingInterval:(double)a3
{
  self->_alternateTitleCyclingInterval = a3;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[3];
  _QWORD v44[3];
  _QWORD v45[10];

  v45[8] = *MEMORY[0x1E0C80C00];
  v34 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Alt. Title with Grids"), CFSTR("shouldAlternateTitleWithGridCycle"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v42;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Alt. Titles Grid Cycle"), CFSTR("alternateTitleGridCycleCount"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "px_integersFrom:to:", 1, 4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "px_possibleValues:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "conditionFormat:", CFSTR("shouldAlternateTitleWithGridCycle != 0"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v38;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Alt. Titles Delay"), CFSTR("alternateTitleGridCycleDelay"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "minValue:maxValue:", 0.0, 0.5);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "px_increment:", 0.01);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "conditionFormat:", CFSTR("shouldAlternateTitleWithGridCycle != 0"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v32;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Alt. Titles Interval"), CFSTR("alternateTitleCyclingInterval"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "minValue:maxValue:", 0.0, 5.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "px_increment:", 0.2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "conditionFormat:", CFSTR("shouldAlternateTitleWithGridCycle == 0"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v45[3] = v28;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Animation Delay"), CFSTR("animationDelay"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "minValue:maxValue:", 0.0, 5.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_increment:", 0.2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v45[4] = v3;
  v4 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", &__block_literal_global_71873);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowWithTitle:action:", CFSTR("Reset Last Shown Info"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v45[5] = v6;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Minimum Progress"), CFSTR("minimumDisplayedProgress"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minValue:maxValue:", 0.0, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "px_increment:", 0.01);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v45[6] = v9;
  v10 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showFilterView);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rowWithTitle:valueKeyPath:", CFSTR("Show Filter View"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v45[7] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "sectionWithRows:title:", v13, CFSTR("Settings"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Important Information"), CFSTR("simulateImportantInformation"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v15;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Animated Icon Mode"), CFSTR("simulateAnimatedIconMode"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v16;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Animated Icon Mode"), CFSTR("simulatedAnimatedIconMode"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "possibleValues:titles:", &unk_1E53E9090, &unk_1E53E90A8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "conditionFormat:", CFSTR("simulateAnimatedIconMode != 0"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sectionWithRows:title:", v20, CFSTR("Simulate"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0D83078];
  v43[0] = v35;
  v43[1] = v21;
  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "moduleWithTitle:contents:", CFSTR("Footer"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

uint64_t __48__PXFooterSettings_UI__settingsControllerModule__block_invoke()
{
  +[PXFooterSettings resetLastShownInfo](PXFooterSettings, "resetLastShownInfo");
  return 1;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (BOOL)shouldAlternateTitleWithGridCycle
{
  return self->_shouldAlternateTitleWithGridCycle;
}

- (int64_t)alternateTitleGridCycleCount
{
  return self->_alternateTitleGridCycleCount;
}

- (double)alternateTitleGridCycleDelay
{
  return self->_alternateTitleGridCycleDelay;
}

- (double)alternateTitleCyclingInterval
{
  return self->_alternateTitleCyclingInterval;
}

- (double)animationDelay
{
  return self->_animationDelay;
}

- (float)minimumDisplayedProgress
{
  return self->_minimumDisplayedProgress;
}

- (BOOL)simulateImportantInformation
{
  return self->_simulateImportantInformation;
}

- (BOOL)simulateAnimatedIconMode
{
  return self->_simulateAnimatedIconMode;
}

- (int64_t)simulatedAnimatedIconMode
{
  return self->_simulatedAnimatedIconMode;
}

- (BOOL)showFilterView
{
  return self->_showFilterView;
}

+ (PXFooterSettings)sharedInstance
{
  if (sharedInstance_onceToken_192968 != -1)
    dispatch_once(&sharedInstance_onceToken_192968, &__block_literal_global_192969);
  return (PXFooterSettings *)(id)sharedInstance_sharedInstance_192970;
}

+ (void)resetLastShownInfo
{
  id v2;

  +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDidShowCurationFooter:", 0);
  objc_msgSend(v2, "setDidShowCompletedCurationFooterAnimation:", 0);

}

void __34__PXFooterSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "footerSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_192970;
  sharedInstance_sharedInstance_192970 = v0;

}

@end
