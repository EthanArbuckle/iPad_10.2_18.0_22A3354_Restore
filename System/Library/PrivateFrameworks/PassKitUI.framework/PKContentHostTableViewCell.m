@implementation PKContentHostTableViewCell

- (PKContentHostTableViewCell)initWithFrame:(CGRect)a3
{
  PKContentHostTableViewCell *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKContentHostTableViewCell;
  v3 = -[PKContentHostTableViewCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKContentHostTableViewCell setBackgroundColor:](v3, "setBackgroundColor:", v4);

  }
  return v3;
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

  -[PKContentHostTableViewCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v7);

  -[PKContentHostTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  UIView *hostedContentView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKContentHostTableViewCell;
  -[PKContentHostTableViewCell layoutSubviews](&v4, sel_layoutSubviews);
  hostedContentView = self->_hostedContentView;
  if (hostedContentView)
  {
    -[PKContentHostTableViewCell bounds](self, "bounds");
    -[UIView setFrame:](hostedContentView, "setFrame:");
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

- (UIView)hostedContentView
{
  return self->_hostedContentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostedContentView, 0);
}

@end
