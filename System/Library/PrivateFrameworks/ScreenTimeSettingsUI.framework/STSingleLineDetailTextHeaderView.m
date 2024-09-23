@implementation STSingleLineDetailTextHeaderView

- (STSingleLineDetailTextHeaderView)initWithSpecifier:(id)a3 useContentLayoutGuide:(BOOL)a4
{
  _BOOL4 v4;
  STSingleLineDetailTextHeaderView *v5;
  uint64_t v6;
  UILabel *detailLabel;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  STSingleLineDetailTextHeaderView *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  STSingleLineDetailTextHeaderView *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  STSingleLineDetailTextHeaderView *v35;
  void *v36;
  void *v37;
  objc_super v38;
  _QWORD v39[5];

  v4 = a4;
  v39[4] = *MEMORY[0x24BDAC8D0];
  v38.receiver = self;
  v38.super_class = (Class)STSingleLineDetailTextHeaderView;
  v5 = -[STSingleLineHeaderView initWithSpecifier:useContentLayoutGuide:](&v38, sel_initWithSpecifier_useContentLayoutGuide_, a3);
  if (v5)
  {
    v6 = objc_opt_new();
    detailLabel = v5->_detailLabel;
    v5->_detailLabel = (UILabel *)v6;

    -[STSingleLineHeaderView titleLabel](v5, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "font");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_detailLabel, "setFont:", v9);

    objc_msgSend(v8, "textColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5->_detailLabel, "setTextColor:", v10);

    -[UILabel setNumberOfLines:](v5->_detailLabel, "setNumberOfLines:", 2);
    -[UILabel setLineBreakMode:](v5->_detailLabel, "setLineBreakMode:", 0);
    -[UILabel setTextAlignment:](v5->_detailLabel, "setTextAlignment:", 2* (-[STSingleLineDetailTextHeaderView effectiveUserInterfaceLayoutDirection](v5, "effectiveUserInterfaceLayoutDirection") != 1));
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_detailLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v11) = 1144750080;
    -[UILabel setContentHuggingPriority:forAxis:](v5->_detailLabel, "setContentHuggingPriority:forAxis:", 0, v11);
    LODWORD(v12) = 1132068864;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v5->_detailLabel, "setContentCompressionResistancePriority:forAxis:", 0, v12);
    -[STSingleLineDetailTextHeaderView contentView](v5, "contentView");
    v13 = (STSingleLineDetailTextHeaderView *)objc_claimAutoreleasedReturnValue();
    -[STSingleLineDetailTextHeaderView addSubview:](v13, "addSubview:", v5->_detailLabel);
    if (v4)
    {
      -[STTableViewHeaderFooterView contentLayoutGuide](v5, "contentLayoutGuide");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "trailingAnchor");
      v15 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[STSingleLineDetailTextHeaderView trailingAnchor](v5, "trailingAnchor");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    -[UILabel trailingAnchor](v5->_detailLabel, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v18) = 1144750080;
    objc_msgSend(v17, "setPriority:", v18);
    v34 = (void *)MEMORY[0x24BDD1628];
    v36 = v17;
    v39[0] = v17;
    -[UILabel topAnchor](v5->_detailLabel, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)v15;
    v35 = v13;
    if (v4)
      v20 = v13;
    else
      v20 = v5;
    -[STSingleLineDetailTextHeaderView topAnchor](v20, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintGreaterThanOrEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v22;
    -[UILabel lastBaselineAnchor](v5->_detailLabel, "lastBaselineAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastBaselineAnchor");
    v24 = v8;
    v33 = v8;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v25);
    v32 = v19;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2] = v26;
    -[UILabel leadingAnchor](v5->_detailLabel, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v28, 1.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v39[3] = v29;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 4);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "activateConstraints:", v30);

    -[STSingleLineDetailTextHeaderView reloadFromSpecifier](v5, "reloadFromSpecifier");
  }
  return v5;
}

- (void)reloadFromSpecifier
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STSingleLineDetailTextHeaderView;
  -[STSingleLineHeaderView reloadFromSpecifier](&v8, sel_reloadFromSpecifier);
  -[STSingleLineHeaderView specifier](self, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("STDetailTextKey"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = &stru_24DB8A1D0;
  -[STSingleLineDetailTextHeaderView detailLabel](self, "detailLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailLabel, 0);
}

@end
