@implementation PKPaymentAuthorizationTotalView

- (PKPaymentAuthorizationTotalView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  PKPaymentAuthorizationTotalView *v5;
  PKPaymentAuthorizationTotalView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPaymentAuthorizationTotalView;
  v5 = -[PKPaymentAuthorizationTotalView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_style = a4;
    v5->_labelNumberOfLines = 2;
    v5->_showsBoldValueText = 0;
    -[PKPaymentAuthorizationTotalView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PKPaymentAuthorizationTotalView _createSubviews](v6, "_createSubviews");
    -[PKPaymentAuthorizationTotalView _prepareConstraints](v6, "_prepareConstraints");
  }
  return v6;
}

- (PKPaymentAuthorizationTotalView)init
{
  return -[PKPaymentAuthorizationTotalView initWithFrame:style:](self, "initWithFrame:style:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (void)dealloc
{
  objc_super v3;

  if (self->_processing)
    -[UIActivityIndicatorView stopAnimating](self->_processingIndicator, "stopAnimating");
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentAuthorizationTotalView;
  -[PKPaymentAuthorizationTotalView dealloc](&v3, sel_dealloc);
}

- (void)setLabel:(id)a3 value:(id)a4
{
  UILabel *labelView;
  __CFString *v7;
  void *v8;
  void *v9;
  UILabel *valueView;
  const __CFString *v11;
  void *v12;

  labelView = self->_labelView;
  v7 = (__CFString *)a4;
  objc_msgSend(a3, "pk_uppercaseStringForPreferredLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationTotalView _labelAttributedStringWithString:](self, "_labelAttributedStringWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](labelView, "setAttributedText:", v9);

  valueView = self->_valueView;
  if (-[__CFString length](v7, "length"))
    v11 = v7;
  else
    v11 = CFSTR(" ");
  -[PKPaymentAuthorizationTotalView _valueAttributedStringWithString:](self, "_valueAttributedStringWithString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[UILabel setAttributedText:](valueView, "setAttributedText:", v12);
  -[PKPaymentAuthorizationTotalView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
  -[UIView setHidden:](self->_separatorView, "setHidden:", a3 != 2);
  -[PKPaymentAuthorizationTotalView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)setLabelNumberOfLines:(int64_t)a3
{
  if (self->_labelNumberOfLines != a3)
  {
    self->_labelNumberOfLines = a3;
    -[UILabel setNumberOfLines:](self->_labelView, "setNumberOfLines:");
    -[PKPaymentAuthorizationTotalView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)setProcessing:(BOOL)a3
{
  UIActivityIndicatorView *processingIndicator;
  _QWORD v5[5];

  if (((!self->_processing ^ a3) & 1) == 0)
  {
    self->_processing = a3;
    processingIndicator = self->_processingIndicator;
    if (a3)
      -[UIActivityIndicatorView startAnimating](processingIndicator, "startAnimating");
    else
      -[UIActivityIndicatorView stopAnimating](processingIndicator, "stopAnimating");
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __49__PKPaymentAuthorizationTotalView_setProcessing___block_invoke;
    v5[3] = &unk_1E3E612E8;
    v5[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v5, 0);
  }
}

uint64_t __49__PKPaymentAuthorizationTotalView_setProcessing___block_invoke(uint64_t a1, double a2)
{
  uint64_t v3;
  uint64_t v4;
  double v5;

  v3 = *(_QWORD *)(a1 + 32);
  LOBYTE(a2) = *(_BYTE *)(v3 + 513);
  objc_msgSend(*(id *)(v3 + 432), "setAlpha:", (double)*(unint64_t *)&a2);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = 0.0;
  if (!*(_BYTE *)(v4 + 513))
    v5 = 1.0;
  return objc_msgSend(*(id *)(v4 + 424), "setAlpha:", v5);
}

- (void)_createSubviews
{
  UIView *v3;
  UIView *separatorView;
  UIView *v5;
  void *v6;
  UILabel *v7;
  UILabel *labelView;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  UILabel *valueView;
  double v13;
  double v14;
  UILabel *v15;
  void *v16;
  UIActivityIndicatorView *v17;
  UIActivityIndicatorView *processingIndicator;

  v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  separatorView = self->_separatorView;
  self->_separatorView = v3;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_separatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = self->_separatorView;
  PKAuthorizationSeparatorColor();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v6);

  -[PKPaymentAuthorizationTotalView addSubview:](self, "addSubview:", self->_separatorView);
  v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  labelView = self->_labelView;
  self->_labelView = v7;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_labelView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_labelView, "setNumberOfLines:", self->_labelNumberOfLines);
  v9 = self->_labelView;
  -[PKPaymentAuthorizationTotalView _labelAttributedStringWithString:](self, "_labelAttributedStringWithString:", &stru_1E3E7D690);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](v9, "setAttributedText:", v10);

  -[UILabel setOpaque:](self->_labelView, "setOpaque:", 0);
  -[PKPaymentAuthorizationTotalView addSubview:](self, "addSubview:", self->_labelView);
  v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  valueView = self->_valueView;
  self->_valueView = v11;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_valueView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_valueView, "setNumberOfLines:", 1);
  LODWORD(v13) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_valueView, "setContentCompressionResistancePriority:forAxis:", 0, v13);
  LODWORD(v14) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_valueView, "setContentHuggingPriority:forAxis:", 0, v14);
  v15 = self->_valueView;
  -[PKPaymentAuthorizationTotalView _valueAttributedStringWithString:](self, "_valueAttributedStringWithString:", CFSTR(" "));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](v15, "setAttributedText:", v16);

  -[UILabel setOpaque:](self->_valueView, "setOpaque:", 0);
  -[PKPaymentAuthorizationTotalView addSubview:](self, "addSubview:", self->_valueView);
  v17 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
  processingIndicator = self->_processingIndicator;
  self->_processingIndicator = v17;

  -[UIActivityIndicatorView sizeToFit](self->_processingIndicator, "sizeToFit");
  -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_processingIndicator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIActivityIndicatorView setAlpha:](self->_processingIndicator, "setAlpha:", 0.0);
  -[PKPaymentAuthorizationTotalView addSubview:](self, "addSubview:", self->_processingIndicator);
}

- (BOOL)_shouldUseLargeTextLayout
{
  _BOOL4 v2;
  id *v3;
  NSString *v4;
  BOOL IsAccessibilityCategory;
  NSString *v6;
  NSComparisonResult v7;

  v2 = -[UIView pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts");
  v3 = (id *)MEMORY[0x1E0DC4730];
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  objc_msgSend(*v3, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = UIContentSizeCategoryCompareToCategory(v6, (UIContentSizeCategory)*MEMORY[0x1E0DC4900]);

  if (v2 && IsAccessibilityCategory)
    return 1;
  else
    return (v7 == NSOrderedDescending) & ~v2;
}

- (void)updateConstraints
{
  _BOOL8 v3;
  NSLayoutConstraint *leftMarginConstraint;
  double v5;
  int v6;
  int v7;
  NSLayoutConstraint *rightMarginConstraint;
  double v9;
  NSLayoutConstraint *rightMarginLargeTextConstraint;
  double v11;
  NSLayoutConstraint *labelBaselineConstraint;
  double v13;
  double v14;
  objc_super v15;

  v3 = -[PKPaymentAuthorizationTotalView _shouldUseLargeTextLayout](self, "_shouldUseLargeTextLayout");
  leftMarginConstraint = self->_leftMarginConstraint;
  if (v3)
  {
    v5 = 20.0;
    v6 = 1148813312;
    v7 = 1148846080;
  }
  else
  {
    -[PKPaymentAuthorizationLayout valueLeftMargin](self->_layout, "valueLeftMargin");
    v6 = 1148846080;
    v7 = 1144750080;
  }
  -[NSLayoutConstraint setConstant:](leftMarginConstraint, "setConstant:", v5);
  rightMarginConstraint = self->_rightMarginConstraint;
  -[PKPaymentAuthorizationLayout contentHorizontalMargin](self->_layout, "contentHorizontalMargin");
  -[NSLayoutConstraint setConstant:](rightMarginConstraint, "setConstant:", -v9);
  rightMarginLargeTextConstraint = self->_rightMarginLargeTextConstraint;
  -[PKPaymentAuthorizationLayout contentHorizontalMargin](self->_layout, "contentHorizontalMargin");
  -[NSLayoutConstraint setConstant:](rightMarginLargeTextConstraint, "setConstant:", -v11);
  labelBaselineConstraint = self->_labelBaselineConstraint;
  -[PKPaymentAuthorizationTotalView _initialLeading](self, "_initialLeading");
  -[NSLayoutConstraint setConstant:](labelBaselineConstraint, "setConstant:");
  LODWORD(v13) = v6;
  -[NSLayoutConstraint setPriority:](self->_leftMarginConstraint, "setPriority:", v13);
  -[NSLayoutConstraint setActive:](self->_valueBaselineLargeTextConstraint, "setActive:", v3);
  -[NSLayoutConstraint setActive:](self->_valueBaselineConstraint, "setActive:", v3 ^ 1);
  -[NSLayoutConstraint setActive:](self->_labelValueRelationLargeTextConstraint, "setActive:", v3);
  -[NSLayoutConstraint setActive:](self->_labelValueRelationConstraint, "setActive:", v3 ^ 1);
  -[NSLayoutConstraint setActive:](self->_rightMarginLargeTextConstraint, "setActive:", v3);
  -[NSLayoutConstraint setActive:](self->_rightMarginConstraint, "setActive:", v3 ^ 1);
  LODWORD(v14) = v7;
  -[UILabel setContentHuggingPriority:forAxis:](self->_labelView, "setContentHuggingPriority:forAxis:", 0, v14);
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentAuthorizationTotalView;
  -[PKPaymentAuthorizationTotalView updateConstraints](&v15, sel_updateConstraints);
}

- (double)_initialLeading
{
  void *v3;
  double v4;
  double v5;
  double v6;
  _BOOL4 v7;
  double v8;

  PKConstrainedAuthorizationViewCellLabelSmallFont((void *)*MEMORY[0x1E0DC48D0], 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_bodyLeading");
  v5 = v4;

  if (self->_style)
    v6 = 58.0;
  else
    v6 = 24.0;
  v7 = -[UIView pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts");
  v8 = v6 + 10.0;
  if (!v7)
    v8 = v6;
  return round(v5 * v8 * 0.03125);
}

- (void)_prepareConstraints
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  UILabel **p_labelView;
  UILabel *labelView;
  double v16;
  double v17;
  NSLayoutConstraint *v18;
  NSLayoutConstraint *leftMarginConstraint;
  double v20;
  NSLayoutConstraint *v21;
  NSLayoutConstraint *labelBaselineConstraint;
  double v23;
  NSLayoutConstraint *v24;
  NSLayoutConstraint *labelValueRelationConstraint;
  void *v26;
  UILabel *valueView;
  double v28;
  NSLayoutConstraint *v29;
  NSLayoutConstraint *rightMarginConstraint;
  NSLayoutConstraint *v31;
  NSLayoutConstraint *labelValueRelationLargeTextConstraint;
  void *v33;
  UILabel *v34;
  double v35;
  NSLayoutConstraint *v36;
  NSLayoutConstraint *rightMarginLargeTextConstraint;
  NSLayoutConstraint *v38;
  NSLayoutConstraint *valueBaselineConstraint;
  NSLayoutConstraint *v40;
  NSLayoutConstraint *valueBaselineLargeTextConstraint;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  UILabel **p_valueView;
  void *v54;
  id v55;

  v3 = -[PKPaymentAuthorizationTotalView _shouldUseLargeTextLayout](self, "_shouldUseLargeTextLayout");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v55 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_separatorView, 5, 0, self, 5, 1.0, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "addObject:", v4);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_separatorView, 6, 0, self, 6, 1.0, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "addObject:", v5);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_separatorView, 3, 0, self, 3, 1.0, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "addObject:", v6);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_separatorView, 8, 0, 0, 0, 1.0, PKUIPixelLength());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "addObject:", v7);

  PKConstrainedAuthorizationViewCellLabelSmallFont((void *)*MEMORY[0x1E0DC48D0], 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_bodyLeading");
  v10 = v9;

  -[PKPaymentAuthorizationTotalView _initialLeading](self, "_initialLeading");
  v12 = v11;
  v13 = (void *)MEMORY[0x1E0CB3718];
  p_labelView = &self->_labelView;
  labelView = self->_labelView;
  v16 = 20.0;
  if (!v3)
  {
    -[PKPaymentAuthorizationLayout valueLeftMargin](self->_layout, "valueLeftMargin");
    v16 = v17;
  }
  objc_msgSend(v13, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", labelView, 5, 0, self, 5, 1.0, v16);
  v18 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  leftMarginConstraint = self->_leftMarginConstraint;
  self->_leftMarginConstraint = v18;

  if (v3)
  {
    LODWORD(v20) = 1148813312;
    -[NSLayoutConstraint setPriority:](self->_leftMarginConstraint, "setPriority:", v20);
  }
  objc_msgSend(v55, "addObject:", self->_leftMarginConstraint);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *p_labelView, 12, 0, self->_separatorView, 4, 1.0, v12);
  v21 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  labelBaselineConstraint = self->_labelBaselineConstraint;
  self->_labelBaselineConstraint = v21;

  LODWORD(v23) = 1148829696;
  -[NSLayoutConstraint setPriority:](self->_labelBaselineConstraint, "setPriority:", v23);
  objc_msgSend(v55, "addObject:", self->_labelBaselineConstraint);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *p_labelView, 6, 0, self->_valueView, 5, 1.0, -8.0);
  v24 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  labelValueRelationConstraint = self->_labelValueRelationConstraint;
  self->_labelValueRelationConstraint = v24;

  v26 = (void *)MEMORY[0x1E0CB3718];
  valueView = self->_valueView;
  -[PKPaymentAuthorizationLayout contentHorizontalMargin](self->_layout, "contentHorizontalMargin");
  objc_msgSend(v26, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", valueView, 6, 0, self, 6, 1.0, -v28);
  v29 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  rightMarginConstraint = self->_rightMarginConstraint;
  self->_rightMarginConstraint = v29;

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_valueView, 6, 0, *p_labelView, 6, 1.0, 0.0);
  v31 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  labelValueRelationLargeTextConstraint = self->_labelValueRelationLargeTextConstraint;
  self->_labelValueRelationLargeTextConstraint = v31;

  v33 = (void *)MEMORY[0x1E0CB3718];
  v34 = *p_labelView;
  -[PKPaymentAuthorizationLayout contentHorizontalMargin](self->_layout, "contentHorizontalMargin");
  objc_msgSend(v33, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v34, 6, 0, self, 6, 1.0, -v35);
  v36 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  rightMarginLargeTextConstraint = self->_rightMarginLargeTextConstraint;
  self->_rightMarginLargeTextConstraint = v36;

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_valueView, 12, 0, *p_labelView, 11, 1.0, 0.0);
  v38 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  valueBaselineConstraint = self->_valueBaselineConstraint;
  self->_valueBaselineConstraint = v38;

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_valueView, 3, 0, *p_labelView, 4, 1.0, 0.0);
  v40 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  valueBaselineLargeTextConstraint = self->_valueBaselineLargeTextConstraint;
  self->_valueBaselineLargeTextConstraint = v40;

  LODWORD(v42) = 1148829696;
  -[NSLayoutConstraint setPriority:](self->_valueBaselineConstraint, "setPriority:", v42);
  LODWORD(v43) = 1148829696;
  -[NSLayoutConstraint setPriority:](self->_valueBaselineLargeTextConstraint, "setPriority:", v43);
  objc_msgSend(v55, "addObject:", self->_valueBaselineConstraint);
  objc_msgSend(v55, "addObject:", self->_valueBaselineLargeTextConstraint);
  -[UIActivityIndicatorView rightAnchor](self->_processingIndicator, "rightAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel rightAnchor](self->_valueView, "rightAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "addObject:", v46);

  -[UIActivityIndicatorView centerYAnchor](self->_processingIndicator, "centerYAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel centerYAnchor](self->_valueView, "centerYAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "addObject:", v49);

  LODWORD(v50) = 1148829696;
  -[NSLayoutConstraint setPriority:](self->_rightMarginConstraint, "setPriority:", v50);
  LODWORD(v51) = 1148829696;
  -[NSLayoutConstraint setPriority:](self->_rightMarginLargeTextConstraint, "setPriority:", v51);
  objc_msgSend(v55, "addObject:", self->_rightMarginConstraint);
  objc_msgSend(v55, "addObject:", self->_rightMarginLargeTextConstraint);
  objc_msgSend(v55, "addObject:", self->_labelValueRelationConstraint);
  objc_msgSend(v55, "addObject:", self->_labelValueRelationLargeTextConstraint);
  v52 = round(v10 * 37.0 * 0.03125);
  if (v3)
    p_valueView = &self->_valueView;
  else
    p_valueView = &self->_labelView;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 4, 0, *p_valueView, 11, 1.0, v52);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "addObject:", v54);

  -[PKPaymentAuthorizationTotalView addConstraints:](self, "addConstraints:", v55);
}

- (id)_labelAttributedStringWithString:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v3 = (void *)MEMORY[0x1E0DC1290];
  v4 = a3;
  objc_msgSend(v3, "defaultParagraphStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "setLineBreakMode:", 0);
  v14[0] = *MEMORY[0x1E0DC1138];
  PKConstrainedAuthorizationViewCellLabelSmallFont((void *)*MEMORY[0x1E0DC48D0], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0DC1178];
  v15[0] = v7;
  v15[1] = v6;
  v9 = *MEMORY[0x1E0DC1140];
  v14[1] = v8;
  v14[2] = v9;
  PKAuthorizationViewValueLabelColor();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v4, v11);
  return v12;
}

- (id)_valueAttributedStringWithString:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 showsBoldValueText;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v4 = (void *)MEMORY[0x1E0DC1290];
  v5 = a3;
  objc_msgSend(v4, "defaultParagraphStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "setLineBreakMode:", 0);
  v8 = (void *)*MEMORY[0x1E0DC48D0];
  showsBoldValueText = self->_showsBoldValueText;
  if (self->_isPendingTotal)
    PKConstrainedAuthorizationViewCellLabelSmallFont(v8, showsBoldValueText);
  else
    PKConstrainedAuthorizationViewCellLabelLargeFont(v8, showsBoldValueText);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0DC1178];
  v16[0] = *MEMORY[0x1E0DC1138];
  v16[1] = v12;
  v17[0] = v11;
  v17[1] = v7;
  v16[2] = *MEMORY[0x1E0DC1140];
  PKAuthorizationViewValueLabelColor();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v5, v14);
  return v15;
}

- (PKPaymentAuthorizationLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)isPendingTotal
{
  return self->_isPendingTotal;
}

- (void)setIsPendingTotal:(BOOL)a3
{
  self->_isPendingTotal = a3;
}

- (BOOL)isProcessing
{
  return self->_processing;
}

- (int64_t)labelNumberOfLines
{
  return self->_labelNumberOfLines;
}

- (BOOL)showsBoldValueText
{
  return self->_showsBoldValueText;
}

- (void)setShowsBoldValueText:(BOOL)a3
{
  self->_showsBoldValueText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_rightMarginLargeTextConstraint, 0);
  objc_storeStrong((id *)&self->_labelValueRelationLargeTextConstraint, 0);
  objc_storeStrong((id *)&self->_valueBaselineLargeTextConstraint, 0);
  objc_storeStrong((id *)&self->_labelValueRelationConstraint, 0);
  objc_storeStrong((id *)&self->_valueBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_labelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_rightMarginConstraint, 0);
  objc_storeStrong((id *)&self->_leftMarginConstraint, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_processingIndicator, 0);
  objc_storeStrong((id *)&self->_valueView, 0);
  objc_storeStrong((id *)&self->_labelView, 0);
}

@end
