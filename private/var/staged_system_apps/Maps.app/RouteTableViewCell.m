@implementation RouteTableViewCell

+ (double)estimatedHeight
{
  void *v2;
  double v3;
  double v4;
  double result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v2, "nativeScale");
  v4 = v3;

  result = -1.0 / v4 + 62.0;
  if (v4 == 0.0)
    return 61.5;
  return result;
}

- (RouteTableViewCell)init
{
  id v3;
  void *v4;
  RouteTableViewCell *v5;

  v3 = objc_msgSend((id)objc_opt_class(self), "reuseIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = -[RouteTableViewCell initWithStyle:reuseIdentifier:](self, "initWithStyle:reuseIdentifier:", 0, v4);

  return v5;
}

- (RouteTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  RouteTableViewCell *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  RouteTableViewCell *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)RouteTableViewCell;
  v4 = -[RoutePickingCell initWithStyle:reuseIdentifier:](&v11, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, "_contentSizeCategoryDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v7 = MNLocaleDidChangeNotification();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    objc_msgSend(v6, "addObserver:selector:name:object:", v4, "_localeDidChange:", v8, 0);

    v9 = v4;
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
  v4.super_class = (Class)RouteTableViewCell;
  -[RouteTableViewCell dealloc](&v4, "dealloc");
}

- (void)_createSubviews
{
  _MKUILabel *v3;
  _MKUILabel *primaryLabel;
  void *v5;
  void *v6;
  _MKUILabel *v7;
  _MKUILabel *secondaryLabel;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)RouteTableViewCell;
  -[RoutePickingCell _createSubviews](&v12, "_createSubviews");
  v3 = (_MKUILabel *)objc_alloc_init((Class)_MKUILabel);
  primaryLabel = self->_primaryLabel;
  self->_primaryLabel = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", UIFontTextStyleBody, 0));
  -[_MKUILabel setFont:](self->_primaryLabel, "setFont:", v5);

  -[_MKUILabel setNumberOfLines:](self->_primaryLabel, "setNumberOfLines:", 0);
  -[_MKUILabel setTextAlignment:](self->_primaryLabel, "setTextAlignment:", 4);
  -[_MKUILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_primaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteTableViewCell contentView](self, "contentView"));
  objc_msgSend(v6, "addSubview:", self->_primaryLabel);

  v7 = (_MKUILabel *)objc_alloc_init((Class)_MKUILabel);
  secondaryLabel = self->_secondaryLabel;
  self->_secondaryLabel = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", UIFontTextStyleFootnote, 0));
  -[_MKUILabel setFont:](self->_secondaryLabel, "setFont:", v9);

  -[_MKUILabel setNumberOfLines:](self->_secondaryLabel, "setNumberOfLines:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  -[_MKUILabel setTextColor:](self->_secondaryLabel, "setTextColor:", v10);

  -[_MKUILabel setTextAlignment:](self->_secondaryLabel, "setTextAlignment:", 4);
  -[_MKUILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_secondaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RouteTableViewCell contentView](self, "contentView"));
  objc_msgSend(v11, "addSubview:", self->_secondaryLabel);

}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RouteTableViewCell;
  -[RouteTableViewCell didMoveToWindow](&v3, "didMoveToWindow");
  -[RouteTableViewCell _updateConstraintValues](self, "_updateConstraintValues");
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (id)_autolayoutConstraints
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *leftPaddingConstraint;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSLayoutConstraint *v15;
  NSLayoutConstraint *secondaryLabelToContentViewConstraint;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSLayoutConstraint *v22;
  NSLayoutConstraint *primaryToTopViewConstraint;
  void *v24;
  void *v25;
  NSLayoutConstraint *v26;
  NSLayoutConstraint *secondaryToPrimaryConstraint;
  void *v28;
  void *v29;
  void *v30;
  NSLayoutConstraint *v31;
  NSLayoutConstraint *secondaryLabelToBottomConstraint;
  NSLayoutConstraint *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  RouteTableViewCellButtonConstraintsController *v39;
  RouteTableViewCellButtonConstraintsController *buttonConstraintsController;
  void *v41;
  objc_super v43;
  _QWORD v44[4];

  v43.receiver = self;
  v43.super_class = (Class)RouteTableViewCell;
  v3 = -[RoutePickingCell _autolayoutConstraints](&v43, "_autolayoutConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel leadingAnchor](self->_primaryLabel, "leadingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteTableViewCell contentView](self, "contentView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "safeAreaLayoutGuide"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
  v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v8));
  leftPaddingConstraint = self->_leftPaddingConstraint;
  self->_leftPaddingConstraint = v9;

  objc_msgSend(v4, "addObject:", self->_leftPaddingConstraint);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RouteTableViewCell contentView](self, "contentView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "safeAreaLayoutGuide"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel trailingAnchor](self->_secondaryLabel, "trailingAnchor"));
  v15 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
  secondaryLabelToContentViewConstraint = self->_secondaryLabelToContentViewConstraint;
  self->_secondaryLabelToContentViewConstraint = v15;

  objc_msgSend(v4, "addObject:", self->_secondaryLabelToContentViewConstraint);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel leadingAnchor](self->_secondaryLabel, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel leadingAnchor](self->_primaryLabel, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));
  objc_msgSend(v4, "addObject:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel firstBaselineAnchor](self->_primaryLabel, "firstBaselineAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RouteTableViewCell _anchorFromWhichToPositionPrimaryLabelFirstBaseline](self, "_anchorFromWhichToPositionPrimaryLabelFirstBaseline"));
  v22 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v21));
  primaryToTopViewConstraint = self->_primaryToTopViewConstraint;
  self->_primaryToTopViewConstraint = v22;

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel firstBaselineAnchor](self->_secondaryLabel, "firstBaselineAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel lastBaselineAnchor](self->_primaryLabel, "lastBaselineAnchor"));
  v26 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v25));
  secondaryToPrimaryConstraint = self->_secondaryToPrimaryConstraint;
  self->_secondaryToPrimaryConstraint = v26;

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[RouteTableViewCell contentView](self, "contentView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "bottomAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel lastBaselineAnchor](self->_secondaryLabel, "lastBaselineAnchor"));
  v31 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v30));
  secondaryLabelToBottomConstraint = self->_secondaryLabelToBottomConstraint;
  self->_secondaryLabelToBottomConstraint = v31;

  v33 = self->_secondaryToPrimaryConstraint;
  v44[0] = self->_primaryToTopViewConstraint;
  v44[1] = v33;
  v44[2] = self->_secondaryLabelToBottomConstraint;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel lastBaselineAnchor](self->_primaryLabel, "lastBaselineAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[RouteTableViewCell contentView](self, "contentView"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "bottomAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintLessThanOrEqualToAnchor:constant:", v36, -18.0));
  v44[3] = v37;
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v44, 4));
  objc_msgSend(v4, "addObjectsFromArray:", v38);

  v39 = (RouteTableViewCellButtonConstraintsController *)objc_claimAutoreleasedReturnValue(-[RouteTableViewCell _buttonConstraintsController](self, "_buttonConstraintsController"));
  buttonConstraintsController = self->_buttonConstraintsController;
  self->_buttonConstraintsController = v39;

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[RouteTableViewCellButtonConstraintsController initialConstraints](self->_buttonConstraintsController, "initialConstraints"));
  objc_msgSend(v4, "addObjectsFromArray:", v41);

  -[RouteTableViewCell _updateConstraintValues](self, "_updateConstraintValues");
  return v4;
}

- (void)_updateConstraintValues
{
  void *v3;
  uint64_t v4;
  double v5;
  void *v6;
  uint64_t v7;
  double v8;
  RouteTableViewCell *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel font](self->_primaryLabel, "font"));
  -[RouteTableViewCell _distanceToPositionPrimaryLabelFirstBaseline](self, "_distanceToPositionPrimaryLabelFirstBaseline");
  objc_msgSend(v3, "_scaledValueForValue:");
  -[NSLayoutConstraint setConstant:](self->_primaryToTopViewConstraint, "setConstant:", UIRoundToViewScale(self, v4, v5));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel font](self->_secondaryLabel, "font"));
  objc_msgSend(v6, "_scaledValueForValue:", 18.0);
  -[NSLayoutConstraint setConstant:](self->_secondaryToPrimaryConstraint, "setConstant:", UIRoundToViewScale(self, v7, v8));

  v9 = self;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RouteTableViewCell window](v9, "window"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "screen"));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RouteTableViewCell window](v9, "window"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "screen"));
    objc_msgSend(v13, "nativeScale");
    v15 = v14;

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v12, "nativeScale");
    v15 = v16;
  }

  v18 = 17.0;
  if (v15 > 0.0)
    v18 = -1.0 / v15 + 18.0;
  -[NSLayoutConstraint setConstant:](v9->_secondaryLabelToBottomConstraint, "setConstant:", UIRoundToViewScale(v9, v17, v18));
}

- (NSLayoutAnchor)_anchorFromWhichToPositionPrimaryLabelFirstBaseline
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RouteTableViewCell contentView](self, "contentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "topAnchor"));

  return (NSLayoutAnchor *)v3;
}

- (double)_distanceToPositionPrimaryLabelFirstBaseline
{
  return 26.0;
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  -[RouteTableViewCell _updateFonts](self, "_updateFonts", a3);
  -[RouteTableViewCell _updateConstraintValues](self, "_updateConstraintValues");
  -[RouteTableViewCell _updateCellLabels](self, "_updateCellLabels");
}

- (void)_updateFonts
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", UIFontTextStyleBody, 0));
  -[_MKUILabel setFont:](self->_primaryLabel, "setFont:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", UIFontTextStyleFootnote, 0));
  -[_MKUILabel setFont:](self->_secondaryLabel, "setFont:", v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[RouteTableViewCell _disclosureButtonFont](self, "_disclosureButtonFont"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLargerHitTargetButton titleLabel](self->_disclosureButton, "titleLabel"));
  objc_msgSend(v5, "setFont:", v6);

}

- (void)setRoute:(id)a3
{
  GEOComposedRoute *v5;
  GEOComposedRoute *v6;

  v5 = (GEOComposedRoute *)a3;
  if (self->_route != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_route, a3);
    -[RouteTableViewCell _updateCellLabels](self, "_updateCellLabels");
    v5 = v6;
  }

}

- (void)_updateCellLabels
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  uint64_t v7;
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
  NSAttributedStringKey v19;
  void *v20;
  NSAttributedStringKey v21;
  void *v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteTableViewCell route](self, "route"));

  if (v3)
  {
    v4 = -[RouteTableViewCell useRoutePreviewDescription](self, "useRoutePreviewDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteTableViewCell route](self, "route"));
    v6 = v5;
    if ((v4 & 1) != 0)
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "previewDurationString"));
    else
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pickingDurationString"));
    v8 = (void *)v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteTableViewCell route](self, "route"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "planningDescriptionString"));

    if (v8)
    {
      v21 = NSFontAttributeName;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel font](self->_primaryLabel, "font"));
      v22 = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString _mapkit_attributedStringForComposedString:defaultAttributes:](NSAttributedString, "_mapkit_attributedStringForComposedString:defaultAttributes:", v8, v12));
      -[_MKUILabel setAttributedText:](self->_primaryLabel, "setAttributedText:", v13);

      if (v10)
      {
LABEL_7:
        v19 = NSFontAttributeName;
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel font](self->_secondaryLabel, "font"));
        v20 = v14;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString _mapkit_attributedStringForComposedString:defaultAttributes:](NSAttributedString, "_mapkit_attributedStringForComposedString:defaultAttributes:", v10, v15));
        -[_MKUILabel setAttributedText:](self->_secondaryLabel, "setAttributedText:", v16);

LABEL_10:
        return;
      }
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[RouteTableViewCell route](self, "route"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "clientPickingDuration"));
      -[_MKUILabel setText:](self->_primaryLabel, "setText:", v18);

      if (v10)
        goto LABEL_7;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RouteTableViewCell route](self, "route"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "clientPickingDescription"));
    -[_MKUILabel setText:](self->_secondaryLabel, "setText:", v15);
    goto LABEL_10;
  }
}

- (void)setUseRoutePreviewDescription:(BOOL)a3
{
  if (self->_useRoutePreviewDescription != a3)
  {
    self->_useRoutePreviewDescription = a3;
    -[RouteTableViewCell _updateCellLabels](self, "_updateCellLabels");
  }
}

- (void)_setShouldHaveFullLengthBottomSeparator:(BOOL)a3
{
  _BOOL8 maps_shouldHaveFullLengthBottomSeparator;
  objc_super v4;

  maps_shouldHaveFullLengthBottomSeparator = self->__maps_shouldHaveFullLengthBottomSeparator;
  v4.receiver = self;
  v4.super_class = (Class)RouteTableViewCell;
  -[RouteTableViewCell _setShouldHaveFullLengthBottomSeparator:](&v4, "_setShouldHaveFullLengthBottomSeparator:", maps_shouldHaveFullLengthBottomSeparator);
}

- (void)set_maps_shouldHaveFullLengthBottomSeparator:(BOOL)a3
{
  if (self->__maps_shouldHaveFullLengthBottomSeparator != a3)
  {
    self->__maps_shouldHaveFullLengthBottomSeparator = a3;
    -[RouteTableViewCell _setShouldHaveFullLengthBottomSeparator:](self, "_setShouldHaveFullLengthBottomSeparator:");
  }
}

- (void)setSeparatorInset:(UIEdgeInsets)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RouteTableViewCell;
  -[RouteTableViewCell setSeparatorInset:](&v4, "setSeparatorInset:", a3.top, a3.left, a3.bottom, a3.right);
  -[RouteTableViewCell _updateConstraintValues](self, "_updateConstraintValues");
}

- (void)setShowDisclosureButton:(BOOL)a3
{
  _BOOL8 v3;
  MapsLargerHitTargetButton *disclosureButton;
  MapsLargerHitTargetButton *v6;
  MapsLargerHitTargetButton *v7;
  void *v8;

  if (self->_showDisclosureButton != a3)
  {
    v3 = a3;
    self->_showDisclosureButton = a3;
    disclosureButton = self->_disclosureButton;
    if (a3)
    {
      if (!disclosureButton)
      {
        v6 = (MapsLargerHitTargetButton *)objc_claimAutoreleasedReturnValue(-[RouteTableViewCell _disclosureButton](self, "_disclosureButton"));
        v7 = self->_disclosureButton;
        self->_disclosureButton = v6;

        -[MapsLargerHitTargetButton addTarget:action:forControlEvents:](self->_disclosureButton, "addTarget:action:forControlEvents:", self, "_disclosureButtonTapped:", 64);
        -[RouteTableViewCellButtonConstraintsController setButton:](self->_buttonConstraintsController, "setButton:", self->_disclosureButton);
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteTableViewCell contentView](self, "contentView"));
      objc_msgSend(v8, "addSubview:", self->_disclosureButton);

    }
    else
    {
      -[MapsLargerHitTargetButton removeFromSuperview](disclosureButton, "removeFromSuperview");
    }
    -[RouteTableViewCellButtonConstraintsController setButtonVisible:](self->_buttonConstraintsController, "setButtonVisible:", v3);
    -[RouteTableViewCell _mapkit_setNeedsLayout](self, "_mapkit_setNeedsLayout");
  }
}

- (id)_disclosureButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int IsRightToLeft;
  double v10;
  double v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsLargerHitTargetButton buttonWithType:](MapsLargerHitTargetButton, "buttonWithType:", 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("WalkingDrivingRoute_ButtonTitle"), CFSTR("localized string not found"), 0));

  objc_msgSend(v3, "setTitle:forState:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteTableViewCell _disclosureButtonFont](self, "_disclosureButtonFont"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "titleLabel"));
  objc_msgSend(v7, "setFont:", v6);

  IsRightToLeft = MKApplicationLayoutDirectionIsRightToLeft(v8);
  if (IsRightToLeft)
    v10 = 0.0;
  else
    v10 = -10.0;
  if (IsRightToLeft)
    v11 = -10.0;
  else
    v11 = 0.0;
  objc_msgSend(v3, "setTouchInsets:", 0.0, v10, -36.0, v11);
  return v3;
}

- (id)_disclosureButtonFont
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", UIFontTextStyleFootnote, 0);
}

- (RouteTableViewCellButtonConstraintsController)_buttonConstraintsController
{
  RouteTableViewCellButtonConstraintsController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  RouteTableViewCellButtonConstraintsController *v8;

  v3 = [RouteTableViewCellButtonConstraintsController alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel trailingAnchor](self->_primaryLabel, "trailingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteTableViewCell contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel firstBaselineAnchor](self->_primaryLabel, "firstBaselineAnchor"));
  v8 = -[RouteTableViewCellButtonConstraintsController initWithLeadingAnchor:trailingAnchor:firstBaselineAnchor:leadingDistance:firstBaselineDistance:](v3, "initWithLeadingAnchor:trailingAnchor:firstBaselineAnchor:leadingDistance:firstBaselineDistance:", v4, v6, v7, 8.0, 0.0);

  return v8;
}

- (void)_disclosureButtonTapped:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RouteTableViewCell delegate](self, "delegate", a3));
  objc_msgSend(v4, "disclosureButtonTappedInCell:", self);

}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (BOOL)useRoutePreviewDescription
{
  return self->_useRoutePreviewDescription;
}

- (BOOL)_maps_shouldHaveFullLengthBottomSeparator
{
  return self->__maps_shouldHaveFullLengthBottomSeparator;
}

- (MapsLargerHitTargetButton)disclosureButton
{
  return self->_disclosureButton;
}

- (BOOL)showDisclosureButton
{
  return self->_showDisclosureButton;
}

- (RouteTableViewCellButtonConstraintsController)buttonConstraintsController
{
  return self->_buttonConstraintsController;
}

- (RouteTableViewCellDelegate)delegate
{
  return (RouteTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_buttonConstraintsController, 0);
  objc_storeStrong((id *)&self->_disclosureButton, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_secondaryLabelToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryToPrimaryConstraint, 0);
  objc_storeStrong((id *)&self->_primaryToTopViewConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryLabelToContentViewConstraint, 0);
  objc_storeStrong((id *)&self->_leftPaddingConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
}

@end
