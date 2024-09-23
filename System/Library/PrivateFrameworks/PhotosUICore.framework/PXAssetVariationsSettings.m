@implementation PXAssetVariationsSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXAssetVariationsSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXAssetVariationsSettings setSelectionDetailsDismissalDelay:](self, "setSelectionDetailsDismissalDelay:", 0.25);
  -[PXAssetVariationsSettings setSuggestionsScheme:](self, "setSuggestionsScheme:", 0);
  -[PXAssetVariationsSettings setLayoutStyle:](self, "setLayoutStyle:", 0);
  -[PXAssetVariationsSettings setSimulateLoadingFailure:](self, "setSimulateLoadingFailure:", 0);
  -[PXAssetVariationsSettings setUseNeutrinoRendering:](self, "setUseNeutrinoRendering:", 1);
  -[PXAssetVariationsSettings setShowStatusInDisclosureLabel:](self, "setShowStatusInDisclosureLabel:", 0);
  -[PXAssetVariationsSettings setShowLoopBadges:](self, "setShowLoopBadges:", 0);
  -[PXAssetVariationsSettings setInvalidateCachedPreviews:](self, "setInvalidateCachedPreviews:", 1);
  -[PXAssetVariationsSettings setUseLiveRenderedPreviews:](self, "setUseLiveRenderedPreviews:", 1);
  -[PXAssetVariationsSettings setSimulateSavingFailure:](self, "setSimulateSavingFailure:", 0);
}

- (void)setUseNeutrinoRendering:(BOOL)a3
{
  self->_useNeutrinoRendering = a3;
}

- (void)setUseLiveRenderedPreviews:(BOOL)a3
{
  self->_useLiveRenderedPreviews = a3;
}

- (void)setSuggestionsScheme:(int64_t)a3
{
  self->_suggestionsScheme = a3;
}

- (void)setSimulateSavingFailure:(BOOL)a3
{
  self->_simulateSavingFailure = a3;
}

- (void)setSimulateLoadingFailure:(BOOL)a3
{
  self->_simulateLoadingFailure = a3;
}

- (void)setShowStatusInDisclosureLabel:(BOOL)a3
{
  self->_showStatusInDisclosureLabel = a3;
}

- (void)setShowLoopBadges:(BOOL)a3
{
  self->_showLoopBadges = a3;
}

- (void)setSelectionDetailsDismissalDelay:(double)a3
{
  self->_selectionDetailsDismissalDelay = a3;
}

- (void)setLayoutStyle:(int64_t)a3
{
  self->_layoutStyle = a3;
}

- (void)setInvalidateCachedPreviews:(BOOL)a3
{
  self->_invalidateCachedPreviews = a3;
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
  void *v23;
  _QWORD v24[2];
  _QWORD v25[12];

  v25[10] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Selection Details Dismissal Delay"), CFSTR("selectionDetailsDismissalDelay"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "minValue:maxValue:", 0.0, 1.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "px_increment:", 0.05);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v21;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Suggestions"), CFSTR("suggestionsScheme"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "possibleValues:titles:", &unk_1E53E9438, &unk_1E53E9450);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v19;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Layout Style"), CFSTR("layoutStyle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "possibleValues:titles:", &unk_1E53E9468, &unk_1E53E9480);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v3;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Simulate Loading Failure"), CFSTR("simulateLoadingFailure"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v4;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Simulate Saving Failure"), CFSTR("simulateSavingFailure"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v5;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Use Full Edit Rendering"), CFSTR("useNeutrinoRendering"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v6;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Status"), CFSTR("showStatusInDisclosureLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[6] = v7;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Loop Badges"), CFSTR("showLoopBadges"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[7] = v8;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Invalidate Previews on Edit"), CFSTR("invalidateCachedPreviews"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[8] = v9;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Live Rendered Previews"), CFSTR("useLiveRenderedPreviews"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[9] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v11, CFSTR("Settings"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0D83078];
  v24[0] = v12;
  v24[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "moduleWithTitle:contents:", CFSTR("Variations"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (double)selectionDetailsDismissalDelay
{
  return self->_selectionDetailsDismissalDelay;
}

- (int64_t)suggestionsScheme
{
  return self->_suggestionsScheme;
}

- (BOOL)addSimulatedProgressComponent
{
  return self->_addSimulatedProgressComponent;
}

- (void)setAddSimulatedProgressComponent:(BOOL)a3
{
  self->_addSimulatedProgressComponent = a3;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (BOOL)simulateLoadingFailure
{
  return self->_simulateLoadingFailure;
}

- (BOOL)simulateSavingFailure
{
  return self->_simulateSavingFailure;
}

- (BOOL)useNeutrinoRendering
{
  return self->_useNeutrinoRendering;
}

- (BOOL)showStatusInDisclosureLabel
{
  return self->_showStatusInDisclosureLabel;
}

- (BOOL)showLoopBadges
{
  return self->_showLoopBadges;
}

- (BOOL)invalidateCachedPreviews
{
  return self->_invalidateCachedPreviews;
}

- (BOOL)useLiveRenderedPreviews
{
  return self->_useLiveRenderedPreviews;
}

+ (PXAssetVariationsSettings)sharedInstance
{
  if (sharedInstance_onceToken_113329 != -1)
    dispatch_once(&sharedInstance_onceToken_113329, &__block_literal_global_113330);
  return (PXAssetVariationsSettings *)(id)sharedInstance_sharedInstance_113331;
}

void __43__PXAssetVariationsSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "variationsSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_113331;
  sharedInstance_sharedInstance_113331 = v0;

}

@end
