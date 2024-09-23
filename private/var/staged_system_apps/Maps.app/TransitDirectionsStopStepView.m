@implementation TransitDirectionsStopStepView

- (void)_createSubviews
{
  MKArtworkImageView *v3;
  MKArtworkImageView *stationArtworkImageView;
  double v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TransitDirectionsStopStepView;
  -[TransitDirectionsInstructionsStepView _createSubviews](&v15, "_createSubviews");
  v3 = (MKArtworkImageView *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsIconStepView _createImageView](self, "_createImageView"));
  stationArtworkImageView = self->_stationArtworkImageView;
  self->_stationArtworkImageView = v3;

  -[MKArtworkImageView setAccessibilityIdentifier:](self->_stationArtworkImageView, "setAccessibilityIdentifier:", CFSTR("StationArtworkImageView"));
  LODWORD(v5) = 1132068864;
  -[MKArtworkImageView _mapkit_setContentCompressionResistancePriority:forAxis:](self->_stationArtworkImageView, "_mapkit_setContentCompressionResistancePriority:forAxis:", 0, v5);
  LODWORD(v6) = 1132068864;
  -[MKArtworkImageView _mapkit_setContentCompressionResistancePriority:forAxis:](self->_stationArtworkImageView, "_mapkit_setContentCompressionResistancePriority:forAxis:", 1, v6);
  -[TransitDirectionsStopStepView addSubview:](self, "addSubview:", self->_stationArtworkImageView);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView primaryAccessoryLabel](self, "primaryAccessoryLabel"));
  LODWORD(v8) = 1148829696;
  objc_msgSend(v7, "_mapkit_setContentHuggingPriority:forAxis:", 0, v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView primaryAccessoryLabel](self, "primaryAccessoryLabel"));
  objc_msgSend(v10, "setTextColor:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView secondaryAccessoryLabel](self, "secondaryAccessoryLabel"));
  LODWORD(v12) = 1148829696;
  objc_msgSend(v11, "_mapkit_setContentHuggingPriority:forAxis:", 0, v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView secondaryAccessoryLabel](self, "secondaryAccessoryLabel"));
  objc_msgSend(v14, "setTextColor:", v13);

  -[TransitDirectionsStopStepView _updateFonts](self, "_updateFonts");
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TransitDirectionsStopStepView;
  -[TransitDirectionsInstructionsStepView prepareForReuse](&v3, "prepareForReuse");
  -[MKArtworkImageView setImageSource:](self->_stationArtworkImageView, "setImageSource:", 0);
}

- (void)_updateFonts
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  TransitDirectionsStopStepView *v9;
  void *v10;
  id *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  TransitDirectionsStopStepView *v18;
  void *v19;
  id *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  if (sub_1002A8AA0(self) == 5)
    v3 = objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  else
    v3 = objc_claimAutoreleasedReturnValue(+[UIFont system17SemiBold](UIFont, "system17SemiBold"));
  v4 = (void *)v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView primaryLabel](self, "primaryLabel"));
  objc_msgSend(v5, "setFont:", v4);

  if (sub_1002A8AA0(self) == 5)
    v6 = objc_claimAutoreleasedReturnValue(+[UIFont system16](UIFont, "system16"));
  else
    v6 = objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
  v7 = (void *)v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView secondaryLabel](self, "secondaryLabel"));
  objc_msgSend(v8, "setFont:", v7);

  v9 = self;
  if (sub_1002A8AA0(v9) == 5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStopStepView traitCollection](v9, "traitCollection"));
    if (objc_msgSend(v10, "userInterfaceIdiom") == (id)5)
      v11 = (id *)&UIFontTextStyleBody;
    else
      v11 = (id *)&UIFontTextStyleSubheadline;
    v12 = *v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:", v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fontDescriptor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_mapkit_fontDescriptorByAddingFeaturesForTimeDisplayUseMonospace:", 1));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v15, 0.0));
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system16](UIFont, "system16"));
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView primaryAccessoryLabel](v9, "primaryAccessoryLabel"));
  objc_msgSend(v17, "setFont:", v16);

  v18 = v9;
  if (sub_1002A8AA0(v18) == 5)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStopStepView traitCollection](v18, "traitCollection"));
    if (objc_msgSend(v19, "userInterfaceIdiom") == (id)5)
      v20 = (id *)&UIFontTextStyleBody;
    else
      v20 = (id *)&UIFontTextStyleSubheadline;
    v21 = *v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:", v21));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "fontDescriptor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "_mapkit_fontDescriptorByAddingFeaturesForTimeDisplayUseMonospace:", 1));

    v26 = (id)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v24, 0.0));
  }
  else
  {
    v26 = (id)objc_claimAutoreleasedReturnValue(+[UIFont system16](UIFont, "system16"));
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView secondaryAccessoryLabel](v18, "secondaryAccessoryLabel"));
  objc_msgSend(v25, "setFont:", v26);

}

- (void)_contentSizeCategoryDidChange
{
  void *v3;
  void *v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TransitDirectionsStopStepView;
  -[TransitDirectionsInstructionsStepView _contentSizeCategoryDidChange](&v6, "_contentSizeCategoryDidChange");
  -[TransitDirectionsStopStepView _updateFonts](self, "_updateFonts");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView primaryLabel](self, "primaryLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "font"));
  objc_msgSend(v4, "_mapkit_lineHeight");
  -[NSLayoutConstraint setConstant:](self->_iconToPrimaryLabelConstraint, "setConstant:", v5 * 0.5);

}

- (id)_initialConstraints
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *stationArtworkScalingHeightConstraint;
  double v9;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)TransitDirectionsStopStepView;
  v3 = -[TransitDirectionsIconStepView _initialConstraints](&v40, "_initialConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView heightAnchor](self->_stationArtworkImageView, "heightAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToConstant:", 0.0));
  v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_maps_withIdentifier:", CFSTR("stationArtworkScaledHeight")));
  stationArtworkScalingHeightConstraint = self->_stationArtworkScalingHeightConstraint;
  self->_stationArtworkScalingHeightConstraint = v7;

  LODWORD(v9) = 1148829696;
  -[NSLayoutConstraint setPriority:](self->_stationArtworkScalingHeightConstraint, "setPriority:", v9);
  objc_msgSend(v4, "addObject:", self->_stationArtworkScalingHeightConstraint);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView centerYAnchor](self->_stationArtworkImageView, "centerYAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView centerYAnchor](self->super.super._iconImageView, "centerYAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_maps_withIdentifier:", CFSTR("stationArtworkCenterYToIconCenterY")));
  objc_msgSend(v4, "addObject:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView centerXAnchor](self->_stationArtworkImageView, "centerXAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView leadingAccessoryLayoutGuide](self, "leadingAccessoryLayoutGuide"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "centerXAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v16));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "_maps_withIdentifier:", CFSTR("stationArtworkCenterXToLeadingLayoutCenterX")));
  objc_msgSend(v4, "addObject:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView topAnchor](self->_stationArtworkImageView, "topAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView leadingAccessoryLayoutGuide](self, "leadingAccessoryLayoutGuide"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintGreaterThanOrEqualToAnchor:", v21));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "_maps_withIdentifier:", CFSTR("stationArtworkTopToLeadingLayoutTop")));
  objc_msgSend(v4, "addObject:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView leadingAnchor](self->_stationArtworkImageView, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView leadingAccessoryLayoutGuide](self, "leadingAccessoryLayoutGuide"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "leadingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintGreaterThanOrEqualToAnchor:", v26));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "_maps_withIdentifier:", CFSTR("stationArtworkLeadingToLeadingLayoutLeading")));
  objc_msgSend(v4, "addObject:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView leadingAccessoryLayoutGuide](self, "leadingAccessoryLayoutGuide"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "trailingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView trailingAnchor](self->_stationArtworkImageView, "trailingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintGreaterThanOrEqualToAnchor:", v31));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "_maps_withIdentifier:", CFSTR("leadingLayoutTrailingToStationArtworkTrailing")));
  objc_msgSend(v4, "addObject:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView leadingAccessoryLayoutGuide](self, "leadingAccessoryLayoutGuide"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "bottomAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView bottomAnchor](self->_stationArtworkImageView, "bottomAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintGreaterThanOrEqualToAnchor:", v36));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "_maps_withIdentifier:", CFSTR("leadingLayoutBottomToStationArtworkBottom")));
  objc_msgSend(v4, "addObject:", v38);

  return v4;
}

- (id)_imageViewPositionConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  NSLayoutConstraint *v10;
  NSLayoutConstraint *iconToPrimaryLabelConstraint;
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
  NSLayoutConstraint *v22;
  void *v23;
  id v25;
  void *v26;
  objc_super v27;
  _QWORD v28[3];

  if (-[TransitDirectionsIconStepView _indentsLinkMap](self, "_indentsLinkMap"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView centerYAnchor](self->super.super._iconImageView, "centerYAnchor"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView primaryLabel](self, "primaryLabel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView primaryLabel](self, "primaryLabel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "font"));
    objc_msgSend(v7, "_mapkit_lineHeight");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:constant:", v5, v8 * 0.5));
    v10 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_maps_withIdentifier:", CFSTR("iconCenterYToPrimaryLabelTop")));
    iconToPrimaryLabelConstraint = self->_iconToPrimaryLabelConstraint;
    self->_iconToPrimaryLabelConstraint = v10;

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView leadingAnchor](self->super.super._iconImageView, "leadingAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView contentLayoutGuide](self, "contentLayoutGuide"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "leadingAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintGreaterThanOrEqualToAnchor:", v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_maps_withIdentifier:", CFSTR("iconLeadingToContentLeading")));
    v28[0] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView centerXAnchor](self->super.super._iconImageView, "centerXAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView contentLayoutGuide](self, "contentLayoutGuide"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStopStepView traitCollection](self, "traitCollection"));
    objc_msgSend(v19, "userInterfaceIdiom");

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, 10.0));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "_maps_withIdentifier:", CFSTR("iconCenterXToContentLeading")));
    v22 = self->_iconToPrimaryLabelConstraint;
    v28[1] = v21;
    v28[2] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 3));

    return v23;
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)TransitDirectionsStopStepView;
    v25 = -[TransitDirectionsInstructionsStepView _imageViewPositionConstraints](&v27, "_imageViewPositionConstraints");
    return (id)objc_claimAutoreleasedReturnValue(v25);
  }
}

- ($29727DC6989B69F22950FCD998EA20D4)_metrics
{
  double var0;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  double v10;
  double v11;
  $29727DC6989B69F22950FCD998EA20D4 *result;
  void *v13;
  objc_super v14;

  retstr->var6 = 0.0;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  v14.receiver = self;
  v14.super_class = (Class)TransitDirectionsStopStepView;
  -[$29727DC6989B69F22950FCD998EA20D4 _metrics](&v14, "_metrics");
  var0 = retstr->var0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView transitListItem](self, "transitListItem"));
  v7 = objc_msgSend(v6, "type");

  if (v7 == (id)11)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStopStepView traitCollection](self, "traitCollection"));
    v9 = objc_msgSend(v8, "userInterfaceIdiom") == (id)5;
    v10 = 11.0;
    v11 = 13.0;
  }
  else
  {
    if (v7 != (id)10)
      goto LABEL_9;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStopStepView traitCollection](self, "traitCollection"));
    v9 = objc_msgSend(v8, "userInterfaceIdiom") == (id)5;
    v10 = 16.0;
    v11 = 4.0;
  }
  if (v9)
    var0 = v11;
  else
    var0 = v10;

LABEL_9:
  retstr->var6 = 1.0;
  retstr->var0 = var0;
  result = ($29727DC6989B69F22950FCD998EA20D4 *)-[TransitDirectionsIconStepView _indentsLinkMap](self, "_indentsLinkMap");
  if ((_DWORD)result)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStopStepView traitCollection](self, "traitCollection"));
    objc_msgSend(v13, "userInterfaceIdiom");

    retstr->var1 = 24.0;
  }
  return result;
}

- (double)bottomSpacerHeight
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;
  objc_super v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView transitListItem](self, "transitListItem"));

  if (!v3)
  {
    -[TransitDirectionsStepView bottomSpacerHeight](&v14, "bottomSpacerHeight", v13.receiver, v13.super_class, self, TransitDirectionsStopStepView);
    return v10;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView transitListItem](self, "transitListItem"));
  v5 = objc_msgSend(v4, "type");

  if (v5 == (id)11)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStopStepView traitCollection](self, "traitCollection"));
    v7 = objc_msgSend(v6, "userInterfaceIdiom") == (id)5;
    v8 = 32.0;
    v9 = 10.0;
    goto LABEL_7;
  }
  if (v5 != (id)10)
  {
    -[TransitDirectionsStepView bottomSpacerHeight](&v13, "bottomSpacerHeight", self, TransitDirectionsStopStepView, v14.receiver, v14.super_class);
    return v10;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStopStepView traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "userInterfaceIdiom") == (id)5;
  v8 = 11.0;
  v9 = 8.0;
LABEL_7:
  if (v7)
    v11 = v9;
  else
    v11 = v8;

  return v11;
}

- (void)_cellStyleDidChange
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TransitDirectionsStopStepView;
  -[TransitDirectionsInstructionsStepView _cellStyleDidChange](&v5, "_cellStyleDidChange");
  -[NSLayoutConstraint setActive:](self->_iconToPrimaryLabelConstraint, "setActive:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView primaryAccessoryLabel](self, "primaryAccessoryLabel"));
  objc_msgSend(v3, "setNumberOfLines:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView secondaryAccessoryLabel](self, "secondaryAccessoryLabel"));
  objc_msgSend(v4, "setNumberOfLines:", 1);

}

- (id)_platformArtworkHorizontalPositioningConstraint
{
  void *v2;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;

  v4 = -[TransitDirectionsInstructionsStepView cellStyle](self, "cellStyle");
  switch(v4)
  {
    case 2uLL:
      goto LABEL_4;
    case 1uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView platformArtworkImageView](self, "platformArtworkImageView"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView trailingAnchor](self->super.super._iconImageView, "trailingAnchor"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
      v9 = v8;
      v10 = CFSTR("platformArtworkTrailingToIconTrailing");
      goto LABEL_6;
    case 0uLL:
LABEL_4:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView platformArtworkImageView](self, "platformArtworkImageView"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView leadingAnchor](self->super.super._iconImageView, "leadingAnchor"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
      v9 = v8;
      v10 = CFSTR("platformArtworkLeadingToIconLeading");
LABEL_6:
      v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_maps_withIdentifier:", v10));

      break;
  }
  return v2;
}

- (void)configureWithItem:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)TransitDirectionsStopStepView;
  v4 = a3;
  -[TransitDirectionsInstructionsStepView configureWithItem:](&v16, "configureWithItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "majorStringImage", v16.receiver, v16.super_class));

  -[MKArtworkImageView setImageSource:](self->_stationArtworkImageView, "setImageSource:", v5);
  -[MKArtworkImageView setHidden:](self->_stationArtworkImageView, "setHidden:", v5 == 0);
  objc_msgSend(v5, "size");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStopStepView traitCollection](self, "traitCollection"));
  if (objc_msgSend(v8, "userInterfaceIdiom") == (id)5)
    v9 = 0.850000024;
  else
    v9 = 0.75;

  -[NSLayoutConstraint setConstant:](self->_stationArtworkScalingHeightConstraint, "setConstant:", v7 * v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView primaryAccessoryLabel](self, "primaryAccessoryLabel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "attributedText"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView secondaryAccessoryLabel](self, "secondaryAccessoryLabel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "attributedText"));

  if (v13 && !v11)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView primaryAccessoryLabel](self, "primaryAccessoryLabel"));
    objc_msgSend(v14, "setAttributedText:", v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView secondaryAccessoryLabel](self, "secondaryAccessoryLabel"));
    objc_msgSend(v15, "setAttributedText:", 0);

  }
  -[TransitDirectionsStopStepView _refreshAccessoryStringVisibility](self, "_refreshAccessoryStringVisibility");

}

- (void)_refreshAccessoryStringVisibility
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  unsigned int v10;
  char v11;
  _BOOL8 v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView transitListItem](self, "transitListItem"));
  v4 = objc_msgSend(v3, "hideAccessoryStringsWhenCollapsed");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView transitListItem](self, "transitListItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "parentItem"));

    if (objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___TransitDirectionsListExpandableItem))
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;
    if (v8)
    {
      v9 = v8;
      v10 = objc_msgSend(v8, "expanded");

      if (!v10)
      {
        v11 = 1;
        v12 = 1;
        goto LABEL_10;
      }
    }
    else
    {

    }
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView primaryAccessoryLabel](self, "primaryAccessoryLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "attributedText"));
  v11 = 0;
  v12 = objc_msgSend(v9, "length") == 0;
LABEL_10:
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView primaryAccessoryLabel](self, "primaryAccessoryLabel"));
  objc_msgSend(v13, "setHidden:", v12);

  if ((v11 & 1) != 0)
  {
    v14 = 1;
  }
  else
  {

    v16 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView secondaryAccessoryLabel](self, "secondaryAccessoryLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "attributedText"));
    v14 = objc_msgSend(v6, "length") == 0;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView secondaryAccessoryLabel](self, "secondaryAccessoryLabel"));
  objc_msgSend(v15, "setHidden:", v14);

  if ((v11 & 1) == 0)
  {

  }
}

- (void)_updateNavigationStateAlpha:(double)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TransitDirectionsStopStepView;
  -[TransitDirectionsInstructionsStepView _updateNavigationStateAlpha:](&v6, "_updateNavigationStateAlpha:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStopStepView stationArtworkImageView](self, "stationArtworkImageView"));
  objc_msgSend(v5, "setAlpha:", a3);

}

- (void)_updateForParentExpansionOrCollapse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TransitDirectionsStopStepView;
  -[TransitDirectionsIconStepView _updateForParentExpansionOrCollapse](&v3, "_updateForParentExpansionOrCollapse");
  -[TransitDirectionsStopStepView _refreshAccessoryStringVisibility](self, "_refreshAccessoryStringVisibility");
}

- (MKArtworkImageView)stationArtworkImageView
{
  return self->_stationArtworkImageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stationArtworkImageView, 0);
  objc_storeStrong((id *)&self->_stationArtworkScalingHeightConstraint, 0);
  objc_storeStrong((id *)&self->_iconToPrimaryLabelConstraint, 0);
}

@end
