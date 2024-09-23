@implementation SKUIFloatingOverlayView

- (SKUIFloatingOverlayView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIFloatingOverlayView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIFloatingOverlayView initWithFrame:].cold.1();
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIFloatingOverlayView;
  v8 = -[SKUIFloatingOverlayView initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIFloatingOverlayView setBackgroundColor:](v8, "setBackgroundColor:", v9);

    -[SKUIFloatingOverlayView setClipsToBounds:](v8, "setClipsToBounds:", 1);
    -[SKUIFloatingOverlayView layer](v8, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCornerRadius:", 10.0);

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4028]), "initWithPrivateStyle:", 2020);
    objc_msgSend(v11, "inputSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "colorWithAlphaComponent:", 0.6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setColorTint:", v14);

    objc_msgSend(v11, "setAutoresizingMask:", 18);
    -[SKUIFloatingOverlayView bounds](v8, "bounds");
    objc_msgSend(v11, "setFrame:");
    -[SKUIFloatingOverlayView addSubview:](v8, "addSubview:", v11);

  }
  return v8;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    -[SKUIFloatingOverlayView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setContentView:(id)a3
{
  UIView *v5;
  UIView **p_contentView;
  UIView *contentView;
  UIView *v8;
  void *v9;
  UIView *v10;

  v5 = (UIView *)a3;
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  v10 = v5;
  if (contentView != v5)
  {
    -[UIView removeFromSuperview](contentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentView, a3);
    v8 = *p_contentView;
    if (*p_contentView)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v8, "setBackgroundColor:", v9);

      -[SKUIFloatingOverlayView addSubview:](self, "addSubview:", *p_contentView);
    }
  }

}

- (void)layoutSubviews
{
  UIView *contentView;
  double v4;
  double v5;
  double v6;
  double v7;

  contentView = self->_contentView;
  -[SKUIFloatingOverlayView bounds](self, "bounds");
  -[UIView setFrame:](contentView, "setFrame:", v4 + self->_contentInset.left, v5 + self->_contentInset.top, v6 - (self->_contentInset.left + self->_contentInset.right), v7 - (self->_contentInset.top + self->_contentInset.bottom));
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v5;
  double v6;
  double v7;
  CGSize result;

  width = a3.width;
  -[UIView sizeThatFits:](self->_contentView, "sizeThatFits:", a3.width, a3.height);
  v6 = v5 + self->_contentInset.top + self->_contentInset.bottom;
  v7 = width;
  result.height = v6;
  result.width = v7;
  return result;
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIFloatingOverlayView initWithFrame:]";
}

@end
