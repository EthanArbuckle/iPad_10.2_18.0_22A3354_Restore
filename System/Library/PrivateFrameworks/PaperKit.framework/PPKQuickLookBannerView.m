@implementation PPKQuickLookBannerView

- (PPKQuickLookBannerView)initWithFrame:(CGRect)a3
{
  PPKQuickLookBannerView *v3;
  PPKQuickLookBannerView *v4;
  UILayoutGuide *v5;
  UILayoutGuide *contentLayoutGuide;
  UIView *v7;
  UIView *backgroundView;
  UIImageView *v9;
  UIImageView *imageView;
  void *v11;
  uint64_t v12;
  double v13;
  void *v14;
  void *v15;
  UIImageView *v16;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  UILabel *title;
  void *v22;
  uint64_t v23;
  UILabel *subtitle;
  void *v25;
  void *v26;
  uint64_t v27;
  UIButton *actionButton;
  void *v29;
  void *v30;
  double v31;
  double v32;
  uint64_t v33;
  UIButton *closeButton;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  id v42;
  void *v43;
  uint64_t v44;
  UIStackView *titleStackView;
  uint64_t v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v58;
  objc_super v59;
  _QWORD v60[3];

  v60[2] = *MEMORY[0x1E0C80C00];
  v59.receiver = self;
  v59.super_class = (Class)PPKQuickLookBannerView;
  v3 = -[PPKQuickLookBannerView initWithFrame:](&v59, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PPKQuickLookBannerView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
    contentLayoutGuide = v4->_contentLayoutGuide;
    v4->_contentLayoutGuide = v5;

    -[PPKQuickLookBannerView addLayoutGuide:](v4, "addLayoutGuide:", v4->_contentLayoutGuide);
    v7 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = v7;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v9 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v4->_imageView;
    v4->_imageView = v9;

    v11 = (void *)MEMORY[0x1E0DC3888];
    v12 = *MEMORY[0x1E0DC4B10];
    v13 = *MEMORY[0x1E0DC1448];
    objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0DC4B10], *MEMORY[0x1E0DC1448]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "configurationWithFont:scale:", v14, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](v4->_imageView, "setPreferredSymbolConfiguration:", v15);

    -[UIImageView setContentMode:](v4->_imageView, "setContentMode:", 1);
    v16 = v4->_imageView;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v16, "setTintColor:", v17);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v18) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v4->_imageView, "setContentCompressionResistancePriority:forAxis:", 0, v18);
    LODWORD(v19) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](v4->_imageView, "setContentHuggingPriority:forAxis:", 0, v19);
    v20 = objc_opt_new();
    title = v4->_title;
    v4->_title = (UILabel *)v20;

    -[UILabel setText:](v4->_title, "setText:", CFSTR("Title here"));
    objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", v12, v13);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_title, "setFont:", v22);

    -[UILabel setLineBreakMode:](v4->_title, "setLineBreakMode:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_title, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v23 = objc_opt_new();
    subtitle = v4->_subtitle;
    v4->_subtitle = (UILabel *)v23;

    -[UILabel setText:](v4->_subtitle, "setText:", CFSTR("Secondary title here"));
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v12);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_subtitle, "setFont:", v25);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_subtitle, "setTextColor:", v26);

    -[UILabel setLineBreakMode:](v4->_subtitle, "setLineBreakMode:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_subtitle, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
    v27 = objc_claimAutoreleasedReturnValue();
    actionButton = v4->_actionButton;
    v4->_actionButton = (UIButton *)v27;

    objc_msgSend(MEMORY[0x1E0DC3520], "filledButtonConfiguration");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setCornerStyle:", 4);
    v58 = v29;
    objc_msgSend(v29, "setTitleLineBreakMode:", 0);
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("Button"));
    objc_msgSend(v29, "setAttributedTitle:", v30);

    objc_msgSend(v29, "setTitleTextAttributesTransformer:", &__block_literal_global_4);
    -[UIButton setConfiguration:](v4->_actionButton, "setConfiguration:", v29);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_actionButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v31) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v4->_actionButton, "setContentCompressionResistancePriority:forAxis:", 0, v31);
    LODWORD(v32) = 1148846080;
    -[UIButton setContentHuggingPriority:forAxis:](v4->_actionButton, "setContentHuggingPriority:forAxis:", 0, v32);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v33 = objc_claimAutoreleasedReturnValue();
    closeButton = v4->_closeButton;
    v4->_closeButton = (UIButton *)v33;

    v35 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0DC4AB8], v13);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "configurationWithFont:scale:", v36, 3);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("xmark"), v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](v4->_closeButton, "setImage:forState:", v38, 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v4->_closeButton, "setTintColor:", v39);

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_closeButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v40) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v4->_closeButton, "setContentCompressionResistancePriority:forAxis:", 0, v40);
    LODWORD(v41) = 1148846080;
    -[UIButton setContentHuggingPriority:forAxis:](v4->_closeButton, "setContentHuggingPriority:forAxis:", 0, v41);
    v42 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v60[0] = v4->_title;
    v60[1] = v4->_subtitle;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 2);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v42, "initWithArrangedSubviews:", v43);
    titleStackView = v4->_titleStackView;
    v4->_titleStackView = (UIStackView *)v44;

    -[UIStackView setSpacing:](v4->_titleStackView, "setSpacing:", 4.0);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PPKQuickLookBannerView addSubview:](v4, "addSubview:", v4->_backgroundView);
    -[PPKQuickLookBannerView addSubview:](v4, "addSubview:", v4->_imageView);
    -[PPKQuickLookBannerView addSubview:](v4, "addSubview:", v4->_titleStackView);
    -[PPKQuickLookBannerView addSubview:](v4, "addSubview:", v4->_actionButton);
    -[PPKQuickLookBannerView addSubview:](v4, "addSubview:", v4->_closeButton);
    v46 = *MEMORY[0x1E0CD2A68];
    -[UIView layer](v4->_backgroundView, "layer");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setCornerCurve:", v46);

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v49 = objc_msgSend(v48, "CGColor");
    -[UIView layer](v4->_backgroundView, "layer");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setShadowColor:", v49);

    -[UIView layer](v4->_backgroundView, "layer");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v52) = 0.25;
    objc_msgSend(v51, "setShadowOpacity:", v52);

    v53 = *MEMORY[0x1E0C9D820];
    v54 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    -[UIView layer](v4->_backgroundView, "layer");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setShadowOffset:", v53, v54);

    -[UIView layer](v4->_backgroundView, "layer");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setShadowRadius:", 5.0);

    -[PPKQuickLookBannerView _updateUI](v4, "_updateUI");
  }
  return v4;
}

id __40__PPKQuickLookBannerView_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0DC4AB8], *MEMORY[0x1E0DC1448]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v3, *MEMORY[0x1E0DC1138]);

  v4 = (void *)objc_msgSend(v2, "copy");
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  _BOOL8 v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PPKQuickLookBannerView;
  -[PPKQuickLookBannerView layoutSubviews](&v5, sel_layoutSubviews);
  -[PPKQuickLookBannerView bounds](self, "bounds");
  v4 = v3 <= 375.0
    || -[PPKQuickLookBannerView _isUsingAccessibilityContentSizeCategory](self, "_isUsingAccessibilityContentSizeCategory");
  -[PPKQuickLookBannerView _setUseExtraCompactLayout:](self, "_setUseExtraCompactLayout:", v4);
}

- (void)_setUseExtraCompactLayout:(BOOL)a3
{
  if (self->_useExtraCompactLayout != a3)
  {
    self->_useExtraCompactLayout = a3;
    -[PPKQuickLookBannerView _updateUI](self, "_updateUI");
  }
}

- (void)_updateUI
{
  id v3;
  void *v4;
  double v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  double v10;
  void *v11;
  int64_t v12;
  void *v13;
  int64_t v14;
  void *v15;
  NSArray *extraCompactSizeConstraints;
  NSArray *compactSizeConstraints;
  NSArray *regularSizeConstraints;
  NSLayoutConstraint *imageViewCollapsingConstraint;
  NSLayoutConstraint *v20;
  NSLayoutConstraint *titleStackLeadingConstraint;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  NSLayoutConstraint *v27;
  NSLayoutConstraint *v28;
  id v29;

  v3 = (id)0x1E0DC3000;
  if (-[PPKQuickLookBannerView _useCompactLayout](self, "_useCompactLayout"))
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", v4);

  if (-[PPKQuickLookBannerView _useCompactLayout](self, "_useCompactLayout"))
    v5 = 0.0;
  else
    v5 = 8.0;
  -[UIView layer](self->_backgroundView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCornerRadius:", v5);

  v7 = -[PPKQuickLookBannerView _useCompactLayout](self, "_useCompactLayout");
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = objc_msgSend(v3, "CGColor");
  }
  -[UIView layer](self->_backgroundView, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBorderColor:", v8);

  if (!v7)
  if (-[PPKQuickLookBannerView _useCompactLayout](self, "_useCompactLayout"))
    v10 = 0.0;
  else
    v10 = 0.5;
  -[UIView layer](self->_backgroundView, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBorderWidth:", v10);

  v12 = -[PPKQuickLookBannerView _numberOfTitleLines](self, "_numberOfTitleLines");
  -[PPKQuickLookBannerView title](self, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setNumberOfLines:", v12);

  v14 = -[PPKQuickLookBannerView _numberOfSubtitleLines](self, "_numberOfSubtitleLines");
  -[PPKQuickLookBannerView subtitle](self, "subtitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setNumberOfLines:", v14);

  -[UIStackView setAxis:](self->_titleStackView, "setAxis:", -[PPKQuickLookBannerView _useCompactLayout](self, "_useCompactLayout"));
  if (self->_extraCompactSizeConstraints)
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
    extraCompactSizeConstraints = self->_extraCompactSizeConstraints;
    self->_extraCompactSizeConstraints = 0;

  }
  if (self->_compactSizeConstraints)
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
    compactSizeConstraints = self->_compactSizeConstraints;
    self->_compactSizeConstraints = 0;

  }
  if (self->_regularSizeConstraints)
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
    regularSizeConstraints = self->_regularSizeConstraints;
    self->_regularSizeConstraints = 0;

  }
  imageViewCollapsingConstraint = self->_imageViewCollapsingConstraint;
  if (imageViewCollapsingConstraint)
  {
    -[NSLayoutConstraint setActive:](imageViewCollapsingConstraint, "setActive:", 0);
    v20 = self->_imageViewCollapsingConstraint;
    self->_imageViewCollapsingConstraint = 0;

  }
  titleStackLeadingConstraint = self->_titleStackLeadingConstraint;
  self->_titleStackLeadingConstraint = 0;

  if (-[PPKQuickLookBannerView _isUsingAccessibilityContentSizeCategory](self, "_isUsingAccessibilityContentSizeCategory"))
  {
    v22 = (void *)MEMORY[0x1E0CB3718];
    -[PPKQuickLookBannerView _extraCompactSizeConstraints](self, "_extraCompactSizeConstraints");
    v23 = objc_claimAutoreleasedReturnValue();
LABEL_29:
    v24 = (void *)v23;
    v25 = v22;
    goto LABEL_32;
  }
  if (!-[PPKQuickLookBannerView _useCompactLayout](self, "_useCompactLayout"))
  {
    v22 = (void *)MEMORY[0x1E0CB3718];
    -[PPKQuickLookBannerView _regularSizeConstraints](self, "_regularSizeConstraints");
    v23 = objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  if (self->_useExtraCompactLayout)
    -[PPKQuickLookBannerView _extraCompactSizeConstraints](self, "_extraCompactSizeConstraints");
  else
    -[PPKQuickLookBannerView _compactSizeConstraints](self, "_compactSizeConstraints");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)MEMORY[0x1E0CB3718];
LABEL_32:
  objc_msgSend(v25, "activateConstraints:", v24);

  -[PPKQuickLookBannerView imageView](self, "imageView");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "widthAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToConstant:", 0.0);
  v27 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  v28 = self->_imageViewCollapsingConstraint;
  self->_imageViewCollapsingConstraint = v27;

}

- (id)_compactSizeConstraints
{
  NSArray *compactSizeConstraints;
  void *v4;
  void *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *titleStackLeadingConstraint;
  NSLayoutConstraint *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSArray *v19;
  NSArray *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
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
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  _QWORD v75[21];

  v75[19] = *MEMORY[0x1E0C80C00];
  compactSizeConstraints = self->_compactSizeConstraints;
  if (!compactSizeConstraints)
  {
    -[UIStackView leadingAnchor](self->_titleStackView, "leadingAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPKQuickLookBannerView imageView](self, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trailingAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "constraintEqualToAnchor:constant:", v6, 4.0);
    v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    titleStackLeadingConstraint = self->_titleStackLeadingConstraint;
    self->_titleStackLeadingConstraint = v7;

    -[UIView topAnchor](self->_backgroundView, "topAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPKQuickLookBannerView topAnchor](self, "topAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:", v73);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v75[0] = v72;
    -[UIView leadingAnchor](self->_backgroundView, "leadingAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPKQuickLookBannerView leadingAnchor](self, "leadingAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:", v70);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v75[1] = v69;
    -[UIView trailingAnchor](self->_backgroundView, "trailingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPKQuickLookBannerView trailingAnchor](self, "trailingAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:", v67);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v75[2] = v66;
    -[UIView bottomAnchor](self->_backgroundView, "bottomAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPKQuickLookBannerView bottomAnchor](self, "bottomAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:", v64);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v75[3] = v63;
    -[UILayoutGuide topAnchor](self->_contentLayoutGuide, "topAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPKQuickLookBannerView topAnchor](self, "topAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:constant:", v61, 16.0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v75[4] = v60;
    -[UILayoutGuide leadingAnchor](self->_contentLayoutGuide, "leadingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPKQuickLookBannerView leadingAnchor](self, "leadingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:constant:", v58, 12.0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v75[5] = v57;
    -[UILayoutGuide trailingAnchor](self->_contentLayoutGuide, "trailingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPKQuickLookBannerView trailingAnchor](self, "trailingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:constant:", v55, -20.0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v75[6] = v54;
    -[UILayoutGuide bottomAnchor](self->_contentLayoutGuide, "bottomAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPKQuickLookBannerView bottomAnchor](self, "bottomAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:constant:", v52, -16.0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v75[7] = v51;
    -[PPKQuickLookBannerView imageView](self, "imageView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "centerYAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide centerYAnchor](self->_contentLayoutGuide, "centerYAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v48);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v75[8] = v47;
    -[PPKQuickLookBannerView imageView](self, "imageView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "leadingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](self->_contentLayoutGuide, "leadingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:", v44);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v75[9] = v43;
    -[UIStackView topAnchor](self->_titleStackView, "topAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](self->_contentLayoutGuide, "topAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintGreaterThanOrEqualToAnchor:", v41);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v75[10] = v40;
    -[UIStackView bottomAnchor](self->_titleStackView, "bottomAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](self->_contentLayoutGuide, "bottomAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintLessThanOrEqualToAnchor:", v38);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v75[11] = v37;
    -[UIStackView centerYAnchor](self->_titleStackView, "centerYAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide centerYAnchor](self->_contentLayoutGuide, "centerYAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v35);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v75[12] = v34;
    -[UIStackView trailingAnchor](self->_titleStackView, "trailingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPKQuickLookBannerView actionButton](self, "actionButton");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintLessThanOrEqualToAnchor:constant:", v31, -4.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = self->_titleStackLeadingConstraint;
    v75[13] = v30;
    v75[14] = v9;
    -[PPKQuickLookBannerView actionButton](self, "actionButton");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPKQuickLookBannerView closeButton](self, "closeButton");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:constant:", v26, -16.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v75[15] = v25;
    -[PPKQuickLookBannerView actionButton](self, "actionButton");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "centerYAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide centerYAnchor](self->_contentLayoutGuide, "centerYAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v22);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v75[16] = v10;
    -[PPKQuickLookBannerView closeButton](self, "closeButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "centerYAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide centerYAnchor](self->_contentLayoutGuide, "centerYAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v75[17] = v14;
    -[PPKQuickLookBannerView closeButton](self, "closeButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](self->_contentLayoutGuide, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v75[18] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 19);
    v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v20 = self->_compactSizeConstraints;
    self->_compactSizeConstraints = v19;

    compactSizeConstraints = self->_compactSizeConstraints;
  }
  return compactSizeConstraints;
}

- (id)_extraCompactSizeConstraints
{
  NSArray *extraCompactSizeConstraints;
  void *v4;
  void *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *titleStackLeadingConstraint;
  NSLayoutConstraint *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSArray *v19;
  NSArray *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
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
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  _QWORD v76[21];

  v76[19] = *MEMORY[0x1E0C80C00];
  extraCompactSizeConstraints = self->_extraCompactSizeConstraints;
  if (!extraCompactSizeConstraints)
  {
    -[UIStackView leadingAnchor](self->_titleStackView, "leadingAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPKQuickLookBannerView imageView](self, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trailingAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "constraintEqualToAnchor:constant:", v6, 4.0);
    v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    titleStackLeadingConstraint = self->_titleStackLeadingConstraint;
    self->_titleStackLeadingConstraint = v7;

    -[UIView topAnchor](self->_backgroundView, "topAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPKQuickLookBannerView topAnchor](self, "topAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToAnchor:", v74);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = v73;
    -[UIView leadingAnchor](self->_backgroundView, "leadingAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPKQuickLookBannerView leadingAnchor](self, "leadingAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "constraintEqualToAnchor:", v71);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v76[1] = v70;
    -[UIView trailingAnchor](self->_backgroundView, "trailingAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPKQuickLookBannerView trailingAnchor](self, "trailingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintEqualToAnchor:", v68);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v76[2] = v67;
    -[UIView bottomAnchor](self->_backgroundView, "bottomAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPKQuickLookBannerView bottomAnchor](self, "bottomAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToAnchor:", v65);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v76[3] = v64;
    -[UILayoutGuide topAnchor](self->_contentLayoutGuide, "topAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPKQuickLookBannerView topAnchor](self, "topAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:constant:", v62, 16.0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v76[4] = v61;
    -[UILayoutGuide leadingAnchor](self->_contentLayoutGuide, "leadingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPKQuickLookBannerView leadingAnchor](self, "leadingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:constant:", v59, 12.0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v76[5] = v58;
    -[UILayoutGuide trailingAnchor](self->_contentLayoutGuide, "trailingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPKQuickLookBannerView trailingAnchor](self, "trailingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:constant:", v56, -20.0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v76[6] = v55;
    -[UILayoutGuide bottomAnchor](self->_contentLayoutGuide, "bottomAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPKQuickLookBannerView bottomAnchor](self, "bottomAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:constant:", v53, -16.0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v76[7] = v52;
    -[PPKQuickLookBannerView imageView](self, "imageView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "topAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](self->_contentLayoutGuide, "topAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v49);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v76[8] = v48;
    -[PPKQuickLookBannerView imageView](self, "imageView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](self->_contentLayoutGuide, "leadingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v45);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v76[9] = v44;
    -[UIStackView topAnchor](self->_titleStackView, "topAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](self->_contentLayoutGuide, "topAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v42);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v76[10] = v41;
    -[UIStackView trailingAnchor](self->_titleStackView, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPKQuickLookBannerView closeButton](self, "closeButton");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintLessThanOrEqualToAnchor:constant:", v38, -4.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = self->_titleStackLeadingConstraint;
    v76[11] = v37;
    v76[12] = v9;
    -[PPKQuickLookBannerView closeButton](self, "closeButton");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "topAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](self->_contentLayoutGuide, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v34);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v76[13] = v33;
    -[PPKQuickLookBannerView closeButton](self, "closeButton");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](self->_contentLayoutGuide, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v76[14] = v29;
    -[PPKQuickLookBannerView actionButton](self, "actionButton");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView bottomAnchor](self->_titleStackView, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:constant:", v26, 10.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v76[15] = v25;
    -[PPKQuickLookBannerView actionButton](self, "actionButton");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView leadingAnchor](self->_titleStackView, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v22);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v76[16] = v10;
    -[PPKQuickLookBannerView actionButton](self, "actionButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](self->_contentLayoutGuide, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintLessThanOrEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v76[17] = v14;
    -[PPKQuickLookBannerView actionButton](self, "actionButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](self->_contentLayoutGuide, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v76[18] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 19);
    v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v20 = self->_extraCompactSizeConstraints;
    self->_extraCompactSizeConstraints = v19;

    extraCompactSizeConstraints = self->_extraCompactSizeConstraints;
  }
  return extraCompactSizeConstraints;
}

- (id)_regularSizeConstraints
{
  NSArray *regularSizeConstraints;
  void *v4;
  void *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *titleStackLeadingConstraint;
  NSLayoutConstraint *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSArray *v19;
  NSArray *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
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
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  _QWORD v99[27];

  v99[25] = *MEMORY[0x1E0C80C00];
  regularSizeConstraints = self->_regularSizeConstraints;
  if (!regularSizeConstraints)
  {
    -[UIStackView leadingAnchor](self->_titleStackView, "leadingAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPKQuickLookBannerView imageView](self, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trailingAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "constraintEqualToAnchor:constant:", v6, 4.0);
    v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    titleStackLeadingConstraint = self->_titleStackLeadingConstraint;
    self->_titleStackLeadingConstraint = v7;

    -[UIView topAnchor](self->_backgroundView, "topAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](self->_contentLayoutGuide, "topAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "constraintEqualToAnchor:", v97);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v99[0] = v96;
    -[UIView leadingAnchor](self->_backgroundView, "leadingAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](self->_contentLayoutGuide, "leadingAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "constraintEqualToAnchor:", v94);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v99[1] = v93;
    -[UIView trailingAnchor](self->_backgroundView, "trailingAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](self->_contentLayoutGuide, "trailingAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "constraintEqualToAnchor:", v91);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v99[2] = v90;
    -[UIView bottomAnchor](self->_backgroundView, "bottomAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](self->_contentLayoutGuide, "bottomAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "constraintEqualToAnchor:", v88);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v99[3] = v87;
    -[UILayoutGuide topAnchor](self->_contentLayoutGuide, "topAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPKQuickLookBannerView topAnchor](self, "topAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "constraintEqualToAnchor:constant:", v85, 16.0);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v99[4] = v84;
    -[UILayoutGuide leadingAnchor](self->_contentLayoutGuide, "leadingAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPKQuickLookBannerView leadingAnchor](self, "leadingAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "constraintEqualToAnchor:constant:", v82, 16.0);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v99[5] = v81;
    -[UILayoutGuide trailingAnchor](self->_contentLayoutGuide, "trailingAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPKQuickLookBannerView trailingAnchor](self, "trailingAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintEqualToAnchor:constant:", v79, -16.0);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v99[6] = v78;
    -[UILayoutGuide bottomAnchor](self->_contentLayoutGuide, "bottomAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPKQuickLookBannerView bottomAnchor](self, "bottomAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintEqualToAnchor:constant:", v76, -16.0);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v99[7] = v75;
    -[PPKQuickLookBannerView imageView](self, "imageView");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "leadingAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](self->_contentLayoutGuide, "leadingAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintEqualToAnchor:constant:", v72, 14.0);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v99[8] = v71;
    -[PPKQuickLookBannerView imageView](self, "imageView");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "centerYAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide centerYAnchor](self->_contentLayoutGuide, "centerYAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintEqualToAnchor:", v68);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v99[9] = v67;
    -[PPKQuickLookBannerView imageView](self, "imageView");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "topAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](self->_contentLayoutGuide, "topAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintGreaterThanOrEqualToAnchor:", v64);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v99[10] = v63;
    -[PPKQuickLookBannerView imageView](self, "imageView");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "bottomAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](self->_contentLayoutGuide, "bottomAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintLessThanOrEqualToAnchor:", v60);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v99[11] = v59;
    -[UIStackView centerYAnchor](self->_titleStackView, "centerYAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide centerYAnchor](self->_contentLayoutGuide, "centerYAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v57);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v99[12] = v56;
    -[UIStackView trailingAnchor](self->_titleStackView, "trailingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPKQuickLookBannerView actionButton](self, "actionButton");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "leadingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintLessThanOrEqualToAnchor:constant:", v53, -8.0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v99[13] = v52;
    -[UIStackView topAnchor](self->_titleStackView, "topAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](self->_contentLayoutGuide, "topAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintGreaterThanOrEqualToAnchor:constant:", v50, 8.0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v99[14] = v49;
    -[UIStackView bottomAnchor](self->_titleStackView, "bottomAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](self->_contentLayoutGuide, "bottomAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintLessThanOrEqualToAnchor:constant:", v47, -8.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = self->_titleStackLeadingConstraint;
    v99[15] = v46;
    v99[16] = v9;
    -[PPKQuickLookBannerView actionButton](self, "actionButton");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "topAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](self->_contentLayoutGuide, "topAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintGreaterThanOrEqualToAnchor:constant:", v43, 8.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v99[17] = v42;
    -[PPKQuickLookBannerView actionButton](self, "actionButton");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "bottomAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](self->_contentLayoutGuide, "bottomAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintLessThanOrEqualToAnchor:constant:", v39, -8.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v99[18] = v38;
    -[PPKQuickLookBannerView actionButton](self, "actionButton");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPKQuickLookBannerView closeButton](self, "closeButton");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:constant:", v34, -14.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v99[19] = v33;
    -[PPKQuickLookBannerView actionButton](self, "actionButton");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "centerYAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide centerYAnchor](self->_contentLayoutGuide, "centerYAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v99[20] = v29;
    -[PPKQuickLookBannerView closeButton](self, "closeButton");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](self->_contentLayoutGuide, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:constant:", v26, -14.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v99[21] = v25;
    -[PPKQuickLookBannerView closeButton](self, "closeButton");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "centerYAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide centerYAnchor](self->_contentLayoutGuide, "centerYAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v22);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v99[22] = v10;
    -[PPKQuickLookBannerView closeButton](self, "closeButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](self->_contentLayoutGuide, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintGreaterThanOrEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v99[23] = v14;
    -[PPKQuickLookBannerView closeButton](self, "closeButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](self->_contentLayoutGuide, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintLessThanOrEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v99[24] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v99, 25);
    v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v20 = self->_regularSizeConstraints;
    self->_regularSizeConstraints = v19;

    regularSizeConstraints = self->_regularSizeConstraints;
  }
  return regularSizeConstraints;
}

- (void)populateWithConfiguration:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  -[PPKQuickLookBannerView _updateImageViewWithConfiguration:](self, "_updateImageViewWithConfiguration:", v25);
  objc_msgSend(v25, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPKQuickLookBannerView title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  objc_msgSend(v25, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPKQuickLookBannerView subtitle](self, "subtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  objc_msgSend(v25, "subtitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length") == 0;
  -[PPKQuickLookBannerView subtitle](self, "subtitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", v9);

  -[PPKQuickLookBannerView actionButton](self, "actionButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPKQuickLookBannerView clearExistingActions:](self, "clearExistingActions:", v11);

  -[PPKQuickLookBannerView closeButton](self, "closeButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPKQuickLookBannerView clearExistingActions:](self, "clearExistingActions:", v12);

  objc_msgSend(v25, "primaryAction");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[PPKQuickLookBannerView actionButton](self, "actionButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "primaryAction");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAction:forControlEvents:", v15, 64);

    -[PPKQuickLookBannerView actionButton](self, "actionButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");

    objc_msgSend(v25, "primaryAction");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "title");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTitle:", v20);

    -[PPKQuickLookBannerView actionButton](self, "actionButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setConfiguration:", v18);

  }
  objc_msgSend(v25, "dismissAction");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[PPKQuickLookBannerView closeButton](self, "closeButton");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dismissAction");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addAction:forControlEvents:", v24, 64);

  }
}

- (void)_updateImageViewWithConfiguration:(id)a3
{
  void *v4;
  double v5;
  id v6;

  objc_msgSend(a3, "image");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PPKQuickLookBannerView imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v6);
  if (v6)
    v5 = 4.0;
  else
    v5 = 0.0;
  -[NSLayoutConstraint setActive:](self->_imageViewCollapsingConstraint, "setActive:", v6 == 0);
  -[NSLayoutConstraint setConstant:](self->_titleStackLeadingConstraint, "setConstant:", v5);
  objc_msgSend(v4, "setHidden:", v6 == 0);

}

- (void)clearExistingActions:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__PPKQuickLookBannerView_clearExistingActions___block_invoke;
  v5[3] = &unk_1EA839550;
  v6 = v3;
  v4 = v3;
  objc_msgSend(v4, "enumerateEventHandlers:", v5);

}

uint64_t __47__PPKQuickLookBannerView_clearExistingActions___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "removeAction:forControlEvents:", a2, a5);
  return result;
}

- (BOOL)_useCompactLayout
{
  void *v2;
  BOOL v3;
  void *v4;

  -[PPKQuickLookBannerView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "horizontalSizeClass") == 1)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "userInterfaceIdiom") == 0;

  }
  return v3;
}

- (BOOL)_isUsingAccessibilityContentSizeCategory
{
  void *v2;
  NSString *v3;
  BOOL IsAccessibilityCategory;

  -[PPKQuickLookBannerView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  return IsAccessibilityCategory;
}

- (int64_t)_numberOfTitleLines
{
  if (-[PPKQuickLookBannerView _isUsingAccessibilityContentSizeCategory](self, "_isUsingAccessibilityContentSizeCategory"))
  {
    return 0;
  }
  if (-[PPKQuickLookBannerView _useCompactLayout](self, "_useCompactLayout"))
    return 6;
  return 0;
}

- (int64_t)_numberOfSubtitleLines
{
  if (-[PPKQuickLookBannerView _isUsingAccessibilityContentSizeCategory](self, "_isUsingAccessibilityContentSizeCategory"))
  {
    return 0;
  }
  if (-[PPKQuickLookBannerView _useCompactLayout](self, "_useCompactLayout"))
    return 4;
  return 0;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PPKQuickLookBannerView;
  -[PPKQuickLookBannerView traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[PPKQuickLookBannerView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "horizontalSizeClass");
  if (v6 == objc_msgSend(v4, "horizontalSizeClass"))
  {
    -[PPKQuickLookBannerView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceStyle");
    v9 = objc_msgSend(v4, "userInterfaceStyle");

    if (v8 == v9)
      goto LABEL_6;
  }
  else
  {

  }
  -[PPKQuickLookBannerView _updateUI](self, "_updateUI");
LABEL_6:

}

- (void)showWithAnimations:(id)a3
{
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, a3, 0, 0.6, 0.0, 0.85, 0.0);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UILabel)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (UILabel)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
  objc_storeStrong((id *)&self->_actionButton, a3);
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
  objc_storeStrong((id *)&self->_closeButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_titleStackLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewCollapsingConstraint, 0);
  objc_storeStrong((id *)&self->_extraCompactSizeConstraints, 0);
  objc_storeStrong((id *)&self->_compactSizeConstraints, 0);
  objc_storeStrong((id *)&self->_regularSizeConstraints, 0);
  objc_storeStrong((id *)&self->_titleStackView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
}

@end
