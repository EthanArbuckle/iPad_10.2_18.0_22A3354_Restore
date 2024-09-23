@implementation WGWidgetWrapperView

- (WGWidgetWrapperView)initWithPlatterView:(id)a3
{
  id v5;
  WGWidgetWrapperView *v6;
  UIView *v7;
  UIView *contentView;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WGWidgetWrapperView;
  v6 = -[WGWidgetWrapperView init](&v11, sel_init);
  if (v6)
  {
    v7 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
    contentView = v6->_contentView;
    v6->_contentView = v7;

    -[UIView setClipsToBounds:](v6->_contentView, "setClipsToBounds:", 0);
    -[UIView setAutoresizingMask:](v6->_contentView, "setAutoresizingMask:", 18);
    -[UIView layer](v6->_contentView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAllowsGroupOpacity:", 1);

    -[WGWidgetWrapperView addSubview:](v6, "addSubview:", v6->_contentView);
    objc_storeStrong((id *)&v6->_platterView, a3);
    -[UIView addSubview:](v6->_contentView, "addSubview:", v6->_platterView);
    v6->_overrideIntrinsicContentHeight = -1.0;
  }

  return v6;
}

- (void)layoutSubviews
{
  WGWidgetPlatterView *platterView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WGWidgetWrapperView;
  -[WGWidgetWrapperView layoutSubviews](&v4, sel_layoutSubviews);
  platterView = self->_platterView;
  -[UIView bounds](self->_contentView, "bounds");
  -[WGWidgetPlatterView setFrame:](platterView, "setFrame:");
  -[WGWidgetPlatterView setTopMarginForLayout:](self->_platterView, "setTopMarginForLayout:", self->_topMarginForLayout);
}

- (void)setTopMarginForLayout:(double)a3
{
  if (vabdd_f64(self->_topMarginForLayout, a3) >= 2.22044605e-16)
  {
    self->_topMarginForLayout = a3;
    -[WGWidgetWrapperView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setOverrideIntrinsicContentHeight:(double)a3
{
  if (vabdd_f64(self->_overrideIntrinsicContentHeight, a3) >= 2.22044605e-16)
  {
    self->_overrideIntrinsicContentHeight = a3;
    -[WGWidgetWrapperView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (CGSize)intrinsicContentSize
{
  double Width;
  double overrideIntrinsicContentHeight;
  WGWidgetPlatterView *platterView;
  CGSize result;
  CGRect v7;
  CGRect v8;

  if (self->_overrideIntrinsicContentHeight <= 0.0)
  {
    platterView = self->_platterView;
    -[WGWidgetWrapperView bounds](self, "bounds");
    -[WGWidgetPlatterView sizeThatFits:](platterView, "sizeThatFits:", CGRectGetWidth(v8), 1.79769313e308);
  }
  else
  {
    -[WGWidgetWrapperView bounds](self, "bounds");
    Width = CGRectGetWidth(v7);
    overrideIntrinsicContentHeight = self->_overrideIntrinsicContentHeight;
  }
  result.height = overrideIntrinsicContentHeight;
  result.width = Width;
  return result;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (WGWidgetPlatterView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_platterView, a3);
}

- (double)overrideIntrinsicContentHeight
{
  return self->_overrideIntrinsicContentHeight;
}

- (double)topMarginForLayout
{
  return self->_topMarginForLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
