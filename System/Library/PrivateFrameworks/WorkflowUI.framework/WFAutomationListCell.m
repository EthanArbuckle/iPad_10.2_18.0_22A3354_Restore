@implementation WFAutomationListCell

- (WFAutomationListCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WFAutomationListCell *v4;
  WFAutomationListCell *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  WFAutomationSummaryIconsView *v18;
  WFAutomationSummaryIconsView *summaryIconsView;
  double v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  UILabel *titleLabel;
  void *v28;
  double v29;
  uint64_t v30;
  UILabel *descriptionLabel;
  void *v32;
  void *v33;
  double v34;
  WFAutomationListCell *v35;
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
  id v50;
  objc_super v51;
  _QWORD v52[6];

  v52[4] = *MEMORY[0x24BDAC8D0];
  v51.receiver = self;
  v51.super_class = (Class)WFAutomationListCell;
  v4 = -[WFAutomationListCell initWithStyle:reuseIdentifier:](&v51, sel_initWithStyle_reuseIdentifier_, 0, a4);
  v5 = v4;
  if (v4)
  {
    -[WFAutomationListCell setSeparatorInset:](v4, "setSeparatorInset:", 0.0, 18.0, 0.0, 0.0);
    -[WFAutomationListCell setAccessoryType:](v5, "setAccessoryType:", 1);
    v50 = objc_alloc_init(MEMORY[0x24BEBDB00]);
    objc_msgSend(MEMORY[0x24BEBD4B8], "wf_tableCellDefaultSelectionTintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setBackgroundColor:", v6);

    -[WFAutomationListCell setSelectedBackgroundView:](v5, "setSelectedBackgroundView:", v50);
    -[WFAutomationListCell contentView](v5, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDirectionalLayoutMargins:", 16.0, 18.0, 14.0, 8.0);

    v8 = objc_alloc_init(MEMORY[0x24BEBD978]);
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v8, "setAxis:", 1);
    objc_msgSend(v8, "setAlignment:", 0);
    objc_msgSend(v8, "setDistribution:", 0);
    objc_msgSend(v8, "setSpacing:", 4.0);
    -[WFAutomationListCell contentView](v5, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v8);

    objc_msgSend(v8, "topAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationListCell contentView](v5, "contentView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "layoutMarginsGuide");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "topAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v46);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v45;
    objc_msgSend(v8, "bottomAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationListCell contentView](v5, "contentView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "layoutMarginsGuide");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "bottomAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v41);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v52[1] = v40;
    objc_msgSend(v8, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationListCell contentView](v5, "contentView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "layoutMarginsGuide");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "leadingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v52[2] = v12;
    objc_msgSend(v8, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationListCell contentView](v5, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layoutMarginsGuide");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v52[3] = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 4);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v38);
    v18 = objc_alloc_init(WFAutomationSummaryIconsView);
    summaryIconsView = v5->_summaryIconsView;
    v5->_summaryIconsView = v18;

    -[WFAutomationSummaryIconsView setTranslatesAutoresizingMaskIntoConstraints:](v5->_summaryIconsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v20) = 1148846080;
    -[WFAutomationSummaryIconsView setContentCompressionResistancePriority:forAxis:](v5->_summaryIconsView, "setContentCompressionResistancePriority:forAxis:", 1, v20);
    objc_msgSend(v8, "addArrangedSubview:", v5->_summaryIconsView);
    objc_msgSend(v8, "setCustomSpacing:afterView:", v5->_summaryIconsView, 12.0);
    v21 = objc_alloc(MEMORY[0x24BEBD708]);
    v22 = *MEMORY[0x24BDBF090];
    v23 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v24 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v25 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v26 = objc_msgSend(v21, "initWithFrame:", *MEMORY[0x24BDBF090], v23, v24, v25);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = (UILabel *)v26;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v5->_titleLabel, "setNumberOfLines:", 3);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE200]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_titleLabel, "setFont:", v28);

    LODWORD(v29) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v5->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v29);
    objc_msgSend(v8, "addArrangedSubview:", v5->_titleLabel);
    v30 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v22, v23, v24, v25);
    descriptionLabel = v5->_descriptionLabel;
    v5->_descriptionLabel = (UILabel *)v30;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_descriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v5->_descriptionLabel, "setNumberOfLines:", 3);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_descriptionLabel, "setFont:", v32);

    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5->_descriptionLabel, "setTextColor:", v33);

    LODWORD(v34) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v5->_descriptionLabel, "setContentCompressionResistancePriority:forAxis:", 1, v34);
    objc_msgSend(v8, "addArrangedSubview:", v5->_descriptionLabel);
    v35 = v5;

  }
  return v5;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  width = a3.width;
  v4 = *(double *)(MEMORY[0x24BEBE588] + 8);
  -[WFAutomationListCell contentView](self, "contentView", a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = 1148846080;
  LODWORD(v7) = 1112014848;
  objc_msgSend(v5, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, v4, v6, v7);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)setTitle:(id)a3 description:(id)a4 triggerIcon:(id)a5 triggerTintColor:(id)a6 triggerCornerRadius:(double)a7 actionIcons:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v14 = a8;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  -[WFAutomationListCell titleLabel](self, "titleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setText:", v18);

  -[WFAutomationListCell descriptionLabel](self, "descriptionLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setText:", v17);

  -[WFAutomationListCell summaryIconsView](self, "summaryIconsView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "platformImage");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "platformColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "setTriggerIcon:tintColor:withCornerRadius:", v22, v23, a7);
  -[WFAutomationListCell summaryIconsView](self, "summaryIconsView");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setActionIcons:", v14);

}

- (void)setConfiguredTrigger:(id)a3 workflow:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = a4;
  -[WFAutomationListCell setConfiguredTrigger:](self, "setConfiguredTrigger:", a3);
  -[WFAutomationListCell setWorkflow:](self, "setWorkflow:", v9);

  -[WFAutomationListCell setDelegate:](self, "setDelegate:", v8);
  -[WFAutomationListCell updateUI](self, "updateUI");
}

- (void)setHomeTrigger:(id)a3
{
  HFTriggerItem *v5;
  HFTriggerItem *homeTrigger;
  char v7;
  HFTriggerItem *v8;

  v5 = (HFTriggerItem *)a3;
  homeTrigger = self->_homeTrigger;
  if (homeTrigger != v5)
  {
    v8 = v5;
    v7 = -[HFTriggerItem isEqual:](homeTrigger, "isEqual:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_homeTrigger, a3);
      -[WFAutomationListCell setConfiguredTrigger:](self, "setConfiguredTrigger:", 0);
      -[WFAutomationListCell setWorkflow:](self, "setWorkflow:", 0);
      -[WFAutomationListCell updateUI](self, "updateUI");
      v5 = v8;
    }
  }

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
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  Class HFTriggerIconFactoryClass;
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
  unint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x24BDAC8D0];
  -[WFAutomationListCell configuredTrigger](self, "configuredTrigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationListCell setTintColor:](self, "setTintColor:", v4);

    -[WFAutomationListCell configuredTrigger](self, "configuredTrigger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trigger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "localizedDescriptionWithConfigurationSummary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationListCell titleLabel](self, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v7);

    -[WFAutomationListCell configuredTrigger](self, "configuredTrigger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v9, "isEnabled");

    if ((_DWORD)v8)
    {
      -[WFAutomationListCell workflow](self, "workflow");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "hiddenFromLibraryAndSync");

      -[WFAutomationListCell workflow](self, "workflow");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v11)
        objc_msgSend(v12, "actionsDescription");
      else
        objc_msgSend(v12, "name");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAutomationListCell descriptionLabel](self, "descriptionLabel");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setText:", v32);

    }
    else
    {
      WFLocalizedString(CFSTR("Disabled"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAutomationListCell descriptionLabel](self, "descriptionLabel");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setText:", v13);
    }

    -[WFAutomationListCell summaryIconsView](self, "summaryIconsView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayGlyph");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "platformImage");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayGlyphTintColor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "UIColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setTriggerIcon:tintColor:withTrigger:", v36, v38, v6);

    -[WFAutomationListCell workflow](self, "workflow");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v35) = objc_msgSend(v39, "hiddenFromLibraryAndSync");

    -[WFAutomationListCell workflow](self, "workflow");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if ((_DWORD)v35)
    {
      objc_msgSend(v40, "actions");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAutomationListCell workflow](self, "workflow");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "actions");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "count");

      if (v45 >= 6)
        v46 = 6;
      else
        v46 = v45;
      objc_msgSend(v42, "subarrayWithRange:", 0, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v47, "count"))
        goto LABEL_20;
      objc_msgSend(v47, "if_compactMap:", &__block_literal_global_1771);
      v48 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v40, "icon");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "icon");
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v47)
      {
LABEL_20:

        return;
      }
      v56[0] = v47;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 1);
      v48 = objc_claimAutoreleasedReturnValue();
    }
    v50 = (void *)v48;
    -[WFAutomationListCell summaryIconsView](self, "summaryIconsView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setActionIcons:", v50);

    goto LABEL_20;
  }
  -[WFAutomationListCell homeTrigger](self, "homeTrigger");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "wf_homeTintColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationListCell setTintColor:](self, "setTintColor:", v15);

    v16 = objc_alloc(getHFTriggerUISummaryClass());
    -[WFAutomationListCell homeTrigger](self, "homeTrigger");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "trigger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationListCell homeTrigger](self, "homeTrigger");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "home");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (id)objc_msgSend(v16, "initWithTrigger:inHome:forceDisabled:", v18, v20, 0);

    objc_msgSend(v55, "triggerDisplayTitle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationListCell titleLabel](self, "titleLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setText:", v21);

    objc_msgSend(v55, "triggerDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationListCell descriptionLabel](self, "descriptionLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setText:", v23);

    HFTriggerIconFactoryClass = getHFTriggerIconFactoryClass();
    -[WFAutomationListCell homeTrigger](self, "homeTrigger");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "trigger");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class iconDescriptorForTrigger:](HFTriggerIconFactoryClass, "iconDescriptorForTrigger:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFAutomationListCell summaryIconsView](self, "summaryIconsView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setHomeTriggerIcon:", v28);

    objc_msgSend(v55, "triggerSummaryIconDescriptors");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationListCell summaryIconsView](self, "summaryIconsView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setHomeActionIcons:", v30);

  }
  else
  {
    -[WFAutomationListCell titleLabel](self, "titleLabel");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setText:", 0);

    -[WFAutomationListCell descriptionLabel](self, "descriptionLabel");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setText:", 0);

    -[WFAutomationListCell summaryIconsView](self, "summaryIconsView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setTriggerIcon:tintColor:withTrigger:", 0, 0, 0);

    -[WFAutomationListCell summaryIconsView](self, "summaryIconsView");
    v55 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setActionIcons:", MEMORY[0x24BDBD1A8]);
  }

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFAutomationListCell;
  -[WFAutomationListCell prepareForReuse](&v3, sel_prepareForReuse);
  -[WFAutomationListCell setConfiguredTrigger:workflow:delegate:](self, "setConfiguredTrigger:workflow:delegate:", 0, 0, 0);
  -[WFAutomationListCell setHomeTrigger:](self, "setHomeTrigger:", 0);
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

- (WFAutomationListCellDelegate)delegate
{
  return (WFAutomationListCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_summaryIconsView, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_homeTrigger, 0);
  objc_storeStrong((id *)&self->_workflow, 0);
  objc_storeStrong((id *)&self->_configuredTrigger, 0);
}

uint64_t __32__WFAutomationListCell_updateUI__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "icon");
}

@end
