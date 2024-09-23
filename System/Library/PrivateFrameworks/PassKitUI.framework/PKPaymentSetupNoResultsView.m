@implementation PKPaymentSetupNoResultsView

- (PKPaymentSetupNoResultsView)initWithFrame:(CGRect)a3
{
  PKPaymentSetupNoResultsView *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  UIImageView *iconImageView;
  UIImageView *v9;
  void *v10;
  UILabel *v11;
  UILabel *titleLabel;
  UILabel *v13;
  NSString *v14;
  void *v15;
  UILabel *v16;
  void *v17;
  UILabel *v18;
  void *v19;
  UILabel *v20;
  UILabel *subtitleLabel;
  UILabel *v22;
  void *v23;
  UILabel *v24;
  void *v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)PKPaymentSetupNoResultsView;
  v3 = -[PKPaymentSetupNoResultsView initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupNoResultsView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("magnifyingglass"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "initWithImage:", v6);
    iconImageView = v3->_iconImageView;
    v3->_iconImageView = (UIImageView *)v7;

    -[UIImageView setContentMode:](v3->_iconImageView, "setContentMode:", 1);
    v9 = v3->_iconImageView;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v9, "setTintColor:", v10);

    -[PKPaymentSetupNoResultsView addSubview:](v3, "addSubview:", v3->_iconImageView);
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v11;

    v13 = v3->_titleLabel;
    v14 = (NSString *)*MEMORY[0x1E0DC48C0];
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B60], (NSString *)*MEMORY[0x1E0DC48C0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v13, "setFont:", v15);

    v16 = v3->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v16, "setTextColor:", v17);

    v18 = v3->_titleLabel;
    PKLocalizedPaymentString(CFSTR("PAYMENT_SETUP_NO_RESULTS_TITLE"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v18, "setText:", v19);

    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 0);
    -[PKPaymentSetupNoResultsView addSubview:](v3, "addSubview:", v3->_titleLabel);
    v20 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = v20;

    v22 = v3->_subtitleLabel;
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v22, "setFont:", v23);

    v24 = v3->_subtitleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v24, "setTextColor:", v25);

    -[UILabel setTextAlignment:](v3->_subtitleLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v3->_subtitleLabel, "setNumberOfLines:", 0);
    -[PKPaymentSetupNoResultsView addSubview:](v3, "addSubview:", v3->_subtitleLabel);
  }
  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentSetupNoResultsView;
  -[PKPaymentSetupNoResultsView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKPaymentSetupNoResultsView bounds](self, "bounds");
  -[PKPaymentSetupNoResultsView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKPaymentSetupNoResultsView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  double v11;
  double v12;
  int v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  UIButton *actionButton;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGFloat MaxY;
  double v43;
  double v44;
  CGSize result;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PKPaymentSetupNoResultsView readableContentGuide](self, "readableContentGuide");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layoutFrame");
  v12 = v11;

  if (a4)
  {
    v13 = 1;
    v14 = 0.0;
  }
  else
  {
    -[PKPaymentSetupNoResultsView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, x, y, width, height);
    if (v15 >= height)
    {
      v13 = 0;
      v14 = 15.0;
    }
    else
    {
      PKFloatRoundToPixel();
      v14 = v16;
      v13 = 1;
    }
  }
  -[UIImageView image](self->_iconImageView, "image");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    if (v13)
    {
      v46.origin.x = (width + -50.0) * 0.5;
      v46.origin.y = v14;
      v46.size.width = 50.0;
      v46.size.height = 50.0;
      v18 = CGRectGetMaxY(v46) + 20.0;
      if (!a4)
        -[UIImageView setFrame:](self->_iconImageView, "setFrame:", (width + -50.0) * 0.5, v14, 50.0, 50.0);
    }
    else
    {
      v18 = v14;
    }
    -[UIImageView setHidden:](self->_iconImageView, "setHidden:", v13 ^ 1u);
    v14 = v18;
  }
  v19 = v12 + -12.0;
  -[UILabel text](self->_titleLabel, "text");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "length");

  if (v21)
  {
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v19, height);
    v23 = v22;
    v25 = v24;
    v26 = (width - v22) * 0.5;
    v47.origin.x = v26;
    v47.origin.y = v14;
    v47.size.width = v23;
    v47.size.height = v25;
    v27 = CGRectGetMaxY(v47) + 15.0;
    if (!a4)
      -[UILabel setFrame:](self->_titleLabel, "setFrame:", v26, v14, v23, v25);
  }
  else
  {
    v27 = v14;
  }
  -[UILabel text](self->_subtitleLabel, "text");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "length");

  if (v29)
  {
    -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v19, height);
    v31 = v30;
    v33 = v32;
    v34 = (width - v30) * 0.5;
    v48.origin.x = v34;
    v48.origin.y = v27;
    v48.size.width = v31;
    v48.size.height = v33;
    v35 = CGRectGetMaxY(v48) + 15.0;
    if (!a4)
      -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", v34, v27, v31, v33);
  }
  else
  {
    v35 = v27;
  }
  actionButton = self->_actionButton;
  if (actionButton)
  {
    -[UIButton sizeThatFits:](actionButton, "sizeThatFits:", v19, height);
    v38 = v37;
    v40 = v39;
    v41 = (width - v37) * 0.5;
    v49.origin.x = v41;
    v49.origin.y = v35;
    v49.size.width = v38;
    v49.size.height = v40;
    MaxY = CGRectGetMaxY(v49);
    if (!a4)
      -[UIButton setFrame:](self->_actionButton, "setFrame:", v41, v35, v38, v40);
  }
  else
  {
    MaxY = v35;
  }
  v43 = width;
  v44 = MaxY;
  result.height = v44;
  result.width = v43;
  return result;
}

- (void)setIcon:(id)a3
{
  -[UIImageView setImage:](self->_iconImageView, "setImage:", a3);
  -[PKPaymentSetupNoResultsView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTitle:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[UILabel text](self->_titleLabel, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v6);

  if ((v5 & 1) == 0)
  {
    -[UILabel setText:](self->_titleLabel, "setText:", v6);
    -[PKPaymentSetupNoResultsView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setSubtitle:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[UILabel text](self->_subtitleLabel, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v6);

  if ((v5 & 1) == 0)
  {
    -[UILabel setText:](self->_subtitleLabel, "setText:", v6);
    -[PKPaymentSetupNoResultsView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setActionButtonTitle:(id)a3 addTarget:(id)a4 action:(SEL)a5
{
  id v8;
  id v9;
  id v10;
  UIButton *actionButton;
  UIButton *v12;
  UIButton *v13;
  void *v14;
  void *v15;
  void *v16;
  UIButton *v17;
  id v18;

  v18 = a3;
  v8 = a4;
  v9 = v18;
  v10 = v8;
  actionButton = self->_actionButton;
  if (v18 && v10)
  {
    if (!actionButton)
    {
      objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
      v12 = (UIButton *)objc_claimAutoreleasedReturnValue();
      v13 = self->_actionButton;
      self->_actionButton = v12;

      -[UIButton setExclusiveTouch:](self->_actionButton, "setExclusiveTouch:", 1);
      -[UIButton titleLabel](self->_actionButton, "titleLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setNumberOfLines:", 0);
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTextColor:", v15);

      objc_msgSend(v14, "setTextAlignment:", 1);
      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 15.0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setFont:", v16);

      -[PKPaymentSetupNoResultsView addSubview:](self, "addSubview:", self->_actionButton);
      v9 = v18;
      actionButton = self->_actionButton;
    }
    -[UIButton setTitle:forState:](actionButton, "setTitle:forState:", v9, 0);
    -[UIButton addTarget:action:forControlEvents:](self->_actionButton, "addTarget:action:forControlEvents:", v10, a5, 0x2000);
  }
  else
  {
    -[UIButton removeFromSuperview](actionButton, "removeFromSuperview");
    v17 = self->_actionButton;
    self->_actionButton = 0;

  }
  -[PKPaymentSetupNoResultsView setNeedsLayout](self, "setNeedsLayout");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end
