@implementation SBFloatingDockWindow

+ (BOOL)sb_autorotates
{
  return 0;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  SBFloatingDockWindow *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
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
  SBFloatingDockWindow *v28;
  objc_super v30;
  objc_super v31;
  CGPoint v32;
  CGRect v33;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (objc_msgSend(v7, "type") == 9)
  {
    if (!objc_msgSend(v7, "_isTouchRoutingPolicyBased"))
      goto LABEL_13;
    -[UIWindow _sbWindowScene](self, "_sbWindowScene");
    v8 = (SBFloatingDockWindow *)objc_claimAutoreleasedReturnValue();
    -[SBFloatingDockWindow floatingDockController](v8, "floatingDockController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFloatingDockWindow floatingDockRootViewController](self, "floatingDockRootViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isPresentingLibraryInFloatingDockWindow") & 1) != 0
      || objc_msgSend(v10, "isPresentingFolder"))
    {
      v31.receiver = self;
      v31.super_class = (Class)SBFloatingDockWindow;
      -[SBFloatingDockWindow hitTest:withEvent:](&v31, sel_hitTest_withEvent_, v7, x, y);
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_6:

LABEL_12:
      v8 = (SBFloatingDockWindow *)v11;
      goto LABEL_14;
    }
    objc_msgSend(v10, "presentedProgress");
    if (v12 <= 0.0)
    {
      v11 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v10, "floatingDockScreenFrame");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    -[SBFloatingDockWindow _screen](self, "_screen");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "fixedCoordinateSpace");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFloatingDockWindow convertPoint:toCoordinateSpace:](self, "convertPoint:toCoordinateSpace:", v22, x, y);
    v24 = v23;
    v26 = v25;

    v33.origin.x = v14;
    v33.origin.y = v16;
    v33.size.width = v18;
    v33.size.height = v20;
    v32.x = v24;
    v32.y = v26;
    LODWORD(v21) = CGRectContainsPoint(v33, v32);

    if (!(_DWORD)v21)
    {
LABEL_13:
      v8 = 0;
      goto LABEL_14;
    }
  }
  v30.receiver = self;
  v30.super_class = (Class)SBFloatingDockWindow;
  -[SBFloatingDockWindow hitTest:withEvent:](&v30, sel_hitTest_withEvent_, v7, x, y);
  v8 = (SBFloatingDockWindow *)objc_claimAutoreleasedReturnValue();
  if (v8 == self
    || (-[SBFloatingDockWindow rootViewController](self, "rootViewController"),
        v27 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v27, "view"),
        v28 = (SBFloatingDockWindow *)objc_claimAutoreleasedReturnValue(),
        v28,
        v27,
        v8 == v28))
  {
    v11 = 0;
    goto LABEL_12;
  }
LABEL_14:

  return v8;
}

- (BOOL)_canBecomeKeyWindow
{
  return 1;
}

- (BOOL)isContentHidden
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  objc_super v8;

  -[SBFloatingDockWindow floatingDockRootViewController](self, "floatingDockRootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindow _sbWindowScene](self, "_sbWindowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatingDockController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)SBFloatingDockWindow;
  if (-[SBFWindow isContentHidden](&v8, sel_isContentHidden))
  {
    LOBYTE(v6) = 1;
  }
  else if ((objc_msgSend(v3, "isFloatingDockPresented") & 1) != 0 || (objc_msgSend(v3, "isPresentingFolder") & 1) != 0)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    v6 = objc_msgSend(v5, "isPresentingLibraryInFloatingDockWindow") ^ 1;
  }

  return v6;
}

+ (id)_traitsArbiterOrientationActuationRole
{
  return CFSTR("SBTraitsParticipantRoleFloatingDock");
}

- (BOOL)sb_preventStatusBarEffectivelyHiddenForContentOverlayInsets
{
  return 1;
}

@end
