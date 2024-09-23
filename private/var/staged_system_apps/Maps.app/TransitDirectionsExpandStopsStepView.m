@implementation TransitDirectionsExpandStopsStepView

- (void)_createSubviews
{
  TransitDirectionsColoredLine *v3;
  double y;
  double width;
  double height;
  TransitDirectionsColoredLine *v7;
  TransitDirectionsColoredLine *line;
  MapsLargerHitTargetButton *v9;
  MapsLargerHitTargetButton *detailButton;
  MapsLargerHitTargetButton *v11;
  MapsLargerHitTargetButton *v12;
  void *v13;
  MapsLargerHitTargetButton *v14;
  void *v15;
  MapsLargerHitTargetButton *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)TransitDirectionsExpandStopsStepView;
  -[TransitDirectionsIconStepView _createSubviews](&v21, "_createSubviews");
  -[TransitDirectionsColoredLine setHidden:](self->super._topLink, "setHidden:", 1);
  -[TransitDirectionsColoredLine setHidden:](self->super._bottomLink, "setHidden:", 1);
  v3 = [TransitDirectionsColoredLine alloc];
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = -[TransitDirectionsColoredLine initWithFrame:](v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  line = self->_line;
  self->_line = v7;

  -[TransitDirectionsColoredLine setTranslatesAutoresizingMaskIntoConstraints:](self->_line, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[TransitDirectionsExpandStopsStepView addSubview:](self, "addSubview:", self->_line);
  if (sub_1002A8AA0(self) == 5)
  {
    v9 = -[MapsLargerHitTargetButton initWithFrame:]([MapsLargerHitTargetButton alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    detailButton = self->_detailButton;
    self->_detailButton = v9;

    v11 = self->_detailButton;
    v12 = (MapsLargerHitTargetButton *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsExpandStopsStepView theme](self, "theme"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLargerHitTargetButton keyColor](v12, "keyColor"));
    -[MapsLargerHitTargetButton setTitleColor:forStates:](v11, "setTitleColor:forStates:", v13, 0);

  }
  else
  {
    v14 = (MapsLargerHitTargetButton *)objc_claimAutoreleasedReturnValue(+[MapsLargerHitTargetButton buttonWithType:](MapsLargerHitTargetButton, "buttonWithType:", 1));
    v12 = self->_detailButton;
    self->_detailButton = v14;
  }

  -[MapsLargerHitTargetButton setAccessibilityIdentifier:](self->_detailButton, "setAccessibilityIdentifier:", CFSTR("DetailButton"));
  -[MapsLargerHitTargetButton setTranslatesAutoresizingMaskIntoConstraints:](self->_detailButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLargerHitTargetButton titleLabel](self->_detailButton, "titleLabel"));
  objc_msgSend(v15, "setNumberOfLines:", 2);

  -[MapsLargerHitTargetButton setContentHorizontalAlignment:](self->_detailButton, "setContentHorizontalAlignment:", 4);
  -[MapsLargerHitTargetButton addTarget:action:forControlEvents:](self->_detailButton, "addTarget:action:forControlEvents:", self, "_detailButtonTapped:", 64);
  v16 = self->_detailButton;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  -[MapsLargerHitTargetButton setTitleColor:forStates:](v16, "setTitleColor:forStates:", v17, 2);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsExpandStopsStepView traitCollection](self, "traitCollection"));
  if (objc_msgSend(v18, "userInterfaceIdiom") == (id)5)
    v19 = 6.0;
  else
    v19 = 8.0;

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsExpandStopsStepView detailButton](self, "detailButton"));
  objc_msgSend(v20, "setTouchInsets:", -v19, -16.0, -v19, -16.0);

  -[TransitDirectionsExpandStopsStepView addSubview:](self, "addSubview:", self->_detailButton);
  -[TransitDirectionsExpandStopsStepView _updateFonts](self, "_updateFonts");
}

- (id)_initialConstraints
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  NSLayoutConstraint *v20;
  NSLayoutConstraint *lineWidthConstraint;
  void *v22;
  NSLayoutConstraint *v23;
  NSLayoutConstraint *lineHeightConstraint;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)TransitDirectionsExpandStopsStepView;
  v3 = -[TransitDirectionsIconStepView _initialConstraints](&v36, "_initialConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = -[TransitDirectionsIconStepView _indentsLinkMap](self, "_indentsLinkMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsColoredLine centerXAnchor](self->_line, "centerXAnchor"));
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView contentLayoutGuide](self, "contentLayoutGuide"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsExpandStopsStepView traitCollection](self, "traitCollection"));
    objc_msgSend(v9, "userInterfaceIdiom");

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:constant:", v8, 10.0));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView leadingAccessoryLayoutGuide](self, "leadingAccessoryLayoutGuide"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "centerXAnchor"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v8));
  }
  v11 = (void *)v10;
  objc_msgSend(v4, "addObject:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsColoredLine topAnchor](self->_line, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsExpandStopsStepView topAnchor](self, "topAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
  objc_msgSend(v4, "addObject:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsColoredLine bottomAnchor](self->_line, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsExpandStopsStepView bottomAnchor](self, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
  objc_msgSend(v4, "addObject:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsColoredLine widthAnchor](self->_line, "widthAnchor"));
  v19 = 0.0;
  v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToConstant:", 0.0));
  lineWidthConstraint = self->_lineWidthConstraint;
  self->_lineWidthConstraint = v20;

  objc_msgSend(v4, "addObject:", self->_lineWidthConstraint);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsColoredLine heightAnchor](self->_line, "heightAnchor"));
  -[TransitDirectionsExpandStopsStepView _minimumLinkHeight](self, "_minimumLinkHeight");
  v23 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintGreaterThanOrEqualToConstant:"));
  lineHeightConstraint = self->_lineHeightConstraint;
  self->_lineHeightConstraint = v23;

  objc_msgSend(v4, "addObject:", self->_lineHeightConstraint);
  if (-[TransitDirectionsIconStepView _indentsLinkMap](self, "_indentsLinkMap"))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsExpandStopsStepView traitCollection](self, "traitCollection"));
    objc_msgSend(v25, "userInterfaceIdiom");

    v19 = 24.0;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLargerHitTargetButton titleLabel](self->_detailButton, "titleLabel"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView contentLayoutGuide](self, "contentLayoutGuide"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsExpandStopsStepView traitCollection](self, "traitCollection"));
  v29 = 6.5;
  if (objc_msgSend(v28, "userInterfaceIdiom") == (id)5)
    v30 = 6.0;
  else
    v30 = 6.5;

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsExpandStopsStepView traitCollection](self, "traitCollection"));
  if (objc_msgSend(v31, "userInterfaceIdiom") == (id)5)
    v29 = 6.0;

  LODWORD(v32) = 1148846080;
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "_maps_constraintsEqualToEdgesOfLayoutGuide:insets:priority:", v27, v30, v19, v29, 0.0, v32));

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "allConstraints"));
  objc_msgSend(v4, "addObjectsFromArray:", v34);

  return v4;
}

- (id)_imageViewPositionConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView centerYAnchor](self->super._iconImageView, "centerYAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsExpandStopsStepView centerYAnchor](self, "centerYAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v4));
  v11[0] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView centerXAnchor](self->super._iconImageView, "centerXAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsColoredLine centerXAnchor](self->_line, "centerXAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
  v11[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));

  return v9;
}

- (double)_minimumLinkHeight
{
  double v2;

  -[TransitDirectionsListItem lineWidthForView:](self->super.super._transitListItem, "lineWidthForView:", self);
  return v2 * 7.0;
}

- (void)_detailButtonTapped:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsExpandStopsStepView expandableCellDelegate](self, "expandableCellDelegate", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsExpandStopsStepView expandableItem](self, "expandableItem"));
  objc_msgSend(v5, "transitDirectionsCell:wantsToExpandOrCollapseItem:", self, v4);

}

- (void)_updateFonts
{
  void *v3;
  id v4;

  sub_1002A8AA0(self);
  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:maximumContentSizeCategory:](UIFont, "_preferredFontForTextStyle:maximumContentSizeCategory:", UIFontTextStyleBody, UIContentSizeCategoryAccessibilityExtraLarge));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLargerHitTargetButton titleLabel](self->_detailButton, "titleLabel"));
  objc_msgSend(v3, "setFont:", v4);

}

- (void)_contentSizeCategoryDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TransitDirectionsExpandStopsStepView;
  -[TransitDirectionsStepView _contentSizeCategoryDidChange](&v3, "_contentSizeCategoryDidChange");
  -[TransitDirectionsExpandStopsStepView _updateFonts](self, "_updateFonts");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  unsigned int v8;
  MapsLargerHitTargetButton *detailButton;
  id WeakRetained;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TransitDirectionsExpandStopsStepView;
  v4 = a3;
  -[TransitDirectionsIconStepView traitCollectionDidChange:](&v11, "traitCollectionDidChange:", v4);
  -[TransitDirectionsListItem lineWidthForView:](self->super.super._transitListItem, "lineWidthForView:", self, v11.receiver, v11.super_class);
  -[NSLayoutConstraint setConstant:](self->_lineWidthConstraint, "setConstant:");
  -[TransitDirectionsExpandStopsStepView _minimumLinkHeight](self, "_minimumLinkHeight");
  -[NSLayoutConstraint setConstant:](self->_lineHeightConstraint, "setConstant:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsExpandStopsStepView traitCollection](self, "traitCollection"));
  v6 = sub_1002A8A0C(v4, v5);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsExpandStopsStepView traitCollection](self, "traitCollection"));
    v8 = objc_msgSend(v7, "isLuminanceReduced");

    detailButton = self->_detailButton;
    if (v8)
    {
      -[MapsLargerHitTargetButton setEnabled:](self->_detailButton, "setEnabled:", 0);
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_expandableItem);
      -[MapsLargerHitTargetButton setEnabled:](detailButton, "setEnabled:", objc_msgSend(WeakRetained, "shouldEnableExpandedButton"));

    }
  }
}

- (void)configureWithItem:(id)a3
{
  id v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TransitDirectionsExpandStopsStepView;
  v4 = a3;
  -[TransitDirectionsIconStepView configureWithItem:](&v7, "configureWithItem:", v4);
  objc_storeWeak((id *)&self->_expandableItem, 0);
  self->_checkedItemIsExpandable = 0;
  objc_msgSend(v4, "lineWidthForView:", self, v7.receiver, v7.super_class);
  v6 = v5;

  -[NSLayoutConstraint setConstant:](self->_lineWidthConstraint, "setConstant:", v6);
  -[TransitDirectionsExpandStopsStepView _minimumLinkHeight](self, "_minimumLinkHeight");
  -[NSLayoutConstraint setConstant:](self->_lineHeightConstraint, "setConstant:");
  -[TransitDirectionsExpandStopsStepView updateExpandCollapseStyling](self, "updateExpandCollapseStyling");
}

- (UIColor)lineColor
{
  return -[TransitDirectionsColoredLine lineColor](self->_line, "lineColor");
}

- (void)setLineColor:(id)a3
{
  -[TransitDirectionsColoredLine setLineColor:](self->_line, "setLineColor:", a3);
}

- (TransitDirectionsListExpandableItem)expandableItem
{
  void *v3;
  uint64_t v4;

  if (!self->_checkedItemIsExpandable)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView transitListItem](self, "transitListItem"));
    if (v3)
    {
      do
      {
        if ((objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___TransitDirectionsListExpandableItem) & 1) != 0)break;
        v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "parentItem"));

        v3 = (void *)v4;
      }
      while (v4);
    }
    objc_storeWeak((id *)&self->_expandableItem, v3);
    self->_checkedItemIsExpandable = 1;

  }
  return (TransitDirectionsListExpandableItem *)objc_loadWeakRetained((id *)&self->_expandableItem);
}

- (void)_updateLinkColors
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView transitListItem](self, "transitListItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fromLineColor"));
  -[TransitDirectionsExpandStopsStepView setLineColor:](self, "setLineColor:", v3);

}

- (void)_updateLinkStyles
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView transitListItem](self, "transitListItem"));
  if (objc_msgSend(v6, "type") == (id)7)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsExpandStopsStepView expandableItem](self, "expandableItem"));
    if ((objc_msgSend(v3, "shouldEnableExpandedButton") & 1) != 0)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsExpandStopsStepView expandableItem](self, "expandableItem"));
      if (objc_msgSend(v4, "expanded"))
        v5 = 0;
      else
        v5 = 3;
      -[TransitDirectionsColoredLine setStyle:](self->_line, "setStyle:", v5);

    }
    else
    {
      -[TransitDirectionsColoredLine setStyle:](self->_line, "setStyle:", 0);
    }

  }
  else
  {
    -[TransitDirectionsColoredLine setStyle:](self->_line, "setStyle:", 0);
  }

}

- (void)updateExpandCollapseStyling
{
  -[TransitDirectionsExpandStopsStepView _updateLinkStyles](self, "_updateLinkStyles");
  -[TransitDirectionsExpandStopsStepView _updateExpandButton](self, "_updateExpandButton");
}

- (void)_updateExpandButton
{
  id v3;
  unsigned int v4;
  void *v5;
  unsigned int v6;
  int v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  char v12;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsExpandStopsStepView expandableItem](self, "expandableItem"));
  v3 = (id)objc_claimAutoreleasedReturnValue(-[MapsLargerHitTargetButton currentTitle](self->_detailButton, "currentTitle"));
  if (v9)
  {
    v4 = objc_msgSend(v9, "shouldEnableExpandedButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsExpandStopsStepView traitCollection](self, "traitCollection"));
    v6 = objc_msgSend(v5, "isLuminanceReduced");

    v7 = v4 & ~v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "expandingButtonTitleForExpandedState:", objc_msgSend(v9, "expanded") & v7));

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100A8349C;
    v10[3] = &unk_1011AC838;
    v10[4] = self;
    v3 = v8;
    v11 = v3;
    v12 = v7;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v10);

  }
  -[MapsLargerHitTargetButton setHidden:](self->_detailButton, "setHidden:", objc_msgSend(v3, "length") == 0);
  if (v9)
  {
    -[TransitDirectionsStepView _updateConstraints](self, "_updateConstraints");
    -[TransitDirectionsExpandStopsStepView _mapkit_layoutIfNeeded](self, "_mapkit_layoutIfNeeded");
  }

}

- (void)_updateNavigationStateAlpha:(double)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TransitDirectionsExpandStopsStepView;
  -[TransitDirectionsIconStepView _updateNavigationStateAlpha:](&v6, "_updateNavigationStateAlpha:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsExpandStopsStepView detailButton](self, "detailButton"));
  objc_msgSend(v5, "setAlpha:", a3);

  -[TransitDirectionsColoredLine setAlpha:](self->_line, "setAlpha:", a3);
}

- (TransitDirectionsExpandableCellDelegate)expandableCellDelegate
{
  return (TransitDirectionsExpandableCellDelegate *)objc_loadWeakRetained((id *)&self->_expandableCellDelegate);
}

- (void)setExpandableCellDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_expandableCellDelegate, a3);
}

- (MapsLargerHitTargetButton)detailButton
{
  return self->_detailButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailButton, 0);
  objc_destroyWeak((id *)&self->_expandableCellDelegate);
  objc_storeStrong((id *)&self->_lineHeightConstraint, 0);
  objc_storeStrong((id *)&self->_lineWidthConstraint, 0);
  objc_destroyWeak((id *)&self->_expandableItem);
  objc_storeStrong((id *)&self->_line, 0);
}

@end
