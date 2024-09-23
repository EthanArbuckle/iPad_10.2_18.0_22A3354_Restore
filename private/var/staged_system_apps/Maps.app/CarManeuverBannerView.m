@implementation CarManeuverBannerView

- (CarManeuverBannerView)initWithTarget:(id)a3 item:(id)a4 aperturePresentation:(BOOL)a5
{
  id v7;
  id v8;
  double y;
  double width;
  double height;
  CarManeuverBannerView *v12;
  CarManeuverBannerView *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  GuidanceManeuverView *v17;
  GuidanceManeuverView *maneuverView;
  UILabel *v19;
  UILabel *primaryLabel;
  UILabel *v21;
  UILabel *secondaryLabel;
  id v23;
  void *v24;
  UIStackView *v25;
  UIStackView *labelStackView;
  UIImageView *v27;
  UIImageView *shieldImageView;
  uint64_t v29;
  CPUIBannerViewButton *actionButton;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSLayoutConstraint *labelsToShieldConstraint;
  void *v43;
  void *v44;
  uint64_t v45;
  NSLayoutConstraint *labelsToButtonConstraint;
  void *v47;
  uint64_t v48;
  NSLayoutConstraint *shieldWidthConstraint;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
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
  id v89;
  id v90;
  objc_super v91;
  _QWORD v92[15];
  _QWORD v93[2];

  v7 = a3;
  v8 = a4;
  v91.receiver = self;
  v91.super_class = (Class)CarManeuverBannerView;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v12 = -[CarManeuverBannerView initWithFrame:](&v91, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v13 = v12;
  if (v12)
  {
    v14 = (objc_class *)objc_opt_class(v12);
    v15 = NSStringFromClass(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    -[CarManeuverBannerView setAccessibilityIdentifier:](v13, "setAccessibilityIdentifier:", v16);

    objc_storeWeak((id *)&v13->_target, v7);
    objc_storeStrong((id *)&v13->_item, a4);
    v17 = -[GuidanceManeuverView initWithFrame:textureProvider:]([GuidanceManeuverView alloc], "initWithFrame:textureProvider:", 0, CGRectZero.origin.x, y, width, height);
    maneuverView = v13->_maneuverView;
    v13->_maneuverView = v17;

    -[GuidanceManeuverView setTranslatesAutoresizingMaskIntoConstraints:](v13->_maneuverView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[GuidanceManeuverView setShieldIdiom:](v13->_maneuverView, "setShieldIdiom:", 1);
    v19 = objc_opt_new(UILabel);
    primaryLabel = v13->_primaryLabel;
    v13->_primaryLabel = v19;

    -[UILabel setAccessibilityIdentifier:](v13->_primaryLabel, "setAccessibilityIdentifier:", CFSTR("PrimaryLabel"));
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v13->_primaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v21 = objc_opt_new(UILabel);
    v90 = v7;
    secondaryLabel = v13->_secondaryLabel;
    v13->_secondaryLabel = v21;

    -[UILabel setAccessibilityIdentifier:](v13->_secondaryLabel, "setAccessibilityIdentifier:", CFSTR("SecondaryLabel"));
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v13->_secondaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v23 = objc_alloc((Class)UIStackView);
    v93[0] = v13->_primaryLabel;
    v93[1] = v13->_secondaryLabel;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v93, 2));
    v25 = (UIStackView *)objc_msgSend(v23, "initWithArrangedSubviews:", v24);
    labelStackView = v13->_labelStackView;
    v13->_labelStackView = v25;

    -[UIStackView setAccessibilityIdentifier:](v13->_labelStackView, "setAccessibilityIdentifier:", CFSTR("LabelStackView"));
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v13->_labelStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v13->_labelStackView, "setAxis:", 1);
    -[UIStackView setDistribution:](v13->_labelStackView, "setDistribution:", 2);
    -[UIStackView setAlignment:](v13->_labelStackView, "setAlignment:", 0);
    v27 = objc_opt_new(UIImageView);
    shieldImageView = v13->_shieldImageView;
    v13->_shieldImageView = v27;

    -[UIImageView setAccessibilityIdentifier:](v13->_shieldImageView, "setAccessibilityIdentifier:", CFSTR("ShieldImageView"));
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v13->_shieldImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v13->_shieldImageView, "setContentMode:", 1);
    v29 = objc_claimAutoreleasedReturnValue(+[CPUIBannerViewButton buttonWithChevronImage](CPUIBannerViewButton, "buttonWithChevronImage"));
    actionButton = v13->_actionButton;
    v13->_actionButton = (CPUIBannerViewButton *)v29;

    -[CPUIBannerViewButton setAccessibilityIdentifier:](v13->_actionButton, "setAccessibilityIdentifier:", CFSTR("ActionButton"));
    -[CPUIBannerViewButton setTranslatesAutoresizingMaskIntoConstraints:](v13->_actionButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "window"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "windowScene"));
    v89 = v8;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "focusSystem"));
    -[CPUIBannerViewButton setSelected:](v13->_actionButton, "setSelected:", v34 != 0);

    LODWORD(v35) = 1148846080;
    -[CPUIBannerViewButton setContentHuggingPriority:forAxis:](v13->_actionButton, "setContentHuggingPriority:forAxis:", 0, v35);
    LODWORD(v36) = 1148846080;
    -[CPUIBannerViewButton setContentHuggingPriority:forAxis:](v13->_actionButton, "setContentHuggingPriority:forAxis:", 1, v36);
    LODWORD(v37) = 1148846080;
    -[CPUIBannerViewButton setContentCompressionResistancePriority:forAxis:](v13->_actionButton, "setContentCompressionResistancePriority:forAxis:", 0, v37);
    LODWORD(v38) = 1148846080;
    -[CPUIBannerViewButton setContentCompressionResistancePriority:forAxis:](v13->_actionButton, "setContentCompressionResistancePriority:forAxis:", 1, v38);
    -[CarManeuverBannerView addSubview:](v13, "addSubview:", v13->_maneuverView);
    -[CarManeuverBannerView addSubview:](v13, "addSubview:", v13->_labelStackView);
    -[CarManeuverBannerView addSubview:](v13, "addSubview:", v13->_shieldImageView);
    -[CarManeuverBannerView addSubview:](v13, "addSubview:", v13->_actionButton);
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](v13->_labelStackView, "trailingAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](v13->_shieldImageView, "leadingAnchor"));
    v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:constant:", v40, -12.0));
    labelsToShieldConstraint = v13->_labelsToShieldConstraint;
    v13->_labelsToShieldConstraint = (NSLayoutConstraint *)v41;

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](v13->_labelStackView, "trailingAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[CPUIBannerViewButton leadingAnchor](v13->_actionButton, "leadingAnchor"));
    v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:constant:", v44, -12.0));
    labelsToButtonConstraint = v13->_labelsToButtonConstraint;
    v13->_labelsToButtonConstraint = (NSLayoutConstraint *)v45;

    v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v13->_shieldImageView, "widthAnchor"));
    v48 = objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToConstant:", 0.0));
    shieldWidthConstraint = v13->_shieldWidthConstraint;
    v13->_shieldWidthConstraint = (NSLayoutConstraint *)v48;

    v88 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView leadingAnchor](v13->_maneuverView, "leadingAnchor"));
    v87 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverBannerView leadingAnchor](v13, "leadingAnchor"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "constraintEqualToAnchor:constant:", v87, 12.0));
    v92[0] = v86;
    v85 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView widthAnchor](v13->_maneuverView, "widthAnchor"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintEqualToConstant:", 33.0));
    v92[1] = v84;
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView centerYAnchor](v13->_maneuverView, "centerYAnchor"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverBannerView centerYAnchor](v13, "centerYAnchor"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "constraintEqualToAnchor:", v82));
    v92[2] = v81;
    v80 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView heightAnchor](v13->_maneuverView, "heightAnchor"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "constraintEqualToConstant:", 33.0));
    v92[3] = v79;
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[CPUIBannerViewButton trailingAnchor](v13->_actionButton, "trailingAnchor"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverBannerView trailingAnchor](v13, "trailingAnchor"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToAnchor:constant:", v77, -12.0));
    v92[4] = v76;
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[CPUIBannerViewButton widthAnchor](v13->_actionButton, "widthAnchor"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToConstant:", 29.0));
    v92[5] = v74;
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[CPUIBannerViewButton centerYAnchor](v13->_actionButton, "centerYAnchor"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverBannerView centerYAnchor](v13, "centerYAnchor"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToAnchor:", v72));
    v92[6] = v71;
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[CPUIBannerViewButton heightAnchor](v13->_actionButton, "heightAnchor"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToConstant:", 29.0));
    v92[7] = v69;
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](v13->_shieldImageView, "trailingAnchor"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[CPUIBannerViewButton leadingAnchor](v13->_actionButton, "leadingAnchor"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintEqualToAnchor:constant:", v67, -12.0));
    v92[8] = v66;
    v92[9] = v13->_shieldWidthConstraint;
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v13->_shieldImageView, "heightAnchor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToConstant:", 16.0));
    v92[10] = v64;
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v13->_shieldImageView, "centerYAnchor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverBannerView centerYAnchor](v13, "centerYAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:", v62));
    v92[11] = v61;
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](v13->_labelStackView, "leadingAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView trailingAnchor](v13->_maneuverView, "trailingAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:constant:", v59, 12.0));
    v92[12] = v50;
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](v13->_labelStackView, "topAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverBannerView topAnchor](v13, "topAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:constant:", v52, 3.0));
    v92[13] = v53;
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](v13->_labelStackView, "bottomAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverBannerView bottomAnchor](v13, "bottomAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:constant:", v55, -3.0));
    v92[14] = v56;
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v92, 15));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v57);

    v8 = v89;
    v7 = v90;

    -[CarManeuverBannerView updateFromBannerItem](v13, "updateFromBannerItem");
  }

  return v13;
}

- (void)updateFromBannerItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  GuidanceManeuverView **p_maneuverView;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  unsigned __int8 v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  unint64_t v46;
  unint64_t v47;
  void *v48;
  unsigned __int8 v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  id *v65;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverBannerView maneuverItem](self, "maneuverItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "maneuverGuidanceInfo"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverBannerView item](self, "item"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "guidanceState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "junction"));
  if (objc_msgSend(v7, "type") == 1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "colorWithAlphaComponent:", 0.600000024));
    p_maneuverView = &self->_maneuverView;
    -[GuidanceManeuverView setAccentColor:](self->_maneuverView, "setAccentColor:", v9);

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    p_maneuverView = &self->_maneuverView;
    -[GuidanceManeuverView setAccentColor:](self->_maneuverView, "setAccentColor:", v8);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "maneuverArtwork"));
  -[GuidanceManeuverView setManeuverArtwork:](*p_maneuverView, "setManeuverArtwork:", v11);

  if (qword_1014D3CE0 != -1)
    dispatch_once(&qword_1014D3CE0, &stru_1011E0460);
  -[UIStackView frame](self->_labelStackView, "frame", self);
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "majorTextAlternatives"));
  v15 = (void *)qword_1014D3CD0;
  v16 = v14;
  v17 = v15;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v18 = v16;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
  if (v19)
  {
    v20 = v19;
    v21 = 0;
    v22 = *(_QWORD *)v68;
LABEL_8:
    v23 = 0;
    v24 = v21;
    while (1)
    {
      if (*(_QWORD *)v68 != v22)
        objc_enumerationMutation(v18);
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)v23), "multiPartAttributedStringWithAttributes:", v17));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "attributedString"));

      objc_msgSend(v21, "boundingRectWithSize:options:context:", 1, 0, 1.79769313e308, 1.79769313e308);
      if (v26 < v13)
        break;
      v23 = (char *)v23 + 1;
      v24 = v21;
      if (v20 == v23)
      {
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
        if (v20)
          goto LABEL_8;
        break;
      }
    }
  }
  else
  {
    v21 = 0;
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65[3], "attributedText"));
  v28 = v21;
  v29 = v27;
  if (v28 | v29)
  {
    v30 = (void *)v29;
    v31 = objc_msgSend((id)v28, "isEqual:", v29);

    if ((v31 & 1) == 0)
      objc_msgSend(v65[3], "setAttributedText:", v28);
  }
  v66 = v4;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "minorTextAlternatives"));
  v33 = (void *)qword_1014D3CD8;
  v34 = v32;
  v35 = v33;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v36 = v34;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
  if (v37)
  {
    v38 = v37;
    v39 = 0;
    v40 = *(_QWORD *)v68;
LABEL_21:
    v41 = 0;
    v42 = v39;
    while (1)
    {
      if (*(_QWORD *)v68 != v40)
        objc_enumerationMutation(v36);
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)v41), "multiPartAttributedStringWithAttributes:", v35));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "attributedString"));

      objc_msgSend(v39, "boundingRectWithSize:options:context:", 1, 0, 1.79769313e308, 1.79769313e308);
      if (v44 < v13)
        break;
      v41 = (char *)v41 + 1;
      v42 = v39;
      if (v38 == v41)
      {
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
        if (v38)
          goto LABEL_21;
        break;
      }
    }
  }
  else
  {
    v39 = 0;
  }

  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65[4], "attributedText"));
  v46 = v39;
  v47 = v45;
  if (v46 | v47)
  {
    v48 = (void *)v47;
    v49 = objc_msgSend((id)v46, "isEqual:", v47);

    if ((v49 & 1) == 0)
      objc_msgSend(v65[4], "setAttributedText:", v46);
  }
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "shieldInfo"));
  v51 = v50;
  if (v50)
  {
    if (!objc_msgSend(v50, "isEqual:", v65[7]))
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen _carScreen](UIScreen, "_carScreen"));
      objc_msgSend(v53, "scale");
      v55 = v54;

      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "shieldImageWithSize:scale:idiom:", 5, 1, v55));
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", objc_msgSend(v56, "image"), 0, v55));
      objc_msgSend(v65[5], "setImage:", v57);
      objc_storeStrong(v65 + 7, v51);
      if (v57)
      {
        objc_msgSend(v57, "size");
        v59 = 16.0 / v58;
        objc_msgSend(v57, "size");
        v61 = v59 * v60;
      }
      else
      {
        v61 = 0.0;
      }
      objc_msgSend(v65[12], "setConstant:", v61);

    }
  }
  else
  {
    objc_msgSend(v65[5], "setImage:", 0);
    v52 = v65[7];
    v65[7] = 0;

    objc_msgSend(v65[12], "setConstant:", 0.0);
  }
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65[5], "image"));

  if (v62)
    v63 = 9;
  else
    v63 = 8;
  if (v62)
    v64 = 8;
  else
    v64 = 9;
  objc_msgSend(*(id *)((char *)v65 + OBJC_IVAR___CarManeuverBannerView__target[v63]), "setActive:", 0);
  objc_msgSend(*(id *)((char *)v65 + OBJC_IVAR___CarManeuverBannerView__target[v64]), "setActive:", 1);

}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = 54.0;
  result.height = v3;
  return result;
}

- (unint64_t)bannerType
{
  return 0;
}

- (BNBannerSource)target
{
  return (BNBannerSource *)objc_loadWeakRetained((id *)&self->_target);
}

- (BannerItem)item
{
  return self->_item;
}

- (BOOL)aperturePresentation
{
  return self->_aperturePresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_destroyWeak((id *)&self->_target);
  objc_storeStrong((id *)&self->_shieldWidthConstraint, 0);
  objc_storeStrong((id *)&self->_labelsToButtonConstraint, 0);
  objc_storeStrong((id *)&self->_labelsToShieldConstraint, 0);
  objc_storeStrong((id *)&self->_selectedSecondaryString, 0);
  objc_storeStrong((id *)&self->_selectedPrimaryString, 0);
  objc_storeStrong((id *)&self->_cachedShieldInfo, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_shieldImageView, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_maneuverView, 0);
}

@end
