@implementation AllRefinementsHeaderView

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(a1, a2);
  return NSStringFromClass(v2);
}

- (AllRefinementsHeaderView)initWithFrame:(CGRect)a3
{
  AllRefinementsHeaderView *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AllRefinementsHeaderView;
  v3 = -[AllRefinementsHeaderView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[AllRefinementsHeaderView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[AllRefinementsHeaderView addSubviews](v3, "addSubviews");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v3, "contentSizeCategoryDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

    -[AllRefinementsHeaderView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("AllRefinementsHeaderView"));
  }
  return v3;
}

- (void)addSubviews
{
  UILabel *v3;
  UILabel *label;
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
  _QWORD v19[4];

  v3 = (UILabel *)objc_alloc_init((Class)UILabel);
  label = self->_label;
  self->_label = v3;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:", 1);
  -[UILabel setAccessibilityIdentifier:](self->_label, "setAccessibilityIdentifier:", CFSTR("AllRefinementsHeaderLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_label, "setTextColor:", v5);

  -[AllRefinementsHeaderView updateFont](self, "updateFont");
  -[AllRefinementsHeaderView addSubview:](self, "addSubview:", self->_label);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_label, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsHeaderView leadingAnchor](self, "leadingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v17));
  v19[0] = v16;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_label, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsHeaderView trailingAnchor](self, "trailingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
  v19[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_label, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsHeaderView topAnchor](self, "topAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, 16.0));
  v19[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_label, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsHeaderView bottomAnchor](self, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
  v19[3] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v15);

}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AllRefinementsHeaderView;
  -[AllRefinementsHeaderView prepareForReuse](&v4, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsHeaderView label](self, "label"));
  objc_msgSend(v3, "setText:", 0);

}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[AllRefinementsHeaderView label](self, "label"));
  objc_msgSend(v5, "setText:", v4);

}

- (void)updateFont
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[AllRefinementsHeaderView traitCollection](self, "traitCollection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15SemiboldCompatibleWithTraitCollection:](UIFont, "system15SemiboldCompatibleWithTraitCollection:", v5));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsHeaderView label](self, "label"));
  objc_msgSend(v4, "setFont:", v3);

}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
