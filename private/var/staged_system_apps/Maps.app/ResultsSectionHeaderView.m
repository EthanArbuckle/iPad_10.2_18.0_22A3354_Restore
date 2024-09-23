@implementation ResultsSectionHeaderView

- (ResultsSectionHeaderView)initWithTitle:(id)a3 isFirstNonEmptySection:(BOOL)a4 showHairline:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  ResultsSectionHeaderView *v9;
  id v10;
  UILabel *v11;
  UILabel *titleLabel;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  NSLayoutConstraint *topConstraint;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v34;
  _BOOL4 v35;
  id v36;
  _QWORD v37[4];

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = -[ResultsSectionHeaderView initWithReuseIdentifier:](self, "initWithReuseIdentifier:", 0);
  if (v9)
  {
    v10 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[ResultsSectionHeaderView setBackgroundView:](v9, "setBackgroundView:", v10);

    v11 = (UILabel *)objc_alloc_init((Class)UILabel);
    v35 = v5;
    titleLabel = v9->_titleLabel;
    v9->_titleLabel = v11;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v9->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](v9->_titleLabel, "setTextColor:", v13);

    -[UILabel setText:](v9->_titleLabel, "setText:", v8);
    v14 = objc_msgSend((id)objc_opt_class(v9), "_font");
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    -[UILabel setFont:](v9->_titleLabel, "setFont:", v15);

    -[ResultsSectionHeaderView addSubview:](v9, "addSubview:", v9->_titleLabel);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsSectionHeaderView topAnchor](v9, "topAnchor"));
    v36 = v8;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v9->_titleLabel, "topAnchor"));
    v18 = -26.0;
    v19 = 16.0;
    if (v6)
      v18 = 16.0;
    LODWORD(v19) = 1132068864;
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:priority:", v17, v18, v19));
    topConstraint = v9->_topConstraint;
    v9->_topConstraint = (NSLayoutConstraint *)v20;

    v37[0] = v9->_topConstraint;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v9->_titleLabel, "bottomAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsSectionHeaderView bottomAnchor](v9, "bottomAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:constant:", v22, -8.0));
    v37[1] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v9->_titleLabel, "leadingAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsSectionHeaderView leadingAnchor](v9, "leadingAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, 16.0));
    v37[2] = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v9->_titleLabel, "trailingAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsSectionHeaderView trailingAnchor](v9, "trailingAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v28));
    v37[3] = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v30);

    v8 = v36;
    if (v35 && MapsFeature_IsEnabled_SearchAndDiscovery(v31))
      v32 = -[ResultsSectionHeaderView _maps_addHairlineAtBottomWithLeadingMargin:trailingMargin:](v9, "_maps_addHairlineAtBottomWithLeadingMargin:trailingMargin:", 16.0, 0.0);
  }

  return v9;
}

+ (double)heightWhenFirstNonEmptySection:(BOOL)a3 title:(id)a4 traitCollection:(id)a5
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;

  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "_maps_traitCollectionByClampingContentSizeCategoryWithMinimumContentSizeCategory:maximumContentSizeCategory:", 0, UIContentSizeCategoryAccessibilityLarge));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_font"));
  objc_msgSend(v7, "_maps_displayScaleOrMainScreenScale");
  +[UILabel _maps_maximumHeightWithFont:numberOfLines:displayScale:](UILabel, "_maps_maximumHeightWithFont:numberOfLines:displayScale:", v8, 1);
  v10 = 26.0;
  if (v5)
    v10 = 16.0;
  v11 = v10 + v9 + 8.0;

  return v11;
}

+ (id)_font
{
  return +[UIFont system15Semibold](UIFont, "system15Semibold");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
