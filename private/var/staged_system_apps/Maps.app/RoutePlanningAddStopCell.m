@implementation RoutePlanningAddStopCell

- (RoutePlanningAddStopCell)init
{
  RoutePlanningAddStopCell *v2;
  void *v3;
  UIView *v4;
  void *v5;
  UIImageView *v6;
  UIImageView *iconView;
  void *v8;
  void *v9;
  void *v10;
  UILabel *v11;
  UILabel *titleLabel;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  NSLayoutConstraint *imageContainerViewWidthConstraint;
  void *v23;
  uint64_t v24;
  NSLayoutConstraint *iconViewWidthConstraint;
  void *v26;
  uint64_t v27;
  NSLayoutConstraint *iconViewHeightConstraint;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  UIView *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _QWORD v65[4];
  RoutePlanningAddStopCell *v66;
  objc_super v67;
  _QWORD v68[12];

  v67.receiver = self;
  v67.super_class = (Class)RoutePlanningAddStopCell;
  v2 = -[RoutePlanningAddStopCell initWithStyle:reuseIdentifier:](&v67, "initWithStyle:reuseIdentifier:", 0, 0);
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor"));
    -[RoutePlanningAddStopCell setBackgroundColor:](v2, "setBackgroundColor:", v3);

    -[RoutePlanningAddStopCell setAccessibilityIdentifier:](v2, "setAccessibilityIdentifier:", CFSTR("RoutePlanningAddStopCell"));
    v4 = objc_opt_new(UIView);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningAddStopCell contentView](v2, "contentView"));
    objc_msgSend(v5, "addSubview:", v4);

    v6 = objc_opt_new(UIImageView);
    iconView = v2->_iconView;
    v2->_iconView = v6;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v2->_iconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v2->_iconView, "setContentMode:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningAddStopCell traitCollection](v2, "traitCollection"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontWithTextStyle:weight:compatibleWithTraitCollection:](UIFont, "_maps_fontWithTextStyle:weight:compatibleWithTraitCollection:", UIFontTextStyleTitle2, v8, UIFontWeightBold));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v9));
    -[UIImageView setPreferredSymbolConfiguration:](v2->_iconView, "setPreferredSymbolConfiguration:", v10);

    -[UIImageView setAccessibilityIdentifier:](v2->_iconView, "setAccessibilityIdentifier:", CFSTR("RoutePlanningAddStopCellIconView"));
    -[UIView addSubview:](v4, "addSubview:", v2->_iconView);
    v11 = objc_opt_new(UILabel);
    titleLabel = v2->_titleLabel;
    v2->_titleLabel = v11;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v2->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAccessibilityIdentifier:](v2->_titleLabel, "setAccessibilityIdentifier:", CFSTR("RoutePlanningAddStopCellTitleLabel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("[RoutePlanning] Add Stop"), CFSTR("localized string not found"), 0));
    -[UILabel setText:](v2->_titleLabel, "setText:", v14);

    -[RoutePlanningAddStopCell _updateFonts](v2, "_updateFonts");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningAddStopCell contentView](v2, "contentView"));
    objc_msgSend(v15, "addSubview:", v2->_titleLabel);

    if (sub_1002A8AA0(v2) == 5)
      v16 = 13.0;
    else
      v16 = 20.0;
    v17 = sub_1002A8AA0(v2);
    v18 = 14.0;
    if (v17 == 5)
      v18 = 9.0;
    v19 = v16 + v18 * 2.0;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v4, "widthAnchor"));
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToConstant:", v19));
    imageContainerViewWidthConstraint = v2->_imageContainerViewWidthConstraint;
    v2->_imageContainerViewWidthConstraint = (NSLayoutConstraint *)v21;

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v2->_iconView, "widthAnchor"));
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToConstant:", v16));
    iconViewWidthConstraint = v2->_iconViewWidthConstraint;
    v2->_iconViewWidthConstraint = (NSLayoutConstraint *)v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v2->_iconView, "heightAnchor"));
    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToConstant:", v16));
    iconViewHeightConstraint = v2->_iconViewHeightConstraint;
    v2->_iconViewHeightConstraint = (NSLayoutConstraint *)v27;

    v63 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v4, "leadingAnchor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningAddStopCell contentView](v2, "contentView"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "leadingAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:", v62));
    v68[0] = v61;
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v4, "topAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningAddStopCell contentView](v2, "contentView"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "topAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:", v58));
    v68[1] = v56;
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v4, "bottomAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningAddStopCell contentView](v2, "contentView"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "bottomAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:", v53));
    v68[2] = v52;
    v68[3] = v2->_imageContainerViewWidthConstraint;
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](v2->_iconView, "centerXAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v4, "centerXAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v50));
    v68[4] = v49;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v2->_iconView, "centerYAnchor"));
    v57 = v4;
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v4, "centerYAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v47));
    v68[5] = v46;
    v68[6] = v2->_iconViewWidthConstraint;
    v68[7] = v2->_iconViewHeightConstraint;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v2->_titleLabel, "leadingAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v4, "trailingAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v44));
    v68[8] = v43;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v2->_titleLabel, "topAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningAddStopCell contentView](v2, "contentView"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "topAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
    v68[9] = v39;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v2->_titleLabel, "bottomAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningAddStopCell contentView](v2, "contentView"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bottomAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v31));
    v68[10] = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v2->_titleLabel, "trailingAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningAddStopCell contentView](v2, "contentView"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "trailingAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:constant:", v35, -10.0));
    v68[11] = v36;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v68, 12));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v37);

    -[RoutePlanningAddStopCell _setEnabled:](v2, "_setEnabled:", 1);
    -[RoutePlanningAddStopCell _updateConstraints](v2, "_updateConstraints");
    -[RoutePlanningAddStopCell _updateIconImage](v2, "_updateIconImage");
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_10093939C;
    v65[3] = &unk_1011AC860;
    v66 = v2;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v65);

  }
  return v2;
}

- (void)setIconViewTag:(int64_t)a3
{
  -[UIImageView setTag:](self->_iconView, "setTag:", a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RoutePlanningAddStopCell;
  -[RoutePlanningAddStopCell traitCollectionDidChange:](&v13, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningAddStopCell traitCollection](self, "traitCollection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "preferredContentSizeCategory"));

  if (v5 != v7)
  {
    -[RoutePlanningAddStopCell _updateFonts](self, "_updateFonts");
    -[RoutePlanningAddStopCell _updateConstraints](self, "_updateConstraints");
  }
  objc_msgSend(v4, "displayScale");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningAddStopCell traitCollection](self, "traitCollection"));
  objc_msgSend(v10, "displayScale");
  v12 = vabdd_f64(v9, v11);

  if (v12 > 2.22044605e-16)
    -[RoutePlanningAddStopCell _updateIconImage](self, "_updateIconImage");

}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
    -[RoutePlanningAddStopCell _setEnabled:](self, "_setEnabled:");
}

- (void)_setEnabled:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  self->_enabled = a3;
  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    -[UIImageView setTintColor:](self->_iconView, "setTintColor:", v4);

    v5 = objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
    -[UIImageView setTintColor:](self->_iconView, "setTintColor:", v6);

    v5 = objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
  }
  v7 = (id)v5;
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v5);

}

- (void)_updateFonts
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningAddStopCell traitCollection](self, "traitCollection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_maps_traitCollectionWithMaximumContentSizeCategory:", UIContentSizeCategoryAccessibilityLarge));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:](UIFont, "preferredFontForTextStyle:compatibleWithTraitCollection:", UIFontTextStyleBody, v3));
  -[UILabel setFont:](self->_titleLabel, "setFont:", v4);

}

- (void)_updateConstraints
{
  void *v3;
  NSString *v4;
  NSComparisonResult v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningAddStopCell traitCollection](self, "traitCollection"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredContentSizeCategory"));
  v5 = UIContentSizeCategoryCompareToCategory(v4, UIContentSizeCategoryExtraExtraExtraLarge);

  v6 = sub_1002A8AA0(self);
  v7 = 30.0;
  if (v5 == NSOrderedAscending)
    v7 = 20.0;
  if (v6 == 5)
    v8 = 13.0;
  else
    v8 = v7;
  v9 = sub_1002A8AA0(self);
  v10 = 14.0;
  if (v9 == 5)
    v10 = 9.0;
  -[NSLayoutConstraint setConstant:](self->_imageContainerViewWidthConstraint, "setConstant:", v8 + v10 * 2.0);
  -[NSLayoutConstraint setConstant:](self->_iconViewWidthConstraint, "setConstant:", v8);
  -[NSLayoutConstraint setConstant:](self->_iconViewHeightConstraint, "setConstant:", v8);
}

- (void)_updateIconImage
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes addStopStyleAttributes](GEOFeatureStyleAttributes, "addStopStyleAttributes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningAddStopCell traitCollection](self, "traitCollection"));
  objc_msgSend(v3, "displayScale");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKIconManager imageForStyle:size:forScale:format:](MKIconManager, "imageForStyle:size:forScale:format:", v5, 0, 0));
  -[UIImageView setImage:](self->_iconView, "setImage:", v4);

}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_iconViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_imageContainerViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end
