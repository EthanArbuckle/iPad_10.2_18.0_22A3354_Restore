@implementation MapsGroupedTableHeaderView

- (MapsGroupedTableHeaderView)initWithReuseIdentifier:(id)a3
{
  MapsGroupedTableHeaderView *v3;
  double v4;
  MapsGroupedTableHeaderView *v5;
  id v6;
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
  double v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)MapsGroupedTableHeaderView;
  v3 = -[MapsGroupedTableHeaderView initWithReuseIdentifier:](&v26, "initWithReuseIdentifier:", a3);
  v5 = v3;
  if (v3)
  {
    LODWORD(v4) = 1148846080;
    -[MapsGroupedTableHeaderView setContentHuggingPriority:forAxis:](v3, "setContentHuggingPriority:forAxis:", 1, v4);
    -[MapsGroupedTableHeaderView setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", CFSTR("MapsGroupedTableHeader"));
    v6 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[MapsGroupedTableHeaderView setTitleLabel:](v5, "setTitleLabel:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsGroupedTableHeaderView titleLabel](v5, "titleLabel"));
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[RAPFontManager tableHeaderViewFont](RAPFontManager, "tableHeaderViewFont"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsGroupedTableHeaderView titleLabel](v5, "titleLabel"));
    objc_msgSend(v9, "setFont:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsGroupedTableHeaderView titleLabel](v5, "titleLabel"));
    objc_msgSend(v11, "setTextColor:", v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsGroupedTableHeaderView titleLabel](v5, "titleLabel"));
    objc_msgSend(v12, "setNumberOfLines:", 0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsGroupedTableHeaderView titleLabel](v5, "titleLabel"));
    objc_msgSend(v13, "setAccessibilityIdentifier:", CFSTR("MapsGroupedTableHeaderTitle"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsGroupedTableHeaderView contentView](v5, "contentView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsGroupedTableHeaderView titleLabel](v5, "titleLabel"));
    objc_msgSend(v14, "addSubview:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsGroupedTableHeaderView titleLabel](v5, "titleLabel"));
    LODWORD(v17) = 1148846080;
    objc_msgSend(v16, "setContentHuggingPriority:forAxis:", 1, v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MapsGroupedTableHeaderView titleLabel](v5, "titleLabel"));
    LODWORD(v19) = 1148846080;
    objc_msgSend(v18, "setContentCompressionResistancePriority:forAxis:", 1, v19);

    -[MapsGroupedTableHeaderView setupConstraints](v5, "setupConstraints");
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v20, "addObserver:selector:name:object:", v5, "_contentSizeChanged:", UIContentSizeCategoryDidChangeNotification, 0);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v22 = objc_msgSend(v21, "userInterfaceIdiom");

    if (v22 == (id)5)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MapsGroupedTableHeaderView contentView](v5, "contentView"));
      objc_msgSend(v24, "setBackgroundColor:", v23);

    }
  }
  return v5;
}

- (void)setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSLayoutConstraint *v8;
  NSLayoutConstraint *topToFirstBaselineConstraint;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *lastBaselineToBottomConstraint;
  double v18;
  NSLayoutConstraint *v19;
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
  _QWORD v33[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsGroupedTableHeaderView titleLabel](self, "titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstBaselineAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsGroupedTableHeaderView contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RAPFontManager tableHeaderViewFont](RAPFontManager, "tableHeaderViewFont"));
  objc_msgSend(v7, "_mapkit_scaledValueForValue:", 38.0);
  v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:constant:", v6));
  topToFirstBaselineConstraint = self->_topToFirstBaselineConstraint;
  self->_topToFirstBaselineConstraint = v8;

  LODWORD(v10) = 1144750080;
  -[NSLayoutConstraint setPriority:](self->_topToFirstBaselineConstraint, "setPriority:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsGroupedTableHeaderView contentView](self, "contentView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsGroupedTableHeaderView titleLabel](self, "titleLabel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastBaselineAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[RAPFontManager tableHeaderViewFont](RAPFontManager, "tableHeaderViewFont"));
  objc_msgSend(v15, "_mapkit_scaledValueForValue:", 11.0);
  v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintGreaterThanOrEqualToAnchor:constant:", v14));
  lastBaselineToBottomConstraint = self->_lastBaselineToBottomConstraint;
  self->_lastBaselineToBottomConstraint = v16;

  LODWORD(v18) = 1144750080;
  -[NSLayoutConstraint setPriority:](self->_lastBaselineToBottomConstraint, "setPriority:", v18);
  v19 = self->_lastBaselineToBottomConstraint;
  v33[0] = self->_topToFirstBaselineConstraint;
  v33[1] = v19;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MapsGroupedTableHeaderView titleLabel](self, "titleLabel"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "leadingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MapsGroupedTableHeaderView contentView](self, "contentView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "layoutMarginsGuide"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "leadingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v21));
  v33[2] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MapsGroupedTableHeaderView titleLabel](self, "titleLabel"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "trailingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MapsGroupedTableHeaderView contentView](self, "contentView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "layoutMarginsGuide"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "trailingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintLessThanOrEqualToAnchor:", v27));
  v33[3] = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v29);

}

- (void)_contentSizeChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RAPFontManager tableHeaderViewFont](RAPFontManager, "tableHeaderViewFont", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsGroupedTableHeaderView titleLabel](self, "titleLabel"));
  objc_msgSend(v5, "setFont:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RAPFontManager tableHeaderViewFont](RAPFontManager, "tableHeaderViewFont"));
  objc_msgSend(v6, "_mapkit_scaledValueForValue:", 38.0);
  -[NSLayoutConstraint setConstant:](self->_topToFirstBaselineConstraint, "setConstant:");

  v7 = (id)objc_claimAutoreleasedReturnValue(+[RAPFontManager tableHeaderViewFont](RAPFontManager, "tableHeaderViewFont"));
  objc_msgSend(v7, "_mapkit_scaledValueForValue:", 11.0);
  -[NSLayoutConstraint setConstant:](self->_lastBaselineToBottomConstraint, "setConstant:");

}

- (void)updateAXIdentifiersWithPrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("TableHeader")));
  -[MapsGroupedTableHeaderView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v5);

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("TableHeaderTitle")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsGroupedTableHeaderView titleLabel](self, "titleLabel"));
  objc_msgSend(v6, "setAccessibilityIdentifier:", v7);

}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_lastBaselineToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_topToFirstBaselineConstraint, 0);
}

@end
