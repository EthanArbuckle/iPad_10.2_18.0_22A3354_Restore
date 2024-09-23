@implementation UIView(SBPIPAdditions)

- (uint64_t)SBPIP_allowsEdgeAntialiasing
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "allowsEdgeAntialiasing");

  return v2;
}

- (void)SBPIP_setAllowsEdgeAntialiasing:()SBPIPAdditions
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a1, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  objc_msgSend(v5, "setContentsScale:");

  objc_msgSend(a1, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsEdgeAntialiasing:", a3);

}

- (uint64_t)SBPIP_allowsGroupBlending
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "allowsGroupBlending");

  return v2;
}

- (void)SBPIP_setAllowsGroupBlending:()SBPIPAdditions
{
  id v4;

  objc_msgSend(a1, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsGroupBlending:", a3);

}

+ (void)SBPIP_performWithoutRetargetingAnimation:()SBPIPAdditions
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__UIView_SBPIPAdditions__SBPIP_performWithoutRetargetingAnimation___block_invoke;
  v6[3] = &unk_1E8E9E8D0;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a1, "_performWithoutRetargetingAnimations:", v6);

}

+ (uint64_t)SBPIP_animateUsingDefaultTimingWithAnimations:()SBPIPAdditions completion:
{
  return objc_msgSend(a1, "SBPIP_animateUsingDefaultTimingWithOptions:animations:completion:", 0, a3, a4);
}

+ (void)SBPIP_animateUsingDefaultTimingWithOptions:()SBPIPAdditions animations:completion:
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  void *v12;

  v8 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __91__UIView_SBPIPAdditions__SBPIP_animateUsingDefaultTimingWithOptions_animations_completion___block_invoke;
  v10[3] = &unk_1E8EA9A80;
  v11 = v8;
  v12 = a1;
  v9 = v8;
  objc_msgSend(a1, "_animateUsingDefaultTimingWithOptions:animations:completion:", a3, v10, a5);

}

@end
