@implementation ICSETableViewHeaderView

- (ICSETableViewHeaderView)initWithReuseIdentifier:(id)a3
{
  ICSETableViewHeaderView *v3;
  ICSETableViewHeaderView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICSETableViewHeaderView;
  v3 = -[ICSETableViewHeaderView initWithReuseIdentifier:](&v6, "initWithReuseIdentifier:", a3);
  v4 = v3;
  if (v3)
    -[ICSETableViewHeaderView setupUI](v3, "setupUI");
  return v4;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICSETableViewHeaderView;
  -[ICSETableViewHeaderView prepareForReuse](&v5, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView typeLabel](self, "typeLabel"));
  objc_msgSend(v3, "setText:", &stru_1000DAF38);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView countLabel](self, "countLabel"));
  objc_msgSend(v4, "setText:", &stru_1000DAF38);

}

- (void)setTypeLabelText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView typeLabel](self, "typeLabel"));
  objc_msgSend(v5, "setText:", v4);

}

- (void)setCountLabelText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView countLabel](self, "countLabel"));
  objc_msgSend(v5, "setText:", v4);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView typeLabel](self, "typeLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView countLabel](self, "countLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return v3;
}

- (void)setupUI
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  id v23;

  v3 = objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView typeLabel](self, "typeLabel"));
  if (!v3
    || (v4 = (void *)v3,
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView countLabel](self, "countLabel")),
        v5,
        v4,
        !v5))
  {
    v6 = objc_alloc_init((Class)UILabel);
    -[ICSETableViewHeaderView setTypeLabel:](self, "setTypeLabel:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleHeadline));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ic_fontWithSingleLineA"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView typeLabel](self, "typeLabel"));
    objc_msgSend(v9, "setFont:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView countLabel](self, "countLabel"));
    objc_msgSend(v11, "setTextColor:", v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView typeLabel](self, "typeLabel"));
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView typeLabel](self, "typeLabel"));
    -[ICSETableViewHeaderView addSubview:](self, "addSubview:", v13);

    v14 = objc_alloc_init((Class)UILabel);
    -[ICSETableViewHeaderView setCountLabel:](self, "setCountLabel:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ic_fontWithSingleLineA"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView countLabel](self, "countLabel"));
    objc_msgSend(v17, "setFont:", v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView countLabel](self, "countLabel"));
    objc_msgSend(v19, "setTextColor:", v18);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView countLabel](self, "countLabel"));
    objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView countLabel](self, "countLabel"));
    -[ICSETableViewHeaderView addSubview:](self, "addSubview:", v21);

    v22 = (unint64_t)-[ICSETableViewHeaderView accessibilityTraits](self, "accessibilityTraits");
    -[ICSETableViewHeaderView setAccessibilityTraits:](self, "setAccessibilityTraits:", UIAccessibilityTraitHeader | v22);
    v23 = (id)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView defaultConstraints](self, "defaultConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v23);

  }
}

- (void)updateConstraints
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v7;

  if (ICAccessibilityAccessibilityLargerTextSizesEnabled(self, a2))
  {
    if (self->_defaultConstraints)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView defaultConstraints](self, "defaultConstraints"));
      +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v3);

    }
    v4 = objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView largerTextSizeConstraints](self, "largerTextSizeConstraints"));
  }
  else
  {
    if (self->_largerTextSizeConstraints)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView largerTextSizeConstraints](self, "largerTextSizeConstraints"));
      +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v5);

    }
    v4 = objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView defaultConstraints](self, "defaultConstraints"));
  }
  v6 = (void *)v4;
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v4);

  v7.receiver = self;
  v7.super_class = (Class)ICSETableViewHeaderView;
  -[ICSETableViewHeaderView updateConstraints](&v7, "updateConstraints");
}

- (NSArray)defaultConstraints
{
  NSArray *defaultConstraints;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  NSArray *v27;
  NSArray *v28;
  _QWORD v30[5];

  defaultConstraints = self->_defaultConstraints;
  if (!defaultConstraints)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView countLabel](self, "countLabel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView layoutMarginsGuide](self, "layoutMarginsGuide"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView typeLabel](self, "typeLabel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "leadingAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView layoutMarginsGuide](self, "layoutMarginsGuide"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leadingAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v12));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView countLabel](self, "countLabel"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leadingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView typeLabel](self, "typeLabel"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintGreaterThanOrEqualToAnchor:constant:", v17, 8.0));

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView typeLabel](self, "typeLabel"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "centerYAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView centerYAnchor](self, "centerYAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v21));

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView countLabel](self, "countLabel"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "centerYAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView centerYAnchor](self, "centerYAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v25));

    v30[0] = v8;
    v30[1] = v13;
    v30[2] = v18;
    v30[3] = v22;
    v30[4] = v26;
    v27 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 5));
    v28 = self->_defaultConstraints;
    self->_defaultConstraints = v27;

    defaultConstraints = self->_defaultConstraints;
  }
  return defaultConstraints;
}

- (NSArray)largerTextSizeConstraints
{
  NSArray *largerTextSizeConstraints;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  NSArray *v35;
  NSArray *v36;
  void *v38;
  void *v39;
  _QWORD v40[7];

  largerTextSizeConstraints = self->_largerTextSizeConstraints;
  if (!largerTextSizeConstraints)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView typeLabel](self, "typeLabel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView layoutMarginsGuide](self, "layoutMarginsGuide"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v7));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView typeLabel](self, "typeLabel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView topAnchor](self, "topAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView typeLabel](self, "typeLabel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "trailingAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView layoutMarginsGuide](self, "layoutMarginsGuide"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v14));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView countLabel](self, "countLabel"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "leadingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView layoutMarginsGuide](self, "layoutMarginsGuide"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leadingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v19));

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView countLabel](self, "countLabel"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bottomAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView bottomAnchor](self, "bottomAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v23));

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView countLabel](self, "countLabel"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "trailingAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView layoutMarginsGuide](self, "layoutMarginsGuide"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "trailingAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v28));

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView countLabel](self, "countLabel"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "topAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewHeaderView typeLabel](self, "typeLabel"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "bottomAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v33));

    v40[0] = v39;
    v40[1] = v38;
    v40[2] = v15;
    v40[3] = v20;
    v40[4] = v24;
    v40[5] = v29;
    v40[6] = v34;
    v35 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 7));
    v36 = self->_largerTextSizeConstraints;
    self->_largerTextSizeConstraints = v35;

    largerTextSizeConstraints = self->_largerTextSizeConstraints;
  }
  return largerTextSizeConstraints;
}

- (NSString)typeLabelText
{
  return self->_typeLabelText;
}

- (NSString)countLabelText
{
  return self->_countLabelText;
}

- (UILabel)typeLabel
{
  return self->_typeLabel;
}

- (void)setTypeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_typeLabel, a3);
}

- (UILabel)countLabel
{
  return self->_countLabel;
}

- (void)setCountLabel:(id)a3
{
  objc_storeStrong((id *)&self->_countLabel, a3);
}

- (void)setDefaultConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_defaultConstraints, a3);
}

- (void)setLargerTextSizeConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_largerTextSizeConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largerTextSizeConstraints, 0);
  objc_storeStrong((id *)&self->_defaultConstraints, 0);
  objc_storeStrong((id *)&self->_countLabel, 0);
  objc_storeStrong((id *)&self->_typeLabel, 0);
  objc_storeStrong((id *)&self->_countLabelText, 0);
  objc_storeStrong((id *)&self->_typeLabelText, 0);
}

@end
