@implementation PKDashboardContentHostCollectionViewCell

- (PKDashboardContentHostCollectionViewCell)initWithFrame:(CGRect)a3
{
  PKDashboardContentHostCollectionViewCell *v3;
  PKDashboardContentHostCollectionViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKDashboardContentHostCollectionViewCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PKDashboardCollectionViewCell setWantsCustomAppearance:](v3, "setWantsCustomAppearance:", 1);
  return v4;
}

- (void)setHostedContentInset:(UIEdgeInsets)a3
{
  if (self->_hostedContentInset.left != a3.left
    || self->_hostedContentInset.top != a3.top
    || self->_hostedContentInset.right != a3.right
    || self->_hostedContentInset.bottom != a3.bottom)
  {
    self->_hostedContentInset = a3;
    -[PKDashboardContentHostCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setHostedContentView:(id)a3
{
  UIView *v4;
  UIView *hostedContentView;
  UIView *v6;
  UIView *v7;
  void *v8;

  v4 = (UIView *)a3;
  hostedContentView = self->_hostedContentView;
  if (hostedContentView)
  {
    -[UIView removeFromSuperview](hostedContentView, "removeFromSuperview");
    v6 = self->_hostedContentView;
  }
  else
  {
    v6 = 0;
  }
  self->_hostedContentView = v4;
  v7 = v4;

  -[PKDashboardContentHostCollectionViewCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v7);

  -[PKDashboardContentHostCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKDashboardContentHostCollectionViewCell;
  -[PKDashboardCollectionViewCell layoutSubviews](&v7, sel_layoutSubviews);
  if (self->_hostedContentView)
  {
    -[PKDashboardContentHostCollectionViewCell bounds](self, "bounds");
    -[UIView setFrame:](self->_hostedContentView, "setFrame:", v3 + self->_hostedContentInset.left, v4 + self->_hostedContentInset.top, v5 - (self->_hostedContentInset.left + self->_hostedContentInset.right), v6 - (self->_hostedContentInset.top + self->_hostedContentInset.bottom));
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UIView sizeThatFits:](self->_hostedContentView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKDashboardContentHostCollectionViewCell;
  -[PKDashboardCollectionViewCell prepareForReuse](&v3, sel_prepareForReuse);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIView performSelector:](self->_hostedContentView, "performSelector:", sel_prepareForReuse);
}

- (UIEdgeInsets)hostedContentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_hostedContentInset.top;
  left = self->_hostedContentInset.left;
  bottom = self->_hostedContentInset.bottom;
  right = self->_hostedContentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIView)hostedContentView
{
  return self->_hostedContentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostedContentView, 0);
}

@end
