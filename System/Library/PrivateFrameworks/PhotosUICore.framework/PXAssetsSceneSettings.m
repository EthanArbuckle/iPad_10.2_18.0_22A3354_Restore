@implementation PXAssetsSceneSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXAssetsSceneSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXAssetsSceneSettings setTransitionDuration:](self, "setTransitionDuration:", 0.3);
  -[PXAssetsSceneSettings setEnableImagePreheating:](self, "setEnableImagePreheating:", 1);
  -[PXAssetsSceneSettings setShowBordersOnAnimatedContent:](self, "setShowBordersOnAnimatedContent:", 0);
  -[PXAssetsSceneSettings setAnimateContentByDefault:](self, "setAnimateContentByDefault:", 0);
  -[PXAssetsSceneSettings setAllowLivePhotoPlayback:](self, "setAllowLivePhotoPlayback:", 1);
  -[PXAssetsSceneSettings setPlayLivePhotosAsLoops:](self, "setPlayLivePhotosAsLoops:", 1);
  -[PXAssetsSceneSettings setAllowAnimatedImagePlayback:](self, "setAllowAnimatedImagePlayback:", 1);
  -[PXAssetsSceneSettings setAllowVideoPlayback:](self, "setAllowVideoPlayback:", 1);
  -[PXAssetsSceneSettings setAllowLoopingVideoPlayback:](self, "setAllowLoopingVideoPlayback:", 1);
}

- (void)setTransitionDuration:(double)a3
{
  self->_transitionDuration = a3;
}

- (void)setShowBordersOnAnimatedContent:(BOOL)a3
{
  self->_showBordersOnAnimatedContent = a3;
}

- (void)setPlayLivePhotosAsLoops:(BOOL)a3
{
  self->_playLivePhotosAsLoops = a3;
}

- (void)setEnableImagePreheating:(BOOL)a3
{
  self->_enableImagePreheating = a3;
}

- (void)setAnimateContentByDefault:(BOOL)a3
{
  self->_animateContentByDefault = a3;
}

- (void)setAllowVideoPlayback:(BOOL)a3
{
  self->_allowVideoPlayback = a3;
}

- (void)setAllowLoopingVideoPlayback:(BOOL)a3
{
  self->_allowLoopingVideoPlayback = a3;
}

- (void)setAllowLivePhotoPlayback:(BOOL)a3
{
  self->_allowLivePhotoPlayback = a3;
}

- (void)setAllowAnimatedImagePlayback:(BOOL)a3
{
  self->_allowAnimatedImagePlayback = a3;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (double)transitionDuration
{
  return self->_transitionDuration;
}

- (BOOL)enableImagePreheating
{
  return self->_enableImagePreheating;
}

- (BOOL)showBordersOnAnimatedContent
{
  return self->_showBordersOnAnimatedContent;
}

- (BOOL)animateContentByDefault
{
  return self->_animateContentByDefault;
}

- (BOOL)allowLivePhotoPlayback
{
  return self->_allowLivePhotoPlayback;
}

- (BOOL)playLivePhotosAsLoops
{
  return self->_playLivePhotosAsLoops;
}

- (BOOL)allowLoopingVideoPlayback
{
  return self->_allowLoopingVideoPlayback;
}

- (BOOL)allowVideoPlayback
{
  return self->_allowVideoPlayback;
}

- (BOOL)allowAnimatedImagePlayback
{
  return self->_allowAnimatedImagePlayback;
}

+ (PXAssetsSceneSettings)sharedInstance
{
  if (sharedInstance_onceToken_164064 != -1)
    dispatch_once(&sharedInstance_onceToken_164064, &__block_literal_global_164065);
  return (PXAssetsSceneSettings *)(id)sharedInstance_sharedInstance_164066;
}

void __39__PXAssetsSceneSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetsScene");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_164066;
  sharedInstance_sharedInstance_164066 = v0;

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
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[3];
  _QWORD v26[7];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Transition Duration"), CFSTR("transitionDuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minValue:maxValue:", 0.0, 10.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v4;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Image Preheating"), CFSTR("enableImagePreheating"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v6, CFSTR("Settings"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Animate by Default"), CFSTR("animateContentByDefault"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v23;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Allow Live Photos"), CFSTR("allowLivePhotoPlayback"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v22;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Loop Live Photos"), CFSTR("playLivePhotosAsLoops"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("allowLivePhotoPlayback == YES"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "condition:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v10;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Allow Looping Videos"), CFSTR("allowLoopingVideoPlayback"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v11;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Allow Videos"), CFSTR("allowVideoPlayback"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v12;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Allow Animated Images"), CFSTR("allowAnimatedImagePlayback"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[5] = v13;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Borders On Animated Content"), CFSTR("showBordersOnAnimatedContent"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[6] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionWithRows:title:", v15, CFSTR("Animated Content"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0D83078];
  v25[0] = v24;
  v25[1] = v16;
  v25[2] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "moduleWithTitle:contents:", CFSTR("Assets Scene"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

@end
