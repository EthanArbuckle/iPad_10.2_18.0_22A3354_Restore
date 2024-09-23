@implementation TransitDirectionsBlockTransferStepView

- (void)_contentSizeCategoryDidChange
{
  objc_super v3;

  -[TransitDirectionsBlockTransferStepView _topToPrimaryLabelDistance](self, "_topToPrimaryLabelDistance");
  -[NSLayoutConstraint setConstant:](self->_topToPrimaryLabelBaselineConstraint, "setConstant:");
  -[TransitDirectionsBlockTransferStepView _blockTransferImageOffsetFromPrimaryLabelBaseline](self, "_blockTransferImageOffsetFromPrimaryLabelBaseline");
  -[NSLayoutConstraint setConstant:](self->_imageViewToLabelVerticalAlignmentConstraint, "setConstant:");
  v3.receiver = self;
  v3.super_class = (Class)TransitDirectionsBlockTransferStepView;
  -[TransitDirectionsStepView _contentSizeCategoryDidChange](&v3, "_contentSizeCategoryDidChange");
  -[TransitDirectionsBlockTransferStepView _updateFonts](self, "_updateFonts");
}

- (void)_createSubviews
{
  id v3;
  double y;
  double width;
  double height;
  _MKUILabel *v7;
  _MKUILabel *primaryLabel;
  void *v9;
  MKArtworkImageView *v10;
  MKArtworkImageView *blockTransferImageView;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)TransitDirectionsBlockTransferStepView;
  -[TransitDirectionsStepView _createSubviews](&v17, "_createSubviews");
  v3 = objc_alloc((Class)_MKUILabel);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = (_MKUILabel *)objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  primaryLabel = self->_primaryLabel;
  self->_primaryLabel = v7;

  -[_MKUILabel setAccessibilityIdentifier:](self->_primaryLabel, "setAccessibilityIdentifier:", CFSTR("PrimaryLabel"));
  -[_MKUILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_primaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[_MKUILabel setTextAlignment:](self->_primaryLabel, "setTextAlignment:", 4);
  -[_MKUILabel setLineBreakMode:](self->_primaryLabel, "setLineBreakMode:", 0);
  -[_MKUILabel setAdjustsFontForContentSizeCategory:](self->_primaryLabel, "setAdjustsFontForContentSizeCategory:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[_MKUILabel setTextColor:](self->_primaryLabel, "setTextColor:", v9);

  -[_MKUILabel setNumberOfLines:](self->_primaryLabel, "setNumberOfLines:", 0);
  -[TransitDirectionsBlockTransferStepView addSubview:](self, "addSubview:", self->_primaryLabel);
  v10 = (MKArtworkImageView *)objc_msgSend(objc_alloc((Class)MKArtworkImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  blockTransferImageView = self->_blockTransferImageView;
  self->_blockTransferImageView = v10;

  -[MKArtworkImageView setAccessibilityIdentifier:](self->_blockTransferImageView, "setAccessibilityIdentifier:", CFSTR("BlockTransferImageView"));
  -[MKArtworkImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_blockTransferImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBlockTransferStepView layer](self, "layer"));
  v13 = objc_msgSend(v12, "backgroundColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView layer](self->_blockTransferImageView, "layer"));
  objc_msgSend(v14, "setBackgroundColor:", v13);

  LODWORD(v15) = 1148829696;
  -[MKArtworkImageView _mapkit_setContentHuggingPriority:forAxis:](self->_blockTransferImageView, "_mapkit_setContentHuggingPriority:forAxis:", 0, v15);
  LODWORD(v16) = 1148829696;
  -[MKArtworkImageView _mapkit_setContentHuggingPriority:forAxis:](self->_blockTransferImageView, "_mapkit_setContentHuggingPriority:forAxis:", 1, v16);
  -[MKArtworkImageView setContentMode:](self->_blockTransferImageView, "setContentMode:", 1);
  -[TransitDirectionsBlockTransferStepView addSubview:](self, "addSubview:", self->_blockTransferImageView);
  -[TransitDirectionsBlockTransferStepView _updateFonts](self, "_updateFonts");
}

- (id)_initialConstraints
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *primaryLabelLeadingToImageViewConstraint;
  void *v13;
  void *v14;
  void *v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *primaryLabelLeadingConstraint;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSLayoutConstraint *v24;
  NSLayoutConstraint *topToPrimaryLabelBaselineConstraint;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSLayoutConstraint *v32;
  NSLayoutConstraint *imageViewToLabelVerticalAlignmentConstraint;
  double v34;
  double v35;
  double v36;
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)TransitDirectionsBlockTransferStepView;
  v3 = -[TransitDirectionsStepView _initialConstraints](&v38, "_initialConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView contentLayoutGuide](self, "contentLayoutGuide"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView leadingAnchor](self->_blockTransferImageView, "leadingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
  objc_msgSend(v4, "addObject:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel leadingAnchor](self->_primaryLabel, "leadingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView trailingAnchor](self->_blockTransferImageView, "trailingAnchor"));
  v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, 6.0));
  primaryLabelLeadingToImageViewConstraint = self->_primaryLabelLeadingToImageViewConstraint;
  self->_primaryLabelLeadingToImageViewConstraint = v11;

  objc_msgSend(v4, "addObject:", self->_primaryLabelLeadingToImageViewConstraint);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel leadingAnchor](self->_primaryLabel, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView contentLayoutGuide](self, "contentLayoutGuide"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leadingAnchor"));
  v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
  primaryLabelLeadingConstraint = self->_primaryLabelLeadingConstraint;
  self->_primaryLabelLeadingConstraint = v16;

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel trailingAnchor](self->_primaryLabel, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView contentLayoutGuide](self, "contentLayoutGuide"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v20));
  objc_msgSend(v4, "addObject:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel firstBaselineAnchor](self->_primaryLabel, "firstBaselineAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBlockTransferStepView topAnchor](self, "topAnchor"));
  -[TransitDirectionsBlockTransferStepView _topToPrimaryLabelDistance](self, "_topToPrimaryLabelDistance");
  v24 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23));
  topToPrimaryLabelBaselineConstraint = self->_topToPrimaryLabelBaselineConstraint;
  self->_topToPrimaryLabelBaselineConstraint = v24;

  objc_msgSend(v4, "addObject:", self->_topToPrimaryLabelBaselineConstraint);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel bottomAnchor](self->_primaryLabel, "bottomAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView contentLayoutGuide](self, "contentLayoutGuide"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bottomAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v28));
  objc_msgSend(v4, "addObject:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel firstBaselineAnchor](self->_primaryLabel, "firstBaselineAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView centerYAnchor](self->_blockTransferImageView, "centerYAnchor"));
  -[TransitDirectionsBlockTransferStepView _blockTransferImageOffsetFromPrimaryLabelBaseline](self, "_blockTransferImageOffsetFromPrimaryLabelBaseline");
  v32 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31));
  imageViewToLabelVerticalAlignmentConstraint = self->_imageViewToLabelVerticalAlignmentConstraint;
  self->_imageViewToLabelVerticalAlignmentConstraint = v32;

  objc_msgSend(v4, "addObject:", self->_imageViewToLabelVerticalAlignmentConstraint);
  LODWORD(v34) = 1144750080;
  -[MKArtworkImageView _mapkit_setContentCompressionResistancePriority:forAxis:](self->_blockTransferImageView, "_mapkit_setContentCompressionResistancePriority:forAxis:", 0, v34);
  LODWORD(v35) = 1132068864;
  -[_MKUILabel _mapkit_setContentCompressionResistancePriority:forAxis:](self->_primaryLabel, "_mapkit_setContentCompressionResistancePriority:forAxis:", 0, v35);
  LODWORD(v36) = 1148829696;
  -[_MKUILabel _mapkit_setContentCompressionResistancePriority:forAxis:](self->_primaryLabel, "_mapkit_setContentCompressionResistancePriority:forAxis:", 1, v36);
  return v4;
}

- (void)configureWithItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  int IsAccessibilityContentSizeCategory;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;
  _QWORD v21[2];
  _QWORD v22[2];

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TransitDirectionsBlockTransferStepView;
  -[TransitDirectionsStepView configureWithItem:](&v20, "configureWithItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageSourceForStyle:", 0));
  -[MKArtworkImageView setImageSource:](self->_blockTransferImageView, "setImageSource:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView image](self->_blockTransferImageView, "image"));
  objc_msgSend(v6, "size");
  v9 = v8 == CGSizeZero.height && v7 == CGSizeZero.width;
  -[NSLayoutConstraint setActive:](self->_primaryLabelLeadingConstraint, "setActive:", v9);

  -[NSLayoutConstraint setActive:](self->_primaryLabelLeadingToImageViewConstraint, "setActive:", -[NSLayoutConstraint isActive](self->_primaryLabelLeadingConstraint, "isActive") ^ 1);
  if (-[TransitDirectionsStepView useNavigationMetrics](self, "useNavigationMetrics")
    || (v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBlockTransferStepView traitCollection](self, "traitCollection")),
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "preferredContentSizeCategory")),
        IsAccessibilityContentSizeCategory = _UIContentSizeCategoryIsAccessibilityContentSizeCategory(),
        v11,
        v10,
        IsAccessibilityContentSizeCategory))
  {
    v13 = 6;
  }
  else
  {
    v13 = 5;
  }
  v21[0] = NSFontAttributeName;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel font](self->_primaryLabel, "font"));
  v22[0] = v14;
  v21[1] = MKServerFormattedStringArtworkSizeAttributeKey;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13));
  v22[1] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 2));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "majorFormattedStrings"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "firstObject"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString _mapkit_attributedStringForComposedString:defaultAttributes:](NSAttributedString, "_mapkit_attributedStringForComposedString:defaultAttributes:", v18, v16));

  -[_MKUILabel setAttributedText:](self->_primaryLabel, "setAttributedText:", v19);
}

- (double)_blockTransferImageOffsetFromPrimaryLabelBaseline
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel font](self->_primaryLabel, "font"));
  objc_msgSend(v2, "capHeight");
  v4 = v3 * 0.5;

  return v4;
}

- (double)_topToPrimaryLabelDistance
{
  void *v3;
  double v4;
  double v5;
  uint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel font](self->_primaryLabel, "font"));
  objc_msgSend(v3, "_scaledValueForValue:", 20.0);
  v5 = v4;

  return UIRoundToViewScale(self, v6, v5);
}

- (double)_primaryLabelLineSpacing
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel font](self->_primaryLabel, "font"));
  objc_msgSend(v3, "_mapkit_lineHeight");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel font](self->_primaryLabel, "font"));
  objc_msgSend(v6, "leading");
  v8 = 16.0 - (v5 + v7);

  return UIRoundToViewScale(self, v9, v8);
}

- (void)_updateFonts
{
  void *v3;
  void *v4;
  void *v5;

  if (sub_1002A8AA0(self) == 5)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_mapkit_fontByAddingFeaturesForTimeDisplay"));

  -[_MKUILabel setFont:](self->_primaryLabel, "setFont:", v5);
  -[TransitDirectionsBlockTransferStepView _updateLineSpacing](self, "_updateLineSpacing");
}

- (void)_updateLineSpacing
{
  _MKUILabel *primaryLabel;

  primaryLabel = self->_primaryLabel;
  -[TransitDirectionsBlockTransferStepView _primaryLabelLineSpacing](self, "_primaryLabelLineSpacing");
  -[_MKUILabel _maps_setLineSpacing:](primaryLabel, "_maps_setLineSpacing:");
}

- (void)_updateNavigationStateAlpha:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TransitDirectionsBlockTransferStepView;
  -[TransitDirectionsStepView _updateNavigationStateAlpha:](&v5, "_updateNavigationStateAlpha:");
  -[_MKUILabel setAlpha:](self->_primaryLabel, "setAlpha:", a3);
}

+ (double)leadingTextInsetForBlockTransferTransitDirectionsListItem:(id)a3 navigationState:(int64_t)a4
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v14;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "imageSourceForStyle:", 0, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v5, "scale");
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageToDisplayWithScreenScale:nightMode:", 0, v7));
  objc_msgSend(v8, "size");
  v10 = v9;
  v12 = v11;

  if (v12 == CGSizeZero.height && v10 == CGSizeZero.width)
    v14 = 0.0;
  else
    v14 = v10 + 6.0;

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockTransferImageView, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_primaryLabelLeadingToImageViewConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewToLabelVerticalAlignmentConstraint, 0);
  objc_storeStrong((id *)&self->_topToPrimaryLabelBaselineConstraint, 0);
}

@end
