@implementation PXInlineVideoStabilizationSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXInlineVideoStabilizationSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXInlineVideoStabilizationSettings setCrossfadeEnabled:](self, "setCrossfadeEnabled:", 1);
  -[PXInlineVideoStabilizationSettings setTimeRangeEnabled:](self, "setTimeRangeEnabled:", 1);
  -[PXInlineVideoStabilizationSettings setGyroStabilizationEnabled:](self, "setGyroStabilizationEnabled:", 1);
  -[PXInlineVideoStabilizationSettings setPixelStabilizationEnabled:](self, "setPixelStabilizationEnabled:", 1);
  -[PXInlineVideoStabilizationSettings setAllowedCropFraction:](self, "setAllowedCropFraction:", 0.1);
  -[PXInlineVideoStabilizationSettings setUseMediaAnalysisRecipe:](self, "setUseMediaAnalysisRecipe:", 1);
  -[PXInlineVideoStabilizationSettings setLocalCacheForMediaAnalysisRecipes:](self, "setLocalCacheForMediaAnalysisRecipes:", 1);
  -[PXInlineVideoStabilizationSettings setShowDiagnosticUI:](self, "setShowDiagnosticUI:", 1);
}

- (void)setUseMediaAnalysisRecipe:(BOOL)a3
{
  self->_useMediaAnalysisRecipe = a3;
}

- (void)setTimeRangeEnabled:(BOOL)a3
{
  self->_timeRangeEnabled = a3;
}

- (void)setShowDiagnosticUI:(BOOL)a3
{
  self->_showDiagnosticUI = a3;
}

- (void)setPixelStabilizationEnabled:(BOOL)a3
{
  self->_pixelStabilizationEnabled = a3;
}

- (void)setLocalCacheForMediaAnalysisRecipes:(BOOL)a3
{
  self->_localCacheForMediaAnalysisRecipes = a3;
}

- (void)setGyroStabilizationEnabled:(BOOL)a3
{
  self->_gyroStabilizationEnabled = a3;
}

- (void)setCrossfadeEnabled:(BOOL)a3
{
  self->_crossfadeEnabled = a3;
}

- (void)setAllowedCropFraction:(double)a3
{
  self->_allowedCropFraction = a3;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (unint64_t)allowedAnalysisTypes
{
  uint64_t v3;

  if (-[PXInlineVideoStabilizationSettings gyroStabilizationEnabled](self, "gyroStabilizationEnabled"))
    v3 = 2;
  else
    v3 = 0;
  return v3 | -[PXInlineVideoStabilizationSettings pixelStabilizationEnabled](self, "pixelStabilizationEnabled");
}

- (BOOL)useMediaAnalysisRecipe
{
  return self->_useMediaAnalysisRecipe;
}

- (BOOL)localCacheForMediaAnalysisRecipes
{
  return self->_localCacheForMediaAnalysisRecipes;
}

- (double)allowedCropFraction
{
  return self->_allowedCropFraction;
}

- (BOOL)crossfadeEnabled
{
  return self->_crossfadeEnabled;
}

- (BOOL)timeRangeEnabled
{
  return self->_timeRangeEnabled;
}

- (BOOL)gyroStabilizationEnabled
{
  return self->_gyroStabilizationEnabled;
}

- (BOOL)pixelStabilizationEnabled
{
  return self->_pixelStabilizationEnabled;
}

- (BOOL)showDiagnosticUI
{
  return self->_showDiagnosticUI;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_83817 != -1)
    dispatch_once(&sharedInstance_onceToken_83817, &__block_literal_global_83818);
  return (id)sharedInstance_sharedInstance_83819;
}

+ (id)transientProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PXInlineVideoStabilizationSettings_transientProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transientProperties_onceToken_83813 != -1)
    dispatch_once(&transientProperties_onceToken_83813, block);
  return (id)transientProperties_transientProperties_83814;
}

void __57__PXInlineVideoStabilizationSettings_transientProperties__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___PXInlineVideoStabilizationSettings;
  objc_msgSendSuper2(&v5, sel_transientProperties);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_allowedAnalysisTypes);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setByAddingObject:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)transientProperties_transientProperties_83814;
  transientProperties_transientProperties_83814 = v3;

}

void __52__PXInlineVideoStabilizationSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inlineVideoStabilizationSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_83819;
  sharedInstance_sharedInstance_83819 = v0;

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
  _QWORD v21[2];
  _QWORD v22[9];

  v22[8] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Use Media Analysis Recipe"), CFSTR("useMediaAnalysisRecipe"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v20;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Cache Recipes Locally"), CFSTR("localCacheForMediaAnalysisRecipes"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "conditionFormat:", CFSTR("useMediaAnalysisRecipe == YES"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v18;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Max Crop"), CFSTR("allowedCropFraction"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minValue:maxValue:", 0.1, 0.5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conditionFormat:", CFSTR("useMediaAnalysisRecipe == NO"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v5;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Gyro Enabled"), CFSTR("gyroStabilizationEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v6;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Pixel-Based Enabled"), CFSTR("pixelStabilizationEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v7;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Crossfade Enabled"), CFSTR("crossfadeEnabled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v8;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Time Range Enabled"), CFSTR("timeRangeEnabled"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v9;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Diagnostic UI Enabled"), CFSTR("showDiagnosticUI"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[7] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v11, CFSTR("Settings"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0D83078];
  v21[0] = v12;
  v21[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "moduleWithTitle:contents:", CFSTR("Inline Stabilization"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

@end
