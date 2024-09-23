@implementation HOTitleDescriptionView

- (HOTitleDescriptionView)initWithFrame:(CGRect)a3
{
  HOTitleDescriptionView *v3;
  UILabel *v4;
  UILabel *titleLabel;
  void *v6;
  id v7;
  void *v8;
  UIStackView *v9;
  UIStackView *stackView;
  id v11;
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
  objc_super v33;
  UILabel *v34;

  v33.receiver = self;
  v33.super_class = (Class)HOTitleDescriptionView;
  v3 = -[HOTitleDescriptionView initWithFrame:](&v33, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle3));
    -[UILabel setFont:](v3->_titleLabel, "setFont:", v6);

    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 1);
    v7 = objc_alloc((Class)UIStackView);
    v34 = v3->_titleLabel;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v34, 1));
    v9 = (UIStackView *)objc_msgSend(v7, "initWithArrangedSubviews:", v8);
    stackView = v3->_stackView;
    v3->_stackView = v9;

    -[UIStackView setAxis:](v3->_stackView, "setAxis:", 1);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v3->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HOTitleDescriptionView addSubview:](v3, "addSubview:", v3->_stackView);
    v11 = objc_alloc_init((Class)NSMutableArray);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](v3->_stackView, "leadingAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HOTitleDescriptionView layoutMarginsGuide](v3, "layoutMarginsGuide"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "leadingAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v14));
    objc_msgSend(v11, "addObject:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](v3->_stackView, "trailingAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[HOTitleDescriptionView layoutMarginsGuide](v3, "layoutMarginsGuide"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));
    objc_msgSend(v11, "addObject:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](v3->_stackView, "topAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[HOTitleDescriptionView layoutMarginsGuide](v3, "layoutMarginsGuide"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "topAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintGreaterThanOrEqualToAnchor:", v22));
    objc_msgSend(v11, "addObject:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](v3->_stackView, "bottomAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[HOTitleDescriptionView layoutMarginsGuide](v3, "layoutMarginsGuide"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bottomAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintLessThanOrEqualToAnchor:", v26));
    objc_msgSend(v11, "addObject:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerYAnchor](v3->_stackView, "centerYAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[HOTitleDescriptionView layoutMarginsGuide](v3, "layoutMarginsGuide"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "centerYAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v30));
    objc_msgSend(v11, "addObject:", v31);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v11);
  }
  return v3;
}

- (UILabel)descriptionLabel
{
  UILabel *descriptionLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;

  descriptionLabel = self->_descriptionLabel;
  if (!descriptionLabel)
  {
    v4 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_descriptionLabel;
    self->_descriptionLabel = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline));
    -[UILabel setFont:](self->_descriptionLabel, "setFont:", v6);

    -[UILabel setTextAlignment:](self->_descriptionLabel, "setTextAlignment:", 1);
    -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_descriptionLabel);
    -[HOTitleDescriptionView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    descriptionLabel = self->_descriptionLabel;
  }
  return descriptionLabel;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void)setDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
