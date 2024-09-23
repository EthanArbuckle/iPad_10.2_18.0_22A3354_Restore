@implementation SiriUIVisualEffectView

- (void)setCustomView:(id)a3
{
  UIView *v4;
  UIView *customView;
  UIView *v6;
  UIView *v7;
  void *v8;
  objc_super v9;

  v4 = (UIView *)a3;
  customView = self->_customView;
  if (customView)
    -[UIView removeFromSuperview](customView, "removeFromSuperview");
  v6 = self->_customView;
  self->_customView = v4;
  v7 = v4;

  v9.receiver = self;
  v9.super_class = (Class)SiriUIVisualEffectView;
  -[SiriUIVisualEffectView contentView](&v9, sel_contentView);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v7);

  -[SiriUIVisualEffectView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)layoutSubviews
{
  UIView *customView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SiriUIVisualEffectView;
  -[SiriUIVisualEffectView layoutSubviews](&v4, sel_layoutSubviews);
  customView = self->_customView;
  -[SiriUIVisualEffectView bounds](self, "bounds");
  -[UIView setFrame:](customView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UIView sizeThatFits:](self->_customView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[UIView intrinsicContentSize](self->_customView, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UIView systemLayoutSizeFittingSize:](self->_customView, "systemLayoutSizeFittingSize:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (UIView)customView
{
  return self->_customView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customView, 0);
}

@end
