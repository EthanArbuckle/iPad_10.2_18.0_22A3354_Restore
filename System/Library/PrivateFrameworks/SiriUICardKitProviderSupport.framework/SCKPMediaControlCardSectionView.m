@implementation SCKPMediaControlCardSectionView

- (void)layoutSubviews
{
  -[SCKPMediaControlCardSectionView bounds](self, "bounds");
  -[UIView setFrame:](self->_contentView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UIView sizeThatFits:](self->_contentView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setContentView:(id)a3
{
  UIView *v5;
  UIView *contentView;
  UIView *v7;

  v5 = (UIView *)a3;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    v7 = v5;
    if (contentView)
      -[UIView removeFromSuperview](contentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentView, a3);
    if (self->_contentView)
      -[SCKPMediaControlCardSectionView addSubview:](self, "addSubview:", v7);
    -[SCKPMediaControlCardSectionView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
