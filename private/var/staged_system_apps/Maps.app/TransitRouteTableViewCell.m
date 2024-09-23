@implementation TransitRouteTableViewCell

- (TransitRouteTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  TransitRouteTableViewCell *v4;
  TransitRouteTableViewCell *v5;
  TransitRouteTableViewCell *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TransitRouteTableViewCell;
  v4 = -[RouteTableViewCell initWithStyle:reuseIdentifier:](&v8, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_leftPadding = 0.0;
    v6 = v4;
  }

  return v5;
}

- (void)_createSubviews
{
  TransitArtworkListView *v3;
  TransitArtworkListView *shieldListView;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TransitRouteTableViewCell;
  -[RouteTableViewCell _createSubviews](&v6, "_createSubviews");
  v3 = -[TransitArtworkListView initWithFrame:]([TransitArtworkListView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  shieldListView = self->_shieldListView;
  self->_shieldListView = v3;

  -[TransitArtworkListView setTranslatesAutoresizingMaskIntoConstraints:](self->_shieldListView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitRouteTableViewCell contentView](self, "contentView"));
  objc_msgSend(v5, "addSubview:", self->_shieldListView);

}

- (id)_autolayoutConstraints
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *topToShieldListViewConstraint;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;
  _QWORD v21[2];

  v20.receiver = self;
  v20.super_class = (Class)TransitRouteTableViewCell;
  v3 = -[RouteTableViewCell _autolayoutConstraints](&v20, "_autolayoutConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel trailingAnchor](self->super._primaryLabel, "trailingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitRouteTableViewCell contentView](self, "contentView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintLessThanOrEqualToAnchor:", v7));
  objc_msgSend(v4, "addObject:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitArtworkListView topAnchor](self->_shieldListView, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitRouteTableViewCell contentView](self, "contentView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
  v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11, 0.0));
  topToShieldListViewConstraint = self->_topToShieldListViewConstraint;
  self->_topToShieldListViewConstraint = v12;

  LODWORD(v14) = 1148829696;
  -[NSLayoutConstraint setPriority:](self->_topToShieldListViewConstraint, "setPriority:", v14);
  v21[0] = self->_topToShieldListViewConstraint;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitArtworkListView leadingAnchor](self->_shieldListView, "leadingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel leadingAnchor](self->super._primaryLabel, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
  v21[1] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 2));
  objc_msgSend(v4, "addObjectsFromArray:", v18);

  -[TransitRouteTableViewCell _updateConstraintValues](self, "_updateConstraintValues");
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  unsigned int v20;
  uint64_t v21;
  int *v22;
  uint64_t v23;
  int *v24;
  objc_super v25;
  CGRect v26;

  v25.receiver = self;
  v25.super_class = (Class)TransitRouteTableViewCell;
  -[TransitRouteTableViewCell layoutSubviews](&v25, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitRouteTableViewCell contentView](self, "contentView"));
  objc_msgSend(v3, "layoutIfNeeded");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteTableViewCell disclosureButton](self, "disclosureButton"));
  objc_msgSend(v4, "frame");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteTableViewCell disclosureButton](self, "disclosureButton"));
  objc_msgSend(v7, "frame");
  v9 = v6 + v8;
  -[TransitRouteTableViewCell frame](self, "frame");
  v11 = v9 - v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RouteTableViewCell disclosureButton](self, "disclosureButton"));
  objc_msgSend(v12, "setTouchInsets:", 0.0, 0.0, v11, 0.0);

  -[TransitRouteTableViewCell contentHorizontalMargins](self, "contentHorizontalMargins");
  -[RouteTableViewCell setSeparatorInset:](self, "setSeparatorInset:");
  if (!self->_inRecursiveLayout
    && -[TransitRouteTableViewCell canSpanFullWidth](self, "canSpanFullWidth")
    && -[TransitArtworkListView numberOfLines](self->_shieldListView, "numberOfLines") >= 2)
  {
    -[TransitArtworkListView singleLineWidth](self->_shieldListView, "singleLineWidth");
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitRouteTableViewCell accessoryView](self, "accessoryView"));
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "frame");
      v17 = CGRectGetWidth(v26) + 16.0;
    }
    else
    {
      v17 = 0.0;
    }
    -[CenteredTableViewCell maximumContentWidth](self, "maximumContentWidth");
    if (v18 > v14 + v17)
      -[CenteredTableViewCell maximumContentWidth](self, "maximumContentWidth");
    -[CenteredTableViewCell setMaximumContentWidth:](self, "setMaximumContentWidth:");
    -[TransitRouteTableViewCell _mapkit_setNeedsLayout](self, "_mapkit_setNeedsLayout");
    self->_inRecursiveLayout = 1;
    -[TransitRouteTableViewCell layoutSubviews](self, "layoutSubviews");
    self->_inRecursiveLayout = 0;

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel superview](self->_badgeLabel, "superview"));

  if (v19)
  {
    v20 = -[TransitRouteTableViewCell _isShieldListViewOverlappingWithBadge](self, "_isShieldListViewOverlappingWithBadge");
    if (v20)
      v21 = 4;
    else
      v21 = 5;
    if (v20)
      v22 = &OBJC_IVAR___RouteTableViewCell__secondaryLabelToContentViewConstraint;
    else
      v22 = &OBJC_IVAR___TransitRouteTableViewCell__secondaryLabelTrailingToBadgeLeadingConstraint;
    if (v20)
      v23 = 5;
    else
      v23 = 4;
    if (v20)
      v24 = &OBJC_IVAR___TransitRouteTableViewCell__secondaryLabelTrailingToBadgeLeadingConstraint;
    else
      v24 = &OBJC_IVAR___RouteTableViewCell__secondaryLabelToContentViewConstraint;
    objc_msgSend(*(id *)((char *)&self->super.super + OBJC_IVAR___TransitRouteTableViewCell__shieldListView[v21]), "setActive:", 0);
    objc_msgSend(*(id *)((char *)&self->super.super + *v22), "setActive:", 0);
    objc_msgSend(*(id *)((char *)&self->super.super + OBJC_IVAR___TransitRouteTableViewCell__shieldListView[v23]), "setActive:", 1);
    objc_msgSend(*(id *)((char *)&self->super.super + *v24), "setActive:", 1);
  }
}

- (BOOL)_isShieldListViewOverlappingWithBadge
{
  void *v3;
  double MaxX;
  double v6;
  double v7;
  double v8;
  double MinX;
  double v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel superview](self->_badgeLabel, "superview"));

  if (!v3)
    return 0;
  if (-[TransitArtworkListView numberOfLines](self->_shieldListView, "numberOfLines") > 1)
    return 1;
  if ((id)+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[TransitRouteTableViewCell semanticContentAttribute](self, "semanticContentAttribute")) == (id)1)
  {
    -[_MKUILabel frame](self->_badgeLabel, "frame");
    MaxX = CGRectGetMaxX(v11);
    -[TransitArtworkListView frame](self->_shieldListView, "frame");
    v6 = CGRectGetMaxX(v12);
    -[TransitArtworkListView singleLineWidth](self->_shieldListView, "singleLineWidth");
    v8 = v6 - v7 + -16.0;
  }
  else
  {
    -[TransitArtworkListView frame](self->_shieldListView, "frame");
    MinX = CGRectGetMinX(v13);
    -[TransitArtworkListView singleLineWidth](self->_shieldListView, "singleLineWidth");
    MaxX = MinX + v10 + 16.0;
    -[_MKUILabel frame](self->_badgeLabel, "frame");
    v8 = CGRectGetMinX(v14);
  }
  return MaxX > v8;
}

- (UIEdgeInsets)contentHorizontalMargins
{
  double Width;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect v26;
  UIEdgeInsets result;

  if (-[TransitRouteTableViewCell canSpanFullWidth](self, "canSpanFullWidth"))
  {
    -[TransitRouteTableViewCell bounds](self, "bounds");
    Width = CGRectGetWidth(v26);
    -[CenteredTableViewCell maximumContentWidth](self, "maximumContentWidth");
    v5 = Width - v4;
    -[CenteredTableViewCell minimumHorizontalMargins](self, "minimumHorizontalMargins");
    v7 = v6;
    -[CenteredTableViewCell minimumHorizontalMargins](self, "minimumHorizontalMargins");
    if (v5 <= v7 + v8)
    {
      -[CenteredTableViewCell minimumHorizontalMargins](self, "minimumHorizontalMargins");
      v10 = v18;
      v9 = v19;
      v11 = v20;
      v12 = v21;
    }
    else
    {
      v9 = v5 * 0.5;
      v10 = 0.0;
      v11 = 0.0;
      v12 = v9;
    }
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitRouteTableViewCell _tableView](self, "_tableView"));
    objc_msgSend(v13, "separatorInset");
    v10 = v14;
    v9 = v15;
    v11 = v16;
    v12 = v17;

  }
  v22 = v10;
  v23 = v9;
  v24 = v11;
  v25 = v12;
  result.right = v25;
  result.bottom = v24;
  result.left = v23;
  result.top = v22;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[TransitRouteTableViewCell layoutIfNeeded](self, "layoutIfNeeded");
  v14.receiver = self;
  v14.super_class = (Class)TransitRouteTableViewCell;
  *(float *)&v10 = a4;
  *(float *)&v11 = a5;
  -[TransitRouteTableViewCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v14, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v10, v11);
  result.height = v13;
  result.width = v12;
  return result;
}

- (id)_anchorFromWhichToPositionPrimaryLabelFirstBaseline
{
  return -[TransitArtworkListView bottomAnchor](self->_shieldListView, "bottomAnchor");
}

- (double)_distanceToPositionPrimaryLabelFirstBaseline
{
  return 20.0;
}

- (void)_updateConstraintValues
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  double v13;
  TransitRouteTableViewCell *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)TransitRouteTableViewCell;
  -[RouteTableViewCell _updateConstraintValues](&v26, "_updateConstraintValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteTableViewCell disclosureButton](self, "disclosureButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "titleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "font"));
  objc_msgSend(v5, "_scaledValueForValue:", 24.0);
  v7 = v6;

  v9 = UIRoundToViewScale(self, v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RouteTableViewCell buttonConstraintsController](self, "buttonConstraintsController"));
  objc_msgSend(v10, "setFirstBaselineDistance:", v9);

  v11 = -[TransitRouteTableViewCell _shouldHaveFullLengthTopSeparator](self, "_shouldHaveFullLengthTopSeparator");
  v13 = 12.0;
  if (v11)
  {
    v14 = self;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitRouteTableViewCell window](v14, "window"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "screen"));
    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[TransitRouteTableViewCell window](v14, "window"));

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "screen"));
      objc_msgSend(v18, "nativeScale");
      v20 = v19;

    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));

      objc_msgSend(v17, "nativeScale");
      v20 = v21;
    }

    v13 = 1.0 / v20 + 12.0;
    if (v20 <= 0.0)
      v13 = 13.0;
  }
  -[NSLayoutConstraint setConstant:](self->_topToShieldListViewConstraint, "setConstant:", UIRoundToViewScale(self, v12, v13));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel font](self->_badgeLabel, "font"));
  objc_msgSend(v22, "capHeight");
  -[NSLayoutConstraint setConstant:](self->_topShieldViewToBadgeLabelConstraint, "setConstant:");

  -[TransitRouteTableViewCell separatorInset](self, "separatorInset");
  v23 = 16.0;
  if (v24 > 16.0)
  {
    -[TransitRouteTableViewCell separatorInset](self, "separatorInset");
    v23 = v25;
  }
  -[NSLayoutConstraint setConstant:](self->_badgeLabelTrailingConstraint, "setConstant:", v23);
}

- (void)_updateCellLabels
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TransitRouteTableViewCell;
  -[RouteTableViewCell _updateCellLabels](&v4, "_updateCellLabels");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteTableViewCell route](self, "route"));

  if (v3)
  {
    -[TransitRouteTableViewCell _updateShieldListView](self, "_updateShieldListView");
    -[TransitRouteTableViewCell _updateRouteBadge](self, "_updateRouteBadge");
  }
}

- (void)_updateShieldListView
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[RouteTableViewCell route](self, "route"));
  if (v5)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteTableViewCell route](self, "route"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "routePlanningArtworks"));
    -[TransitArtworkListView setArtworkData:](self->_shieldListView, "setArtworkData:", v4);

    -[TransitRouteTableViewCell _mapkit_setNeedsLayout](self, "_mapkit_setNeedsLayout");
  }
  else
  {
    -[TransitArtworkListView setArtworkData:](self->_shieldListView, "setArtworkData:", 0);
  }

}

- (void)_updateRouteBadge
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSAttributedStringKey v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteTableViewCell route](self, "route"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "transitRouteBadge"));
  v8 = NSFontAttributeName;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitRouteTableViewCell _badgeLabelFont](self, "_badgeLabelFont"));
  v9 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString _mapkit_attributedTransitStringForServerFormattedString:defaultAttributes:](NSAttributedString, "_mapkit_attributedTransitStringForServerFormattedString:defaultAttributes:", v4, v6));

  if (-[RouteTableViewCell showDisclosureButton](self, "showDisclosureButton") || !objc_msgSend(v7, "length"))
  {
    -[_MKUILabel removeFromSuperview](self->_badgeLabel, "removeFromSuperview");
  }
  else
  {
    -[TransitRouteTableViewCell _configureRouteBadge](self, "_configureRouteBadge");
    -[_MKUILabel setAttributedText:](self->_badgeLabel, "setAttributedText:", v7);
  }

}

- (id)_badgeLabelFont
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", UIFontTextStyleCaption2, 0);
}

- (void)_configureRouteBadge
{
  _MKUILabel *badgeLabel;
  _MKUILabel *v4;
  _MKUILabel *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *badgeLabelTrailingConstraint;
  void *v16;
  void *v17;
  NSLayoutConstraint *v18;
  NSLayoutConstraint *topShieldViewToBadgeLabelConstraint;
  void *v20;
  void *v21;
  NSLayoutConstraint *v22;
  NSLayoutConstraint *secondaryLabelBaselineAlignWithBadgeConstraint;
  void *v24;
  void *v25;
  NSLayoutConstraint *v26;
  NSLayoutConstraint *secondaryLabelTrailingToBadgeLeadingConstraint;
  NSLayoutConstraint *v28;
  void *v29;
  _QWORD v30[2];

  badgeLabel = self->_badgeLabel;
  if (!badgeLabel)
  {
    v4 = (_MKUILabel *)objc_alloc_init((Class)_MKUILabel);
    v5 = self->_badgeLabel;
    self->_badgeLabel = v4;

    -[_MKUILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_badgeLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v6) = 1148846080;
    -[_MKUILabel _mapkit_setContentCompressionResistancePriority:forAxis:](self->_badgeLabel, "_mapkit_setContentCompressionResistancePriority:forAxis:", 0, v6);
    LODWORD(v7) = 1148846080;
    -[_MKUILabel _mapkit_setContentHuggingPriority:forAxis:](self->_badgeLabel, "_mapkit_setContentHuggingPriority:forAxis:", 0, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
    -[_MKUILabel setTextColor:](self->_badgeLabel, "setTextColor:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitRouteTableViewCell _badgeLabelFont](self, "_badgeLabelFont"));
    -[_MKUILabel setFont:](self->_badgeLabel, "setFont:", v9);

    badgeLabel = self->_badgeLabel;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel superview](badgeLabel, "superview"));

  if (!v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitRouteTableViewCell contentView](self, "contentView"));
    objc_msgSend(v11, "addSubview:", self->_badgeLabel);

    if (!self->_badgeLabelTrailingConstraint)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitRouteTableViewCell trailingAnchor](self, "trailingAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel trailingAnchor](self->_badgeLabel, "trailingAnchor"));
      v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
      badgeLabelTrailingConstraint = self->_badgeLabelTrailingConstraint;
      self->_badgeLabelTrailingConstraint = v14;

    }
    if (!self->_topShieldViewToBadgeLabelConstraint)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel firstBaselineAnchor](self->_badgeLabel, "firstBaselineAnchor"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[TransitArtworkListView topAnchor](self->_shieldListView, "topAnchor"));
      v18 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
      topShieldViewToBadgeLabelConstraint = self->_topShieldViewToBadgeLabelConstraint;
      self->_topShieldViewToBadgeLabelConstraint = v18;

    }
    if (!self->_secondaryLabelBaselineAlignWithBadgeConstraint)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel lastBaselineAnchor](self->super._secondaryLabel, "lastBaselineAnchor"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel firstBaselineAnchor](self->_badgeLabel, "firstBaselineAnchor"));
      v22 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v21));
      secondaryLabelBaselineAlignWithBadgeConstraint = self->_secondaryLabelBaselineAlignWithBadgeConstraint;
      self->_secondaryLabelBaselineAlignWithBadgeConstraint = v22;

    }
    if (!self->_secondaryLabelTrailingToBadgeLeadingConstraint)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel leadingAnchor](self->_badgeLabel, "leadingAnchor"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel trailingAnchor](self->super._secondaryLabel, "trailingAnchor"));
      v26 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, 16.0));
      secondaryLabelTrailingToBadgeLeadingConstraint = self->_secondaryLabelTrailingToBadgeLeadingConstraint;
      self->_secondaryLabelTrailingToBadgeLeadingConstraint = v26;

    }
    v28 = self->_topShieldViewToBadgeLabelConstraint;
    v30[0] = self->_badgeLabelTrailingConstraint;
    v30[1] = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 2));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v29);

  }
}

- (void)setShowDisclosureButton:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TransitRouteTableViewCell;
  -[RouteTableViewCell setShowDisclosureButton:](&v8, "setShowDisclosureButton:");
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteTableViewCell disclosureButton](self, "disclosureButton"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("More Routes Prompt"), CFSTR("localized string not found"), 0));
    objc_msgSend(v5, "setTitle:forState:", v7, 0);

    -[TransitRouteTableViewCell _updateConstraintValues](self, "_updateConstraintValues");
  }
  -[TransitRouteTableViewCell _updateRouteBadge](self, "_updateRouteBadge");
}

- (id)_buttonConstraintsController
{
  double v3;
  RouteTableViewCellButtonConstraintsController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  RouteTableViewCellButtonConstraintsController *v10;

  v3 = UIRoundToViewScale(self, a2, 24.0);
  v4 = [RouteTableViewCellButtonConstraintsController alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitArtworkListView trailingAnchor](self->_shieldListView, "trailingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitRouteTableViewCell contentView](self, "contentView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitRouteTableViewCell contentView](self, "contentView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topAnchor"));
  v10 = -[RouteTableViewCellButtonConstraintsController initWithLeadingAnchor:trailingAnchor:firstBaselineAnchor:leadingDistance:firstBaselineDistance:](v4, "initWithLeadingAnchor:trailingAnchor:firstBaselineAnchor:leadingDistance:firstBaselineDistance:", v5, v7, v9, 4.0, v3);

  return v10;
}

- (void)setLeftPadding:(double)a3
{
  self->_leftPadding = a3;
  -[NSLayoutConstraint setConstant:](self->super._leftPaddingConstraint, "setConstant:");
}

- (NSArray)_indexedContentSubviewOrNullArray
{
  void *v3;
  TransitArtworkListView *shieldListView;
  void *v5;
  _MKUILabel *primaryLabel;
  void *v7;
  _MKUILabel *secondaryLabel;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _MKUILabel *badgeLabel;
  void *v15;
  void *v17;
  TransitArtworkListView *v18;
  _QWORD v19[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitArtworkListView window](self->_shieldListView, "window"));
  if (v3)
    shieldListView = self->_shieldListView;
  else
    shieldListView = (TransitArtworkListView *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v18 = shieldListView;
  v19[0] = shieldListView;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel window](self->super._primaryLabel, "window"));
  if (v5)
    primaryLabel = self->super._primaryLabel;
  else
    primaryLabel = (_MKUILabel *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v19[1] = primaryLabel;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel window](self->super._secondaryLabel, "window", primaryLabel));
  if (v7)
    secondaryLabel = self->super._secondaryLabel;
  else
    secondaryLabel = (_MKUILabel *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v19[2] = secondaryLabel;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteTableViewCell disclosureButton](self, "disclosureButton"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "window"));
  if (v10)
    v11 = objc_claimAutoreleasedReturnValue(-[RouteTableViewCell disclosureButton](self, "disclosureButton"));
  else
    v11 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v12 = (void *)v11;
  v19[3] = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel window](self->_badgeLabel, "window"));
  if (v13)
    badgeLabel = self->_badgeLabel;
  else
    badgeLabel = (_MKUILabel *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v19[4] = badgeLabel;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 5));
  if (!v13)

  if (!v7)
  if (!v5)

  if (!v3)
  return (NSArray *)v15;
}

- (BOOL)canSpanFullWidth
{
  return self->_canSpanFullWidth;
}

- (void)setCanSpanFullWidth:(BOOL)a3
{
  self->_canSpanFullWidth = a3;
}

- (double)leftPadding
{
  return self->_leftPadding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLabelTrailingToBadgeLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryLabelBaselineAlignWithBadgeConstraint, 0);
  objc_storeStrong((id *)&self->_topShieldViewToBadgeLabelConstraint, 0);
  objc_storeStrong((id *)&self->_badgeLabelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_badgeLabel, 0);
  objc_storeStrong((id *)&self->_topToShieldListViewConstraint, 0);
  objc_storeStrong((id *)&self->_shieldListView, 0);
}

@end
