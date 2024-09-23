@implementation RUICustomImageTableViewCell

- (UIImageView)customImageView
{
  void *v3;

  -[RUICustomImageTableViewCell _initializeViews](self, "_initializeViews");
  -[RUICustomImageTableViewCell _customImageViewInternal](self, "_customImageViewInternal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  return (UIImageView *)-[RUICustomImageTableViewCell _customImageViewInternal](self, "_customImageViewInternal");
}

- (id)_customImageViewInternal
{
  UIImageView *customImageViewInternal;
  UIImageView *v4;
  UIImageView *v5;

  customImageViewInternal = self->_customImageViewInternal;
  if (!customImageViewInternal)
  {
    v4 = (UIImageView *)objc_opt_new();
    v5 = self->_customImageViewInternal;
    self->_customImageViewInternal = v4;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_customImageViewInternal, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](self->_customImageViewInternal, "setContentMode:", 1);
    customImageViewInternal = self->_customImageViewInternal;
  }
  return customImageViewInternal;
}

- (UILabel)customTextLabel
{
  void *v3;

  -[RUICustomImageTableViewCell _initializeViews](self, "_initializeViews");
  -[RUICustomImageTableViewCell _customTextLabelInternal](self, "_customTextLabelInternal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  return (UILabel *)-[RUICustomImageTableViewCell _customTextLabelInternal](self, "_customTextLabelInternal");
}

- (id)_customTextLabelInternal
{
  UILabel *customTextLabelInternal;
  UILabel *v4;
  UILabel *v5;
  void *v6;

  customTextLabelInternal = self->_customTextLabelInternal;
  if (!customTextLabelInternal)
  {
    v4 = (UILabel *)objc_opt_new();
    v5 = self->_customTextLabelInternal;
    self->_customTextLabelInternal = v4;

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_customTextLabelInternal, "setFont:", v6);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_customTextLabelInternal, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](self->_customTextLabelInternal, "setNumberOfLines:", 0);
    customTextLabelInternal = self->_customTextLabelInternal;
  }
  return customTextLabelInternal;
}

- (void)_initializeViews
{
  UIStackView *v3;
  UIStackView *stackView;
  void *v5;
  UIStackView *v6;
  void *v7;
  UIStackView *v8;
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
  UIStackView *v21;
  void *v22;
  void *v23;
  double v24;
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
  _QWORD v51[10];

  v51[8] = *MEMORY[0x24BDAC8D0];
  if (!self->_stackView)
  {
    v3 = (UIStackView *)objc_alloc_init(MEMORY[0x24BEBD978]);
    stackView = self->_stackView;
    self->_stackView = v3;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](self->_stackView, "setAxis:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView setBackgroundColor:](self->_stackView, "setBackgroundColor:", v5);

    -[UIStackView setDistribution:](self->_stackView, "setDistribution:", 2);
    v6 = self->_stackView;
    -[RUICustomImageTableViewCell _customImageViewInternal](self, "_customImageViewInternal");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView addArrangedSubview:](v6, "addArrangedSubview:", v7);

    v8 = self->_stackView;
    -[RUICustomImageTableViewCell _customTextLabelInternal](self, "_customTextLabelInternal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView addArrangedSubview:](v8, "addArrangedSubview:", v9);

    -[RUICustomImageTableViewCell _customImageViewInternal](self, "_customImageViewInternal");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidden:", 1);

    -[RUICustomImageTableViewCell _customTextLabelInternal](self, "_customTextLabelInternal");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidden:", 1);

    -[RUICustomImageTableViewCell contentView](self, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", self->_stackView);

    v38 = (void *)MEMORY[0x24BDD1628];
    -[UIStackView topAnchor](self->_stackView, "topAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUICustomImageTableViewCell contentView](self, "contentView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "topAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v48);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v47;
    -[UIStackView leadingAnchor](self->_stackView, "leadingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUICustomImageTableViewCell contentView](self, "contentView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "leadingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:", v44);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = v43;
    -[UIStackView trailingAnchor](self->_stackView, "trailingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUICustomImageTableViewCell contentView](self, "contentView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v40);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v51[2] = v39;
    -[UIStackView bottomAnchor](self->_stackView, "bottomAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUICustomImageTableViewCell contentView](self, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "bottomAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v35);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v51[3] = v34;
    -[RUICustomImageTableViewCell _customImageViewInternal](self, "_customImageViewInternal");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView leadingAnchor](self->_stackView, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:constant:", v31, 20.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v51[4] = v30;
    -[RUICustomImageTableViewCell _customImageViewInternal](self, "_customImageViewInternal");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView leadingAnchor](self->_stackView, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v27, 38.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v51[5] = v26;
    -[RUICustomImageTableViewCell _customTextLabelInternal](self, "_customTextLabelInternal");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView leadingAnchor](self->_stackView, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, 48.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v51[6] = v15;
    -[RUICustomImageTableViewCell _customTextLabelInternal](self, "_customTextLabelInternal");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView trailingAnchor](self->_stackView, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, 16.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v51[7] = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "activateConstraints:", v20);

    v21 = self->_stackView;
    -[RUICustomImageTableViewCell _customTextLabelInternal](self, "_customTextLabelInternal");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView setCustomSpacing:afterView:](v21, "setCustomSpacing:afterView:", v22, 16.0);

    -[RUICustomImageTableViewCell _customTextLabelInternal](self, "_customTextLabelInternal");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v24) = 1148846080;
    objc_msgSend(v23, "setContentHuggingPriority:forAxis:", 0, v24);

  }
}

- (UIImageView)customImageViewInternal
{
  return self->_customImageViewInternal;
}

- (void)setCustomImageViewInternal:(id)a3
{
  objc_storeStrong((id *)&self->_customImageViewInternal, a3);
}

- (UILabel)customTextLabelInternal
{
  return self->_customTextLabelInternal;
}

- (void)setCustomTextLabelInternal:(id)a3
{
  objc_storeStrong((id *)&self->_customTextLabelInternal, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_customTextLabelInternal, 0);
  objc_storeStrong((id *)&self->_customImageViewInternal, 0);
}

@end
