@implementation ICQUsageDetailHeader

+ (double)usageDetailHeaderHeight
{
  int v2;
  double result;

  v2 = PSIsiPad();
  result = 88.0;
  if (v2)
    return 118.0;
  return result;
}

- (ICQUsageDetailHeader)initWithFrame:(CGRect)a3
{
  ICQUsageDetailHeader *v3;
  uint64_t v4;
  UIStackView *horizontalStack;
  uint64_t v6;
  UIStackView *verticalStack;
  double v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  UILabel *nameLabel;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  UILabel *versionLabel;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  UILabel *sizeLabel;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  UIImageView *appIcon;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSLayoutConstraint *leadingMargin;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  objc_super v50;
  const __CFString *v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x24BDAC8D0];
  v50.receiver = self;
  v50.super_class = (Class)ICQUsageDetailHeader;
  v3 = -[ICQUsageDetailHeader initWithFrame:](&v50, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_new();
    horizontalStack = v3->_horizontalStack;
    v3->_horizontalStack = (UIStackView *)v4;

    -[UIStackView setAlignment:](v3->_horizontalStack, "setAlignment:", 3);
    v6 = objc_opt_new();
    verticalStack = v3->_verticalStack;
    v3->_verticalStack = (UIStackView *)v6;

    -[UIStackView setAxis:](v3->_verticalStack, "setAxis:", 1);
    LODWORD(v8) = 1148846080;
    -[UIStackView setContentHuggingPriority:forAxis:](v3->_verticalStack, "setContentHuggingPriority:forAxis:", 1, v8);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v3->_verticalStack, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v3->_horizontalStack, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v9 = objc_alloc(MEMORY[0x24BEBD708]);
    v10 = *MEMORY[0x24BDBF090];
    v11 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v12 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v13 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v14 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x24BDBF090], v11, v12, v13);
    nameLabel = v3->_nameLabel;
    v3->_nameLabel = (UILabel *)v14;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_nameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    PreferencesTableViewHeaderFont();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_nameLabel, "setFont:", v16);

    PreferencesTableViewHeaderColor();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_nameLabel, "setTextColor:", v17);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v3->_nameLabel, "setBackgroundColor:", v18);

    -[UIStackView addArrangedSubview:](v3->_verticalStack, "addArrangedSubview:", v3->_nameLabel);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v10, v11, v12, v13);
    versionLabel = v3->_versionLabel;
    v3->_versionLabel = (UILabel *)v19;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_versionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    PreferencesTableViewHeaderFont();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_versionLabel, "setFont:", v21);

    PreferencesTableViewHeaderColor();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_versionLabel, "setTextColor:", v22);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v3->_versionLabel, "setBackgroundColor:", v23);

    -[UIStackView addArrangedSubview:](v3->_verticalStack, "addArrangedSubview:", v3->_versionLabel);
    v24 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v10, v11, v12, v13);
    sizeLabel = v3->_sizeLabel;
    v3->_sizeLabel = (UILabel *)v24;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_sizeLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    PreferencesTableViewHeaderFont();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_sizeLabel, "setFont:", v26);

    PreferencesTableViewHeaderColor();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_sizeLabel, "setTextColor:", v27);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v3->_sizeLabel, "setBackgroundColor:", v28);

    -[UIStackView addArrangedSubview:](v3->_verticalStack, "addArrangedSubview:", v3->_sizeLabel);
    v29 = objc_opt_new();
    appIcon = v3->_appIcon;
    v3->_appIcon = (UIImageView *)v29;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_appIcon, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v31) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](v3->_appIcon, "setContentHuggingPriority:forAxis:", 1, v31);
    LODWORD(v32) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](v3->_appIcon, "setContentHuggingPriority:forAxis:", 0, v32);
    -[UIStackView addArrangedSubview:](v3->_horizontalStack, "addArrangedSubview:", v3->_appIcon);
    -[UIStackView addArrangedSubview:](v3->_horizontalStack, "addArrangedSubview:", v3->_verticalStack);
    -[UIStackView setSpacing:](v3->_horizontalStack, "setSpacing:", 15.0);
    -[ICQUsageDetailHeader addSubview:](v3, "addSubview:", v3->_horizontalStack);
    _NSDictionaryOfVariableBindings(CFSTR("_verticalStack, _horizontalStack"), v3->_verticalStack, v3->_horizontalStack, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView leadingAnchor](v3->_horizontalStack, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUsageDetailHeader leadingAnchor](v3, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v35);
    v36 = objc_claimAutoreleasedReturnValue();
    leadingMargin = v3->_leadingMargin;
    v3->_leadingMargin = (NSLayoutConstraint *)v36;

    -[NSLayoutConstraint setActive:](v3->_leadingMargin, "setActive:", 1);
    v38 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[_horizontalStack]-|"), 0, 0, v33);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "activateConstraints:", v39);

    v40 = (void *)MEMORY[0x24BDD1628];
    v51 = CFSTR("topPadding");
    v41 = (void *)MEMORY[0x24BDD16E0];
    v42 = PSIsiPad();
    v43 = 19.0;
    if (v42)
      v43 = 29.0;
    objc_msgSend(v41, "numberWithDouble:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v44;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(topPadding)-[_horizontalStack]-|"), 0, v45, v33);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "activateConstraints:", v46);

    -[ICQUsageDetailHeader heightAnchor](v3, "heightAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "usageDetailHeaderHeight");
    objc_msgSend(v47, "constraintEqualToConstant:");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setActive:", 1);

  }
  return v3;
}

- (void)setName:(id)a3
{
  -[UILabel setText:](self->_nameLabel, "setText:", a3);
}

- (void)setLabelTextAndIconWithSpecifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  UILabel **p_versionLabel;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a3;
  objc_msgSend(v27, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_nameLabel, "setText:", v5);

  objc_msgSend(v27, "propertyForKey:", CFSTR("SIZE_VALUE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v8 = v27;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v27, "propertyForKey:", CFSTR("SIZE_TITLE"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SIZE"), &stru_24E400750, CFSTR("Usage Statistics"));
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    v13 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1490], "stringFromByteCount:countStyle:", objc_msgSend(v6, "longLongValue"), 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ %@"), v11, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_sizeLabel, "setText:", v15);

    v8 = v27;
  }
  objc_msgSend(v8, "propertyForKey:", CFSTR("VERSION"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");
  if (v17)
  {
    v18 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("VERSION"), &stru_24E400750, CFSTR("Usage Statistics"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("%@ %@"), v20, v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    p_versionLabel = &self->_versionLabel;
    -[UILabel setText:](self->_versionLabel, "setText:", v21);

  }
  else
  {
    p_versionLabel = &self->_versionLabel;
    -[UILabel setText:](self->_versionLabel, "setText:", 0);
  }
  -[UILabel setHidden:](*p_versionLabel, "setHidden:", v17 == 0);
  v23 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(v27, "identifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "scale");
  objc_msgSend(v23, "_applicationIconImageForBundleIdentifier:format:scale:", v24, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_appIcon, "setImage:", v26);

}

- (void)layoutSubviews
{
  __assert_rtn("-[ICQUsageDetailHeader layoutSubviews]", "ICQUsageDetailHeader.m", 123, "[[self superview] isKindOfClass:[UITableView class]]");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leadingMargin, 0);
  objc_storeStrong((id *)&self->_verticalStack, 0);
  objc_storeStrong((id *)&self->_horizontalStack, 0);
  objc_storeStrong((id *)&self->_appIcon, 0);
  objc_storeStrong((id *)&self->_sizeLabel, 0);
  objc_storeStrong((id *)&self->_versionLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
}

@end
