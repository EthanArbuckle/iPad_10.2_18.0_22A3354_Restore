@implementation UGCUserInformationCell

- (UGCUserInformationCell)initWithEmphasis:(int64_t)a3
{
  UGCUserInformationCell *v4;
  UGCUserInformationCell *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UGCUserInformationCell;
  v4 = -[UGCPOIEnrichmentEditorCell initWithFrame:](&v10, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v5 = v4;
  if (v4)
  {
    v6 = (objc_class *)objc_opt_class(v4);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[UGCUserInformationCell setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", v8);

    v5->_emphasis = a3;
    -[UGCUserInformationCell _setupSubviews](v5, "_setupSubviews");
    -[UGCUserInformationCell _setupConstraints](v5, "_setupConstraints");
  }
  return v5;
}

- (void)_setupSubviews
{
  id v3;
  double y;
  double width;
  double height;
  UIImageView *v7;
  UIImageView *userImageView;
  UILabel *v9;
  UILabel *userNameLabel;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  UILabel *v16;
  UILabel *userInfoLabel;
  void *v18;
  id v19;

  -[UGCUserInformationCell setPreservesSuperviewLayoutMargins:](self, "setPreservesSuperviewLayoutMargins:", 1);
  v3 = objc_alloc((Class)UIImageView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = (UIImageView *)objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  userImageView = self->_userImageView;
  self->_userImageView = v7;

  -[UIImageView setAccessibilityIdentifier:](self->_userImageView, "setAccessibilityIdentifier:", CFSTR("UserImageView"));
  -[UGCUserInformationCell addSubview:](self, "addSubview:", self->_userImageView);
  v9 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  userNameLabel = self->_userNameLabel;
  self->_userNameLabel = v9;

  if ((MapsFeature_IsEnabled_ARPCommunityID(-[UILabel setNumberOfLines:](self->_userNameLabel, "setNumberOfLines:", 0)) & 1) != 0)
    v11 = objc_claimAutoreleasedReturnValue(+[UGCFontManager userInfoPrimaryLabelFontCommunityID](UGCFontManager, "userInfoPrimaryLabelFontCommunityID"));
  else
    v11 = objc_claimAutoreleasedReturnValue(+[UGCFontManager userInfoPrimaryLabelFont](UGCFontManager, "userInfoPrimaryLabelFont"));
  v12 = (void *)v11;
  -[UILabel setFont:](self->_userNameLabel, "setFont:", v11);

  if ((MapsFeature_IsEnabled_ARPCommunityID(v13) & 1) != 0)
    v14 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  else
    v14 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v15 = (void *)v14;
  -[UILabel setTextColor:](self->_userNameLabel, "setTextColor:", v14);

  -[UILabel setAccessibilityIdentifier:](self->_userNameLabel, "setAccessibilityIdentifier:", CFSTR("UserNameLabel"));
  -[UILabel setAdjustsFontForContentSizeCategory:](self->_userNameLabel, "setAdjustsFontForContentSizeCategory:", 1);
  -[UGCUserInformationCell addSubview:](self, "addSubview:", self->_userNameLabel);
  v16 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  userInfoLabel = self->_userInfoLabel;
  self->_userInfoLabel = v16;

  -[UILabel setNumberOfLines:](self->_userInfoLabel, "setNumberOfLines:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_userInfoLabel, "setTextColor:", v18);

  -[UILabel setAccessibilityIdentifier:](self->_userInfoLabel, "setAccessibilityIdentifier:", CFSTR("UserInfoLabel"));
  -[UGCUserInformationCell addSubview:](self, "addSubview:", self->_userInfoLabel);
  if (self->_emphasis == 1)
  {
    v19 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_didTapLegalAttribution");
    -[UGCUserInformationCell addGestureRecognizer:](self, "addGestureRecognizer:", v19);
    MURegisterForButtonShapeEnablementChanges(self, "_updateSecondaryLabel");

  }
  -[UGCUserInformationCell updateLayoutMarginsForIsInsetGrouped:](self, "updateLayoutMarginsForIsInsetGrouped:", 0);
}

- (void)_setupConstraints
{
  id v3;
  UILabel *userInfoLabel;
  void *v5;
  id v6;
  double v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[2];
  id v20;
  id v21;
  _QWORD v22[2];

  v3 = objc_msgSend(objc_alloc((Class)MUCompositionalStackLayoutGroup), "initWithAxis:", 1);
  userInfoLabel = self->_userInfoLabel;
  v22[0] = self->_userNameLabel;
  v22[1] = userInfoLabel;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 2));
  objc_msgSend(v3, "setArrangedLayoutItems:", v5);

  objc_msgSend(v3, "setSpacing:", 1.0);
  v6 = objc_msgSend(objc_alloc((Class)MUCompositionalStackLayoutGroup), "initWithAxis:", 0);
  objc_msgSend(v6, "setAlignment:", 2);
  objc_msgSend(v6, "setAlignmentBoundsContent:", 1);
  LODWORD(v7) = 1112276992;
  objc_msgSend(v6, "setAlignmentFittingSizePriority:", v7);
  v8 = objc_msgSend(v6, "setSpacing:", 16.0);
  if (self->_emphasis == 1 && MapsFeature_IsEnabled_ARPCommunityID(v8))
  {
    v21 = v3;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
    objc_msgSend(v6, "setArrangedLayoutItems:", v9);

    v10 = objc_alloc((Class)MUCompositionalStackLayout);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UGCUserInformationCell layoutMarginsGuide](self, "layoutMarginsGuide"));
    v12 = objc_msgSend(v10, "initWithContainer:group:", v11, v6);

    v20 = v12;
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
    +[NSLayoutConstraint _mapsui_activateLayouts:](NSLayoutConstraint, "_mapsui_activateLayouts:", v13);
  }
  else
  {
    v12 = objc_msgSend(objc_alloc((Class)MUSizeLayout), "initWithItem:size:", self->_userImageView, 34.0, 34.0);
    v19[0] = self->_userImageView;
    v19[1] = v3;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2));
    objc_msgSend(v6, "setArrangedLayoutItems:", v14);

    v15 = objc_alloc((Class)MUCompositionalStackLayout);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UGCUserInformationCell layoutMarginsGuide](self, "layoutMarginsGuide"));
    v13 = objc_msgSend(v15, "initWithContainer:group:", v16, v6);

    v18[0] = v12;
    v18[1] = v13;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));
    +[NSLayoutConstraint _mapsui_activateLayouts:](NSLayoutConstraint, "_mapsui_activateLayouts:", v17);

  }
}

- (void)setViewModel:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UGCUserInformationViewModel isEqual:](self->_viewModel, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[UGCUserInformationCell _updateAppearance](self, "_updateAppearance");
  }

}

- (void)_updateAppearance
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCUserInformationViewModel userIcon](self->_viewModel, "userIcon"));
  -[UIImageView setImage:](self->_userImageView, "setImage:", v3);

  -[UGCUserInformationCell _updatePrimaryLabel](self, "_updatePrimaryLabel");
  -[UGCUserInformationCell _updateSecondaryLabel](self, "_updateSecondaryLabel");
}

- (void)_updatePrimaryLabel
{
  int64_t emphasis;
  void *v4;
  void *v5;
  id v6;

  emphasis = self->_emphasis;
  if (emphasis == 1)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[UGCUserInformationViewModel userEmail](self->_viewModel, "userEmail"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UGCUserInformationViewModel userCurrentLocation](self->_viewModel, "userCurrentLocation"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCUserInformationCell _createPrimaryLabelWithEmail:location:](self, "_createPrimaryLabelWithEmail:location:", v6, v4));
    -[UILabel setText:](self->_userNameLabel, "setText:", v5);

  }
  else
  {
    if (emphasis)
      return;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[UGCUserInformationViewModel userName](self->_viewModel, "userName"));
    -[UILabel setText:](self->_userNameLabel, "setText:");
  }

}

- (void)_updateSecondaryLabel
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  int64_t emphasis;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCUserInformationCell secondaryFont](self, "secondaryFont"));
  -[UILabel setFont:](self->_userInfoLabel, "setFont:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UGCUserInformationCell secondaryFont](self, "secondaryFont"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCUserInformationCell secondaryColor](self, "secondaryColor"));
  v6 = objc_alloc_init((Class)NSMutableDictionary);
  v7 = v6;
  if (v4)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, NSFontAttributeName);
  if (-[UGCUserInformationCell wantsButtonShapes](self, "wantsButtonShapes") && UIAccessibilityButtonShapesEnabled())
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &off_10126EB60, NSUnderlineStyleAttributeName);
  if (v5)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, NSForegroundColorAttributeName);
  emphasis = self->_emphasis;
  if (emphasis == 1)
  {
    v14 = objc_claimAutoreleasedReturnValue(-[UGCUserInformationCell _inlineRatingsDisclosureStringWithFont:attributes:](self, "_inlineRatingsDisclosureStringWithFont:attributes:", v4, v7));
  }
  else if (emphasis)
  {
    v14 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UGCUserInformationViewModel userEmail](self->_viewModel, "userEmail"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UGCUserInformationViewModel userCurrentLocation](self->_viewModel, "userCurrentLocation"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UGCUserInformationCell _createUserInfoLabelWithEmail:location:](self, "_createUserInfoLabelWithEmail:location:", v9, v10));

    if (objc_msgSend(v11, "length"))
    {
      v12 = objc_alloc((Class)NSAttributedString);
      v13 = objc_msgSend(v7, "copy");
      v15 = objc_msgSend(v12, "initWithString:attributes:", v11, v13);

    }
    else
    {
      v15 = 0;
    }

    v14 = (uint64_t)v15;
  }
  v16 = (id)v14;
  -[UILabel setAttributedText:](self->_userInfoLabel, "setAttributedText:", v14);

}

- (void)_didTapLegalAttribution
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "userInformationCellDidSelectLegalAttribution:", self);

}

- (void)setPrimaryFont:(id)a3
{
  -[UILabel setFont:](self->_userNameLabel, "setFont:", a3);
}

- (UIFont)primaryFont
{
  return -[UILabel font](self->_userNameLabel, "font");
}

- (void)setSecondaryFont:(id)a3
{
  UIFont *v5;
  UIFont *v6;

  v5 = (UIFont *)a3;
  if (self->_secondaryFont != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_secondaryFont, a3);
    -[UGCUserInformationCell _updateSecondaryLabel](self, "_updateSecondaryLabel");
    v5 = v6;
  }

}

- (UIFont)secondaryFont
{
  UIFont *secondaryFont;

  secondaryFont = self->_secondaryFont;
  if (secondaryFont)
    return secondaryFont;
  else
    return (UIFont *)(id)objc_claimAutoreleasedReturnValue(+[UGCFontManager userInfoSecondaryLabelFont](UGCFontManager, "userInfoSecondaryLabelFont"));
}

- (UIColor)primaryColor
{
  return -[UILabel textColor](self->_userNameLabel, "textColor");
}

- (void)setPrimaryColor:(id)a3
{
  -[UILabel setTextColor:](self->_userNameLabel, "setTextColor:", a3);
}

- (UIColor)secondaryColor
{
  UIColor *secondaryColor;

  secondaryColor = self->_secondaryColor;
  if (secondaryColor)
    return secondaryColor;
  else
    return (UIColor *)(id)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
}

- (void)setSecondaryColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_secondaryColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_secondaryColor, a3);
    -[UGCUserInformationCell _updateSecondaryLabel](self, "_updateSecondaryLabel");
    v5 = v6;
  }

}

- (void)setWantsButtonShapes:(BOOL)a3
{
  if (self->_wantsButtonShapes != a3)
  {
    self->_wantsButtonShapes = a3;
    -[UGCUserInformationCell _updateSecondaryLabel](self, "_updateSecondaryLabel");
  }
}

- (id)_createUserInfoLabelWithEmail:(id)a3 location:(id)a4
{
  id v5;
  id v6;
  NSMutableArray *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_new(NSMutableArray);
  if (objc_msgSend(v6, "length"))
    -[NSMutableArray addObject:](v7, "addObject:", v6);
  if (objc_msgSend(v5, "length"))
    -[NSMutableArray addObject:](v7, "addObject:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR(" • "), CFSTR("localized string not found"), 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v7, "componentsJoinedByString:", v9));

  return v10;
}

- (id)_createPrimaryLabelWithEmail:(id)a3 location:(id)a4
{
  id v5;
  id v6;
  NSMutableArray *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_new(NSMutableArray);
  if (objc_msgSend(v5, "length"))
    -[NSMutableArray addObject:](v7, "addObject:", v5);
  if (objc_msgSend(v6, "length"))
    -[NSMutableArray addObject:](v7, "addObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR(" • "), CFSTR("localized string not found"), 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v7, "componentsJoinedByString:", v9));

  return v10;
}

- (id)_inlineRatingsDisclosureStringWithFont:(id)a3 attributes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSAttributedString *v21;
  void *v23;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UGCUserInformationViewModel legalDisclosureString](self->_viewModel, "legalDisclosureString"));
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("%@ %@ [Legal attribution badge format]"), CFSTR("localized string not found"), 0));

    v11 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v23, v7);
    v12 = objc_alloc((Class)NSAttributedString);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UGCUserInformationViewModel legalDisclosureString](self->_viewModel, "legalDisclosureString"));
    v14 = objc_msgSend(v12, "initWithString:attributes:", v13, v7);

    v15 = objc_alloc_init((Class)NSTextAttachment);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v6, 1));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("chevron.forward")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "imageWithConfiguration:", v16));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "imageWithRenderingMode:", 2));
    objc_msgSend(v15, "setImage:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithAttachment:](NSAttributedString, "attributedStringWithAttachment:", v15));
    v21 = (NSAttributedString *)objc_claimAutoreleasedReturnValue(+[NSAttributedString localizedAttributedStringWithFormat:options:](NSAttributedString, "localizedAttributedStringWithFormat:options:", v11, 2, v14, v20));

  }
  else
  {
    v21 = objc_opt_new(NSAttributedString);
  }

  return v21;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UGCUserInformationCell;
  v4 = a3;
  -[UGCUserInformationCell traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCUserInformationCell traitCollection](self, "traitCollection", v9.receiver, v9.super_class));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));

  v8 = sub_1002A8950(v6, v7);
  if (v8)
    -[UGCUserInformationCell _updateFonts](self, "_updateFonts");
}

- (UGCUserInformationCellDelegate)delegate
{
  return (UGCUserInformationCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)emphasis
{
  return self->_emphasis;
}

- (UGCUserInformationViewModel)viewModel
{
  return self->_viewModel;
}

- (BOOL)wantsButtonShapes
{
  return self->_wantsButtonShapes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_secondaryColor, 0);
  objc_storeStrong((id *)&self->_secondaryFont, 0);
  objc_storeStrong((id *)&self->_userInfoLabel, 0);
  objc_storeStrong((id *)&self->_userNameLabel, 0);
  objc_storeStrong((id *)&self->_userImageView, 0);
}

- (void)setOverallFont:(id)a3 overallColor:(id)a4
{
  id v6;
  id v7;

  v7 = a4;
  v6 = a3;
  -[UGCUserInformationCell setPrimaryFont:](self, "setPrimaryFont:", v6);
  -[UGCUserInformationCell setSecondaryFont:](self, "setSecondaryFont:", v6);

  -[UGCUserInformationCell setPrimaryColor:](self, "setPrimaryColor:", v7);
  -[UGCUserInformationCell setSecondaryColor:](self, "setSecondaryColor:", v7);

}

- (void)updateLayoutMarginsForIsInsetGrouped:(BOOL)a3
{
  double v4;
  double v5;
  double v6;
  uint64_t IsEnabled_ARPCommunityID;

  if (a3)
  {
    v4 = 0.0;
    v5 = 16.0;
    v6 = 16.0;
  }
  else
  {
    IsEnabled_ARPCommunityID = MapsFeature_IsEnabled_ARPCommunityID(self);
    if ((_DWORD)IsEnabled_ARPCommunityID)
      v5 = 0.0;
    else
      v5 = 12.0;
    if (MapsFeature_IsEnabled_ARPCommunityID(IsEnabled_ARPCommunityID))
      v4 = 32.0;
    else
      v4 = 0.0;
    v6 = 4.0;
  }
  -[UGCUserInformationCell setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:", v5, v4, v6, 0.0);
}

@end
