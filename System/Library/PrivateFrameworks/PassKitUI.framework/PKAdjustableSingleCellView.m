@implementation PKAdjustableSingleCellView

- (PKAdjustableSingleCellView)init
{
  PKAdjustableSingleCellView *v2;
  PKAdjustableSingleCellView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKAdjustableSingleCellView;
  v2 = -[PKAdjustableSingleCellView init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PKAdjustableSingleCellView _performInit](v2, "_performInit");
  return v3;
}

- (PKAdjustableSingleCellView)initWithFrame:(CGRect)a3
{
  PKAdjustableSingleCellView *v3;
  PKAdjustableSingleCellView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKAdjustableSingleCellView;
  v3 = -[PKAdjustableSingleCellView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PKAdjustableSingleCellView _performInit](v3, "_performInit");
  return v4;
}

- (int64_t)viewType
{
  return 0;
}

- (void)prepareForReuse
{
  -[UILabel setText:](self->_titleView, "setText:", 0);
  -[UILabel setText:](self->_detailView, "setText:", 0);
  -[UILabel setText:](self->_subDetailView, "setText:", 0);
  -[PKContinuousButton setAlpha:](self->_actionButton, "setAlpha:", 0.0);
  -[UIImageView setAlpha:](self->_disclosureView, "setAlpha:", 0.0);
}

- (void)_performInit
{
  self->_topPadding = 0.0;
  self->_isTemplateLayout = 0;
  self->_deferUpdateCounter = 0;
  self->_animated = 0;
  -[PKAdjustableSingleCellView _setupViews](self, "_setupViews");
  -[PKAdjustableSingleCellView _applyStyles](self, "_applyStyles");
  -[PKAdjustableSingleCellView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67890]);
}

- (void)_setupViews
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UILabel *v9;
  UILabel *titleView;
  UILabel *v11;
  UILabel *detailView;
  UILabel *v13;
  UILabel *subDetailView;
  PKContinuousButton *v15;
  PKContinuousButton *actionButton;
  id v17;
  void *v18;
  UIImageView *v19;
  UIImageView *disclosureView;
  UIImageView *v21;
  void *v22;
  uint64_t v23;
  int64x2_t v24;
  int64x2_t v25;

  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView pkui_setMaskType:](self, "pkui_setMaskType:", 3);
  v4 = objc_alloc(MEMORY[0x1E0DC3990]);
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v9 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
  titleView = self->_titleView;
  self->_titleView = v9;

  -[UILabel setAccessibilityIdentifier:](self->_titleView, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
  v11 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
  detailView = self->_detailView;
  self->_detailView = v11;

  -[UILabel setAccessibilityIdentifier:](self->_detailView, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AE8]);
  v13 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
  subDetailView = self->_subDetailView;
  self->_subDetailView = v13;

  -[UILabel setAccessibilityIdentifier:](self->_subDetailView, "setAccessibilityIdentifier:", *MEMORY[0x1E0D680C8]);
  v23 = 0;
  v24 = vdupq_n_s64(2uLL);
  v25 = v24;
  v15 = -[PKContinuousButton initWithConfiguration:]([PKContinuousButton alloc], "initWithConfiguration:", &v23);
  actionButton = self->_actionButton;
  self->_actionButton = v15;

  -[PKContinuousButton addTarget:action:forControlEvents:](self->_actionButton, "addTarget:action:forControlEvents:", self, sel__actionButtonTapped_, 64);
  -[PKContinuousButton setAlpha:](self->_actionButton, "setAlpha:", 0.0);
  -[PKContinuousButton setAccessibilityIdentifier:](self->_actionButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67830]);
  v17 = objc_alloc(MEMORY[0x1E0DC3890]);
  PKUIChevronImage();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (UIImageView *)objc_msgSend(v17, "initWithImage:", v18);
  disclosureView = self->_disclosureView;
  self->_disclosureView = v19;

  v21 = self->_disclosureView;
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](v21, "setTintColor:", v22);

  -[UIImageView setAlpha:](self->_disclosureView, "setAlpha:", 0.0);
  -[PKAdjustableSingleCellView addSubview:](self, "addSubview:", self->_titleView);
  -[PKAdjustableSingleCellView addSubview:](self, "addSubview:", self->_detailView);
  -[PKAdjustableSingleCellView addSubview:](self, "addSubview:", self->_subDetailView);
  -[PKAdjustableSingleCellView addSubview:](self, "addSubview:", self->_actionButton);
  -[PKAdjustableSingleCellView addSubview:](self, "addSubview:", self->_disclosureView);
  -[PKAdjustableSingleCellView setBackgroundColor:](self, "setBackgroundColor:", v3);

}

- (id)_titleFont
{
  void *v3;
  double v4;

  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48D0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lineHeight");
  PKFloatRoundToPixel();
  self->_topPadding = v4;
  return v3;
}

- (id)_detailFont
{
  UILabel *detailView;
  void *v3;

  detailView = self->_detailView;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](detailView, "setTextColor:", v3);

  return PKFontForDesign((void *)*MEMORY[0x1E0DC13A8], (void *)*MEMORY[0x1E0DC4B50], (void *)*MEMORY[0x1E0DC48C0], 2, 0, *MEMORY[0x1E0DC1420]);
}

- (id)_smallerDetailFont
{
  UILabel *detailView;
  void *v3;

  detailView = self->_detailView;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](detailView, "setTextColor:", v3);

  return PKFontForDesign((void *)*MEMORY[0x1E0DC13A8], (void *)*MEMORY[0x1E0DC4B58], (void *)*MEMORY[0x1E0DC48C0], 2, 0, *MEMORY[0x1E0DC1420]);
}

- (id)_subDetailFont
{
  return PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B10], (NSString *)*MEMORY[0x1E0DC48D0]);
}

- (void)_applyStyles
{
  void *v3;
  id v4;

  -[PKContinuousButton setContentEdgeInsets:](self->_actionButton, "setContentEdgeInsets:", 10.0, 16.0, 10.0, 16.0);
  -[PKContinuousButton titleLabel](self->_actionButton, "titleLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextAlignment:", 1);
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC48F0], 2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v3);

  objc_msgSend(v4, "setAdjustsFontSizeToFitWidth:", 1);
  -[PKAdjustableSingleCellView setNeedsLayout](self, "setNeedsLayout");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  CGSize result;

  self->_isTemplateLayout = 1;
  -[PKAdjustableSingleCellView _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  self->_isTemplateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKAdjustableSingleCellView;
  -[PKAdjustableSingleCellView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKAdjustableSingleCellView bounds](self, "bounds");
  -[PKAdjustableSingleCellView _layoutWithBounds:](self, "_layoutWithBounds:");
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  NSString *v9;
  _BOOL4 IsAccessibilityCategory;
  double v11;
  double v12;
  CGRectEdge v13;
  UILabel *titleView;
  void *v15;
  UILabel *detailView;
  void *v17;
  UILabel *subDetailView;
  void *v19;
  int64_t v20;
  double v21;
  double v22;
  CGFloat v23;
  UIImageView *disclosureView;
  double v25;
  double v26;
  CGFloat v27;
  PKContinuousButton *actionButton;
  double v29;
  PKContinuousButton *v30;
  double v31;
  CGFloat v32;
  NSString *detail;
  void *v34;
  double v35;
  NSString *v36;
  id v37;
  NSString *v38;
  NSString *v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  UILabel *v48;
  void *v49;
  CGFloat v50;
  CGFloat v51;
  double v52;
  double v53;
  double v54;
  CGRect slice;
  CGRect remainder;
  uint64_t v57;
  _QWORD v58[3];
  CGSize result;
  CGRect v60;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v58[1] = *MEMORY[0x1E0C80C00];
  -[PKAdjustableSingleCellView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredContentSizeCategory");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v9);

  v11 = x + 10.0;
  v12 = y + 0.0;
  if (-[PKAdjustableSingleCellView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    v13 = CGRectMinXEdge;
  else
    v13 = CGRectMaxXEdge;
  remainder.origin.x = v11;
  remainder.origin.y = v12;
  remainder.size.width = width + -20.0;
  remainder.size.height = height;
  titleView = self->_titleView;
  -[PKAdjustableSingleCellView _titleFont](self, "_titleFont");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](titleView, "setFont:", v15);

  detailView = self->_detailView;
  -[PKAdjustableSingleCellView _detailFont](self, "_detailFont");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](detailView, "setFont:", v17);

  subDetailView = self->_subDetailView;
  -[PKAdjustableSingleCellView _subDetailFont](self, "_subDetailFont");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](subDetailView, "setFont:", v19);

  if (IsAccessibilityCategory)
    v20 = 0;
  else
    v20 = 4;
  self->_titleLineBreakMode = v20;
  -[UILabel setNumberOfLines:](self->_titleView, "setNumberOfLines:", !IsAccessibilityCategory);
  self->_detailLineBreakMode = v20;
  -[UILabel setNumberOfLines:](self->_detailView, "setNumberOfLines:", !IsAccessibilityCategory);
  self->_subDetailLineBreakMode = v20;
  -[UILabel setNumberOfLines:](self->_subDetailView, "setNumberOfLines:", !IsAccessibilityCategory);
  memset(&slice, 0, sizeof(slice));
  -[UIImageView alpha](self->_disclosureView, "alpha");
  if (v21 > 0.0)
  {
    -[UIImageView sizeThatFits:](self->_disclosureView, "sizeThatFits:", width + -20.0, height);
    v23 = v22;
    v60.origin.x = v11;
    v60.origin.y = v12;
    v60.size.width = width + -20.0;
    v60.size.height = height;
    CGRectDivide(v60, &slice, &remainder, v23, v13);
    if (!self->_isTemplateLayout)
    {
      disclosureView = self->_disclosureView;
      PKSizeAlignedInRect();
      -[UIImageView setFrame:](disclosureView, "setFrame:");
    }
    CGRectDivide(remainder, &slice, &remainder, 10.0, v13);
  }
  -[PKContinuousButton alpha](self->_actionButton, "alpha");
  if (v25 > 0.0)
  {
    -[PKContinuousButton sizeThatFits:](self->_actionButton, "sizeThatFits:", remainder.size.width, remainder.size.height);
    v27 = v26;
    if (IsAccessibilityCategory)
    {
      CGRectDivide(remainder, &slice, &remainder, 10.0, CGRectMaxYEdge);
      CGRectDivide(remainder, &slice, &remainder, v27, CGRectMaxYEdge);
      if (!self->_isTemplateLayout)
      {
        actionButton = self->_actionButton;
        PKSizeAlignedInRect();
        -[PKContinuousButton setFrame:](actionButton, "setFrame:");
      }
      CGRectDivide(remainder, &slice, &remainder, 10.0, CGRectMaxYEdge);
      PKFloatRoundToPixel();
    }
    else
    {
      PKSizeRoundToPixel();
      CGRectDivide(remainder, &slice, &remainder, v29 + 16.0, v13);
      if (!self->_isTemplateLayout)
      {
        v30 = self->_actionButton;
        PKContentAlignmentMake();
        PKSizeAlignedInRect();
        -[PKContinuousButton setFrame:](v30, "setFrame:");
      }
    }
  }
  -[UILabel sizeThatFits:](self->_titleView, "sizeThatFits:", remainder.size.width, 1.79769313e308);
  v32 = v31;
  CGRectDivide(remainder, &slice, &remainder, self->_topPadding + 10.0, CGRectMinYEdge);
  CGRectDivide(remainder, &slice, &remainder, v32, CGRectMinYEdge);
  if (!self->_isTemplateLayout)
    -[UILabel setFrame:](self->_titleView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  CGRectDivide(remainder, &slice, &remainder, 2.0, CGRectMinYEdge);
  if (!IsAccessibilityCategory)
  {
    detail = self->_detail;
    -[PKAdjustableSingleCellView _detailFont](self, "_detailFont");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = remainder.size.width;
    v36 = detail;
    v37 = v34;
    v38 = v36;
    v39 = v38;
    if (v38 && (v40 = -[NSString length](v38, "length"), v39, v40))
    {
      v41 = objc_alloc(MEMORY[0x1E0CB3498]);
      v57 = *MEMORY[0x1E0DC1138];
      v58[0] = v37;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, &v57, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)objc_msgSend(v41, "initWithString:attributes:", v39, v42);

      objc_msgSend(v43, "pkui_sizeThatFits:withNumberOfLines:forceWordWrap:", 1, 0, v35, 1.79769313e308);
      v45 = v44;
      objc_msgSend(v43, "pkui_sizeThatFits:withNumberOfLines:forceWordWrap:", 2, 1);
      v47 = v46;

      if (v47 > v45)
      {
        v48 = self->_detailView;
        -[PKAdjustableSingleCellView _smallerDetailFont](self, "_smallerDetailFont");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v48, "setFont:", v49);

        if (!-[NSString length](self->_title, "length"))
        {
          -[UILabel setNumberOfLines:](self->_detailView, "setNumberOfLines:", 2);
          self->_detailLineBreakMode = 0;
        }
      }
    }
    else
    {

    }
  }
  -[UILabel sizeThatFits:](self->_detailView, "sizeThatFits:", remainder.size.width, 1.79769313e308);
  CGRectDivide(remainder, &slice, &remainder, v50, CGRectMinYEdge);
  if (!self->_isTemplateLayout)
    -[UILabel setFrame:](self->_detailView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  CGRectDivide(remainder, &slice, &remainder, 2.0, CGRectMinYEdge);
  if (-[PKAdjustableSingleCellView _needsThirdLine](self, "_needsThirdLine"))
  {
    -[UILabel sizeThatFits:](self->_subDetailView, "sizeThatFits:", remainder.size.width, 1.79769313e308);
    CGRectDivide(remainder, &slice, &remainder, v51, CGRectMinYEdge);
    if (!self->_isTemplateLayout)
      -[UILabel setFrame:](self->_subDetailView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    CGRectDivide(remainder, &slice, &remainder, self->_topPadding + 10.0, CGRectMinYEdge);
  }
  PKFloatRoundToPixel();
  v53 = v52;
  v54 = width;
  result.height = v53;
  result.width = v54;
  return result;
}

- (void)_actionButtonTapped:(id)a3
{
  void (**actionHandler)(id, PKAdjustableSingleCellView *, PKPaymentPassAction *);

  actionHandler = (void (**)(id, PKAdjustableSingleCellView *, PKPaymentPassAction *))self->_actionHandler;
  if (actionHandler)
    actionHandler[2](actionHandler, self, self->_action);
}

- (void)setEnableDisclosure:(BOOL)a3
{
  if (self->_enableDisclosure != a3)
    self->_enableDisclosure = a3;
}

- (void)setAction:(id)a3
{
  PKPaymentPassAction **p_action;
  id v6;

  v6 = a3;
  if (!v6)
    -[PKContinuousButton setAlpha:](self->_actionButton, "setAlpha:", 0.0);
  p_action = &self->_action;
  if ((PKEqualObjects() & 1) == 0)
    objc_storeStrong((id *)p_action, a3);

}

- (void)setActionHandler:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id actionHandler;
  id aBlock;

  aBlock = a3;
  if (!aBlock)
    -[PKContinuousButton setAlpha:](self->_actionButton, "setAlpha:", 0.0);
  v4 = _Block_copy(self->_actionHandler);
  v5 = _Block_copy(aBlock);
  v6 = PKEqualObjects();

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_msgSend(aBlock, "copy");
    actionHandler = self->_actionHandler;
    self->_actionHandler = v7;

  }
}

- (void)setTitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *title;
  NSString *v10;
  NSString *v11;

  v4 = a3;
  v5 = self->_title;
  v6 = (NSString *)v4;
  v11 = v6;
  if (v5 == v6)
  {

    title = v11;
  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v6);

      v8 = v11;
      if (v7)
        goto LABEL_10;
    }
    else
    {

      v8 = v11;
    }
    v10 = v8;
    title = self->_title;
    self->_title = v10;
  }

  v8 = v11;
LABEL_10:

}

- (void)setDetail:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *detail;
  NSString *v10;
  NSString *v11;

  v4 = a3;
  v5 = self->_detail;
  v6 = (NSString *)v4;
  v11 = v6;
  if (v5 == v6)
  {

    detail = v11;
  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v6);

      v8 = v11;
      if (v7)
        goto LABEL_10;
    }
    else
    {

      v8 = v11;
    }
    v10 = v8;
    detail = self->_detail;
    self->_detail = v10;
  }

  v8 = v11;
LABEL_10:

}

- (void)setSubDetail:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *subDetail;
  NSString *v10;
  NSString *v11;

  v4 = a3;
  v5 = self->_subDetail;
  v6 = (NSString *)v4;
  v11 = v6;
  if (v5 == v6)
  {

    subDetail = v11;
  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v6);

      v8 = v11;
      if (v7)
        goto LABEL_10;
    }
    else
    {

      v8 = v11;
    }
    v10 = v8;
    subDetail = self->_subDetail;
    self->_subDetail = v10;
  }

  v8 = v11;
LABEL_10:

}

- (void)setPass:(id)a3
{
  PKPaymentPass **p_pass;
  id v5;

  p_pass = &self->_pass;
  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
    objc_storeStrong((id *)p_pass, a3);

}

- (void)setTitleColor:(id)a3
{
  UIColor **p_titleColor;
  id v5;

  p_titleColor = &self->_titleColor;
  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
    objc_storeStrong((id *)p_titleColor, a3);

}

- (void)setDetailColor:(id)a3
{
  UIColor **p_detailColor;
  id v5;

  p_detailColor = &self->_detailColor;
  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
    objc_storeStrong((id *)p_detailColor, a3);

}

- (void)setSubDetailColor:(id)a3
{
  UIColor **p_subDetailColor;
  id v5;

  p_subDetailColor = &self->_subDetailColor;
  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
    objc_storeStrong((id *)p_subDetailColor, a3);

}

- (void)setTitleLineBreakMode:(int64_t)a3
{
  if (self->_titleLineBreakMode != a3)
    self->_titleLineBreakMode = a3;
}

- (void)setDetailLineBreakMode:(int64_t)a3
{
  if (self->_detailLineBreakMode != a3)
    self->_detailLineBreakMode = a3;
}

- (void)setSubDetailLineBreakMode:(int64_t)a3
{
  if (self->_subDetailLineBreakMode != a3)
    self->_subDetailLineBreakMode = a3;
}

- (void)layoutIfNeededAnimated:(BOOL)a3
{
  self->_animated = a3;
  -[PKAdjustableSingleCellView layoutIfNeeded](self, "layoutIfNeeded");
  self->_animated = 0;
}

- (BOOL)_needsThirdLine
{
  return self->_subDetail != 0;
}

- (void)beginUpdates
{
  ++self->_deferUpdateCounter;
}

- (void)endUpdates:(BOOL)a3
{
  unint64_t v3;

  v3 = self->_deferUpdateCounter - 1;
  self->_deferUpdateCounter = v3;
  if (!v3)
    -[PKAdjustableSingleCellView _updateContent:](self, "_updateContent:", a3);
}

- (void)_updateContent:(BOOL)a3
{
  _BOOL4 v3;
  PKContinuousButton *actionButton;
  void *v6;
  PKContinuousButton *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  void *disclosureView;
  unsigned int enableDisclosure;
  PKContinuousButton *v14;
  void *v15;
  UILabel *titleView;
  NSString *title;
  UIColor *titleColor;
  void *v19;
  int64_t titleLineBreakMode;
  UILabel *detailView;
  NSString *detail;
  UIColor *detailColor;
  void *v24;
  int64_t detailLineBreakMode;
  UILabel *subDetailView;
  NSString *subDetail;
  UIColor *subDetailColor;
  void *v29;
  int64_t subDetailLineBreakMode;

  if (!self->_deferUpdateCounter)
  {
    v3 = a3;
    -[PKAdjustableSingleCellView _applyStyles](self, "_applyStyles");
    actionButton = self->_actionButton;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKContinuousButton setTintColor:](actionButton, "setTintColor:", v6);

    v7 = self->_actionButton;
    -[PKAdjustableSingleCellView backgroundColor](self, "backgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKContinuousButton updateTitleColorWithColor:](v7, "updateTitleColorWithColor:", v8);

    -[PKAdjustableSingleCellView pass](self, "pass");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "activationState");

    if (self->_action)
      v11 = v10 == 0;
    else
      v11 = 0;
    if (v11)
    {
      -[PKAdjustableSingleCellView bringSubviewToFront:](self, "bringSubviewToFront:", self->_actionButton);
      -[PKContinuousButton setEnabled:](self->_actionButton, "setEnabled:", 1);
      v14 = self->_actionButton;
      -[PKPaymentPassAction title](self->_action, "title");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKContinuousButton setTitle:forState:](v14, "setTitle:forState:", v15, 0);

      disclosureView = self->_actionButton;
      enableDisclosure = 1;
    }
    else
    {
      __45__PKAdjustableSingleCellView__updateContent___block_invoke(self->_actionButton, 0, v3);
      disclosureView = self->_disclosureView;
      enableDisclosure = self->_enableDisclosure;
    }
    __45__PKAdjustableSingleCellView__updateContent___block_invoke(disclosureView, enableDisclosure, v3);
    titleView = self->_titleView;
    title = self->_title;
    titleColor = self->_titleColor;
    v19 = titleColor;
    if (!titleColor)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (self->_titleLineBreakMode)
      titleLineBreakMode = self->_titleLineBreakMode;
    else
      titleLineBreakMode = 4;
    __45__PKAdjustableSingleCellView__updateContent___block_invoke_2(titleView, (uint64_t)title, v19, titleLineBreakMode, v3);
    if (!titleColor)

    detailView = self->_detailView;
    detail = self->_detail;
    detailColor = self->_detailColor;
    v24 = detailColor;
    if (!detailColor)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (self->_detailLineBreakMode)
      detailLineBreakMode = self->_detailLineBreakMode;
    else
      detailLineBreakMode = 4;
    __45__PKAdjustableSingleCellView__updateContent___block_invoke_2(detailView, (uint64_t)detail, v24, detailLineBreakMode, v3);
    if (!detailColor)

    subDetailView = self->_subDetailView;
    subDetail = self->_subDetail;
    subDetailColor = self->_subDetailColor;
    v29 = subDetailColor;
    if (!subDetailColor)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (self->_subDetailLineBreakMode)
      subDetailLineBreakMode = self->_subDetailLineBreakMode;
    else
      subDetailLineBreakMode = 4;
    __45__PKAdjustableSingleCellView__updateContent___block_invoke_2(subDetailView, (uint64_t)subDetail, v29, subDetailLineBreakMode, v3);
    if (!subDetailColor)

    -[PKAdjustableSingleCellView setNeedsLayout](self, "setNeedsLayout");
    if (v3)
      -[PKAdjustableSingleCellView layoutIfNeededAnimated:](self, "layoutIfNeededAnimated:", 1);
  }
}

void __45__PKAdjustableSingleCellView__updateContent___block_invoke(void *a1, unsigned int a2, int a3)
{
  double v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a1;
  objc_msgSend(v10, "alpha");
  if (v5 != (double)a2)
  {
    v6 = v5;
    objc_msgSend(v10, "setAlpha:", (double)a2);
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0D676D0], "springAnimationWithKeyPath:", CFSTR("opacity"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v6, (double)a2);
      objc_msgSend(v10, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)objc_msgSend(v8, "pkui_addAdditiveAnimation:", v7);

    }
  }

}

void __45__PKAdjustableSingleCellView__updateContent___block_invoke_2(void *a1, uint64_t a2, void *a3, uint64_t a4, int a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  float v14;
  double v15;
  void *v16;
  id v17;
  double v18;
  id v19;

  v9 = a1;
  if (v9)
  {
    if (a3)
    {
      v19 = v9;
      v10 = a3;
      objc_msgSend(v19, "setText:", a2);
      objc_msgSend(v19, "setTextColor:", v10);

      objc_msgSend(v19, "setLineBreakMode:", a4);
      v9 = v19;
      if (a5)
      {
        objc_msgSend(v19, "layer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (a2)
          v13 = 1.0;
        else
          v13 = 0.0;
        objc_msgSend(v11, "opacity");
        v15 = v14;
        if (v13 != v14)
        {
          objc_msgSend(MEMORY[0x1E0D676D0], "springAnimationWithKeyPath:", CFSTR("opacity"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v15, v13);
          v17 = (id)objc_msgSend(v12, "pkui_addAdditiveAnimation:", v16);

          LODWORD(v18) = 0;
          if (a2)
            *(float *)&v18 = 1.0;
          objc_msgSend(v12, "setOpacity:", v18);
        }

        v9 = v19;
      }
    }
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSComparisonResult v9;
  void *v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKAdjustableSingleCellView;
  -[PKAdjustableSingleCellView traitCollectionDidChange:](&v12, sel_traitCollectionDidChange_, v4);
  -[PKAdjustableSingleCellView traitCollection](self, "traitCollection");
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
      {
        objc_msgSend(v4, "preferredContentSizeCategory");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)*MEMORY[0x1E0DC4938];

        if (v10 != v11)
          -[PKAdjustableSingleCellView _updateContent:](self, "_updateContent:", 0);
      }
    }
  }

}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (BOOL)enableDisclosure
{
  return self->_enableDisclosure;
}

- (PKPaymentPassAction)action
{
  return self->_action;
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (UIColor)detailColor
{
  return self->_detailColor;
}

- (UIColor)subDetailColor
{
  return self->_subDetailColor;
}

- (int64_t)titleLineBreakMode
{
  return self->_titleLineBreakMode;
}

- (int64_t)detailLineBreakMode
{
  return self->_detailLineBreakMode;
}

- (int64_t)subDetailLineBreakMode
{
  return self->_subDetailLineBreakMode;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)detail
{
  return self->_detail;
}

- (NSString)subDetail
{
  return self->_subDetail;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subDetail, 0);
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subDetailColor, 0);
  objc_storeStrong((id *)&self->_detailColor, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_subDetailView, 0);
  objc_storeStrong((id *)&self->_detailView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_disclosureView, 0);
}

@end
