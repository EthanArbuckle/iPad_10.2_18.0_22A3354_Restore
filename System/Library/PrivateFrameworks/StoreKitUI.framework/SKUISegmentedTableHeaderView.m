@implementation SKUISegmentedTableHeaderView

- (SKUISegmentedTableHeaderView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUISegmentedTableHeaderView *v8;
  uint64_t v9;
  _UIBackdropView *backdropView;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUISegmentedTableHeaderView initWithFrame:].cold.1();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUISegmentedTableHeaderView;
  v8 = -[SKUISegmentedTableHeaderView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC4028]), "initWithPrivateStyle:", 2010);
    backdropView = v8->_backdropView;
    v8->_backdropView = (_UIBackdropView *)v9;

    -[SKUISegmentedTableHeaderView addSubview:](v8, "addSubview:", v8->_backdropView);
  }
  return v8;
}

- (BOOL)hidesBorderView
{
  return -[UIView isHidden](self->_borderView, "isHidden");
}

- (void)setHidesBorderView:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SKUISegmentedTableHeaderView _borderView](self, "_borderView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (void)setSegmentedControl:(id)a3
{
  UIView *v5;
  UIView *segmentedControl;
  UIView *v7;

  v5 = (UIView *)a3;
  segmentedControl = self->_segmentedControl;
  v7 = v5;
  if (segmentedControl != v5)
  {
    -[UIView removeFromSuperview](segmentedControl, "removeFromSuperview");
    objc_storeStrong((id *)&self->_segmentedControl, a3);
    if (self->_segmentedControl)
      -[SKUISegmentedTableHeaderView addSubview:](self, "addSubview:");
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIView *segmentedControl;
  double v8;
  float v9;
  void *v10;
  double v11;
  double v12;
  id v13;

  -[SKUISegmentedTableHeaderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[_UIBackdropView setFrame:](self->_backdropView, "setFrame:");
  segmentedControl = self->_segmentedControl;
  if (segmentedControl)
  {
    -[UIView frame](segmentedControl, "frame");
    v9 = (v6 - v8) * 0.5;
    -[UIView setFrame:](self->_segmentedControl, "setFrame:", 15.0, floorf(v9), v4 + -15.0 + -15.0);
  }
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scale");
  v12 = 1.0 / v11;

  -[SKUISegmentedTableHeaderView _borderView](self, "_borderView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", 0.0, v6 - v12, v4, v12);

}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = 44.0;
  result.height = v3;
  return result;
}

- (id)_borderView
{
  UIView *borderView;
  UIView *v4;
  UIView *v5;
  UIView *v6;
  void *v7;

  borderView = self->_borderView;
  if (!borderView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v5 = self->_borderView;
    self->_borderView = v4;

    v6 = self->_borderView;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[SKUISegmentedTableHeaderView addSubview:](self, "addSubview:", self->_borderView);
    borderView = self->_borderView;
  }
  return borderView;
}

- (UIView)segmentedControl
{
  return self->_segmentedControl;
}

- (_UIBackdropView)backdropView
{
  return self->_backdropView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUISegmentedTableHeaderView initWithFrame:]";
}

@end
