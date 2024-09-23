@implementation MapsDebugCollectionHeaderFooterView

- (MapsDebugCollectionHeaderFooterView)initWithFrame:(CGRect)a3
{
  MapsDebugCollectionHeaderFooterView *v3;
  MapsDebugCollectionHeaderFooterView *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  UILabel *v8;
  UILabel *textLabel;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  UILabel *v19;
  void *v20;
  double v21;
  void *v22;
  uint64_t v23;
  NSLayoutConstraint *topConstraint;
  uint64_t v25;
  NSLayoutConstraint *bottomConstraint;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  uint64_t v32;
  NSLayoutConstraint *collapsedHeightConstraint;
  void *v34;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)MapsDebugCollectionHeaderFooterView;
  v3 = -[MapsThemeCollectionReusableView initWithFrame:](&v36, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (objc_class *)objc_opt_class(v3);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[MapsDebugCollectionHeaderFooterView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v7);

    v8 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    textLabel = v4->_textLabel;
    v4->_textLabel = v8;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_textLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v4->_textLabel, "setNumberOfLines:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_textLabel, "setAdjustsFontForContentSizeCategory:", sub_1002A8AA0(v4) != 5);
    LODWORD(v10) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v4->_textLabel, "setContentHuggingPriority:forAxis:", 1, v10);
    LODWORD(v11) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_textLabel, "setContentCompressionResistancePriority:forAxis:", 1, v11);
    -[UILabel setAccessibilityIdentifier:](v4->_textLabel, "setAccessibilityIdentifier:", CFSTR("TextLabel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeCollectionReusableView contentView](v4, "contentView"));
    objc_msgSend(v12, "addSubview:", v4->_textLabel);

    v13 = sub_1002A8AA0(v4);
    v14 = 15.0;
    if (v13 != 5)
      v14 = 0.0;
    -[MapsDebugCollectionHeaderFooterView setDirectionalLayoutMargins:](v4, "setDirectionalLayoutMargins:", 0.0, v14, 0.0, v14);
    if (sub_1002A8AA0(v4) != 5)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeCollectionReusableView contentView](v4, "contentView"));
      LODWORD(v16) = 1148846080;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugCollectionHeaderFooterView _maps_constraintsEqualToEdgesOfView:priority:](v4, "_maps_constraintsEqualToEdgesOfView:priority:", v15, v16));

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "allConstraints"));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v18);

    }
    v19 = v4->_textLabel;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeCollectionReusableView contentView](v4, "contentView"));
    LODWORD(v21) = 1148846080;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel _maps_constraintsEqualToEdgesOfView:priority:](v19, "_maps_constraintsEqualToEdgesOfView:priority:", v20, v21));

    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topConstraint"));
    topConstraint = v4->_topConstraint;
    v4->_topConstraint = (NSLayoutConstraint *)v23;

    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomConstraint"));
    bottomConstraint = v4->_bottomConstraint;
    v4->_bottomConstraint = (NSLayoutConstraint *)v25;

    v27 = sub_1002A8AA0(v4);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeCollectionReusableView contentView](v4, "contentView"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "heightAnchor"));
    v30 = v29;
    if (v27 == 5)
      v31 = 6.0;
    else
      v31 = 32.0;
    v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToConstant:", v31));
    collapsedHeightConstraint = v4->_collapsedHeightConstraint;
    v4->_collapsedHeightConstraint = (NSLayoutConstraint *)v32;

    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "allConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v34);

    -[MapsDebugCollectionHeaderFooterView _updateForFooter](v4, "_updateForFooter");
  }
  return v4;
}

- (void)setFooter:(BOOL)a3
{
  if (self->_footer != a3)
  {
    self->_footer = a3;
    -[MapsDebugCollectionHeaderFooterView _updateForFooter](self, "_updateForFooter");
    -[MapsDebugCollectionHeaderFooterView _updateForCollapsed](self, "_updateForCollapsed");
  }
}

- (void)setCollapsed:(BOOL)a3
{
  if (self->_collapsed != a3)
  {
    self->_collapsed = a3;
    -[MapsDebugCollectionHeaderFooterView _updateForCollapsed](self, "_updateForCollapsed");
  }
}

- (void)_updateForCollapsed
{
  double v3;
  uint64_t v4;
  NSLayoutConstraint **p_collapsedHeightConstraint;

  if (self->_collapsed)
  {
    -[NSLayoutConstraint setActive:](self->_topConstraint, "setActive:", 0);
    -[NSLayoutConstraint setActive:](self->_bottomConstraint, "setActive:", 0);
    v3 = 0.0;
    if (!self->_footer)
    {
      v4 = sub_1002A8AA0(self);
      v3 = 32.0;
      if (v4 == 5)
        v3 = 6.0;
    }
    p_collapsedHeightConstraint = &self->_collapsedHeightConstraint;
    -[NSLayoutConstraint setConstant:](*p_collapsedHeightConstraint, "setConstant:", v3);
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
  v5.super_class = (Class)MapsDebugCollectionHeaderFooterView;
  -[MapsDebugCollectionHeaderFooterView setHidden:](&v5, "setHidden:");
  -[MapsDebugCollectionHeaderFooterView setCollapsed:](self, "setCollapsed:", v3);
}

- (void)_updateForFooter
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  UILabel **p_textLabel;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = sub_1002A8AA0(self);
  if (-[MapsDebugCollectionHeaderFooterView isFooter](self, "isFooter"))
  {
    if (v3 == 5)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 15.0));
      v5 = 3.0;
      v6 = 8.0;
    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleFootnote));
      v5 = 6.0;
      v6 = 16.0;
    }
    p_textLabel = &self->_textLabel;
    -[UILabel setFont:](self->_textLabel, "setFont:", v4);

    v8 = objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
  }
  else
  {
    if (v3 == 5)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0));
      v5 = 8.0;
      v6 = 5.0;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:weight:](UIFont, "_preferredFontForTextStyle:weight:", UIFontTextStyleSubheadline, UIFontWeightSemibold));
      v5 = 16.0;
      v6 = 10.0;
    }
    p_textLabel = &self->_textLabel;
    -[UILabel setFont:](self->_textLabel, "setFont:", v9);

    v8 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  }
  v10 = (void *)v8;
  -[UILabel setTextColor:](*p_textLabel, "setTextColor:", v8);

  -[NSLayoutConstraint setConstant:](self->_topConstraint, "setConstant:", v5);
  -[NSLayoutConstraint setConstant:](self->_bottomConstraint, "setConstant:", v6);
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
