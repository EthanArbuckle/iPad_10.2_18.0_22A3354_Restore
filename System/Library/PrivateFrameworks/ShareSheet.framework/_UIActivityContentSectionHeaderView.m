@implementation _UIActivityContentSectionHeaderView

- (_UIActivityContentSectionHeaderView)initWithFrame:(CGRect)a3
{
  _UIActivityContentSectionHeaderView *v3;
  UILabel *v4;
  UILabel *titleLabel;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSLayoutConstraint *titleLabelTopConstraint;
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
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)_UIActivityContentSectionHeaderView;
  v3 = -[_UIActivityContentSectionHeaderView initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_titleLabel, "setFont:", v6);

    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_titleLabel, "setTextColor:", v7);

    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v8) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v3->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 0, v8);
    -[_UIActivityContentSectionHeaderView titleLabel](v3, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityContentSectionHeaderView addSubview:](v3, "addSubview:", v9);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel topAnchor](v3->_titleLabel, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityContentSectionHeaderView layoutMarginsGuide](v3, "layoutMarginsGuide");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, 10.0);
    v14 = objc_claimAutoreleasedReturnValue();
    titleLabelTopConstraint = v3->_titleLabelTopConstraint;
    v3->_titleLabelTopConstraint = (NSLayoutConstraint *)v14;

    objc_msgSend(v10, "addObject:", v3->_titleLabelTopConstraint);
    -[UILabel bottomAnchor](v3->_titleLabel, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityContentSectionHeaderView layoutMarginsGuide](v3, "layoutMarginsGuide");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v19);

    -[UILabel leadingAnchor](v3->_titleLabel, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityContentSectionHeaderView layoutMarginsGuide](v3, "layoutMarginsGuide");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v23);

    -[UILabel trailingAnchor](v3->_titleLabel, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityContentSectionHeaderView layoutMarginsGuide](v3, "layoutMarginsGuide");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v27);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v10);
  }
  return v3;
}

- (void)prepareForReuse
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_UIActivityContentSectionHeaderView;
  -[_UIActivityContentSectionHeaderView prepareForReuse](&v2, sel_prepareForReuse);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (NSLayoutConstraint)titleLabelTopConstraint
{
  return self->_titleLabelTopConstraint;
}

- (void)setTitleLabelTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelTopConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabelTopConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
