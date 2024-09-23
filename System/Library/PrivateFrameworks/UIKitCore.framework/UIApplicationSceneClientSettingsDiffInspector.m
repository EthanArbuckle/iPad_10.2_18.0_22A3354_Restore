@implementation UIApplicationSceneClientSettingsDiffInspector

uint64_t __80__UIApplicationSceneClientSettingsDiffInspector__observeOtherSetting_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)observeScreenEdgesDeferringSystemGesturesWithBlock:(id)a3
{
  -[UIApplicationSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 26, a3);
}

- (void)observeHomeIndicatorAutoHiddenWithBlock:(id)a3
{
  -[UIApplicationSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 27, a3);
}

- (void)observeSupportedInterfaceOrientationsWithBlock:(id)a3
{
  -[UIApplicationSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 13, a3);
}

- (void)observeInterfaceOrientationWithBlock:(id)a3
{
  -[UIApplicationSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 12, a3);
}

- (void)observeStatusBarContextIDWithBlock:(id)a3
{
  -[UIApplicationSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 4, a3);
}

- (void)observeBackgroundStyleWithBlock:(id)a3
{
  -[UIApplicationSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 20, a3);
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
    v8[2] = __80__UIApplicationSceneClientSettingsDiffInspector__observeOtherSetting_withBlock___block_invoke;
    v8[3] = &unk_1E16C8268;
    v9 = v6;
    -[FBSSettingsDiffInspector observeOtherSetting:withBlock:](self, "observeOtherSetting:withBlock:", a3, v8);

  }
}

- (void)observeVisibleMiniAlertCountWithBlock:(id)a3
{
  -[UIApplicationSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 30, a3);
}

- (void)observeStatusBarPartStylesWithBlock:(id)a3
{
  -[UIApplicationSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 34, a3);
}

- (void)observeStatusBarModernStyleWithBlock:(id)a3
{
  -[UIApplicationSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 35, a3);
}

- (void)observeStatusBarHiddenWithBlock:(id)a3
{
  -[UIApplicationSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 2, a3);
}

- (void)observeStatusBarAlphaWithBlock:(id)a3
{
  -[UIApplicationSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 36, a3);
}

- (void)observePhysicalButtonConfigurationsWithBlock:(id)a3
{
  -[UIApplicationSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 47, a3);
}

- (void)observeAudioCategoriesDisablingVolumeHUDWithBlock:(id)a3
{
  -[UIApplicationSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 31, a3);
}

- (void)observeStatusBarStyleWithBlock:(id)a3
{
  -[UIApplicationSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 1, a3);
}

- (void)observeDefaultStatusBarStyleWithBlock:(id)a3
{
  -[UIApplicationSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 5, a3);
}

- (void)observeDefaultStatusBarHiddenWithBlock:(id)a3
{
  -[UIApplicationSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 6, a3);
}

- (void)observeDefaultPNGNameWithBlock:(id)a3
{
  -[UIApplicationSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 7, a3);
}

- (void)observeDefaultPNGExpirationTimeWithBlock:(id)a3
{
  -[UIApplicationSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 8, a3);
}

- (void)observeCompatibilityModeWithBlock:(id)a3
{
  -[UIApplicationSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 9, a3);
}

- (void)observeDeviceOrientationEventsEnabledWithBlock:(id)a3
{
  -[UIApplicationSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 10, a3);
}

- (void)observeInterfaceOrientationChangesDisabledWithBlock:(id)a3
{
  -[UIApplicationSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 11, a3);
}

- (void)observeIdleTimerDisabledWithBlock:(id)a3
{
  -[UIApplicationSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 14, a3);
}

- (void)observeProximityDetectionModesWithBlock:(id)a3
{
  -[UIApplicationSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 15, a3);
}

- (void)observeControlCenterAmbiguousActivationMargin:(id)a3
{
  -[UIApplicationSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 16, a3);
}

- (void)observeControlCenterRevealModeWithBlock:(id)a3
{
  -[UIApplicationSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 17, a3);
}

- (void)observeNotificationCenterRevealModeWithBlock:(id)a3
{
  -[UIApplicationSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 18, a3);
}

- (void)observeEditingInteractionConfigurationWithBlock:(id)a3
{
  -[UIApplicationSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 46, a3);
}

- (void)observeWindowOverlayInsetsWithBlock:(id)a3
{
  -[UIApplicationSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 19, a3);
}

- (void)observeIdleModeVisualEffectsEnabledWithBlock:(id)a3
{
  -[UIApplicationSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 21, a3);
}

- (void)observeWhitePointAdaptivityStyleWithBlock:(id)a3
{
  -[UIApplicationSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 22, a3);
}

- (void)observeReachabilitySupportedWithBlock:(id)a3
{
  -[UIApplicationSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 25, a3);
}

- (void)observeCanvasTitleWithBlock:(id)a3
{
  -[UIApplicationSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 37, a3);
}

- (void)observeSceneActivationBiasWithBlock:(id)a3
{
  -[UIApplicationSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 39, a3);
}

- (void)observeActivationConditionsDataWithBlock:(id)a3
{
  -[UIApplicationSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 38, a3);
}

- (void)observeWindowFocusedFrameWithBlock:(id)a3
{
  -[UIApplicationSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 40, a3);
}

- (void)observeWantsExclusiveForegroundWithBlock:(id)a3
{
  -[UIApplicationSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 28, a3);
}

- (void)observeUserInterfaceStyleWithBlock:(id)a3
{
  -[UIApplicationSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 29, a3);
}

- (void)observeBrightnessLevelWithBlock:(id)a3
{
  -[UIApplicationSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 32, a3);
}

- (void)observePreferredPointerLockStateWithBlock:(id)a3
{
  -[UIApplicationSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 41, a3);
}

@end
