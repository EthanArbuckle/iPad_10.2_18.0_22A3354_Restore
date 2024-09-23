@implementation SBUIKitSafeAreaSceneHostComponent

- (void)scene:(id)a3 willUpdateSettings:(id)a4 withTransitionContext:(id)a5
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v11 = a4;
  if (objc_msgSend(v11, "isUISubclass"))
  {
    objc_msgSend(v11, "displayConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isMainRootDisplay"))
    {
      objc_msgSend(MEMORY[0x1E0DC5B80], "sb_thisDeviceDisplayEdgeInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sb_applyDisplayEdgeInfoToSceneSettings:", v11);

    }
    else
    {
      v7 = *MEMORY[0x1E0DC49E8];
      v8 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
      v9 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
      v10 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
      objc_msgSend(v11, "setSafeAreaInsetsPortrait:", *MEMORY[0x1E0DC49E8], v8, v9, v10);
      objc_msgSend(v11, "setPeripheryInsets:", v7, v8, v9, v10);
      objc_msgSend(v11, "setHomeAffordanceOverlayAllowance:", 0.0);
    }

  }
}

@end
