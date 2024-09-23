@implementation UIWindowSceneDeviceOrientationSettingsDiffAction

void __96___UIWindowSceneDeviceOrientationSettingsDiffAction_sceneSettingsDeviceOrientationDiffInspector__block_invoke(uint64_t a1, _BYTE *a2)
{
  *a2 |= 1u;
}

void __134___UIWindowSceneDeviceOrientationSettingsDiffAction__updateDeviceOrientationWithSettingObserverContext_windowScene_transitionContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  +[UIScene _mostActiveScene](UIWindowScene, "_mostActiveScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOrientation:animated:", *(_QWORD *)(a1 + 40), v4);

}

@end
