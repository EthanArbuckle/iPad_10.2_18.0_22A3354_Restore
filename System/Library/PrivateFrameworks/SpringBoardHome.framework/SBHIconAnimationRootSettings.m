@implementation SBHIconAnimationRootSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHIconAnimationRootSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[SBHIconAnimationRootSettings setMaxAppSuspendHintProgress:](self, "setMaxAppSuspendHintProgress:", 0.05);
  -[SBHIconAnimationRootSettings setMaxAppLaunchWallpaperScale:](self, "setMaxAppLaunchWallpaperScale:", 1.1);
  -[SBHIconAnimationRootSettings setMaxFolderCloseHintProgress:](self, "setMaxFolderCloseHintProgress:", 0.1);
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
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[6];
  void *v43;
  _QWORD v44[5];
  _QWORD v45[3];
  _QWORD v46[8];
  void *v47;
  _QWORD v48[3];

  v48[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Reduced Motion"), CFSTR("reducedMotionSettings"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:", v3, 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Unlock"), CFSTR("unlockSettings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:", v38, 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Center Launch"), CFSTR("centerLaunchSettings"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v39;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Center Suspend"), CFSTR("centerSuspendSettings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v5;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Center Accelerated Suspend"), CFSTR("centerAcceleratedSuspendSettings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v46[2] = v6;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Crossfade Launch"), CFSTR("crossfadeLaunchSettings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v46[3] = v7;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Crossfade Suspend"), CFSTR("crossfadeSuspendSettings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v46[4] = v8;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Crossfade Accelerated Suspend"), CFSTR("crossfadeAcceleratedSuspendSettings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v46[5] = v9;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Max Suspend Hint Progress"), CFSTR("maxAppSuspendHintProgress"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minValue:maxValue:", 0.0, 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v46[6] = v11;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Max App Launch Wallpaper Scale"), CFSTR("maxAppLaunchWallpaperScale"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "minValue:maxValue:", 1.0, 3.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v46[7] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:", v14, CFSTR("Launch/Suspend Animations"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Folder Open"), CFSTR("folderOpenSettings"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v16;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Folder Close"), CFSTR("folderCloseSettings"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v17;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Max Close Hint Progress"), CFSTR("maxFolderCloseHintProgress"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "minValue:maxValue:", 0.0, 1.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:", v20, CFSTR("Folder Animations"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Library Wave Open"), CFSTR("libraryWaveOpenSettings"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v22;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Library Wave Close"), CFSTR("libraryWaveCloseSettings"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v23;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Library Pod Open"), CFSTR("libraryPodOpenSettings"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v24;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Library Pod Close"), CFSTR("libraryPodCloseSettings"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v44[3] = v25;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Library Indicator Icon"), CFSTR("libraryIndicatorIconSettings"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v44[4] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 5);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:", v27, CFSTR("Library Animations"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "action");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "rowWithTitle:action:", CFSTR("Restore Defaults"), v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)MEMORY[0x1E0D83078];
  v42[0] = v41;
  v42[1] = v40;
  v42[2] = v15;
  v42[3] = v28;
  v42[4] = v21;
  v42[5] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 6);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "moduleWithTitle:contents:", CFSTR("Icon Animations"), v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

- (SBHReducedMotionFadeSettings)reducedMotionSettings
{
  return self->_reducedMotionSettings;
}

- (void)setReducedMotionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_reducedMotionSettings, a3);
}

- (SBHUnlockSettings)unlockSettings
{
  return self->_unlockSettings;
}

- (void)setUnlockSettings:(id)a3
{
  objc_storeStrong((id *)&self->_unlockSettings, a3);
}

- (SBHCenterAppLaunchSettings)centerLaunchSettings
{
  return self->_centerLaunchSettings;
}

- (void)setCenterLaunchSettings:(id)a3
{
  objc_storeStrong((id *)&self->_centerLaunchSettings, a3);
}

- (SBHCenterAppSuspendSettings)centerSuspendSettings
{
  return self->_centerSuspendSettings;
}

- (void)setCenterSuspendSettings:(id)a3
{
  objc_storeStrong((id *)&self->_centerSuspendSettings, a3);
}

- (SBHCenterAcceleratedAppSuspendSettings)centerAcceleratedSuspendSettings
{
  return self->_centerAcceleratedSuspendSettings;
}

- (void)setCenterAcceleratedSuspendSettings:(id)a3
{
  objc_storeStrong((id *)&self->_centerAcceleratedSuspendSettings, a3);
}

- (SBHCrossfadeAppLaunchSettings)crossfadeLaunchSettings
{
  return self->_crossfadeLaunchSettings;
}

- (void)setCrossfadeLaunchSettings:(id)a3
{
  objc_storeStrong((id *)&self->_crossfadeLaunchSettings, a3);
}

- (SBHCrossfadeAppSuspendSettings)crossfadeSuspendSettings
{
  return self->_crossfadeSuspendSettings;
}

- (void)setCrossfadeSuspendSettings:(id)a3
{
  objc_storeStrong((id *)&self->_crossfadeSuspendSettings, a3);
}

- (SBHCrossfadeAcceleratedAppSuspendSettings)crossfadeAcceleratedSuspendSettings
{
  return self->_crossfadeAcceleratedSuspendSettings;
}

- (void)setCrossfadeAcceleratedSuspendSettings:(id)a3
{
  objc_storeStrong((id *)&self->_crossfadeAcceleratedSuspendSettings, a3);
}

- (double)maxAppSuspendHintProgress
{
  return self->_maxAppSuspendHintProgress;
}

- (void)setMaxAppSuspendHintProgress:(double)a3
{
  self->_maxAppSuspendHintProgress = a3;
}

- (double)maxAppLaunchWallpaperScale
{
  return self->_maxAppLaunchWallpaperScale;
}

- (void)setMaxAppLaunchWallpaperScale:(double)a3
{
  self->_maxAppLaunchWallpaperScale = a3;
}

- (SBHFolderOpenSettings)folderOpenSettings
{
  return self->_folderOpenSettings;
}

- (void)setFolderOpenSettings:(id)a3
{
  objc_storeStrong((id *)&self->_folderOpenSettings, a3);
}

- (SBHFolderCloseSettings)folderCloseSettings
{
  return self->_folderCloseSettings;
}

- (void)setFolderCloseSettings:(id)a3
{
  objc_storeStrong((id *)&self->_folderCloseSettings, a3);
}

- (double)maxFolderCloseHintProgress
{
  return self->_maxFolderCloseHintProgress;
}

- (void)setMaxFolderCloseHintProgress:(double)a3
{
  self->_maxFolderCloseHintProgress = a3;
}

- (SBHLibraryPodOpenSettings)libraryPodOpenSettings
{
  return self->_libraryPodOpenSettings;
}

- (void)setLibraryPodOpenSettings:(id)a3
{
  objc_storeStrong((id *)&self->_libraryPodOpenSettings, a3);
}

- (SBHLibraryPodCloseSettings)libraryPodCloseSettings
{
  return self->_libraryPodCloseSettings;
}

- (void)setLibraryPodCloseSettings:(id)a3
{
  objc_storeStrong((id *)&self->_libraryPodCloseSettings, a3);
}

- (SBHLibraryWaveOpenSettings)libraryWaveOpenSettings
{
  return self->_libraryWaveOpenSettings;
}

- (void)setLibraryWaveOpenSettings:(id)a3
{
  objc_storeStrong((id *)&self->_libraryWaveOpenSettings, a3);
}

- (SBHLibraryWaveCloseSettings)libraryWaveCloseSettings
{
  return self->_libraryWaveCloseSettings;
}

- (void)setLibraryWaveCloseSettings:(id)a3
{
  objc_storeStrong((id *)&self->_libraryWaveCloseSettings, a3);
}

- (SBHLibraryIndicatorIconSettings)libraryIndicatorIconSettings
{
  return self->_libraryIndicatorIconSettings;
}

- (void)setLibraryIndicatorIconSettings:(id)a3
{
  objc_storeStrong((id *)&self->_libraryIndicatorIconSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryIndicatorIconSettings, 0);
  objc_storeStrong((id *)&self->_libraryWaveCloseSettings, 0);
  objc_storeStrong((id *)&self->_libraryWaveOpenSettings, 0);
  objc_storeStrong((id *)&self->_libraryPodCloseSettings, 0);
  objc_storeStrong((id *)&self->_libraryPodOpenSettings, 0);
  objc_storeStrong((id *)&self->_folderCloseSettings, 0);
  objc_storeStrong((id *)&self->_folderOpenSettings, 0);
  objc_storeStrong((id *)&self->_crossfadeAcceleratedSuspendSettings, 0);
  objc_storeStrong((id *)&self->_crossfadeSuspendSettings, 0);
  objc_storeStrong((id *)&self->_crossfadeLaunchSettings, 0);
  objc_storeStrong((id *)&self->_centerAcceleratedSuspendSettings, 0);
  objc_storeStrong((id *)&self->_centerSuspendSettings, 0);
  objc_storeStrong((id *)&self->_centerLaunchSettings, 0);
  objc_storeStrong((id *)&self->_unlockSettings, 0);
  objc_storeStrong((id *)&self->_reducedMotionSettings, 0);
}

@end
