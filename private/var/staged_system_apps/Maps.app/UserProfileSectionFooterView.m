@implementation UserProfileSectionFooterView

- (void)configureWithViewModel:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_storeStrong((id *)&self->_viewModel, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileSectionFooterView viewModel](self, "viewModel"));
  self->_collapsed = objc_msgSend(v5, "isCollapsed");

  -[UserProfileSectionFooterView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("UserProfileSectionFooter"));
  if (!self->_textLabel)
    -[UserProfileSectionFooterView _setupView](self, "_setupView");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileSectionFooterView viewModel](self, "viewModel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentString"));
  -[UILabel setAttributedText:](self->_textLabel, "setAttributedText:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_textLabel, "text"));
  if (!v8)
    self->_collapsed = 1;
  -[UserProfileSectionFooterView _updateForFooter](self, "_updateForFooter");

}

- (void)_setupView
{
  UILabel *v3;
  UILabel *textLabel;
  void *v5;
  UILabel *v6;
  void *v7;
  double v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *topConstraint;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *bottomConstraint;
  void *v13;
  void *v14;
  NSLayoutConstraint *v15;
  NSLayoutConstraint *collapsedHeightConstraint;
  void *v17;
  id v18;

  v3 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  textLabel = self->_textLabel;
  self->_textLabel = v3;

  -[UILabel setAccessibilityIdentifier:](self->_textLabel, "setAccessibilityIdentifier:", CFSTR("TextLabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_textLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_textLabel, "setNumberOfLines:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeCollectionReusableView contentView](self, "contentView"));
  objc_msgSend(v5, "addSubview:", self->_textLabel);

  -[UserProfileSectionFooterView setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:", 0.0, 0.0, 0.0, 0.0);
  v6 = self->_textLabel;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeCollectionReusableView contentView](self, "contentView"));
  LODWORD(v8) = 1148846080;
  v18 = (id)objc_claimAutoreleasedReturnValue(-[UILabel _maps_constraintsEqualToEdgesOfView:priority:](v6, "_maps_constraintsEqualToEdgesOfView:priority:", v7, v8));

  v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topConstraint"));
  topConstraint = self->_topConstraint;
  self->_topConstraint = v9;

  v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bottomConstraint"));
  bottomConstraint = self->_bottomConstraint;
  self->_bottomConstraint = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeCollectionReusableView contentView](self, "contentView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "heightAnchor"));
  v15 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToConstant:", 0.0));
  collapsedHeightConstraint = self->_collapsedHeightConstraint;
  self->_collapsedHeightConstraint = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "allConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

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

- (void)_updateForFooter
{
  uint64_t v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  double v8;
  double v9;

  v3 = sub_1002A8AA0(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:", UIFontTextStyleFootnote));
  -[UILabel setFont:](self->_textLabel, "setFont:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileSectionFooterView viewModel](self, "viewModel"));
  v6 = objc_msgSend(v5, "containsLink");

  if ((v6 & 1) != 0)
  {
    -[UserProfileSectionFooterView _footerLinkHandler](self, "_footerLinkHandler");
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](self->_textLabel, "setTextColor:", v7);

  }
  v8 = 0.0;
  -[UserProfileSectionFooterView setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:", 0.0, 16.0, 0.0, 16.0);
  v9 = 4.0;
  if (v3 == 5)
    v8 = 6.0;
  else
    v9 = 0.0;
  -[NSLayoutConstraint setConstant:](self->_topConstraint, "setConstant:", v9);
  -[NSLayoutConstraint setConstant:](self->_bottomConstraint, "setConstant:", v8);
  -[UserProfileSectionFooterView _updateForCollapsed](self, "_updateForCollapsed");
}

- (void)_footerLinkHandler
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = objc_alloc((Class)UITapGestureRecognizer);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileSectionFooterView viewModel](self, "viewModel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "target"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileSectionFooterView viewModel](self, "viewModel"));
  v7 = objc_msgSend(v3, "initWithTarget:action:", v5, objc_msgSend(v6, "action"));

  objc_msgSend(v7, "setNumberOfTapsRequired:", 1);
  -[UserProfileSectionFooterView addGestureRecognizer:](self, "addGestureRecognizer:", v7);
  -[UserProfileSectionFooterView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);

}

- (UserProfileSectionFooterViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_collapsedHeightConstraint, 0);
}

@end
