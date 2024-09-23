@implementation STSingleLineHeaderView

- (STSingleLineHeaderView)initWithSpecifier:(id)a3
{
  return -[STSingleLineHeaderView initWithSpecifier:useContentLayoutGuide:](self, "initWithSpecifier:useContentLayoutGuide:", a3, 1);
}

- (STSingleLineHeaderView)initWithSpecifier:(id)a3 useContentLayoutGuide:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  STSingleLineHeaderView *v7;
  uint64_t v8;
  UILabel *titleLabel;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  STSingleLineHeaderView *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id obj;
  objc_super v40;
  _QWORD v41[6];

  v4 = a4;
  v41[5] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v40.receiver = self;
  v40.super_class = (Class)STSingleLineHeaderView;
  v7 = -[STTableViewHeaderFooterView initWithReuseIdentifier:useLayoutMarginsGuide:](&v40, sel_initWithReuseIdentifier_useLayoutMarginsGuide_, 0, !v4);
  if (v7)
  {
    obj = v6;
    v8 = objc_opt_new();
    titleLabel = v7->_titleLabel;
    v7->_titleLabel = (UILabel *)v8;

    objc_msgSend(MEMORY[0x24BEBDA18], "_defaultFontForTableViewStyle:isSectionHeader:", 1, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7->_titleLabel, "setFont:", v10);

    objc_msgSend(MEMORY[0x24BEBDA18], "_defaultTextColorForTableViewStyle:isSectionHeader:", 1, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v7->_titleLabel, "setTextColor:", v11);

    -[UILabel setNumberOfLines:](v7->_titleLabel, "setNumberOfLines:", 2);
    -[UILabel setLineBreakMode:](v7->_titleLabel, "setLineBreakMode:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v7->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v12) = 1144750080;
    -[UILabel setContentHuggingPriority:forAxis:](v7->_titleLabel, "setContentHuggingPriority:forAxis:", 0, v12);
    -[STSingleLineHeaderView contentView](v7, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v7->_titleLabel);
    -[UILabel lastBaselineAnchor](v7->_titleLabel, "lastBaselineAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSingleLineHeaderView textLabel](v7, "textLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lastBaselineAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v18) = 1132068864;
    objc_msgSend(v17, "setPriority:", v18);
    v38 = v13;
    if (v4)
    {
      v19 = v13;
      -[STTableViewHeaderFooterView contentLayoutGuide](v7, "contentLayoutGuide");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "leadingAnchor");
      v21 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v19 = v7;
      -[STSingleLineHeaderView leadingAnchor](v19, "leadingAnchor");
      v21 = objc_claimAutoreleasedReturnValue();
    }
    v34 = (void *)v21;
    v31 = (void *)MEMORY[0x24BDD1628];
    v41[0] = v17;
    -[UILabel topAnchor](v7->_titleLabel, "topAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSingleLineHeaderView topAnchor](v19, "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintGreaterThanOrEqualToAnchor:", v36);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = v35;
    -[UILabel leadingAnchor](v7->_titleLabel, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v41[2] = v22;
    -[UILabel bottomAnchor](v7->_titleLabel, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSingleLineHeaderView bottomAnchor](v19, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintLessThanOrEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v41[3] = v25;
    -[UILabel trailingAnchor](v7->_titleLabel, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSingleLineHeaderView centerXAnchor](v19, "centerXAnchor");
    v33 = v17;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintLessThanOrEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v41[4] = v28;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 5);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "activateConstraints:", v29);

    v6 = obj;
    objc_storeWeak((id *)&v7->_specifier, obj);
    -[STSingleLineHeaderView reloadFromSpecifier](v7, "reloadFromSpecifier");

  }
  return v7;
}

- (void)setSpecifier:(id)a3
{
  objc_storeWeak((id *)&self->_specifier, a3);
  -[STSingleLineHeaderView reloadFromSpecifier](self, "reloadFromSpecifier");
}

- (void)reloadFromSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[STSingleLineHeaderView specifier](self, "specifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedUppercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSingleLineHeaderView titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (double)preferredHeightForWidth:(double)a3
{
  double v3;

  -[STSingleLineHeaderView sizeThatFits:](self, "sizeThatFits:", a3, 1.79769313e308);
  return v3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (PSSpecifier)specifier
{
  return (PSSpecifier *)objc_loadWeakRetained((id *)&self->_specifier);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_specifier);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
