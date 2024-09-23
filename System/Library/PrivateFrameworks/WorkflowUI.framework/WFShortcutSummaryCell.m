@implementation WFShortcutSummaryCell

- (WFShortcutSummaryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WFShortcutSummaryCell *v4;
  WFShortcutSummaryCell *v5;
  uint64_t v6;
  UIStackView *mainStackView;
  WFRowOfIconsView *v8;
  WFRowOfIconsView *actionIconsView;
  uint64_t v10;
  UILabel *summaryLabel;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
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
  WFShortcutSummaryCell *v27;
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
  objc_super v43;
  _QWORD v44[6];

  v44[4] = *MEMORY[0x24BDAC8D0];
  v43.receiver = self;
  v43.super_class = (Class)WFShortcutSummaryCell;
  v4 = -[WFShortcutSummaryCell initWithStyle:reuseIdentifier:](&v43, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[WFShortcutSummaryCell setAccessoryType:](v4, "setAccessoryType:", 0);
    v6 = objc_opt_new();
    mainStackView = v5->_mainStackView;
    v5->_mainStackView = (UIStackView *)v6;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v5->_mainStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setSpacing:](v5->_mainStackView, "setSpacing:", 8.0);
    -[UIStackView setAxis:](v5->_mainStackView, "setAxis:", 1);
    -[UIStackView setAlignment:](v5->_mainStackView, "setAlignment:", 0);
    -[UIStackView setDistribution:](v5->_mainStackView, "setDistribution:", 3);
    v8 = -[WFRowOfIconsView initWithMaxNumberOfIcons:height:]([WFRowOfIconsView alloc], "initWithMaxNumberOfIcons:height:", 8, 30.0);
    actionIconsView = v5->_actionIconsView;
    v5->_actionIconsView = v8;

    -[WFRowOfIconsView setTranslatesAutoresizingMaskIntoConstraints:](v5->_actionIconsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v10 = objc_opt_new();
    summaryLabel = v5->_summaryLabel;
    v5->_summaryLabel = (UILabel *)v10;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_summaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v12 = (void *)MEMORY[0x24BEBB520];
    objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BEBE1D0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fontDescriptorWithSymbolicTraits:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fontWithDescriptor:size:", v14, 0.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_summaryLabel, "setFont:", v15);

    -[UILabel setAdjustsFontSizeToFitWidth:](v5->_summaryLabel, "setAdjustsFontSizeToFitWidth:", 0);
    -[UILabel setNumberOfLines:](v5->_summaryLabel, "setNumberOfLines:", 4);
    LODWORD(v16) = 1144750080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v5->_summaryLabel, "setContentCompressionResistancePriority:forAxis:", 1, v16);
    -[UIStackView addArrangedSubview:](v5->_mainStackView, "addArrangedSubview:", v5->_summaryLabel);
    -[WFShortcutSummaryCell contentView](v5, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v5->_mainStackView);

    v33 = (void *)MEMORY[0x24BDD1628];
    -[WFShortcutSummaryCell contentView](v5, "contentView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "layoutMarginsGuide");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "topAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView topAnchor](v5->_mainStackView, "topAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v38;
    -[WFShortcutSummaryCell contentView](v5, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "layoutMarginsGuide");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView leadingAnchor](v5->_mainStackView, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v34);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v44[1] = v32;
    -[WFShortcutSummaryCell contentView](v5, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "layoutMarginsGuide");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView trailingAnchor](v5->_mainStackView, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v44[2] = v19;
    -[WFShortcutSummaryCell contentView](v5, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "layoutMarginsGuide");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView bottomAnchor](v5->_mainStackView, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v44[3] = v24;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "activateConstraints:", v25);

    -[WFShortcutSummaryCell contentView](v5, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setLayoutMargins:", 14.0, 15.0, 14.0, 15.0);

    v27 = v5;
  }

  return v5;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFShortcutSummaryCell;
  -[WFShortcutSummaryCell prepareForReuse](&v5, sel_prepareForReuse);
  -[WFShortcutSummaryCell summaryLabel](self, "summaryLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);

  -[WFShortcutSummaryCell actionIconsView](self, "actionIconsView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIcons:", MEMORY[0x24BDBD1A8]);

}

- (void)configureWithTitle:(id)a3 actionIcons:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count"))
  {
    -[WFShortcutSummaryCell addActionViewIfNeeded](self, "addActionViewIfNeeded");
    -[WFShortcutSummaryCell actionIconsView](self, "actionIconsView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIcons:", v7);

  }
  else
  {
    -[WFShortcutSummaryCell removeActionViewIfNeeded](self, "removeActionViewIfNeeded");
  }
  -[WFShortcutSummaryCell summaryLabel](self, "summaryLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v10);

}

- (void)removeActionViewIfNeeded
{
  void *v3;
  int v4;

  -[UIStackView subviews](self->_mainStackView, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", self->_actionIconsView);

  if (v4)
  {
    -[UIStackView removeArrangedSubview:](self->_mainStackView, "removeArrangedSubview:", self->_actionIconsView);
    -[WFRowOfIconsView removeFromSuperview](self->_actionIconsView, "removeFromSuperview");
  }
}

- (void)addActionViewIfNeeded
{
  void *v3;
  char v4;

  -[UIStackView subviews](self->_mainStackView, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", self->_actionIconsView);

  if ((v4 & 1) == 0)
    -[UIStackView insertArrangedSubview:atIndex:](self->_mainStackView, "insertArrangedSubview:atIndex:", self->_actionIconsView, 0);
}

- (WFRowOfIconsView)actionIconsView
{
  return self->_actionIconsView;
}

- (void)setActionIconsView:(id)a3
{
  objc_storeStrong((id *)&self->_actionIconsView, a3);
}

- (UILabel)summaryLabel
{
  return self->_summaryLabel;
}

- (void)setSummaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_summaryLabel, a3);
}

- (UIStackView)mainStackView
{
  return self->_mainStackView;
}

- (void)setMainStackView:(id)a3
{
  objc_storeStrong((id *)&self->_mainStackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainStackView, 0);
  objc_storeStrong((id *)&self->_summaryLabel, 0);
  objc_storeStrong((id *)&self->_actionIconsView, 0);
}

@end
