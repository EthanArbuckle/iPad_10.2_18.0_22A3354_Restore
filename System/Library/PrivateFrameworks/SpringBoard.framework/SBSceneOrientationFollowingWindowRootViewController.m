@implementation SBSceneOrientationFollowingWindowRootViewController

- (SBSceneOrientationFollowingWindowRootViewController)initWithHostingViewController:(id)a3
{
  id v4;
  SBSceneOrientationFollowingWindowRootViewController *v5;
  SBSceneOrientationFollowingWindowRootViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBSceneOrientationFollowingWindowRootViewController;
  v5 = -[SBSceneOrientationFollowingWindowRootViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_hostingViewController, v4);

  return v6;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)setOverlayContentView:(id)a3
{
  UIView *v5;
  UIView *overlayContentView;
  void *v7;
  UIView *v8;

  v5 = (UIView *)a3;
  overlayContentView = self->_overlayContentView;
  v8 = v5;
  if (overlayContentView != v5)
  {
    -[UIView removeFromSuperview](overlayContentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_overlayContentView, a3);
    if (self->_overlayContentView)
    {
      -[SBSceneOrientationFollowingWindowRootViewController view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", v8);

    }
  }

}

- (unint64_t)supportedInterfaceOrientations
{
  id WeakRetained;
  void *v3;
  unint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_hostingViewController);
  objc_msgSend(WeakRetained, "orientationDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportedInterfaceOrientations");

  return v4;
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  id WeakRetained;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  UIView *overlayContentView;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SBSceneOrientationFollowingWindowRootViewController;
  -[SBSceneOrientationFollowingWindowRootViewController viewWillLayoutSubviews](&v15, sel_viewWillLayoutSubviews);
  -[SBSceneOrientationFollowingWindowRootViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostingViewController);
  objc_msgSend(WeakRetained, "_boundsForOverlayRootView");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  objc_msgSend(v3, "window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "center");
  objc_msgSend(v3, "setCenter:");

  objc_msgSend(v3, "setBounds:", v6, v8, v10, v12);
  overlayContentView = self->_overlayContentView;
  objc_msgSend(v3, "center");
  -[UIView setCenter:](overlayContentView, "setCenter:");
  -[UIView setFrame:](self->_overlayContentView, "setFrame:", v6, v8, v10, v12);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  id WeakRetained;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  UIEdgeInsets result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_hostingViewController);
  v7 = objc_msgSend(WeakRetained, "_isSceneStatusBarHidden");
  objc_msgSend(WeakRetained, "_sbWindowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "statusBarManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC5B80], "sb_thisDeviceDisplayEdgeInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7)
  {
    objc_msgSend(v10, "sb_displayEdgeInfoWithSafeAreaInsetsForStatusBarHeight:", 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v9, "statusBar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currentHeight");
    objc_msgSend(v11, "sb_displayEdgeInfoWithSafeAreaInsetsForStatusBarHeight:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v14 = objc_msgSend(WeakRetained, "_hostOrientation");
  -[SBSceneOrientationFollowingWindowRootViewController traitCollection](self, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sb_orientedEdgeInsetsForInterfaceOrientation:traitCollection:", v14, v15);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  if (a4)
    *a4 = 1;

  v24 = v17;
  v25 = v19;
  v26 = v21;
  v27 = v23;
  result.right = v27;
  result.bottom = v26;
  result.left = v25;
  result.top = v24;
  return result;
}

- (SBIsolatedSceneOrientationFollowingWrapperViewController)hostingViewController
{
  return (SBIsolatedSceneOrientationFollowingWrapperViewController *)objc_loadWeakRetained((id *)&self->_hostingViewController);
}

- (void)setHostingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_hostingViewController, a3);
}

- (UIView)overlayContentView
{
  return self->_overlayContentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayContentView, 0);
  objc_destroyWeak((id *)&self->_hostingViewController);
}

@end
