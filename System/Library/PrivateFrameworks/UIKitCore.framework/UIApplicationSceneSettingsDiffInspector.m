@implementation UIApplicationSceneSettingsDiffInspector

uint64_t __74__UIApplicationSceneSettingsDiffInspector__observeOtherSetting_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)observeTargetOfEventDeferringEnvironmentsWithBlock:(id)a3
{
  -[UIApplicationSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 36, a3);
}

- (void)observeUserInterfaceStyleWithBlock:(id)a3
{
  -[UIApplicationSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 10, a3);
}

- (void)observeScreenReferenceDisplayModeStatus:(id)a3
{
  -[UIApplicationSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 39, a3);
}

- (void)observeSafeAreaInsetsPortraitWithBlock:(id)a3
{
  -[UIApplicationSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 15, a3);
}

- (void)observeSafeAreaInsetsPortraitUpsideDownWithBlock:(id)a3
{
  -[UIApplicationSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 17, a3);
}

- (void)observeSafeAreaInsetsLandscapeRightWithBlock:(id)a3
{
  -[UIApplicationSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 18, a3);
}

- (void)observeSafeAreaInsetsLandscapeLeftWithBlock:(id)a3
{
  -[UIApplicationSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 16, a3);
}

- (void)observeInterfaceOrientationModeWithBlock:(id)a3
{
  -[UIApplicationSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 35, a3);
}

- (void)observeInterfaceOrientationMapResolverWithBlock:(id)a3
{
  -[UIApplicationSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 38, a3);
}

- (void)observeInLiveResizeWithBlock:(id)a3
{
  -[UIApplicationSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 40, a3);
}

- (void)observeIdleModeEnabledWithBlock:(id)a3
{
  -[UIApplicationSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 8, a3);
}

- (void)observeEnhancedWindowingEnabledWithBlock:(id)a3
{
  -[UIApplicationSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 41, a3);
}

- (void)observeDeviceOrientationWithBlock:(id)a3
{
  -[UIApplicationSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 13, a3);
}

- (void)observeCanShowAlertsWithBlock:(id)a3
{
  -[UIApplicationSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 7, a3);
}

- (void)observeDeactivationReasonsWithBlock:(id)a3
{
  -[UIApplicationSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 3, a3);
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
    v8[2] = __74__UIApplicationSceneSettingsDiffInspector__observeOtherSetting_withBlock___block_invoke;
    v8[3] = &unk_1E16C8268;
    v9 = v6;
    -[FBSSettingsDiffInspector observeOtherSetting:withBlock:](self, "observeOtherSetting:withBlock:", a3, v8);

  }
}

- (void)observeStatusBarAvoidanceFrameWithBlock:(id)a3
{
  -[UIApplicationSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 20, a3);
}

- (void)observeStatusBarStyleOverridesToSuppressWithBlock:(id)a3
{
  -[UIApplicationSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 2, a3);
}

- (void)observeStatusBarPartsWithBlock:(id)a3
{
  -[UIApplicationSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 19, a3);
}

- (void)observeStatusBarHeightWithBlock:(id)a3
{
  -[UIApplicationSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 24, a3);
}

- (void)observeForcedStatusBarStyleWithBlock:(id)a3
{
  -[UIApplicationSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 4, a3);
}

- (void)observeForcedStatusBarForegroundTransparentWithBlock:(id)a3
{
  -[UIApplicationSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 11, a3);
}

- (void)observeHostReferenceAngleModeWithBlock:(id)a3
{
  -[UIApplicationSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 44, a3);
}

- (void)observeAngleFromHostReferenceUprightDirectionWithBlock:(id)a3
{
  -[UIApplicationSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 43, a3);
}

- (void)observePersistenceIdentifierWithBlock:(id)a3
{
  -[UIApplicationSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 29, a3);
}

- (void)observeUnderLockWithBlock:(id)a3
{
  -[UIApplicationSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 1, a3);
}

- (void)observeDeviceOrientationEventsEnabledWithBlock:(id)a3
{
  -[UIApplicationSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 6, a3);
}

- (void)observeAccessibilityContrastWithBlock:(id)a3
{
  -[UIApplicationSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 32, a3);
}

- (void)observePointerLockStatusWithBlock:(id)a3
{
  -[UIApplicationSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 33, a3);
}

- (void)observeCarPlayDisableFiveRowKeyboardsWithBlock:(id)a3
{
  -[UIApplicationSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 34, a3);
}

- (void)observeCarPlayBlackWallpaperModeEnabledWithBlock:(id)a3
{
  -[UIApplicationSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 46, a3);
}

- (void)observeScreenBoundsIgnoresSceneOrientation:(id)a3
{
  -[UIApplicationSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 42, a3);
}

@end
