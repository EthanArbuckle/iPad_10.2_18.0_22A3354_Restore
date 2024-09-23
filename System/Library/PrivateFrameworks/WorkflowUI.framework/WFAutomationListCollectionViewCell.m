@implementation WFAutomationListCollectionViewCell

- (BOOL)showsSeparator
{
  void *v2;
  char v3;

  -[WFAutomationListCollectionViewCell separatorView](self, "separatorView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden") ^ 1;

  return v3;
}

- (void)setShowsSeparator:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = !a3;
  -[WFAutomationListCollectionViewCell separatorView](self, "separatorView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (WFAutomationListCollectionViewCell)initWithFrame:(CGRect)a3
{
  WFAutomationListCollectionViewCell *v3;
  WFAutomationListCollectionViewCell *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  WFAutomationSummaryIconsView *v13;
  WFAutomationSummaryIconsView *summaryIconsView;
  double v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  UILabel *titleLabel;
  void *v23;
  double v24;
  uint64_t v25;
  UILabel *descriptionLabel;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  UIView *v49;
  UIView *separatorView;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  uint64_t v58;
  NSLayoutConstraint *separatorViewHeightConstraint;
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
  WFAutomationListCollectionViewCell *v71;
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
  id v86;
  objc_super v87;
  _QWORD v88[4];
  _QWORD v89[4];

  v89[2] = *MEMORY[0x24BDAC8D0];
  v87.receiver = self;
  v87.super_class = (Class)WFAutomationListCollectionViewCell;
  v3 = -[WFAutomationListCollectionViewCell initWithFrame:](&v87, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[WFAutomationListCollectionViewCell layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMasksToBounds:", 1);

    v6 = *MEMORY[0x24BDE58E8];
    -[WFAutomationListCollectionViewCell layer](v4, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCornerCurve:", v6);

    -[WFAutomationListCollectionViewCell layer](v4, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCornerRadius:", 16.0);

    -[WFAutomationListCollectionViewCell layer](v4, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMaskedCorners:", 0);

    -[WFAutomationListCollectionViewCell contentView](v4, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDirectionalLayoutMargins:", 16.0, 18.0, 14.0, 8.0);

    v86 = objc_alloc_init(MEMORY[0x24BEBDB00]);
    objc_msgSend(MEMORY[0x24BEBD4B8], "wf_tableCellDefaultSelectionTintColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "setBackgroundColor:", v11);

    -[WFAutomationListCollectionViewCell setSelectedBackgroundView:](v4, "setSelectedBackgroundView:", v86);
    v12 = objc_alloc_init(MEMORY[0x24BEBD978]);
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v12, "setAxis:", 1);
    objc_msgSend(v12, "setAlignment:", 0);
    objc_msgSend(v12, "setDistribution:", 0);
    objc_msgSend(v12, "setSpacing:", 4.0);
    v13 = objc_alloc_init(WFAutomationSummaryIconsView);
    summaryIconsView = v4->_summaryIconsView;
    v4->_summaryIconsView = v13;

    -[WFAutomationSummaryIconsView setTranslatesAutoresizingMaskIntoConstraints:](v4->_summaryIconsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v15) = 1148846080;
    -[WFAutomationSummaryIconsView setContentCompressionResistancePriority:forAxis:](v4->_summaryIconsView, "setContentCompressionResistancePriority:forAxis:", 1, v15);
    objc_msgSend(v12, "addArrangedSubview:", v4->_summaryIconsView);
    objc_msgSend(v12, "setCustomSpacing:afterView:", v4->_summaryIconsView, 12.0);
    v16 = objc_alloc(MEMORY[0x24BEBD708]);
    v17 = *MEMORY[0x24BDBF090];
    v18 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v19 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v20 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v21 = objc_msgSend(v16, "initWithFrame:", *MEMORY[0x24BDBF090], v18, v19, v20);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v21;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 2);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE200]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_titleLabel, "setFont:", v23);

    LODWORD(v24) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v24);
    objc_msgSend(v12, "addArrangedSubview:", v4->_titleLabel);
    v25 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v17, v18, v19, v20);
    descriptionLabel = v4->_descriptionLabel;
    v4->_descriptionLabel = (UILabel *)v25;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_descriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v4->_descriptionLabel, "setNumberOfLines:", 3);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_descriptionLabel, "setFont:", v27);

    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_descriptionLabel, "setTextColor:", v28);

    LODWORD(v29) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_descriptionLabel, "setContentCompressionResistancePriority:forAxis:", 1, v29);
    v84 = v12;
    objc_msgSend(v12, "addArrangedSubview:", v4->_descriptionLabel);
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("chevron.right"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "tertiaryLabelColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "imageWithTintColor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "imageWithRenderingMode:", 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "imageFlippedForRightToLeftLayoutDirection");
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v85);
    LODWORD(v35) = 1148829696;
    objc_msgSend(v34, "setContentCompressionResistancePriority:forAxis:", 0, v35);
    LODWORD(v36) = 1148829696;
    objc_msgSend(v34, "setContentHuggingPriority:forAxis:", 0, v36);
    v37 = objc_alloc(MEMORY[0x24BEBD978]);
    v89[0] = v84;
    v89[1] = v34;
    v82 = v34;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v89, 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v37, "initWithArrangedSubviews:", v38);

    objc_msgSend(v39, "setAxis:", 0);
    objc_msgSend(v39, "setSpacing:", 8.0);
    objc_msgSend(v39, "setAlignment:", 3);
    -[WFAutomationListCollectionViewCell contentView](v4, "contentView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = v39;
    objc_msgSend(v40, "addSubview:", v39);

    -[WFAutomationListCollectionViewCell contentView](v4, "contentView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "layoutMarginsGuide");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (id)objc_msgSend(v39, "wf_addConstraintsToFillLayoutGuide:", v42);

    objc_msgSend(v34, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationListCollectionViewCell contentView](v4, "contentView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "layoutMarginsGuide");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "trailingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setActive:", 1);

    v49 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    separatorView = v4->_separatorView;
    v4->_separatorView = v49;

    -[WFAutomationListCollectionViewCell separatorView](v4, "separatorView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    objc_msgSend(MEMORY[0x24BEBD4B8], "separatorColor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationListCollectionViewCell separatorView](v4, "separatorView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setBackgroundColor:", v52);

    -[WFAutomationListCollectionViewCell separatorView](v4, "separatorView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "heightAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationListCollectionViewCell traitCollection](v4, "traitCollection");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "displayScale");
    objc_msgSend(v55, "constraintEqualToConstant:", 1.0 / v57);
    v58 = objc_claimAutoreleasedReturnValue();
    separatorViewHeightConstraint = v4->_separatorViewHeightConstraint;
    v4->_separatorViewHeightConstraint = (NSLayoutConstraint *)v58;

    -[WFAutomationListCollectionViewCell contentView](v4, "contentView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationListCollectionViewCell separatorView](v4, "separatorView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "addSubview:", v61);

    v74 = (void *)MEMORY[0x24BDD1628];
    -[WFAutomationListCollectionViewCell separatorView](v4, "separatorView");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "leadingAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationListCollectionViewCell contentView](v4, "contentView");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "layoutMarginsGuide");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "leadingAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "constraintEqualToAnchor:", v77);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v88[0] = v76;
    -[WFAutomationListCollectionViewCell separatorView](v4, "separatorView");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "trailingAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationListCollectionViewCell contentView](v4, "contentView");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "trailingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintEqualToAnchor:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v88[1] = v64;
    -[WFAutomationListCollectionViewCell separatorView](v4, "separatorView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "bottomAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationListCollectionViewCell contentView](v4, "contentView");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "bottomAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToAnchor:", v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v88[2] = v69;
    v88[3] = v4->_separatorViewHeightConstraint;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v88, 4);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "activateConstraints:", v70);

    v71 = v4;
  }

  return v4;
}

- (void)setConfiguredTrigger:(id)a3 workflow:(id)a4
{
  id v6;

  v6 = a4;
  -[WFAutomationListCollectionViewCell setConfiguredTrigger:](self, "setConfiguredTrigger:", a3);
  -[WFAutomationListCollectionViewCell setWorkflow:](self, "setWorkflow:", v6);

  -[WFAutomationListCollectionViewCell updateUI](self, "updateUI");
}

- (unint64_t)maskedCorners
{
  void *v2;
  unint64_t v3;

  -[WFAutomationListCollectionViewCell layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maskedCorners");

  return v3;
}

- (void)setMaskedCorners:(unint64_t)a3
{
  id v4;

  -[WFAutomationListCollectionViewCell layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaskedCorners:", a3);

}

- (void)updateUI
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
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  Class HFTriggerIconFactoryClass_4937;
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
  unint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;

  -[WFAutomationListCollectionViewCell configuredTrigger](self, "configuredTrigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFAutomationListCollectionViewCell setTintColor:](self, "setTintColor:", 0);
    -[WFAutomationListCollectionViewCell configuredTrigger](self, "configuredTrigger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trigger");
    v48 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v48, "localizedDescriptionWithConfigurationSummary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationListCollectionViewCell titleLabel](self, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v5);

    -[WFAutomationListCollectionViewCell configuredTrigger](self, "configuredTrigger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v7, "isEnabled");

    if ((_DWORD)v6)
    {
      -[WFAutomationListCollectionViewCell workflow](self, "workflow");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "actionsDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAutomationListCollectionViewCell descriptionLabel](self, "descriptionLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setText:", v9);

    }
    else
    {
      WFLocalizedString(CFSTR("Disabled"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAutomationListCollectionViewCell descriptionLabel](self, "descriptionLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setText:", v8);
    }

    -[WFAutomationListCollectionViewCell summaryIconsView](self, "summaryIconsView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "displayGlyph");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "UIImage");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "displayGlyphTintColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "UIColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationListCollectionViewCell configuredTrigger](self, "configuredTrigger");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "trigger");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setTriggerIcon:tintColor:withTrigger:", v31, v33, v35);

    -[WFAutomationListCollectionViewCell workflow](self, "workflow");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "actions");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationListCollectionViewCell workflow](self, "workflow");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "actions");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "count");

    if (v40 >= 6)
      v41 = 6;
    else
      v41 = v40;
    objc_msgSend(v37, "subarrayWithRange:", 0, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v42, "if_compactMap:", &__block_literal_global_4932);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationListCollectionViewCell summaryIconsView](self, "summaryIconsView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setActionIcons:", v43);

  }
  else
  {
    -[WFAutomationListCollectionViewCell homeTrigger](self, "homeTrigger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "wf_homeTintColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAutomationListCollectionViewCell setTintColor:](self, "setTintColor:", v12);

      v13 = objc_alloc(getHFTriggerUISummaryClass_4934());
      -[WFAutomationListCollectionViewCell homeTrigger](self, "homeTrigger");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "trigger");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAutomationListCollectionViewCell homeTrigger](self, "homeTrigger");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "home");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = (id)objc_msgSend(v13, "initWithTrigger:inHome:forceDisabled:", v15, v17, 0);

      objc_msgSend(v48, "triggerDisplayTitle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAutomationListCollectionViewCell titleLabel](self, "titleLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setText:", v18);

      objc_msgSend(v48, "triggerDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAutomationListCollectionViewCell descriptionLabel](self, "descriptionLabel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setText:", v20);

      HFTriggerIconFactoryClass_4937 = getHFTriggerIconFactoryClass_4937();
      -[WFAutomationListCollectionViewCell homeTrigger](self, "homeTrigger");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "trigger");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[objc_class iconDescriptorForTrigger:](HFTriggerIconFactoryClass_4937, "iconDescriptorForTrigger:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFAutomationListCollectionViewCell summaryIconsView](self, "summaryIconsView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setHomeTriggerIcon:", v25);

      objc_msgSend(v48, "triggerSummaryIconDescriptors");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAutomationListCollectionViewCell summaryIconsView](self, "summaryIconsView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setHomeActionIcons:", v27);

    }
    else
    {
      -[WFAutomationListCollectionViewCell titleLabel](self, "titleLabel");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setText:", 0);

      -[WFAutomationListCollectionViewCell descriptionLabel](self, "descriptionLabel");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setText:", 0);

      -[WFAutomationListCollectionViewCell summaryIconsView](self, "summaryIconsView");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setTriggerIcon:tintColor:withTrigger:", 0, 0, 0);

      -[WFAutomationListCollectionViewCell summaryIconsView](self, "summaryIconsView");
      v48 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setActionIcons:", MEMORY[0x24BDBD1A8]);
    }
  }

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFAutomationListCollectionViewCell;
  -[WFAutomationListCollectionViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[WFAutomationListCollectionViewCell setConfiguredTrigger:workflow:](self, "setConfiguredTrigger:workflow:", 0, 0);
  -[WFAutomationListCollectionViewCell setHomeTrigger:](self, "setHomeTrigger:", 0);
  -[WFAutomationListCollectionViewCell setMaskedCorners:](self, "setMaskedCorners:", 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)WFAutomationListCollectionViewCell;
  v4 = a3;
  -[WFAutomationListCollectionViewCell traitCollectionDidChange:](&v14, sel_traitCollectionDidChange_, v4);
  -[WFAutomationListCollectionViewCell traitCollection](self, "traitCollection", v14.receiver, v14.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");
  v7 = v6;
  objc_msgSend(v4, "displayScale");
  v9 = v8;

  if (v7 != v9)
  {
    -[WFAutomationListCollectionViewCell traitCollection](self, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayScale");
    v12 = 1.0 / v11;
    -[WFAutomationListCollectionViewCell separatorViewHeightConstraint](self, "separatorViewHeightConstraint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setConstant:", v12);

  }
}

- (WFConfiguredTrigger)configuredTrigger
{
  return self->_configuredTrigger;
}

- (void)setConfiguredTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_configuredTrigger, a3);
}

- (WFWorkflow)workflow
{
  return self->_workflow;
}

- (void)setWorkflow:(id)a3
{
  objc_storeStrong((id *)&self->_workflow, a3);
}

- (HFTriggerItem)homeTrigger
{
  return self->_homeTrigger;
}

- (void)setHomeTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_homeTrigger, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (WFAutomationSummaryIconsView)summaryIconsView
{
  return self->_summaryIconsView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (NSLayoutConstraint)separatorViewHeightConstraint
{
  return self->_separatorViewHeightConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_summaryIconsView, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_homeTrigger, 0);
  objc_storeStrong((id *)&self->_workflow, 0);
  objc_storeStrong((id *)&self->_configuredTrigger, 0);
}

uint64_t __46__WFAutomationListCollectionViewCell_updateUI__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "icon");
}

@end
