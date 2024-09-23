@implementation SBActivityAmbientFullOverlayViewController

- (void)viewDidLoad
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  UIView *v11;
  UIView *backgroundTintView;
  void *v13;
  void *v14;
  PLPlatterView *v15;
  PLPlatterView *platterView;
  void *v17;
  void *v18;
  PLGrabberView *v19;
  PLGrabberView *grabberView;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)SBActivityAmbientFullOverlayViewController;
  -[SBActivityViewController viewDidLoad](&v22, sel_viewDidLoad);
  -[SBActivityViewController activityItem](self, "activityItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBActivityAmbientFullOverlayViewController _itemIsFirstPartyActivity:](self, "_itemIsFirstPartyActivity:", v3);

  if (!v4)
  {
    -[SBActivityViewController activityHostViewController](self, "activityHostViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "backgroundTintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;

    if (v9)
      v10 = 22;
    else
      v10 = 1;
    v11 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    backgroundTintView = self->_backgroundTintView;
    self->_backgroundTintView = v11;

    -[UIView setBackgroundColor:](self->_backgroundTintView, "setBackgroundColor:", v9);
    -[SBActivityAmbientFullOverlayViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", self->_backgroundTintView);

    -[SBActivityAmbientFullOverlayViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sendSubviewToBack:", self->_backgroundTintView);

    v15 = (PLPlatterView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7D3F0]), "initWithRecipe:", v10);
    platterView = self->_platterView;
    self->_platterView = v15;

    -[PLPlatterView setUsesBackgroundView:](self->_platterView, "setUsesBackgroundView:", 1);
    -[PLPlatterView setOverrideUserInterfaceStyle:](self->_platterView, "setOverrideUserInterfaceStyle:", 2);
    -[PLPlatterView setMaterialGroupNameBase:](self->_platterView, "setMaterialGroupNameBase:", CFSTR("Activities"));
    -[SBActivityAmbientFullOverlayViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", self->_platterView);

    -[SBActivityAmbientFullOverlayViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sendSubviewToBack:", self->_platterView);

  }
  v19 = (PLGrabberView *)objc_alloc_init(MEMORY[0x1E0D7D3C8]);
  grabberView = self->_grabberView;
  self->_grabberView = v19;

  -[SBActivityAmbientFullOverlayViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", self->_grabberView);

}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBActivityAmbientFullOverlayViewController;
  -[SBActivityViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[SBActivityAmbientFullOverlayViewController _layoutSubviews](self, "_layoutSubviews");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 24;
}

- (void)_layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  PLPlatterView *platterView;
  void *v13;
  void *v14;
  PLGrabberView *grabberView;
  id v16;

  -[SBActivityAmbientFullOverlayViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  platterView = self->_platterView;
  if (platterView)
    -[PLPlatterView setFrame:](platterView, "setFrame:", v5, v7, v9, v11);
  if (-[SBActivityAmbientFullOverlayViewController _hasBackgroundTintColor](self, "_hasBackgroundTintColor"))
  {
    -[SBActivityViewController activityHostViewController](self, "activityHostViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "backgroundTintColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
    -[SBActivityAmbientFullOverlayViewController _updateBackgroundTintViewWithBounds:color:](self, "_updateBackgroundTintViewWithBounds:color:", v14, v5, v7, v9, v11);

    goto LABEL_8;
  }
  if (-[SBActivityAmbientFullOverlayViewController _isWidgetBasedActivity](self, "_isWidgetBasedActivity"))
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_8:
  grabberView = self->_grabberView;
  -[SBActivityAmbientFullOverlayViewController _grabberViewFrame](self, "_grabberViewFrame");
  -[PLGrabberView setFrame:](grabberView, "setFrame:");
  -[SBActivityAmbientFullOverlayViewController view](self, "view");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bringSubviewToFront:", self->_grabberView);

}

- (void)_updateBackgroundTintViewWithBounds:(CGRect)a3 color:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  UIView *backgroundTintView;
  UIView *v11;
  UIView *v12;
  void *v13;
  void *v14;
  id v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  backgroundTintView = self->_backgroundTintView;
  v15 = v9;
  if (!backgroundTintView)
  {
    v11 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    v12 = self->_backgroundTintView;
    self->_backgroundTintView = v11;

    -[UIView removeFromSuperview](self->_backgroundTintView, "removeFromSuperview");
    -[SBActivityAmbientFullOverlayViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", self->_backgroundTintView);

    -[SBActivityAmbientFullOverlayViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sendSubviewToBack:", self->_backgroundTintView);

    backgroundTintView = self->_backgroundTintView;
    if (self->_platterView)
    {
      -[UIView bringSubviewToFront:](backgroundTintView, "bringSubviewToFront:");
      backgroundTintView = self->_backgroundTintView;
    }
    v9 = v15;
  }
  -[UIView setBackgroundColor:](backgroundTintView, "setBackgroundColor:", v9);
  -[UIView setBounds:](self->_backgroundTintView, "setBounds:", x, y, width, height);
  -[UIView setFrame:](self->_backgroundTintView, "setFrame:", x, y, width, height);

}

- (BOOL)_hasBackgroundTintColor
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SBActivityViewController activityHostViewController](self, "activityHostViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundTintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)_isWidgetBasedActivity
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SBActivityViewController activityItem](self, "activityItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "contentType") == 0;

  return v4;
}

- (BOOL)_itemIsFirstPartyActivity:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend(a3, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "platterTargetBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBActivityManager sharedInstance](SBActivityManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstPartyActivityGroupingIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  return v7;
}

- (CGRect)_grabberViewFrame
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect v25;
  CGRect v26;
  CGRect result;

  -[SBActivityAmbientFullOverlayViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v25.origin.x = v5;
  v25.origin.y = v7;
  v25.size.width = v9;
  v25.size.height = v11;
  CGRectGetMidX(v25);
  v26.origin.x = v5;
  v26.origin.y = v7;
  v26.size.width = v9;
  v26.size.height = v11;
  CGRectGetMaxY(v26);
  -[SBActivityAmbientFullOverlayViewController traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayScale");
  BSRectRoundForScale();
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = v14;
  v22 = v16;
  v23 = v18;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (void)activityHostViewControllerBackgroundTintColorDidChange:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBActivityAmbientFullOverlayViewController;
  -[SBActivityViewController activityHostViewControllerBackgroundTintColorDidChange:](&v6, sel_activityHostViewControllerBackgroundTintColorDidChange_, a3);
  -[SBActivityAmbientFullOverlayViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

  -[SBActivityAmbientFullOverlayViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

}

- (PLPlatterView)platterView
{
  return self->_platterView;
}

- (UIView)backgroundTintView
{
  return self->_backgroundTintView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundTintView, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_grabberView, 0);
}

@end
