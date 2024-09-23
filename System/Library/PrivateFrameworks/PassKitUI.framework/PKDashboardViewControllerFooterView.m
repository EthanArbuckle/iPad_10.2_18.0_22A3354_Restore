@implementation PKDashboardViewControllerFooterView

- (PKDashboardViewControllerFooterView)initWithFrame:(CGRect)a3
{
  PKDashboardViewControllerFooterView *v3;
  PKDashboardViewControllerFooterView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKDashboardViewControllerFooterView;
  v3 = -[PKDashboardViewControllerFooterView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PKDashboardViewControllerFooterView _createSubviews](v3, "_createSubviews");
    -[PKDashboardViewControllerFooterView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 1);
    -[PKDashboardViewControllerFooterView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67A98]);
  }
  return v4;
}

- (void)_createSubviews
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UILabel *v11;
  UILabel *leadingTitle;
  UILabel *v13;
  UILabel *leadingDetail;
  UILabel *v15;
  UILabel *trailingTitle;
  UILabel *v17;
  UILabel *trailingDetail;
  UIView *v19;
  UIView *separatorView;
  UIView *v21;
  void *v22;
  UIView *v23;
  UIView *topSeparatorView;
  UIView *v25;
  void *v26;
  id v27;

  v3 = (void *)*MEMORY[0x1E0DC48F8];
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B10], (NSString *)*MEMORY[0x1E0DC48F8]);
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKFontForDesign((void *)*MEMORY[0x1E0DC13A8], (void *)*MEMORY[0x1E0DC4B58], v3, 2, 0, *MEMORY[0x1E0DC1420]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0DC3990]);
  v7 = *MEMORY[0x1E0C9D648];
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v11 = (UILabel *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], v8, v9, v10);
  leadingTitle = self->_leadingTitle;
  self->_leadingTitle = v11;

  -[UILabel setNumberOfLines:](self->_leadingTitle, "setNumberOfLines:", 1);
  -[UILabel setTextColor:](self->_leadingTitle, "setTextColor:", v4);
  -[UILabel setFont:](self->_leadingTitle, "setFont:", v27);
  -[UILabel setAccessibilityIdentifier:](self->_leadingTitle, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67CD8]);
  -[PKDashboardViewControllerFooterView addSubview:](self, "addSubview:", self->_leadingTitle);
  v13 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v7, v8, v9, v10);
  leadingDetail = self->_leadingDetail;
  self->_leadingDetail = v13;

  -[UILabel setNumberOfLines:](self->_leadingDetail, "setNumberOfLines:", 1);
  -[UILabel setFont:](self->_leadingDetail, "setFont:", v5);
  -[UILabel setAccessibilityIdentifier:](self->_leadingDetail, "setAccessibilityIdentifier:", *MEMORY[0x1E0D680C8]);
  -[PKDashboardViewControllerFooterView addSubview:](self, "addSubview:", self->_leadingDetail);
  v15 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v7, v8, v9, v10);
  trailingTitle = self->_trailingTitle;
  self->_trailingTitle = v15;

  -[UILabel setNumberOfLines:](self->_trailingTitle, "setNumberOfLines:", 1);
  -[UILabel setTextColor:](self->_trailingTitle, "setTextColor:", v4);
  -[UILabel setFont:](self->_trailingTitle, "setFont:", v27);
  -[UILabel setAccessibilityIdentifier:](self->_trailingTitle, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68128]);
  -[PKDashboardViewControllerFooterView addSubview:](self, "addSubview:", self->_trailingTitle);
  v17 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v7, v8, v9, v10);
  trailingDetail = self->_trailingDetail;
  self->_trailingDetail = v17;

  -[UILabel setNumberOfLines:](self->_trailingDetail, "setNumberOfLines:", 1);
  -[UILabel setFont:](self->_trailingDetail, "setFont:", v5);
  -[UILabel setAccessibilityIdentifier:](self->_trailingDetail, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AE8]);
  -[PKDashboardViewControllerFooterView addSubview:](self, "addSubview:", self->_trailingDetail);
  v19 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  separatorView = self->_separatorView;
  self->_separatorView = v19;

  v21 = self->_separatorView;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemLightGrayColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v21, "setBackgroundColor:", v22);

  -[PKDashboardViewControllerFooterView addSubview:](self, "addSubview:", self->_separatorView);
  v23 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  topSeparatorView = self->_topSeparatorView;
  self->_topSeparatorView = v23;

  v25 = self->_topSeparatorView;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemLightGrayColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v25, "setBackgroundColor:", v26);

  -[PKDashboardViewControllerFooterView addSubview:](self, "addSubview:", self->_topSeparatorView);
  -[PKDashboardViewControllerFooterView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67C18]);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  -[PKDashboardViewControllerFooterView layoutWithBounds:isTemplateLayout:](self, "layoutWithBounds:isTemplateLayout:", 1, 0.0, 0.0, a3.width, a3.height);
  v5 = v4;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKDashboardViewControllerFooterView;
  -[PKDashboardViewControllerFooterView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKDashboardViewControllerFooterView bounds](self, "bounds");
  -[PKDashboardViewControllerFooterView layoutWithBounds:isTemplateLayout:](self, "layoutWithBounds:isTemplateLayout:", 0);
}

- (double)layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double height;
  double width;
  double y;
  double x;
  int v10;
  int v11;
  CGRectEdge v12;
  CGRectEdge v13;
  _BOOL4 v14;
  _BOOL4 v15;
  double leading;
  double trailing;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  UILabel *leadingTitle;
  UILabel *leadingDetail;
  _BOOL8 v49;
  UIView *separatorView;
  UILabel **p_trailingDetail;
  UILabel *trailingTitle;
  UILabel *trailingDetail;
  double v55;
  CGRect v56;
  CGRect slice;
  CGRect v58;
  CGRect remainder;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = -[PKDashboardViewControllerFooterView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v11 = v10;
  if (v10)
    v12 = CGRectMaxXEdge;
  else
    v12 = CGRectMinXEdge;
  if (v10)
    v13 = CGRectMinXEdge;
  else
    v13 = CGRectMaxXEdge;
  v14 = self->_contentInsets.leading == *(double *)(MEMORY[0x1E0DC3298] + 8);
  if (self->_contentInsets.top != *MEMORY[0x1E0DC3298])
    v14 = 0;
  if (self->_contentInsets.trailing != *(double *)(MEMORY[0x1E0DC3298] + 24))
    v14 = 0;
  v15 = self->_contentInsets.bottom == *(double *)(MEMORY[0x1E0DC3298] + 16);
  if (v14 && v15)
    leading = 18.0;
  else
    leading = self->_contentInsets.leading;
  if (v14 && v15)
    trailing = 18.0;
  else
    trailing = self->_contentInsets.trailing;
  remainder.origin.x = x;
  remainder.origin.y = y;
  remainder.size.width = width;
  remainder.size.height = height;
  -[UILabel text](self->_trailingTitle, "text");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "length"))
  {
    v19 = 1;
  }
  else
  {
    -[UILabel text](self->_trailingDetail, "text");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v20, "length") != 0;

  }
  -[PKContinuousButton titleLabel](self->_payButton, "titleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "text");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "length");

  -[PKContinuousButton currentImage](self->_payButton, "currentImage");
  v24 = objc_claimAutoreleasedReturnValue();

  if (v23 >= 4 && v24 == 0)
  {
    -[PKContinuousButton sizeThatFits:](self->_payButton, "sizeThatFits:", width, height);
    v26 = v27;
  }
  else
  {
    v26 = 54.0;
  }
  memset(&v58, 0, sizeof(v58));
  memset(&slice, 0, sizeof(slice));
  memset(&v56, 0, sizeof(v56));
  if (v11)
    v28 = trailing;
  else
    v28 = leading;
  if (v11)
    v29 = leading;
  else
    v29 = trailing;
  v30 = x + v28;
  v31 = y + 18.0;
  v32 = width - (v28 + 18.0);
  v33 = height - (v29 + 18.0);
  remainder.origin.x = v30;
  remainder.origin.y = y + 18.0;
  remainder.size.width = v32;
  remainder.size.height = v33;
  v60.origin.x = v30;
  v60.origin.y = y + 18.0;
  v60.size.width = v32;
  v60.size.height = v33;
  CGRectGetMidX(v60);
  PKFloatRoundToPixel();
  v55 = v34;
  if (v23 | v24)
  {
    v61.origin.x = v30;
    v61.origin.y = y + 18.0;
    v61.size.width = v32;
    v61.size.height = v33;
    CGRectDivide(v61, &slice, &remainder, v26, v13);
LABEL_36:
    v56 = remainder;
    goto LABEL_37;
  }
  if (!v19)
    goto LABEL_36;
  v62.origin.x = v30;
  v62.origin.y = y + 18.0;
  v62.size.width = v32;
  v62.size.height = v33;
  CGRectGetWidth(v62);
  PKFloatRoundToPixel();
  v36 = v35 + -18.0;
  v63.origin.x = v30;
  v63.origin.y = v31;
  v63.size.width = v32;
  v63.size.height = v33;
  CGRectDivide(v63, &v56, &remainder, v36, v12);
  CGRectDivide(remainder, &slice, &remainder, v36, v13);
LABEL_37:
  -[UILabel pkui_sizeThatFits:](self->_leadingTitle, "pkui_sizeThatFits:", v56.size.width, v56.size.height);
  v38 = v37;
  -[UILabel pkui_sizeThatFits:](self->_leadingDetail, "pkui_sizeThatFits:", v56.size.width, v56.size.height);
  v40 = v39;
  v41 = v38 + v39 + 2.0;
  v42 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v43 = v42;
  if (!(v23 | v24) && v19)
  {
    -[UILabel pkui_sizeThatFits:](self->_trailingTitle, "pkui_sizeThatFits:", slice.size.width, v56.size.height);
    v43 = v44;
    -[UILabel pkui_sizeThatFits:](self->_trailingDetail, "pkui_sizeThatFits:", slice.size.width, v56.size.height);
    v42 = v45;
  }
  v46 = fmax(v41, v42 + v43 + 2.0);
  if (!a4)
  {
    remainder = v56;
    CGRectDivide(v56, &v58, &remainder, v38, CGRectMinYEdge);
    leadingTitle = self->_leadingTitle;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](leadingTitle, "setFrame:");
    CGRectDivide(remainder, &v58, &remainder, 2.0, CGRectMinYEdge);
    CGRectDivide(remainder, &v58, &remainder, v40, CGRectMinYEdge);
    leadingDetail = self->_leadingDetail;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](leadingDetail, "setFrame:");
    v49 = (v23 | v24) != 0 || !v19;
    separatorView = self->_separatorView;
    if ((v23 | v24) != 0 || !v19)
    {
      -[UIView setHidden:](separatorView, "setHidden:", 1);
      -[UILabel setHidden:](self->_trailingTitle, "setHidden:", 1);
      p_trailingDetail = &self->_trailingDetail;
    }
    else
    {
      -[UIView setHidden:](separatorView, "setHidden:", 0);
      -[UIView setFrame:](self->_separatorView, "setFrame:", v55, v56.origin.y, PKUIPixelLength() * 3.0, v46);
      remainder = slice;
      CGRectDivide(slice, &v58, &remainder, v43, CGRectMinYEdge);
      trailingTitle = self->_trailingTitle;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UILabel setFrame:](trailingTitle, "setFrame:");
      CGRectDivide(remainder, &v58, &remainder, 2.0, CGRectMinYEdge);
      CGRectDivide(remainder, &v58, &remainder, v42, CGRectMinYEdge);
      p_trailingDetail = &self->_trailingDetail;
      trailingDetail = self->_trailingDetail;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UILabel setFrame:](trailingDetail, "setFrame:");
      -[UILabel setHidden:](self->_trailingTitle, "setHidden:", 0);
    }
    -[UILabel setHidden:](*p_trailingDetail, "setHidden:", v49);
    -[PKContinuousButton setHidden:](self->_payButton, "setHidden:", (v23 | v24) == 0);
    if (v23 | v24)
    {
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[PKContinuousButton setFrame:](self->_payButton, "setFrame:");
    }
  }
  return v46 + 18.0;
}

- (void)setButtonTitle:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v9;
  _BOOL8 v10;
  PKContinuousButton *v11;
  PKContinuousButton *payButton;
  PKContinuousButton *v14;
  PKContinuousButton *v15;
  PKContinuousButton *v16;
  PKContinuousButton *v17;
  id v18;

  v18 = a3;
  -[PKContinuousButton titleLabel](self->_payButton, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  v7 = objc_msgSend(v18, "length");
  if (v6 <= 3 && v7 >= 4)
  {
    payButton = self->_payButton;
    if (payButton)
      -[PKContinuousButton removeFromSuperview](payButton, "removeFromSuperview");
    -[PKDashboardViewControllerFooterView _payButtonWithCircleLayout:](self, "_payButtonWithCircleLayout:", 0);
    v14 = (PKContinuousButton *)objc_claimAutoreleasedReturnValue();
    v15 = self->_payButton;
    self->_payButton = v14;

    -[PKDashboardViewControllerFooterView addSubview:](self, "addSubview:", self->_payButton);
    goto LABEL_20;
  }
  v9 = v7;
  v10 = v7 < 4;
  v11 = self->_payButton;
  if (v6 < 4 || v9 > 3)
  {
    if (v11)
    {
      if (!v9)
        goto LABEL_21;
      goto LABEL_20;
    }
  }
  else
  {
    if (v11)
      -[PKContinuousButton removeFromSuperview](v11, "removeFromSuperview", v10);
    v10 = 1;
  }
  -[PKDashboardViewControllerFooterView _payButtonWithCircleLayout:](self, "_payButtonWithCircleLayout:", v10);
  v16 = (PKContinuousButton *)objc_claimAutoreleasedReturnValue();
  v17 = self->_payButton;
  self->_payButton = v16;

  -[PKDashboardViewControllerFooterView addSubview:](self, "addSubview:", self->_payButton);
  if (v9)
LABEL_20:
    -[PKDashboardViewControllerFooterView setPayButtonImage:](self, "setPayButtonImage:", 0);
LABEL_21:
  -[PKContinuousButton setTitle:forState:](self->_payButton, "setTitle:forState:", v18, 0);

}

- (void)setButtonTitleColor:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_buttonTitleColor, a3);
    -[PKContinuousButton updateTitleColorWithColor:](self->_payButton, "updateTitleColorWithColor:", v6);
    -[PKContinuousButton imageView](self->_payButton, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTintColor:", v6);

  }
}

- (void)setButtonTintColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_buttonTintColor, a3);
    -[PKContinuousButton setTintColor:](self->_payButton, "setTintColor:", v5);
  }

}

- (void)setPayButtonImage:(id)a3
{
  UIImage **p_payButtonImage;
  id v6;

  p_payButtonImage = &self->_payButtonImage;
  v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_payButtonImage, a3);
    if (v6)
      -[PKDashboardViewControllerFooterView setButtonTitle:](self, "setButtonTitle:", 0);
    -[PKContinuousButton updateWithImage:](self->_payButton, "updateWithImage:", *p_payButtonImage);
    -[PKDashboardViewControllerFooterView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (id)_payButtonWithCircleLayout:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  PKContinuousButton *v6;
  BOOL v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v14;
  __int128 v15;
  int64x2_t v16;
  _QWORD v17[2];
  int64x2_t v18;
  uint64_t v19;

  v3 = a3;
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC4918], 2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v17[0] = 0;
    v17[1] = 0;
    v18 = vdupq_n_s64(2uLL);
    v19 = 2;
    v6 = -[PKContinuousButton initWithConfiguration:]([PKContinuousButton alloc], "initWithConfiguration:", v17);
    -[PKContinuousButton setContentEdgeInsets:](v6, "setContentEdgeInsets:", 1.0, 1.0, 1.0, 1.0);
    v7 = 1;
  }
  else
  {
    PKFloatRoundToPixel();
    v9 = v8;
    objc_msgSend(v5, "lineHeight");
    PKFloatRoundToPixel();
    v14 = v10;
    v15 = xmmword_19DEE0240;
    v16 = vdupq_n_s64(2uLL);
    v6 = -[PKContinuousButton initWithConfiguration:]([PKContinuousButton alloc], "initWithConfiguration:", &v14);
    -[PKContinuousButton setContentEdgeInsets:](v6, "setContentEdgeInsets:", v9, 16.0, 24.0 - v9, 16.0);
    v7 = 0;
  }
  self->_usingCircleButton = v7;
  -[PKContinuousButton titleLabel](v6, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFont:", v5);
  objc_msgSend(v11, "setAdjustsFontSizeToFitWidth:", 1);
  -[PKContinuousButton updateTitleColorWithColor:](v6, "updateTitleColorWithColor:", self->_buttonTitleColor);
  -[PKContinuousButton imageView](v6, "imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTintColor:", self->_buttonTitleColor);

  -[PKContinuousButton setTintColor:](v6, "setTintColor:", self->_buttonTintColor);
  -[PKContinuousButton addTarget:action:forControlEvents:](v6, "addTarget:action:forControlEvents:", self, sel__buttonTapped_, 64);

  return v6;
}

- (void)_buttonTapped:(id)a3
{
  id WeakRetained;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "buttonTappedInFooterView:", self);
    WeakRetained = v5;
  }

}

- (int64_t)detailNumberOfLines
{
  return -[UILabel numberOfLines](self->_leadingDetail, "numberOfLines");
}

- (void)setDetailNumberOfLines:(int64_t)a3
{
  if (-[UILabel numberOfLines](self->_leadingDetail, "numberOfLines") != a3)
  {
    -[UILabel setNumberOfLines:](self->_leadingDetail, "setNumberOfLines:", a3);
    -[UILabel setNumberOfLines:](self->_trailingDetail, "setNumberOfLines:", a3);
    -[UILabel setLineBreakMode:](self->_leadingDetail, "setLineBreakMode:", 4 * (a3 == 1));
    -[UILabel setLineBreakMode:](self->_trailingDetail, "setLineBreakMode:", 4 * (a3 == 1));
    -[PKDashboardViewControllerFooterView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)isEqualToFooter:(id)a3
{
  id v4;
  id *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  char v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  int v27;
  void *v28;
  void *v29;
  id v30;
  void *v32;
  id *v33;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = (id *)v4;
    -[UILabel text](self->_leadingTitle, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5[60], "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    v9 = v7;
    v10 = v9;
    if (v8 == v9)
    {

    }
    else
    {
      if (v8)
        v11 = v9 == 0;
      else
        v11 = 1;
      if (v11)
      {
        v12 = 0;
        v13 = v9;
        v14 = v8;
LABEL_35:

        goto LABEL_36;
      }
      v15 = objc_msgSend(v8, "isEqualToString:", v9);

      if (!v15)
      {
        v12 = 0;
LABEL_36:

        goto LABEL_37;
      }
    }
    -[UILabel text](self->_leadingDetail, "text");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5[61], "text");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16;
    v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {

    }
    else
    {
      v12 = 0;
      v19 = v18;
      v20 = v14;
      if (!v14 || !v18)
        goto LABEL_34;
      v21 = objc_msgSend(v14, "isEqualToString:", v18);

      if (!v21)
      {
        v12 = 0;
        goto LABEL_35;
      }
    }
    -[UILabel text](self->_trailingTitle, "text");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v5;
    objc_msgSend(v5[62], "text");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v22;
    v24 = v23;
    v32 = v24;
    if (v20 != v24)
    {
      v12 = 0;
      if (v20)
      {
        v25 = v24;
        v26 = v20;
        if (v24)
        {
          v27 = objc_msgSend(v20, "isEqualToString:", v24);

          if (!v27)
          {
            v12 = 0;
LABEL_33:
            v19 = v32;
            v5 = v33;
LABEL_34:

            goto LABEL_35;
          }
          goto LABEL_25;
        }
      }
      else
      {
        v25 = v24;
        v26 = 0;
      }
LABEL_32:

      goto LABEL_33;
    }

LABEL_25:
    -[UILabel text](self->_trailingDetail, "text", v32);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33[63], "text");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v28;
    v30 = v29;
    v25 = v30;
    if (v26 == v30)
    {
      v12 = 1;
    }
    else
    {
      v12 = 0;
      if (v26 && v30)
        v12 = objc_msgSend(v26, "isEqualToString:", v30);
    }

    goto LABEL_32;
  }
  v12 = 0;
LABEL_37:

  return v12;
}

- (PKDashboardViewControllerFooterViewDelegate)delegate
{
  return (PKDashboardViewControllerFooterViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)leadingTitle
{
  return self->_leadingTitle;
}

- (UILabel)leadingDetail
{
  return self->_leadingDetail;
}

- (UILabel)trailingTitle
{
  return self->_trailingTitle;
}

- (UILabel)trailingDetail
{
  return self->_trailingDetail;
}

- (NSDirectionalEdgeInsets)contentInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_contentInsets.top;
  leading = self->_contentInsets.leading;
  bottom = self->_contentInsets.bottom;
  trailing = self->_contentInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void)setContentInsets:(NSDirectionalEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingDetail, 0);
  objc_storeStrong((id *)&self->_trailingTitle, 0);
  objc_storeStrong((id *)&self->_leadingDetail, 0);
  objc_storeStrong((id *)&self->_leadingTitle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_payButtonImage, 0);
  objc_storeStrong((id *)&self->_buttonTintColor, 0);
  objc_storeStrong((id *)&self->_buttonTitleColor, 0);
  objc_storeStrong((id *)&self->_payButton, 0);
  objc_storeStrong((id *)&self->_topSeparatorView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
}

@end
