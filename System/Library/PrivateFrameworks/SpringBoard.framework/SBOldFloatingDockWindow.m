@implementation SBOldFloatingDockWindow

+ (BOOL)sb_autorotates
{
  return 0;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  objc_super v28;
  objc_super v29;
  CGPoint v30;
  CGRect v31;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (objc_msgSend(v7, "type") != 9)
    goto LABEL_9;
  if (!objc_msgSend(v7, "_isTouchRoutingPolicyBased"))
  {
LABEL_10:
    v11 = 0;
    goto LABEL_11;
  }
  -[UIWindow _sbWindowScene](self, "_sbWindowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatingDockController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBOldFloatingDockWindow floatingDockRootViewController](self, "floatingDockRootViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isPresentingLibraryInFloatingDockWindow") & 1) == 0
    && !objc_msgSend(v10, "isPresentingFolder"))
  {
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
    -[SBOldFloatingDockWindow _screen](self, "_screen");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "fixedCoordinateSpace");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBOldFloatingDockWindow convertPoint:toCoordinateSpace:](self, "convertPoint:toCoordinateSpace:", v22, x, y);
    v24 = v23;
    v26 = v25;

    v31.origin.x = v14;
    v31.origin.y = v16;
    v31.size.width = v18;
    v31.size.height = v20;
    v30.x = v24;
    v30.y = v26;
    LODWORD(v21) = CGRectContainsPoint(v31, v30);

    if ((_DWORD)v21)
    {
LABEL_9:
      v28.receiver = self;
      v28.super_class = (Class)SBOldFloatingDockWindow;
      -[SBMainScreenActiveInterfaceOrientationWindow hitTest:withEvent:](&v28, sel_hitTest_withEvent_, v7, x, y);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  v29.receiver = self;
  v29.super_class = (Class)SBOldFloatingDockWindow;
  -[SBMainScreenActiveInterfaceOrientationWindow hitTest:withEvent:](&v29, sel_hitTest_withEvent_, v7, x, y);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

LABEL_11:
  return v11;
}

- (BOOL)_canBecomeKeyWindow
{
  return 1;
}

- (BOOL)isContentHidden
{
  void *v3;
  int v4;
  objc_super v6;

  -[SBOldFloatingDockWindow floatingDockRootViewController](self, "floatingDockRootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)SBOldFloatingDockWindow;
  if (-[SBFWindow isContentHidden](&v6, sel_isContentHidden))
    LOBYTE(v4) = 1;
  else
    v4 = objc_msgSend(v3, "isFloatingDockPresented") ^ 1;

  return v4;
}

- (BOOL)sb_preventStatusBarEffectivelyHiddenForContentOverlayInsets
{
  return 1;
}

@end
