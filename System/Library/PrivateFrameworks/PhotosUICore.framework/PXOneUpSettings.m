@implementation PXOneUpSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXOneUpSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXOneUpSettings setMaximumWhitespaceWidthForInitialZoomToFill:](self, "setMaximumWhitespaceWidthForInitialZoomToFill:", 22.0);
}

- (void)setMaximumWhitespaceWidthForInitialZoomToFill:(double)a3
{
  self->_maximumWhitespaceWidthForInitialZoomToFill = a3;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (BOOL)shouldInitiallyZoomContentWithSize:(CGSize)a3 toFillViewWithSize:(CGSize)a4
{
  double height;
  double width;
  double v7;
  double v8;
  uint64_t AspectRatio;
  double v10;
  double v12;
  double v13;
  double v14;
  double v15;

  height = a4.height;
  width = a4.width;
  PXSizeGetAspectRatio();
  v8 = v7;
  AspectRatio = PXSizeGetAspectRatio();
  if (v8 > v10)
    return 0;
  MEMORY[0x1A85CD660](AspectRatio, v8, width, height);
  PXSizeSubtract();
  if (v12 < v13)
    v12 = v13;
  v14 = v12 * 0.5;
  -[PXOneUpSettings maximumWhitespaceWidthForInitialZoomToFill](self, "maximumWhitespaceWidthForInitialZoomToFill");
  return v14 <= v15;
}

- (double)zoomFactorForContentWithSize:(CGSize)a3 toFillViewWithSize:(CGSize)a4
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;

  height = a4.height;
  width = a4.width;
  v6 = a3.height;
  v7 = a3.width;
  v8 = 1.0;
  if ((PXSizeIsEmpty() & 1) == 0 && (PXSizeIsEmpty() & 1) == 0)
  {
    if (width / v7 >= height / v6)
      return width / v7;
    else
      return height / v6;
  }
  return v8;
}

- (double)maximumWhitespaceWidthForInitialZoomToFill
{
  return self->_maximumWhitespaceWidthForInitialZoomToFill;
}

- (BOOL)hideFloatingInfoPanel
{
  return self->_hideFloatingInfoPanel;
}

- (void)setHideFloatingInfoPanel:(BOOL)a3
{
  self->_hideFloatingInfoPanel = a3;
}

+ (PXOneUpSettings)sharedInstance
{
  if (sharedInstance_onceToken_199376 != -1)
    dispatch_once(&sharedInstance_onceToken_199376, &__block_literal_global_199377);
  return (PXOneUpSettings *)(id)sharedInstance_sharedInstance_199378;
}

void __33__PXOneUpSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oneUpSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_199378;
  sharedInstance_sharedInstance_199378 = v0;

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
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  v3 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_maximumWhitespaceWidthForInitialZoomToFill);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:valueKeyPath:", CFSTR("Maximum Whitespace For Initial Zoom"), v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minValue:maxValue:", 0.0, 50.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "px_increment:", 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v6;
  v7 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_hideFloatingInfoPanel);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rowWithTitle:valueKeyPath:", CFSTR("Hide Floating Info Panel"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v10, CFSTR("Settings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "moduleWithTitle:contents:", CFSTR("One Up"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
