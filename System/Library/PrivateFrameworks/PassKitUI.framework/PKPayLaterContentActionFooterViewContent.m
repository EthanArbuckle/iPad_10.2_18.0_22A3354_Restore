@implementation PKPayLaterContentActionFooterViewContent

- (PKPayLaterContentActionFooterViewContent)initWithDelegate:(id)a3
{
  id v4;
  PKPayLaterContentActionFooterViewContent *v5;
  PKPayLaterContentActionFooterViewContent *v6;
  uint64_t v7;
  UIActivityIndicatorView *spinnerView;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPayLaterContentActionFooterViewContent;
  v5 = -[PKPayLaterContentActionFooterViewContent initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    -[PKPayLaterContentActionFooterViewContent setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", 1);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    spinnerView = v6->_spinnerView;
    v6->_spinnerView = (UIActivityIndicatorView *)v7;

    -[UIActivityIndicatorView startAnimating](v6->_spinnerView, "startAnimating");
    -[UIActivityIndicatorView setHidden:](v6->_spinnerView, "setHidden:", 1);
    -[PKPayLaterContentActionFooterViewContent addSubview:](v6, "addSubview:", v6->_spinnerView);
  }

  return v6;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPayLaterContentActionFooterViewContent;
  -[PKPayLaterContentActionFooterViewContent layoutSubviews](&v3, sel_layoutSubviews);
  -[PKPayLaterContentActionFooterViewContent bounds](self, "bounds");
  -[PKPayLaterContentActionFooterViewContent _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKPayLaterContentActionFooterViewContent _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  CGRectEdge v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGPoint v21;
  CGSize v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGSize v50;
  CGPoint v51;
  double v52;
  double v53;
  double v54;
  CGFloat width;
  CGRect v56;
  CGRect v57;
  CGRect slice;
  CGRect remainder;
  CGRect v60;
  CGSize result;
  CGRect v62;

  v6 = a3.origin.x + 20.0;
  v7 = a3.origin.y + 16.0;
  width = a3.size.width;
  v8 = a3.size.width + -38.0;
  v9 = a3.size.height + -32.0;
  if (-[PKPayLaterContentActionFooterViewContent _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))v11 = CGRectMinXEdge;
  else
    v11 = CGRectMaxXEdge;
  remainder.origin.x = v6;
  remainder.origin.y = v7;
  remainder.size.width = v8;
  remainder.size.height = v9;
  -[UIActivityIndicatorView sizeThatFits:](self->_spinnerView, "sizeThatFits:", v8, v9);
  if (-[NSString length](self->_buttonText, "length"))
  {
    -[UIButton sizeThatFits:](self->_button, "sizeThatFits:", v8, v9);
    v13 = v12;
    v15 = v14;
  }
  else
  {
    v13 = *MEMORY[0x1E0C9D820];
    v15 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  if (self->_leadingTitleText)
  {
    -[PKIconTextLabel sizeThatFits:](self->_leadingTitle, "sizeThatFits:", v8 - v13, 1.79769313e308);
    v52 = v16;
    v54 = v17;
  }
  else
  {
    v52 = *MEMORY[0x1E0C9D820];
    v54 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  if (self->_leadingDetailText)
  {
    -[UILabel sizeThatFits:](self->_leadingDetail, "sizeThatFits:", v8 - v13, 1.79769313e308);
    v19 = v18;
    v53 = v20;
  }
  else
  {
    v19 = *MEMORY[0x1E0C9D820];
    v53 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  memset(&v60, 0, sizeof(v60));
  v21 = (CGPoint)*MEMORY[0x1E0C9D648];
  v22 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  slice.origin = v21;
  slice.size = v22;
  v23 = *MEMORY[0x1E0C9D648];
  v24 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v50 = v22;
  v51 = v21;
  if (v13 <= 0.0)
  {
    v48 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v49 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v35 = width;
    v25 = v15;
  }
  else
  {
    v47 = v19;
    PKRectCenteredYInRect();
    v62.origin.x = v6;
    v62.origin.y = v7;
    v62.size.width = v8;
    v62.size.height = v9;
    CGRectDivide(v62, &slice, &remainder, v13, v11);
    PKContentAlignmentMake();
    v25 = v15;
    PKSizeAlignedInRect();
    slice.origin.x = v26;
    slice.origin.y = v27;
    slice.size.width = v28;
    slice.size.height = v29;
    CGRectDivide(remainder, &v60, &remainder, 15.0, v11);
    -[UIButton layer](self->_button, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setCornerRadius:", slice.size.height * 0.5);

    PKSizeAlignedInRect();
    v23 = v31;
    v24 = v32;
    v22 = v50;
    v21 = v51;
    v48 = v34;
    v49 = v33;
    v19 = v47;
    v35 = width;
  }
  v57.origin = v21;
  v57.size = v22;
  if (v52 > 0.0)
  {
    v36 = v19;
    CGRectDivide(remainder, &v57, &remainder, v54, CGRectMinYEdge);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v57.origin.x = v37;
    v57.origin.y = v38;
    v22 = v50;
    v21 = v51;
    v57.size.width = v39;
    v57.size.height = v40;
    v19 = v36;
  }
  v56.origin = v21;
  v56.size = v22;
  if (v19 > 0.0)
  {
    CGRectDivide(remainder, &v56, &remainder, v53, CGRectMinYEdge);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v56.origin.x = v41;
    v56.origin.y = v42;
    v56.size.width = v43;
    v56.size.height = v44;
  }
  if (!a4)
  {
    -[UIButton setFrame:](self->_button, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    -[PKIconTextLabel setFrame:](self->_leadingTitle, "setFrame:", v57.origin.x, v57.origin.y, v57.size.width, v57.size.height);
    -[UILabel setFrame:](self->_leadingDetail, "setFrame:", v56.origin.x, v56.origin.y, v56.size.width, v56.size.height);
    -[UIActivityIndicatorView setFrame:](self->_spinnerView, "setFrame:", v23, v24, v49, v48);
  }
  v45 = fmax(v25, v54 + v53) + 16.0 + 16.0;
  v46 = v35;
  result.height = v45;
  result.width = v46;
  return result;
}

+ (id)leadingTitleFont
{
  return PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B10], (NSString *)*MEMORY[0x1E0DC4918]);
}

- (void)setButtonText:(id)a3
{
  id v5;
  NSString *buttonText;
  NSString *v7;
  BOOL v8;
  NSString *v9;

  v5 = a3;
  buttonText = self->_buttonText;
  v9 = (NSString *)v5;
  v7 = buttonText;
  if (v7 == v9)
  {

  }
  else
  {
    if (v9 && v7)
    {
      v8 = -[NSString isEqualToString:](v9, "isEqualToString:", v7);

      if (v8)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_buttonText, a3);
    -[PKPayLaterContentActionFooterViewContent _configureButton](self, "_configureButton");
  }
LABEL_9:

}

- (void)setButtonTintColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_buttonTintColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_buttonTintColor, a3);
    -[PKPayLaterContentActionFooterViewContent _configureButton](self, "_configureButton");
    v5 = v6;
  }

}

- (void)setButtonTitleColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_buttonTitleColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_buttonTitleColor, a3);
    -[PKPayLaterContentActionFooterViewContent _configureButton](self, "_configureButton");
    v5 = v6;
  }

}

- (void)setLeadingTitleText:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_leadingTitleText, a3);
    -[PKPayLaterContentActionFooterViewContent _configureLabels](self, "_configureLabels");
  }

}

- (void)setLeadingTitleTextColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_leadingTitleTextColor, a3);
    -[PKPayLaterContentActionFooterViewContent setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setLeadingTitleIcon:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_leadingTitleIcon != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_leadingTitleIcon, a3);
    -[PKPayLaterContentActionFooterViewContent _configureLabels](self, "_configureLabels");
    v5 = v6;
  }

}

- (void)setLeadingDetailTextColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_leadingDetailTextColor, a3);
    -[PKPayLaterContentActionFooterViewContent setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setLeadingDetailText:(id)a3
{
  id v5;
  NSString *leadingDetailText;
  NSString *v7;
  BOOL v8;
  NSString *v9;

  v5 = a3;
  leadingDetailText = self->_leadingDetailText;
  v9 = (NSString *)v5;
  v7 = leadingDetailText;
  if (v7 == v9)
  {

  }
  else
  {
    if (v9 && v7)
    {
      v8 = -[NSString isEqualToString:](v9, "isEqualToString:", v7);

      if (v8)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_leadingDetailText, a3);
    -[PKPayLaterContentActionFooterViewContent _configureLabels](self, "_configureLabels");
  }
LABEL_9:

}

- (void)setShowSpinner:(BOOL)a3
{
  if (self->_showSpinner != a3)
  {
    self->_showSpinner = a3;
    -[UIActivityIndicatorView setHidden:](self->_spinnerView, "setHidden:", !a3);
    -[UIButton setHidden:](self->_button, "setHidden:", self->_showSpinner);
  }
}

- (void)_configureLabels
{
  NSString *leadingDetailText;
  UILabel *leadingDetail;
  id v5;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  UILabel *v11;
  void *v12;
  NSString *leadingTitleText;
  PKIconTextLabel *leadingTitle;
  PKIconTextLabel *v15;
  PKIconTextLabel *v16;
  PKIconTextLabel *v17;
  void *v18;
  PKIconTextLabel *v19;
  void *v20;
  PKIconTextLabel *v21;
  void *v22;
  PKIconTextLabel *v23;

  leadingDetailText = self->_leadingDetailText;
  leadingDetail = self->_leadingDetail;
  if (leadingDetailText)
  {
    if (!leadingDetail)
    {
      v5 = objc_alloc(MEMORY[0x1E0DC3990]);
      v6 = (UILabel *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v7 = self->_leadingDetail;
      self->_leadingDetail = v6;

      -[UILabel setNumberOfLines:](self->_leadingDetail, "setNumberOfLines:", 0);
      v8 = self->_leadingDetail;
      PKFontForDesign((void *)*MEMORY[0x1E0DC13A8], (void *)*MEMORY[0x1E0DC4B50], (void *)*MEMORY[0x1E0DC4918], 0, 0, *MEMORY[0x1E0DC1448]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v8, "setFont:", v9);

      -[PKPayLaterContentActionFooterViewContent addSubview:](self, "addSubview:", self->_leadingDetail);
      leadingDetail = self->_leadingDetail;
      leadingDetailText = self->_leadingDetailText;
    }
    -[UILabel setText:](leadingDetail, "setText:", leadingDetailText);
    v10 = self->_leadingDetail;
    if (self->_leadingDetailTextColor)
    {
      -[UILabel setTextColor:](self->_leadingDetail, "setTextColor:");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v10, "setTextColor:", v12);

    }
  }
  else
  {
    -[UILabel removeFromSuperview](leadingDetail, "removeFromSuperview");
    v11 = self->_leadingDetail;
    self->_leadingDetail = 0;

  }
  leadingTitleText = self->_leadingTitleText;
  if (leadingTitleText || self->_leadingTitleIcon)
  {
    leadingTitle = self->_leadingTitle;
    if (!leadingTitle)
    {
      v15 = [PKIconTextLabel alloc];
      v16 = -[PKIconTextLabel initWithFrame:](v15, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v17 = self->_leadingTitle;
      self->_leadingTitle = v16;

      -[PKPayLaterContentActionFooterViewContent addSubview:](self, "addSubview:", self->_leadingTitle);
      leadingTitle = self->_leadingTitle;
      leadingTitleText = self->_leadingTitleText;
    }
    -[NSString pk_attributedString](leadingTitleText, "pk_attributedString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKIconTextLabel setText:](leadingTitle, "setText:", v18);

    v19 = self->_leadingTitle;
    objc_msgSend((id)objc_opt_class(), "leadingTitleFont");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKIconTextLabel setTextFont:](v19, "setTextFont:", v20);

    v21 = self->_leadingTitle;
    if (self->_leadingTitleTextColor)
    {
      -[PKIconTextLabel setTextColor:](self->_leadingTitle, "setTextColor:");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKIconTextLabel setTextColor:](v21, "setTextColor:", v22);

    }
    -[PKIconTextLabel setIcon:](self->_leadingTitle, "setIcon:", self->_leadingTitleIcon);
  }
  else
  {
    -[PKIconTextLabel removeFromSuperview](self->_leadingTitle, "removeFromSuperview");
    v23 = self->_leadingTitle;
    self->_leadingTitle = 0;

  }
  -[PKPayLaterContentActionFooterViewContent setNeedsLayout](self, "setNeedsLayout");
}

- (void)_configureButton
{
  NSString *buttonText;
  UIButton *button;
  UIButton *v5;
  UIButton *v6;
  void *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;

  buttonText = self->_buttonText;
  button = self->_button;
  if (buttonText)
  {
    if (!button)
    {
      v5 = (UIButton *)objc_alloc_init(MEMORY[0x1E0DC3518]);
      v6 = self->_button;
      self->_button = v5;

      -[UIButton layer](self->_button, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);

      v8 = self->_buttonText;
      v9 = (void *)MEMORY[0x1E0DC3520];
      PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC4918], 2, (unint64_t)*MEMORY[0x1E0DC1448]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pkui_plainConfigurationWithTitle:font:", v8, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIButton setConfiguration:](self->_button, "setConfiguration:", v11);
      -[UIButton addTarget:action:forControlEvents:](self->_button, "addTarget:action:forControlEvents:", self, sel__buttonTapped, 64);
      -[PKPayLaterContentActionFooterViewContent addSubview:](self, "addSubview:", self->_button);

      button = self->_button;
    }
    -[UIButton configuration](button, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBaseForegroundColor:", self->_buttonTitleColor);
    objc_msgSend(v12, "contentInsets");
    objc_msgSend(v12, "setContentInsets:", v15 + 1.0, v13 + 2.0, v16 + 1.0, v14 + 2.0);
    -[UIButton setConfiguration:](self->_button, "setConfiguration:", v12);
    -[UIButton setBackgroundColor:](self->_button, "setBackgroundColor:", self->_buttonTintColor);
  }
  else
  {
    -[UIButton removeFromSuperview](button, "removeFromSuperview");
    v12 = self->_button;
    self->_button = 0;
  }

  -[PKPayLaterContentActionFooterViewContent setNeedsLayout](self, "setNeedsLayout");
}

- (void)_buttonTapped
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "payLaterContentActionFooterViewDidTapButton");
    WeakRetained = v3;
  }

}

- (NSString)leadingTitleText
{
  return self->_leadingTitleText;
}

- (UIImage)leadingTitleIcon
{
  return self->_leadingTitleIcon;
}

- (UIColor)leadingTitleTextColor
{
  return self->_leadingTitleTextColor;
}

- (NSString)leadingDetailText
{
  return self->_leadingDetailText;
}

- (UIColor)leadingDetailTextColor
{
  return self->_leadingDetailTextColor;
}

- (NSString)buttonText
{
  return self->_buttonText;
}

- (UIColor)buttonTintColor
{
  return self->_buttonTintColor;
}

- (UIColor)buttonTitleColor
{
  return self->_buttonTitleColor;
}

- (BOOL)showSpinner
{
  return self->_showSpinner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonTitleColor, 0);
  objc_storeStrong((id *)&self->_buttonTintColor, 0);
  objc_storeStrong((id *)&self->_buttonText, 0);
  objc_storeStrong((id *)&self->_leadingDetailTextColor, 0);
  objc_storeStrong((id *)&self->_leadingDetailText, 0);
  objc_storeStrong((id *)&self->_leadingTitleTextColor, 0);
  objc_storeStrong((id *)&self->_leadingTitleIcon, 0);
  objc_storeStrong((id *)&self->_leadingTitleText, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_leadingDetail, 0);
  objc_storeStrong((id *)&self->_leadingTitle, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
