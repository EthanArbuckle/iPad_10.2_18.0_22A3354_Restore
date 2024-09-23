@implementation PXPhotosDetailsHeaderTileSettings

- (void)setDefaultValues
{
  void *v3;
  uint64_t v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXPhotosDetailsHeaderTileSettings;
  -[PTSettings setDefaultValues](&v6, sel_setDefaultValues);
  -[PXPhotosDetailsHeaderTileSettings setAspectRatio:](self, "setAspectRatio:", 1.77777779);
  -[PXPhotosDetailsHeaderTileSettings setMaximumHeightRelativeToScreenHeight:](self, "setMaximumHeightRelativeToScreenHeight:", 0.666666687);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = 400.0;
  if (v4 == 2)
    v5 = 720.0;
  -[PXPhotosDetailsHeaderTileSettings setMaximumAbsoluteHeight:](self, "setMaximumAbsoluteHeight:", v5);
  -[PXPhotosDetailsHeaderTileSettings setShowAlways:](self, "setShowAlways:", 1);
}

- (void)setShowAlways:(BOOL)a3
{
  self->_showAlways = a3;
}

- (void)setMaximumHeightRelativeToScreenHeight:(double)a3
{
  self->_maximumHeightRelativeToScreenHeight = a3;
}

- (void)setMaximumAbsoluteHeight:(double)a3
{
  self->_maximumAbsoluteHeight = a3;
}

- (void)setAspectRatio:(double)a3
{
  self->_aspectRatio = a3;
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
  _QWORD v18[2];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Aspect Ratio"), CFSTR("aspectRatio"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minValue:maxValue:", 1.0, 3.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v4;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Max Height (Relative to Screen)"), CFSTR("maximumHeightRelativeToScreenHeight"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minValue:maxValue:", 0.0, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v6;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Max Absolute Height"), CFSTR("maximumAbsoluteHeight"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minValue:maxValue:", 0.0, 2000.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "px_increment:", 10.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v9;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Always"), CFSTR("showAlways"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v11, CFSTR("Settings"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0D83078];
  v18[0] = v12;
  v18[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "moduleWithTitle:contents:", CFSTR("Photos Details Header Tile"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (double)maximumHeightRelativeToScreenHeight
{
  return self->_maximumHeightRelativeToScreenHeight;
}

- (double)maximumAbsoluteHeight
{
  return self->_maximumAbsoluteHeight;
}

- (BOOL)showAlways
{
  return self->_showAlways;
}

+ (PXPhotosDetailsHeaderTileSettings)sharedInstance
{
  if (sharedInstance_onceToken_216738 != -1)
    dispatch_once(&sharedInstance_onceToken_216738, &__block_literal_global_216739);
  return (PXPhotosDetailsHeaderTileSettings *)(id)sharedInstance_sharedInstance_216740;
}

void __51__PXPhotosDetailsHeaderTileSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photosDetailsHeaderTile");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_216740;
  sharedInstance_sharedInstance_216740 = v0;

}

@end
