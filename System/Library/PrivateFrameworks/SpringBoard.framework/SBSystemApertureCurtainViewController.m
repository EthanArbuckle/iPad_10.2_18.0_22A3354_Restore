@implementation SBSystemApertureCurtainViewController

- (void)setIndicatorSourceView:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SBSystemApertureCurtainViewController _indicatorPortalView](self, "_indicatorPortalView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSourceView:", v4);

  -[SBSystemApertureCurtainViewController _indicatorPortalView](self, "_indicatorPortalView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v4 == 0);

}

- (id)_indicatorPortalView
{
  _UIPortalView *indicatorPortalView;
  id v4;
  _UIPortalView *v5;

  indicatorPortalView = self->_indicatorPortalView;
  if (!indicatorPortalView)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CEAE58]);
    objc_msgSend(v4, "setMatchesPosition:", 1);
    objc_msgSend(v4, "setMatchesAlpha:", 1);
    objc_msgSend(v4, "setMatchesTransform:", 1);
    objc_msgSend(v4, "setHidesSourceView:", 0);
    v5 = self->_indicatorPortalView;
    self->_indicatorPortalView = (_UIPortalView *)v4;

    indicatorPortalView = self->_indicatorPortalView;
  }
  return indicatorPortalView;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;

  -[SBSystemApertureCurtainViewController view](self, "view");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBSystemApertureCurtainViewController _indicatorPortalView](self, "_indicatorPortalView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
  -[SBSystemApertureCurtainViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v11);

}

- (void)setCurtainView:(id)a3
{
  UIView *v5;
  UIView **p_curtainView;
  UIView *curtainView;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  UIView *v12;

  v5 = (UIView *)a3;
  p_curtainView = &self->_curtainView;
  curtainView = self->_curtainView;
  if (curtainView != v5)
  {
    v12 = v5;
    -[UIView superview](curtainView, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSystemApertureCurtainViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (v10)
      -[UIView removeFromSuperview](*p_curtainView, "removeFromSuperview");
    -[SBSystemApertureCurtainViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "insertSubview:atIndex:", v12, 0);

    objc_storeStrong((id *)p_curtainView, a3);
    v5 = v12;
  }

}

- (UIView)curtainView
{
  return self->_curtainView;
}

- (UIView)indicatorSourceView
{
  void *v2;
  void *v3;

  -[SBSystemApertureCurtainViewController _indicatorPortalView](self, "_indicatorPortalView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sourceView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indicatorPortalView, 0);
  objc_storeStrong((id *)&self->_curtainView, 0);
}

@end
