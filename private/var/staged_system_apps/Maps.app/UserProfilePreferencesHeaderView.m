@implementation UserProfilePreferencesHeaderView

- (UserProfilePreferencesHeaderView)initWithFrame:(CGRect)a3
{
  UserProfilePreferencesHeaderView *v3;
  UserProfilePreferencesHeaderView *v4;
  uint64_t v5;
  UILabel *v6;
  UILabel *textLabel;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  UILabel *v14;
  void *v15;
  double v16;
  void *v17;
  uint64_t v18;
  NSLayoutConstraint *topConstraint;
  uint64_t v20;
  NSLayoutConstraint *bottomConstraint;
  void *v22;
  void *v23;
  uint64_t v24;
  NSLayoutConstraint *collapsedHeightConstraint;
  void *v26;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)UserProfilePreferencesHeaderView;
  v3 = -[MapsThemeCollectionReusableView initWithFrame:](&v28, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UserProfilePreferencesHeaderView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("UserProfilePreferencesHeader"));
    v5 = sub_1002A8AA0(v4);
    v6 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    textLabel = v4->_textLabel;
    v4->_textLabel = v6;

    -[UILabel setAccessibilityIdentifier:](v4->_textLabel, "setAccessibilityIdentifier:", CFSTR("TextLabel"));
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_textLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v4->_textLabel, "setNumberOfLines:", 0);
    if (v5 == 5)
      v8 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0));
    else
      v8 = objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", UIFontTextStyleSubheadline, UIFontWeightSemibold));
    v9 = (void *)v8;
    -[UILabel setFont:](v4->_textLabel, "setFont:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](v4->_textLabel, "setTextColor:", v10);

    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_textLabel, "setAdjustsFontForContentSizeCategory:", 1);
    LODWORD(v11) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v4->_textLabel, "setContentHuggingPriority:forAxis:", 1, v11);
    LODWORD(v12) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_textLabel, "setContentCompressionResistancePriority:forAxis:", 1, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeCollectionReusableView contentView](v4, "contentView"));
    objc_msgSend(v13, "addSubview:", v4->_textLabel);

    -[UserProfilePreferencesHeaderView setDirectionalLayoutMargins:](v4, "setDirectionalLayoutMargins:", 0.0, 0.0, 0.0, 0.0);
    v14 = v4->_textLabel;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeCollectionReusableView contentView](v4, "contentView"));
    LODWORD(v16) = 1148846080;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel _maps_constraintsEqualToEdgesOfView:priority:](v14, "_maps_constraintsEqualToEdgesOfView:priority:", v15, v16));

    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "topConstraint"));
    topConstraint = v4->_topConstraint;
    v4->_topConstraint = (NSLayoutConstraint *)v18;

    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomConstraint"));
    bottomConstraint = v4->_bottomConstraint;
    v4->_bottomConstraint = (NSLayoutConstraint *)v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeCollectionReusableView contentView](v4, "contentView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "heightAnchor"));
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToConstant:", 0.0));
    collapsedHeightConstraint = v4->_collapsedHeightConstraint;
    v4->_collapsedHeightConstraint = (NSLayoutConstraint *)v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "allConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v26);

    -[UserProfilePreferencesHeaderView _updateForFooter](v4, "_updateForFooter");
  }
  return v4;
}

- (void)setFooter:(BOOL)a3
{
  if (self->_footer != a3)
  {
    self->_footer = a3;
    -[UserProfilePreferencesHeaderView _updateForFooter](self, "_updateForFooter");
    -[UserProfilePreferencesHeaderView _updateForCollapsed](self, "_updateForCollapsed");
  }
}

- (void)setCollapsed:(BOOL)a3
{
  if (self->_collapsed != a3)
  {
    self->_collapsed = a3;
    -[UserProfilePreferencesHeaderView _updateForCollapsed](self, "_updateForCollapsed");
  }
}

- (void)_updateForCollapsed
{
  NSLayoutConstraint **p_collapsedHeightConstraint;

  if (self->_collapsed)
  {
    -[NSLayoutConstraint setActive:](self->_topConstraint, "setActive:", 0);
    -[NSLayoutConstraint setActive:](self->_bottomConstraint, "setActive:", 0);
    p_collapsedHeightConstraint = &self->_collapsedHeightConstraint;
    -[NSLayoutConstraint setConstant:](*p_collapsedHeightConstraint, "setConstant:", 0.0);
  }
  else
  {
    -[NSLayoutConstraint setActive:](self->_collapsedHeightConstraint, "setActive:", 0);
    -[NSLayoutConstraint setActive:](self->_topConstraint, "setActive:", 1);
    p_collapsedHeightConstraint = &self->_bottomConstraint;
  }
  -[NSLayoutConstraint setActive:](*p_collapsedHeightConstraint, "setActive:", 1);
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UserProfilePreferencesHeaderView;
  -[UserProfilePreferencesHeaderView setHidden:](&v5, "setHidden:");
  -[UserProfilePreferencesHeaderView setCollapsed:](self, "setCollapsed:", v3);
}

- (void)_updateForFooter
{
  double v3;

  if (-[UserProfilePreferencesHeaderView isFooter](self, "isFooter"))
    v3 = 0.0;
  else
    v3 = 9.0;
  -[NSLayoutConstraint setConstant:](self->_topConstraint, "setConstant:", v3);
  -[NSLayoutConstraint setConstant:](self->_bottomConstraint, "setConstant:", v3);
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (BOOL)isFooter
{
  return self->_footer;
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_collapsedHeightConstraint, 0);
}

@end
