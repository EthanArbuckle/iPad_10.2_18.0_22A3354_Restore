@implementation PRXFeatureTableViewCell

- (PRXFeatureTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PRXFeatureTableViewCell *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UILabel *v9;
  UILabel *titleLabel;
  double v11;
  void *v12;
  UILabel *v13;
  UILabel *subtitleLabel;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSLayoutConstraint *titleLabelLeadingAnchor;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSLayoutConstraint *titleLabelTrailingAnchor;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSLayoutConstraint *layoutGuideHeightConstraint;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  PRXFeatureTableViewCell *v46;
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
  objc_super v73;
  _QWORD v74[13];

  v74[11] = *MEMORY[0x24BDAC8D0];
  v73.receiver = self;
  v73.super_class = (Class)PRXFeatureTableViewCell;
  v4 = -[PRXFeatureTableViewCell initWithStyle:reuseIdentifier:](&v73, sel_initWithStyle_reuseIdentifier_, 0, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BDF7810]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v5, "symbolicTraits") | 0x8000);
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x24BDF6A70];
    objc_msgSend(v72, "pointSize");
    objc_msgSend(v6, "fontWithDescriptor:size:", v72);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BDF77C0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v7, "symbolicTraits") | 0x8000);
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x24BDF6A70];
    objc_msgSend(v71, "pointSize");
    objc_msgSend(v8, "fontWithDescriptor:size:", v71);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v9;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setFont:](v4->_titleLabel, "setFont:", v70);
    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v4->_titleLabel, "setLineBreakMode:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    LODWORD(v11) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v11);
    -[PRXFeatureTableViewCell contentView](v4, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v4->_titleLabel);

    v13 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v13;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setFont:](v4->_subtitleLabel, "setFont:", v69);
    -[UILabel setNumberOfLines:](v4->_subtitleLabel, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_subtitleLabel, "setTextColor:", v15);

    -[UILabel setLineBreakMode:](v4->_subtitleLabel, "setLineBreakMode:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_subtitleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    LODWORD(v16) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_subtitleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v16);
    -[PRXFeatureTableViewCell contentView](v4, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v4->_subtitleLabel);

    -[UILabel leadingAnchor](v4->_titleLabel, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXFeatureTableViewCell contentView](v4, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "layoutMarginsGuide");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    titleLabelLeadingAnchor = v4->_titleLabelLeadingAnchor;
    v4->_titleLabelLeadingAnchor = (NSLayoutConstraint *)v22;

    -[UILabel trailingAnchor](v4->_titleLabel, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXFeatureTableViewCell contentView](v4, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "layoutMarginsGuide");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v27);
    v28 = objc_claimAutoreleasedReturnValue();
    titleLabelTrailingAnchor = v4->_titleLabelTrailingAnchor;
    v4->_titleLabelTrailingAnchor = (NSLayoutConstraint *)v28;

    v30 = objc_alloc_init(MEMORY[0x24BDF6B78]);
    v31 = objc_alloc_init(MEMORY[0x24BDF6B78]);
    -[PRXFeatureTableViewCell contentView](v4, "contentView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addLayoutGuide:", v30);

    -[PRXFeatureTableViewCell contentView](v4, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addLayoutGuide:", v31);

    objc_msgSend(v30, "heightAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintGreaterThanOrEqualToConstant:", 15.0);
    v35 = objc_claimAutoreleasedReturnValue();
    layoutGuideHeightConstraint = v4->_layoutGuideHeightConstraint;
    v4->_layoutGuideHeightConstraint = (NSLayoutConstraint *)v35;

    v55 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v30, "heightAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "heightAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:", v67);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v74[0] = v66;
    v74[1] = v4->_layoutGuideHeightConstraint;
    v63 = v30;
    objc_msgSend(v30, "topAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXFeatureTableViewCell contentView](v4, "contentView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "topAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToAnchor:", v62);
    v60 = v31;
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v74[2] = v61;
    objc_msgSend(v31, "bottomAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXFeatureTableViewCell contentView](v4, "contentView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "bottomAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v57);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v74[3] = v56;
    -[UILabel topAnchor](v4->_titleLabel, "topAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "bottomAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:", v53);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v74[4] = v52;
    -[UILabel bottomAnchor](v4->_subtitleLabel, "bottomAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "topAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v50);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v74[5] = v49;
    v74[6] = v4->_titleLabelLeadingAnchor;
    v74[7] = v4->_titleLabelTrailingAnchor;
    -[UILabel topAnchor](v4->_subtitleLabel, "topAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v4->_titleLabel, "bottomAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:constant:", v37, 2.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v74[8] = v38;
    -[UILabel leadingAnchor](v4->_subtitleLabel, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leadingAnchor](v4->_titleLabel, "leadingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v74[9] = v41;
    -[UILabel trailingAnchor](v4->_subtitleLabel, "trailingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v4->_titleLabel, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v74[10] = v44;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v74, 11);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "activateConstraints:", v45);

    -[PRXFeatureTableViewCell _updateLabelHyphenationFactor](v4, "_updateLabelHyphenationFactor");
    v46 = v4;

  }
  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PRXFeatureTableViewCell;
  -[PRXFeatureTableViewCell traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[PRXFeatureTableViewCell _updateLabelHyphenationFactor](self, "_updateLabelHyphenationFactor");
  -[PRXFeatureTableViewCell _updateImageViewAnchors](self, "_updateImageViewAnchors");
  -[PRXFeatureTableViewCell _updateTitleIndent](self, "_updateTitleIndent");
}

- (void)layoutMarginsDidChange
{
  double v3;
  double v4;
  void *v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PRXFeatureTableViewCell;
  -[PRXFeatureTableViewCell layoutMarginsDidChange](&v7, sel_layoutMarginsDidChange);
  -[PRXFeatureTableViewCell directionalLayoutMargins](self, "directionalLayoutMargins");
  v4 = v3;
  -[PRXFeatureTableViewCell featureImageView](self, "featureImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PRXFeatureTableViewCell featureImageSize](self, "featureImageSize");
    v4 = v4 + v6 + 16.0;
  }
  -[PRXFeatureTableViewCell directionalLayoutMargins](self, "directionalLayoutMargins");
  -[PRXFeatureTableViewCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v4, 0.0);
}

- (void)setFeatureImageView:(id)a3
{
  UIView *v5;
  UIView **p_featureImageView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v5 = (UIView *)a3;
  p_featureImageView = &self->_featureImageView;
  if (self->_featureImageView != v5)
  {
    objc_storeStrong((id *)&self->_featureImageView, a3);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](*p_featureImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PRXFeatureTableViewCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", *p_featureImageView);

    -[UIView leadingAnchor](*p_featureImageView, "leadingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXFeatureTableViewCell contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layoutMarginsGuide");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "leadingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXFeatureTableViewCell setImageViewLeadingAnchor:](self, "setImageViewLeadingAnchor:", v12);

    -[PRXFeatureTableViewCell _updateImageViewAnchors](self, "_updateImageViewAnchors");
    -[PRXFeatureTableViewCell _updateTitleLeadingAnchor](self, "_updateTitleLeadingAnchor");
    -[PRXFeatureTableViewCell _updateTitleIndent](self, "_updateTitleIndent");
    v13 = (void *)MEMORY[0x24BDD1628];
    -[PRXFeatureTableViewCell imageViewLeadingAnchor](self, "imageViewLeadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "activateConstraints:", v15);

  }
}

- (void)setSwitchControl:(id)a3
{
  UISwitch *v5;
  UISwitch **p_switchControl;
  UISwitch *switchControl;
  double v8;
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
  void *v27;
  UISwitch *v28;
  _QWORD v29[3];
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v5 = (UISwitch *)a3;
  p_switchControl = &self->_switchControl;
  switchControl = self->_switchControl;
  if (switchControl != v5)
  {
    v28 = v5;
    -[UISwitch removeFromSuperview](switchControl, "removeFromSuperview");
    objc_storeStrong((id *)&self->_switchControl, a3);
    -[UISwitch setTranslatesAutoresizingMaskIntoConstraints:](*p_switchControl, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v8) = 1148846080;
    -[UISwitch setContentCompressionResistancePriority:forAxis:](*p_switchControl, "setContentCompressionResistancePriority:forAxis:", 0, v8);
    -[PRXFeatureTableViewCell contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", *p_switchControl);

    v10 = (void *)MEMORY[0x24BDD1628];
    -[PRXFeatureTableViewCell titleLabelTrailingAnchor](self, "titleLabelTrailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deactivateConstraints:", v12);

    v23 = (void *)MEMORY[0x24BDD1628];
    -[UISwitch leadingAnchor](*p_switchControl, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXFeatureTableViewCell titleLabel](self, "titleLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintGreaterThanOrEqualToAnchor:constant:", v25, 12.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v24;
    -[UISwitch centerYAnchor](*p_switchControl, "centerYAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXFeatureTableViewCell contentView](self, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "centerYAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v16;
    -[UISwitch trailingAnchor](*p_switchControl, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXFeatureTableViewCell contentView](self, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layoutMarginsGuide");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:constant:", v20, -2.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v29[2] = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "activateConstraints:", v22);

    v5 = v28;
  }

}

- (void)setTitle:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x24BDD1458];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithString:", v5);

  -[PRXFeatureTableViewCell titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAttributedText:", v6);

  -[PRXFeatureTableViewCell _updateTitleIndent](self, "_updateTitleIndent");
}

- (void)setSubtitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PRXFeatureTableViewCell subtitleLabel](self, "subtitleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (void)setFeatureImageSize:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  self->_featureImageSize = a3;
  v5 = (void *)MEMORY[0x24BDD1628];
  -[UIView widthAnchor](self->_featureImageView, "widthAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToConstant:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  -[UIView heightAnchor](self->_featureImageView, "heightAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToConstant:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activateConstraints:", v10);

  -[PRXFeatureTableViewCell _updateTitleIndent](self, "_updateTitleIndent");
}

- (void)setHidingSeparator:(BOOL)a3
{
  id v3;

  self->_hidingSeparator = a3;
  -[PRXFeatureTableViewCell layoutGuideHeightConstraint](self, "layoutGuideHeightConstraint");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConstant:", 15.0);

}

- (void)_updateLabelHyphenationFactor
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
  void *v6;
  double v7;
  double v8;
  id v9;

  -[PRXFeatureTableViewCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory)
  {
    -[PRXFeatureTableViewCell titleLabel](self, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = 1045220557;
    objc_msgSend(v6, "_setHyphenationFactor:", v7);

    -[PRXFeatureTableViewCell subtitleLabel](self, "subtitleLabel");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = 1055286886;
    objc_msgSend(v9, "_setHyphenationFactor:", v8);

  }
}

- (void)_updateImageViewAnchors
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[PRXFeatureTableViewCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (self->_featureImageView)
  {
    -[PRXFeatureTableViewCell imageViewVerticalAnchor](self, "imageViewVerticalAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setActive:", 0);

    if (IsAccessibilityCategory)
    {
      -[PRXFeatureTableViewCell titleLabel](self, "titleLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "font");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lineHeight");
      v10 = v9 * 0.5;

      -[UIView centerYAnchor](self->_featureImageView, "centerYAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRXFeatureTableViewCell titleLabel](self, "titleLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "topAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, v10);
    }
    else
    {
      -[UIView centerYAnchor](self->_featureImageView, "centerYAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRXFeatureTableViewCell contentView](self, "contentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "centerYAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToAnchor:", v13);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXFeatureTableViewCell setImageViewVerticalAnchor:](self, "setImageViewVerticalAnchor:", v14);

    -[PRXFeatureTableViewCell imageViewVerticalAnchor](self, "imageViewVerticalAnchor");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setActive:", 1);

  }
}

- (void)_updateTitleLeadingAnchor
{
  void *v3;
  void *v4;
  NSString *v5;
  _BOOL4 IsAccessibilityCategory;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (self->_featureImageView)
  {
    -[PRXFeatureTableViewCell titleLabelLeadingAnchor](self, "titleLabelLeadingAnchor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setActive:", 0);

    -[PRXFeatureTableViewCell traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

    -[PRXFeatureTableViewCell titleLabel](self, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "leadingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (IsAccessibilityCategory)
    {
      -[PRXFeatureTableViewCell contentView](self, "contentView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "layoutMarginsGuide");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "leadingAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "constraintEqualToAnchor:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRXFeatureTableViewCell setTitleLabelLeadingAnchor:](self, "setTitleLabelLeadingAnchor:", v12);

    }
    else
    {
      -[PRXFeatureTableViewCell featureImageView](self, "featureImageView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "trailingAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "constraintEqualToAnchor:constant:", v10, 16.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRXFeatureTableViewCell setTitleLabelLeadingAnchor:](self, "setTitleLabelLeadingAnchor:", v11);
    }

    -[PRXFeatureTableViewCell titleLabelLeadingAnchor](self, "titleLabelLeadingAnchor");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActive:", 1);

  }
}

- (void)_updateTitleIndent
{
  void *v3;
  void *v4;
  UIView *featureImageView;
  id v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  -[PRXFeatureTableViewCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v4))
  {

    goto LABEL_5;
  }
  featureImageView = self->_featureImageView;

  if (!featureImageView)
  {
LABEL_5:
    v8 = (void *)MEMORY[0x24BDBD1B8];
    goto LABEL_6;
  }
  v6 = objc_alloc_init(MEMORY[0x24BDF6748]);
  -[PRXFeatureTableViewCell featureImageSize](self, "featureImageSize");
  objc_msgSend(v6, "setFirstLineHeadIndent:", v7 + 16.0);
  objc_msgSend(v6, "setLineBreakStrategy:", 0xFFFFLL);
  v13 = *MEMORY[0x24BDF6628];
  v14[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  -[PRXFeatureTableViewCell titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attributedText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v11, "setAttributes:range:", v8, 0, objc_msgSend(v11, "length"));
  -[PRXFeatureTableViewCell titleLabel](self, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAttributedText:", v11);

}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (UIView)featureImageView
{
  return self->_featureImageView;
}

- (UISwitch)switchControl
{
  return self->_switchControl;
}

- (BOOL)isHidingSeparator
{
  return self->_hidingSeparator;
}

- (double)featureImageSize
{
  return self->_featureImageSize;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (NSLayoutConstraint)layoutGuideHeightConstraint
{
  return self->_layoutGuideHeightConstraint;
}

- (NSLayoutConstraint)titleLabelLeadingAnchor
{
  return self->_titleLabelLeadingAnchor;
}

- (void)setTitleLabelLeadingAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelLeadingAnchor, a3);
}

- (NSLayoutConstraint)titleLabelTrailingAnchor
{
  return self->_titleLabelTrailingAnchor;
}

- (void)setTitleLabelTrailingAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelTrailingAnchor, a3);
}

- (NSLayoutConstraint)imageViewLeadingAnchor
{
  return self->_imageViewLeadingAnchor;
}

- (void)setImageViewLeadingAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_imageViewLeadingAnchor, a3);
}

- (NSLayoutConstraint)imageViewVerticalAnchor
{
  return self->_imageViewVerticalAnchor;
}

- (void)setImageViewVerticalAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_imageViewVerticalAnchor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageViewVerticalAnchor, 0);
  objc_storeStrong((id *)&self->_imageViewLeadingAnchor, 0);
  objc_storeStrong((id *)&self->_titleLabelTrailingAnchor, 0);
  objc_storeStrong((id *)&self->_titleLabelLeadingAnchor, 0);
  objc_storeStrong((id *)&self->_layoutGuideHeightConstraint, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_switchControl, 0);
  objc_storeStrong((id *)&self->_featureImageView, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
