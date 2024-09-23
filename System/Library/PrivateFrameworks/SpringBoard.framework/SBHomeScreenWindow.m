@implementation SBHomeScreenWindow

- (BOOL)sb_preventStatusBarEffectivelyHiddenForContentOverlayInsets
{
  return 1;
}

- (BOOL)isContentHidden
{
  void *v3;
  char v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBHomeScreenWindow;
  if (!-[SBFWindow isContentHidden](&v6, sel_isContentHidden))
    return 0;
  -[SBHomeScreenWindow homeScreenViewController](self, "homeScreenViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isIconContentHidden");

  return v4;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  void *v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  void *v27;
  uint64_t v28;
  void *v29;
  objc_super v31;
  CGPoint v32;
  CGRect v33;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (objc_msgSend(v7, "type") != 9)
    goto LABEL_9;
  -[SBHomeScreenWindow homeScreenViewController](self, "homeScreenViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isIconContentHidden");

  if ((v9 & 1) != 0)
  {
LABEL_11:
    v29 = 0;
    goto LABEL_12;
  }
  -[UIWindow _sbWindowScene](self, "_sbWindowScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatingDockController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "floatingDockScreenFrame");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    -[SBHomeScreenWindow _screen](self, "_screen");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "fixedCoordinateSpace");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHomeScreenWindow convertPoint:toCoordinateSpace:](self, "convertPoint:toCoordinateSpace:", v22, x, y);
    v24 = v23;
    v26 = v25;

    v33.origin.x = v14;
    v33.origin.y = v16;
    v33.size.width = v18;
    v33.size.height = v20;
    v32.x = v24;
    v32.y = v26;
    if (CGRectContainsPoint(v33, v32))
      goto LABEL_10;
  }
  if ((objc_msgSend(v12, "isPresentingLibraryInFloatingDockWindow") & 1) != 0
    || (objc_msgSend(v12, "isPresentingFolder") & 1) != 0
    || (objc_msgSend(v10, "switcherController"),
        v27 = (void *)objc_claimAutoreleasedReturnValue(),
        v28 = objc_msgSend(v27, "unlockedEnvironmentMode"),
        v27,
        v28 != 1))
  {
LABEL_10:

    goto LABEL_11;
  }

LABEL_9:
  v31.receiver = self;
  v31.super_class = (Class)SBHomeScreenWindow;
  -[SBHomeScreenWindow hitTest:withEvent:](&v31, sel_hitTest_withEvent_, v7, x, y);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v29;
}

+ (BOOL)sb_autorotates
{
  return SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleHomeScreen")) ^ 1;
}

- (SBHomeScreenWindow)initWithWindowScene:(id)a3 rootViewController:(id)a4 layoutStrategy:(id)a5 role:(id)a6 debugName:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  SBHomeScreenWindow *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v31;
  objc_super v32;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeScreenWindow.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[rootViewController isKindOfClass:[SBHomeScreenViewController class]]"));

  }
  v32.receiver = self;
  v32.super_class = (Class)SBHomeScreenWindow;
  v18 = -[SBWindow initWithWindowScene:rootViewController:layoutStrategy:role:debugName:](&v32, sel_initWithWindowScene_rootViewController_layoutStrategy_role_debugName_, v13, v14, v15, v16, v17);
  if (v18)
  {
    objc_msgSend(v13, "screen");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bounds");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;

    objc_msgSend(v14, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setFrame:", v21, v23, v25, v27);

    -[SBHomeScreenWindow layer](v18, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setHitTestsAsOpaque:", 1);

  }
  return v18;
}

- (id)homeScreenViewController
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class();
  -[SBHomeScreenWindow rootViewController](self, "rootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)autorotationPreventionReasons
{
  void *v2;
  void *v3;
  void *v4;

  -[SBHomeScreenWindow homeScreenViewController](self, "homeScreenViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_autorotationPreventionReasons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_canBecomeKeyWindow
{
  return 1;
}

@end
