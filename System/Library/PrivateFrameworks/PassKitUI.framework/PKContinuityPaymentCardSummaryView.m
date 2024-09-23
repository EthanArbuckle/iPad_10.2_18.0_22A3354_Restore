@implementation PKContinuityPaymentCardSummaryView

- (PKContinuityPaymentCardSummaryView)initWithFrame:(CGRect)a3
{
  PKContinuityPaymentCardSummaryView *v3;
  PKContinuityPaymentCardSummaryView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKContinuityPaymentCardSummaryView;
  v3 = -[PKContinuityPaymentCardSummaryView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_showsAlert = 0;
    -[PKContinuityPaymentCardSummaryView _createSubviews](v3, "_createSubviews");
    -[PKContinuityPaymentCardSummaryView _prepareImageAndValueConstraints](v4, "_prepareImageAndValueConstraints");
  }
  return v4;
}

- (void)_createSubviews
{
  UIImageView *v3;
  UIImageView *thumbnailView;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  UIImageView *v9;
  UIImageView *alertView;

  -[PKContinuityPaymentCardSummaryView _createLabels](self, "_createLabels");
  v3 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
  thumbnailView = self->_thumbnailView;
  self->_thumbnailView = v3;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_thumbnailView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setAccessibilityIgnoresInvertColors:](self->_thumbnailView, "setAccessibilityIgnoresInvertColors:", 1);
  v5 = objc_alloc(MEMORY[0x1E0DC3890]);
  PKUIImageNamed(CFSTR("Payment_AlertAccessory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "pkui_osloErrorColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_flatImageWithColor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (UIImageView *)objc_msgSend(v5, "initWithImage:", v8);
  alertView = self->_alertView;
  self->_alertView = v9;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_alertView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setHidden:](self->_alertView, "setHidden:", !self->_showsAlert);
  -[PKContinuityPaymentCardSummaryView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PKContinuityPaymentCardSummaryView addSubview:](self, "addSubview:", self->_descriptionView);
  -[PKContinuityPaymentCardSummaryView addSubview:](self, "addSubview:", self->_subtitleView);
  -[PKContinuityPaymentCardSummaryView addSubview:](self, "addSubview:", self->_thumbnailView);
  -[PKContinuityPaymentCardSummaryView addSubview:](self, "addSubview:", self->_alertView);
}

- (void)_createLabels
{
  UILabel *v3;
  UILabel *descriptionView;
  NSString **p_cardDescription;
  __CFString *v6;
  UILabel *v7;
  UILabel *subtitleView;
  NSString **p_subtitle;
  __CFString *v10;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  id v14;

  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  descriptionView = self->_descriptionView;
  self->_descriptionView = v3;

  -[UILabel setNumberOfLines:](self->_descriptionView, "setNumberOfLines:", 1);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_descriptionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  p_cardDescription = &self->_cardDescription;
  if (self->_cardDescription)
    v6 = (__CFString *)*p_cardDescription;
  else
    v6 = &stru_1E3E7D690;
  objc_storeStrong((id *)&self->_cardDescription, v6);
  v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  subtitleView = self->_subtitleView;
  self->_subtitleView = v7;

  -[UILabel setNumberOfLines:](self->_subtitleView, "setNumberOfLines:", 1);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_subtitleView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  p_subtitle = &self->_subtitle;
  if (self->_subtitle)
    v10 = (__CFString *)*p_subtitle;
  else
    v10 = &stru_1E3E7D690;
  objc_storeStrong((id *)&self->_subtitle, v10);
  v11 = self->_descriptionView;
  -[PKContinuityPaymentCardSummaryView _formatTextForString:alerting:](self, "_formatTextForString:alerting:", *p_cardDescription, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](v11, "setAttributedText:", v12);

  v13 = self->_subtitleView;
  -[PKContinuityPaymentCardSummaryView _formatTextForString:alerting:](self, "_formatTextForString:alerting:", *p_subtitle, self->_showsAlert);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](v13, "setAttributedText:", v14);

}

- (id)_formatTextForString:(id)a3 alerting:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];
  _QWORD v20[3];

  v4 = a4;
  v20[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0DC1290];
  v6 = a3;
  objc_msgSend(v5, "defaultParagraphStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "setLineBreakMode:", 4);
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A98], (NSString *)*MEMORY[0x1E0DC48C8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0C99E08]);
  v11 = *MEMORY[0x1E0DC1138];
  v20[0] = v9;
  v12 = *MEMORY[0x1E0DC1178];
  v19[0] = v11;
  v19[1] = v12;
  v13 = (void *)objc_msgSend(v8, "copy");
  v20[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v10, "initWithDictionary:", v14);

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "pkui_osloErrorColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v16, *MEMORY[0x1E0DC1140]);

  }
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v6, v15);

  return v17;
}

- (void)setShowsAlert:(BOOL)a3
{
  UILabel *subtitleView;
  void *v5;

  if (self->_showsAlert != a3)
  {
    self->_showsAlert = a3;
    -[UIImageView setHidden:](self->_alertView, "setHidden:", !a3);
    subtitleView = self->_subtitleView;
    -[PKContinuityPaymentCardSummaryView _formatTextForString:alerting:](self, "_formatTextForString:alerting:", self->_subtitle, self->_showsAlert);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](subtitleView, "setAttributedText:", v5);

    -[PKContinuityPaymentCardSummaryView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)setCardDescription:(id)a3
{
  __CFString *v4;
  NSString *v5;
  NSString *cardDescription;
  NSString *v7;
  UILabel *descriptionView;
  id v9;

  v4 = &stru_1E3E7D690;
  if (a3)
    v4 = (__CFString *)a3;
  v5 = v4;
  cardDescription = self->_cardDescription;
  self->_cardDescription = v5;
  v7 = v5;

  descriptionView = self->_descriptionView;
  -[PKContinuityPaymentCardSummaryView _formatTextForString:alerting:](self, "_formatTextForString:alerting:", v7, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](descriptionView, "setAttributedText:", v9);

}

- (void)setSubtitle:(id)a3
{
  __CFString *v4;
  NSString *v5;
  UILabel *subtitleView;
  void *v7;
  NSString *v8;

  if (a3)
    v4 = (__CFString *)a3;
  else
    v4 = &stru_1E3E7D690;
  v5 = v4;
  if (self->_subtitle != v5)
  {
    subtitleView = self->_subtitleView;
    v8 = v5;
    -[PKContinuityPaymentCardSummaryView _formatTextForString:alerting:](self, "_formatTextForString:alerting:", v5, self->_showsAlert);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](subtitleView, "setAttributedText:", v7);

    objc_storeStrong((id *)&self->_subtitle, v4);
    -[PKContinuityPaymentCardSummaryView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    v5 = v8;
  }

}

- (void)_prepareImageAndValueConstraints
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSLayoutConstraint *v19;
  NSLayoutConstraint *textToTrailingConstraint;
  NSLayoutConstraint *v21;
  NSLayoutConstraint *textToAlertConstraint;
  double v23;
  double v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  NSMutableArray *v42;
  NSMutableArray *subtitleConstraints;
  NSMutableArray *v44;
  void *v45;
  void *v46;
  void *v47;
  NSMutableArray *v48;
  void *v49;
  void *v50;
  void *v51;
  NSMutableArray *v52;
  void *v53;
  void *v54;
  void *v55;
  NSMutableArray *v56;
  void *v57;
  void *v58;
  void *v59;
  NSMutableArray *v60;
  void *v61;
  void *v62;
  void *v63;
  NSMutableArray *v64;
  NSMutableArray *singleLineConstraints;
  NSMutableArray *v66;
  void *v67;
  void *v68;
  void *v69;
  NSMutableArray *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  double v76;
  void *v77;
  id v78;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v78 = (id)objc_claimAutoreleasedReturnValue();
  PKPassFrontFaceContentSize();
  PKFloatRoundToPixel();
  v4 = v3;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_thumbnailView, 5, 0, self, 17, 1.0, 42.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "addObject:", v5);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_thumbnailView, 8, 0, 0, 0, 1.0, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "addObject:", v6);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_thumbnailView, 7, 0, 0, 0, 1.0, 41.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "addObject:", v7);

  -[UIImageView centerYAnchor](self->_thumbnailView, "centerYAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKContinuityPaymentCardSummaryView centerYAnchor](self, "centerYAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "addObject:", v10);

  -[UIImageView centerYAnchor](self->_alertView, "centerYAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKContinuityPaymentCardSummaryView centerYAnchor](self, "centerYAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "addObject:", v13);

  -[UIImageView trailingAnchor](self->_alertView, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKContinuityPaymentCardSummaryView layoutMarginsGuide](self, "layoutMarginsGuide");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "addObject:", v17);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_descriptionView, 5, 0, self, 17, 1.0, 100.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "addObject:", v18);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_descriptionView, 6, -1, self, 18, 1.0, 0.0);
  v19 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  textToTrailingConstraint = self->_textToTrailingConstraint;
  self->_textToTrailingConstraint = v19;

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_descriptionView, 6, -1, self->_alertView, 5, 1.0, -12.0);
  v21 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  textToAlertConstraint = self->_textToAlertConstraint;
  self->_textToAlertConstraint = v21;

  objc_msgSend(v78, "addObject:", self->_textToTrailingConstraint);
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A98], (NSString *)*MEMORY[0x1E0DC48C8]);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "_bodyLeading");
  v24 = v23;
  v25 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
  v26 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
  -[PKContinuityPaymentCardSummaryView addLayoutGuide:](self, "addLayoutGuide:", v25);
  -[PKContinuityPaymentCardSummaryView addLayoutGuide:](self, "addLayoutGuide:", v26);
  objc_msgSend(v25, "heightAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "heightAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "addObject:", v29);

  objc_msgSend(v25, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKContinuityPaymentCardSummaryView topAnchor](self, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "addObject:", v32);

  objc_msgSend(v26, "bottomAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKContinuityPaymentCardSummaryView bottomAnchor](self, "bottomAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "addObject:", v35);

  objc_msgSend(v25, "bottomAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel firstBaselineAnchor](self->_descriptionView, "firstBaselineAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "capHeight");
  objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, -v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "addObject:", v39);

  objc_msgSend(v25, "heightAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintGreaterThanOrEqualToConstant:", 14.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "addObject:", v41);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v42 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  subtitleConstraints = self->_subtitleConstraints;
  self->_subtitleConstraints = v42;

  v44 = self->_subtitleConstraints;
  objc_msgSend(v26, "topAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel firstBaselineAnchor](self->_subtitleView, "firstBaselineAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v44, "addObject:", v47);

  v48 = self->_subtitleConstraints;
  -[UILabel leadingAnchor](self->_subtitleView, "leadingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel leadingAnchor](self->_descriptionView, "leadingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v48, "addObject:", v51);

  v52 = self->_subtitleConstraints;
  -[UILabel firstBaselineAnchor](self->_subtitleView, "firstBaselineAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel firstBaselineAnchor](self->_descriptionView, "firstBaselineAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:constant:", v54, v24);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v52, "addObject:", v55);

  v56 = self->_subtitleConstraints;
  -[UILabel centerXAnchor](self->_subtitleView, "centerXAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel centerXAnchor](self->_descriptionView, "centerXAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v56, "addObject:", v59);

  v60 = self->_subtitleConstraints;
  -[UILabel trailingAnchor](self->_subtitleView, "trailingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel trailingAnchor](self->_descriptionView, "trailingAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:", v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v60, "addObject:", v63);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v64 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  singleLineConstraints = self->_singleLineConstraints;
  self->_singleLineConstraints = v64;

  v66 = self->_singleLineConstraints;
  -[UILabel centerYAnchor](self->_descriptionView, "centerYAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKContinuityPaymentCardSummaryView centerYAnchor](self, "centerYAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintEqualToAnchor:", v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v66, "addObject:", v69);

  v70 = self->_singleLineConstraints;
  objc_msgSend(v26, "topAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel firstBaselineAnchor](self->_descriptionView, "firstBaselineAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToAnchor:", v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v70, "addObject:", v73);

  objc_msgSend(v78, "addObjectsFromArray:", self->_singleLineConstraints);
  objc_msgSend(v78, "addObjectsFromArray:", self->_subtitleConstraints);
  objc_msgSend(v26, "heightAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintEqualToConstant:", 1.0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v76) = 1132068864;
  objc_msgSend(v75, "setPriority:", v76);
  objc_msgSend(v78, "addObject:", v75);
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v78);

}

- (void)updateConstraints
{
  NSString *subtitle;
  objc_super v4;

  -[NSLayoutConstraint setActive:](self->_textToTrailingConstraint, "setActive:", !self->_showsAlert);
  -[NSLayoutConstraint setActive:](self->_textToAlertConstraint, "setActive:", self->_showsAlert);
  subtitle = self->_subtitle;
  if (subtitle && (-[NSString isEqual:](subtitle, "isEqual:", &stru_1E3E7D690) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_subtitleConstraints);
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_singleLineConstraints);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_subtitleConstraints);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_singleLineConstraints);
  }
  v4.receiver = self;
  v4.super_class = (Class)PKContinuityPaymentCardSummaryView;
  -[PKContinuityPaymentCardSummaryView updateConstraints](&v4, sel_updateConstraints);
}

- (NSString)cardDescription
{
  return self->_cardDescription;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (BOOL)subtitleDescribesError
{
  return self->_subtitleDescribesError;
}

- (void)setSubtitleDescribesError:(BOOL)a3
{
  self->_subtitleDescribesError = a3;
}

- (UIImageView)thumbnailView
{
  return self->_thumbnailView;
}

- (BOOL)showsAlert
{
  return self->_showsAlert;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailView, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_cardDescription, 0);
  objc_storeStrong((id *)&self->_subtitleConstraints, 0);
  objc_storeStrong((id *)&self->_singleLineConstraints, 0);
  objc_storeStrong((id *)&self->_textToAlertConstraint, 0);
  objc_storeStrong((id *)&self->_textToTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_subtitleView, 0);
  objc_storeStrong((id *)&self->_descriptionView, 0);
  objc_storeStrong((id *)&self->_alertView, 0);
}

@end
