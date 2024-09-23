@implementation SKUIScrollingSegmentedControllerNavigationBarTitleView

- (SKUIScrollingSegmentedControllerNavigationBarTitleView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIScrollingSegmentedControllerNavigationBarTitleView *v8;
  SKUIScrollingSegmentedControllerNavigationBarTitleView *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIScrollingSegmentedControllerNavigationBarTitleView initWithFrame:].cold.1();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIScrollingSegmentedControllerNavigationBarTitleView;
  v8 = -[SKUIScrollingSegmentedControllerNavigationBarTitleView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    v8->_segmentedControlMinimumHeight = 29.0;
    objc_msgSend((id)objc_opt_class(), "defaultLayoutMargins");
    -[SKUIScrollingSegmentedControllerNavigationBarTitleView setLayoutMargins:](v9, "setLayoutMargins:");
  }
  return v9;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
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
  double v25;
  double v26;
  double v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)SKUIScrollingSegmentedControllerNavigationBarTitleView;
  -[SKUIScrollingSegmentedControllerNavigationBarTitleView layoutSubviews](&v28, sel_layoutSubviews);
  if (self->_segmentedControl)
  {
    -[SKUIScrollingSegmentedControllerNavigationBarTitleView traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayScale");
    v5 = v4;

    if (v5 <= 0.00000011920929)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "scale");
      v5 = v7;

    }
    -[SKUIScrollingSegmentedControllerNavigationBarTitleView bounds](self, "bounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[SKUIScrollingSegmentedControllerNavigationBarTitleView layoutMargins](self, "layoutMargins");
    v17 = v16;
    v19 = v9 + v18;
    v21 = v11 + v20;
    v23 = v13 - (v18 + v22);
    v24 = v15 - (v20 + v17);
    if (self->_layoutStyle != 1)
    {
      -[SKUIInteractiveSegmentedControl sizeThatFits:](self->_segmentedControl, "sizeThatFits:", v23, v24);
      v27 = v5;
      UIRectCenteredXInRectScale();
      v19 = v25;
      v21 = v26;
    }
    -[SKUIInteractiveSegmentedControl setFrame:](self->_segmentedControl, "setFrame:", v19, v21, v23, v24, *(_QWORD *)&v27);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
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
  CGSize result;

  -[SKUIInteractiveSegmentedControl sizeThatFits:](self->_segmentedControl, "sizeThatFits:", 1.79769313e308, self->_segmentedControlMinimumHeight);
  v5 = v4;
  v7 = v6;
  -[SKUIScrollingSegmentedControllerNavigationBarTitleView layoutMargins](self, "layoutMargins");
  v10 = v5 + v8 + v9;
  v13 = v7 + v11 + v12;
  v14 = v10;
  result.height = v13;
  result.width = v14;
  return result;
}

+ (UIEdgeInsets)defaultLayoutMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 4.0;
  v3 = 8.0;
  v4 = 4.0;
  v5 = 8.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setSegmentedControl:(id)a3
{
  SKUIInteractiveSegmentedControl *v5;
  SKUIInteractiveSegmentedControl **p_segmentedControl;
  SKUIInteractiveSegmentedControl *segmentedControl;
  SKUIScrollingSegmentedControllerNavigationBarTitleView *v8;
  SKUIInteractiveSegmentedControl *v9;

  v5 = (SKUIInteractiveSegmentedControl *)a3;
  p_segmentedControl = &self->_segmentedControl;
  segmentedControl = self->_segmentedControl;
  if (segmentedControl != v5)
  {
    v9 = v5;
    -[SKUIInteractiveSegmentedControl superview](segmentedControl, "superview");
    v8 = (SKUIScrollingSegmentedControllerNavigationBarTitleView *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
      -[SKUIInteractiveSegmentedControl removeFromSuperview](*p_segmentedControl, "removeFromSuperview");
    objc_storeStrong((id *)&self->_segmentedControl, a3);
    -[SKUIScrollingSegmentedControllerNavigationBarTitleView addSubview:](self, "addSubview:", *p_segmentedControl);
    v5 = v9;
  }

}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    -[SKUIScrollingSegmentedControllerNavigationBarTitleView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (SKUIInteractiveSegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (double)segmentedControlMinimumHeight
{
  return self->_segmentedControlMinimumHeight;
}

- (void)setSegmentedControlMinimumHeight:(double)a3
{
  self->_segmentedControlMinimumHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentedControl, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIScrollingSegmentedControllerNavigationBarTitleView initWithFrame:]";
}

@end
