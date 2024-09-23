@implementation SBDashBoardRootSwitcherModifier

- (id)appLayoutsToEnsureExistForMainTransitionEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  id v9;
  _BOOL4 v11;
  void *v12;
  id v13;
  char v14;
  _QWORD v16[4];
  id v17;

  v3 = a3;
  objc_msgSend(v3, "fromAppLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toAppLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "fromEnvironmentMode");
  v7 = objc_msgSend(v3, "toEnvironmentMode");
  v8 = BSEqualObjects();
  v9 = 0;
  v11 = v6 == 3 || v7 == 3;
  if (!v8 && v11)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v3, "fromDisplayItemsPendingTermination");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __81__SBDashBoardRootSwitcherModifier_appLayoutsToEnsureExistForMainTransitionEvent___block_invoke;
    v16[3] = &unk_1E8E9DF50;
    v13 = v4;
    v17 = v13;
    v14 = objc_msgSend(v12, "bs_containsObjectPassingTest:", v16);

    if (v13 && (v14 & 1) == 0)
      objc_msgSend(v9, "addObject:", v13);
    if (v5)
      objc_msgSend(v9, "addObject:", v5);

  }
  return v9;
}

uint64_t __81__SBDashBoardRootSwitcherModifier_appLayoutsToEnsureExistForMainTransitionEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsItem:", a2);
}

- (BOOL)shouldUseBackgroundWallpaperTreatmentForIndex:(unint64_t)a3
{
  void *v3;
  BOOL v4;

  -[SBDashBoardRootSwitcherModifier switcherSettings](self, "switcherSettings", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "effectiveSwitcherStyle") == 1;

  return v4;
}

- (id)gestureModifierForGestureEvent:(id)a3
{
  return 0;
}

- (id)transitionModifierForMainTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  SBFullScreenToHomeCenterZoomDownSwitcherModifier *v9;
  void *v10;
  double v11;
  double v12;

  v4 = a3;
  objc_msgSend(v4, "transitionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fromEnvironmentMode");
  v7 = objc_msgSend(v4, "toEnvironmentMode");
  objc_msgSend(v4, "fromAppLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  if (v6 == 3 && v7 == 1)
  {
    -[SBDashBoardRootSwitcherModifier switcherSettings](self, "switcherSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "switcherCenterYOffsetPercentOfScreenHeight");
    v12 = v11;

    v9 = -[SBFullScreenToHomeCenterZoomDownSwitcherModifier initWithTransitionID:appLayout:offsetYPercentOfScreenHeight:]([SBFullScreenToHomeCenterZoomDownSwitcherModifier alloc], "initWithTransitionID:appLayout:offsetYPercentOfScreenHeight:", v5, v8, v12);
  }

  return v9;
}

- (id)floorModifierForTransitionEvent:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  SBHomeScreenSwitcherModifier *v7;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_7;
  v5 = objc_msgSend(v3, "toEnvironmentMode");
  if (v5 == 1)
  {
    v7 = objc_alloc_init(SBHomeScreenSwitcherModifier);
    if (!v7)
LABEL_7:
      v7 = objc_alloc_init(SBHomeScreenSwitcherModifier);
  }
  else
  {
    if (v5 != 3)
      goto LABEL_7;
    objc_msgSend(v4, "toAppLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SBFullScreenAppLayoutSwitcherModifier initWithActiveAppLayout:]([SBFullScreenAppLayoutSwitcherModifier alloc], "initWithActiveAppLayout:", v6);

    if (!v7)
      goto LABEL_7;
  }

  return v7;
}

- (id)multitaskingModifierForEvent:(id)a3
{
  objc_class *v4;
  void *v5;
  id v6;

  v4 = -[SBDashBoardRootSwitcherModifier _defaultMultitaskingModifierClass](self, "_defaultMultitaskingModifierClass", a3);
  -[SBFluidSwitcherRootSwitcherModifier multitaskingModifier](self, "multitaskingModifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isMemberOfClass:", v4) & 1) == 0)
  {
    v6 = -[SBDashBoardRootSwitcherModifier _newMultitaskingModifier](self, "_newMultitaskingModifier");

    v5 = v6;
  }
  return v5;
}

- (Class)_defaultMultitaskingModifierClass
{
  void *v3;
  id v4;

  -[SBDashBoardRootSwitcherModifier switcherSettings](self, "switcherSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDashBoardRootSwitcherModifier isReduceMotionEnabled](self, "isReduceMotionEnabled");
  objc_msgSend(v3, "effectiveSwitcherStyle");
  v4 = (id)objc_opt_class();

  return (Class)v4;
}

- (id)_newMultitaskingModifier
{
  return objc_alloc_init(-[SBDashBoardRootSwitcherModifier _defaultMultitaskingModifierClass](self, "_defaultMultitaskingModifierClass"));
}

@end
