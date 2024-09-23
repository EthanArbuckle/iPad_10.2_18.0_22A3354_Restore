@implementation WGWidgetPinningTeachingView

- (WGWidgetPinningTeachingView)init
{
  WGWidgetPinningTeachingView *v2;
  WGWidgetPinningTeachingView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WGWidgetPinningTeachingView;
  v2 = -[WGWidgetPinningTeachingView init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[WGWidgetPinningTeachingView setClipsSubviews:](v2, "setClipsSubviews:", 0);
    -[WGWidgetPinningTeachingView _createContainerViews](v3, "_createContainerViews");
    -[WGWidgetPinningTeachingView _createContentViews](v3, "_createContentViews");
    -[WGWidgetPinningTeachingView _createConstraints](v3, "_createConstraints");
    -[WGWidgetPinningTeachingView _setupButtonsTargets](v3, "_setupButtonsTargets");
    -[WGWidgetPinningTeachingView _updateFonts](v3, "_updateFonts");
    -[WGWidgetPinningTeachingView _updateFontDependantConstraints](v3, "_updateFontDependantConstraints");
    -[WGWidgetPinningTeachingView _updateAppearance](v3, "_updateAppearance");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__contentSizeCategoryDidChange, *MEMORY[0x24BDF7670], 0);

  }
  return v3;
}

- (void)startAnimating
{
  -[WGWidgetPinningTeachingAnimationView startAnimating](self->_iconImageView, "startAnimating");
}

- (void)stopAnimating
{
  -[WGWidgetPinningTeachingAnimationView stopAnimating](self->_iconImageView, "stopAnimating");
}

- (void)_yesButtonTapped
{
  id v3;

  -[WGWidgetPinningTeachingView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "widgetPinningTeachingViewDidSelectYes:", self);

}

- (void)_noButtonTapped
{
  id v3;

  -[WGWidgetPinningTeachingView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "widgetPinningTeachingViewDidSelectNo:", self);

}

- (void)_createContainerViews
{
  UIView *v3;
  UIView *contentView;
  UIView *v5;
  void *v6;

  v3 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
  contentView = self->_contentView;
  self->_contentView = v3;

  v5 = self->_contentView;
  objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v6);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView _setContinuousCornerRadius:](self->_contentView, "_setContinuousCornerRadius:", 13.0);
  -[UIView setClipsSubviews:](self->_contentView, "setClipsSubviews:", 1);
  -[WGWidgetPinningTeachingView addSubview:](self, "addSubview:", self->_contentView);
}

- (void)_createContentViews
{
  void *v3;
  UILabel *v4;
  UILabel *titleLabel;
  UILabel *v6;
  void *v7;
  void *v8;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  UILabel *bodyLabel;
  UILabel *v13;
  void *v14;
  void *v15;
  UILabel *v16;
  void *v17;
  WGColorHighlightButton *v18;
  UIButton *yesButton;
  UIButton *v20;
  void *v21;
  void *v22;
  UIButton *v23;
  void *v24;
  void *v25;
  void *v26;
  WGColorHighlightButton *v27;
  UIButton *noButton;
  UIButton *v29;
  void *v30;
  void *v31;
  UIButton *v32;
  void *v33;
  void *v34;
  void *v35;
  WGWidgetPinningTeachingAnimationView *v36;
  WGWidgetPinningTeachingAnimationView *iconImageView;
  uint64_t v38;
  void *v39;
  id v40;

  -[WGWidgetPinningTeachingView contentView](self, "contentView");
  v40 = (id)objc_claimAutoreleasedReturnValue();
  v38 = *MEMORY[0x24BDF7810];
  objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontDescriptorWithSymbolicTraits:", 2);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v4;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = self->_titleLabel;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("WIDGETS_EDIT_TODAY_HEADLINE"), &stru_24D733868, CFSTR("Widgets"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v6, "setText:", v8);

  v9 = self->_titleLabel;
  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v39, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v9, "setFont:", v10);

  objc_msgSend(v40, "addSubview:", self->_titleLabel);
  v11 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
  bodyLabel = self->_bodyLabel;
  self->_bodyLabel = v11;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_bodyLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v13 = self->_bodyLabel;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("WIDGETS_PIN_TEACHING_BODY"), &stru_24D733868, CFSTR("Widgets"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v13, "setText:", v15);

  -[UILabel setNumberOfLines:](self->_bodyLabel, "setNumberOfLines:", 0);
  v16 = self->_bodyLabel;
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", v38);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v16, "setFont:", v17);

  objc_msgSend(v40, "addSubview:", self->_bodyLabel);
  v18 = objc_alloc_init(WGColorHighlightButton);
  yesButton = self->_yesButton;
  self->_yesButton = &v18->super;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_yesButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton _setContinuousCornerRadius:](self->_yesButton, "_setContinuousCornerRadius:", 8.0);
  v20 = self->_yesButton;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("WIDGETS_PIN_TEACHING_YES_BUTTON"), &stru_24D733868, CFSTR("Widgets"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitle:forState:](v20, "setTitle:forState:", v22, 0);

  v23 = self->_yesButton;
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setBackgroundColor:](v23, "setBackgroundColor:", v24);

  -[UIButton titleLabel](self->_yesButton, "titleLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", v38);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFont:", v26);

  objc_msgSend(v25, "setNumberOfLines:", 0);
  objc_msgSend(v25, "setTextAlignment:", 1);
  objc_msgSend(v40, "addSubview:", self->_yesButton);
  v27 = objc_alloc_init(WGColorHighlightButton);
  noButton = self->_noButton;
  self->_noButton = &v27->super;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_noButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton _setContinuousCornerRadius:](self->_noButton, "_setContinuousCornerRadius:", 8.0);
  v29 = self->_noButton;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("WIDGETS_PIN_TEACHING_NO_BUTTON"), &stru_24D733868, CFSTR("Widgets"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitle:forState:](v29, "setTitle:forState:", v31, 0);

  v32 = self->_noButton;
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setBackgroundColor:](v32, "setBackgroundColor:", v33);

  -[UIButton titleLabel](self->_noButton, "titleLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", v38);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setFont:", v35);

  objc_msgSend(v34, "setNumberOfLines:", 0);
  objc_msgSend(v34, "setTextAlignment:", 1);
  objc_msgSend(v40, "addSubview:", self->_noButton);
  v36 = objc_alloc_init(WGWidgetPinningTeachingAnimationView);
  iconImageView = self->_iconImageView;
  self->_iconImageView = v36;

  -[WGWidgetPinningTeachingAnimationView setTranslatesAutoresizingMaskIntoConstraints:](self->_iconImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v40, "addSubview:", self->_iconImageView);

}

- (void)_createConstraints
{
  void *v3;
  void *v4;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSLayoutConstraint *v27;
  NSLayoutConstraint *titleLabelTopConstraint;
  void *v29;
  void *v30;
  NSLayoutConstraint *v31;
  NSLayoutConstraint *titleLabelToBodyLabelConstraint;
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
  double v45;
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
  id v64;

  -[WGWidgetPinningTeachingView contentView](self, "contentView");
  v64 = (id)objc_claimAutoreleasedReturnValue();
  -[WGWidgetPinningTeachingView heightAnchor](self, "heightAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "heightAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:multiplier:", v4, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", 1);

  -[WGWidgetPinningTeachingView widthAnchor](self, "widthAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "widthAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:multiplier:", v7, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

  -[WGWidgetPinningTeachingAnimationView leadingAnchor](self->_iconImageView, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, 22.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  -[WGWidgetPinningTeachingAnimationView topAnchor](self->_iconImageView, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, 29.5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  -[WGWidgetPinningTeachingAnimationView heightAnchor](self->_iconImageView, "heightAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToConstant:", 51.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  -[WGWidgetPinningTeachingAnimationView widthAnchor](self->_iconImageView, "widthAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToConstant:", 63.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, 103.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, -22.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setActive:", 1);

  -[UILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, 0.0);
  v27 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  titleLabelTopConstraint = self->_titleLabelTopConstraint;
  self->_titleLabelTopConstraint = v27;

  -[NSLayoutConstraint setActive:](self->_titleLabelTopConstraint, "setActive:", 1);
  -[UILabel firstBaselineAnchor](self->_bodyLabel, "firstBaselineAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel lastBaselineAnchor](self->_titleLabel, "lastBaselineAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, 0.0);
  v31 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  titleLabelToBodyLabelConstraint = self->_titleLabelToBodyLabelConstraint;
  self->_titleLabelToBodyLabelConstraint = v31;

  -[NSLayoutConstraint setActive:](self->_titleLabelToBodyLabelConstraint, "setActive:", 1);
  -[UILabel leadingAnchor](self->_bodyLabel, "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34, 0.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setActive:", 1);

  -[UILabel trailingAnchor](self->_bodyLabel, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, 0.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setActive:", 1);

  -[UIButton topAnchor](self->_yesButton, "topAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel lastBaselineAnchor](self->_bodyLabel, "lastBaselineAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:constant:", v40, 19.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setActive:", 1);

  objc_msgSend(v64, "bottomAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton bottomAnchor](self->_yesButton, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:constant:", v43, 9.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v45) = 1132068864;
  objc_msgSend(v44, "setPriority:", v45);
  objc_msgSend(v44, "setActive:", 1);
  -[UIButton topAnchor](self->_noButton, "topAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton topAnchor](self->_yesButton, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:constant:", v47, 0.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setActive:", 1);

  -[UIButton bottomAnchor](self->_noButton, "bottomAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton bottomAnchor](self->_yesButton, "bottomAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:constant:", v50, 0.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setActive:", 1);

  -[UIButton leadingAnchor](self->_noButton, "leadingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "leadingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:constant:", v53, 9.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setActive:", 1);

  -[UIButton leadingAnchor](self->_yesButton, "leadingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton trailingAnchor](self->_noButton, "trailingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:constant:", v56, 9.0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setActive:", 1);

  objc_msgSend(v64, "trailingAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton trailingAnchor](self->_yesButton, "trailingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:constant:", v59, 9.0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setActive:", 1);

  -[UIButton widthAnchor](self->_noButton, "widthAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton widthAnchor](self->_yesButton, "widthAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:", v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setActive:", 1);

}

- (void)_setupButtonsTargets
{
  -[UIButton addTarget:action:forControlEvents:](self->_yesButton, "addTarget:action:forControlEvents:", self, sel__yesButtonTapped, 64);
  -[UIButton addTarget:action:forControlEvents:](self->_noButton, "addTarget:action:forControlEvents:", self, sel__noButtonTapped, 64);
}

- (void)_contentSizeCategoryDidChange
{
  -[WGWidgetPinningTeachingView _updateFonts](self, "_updateFonts");
  -[WGWidgetPinningTeachingView _updateFontDependantConstraints](self, "_updateFontDependantConstraints");
}

- (void)_updateFonts
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *MEMORY[0x24BDF7810];
  objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BDF7810]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fontDescriptorWithSymbolicTraits:", 2);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v9, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v5);
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_bodyLabel, "setFont:", v6);
  -[UIButton titleLabel](self->_yesButton, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

  -[UIButton titleLabel](self->_noButton, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v6);

}

- (void)_updateFontDependantConstraints
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  -[UILabel font](self->_titleLabel, "font");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "capHeight");
  -[NSLayoutConstraint setConstant:](self->_titleLabelTopConstraint, "setConstant:", v3 + 19.5);
  objc_msgSend(v7, "lineHeight");
  v5 = v4;
  objc_msgSend(v7, "leading");
  -[NSLayoutConstraint setConstant:](self->_titleLabelToBodyLabelConstraint, "setConstant:", v5 + v6 + 1.0);

}

- (void)_updateAppearance
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  UILabel *titleLabel;
  void *v8;
  UILabel *bodyLabel;
  void *v10;
  UIButton *yesButton;
  void *v12;
  UIButton *v13;
  void *v14;
  UIButton *noButton;
  void *v16;
  UIButton *v17;
  void *v18;
  UILabel *v19;
  void *v20;
  UILabel *v21;
  void *v22;
  UIButton *v23;
  void *v24;
  UIButton *v25;
  void *v26;
  UIButton *v27;
  void *v28;
  id v29;

  -[WGWidgetPinningTeachingView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  -[WGWidgetPinningTeachingView contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == 2)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "systemGray6Color");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v6);

    titleLabel = self->_titleLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](titleLabel, "setTextColor:", v8);

    bodyLabel = self->_bodyLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](bodyLabel, "setTextColor:", v10);

    yesButton = self->_yesButton;
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](yesButton, "setTitleColor:forState:", v12, 0);

    v13 = self->_yesButton;
    objc_msgSend(MEMORY[0x24BDF6950], "systemGray4Color");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](v13, "setBackgroundColor:", v14);

    noButton = self->_noButton;
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](noButton, "setTitleColor:forState:", v16, 0);

    v17 = self->_noButton;
    objc_msgSend(MEMORY[0x24BDF6950], "systemGray4Color");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v18);

    v19 = self->_titleLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v19, "setTextColor:", v20);

    v21 = self->_bodyLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v21, "setTextColor:", v22);

    v23 = self->_yesButton;
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v23, "setTitleColor:forState:", v24, 0);

    v25 = self->_yesButton;
    objc_msgSend(MEMORY[0x24BDF6950], "systemGray5Color");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](v25, "setBackgroundColor:", v26);

    v27 = self->_noButton;
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v27, "setTitleColor:forState:", v28, 0);

    v17 = self->_noButton;
    objc_msgSend(MEMORY[0x24BDF6950], "systemGray5Color");
  }
  v29 = (id)objc_claimAutoreleasedReturnValue();
  -[UIButton setBackgroundColor:](v17, "setBackgroundColor:");

}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (WGWidgetPinningTeachingViewDelegate)delegate
{
  return (WGWidgetPinningTeachingViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)bodyLabel
{
  return self->_bodyLabel;
}

- (void)setBodyLabel:(id)a3
{
  objc_storeStrong((id *)&self->_bodyLabel, a3);
}

- (UIButton)yesButton
{
  return self->_yesButton;
}

- (void)setYesButton:(id)a3
{
  objc_storeStrong((id *)&self->_yesButton, a3);
}

- (UIButton)noButton
{
  return self->_noButton;
}

- (void)setNoButton:(id)a3
{
  objc_storeStrong((id *)&self->_noButton, a3);
}

- (WGWidgetPinningTeachingAnimationView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageView, a3);
}

- (NSLayoutConstraint)titleLabelTopConstraint
{
  return self->_titleLabelTopConstraint;
}

- (void)setTitleLabelTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelTopConstraint, a3);
}

- (NSLayoutConstraint)titleLabelToBodyLabelConstraint
{
  return self->_titleLabelToBodyLabelConstraint;
}

- (void)setTitleLabelToBodyLabelConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelToBodyLabelConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabelToBodyLabelConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelTopConstraint, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_noButton, 0);
  objc_storeStrong((id *)&self->_yesButton, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
