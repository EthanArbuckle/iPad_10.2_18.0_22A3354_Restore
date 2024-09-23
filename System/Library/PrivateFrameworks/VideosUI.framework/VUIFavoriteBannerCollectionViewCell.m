@implementation VUIFavoriteBannerCollectionViewCell

- (VUIFavoriteBannerCollectionViewCell)initWithFrame:(CGRect)a3
{
  VUIFavoriteBannerCollectionViewCell *v3;
  VUIFavoriteBannerCollectionViewCell *v4;
  VUIFavoriteBannerView *bannerView;
  VUIFavoriteBannerLayout *bannerLayout;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VUIFavoriteBannerCollectionViewCell;
  v3 = -[VUIFocusableCollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    bannerView = v3->_bannerView;
    v3->_bannerView = 0;

    bannerLayout = v4->_bannerLayout;
    v4->_bannerLayout = 0;

    -[VUIFavoriteBannerCollectionViewCell setAutoresizingMask:](v4, "setAutoresizingMask:", 1);
    -[VUIFocusableCollectionViewCell setAllowsFocus:](v4, "setAllowsFocus:", 1);
  }
  return v4;
}

- (void)setBannerView:(id)a3
{
  VUIFavoriteBannerView *v5;
  VUIFavoriteBannerView **p_bannerView;
  VUIFavoriteBannerView *bannerView;
  VUIFavoriteBannerView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  VUIFavoriteBannerView *v16;

  v5 = (VUIFavoriteBannerView *)a3;
  p_bannerView = &self->_bannerView;
  bannerView = self->_bannerView;
  if (bannerView != v5)
  {
    v16 = v5;
    -[VUIFavoriteBannerView removeFromSuperview](bannerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_bannerView, a3);
    -[VUIFavoriteBannerView setContentMode:](*p_bannerView, "setContentMode:", 3);
    -[VUIFavoriteBannerView setAutoresizingMask:](*p_bannerView, "setAutoresizingMask:", 18);
    v8 = *p_bannerView;
    -[VUIFavoriteBannerLayout backgroundColor](self->_bannerLayout, "backgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIFavoriteBannerView setBackgroundColor:](v8, "setBackgroundColor:", v9);

    -[VUIFavoriteBannerCollectionViewCell contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", *p_bannerView);

    -[VUIFavoriteBannerCollectionViewCell contentView](self, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0DC69B0];
    -[VUIFavoriteBannerLayout borderRadii](self->_bannerLayout, "borderRadii");
    objc_msgSend(v13, "radiusFromCornerRadii:");
    objc_msgSend(v12, "setCornerRadius:");

    -[VUIFavoriteBannerCollectionViewCell contentView](self, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setMasksToBounds:", 1);

    -[VUIFavoriteBannerCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v16;
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
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VUIFavoriteBannerCollectionViewCell;
  -[VUIFavoriteBannerCollectionViewCell layoutSubviews](&v11, sel_layoutSubviews);
  -[VUIFavoriteBannerCollectionViewCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[VUIFavoriteBannerView setFrame:](self->_bannerView, "setFrame:");
  -[VUIFavoriteBannerView setFrame:](self->_bannerView, "setFrame:", v4, v6, v8, v10);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[VUIFavoriteBannerCollectionViewCell sizeThatFits:](self, "sizeThatFits:", self->_width, 0.0);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  if (a3.width <= 0.0)
    a3.width = self->_width;
  -[VUIFavoriteBannerView sizeThatFits:](self->_bannerView, "sizeThatFits:", a3.width, 0.0);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
  -[VUIFavoriteBannerCollectionViewCell invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[VUIFavoriteBannerView setHighlighted:](self->_bannerView, "setHighlighted:", v3);
}

- (void)prepareForReuse
{
  VUIFavoriteBannerLayout *bannerLayout;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUIFavoriteBannerCollectionViewCell;
  -[VUIFocusableCollectionViewCell prepareForReuse](&v4, sel_prepareForReuse);
  bannerLayout = self->_bannerLayout;
  self->_bannerLayout = 0;

  -[VUIFavoriteBannerView prepareForCellReuse](self->_bannerView, "prepareForCellReuse");
}

- (VUIFavoriteBannerView)bannerView
{
  return self->_bannerView;
}

- (VUIFavoriteBannerLayout)bannerLayout
{
  return self->_bannerLayout;
}

- (void)setBannerLayout:(id)a3
{
  objc_storeStrong((id *)&self->_bannerLayout, a3);
}

- (double)width
{
  return self->_width;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerLayout, 0);
  objc_storeStrong((id *)&self->_bannerView, 0);
}

@end
