@implementation PKDashboardBalanceView

- (PKDashboardBalanceView)initWithFrame:(CGRect)a3
{
  PKDashboardBalanceView *v3;
  PKDashboardBalanceView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKDashboardBalanceView;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PKDashboardBalanceView createSubviews](v3, "createSubviews");
    -[PKDashboardCollectionViewCell setMaskType:](v4, "setMaskType:", 3);
    -[PKDashboardCollectionViewCell setWantsCustomAppearance:](v4, "setWantsCustomAppearance:", 0);
    v4->_topUpEnabled = 1;
  }
  return v4;
}

- (void)createSubviews
{
  UILabel *v3;
  UILabel *titleLabel;
  UILabel *v5;
  void *v6;
  UILabel *v7;
  UILabel *detailLabel;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  UILabel *availableCreditLabel;
  UILabel *v13;
  void *v14;
  PKContinuousButton *v15;
  PKContinuousButton *actionButton;
  PKContinuousButton *v17;
  void *v18;
  PKContinuousButton *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  UIImageView *v25;
  UIImageView *disclosureView;
  UIImageView *v27;
  void *v28;
  uint64_t v29;
  __int128 v30;
  int64x2_t v31;

  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  v5 = self->_titleLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v5, "setTextColor:", v6);

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 1);
  -[UILabel setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
  -[PKDashboardBalanceView addSubview:](self, "addSubview:", self->_titleLabel);
  v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  detailLabel = self->_detailLabel;
  self->_detailLabel = v7;

  v9 = self->_detailLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v9, "setTextColor:", v10);

  -[UILabel setNumberOfLines:](self->_detailLabel, "setNumberOfLines:", 0);
  -[UILabel setAccessibilityIdentifier:](self->_detailLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AE8]);
  -[PKDashboardBalanceView addSubview:](self, "addSubview:", self->_detailLabel);
  v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  availableCreditLabel = self->_availableCreditLabel;
  self->_availableCreditLabel = v11;

  -[UILabel setNumberOfLines:](self->_availableCreditLabel, "setNumberOfLines:", 1);
  v13 = self->_availableCreditLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v13, "setTextColor:", v14);

  -[UILabel setAccessibilityIdentifier:](self->_availableCreditLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D680C8]);
  -[PKDashboardBalanceView addSubview:](self, "addSubview:", self->_availableCreditLabel);
  v29 = 0x4034000000000000;
  v30 = xmmword_19DEE0240;
  v31 = vdupq_n_s64(2uLL);
  v15 = -[PKContinuousButton initWithConfiguration:]([PKContinuousButton alloc], "initWithConfiguration:", &v29);
  actionButton = self->_actionButton;
  self->_actionButton = v15;

  v17 = self->_actionButton;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKContinuousButton setTintColor:](v17, "setTintColor:", v18);

  v19 = self->_actionButton;
  objc_msgSend((id)objc_opt_class(), "defaultBackgroundColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKContinuousButton updateTitleColorWithColor:](v19, "updateTitleColorWithColor:", v20);

  -[PKContinuousButton setContentEdgeInsets:](self->_actionButton, "setContentEdgeInsets:", 10.0, 16.0, 10.0, 16.0);
  -[PKContinuousButton addTarget:action:forControlEvents:](self->_actionButton, "addTarget:action:forControlEvents:", self, sel__buttonPressed_, 64);
  -[PKContinuousButton setAccessibilityIdentifier:](self->_actionButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67830]);
  -[PKDashboardBalanceView addSubview:](self, "addSubview:", self->_actionButton);
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithWeight:", 6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "configurationByApplyingConfiguration:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("chevron.forward"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v24);
  disclosureView = self->_disclosureView;
  self->_disclosureView = v25;

  v27 = self->_disclosureView;
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](v27, "setTintColor:", v28);

  -[PKDashboardBalanceView addSubview:](self, "addSubview:", self->_disclosureView);
  -[PKDashboardBalanceView resetFonts](self, "resetFonts");
  -[PKDashboardBalanceView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67928]);

}

- (void)resetFonts
{
  UILabel *titleLabel;
  void *v4;
  void *v5;
  void *v6;
  UILabel *detailLabel;
  void *v8;
  UILabel *availableCreditLabel;
  void *v10;
  void *v11;
  id v12;

  titleLabel = self->_titleLabel;
  v4 = (void *)*MEMORY[0x1E0DC4A88];
  v5 = (void *)*MEMORY[0x1E0DC48D0];
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48D0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](titleLabel, "setFont:", v6);

  detailLabel = self->_detailLabel;
  PKFontForDesign((void *)*MEMORY[0x1E0DC13A8], (void *)*MEMORY[0x1E0DC4B50], v5, 32770, 0, *MEMORY[0x1E0DC1420]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](detailLabel, "setFont:", v8);

  availableCreditLabel = self->_availableCreditLabel;
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B10], (NSString *)v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](availableCreditLabel, "setFont:", v10);

  -[PKContinuousButton titleLabel](self->_actionButton, "titleLabel");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  PKFontForDefaultDesign(v4, (void *)*MEMORY[0x1E0DC48F0], 2, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v11);

}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setTitle:(id)a3
{
  id v4;
  NSString *title;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;

  v4 = a3;
  title = self->_title;
  v10 = (NSString *)v4;
  v6 = title;
  if (v6 == v10)
  {

  }
  else
  {
    if (v10 && v6)
    {
      v7 = -[NSString isEqualToString:](v10, "isEqualToString:", v6);

      if (v7)
        goto LABEL_9;
    }
    else
    {

    }
    v8 = (NSString *)-[NSString copy](v10, "copy");
    v9 = self->_title;
    self->_title = v8;

    -[UILabel setText:](self->_titleLabel, "setText:", self->_title);
    -[PKDashboardBalanceView setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setTitleColor:(id)a3
{
  UIColor **p_titleColor;
  UILabel *titleLabel;
  void *v7;
  id v8;

  p_titleColor = &self->_titleColor;
  v8 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleColor, a3);
    titleLabel = self->_titleLabel;
    if (*p_titleColor)
    {
      -[UILabel setTextColor:](self->_titleLabel, "setTextColor:");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](titleLabel, "setTextColor:", v7);

    }
    -[PKDashboardBalanceView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setBalance:(id)a3
{
  id v5;
  NSString *balance;
  NSString *v7;
  BOOL v8;
  NSString *v9;

  v5 = a3;
  balance = self->_balance;
  v9 = (NSString *)v5;
  v7 = balance;
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
    objc_storeStrong((id *)&self->_balance, a3);
    -[UILabel setText:](self->_detailLabel, "setText:", self->_balance);
    -[PKDashboardBalanceView setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setAvailableCredit:(id)a3
{
  id v5;
  NSString *availableCredit;
  NSString *v7;
  BOOL v8;
  NSString *v9;

  v5 = a3;
  availableCredit = self->_availableCredit;
  v9 = (NSString *)v5;
  v7 = availableCredit;
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
    objc_storeStrong((id *)&self->_availableCredit, a3);
    -[UILabel setText:](self->_availableCreditLabel, "setText:", self->_availableCredit);
    -[PKDashboardBalanceView setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setTopUpTitle:(id)a3
{
  id v5;
  NSString *topUpTitle;
  NSString *v7;
  BOOL v8;
  NSString *v9;

  v5 = a3;
  topUpTitle = self->_topUpTitle;
  v9 = (NSString *)v5;
  v7 = topUpTitle;
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
    objc_storeStrong((id *)&self->_topUpTitle, a3);
    -[PKContinuousButton setTitle:forState:](self->_actionButton, "setTitle:forState:", self->_topUpTitle, 0);
    -[PKDashboardBalanceView setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setTopUpAction:(id)a3
{
  void *v4;
  id topUpAction;

  v4 = _Block_copy(a3);
  topUpAction = self->_topUpAction;
  self->_topUpAction = v4;

  -[PKContinuousButton setHidden:](self->_actionButton, "setHidden:", self->_topUpAction == 0);
  -[PKDashboardBalanceView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTopUpEnabled:(BOOL)a3
{
  PKContinuousButton *actionButton;
  void *v5;
  PKContinuousButton *v6;
  uint64_t v7;
  PKContinuousButton *v8;
  void *v9;
  PKContinuousButton *v10;
  id v11;

  if (((!self->_topUpEnabled ^ a3) & 1) == 0)
  {
    self->_topUpEnabled = a3;
    -[PKContinuousButton setEnabled:](self->_actionButton, "setEnabled:");
    actionButton = self->_actionButton;
    if (self->_topUpEnabled)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKContinuousButton setTintColor:](actionButton, "setTintColor:", v5);

      v6 = self->_actionButton;
      objc_msgSend((id)objc_opt_class(), "defaultBackgroundColor");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemFillColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKContinuousButton setTintColor:](actionButton, "setTintColor:", v9);

      v10 = self->_actionButton;
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v10;
    }
    v11 = (id)v7;
    -[PKContinuousButton updateTitleColorWithColor:](v8, "updateTitleColorWithColor:");

  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKDashboardBalanceView;
  -[PKDashboardCollectionViewCell layoutSubviews](&v3, sel_layoutSubviews);
  -[PKDashboardBalanceView bounds](self, "bounds");
  -[PKDashboardBalanceView _layoutWithBounds:](self, "_layoutWithBounds:");
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
  CGSize result;

  height = a3.height;
  width = a3.width;
  self->_isTemplateLayout = 1;
  v6 = *MEMORY[0x1E0C9D538];
  v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[PKDashboardCollectionViewCell horizontalInset](self, "horizontalInset");
  -[PKDashboardBalanceView _layoutWithBounds:](self, "_layoutWithBounds:", v6, v7, width + v8 * -2.0, height);
  self->_isTemplateLayout = 0;
  v11 = fmin(height, 80.0);
  if (v10 < 80.0)
    v10 = v11;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRectEdge v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  void *v22;
  char v23;
  CGFloat v24;
  UIImageView *disclosureView;
  id topUpAction;
  char v27;
  PKContinuousButton *actionButton;
  BOOL v29;
  char v30;
  UILabel *titleLabel;
  CGFloat v32;
  double v33;
  UILabel *detailLabel;
  double v35;
  CGFloat v36;
  double v37;
  UILabel *availableCreditLabel;
  char v39;
  PKContinuousButton *v40;
  double v41;
  double v42;
  uint64_t v43;
  double v44;
  CGFloat width;
  CGFloat height;
  CGFloat v47;
  CGFloat v48;
  CGFloat x;
  CGFloat y;
  CGRect remainder;
  CGRect slice;
  CGSize result;
  CGRect v54;
  CGRect v55;

  x = a3.origin.x;
  y = a3.origin.y;
  v4 = a3.origin.x + 13.0;
  v5 = a3.origin.y + 16.0;
  width = a3.size.width;
  height = a3.size.height;
  v6 = a3.size.width + -26.0;
  v7 = a3.size.height + -32.0;
  if (-[PKDashboardBalanceView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    v8 = CGRectMinXEdge;
  else
    v8 = CGRectMaxXEdge;
  remainder.origin.x = v4;
  remainder.origin.y = v5;
  remainder.size.width = v6;
  remainder.size.height = v7;
  -[UILabel font](self->_titleLabel, "font");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pointSize");
  v11 = v10;

  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v6, v7);
  v44 = v12;
  v47 = v13;
  -[UILabel sizeThatFits:](self->_detailLabel, "sizeThatFits:", v6, v7);
  v15 = v14;
  -[PKContinuousButton sizeThatFits:](self->_actionButton, "sizeThatFits:", v6, v7);
  v17 = v16;
  v48 = v18;
  if (self->_showDisclosure)
  {
    -[UIImageView sizeThatFits:](self->_disclosureView, "sizeThatFits:", v6, v7);
    v20 = v19;
    v43 = v21;
  }
  else
  {
    v20 = *MEMORY[0x1E0C9D820];
    v43 = *(_QWORD *)(MEMORY[0x1E0C9D820] + 8);
  }
  if (v11 < 30.0 && fmax(v44, v15) + v17 + v20 + 26.0 <= v6)
  {
    -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 2);
    -[PKContinuousButton titleLabel](self->_actionButton, "titleLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setNumberOfLines:", 1);
    v23 = 0;
  }
  else
  {
    -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0, v43);
    -[PKContinuousButton titleLabel](self->_actionButton, "titleLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setNumberOfLines:", 0);
    v23 = 1;
  }

  memset(&slice, 0, sizeof(slice));
  if (v17 <= v6)
    v24 = v17;
  else
    v24 = v6;
  if (self->_showDisclosure)
  {
    v54.origin.x = v4;
    v54.origin.y = v5;
    v54.size.width = v6;
    v54.size.height = v7;
    CGRectDivide(v54, &slice, &remainder, v20, v8);
    if (!self->_isTemplateLayout)
    {
      disclosureView = self->_disclosureView;
      PKSizeAlignedInRect();
      -[UIImageView setFrame:](disclosureView, "setFrame:");
    }
    CGRectDivide(remainder, &slice, &remainder, 13.0, v8);
  }
  else
  {
    -[UIImageView setFrame:](self->_disclosureView, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  topUpAction = self->_topUpAction;
  if (topUpAction)
    v27 = v23;
  else
    v27 = 1;
  if ((v27 & 1) == 0)
  {
    CGRectDivide(remainder, &slice, &remainder, v24, v8);
    if (!self->_isTemplateLayout)
    {
      actionButton = self->_actionButton;
      PKSizeAlignedInRect();
      -[PKContinuousButton setFrame:](actionButton, "setFrame:");
    }
    CGRectDivide(remainder, &slice, &remainder, 4.0, v8);
    topUpAction = self->_topUpAction;
  }
  v29 = topUpAction == 0;
  v30 = v23 ^ 1;
  if (v29)
    v30 = 1;
  if ((v30 & 1) != 0)
    PKContentAlignmentMake();
  CGRectDivide(remainder, &slice, &remainder, v47, CGRectMinYEdge);
  if (!self->_isTemplateLayout)
  {
    titleLabel = self->_titleLabel;
    PKSizeAlignedInRect();
    -[UILabel setFrame:](titleLabel, "setFrame:");
  }
  -[UILabel sizeThatFits:](self->_detailLabel, "sizeThatFits:", remainder.size.width, remainder.size.height, v43);
  v33 = v32;
  CGRectDivide(remainder, &slice, &remainder, v32, CGRectMinYEdge);
  if (!self->_isTemplateLayout)
  {
    detailLabel = self->_detailLabel;
    PKSizeAlignedInRect();
    -[UILabel setFrame:](detailLabel, "setFrame:");
  }
  v35 = v47 + 16.0 + v33;
  if (-[NSString length](self->_availableCredit, "length"))
  {
    -[UILabel sizeThatFits:](self->_availableCreditLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
    v37 = v36;
    CGRectDivide(remainder, &slice, &remainder, v36, CGRectMinYEdge);
    v35 = v35 + v37;
    if (!self->_isTemplateLayout)
    {
      availableCreditLabel = self->_availableCreditLabel;
      PKSizeAlignedInRect();
      -[UILabel setFrame:](availableCreditLabel, "setFrame:");
    }
  }
  v39 = v23 ^ 1;
  if (!self->_topUpAction)
    v39 = 1;
  if ((v39 & 1) == 0)
  {
    CGRectDivide(remainder, &slice, &remainder, 1.0, CGRectMinYEdge);
    CGRectDivide(remainder, &slice, &remainder, v48, CGRectMinYEdge);
    v35 = v48 + 1.0 + v35;
    if (!self->_isTemplateLayout)
    {
      if (self->_topUpAction)
      {
        v40 = self->_actionButton;
        PKSizeAlignedInRect();
        -[PKContinuousButton setFrame:](v40, "setFrame:");
      }
    }
  }
  CGRectDivide(remainder, &slice, &remainder, 16.0, CGRectMinYEdge);
  v55.origin.x = x;
  v55.origin.y = y;
  v55.size.width = width;
  v55.size.height = height;
  v41 = CGRectGetWidth(v55);
  v42 = v35 + 16.0;
  result.height = v42;
  result.width = v41;
  return result;
}

- (void)_buttonPressed:(id)a3
{
  void (**topUpAction)(void);

  topUpAction = (void (**)(void))self->_topUpAction;
  if (topUpAction)
    topUpAction[2]();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSComparisonResult v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKDashboardBalanceView;
  -[PKDashboardBalanceView traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[PKDashboardBalanceView traitCollection](self, "traitCollection");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
  {
    if (v5)
    {
      objc_msgSend(v4, "preferredContentSizeCategory");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "preferredContentSizeCategory");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      v9 = UIContentSizeCategoryCompareToCategory(v7, v8);

      if (v9)
        -[PKDashboardBalanceView resetFonts](self, "resetFonts");
    }
  }

}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (NSString)balance
{
  return self->_balance;
}

- (NSString)availableCredit
{
  return self->_availableCredit;
}

- (NSString)topUpTitle
{
  return self->_topUpTitle;
}

- (id)topUpAction
{
  return self->_topUpAction;
}

- (BOOL)topUpEnabled
{
  return self->_topUpEnabled;
}

- (BOOL)showDisclosure
{
  return self->_showDisclosure;
}

- (void)setShowDisclosure:(BOOL)a3
{
  self->_showDisclosure = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_topUpAction, 0);
  objc_storeStrong((id *)&self->_topUpTitle, 0);
  objc_storeStrong((id *)&self->_availableCredit, 0);
  objc_storeStrong((id *)&self->_balance, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_disclosureView, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_availableCreditLabel, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
