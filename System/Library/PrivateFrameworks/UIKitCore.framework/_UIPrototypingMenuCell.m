@implementation _UIPrototypingMenuCell

- (_UIPrototypingMenuCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  _UIPrototypingMenuCell *v4;
  UIStackView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  UIStackView *stackView;
  uint64_t v12;
  UIStackView *v13;
  void *v14;
  UILabel *v15;
  UILabel *titleLabel;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;
  _QWORD v37[5];

  v37[4] = *MEMORY[0x1E0C80C00];
  v36.receiver = self;
  v36.super_class = (Class)_UIPrototypingMenuCell;
  v4 = -[UITableViewCell initWithStyle:reuseIdentifier:](&v36, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = [UIStackView alloc];
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v10 = -[UIStackView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], v7, v8, v9);
    stackView = v4->_stackView;
    v4->_stackView = (UIStackView *)v10;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v4->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v4->_stackView, "setAxis:", objc_msgSend((id)objc_opt_class(), "_layoutAxis"));
    v12 = -[UIStackView axis](v4->_stackView, "axis");
    v13 = v4->_stackView;
    if (v12 == 1)
    {
      -[UIStackView setAlignment:](v13, "setAlignment:", 0);
    }
    else
    {
      -[UIStackView setDistribution:](v13, "setDistribution:", 0);
      -[UIStackView setSpacing:](v4->_stackView, "setSpacing:", 1.17549435e-38);
      -[UIStackView setLayoutMarginsRelativeArrangement:](v4->_stackView, "setLayoutMarginsRelativeArrangement:", 1);
    }
    -[UITableViewCell contentView](v4, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v4->_stackView);

    v15 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", v6, v7, v8, v9);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v15;

    -[UILabel setText:](v4->_titleLabel, "setText:", CFSTR("Setting"));
    objc_msgSend(off_1E167A828, "boldSystemFontOfSize:", 17.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_titleLabel, "setFont:", v17);

    -[UIStackView addArrangedSubview:](v4->_stackView, "addArrangedSubview:", v4->_titleLabel);
    -[UITableViewCell contentView](v4, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layoutMarginsGuide");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = (void *)MEMORY[0x1E0C99DE8];
    -[UIView topAnchor](v4->_stackView, "topAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v34);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v33;
    -[UIView leadingAnchor](v4->_stackView, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v31);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v29;
    -[UIView trailingAnchor](v4->_stackView, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v22;
    -[UIView bottomAnchor](v4->_stackView, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v37[3] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "arrayWithArray:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v27);
  }
  return v4;
}

+ (int64_t)_layoutAxis
{
  return 1;
}

- (void)setPrototypingSetting:(id)a3
{
  _UIPrototypingValue *v5;
  _UIPrototypingValue *v6;

  v5 = (_UIPrototypingValue *)a3;
  if (self->_prototypingSetting != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_prototypingSetting, a3);
    -[_UIPrototypingMenuCell _prototypingSettingDidChange](self, "_prototypingSettingDidChange");
    v5 = v6;
  }

}

- (void)_prototypingSettingDidChange
{
  void *v3;
  id v4;

  -[_UIPrototypingValue name](self->_prototypingSetting, "name");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIPrototypingMenuCell titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v4);

}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (_UIPrototypingValue)prototypingSetting
{
  return self->_prototypingSetting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prototypingSetting, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
