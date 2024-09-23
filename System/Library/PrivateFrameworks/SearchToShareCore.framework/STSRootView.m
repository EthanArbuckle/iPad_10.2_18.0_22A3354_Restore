@implementation STSRootView

- (STSRootView)initWithFrame:(CGRect)a3
{
  STSRootView *v3;
  STSRootView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STSRootView;
  v3 = -[STSRootView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[STSRootView _setupView](v3, "_setupView");
  return v4;
}

- (void)awakeFromNib
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STSRootView;
  -[STSRootView awakeFromNib](&v3, sel_awakeFromNib);
  -[STSRootView _setupView](self, "_setupView");
}

- (void)_setupView
{
  id v3;

  -[STSRootView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "sts_defaultBackgroundColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[STSRootView setBackgroundColor:](self, "setBackgroundColor:", v3);

}

- (void)setContentView:(id)a3
{
  UIView *v5;
  UIView **p_contentView;
  UIView *contentView;
  void *v8;
  char v9;
  UIView *v10;

  v5 = (UIView *)a3;
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    v10 = v5;
    -[UIView removeFromSuperview](contentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentView, a3);
    -[UIView superview](*p_contentView, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", self);

    if ((v9 & 1) == 0)
      -[STSRootView addSubview:](self, "addSubview:", *p_contentView);
    -[STSRootView setNeedsLayout](self, "setNeedsLayout");
    v5 = v10;
  }

}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentInsets.left
    || a3.top != self->_contentInsets.top
    || a3.right != self->_contentInsets.right
    || a3.bottom != self->_contentInsets.bottom)
  {
    self->_contentInsets = a3;
    -[STSRootView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
}

@end
