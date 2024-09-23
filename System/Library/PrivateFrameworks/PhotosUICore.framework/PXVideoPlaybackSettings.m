@implementation PXVideoPlaybackSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXVideoPlaybackSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXVideoPlaybackSettings setMaxHighlightFractionForDisplay:](self, "setMaxHighlightFractionForDisplay:", 0.9);
  -[PXVideoPlaybackSettings setIsDownloadingVideoSegmentsEnabled:](self, "setIsDownloadingVideoSegmentsEnabled:", 1);
}

- (void)setMaxHighlightFractionForDisplay:(double)a3
{
  self->_maxHighlightFractionForDisplay = a3;
}

- (void)setIsDownloadingVideoSegmentsEnabled:(BOOL)a3
{
  self->_isDownloadingVideoSegmentsEnabled = a3;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (BOOL)isDownloadingVideoSegmentsEnabled
{
  return self->_isDownloadingVideoSegmentsEnabled;
}

- (double)maxHighlightFractionForDisplay
{
  return self->_maxHighlightFractionForDisplay;
}

+ (PXVideoPlaybackSettings)sharedInstance
{
  if (sharedInstance_onceToken_100396 != -1)
    dispatch_once(&sharedInstance_onceToken_100396, &__block_literal_global_100397);
  return (PXVideoPlaybackSettings *)(id)sharedInstance_sharedInstance_100398;
}

void __41__PXVideoPlaybackSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "videoPlaybackSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_100398;
  sharedInstance_sharedInstance_100398 = v0;

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
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  v3 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_isDownloadingVideoSegmentsEnabled);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:valueKeyPath:", CFSTR("Download Video Segments"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v5;
  v6 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_maxHighlightFractionForDisplay);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rowWithTitle:valueKeyPath:", CFSTR("Max Highlight Fraction"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minValue:maxValue:", 0.5, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v10, CFSTR("Settings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0D83078];
  v17[0] = v11;
  v17[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "moduleWithTitle:contents:", CFSTR("Video Playback"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
