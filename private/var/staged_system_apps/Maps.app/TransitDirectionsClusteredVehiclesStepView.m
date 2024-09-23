@implementation TransitDirectionsClusteredVehiclesStepView

- (void)_createSubviews
{
  MKTransitInfoLabelView *v3;
  MKTransitInfoLabelView *alternateRoutesLabel;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  UIImageView *v11;
  UIImageView *chevronImageView;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)TransitDirectionsClusteredVehiclesStepView;
  -[TransitDirectionsIconStepView _createSubviews](&v20, "_createSubviews");
  v3 = (MKTransitInfoLabelView *)objc_alloc_init((Class)MKTransitInfoLabelView);
  alternateRoutesLabel = self->_alternateRoutesLabel;
  self->_alternateRoutesLabel = v3;

  -[MKTransitInfoLabelView setTranslatesAutoresizingMaskIntoConstraints:](self->_alternateRoutesLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[TransitDirectionsClusteredVehiclesStepView _updateShieldSize](self, "_updateShieldSize");
  LODWORD(v5) = 1148846080;
  -[MKTransitInfoLabelView _mapkit_setContentCompressionResistancePriority:forAxis:](self->_alternateRoutesLabel, "_mapkit_setContentCompressionResistancePriority:forAxis:", 1, v5);
  -[MKTransitInfoLabelView setNumberOfLines:](self->_alternateRoutesLabel, "setNumberOfLines:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  -[MKTransitInfoLabelView setTextColor:](self->_alternateRoutesLabel, "setTextColor:", v6);

  -[MKTransitInfoLabelView setTextAlignment:](self->_alternateRoutesLabel, "setTextAlignment:", 4);
  -[MKTransitInfoLabelView setLineBreakMode:](self->_alternateRoutesLabel, "setLineBreakMode:", 0);
  -[TransitDirectionsClusteredVehiclesStepView addSubview:](self, "addSubview:", self->_alternateRoutesLabel);
  if (sub_1002A8AA0(self) != 5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("chevron.right")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsClusteredVehiclesStepView traitCollection](self, "traitCollection"));
    v9 = objc_msgSend(v8, "layoutDirection");

    if (v9 == (id)1)
    {
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageFlippedForRightToLeftLayoutDirection"));

      v7 = (void *)v10;
    }
    v11 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v7);
    chevronImageView = self->_chevronImageView;
    self->_chevronImageView = v11;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_chevronImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithTextStyle:](UIImageSymbolConfiguration, "configurationWithTextStyle:", UIFontTextStyleCallout));
    -[UIImageView setPreferredSymbolConfiguration:](self->_chevronImageView, "setPreferredSymbolConfiguration:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MKTransitInfoLabelView textColor](self->_alternateRoutesLabel, "textColor"));
    -[UIImageView setTintColor:](self->_chevronImageView, "setTintColor:", v14);

    LODWORD(v15) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_chevronImageView, "setContentCompressionResistancePriority:forAxis:", 1, v15);
    LODWORD(v16) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_chevronImageView, "setContentCompressionResistancePriority:forAxis:", 0, v16);
    LODWORD(v17) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](self->_chevronImageView, "setContentHuggingPriority:forAxis:", 1, v17);
    LODWORD(v18) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](self->_chevronImageView, "setContentHuggingPriority:forAxis:", 0, v18);
    -[TransitDirectionsClusteredVehiclesStepView addSubview:](self, "addSubview:", self->_chevronImageView);

  }
  v19 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_tapped");
  -[TransitDirectionsClusteredVehiclesStepView addGestureRecognizer:](self, "addGestureRecognizer:", v19);
  -[TransitDirectionsClusteredVehiclesStepView _updateFonts](self, "_updateFonts");

}

- (id)_initialConstraints
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSLayoutConstraint *v8;
  NSLayoutConstraint *messageLabelBaselineConstraint;
  void *v10;
  void *v11;
  void *v12;
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
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)TransitDirectionsClusteredVehiclesStepView;
  v3 = -[TransitDirectionsIconStepView _initialConstraints](&v34, "_initialConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MKTransitInfoLabelView firstBaselineAnchor](self->_alternateRoutesLabel, "firstBaselineAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView contentLayoutGuide](self, "contentLayoutGuide"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v7));
  messageLabelBaselineConstraint = self->_messageLabelBaselineConstraint;
  self->_messageLabelBaselineConstraint = v8;

  objc_msgSend(v4, "addObject:", self->_messageLabelBaselineConstraint);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MKTransitInfoLabelView centerYAnchor](self->_alternateRoutesLabel, "centerYAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView contentLayoutGuide](self, "contentLayoutGuide"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "centerYAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v12));
  objc_msgSend(v4, "addObject:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView contentLayoutGuide](self, "contentLayoutGuide"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MKTransitInfoLabelView lastBaselineAnchor](self->_alternateRoutesLabel, "lastBaselineAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintGreaterThanOrEqualToAnchor:", v16));
  objc_msgSend(v4, "addObject:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView contentLayoutGuide](self, "contentLayoutGuide"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MKTransitInfoLabelView leadingAnchor](self->_alternateRoutesLabel, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
  objc_msgSend(v4, "addObject:", v21);

  if (sub_1002A8AA0(self) == 5)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView contentLayoutGuide](self, "contentLayoutGuide"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MKTransitInfoLabelView trailingAnchor](self->_alternateRoutesLabel, "trailingAnchor"));
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v24));
  }
  else
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView firstBaselineAnchor](self->_chevronImageView, "firstBaselineAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MKTransitInfoLabelView firstBaselineAnchor](self->_alternateRoutesLabel, "firstBaselineAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v27));
    objc_msgSend(v4, "addObject:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_chevronImageView, "leadingAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MKTransitInfoLabelView trailingAnchor](self->_alternateRoutesLabel, "trailingAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, 5.0));
    objc_msgSend(v4, "addObject:", v31);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView contentLayoutGuide](self, "contentLayoutGuide"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_chevronImageView, "trailingAnchor"));
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintGreaterThanOrEqualToAnchor:", v24));
  }
  v32 = (void *)v25;
  objc_msgSend(v4, "addObject:", v25);

  -[TransitDirectionsClusteredVehiclesStepView _updateConstraintsValue](self, "_updateConstraintsValue");
  return v4;
}

- (void)_contentSizeCategoryDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TransitDirectionsClusteredVehiclesStepView;
  -[TransitDirectionsStepView _contentSizeCategoryDidChange](&v3, "_contentSizeCategoryDidChange");
  -[TransitDirectionsClusteredVehiclesStepView _updateFonts](self, "_updateFonts");
  -[TransitDirectionsClusteredVehiclesStepView _updateShieldSize](self, "_updateShieldSize");
  -[TransitDirectionsClusteredVehiclesStepView _updateConstraintsValue](self, "_updateConstraintsValue");
}

- (void)_updateFonts
{
  void *v3;
  void *v4;
  id v5;

  if (sub_1002A8AA0(self) == 5)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
  v4 = v3;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_mapkit_fontByAddingFeaturesForTimeDisplay"));

  -[MKTransitInfoLabelView setFont:](self->_alternateRoutesLabel, "setFont:", v5);
}

- (void)_updateShieldSize
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredContentSizeCategory"));

  -[MKTransitInfoLabelView setShieldSize:](self->_alternateRoutesLabel, "setShieldSize:", +[MKTransitInfoLabelView clusteredShieldSizeForContentSizeCategory:](MKTransitInfoLabelView, "clusteredShieldSizeForContentSizeCategory:", v4));
}

- (void)_updateConstraintsValue
{
  uint64_t v3;
  double v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MKTransitInfoLabelView font](self->_alternateRoutesLabel, "font"));
  objc_msgSend(v5, "_scaledValueForValue:", 22.0);
  UIRoundToViewScale(self, v3, v4);
  -[NSLayoutConstraint setConstant:](self->_messageLabelBaselineConstraint, "setConstant:");

}

- (void)configureWithItem:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TransitDirectionsClusteredVehiclesStepView;
  -[TransitDirectionsIconStepView configureWithItem:](&v9, "configureWithItem:", v4);
  v5 = objc_opt_class(TransitDirectionsListClusteredVehicleItem);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clusteredSegment"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "alternateRouteItemsForTransitInfoLabel"));
    if (objc_msgSend(v7, "count"))
      v8 = v7;
    else
      v8 = 0;
    -[MKTransitInfoLabelView setLabelItems:](self->_alternateRoutesLabel, "setLabelItems:", v8);

  }
}

- (TransitDirectionsListClusteredVehicleItem)clusteredVehicleItem
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView transitListItem](self, "transitListItem"));
  v4 = objc_opt_class(TransitDirectionsListClusteredVehicleItem);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView transitListItem](self, "transitListItem"));
  else
    v6 = 0;
  return (TransitDirectionsListClusteredVehicleItem *)v6;
}

- (void)_tapped
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsClusteredVehiclesStepView delegate](self, "delegate"));
  objc_msgSend(v3, "transitDirectionsClusteredVehiclesCellDidTapAlternateRouteButtonInCell:", self);

}

- (void)_updateNavigationStateAlpha:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TransitDirectionsClusteredVehiclesStepView;
  -[TransitDirectionsIconStepView _updateNavigationStateAlpha:](&v5, "_updateNavigationStateAlpha:");
  -[MKTransitInfoLabelView setAlpha:](self->_alternateRoutesLabel, "setAlpha:", a3);
}

- (double)bottomSpacerHeight
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsClusteredVehiclesStepView traitCollection](self, "traitCollection"));
  objc_msgSend(v2, "userInterfaceIdiom");

  return 7.0;
}

- (TransitDirectionsClusteredVehiclesStepViewDelegate)delegate
{
  return (TransitDirectionsClusteredVehiclesStepViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MKTransitInfoLabelView)alternateRoutesLabel
{
  return self->_alternateRoutesLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateRoutesLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_messageLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_chevronImageView, 0);
}

@end
