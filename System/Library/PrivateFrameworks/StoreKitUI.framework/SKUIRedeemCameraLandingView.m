@implementation SKUIRedeemCameraLandingView

- (SKUIRedeemCameraLandingView)initWithClientContext:(id)a3
{
  id v4;
  SKUIRedeemCameraLandingView *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  UIImageView *imageView;
  UILabel *v11;
  UILabel *headerLabel;
  UILabel *v13;
  void *v14;
  UILabel *v15;
  void *v16;
  UILabel *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  int v21;
  UILabel *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  void *v26;
  UILabel *v27;
  UILabel *bodyLabel;
  UILabel *v29;
  const __CFString *v30;
  void *v31;
  UILabel *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  double v36;
  void *v37;
  UILabel *v38;
  void *v39;
  UILabel *v40;
  void *v41;
  uint64_t v42;
  UIButton *button;
  UIButton *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v50;
  objc_super v51;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIRedeemCameraLandingView initWithClientContext:].cold.1();
  }
  v51.receiver = self;
  v51.super_class = (Class)SKUIRedeemCameraLandingView;
  v5 = -[SKUIRedeemCameraLandingView init](&v51, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageNamed:inBundle:", CFSTR("RedemptionCardArtworkCobra"), v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v8);
    imageView = v5->_imageView;
    v5->_imageView = (UIImageView *)v9;

    -[SKUIRedeemCameraLandingView addSubview:](v5, "addSubview:", v5->_imageView);
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    headerLabel = v5->_headerLabel;
    v5->_headerLabel = v11;

    v13 = v5->_headerLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v13, "setBackgroundColor:", v14);

    v15 = v5->_headerLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 17.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v15, "setFont:", v16);

    -[UILabel setNumberOfLines:](v5->_headerLabel, "setNumberOfLines:", 0);
    v17 = v5->_headerLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v17, "setTextColor:", v18);

    -[UILabel setTextAlignment:](v5->_headerLabel, "setTextAlignment:", 1);
    v19 = (void *)MGCopyAnswer();
    v20 = +[SKUIRedeemViewControllerLegacy redeemRequiresNationalId:](SKUIRedeemViewControllerLegacy, "redeemRequiresNationalId:", v4);
    v21 = objc_msgSend(v19, "integerValue");
    v50 = (void *)v8;
    switch(v21)
    {
      case 1:
        v22 = v5->_headerLabel;
        v23 = CFSTR("CAMERA_REDEEM_PROMPT_IPHONE");
        v24 = CFSTR("CAMERA_REDEEM_PROMPT_IPHONE_CN");
        break;
      case 2:
        v22 = v5->_headerLabel;
        v23 = CFSTR("CAMERA_REDEEM_PROMPT_IPOD");
        v24 = CFSTR("CAMERA_REDEEM_PROMPT_IPOD_CN");
        break;
      case 3:
        v22 = v5->_headerLabel;
        v23 = CFSTR("CAMERA_REDEEM_PROMPT_IPAD");
        v24 = CFSTR("CAMERA_REDEEM_PROMPT_IPAD_CN");
        break;
      default:
LABEL_19:
        -[SKUIRedeemCameraLandingView addSubview:](v5, "addSubview:", v5->_headerLabel);
        v27 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        bodyLabel = v5->_bodyLabel;
        v5->_bodyLabel = v27;

        v29 = v5->_bodyLabel;
        if (v20)
          v30 = CFSTR("CAMERA_REDEEM_CARD_DESCRIPTION_CN");
        else
          v30 = CFSTR("CAMERA_REDEEM_CARD_DESCRIPTION");
        if (v4)
          objc_msgSend(v4, "localizedStringForKey:inTable:", v30, CFSTR("Redeem"));
        else
          +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", v30, 0, CFSTR("Redeem"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setText:](v29, "setText:", v31);

        v32 = v5->_bodyLabel;
        v33 = (void *)MEMORY[0x1E0DC1350];
        objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "userInterfaceIdiom");

        v36 = 14.0;
        if ((v35 & 0xFFFFFFFFFFFFFFFBLL) == 1)
          v36 = 16.0;
        objc_msgSend(v33, "systemFontOfSize:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v32, "setFont:", v37);

        v38 = v5->_bodyLabel;
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.600000024);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v38, "setTextColor:", v39);

        -[UILabel setNumberOfLines:](v5->_bodyLabel, "setNumberOfLines:", 0);
        -[UILabel setTextAlignment:](v5->_bodyLabel, "setTextAlignment:", 1);
        v40 = v5->_bodyLabel;
        objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v40, "setBackgroundColor:", v41);

        -[SKUIRedeemCameraLandingView addSubview:](v5, "addSubview:", v5->_bodyLabel);
        objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
        v42 = objc_claimAutoreleasedReturnValue();
        button = v5->_button;
        v5->_button = (UIButton *)v42;

        v44 = v5->_button;
        if (v4)
          objc_msgSend(v4, "localizedStringForKey:inTable:", CFSTR("CAMERA_REDEEM_USE_CAMERA_BUTTON"), CFSTR("Redeem"));
        else
          +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("CAMERA_REDEEM_USE_CAMERA_BUTTON"), 0, CFSTR("Redeem"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIButton setTitle:forState:](v44, "setTitle:forState:", v45, 0);

        -[UIButton titleLabel](v5->_button, "titleLabel");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 18.0);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setFont:", v47);

        -[UIButton sizeToFit](v5->_button, "sizeToFit");
        -[SKUIRedeemCameraLandingView addSubview:](v5, "addSubview:", v5->_button);
        objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIRedeemCameraLandingView setBackgroundColor:](v5, "setBackgroundColor:", v48);

        -[SKUIRedeemCameraLandingView setClipsToBounds:](v5, "setClipsToBounds:", 1);
        goto LABEL_31;
    }
    if (v20)
      v25 = v24;
    else
      v25 = v23;
    if (v4)
      objc_msgSend(v4, "localizedStringForKey:inTable:", v25, CFSTR("Redeem"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", v25, 0, CFSTR("Redeem"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v22, "setText:", v26);

    goto LABEL_19;
  }
LABEL_31:

  return v5;
}

- (UIImage)image
{
  return -[UIImageView image](self->_imageView, "image");
}

- (void)setSpacingStyle:(int64_t)a3
{
  if (self->_spacingStyle != a3)
  {
    self->_spacingStyle = a3;
    -[SKUIRedeemCameraLandingView setNeedsLayout](self, "setNeedsLayout");
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
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  double v29;
  float v30;
  CGFloat v31;
  float v32;
  CGFloat v33;
  double MaxY;
  void *v35;
  uint64_t v36;
  double v37;
  CGFloat v38;
  float v39;
  CGFloat v40;
  double v41;
  void *v42;
  uint64_t v43;
  double v44;
  CGFloat v45;
  float v46;
  CGFloat v47;
  double v48;
  void *v49;
  uint64_t v50;
  double v51;
  double v52;
  float v53;
  double v54;
  double v55;
  double v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  -[SKUIRedeemCameraLandingView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v7 = v3 + -30.0;
  -[UILabel frame](self->_headerLabel, "frame");
  -[UILabel sizeThatFits:](self->_headerLabel, "sizeThatFits:", v7, 1.79769313e308);
  v54 = v8;
  v10 = v9;
  -[UILabel frame](self->_bodyLabel, "frame");
  -[UILabel sizeThatFits:](self->_bodyLabel, "sizeThatFits:", v7, 1.79769313e308);
  v56 = v11;
  -[UIButton frame](self->_button, "frame");
  v55 = v12;
  v14 = v13;
  -[UIImageView frame](self->_imageView, "frame");
  v16 = v15;
  v18 = v17;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "userInterfaceIdiom");

  if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v21 = 55.0;
  }
  else
  {
    v21 = 25.0;
    if (self->_spacingStyle == 1)
      v21 = 15.0;
  }
  v22 = v10 + v18 + v21;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "userInterfaceIdiom");

  v25 = 11.0;
  if ((v24 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    v25 = 13.0;
    if (self->_spacingStyle == 1)
      v25 = 8.0;
  }
  v26 = v56 + v22 + v25;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "userInterfaceIdiom");

  if ((v28 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v29 = 36.0;
  }
  else
  {
    v29 = 16.0;
    if (self->_spacingStyle == 1)
      v29 = 7.0;
  }
  v30 = (v6 - (v14 + v26 + v29)) * 0.5;
  v31 = floorf(v30);
  v32 = (v4 - v16) * 0.5;
  v33 = floorf(v32);
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v33, v31, v16, v18);
  v57.origin.x = v33;
  v57.origin.y = v31;
  v57.size.width = v16;
  v57.size.height = v18;
  MaxY = CGRectGetMaxY(v57);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "userInterfaceIdiom");

  if ((v36 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v37 = 55.0;
  }
  else
  {
    v37 = 25.0;
    if (self->_spacingStyle == 1)
      v37 = 15.0;
  }
  v38 = MaxY + v37;
  v39 = (v4 - v54) * 0.5;
  v40 = floorf(v39);
  -[UILabel setFrame:](self->_headerLabel, "setFrame:", v40, v38, v54, v10);
  v58.origin.x = v40;
  v58.origin.y = v38;
  v58.size.width = v54;
  v58.size.height = v10;
  v41 = CGRectGetMaxY(v58);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "userInterfaceIdiom");

  v44 = 11.0;
  if ((v43 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    v44 = 13.0;
    if (self->_spacingStyle == 1)
      v44 = 8.0;
  }
  v45 = v41 + v44;
  v46 = (v4 - v7) * 0.5;
  v47 = floorf(v46);
  -[UILabel setFrame:](self->_bodyLabel, "setFrame:", v47, v45, v7, v56);
  v59.origin.x = v47;
  v59.origin.y = v45;
  v59.size.width = v7;
  v59.size.height = v56;
  v48 = CGRectGetMaxY(v59);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "userInterfaceIdiom");

  if ((v50 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v51 = 36.0;
  }
  else
  {
    v51 = 16.0;
    if (self->_spacingStyle == 1)
      v51 = 7.0;
  }
  v52 = v48 + v51;
  v53 = (v4 - v55) * 0.5;
  -[UIButton setFrame:](self->_button, "setFrame:", floorf(v53), v52);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  double v15;
  void *v16;
  uint64_t v17;
  double v18;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  CGSize result;

  width = a3.width;
  -[UILabel frame](self->_bodyLabel, "frame");
  -[UIButton frame](self->_button, "frame");
  v6 = v5;
  -[UILabel frame](self->_headerLabel, "frame");
  -[UIImageView frame](self->_imageView, "frame");
  v8 = v7;
  -[UILabel sizeThatFits:](self->_bodyLabel, "sizeThatFits:", width + -30.0, 1.79769313e308);
  v10 = v9;
  -[UILabel sizeThatFits:](self->_headerLabel, "sizeThatFits:", width + -30.0, 1.79769313e308);
  v12 = v11;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "userInterfaceIdiom");

  if ((v14 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v15 = 55.0;
  }
  else if (self->_spacingStyle == 1)
  {
    v15 = 15.0;
  }
  else
  {
    v15 = 25.0;
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "userInterfaceIdiom");

  v18 = 11.0;
  if ((v17 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    if (self->_spacingStyle == 1)
      v18 = 8.0;
    else
      v18 = 13.0;
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "userInterfaceIdiom");

  if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v21 = 36.0;
  }
  else
  {
    v21 = 16.0;
    if (self->_spacingStyle == 1)
      v21 = 7.0;
  }
  v22 = v6 + v10 + v12 + v8 + v15 + v18 + v21;
  v23 = width;
  result.height = v22;
  result.width = v23;
  return result;
}

- (UIButton)button
{
  return self->_button;
}

- (int64_t)spacingStyle
{
  return self->_spacingStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
}

- (void)initWithClientContext:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIRedeemCameraLandingView initWithClientContext:]";
}

@end
