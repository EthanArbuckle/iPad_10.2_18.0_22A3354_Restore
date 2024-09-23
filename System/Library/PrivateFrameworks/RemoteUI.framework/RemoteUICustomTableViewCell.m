@implementation RemoteUICustomTableViewCell

- (double)_defaultImageViewMaxWidth
{
  return 0.0;
}

- (double)_imageViewToTextMargin
{
  return 0.0;
}

- (UILabel)customTextLabel
{
  void *v3;

  -[RemoteUICustomTableViewCell _initializeViews](self, "_initializeViews");
  -[RemoteUICustomTableViewCell _textLabelInternal](self, "_textLabelInternal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  return (UILabel *)-[RemoteUICustomTableViewCell _textLabelInternal](self, "_textLabelInternal");
}

- (id)_textLabelInternal
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
    -[UILabel setFont:](self->_customValueLabelInternal, "setFont:", v6);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_customTextLabelInternal, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](self->_customTextLabelInternal, "setNumberOfLines:", 0);
    customTextLabelInternal = self->_customTextLabelInternal;
  }
  return customTextLabelInternal;
}

- (UILabel)customDetailTextLabel
{
  void *v3;

  -[RemoteUICustomTableViewCell _initializeViews](self, "_initializeViews");
  -[RemoteUICustomTableViewCell _detailTextLabelInternal](self, "_detailTextLabelInternal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  return (UILabel *)-[RemoteUICustomTableViewCell _detailTextLabelInternal](self, "_detailTextLabelInternal");
}

- (id)_detailTextLabelInternal
{
  UILabel *customDetailTextLabelInternal;
  UILabel *v4;
  UILabel *v5;
  void *v6;

  customDetailTextLabelInternal = self->_customDetailTextLabelInternal;
  if (!customDetailTextLabelInternal)
  {
    v4 = (UILabel *)objc_opt_new();
    v5 = self->_customDetailTextLabelInternal;
    self->_customDetailTextLabelInternal = v4;

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_customDetailTextLabelInternal, "setFont:", v6);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_customDetailTextLabelInternal, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](self->_customDetailTextLabelInternal, "setNumberOfLines:", 0);
    customDetailTextLabelInternal = self->_customDetailTextLabelInternal;
  }
  return customDetailTextLabelInternal;
}

- (UILabel)customValueLabel
{
  void *v3;

  -[RemoteUICustomTableViewCell _initializeViews](self, "_initializeViews");
  -[RemoteUICustomTableViewCell _valueLabelInternal](self, "_valueLabelInternal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  return (UILabel *)-[RemoteUICustomTableViewCell _valueLabelInternal](self, "_valueLabelInternal");
}

- (id)_valueLabelInternal
{
  UILabel *customValueLabelInternal;
  UILabel *v4;
  UILabel *v5;
  void *v6;

  customValueLabelInternal = self->_customValueLabelInternal;
  if (!customValueLabelInternal)
  {
    v4 = (UILabel *)objc_opt_new();
    v5 = self->_customValueLabelInternal;
    self->_customValueLabelInternal = v4;

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_customValueLabelInternal, "setFont:", v6);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_customValueLabelInternal, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](self->_customValueLabelInternal, "setNumberOfLines:", 0);
    customValueLabelInternal = self->_customValueLabelInternal;
  }
  return customValueLabelInternal;
}

- (UITextField)customEditableTextField
{
  void *v3;

  -[RemoteUICustomTableViewCell _initializeViews](self, "_initializeViews");
  -[RemoteUICustomTableViewCell _editableTextFieldInternal](self, "_editableTextFieldInternal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  return (UITextField *)-[RemoteUICustomTableViewCell _editableTextFieldInternal](self, "_editableTextFieldInternal");
}

- (id)_editableTextFieldInternal
{
  UITextField *customEditableTextFieldInternal;
  UITextField *v4;
  UITextField *v5;

  customEditableTextFieldInternal = self->_customEditableTextFieldInternal;
  if (!customEditableTextFieldInternal)
  {
    v4 = (UITextField *)objc_alloc_init(MEMORY[0x24BEBDA48]);
    v5 = self->_customEditableTextFieldInternal;
    self->_customEditableTextFieldInternal = v4;

    -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](self->_customEditableTextFieldInternal, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    customEditableTextFieldInternal = self->_customEditableTextFieldInternal;
  }
  return customEditableTextFieldInternal;
}

- (UIImageView)customImageView
{
  -[RemoteUICustomTableViewCell _initializeViews](self, "_initializeViews");
  return (UIImageView *)-[RemoteUICustomTableViewCell _imageViewInternal](self, "_imageViewInternal");
}

- (id)_imageViewInternal
{
  RUIImageView *customImageViewInternal;
  RUIImageView *v4;
  RUIImageView *v5;

  customImageViewInternal = self->_customImageViewInternal;
  if (!customImageViewInternal)
  {
    v4 = (RUIImageView *)objc_opt_new();
    v5 = self->_customImageViewInternal;
    self->_customImageViewInternal = v4;

    -[RUIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_customImageViewInternal, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[RUIImageView setContentMode:](self->_customImageViewInternal, "setContentMode:", 1);
    customImageViewInternal = self->_customImageViewInternal;
  }
  return customImageViewInternal;
}

- (void)_initializeViews
{
  UIStackView *v3;
  UIStackView *stackView;
  void *v5;
  UIStackView *v6;
  UIStackView *verticalStackView;
  void *v8;
  UIStackView *v9;
  void *v10;
  UIStackView *v11;
  void *v12;
  UIStackView *v13;
  void *v14;
  UIStackView *v15;
  void *v16;
  UIStackView *v17;
  void *v18;
  UIStackView *v19;
  double v20;
  double v21;
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
  double v39;
  void *v40;
  double v41;
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
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
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
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  _QWORD v99[19];

  v99[17] = *MEMORY[0x24BDAC8D0];
  if (!self->_stackView)
  {
    v3 = (UIStackView *)objc_alloc_init(MEMORY[0x24BEBD978]);
    stackView = self->_stackView;
    self->_stackView = v3;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAlignment:](self->_stackView, "setAlignment:", 3);
    -[UIStackView setAxis:](self->_stackView, "setAxis:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView setBackgroundColor:](self->_stackView, "setBackgroundColor:", v5);

    v6 = (UIStackView *)objc_alloc_init(MEMORY[0x24BEBD978]);
    verticalStackView = self->_verticalStackView;
    self->_verticalStackView = v6;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_verticalStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAlignment:](self->_verticalStackView, "setAlignment:", 3);
    -[UIStackView setAxis:](self->_verticalStackView, "setAxis:", 1);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView setBackgroundColor:](self->_verticalStackView, "setBackgroundColor:", v8);

    v9 = self->_verticalStackView;
    -[RemoteUICustomTableViewCell _textLabelInternal](self, "_textLabelInternal");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView addArrangedSubview:](v9, "addArrangedSubview:", v10);

    v11 = self->_verticalStackView;
    -[RemoteUICustomTableViewCell _detailTextLabelInternal](self, "_detailTextLabelInternal");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView addArrangedSubview:](v11, "addArrangedSubview:", v12);

    v13 = self->_verticalStackView;
    -[RemoteUICustomTableViewCell _valueLabelInternal](self, "_valueLabelInternal");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView addArrangedSubview:](v13, "addArrangedSubview:", v14);

    v15 = self->_verticalStackView;
    -[RemoteUICustomTableViewCell _editableTextFieldInternal](self, "_editableTextFieldInternal");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView addArrangedSubview:](v15, "addArrangedSubview:", v16);

    v17 = self->_stackView;
    -[RemoteUICustomTableViewCell _imageViewInternal](self, "_imageViewInternal");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView addArrangedSubview:](v17, "addArrangedSubview:", v18);

    v19 = self->_stackView;
    -[RemoteUICustomTableViewCell _imageViewToTextMargin](self, "_imageViewToTextMargin");
    v21 = v20;
    -[RemoteUICustomTableViewCell _imageViewInternal](self, "_imageViewInternal");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView setCustomSpacing:afterView:](v19, "setCustomSpacing:afterView:", v22, v21);

    -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_verticalStackView);
    -[RemoteUICustomTableViewCell _textLabelInternal](self, "_textLabelInternal");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setHidden:", 1);

    -[RemoteUICustomTableViewCell _detailTextLabelInternal](self, "_detailTextLabelInternal");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setHidden:", 1);

    -[RemoteUICustomTableViewCell _valueLabelInternal](self, "_valueLabelInternal");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setHidden:", 1);

    -[RemoteUICustomTableViewCell _editableTextFieldInternal](self, "_editableTextFieldInternal");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setHidden:", 1);

    -[RemoteUICustomTableViewCell _imageViewInternal](self, "_imageViewInternal");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setHidden:", 1);

    -[RemoteUICustomTableViewCell contentView](self, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addSubview:", self->_stackView);

    v72 = (void *)MEMORY[0x24BDD1628];
    -[UIStackView topAnchor](self->_stackView, "topAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    -[RemoteUICustomTableViewCell contentView](self, "contentView");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "topAnchor");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "constraintEqualToAnchor:", v96);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v99[0] = v95;
    -[UIStackView leadingAnchor](self->_stackView, "leadingAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[RemoteUICustomTableViewCell contentView](self, "contentView");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "leadingAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "constraintEqualToAnchor:", v92);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v99[1] = v91;
    -[UIStackView trailingAnchor](self->_stackView, "trailingAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[RemoteUICustomTableViewCell contentView](self, "contentView");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "trailingAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "constraintEqualToAnchor:", v88);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v99[2] = v87;
    -[UIStackView bottomAnchor](self->_stackView, "bottomAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[RemoteUICustomTableViewCell contentView](self, "contentView");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "bottomAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "constraintEqualToAnchor:", v84);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v99[3] = v83;
    -[RemoteUICustomTableViewCell _imageViewInternal](self, "_imageViewInternal");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "centerYAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView centerYAnchor](self->_stackView, "centerYAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToAnchor:", v80);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v99[4] = v79;
    -[RemoteUICustomTableViewCell _imageViewInternal](self, "_imageViewInternal");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "widthAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[RemoteUICustomTableViewCell _defaultImageViewMaxWidth](self, "_defaultImageViewMaxWidth");
    objc_msgSend(v77, "constraintLessThanOrEqualToConstant:");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v99[5] = v76;
    -[RemoteUICustomTableViewCell _imageViewInternal](self, "_imageViewInternal");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "heightAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintLessThanOrEqualToConstant:", 25.0);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v99[6] = v73;
    -[UIStackView topAnchor](self->_verticalStackView, "topAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView topAnchor](self->_stackView, "topAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:", v70);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v99[7] = v69;
    -[UIStackView bottomAnchor](self->_verticalStackView, "bottomAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView bottomAnchor](self->_stackView, "bottomAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:", v67);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v99[8] = v66;
    -[RemoteUICustomTableViewCell _textLabelInternal](self, "_textLabelInternal");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "leadingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView leadingAnchor](self->_verticalStackView, "leadingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToAnchor:constant:", v63, 9.0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v99[9] = v62;
    -[RemoteUICustomTableViewCell _textLabelInternal](self, "_textLabelInternal");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "trailingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView trailingAnchor](self->_verticalStackView, "trailingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:constant:", v59, 0.0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v99[10] = v58;
    -[RemoteUICustomTableViewCell _detailTextLabelInternal](self, "_detailTextLabelInternal");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "leadingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView leadingAnchor](self->_verticalStackView, "leadingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:constant:", v55, 9.0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v99[11] = v54;
    -[RemoteUICustomTableViewCell _detailTextLabelInternal](self, "_detailTextLabelInternal");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "trailingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView trailingAnchor](self->_verticalStackView, "trailingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:constant:", v51, 0.0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v99[12] = v50;
    -[RemoteUICustomTableViewCell _valueLabelInternal](self, "_valueLabelInternal");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "leadingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView leadingAnchor](self->_verticalStackView, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:constant:", v47, 9.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v99[13] = v46;
    -[RemoteUICustomTableViewCell _valueLabelInternal](self, "_valueLabelInternal");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView trailingAnchor](self->_verticalStackView, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:constant:", v43, 0.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v99[14] = v42;
    -[RemoteUICustomTableViewCell _editableTextFieldInternal](self, "_editableTextFieldInternal");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView leadingAnchor](self->_verticalStackView, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v99[15] = v32;
    -[RemoteUICustomTableViewCell _editableTextFieldInternal](self, "_editableTextFieldInternal");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView trailingAnchor](self->_verticalStackView, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v99[16] = v36;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v99, 17);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "activateConstraints:", v37);

    -[RemoteUICustomTableViewCell _imageViewInternal](self, "_imageViewInternal");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v39) = 1148846080;
    objc_msgSend(v38, "setContentCompressionResistancePriority:forAxis:", 0, v39);

    -[RemoteUICustomTableViewCell _imageViewInternal](self, "_imageViewInternal");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v41) = 1148846080;
    objc_msgSend(v40, "setContentCompressionResistancePriority:forAxis:", 1, v41);

  }
}

- (void)addDetailLinkButton:(id)a3
{
  UIStackView *verticalStackView;
  id v5;
  void *v6;
  void *v7;
  id v8;

  verticalStackView = self->_verticalStackView;
  v5 = a3;
  -[UIStackView addArrangedSubview:](verticalStackView, "addArrangedSubview:", v5);
  objc_msgSend(v5, "widthAnchor");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[UIStackView widthAnchor](self->_verticalStackView, "widthAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);

}

- (UILabel)customTextLabelInternal
{
  return self->_customTextLabelInternal;
}

- (void)setCustomTextLabelInternal:(id)a3
{
  objc_storeStrong((id *)&self->_customTextLabelInternal, a3);
}

- (UILabel)customDetailTextLabelInternal
{
  return self->_customDetailTextLabelInternal;
}

- (void)setCustomDetailTextLabelInternal:(id)a3
{
  objc_storeStrong((id *)&self->_customDetailTextLabelInternal, a3);
}

- (UILabel)customValueLabelInternal
{
  return self->_customValueLabelInternal;
}

- (void)setCustomValueLabelInternal:(id)a3
{
  objc_storeStrong((id *)&self->_customValueLabelInternal, a3);
}

- (UITextField)customEditableTextFieldInternal
{
  return self->_customEditableTextFieldInternal;
}

- (void)setCustomEditableTextFieldInternal:(id)a3
{
  objc_storeStrong((id *)&self->_customEditableTextFieldInternal, a3);
}

- (RUIImageView)customImageViewInternal
{
  return self->_customImageViewInternal;
}

- (void)setCustomImageViewInternal:(id)a3
{
  objc_storeStrong((id *)&self->_customImageViewInternal, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (UIStackView)verticalStackView
{
  return self->_verticalStackView;
}

- (void)setVerticalStackView:(id)a3
{
  objc_storeStrong((id *)&self->_verticalStackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verticalStackView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_customImageViewInternal, 0);
  objc_storeStrong((id *)&self->_customEditableTextFieldInternal, 0);
  objc_storeStrong((id *)&self->_customValueLabelInternal, 0);
  objc_storeStrong((id *)&self->_customDetailTextLabelInternal, 0);
  objc_storeStrong((id *)&self->_customTextLabelInternal, 0);
}

@end
