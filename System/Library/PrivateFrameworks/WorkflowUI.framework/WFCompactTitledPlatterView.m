@implementation WFCompactTitledPlatterView

- (WFCompactTitledPlatterView)initWithRecipe:(int64_t)a3
{
  WFCompactTitledPlatterView *v3;
  WFCompactTitledPlatterView *v4;
  WFCompactTitledPlatterView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFCompactTitledPlatterView;
  v3 = -[PLPlatterView initWithRecipe:](&v7, sel_initWithRecipe_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_sashVisible = 0;
    v5 = v3;
  }

  return v4;
}

- (void)setNeedsLayout
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFCompactTitledPlatterView;
  -[WFCompactTitledPlatterView setNeedsLayout](&v4, sel_setNeedsLayout);
  -[WFCompactTitledPlatterView sashView](self, "sashView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)setSashVisible:(BOOL)a3
{
  void *v4;

  self->_sashVisible = a3;
  if (a3)
  {
    -[WFCompactTitledPlatterView configureSashViewIfNecessary](self, "configureSashViewIfNecessary");
  }
  else
  {
    -[WFCompactTitledPlatterView sashView](self, "sashView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

  }
  -[WFCompactTitledPlatterView setNeedsLayout](self, "setNeedsLayout");
  -[WFCompactTitledPlatterView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)configureSashViewIfNecessary
{
  WFCompactPlatterSashView *v3;
  WFCompactPlatterSashView *v4;
  WFCompactPlatterSashView *sashView;

  if (!self->_sashView)
  {
    if (-[WFCompactTitledPlatterView sashVisible](self, "sashVisible"))
    {
      v3 = [WFCompactPlatterSashView alloc];
      v4 = -[WFCompactPlatterSashView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      sashView = self->_sashView;
      self->_sashView = v4;

      -[WFCompactPlatterSashView setAutoresizesSubviews:](self->_sashView, "setAutoresizesSubviews:", 1);
      -[WFCompactTitledPlatterView addSubview:](self, "addSubview:", self->_sashView);
      -[WFCompactTitledPlatterView bringSubviewToFront:](self, "bringSubviewToFront:", self->_sashView);
    }
  }
}

- (void)layoutHeaderViews
{
  double x;
  double y;
  double width;
  double height;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  CGRect v15;

  -[WFCompactTitledPlatterView bounds](self, "bounds");
  x = v15.origin.x;
  y = v15.origin.y;
  width = v15.size.width;
  height = v15.size.height;
  if (!CGRectIsEmpty(v15))
  {
    -[WFCompactPlatterSashView sizeThatFits:](self->_sashView, "sizeThatFits:", width, height);
    BSRectWithSize();
    -[WFCompactTitledPlatterView window](self, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "screen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scale");
    UIRectIntegralWithScale();
    x = v9;
    y = v10;
    width = v11;
    height = v12;

  }
  -[WFCompactTitledPlatterView sashView](self, "sashView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", x, y, width, height);

  -[WFCompactTitledPlatterView sashView](self, "sashView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNeedsLayout");

}

- (void)layoutSubviews
{
  double x;
  double y;
  double width;
  double height;
  void *v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  objc_super v20;
  CGRect v21;

  v20.receiver = self;
  v20.super_class = (Class)WFCompactTitledPlatterView;
  -[PLPlatterView layoutSubviews](&v20, sel_layoutSubviews);
  -[WFCompactTitledPlatterView configureSashViewIfNecessary](self, "configureSashViewIfNecessary");
  -[WFCompactTitledPlatterView layoutHeaderViews](self, "layoutHeaderViews");
  -[WFCompactTitledPlatterView _mainContentFrame](self, "_mainContentFrame");
  x = v21.origin.x;
  y = v21.origin.y;
  width = v21.size.width;
  height = v21.size.height;
  if (!CGRectIsEmpty(v21))
  {
    -[PLPlatterView customContentView](self, "customContentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFrame:", x, y, width, height);

  }
  if (-[WFCompactTitledPlatterView sashVisible](self, "sashVisible"))
    v8 = 16.0;
  else
    v8 = 0.0;
  -[PLPlatterView customContentView](self, "customContentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12 + 0.0;
  v15 = v8 + v14;
  v17 = v16 - v8;
  -[PLPlatterView customContentView](self, "customContentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v13, v15, v11, v17);

  -[WFCompactTitledPlatterView delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "layoutCustomContentViewForPlatterView:", self);

}

- (CGSize)sizeThatFitsContentWithSize:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGSize result;

  v11.receiver = self;
  v11.super_class = (Class)WFCompactTitledPlatterView;
  -[PLPlatterView sizeThatFitsContentWithSize:](&v11, sel_sizeThatFitsContentWithSize_, a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  -[WFCompactTitledPlatterView configureSashViewIfNecessary](self, "configureSashViewIfNecessary");
  if (self->_sashView && -[WFCompactTitledPlatterView sashVisible](self, "sashVisible"))
  {
    -[WFCompactPlatterSashView contentBaseline](self->_sashView, "contentBaseline");
    v7 = v7 + v8;
  }
  if (v7 > 0.0 && -[WFCompactTitledPlatterView sashVisible](self, "sashVisible"))
    v7 = v7 + 16.0;
  v9 = v5;
  v10 = v7;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGRect)_mainContentFrame
{
  CGFloat x;
  double y;
  CGFloat width;
  double height;
  _BOOL4 v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect v19;
  CGRect v20;
  CGRect result;

  -[WFCompactTitledPlatterView bounds](self, "bounds");
  x = v19.origin.x;
  y = v19.origin.y;
  width = v19.size.width;
  height = v19.size.height;
  if (!CGRectIsEmpty(v19))
  {
    -[WFCompactTitledPlatterView layoutHeaderViews](self, "layoutHeaderViews");
    v7 = -[WFCompactTitledPlatterView sashVisible](self, "sashVisible");
    v8 = 0.0;
    if (v7)
      -[WFCompactPlatterSashView contentBaseline](self->_sashView, "contentBaseline", 0.0);
    y = y + v8;
    height = height - v8;
  }
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  if (!CGRectIsEmpty(v20))
  {
    -[WFCompactTitledPlatterView window](self, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "screen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scale");
    UIRectIntegralWithScale();
    x = v11;
    y = v12;
    width = v13;
    height = v14;

  }
  v15 = x;
  v16 = y;
  v17 = width;
  v18 = height;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)setAppearanceProvider:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_appearanceProvider, a3);
  v5 = a3;
  -[WFCompactPlatterSashView setAppearanceProvider:](self->_sashView, "setAppearanceProvider:", v5);

  -[WFCompactTitledPlatterView layoutSubviews](self, "layoutSubviews");
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[WFCompactTitledPlatterView sashView](self, "sashView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WFCompactTitledPlatterView configureSashViewIfNecessary](self, "configureSashViewIfNecessary");
  v6 = (id)objc_msgSend(v4, "copy");

  -[WFCompactTitledPlatterView sashView](self, "sashView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v6);

}

- (WFIcon)icon
{
  void *v2;
  void *v3;

  -[WFCompactTitledPlatterView sashView](self, "sashView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFIcon *)v3;
}

- (void)setIcon:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFCompactTitledPlatterView configureSashViewIfNecessary](self, "configureSashViewIfNecessary");
  -[WFCompactTitledPlatterView sashView](self, "sashView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIcon:", v4);

}

- (BOOL)sashVisible
{
  return self->_sashVisible;
}

- (WFCompactTitledPlatterViewDelegate)delegate
{
  return (WFCompactTitledPlatterViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WFCompactAppearanceProvider)appearanceProvider
{
  return self->_appearanceProvider;
}

- (WFCompactPlatterSashView)sashView
{
  return self->_sashView;
}

- (void)setSashView:(id)a3
{
  objc_storeStrong((id *)&self->_sashView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sashView, 0);
  objc_storeStrong((id *)&self->_appearanceProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
