@implementation PSUsageSizeHeader

- (PSUsageSizeHeader)initWithSpecifier:(id)a3
{
  id v4;
  PSUsageSizeHeader *v5;
  PSUsageSizeHeader *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PSUsageSizeHeader;
  v5 = -[PSUsageSizeHeader init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PSUsageSizeHeader _setupSubviewsAndConstraints](v5, "_setupSubviewsAndConstraints");
    v7 = (void *)MEMORY[0x1E0CB34E8];
    objc_msgSend(v4, "propertyForKey:", CFSTR("SIZE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringFromByteCount:countStyle:", objc_msgSend(v8, "longLongValue"), 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUsageSizeHeader sizeLabel](v6, "sizeLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v9);

    objc_msgSend(v4, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uppercaseStringWithLocale:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUsageSizeHeader titleLabel](v6, "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v13);

  }
  return v6;
}

- (void)_setupSubviewsAndConstraints
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
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
  id v66;

  -[PSUsageSizeHeader _internalStackView](self, "_internalStackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  v4 = objc_alloc(MEMORY[0x1E0CEA9E0]);
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v9 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
  -[PSUsageSizeHeader set_internalStackView:](self, "set_internalStackView:", v9);

  -[PSUsageSizeHeader _internalStackView](self, "_internalStackView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[PSUsageSizeHeader _internalStackView](self, "_internalStackView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAxis:", 0);

  -[PSUsageSizeHeader _internalStackView](self, "_internalStackView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDistribution:", 3);

  -[PSUsageSizeHeader _internalStackView](self, "_internalStackView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAlignment:", 2);

  -[PSUsageSizeHeader contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUsageSizeHeader _internalStackView](self, "_internalStackView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v15);

  +[PSListController appearance](PSListController, "appearance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "altTextColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    +[PSListController appearance](PSListController, "appearance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "altTextColor");
    v66 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PreferencesTableViewFooterColor();
    v66 = (id)objc_claimAutoreleasedReturnValue();
  }

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v5, v6, v7, v8);
  -[PSUsageSizeHeader setTitleLabel:](self, "setTitleLabel:", v19);

  -[PSUsageSizeHeader titleLabel](self, "titleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[PSUsageSizeHeader titleLabel](self, "titleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAdjustsFontForContentSizeCategory:", 1);

  PreferencesTableViewHeaderFont();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUsageSizeHeader titleLabel](self, "titleLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFont:", v22);

  -[PSUsageSizeHeader titleLabel](self, "titleLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTextColor:", v66);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUsageSizeHeader titleLabel](self, "titleLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setBackgroundColor:", v25);

  -[PSUsageSizeHeader _internalStackView](self, "_internalStackView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUsageSizeHeader titleLabel](self, "titleLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addArrangedSubview:", v28);

  -[PSUsageSizeHeader sizeLabel](self, "sizeLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "removeFromSuperview");

  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v5, v6, v7, v8);
  -[PSUsageSizeHeader setSizeLabel:](self, "setSizeLabel:", v30);

  -[PSUsageSizeHeader sizeLabel](self, "sizeLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[PSUsageSizeHeader sizeLabel](self, "sizeLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setAdjustsFontForContentSizeCategory:", 1);

  PreferencesTableViewHeaderFont();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUsageSizeHeader sizeLabel](self, "sizeLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setFont:", v33);

  -[PSUsageSizeHeader sizeLabel](self, "sizeLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setTextColor:", v66);

  -[PSUsageSizeHeader sizeLabel](self, "sizeLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setTextAlignment:", 2);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUsageSizeHeader sizeLabel](self, "sizeLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setBackgroundColor:", v37);

  -[PSUsageSizeHeader _internalStackView](self, "_internalStackView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUsageSizeHeader sizeLabel](self, "sizeLabel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addArrangedSubview:", v40);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUsageSizeHeader _internalStackView](self, "_internalStackView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUsageSizeHeader contentView](self, "contentView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "layoutMarginsGuide");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "leadingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "addObject:", v47);

  -[PSUsageSizeHeader _internalStackView](self, "_internalStackView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "trailingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUsageSizeHeader contentView](self, "contentView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "layoutMarginsGuide");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "trailingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "addObject:", v53);

  -[PSUsageSizeHeader _internalStackView](self, "_internalStackView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "topAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUsageSizeHeader contentView](self, "contentView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "layoutMarginsGuide");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "topAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "addObject:", v59);

  -[PSUsageSizeHeader _internalStackView](self, "_internalStackView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "bottomAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUsageSizeHeader contentView](self, "contentView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "layoutMarginsGuide");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "bottomAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "addObject:", v65);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v41);
}

- (void)setSize:(id)a3
{
  -[UILabel setText:](self->_sizeLabel, "setText:", a3);
  -[UILabel sizeToFit](self->_sizeLabel, "sizeToFit");
  -[PSUsageSizeHeader setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSizeLabelHidden:(BOOL)a3
{
  -[UILabel setHidden:](self->_sizeLabel, "setHidden:", a3);
}

- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4
{
  return *MEMORY[0x1E0CEBC10];
}

- (UILabel)sizeLabel
{
  return self->_sizeLabel;
}

- (void)setSizeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_sizeLabel, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIStackView)_internalStackView
{
  return self->__internalStackView;
}

- (void)set_internalStackView:(id)a3
{
  objc_storeStrong((id *)&self->__internalStackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__internalStackView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_sizeLabel, 0);
}

@end
