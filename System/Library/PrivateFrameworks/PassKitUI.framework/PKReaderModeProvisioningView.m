@implementation PKReaderModeProvisioningView

- (PKReaderModeProvisioningView)initWithContext:(int64_t)a3 product:(id)a4 isWatch:(BOOL)a5
{
  return -[PKReaderModeProvisioningView initWithFrame:context:product:isWatch:](self, "initWithFrame:context:product:isWatch:", a3, a4, a5, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (PKReaderModeProvisioningView)initWithFrame:(CGRect)a3 context:(int64_t)a4 product:(id)a5 isWatch:(BOOL)a6
{
  _BOOL4 v6;
  double height;
  double width;
  double y;
  double x;
  id v13;
  PKReaderModeProvisioningView *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSString *cardPlacement;
  int v20;
  PKReaderModeHeaderView *v21;
  PKReaderModeHeaderView *headerView;
  uint64_t v23;
  UIProgressView *progressView;
  objc_super v26;

  v6 = a6;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a5;
  v26.receiver = self;
  v26.super_class = (Class)PKReaderModeProvisioningView;
  v14 = -[PKReaderModeProvisioningView initWithFrame:](&v26, sel_initWithFrame_, x, y, width, height);
  if (v14)
  {
    objc_msgSend(v13, "provisioningMethodMetadataForType:", *MEMORY[0x1E0D6AE40]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "readerModeResources");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D6AE58]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D6AE48]);
    v18 = objc_claimAutoreleasedReturnValue();
    cardPlacement = v14->_cardPlacement;
    v14->_cardPlacement = (NSString *)v18;

    if ((PKPaymentSetupContextIsBridge() & 1) != 0)
      LOBYTE(v20) = 1;
    else
      v20 = PKPaymentSetupForceBridgeAppearance() | v6;
    v14->_isProvisioningToWatch = v20;
    -[PKReaderModeProvisioningView _loadAnimation](v14, "_loadAnimation");
    v21 = -[PKReaderModeHeaderView initWithState:context:product:]([PKReaderModeHeaderView alloc], "initWithState:context:product:", 2, a4, v13);
    headerView = v14->_headerView;
    v14->_headerView = v21;

    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B98]), "initWithProgressViewStyle:", 0);
    progressView = v14->_progressView;
    v14->_progressView = (UIProgressView *)v23;

    -[UIProgressView setHidden:](v14->_progressView, "setHidden:", 1);
    -[PKReaderModeProvisioningView addSubview:](v14, "addSubview:", v14->_headerView);
    -[PKReaderModeProvisioningView addSubview:](v14, "addSubview:", v14->_progressView);

  }
  return v14;
}

- (PKReaderModeProvisioningView)initWithFrame:(CGRect)a3 product:(id)a4
{
  return -[PKReaderModeProvisioningView initWithFrame:context:product:isWatch:](self, "initWithFrame:context:product:isWatch:", 0, a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_loadAnimation
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;
  PKReaderModeAnimationView *animationView;
  uint64_t v8;
  PKReaderModeAnimationView *v9;
  PKReaderModeAnimationView *v10;
  id v11;

  -[PKReaderModeProvisioningView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (v4 == 2)
    v5 = CFSTR("Reader_mode_Dark_ICE");
  else
    v5 = CFSTR("Reader_mode_Light_ICE");
  v11 = (id)v5;
  if (self->_isProvisioningToWatch)
  {
    +[PKReaderModeProvisioningView watchImage:](PKReaderModeProvisioningView, "watchImage:", v4 == 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (-[NSString isEqualToString:](self->_cardPlacement, "isEqualToString:", *MEMORY[0x1E0D6AE50]))
  {
    objc_msgSend(v11, "stringByAppendingString:", CFSTR("_Lower"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  animationView = self->_animationView;
  if (animationView)
  {
    v8 = -[PKReaderModeAnimationView state](animationView, "state");
    -[PKReaderModeAnimationView removeFromSuperview](self->_animationView, "removeFromSuperview");
  }
  else
  {
    v8 = 0;
  }
  v9 = -[PKReaderModeAnimationView initWithAssetName:forPhoneTarget:]([PKReaderModeAnimationView alloc], "initWithAssetName:forPhoneTarget:", v11, !self->_isProvisioningToWatch);
  v10 = self->_animationView;
  self->_animationView = v9;

  -[PKReaderModeAnimationView setClipsToBounds:](self->_animationView, "setClipsToBounds:", 1);
  if (self->_digitalCardImage)
    -[PKReaderModeAnimationView setDigitalCardImage:](self->_animationView, "setDigitalCardImage:");
  if (self->_plasticCardImage)
    -[PKReaderModeAnimationView setPlasticCardImage:](self->_animationView, "setPlasticCardImage:");
  -[PKReaderModeAnimationView setWatchAssetImage:](self->_animationView, "setWatchAssetImage:", v6);
  -[PKReaderModeAnimationView setState:](self->_animationView, "setState:", v8);
  -[PKReaderModeProvisioningView addSubview:](self, "addSubview:", self->_animationView);
  -[PKReaderModeProvisioningView setNeedsLayout](self, "setNeedsLayout");

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  PKReaderModeHeaderView *headerView;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PKReaderModeProvisioningView;
  -[PKReaderModeProvisioningView layoutSubviews](&v16, sel_layoutSubviews);
  -[PKReaderModeAnimationView frame](self->_animationView, "frame");
  v4 = v3;
  v6 = v5;
  headerView = self->_headerView;
  -[PKReaderModeProvisioningView bounds](self, "bounds");
  -[PKTableHeaderView sizeThatFits:](headerView, "sizeThatFits:", v8, 1.79769313e308);
  v10 = v9;
  v11 = v4 + v6 + 10.0;
  -[PKReaderModeHeaderView setFrame:](self->_headerView, "setFrame:", 0.0, v11, v12, v9);
  -[PKReaderModeHeaderView setNeedsLayout](self->_headerView, "setNeedsLayout");
  -[UIProgressView frame](self->_progressView, "frame");
  v14 = v13;
  -[PKReaderModeProvisioningView bounds](self, "bounds");
  -[UIProgressView setFrame:](self->_progressView, "setFrame:", 80.0, v11 + v10, v15 + -160.0, v14);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PKReaderModeAnimationView sizeThatFits:](self->_animationView, "sizeThatFits:");
  v7 = v6;
  -[PKTableHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", width, height);
  v9 = v7 + 10.0 + v8;
  if ((-[UIProgressView isHidden](self->_progressView, "isHidden") & 1) == 0)
  {
    -[UIProgressView sizeThatFits:](self->_progressView, "sizeThatFits:", width, height);
    v9 = v9 + v10;
  }
  v11 = width;
  v12 = v9;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)setState:(unint64_t)a3 animated:(BOOL)a4
{
  double v6;

  -[PKReaderModeAnimationView setState:animated:](self->_animationView, "setState:animated:", a3, a4);
  -[PKReaderModeHeaderView setState:](self->_headerView, "setState:", a3);
  -[UIProgressView setHidden:](self->_progressView, "setHidden:", a3 != 3);
  if (!a3)
  {
    LODWORD(v6) = 0;
    -[UIProgressView setProgress:](self->_progressView, "setProgress:", v6);
  }
  -[PKReaderModeProvisioningView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTransferringProgress:(double)a3 duration:(double)a4
{
  _QWORD block[7];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PKReaderModeProvisioningView_setTransferringProgress_duration___block_invoke;
  block[3] = &unk_1E3E62928;
  block[4] = self;
  *(double *)&block[5] = a3;
  *(double *)&block[6] = a4;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __65__PKReaderModeProvisioningView_setTransferringProgress_duration___block_invoke(uint64_t a1)
{
  double v1;

  v1 = *(double *)(a1 + 40);
  *(float *)&v1 = v1;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "_setProgressAnimated:duration:delay:options:", 4, v1, *(double *)(a1 + 48), 0.0);
}

- (void)setPlasticCardImage:(id)a3
{
  UIImage **p_plasticCardImage;
  id v6;

  p_plasticCardImage = &self->_plasticCardImage;
  objc_storeStrong((id *)&self->_plasticCardImage, a3);
  v6 = a3;
  -[PKReaderModeAnimationView setPlasticCardImage:](self->_animationView, "setPlasticCardImage:", *p_plasticCardImage);

}

- (void)setDigitalCardImage:(id)a3
{
  UIImage **p_digitalCardImage;
  id v6;

  p_digitalCardImage = &self->_digitalCardImage;
  objc_storeStrong((id *)&self->_digitalCardImage, a3);
  v6 = a3;
  -[PKReaderModeAnimationView setDigitalCardImage:](self->_animationView, "setDigitalCardImage:", *p_digitalCardImage);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKReaderModeProvisioningView;
  -[PKReaderModeProvisioningView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  if (!v4
    || (v5 = objc_msgSend(v4, "userInterfaceStyle"),
        -[PKReaderModeProvisioningView traitCollection](self, "traitCollection"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "userInterfaceStyle"),
        v6,
        v5 != v7))
  {
    -[PKReaderModeProvisioningView _loadAnimation](self, "_loadAnimation");
  }

}

+ (id)watchImage:(BOOL)a3
{
  PKWatchHeroImageView *v4;
  double v5;
  CGFloat v6;
  double y;
  double width;
  double height;
  double v10;
  double v11;
  CGContextRef CurrentContext;
  void *v13;
  void *v14;
  CGContext *v15;
  void *v16;
  void *v17;
  CGSize v19;
  CGSize v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v4 = objc_alloc_init(PKWatchHeroImageView);
  -[PKWatchHeroImageView setHideDoneLabel:](v4, "setHideDoneLabel:", 1);
  -[PKWatchHeroImageView sizeThatFits:](v4, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  v6 = v5;
  PKSizeAlignedInRect();
  v22 = CGRectInset(v21, 23.0, 0.0);
  y = v22.origin.y;
  width = v22.size.width;
  height = v22.size.height;
  v10 = v22.origin.x + 1.5;
  -[PKWatchHeroImageView setFrame:](v4, "setFrame:", v22.origin.x + 1.5, v22.origin.y);
  -[PKWatchHeroImageView setNeedsLayout](v4, "setNeedsLayout");
  -[PKWatchHeroImageView layoutIfNeeded](v4, "layoutIfNeeded");
  v11 = PKUIScreenScale();
  v19.width = width;
  v19.height = height;
  UIGraphicsBeginImageContextWithOptions(v19, 0, v11);
  CurrentContext = UIGraphicsGetCurrentContext();
  -[PKWatchHeroImageView layer](v4, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "renderInContext:", CurrentContext);

  UIGraphicsGetImageFromCurrentImageContext();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  v20.width = v6;
  v20.height = v6;
  UIGraphicsBeginImageContextWithOptions(v20, 0, v11);
  v15 = UIGraphicsGetCurrentContext();
  if (a3)
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFill");
  v23.origin.x = 0.0;
  v23.origin.y = 0.0;
  v23.size.width = v6;
  v23.size.height = v6;
  CGContextFillRect(v15, v23);
  objc_msgSend(v14, "drawInRect:", v10, y, width, height);
  UIGraphicsGetImageFromCurrentImageContext();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digitalCardImage, 0);
  objc_storeStrong((id *)&self->_plasticCardImage, 0);
  objc_storeStrong((id *)&self->_cardPlacement, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_animationView, 0);
}

@end
