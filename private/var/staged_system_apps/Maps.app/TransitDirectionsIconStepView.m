@implementation TransitDirectionsIconStepView

- (void)prepareForReuse
{
  NSNumber *hasAlternateImageSource;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TransitDirectionsIconStepView;
  -[TransitDirectionsStepView prepareForReuse](&v4, "prepareForReuse");
  hasAlternateImageSource = self->_hasAlternateImageSource;
  self->_hasAlternateImageSource = 0;

  -[MKArtworkImageView setHidden:](self->_iconImageView, "setHidden:", 0);
}

- (void)_createSubviews
{
  UIView *v3;
  UIView *iconLinksGroupingView;
  double v5;
  double v6;
  TransitDirectionsColoredLine *v7;
  TransitDirectionsColoredLine *topLink;
  TransitDirectionsColoredLine *v9;
  TransitDirectionsColoredLine *bottomLink;
  MKArtworkImageView *v11;
  MKArtworkImageView *iconImageView;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TransitDirectionsIconStepView;
  -[TransitDirectionsStepView _createSubviews](&v13, "_createSubviews");
  v3 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  iconLinksGroupingView = self->_iconLinksGroupingView;
  self->_iconLinksGroupingView = v3;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_iconLinksGroupingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setUserInteractionEnabled:](self->_iconLinksGroupingView, "setUserInteractionEnabled:", 0);
  LODWORD(v5) = 1148846080;
  -[UIView _mapkit_setContentHuggingPriority:forAxis:](self->_iconLinksGroupingView, "_mapkit_setContentHuggingPriority:forAxis:", 0, v5);
  LODWORD(v6) = 1148846080;
  -[UIView _mapkit_setContentHuggingPriority:forAxis:](self->_iconLinksGroupingView, "_mapkit_setContentHuggingPriority:forAxis:", 1, v6);
  -[TransitDirectionsIconStepView addSubview:](self, "addSubview:", self->_iconLinksGroupingView);
  v7 = (TransitDirectionsColoredLine *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsIconStepView _lineColorViewWithStyle:](self, "_lineColorViewWithStyle:", 1));
  topLink = self->_topLink;
  self->_topLink = v7;

  -[UIView addSubview:](self->_iconLinksGroupingView, "addSubview:", self->_topLink);
  v9 = (TransitDirectionsColoredLine *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsIconStepView _lineColorViewWithStyle:](self, "_lineColorViewWithStyle:", 2));
  bottomLink = self->_bottomLink;
  self->_bottomLink = v9;

  -[UIView addSubview:](self->_iconLinksGroupingView, "addSubview:", self->_bottomLink);
  v11 = (MKArtworkImageView *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsIconStepView _createImageView](self, "_createImageView"));
  iconImageView = self->_iconImageView;
  self->_iconImageView = v11;

  -[UIView addSubview:](self->_iconLinksGroupingView, "addSubview:", self->_iconImageView);
}

- (id)_createImageView
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;

  v3 = objc_msgSend(objc_alloc((Class)MKArtworkImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsIconStepView layer](self, "layer"));
  v5 = objc_msgSend(v4, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layer"));
  objc_msgSend(v6, "setBackgroundColor:", v5);

  LODWORD(v7) = 1148829696;
  objc_msgSend(v3, "_mapkit_setContentHuggingPriority:forAxis:", 0, v7);
  LODWORD(v8) = 1148829696;
  objc_msgSend(v3, "_mapkit_setContentHuggingPriority:forAxis:", 1, v8);
  objc_msgSend(v3, "setContentMode:", 1);
  return v3;
}

- (id)_UIView
{
  id v2;

  v2 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v2;
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
  void *v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSLayoutConstraint *v54;
  NSLayoutConstraint *linkWidthConstraint;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  NSLayoutConstraint *v71;
  NSLayoutConstraint *topLinkToContentViewTopConstraint;
  void *v73;
  void *v74;
  void *v75;
  NSLayoutConstraint *v76;
  NSLayoutConstraint *topLinkToImageViewCenterConstraint;
  void *v78;
  void *v79;
  void *v80;
  NSLayoutConstraint *v81;
  NSLayoutConstraint *bottomLinkToImageViewCenterConstraint;
  void *v83;
  void *v84;
  void *v85;
  NSLayoutConstraint *v86;
  NSLayoutConstraint *bottomLinkToContentViewBottomConstraint;
  void *v89;
  objc_super v90;

  v90.receiver = self;
  v90.super_class = (Class)TransitDirectionsIconStepView;
  v3 = -[TransitDirectionsStepView _initialConstraints](&v90, "_initialConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsColoredLine topAnchor](self->_topLink, "topAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_iconLinksGroupingView, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_maps_withIdentifier:", CFSTR("topLinkTopToGroupingTop")));
  objc_msgSend(v4, "addObject:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_iconLinksGroupingView, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsColoredLine bottomAnchor](self->_bottomLink, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_maps_withIdentifier:", CFSTR("groupingBottomToBottomLinkBottom")));
  objc_msgSend(v4, "addObject:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsColoredLine leadingAnchor](self->_topLink, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_iconLinksGroupingView, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintGreaterThanOrEqualToAnchor:", v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_maps_withIdentifier:", CFSTR("topLinkLeadingToGroupingLeading")));
  objc_msgSend(v4, "addObject:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_iconLinksGroupingView, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsColoredLine trailingAnchor](self->_topLink, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintGreaterThanOrEqualToAnchor:", v18));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "_maps_withIdentifier:", CFSTR("groupingTrailingToTopLinkTrailing")));
  objc_msgSend(v4, "addObject:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView leadingAnchor](self->_iconImageView, "leadingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_iconLinksGroupingView, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintGreaterThanOrEqualToAnchor:", v22));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "_maps_withIdentifier:", CFSTR("iconLeadingToGroupingLeading")));
  objc_msgSend(v4, "addObject:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_iconLinksGroupingView, "trailingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView trailingAnchor](self->_iconImageView, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintGreaterThanOrEqualToAnchor:", v26));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "_maps_withIdentifier:", CFSTR("groupingTrailingToIconTrailing")));
  objc_msgSend(v4, "addObject:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView topAnchor](self->_iconImageView, "topAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_iconLinksGroupingView, "topAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintGreaterThanOrEqualToAnchor:", v30));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "_maps_withIdentifier:", CFSTR("iconTopToGroupingTop")));
  objc_msgSend(v4, "addObject:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_iconLinksGroupingView, "bottomAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView bottomAnchor](self->_iconImageView, "bottomAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintGreaterThanOrEqualToAnchor:", v34));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "_maps_withIdentifier:", CFSTR("groupingBotomToIconBottom")));
  objc_msgSend(v4, "addObject:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsIconStepView _imageViewPositionConstraints](self, "_imageViewPositionConstraints"));
  objc_msgSend(v4, "addObjectsFromArray:", v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView heightAnchor](self->_iconImageView, "heightAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToConstant:", 1.0));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "_maps_withIdentifier:", CFSTR("iconHeight")));

  v89 = v40;
  LODWORD(v41) = 1132068864;
  objc_msgSend(v40, "setPriority:", v41);
  objc_msgSend(v4, "addObject:", v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView widthAnchor](self->_iconImageView, "widthAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToConstant:", 1.0));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "_maps_withIdentifier:", CFSTR("iconWidth")));

  LODWORD(v45) = 1132068864;
  objc_msgSend(v44, "setPriority:", v45);
  objc_msgSend(v4, "addObject:", v44);
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView widthAnchor](self->_iconImageView, "widthAnchor"));
  -[TransitDirectionsIconStepView _maximumIconWidth](self, "_maximumIconWidth");
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintLessThanOrEqualToConstant:"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "_maps_withIdentifier:", CFSTR("iconMaxWidth")));
  objc_msgSend(v4, "addObject:", v48);

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView heightAnchor](self->_iconImageView, "heightAnchor"));
  -[TransitDirectionsIconStepView _maximumIconHeight](self, "_maximumIconHeight");
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintLessThanOrEqualToConstant:"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "_maps_withIdentifier:", CFSTR("iconMaxHeight")));
  objc_msgSend(v4, "addObject:", v51);

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsColoredLine widthAnchor](self->_topLink, "widthAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToConstant:", 0.0));
  v54 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "_maps_withIdentifier:", CFSTR("topLinkWidth")));
  linkWidthConstraint = self->_linkWidthConstraint;
  self->_linkWidthConstraint = v54;

  objc_msgSend(v4, "addObject:", self->_linkWidthConstraint);
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsColoredLine widthAnchor](self->_bottomLink, "widthAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsColoredLine widthAnchor](self->_topLink, "widthAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:", v57));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "_maps_withIdentifier:", CFSTR("bottomLinkWidth")));
  objc_msgSend(v4, "addObject:", v59);

  v60 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsColoredLine centerXAnchor](self->_topLink, "centerXAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView centerXAnchor](self->_iconImageView, "centerXAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v61));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "_maps_withIdentifier:", CFSTR("topLinkCenterXToIconCenterX")));
  objc_msgSend(v4, "addObject:", v63);

  v64 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsColoredLine centerXAnchor](self->_bottomLink, "centerXAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsColoredLine centerXAnchor](self->_topLink, "centerXAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:", v65));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "_maps_withIdentifier:", CFSTR("bottomLinkCenterXToIconCenterX")));
  objc_msgSend(v4, "addObject:", v67);

  v68 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsColoredLine topAnchor](self->_topLink, "topAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsIconStepView topAnchor](self, "topAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintEqualToAnchor:", v69));
  v71 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "_maps_withIdentifier:", CFSTR("topLinkTopToContentViewTopConstraint")));
  topLinkToContentViewTopConstraint = self->_topLinkToContentViewTopConstraint;
  self->_topLinkToContentViewTopConstraint = v71;

  objc_msgSend(v4, "addObject:", self->_topLinkToContentViewTopConstraint);
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsColoredLine bottomAnchor](self->_topLink, "bottomAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView centerYAnchor](self->_iconImageView, "centerYAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToAnchor:", v74));
  v76 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "_maps_withIdentifier:", CFSTR("topLinkBottomToImageViewCenterYConstraint")));
  topLinkToImageViewCenterConstraint = self->_topLinkToImageViewCenterConstraint;
  self->_topLinkToImageViewCenterConstraint = v76;

  objc_msgSend(v4, "addObject:", self->_topLinkToImageViewCenterConstraint);
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsColoredLine topAnchor](self->_bottomLink, "topAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView centerYAnchor](self->_iconImageView, "centerYAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToAnchor:", v79));
  v81 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "_maps_withIdentifier:", CFSTR("bottomLinkTopToImageViewCenterYConstraint")));
  bottomLinkToImageViewCenterConstraint = self->_bottomLinkToImageViewCenterConstraint;
  self->_bottomLinkToImageViewCenterConstraint = v81;

  objc_msgSend(v4, "addObject:", self->_bottomLinkToImageViewCenterConstraint);
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsColoredLine bottomAnchor](self->_bottomLink, "bottomAnchor"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsIconStepView bottomAnchor](self, "bottomAnchor"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "constraintEqualToAnchor:", v84));
  v86 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "_maps_withIdentifier:", CFSTR("bottomLinkBottomToContentViewBottomConstraint")));
  bottomLinkToContentViewBottomConstraint = self->_bottomLinkToContentViewBottomConstraint;
  self->_bottomLinkToContentViewBottomConstraint = v86;

  objc_msgSend(v4, "addObject:", self->_bottomLinkToContentViewBottomConstraint);
  return v4;
}

- (id)_imageViewPositionConstraints
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView centerXAnchor](self->_iconImageView, "centerXAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView leadingAccessoryLayoutGuide](self, "leadingAccessoryLayoutGuide"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "centerXAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_maps_withIdentifier:", CFSTR("iconCenterXToLeadingGuideCenterX")));
  objc_msgSend(v3, "addObject:", v8);

  v9 = objc_msgSend(v3, "copy");
  return v9;
}

- (double)_maximumIconWidth
{
  uint64_t v2;
  double result;

  v2 = sub_1002A8AA0(self);
  result = 40.0;
  if (v2 == 5)
    return 30.0;
  return result;
}

- (double)_maximumIconHeight
{
  sub_1002A8AA0(self);
  return 30.0;
}

- (double)_distanceToImageCenterForImageSource:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  void *v8;
  id v9;
  void *v10;
  double v11;

  v4 = a3;
  if (!v4)
  {
    v7 = 0.0;
    goto LABEL_7;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView transitListItem](self, "transitListItem"));
  v6 = objc_opt_class(TransitDirectionsListItemTransitTrip);
  v7 = 0.0;
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    goto LABEL_5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView transitListItem](self, "transitListItem"));
  v9 = objc_msgSend(v8, "type");

  if (v9 != (id)12)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsIconStepView iconImageView](self, "iconImageView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "image"));
    objc_msgSend(v10, "size");
    v7 = v11 * 0.5 + -1.0;

LABEL_5:
  }
LABEL_7:

  return v7;
}

- (double)_topLinkExtensionHeight
{
  double result;

  if (!-[TransitDirectionsStepView isHighlighted](self, "isHighlighted"))
    return 0.0;
  -[TransitDirectionsIconStepView _calculatedSeparatorHeight](self, "_calculatedSeparatorHeight");
  return result;
}

- (double)_bottomLinkExtensionHeight
{
  double result;

  if (!-[TransitDirectionsStepView isHighlighted](self, "isHighlighted"))
    return 0.0;
  -[TransitDirectionsIconStepView _calculatedSeparatorHeight](self, "_calculatedSeparatorHeight");
  return result;
}

- (id)_lineColorViewWithStyle:(unint64_t)a3
{
  TransitDirectionsColoredLine *v3;

  v3 = -[TransitDirectionsColoredLine initWithStyle:]([TransitDirectionsColoredLine alloc], "initWithStyle:", a3);
  -[TransitDirectionsColoredLine setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v3;
}

- (void)_updateLinkColors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  unsigned int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView transitListItem](self, "transitListItem"));
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fromLineColor"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView transitListItem](self, "transitListItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "toLineColor"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView transitListItem](self, "transitListItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parentItem"));

  if (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___TransitDirectionsListExpandableItem))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  v10 = objc_msgSend(v9, "expanded");
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView transitListItem](self, "transitListItem"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "alternateFromLineColor"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView transitListItem](self, "transitListItem"));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "alternateToLineColor"));

    v5 = (void *)v14;
    v15 = (id)v12;
  }
  else
  {
    v15 = v16;
  }
  v17 = v15;
  -[TransitDirectionsIconStepView setTopLinkColor:](self, "setTopLinkColor:", v15);
  -[TransitDirectionsIconStepView setBottomLinkColor:](self, "setBottomLinkColor:", v5);

}

- (void)_updateLinkStyles
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView transitListItem](self, "transitListItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "parentItem"));

  if (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___TransitDirectionsListExpandableItem))
    v5 = v4;
  else
    v5 = 0;
  v14 = v5;

  if (!v14)
  {
    v9 = 1;
LABEL_12:
    v13 = 2;
    goto LABEL_13;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView transitListItem](self, "transitListItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "previousItem"));
  v8 = (unint64_t)objc_msgSend(v7, "type");

  v9 = 1;
  if (v8 <= 0xE)
  {
    if (((1 << v8) & 0x4460) != 0)
    {
LABEL_7:
      v9 = 0;
      goto LABEL_8;
    }
    if (v8 == 7)
    {
      if (!objc_msgSend(v14, "shouldEnableExpandedButton") || objc_msgSend(v14, "expanded"))
        goto LABEL_7;
      v9 = 1;
    }
  }
LABEL_8:
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView transitListItem](self, "transitListItem"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nextItem"));
  v12 = (unint64_t)objc_msgSend(v11, "type");

  v13 = 2;
  if (v12 <= 0xE)
  {
    if (((1 << v12) & 0x4860) == 0)
    {
      if (v12 != 7)
        goto LABEL_13;
      if (objc_msgSend(v14, "shouldEnableExpandedButton") && !objc_msgSend(v14, "expanded"))
        goto LABEL_12;
    }
    v13 = 0;
  }
LABEL_13:
  -[TransitDirectionsColoredLine setStyle:](self->_topLink, "setStyle:", v9);
  -[TransitDirectionsColoredLine setStyle:](self->_bottomLink, "setStyle:", v13);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TransitDirectionsIconStepView;
  -[TransitDirectionsStepView layoutSubviews](&v3, "layoutSubviews");
  -[TransitDirectionsIconStepView _updateLinkColors](self, "_updateLinkColors");
  -[TransitDirectionsIconStepView _updateLinkStyles](self, "_updateLinkStyles");
}

- (void)setHighlighted:(BOOL)a3
{
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TransitDirectionsIconStepView;
  -[TransitDirectionsStepView setHighlighted:](&v5, "setHighlighted:", a3);
  -[TransitDirectionsIconStepView _updateArtworkTintColor](self, "_updateArtworkTintColor");
  -[TransitDirectionsIconStepView _topLinkExtensionHeight](self, "_topLinkExtensionHeight");
  -[NSLayoutConstraint setConstant:](self->_topLinkToContentViewTopConstraint, "setConstant:", -v4);
  -[TransitDirectionsIconStepView _bottomLinkExtensionHeight](self, "_bottomLinkExtensionHeight");
  -[NSLayoutConstraint setConstant:](self->_bottomLinkToContentViewBottomConstraint, "setConstant:");
}

- (void)setDisplayOptions:(unint64_t)a3
{
  unsigned int v5;
  objc_super v6;

  v5 = -[TransitDirectionsStepView displayOptions](self, "displayOptions");
  v6.receiver = self;
  v6.super_class = (Class)TransitDirectionsIconStepView;
  -[TransitDirectionsStepView setDisplayOptions:](&v6, "setDisplayOptions:", a3);
  if (((v5 ^ a3) & 1) != 0)
    -[TransitDirectionsIconStepView _updateArtwork](self, "_updateArtwork");
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TransitDirectionsIconStepView;
  -[TransitDirectionsIconStepView traitCollectionDidChange:](&v4, "traitCollectionDidChange:", a3);
  -[TransitDirectionsListItem lineWidthForView:](self->super._transitListItem, "lineWidthForView:", self);
  -[NSLayoutConstraint setConstant:](self->_linkWidthConstraint, "setConstant:");
}

- (void)setTopLinkColor:(id)a3
{
  -[TransitDirectionsColoredLine setLineColor:](self->_topLink, "setLineColor:", a3);
}

- (UIColor)topLinkColor
{
  return -[TransitDirectionsColoredLine lineColor](self->_topLink, "lineColor");
}

- (void)setBottomLinkColor:(id)a3
{
  -[TransitDirectionsColoredLine setLineColor:](self->_bottomLink, "setLineColor:", a3);
}

- (UIColor)bottomLinkColor
{
  return -[TransitDirectionsColoredLine lineColor](self->_bottomLink, "lineColor");
}

- (BOOL)_indentsLinkMap
{
  return 1;
}

- (void)configureWithItem:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TransitDirectionsIconStepView;
  -[TransitDirectionsStepView configureWithItem:](&v4, "configureWithItem:", a3);
  -[TransitDirectionsIconStepView _configureArtworkForFirstUse](self, "_configureArtworkForFirstUse");
  -[TransitDirectionsIconStepView _bottomLinkExtensionHeight](self, "_bottomLinkExtensionHeight");
  -[NSLayoutConstraint setConstant:](self->_bottomLinkToContentViewBottomConstraint, "setConstant:");
  -[TransitDirectionsListItem lineWidthForView:](self->super._transitListItem, "lineWidthForView:", self);
  -[NSLayoutConstraint setConstant:](self->_linkWidthConstraint, "setConstant:");
  -[TransitDirectionsIconStepView _updateLinkColors](self, "_updateLinkColors");
  -[TransitDirectionsIconStepView _updateLinkStyles](self, "_updateLinkStyles");
  -[TransitDirectionsStepView _updateConstraints](self, "_updateConstraints");
}

- (void)_configureArtworkForFirstUse
{
  void *v3;
  void *v4;
  NSNumber *v5;
  NSNumber *hasAlternateImageSource;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView transitListItem](self, "transitListItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "alternateImageSourceForStyle:", -[TransitDirectionsIconStepView _preferredStyle](self, "_preferredStyle")));
  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4 != 0));
  hasAlternateImageSource = self->_hasAlternateImageSource;
  self->_hasAlternateImageSource = v5;

  -[TransitDirectionsIconStepView _updateArtworkTintColor](self, "_updateArtworkTintColor");
  -[TransitDirectionsIconStepView _updateArtwork](self, "_updateArtwork");
}

- (void)_updateArtworkTintColor
{
  uint64_t v3;
  id v4;

  if (-[TransitDirectionsStepView isHighlighted](self, "isHighlighted") && sub_1002A8AA0(self) == 5)
    v3 = objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  else
    v3 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v4 = (id)v3;
  -[MKArtworkImageView setTintColor:](self->_iconImageView, "setTintColor:", v3);

}

- (void)_updateArtwork
{
  void *v3;
  void *v4;
  double v5;
  id v6;

  if (!-[NSNumber BOOLValue](self->_hasAlternateImageSource, "BOOLValue")
    || (-[TransitDirectionsStepView displayOptions](self, "displayOptions") & 1) == 0
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView transitListItem](self, "transitListItem")),
        v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "alternateImageSourceForStyle:", -[TransitDirectionsIconStepView _preferredStyle](self, "_preferredStyle"))), v3, !v6))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView transitListItem](self, "transitListItem"));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageSourceForStyle:", -[TransitDirectionsIconStepView _preferredStyle](self, "_preferredStyle")));

  }
  -[MKArtworkImageView setImageSource:](self->_iconImageView, "setImageSource:", v6);
  -[MKArtworkImageView setHidden:](self->_iconImageView, "setHidden:", v6 == 0);
  -[TransitDirectionsIconStepView _distanceToImageCenterForImageSource:](self, "_distanceToImageCenterForImageSource:", v6);
  -[NSLayoutConstraint setConstant:](self->_topLinkToImageViewCenterConstraint, "setConstant:", -v5);
  -[TransitDirectionsIconStepView _distanceToImageCenterForImageSource:](self, "_distanceToImageCenterForImageSource:", v6);
  -[NSLayoutConstraint setConstant:](self->_bottomLinkToImageViewCenterConstraint, "setConstant:");

}

- (void)_updateForParentExpansionOrCollapse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TransitDirectionsIconStepView;
  -[TransitDirectionsStepView _updateForParentExpansionOrCollapse](&v3, "_updateForParentExpansionOrCollapse");
  -[TransitDirectionsIconStepView _updateLinkColors](self, "_updateLinkColors");
  -[TransitDirectionsIconStepView _updateLinkStyles](self, "_updateLinkStyles");
}

- (unint64_t)_preferredStyle
{
  return 0;
}

- (void)_updateNavigationStateAlpha:(double)a3
{
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TransitDirectionsIconStepView;
  -[TransitDirectionsStepView _updateNavigationStateAlpha:](&v10, "_updateNavigationStateAlpha:");
  v5 = -[TransitDirectionsStepView navigationState](self, "navigationState");
  if (v5 <= 5)
  {
    if (v5 == 2)
      v6 = a3;
    else
      v6 = 1.0;
    if (v5 == 2)
      v7 = 1.0;
    else
      v7 = a3;
    if (((1 << v5) & 0x33) != 0)
    {
      v6 = 1.0;
      v8 = 1.0;
    }
    else
    {
      v8 = v7;
    }
    -[TransitDirectionsColoredLine setAlpha:](self->_topLink, "setAlpha:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsIconStepView iconImageView](self, "iconImageView"));
    objc_msgSend(v9, "setAlpha:", 1.0);

    -[TransitDirectionsColoredLine setAlpha:](self->_bottomLink, "setAlpha:", 1.0);
    -[UIView setAlpha:](self->_iconLinksGroupingView, "setAlpha:", v8);
  }
}

- (double)_calculatedSeparatorHeight
{
  return self->_calculatedSeparatorHeight;
}

- (void)_setCalculatedSeparatorHeight:(double)a3
{
  self->_calculatedSeparatorHeight = a3;
}

- (MKArtworkImageView)iconImageView
{
  return self->_iconImageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hasAlternateImageSource, 0);
  objc_storeStrong((id *)&self->_linkWidthConstraint, 0);
  objc_storeStrong((id *)&self->_bottomLinkToContentViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_bottomLinkToImageViewCenterConstraint, 0);
  objc_storeStrong((id *)&self->_topLinkToContentViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_topLinkToImageViewCenterConstraint, 0);
  objc_storeStrong((id *)&self->_iconLinksGroupingView, 0);
  objc_storeStrong((id *)&self->_bottomLink, 0);
  objc_storeStrong((id *)&self->_topLink, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end
