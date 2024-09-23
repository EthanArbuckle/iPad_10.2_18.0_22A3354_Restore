@implementation PKHeroCardWatchExplainationHeaderView

- (PKHeroCardWatchExplainationHeaderView)init
{
  PKHeroCardWatchExplainationHeaderView *v2;
  PKHeroCardWatchExplainationHeaderView *v3;
  void *v4;
  PKWatchHeroImageView *v5;
  PKWatchHeroImageView *watchView;
  id v7;
  uint64_t v8;
  UIImageView *passImageView;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKHeroCardWatchExplainationHeaderView;
  v2 = -[PKHeroCardWatchExplainationHeaderView init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PKHeroCardWatchExplainationHeaderView _deviceBackgroundColor](v2, "_deviceBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKHeroCardWatchExplainationHeaderView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = objc_alloc_init(PKWatchHeroImageView);
    watchView = v3->_watchView;
    v3->_watchView = v5;

    -[PKHeroCardWatchExplainationHeaderView addSubview:](v3, "addSubview:", v3->_watchView);
    v7 = objc_alloc(MEMORY[0x1E0DC3890]);
    v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    passImageView = v3->_passImageView;
    v3->_passImageView = (UIImageView *)v8;

    -[UIImageView setAccessibilityIgnoresInvertColors:](v3->_passImageView, "setAccessibilityIgnoresInvertColors:", 1);
    -[PKWatchHeroImageView addSubview:](v3->_watchView, "addSubview:", v3->_passImageView);
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  CGSize result;

  width = a3.width;
  -[PKWatchHeroImageView sizeThatFits:](self->_watchView, "sizeThatFits:", a3.width, a3.height);
  v5 = width;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  UIImageView *passImageView;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKHeroCardWatchExplainationHeaderView;
  -[PKHeroCardWatchExplainationHeaderView layoutSubviews](&v6, sel_layoutSubviews);
  -[PKHeroCardWatchExplainationHeaderView bounds](self, "bounds");
  -[PKWatchHeroImageView sizeThatFits:](self->_watchView, "sizeThatFits:", v3, v4);
  -[PKWatchHeroImageView frame](self->_watchView, "frame");
  PKRectCenteredIntegralRect();
  -[PKWatchHeroImageView setFrame:](self->_watchView, "setFrame:");
  passImageView = self->_passImageView;
  -[PKWatchHeroImageView cardFrame](self->_watchView, "cardFrame");
  -[UIImageView setFrame:](passImageView, "setFrame:");
}

- (void)setCardImage:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_cardImage, a3);
  v5 = a3;
  -[UIImageView setImage:](self->_passImageView, "setImage:", v5);

}

- (BOOL)_isSmallPhone
{
  return PKUIGetMinScreenWidthType() == 0;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKHeroCardWatchExplainationHeaderView;
  -[PKHeroCardWatchExplainationHeaderView traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, a3);
  -[PKHeroCardWatchExplainationHeaderView _deviceBackgroundColor](self, "_deviceBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKHeroCardWatchExplainationHeaderView setBackgroundColor:](self, "setBackgroundColor:", v4);

}

- (id)_deviceBackgroundColor
{
  void *v2;
  uint64_t v3;

  -[PKHeroCardWatchExplainationHeaderView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceStyle");

  if (v3 == 2)
    PKProvisioningBackgroundColor();
  else
    PKProvisioningSecondaryBackgroundColor();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CGSize)recommendedCardImageSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[PKWatchHeroImageView cardFrame](self->_watchView, "cardFrame");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (UIImage)cardImage
{
  return self->_cardImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardImage, 0);
  objc_storeStrong((id *)&self->_watchView, 0);
  objc_storeStrong((id *)&self->_passImageView, 0);
}

@end
