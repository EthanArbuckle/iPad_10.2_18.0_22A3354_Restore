@implementation SBActivityAmbientCompactOverlayViewController

- (void)viewDidLoad
{
  void *v3;
  PLPlatterView *v4;
  PLPlatterView *platterView;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBActivityAmbientCompactOverlayViewController;
  -[SBActivityViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[SBActivityAmbientCompactOverlayViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (PLPlatterView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7D3F0]), "initWithRecipe:", 52);
  platterView = self->_platterView;
  self->_platterView = v4;

  -[PLPlatterView setUsesBackgroundView:](self->_platterView, "setUsesBackgroundView:", 1);
  -[PLPlatterView setOverrideUserInterfaceStyle:](self->_platterView, "setOverrideUserInterfaceStyle:", 2);
  -[PLPlatterView setMaterialGroupNameBase:](self->_platterView, "setMaterialGroupNameBase:", CFSTR("Activities"));
  objc_msgSend(v3, "addSubview:", self->_platterView);
  objc_msgSend(v3, "sendSubviewToBack:", self->_platterView);
  -[SBActivityViewController activityHostViewController](self, "activityHostViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setHitTestingDisabled:", 1);

  -[SBActivityAmbientCompactOverlayViewController _configureTapGesture](self, "_configureTapGesture");
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBActivityAmbientCompactOverlayViewController;
  -[SBActivityViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[SBActivityAmbientCompactOverlayViewController _layoutSubviews](self, "_layoutSubviews");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 24;
}

- (CGSize)contentSize
{
  double v2;
  double v3;
  CGSize result;

  -[SBActivityAmbientCompactOverlayViewController preferredContentSize](self, "preferredContentSize");
  if (v2 == *MEMORY[0x1E0C9D820] && v3 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v2 = 40.0;
    v3 = 40.0;
  }
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)cornerRadius
{
  double v2;

  -[SBActivityAmbientCompactOverlayViewController contentSize](self, "contentSize");
  return v2 * 0.5;
}

- (void)setBackgroundAlpha:(double)a3
{
  -[PLPlatterView setAlpha:](self->_platterView, "setAlpha:", a3);
}

- (void)setContentAlpha:(double)a3
{
  void *v4;
  id v5;

  -[SBActivityViewController activityHostViewController](self, "activityHostViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", a3);

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

  -[SBActivityAmbientCompactOverlayViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[PLPlatterView setFrame:](self->_platterView, "setFrame:", v5, v7, v9, v11);
}

- (void)_configureTapGesture
{
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__handleTapGesture);
  -[SBActivityAmbientCompactOverlayViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addGestureRecognizer:", v4);

}

- (void)_handleTapGesture
{
  void *v3;
  id v4;

  -[SBActivityAmbientCompactOverlayViewController compactOverlayDelegate](self, "compactOverlayDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBActivityViewController activityItem](self, "activityItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleTapForCompactOverlayViewController:withActivityItem:", self, v3);

}

- (SBActivityAmbientCompactOverlayViewControllerDelegate)compactOverlayDelegate
{
  return (SBActivityAmbientCompactOverlayViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_compactOverlayDelegate);
}

- (void)setCompactOverlayDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_compactOverlayDelegate, a3);
}

- (PLPlatterView)platterView
{
  return self->_platterView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_destroyWeak((id *)&self->_compactOverlayDelegate);
}

@end
