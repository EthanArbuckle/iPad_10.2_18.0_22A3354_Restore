@implementation SBHLibraryPodZoomSettings

- (void)setDefaultValues
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SBHLibraryPodZoomSettings;
  -[SBHFolderZoomSettings setDefaultValues](&v2, sel_setDefaultValues);
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
  objc_super v15;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___SBHLibraryPodZoomSettings;
  objc_msgSendSuper2(&v15, sel_settingsControllerModule);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "submoduleWithModule:childSettingsKeyPath:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0DA9D80], "_moduleWithSectionTitle:delay:frameRate:", CFSTR("Inner Folder Edge Zoom"), 1, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "submoduleWithModule:childSettingsKeyPath:", v6, CFSTR("innerFolderEdgeZoomSettings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0DA9D80], "_moduleWithSectionTitle:delay:frameRate:", CFSTR("Inner Folder Center Zoom"), 1, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "submoduleWithModule:childSettingsKeyPath:", v9, CFSTR("innerFolderCenterZoomSettings"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0D83078];
  v16[0] = v7;
  v16[1] = v10;
  v16[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "moduleWithTitle:contents:", 0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_defaultCentralAnimationSettings
{
  void *v2;
  CAFrameRateRange v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9D80]), "initWithDefaultValues");
  objc_msgSend(v2, "setAnimationType:", 1);
  objc_msgSend(v2, "setMass:", 1.0);
  objc_msgSend(v2, "setStiffness:", 157.91);
  objc_msgSend(v2, "setDamping:", 25.13);
  objc_msgSend(v2, "setCurve:", 196608);
  v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v2, "setFrameRateRange:highFrameRateReason:", 1114123, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
  return v2;
}

+ (id)_defaultCrossfadeSettings
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9D80]), "initWithDefaultValues");
  objc_msgSend(v2, "setAnimationType:", 0);
  objc_msgSend(v2, "setDuration:", 0.2);
  objc_msgSend(v2, "setCurve:", 0x10000);
  return v2;
}

+ (id)_defaultInnerFolderZoomAnimationSettings
{
  void *v2;
  CAFrameRateRange v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9D80]), "initWithDefaultValues");
  objc_msgSend(v2, "setAnimationType:", 1);
  objc_msgSend(v2, "setMass:", 1.0);
  objc_msgSend(v2, "setStiffness:", 246.74);
  objc_msgSend(v2, "setDamping:", 31.42);
  objc_msgSend(v2, "setCurve:", 196608);
  v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v2, "setFrameRateRange:highFrameRateReason:", 1114123, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
  return v2;
}

+ (double)_defaultInnerFolderZoomDelay
{
  return 0.05;
}

- (SBFAnimationSettings)innerFolderEdgeZoomSettings
{
  return self->super._innerFolderFadeSettings;
}

- (void)setInnerFolderEdgeZoomSettings:(id)a3
{
  objc_storeStrong((id *)&self->super._innerFolderFadeSettings, a3);
}

- (SBFAnimationSettings)innerFolderCenterZoomSettings
{
  return self->_innerFolderEdgeZoomSettings;
}

- (void)setInnerFolderCenterZoomSettings:(id)a3
{
  objc_storeStrong((id *)&self->_innerFolderEdgeZoomSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerFolderEdgeZoomSettings, 0);
  objc_storeStrong((id *)&self->super._innerFolderFadeSettings, 0);
}

@end
