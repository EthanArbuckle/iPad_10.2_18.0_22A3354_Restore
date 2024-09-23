@implementation ButtonTableViewHeaderFooterView

- (ButtonTableViewHeaderFooterView)initWithReuseIdentifier:(id)a3
{
  ButtonTableViewHeaderFooterView *v3;
  ButtonTableViewHeaderFooterView *v4;
  UIButton *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  UIButton *button;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)ButtonTableViewHeaderFooterView;
  v3 = -[MapsGroupedTableHeaderView initWithReuseIdentifier:](&v20, "initWithReuseIdentifier:", a3);
  v4 = v3;
  if (v3)
  {
    -[ButtonTableViewHeaderFooterView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("ButtonTableViewHeaderFooter"));
    v5 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RAPFontManager tableHeaderViewButtonFont](RAPFontManager, "tableHeaderViewButtonFont"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v5, "titleLabel"));
    objc_msgSend(v7, "setFont:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonTableViewHeaderFooterView theme](v4, "theme"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "keyColor"));
    -[UIButton setTitleColor:forState:](v5, "setTitleColor:forState:", v9, 0);

    LODWORD(v10) = 1148846080;
    -[UIButton setContentHuggingPriority:forAxis:](v5, "setContentHuggingPriority:forAxis:", 1, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v5, "titleLabel"));
    LODWORD(v12) = 1148846080;
    objc_msgSend(v11, "setContentHuggingPriority:forAxis:", 1, v12);

    LODWORD(v13) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v5, "setContentCompressionResistancePriority:forAxis:", 1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v5, "titleLabel"));
    LODWORD(v15) = 1148846080;
    objc_msgSend(v14, "setContentCompressionResistancePriority:forAxis:", 1, v15);

    -[UIButton setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", CFSTR("ButtonTableViewHeaderFooterButton"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v5, "titleLabel"));
    objc_msgSend(v16, "setAccessibilityIdentifier:", CFSTR("ButtonTableViewHeaderFooterButtonLabel"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonTableViewHeaderFooterView contentView](v4, "contentView"));
    objc_msgSend(v17, "addSubview:", v5);

    button = v4->_button;
    v4->_button = v5;

    -[ButtonTableViewHeaderFooterView _contentSizeChanged:](v4, "_contentSizeChanged:", 0);
  }
  return v4;
}

- (BOOL)shouldStack
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  NSAttributedStringKey v22;
  void *v23;
  NSAttributedStringKey v24;
  void *v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonTableViewHeaderFooterView button](self, "button"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "titleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
  v6 = objc_msgSend(v5, "length");

  if (!v6)
    return 0;
  -[ButtonTableViewHeaderFooterView frame](self, "frame");
  v8 = v7 + -37.0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsGroupedTableHeaderView titleLabel](self, "titleLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "text"));
  v24 = NSFontAttributeName;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[RAPFontManager tableHeaderViewFont](RAPFontManager, "tableHeaderViewFont"));
  v25 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
  objc_msgSend(v10, "sizeWithAttributes:", v12);
  v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_button, "titleLabel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "text"));
  v22 = NSFontAttributeName;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[RAPFontManager tableHeaderViewButtonFont](RAPFontManager, "tableHeaderViewButtonFont"));
  v23 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
  objc_msgSend(v16, "sizeWithAttributes:", v18);
  v20 = v19;

  return v8 < v14 + v20;
}

- (void)_setConstraints:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  NSMutableArray *constraints;
  UIButton *button;
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
  NSMutableArray *v25;
  _QWORD v26[2];
  _QWORD v27[2];
  void *v28;

  v3 = a3;
  if (self->_constraints)
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
  self->_stacking = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_button, "trailingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonTableViewHeaderFooterView contentView](self, "contentView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layoutMarginsGuide"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v8));
  v28 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
  v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v10));
  constraints = self->_constraints;
  self->_constraints = v11;

  v25 = self->_constraints;
  button = self->_button;
  if (v3)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](button, "topAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsGroupedTableHeaderView titleLabel](self, "titleLabel"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bottomAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v16));
    v27[0] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_button, "bottomAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonTableViewHeaderFooterView contentView](self, "contentView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bottomAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v20));
    v27[1] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 2));
    -[NSMutableArray addObjectsFromArray:](v25, "addObjectsFromArray:", v22);
  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](button, "leadingAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsGroupedTableHeaderView titleLabel](self, "titleLabel"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trailingAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintGreaterThanOrEqualToAnchor:constant:", v16, 5.0));
    v26[0] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_button, "titleLabel"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstBaselineAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MapsGroupedTableHeaderView titleLabel](self, "titleLabel"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "lastBaselineAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v21));
    v26[1] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 2));
    -[NSMutableArray addObjectsFromArray:](v25, "addObjectsFromArray:", v23);

    v14 = v24;
  }

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_constraints);
}

- (void)_updateConstraintsIfNeeded
{
  _BOOL8 v3;

  v3 = -[ButtonTableViewHeaderFooterView shouldStack](self, "shouldStack");
  if (self->_stacking != v3 || !self->_constraints)
    -[ButtonTableViewHeaderFooterView _setConstraints:](self, "_setConstraints:", v3);
}

- (void)_contentSizeChanged:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ButtonTableViewHeaderFooterView;
  -[MapsGroupedTableHeaderView _contentSizeChanged:](&v6, "_contentSizeChanged:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RAPFontManager tableHeaderViewButtonFont](RAPFontManager, "tableHeaderViewButtonFont"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_button, "titleLabel"));
  objc_msgSend(v5, "setFont:", v4);

  -[ButtonTableViewHeaderFooterView _updateConstraintsIfNeeded](self, "_updateConstraintsIfNeeded");
}

- (void)layoutSubviews
{
  objc_super v3;

  -[ButtonTableViewHeaderFooterView _updateConstraintsIfNeeded](self, "_updateConstraintsIfNeeded");
  v3.receiver = self;
  v3.super_class = (Class)ButtonTableViewHeaderFooterView;
  -[ButtonTableViewHeaderFooterView layoutSubviews](&v3, "layoutSubviews");
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ButtonTableViewHeaderFooterView;
  -[ButtonTableViewHeaderFooterView prepareForReuse](&v5, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsGroupedTableHeaderView titleLabel](self, "titleLabel"));
  objc_msgSend(v3, "setText:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_button, "titleLabel"));
  objc_msgSend(v4, "setText:", 0);

  -[UIButton removeTarget:action:forControlEvents:](self->_button, "removeTarget:action:forControlEvents:", 0, 0, 0xFFFFFFFFLL);
}

- (void)updateAXIdentifiersWithPrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("TableHeaderFooter")));
  -[ButtonTableViewHeaderFooterView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("TableHeaderFooterTitle")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsGroupedTableHeaderView titleLabel](self, "titleLabel"));
  objc_msgSend(v7, "setAccessibilityIdentifier:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("TableHeaderFooterButton")));
  -[UIButton setAccessibilityIdentifier:](self->_button, "setAccessibilityIdentifier:", v8);

  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("TableHeaderFooterButtonLabel")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_button, "titleLabel"));
  objc_msgSend(v9, "setAccessibilityIdentifier:", v10);

}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
}

@end
