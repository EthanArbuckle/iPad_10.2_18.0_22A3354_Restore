@implementation RouteStepManeuverView

- (RouteStepManeuverView)initWithFrame:(CGRect)a3
{
  RouteStepManeuverView *v3;
  UIView *v4;
  UIView *v5;
  GuidanceManeuverView *v6;
  GuidanceManeuverView *guidanceManeuverView;
  UIImageView *v8;
  UIImageView *shieldImageView;
  UIView *v10;
  UILabel *v11;
  UILabel *primaryTextLabel;
  UILabel *v13;
  UILabel *secondaryTextLabel;
  UILabel *v15;
  UILabel *tertiaryTextLabel;
  void *v17;
  uint64_t v18;
  NSLayoutConstraint *containerWidthConstraint;
  void *v20;
  uint64_t v21;
  NSLayoutConstraint *imageWidthConstraint;
  void *v23;
  uint64_t v24;
  NSLayoutConstraint *imageHeightConstraint;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSLayoutConstraint *primaryTrailingConstraint;
  void *v31;
  void *v32;
  uint64_t v33;
  NSLayoutConstraint *primaryTopConstraint;
  void *v35;
  void *v36;
  uint64_t v37;
  NSLayoutConstraint *secondaryTopConstraint;
  void *v39;
  void *v40;
  uint64_t v41;
  NSLayoutConstraint *tertiaryTopConstraint;
  void *v43;
  void *v44;
  uint64_t v45;
  NSLayoutConstraint *textToBottomConstraint;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
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
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  UIView *v104;
  UIView *v105;
  objc_super v106;
  _QWORD v107[25];

  v106.receiver = self;
  v106.super_class = (Class)RouteStepManeuverView;
  v3 = -[RouteStepListView initWithFrame:](&v106, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_new(UIView);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v104 = v4;
    -[RouteStepManeuverView addSubview:](v3, "addSubview:", v4);
    v5 = objc_opt_new(UIView);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", CFSTR("ImageContainer"));
    -[RouteStepManeuverView addSubview:](v3, "addSubview:", v5);
    v6 = -[GuidanceManeuverView initWithFrame:textureProvider:]([GuidanceManeuverView alloc], "initWithFrame:textureProvider:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    guidanceManeuverView = v3->_guidanceManeuverView;
    v3->_guidanceManeuverView = v6;

    -[GuidanceManeuverView setTranslatesAutoresizingMaskIntoConstraints:](v3->_guidanceManeuverView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[GuidanceManeuverView setFraming:](v3->_guidanceManeuverView, "setFraming:", 1);
    -[UIView addSubview:](v5, "addSubview:", v3->_guidanceManeuverView);
    v8 = objc_opt_new(UIImageView);
    shieldImageView = v3->_shieldImageView;
    v3->_shieldImageView = v8;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_shieldImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v3->_shieldImageView, "setContentMode:", 1);
    -[UIImageView setAccessibilityIdentifier:](v3->_shieldImageView, "setAccessibilityIdentifier:", CFSTR("ShieldImage"));
    v10 = v5;
    -[UIView addSubview:](v5, "addSubview:", v3->_shieldImageView);
    v11 = objc_opt_new(UILabel);
    primaryTextLabel = v3->_primaryTextLabel;
    v3->_primaryTextLabel = v11;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_primaryTextLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_primaryTextLabel, "setNumberOfLines:", 0);
    -[UILabel setAccessibilityIdentifier:](v3->_primaryTextLabel, "setAccessibilityIdentifier:", CFSTR("PrimaryTextLabel"));
    -[RouteStepManeuverView addSubview:](v3, "addSubview:", v3->_primaryTextLabel);
    v13 = objc_opt_new(UILabel);
    secondaryTextLabel = v3->_secondaryTextLabel;
    v3->_secondaryTextLabel = v13;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_secondaryTextLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_secondaryTextLabel, "setNumberOfLines:", 0);
    -[UILabel setAccessibilityIdentifier:](v3->_secondaryTextLabel, "setAccessibilityIdentifier:", CFSTR("SecondaryTextLabel"));
    -[RouteStepManeuverView addSubview:](v3, "addSubview:", v3->_secondaryTextLabel);
    v15 = objc_opt_new(UILabel);
    tertiaryTextLabel = v3->_tertiaryTextLabel;
    v3->_tertiaryTextLabel = v15;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_tertiaryTextLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_tertiaryTextLabel, "setNumberOfLines:", 0);
    -[UILabel setAccessibilityIdentifier:](v3->_tertiaryTextLabel, "setAccessibilityIdentifier:", CFSTR("TertiaryTextLabel"));
    -[RouteStepManeuverView addSubview:](v3, "addSubview:", v3->_tertiaryTextLabel);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v4, "widthAnchor"));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToConstant:", 0.0));
    containerWidthConstraint = v3->_containerWidthConstraint;
    v3->_containerWidthConstraint = (NSLayoutConstraint *)v18;

    v105 = v10;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v10, "widthAnchor"));
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToConstant:", 0.0));
    imageWidthConstraint = v3->_imageWidthConstraint;
    v3->_imageWidthConstraint = (NSLayoutConstraint *)v21;

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v10, "heightAnchor"));
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToConstant:", 0.0));
    imageHeightConstraint = v3->_imageHeightConstraint;
    v3->_imageHeightConstraint = (NSLayoutConstraint *)v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v3->_primaryTextLabel, "trailingAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "trailingAnchor"));
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v28));
    primaryTrailingConstraint = v3->_primaryTrailingConstraint;
    v3->_primaryTrailingConstraint = (NSLayoutConstraint *)v29;

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v3->_primaryTextLabel, "topAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverView topAnchor](v3, "topAnchor"));
    v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v32));
    primaryTopConstraint = v3->_primaryTopConstraint;
    v3->_primaryTopConstraint = (NSLayoutConstraint *)v33;

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v3->_secondaryTextLabel, "topAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v3->_primaryTextLabel, "bottomAnchor"));
    v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v36));
    secondaryTopConstraint = v3->_secondaryTopConstraint;
    v3->_secondaryTopConstraint = (NSLayoutConstraint *)v37;

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v3->_tertiaryTextLabel, "topAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v3->_secondaryTextLabel, "bottomAnchor"));
    v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v40));
    tertiaryTopConstraint = v3->_tertiaryTopConstraint;
    v3->_tertiaryTopConstraint = (NSLayoutConstraint *)v41;

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v3->_tertiaryTextLabel, "bottomAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverView bottomAnchor](v3, "bottomAnchor"));
    v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v44));
    textToBottomConstraint = v3->_textToBottomConstraint;
    v3->_textToBottomConstraint = (NSLayoutConstraint *)v45;

    v102 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v104, "leadingAnchor"));
    v103 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide"));
    v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "leadingAnchor"));
    v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "constraintEqualToAnchor:", v101));
    v107[0] = v100;
    v107[1] = v3->_containerWidthConstraint;
    v99 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v104, "topAnchor"));
    v98 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverView topAnchor](v3, "topAnchor"));
    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "constraintEqualToAnchor:", v98));
    v107[2] = v97;
    v96 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v104, "bottomAnchor"));
    v95 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverView bottomAnchor](v3, "bottomAnchor"));
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "constraintEqualToAnchor:", v95));
    v107[3] = v94;
    v93 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v105, "centerXAnchor"));
    v92 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v104, "centerXAnchor"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintEqualToAnchor:", v92));
    v107[4] = v91;
    v90 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v105, "centerYAnchor"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v104, "centerYAnchor"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "constraintEqualToAnchor:", v89));
    v107[5] = v88;
    v107[6] = v3->_imageWidthConstraint;
    v107[7] = v3->_imageHeightConstraint;
    v87 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView leadingAnchor](v3->_guidanceManeuverView, "leadingAnchor"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v105, "leadingAnchor"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "constraintEqualToAnchor:", v85));
    v107[8] = v84;
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView trailingAnchor](v3->_guidanceManeuverView, "trailingAnchor"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v105, "trailingAnchor"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "constraintEqualToAnchor:", v82));
    v107[9] = v81;
    v80 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView topAnchor](v3->_guidanceManeuverView, "topAnchor"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v105, "topAnchor"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "constraintEqualToAnchor:", v79));
    v107[10] = v78;
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView bottomAnchor](v3->_guidanceManeuverView, "bottomAnchor"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v105, "bottomAnchor"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToAnchor:", v76));
    v107[11] = v75;
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](v3->_shieldImageView, "leadingAnchor"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v105, "leadingAnchor"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToAnchor:", v73));
    v107[12] = v72;
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](v3->_shieldImageView, "trailingAnchor"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v105, "trailingAnchor"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintEqualToAnchor:", v70));
    v107[13] = v69;
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](v3->_shieldImageView, "topAnchor"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v105, "topAnchor"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintEqualToAnchor:", v67));
    v107[14] = v66;
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](v3->_shieldImageView, "bottomAnchor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v105, "bottomAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToAnchor:", v64));
    v107[15] = v63;
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v3->_primaryTextLabel, "leadingAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v104, "trailingAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:", v61));
    v107[16] = v60;
    v107[17] = v3->_primaryTrailingConstraint;
    v107[18] = v3->_primaryTopConstraint;
    v86 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v3->_secondaryTextLabel, "leadingAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v3->_primaryTextLabel, "leadingAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "constraintEqualToAnchor:", v59));
    v107[19] = v58;
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v3->_secondaryTextLabel, "trailingAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v3->_primaryTextLabel, "trailingAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:", v47));
    v107[20] = v48;
    v107[21] = v3->_secondaryTopConstraint;
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v3->_tertiaryTextLabel, "leadingAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v3->_primaryTextLabel, "leadingAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v50));
    v107[22] = v51;
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v3->_tertiaryTextLabel, "trailingAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v3->_primaryTextLabel, "trailingAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v53));
    v107[23] = v54;
    v107[24] = v3->_tertiaryTopConstraint;
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v107, 25));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v55);

  }
  return v3;
}

- (void)setShouldUseTextToBottomConstraint:(BOOL)a3
{
  if (self->_shouldUseTextToBottomConstraint != a3)
  {
    self->_shouldUseTextToBottomConstraint = a3;
    -[NSLayoutConstraint setActive:](self->_textToBottomConstraint, "setActive:");
  }
}

+ (double)heightForItem:(id)a3 width:(double)a4 maximumHeight:(double)a5
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;

  v6 = a3;
  v7 = objc_opt_class(RouteStepManeuverItem);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metrics"));
  objc_msgSend(v10, "imageAreaWidth");
  v12 = a4 - v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metrics"));
  objc_msgSend(v13, "textTrailingMargin");
  v15 = v12 - v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingView"));
  objc_msgSend(v16, "frame");
  v18 = v15 - v17;

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metrics"));
  objc_msgSend(v19, "imageTopMargin");
  v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metrics"));
  objc_msgSend(v22, "stepImageHeight");
  v24 = v23;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metrics"));
  objc_msgSend(v25, "imageBottomMargin");
  v27 = v26;

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "primaryText"));
  if (v28)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metrics"));
    objc_msgSend(v29, "primaryTextTopMargin");
    v31 = v30 + 0.0;

    objc_msgSend(v28, "boundingRectWithSize:options:context:", 1, 0, v18, 1.79769313e308);
    v33 = v31 + ceil(v32);
  }
  else
  {
    v33 = 0.0;
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "secondaryText"));
  if (v34)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metrics"));
    objc_msgSend(v35, "secondaryTextTopMargin");
    v37 = v33 + v36;

    objc_msgSend(v34, "boundingRectWithSize:options:context:", 1, 0, v18, 1.79769313e308);
    v33 = v37 + ceil(v38);
  }
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tertiaryText"));
  if (v39)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metrics"));
    objc_msgSend(v40, "tertiaryTextTopMargin");
    v42 = v33 + v41;

    objc_msgSend(v39, "boundingRectWithSize:options:context:", 1, 0, v18, 1.79769313e308);
    v33 = v42 + ceil(v43);
  }
  v44 = v21 + v24 + v27;
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metrics"));
  objc_msgSend(v45, "textBottomMargin");
  v47 = v33 + v46;

  if (v44 <= v47)
    v44 = v47;

  return v44;
}

- (void)setTrailingView:(id)a3
{
  UIView *v5;
  UIView **p_trailingView;
  UIView *trailingView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v5 = (UIView *)a3;
  p_trailingView = &self->_trailingView;
  trailingView = self->_trailingView;
  if (trailingView != v5)
  {
    -[UIView removeFromSuperview](trailingView, "removeFromSuperview");
    if (v5)
    {
      -[RouteStepManeuverView addSubview:](self, "addSubview:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v5, "trailingAnchor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverView trailingAnchor](self, "trailingAnchor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
      v15[0] = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v5, "centerYAnchor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverView centerYAnchor](self, "centerYAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
      v15[1] = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

    }
    objc_storeStrong((id *)p_trailingView, a3);
  }

}

- (void)setItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
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
  void *v57;
  void *v58;
  void *v59;
  _BYTE v60[496];
  _OWORD v61[31];
  _BYTE __dst[496];
  objc_super __src[31];
  objc_super v64;

  v64.receiver = self;
  v64.super_class = (Class)RouteStepManeuverView;
  -[RouteStepListView setItem:](&v64, "setItem:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListView item](self, "item"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingView"));
  -[RouteStepManeuverView setTrailingView:](self, "setTrailingView:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metrics"));
  objc_msgSend(v6, "imageAreaWidth");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverView containerWidthConstraint](self, "containerWidthConstraint"));
  objc_msgSend(v9, "setConstant:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metrics"));
  objc_msgSend(v10, "stepImageWidth");
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverView imageWidthConstraint](self, "imageWidthConstraint"));
  objc_msgSend(v13, "setConstant:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metrics"));
  objc_msgSend(v14, "stepImageHeight");
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverView imageHeightConstraint](self, "imageHeightConstraint"));
  objc_msgSend(v17, "setConstant:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metrics"));
  objc_msgSend(v18, "textTrailingMargin");
  v20 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverView trailingView](self, "trailingView"));
  objc_msgSend(v21, "frame");
  v23 = -(v20 + v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverView primaryTrailingConstraint](self, "primaryTrailingConstraint"));
  objc_msgSend(v24, "setConstant:", v23);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metrics"));
  objc_msgSend(v25, "primaryTextTopMargin");
  v27 = v26;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverView primaryTopConstraint](self, "primaryTopConstraint"));
  objc_msgSend(v28, "setConstant:", v27);

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metrics"));
  objc_msgSend(v29, "secondaryTextTopMargin");
  v31 = v30;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverView secondaryTopConstraint](self, "secondaryTopConstraint"));
  objc_msgSend(v32, "setConstant:", v31);

  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metrics"));
  objc_msgSend(v33, "tertiaryTextTopMargin");
  v35 = v34;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverView tertiaryTopConstraint](self, "tertiaryTopConstraint"));
  objc_msgSend(v36, "setConstant:", v35);

  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metrics"));
  objc_msgSend(v37, "textBottomMargin");
  v39 = -v38;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverView textToBottomConstraint](self, "textToBottomConstraint"));
  objc_msgSend(v40, "setConstant:", v39);

  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "primaryText"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverView primaryTextLabel](self, "primaryTextLabel"));
  objc_msgSend(v42, "setAttributedText:", v41);

  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "secondaryText"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverView secondaryTextLabel](self, "secondaryTextLabel"));
  objc_msgSend(v44, "setAttributedText:", v43);

  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tertiaryText"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverView tertiaryTextLabel](self, "tertiaryTextLabel"));
  objc_msgSend(v46, "setAttributedText:", v45);

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverView shieldImageView](self, "shieldImageView"));
  objc_msgSend(v47, "setImage:", 0);

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverView guidanceManeuverView](self, "guidanceManeuverView"));
  objc_msgSend(v48, "setManeuverArtwork:", 0);

  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shieldImage"));
  if (v49)
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shieldImage"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverView shieldImageView](self, "shieldImageView"));
    objc_msgSend(v51, "setImage:", v50);
LABEL_11:

    goto LABEL_12;
  }
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "maneuverArtwork"));

  if (v52)
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "maneuverArtwork"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverView guidanceManeuverView](self, "guidanceManeuverView"));
    objc_msgSend(v54, "setManeuverArtwork:", v53);

    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metrics"));
    v56 = v55;
    if (v55)
      objc_msgSend(v55, "arrowMetrics");
    else
      memset(__src, 0, sizeof(__src));
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverView guidanceManeuverView](self, "guidanceManeuverView"));
    memcpy(__dst, __src, sizeof(__dst));
    objc_msgSend(v57, "setArrowMetrics:", __dst);

    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metrics"));
    v50 = v58;
    if (v58)
      objc_msgSend(v58, "junctionArrowMetrics");
    else
      memset(v61, 0, sizeof(v61));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverView guidanceManeuverView](self, "guidanceManeuverView"));
    memcpy(v60, v61, sizeof(v60));
    objc_msgSend(v51, "setJunctionArrowMetrics:", v60);
    goto LABEL_11;
  }
LABEL_12:
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "backgroundColor"));
  -[RouteStepManeuverView setBackgroundColor:](self, "setBackgroundColor:", v59);

}

- (BOOL)shouldUseTextToBottomConstraint
{
  return self->_shouldUseTextToBottomConstraint;
}

- (UIImageView)shieldImageView
{
  return self->_shieldImageView;
}

- (void)setShieldImageView:(id)a3
{
  objc_storeStrong((id *)&self->_shieldImageView, a3);
}

- (GuidanceManeuverView)guidanceManeuverView
{
  return self->_guidanceManeuverView;
}

- (void)setGuidanceManeuverView:(id)a3
{
  objc_storeStrong((id *)&self->_guidanceManeuverView, a3);
}

- (UILabel)primaryTextLabel
{
  return self->_primaryTextLabel;
}

- (void)setPrimaryTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_primaryTextLabel, a3);
}

- (UILabel)secondaryTextLabel
{
  return self->_secondaryTextLabel;
}

- (void)setSecondaryTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryTextLabel, a3);
}

- (UILabel)tertiaryTextLabel
{
  return self->_tertiaryTextLabel;
}

- (void)setTertiaryTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_tertiaryTextLabel, a3);
}

- (UIView)trailingView
{
  return self->_trailingView;
}

- (NSLayoutConstraint)containerWidthConstraint
{
  return self->_containerWidthConstraint;
}

- (void)setContainerWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_containerWidthConstraint, a3);
}

- (NSLayoutConstraint)imageWidthConstraint
{
  return self->_imageWidthConstraint;
}

- (void)setImageWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageWidthConstraint, a3);
}

- (NSLayoutConstraint)imageHeightConstraint
{
  return self->_imageHeightConstraint;
}

- (void)setImageHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageHeightConstraint, a3);
}

- (NSLayoutConstraint)primaryTrailingConstraint
{
  return self->_primaryTrailingConstraint;
}

- (void)setPrimaryTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_primaryTrailingConstraint, a3);
}

- (NSLayoutConstraint)primaryTopConstraint
{
  return self->_primaryTopConstraint;
}

- (void)setPrimaryTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_primaryTopConstraint, a3);
}

- (NSLayoutConstraint)secondaryTopConstraint
{
  return self->_secondaryTopConstraint;
}

- (void)setSecondaryTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryTopConstraint, a3);
}

- (NSLayoutConstraint)tertiaryTopConstraint
{
  return self->_tertiaryTopConstraint;
}

- (void)setTertiaryTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_tertiaryTopConstraint, a3);
}

- (NSLayoutConstraint)textToBottomConstraint
{
  return self->_textToBottomConstraint;
}

- (void)setTextToBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textToBottomConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_tertiaryTopConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryTopConstraint, 0);
  objc_storeStrong((id *)&self->_primaryTopConstraint, 0);
  objc_storeStrong((id *)&self->_primaryTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_imageHeightConstraint, 0);
  objc_storeStrong((id *)&self->_imageWidthConstraint, 0);
  objc_storeStrong((id *)&self->_containerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_tertiaryTextLabel, 0);
  objc_storeStrong((id *)&self->_secondaryTextLabel, 0);
  objc_storeStrong((id *)&self->_primaryTextLabel, 0);
  objc_storeStrong((id *)&self->_guidanceManeuverView, 0);
  objc_storeStrong((id *)&self->_shieldImageView, 0);
}

@end
