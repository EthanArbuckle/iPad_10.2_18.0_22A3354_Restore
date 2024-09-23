@implementation PBUIWallpaperWindowSceneClientSettingsDiffInspector

- (void)observeHomescreenMinimumWallpaperScaleWithBlock:(id)a3
{
  -[PBUIWallpaperWindowSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 1207217227, a3);
}

- (void)observeLockscreenMinimumWallpaperScaleWithBlock:(id)a3
{
  -[PBUIWallpaperWindowSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 1207217228, a3);
}

- (void)observeHomescreenLegibilitySettingsWithBlock:(id)a3
{
  -[PBUIWallpaperWindowSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 1207217229, a3);
}

- (void)observeLockscreenLegibilitySettingsWithBlock:(id)a3
{
  -[PBUIWallpaperWindowSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 1207217230, a3);
}

- (void)observeHomescreenAverageColorWithBlock:(id)a3
{
  -[PBUIWallpaperWindowSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 1207217231, a3);
}

- (void)observeLockscreenAverageColorWithBlock:(id)a3
{
  -[PBUIWallpaperWindowSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 1207217232, a3);
}

- (void)observeHomescreenContrastWithBlock:(id)a3
{
  -[PBUIWallpaperWindowSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 1207217233, a3);
}

- (void)observeLockscreenContrastWithBlock:(id)a3
{
  -[PBUIWallpaperWindowSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 1207217234, a3);
}

- (void)observeHomescreenParallaxFactorWithBlock:(id)a3
{
  -[PBUIWallpaperWindowSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 1207217235, a3);
}

- (void)observeLockscreenParallaxFactorWithBlock:(id)a3
{
  -[PBUIWallpaperWindowSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 1207217236, a3);
}

- (void)observeHomescreenParallaxEnabledWithBlock:(id)a3
{
  -[PBUIWallpaperWindowSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 1207217237, a3);
}

- (void)observeLockscreenParallaxEnabledWithBlock:(id)a3
{
  -[PBUIWallpaperWindowSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 1207217238, a3);
}

- (void)observeHomescreenZoomFactorWithBlock:(id)a3
{
  -[PBUIWallpaperWindowSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 1207217239, a3);
}

- (void)observeLockscreenZoomFactorWithBlock:(id)a3
{
  -[PBUIWallpaperWindowSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 1207217240, a3);
}

- (void)observeHomescreenContentStaticWithBlock:(id)a3
{
  -[PBUIWallpaperWindowSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 1207217241, a3);
}

- (void)observeLockscreenContentStaticWithBlock:(id)a3
{
  -[PBUIWallpaperWindowSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 1207217242, a3);
}

- (void)observeLockscreenContentLiveWallpaperWithBlock:(id)a3
{
  -[PBUIWallpaperWindowSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 1207217243, a3);
}

- (void)observeLiveWallpaperPlaybackStateWithBlock:(id)a3
{
  -[PBUIWallpaperWindowSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 1207217244, a3);
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
    v8[2] = __86__PBUIWallpaperWindowSceneClientSettingsDiffInspector__observeOtherSetting_withBlock___block_invoke;
    v8[3] = &unk_1E6B95A58;
    v9 = v6;
    -[FBSSettingsDiffInspector observeOtherSetting:withBlock:](self, "observeOtherSetting:withBlock:", a3, v8);

  }
}

uint64_t __86__PBUIWallpaperWindowSceneClientSettingsDiffInspector__observeOtherSetting_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
