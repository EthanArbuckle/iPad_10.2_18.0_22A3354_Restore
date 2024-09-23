@implementation SKUIScreenshotsView

- (SKUIScreenshotsView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIScreenshotsView *v8;
  UIView *v9;
  UIView *separatorView;
  UIView *v11;
  void *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIScreenshotsView initWithFrame:].cold.1();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIScreenshotsView;
  v8 = -[SKUIScreenshotsView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    separatorView = v8->_separatorView;
    v8->_separatorView = v9;

    v11 = v8->_separatorView;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v11, "setBackgroundColor:", v12);

    -[SKUIScreenshotsView addSubview:](v8, "addSubview:", v8->_separatorView);
  }
  return v8;
}

- (void)setPrimaryView:(id)a3
{
  UIView *v5;
  UIView *primaryView;
  UIView *v7;

  v5 = (UIView *)a3;
  primaryView = self->_primaryView;
  if (primaryView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](primaryView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_primaryView, a3);
    -[SKUIScreenshotsView addSubview:](self, "addSubview:", self->_primaryView);
    -[SKUIScreenshotsView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIView *primaryView;
  UIView *separatorView;
  double v9;
  double v10;
  void *v11;
  double v12;
  id v13;

  -[SKUIScreenshotsView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  primaryView = self->_primaryView;
  if (primaryView)
    -[UIView setFrame:](primaryView, "setFrame:");
  if (self->_separatorView)
  {
    -[SKUIScreenshotsView bringSubviewToFront:](self, "bringSubviewToFront:");
    separatorView = self->_separatorView;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scale");
    v10 = v6 - 1.0 / v9;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scale");
    -[UIView setFrame:](separatorView, "setFrame:", 15.0, v10, v4 + -15.0, 1.0 / v12);

  }
}

- (UIView)primaryView
{
  return self->_primaryView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_primaryView, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIScreenshotsView initWithFrame:]";
}

@end
