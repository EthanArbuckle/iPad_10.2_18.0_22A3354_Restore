@implementation SBSUILoginUISceneClientSettingsDiffInspector

- (void)observeIdleTimerModeWithBlock:(id)a3
{
  -[SBSUILoginUISceneClientSettingsDiffInspector _observeOtherLoginUISetting:withBlock:](self, "_observeOtherLoginUISetting:withBlock:", 736840726, a3);
}

- (void)observeStatusBarUserNameOverrideWithBlock:(id)a3
{
  -[SBSUILoginUISceneClientSettingsDiffInspector _observeOtherLoginUISetting:withBlock:](self, "_observeOtherLoginUISetting:withBlock:", 736840727, a3);
}

- (void)observeRotationModeWithBlock:(id)a3
{
  -[SBSUILoginUISceneClientSettingsDiffInspector _observeOtherLoginUISetting:withBlock:](self, "_observeOtherLoginUISetting:withBlock:", 736840728, a3);
}

- (void)observeWallpaperModeWithBlock:(id)a3
{
  -[SBSUILoginUISceneClientSettingsDiffInspector _observeOtherLoginUISetting:withBlock:](self, "_observeOtherLoginUISetting:withBlock:", 736840729, a3);
}

- (void)_observeOtherLoginUISetting:(unint64_t)a3 withBlock:(id)a4
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
    v8[2] = __86__SBSUILoginUISceneClientSettingsDiffInspector__observeOtherLoginUISetting_withBlock___block_invoke;
    v8[3] = &unk_1E4C3F140;
    v9 = v6;
    -[FBSSettingsDiffInspector observeOtherSetting:withBlock:](self, "observeOtherSetting:withBlock:", a3, v8);

  }
}

uint64_t __86__SBSUILoginUISceneClientSettingsDiffInspector__observeOtherLoginUISetting_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
