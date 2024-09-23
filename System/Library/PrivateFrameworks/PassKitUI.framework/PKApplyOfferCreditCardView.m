@implementation PKApplyOfferCreditCardView

- (PKApplyOfferCreditCardView)initWithTermsLinkAction:(id)a3 actionTitle:(id)a4
{
  id v6;
  id v7;
  PKApplyOfferCreditCardView *v8;
  uint64_t v9;
  void *v10;
  UILabel *v11;
  UILabel *creditLimitTitleLabel;
  UILabel *v13;
  void *v14;
  UILabel *v15;
  UILabel *creditLimitLabel;
  UILabel *v17;
  void *v18;
  UILabel *v19;
  UILabel *aprForPurchaseTitleLabel;
  UILabel *v21;
  void *v22;
  UILabel *v23;
  UILabel *aprForPurchaseLabel;
  UILabel *v25;
  void *v26;
  UILabel *v27;
  UILabel *feeTitleLabel;
  UILabel *v29;
  void *v30;
  UILabel *v31;
  UILabel *feeLabel;
  UILabel *v33;
  void *v34;
  UIView *v35;
  id v36;
  UIView *dividerLeft;
  UIView *v38;
  void *v39;
  UIView *v40;
  UIView *dividerRight;
  UIView *v42;
  void *v43;
  UILabel *v44;
  UILabel *bodyLabel;
  UILabel *v46;
  void *v47;
  UILabel *v48;
  NSString *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  UIButton *termsLinkButton;
  void *v57;
  NSString *v58;
  objc_super v59;

  v6 = a3;
  v7 = a4;
  v59.receiver = self;
  v59.super_class = (Class)PKApplyOfferCreditCardView;
  v8 = -[PKApplyOfferCreditCardView init](&v59, sel_init);
  if (v8)
  {
    v58 = (NSString *)*MEMORY[0x1E0DC48D0];
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B10], (void *)*MEMORY[0x1E0DC48D0], 2, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    PKRoundedSystemFontOfSizeAndWeight(22.0, *MEMORY[0x1E0DC1448]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    creditLimitTitleLabel = v8->_creditLimitTitleLabel;
    v8->_creditLimitTitleLabel = v11;

    v13 = v8->_creditLimitTitleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v13, "setTextColor:", v14);

    -[UILabel setFont:](v8->_creditLimitTitleLabel, "setFont:", v9);
    -[UILabel setTextAlignment:](v8->_creditLimitTitleLabel, "setTextAlignment:", 1);
    -[PKApplyOfferCreditCardView addSubview:](v8, "addSubview:", v8->_creditLimitTitleLabel);
    v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    creditLimitLabel = v8->_creditLimitLabel;
    v8->_creditLimitLabel = v15;

    -[UILabel setFont:](v8->_creditLimitLabel, "setFont:", v10);
    v17 = v8->_creditLimitLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v17, "setTextColor:", v18);

    -[UILabel setTextAlignment:](v8->_creditLimitLabel, "setTextAlignment:", 1);
    -[UILabel setAdjustsFontSizeToFitWidth:](v8->_creditLimitLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[PKApplyOfferCreditCardView addSubview:](v8, "addSubview:", v8->_creditLimitLabel);
    v19 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    aprForPurchaseTitleLabel = v8->_aprForPurchaseTitleLabel;
    v8->_aprForPurchaseTitleLabel = v19;

    v57 = (void *)v9;
    -[UILabel setFont:](v8->_aprForPurchaseTitleLabel, "setFont:", v9);
    v21 = v8->_aprForPurchaseTitleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v21, "setTextColor:", v22);

    -[UILabel setTextAlignment:](v8->_aprForPurchaseTitleLabel, "setTextAlignment:", 1);
    -[PKApplyOfferCreditCardView addSubview:](v8, "addSubview:", v8->_aprForPurchaseTitleLabel);
    v23 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    aprForPurchaseLabel = v8->_aprForPurchaseLabel;
    v8->_aprForPurchaseLabel = v23;

    -[UILabel setFont:](v8->_aprForPurchaseLabel, "setFont:", v10);
    v25 = v8->_aprForPurchaseLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v25, "setTextColor:", v26);

    -[UILabel setTextAlignment:](v8->_aprForPurchaseLabel, "setTextAlignment:", 1);
    -[UILabel setAdjustsFontSizeToFitWidth:](v8->_aprForPurchaseLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[PKApplyOfferCreditCardView addSubview:](v8, "addSubview:", v8->_aprForPurchaseLabel);
    v27 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    feeTitleLabel = v8->_feeTitleLabel;
    v8->_feeTitleLabel = v27;

    -[UILabel setTextAlignment:](v8->_feeTitleLabel, "setTextAlignment:", 1);
    v29 = v8->_feeTitleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v29, "setTextColor:", v30);

    -[UILabel setFont:](v8->_feeTitleLabel, "setFont:", v9);
    -[PKApplyOfferCreditCardView addSubview:](v8, "addSubview:", v8->_feeTitleLabel);
    v31 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    feeLabel = v8->_feeLabel;
    v8->_feeLabel = v31;

    -[UILabel setTextAlignment:](v8->_feeLabel, "setTextAlignment:", 1);
    -[UILabel setFont:](v8->_feeLabel, "setFont:", v10);
    v33 = v8->_feeLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v33, "setTextColor:", v34);

    -[UILabel setAdjustsFontSizeToFitWidth:](v8->_feeLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[PKApplyOfferCreditCardView addSubview:](v8, "addSubview:", v8->_feeLabel);
    v35 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v36 = v6;
    dividerLeft = v8->_dividerLeft;
    v8->_dividerLeft = v35;

    v38 = v8->_dividerLeft;
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v38, "setBackgroundColor:", v39);

    -[PKApplyOfferCreditCardView addSubview:](v8, "addSubview:", v8->_dividerLeft);
    v40 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    dividerRight = v8->_dividerRight;
    v8->_dividerRight = v40;

    v42 = v8->_dividerRight;
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v42, "setBackgroundColor:", v43);

    -[PKApplyOfferCreditCardView addSubview:](v8, "addSubview:", v8->_dividerRight);
    v44 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    bodyLabel = v8->_bodyLabel;
    v8->_bodyLabel = v44;

    -[UILabel setTextAlignment:](v8->_bodyLabel, "setTextAlignment:", 1);
    v46 = v8->_bodyLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v46, "setTextColor:", v47);

    -[UILabel setNumberOfLines:](v8->_bodyLabel, "setNumberOfLines:", 0);
    v48 = v8->_bodyLabel;
    v49 = (NSString *)*MEMORY[0x1E0DC4A88];
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], v58);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v48, "setFont:", v50);

    -[PKApplyOfferCreditCardView addSubview:](v8, "addSubview:", v8->_bodyLabel);
    v51 = (void *)MEMORY[0x1E0DC3520];
    PKFontForDefaultDesign(v49, v58);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "pkui_plainConfigurationWithTitle:font:", v7, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v36;
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v53, v36);
    v54 = objc_claimAutoreleasedReturnValue();
    termsLinkButton = v8->_termsLinkButton;
    v8->_termsLinkButton = (UIButton *)v54;

    -[UIButton setConfigurationUpdateHandler:](v8->_termsLinkButton, "setConfigurationUpdateHandler:", &__block_literal_global_222);
    -[PKApplyOfferCreditCardView addSubview:](v8, "addSubview:", v8->_termsLinkButton);

  }
  return v8;
}

void __66__PKApplyOfferCreditCardView_initWithTermsLinkAction_actionTitle___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  objc_msgSend(v2, "setExclusiveTouch:", 1);
  objc_msgSend(v2, "titleLabel");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setTextAlignment:", 1);
}

- (void)layoutSubviews
{
  double x;
  double y;
  double Width;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  CGFloat v13;
  double MinY;
  double v15;
  double MaxY;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  double v35;
  objc_super v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v36.receiver = self;
  v36.super_class = (Class)PKApplyOfferCreditCardView;
  -[PKApplyOfferCreditCardView layoutSubviews](&v36, sel_layoutSubviews);
  -[PKApplyOfferCreditCardView bounds](self, "bounds");
  x = v37.origin.x;
  y = v37.origin.y;
  Width = CGRectGetWidth(v37);
  if (-[PKApplyOfferCreditCardView showSchumerBox](self, "showSchumerBox"))
  {
    PKFloatRoundToPixel();
    v7 = v6;
    -[UILabel sizeToFit](self->_creditLimitTitleLabel, "sizeToFit");
    -[UILabel frame](self->_creditLimitTitleLabel, "frame");
    -[UILabel setFrame:](self->_creditLimitTitleLabel, "setFrame:", x, y, v7 + -3.0);
    -[UILabel sizeToFit](self->_creditLimitLabel, "sizeToFit");
    -[UILabel frame](self->_creditLimitLabel, "frame");
    v9 = v8;
    -[UILabel frame](self->_creditLimitTitleLabel, "frame");
    -[UILabel setFrame:](self->_creditLimitLabel, "setFrame:", x, CGRectGetMaxY(v38) + 5.0, v7 + -3.0, v9);
    v10 = x + v7;
    PKFloatRoundToPixel();
    v34 = v11;
    -[UIView frame](self->_dividerLeft, "frame");
    v13 = v12;
    -[UILabel frame](self->_creditLimitTitleLabel, "frame");
    MinY = CGRectGetMinY(v39);
    v15 = PKUIPixelLength();
    -[UILabel frame](self->_creditLimitLabel, "frame");
    MaxY = CGRectGetMaxY(v40);
    v41.origin.x = v10;
    v41.origin.y = MinY;
    v41.size.width = v15;
    v41.size.height = v13;
    -[UIView setFrame:](self->_dividerLeft, "setFrame:", v10, MinY, v15, MaxY - CGRectGetMinY(v41));
    -[UILabel sizeToFit](self->_aprForPurchaseTitleLabel, "sizeToFit");
    -[UILabel frame](self->_aprForPurchaseTitleLabel, "frame");
    -[UILabel setFrame:](self->_aprForPurchaseTitleLabel, "setFrame:", v10 + 3.0, y, v34 + -6.0);
    -[UILabel sizeToFit](self->_aprForPurchaseLabel, "sizeToFit");
    -[UILabel frame](self->_aprForPurchaseLabel, "frame");
    v18 = v17;
    -[UILabel frame](self->_creditLimitTitleLabel, "frame");
    -[UILabel setFrame:](self->_aprForPurchaseLabel, "setFrame:", v10 + 3.0, CGRectGetMaxY(v42) + 5.0, v34 + -6.0, v18);
    v19 = v10 + v34;
    PKFloatRoundToPixel();
    v35 = v20;
    -[UIView frame](self->_dividerRight, "frame");
    v22 = v21;
    -[UILabel frame](self->_aprForPurchaseTitleLabel, "frame");
    v23 = CGRectGetMinY(v43);
    v24 = PKUIPixelLength();
    -[UILabel frame](self->_aprForPurchaseLabel, "frame");
    v25 = CGRectGetMaxY(v44);
    v45.origin.x = v19;
    v45.origin.y = v23;
    v45.size.width = v24;
    v45.size.height = v22;
    -[UIView setFrame:](self->_dividerRight, "setFrame:", v19, v23, v24, v25 - CGRectGetMinY(v45));
    -[UILabel sizeToFit](self->_feeTitleLabel, "sizeToFit");
    -[UILabel frame](self->_feeTitleLabel, "frame");
    v26 = v19 + 3.0;
    -[UILabel setFrame:](self->_feeTitleLabel, "setFrame:", v26, y, v35 + -3.0);
    -[UILabel sizeToFit](self->_feeLabel, "sizeToFit");
    -[UILabel frame](self->_feeLabel, "frame");
    v28 = v27;
    -[UILabel frame](self->_feeTitleLabel, "frame");
    -[UILabel setFrame:](self->_feeLabel, "setFrame:", v26, CGRectGetMaxY(v46) + 5.0, v35 + -3.0, v28);
  }
  -[UILabel sizeToFit](self->_bodyLabel, "sizeToFit");
  -[UILabel frame](self->_bodyLabel, "frame");
  v30 = v29;
  -[UILabel frame](self->_aprForPurchaseLabel, "frame");
  v31 = CGRectGetMaxY(v47) + 10.0;
  -[UILabel setFrame:](self->_bodyLabel, "setFrame:", x, v31, Width, v30);
  -[UIButton sizeThatFits:](self->_termsLinkButton, "sizeThatFits:", Width, 1.79769313e308);
  v33 = v32;
  v48.origin.x = x;
  v48.origin.y = v31;
  v48.size.width = Width;
  v48.size.height = v30;
  -[UIButton setFrame:](self->_termsLinkButton, "setFrame:", x, CGRectGetMaxY(v48) + 10.0, Width, v33);
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
  double v13;
  CGSize result;

  width = a3.width;
  -[UILabel sizeThatFits:](self->_bodyLabel, "sizeThatFits:", a3.width, 1.79769313e308);
  v6 = v5 + 0.0 + 10.0;
  -[UIButton sizeThatFits:](self->_termsLinkButton, "sizeThatFits:", width, 1.79769313e308);
  v8 = v6 + v7;
  if (-[PKApplyOfferCreditCardView showSchumerBox](self, "showSchumerBox"))
  {
    -[UILabel sizeThatFits:](self->_aprForPurchaseTitleLabel, "sizeThatFits:", width, 1.79769313e308);
    v10 = v8 + v9 + 5.0;
    -[UILabel sizeThatFits:](self->_aprForPurchaseLabel, "sizeThatFits:", width, 1.79769313e308);
    v8 = v10 + v11 + 10.0;
  }
  v12 = width;
  v13 = v8;
  result.height = v13;
  result.width = v12;
  return result;
}

- (BOOL)showSchumerBox
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[UILabel text](self->_creditLimitLabel, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = 1;
  }
  else
  {
    -[UILabel text](self->_feeLabel, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      v4 = 1;
    }
    else
    {
      -[UILabel text](self->_aprForPurchaseLabel, "text");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "length") != 0;

    }
  }

  return v4;
}

- (UILabel)creditLimitTitleLabel
{
  return self->_creditLimitTitleLabel;
}

- (void)setCreditLimitTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_creditLimitTitleLabel, a3);
}

- (UILabel)aprForPurchaseTitleLabel
{
  return self->_aprForPurchaseTitleLabel;
}

- (void)setAprForPurchaseTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_aprForPurchaseTitleLabel, a3);
}

- (UILabel)feeTitleLabel
{
  return self->_feeTitleLabel;
}

- (void)setFeeTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_feeTitleLabel, a3);
}

- (UILabel)creditLimitLabel
{
  return self->_creditLimitLabel;
}

- (void)setCreditLimitLabel:(id)a3
{
  objc_storeStrong((id *)&self->_creditLimitLabel, a3);
}

- (UILabel)aprForPurchaseLabel
{
  return self->_aprForPurchaseLabel;
}

- (void)setAprForPurchaseLabel:(id)a3
{
  objc_storeStrong((id *)&self->_aprForPurchaseLabel, a3);
}

- (UILabel)feeLabel
{
  return self->_feeLabel;
}

- (void)setFeeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_feeLabel, a3);
}

- (UILabel)bodyLabel
{
  return self->_bodyLabel;
}

- (void)setBodyLabel:(id)a3
{
  objc_storeStrong((id *)&self->_bodyLabel, a3);
}

- (UIButton)termsLinkButton
{
  return self->_termsLinkButton;
}

- (void)setTermsLinkButton:(id)a3
{
  objc_storeStrong((id *)&self->_termsLinkButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termsLinkButton, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_feeLabel, 0);
  objc_storeStrong((id *)&self->_aprForPurchaseLabel, 0);
  objc_storeStrong((id *)&self->_creditLimitLabel, 0);
  objc_storeStrong((id *)&self->_feeTitleLabel, 0);
  objc_storeStrong((id *)&self->_aprForPurchaseTitleLabel, 0);
  objc_storeStrong((id *)&self->_creditLimitTitleLabel, 0);
  objc_storeStrong((id *)&self->_dividerRight, 0);
  objc_storeStrong((id *)&self->_dividerLeft, 0);
}

@end
