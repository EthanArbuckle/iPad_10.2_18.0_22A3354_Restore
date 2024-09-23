@implementation MTSeparatorFooterView

+ (double)heightForSeparatorInsets:(UIEdgeInsets)a3
{
  double bottom;
  double top;
  void *v5;
  double v6;
  double v7;

  bottom = a3.bottom;
  top = a3.top;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen", a3.top, a3.left, a3.bottom, a3.right));
  objc_msgSend(v5, "scale");
  v7 = v6;

  return bottom + top + 1.0 / v7;
}

- (MTSeparatorFooterView)initWithReuseIdentifier:(id)a3
{
  MTSeparatorFooterView *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTSeparatorFooterView;
  v3 = -[MTSeparatorFooterView initWithReuseIdentifier:](&v8, "initWithReuseIdentifier:", a3);
  if (v3)
  {
    v4 = objc_alloc_init((Class)UIView);
    -[MTSeparatorFooterView setBackgroundView:](v3, "setBackgroundView:", v4);

    -[MTSeparatorFooterView setPreservesSuperviewLayoutMargins:](v3, "setPreservesSuperviewLayoutMargins:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTSeparatorFooterView contentView](v3, "contentView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSeparatorFooterView dividerView](v3, "dividerView"));
    objc_msgSend(v5, "addSubview:", v6);

  }
  return v3;
}

- (void)setSeparatorInsets:(UIEdgeInsets)a3
{
  if (self->_separatorInsets.left != a3.left
    || self->_separatorInsets.top != a3.top
    || self->_separatorInsets.right != a3.right
    || self->_separatorInsets.bottom != a3.bottom)
  {
    self->_separatorInsets = a3;
    -[MTSeparatorFooterView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  objc_super v14;
  CGRect v15;

  v14.receiver = self;
  v14.super_class = (Class)MTSeparatorFooterView;
  -[MTSeparatorFooterView layoutSubviews](&v14, "layoutSubviews");
  -[MTSeparatorFooterView separatorInsets](self, "separatorInsets");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v5, "scale");
  v7 = v6;

  v8 = 1.0 / v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTSeparatorFooterView contentView](self, "contentView"));
  objc_msgSend(v9, "bounds");
  v10 = CGRectGetWidth(v15) - v4;

  if (-[MTSeparatorFooterView mt_isRTL](self, "mt_isRTL"))
    v4 = 0.0;
  -[MTSeparatorFooterView separatorInsets](self, "separatorInsets");
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTSeparatorFooterView dividerView](self, "dividerView"));
  objc_msgSend(v13, "setFrame:", v4, v12, v10, v8);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  void *v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  width = a3.width;
  v5 = (void *)objc_opt_class(self);
  -[MTSeparatorFooterView separatorInsets](self, "separatorInsets");
  objc_msgSend(v5, "heightForSeparatorInsets:");
  v7 = v6;
  v8 = width;
  result.height = v7;
  result.width = v8;
  return result;
}

- (UIView)dividerView
{
  UIView *dividerView;
  UIView *v4;
  UIView *v5;
  void *v6;

  dividerView = self->_dividerView;
  if (!dividerView)
  {
    v4 = (UIView *)objc_alloc_init((Class)UIView);
    v5 = self->_dividerView;
    self->_dividerView = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dividerColor](UIColor, "dividerColor"));
    -[UIView setBackgroundColor:](self->_dividerView, "setBackgroundColor:", v6);

    dividerView = self->_dividerView;
  }
  return dividerView;
}

- (UIEdgeInsets)separatorInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_separatorInsets.top;
  left = self->_separatorInsets.left;
  bottom = self->_separatorInsets.bottom;
  right = self->_separatorInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CGRect)floatingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_floatingRect.origin.x;
  y = self->_floatingRect.origin.y;
  width = self->_floatingRect.size.width;
  height = self->_floatingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFloatingRect:(CGRect)a3
{
  self->_floatingRect = a3;
}

- (void)setDividerView:(id)a3
{
  objc_storeStrong((id *)&self->_dividerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dividerView, 0);
}

@end
