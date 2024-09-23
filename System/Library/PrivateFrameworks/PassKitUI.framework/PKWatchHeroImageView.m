@implementation PKWatchHeroImageView

- (PKWatchHeroImageView)init
{
  return -[PKWatchHeroImageView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (PKWatchHeroImageView)initWithFrame:(CGRect)a3
{
  PKWatchHeroImageView *v3;
  PKWatchHeroImageView *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  BPSIllustratedWatchView *watchView;
  id v12;
  UILabel *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  UILabel *doneLabel;
  UILabel *v27;
  void *v28;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)PKWatchHeroImageView;
  v3 = -[PKWatchHeroImageView initWithFrame:](&v30, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_size = 0;
    v5 = objc_alloc(MEMORY[0x1E0D035E8]);
    v6 = *MEMORY[0x1E0C9D538];
    v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    +[PKWatchHeroImageView heroWatchImageSize](PKWatchHeroImageView, "heroWatchImageSize");
    v10 = objc_msgSend(v5, "initWithFrame:", v6, v7, v8, v9);
    watchView = v4->_watchView;
    v4->_watchView = (BPSIllustratedWatchView *)v10;

    -[BPSIllustratedWatchView setAllowScaling:](v4->_watchView, "setAllowScaling:", 1);
    -[PKWatchHeroImageView addSubview:](v4, "addSubview:", v4->_watchView);
    v12 = objc_alloc(MEMORY[0x1E0DC3990]);
    v13 = (UILabel *)objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v13, "setTextColor:", v14);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v13, "setFont:", v15);
    v16 = objc_alloc(MEMORY[0x1E0CB3778]);
    PKLocalizedPaymentString(CFSTR("WATCH_PAYMENT_COMPLETE_TEXT"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithString:", v17);

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
    objc_msgSend(v18, "insertAttributedString:atIndex:", v19, 0);

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC12B0]), "initWithData:ofType:", 0, 0);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", v15, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("checkmark.circle.fill"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "imageWithTintColor:", v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setImage:", v23);

    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "insertAttributedString:atIndex:", v24, 0);

    v25 = objc_msgSend(v18, "length");
    objc_msgSend(v18, "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v15, 0, v25);
    -[UILabel setAttributedText:](v13, "setAttributedText:", v18);
    doneLabel = v4->_doneLabel;
    v4->_doneLabel = v13;
    v27 = v13;

    -[PKWatchHeroImageView addSubview:](v4, "addSubview:", v4->_doneLabel);
    -[PKWatchHeroImageView setClipsToBounds:](v4, "setClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKWatchHeroImageView setBackgroundColor:](v4, "setBackgroundColor:", v28);
    -[PKWatchHeroImageView setAccessibilityTraits:](v4, "setAccessibilityTraits:", *MEMORY[0x1E0DC46C0]);
    -[PKWatchHeroImageView setIsAccessibilityElement:](v4, "setIsAccessibilityElement:", 1);
    -[PKWatchHeroImageView _updatedAccessibilityLabel](v4, "_updatedAccessibilityLabel");

  }
  return v4;
}

- (void)_updatedAccessibilityLabel
{
  __CFString *v3;
  id v4;

  if (self->_cardArtImageView)
    v3 = CFSTR("WATCH_DEVICE_ACCESSIBILITY_LABEL_PASS");
  else
    v3 = CFSTR("WATCH_DEVICE_ACCESSIBILITY_LABEL");
  PKLocalizedPaymentString(&v3->isa);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKWatchHeroImageView setAccessibilityLabel:](self, "setAccessibilityLabel:", v4);

}

- (double)watchDeviceImageScaleFactor
{
  return 1.0;
}

- (CGPoint)watchScreenCenter
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  -[PKWatchHeroImageView watchScreenFrame](self, "watchScreenFrame");
  v4 = v3 + v2 * 0.5;
  v7 = v6 + v5 * 0.5;
  result.y = v7;
  result.x = v4;
  return result;
}

- (CGRect)watchScreenFrame
{
  CGRect v2;

  -[BPSIllustratedWatchView watchScreenInsetGuide](self->_watchView, "watchScreenInsetGuide");
  return CGRectInset(v2, 3.0, 0.0);
}

- (CGRect)cardFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[PKWatchHeroImageView watchScreenFrame](self, "watchScreenFrame");
  v4 = v3;
  v6 = v5;
  -[PKWatchHeroImageView watchScreenCenter](self, "watchScreenCenter");
  UIRoundToViewScale();
  v8 = v7;
  +[PKBridgeWatchAttributeController heroWatchSize](PKBridgeWatchAttributeController, "heroWatchSize");
  UIRoundToViewScale();
  v10 = v9;
  UIRoundToViewScale();
  v12 = v11;
  v13 = v4 + v10;
  v14 = v8;
  v15 = v6;
  result.size.height = v12;
  result.size.width = v15;
  result.origin.y = v13;
  result.origin.x = v14;
  return result;
}

- (CGRect)spaceBelowCardFrame
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v15;
  double MaxY;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat rect;
  CGFloat rect_8;
  CGFloat rect_16;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect result;

  -[PKWatchHeroImageView cardFrame](self, "cardFrame");
  v4 = v3;
  rect = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PKWatchHeroImageView watchScreenFrame](self, "watchScreenFrame");
  x = v24.origin.x;
  y = v24.origin.y;
  width = v24.size.width;
  height = v24.size.height;
  rect_16 = CGRectGetMinX(v24);
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  rect_8 = CGRectGetMaxY(v25);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  v15 = CGRectGetWidth(v26);
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  MaxY = CGRectGetMaxY(v27);
  v28.origin.x = rect;
  v28.origin.y = v6;
  v28.size.width = v8;
  v28.size.height = v10;
  v17 = MaxY - CGRectGetMaxY(v28);
  v19 = rect_8;
  v18 = rect_16;
  v20 = v15;
  result.size.height = v17;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

+ (CGSize)heroWatchImageSize
{
  unint64_t v2;
  double *v3;
  double *v4;
  double v5;
  double v6;
  CGSize result;

  v2 = PKUIGetMinScreenWidthType();
  v3 = (double *)((char *)&unk_19DF16AD8 + 8 * v2);
  v4 = (double *)((char *)&unk_19DF16B10 + 8 * v2);
  if (v2 >= 7)
  {
    v4 = (double *)(MEMORY[0x1E0C9D820] + 8);
    v3 = (double *)MEMORY[0x1E0C9D820];
  }
  v5 = *v3;
  v6 = *v4;
  result.height = v6;
  result.width = v5;
  return result;
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
  BPSIllustratedWatchView *watchView;
  double v12;
  double v13;
  double v14;
  double v15;
  UIImageView *wallpaperImageView;
  UIImageView *cardArtImageView;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)PKWatchHeroImageView;
  -[PKWatchHeroImageView layoutSubviews](&v25, sel_layoutSubviews);
  -[PKWatchHeroImageView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v9 = v3;
  v10 = v4;
  watchView = self->_watchView;
  if (self->_size)
  {
    LODWORD(v3) = 1148846080;
    LODWORD(v4) = 1112014848;
    -[BPSIllustratedWatchView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_watchView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v9, v10, v3, v4);
    watchView = self->_watchView;
    PKSizeAlignedInRect();
    v6 = v12;
    v8 = v13;
    v9 = v14;
    v10 = v15;
  }
  -[BPSIllustratedWatchView setFrame:](watchView, "setFrame:", v6, v8, v9, v10);
  wallpaperImageView = self->_wallpaperImageView;
  if (wallpaperImageView)
  {
    -[PKWatchHeroImageView watchScreenFrame](self, "watchScreenFrame");
    -[UIImageView setFrame:](wallpaperImageView, "setFrame:");
  }
  cardArtImageView = self->_cardArtImageView;
  if (cardArtImageView)
  {
    -[PKWatchHeroImageView cardFrame](self, "cardFrame");
    -[UIImageView setFrame:](cardArtImageView, "setFrame:");
  }
  if (!self->_hideDoneLabel)
  {
    -[PKWatchHeroImageView spaceBelowCardFrame](self, "spaceBelowCardFrame");
    -[UILabel sizeThatFits:](self->_doneLabel, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v19 = v18;
    v21 = v20;
    UIRoundToViewScale();
    v23 = v22;
    UIRoundToViewScale();
    -[UILabel setFrame:](self->_doneLabel, "setFrame:", v23, v24, v19, v21);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  +[PKWatchHeroImageView heroWatchImageSize](PKWatchHeroImageView, "heroWatchImageSize", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGSize)recommendedCardImageSize
{
  double v2;
  double v3;
  CGSize result;

  +[PKWatchHeroImageView heroWatchImageSize](PKWatchHeroImageView, "heroWatchImageSize");
  PKSizeRoundToPixel();
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setSize:(unint64_t)a3
{
  if (self->_size != a3)
  {
    self->_size = a3;
    -[BPSIllustratedWatchView setAllowScaling:](self->_watchView, "setAllowScaling:", a3 == 0);
    -[PKWatchHeroImageView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setHideDoneLabel:(BOOL)a3
{
  if (self->_hideDoneLabel != a3)
  {
    self->_hideDoneLabel = a3;
    if (a3)
      -[UILabel removeFromSuperview](self->_doneLabel, "removeFromSuperview");
    else
      -[PKWatchHeroImageView addSubview:](self, "addSubview:", self->_doneLabel);
    -[PKWatchHeroImageView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setWallpaperImage:(id)a3
{
  -[PKWatchHeroImageView setWallpaperImage:contentMode:](self, "setWallpaperImage:contentMode:", a3, 1);
}

- (void)setWallpaperImage:(id)a3 contentMode:(int64_t)a4
{
  id v6;
  UIImageView *wallpaperImageView;
  UIImageView *v8;
  UIImageView *v9;
  UIImageView *v10;
  id v11;

  v6 = a3;
  wallpaperImageView = self->_wallpaperImageView;
  v11 = v6;
  if (v6)
  {
    if (!wallpaperImageView)
    {
      v8 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v6);
      v9 = self->_wallpaperImageView;
      self->_wallpaperImageView = v8;

      -[UIImageView setContentMode:](self->_wallpaperImageView, "setContentMode:", a4);
      -[UIImageView setClipsToBounds:](self->_wallpaperImageView, "setClipsToBounds:", 1);
      -[BPSIllustratedWatchView addSubview:](self->_watchView, "addSubview:", self->_wallpaperImageView);
      v6 = v11;
      wallpaperImageView = self->_wallpaperImageView;
    }
    -[UIImageView setImage:](wallpaperImageView, "setImage:", v6);
  }
  else
  {
    -[UIImageView removeFromSuperview](wallpaperImageView, "removeFromSuperview");
    v10 = self->_wallpaperImageView;
    self->_wallpaperImageView = 0;

  }
  -[PKWatchHeroImageView setNeedsLayout](self, "setNeedsLayout");

}

- (UIImage)wallpaperImage
{
  return -[UIImageView image](self->_wallpaperImageView, "image");
}

- (void)setCardImage:(id)a3
{
  id v4;
  UIImageView *cardArtImageView;
  UIImageView *v6;
  UIImageView *v7;
  void *v8;
  id v9;
  UIImageView *v10;
  id v11;

  v4 = a3;
  cardArtImageView = self->_cardArtImageView;
  v11 = v4;
  if (v4)
  {
    if (!cardArtImageView)
    {
      v6 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v4);
      v7 = self->_cardArtImageView;
      self->_cardArtImageView = v6;

      -[UIImageView setContentMode:](self->_cardArtImageView, "setContentMode:", 1);
      -[BPSIllustratedWatchView addSubview:](self->_watchView, "addSubview:", self->_cardArtImageView);
      -[UIImageView layer](self->_cardArtImageView, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKWatchHeroImageView cardFrame](self, "cardFrame");
      +[PKTransactionDataOverlayCardFaceView borderWidth](PKTransactionDataOverlayCardFaceView, "borderWidth");
      +[PKTransactionDataOverlayCardFaceView borderColor](PKTransactionDataOverlayCardFaceView, "borderColor");
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v9, "CGColor");
      PKPaymentStyleApplyCorners();

      v4 = v11;
      cardArtImageView = self->_cardArtImageView;
    }
    -[UIImageView setImage:](cardArtImageView, "setImage:", v4);
  }
  else
  {
    -[UIImageView removeFromSuperview](cardArtImageView, "removeFromSuperview");
    v10 = self->_cardArtImageView;
    self->_cardArtImageView = 0;

  }
  -[PKWatchHeroImageView _updatedAccessibilityLabel](self, "_updatedAccessibilityLabel");
  -[PKWatchHeroImageView setNeedsLayout](self, "setNeedsLayout");

}

- (UIImage)cardImage
{
  return -[UIImageView image](self->_cardArtImageView, "image");
}

- (BOOL)hideDoneLabel
{
  return self->_hideDoneLabel;
}

- (unint64_t)size
{
  return self->_size;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardArtImageView, 0);
  objc_storeStrong((id *)&self->_wallpaperImageView, 0);
  objc_storeStrong((id *)&self->_doneLabel, 0);
  objc_storeStrong((id *)&self->_watchView, 0);
}

@end
