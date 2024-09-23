@implementation SBActivityBannerViewController

+ (NSString)requesterIdentifier
{
  return (NSString *)CFSTR("com.apple.springboard.activity");
}

- (NSString)requesterIdentifier
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "requesterIdentifier");
}

- (NSString)requestIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  -[SBActivityViewController activityHostViewController](self, "activityHostViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activitySceneDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "activityDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v4, "platterTargetBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activityIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@.%@"), v6, v7);

  return (NSString *)v8;
}

- (id)_activityIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[SBActivityViewController activityHostViewController](self, "activityHostViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activitySceneDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isDraggingDismissalEnabled
{
  return 1;
}

- (BOOL)isDraggingInteractionEnabled
{
  return 1;
}

- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4
{
  CGFloat width;
  double v5;
  double v6;
  CGSize result;

  width = a4.width;
  -[SBActivityViewController preferredActivityContentSize](self, "preferredActivityContentSize", a3.width, a3.height, a4.width, a4.height);
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  PLPlatterView *v12;
  PLPlatterView *platterView;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  UIView *v20;
  UIView *backgroundTintView;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)SBActivityBannerViewController;
  -[SBActivityViewController viewDidLoad](&v26, sel_viewDidLoad);
  v27[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)-[SBActivityBannerViewController registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v3, sel_userInterfaceStyleChangedForEnvironment_previousTraitCollection_);

  -[SBActivityViewController activityHostViewController](self, "activityHostViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backgroundTintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBActivityBannerViewController _shouldSetDefaultBackground](self, "_shouldSetDefaultBackground"))
  {
    -[SBActivityBannerViewController traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBActivityBannerViewController _backgroundTintColorForUserInterfaceStyle:](self, "_backgroundTintColorForUserInterfaceStyle:", objc_msgSend(v7, "userInterfaceStyle"));
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  if (v6)
    v9 = 22;
  else
    v9 = 1;
  -[SBActivityBannerViewController traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceStyle");

  v12 = (PLPlatterView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7D3F0]), "initWithRecipe:", v9);
  platterView = self->_platterView;
  self->_platterView = v12;

  -[PLPlatterView setUsesBackgroundView:](self->_platterView, "setUsesBackgroundView:", 1);
  -[PLPlatterView setOverrideUserInterfaceStyle:](self->_platterView, "setOverrideUserInterfaceStyle:", v11);
  -[SBActivityBannerViewController setMaterialGroupNameBase:](self, "setMaterialGroupNameBase:", CFSTR("Activities"));
  -[PLPlatterView setHasShadow:](self->_platterView, "setHasShadow:", 1);
  -[SBActivityViewController activityHostViewController](self, "activityHostViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "activitySceneDescriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "metricsRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "lockScreenMetrics");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "cornerRadius");
  v19 = v18;

  -[PLPlatterView _setContinuousCornerRadius:](self->_platterView, "_setContinuousCornerRadius:", v19);
  if (-[SBActivityBannerViewController _shouldHaveBackgroundTint](self, "_shouldHaveBackgroundTint"))
  {
    v20 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    backgroundTintView = self->_backgroundTintView;
    self->_backgroundTintView = v20;

    -[UIView _setContinuousCornerRadius:](self->_backgroundTintView, "_setContinuousCornerRadius:", v19);
    -[UIView setBackgroundColor:](self->_backgroundTintView, "setBackgroundColor:", v6);
    -[SBActivityBannerViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", self->_backgroundTintView);

    -[SBActivityBannerViewController view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sendSubviewToBack:", self->_backgroundTintView);

  }
  -[SBActivityBannerViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addSubview:", self->_platterView);

  -[SBActivityBannerViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sendSubviewToBack:", self->_platterView);

}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBActivityBannerViewController;
  -[SBActivityViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[SBActivityBannerViewController _layoutSubviews](self, "_layoutSubviews");
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
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  UIView *backgroundTintView;
  UIView *v15;
  UIView *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;

  -[SBActivityBannerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  -[SBActivityViewController preferredActivityContentSize](self, "preferredActivityContentSize");
  v8 = v7;
  if (v5 - v6 <= 0.0)
    v9 = 0.0;
  else
    v9 = (v5 - v6) * 0.5;
  if (v6 < v5)
    v5 = v6;
  -[PLPlatterView setFrame:](self->_platterView, "setFrame:", v9);
  if (-[SBActivityBannerViewController _shouldHaveBackgroundTint](self, "_shouldHaveBackgroundTint"))
  {
    -[SBActivityViewController activityHostViewController](self, "activityHostViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "backgroundTintColor");
    v19 = (id)objc_claimAutoreleasedReturnValue();

    if (-[SBActivityBannerViewController _shouldSetDefaultBackground](self, "_shouldSetDefaultBackground"))
    {
      -[SBActivityBannerViewController traitCollection](self, "traitCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBActivityBannerViewController _backgroundTintColorForUserInterfaceStyle:](self, "_backgroundTintColorForUserInterfaceStyle:", objc_msgSend(v11, "userInterfaceStyle"));
      v12 = objc_claimAutoreleasedReturnValue();

      v13 = (id)v12;
    }
    else
    {
      v13 = v19;
    }
    backgroundTintView = self->_backgroundTintView;
    v20 = v13;
    if (!backgroundTintView)
    {
      v15 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
      v16 = self->_backgroundTintView;
      self->_backgroundTintView = v15;

      -[UIView removeFromSuperview](self->_backgroundTintView, "removeFromSuperview");
      -[SBActivityBannerViewController view](self, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addSubview:", self->_backgroundTintView);

      -[SBActivityBannerViewController view](self, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "sendSubviewToBack:", self->_backgroundTintView);

      -[UIView bringSubviewToFront:](self->_backgroundTintView, "bringSubviewToFront:", self->_platterView);
      v13 = v20;
      backgroundTintView = self->_backgroundTintView;
    }
    -[UIView setBackgroundColor:](backgroundTintView, "setBackgroundColor:", v13);
    -[UIView setBounds:](self->_backgroundTintView, "setBounds:", v9, 0.0, v5, v8);
    -[UIView setFrame:](self->_backgroundTintView, "setFrame:", v9, 0.0, v5, v8);

  }
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

- (BOOL)_shouldSetDefaultBackground
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[SBActivityBannerViewController _hasBackgroundTintColor](self, "_hasBackgroundTintColor"))
    return 0;
  -[SBActivityViewController activityHostViewController](self, "activityHostViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activitySceneDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v6, "contentType") == 0;

  return v3;
}

- (BOOL)_shouldHaveBackgroundTint
{
  return -[SBActivityBannerViewController _hasBackgroundTintColor](self, "_hasBackgroundTintColor")
      || -[SBActivityBannerViewController _shouldSetDefaultBackground](self, "_shouldSetDefaultBackground");
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[SBActivityBannerViewController bannerDelegate](self, "bannerDelegate", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBActivityBannerViewController _activityIdentifier](self, "_activityIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activityBannerDidDisappear:activityIdentifier:", self, v6);

  }
  -[SBActivityViewController activityHostViewController](self, "activityHostViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activitySceneDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activityDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isMomentary");

  if (v10)
  {
    -[SBActivityViewController activityHostViewController](self, "activityHostViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "activityIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    SBLogActivity();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543362;
      v16 = v12;
      _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] banner dismissed but is momentary so ending activity", (uint8_t *)&v15, 0xCu);
    }

    v14 = objc_alloc_init(MEMORY[0x1E0C90230]);
    objc_msgSend(v14, "endActivity:", v12);

  }
}

- (void)activityHostViewControllerBackgroundTintColorDidChange:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBActivityBannerViewController;
  -[SBActivityViewController activityHostViewControllerBackgroundTintColorDidChange:](&v6, sel_activityHostViewControllerBackgroundTintColorDidChange_, a3);
  -[SBActivityBannerViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

  -[SBActivityBannerViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

}

- (id)_backgroundTintColorForUserInterfaceStyle:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;

  v4 = self;
  if (!-[SBActivityBannerViewController _hasBackgroundTintColor](self, "_hasBackgroundTintColor"))
  {
    if (!a3 || a3 == 2)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3 != 1)
        return v4;
      objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v4 = (void *)v6;
    return v4;
  }
  objc_msgSend(v4, "activityHostViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backgroundTintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)userInterfaceStyleChangedForEnvironment:(id)a3 previousTraitCollection:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v5 = a4;
  -[SBActivityBannerViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  v8 = objc_msgSend(v5, "userInterfaceStyle");
  if (v8 != v7)
  {
    -[SBActivityBannerViewController view](self, "view");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNeedsLayout");

  }
}

- (NSString)materialGroupNameBase
{
  return -[PLPlatterView materialGroupNameBase](self->_platterView, "materialGroupNameBase");
}

- (void)setMaterialGroupNameBase:(id)a3
{
  -[PLPlatterView setMaterialGroupNameBase:](self->_platterView, "setMaterialGroupNameBase:", a3);
}

- (SBActivityBannerViewControllerDelegate)bannerDelegate
{
  return (SBActivityBannerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_bannerDelegate);
}

- (void)setBannerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_bannerDelegate, a3);
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
  objc_destroyWeak((id *)&self->_bannerDelegate);
}

@end
