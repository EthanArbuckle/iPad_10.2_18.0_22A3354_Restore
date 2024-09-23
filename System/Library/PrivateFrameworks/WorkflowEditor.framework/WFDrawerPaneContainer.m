@implementation WFDrawerPaneContainer

- (WFDrawerPaneContainer)initWithDrawerPane:(id)a3
{
  id v5;
  WFDrawerPaneContainer *v6;
  WFDrawerAnimationManager *v7;
  WFDrawerAnimationManager *animationManager;
  WFDrawerPaneContainer *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WFDrawerPaneContainer;
  v6 = -[WFDrawerPaneContainer init](&v11, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "setContainer:", v6);
    objc_storeStrong((id *)&v6->_drawerPane, a3);
    v7 = objc_alloc_init(WFDrawerAnimationManager);
    animationManager = v6->_animationManager;
    v6->_animationManager = v7;

    v6->_visibility = 1;
    v6->_dimming = 3;
    v6->_userInteractionEnabled = 1;
    v9 = v6;
  }

  return v6;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "refreshControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v8, "setRefreshControl:", v5);

    objc_msgSend(v8, "refreshControl");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 1);

  }
  -[WFDrawerPaneContainer gestureCoordinator](self, "gestureCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scrollViewWillBeginDragging:", v8);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFDrawerPaneContainer gestureCoordinator](self, "gestureCoordinator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollViewDidScroll:", v4);

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  id v9;
  id v10;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  -[WFDrawerPaneContainer gestureCoordinator](self, "gestureCoordinator");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v9, a5, x, y);

}

- (void)loadView
{
  WFPassthroughView *v3;
  void *v4;
  WFPassthroughView *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  WFDrawerGestureCoordinator *v15;
  WFDrawerGestureCoordinator *gestureCoordinator;
  id obj;

  v3 = [WFPassthroughView alloc];
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = -[WFPassthroughView initWithFrame:](v3, "initWithFrame:");
  -[WFDrawerPaneContainer setView:](self, "setView:", v5);

  -[WFDrawerPaneContainer view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAutoresizingMask:", 18);

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDrawerPaneContainer view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v7);

  v9 = objc_alloc(MEMORY[0x24BEBDB00]);
  obj = (id)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setBackgroundColor:", v10);

  objc_msgSend(obj, "setUserInteractionEnabled:", 0);
  objc_msgSend(obj, "setAlpha:", 0.0);
  -[WFDrawerPaneContainer view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", obj);

  objc_storeWeak((id *)&self->_backgroundDimmingView, obj);
  -[WFDrawerPaneContainer drawerPane](self, "drawerPane");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDrawerPaneContainer addChildViewController:](self, "addChildViewController:", v12);
  -[WFDrawerPaneContainer view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v14);

  objc_msgSend(v12, "didMoveToParentViewController:", self);
  v15 = -[WFDrawerGestureCoordinator initWithDelegate:]([WFDrawerGestureCoordinator alloc], "initWithDelegate:", self);
  gestureCoordinator = self->_gestureCoordinator;
  self->_gestureCoordinator = v15;

  -[WFDrawerPaneContainer layoutDrawerViewController](self, "layoutDrawerViewController");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)WFDrawerPaneContainer;
  v7 = a4;
  -[WFDrawerPaneContainer viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __76__WFDrawerPaneContainer_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_24EE25948;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

- (void)viewSafeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFDrawerPaneContainer;
  -[WFDrawerPaneContainer viewSafeAreaInsetsDidChange](&v3, sel_viewSafeAreaInsetsDidChange);
  -[WFDrawerPaneContainer layoutDrawerViewController](self, "layoutDrawerViewController");
}

- (void)setInactive:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_inactive = a3;
  -[WFDrawerPaneContainer backgroundDimmingView](self, "backgroundDimmingView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (self->_userInteractionEnabled != a3)
  {
    v3 = a3;
    self->_userInteractionEnabled = a3;
    -[WFDrawerPaneContainer drawerPane](self, "drawerPane");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserInteractionEnabled:", v3);

    LODWORD(v3) = self->_userInteractionEnabled;
    -[WFDrawerPaneContainer gestureCoordinator](self, "gestureCoordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v3)
      objc_msgSend(v7, "endIgnoringTapGestures");
    else
      objc_msgSend(v7, "beginIgnoringTapGestures");

  }
}

- (void)layoutDrawerViewController
{
  -[WFDrawerPaneContainer heightForVisibility:](self, "heightForVisibility:", -[WFDrawerPaneContainer visibility](self, "visibility"));
  -[WFDrawerPaneContainer layoutDrawerViewControllerForDrawerHeight:](self, "layoutDrawerViewControllerForDrawerHeight:");
}

- (void)layoutDrawerViewControllerForDrawerHeight:(double)a3
{
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  CGFloat v16;
  double Width;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  CGFloat v22;
  void *v23;
  double v24;
  CGFloat v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  id v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  -[WFDrawerPaneContainer view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[WFDrawerPaneContainer heightForVisibility:](self, "heightForVisibility:", 3);
  if (v14 >= a3)
    v15 = v14;
  else
    v15 = a3;
  v34.origin.x = v7;
  v34.origin.y = v9;
  v34.size.width = v11;
  v34.size.height = v13;
  v16 = CGRectGetHeight(v34) - a3;
  v35.origin.x = v7;
  v35.origin.y = v9;
  v35.size.width = v11;
  v35.size.height = v13;
  Width = CGRectGetWidth(v35);
  -[WFDrawerPaneContainer drawerPane](self, "drawerPane");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", 0.0, v16, Width, v15);

  -[WFDrawerPaneContainer drawerPane](self, "drawerPane");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setBottomContentInset:", v15 - a3);

  v36.origin.x = v7;
  v36.origin.y = v9;
  v36.size.width = v11;
  v36.size.height = v13;
  v21 = CGRectGetWidth(v36);
  v37.origin.x = v7;
  v37.origin.y = v9;
  v37.size.width = v11;
  v37.size.height = v13;
  v22 = CGRectGetHeight(v37) - a3;
  -[WFDrawerPaneContainer drawerPane](self, "drawerPane");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "topCornerRadius");
  v25 = v22 + v24;
  -[WFDrawerPaneContainer backgroundDimmingView](self, "backgroundDimmingView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFrame:", 0.0, 0.0, v21, v25);

  v27 = 1.0;
  if (-[WFDrawerPaneContainer visibility](self, "visibility") == 3)
    v28 = 1.0;
  else
    v28 = 0.0;
  if ((-[WFDrawerPaneContainer dimming](self, "dimming") & 1) == 0)
    v28 = 0.0;
  -[WFDrawerPaneContainer backgroundDimmingView](self, "backgroundDimmingView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setAlpha:", v28);

  -[WFDrawerPaneContainer foregroundDimmingView](self, "foregroundDimmingView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "alpha");
  v32 = v31;

  if ((-[WFDrawerPaneContainer dimming](self, "dimming") & 4) == 0)
  {
    if ((-[WFDrawerPaneContainer dimming](self, "dimming") & 8) != 0)
      v27 = 0.0;
    else
      v27 = v32;
  }
  -[WFDrawerPaneContainer foregroundDimmingView](self, "foregroundDimmingView");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setAlpha:", v27);

}

- (void)transitionWithPushedAnimationToVisibility:(unint64_t)a3 withDimming:(unint64_t)a4 animated:(BOOL)a5 interruptible:(BOOL)a6 completion:(id)a7
{
  _BOOL4 v8;
  void (**v12)(id, _QWORD);
  double v13;
  double v14;
  double v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  void (**v23)(_QWORD);
  void (**v24)(_QWORD);
  void *v25;
  char v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  void (**v35)(_QWORD);
  void (**v36)(id, _QWORD);
  BOOL v37;
  _QWORD v38[6];
  _QWORD aBlock[7];

  v8 = a5;
  v12 = (void (**)(id, _QWORD))a7;
  -[WFDrawerPaneContainer drawerHeight](self, "drawerHeight");
  v14 = v13;
  -[WFDrawerPaneContainer heightForVisibility:](self, "heightForVisibility:", a3);
  if (v14 == v15 && -[WFDrawerPaneContainer dimming](self, "dimming") == a4)
  {
    -[WFDrawerPaneContainer delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      -[WFDrawerPaneContainer delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "drawerPaneContainer:willTransitionToVisibility:", self, a3);

    }
    -[WFDrawerPaneContainer delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) != 0)
    {
      -[WFDrawerPaneContainer delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "drawerPaneContainer:didTransitionToVisibility:", self, a3);

    }
    if (v12)
      v12[2](v12, 0);
  }
  else
  {
    self->_visibility = a3;
    self->_dimming = a4;
    -[WFDrawerPaneContainer setupDimmingViewsForAnimationToDimming:](self, "setupDimmingViewsForAnimationToDimming:", a4);
    v22 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __113__WFDrawerPaneContainer_transitionWithPushedAnimationToVisibility_withDimming_animated_interruptible_completion___block_invoke;
    aBlock[3] = &unk_24EE25970;
    aBlock[4] = self;
    aBlock[5] = a3;
    v23 = (void (**)(_QWORD))_Block_copy(aBlock);
    v38[0] = v22;
    v38[1] = 3221225472;
    v38[2] = __113__WFDrawerPaneContainer_transitionWithPushedAnimationToVisibility_withDimming_animated_interruptible_completion___block_invoke_2;
    v38[3] = &unk_24EE25970;
    v38[4] = self;
    v38[5] = a3;
    v24 = (void (**)(_QWORD))_Block_copy(v38);
    -[WFDrawerPaneContainer delegate](self, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_opt_respondsToSelector();

    if ((v26 & 1) != 0)
    {
      -[WFDrawerPaneContainer delegate](self, "delegate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "drawerPaneContainer:willTransitionToVisibility:", self, a3);

    }
    -[WFDrawerPaneContainer drawerPane](self, "drawerPane");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_opt_respondsToSelector();

    if ((v29 & 1) != 0)
    {
      -[WFDrawerPaneContainer drawerPane](self, "drawerPane");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "willTransitionToVisibility:", a3);

    }
    if (v8)
    {
      if (!a6)
      {
        -[WFDrawerPaneContainer gestureCoordinator](self, "gestureCoordinator");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "beginIgnoringTapGestures");

      }
      -[WFDrawerPaneContainer animationManager](self, "animationManager");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "heightAnimation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = v22;
      v34[1] = 3221225472;
      v34[2] = __113__WFDrawerPaneContainer_transitionWithPushedAnimationToVisibility_withDimming_animated_interruptible_completion___block_invoke_3;
      v34[3] = &unk_24EE25998;
      v37 = a6;
      v34[4] = self;
      v35 = v24;
      v36 = v12;
      objc_msgSend(v33, "applyWithAnimations:completion:", v23, v34);

    }
    else
    {
      v23[2](v23);
      v24[2](v24);
      if (v12)
        v12[2](v12, 1);
    }

  }
}

- (void)transitionToVisibility:(unint64_t)a3 withDimming:(unint64_t)a4 animated:(BOOL)a5 interruptible:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v7 = a6;
  v8 = a5;
  v12 = a7;
  -[WFDrawerPaneContainer animationManager](self, "animationManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDrawerPaneContainer animationManager](self, "animationManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "heightAnimation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "coordinatedUnitAnimation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pushHeightAnimation:", v16);

  -[WFDrawerPaneContainer transitionWithPushedAnimationToVisibility:withDimming:animated:interruptible:completion:](self, "transitionWithPushedAnimationToVisibility:withDimming:animated:interruptible:completion:", a3, a4, v8, v7, v12);
  -[WFDrawerPaneContainer animationManager](self, "animationManager");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "popHeightAnimation");

}

- (void)setupDimmingViewsForAnimationToDimming:(unint64_t)a3
{
  char v3;
  void *v5;
  void *v6;
  double v7;
  id v8;

  v3 = a3;
  if ((a3 & 1) == 0)
  {
    -[WFDrawerPaneContainer backgroundDimmingView](self, "backgroundDimmingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", 0.0);

  }
  if ((v3 & 4) != 0)
  {
    -[WFDrawerPaneContainer installForegroundDimmingViewIfNeeded](self, "installForegroundDimmingViewIfNeeded");
    -[WFDrawerPaneContainer foregroundDimmingView](self, "foregroundDimmingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0.0;
LABEL_8:
    v8 = v6;
    objc_msgSend(v6, "setAlpha:", v7);

    return;
  }
  if ((v3 & 8) != 0)
  {
    -[WFDrawerPaneContainer installForegroundDimmingViewIfNeeded](self, "installForegroundDimmingViewIfNeeded");
    -[WFDrawerPaneContainer foregroundDimmingView](self, "foregroundDimmingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 1.0;
    goto LABEL_8;
  }
}

- (void)installForegroundDimmingViewIfNeeded
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;

  -[WFDrawerPaneContainer foregroundDimmingView](self, "foregroundDimmingView");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_3;
  v4 = (void *)v3;
  -[WFDrawerPaneContainer foregroundDimmingView](self, "foregroundDimmingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_3:
    -[WFDrawerPaneContainer drawerView](self, "drawerView");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x24BEBDB00]);
    objc_msgSend(v16, "bounds");
    v8 = (void *)objc_msgSend(v7, "initWithFrame:");
    objc_msgSend(v8, "setAutoresizingMask:", 18);
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.05);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v9);

    objc_msgSend(v8, "setUserInteractionEnabled:", 0);
    objc_msgSend(v8, "setAlpha:", 0.0);
    objc_msgSend(v16, "addSubview:", v8);
    objc_msgSend(v8, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setMasksToBounds:", 1);

    -[WFDrawerPaneContainer drawerPane](self, "drawerPane");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "topCornerRadius");
    v13 = v12;
    objc_msgSend(v8, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCornerRadius:", v13);

    objc_msgSend(v8, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setMaskedCorners:", 3);

    objc_storeWeak((id *)&self->_foregroundDimmingView, v8);
  }
}

- (void)removeForegroundDimmingViewIfUnused
{
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;

  -[WFDrawerPaneContainer foregroundDimmingView](self, "foregroundDimmingView");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[WFDrawerPaneContainer foregroundDimmingView](self, "foregroundDimmingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alpha");
    v7 = v6;

    if (v7 == 0.0)
    {
      -[WFDrawerPaneContainer foregroundDimmingView](self, "foregroundDimmingView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeFromSuperview");

      objc_storeWeak((id *)&self->_foregroundDimmingView, 0);
    }
  }
}

- (UIView)drawerView
{
  void *v2;
  void *v3;

  -[WFDrawerPaneContainer drawerPane](self, "drawerPane");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (double)minimumDrawerHeight
{
  double result;

  -[WFDrawerPaneContainer heightForVisibility:](self, "heightForVisibility:", 1);
  return result;
}

- (double)maximumDrawerHeight
{
  double result;

  -[WFDrawerPaneContainer heightForVisibility:](self, "heightForVisibility:", 3);
  return result;
}

- (double)drawerHeight
{
  void *v3;
  double Height;
  void *v5;
  double v6;
  double v7;
  CGRect v9;

  -[WFDrawerPaneContainer drawerView](self, "drawerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  Height = CGRectGetHeight(v9);
  -[WFDrawerPaneContainer drawerPane](self, "drawerPane");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bottomContentInset");
  v7 = Height - v6;

  return v7;
}

- (CGRect)grabberAreaBounds
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[WFDrawerPaneContainer drawerPane](self, "drawerPane");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "grabberAreaBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)gestureCoordinatorDidBeginInteraction:(id)a3
{
  void *v3;
  id v4;

  -[WFDrawerPaneContainer view](self, "view", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endEditing:", 1);

}

- (void)gestureCoordinator:(id)a3 didContinueInteractionWithDrawerHeight:(double)a4
{
  void *v6;
  char v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  id v15;

  -[WFDrawerPaneContainer layoutDrawerViewControllerForDrawerHeight:](self, "layoutDrawerViewControllerForDrawerHeight:", a3);
  -[WFDrawerPaneContainer drawerPane](self, "drawerPane");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[WFDrawerPaneContainer drawerPane](self, "drawerPane");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "transitionContentForHeight:", a4);

  }
  -[WFDrawerPaneContainer heightForVisibility:](self, "heightForVisibility:", 2);
  v10 = v9;
  -[WFDrawerPaneContainer heightForVisibility:](self, "heightForVisibility:", 3);
  if (v10 >= a4)
  {
    -[WFDrawerPaneContainer backgroundDimmingView](self, "backgroundDimmingView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0.0;
    v15 = v13;
  }
  else
  {
    v12 = (a4 - v10) / (v11 - v10);
    -[WFDrawerPaneContainer backgroundDimmingView](self, "backgroundDimmingView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v13;
    v14 = v12;
  }
  objc_msgSend(v13, "setAlpha:", v14);

}

- (void)gestureCoordinator:(id)a3 didFinishInteractionWithVelocity:(double)a4 acceleration:(double)a5 animation:(id)a6
{
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a6;
  v9 = -[WFDrawerPaneContainer closestVisibilityWithVelocity:acceleration:previousVisibility:](self, "closestVisibilityWithVelocity:acceleration:previousVisibility:", -[WFDrawerPaneContainer visibility](self, "visibility"), a4, a5);
  if (!v16)
  {
    -[WFDrawerPaneContainer drawerHeight](self, "drawerHeight");
    v11 = v10;
    -[WFDrawerPaneContainer heightForVisibility:](self, "heightForVisibility:", v9);
    if (v12 == v11)
      v13 = 0.0;
    else
      v13 = a4 / (v12 - v11);
    +[WFDrawerAnimation drawerReleaseAnimationWithInitialVelocity:](WFDrawerAnimation, "drawerReleaseAnimationWithInitialVelocity:", v13);
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[WFDrawerPaneContainer animationManager](self, "animationManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pushHeightAnimation:", v16);

  -[WFDrawerPaneContainer transitionWithPushedAnimationToVisibility:withDimming:animated:interruptible:completion:](self, "transitionWithPushedAnimationToVisibility:withDimming:animated:interruptible:completion:", v9, 3, 1, 1, 0);
  -[WFDrawerPaneContainer animationManager](self, "animationManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "popHeightAnimation");

}

- (unint64_t)closestVisibilityWithVelocity:(double)a3 acceleration:(double)a4 previousVisibility:(unint64_t)a5
{
  double v8;
  double v11;

  -[WFDrawerPaneContainer drawerHeight](self, "drawerHeight", a5);
  if (fabs(a3) < 50.0 || *(_QWORD *)&a3 >> 63 != COERCE_UNSIGNED_INT64(a3 + a4 * 0.0333333351) >> 63)
    return -[WFDrawerPaneContainer closestVisibilityForHeight:](self, "closestVisibilityForHeight:");
  v11 = v8 + a3 * dbl_2268AB420[a3 < 0.0];
  if (a3 < 0.0)
    return -[WFDrawerPaneContainer shrinkingVisibilityForHeight:](self, "shrinkingVisibilityForHeight:", v11);
  else
    return -[WFDrawerPaneContainer growingVisibilityForHeight:](self, "growingVisibilityForHeight:", v11);
}

- (double)heightForVisibility:(unint64_t)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;

  -[WFDrawerPaneContainer view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeAreaInsets");
  v7 = v6;

  if (a3 - 1 < 2)
  {
    -[WFDrawerPaneContainer drawerPane](self, "drawerPane");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activeHeaderView");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      -[WFDrawerPaneContainer drawerPane](self, "drawerPane");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "activeHeaderView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "frame");
      v14 = v13;

      if (v14 != 0.0)
        goto LABEL_9;
    }
    else
    {

    }
    -[WFDrawerPaneContainer drawerPane](self, "drawerPane");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "activeHeaderView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setNeedsLayout");

    -[WFDrawerPaneContainer drawerPane](self, "drawerPane");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "activeHeaderView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "layoutIfNeeded");

LABEL_9:
    -[WFDrawerPaneContainer drawerPane](self, "drawerPane");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "activeHeaderView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v16, "frame");
      v27 = v26;
    }
    else
    {
      -[WFDrawerPaneContainer drawerPane](self, "drawerPane");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "fauxHeaderHeight");
      v27 = v29;

    }
    -[WFDrawerPaneContainer delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bottomInsetForPaneContainer:", self);
    v15 = v27 + v30;
    goto LABEL_13;
  }
  v15 = 0.0;
  if (a3 == 3)
  {
    -[WFDrawerPaneContainer view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    v18 = v17 - v7;
    -[WFDrawerPaneContainer delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "topInsetForPaneContainer:", self);
    v15 = v18 - v20;
LABEL_13:

  }
  return v15;
}

- (unint64_t)closestVisibilityForHeight:(double)a3
{
  uint64_t v5;
  double v6;
  unint64_t v7;
  uint64_t v8;
  double v9;
  double v10;

  v5 = 0;
  v6 = 1.79769313e308;
  v7 = 1;
  do
  {
    v8 = growingVisibilityForHeight__ascendingVisibilities[v5];
    -[WFDrawerPaneContainer heightForVisibility:](self, "heightForVisibility:", v8);
    v10 = vabdd_f64(v9, a3);
    if (v10 < v6)
    {
      v6 = v10;
      v7 = v8;
    }
    ++v5;
  }
  while (v5 != 3);
  return v7;
}

- (unint64_t)shrinkingVisibilityForHeight:(double)a3
{
  uint64_t v5;
  unint64_t v6;
  double v7;

  v5 = 0;
  while (1)
  {
    v6 = shrinkingVisibilityForHeight__descendingVisibilities[v5];
    -[WFDrawerPaneContainer heightForVisibility:](self, "heightForVisibility:", v6);
    if (v7 < a3)
      break;
    if (++v5 == 3)
      return -[WFDrawerPaneContainer closestVisibilityForHeight:](self, "closestVisibilityForHeight:", a3);
  }
  return v6;
}

- (unint64_t)growingVisibilityForHeight:(double)a3
{
  uint64_t v5;
  unint64_t v6;
  double v7;

  v5 = 0;
  while (1)
  {
    v6 = growingVisibilityForHeight__ascendingVisibilities[v5];
    -[WFDrawerPaneContainer heightForVisibility:](self, "heightForVisibility:", v6);
    if (v7 > a3)
      break;
    if (++v5 == 3)
      return -[WFDrawerPaneContainer closestVisibilityForHeight:](self, "closestVisibilityForHeight:", a3);
  }
  return v6;
}

- (WFDrawerPaneContainerDelegate)delegate
{
  return (WFDrawerPaneContainerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WFDrawerPane)drawerPane
{
  return self->_drawerPane;
}

- (unint64_t)visibility
{
  return self->_visibility;
}

- (unint64_t)dimming
{
  return self->_dimming;
}

- (BOOL)userInteractionEnabled
{
  return self->_userInteractionEnabled;
}

- (BOOL)isInactive
{
  return self->_inactive;
}

- (WFDrawerGestureCoordinator)gestureCoordinator
{
  return self->_gestureCoordinator;
}

- (WFDrawerAnimationManager)animationManager
{
  return self->_animationManager;
}

- (UIView)backgroundDimmingView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_backgroundDimmingView);
}

- (UIView)foregroundDimmingView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_foregroundDimmingView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_foregroundDimmingView);
  objc_destroyWeak((id *)&self->_backgroundDimmingView);
  objc_storeStrong((id *)&self->_animationManager, 0);
  objc_storeStrong((id *)&self->_gestureCoordinator, 0);
  objc_storeStrong((id *)&self->_drawerPane, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __113__WFDrawerPaneContainer_transitionWithPushedAnimationToVisibility_withDimming_animated_interruptible_completion___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  char v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "heightForVisibility:", *(_QWORD *)(a1 + 40));
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "layoutDrawerViewController");
  objc_msgSend(*(id *)(a1 + 32), "drawerPane");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "drawerPane");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transitionContentForHeight:", v3);

  }
}

void __113__WFDrawerPaneContainer_transitionWithPushedAnimationToVisibility_withDimming_animated_interruptible_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "removeForegroundDimmingViewIfUnused");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "drawerPaneContainer:didTransitionToVisibility:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(a1 + 32), "drawerPane");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "drawerPane");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didTransitionToVisibility:", *(_QWORD *)(a1 + 40));

  }
}

uint64_t __113__WFDrawerPaneContainer_transitionWithPushedAnimationToVisibility_withDimming_animated_interruptible_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t result;

  if (!*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "gestureCoordinator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endIgnoringTapGestures");

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t __76__WFDrawerPaneContainer_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutDrawerViewController");
}

@end
