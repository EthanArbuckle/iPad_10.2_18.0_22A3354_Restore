@implementation SBDashBoardCameraOnlyLaunchPolicy

- (id)resolveCameraDestinationLaunchOf:(id)a3 fromSource:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  __CFString *v8;
  SBDashBoardApplicationHostableEntity *v9;
  SBDashBoardApplicationHostableEntity *v10;
  BOOL v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "application");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.camera"));

  if (!v7)
  {
    v10 = 0;
    v8 = 0;
LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }
  v8 = SBDashBoardCapturePlacementCameraPage;
  v9 = -[SBDashBoardApplicationHostableEntity initWithApplicationSceneEntity:]([SBDashBoardApplicationHostableEntity alloc], "initWithApplicationSceneEntity:", v4);
  v10 = v9;
  if (v8)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (v11)
    goto LABEL_8;
  +[SBDashBoardCaptureLaunchDestination launchDestinationWithPlacement:entity:](SBDashBoardCaptureLaunchDestination, "launchDestinationWithPlacement:entity:", v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v12;
}

- (id)prewarmingConfigurationForIdentifier:(id)a3 captureApplicationProvider:(id)a4
{
  return -[SBDashBoardCameraPrewarmConfiguration initWithPrewarmCameraHardware:prewarmForCaptureLaunch:backgroundLaunchTarget:applicationBundleIdentifier:prewarmingBundleIdentifier:]([SBDashBoardCameraPrewarmConfiguration alloc], "initWithPrewarmCameraHardware:prewarmForCaptureLaunch:backgroundLaunchTarget:applicationBundleIdentifier:prewarmingBundleIdentifier:", 1, 0, objc_msgSend(a3, "prewarmType") == 0, CFSTR("com.apple.camera"), CFSTR("com.apple.camera"));
}

@end
