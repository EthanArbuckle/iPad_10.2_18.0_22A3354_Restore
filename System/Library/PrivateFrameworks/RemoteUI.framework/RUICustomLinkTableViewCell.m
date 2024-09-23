@implementation RUICustomLinkTableViewCell

- (UILabel)customLinkTextLabel
{
  void *v3;

  -[RUICustomLinkTableViewCell _initializeViews](self, "_initializeViews");
  -[RUICustomLinkTableViewCell _textLabelInternal](self, "_textLabelInternal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  return (UILabel *)-[RUICustomLinkTableViewCell _textLabelInternal](self, "_textLabelInternal");
}

- (UILabel)customLinkDetailTextLabel
{
  void *v3;

  -[RUICustomLinkTableViewCell _initializeViews](self, "_initializeViews");
  -[RUICustomLinkTableViewCell _detailTextLabelInternal](self, "_detailTextLabelInternal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  return (UILabel *)-[RUICustomLinkTableViewCell _detailTextLabelInternal](self, "_detailTextLabelInternal");
}

- (UILabel)customLinkSubLabel
{
  void *v3;

  -[RUICustomLinkTableViewCell _initializeViews](self, "_initializeViews");
  -[RUICustomLinkTableViewCell _subLabelInternal](self, "_subLabelInternal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  return (UILabel *)-[RUICustomLinkTableViewCell _subLabelInternal](self, "_subLabelInternal");
}

- (UIImageView)customLinkImageView
{
  UIButton *detailLinkButton;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;

  detailLinkButton = self->_detailLinkButton;
  if (detailLinkButton)
  {
    -[RUICustomLinkTableViewCell _imageViewInternal](self, "_imageViewInternal");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](detailLinkButton, "setImage:forState:", v5, 0);

    -[UIButton imageView](self->_detailLinkButton, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = 1132068864;
    objc_msgSend(v6, "setContentCompressionResistancePriority:forAxis:", 1, v7);

    -[UIButton imageView](self->_detailLinkButton, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = 1132068864;
    objc_msgSend(v8, "setContentCompressionResistancePriority:forAxis:", 0, v9);

    -[RUICustomLinkTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    -[RUICustomLinkTableViewCell _initializeViews](self, "_initializeViews");
    -[RUICustomLinkTableViewCell _imageViewInternal](self, "_imageViewInternal");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidden:", 0);

  }
  -[RUICustomLinkTableViewCell _imageViewInternal](self, "_imageViewInternal");
  return (UIImageView *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)_textLabelInternal
{
  UILabel *customLinkTextLabelInternal;
  UILabel *v4;
  UILabel *v5;
  void *v6;

  customLinkTextLabelInternal = self->_customLinkTextLabelInternal;
  if (!customLinkTextLabelInternal)
  {
    v4 = (UILabel *)objc_opt_new();
    v5 = self->_customLinkTextLabelInternal;
    self->_customLinkTextLabelInternal = v4;

    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 13.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_customLinkTextLabelInternal, "setFont:", v6);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_customLinkTextLabelInternal, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](self->_customLinkTextLabelInternal, "setNumberOfLines:", 0);
    customLinkTextLabelInternal = self->_customLinkTextLabelInternal;
  }
  return customLinkTextLabelInternal;
}

- (id)_detailTextLabelInternal
{
  UILabel *customLinkDetailTextLabelInternal;
  UILabel *v4;
  UILabel *v5;
  void *v6;

  customLinkDetailTextLabelInternal = self->_customLinkDetailTextLabelInternal;
  if (!customLinkDetailTextLabelInternal)
  {
    v4 = (UILabel *)objc_opt_new();
    v5 = self->_customLinkDetailTextLabelInternal;
    self->_customLinkDetailTextLabelInternal = v4;

    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 15.0, *MEMORY[0x24BEBB610]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_customLinkDetailTextLabelInternal, "setFont:", v6);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_customLinkDetailTextLabelInternal, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](self->_customLinkDetailTextLabelInternal, "setNumberOfLines:", 0);
    customLinkDetailTextLabelInternal = self->_customLinkDetailTextLabelInternal;
  }
  return customLinkDetailTextLabelInternal;
}

- (id)_subLabelInternal
{
  UILabel *customLinkSubLabelInternal;
  UILabel *v4;
  UILabel *v5;
  void *v6;

  customLinkSubLabelInternal = self->_customLinkSubLabelInternal;
  if (!customLinkSubLabelInternal)
  {
    v4 = (UILabel *)objc_opt_new();
    v5 = self->_customLinkSubLabelInternal;
    self->_customLinkSubLabelInternal = v4;

    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 13.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_customLinkSubLabelInternal, "setFont:", v6);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_customLinkSubLabelInternal, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](self->_customLinkSubLabelInternal, "setNumberOfLines:", 0);
    customLinkSubLabelInternal = self->_customLinkSubLabelInternal;
  }
  return customLinkSubLabelInternal;
}

- (id)_imageViewInternal
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

- (void)_initializeViews
{
  UIStackView *v3;
  UIStackView *stackView;
  void *v5;
  UIStackView *v6;
  UIStackView *innerStackView;
  void *v8;
  UIStackView *v9;
  void *v10;
  UIStackView *v11;
  void *v12;
  UIStackView *v13;
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
  UIStackView *v28;
  void *v29;
  void *v30;
  double v31;
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
  _QWORD v56[10];

  v56[8] = *MEMORY[0x24BDAC8D0];
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

    -[UIStackView setDistribution:](self->_stackView, "setDistribution:", 0);
    v6 = (UIStackView *)objc_alloc_init(MEMORY[0x24BEBD978]);
    innerStackView = self->_innerStackView;
    self->_innerStackView = v6;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_innerStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](self->_innerStackView, "setAxis:", 1);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView setBackgroundColor:](self->_innerStackView, "setBackgroundColor:", v8);

    -[UIStackView setDistribution:](self->_innerStackView, "setDistribution:", 2);
    v9 = self->_innerStackView;
    -[RUICustomLinkTableViewCell _detailTextLabelInternal](self, "_detailTextLabelInternal");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView addArrangedSubview:](v9, "addArrangedSubview:", v10);

    v11 = self->_innerStackView;
    -[RUICustomLinkTableViewCell _subLabelInternal](self, "_subLabelInternal");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView addArrangedSubview:](v11, "addArrangedSubview:", v12);

    v13 = self->_stackView;
    -[RUICustomLinkTableViewCell _textLabelInternal](self, "_textLabelInternal");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView addArrangedSubview:](v13, "addArrangedSubview:", v14);

    -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_innerStackView);
    -[RUICustomLinkTableViewCell _textLabelInternal](self, "_textLabelInternal");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHidden:", 1);

    -[RUICustomLinkTableViewCell _detailTextLabelInternal](self, "_detailTextLabelInternal");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setHidden:", 1);

    -[RUICustomLinkTableViewCell _subLabelInternal](self, "_subLabelInternal");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setHidden:", 1);

    -[RUICustomLinkTableViewCell _imageViewInternal](self, "_imageViewInternal");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setHidden:", 1);

    -[RUICustomLinkTableViewCell contentView](self, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", self->_stackView);

    v43 = (void *)MEMORY[0x24BDD1628];
    -[UIStackView topAnchor](self->_stackView, "topAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUICustomLinkTableViewCell contentView](self, "contentView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "topAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:", v53);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v52;
    -[UIStackView leadingAnchor](self->_stackView, "leadingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUICustomLinkTableViewCell contentView](self, "contentView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "leadingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v49);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v56[1] = v48;
    -[UIStackView trailingAnchor](self->_stackView, "trailingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUICustomLinkTableViewCell contentView](self, "contentView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "trailingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v45);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v56[2] = v44;
    -[UIStackView bottomAnchor](self->_stackView, "bottomAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUICustomLinkTableViewCell contentView](self, "contentView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "bottomAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v40);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v56[3] = v39;
    -[UIStackView topAnchor](self->_innerStackView, "topAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView topAnchor](self->_stackView, "topAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v37);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v56[4] = v36;
    -[UIStackView bottomAnchor](self->_innerStackView, "bottomAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView bottomAnchor](self->_stackView, "bottomAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v34);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v56[5] = v33;
    -[RUICustomLinkTableViewCell _textLabelInternal](self, "_textLabelInternal");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView leadingAnchor](self->_stackView, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, 16.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v56[6] = v22;
    -[RUICustomLinkTableViewCell _textLabelInternal](self, "_textLabelInternal");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView leadingAnchor](self->_stackView, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, 66.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v56[7] = v26;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 8);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "activateConstraints:", v27);

    v28 = self->_stackView;
    -[RUICustomLinkTableViewCell _textLabelInternal](self, "_textLabelInternal");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView setCustomSpacing:afterView:](v28, "setCustomSpacing:afterView:", v29, 16.0);

    -[RUICustomLinkTableViewCell _textLabelInternal](self, "_textLabelInternal");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v31) = 1148846080;
    objc_msgSend(v30, "setContentHuggingPriority:forAxis:", 0, v31);

  }
}

- (void)setDetailLinkText:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id detailLinkHandler;
  UIButton *v12;
  UIButton *detailLinkButton;
  void *v14;
  UIButton *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UIButton *v20;
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
  objc_super v46;

  v6 = a3;
  v7 = a4;
  -[RUICustomLinkTableViewCell _initializeViews](self, "_initializeViews");
  -[RUICustomLinkTableViewCell _detailTextLabelInternal](self, "_detailTextLabelInternal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeFromSuperview");

  -[RUICustomLinkTableViewCell _subLabelInternal](self, "_subLabelInternal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeFromSuperview");

  v10 = _Block_copy(v7);
  detailLinkHandler = self->_detailLinkHandler;
  self->_detailLinkHandler = v10;

  objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
  v12 = (UIButton *)objc_claimAutoreleasedReturnValue();
  detailLinkButton = self->_detailLinkButton;
  self->_detailLinkButton = v12;

  -[UIButton setExclusiveTouch:](self->_detailLinkButton, "setExclusiveTouch:", 1);
  -[UIButton addTarget:action:forControlEvents:](self->_detailLinkButton, "addTarget:action:forControlEvents:", self, sel__detailLinkPressed, 64);
  -[UIButton imageView](self->_detailLinkButton, "imageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v15 = self->_detailLinkButton;
  -[RUICustomLinkTableViewCell _imageViewInternal](self, "_imageViewInternal");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "image");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setImage:forState:](v15, "setImage:forState:", v17, 0);

  -[UIButton setTitle:forState:](self->_detailLinkButton, "setTitle:forState:", v6, 0);
  -[UIButton titleLabel](self->_detailLinkButton, "titleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 15.0, *MEMORY[0x24BEBB610]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFont:", v19);

  v20 = self->_detailLinkButton;
  objc_msgSend(MEMORY[0x24BEBD4B8], "_labelColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitleColor:forState:](v20, "setTitleColor:forState:", v21, 0);

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_detailLinkButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView addArrangedSubview:](self->_innerStackView, "addArrangedSubview:", self->_detailLinkButton);
  -[UIStackView addArrangedSubview:](self->_innerStackView, "addArrangedSubview:", self->_customLinkSubLabelInternal);
  -[UIButton leadingAnchor](self->_detailLinkButton, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView leadingAnchor](self->_innerStackView, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, 0.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setActive:", 1);

  -[UIButton imageView](self->_detailLinkButton, "imageView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "widthAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToConstant:", 15.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setActive:", 1);

  -[UIButton imageView](self->_detailLinkButton, "imageView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "heightAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToConstant:", 15.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setActive:", 1);

  -[UIButton imageView](self->_detailLinkButton, "imageView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton titleLabel](self->_detailLinkButton, "titleLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:constant:", v34, -6.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setActive:", 1);

  -[UILabel text](self->_customLinkTextLabelInternal, "text");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[UIButton imageView](self->_detailLinkButton, "imageView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton leadingAnchor](self->_detailLinkButton, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:constant:", v39, 0.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setActive:", 1);

  }
  -[UIButton imageView](self->_detailLinkButton, "imageView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "centerYAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton titleLabel](self->_detailLinkButton, "titleLabel");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "centerYAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setActive:", 1);

  -[RUICustomLinkTableViewCell setNeedsLayout](self, "setNeedsLayout");
  v46.receiver = self;
  v46.super_class = (Class)RUICustomLinkTableViewCell;
  -[RemoteUITableViewCell setDetailLinkText:handler:](&v46, sel_setDetailLinkText_handler_, v6, v7);

}

- (void)_detailLinkPressed
{
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[16];

  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209E87000, v3, OS_LOG_TYPE_DEFAULT, "detail pressed", buf, 2u);
    }

  }
  if (self->_detailLinkHandler)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__RUICustomLinkTableViewCell__detailLinkPressed__block_invoke;
    block[3] = &unk_24C2973F0;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

uint64_t __48__RUICustomLinkTableViewCell__detailLinkPressed__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1168) + 16))();
}

void __48__RUICustomLinkTableViewCell__detailLinkPressed__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((a2 & 1) == 0 && _isInternalInstall())
  {
    _RUILoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_209E87000, v5, OS_LOG_TYPE_DEFAULT, "error %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)layoutSubviews
{
  void *v3;
  UIStackView *innerStackView;
  void *v5;
  objc_super v6;

  -[UILabel text](self->_customLinkTextLabelInternal, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[UILabel removeFromSuperview](self->_customLinkTextLabelInternal, "removeFromSuperview");
  innerStackView = self->_innerStackView;
  -[RUICustomLinkTableViewCell _imageViewInternal](self, "_imageViewInternal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView setCustomSpacing:afterView:](innerStackView, "setCustomSpacing:afterView:", v5, 6.0);

  v6.receiver = self;
  v6.super_class = (Class)RUICustomLinkTableViewCell;
  -[RemoteUITableViewCell layoutSubviews](&v6, sel_layoutSubviews);
}

- (UILabel)customLinkTextLabelInternal
{
  return self->_customLinkTextLabelInternal;
}

- (void)setCustomLinkTextLabelInternal:(id)a3
{
  objc_storeStrong((id *)&self->_customLinkTextLabelInternal, a3);
}

- (UILabel)customLinkDetailTextLabelInternal
{
  return self->_customLinkDetailTextLabelInternal;
}

- (void)setCustomLinkDetailTextLabelInternal:(id)a3
{
  objc_storeStrong((id *)&self->_customLinkDetailTextLabelInternal, a3);
}

- (UILabel)customLinkSubLabelInternal
{
  return self->_customLinkSubLabelInternal;
}

- (void)setCustomLinkSubLabelInternal:(id)a3
{
  objc_storeStrong((id *)&self->_customLinkSubLabelInternal, a3);
}

- (UIImageView)customImageViewInternal
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

- (UIStackView)innerStackView
{
  return self->_innerStackView;
}

- (void)setInnerStackView:(id)a3
{
  objc_storeStrong((id *)&self->_innerStackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerStackView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_customImageViewInternal, 0);
  objc_storeStrong((id *)&self->_customLinkSubLabelInternal, 0);
  objc_storeStrong((id *)&self->_customLinkDetailTextLabelInternal, 0);
  objc_storeStrong((id *)&self->_customLinkTextLabelInternal, 0);
  objc_storeStrong((id *)&self->_detailLinkButton, 0);
  objc_storeStrong(&self->_detailLinkHandler, 0);
}

@end
