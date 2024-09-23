@implementation SBHomeScreenView

- (void)layoutSubviews
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBHomeScreenView;
  -[SBHomeScreenView layoutSubviews](&v12, sel_layoutSubviews);
  -[SBHomeScreenView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBHomeScreenView statusBarLegibilityView](self, "statusBarLegibilityView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (SBFStatusBarLegibilityView)statusBarLegibilityView
{
  return self->_statusBarLegibilityView;
}

- (SBHomeScreenView)initWithFrame:(CGRect)a3
{
  SBHomeScreenView *v3;
  SBFStatusBarLegibilityView *v4;
  SBFStatusBarLegibilityView *statusBarLegibilityView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBHomeScreenView;
  v3 = -[SBHomeScreenView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (SBFStatusBarLegibilityView *)objc_alloc_init(MEMORY[0x1E0DA9EF8]);
    statusBarLegibilityView = v3->_statusBarLegibilityView;
    v3->_statusBarLegibilityView = v4;

    -[SBHomeScreenView addSubview:](v3, "addSubview:", v3->_statusBarLegibilityView);
  }
  return v3;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  __int128 v14;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SBHomeScreenView window](self, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "bounds");
    x = v10;
    y = v11;
    width = v12;
    height = v13;
  }
  v20 = 0u;
  v21 = 0u;
  v19 = 0u;
  -[SBHomeScreenView transform](self, "transform");
  v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v16 = *MEMORY[0x1E0C9BAA8];
  v17 = v14;
  v18 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[SBHomeScreenView setTransform:](self, "setTransform:", &v16);
  v15.receiver = self;
  v15.super_class = (Class)SBHomeScreenView;
  -[SBHomeScreenView setFrame:](&v15, sel_setFrame_, x, y, width, height);
  v16 = v19;
  v17 = v20;
  v18 = v21;
  -[SBHomeScreenView setTransform:](self, "setTransform:", &v16);

}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGRect v14;
  CGRect v15;

  v13.receiver = self;
  v13.super_class = (Class)SBHomeScreenView;
  -[SBHomeScreenView didMoveToWindow](&v13, sel_didMoveToWindow);
  -[SBHomeScreenView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[SBHomeScreenView frame](self, "frame");
    v15.origin.x = v6;
    v15.origin.y = v8;
    v15.size.width = v10;
    v15.size.height = v12;
    if (!CGRectEqualToRect(v14, v15))
      -[SBHomeScreenView setFrame:](self, "setFrame:", v6, v8, v10, v12);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusBarLegibilityView, 0);
}

@end
