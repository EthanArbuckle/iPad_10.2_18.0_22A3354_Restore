@implementation PXStoryScrubberLayoutSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryScrubberLayoutSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXStoryScrubberLayoutSettings setCurrentAssetWidthLandscape:](self, "setCurrentAssetWidthLandscape:", 40.0);
  -[PXStoryScrubberLayoutSettings setCurrentAssetWidthPortrait:](self, "setCurrentAssetWidthPortrait:", 44.0);
  -[PXStoryScrubberLayoutSettings setDefaultAssetWidthLandscape:](self, "setDefaultAssetWidthLandscape:", 24.0);
  -[PXStoryScrubberLayoutSettings setDefaultAssetWidthPortrait:](self, "setDefaultAssetWidthPortrait:", 27.0);
  -[PXStoryScrubberLayoutSettings currentAssetWidthLandscape](self, "currentAssetWidthLandscape");
  -[PXStoryScrubberLayoutSettings setScrubberHeightLandscape:](self, "setScrubberHeightLandscape:");
  -[PXStoryScrubberLayoutSettings setScrubberHeightPortrait:](self, "setScrubberHeightPortrait:", 44.0);
  -[PXStoryScrubberLayoutSettings setCurrentAssetPadding:](self, "setCurrentAssetPadding:", 12.0);
  -[PXStoryScrubberLayoutSettings setDefaultAssetPadding:](self, "setDefaultAssetPadding:", 6.0);
  -[PXStoryScrubberLayoutSettings setAssetCornerRadius:](self, "setAssetCornerRadius:", 4.0);
}

- (void)setScrubberHeightPortrait:(double)a3
{
  self->_scrubberHeightPortrait = a3;
}

- (void)setScrubberHeightLandscape:(double)a3
{
  self->_scrubberHeightLandscape = a3;
}

- (void)setDefaultAssetWidthPortrait:(double)a3
{
  self->_defaultAssetWidthPortrait = a3;
}

- (void)setDefaultAssetWidthLandscape:(double)a3
{
  self->_defaultAssetWidthLandscape = a3;
}

- (void)setDefaultAssetPadding:(double)a3
{
  self->_defaultAssetPadding = a3;
}

- (void)setCurrentAssetWidthPortrait:(double)a3
{
  self->_currentAssetWidthPortrait = a3;
}

- (void)setCurrentAssetWidthLandscape:(double)a3
{
  self->_currentAssetWidthLandscape = a3;
}

- (void)setCurrentAssetPadding:(double)a3
{
  self->_currentAssetPadding = a3;
}

- (void)setAssetCornerRadius:(double)a3
{
  self->_assetCornerRadius = a3;
}

- (double)currentAssetWidthLandscape
{
  return self->_currentAssetWidthLandscape;
}

+ (id)settingsControllerModule
{
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
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
  _QWORD v42[2];
  _QWORD v43[3];
  _QWORD v44[3];
  _QWORD v45[7];

  v45[5] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D83078];
  v24 = (id)MEMORY[0x1E0D83078];
  NSStringFromSelector(sel_currentAssetWidthLandscape);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_sliderFor:path:", CFSTR("Current Asset Width"), v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v39;
  NSStringFromSelector(sel_defaultAssetWidthLandscape);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_sliderFor:path:", CFSTR("Default Asset Width"), v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v37;
  NSStringFromSelector(sel_scrubberHeightLandscape);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_sliderFor:path:", CFSTR("Scrubber Height"), v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 3);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionWithRows:title:", v34, CFSTR("Landscape Mode"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v33;
  v4 = (void *)MEMORY[0x1E0D83078];
  NSStringFromSelector(sel_currentAssetWidthPortrait);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_sliderFor:path:", CFSTR("Current Asset Width"), v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v31;
  NSStringFromSelector(sel_defaultAssetWidthPortrait);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_sliderFor:path:", CFSTR("Default Asset Width"), v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v29;
  NSStringFromSelector(sel_scrubberHeightPortrait);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_sliderFor:path:", CFSTR("Scrubber Height"), v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWithRows:title:", v26, CFSTR("Portrait Mode"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v23;
  v5 = (void *)MEMORY[0x1E0D83078];
  NSStringFromSelector(sel_currentAssetPadding);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_sliderFor:path:", CFSTR("Current Asset Padding"), v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v21;
  NSStringFromSelector(sel_defaultAssetPadding);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_sliderFor:path:", CFSTR("Default Asset Padding"), v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionWithRows:title:", v6, CFSTR("Horizontal Padding"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v7;
  v8 = (void *)MEMORY[0x1E0D83078];
  v9 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_assetCornerRadius);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rowWithTitle:valueKeyPath:", CFSTR("Asset Corner Radius"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minValue:maxValue:", 0.0, 15.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "px_increment:", 1.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionWithRows:title:", v14, CFSTR("Appearance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v45[3] = v15;
  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v45[4] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "moduleWithTitle:contents:", CFSTR("Layout Settings"), v17);
  v25 = (id)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (id)_sliderFor:(id)a3 path:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minValue:maxValue:", 1.0, 100.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "px_increment:", 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)parentSettings
{
  return +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
}

- (double)currentAssetWidthPortrait
{
  return self->_currentAssetWidthPortrait;
}

- (double)defaultAssetWidthLandscape
{
  return self->_defaultAssetWidthLandscape;
}

- (double)defaultAssetWidthPortrait
{
  return self->_defaultAssetWidthPortrait;
}

- (double)scrubberHeightLandscape
{
  return self->_scrubberHeightLandscape;
}

- (double)scrubberHeightPortrait
{
  return self->_scrubberHeightPortrait;
}

- (double)currentAssetPadding
{
  return self->_currentAssetPadding;
}

- (double)defaultAssetPadding
{
  return self->_defaultAssetPadding;
}

- (double)assetCornerRadius
{
  return self->_assetCornerRadius;
}

+ (PXStoryScrubberLayoutSettings)sharedInstance
{
  if (sharedInstance_onceToken_116194 != -1)
    dispatch_once(&sharedInstance_onceToken_116194, &__block_literal_global_116195);
  return (PXStoryScrubberLayoutSettings *)(id)sharedInstance_sharedInstance_116196;
}

void __47__PXStoryScrubberLayoutSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrubberLayoutSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_116196;
  sharedInstance_sharedInstance_116196 = v0;

}

@end
