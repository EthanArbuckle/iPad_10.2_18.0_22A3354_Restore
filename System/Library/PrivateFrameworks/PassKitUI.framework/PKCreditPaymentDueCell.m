@implementation PKCreditPaymentDueCell

- (PKCreditPaymentDueCell)initWithFrame:(CGRect)a3
{
  PKCreditPaymentDueCell *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKCreditPaymentDueCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v3->_isCompactUI = PKUIGetMinScreenWidthType() == 0;
    -[PKCreditPaymentDueCell setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67E48]);
    -[PKCreditPaymentDueCell createSubviews](v3, "createSubviews");
  }
  return v3;
}

- (void)createSubviews
{
  UILabel *v3;
  UILabel *paymentDueLabel;
  UILabel *v5;
  UILabel *dateLabel;
  UILabel *v7;
  UILabel *detailLabel;
  id v9;

  -[PKCreditPaymentDueCell contentView](self, "contentView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  paymentDueLabel = self->_paymentDueLabel;
  self->_paymentDueLabel = v3;

  -[UILabel setNumberOfLines:](self->_paymentDueLabel, "setNumberOfLines:", 2);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_paymentDueLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setAccessibilityIdentifier:](self->_paymentDueLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67C48]);
  objc_msgSend(v9, "addSubview:", self->_paymentDueLabel);
  v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  dateLabel = self->_dateLabel;
  self->_dateLabel = v5;

  -[UILabel setNumberOfLines:](self->_dateLabel, "setNumberOfLines:", 1);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_dateLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setAccessibilityIdentifier:](self->_dateLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
  objc_msgSend(v9, "addSubview:", self->_dateLabel);
  v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  detailLabel = self->_detailLabel;
  self->_detailLabel = v7;

  -[UILabel setNumberOfLines:](self->_detailLabel, "setNumberOfLines:", 0);
  -[UILabel setLineBreakMode:](self->_detailLabel, "setLineBreakMode:", 4);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_detailLabel, "setAdjustsFontSizeToFitWidth:", 0);
  -[UILabel setAccessibilityIdentifier:](self->_detailLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D680C8]);
  objc_msgSend(v9, "addSubview:", self->_detailLabel);
  objc_msgSend(v9, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67E48]);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKCreditPaymentDueCell;
  -[PKDashboardCollectionViewCell layoutSubviews](&v3, sel_layoutSubviews);
  -[PKCreditPaymentDueCell bounds](self, "bounds");
  -[PKCreditPaymentDueCell _layoutWithBounds:](self, "_layoutWithBounds:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  CGSize result;

  self->_isTemplateLayout = 1;
  -[PKCreditPaymentDueCell _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, 3.40282347e38);
  self->_isTemplateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  UILabel *paymentDueLabel;
  double v13;
  double v14;
  UILabel *dateLabel;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double height;
  double v22;
  CGFloat width;
  double v24;
  double v25;
  CGFloat x;
  CGFloat y;
  UILabel *detailLabel;
  _BOOL4 useAccessibilityLayout;
  double v30;
  PKContinuousButton *payButton;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGRect remainder;
  CGRect slice;
  CGSize result;
  CGRect v46;

  v4 = 12.0;
  if (self->_isCompactUI)
    v4 = 8.0;
  v5 = a3.origin.x + v4;
  v6 = a3.origin.y + 8.0;
  v7 = 16.0;
  if (!self->_isCompactUI)
    v7 = 24.0;
  v8 = a3.size.width - v7;
  v9 = a3.size.height + -16.0;
  -[PKCreditPaymentDueCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection", *(_QWORD *)&a3.size.width);
  memset(&slice, 0, sizeof(slice));
  remainder.origin.x = v5;
  remainder.origin.y = v6;
  remainder.size.width = v8;
  remainder.size.height = v9;
  -[UILabel sizeThatFits:](self->_paymentDueLabel, "sizeThatFits:", v8, v9);
  v11 = v10 + 0.0;
  v46.origin.x = v5;
  v46.origin.y = v6;
  v46.size.width = v8;
  v46.size.height = v9;
  v42 = v11;
  CGRectDivide(v46, &slice, &remainder, v11, CGRectMinYEdge);
  if (!self->_isTemplateLayout)
  {
    paymentDueLabel = self->_paymentDueLabel;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](paymentDueLabel, "setFrame:");
  }
  -[UILabel sizeThatFits:](self->_dateLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
  v14 = v13 + 0.0;
  CGRectDivide(remainder, &slice, &remainder, v13 + 0.0, CGRectMinYEdge);
  if (!self->_isTemplateLayout)
  {
    dateLabel = self->_dateLabel;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](dateLabel, "setFrame:");
  }
  -[UILabel sizeThatFits:](self->_detailLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
  v17 = v16;
  if (self->_usingCircleButton)
  {
    v18 = 80.0;
    if (!self->_isCompactUI)
      v18 = 90.0;
    v19 = 60.0;
    v20 = 64.0;
    if (!self->_isCompactUI)
      v19 = 64.0;
    if (!self->_useAccessibilityLayout)
    {
      v20 = 48.0;
      v18 = v19;
    }
    height = remainder.size.height;
    v22 = fmin(fmax(v20, remainder.size.height + -3.0 - v17), v18);
    width = remainder.size.width;
  }
  else
  {
    -[PKContinuousButton sizeThatFits:](self->_payButton, "sizeThatFits:", remainder.size.width, remainder.size.height);
    v22 = v24;
    width = remainder.size.width;
    height = remainder.size.height;
  }
  v25 = fmin(v17, height - v22 + -3.0);
  if (!self->_isTemplateLayout)
    v17 = v25;
  x = remainder.origin.x;
  y = remainder.origin.y;
  CGRectDivide(*(CGRect *)(&width - 2), &slice, &remainder, v17, CGRectMinYEdge);
  if (!self->_isTemplateLayout)
  {
    detailLabel = self->_detailLabel;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](detailLabel, "setFrame:");
  }
  useAccessibilityLayout = self->_useAccessibilityLayout;
  if (self->_usingCircleButton)
  {
    v30 = v22 + 3.0;
    CGRectDivide(remainder, &slice, &remainder, v22 + 3.0, CGRectMaxYEdge);
    if (useAccessibilityLayout)
    {
      if (!self->_isTemplateLayout)
      {
        payButton = self->_payButton;
LABEL_32:
        PKContentAlignmentMake();
        PKSizeAlignedInRect();
        goto LABEL_33;
      }
    }
    else if (!self->_isTemplateLayout)
    {
      payButton = self->_payButton;
      goto LABEL_32;
    }
  }
  else
  {
    CGRectDivide(remainder, &slice, &remainder, v22 + 3.0, CGRectMaxYEdge);
    if (!self->_isTemplateLayout)
    {
      payButton = self->_payButton;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      v30 = v22;
LABEL_33:
      v32 = v41;
      -[PKContinuousButton setFrame:](payButton, "setFrame:");
      goto LABEL_34;
    }
    v30 = v22;
  }
  v32 = v41;
LABEL_34:
  if (self->_fallbackButtonTitle)
  {
    -[PKContinuousButton titleLabel](self->_payButton, "titleLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "pkui_sizeThatFits:", v8, v9);
    v35 = v34;

    -[PKContinuousButton contentEdgeInsets](self->_payButton, "contentEdgeInsets");
    v37 = v36;
    -[PKContinuousButton contentEdgeInsets](self->_payButton, "contentEdgeInsets");
    if (v35 >= v8 - (v37 + v38))
      -[PKCreditPaymentDueCell setButtonTitle:](self, "setButtonTitle:", self->_fallbackButtonTitle);
  }
  v39 = v42 + 16.0 + v14 + v17 + 0.0 + 3.0 + v30;
  v40 = v32;
  result.height = v39;
  result.width = v40;
  return result;
}

- (void)setPaymentDueLabelText:(id)a3
{
  id v4;
  id v5;
  id v6;
  char v7;
  id v8;

  v4 = a3;
  -[UILabel text](self->_paymentDueLabel, "text");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v8 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = objc_msgSend(v5, "isEqualToString:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    -[UILabel setText:](self->_paymentDueLabel, "setText:", v8);
    -[PKCreditPaymentDueCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (NSString)paymentDueLabelText
{
  return -[UILabel text](self->_paymentDueLabel, "text");
}

- (void)setPaymentDueLabelFont:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[UILabel font](self->_paymentDueLabel, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = PKEqualObjects();

  if ((v5 & 1) == 0)
  {
    -[UILabel setFont:](self->_paymentDueLabel, "setFont:", v6);
    -[PKCreditPaymentDueCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (UIFont)paymentDueLabelFont
{
  return -[UILabel font](self->_paymentDueLabel, "font");
}

- (void)setPaymentDueLabelTextColor:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[UILabel textColor](self->_paymentDueLabel, "textColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = PKEqualObjects();

  if ((v5 & 1) == 0)
    -[UILabel setTextColor:](self->_paymentDueLabel, "setTextColor:", v6);

}

- (UIColor)paymentDueLabelTextColor
{
  return -[UILabel textColor](self->_paymentDueLabel, "textColor");
}

- (void)setDateLabelText:(id)a3
{
  id v4;
  id v5;
  id v6;
  char v7;
  id v8;

  v4 = a3;
  -[UILabel text](self->_dateLabel, "text");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v8 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = objc_msgSend(v5, "isEqualToString:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    -[UILabel setText:](self->_dateLabel, "setText:", v8);
    -[PKCreditPaymentDueCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (NSString)dateLabelText
{
  return -[UILabel text](self->_dateLabel, "text");
}

- (void)setDateLabelFont:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[UILabel font](self->_dateLabel, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = PKEqualObjects();

  if ((v5 & 1) == 0)
  {
    -[UILabel setFont:](self->_dateLabel, "setFont:", v6);
    -[PKCreditPaymentDueCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (UIFont)dateLabelFont
{
  return -[UILabel font](self->_dateLabel, "font");
}

- (void)setDateLabelTextColor:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[UILabel textColor](self->_dateLabel, "textColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = PKEqualObjects();

  if ((v5 & 1) == 0)
    -[UILabel setTextColor:](self->_dateLabel, "setTextColor:", v6);

}

- (UIColor)dateLabelTextColor
{
  return -[UILabel textColor](self->_dateLabel, "textColor");
}

- (void)setDetailLabelText:(id)a3
{
  id v4;
  id v5;
  id v6;
  char v7;
  id v8;

  v4 = a3;
  -[UILabel text](self->_detailLabel, "text");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v8 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = objc_msgSend(v5, "isEqualToString:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    -[UILabel setText:](self->_detailLabel, "setText:", v8);
    -[PKCreditPaymentDueCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (NSString)detailLabelText
{
  return -[UILabel text](self->_detailLabel, "text");
}

- (void)setDetailLabelFont:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[UILabel font](self->_detailLabel, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = PKEqualObjects();

  if ((v5 & 1) == 0)
  {
    -[UILabel setFont:](self->_detailLabel, "setFont:", v6);
    -[PKCreditPaymentDueCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (UIFont)detailLabelFont
{
  return -[UILabel font](self->_detailLabel, "font");
}

- (void)setDetailLabelTextColor:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[UILabel textColor](self->_detailLabel, "textColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = PKEqualObjects();

  if ((v5 & 1) == 0)
    -[UILabel setTextColor:](self->_detailLabel, "setTextColor:", v6);

}

- (UIColor)detailLabelTextColor
{
  return -[UILabel textColor](self->_detailLabel, "textColor");
}

- (void)setButtonTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  int v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v14;
  _BOOL8 v15;
  PKContinuousButton *v16;
  PKContinuousButton *payButton;
  PKContinuousButton *v19;
  PKContinuousButton *v20;
  PKContinuousButton *v21;
  PKContinuousButton *v22;
  UIImage *payButtonImage;
  id v24;

  v4 = a3;
  -[PKCreditPaymentDueCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKContinuousButton titleLabel](self->_payButton, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v7;
  v9 = v4;
  v24 = v9;
  if (v8 == v9)
  {

LABEL_7:
    if (!self->_payButtonImage)
      goto LABEL_31;
    goto LABEL_10;
  }
  if (!v9 || !v8)
  {

    goto LABEL_10;
  }
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
    goto LABEL_7;
LABEL_10:
  v11 = objc_msgSend(v8, "length");
  v12 = objc_msgSend(v24, "length");
  if (v11 <= 3 && v12 >= 4)
  {
    payButton = self->_payButton;
    if (payButton)
      -[PKContinuousButton removeFromSuperview](payButton, "removeFromSuperview");
    -[PKCreditPaymentDueCell _payButtonWithCircleLayout:](self, "_payButtonWithCircleLayout:", 0);
    v19 = (PKContinuousButton *)objc_claimAutoreleasedReturnValue();
    v20 = self->_payButton;
    self->_payButton = v19;

    objc_msgSend(v5, "addSubview:", self->_payButton);
    goto LABEL_29;
  }
  v14 = v12;
  v15 = v12 < 4;
  v16 = self->_payButton;
  if (v11 >= 4 && v14 <= 3)
  {
    if (v16)
      -[PKContinuousButton removeFromSuperview](v16, "removeFromSuperview", v15);
    v15 = 1;
LABEL_28:
    -[PKCreditPaymentDueCell _payButtonWithCircleLayout:](self, "_payButtonWithCircleLayout:", v15);
    v21 = (PKContinuousButton *)objc_claimAutoreleasedReturnValue();
    v22 = self->_payButton;
    self->_payButton = v21;

    objc_msgSend(v5, "addSubview:", self->_payButton);
    if (v14)
      goto LABEL_29;
LABEL_32:
    payButtonImage = self->_payButtonImage;
    goto LABEL_30;
  }
  if (!v16)
    goto LABEL_28;
  if (!v14)
    goto LABEL_32;
LABEL_29:
  payButtonImage = 0;
LABEL_30:
  -[PKCreditPaymentDueCell _updateButtonImage:](self, "_updateButtonImage:", payButtonImage);
  -[PKContinuousButton setTitle:forState:](self->_payButton, "setTitle:forState:", v24, 0);
  -[PKContinuousButton setAccessibilityIdentifier:](self->_payButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67EE8]);
  -[PKCreditPaymentDueCell setNeedsLayout](self, "setNeedsLayout");
LABEL_31:

}

- (void)setFallbackButtonTitle:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_fallbackButtonTitle, a3);
    -[PKCreditPaymentDueCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setPayButtonImage:(id)a3
{
  id v4;

  v4 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    -[PKCreditPaymentDueCell _updateButtonImage:](self, "_updateButtonImage:", v4);
    -[PKCreditPaymentDueCell setButtonTitle:](self, "setButtonTitle:", 0);
    -[PKCreditPaymentDueCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setPayButtonTintColor:(id)a3
{
  UIColor **p_payButtonTintColor;
  id v6;

  p_payButtonTintColor = &self->_payButtonTintColor;
  v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_payButtonTintColor, a3);
    -[PKContinuousButton setTintColor:](self->_payButton, "setTintColor:", *p_payButtonTintColor);
  }

}

- (void)setPayButtonTitleColor:(id)a3
{
  UIColor **p_payButtonTitleColor;
  void *v6;
  id v7;

  p_payButtonTitleColor = &self->_payButtonTitleColor;
  v7 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_payButtonTitleColor, a3);
    -[PKContinuousButton updateTitleColorWithColor:](self->_payButton, "updateTitleColorWithColor:", *p_payButtonTitleColor);
    -[PKContinuousButton imageView](self->_payButton, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTintColor:", *p_payButtonTitleColor);

  }
}

- (void)setPayButtonFont:(id)a3
{
  PKContinuousButton *payButton;
  id v4;
  id v5;

  payButton = self->_payButton;
  v4 = a3;
  -[PKContinuousButton titleLabel](payButton, "titleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

}

- (void)_updateButtonImage:(id)a3
{
  UIImage **p_payButtonImage;
  id v6;
  id v7;

  p_payButtonImage = &self->_payButtonImage;
  objc_storeStrong((id *)&self->_payButtonImage, a3);
  v6 = a3;
  -[PKContinuousButton updateWithImage:](self->_payButton, "updateWithImage:", *p_payButtonImage);
  -[PKContinuousButton setImageEdgeInsets:](self->_payButton, "setImageEdgeInsets:", 6.0, 6.0, 6.0, 6.0);
  -[PKContinuousButton imageView](self->_payButton, "imageView");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setContentMode:", 1);
  -[PKCreditPaymentDueCell setNeedsLayout](self, "setNeedsLayout");

}

- (id)_payButtonWithCircleLayout:(BOOL)a3
{
  PKContinuousButton *v4;
  BOOL v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v12;
  int64x2_t v13;
  int64x2_t v14;
  _QWORD v15[2];
  int64x2_t v16;
  uint64_t v17;

  if (a3)
  {
    v15[0] = 0;
    v15[1] = 0;
    v16 = vdupq_n_s64(2uLL);
    v17 = 2;
    v4 = -[PKContinuousButton initWithConfiguration:]([PKContinuousButton alloc], "initWithConfiguration:", v15);
    -[PKContinuousButton setContentEdgeInsets:](v4, "setContentEdgeInsets:", 1.0, 1.0, 1.0, 1.0);
    v5 = 1;
  }
  else
  {
    v12 = 0;
    v13 = vdupq_n_s64(2uLL);
    v14 = v13;
    v4 = -[PKContinuousButton initWithConfiguration:]([PKContinuousButton alloc], "initWithConfiguration:", &v12);
    -[PKContinuousButton setContentEdgeInsets:](v4, "setContentEdgeInsets:", 10.0, 16.0, 10.0, 16.0);
    v5 = 0;
  }
  self->_usingCircleButton = v5;
  -[PKContinuousButton setTintColor:](v4, "setTintColor:", self->_payButtonTintColor);
  -[PKContinuousButton updateTitleColorWithColor:](v4, "updateTitleColorWithColor:", self->_payButtonTitleColor);
  -[PKContinuousButton imageView](v4, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", self->_payButtonTitleColor);
  -[PKContinuousButton titleLabel](v4, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_isCompactUI)
    v8 = 0x8000;
  else
    v8 = 2;
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC48F0], v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v9);

  -[PKContinuousButton titleLabel](v4, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAdjustsFontSizeToFitWidth:", 1);

  -[PKContinuousButton addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", self, sel__buttonTapped_, 64);
  return v4;
}

- (void)_buttonTapped:(id)a3
{
  id WeakRetained;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "paymentButtonTappedForItem:", self->_item);
    WeakRetained = v5;
  }

}

- (PKCreditPaymentDueCellDelegate)delegate
{
  return (PKCreditPaymentDueCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKDashboardCreditAccountItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (PKContinuousButton)payButton
{
  return self->_payButton;
}

- (UIColor)payButtonTintColor
{
  return self->_payButtonTintColor;
}

- (UIColor)payButtonTitleColor
{
  return self->_payButtonTitleColor;
}

- (UIFont)payButtonFont
{
  return self->_payButtonFont;
}

- (BOOL)useAccessibilityLayout
{
  return self->_useAccessibilityLayout;
}

- (void)setUseAccessibilityLayout:(BOOL)a3
{
  self->_useAccessibilityLayout = a3;
}

- (UIImage)payButtonImage
{
  return self->_payButtonImage;
}

- (NSString)fallbackButtonTitle
{
  return self->_fallbackButtonTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackButtonTitle, 0);
  objc_storeStrong((id *)&self->_payButtonImage, 0);
  objc_storeStrong((id *)&self->_payButtonFont, 0);
  objc_storeStrong((id *)&self->_payButtonTitleColor, 0);
  objc_storeStrong((id *)&self->_payButtonTintColor, 0);
  objc_storeStrong((id *)&self->_payButton, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_paymentDueLabel, 0);
}

@end
