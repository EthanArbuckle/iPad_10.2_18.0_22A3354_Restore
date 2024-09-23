@implementation SKUIScrollingTabBarPalette

- (SKUIScrollingTabBarPalette)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIScrollingTabBarPalette *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  SKUIScrollingTabBarBackgroundView *v17;
  SKUIScrollingTabBarBackgroundView *backgroundView;
  uint64_t v19;
  UIView *contentView;
  objc_super v22;
  CGRect v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIScrollingTabBarPalette initWithFrame:].cold.1();
  }
  v22.receiver = self;
  v22.super_class = (Class)SKUIScrollingTabBarPalette;
  v8 = -[SKUIScrollingTabBarPalette initWithFrame:](&v22, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    v8->_paletteHeight = CGRectGetHeight(v23);
    -[SKUIScrollingTabBarPalette bounds](v8, "bounds");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v17 = -[SKUIScrollingTabBarBackgroundView initWithFrame:]([SKUIScrollingTabBarBackgroundView alloc], "initWithFrame:", v9, v11, v13, v15);
    backgroundView = v8->_backgroundView;
    v8->_backgroundView = v17;

    -[SKUIScrollingTabBarPalette addSubview:](v8, "addSubview:", v8->_backgroundView);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v10, v12, v14, v16);
    contentView = v8->_contentView;
    v8->_contentView = (UIView *)v19;

    -[SKUIScrollingTabBarPalette addSubview:](v8, "addSubview:", v8->_contentView);
    v8->_tabBarBackgroundExtendsBehindPalette = 1;
  }
  return v8;
}

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
  double v12;
  double v13;
  void *v14;
  double v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SKUIScrollingTabBarPalette;
  -[SKUIScrollingTabBarPalette layoutSubviews](&v16, sel_layoutSubviews);
  -[SKUIScrollingTabBarPalette bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SKUIScrollingTabBarPalette traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");
  v13 = v12;

  if (v13 < 0.00000011920929)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scale");
    v13 = v15;

  }
  -[SKUIScrollingTabBarBackgroundView setFrame:](self->_backgroundView, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_contentView, "setFrame:", v4, v6, v8, v10 + -1.0 / v13);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SKUIScrollingTabBarPalette;
  v4 = a3;
  -[SKUIScrollingTabBarPalette traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  objc_msgSend(v4, "displayScale", v10.receiver, v10.super_class);
  v6 = v5;

  -[SKUIScrollingTabBarPalette traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayScale");
  v9 = vabdd_f64(v6, v8);

  if (v9 > 0.00000011920929)
    -[SKUIScrollingTabBarPalette setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTabBarBackgroundExtendsBehindPalette:(BOOL)a3
{
  id WeakRetained;

  if (self->_tabBarBackgroundExtendsBehindPalette != a3)
  {
    self->_tabBarBackgroundExtendsBehindPalette = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "tabBarBackgroundExtendsBehindPaletteDidChangeForPalette:", self);

  }
}

- (BOOL)isAttached
{
  return self->_attached;
}

- (void)_setAttached:(BOOL)a3
{
  self->_attached = a3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (double)paletteHeight
{
  return self->_paletteHeight;
}

- (BOOL)tabBarBackgroundExtendsBehindPalette
{
  return self->_tabBarBackgroundExtendsBehindPalette;
}

- (SKUIScrollingTabBarPaletteDelegate)_delegate
{
  return (SKUIScrollingTabBarPaletteDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)_setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SKUIScrollingTabBarBackgroundView)_backgroundView
{
  return self->_backgroundView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentView, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIScrollingTabBarPalette initWithFrame:]";
}

@end
