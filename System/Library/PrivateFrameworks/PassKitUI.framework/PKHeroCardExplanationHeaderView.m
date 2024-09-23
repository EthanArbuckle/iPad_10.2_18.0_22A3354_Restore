@implementation PKHeroCardExplanationHeaderView

+ (CGSize)recommendedCardImageSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 280.0;
  v3 = 176.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (PKHeroCardExplanationHeaderView)initWithImage:(id)a3
{
  id v4;
  PKHeroCardExplanationHeaderView *v5;
  PKHeroCardExplanationHeaderView *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  uint64_t v15;
  UIView *cardImageShadowView;
  void *v17;
  double v18;
  uint64_t v19;
  UIImageView *cardImageView;
  uint64_t v21;
  UIActivityIndicatorView *spinner;

  v4 = a3;
  v5 = -[PKHeroCardExplanationHeaderView init](self, "init");
  v6 = v5;
  if (v5)
  {
    if (-[UIView pkui_userInterfaceIdiomSupportsLargeLayouts](v5, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
    {
      v7 = 2;
      v8 = 3;
    }
    else
    {
      v9 = PKUIGetMinScreenType();
      v8 = 3;
      if (v9 >= 4)
        v8 = 4;
      v7 = 2;
      if (v9 >= 4)
        v7 = 3;
    }
    v6->_size = v8;
    v6->_padding = v7;
    -[PKHeroCardExplanationHeaderView updateCardSizeValues](v6, "updateCardSizeValues");
    if (v4)
      objc_msgSend(v4, "size");
    else
      objc_msgSend((id)objc_opt_class(), "recommendedCardImageSize");
    v12 = v10;
    v13 = v11;
    v14 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v15 = objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v12, v13);
    cardImageShadowView = v6->_cardImageShadowView;
    v6->_cardImageShadowView = (UIView *)v15;

    -[PKHeroCardExplanationHeaderView addSubview:](v6, "addSubview:", v6->_cardImageShadowView);
    -[UIView layer](v6->_cardImageShadowView, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setShouldRasterize:", 1);
    objc_msgSend(v17, "setRasterizationScale:", PKUIScreenScale());
    LODWORD(v18) = 1041865114;
    objc_msgSend(v17, "setShadowOpacity:", v18);
    objc_msgSend(v17, "setShadowOffset:", 0.0, 10.0);
    objc_msgSend(v17, "setShadowRadius:", 15.0);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v4);
    cardImageView = v6->_cardImageView;
    v6->_cardImageView = (UIImageView *)v19;

    -[UIView addSubview:](v6->_cardImageShadowView, "addSubview:", v6->_cardImageView);
    -[UIImageView setAccessibilityIgnoresInvertColors:](v6->_cardImageView, "setAccessibilityIgnoresInvertColors:", 1);
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 101);
    spinner = v6->_spinner;
    v6->_spinner = (UIActivityIndicatorView *)v21;

    -[PKHeroCardExplanationHeaderView setHideBackground:](v6, "setHideBackground:", 0);
  }

  return v6;
}

- (UIImage)cardImage
{
  return -[UIImageView image](self->_cardImageView, "image");
}

- (void)setCardImage:(id)a3
{
  -[UIImageView setImage:](self->_cardImageView, "setImage:", a3);
  -[UIImageView sizeToFit](self->_cardImageView, "sizeToFit");
  -[PKHeroCardExplanationHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v18;
  id v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PKHeroCardExplanationHeaderView;
  -[PKHeroCardExplanationHeaderView layoutSubviews](&v20, sel_layoutSubviews);
  -[UIImageView image](self->_cardImageView, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PKHeroCardExplanationHeaderView bounds](self, "bounds");
    v4 = *MEMORY[0x1E0C9D538];
    v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[UIImageView image](self->_cardImageView, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "size");

    PKSizeScaleAspectFit();
    UIRectCenteredXInRect();
    v8 = v7;
    v10 = v9;
    -[UIView setFrame:](self->_cardImageShadowView, "setFrame:");
    -[UIImageView frame](self->_cardImageView, "frame");
    v12 = v11;
    v14 = v13;
    -[UIImageView setFrame:](self->_cardImageView, "setFrame:", v4, v5, v8, v10);
    if (!self->_hideBorders)
    {
      -[UIView frame](self->_cardImageShadowView, "frame");
      if (v16 != v12 || v15 != v14)
      {
        -[UIImageView layer](self->_cardImageView, "layer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView frame](self->_cardImageView, "frame");
        +[PKTransactionDataOverlayCardFaceView borderWidth](PKTransactionDataOverlayCardFaceView, "borderWidth");
        +[PKTransactionDataOverlayCardFaceView borderColor](PKTransactionDataOverlayCardFaceView, "borderColor");
        v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v19, "CGColor");
        PKPaymentStyleApplyCorners();

      }
    }
  }
  -[UIActivityIndicatorView frame](self->_spinner, "frame");
  -[PKHeroCardExplanationHeaderView bounds](self, "bounds");
  UIRectCenteredAboutPoint();
  -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double cardBackingHeight;

  cardBackingHeight = self->_cardBackingHeight;
  result.height = cardBackingHeight;
  return result;
}

- (void)setSize:(unint64_t)a3
{
  if (self->_size != a3)
  {
    self->_size = a3;
    -[PKHeroCardExplanationHeaderView updateCardSizeValues](self, "updateCardSizeValues");
    -[PKHeroCardExplanationHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPadding:(unint64_t)a3
{
  if (self->_padding != a3)
  {
    self->_padding = a3;
    -[PKHeroCardExplanationHeaderView updateCardSizeValues](self, "updateCardSizeValues");
    -[PKHeroCardExplanationHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)updateCardSizeValues
{
  unint64_t size;
  double cardBottomPadding;

  size = self->_size;
  if (size <= 4)
    *(_QWORD *)&self->_cardHeight = qword_19DF15120[size];
  switch(self->_padding)
  {
    case 0uLL:
    case 5uLL:
      self->_cardTopPadding = 0.0;
      self->_cardBottomPadding = 0.0;
      cardBottomPadding = 0.0;
      break;
    case 1uLL:
      self->_cardTopPadding = 0.0;
      goto LABEL_8;
    case 2uLL:
      self->_cardTopPadding = 15.0;
LABEL_8:
      self->_cardBottomPadding = 20.0;
      cardBottomPadding = 20.0;
      break;
    case 3uLL:
      self->_cardTopPadding = 30.0;
      self->_cardBottomPadding = 60.0;
      cardBottomPadding = 60.0;
      break;
    case 4uLL:
      self->_cardTopPadding = 10.0;
      self->_cardBottomPadding = 10.0;
      cardBottomPadding = 10.0;
      break;
    default:
      cardBottomPadding = self->_cardBottomPadding;
      break;
  }
  self->_cardBackingHeight = cardBottomPadding + self->_cardHeight + self->_cardTopPadding;
}

- (void)showLoadingContent
{
  void *v3;
  double v4;

  -[UIImageView layer](self->_cardImageView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 0;
  objc_msgSend(v3, "setOpacity:", v4);

  -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
  -[PKHeroCardExplanationHeaderView addSubview:](self, "addSubview:", self->_spinner);
}

- (void)hideLoadingContent
{
  void *v3;

  -[UIImageView layer](self->_cardImageView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pkui_animateToOpacity:withCompletion:", 0, 1.0);

  -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
  -[UIActivityIndicatorView removeFromSuperview](self->_spinner, "removeFromSuperview");
}

- (void)setHideBackground:(BOOL)a3
{
  uint64_t v4;
  id v5;

  self->_hideBackground = a3;
  if (a3)
  {
    v4 = 0;
  }
  else
  {
    PKProvisioningSecondaryBackgroundColor();
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (id)v4;
  -[PKHeroCardExplanationHeaderView setBackgroundColor:](self, "setBackgroundColor:", v4);

}

- (void)setHideShadow:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  double v5;
  id v6;

  if (((!self->_hideShadow ^ a3) & 1) == 0)
  {
    v3 = a3;
    -[UIView layer](self->_cardImageShadowView, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    LODWORD(v5) = 1041865114;
    if (v3)
      *(float *)&v5 = 0.0;
    objc_msgSend(v4, "setShadowOpacity:", v5);

  }
}

- (UIImageView)cardImageView
{
  return self->_cardImageView;
}

- (unint64_t)size
{
  return self->_size;
}

- (unint64_t)padding
{
  return self->_padding;
}

- (BOOL)hideBorders
{
  return self->_hideBorders;
}

- (void)setHideBorders:(BOOL)a3
{
  self->_hideBorders = a3;
}

- (BOOL)hideShadow
{
  return self->_hideShadow;
}

- (BOOL)hideBackground
{
  return self->_hideBackground;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardImageView, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_cardImageShadowView, 0);
}

@end
