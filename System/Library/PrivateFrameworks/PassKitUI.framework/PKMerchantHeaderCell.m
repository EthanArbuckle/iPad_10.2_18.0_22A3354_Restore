@implementation PKMerchantHeaderCell

- (PKMerchantHeaderCell)initWithFrame:(CGRect)a3
{
  PKMerchantHeaderCell *v3;
  PKMerchantHeaderCell *v4;
  void *v5;
  PKSplashImageHeaderView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  PKSplashImageHeaderView *headerView;
  uint64_t v13;
  UIVisualEffectView *overlayEffectView;
  uint64_t v15;
  UIView *shadowView;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PKMerchantHeaderCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PKMerchantHeaderCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = [PKSplashImageHeaderView alloc];
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v11 = -[PKSplashImageHeaderView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E0C9D648], v8, v9, v10);
    headerView = v4->_headerView;
    v4->_headerView = (PKSplashImageHeaderView *)v11;

    objc_msgSend(v5, "addSubview:", v4->_headerView);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithFrame:", v7, v8, v9, v10);
    overlayEffectView = v4->_overlayEffectView;
    v4->_overlayEffectView = (UIVisualEffectView *)v13;

    -[UIVisualEffectView setHidden:](v4->_overlayEffectView, "setHidden:", 1);
    -[UIVisualEffectView setAlpha:](v4->_overlayEffectView, "setAlpha:", 0.0);
    objc_msgSend(v5, "addSubview:", v4->_overlayEffectView);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v7, v8, v9, v10);
    shadowView = v4->_shadowView;
    v4->_shadowView = (UIView *)v15;

    -[UIView setHidden:](v4->_shadowView, "setHidden:", 1);
    -[UIView setAlpha:](v4->_shadowView, "setAlpha:", 0.0);
    objc_msgSend(v5, "addSubview:", v4->_shadowView);
    -[PKDashboardCollectionViewCell setWantsCustomAppearance:](v4, "setWantsCustomAppearance:", 1);
    -[PKMerchantHeaderCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67C48]);

  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKSplashImageHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect v13;
  CGRect slice;
  objc_super v15;
  CGRect v16;

  v15.receiver = self;
  v15.super_class = (Class)PKMerchantHeaderCell;
  -[PKDashboardCollectionViewCell layoutSubviews](&v15, sel_layoutSubviews);
  -[PKMerchantHeaderCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[PKSplashImageHeaderView setFrame:](self->_headerView, "setFrame:", v5, v7, v9, v11);
  v12 = PKUIPixelLength();
  memset(&slice, 0, sizeof(slice));
  memset(&v13, 0, sizeof(v13));
  v16.origin.x = v5;
  v16.origin.y = v7;
  v16.size.width = v9;
  v16.size.height = v11;
  CGRectDivide(v16, &slice, &v13, v12, CGRectMaxYEdge);
  -[UIView setFrame:](self->_shadowView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  -[UIVisualEffectView setFrame:](self->_overlayEffectView, "setFrame:", *(_OWORD *)&v13.origin, *(_OWORD *)&v13.size);
}

- (void)setOverlayEffect:(id)a3
{
  UIVisualEffect *v5;
  UIVisualEffect **p_overlayEffect;
  UIVisualEffect *v7;

  v5 = (UIVisualEffect *)a3;
  p_overlayEffect = &self->_overlayEffect;
  if (self->_overlayEffect != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_overlayEffect, a3);
    -[UIVisualEffectView setEffect:](self->_overlayEffectView, "setEffect:", *p_overlayEffect);
    -[UIVisualEffectView setHidden:](self->_overlayEffectView, "setHidden:", *p_overlayEffect == 0);
    v5 = v7;
  }

}

- (void)setShadowColor:(id)a3
{
  UIColor *v5;
  UIColor **p_shadowColor;
  UIColor *v7;

  v5 = (UIColor *)a3;
  p_shadowColor = &self->_shadowColor;
  if (self->_shadowColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_shadowColor, a3);
    -[UIView setBackgroundColor:](self->_shadowView, "setBackgroundColor:", *p_shadowColor);
    -[UIView setHidden:](self->_shadowView, "setHidden:", *p_shadowColor == 0);
    v5 = v7;
  }

}

- (void)setOverlayAlpha:(double)a3
{
  if (self->_overlayAlpha != a3)
  {
    self->_overlayAlpha = a3;
    -[UIVisualEffectView setAlpha:](self->_overlayEffectView, "setAlpha:");
    -[UIView setAlpha:](self->_shadowView, "setAlpha:", self->_overlayAlpha);
  }
}

- (PKSplashImageHeaderView)headerView
{
  return self->_headerView;
}

- (UIVisualEffect)overlayEffect
{
  return self->_overlayEffect;
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (double)overlayAlpha
{
  return self->_overlayAlpha;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_overlayEffect, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_overlayEffectView, 0);
}

@end
