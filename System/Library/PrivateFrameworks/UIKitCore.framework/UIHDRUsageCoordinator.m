@implementation UIHDRUsageCoordinator

void __40___UIHDRUsageCoordinator_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[_UIHDRUsageCoordinator _init]([_UIHDRUsageCoordinator alloc], "_init");
  v1 = (void *)qword_1ECD7E128;
  qword_1ECD7E128 = (uint64_t)v0;

}

void __64___UIHDRUsageCoordinator_registerForDefaultDynamicRangeChanges___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[_UIHDRUsageCoordinator sharedInstance]();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIHDRUsageCoordinator applyConstrainedHDROverrideToView:]((uint64_t)v1, WeakRetained);

  }
}

void __64___UIHDRUsageCoordinator_registerForAndApplyHDRAnimationToView___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  int v9;
  double v10;
  void *v11;
  id v12;

  v2 = a2;
  +[_UIHDRUsageCoordinator sharedInstance]();
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v12)
  {
    objc_msgSend(v3, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "wantsExtendedDynamicRangeContent"))
    {
      objc_msgSend(v3, "traitCollection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "_headroomUsage"))
        v6 = 1.0;
      else
        v6 = 0.0;

      v7 = _HDRInitialEDRStrength(v4);
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isLowPowerModeEnabled");

      if (v9)
      {
        objc_msgSend(v4, "setContentsEDRStrength:", v6);
LABEL_10:
        objc_msgSend(v4, "removeAnimationForKey:", CFSTR("contentsEDRStrength"));
        goto LABEL_11;
      }
      v10 = _HDRAnimationDuration(v7, v6);
      objc_msgSend(v4, "setContentsEDRStrength:", v6);
      if (v10 <= 0.00833333333)
        goto LABEL_10;
      _HDRSpringAnimation(v10, v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addAnimation:forKey:", v11, CFSTR("contentsEDRStrength"));

    }
LABEL_11:

  }
}

void __56___UIHDRUsageCoordinator_traitCollectionSuppressingHDR___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCGFloatValue:forTrait:", v3, 1.0);

  objc_opt_self();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNSIntegerValue:forTrait:", 0, v4);

}

@end
