@implementation SKUIRedeemITunesPassLockup

- (SKUIRedeemITunesPassLockup)initWithITunesPassConfiguration:(id)a3 clientContext:(id)a4
{
  id v7;
  id v8;
  SKUIRedeemITunesPassLockup *v9;
  SKUIRedeemITunesPassLockup *v10;
  UILabel *v11;
  UILabel *descriptionLabel;
  UILabel *v13;
  void *v14;
  UIView *v15;
  UIView *horizontalSeparatorView;
  UIView *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  UIImageView *iconImageView;
  UILabel *v24;
  UILabel *titleLabel;
  UILabel *v26;
  void *v27;
  UILabel *v28;
  void *v29;
  UILabel *v30;
  void *v31;
  objc_super v33;

  v7 = a3;
  v8 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIRedeemITunesPassLockup initWithITunesPassConfiguration:clientContext:].cold.1();
  }
  v33.receiver = self;
  v33.super_class = (Class)SKUIRedeemITunesPassLockup;
  v9 = -[SKUIRedeemITunesPassLockup init](&v33, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientContext, a4);
    objc_storeStrong((id *)&v10->_configuration, a3);
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    descriptionLabel = v10->_descriptionLabel;
    v10->_descriptionLabel = v11;

    v13 = v10->_descriptionLabel;
    -[SKUIRedeemITunesPassLockup _attributedDescriptionString](v10, "_attributedDescriptionString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](v13, "setAttributedText:", v14);

    -[UILabel setNumberOfLines:](v10->_descriptionLabel, "setNumberOfLines:", 0);
    -[SKUIRedeemITunesPassLockup addSubview:](v10, "addSubview:", v10->_descriptionLabel);
    v15 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    horizontalSeparatorView = v10->_horizontalSeparatorView;
    v10->_horizontalSeparatorView = v15;

    v17 = v10->_horizontalSeparatorView;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v17, "setBackgroundColor:", v18);

    -[SKUIRedeemITunesPassLockup addSubview:](v10, "addSubview:", v10->_horizontalSeparatorView);
    v19 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "scale");
    objc_msgSend(v19, "_applicationIconImageForBundleIdentifier:format:scale:", CFSTR("com.apple.Passbook"), 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v21);
      iconImageView = v10->_iconImageView;
      v10->_iconImageView = (UIImageView *)v22;

      -[SKUIRedeemITunesPassLockup addSubview:](v10, "addSubview:", v10->_iconImageView);
    }
    v24 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v10->_titleLabel;
    v10->_titleLabel = v24;

    v26 = v10->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v26, "setFont:", v27);

    v28 = v10->_titleLabel;
    objc_msgSend(v7, "lockupTitle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v28, "setText:", v29);

    v30 = v10->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v30, "setTextColor:", v31);

    -[SKUIRedeemITunesPassLockup addSubview:](v10, "addSubview:", v10->_titleLabel);
  }

  return v10;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  float v7;
  CGFloat v8;
  CGFloat v9;
  void *v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGRect v25;
  CGRect v26;

  -[SKUIRedeemITunesPassLockup bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[UIImageView frame](self->_iconImageView, "frame");
  v7 = (v6 + -55.0) * 0.5;
  v8 = floorf(v7);
  -[UIImageView setFrame:](self->_iconImageView, "setFrame:", 0.0, v8, 55.0, 55.0);
  -[UIView frame](self->_horizontalSeparatorView, "frame");
  v25.origin.x = 0.0;
  v25.origin.y = v8;
  v25.size.width = 55.0;
  v25.size.height = 55.0;
  v9 = CGRectGetMaxX(v25) + 15.0;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scale");
  v12 = 1.0 / v11;

  -[UIView setFrame:](self->_horizontalSeparatorView, "setFrame:", v9, v8, v12, 55.0);
  v13 = v9 + 15.0;
  v14 = v4 - (v9 + 15.0);
  -[UILabel frame](self->_titleLabel, "frame");
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v14, 1.79769313e308);
  v16 = v15;
  v18 = v17;
  -[UILabel frame](self->_descriptionLabel, "frame");
  -[UILabel sizeThatFits:](self->_descriptionLabel, "sizeThatFits:", v14, 1.79769313e308);
  v20 = v19;
  v22 = v21;
  *(float *)&v19 = (v6 - (v18 + 4.0 + v21)) * 0.5;
  v23 = floorf(*(float *)&v19);
  v26.origin.x = v13;
  v26.origin.y = v23;
  v26.size.width = v16;
  v26.size.height = v18;
  v24 = CGRectGetMaxY(v26) + 4.0;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v13, v23, v16, v18);
  -[UILabel setFrame:](self->_descriptionLabel, "setFrame:", v13, v24, v20, v22);
}

- (void)setHighlighted:(BOOL)a3
{
  UILabel *descriptionLabel;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKUIRedeemITunesPassLockup;
  -[SKUIRedeemITunesPassLockup setHighlighted:](&v6, sel_setHighlighted_, a3);
  descriptionLabel = self->_descriptionLabel;
  -[SKUIRedeemITunesPassLockup _attributedDescriptionString](self, "_attributedDescriptionString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](descriptionLabel, "setAttributedText:", v5);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  width = a3.width;
  v5 = a3.width + -55.0 + -30.0;
  -[UILabel sizeThatFits:](self->_descriptionLabel, "sizeThatFits:", v5, 1.79769313e308);
  v7 = v6;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v5, 1.79769313e308);
  v9 = fmax(v7 + 4.0 + v8, 55.0);
  v10 = width;
  result.height = v9;
  result.width = v10;
  return result;
}

- (id)_attributedDescriptionString
{
  uint64_t v3;
  SKUIClientContext *clientContext;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v22;
  void *v23;
  void *v24;

  -[SKUIITunesPassConfiguration lockupDescription](self->_configuration, "lockupDescription");
  v3 = objc_claimAutoreleasedReturnValue();
  -[SKUIITunesPassConfiguration lockupLearnMoreLinkTitle](self->_configuration, "lockupLearnMoreLinkTitle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  clientContext = self->_clientContext;
  if (clientContext)
    -[SKUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", CFSTR("ITUNES_PASS_EXPLANATION_LEARN_MORE_FORMAT"), CFSTR("Redeem"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("ITUNES_PASS_EXPLANATION_LEARN_MORE_FORMAT"), 0, CFSTR("Redeem"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v23, CFSTR("%@%@"), 0, v3, v24);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v5);
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 11.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "setLineHeightMultiple:", 0.75);
  objc_msgSend(v9, "setMinimumLineHeight:", 15.0);
  objc_msgSend(v6, "addAttribute:value:range:", *MEMORY[0x1E0DC1178], v9, 0, objc_msgSend(v5, "length"));
  v22 = (void *)v3;
  v10 = objc_msgSend(v5, "rangeOfString:", v3);
  v12 = v11;
  v13 = *MEMORY[0x1E0DC1138];
  objc_msgSend(v6, "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v7, v10, v11);
  v14 = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.600000024);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAttribute:value:range:", v14, v15, v10, v12);

  v16 = objc_msgSend(v5, "rangeOfString:", v24);
  v18 = v17;
  objc_msgSend(v6, "addAttribute:value:range:", v13, v7, v16, v17);
  -[SKUIRedeemITunesPassLockup tintColor](self, "tintColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SKUIRedeemITunesPassLockup isHighlighted](self, "isHighlighted"))
  {
    objc_msgSend(v19, "colorWithAlphaComponent:", 0.2);
    v20 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v20;
  }
  objc_msgSend(v6, "addAttribute:value:range:", v14, v19, v16, v18);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_horizontalSeparatorView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithITunesPassConfiguration:clientContext:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIRedeemITunesPassLockup initWithITunesPassConfiguration:clientContext:]";
}

@end
