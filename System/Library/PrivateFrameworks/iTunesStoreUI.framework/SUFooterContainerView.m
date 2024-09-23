@implementation SUFooterContainerView

- (void)setContentView:(id)a3
{
  UIView *v5;
  UIView *contentView;
  UIView *v7;

  v5 = (UIView *)a3;
  contentView = self->_contentView;
  v7 = v5;
  if (contentView != v5)
  {
    -[UIView removeFromSuperview](contentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentView, a3);
    if (self->_contentView)
      -[SUFooterContainerView addSubview:](self, "addSubview:");
  }

}

- (void)setFooterView:(id)a3
{
  UIView *v5;
  UIView *footerView;
  UIView *v7;

  v5 = (UIView *)a3;
  footerView = self->_footerView;
  v7 = v5;
  if (footerView != v5)
  {
    -[UIView removeFromSuperview](footerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_footerView, a3);
    if (self->_footerView)
      -[SUFooterContainerView addSubview:](self, "addSubview:");
  }

}

- (void)setFooterVisible:(BOOL)a3
{
  if (self->_footerVisible != a3)
  {
    self->_footerVisible = a3;
    -[SUFooterContainerView layoutSubviews](self, "layoutSubviews");
  }
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
  double MinY;
  UIView *footerView;
  double v12;
  double v13;
  _BOOL4 footerVisible;
  double MaxY;
  double v16;
  CGFloat v17;
  UIView *contentView;
  CGRect v19;
  CGRect v20;

  -[SUFooterContainerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  MinY = v9;
  footerView = self->_footerView;
  if (footerView)
  {
    -[UIView frame](footerView, "frame");
    v13 = v12;
    footerVisible = self->_footerVisible;
    v19.origin.x = v4;
    v19.origin.y = v6;
    v19.size.width = v8;
    v19.size.height = MinY;
    MaxY = CGRectGetMaxY(v19);
    v16 = 0.0;
    if (footerVisible)
      v16 = v13;
    v17 = MaxY - v16;
    -[UIView setFrame:](self->_footerView, "setFrame:", 0.0, MaxY - v16, v8, v13);
    v20.origin.x = 0.0;
    v20.origin.y = v17;
    v20.size.width = v8;
    v20.size.height = v13;
    MinY = CGRectGetMinY(v20);
  }
  contentView = self->_contentView;
  if (contentView)
    -[UIView setFrame:](contentView, "setFrame:", v4, v6, v8, MinY);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIView)footerView
{
  return self->_footerView;
}

- (BOOL)isFooterVisible
{
  return self->_footerVisible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
