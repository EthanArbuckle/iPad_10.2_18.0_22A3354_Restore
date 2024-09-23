@implementation TransitDirectionsIncidentStepView

- (TransitDirectionsIncidentStepView)initWithFrame:(CGRect)a3
{
  TransitDirectionsIncidentStepView *v3;
  void *v4;
  id v5;
  double y;
  double width;
  double height;
  UIView *v9;
  UIView *backgroundView;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  UIImageView *v15;
  UIImageView *chevronImageView;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  UILabel *v22;
  UILabel *label;
  void *v24;
  double v25;
  double v26;
  MKArtworkImageView *v27;
  MKArtworkImageView *imageView;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSLayoutConstraint *artworkShowingLabelConstraint;
  void *v37;
  void *v38;
  uint64_t v39;
  NSLayoutConstraint *artworkHiddenLabelConstraint;
  void *v41;
  void *v42;
  uint64_t v43;
  NSLayoutConstraint *chevronShowingLabelConstraint;
  void *v45;
  void *v46;
  uint64_t v47;
  NSLayoutConstraint *chevronHiddenLabelConstraint;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  UITapGestureRecognizer *v58;
  UITapGestureRecognizer *tapGesture;
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
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  objc_super v96;
  _QWORD v97[15];

  v96.receiver = self;
  v96.super_class = (Class)TransitDirectionsIncidentStepView;
  v3 = -[TransitDirectionsStepView initWithFrame:](&v96, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[TransitDirectionsIncidentStepView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[TransitDirectionsIncidentStepView setOpaque:](v3, "setOpaque:", 0);
    -[TransitDirectionsIncidentStepView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("TransitDirectionsIncidentStep"));
    v5 = objc_alloc((Class)UIView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v9 = (UIView *)objc_msgSend(v5, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = v9;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "colorWithAlphaComponent:", 0.119999997));
    -[UIView setBackgroundColor:](v3->_backgroundView, "setBackgroundColor:", v12);

    -[UIView _setContinuousCornerRadius:](v3->_backgroundView, "_setContinuousCornerRadius:", 10.0);
    -[TransitDirectionsIncidentStepView addSubview:](v3, "addSubview:", v3->_backgroundView);
    v95 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithTextStyle:](UIImageSymbolConfiguration, "configurationWithTextStyle:", UIFontTextStyleBody));
    v13 = objc_alloc((Class)UIImageView);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("chevron.forward"), v95));
    v15 = (UIImageView *)objc_msgSend(v13, "initWithImage:", v14);
    chevronImageView = v3->_chevronImageView;
    v3->_chevronImageView = v15;

    -[UIImageView setAccessibilityIdentifier:](v3->_chevronImageView, "setAccessibilityIdentifier:", CFSTR("ChevronImageView"));
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_chevronImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
    -[UIImageView setTintColor:](v3->_chevronImageView, "setTintColor:", v17);

    LODWORD(v18) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](v3->_chevronImageView, "setContentHuggingPriority:forAxis:", 0, v18);
    LODWORD(v19) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](v3->_chevronImageView, "setContentHuggingPriority:forAxis:", 1, v19);
    LODWORD(v20) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v3->_chevronImageView, "setContentCompressionResistancePriority:forAxis:", 0, v20);
    LODWORD(v21) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v3->_chevronImageView, "setContentCompressionResistancePriority:forAxis:", 1, v21);
    -[TransitDirectionsIncidentStepView addSubview:](v3, "addSubview:", v3->_chevronImageView);
    v22 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    label = v3->_label;
    v3->_label = v22;

    -[UILabel setAccessibilityIdentifier:](v3->_label, "setAccessibilityIdentifier:", CFSTR("Label"));
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline));
    -[UILabel setFont:](v3->_label, "setFont:", v24);

    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_label, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setLineBreakMode:](v3->_label, "setLineBreakMode:", 4);
    LODWORD(v25) = 1132003328;
    -[UILabel setContentHuggingPriority:forAxis:](v3->_label, "setContentHuggingPriority:forAxis:", 0, v25);
    LODWORD(v26) = 1144750080;
    -[UILabel setContentHuggingPriority:forAxis:](v3->_label, "setContentHuggingPriority:forAxis:", 1, v26);
    -[TransitDirectionsIncidentStepView addSubview:](v3, "addSubview:", v3->_label);
    v27 = (MKArtworkImageView *)objc_msgSend(objc_alloc((Class)MKArtworkImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    imageView = v3->_imageView;
    v3->_imageView = v27;

    -[MKArtworkImageView setAccessibilityIdentifier:](v3->_imageView, "setAccessibilityIdentifier:", CFSTR("ImageView"));
    -[MKArtworkImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v29) = 1148846080;
    -[MKArtworkImageView setContentHuggingPriority:forAxis:](v3->_imageView, "setContentHuggingPriority:forAxis:", 0, v29);
    LODWORD(v30) = 1148846080;
    -[MKArtworkImageView setContentHuggingPriority:forAxis:](v3->_imageView, "setContentHuggingPriority:forAxis:", 1, v30);
    LODWORD(v31) = 1148846080;
    -[MKArtworkImageView setContentCompressionResistancePriority:forAxis:](v3->_imageView, "setContentCompressionResistancePriority:forAxis:", 0, v31);
    LODWORD(v32) = 1148846080;
    -[MKArtworkImageView setContentCompressionResistancePriority:forAxis:](v3->_imageView, "setContentCompressionResistancePriority:forAxis:", 1, v32);
    -[TransitDirectionsIncidentStepView addSubview:](v3, "addSubview:", v3->_imageView);
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v3->_label, "leadingAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView trailingAnchor](v3->_imageView, "trailingAnchor"));
    v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34, 8.0));
    artworkShowingLabelConstraint = v3->_artworkShowingLabelConstraint;
    v3->_artworkShowingLabelConstraint = (NSLayoutConstraint *)v35;

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v3->_label, "leadingAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v3->_backgroundView, "leadingAnchor"));
    v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:constant:", v38, 12.0));
    artworkHiddenLabelConstraint = v3->_artworkHiddenLabelConstraint;
    v3->_artworkHiddenLabelConstraint = (NSLayoutConstraint *)v39;

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](v3->_chevronImageView, "leadingAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v3->_label, "trailingAnchor"));
    v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:constant:", v42, 8.0));
    chevronShowingLabelConstraint = v3->_chevronShowingLabelConstraint;
    v3->_chevronShowingLabelConstraint = (NSLayoutConstraint *)v43;

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v3->_backgroundView, "trailingAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v3->_label, "trailingAnchor"));
    v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:constant:", v46, 12.0));
    chevronHiddenLabelConstraint = v3->_chevronHiddenLabelConstraint;
    v3->_chevronHiddenLabelConstraint = (NSLayoutConstraint *)v47;

    v93 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v3->_backgroundView, "topAnchor"));
    v94 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView contentLayoutGuide](v3, "contentLayoutGuide"));
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "topAnchor"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintEqualToAnchor:", v92));
    v97[0] = v91;
    v89 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v3->_backgroundView, "leadingAnchor"));
    v90 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView contentLayoutGuide](v3, "contentLayoutGuide"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "leadingAnchor"));
    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "constraintEqualToAnchor:", v88));
    v97[1] = v87;
    v86 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView contentLayoutGuide](v3, "contentLayoutGuide"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "trailingAnchor"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v3->_backgroundView, "trailingAnchor"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintEqualToAnchor:", v84));
    v97[2] = v83;
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView contentLayoutGuide](v3, "contentLayoutGuide"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "bottomAnchor"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v3->_backgroundView, "bottomAnchor"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "constraintEqualToAnchor:", v80));
    v97[3] = v79;
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v3->_backgroundView, "heightAnchor"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintGreaterThanOrEqualToConstant:", 44.0));
    v97[4] = v77;
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v3->_chevronImageView, "centerYAnchor"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v3->_backgroundView, "centerYAnchor"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "constraintEqualToAnchor:", v75));
    v97[5] = v74;
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v3->_backgroundView, "trailingAnchor"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](v3->_chevronImageView, "trailingAnchor"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToAnchor:constant:", v72, 11.0));
    v97[6] = v71;
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView leadingAnchor](v3->_imageView, "leadingAnchor"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v3->_backgroundView, "leadingAnchor"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToAnchor:constant:", v69, 12.0));
    v97[7] = v68;
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView centerYAnchor](v3->_imageView, "centerYAnchor"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v3->_backgroundView, "centerYAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToAnchor:", v66));
    v97[8] = v65;
    v97[9] = v3->_artworkShowingLabelConstraint;
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v3->_label, "topAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v3->_backgroundView, "topAnchor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:constant:", v63, 8.0));
    v97[10] = v62;
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v3->_label, "leadingAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView trailingAnchor](v3->_imageView, "trailingAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:constant:", v49, 8.0));
    v97[11] = v50;
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](v3->_label, "centerYAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v3->_backgroundView, "centerYAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v52));
    v97[12] = v53;
    v97[13] = v3->_chevronShowingLabelConstraint;
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v3->_backgroundView, "bottomAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v3->_label, "bottomAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:constant:", v55, 8.0));
    v97[14] = v56;
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v97, 15));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v57);

    v58 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v3, "_tapped");
    tapGesture = v3->_tapGesture;
    v3->_tapGesture = v58;

    -[TransitDirectionsIncidentStepView addGestureRecognizer:](v3, "addGestureRecognizer:", v3->_tapGesture);
  }
  return v3;
}

- (id)_incidentItem
{
  TransitDirectionsListItem *transitListItem;
  uint64_t v4;
  TransitDirectionsListItem *v5;

  transitListItem = self->super._transitListItem;
  v4 = objc_opt_class(TransitDirectionsListItemIncident, a2);
  if ((objc_opt_isKindOfClass(transitListItem, v4) & 1) != 0)
    v5 = self->super._transitListItem;
  else
    v5 = 0;
  return v5;
}

- (void)configureWithItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _BOOL8 v16;
  _BOOL8 v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  objc_super v33;
  NSAttributedStringKey v34;
  void *v35;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)TransitDirectionsIncidentStepView;
  -[TransitDirectionsStepView configureWithItem:](&v33, "configureWithItem:", v4);
  if (objc_msgSend(v4, "type") != (id)13)
  {

    v4 = 0;
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsIncidentStepView _incidentItem](self, "_incidentItem"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "incidentMessage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "advisory"));
  v6 = objc_alloc((Class)MKServerFormattedString);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "titleString"));
  v8 = objc_msgSend(v6, "initWithComposedString:", v7);

  v34 = NSFontAttributeName;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_label, "font"));
  v35 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));
  v28 = v8;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "multiPartAttributedStringWithAttributes:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "attributedString"));
  -[UILabel setAttributedText:](self->_label, "setAttributedText:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "artwork"));
  v14 = objc_msgSend(objc_alloc((Class)MKSizedTransitArtwork), "initWithArtwork:shieldSize:", v13, 3);
  -[MKArtworkImageView setImageSource:](self->_imageView, "setImageSource:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView image](self->_imageView, "image"));
  v16 = v15 != 0;
  v17 = v15 == 0;

  -[MKArtworkImageView setHidden:](self->_imageView, "setHidden:", v17);
  -[NSLayoutConstraint setActive:](self->_artworkShowingLabelConstraint, "setActive:", v16);
  -[NSLayoutConstraint setActive:](self->_artworkHiddenLabelConstraint, "setActive:", v17);
  v18 = objc_msgSend(v5, "isClickable");
  -[UITapGestureRecognizer setEnabled:](self->_tapGesture, "setEnabled:", v18);
  -[UIImageView setHidden:](self->_chevronImageView, "setHidden:", v18 ^ 1);
  -[NSLayoutConstraint setActive:](self->_chevronShowingLabelConstraint, "setActive:", v18);
  -[NSLayoutConstraint setActive:](self->_chevronHiddenLabelConstraint, "setActive:", v18 ^ 1);
  if ((_DWORD)v18)
    v19 = 2;
  else
    v19 = 0;
  -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView image](self->_imageView, "image"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "_maps_mostCommonColor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "colorWithAlphaComponent:", 0.200000003));
  v23 = v22;
  if (v22)
    v24 = v22;
  else
    v24 = (id)objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor"));
  v25 = v24;

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1003E5054;
  v31[3] = &unk_1011B4830;
  v32 = v25;
  v26 = v25;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", v31));
  -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", v27);

}

- (void)_tapped
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsIncidentStepView _incidentItem](self, "_incidentItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "incidentMessage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "advisory"));
  v5 = objc_msgSend(v4, "isClickable");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsIncidentStepView delegate](self, "delegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "advisory"));
    objc_msgSend(v6, "transitDirectionsCell:didTapAdvisory:", self, v7);

  }
}

- (void)_updateNavigationStateAlpha:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TransitDirectionsIncidentStepView;
  -[TransitDirectionsStepView _updateNavigationStateAlpha:](&v5, "_updateNavigationStateAlpha:");
  -[MKArtworkImageView setAlpha:](self->_imageView, "setAlpha:", a3);
  -[UILabel setAlpha:](self->_label, "setAlpha:", a3);
  -[UIImageView setAlpha:](self->_chevronImageView, "setAlpha:", a3);
}

- (TransitDirectionsIncidentCellDelegate)delegate
{
  return (TransitDirectionsIncidentCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_chevronHiddenLabelConstraint, 0);
  objc_storeStrong((id *)&self->_chevronShowingLabelConstraint, 0);
  objc_storeStrong((id *)&self->_artworkHiddenLabelConstraint, 0);
  objc_storeStrong((id *)&self->_artworkShowingLabelConstraint, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_chevronImageView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
