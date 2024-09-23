@implementation PBUIWallpaperWindowSceneSettingsDiffInspector

- (void)observeWallpaperVariantWithBlock:(id)a3
{
  -[PBUIWallpaperWindowSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 727229969, a3);
}

- (void)observeLockscreenWallpaperContentsRectWithBlock:(id)a3
{
  -[PBUIWallpaperWindowSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 727229970, a3);
}

- (void)observeLockscreenWallpaperAlphaWithBlock:(id)a3
{
  -[PBUIWallpaperWindowSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 727229971, a3);
}

- (void)observeHomescreenWallpaperAlphaWithBlock:(id)a3
{
  -[PBUIWallpaperWindowSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 727229972, a3);
}

- (void)observeLockscreenOnlyWallpaperAlphaWithBlock:(id)a3
{
  -[PBUIWallpaperWindowSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 727229973, a3);
}

- (void)observeDisallowHomescreenRasterizationWithBlock:(id)a3
{
  -[PBUIWallpaperWindowSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 727229974, a3);
}

- (void)observeDisallowLockscreenRasterizationWithBlock:(id)a3
{
  -[PBUIWallpaperWindowSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 727229975, a3);
}

- (void)observeHomescreenWallpaperHiddenWithBlock:(id)a3
{
  -[PBUIWallpaperWindowSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 727229976, a3);
}

- (void)observeLockscreenWallpaperHiddenWithBlock:(id)a3
{
  -[PBUIWallpaperWindowSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 727229977, a3);
}

- (void)observeWallpaperAnimationSuspendedWithBlock:(id)a3
{
  -[PBUIWallpaperWindowSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 727229978, a3);
}

- (void)observeWallpaperRequiredWithBlock:(id)a3
{
  -[PBUIWallpaperWindowSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 727229979, a3);
}

- (void)observeHomescreenStyleChangesDelayedWithBlock:(id)a3
{
  -[PBUIWallpaperWindowSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 727229980, a3);
}

- (void)observeCachingIdentifierWithBlock:(id)a3
{
  -[PBUIWallpaperWindowSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 727229981, a3);
}

- (void)observeHomescreenStyleTransitionStateWithBlock:(id)a3
{
  -[PBUIWallpaperWindowSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 727229982, a3);
}

- (void)observeLockscreenStyleTransitionStateWithBlock:(id)a3
{
  -[PBUIWallpaperWindowSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 727229983, a3);
}

- (void)observeLiveWallpaperTouchActiveWithBlock:(id)a3
{
  -[PBUIWallpaperWindowSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 727229984, a3);
}

- (void)observeLiveWallpaperInteractiveWithBlock:(id)a3
{
  -[PBUIWallpaperWindowSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 727229985, a3);
}

- (void)_observeOtherSetting:(unint64_t)a3 withBlock:(id)a4
{
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __80__PBUIWallpaperWindowSceneSettingsDiffInspector__observeOtherSetting_withBlock___block_invoke;
    v8[3] = &unk_1E6B95A58;
    v9 = v6;
    -[FBSSettingsDiffInspector observeOtherSetting:withBlock:](self, "observeOtherSetting:withBlock:", a3, v8);

  }
}

uint64_t __80__PBUIWallpaperWindowSceneSettingsDiffInspector__observeOtherSetting_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
