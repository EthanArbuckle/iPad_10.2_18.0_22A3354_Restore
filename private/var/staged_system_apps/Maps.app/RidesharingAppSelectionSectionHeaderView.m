@implementation RidesharingAppSelectionSectionHeaderView

- (RidesharingAppSelectionSectionHeaderView)initWithFrame:(CGRect)a3
{
  RidesharingAppSelectionSectionHeaderView *v3;
  RidesharingAppSelectionSectionHeaderView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RidesharingAppSelectionSectionHeaderView;
  v3 = -[MapsThemeCollectionReusableView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[RidesharingAppSelectionSectionHeaderView _setupViews](v3, "_setupViews");
    -[RidesharingAppSelectionSectionHeaderView _setupConstraints](v4, "_setupConstraints");
    -[RidesharingAppSelectionSectionHeaderView _updateContentSizeCategoryDependentFontsAndConstraints](v4, "_updateContentSizeCategoryDependentFontsAndConstraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, "_updateContentSizeCategoryDependentFontsAndConstraints", UIContentSizeCategoryDidChangeNotification, 0);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)RidesharingAppSelectionSectionHeaderView;
  -[RidesharingAppSelectionSectionHeaderView dealloc](&v4, "dealloc");
}

- (void)_setupViews
{
  UILabel *v3;
  UILabel *majorLabel;
  void *v5;
  void *v6;

  v3 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  majorLabel = self->_majorLabel;
  self->_majorLabel = v3;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_majorLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_majorLabel, "setTextColor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeCollectionReusableView contentView](self, "contentView"));
  objc_msgSend(v6, "addSubview:", self->_majorLabel);

  -[MapsThemeCollectionReusableView updateTheme](self, "updateTheme");
}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  NSLayoutConstraint *v5;
  NSLayoutConstraint *heightConstraint;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSLayoutConstraint *v12;
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
  _QWORD v23[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeCollectionReusableView contentView](self, "contentView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "heightAnchor"));
  v5 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToConstant:", 0.0));
  heightConstraint = self->_heightConstraint;
  self->_heightConstraint = v5;

  LODWORD(v7) = 1148829696;
  -[NSLayoutConstraint setPriority:](self->_heightConstraint, "setPriority:", v7);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_majorLabel, "leadingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeCollectionReusableView contentView](self, "contentView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v20, 16.0));
  v23[0] = v19;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_majorLabel, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeCollectionReusableView contentView](self, "contentView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintLessThanOrEqualToAnchor:constant:", v10, -16.0));
  v12 = self->_heightConstraint;
  v23[1] = v11;
  v23[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_majorLabel, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeCollectionReusableView contentView](self, "contentView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
  v23[3] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 4));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v17));

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v18);
}

- (void)_updateContentSizeCategoryDependentFontsAndConstraints
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", UIFontTextStyleCaption1, 2));
  -[UILabel setFont:](self->_majorLabel, "setFont:", v3);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_majorLabel, "font"));
  objc_msgSend(v4, "_mapkit_scaledValueForValue:", 30.0);
  -[NSLayoutConstraint setConstant:](self->_heightConstraint, "setConstant:");

}

- (void)setMajorString:(id)a3
{
  -[UILabel setText:](self->_majorLabel, "setText:", a3);
}

- (NSString)majorString
{
  return -[UILabel text](self->_majorLabel, "text");
}

- (UILabel)majorLabel
{
  return self->_majorLabel;
}

- (void)setMajorLabel:(id)a3
{
  objc_storeStrong((id *)&self->_majorLabel, a3);
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_majorLabel, 0);
}

@end
