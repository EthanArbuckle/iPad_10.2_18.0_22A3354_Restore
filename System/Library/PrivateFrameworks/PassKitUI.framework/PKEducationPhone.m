@implementation PKEducationPhone

- (PKEducationPhone)initWithFrame:(CGRect)a3
{
  return -[PKEducationPhone initWithFrame:displayOptions:](self, "initWithFrame:displayOptions:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PKEducationPhone)initWithFrame:(CGRect)a3 displayOptions:(unint64_t)a4
{
  char v4;
  PKEducationPhone *v5;
  PKEducationPhone *v6;
  CGSize *p_screenSize;
  objc_class *v8;
  CGFloat v9;
  PKPhoneHeroView *v10;
  PKPhoneHeroView *phoneBackgroundView;
  UIImageView *v12;
  UIImageView *cardImageView;
  PKPaymentSetupInitialCardEducationIconsView *v14;
  PKPaymentSetupInitialCardEducationIconsView *iconsView;
  id v16;
  void *v17;
  uint64_t v18;
  UIImageView *walletImageView;
  UIView *v20;
  UIView *homeButtonView;
  UIView *v22;
  void *v23;
  void *v24;
  UIView *v25;
  UIView *homeButtonOutlineView;
  void *v27;
  UIImageView *v28;
  UIImageView *biometricsImageView;
  __CFString *v30;
  __CFString *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  UIImageView *v35;
  double v36;
  void *v37;
  UIImageView *v38;
  UIImageView *powerIndicatorView;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  UIImageView *v44;
  void *v45;
  UIImageView *v46;
  void *v47;
  void *v48;
  UIImageView *v49;
  UIImageView *powerArrowImageView;
  void *v51;
  void *v52;
  double v53;
  void *v54;
  UIImageView *v55;
  void *v56;
  UIImageView *v57;
  void *v58;
  objc_super v60;

  v4 = a4;
  v60.receiver = self;
  v60.super_class = (Class)PKEducationPhone;
  v5 = -[PKEducationPhone initWithFrame:](&v60, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    p_screenSize = &v5->_screenSize;
    PKScreenSize();
    *(_QWORD *)&p_screenSize->width = v8;
    v6->_screenSize.height = v9;
    v6->_screenType = PKUIGetMinScreenType();
    v6->_hasPearl = PKPearlIsAvailable();
    v10 = objc_alloc_init(PKPhoneHeroView);
    phoneBackgroundView = v6->_phoneBackgroundView;
    v6->_phoneBackgroundView = v10;

    -[PKEducationPhone addSubview:](v6, "addSubview:", v6->_phoneBackgroundView);
    v12 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    cardImageView = v6->_cardImageView;
    v6->_cardImageView = v12;

    -[UIImageView setContentMode:](v6->_cardImageView, "setContentMode:", 1);
    -[PKEducationPhone addSubview:](v6, "addSubview:", v6->_cardImageView);
    if ((v4 & 1) == 0)
    {
      v14 = objc_alloc_init(PKPaymentSetupInitialCardEducationIconsView);
      iconsView = v6->_iconsView;
      v6->_iconsView = v14;

      -[PKEducationPhone addSubview:](v6, "addSubview:", v6->_iconsView);
    }
    v16 = objc_alloc(MEMORY[0x1E0DC3890]);
    PKUIImageNamed(CFSTR("CardStack_Illustration"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "initWithImage:", v17);
    walletImageView = v6->_walletImageView;
    v6->_walletImageView = (UIImageView *)v18;

    -[UIImageView setContentMode:](v6->_walletImageView, "setContentMode:", 1);
    -[PKEducationPhone addSubview:](v6, "addSubview:", v6->_walletImageView);
    v20 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    homeButtonView = v6->_homeButtonView;
    v6->_homeButtonView = v20;

    v22 = v6->_homeButtonView;
    if (v6->_hasPearl)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v22, "setBackgroundColor:", v23);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v22, "setBackgroundColor:", v24);

      -[UIView setAlpha:](v6->_homeButtonView, "setAlpha:", 0.4);
    }
    -[PKEducationPhone addSubview:](v6, "addSubview:", v6->_homeButtonView);
    if (!v6->_hasPearl)
    {
      v25 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      homeButtonOutlineView = v6->_homeButtonOutlineView;
      v6->_homeButtonOutlineView = v25;

      -[UIView layer](v6->_homeButtonOutlineView, "layer");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setBorderWidth:", 2.0);

      -[PKEducationPhone addSubview:](v6, "addSubview:", v6->_homeButtonOutlineView);
      -[PKEducationPhone _setHomeButtonOutlineColor](v6, "_setHomeButtonOutlineColor");
    }
    v28 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    biometricsImageView = v6->_biometricsImageView;
    v6->_biometricsImageView = v28;

    -[UIImageView setContentMode:](v6->_biometricsImageView, "setContentMode:", 1);
    if (v6->_hasPearl)
      v30 = CFSTR("PearlIDIcon");
    else
      v30 = CFSTR("TouchIDIcon");
    v31 = v30;
    if ((v4 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@Barcode"), v31);
      v32 = objc_claimAutoreleasedReturnValue();

      v31 = (__CFString *)v32;
    }
    PKPassKitUIBundle();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "URLForResource:withExtension:", v31, CFSTR("pdf"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = v6->_biometricsImageView;
    v36 = PKUIScreenScale();
    PKUIImageFromPDF(v34, 40.0, 40.0, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v35, "setImage:", v37);

    -[PKEducationPhone addSubview:](v6, "addSubview:", v6->_biometricsImageView);
    if (v6->_hasPearl)
    {
      v38 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
      powerIndicatorView = v6->_powerIndicatorView;
      v6->_powerIndicatorView = v38;

      -[UIImageView setContentMode:](v6->_powerIndicatorView, "setContentMode:", 1);
      PKPassKitUIBundle();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "URLForResource:withExtension:", CFSTR("Education_Power_Button"), CFSTR("pdf"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = PKUIScreenScale();
      PKUIImageFromPDF(v41, 20.0, 40.0, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v6->_powerIndicatorView;
      objc_msgSend(v43, "imageWithRenderingMode:", 2);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](v44, "setImage:", v45);

      v46 = v6->_powerIndicatorView;
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setTintColor:](v46, "setTintColor:", v47);

      -[UIImageView setAlpha:](v6->_powerIndicatorView, "setAlpha:", 0.4);
      -[UIImageView layer](v6->_powerIndicatorView, "layer");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setAnchorPoint:", 0.0, 0.5);

      -[PKEducationPhone addSubview:](v6, "addSubview:", v6->_powerIndicatorView);
      v49 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
      powerArrowImageView = v6->_powerArrowImageView;
      v6->_powerArrowImageView = v49;

      PKPassKitUIBundle();
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "URLForResource:withExtension:", CFSTR("Education_Power_Arrow"), CFSTR("pdf"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      v53 = PKUIScreenScale();
      PKUIImageFromPDF(v52, 40.0, 40.0, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v6->_powerArrowImageView;
      objc_msgSend(v54, "imageWithRenderingMode:", 2);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](v55, "setImage:", v56);

      v57 = v6->_powerArrowImageView;
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setTintColor:](v57, "setTintColor:", v58);

      -[PKEducationPhone addSubview:](v6, "addSubview:", v6->_powerArrowImageView);
    }

  }
  return v6;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  unint64_t screenType;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  width = a3.width;
  screenType = self->_screenType;
  if (screenType > 0x11)
    v6 = 0.3;
  else
    v6 = dbl_19DF148D8[screenType];
  v7 = v6 * self->_screenSize.width / (self->_screenSize.width / self->_screenSize.height);
  if (self->_hasPearl)
    v8 = 0.0;
  else
    v8 = 45.0;
  -[PKEducationPhone _topPadding](self, "_topPadding");
  v10 = v7 + v9;
  -[PKEducationPhone _deviceIconsPadding](self, "_deviceIconsPadding");
  v12 = v8 + v10 + v11 + 34.0;
  v13 = width;
  result.height = v12;
  result.width = v13;
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
  double v11;
  double v12;
  double v13;
  double v14;
  PKPaymentSetupInitialCardEducationIconsView *iconsView;
  double v16;
  double v17;
  double MaxY;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double MinY;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double width;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  CGFloat v53;
  double v54;
  double v55;
  double v56;
  double v57;
  CGFloat v58;
  CGFloat v59;
  objc_super v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;

  v60.receiver = self;
  v60.super_class = (Class)PKEducationPhone;
  -[PKEducationPhone layoutSubviews](&v60, sel_layoutSubviews);
  -[PKEducationPhone bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[PKEducationPhone _topPadding](self, "_topPadding");
  v8 = v7;
  v9 = v6 - v7 + -34.0;
  v10 = v9 + -45.0;
  if (self->_hasPearl)
    v10 = v9;
  -[PKPhoneHeroView sizeThatFits:](self->_phoneBackgroundView, "sizeThatFits:", v4, v10);
  v12 = v11;
  v14 = v13;
  iconsView = self->_iconsView;
  v16 = v4 - v11;
  v17 = v16 * 0.5;
  if (iconsView)
  {
    -[PKPaymentSetupInitialCardEducationIconsView setFrame:](iconsView, "setFrame:", v16 * 0.5, v8, v12, 34.0);
    v61.origin.x = v17;
    v61.origin.y = v8;
    v61.size.width = v12;
    v61.size.height = 34.0;
    MaxY = CGRectGetMaxY(v61);
    -[PKEducationPhone _deviceIconsPadding](self, "_deviceIconsPadding");
    v8 = MaxY + v19;
  }
  v59 = v8;
  -[PKPhoneHeroView setFrame:](self->_phoneBackgroundView, "setFrame:", v17, v8, v12, v14);
  -[PKPhoneHeroView deviceCornerRadius](self->_phoneBackgroundView, "deviceCornerRadius");
  v21 = v20;
  -[UIImageView image](self->_cardImageView, "image");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "size");
  PKSizeAspectFit();
  PKSizeRoundToPixel();
  v24 = v23;
  v26 = v25;

  v58 = v14;
  v27 = v17;
  v28 = (v4 - v24) * 0.5;
  v29 = v8 + v21;
  -[UIImageView setFrame:](self->_cardImageView, "setFrame:", v28, v29, v24, v26);
  PKFloatRoundToPixel();
  v31 = v30;
  v55 = v26;
  v56 = v4;
  v32 = (v4 - v30) * 0.5;
  v62.origin.x = v28;
  v54 = v29;
  v62.origin.y = v29;
  v62.size.width = v24;
  v62.size.height = v26;
  v33 = v12;
  -[UIImageView setFrame:](self->_biometricsImageView, "setFrame:", v32, CGRectGetMaxY(v62) + 20.0, v31, v31);
  PKFloatRoundToPixel();
  v35 = v34;
  v63.origin.x = v27;
  v63.origin.y = v59;
  v63.size.width = v12;
  v63.size.height = v58;
  v36 = CGRectGetMaxY(v63);
  MinY = v36;
  v57 = v35;
  if (self->_hasPearl)
  {
    v38 = v12 * 0.5;
    PKFloatRoundToPixel();
    v39 = (v56 - v12 * 0.5) * 0.5;
    v41 = MinY - v40 - v35;
    v42 = v40 * 0.5;
  }
  else
  {
    v39 = (v56 + -35.0) * 0.5;
    v41 = v36 + 10.0;
    v38 = 35.0;
    v64.origin.x = v39;
    v64.origin.y = MinY + 10.0;
    v64.size.width = 35.0;
    v64.size.height = 35.0;
    v65 = CGRectInset(v64, 4.0, 4.0);
    width = v65.size.width;
    -[UIView setFrame:](self->_homeButtonOutlineView, "setFrame:", v65.origin.x, v65.origin.y);
    -[UIView layer](self->_homeButtonOutlineView, "layer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setCornerRadius:", width * 0.5);

    v42 = 17.5;
  }
  -[UIView setFrame:](self->_homeButtonView, "setFrame:", v39, v41, v38);
  -[UIView layer](self->_homeButtonView, "layer");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setCornerRadius:", v42);

  -[UIImageView image](self->_walletImageView, "image");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "size");
  v48 = v47;
  v50 = v49;

  v51 = v33 / (v48 / v50);
  if (self->_hasPearl)
  {
    -[UIView frame](self->_homeButtonView, "frame");
    MinY = CGRectGetMinY(v66);
  }
  -[UIImageView setFrame:](self->_walletImageView, "setFrame:", v27, MinY - v51 - v57, v33, v51);
  if (self->_hasPearl)
  {
    v52 = v29 + (v55 + -30.0) * 0.5;
    v67.origin.x = v27;
    v67.origin.y = v59;
    v67.size.width = v33;
    v67.size.height = v58;
    v53 = CGRectGetMaxX(v67) + 5.0;
    -[UIImageView setFrame:](self->_powerIndicatorView, "setFrame:", v53, v52, 5.0, 30.0);
    v68.size.width = 5.0;
    v68.size.height = 30.0;
    v68.origin.x = v53;
    v68.origin.y = v54 + (v55 + -30.0) * 0.5;
    -[UIImageView setFrame:](self->_powerArrowImageView, "setFrame:", CGRectGetMaxX(v68) + 5.0, v52, 35.0, 30.0);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKEducationPhone;
  -[PKEducationPhone traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[PKEducationPhone _setHomeButtonOutlineColor](self, "_setHomeButtonOutlineColor");
}

- (void)setPassImage:(id)a3
{
  -[UIImageView setImage:](self->_cardImageView, "setImage:", a3);
  -[PKEducationPhone setNeedsLayout](self, "setNeedsLayout");
}

- (void)startAnimation
{
  if (!self->_isAnimating)
  {
    self->_isAnimating = 1;
    if (self->_hasPearl)
      -[PKEducationPhone _startPowerIndicatorAnimation](self, "_startPowerIndicatorAnimation");
  }
}

- (void)_setHomeButtonOutlineColor
{
  void *v2;
  PKEducationPhone *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  if (self->_homeButtonOutlineView)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46__PKEducationPhone__setHomeButtonOutlineColor__block_invoke;
    v7[3] = &unk_1E3E612E8;
    v7[4] = self;
    v2 = (void *)MEMORY[0x1E0DC3E88];
    v3 = self;
    objc_msgSend(v2, "currentTraitCollection");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0DC3E88];
    -[PKEducationPhone traitCollection](v3, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setCurrentTraitCollection:", v5);
    __46__PKEducationPhone__setHomeButtonOutlineColor__block_invoke((uint64_t)v7);
    objc_msgSend(MEMORY[0x1E0DC3E88], "setCurrentTraitCollection:", v6);

  }
}

void __46__PKEducationPhone__setHomeButtonOutlineColor__block_invoke(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "setBorderColor:", objc_msgSend(v1, "CGColor"));

}

- (double)_topPadding
{
  unint64_t screenType;
  double result;

  screenType = self->_screenType;
  result = 10.0;
  if (screenType <= 0x11)
    return dbl_19DF14968[screenType];
  return result;
}

- (double)_deviceIconsPadding
{
  unint64_t screenType;
  double result;

  screenType = self->_screenType;
  result = 16.0;
  if (screenType <= 0x11)
    return dbl_19DF149F8[screenType];
  return result;
}

- (void)_startPowerIndicatorAnimation
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  _QWORD v21[2];
  void *v22;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CD3040];
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3040]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v4;
  v5 = *MEMORY[0x1E0CD3050];
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v6;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v7;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD2798], "animation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setKeyPath:", CFSTR("position.x"));
  objc_msgSend(v10, "setValues:", &unk_1E3FAE650);
  objc_msgSend(v10, "setKeyTimes:", &unk_1E3FAE638);
  objc_msgSend(v10, "setDuration:", 1.0);
  objc_msgSend(v10, "setAdditive:", 1);
  objc_msgSend(v10, "setTimingFunctions:", v9);
  objc_msgSend(MEMORY[0x1E0CD2700], "animation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAnimations:", v12);

  objc_msgSend(v11, "setDuration:", 3.0);
  LODWORD(v13) = 2139095039;
  objc_msgSend(v11, "setRepeatCount:", v13);
  -[UIImageView layer](self->_powerArrowImageView, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAnimation:forKey:", v11, CFSTR("double-tap"));

  objc_msgSend(MEMORY[0x1E0CD2798], "animation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setKeyPath:", CFSTR("transform.scale.x"));
  objc_msgSend(v15, "setValues:", &unk_1E3FAE668);
  objc_msgSend(v15, "setKeyTimes:", &unk_1E3FAE638);
  objc_msgSend(v15, "setDuration:", 1.0);
  objc_msgSend(v15, "setTimingFunctions:", v9);
  objc_msgSend(MEMORY[0x1E0CD2798], "animation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setKeyPath:", CFSTR("opacity"));
  objc_msgSend(v16, "setValues:", &unk_1E3FAE680);
  objc_msgSend(v16, "setKeyTimes:", &unk_1E3FAE638);
  objc_msgSend(v16, "setDuration:", 1.0);
  objc_msgSend(v16, "setTimingFunctions:", v9);
  objc_msgSend(MEMORY[0x1E0CD2700], "animation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = v15;
  v21[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAnimations:", v18);

  objc_msgSend(v17, "setDuration:", 3.0);
  LODWORD(v19) = 2139095039;
  objc_msgSend(v17, "setRepeatCount:", v19);
  -[UIImageView layer](self->_powerIndicatorView, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addAnimation:forKey:", v17, CFSTR("power-indicator"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerArrowImageView, 0);
  objc_storeStrong((id *)&self->_powerIndicatorView, 0);
  objc_storeStrong((id *)&self->_biometricsImageView, 0);
  objc_storeStrong((id *)&self->_cardImageView, 0);
  objc_storeStrong((id *)&self->_walletImageView, 0);
  objc_storeStrong((id *)&self->_homeButtonOutlineView, 0);
  objc_storeStrong((id *)&self->_homeButtonView, 0);
  objc_storeStrong((id *)&self->_iconsView, 0);
  objc_storeStrong((id *)&self->_phoneBackgroundView, 0);
}

@end
