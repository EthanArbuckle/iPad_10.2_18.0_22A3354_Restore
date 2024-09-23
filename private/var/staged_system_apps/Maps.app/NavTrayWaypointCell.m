@implementation NavTrayWaypointCell

- (NavTrayWaypointCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  NavTrayWaypointCell *v4;
  NavTrayWaypointCell *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  UIView *v10;
  void *v11;
  UIImageView *v12;
  UIImageView *leadingImageView;
  MapsFadingLabel *v14;
  double y;
  double width;
  double height;
  MapsFadingLabel *v18;
  MapsFadingLabel *titleLabel;
  void *v20;
  MapsFadingLabel *v21;
  MapsFadingLabel *subtitleLabel;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  double v28;
  double v29;
  double v30;
  id v31;
  void *v32;
  UIView *v33;
  UIView *trailingButtonContainerView;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSLayoutConstraint *trailingButtonContainerWidthConstraint;
  NavTrayWaypointCellActionImageView *v42;
  void *v43;
  NavTrayWaypointCellActionImageView *v44;
  UIView *phoneCallView;
  void *v46;
  void *v47;
  void *v48;
  NavTrayWaypointCellActionImageView *v49;
  void *v50;
  NavTrayWaypointCellActionImageView *v51;
  UIView *deleteView;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  NSLayoutConstraint *labelStackViewTrailingButtonConstraint;
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
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  id v121;
  id v122;
  void *v123;
  void *v124;
  UIView *v125;
  objc_super v126;
  _QWORD v127[5];
  _QWORD v128[19];
  _QWORD v129[2];

  v126.receiver = self;
  v126.super_class = (Class)NavTrayWaypointCell;
  v4 = -[NavTrayWaypointCell initWithStyle:reuseIdentifier:](&v126, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (objc_class *)objc_opt_class(v4);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[NavTrayWaypointCell setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayWaypointCell contentView](v5, "contentView"));
    objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("NavTrayWaypointCellContent"));

    v123 = (void *)objc_claimAutoreleasedReturnValue(+[UIBackgroundConfiguration listCellConfiguration](UIBackgroundConfiguration, "listCellConfiguration"));
    objc_msgSend(v123, "setCornerRadius:", 10.0);
    -[NavTrayWaypointCell setBackgroundConfiguration:](v5, "setBackgroundConfiguration:", v123);
    -[NavTrayWaypointCell setSelectionStyle:](v5, "setSelectionStyle:", 0);
    v10 = objc_opt_new(UIView);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setUserInteractionEnabled:](v10, "setUserInteractionEnabled:", 0);
    -[UIView setAccessibilityIdentifier:](v10, "setAccessibilityIdentifier:", CFSTR("ImageViewContainer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayWaypointCell contentView](v5, "contentView"));
    v125 = v10;
    objc_msgSend(v11, "addSubview:", v10);

    v12 = objc_opt_new(UIImageView);
    leadingImageView = v5->_leadingImageView;
    v5->_leadingImageView = v12;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v5->_leadingImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v5->_leadingImageView, "setContentMode:", 1);
    -[UIImageView setIsAccessibilityElement:](v5->_leadingImageView, "setIsAccessibilityElement:", 1);
    -[UIImageView setAccessibilityIdentifier:](v5->_leadingImageView, "setAccessibilityIdentifier:", CFSTR("LeadingImageView"));
    -[UIView addSubview:](v10, "addSubview:", v5->_leadingImageView);
    v14 = [MapsFadingLabel alloc];
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v18 = -[MapsFadingLabel initWithFrame:](v14, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v18;

    -[MapsFadingLabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle2));
    -[MapsFadingLabel setFont:](v5->_titleLabel, "setFont:", v20);

    -[MapsFadingLabel setNumberOfLines:](v5->_titleLabel, "setNumberOfLines:", 1);
    -[MapsFadingLabel setTextAlignment:](v5->_titleLabel, "setTextAlignment:", 0);
    -[MapsFadingLabel setAccessibilityIdentifier:](v5->_titleLabel, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
    v21 = -[MapsFadingLabel initWithFrame:]([MapsFadingLabel alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    subtitleLabel = v5->_subtitleLabel;
    v5->_subtitleLabel = v21;

    -[MapsFadingLabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:maximumContentSizeCategory:](UIFont, "_preferredFontForTextStyle:maximumContentSizeCategory:", UIFontTextStyleBody, UIContentSizeCategoryAccessibilityExtraExtraLarge));
    -[MapsFadingLabel setFont:](v5->_subtitleLabel, "setFont:", v23);

    -[MapsFadingLabel setNumberOfLines:](v5->_subtitleLabel, "setNumberOfLines:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[MapsFadingLabel setTextColor:](v5->_subtitleLabel, "setTextColor:", v24);

    -[MapsFadingLabel setTextAlignment:](v5->_subtitleLabel, "setTextAlignment:", 0);
    -[MapsFadingLabel setAccessibilityIdentifier:](v5->_subtitleLabel, "setAccessibilityIdentifier:", CFSTR("SubtitleLabel"));
    v25 = objc_alloc((Class)UIStackView);
    v129[0] = v5->_titleLabel;
    v129[1] = v5->_subtitleLabel;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v129, 2));
    v27 = objc_msgSend(v25, "initWithArrangedSubviews:", v26);

    objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v27, "setDistribution:", 0);
    objc_msgSend(v27, "setAlignment:", 1);
    objc_msgSend(v27, "setAxis:", 1);
    objc_msgSend(v27, "setSpacing:", 0.0);
    LODWORD(v28) = 1132068864;
    objc_msgSend(v27, "setContentHuggingPriority:forAxis:", 0, v28);
    LODWORD(v29) = 1148846080;
    objc_msgSend(v27, "setContentHuggingPriority:forAxis:", 1, v29);
    LODWORD(v30) = 1148846080;
    objc_msgSend(v27, "setContentCompressionResistancePriority:forAxis:", 1, v30);
    v31 = v27;
    v124 = v27;
    objc_msgSend(v27, "setAccessibilityIdentifier:", CFSTR("LabelStackView"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayWaypointCell contentView](v5, "contentView"));
    objc_msgSend(v32, "addSubview:", v31);

    v33 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    trailingButtonContainerView = v5->_trailingButtonContainerView;
    v5->_trailingButtonContainerView = v33;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5->_trailingButtonContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setUserInteractionEnabled:](v5->_trailingButtonContainerView, "setUserInteractionEnabled:", 1);
    LODWORD(v35) = 1148846080;
    -[UIView setContentHuggingPriority:forAxis:](v5->_trailingButtonContainerView, "setContentHuggingPriority:forAxis:", 0, v35);
    LODWORD(v36) = 1148846080;
    -[UIView setContentCompressionResistancePriority:forAxis:](v5->_trailingButtonContainerView, "setContentCompressionResistancePriority:forAxis:", 1, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemGroupedBackgroundColor](UIColor, "secondarySystemGroupedBackgroundColor"));
    -[UIView setBackgroundColor:](v5->_trailingButtonContainerView, "setBackgroundColor:", v37);

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayWaypointCell contentView](v5, "contentView"));
    objc_msgSend(v38, "addSubview:", v5->_trailingButtonContainerView);

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v5->_trailingButtonContainerView, "widthAnchor"));
    v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToConstant:", 0.0));
    trailingButtonContainerWidthConstraint = v5->_trailingButtonContainerWidthConstraint;
    v5->_trailingButtonContainerWidthConstraint = (NSLayoutConstraint *)v40;

    v42 = [NavTrayWaypointCellActionImageView alloc];
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("phone.fill")));
    v44 = -[NavTrayWaypointCellActionImageView initWithImage:style:weight:sideLength:](v42, "initWithImage:style:weight:sideLength:", v43, UIFontTextStyleHeadline, UIFontWeightRegular, 42.0);
    phoneCallView = v5->_phoneCallView;
    v5->_phoneCallView = &v44->super;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5->_phoneCallView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setUserInteractionEnabled:](v5->_phoneCallView, "setUserInteractionEnabled:", 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    -[UIView setTintColor:](v5->_phoneCallView, "setTintColor:", v46);

    v122 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v5, "_pressedPhoneCall");
    -[UIView addGestureRecognizer:](v5->_phoneCallView, "addGestureRecognizer:", v122);
    -[UIView setAccessibilityIdentifier:](v5->_phoneCallView, "setAccessibilityIdentifier:", CFSTR("PhoneCallView"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("[NavTray] [Accessibility] Phone Call Button"), CFSTR("localized string not found"), 0));
    -[UIView setAccessibilityLabel:](v5->_phoneCallView, "setAccessibilityLabel:", v48);

    v49 = [NavTrayWaypointCellActionImageView alloc];
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("minus")));
    v51 = -[NavTrayWaypointCellActionImageView initWithImage:style:weight:sideLength:](v49, "initWithImage:style:weight:sideLength:", v50, UIFontTextStyleTitle3, UIFontWeightHeavy, 42.0);
    deleteView = v5->_deleteView;
    v5->_deleteView = &v51->super;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5->_deleteView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setUserInteractionEnabled:](v5->_deleteView, "setUserInteractionEnabled:", 1);
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
    -[UIView setTintColor:](v5->_deleteView, "setTintColor:", v53);

    v121 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v5, "_pressedDelete");
    -[UIView addGestureRecognizer:](v5->_deleteView, "addGestureRecognizer:", v121);
    -[UIView setAccessibilityIdentifier:](v5->_deleteView, "setAccessibilityIdentifier:", CFSTR("DeleteView"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "localizedStringForKey:value:table:", CFSTR("[NavTray] [Accessibility] Delete Stop Button"), CFSTR("localized string not found"), 0));
    -[UIView setAccessibilityLabel:](v5->_deleteView, "setAccessibilityLabel:", v55);

    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "trailingAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v5->_trailingButtonContainerView, "leadingAnchor"));
    v58 = objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:constant:", v57, 0.0));
    labelStackViewTrailingButtonConstraint = v5->_labelStackViewTrailingButtonConstraint;
    v5->_labelStackViewTrailingButtonConstraint = (NSLayoutConstraint *)v58;

    v119 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v125, "leadingAnchor"));
    v120 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayWaypointCell contentView](v5, "contentView"));
    v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "leadingAnchor"));
    v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "constraintEqualToAnchor:", v118));
    v128[0] = v117;
    v116 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v125, "widthAnchor"));
    v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "constraintEqualToConstant:", 76.0));
    v128[1] = v115;
    v113 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v125, "topAnchor"));
    v114 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayWaypointCell contentView](v5, "contentView"));
    v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "topAnchor"));
    v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "constraintEqualToAnchor:", v112));
    v128[2] = v111;
    v109 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v125, "bottomAnchor"));
    v110 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayWaypointCell contentView](v5, "contentView"));
    v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "bottomAnchor"));
    v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "constraintEqualToAnchor:", v108));
    v128[3] = v107;
    v106 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](v5->_leadingImageView, "centerXAnchor"));
    v105 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v125, "centerXAnchor"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "constraintEqualToAnchor:", v105));
    v128[4] = v104;
    v103 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v5->_leadingImageView, "centerYAnchor"));
    v102 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v125, "centerYAnchor"));
    v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "constraintEqualToAnchor:", v102));
    v128[5] = v101;
    v100 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v5->_leadingImageView, "heightAnchor"));
    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "constraintEqualToConstant:", 44.0));
    v128[6] = v99;
    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "leadingAnchor"));
    v97 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v125, "trailingAnchor"));
    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "constraintEqualToAnchor:", v97));
    v128[7] = v96;
    v128[8] = v5->_labelStackViewTrailingButtonConstraint;
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "centerYAnchor"));
    v95 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayWaypointCell contentView](v5, "contentView"));
    v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "centerYAnchor"));
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "constraintEqualToAnchor:", v93));
    v128[9] = v92;
    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "topAnchor"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayWaypointCell contentView](v5, "contentView"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "topAnchor"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "constraintGreaterThanOrEqualToAnchor:", v89));
    v128[10] = v88;
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "bottomAnchor"));
    v87 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayWaypointCell contentView](v5, "contentView"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "bottomAnchor"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "constraintLessThanOrEqualToAnchor:", v85));
    v128[11] = v84;
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v5->_trailingButtonContainerView, "trailingAnchor"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayWaypointCell contentView](v5, "contentView"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "trailingAnchor"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "constraintEqualToAnchor:constant:", v81, -18.0));
    v128[12] = v80;
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v5->_trailingButtonContainerView, "topAnchor"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayWaypointCell contentView](v5, "contentView"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "topAnchor"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToAnchor:", v77));
    v128[13] = v76;
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v5->_trailingButtonContainerView, "bottomAnchor"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayWaypointCell contentView](v5, "contentView"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "bottomAnchor"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToAnchor:", v73));
    v128[14] = v72;
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v5->_phoneCallView, "heightAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToConstant:", 42.0));
    v128[15] = v61;
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v5->_phoneCallView, "widthAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToConstant:", 42.0));
    v128[16] = v63;
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v5->_deleteView, "heightAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToConstant:", 42.0));
    v128[17] = v65;
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v5->_deleteView, "widthAnchor"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToConstant:", 42.0));
    v128[18] = v67;
    v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v128, 19));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v68);

    v127[0] = v5->_phoneCallView;
    v127[1] = v5->_deleteView;
    v127[2] = v5->_leadingImageView;
    v127[3] = v5->_titleLabel;
    v127[4] = v5->_subtitleLabel;
    v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v127, 5));
    -[NavTrayWaypointCell setAccessibilityElements:](v5, "setAccessibilityElements:", v69);

    v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v70, "addObserver:selector:name:object:", v5, "callCapabilitiesChanged", TUCallCapabilitiesSupportsTelephonyCallsChangedNotification, 0);

  }
  return v5;
}

- (void)prepareForReuse
{
  GEOComposedWaypoint *waypoint;
  MNDisplayETALegInfo *etaInfo;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NavTrayWaypointCell;
  -[NavTrayWaypointCell prepareForReuse](&v5, "prepareForReuse");
  -[UIView removeFromSuperview](self->_phoneCallView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_deleteView, "removeFromSuperview");
  waypoint = self->_waypoint;
  self->_waypoint = 0;

  etaInfo = self->_etaInfo;
  self->_etaInfo = 0;

  self->_shouldDisplayDeleteButton = 0;
  -[MapsFadingLabel setText:](self->_titleLabel, "setText:", 0);
  -[MapsFadingLabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 1);
  -[MapsFadingLabel setText:](self->_subtitleLabel, "setText:", 0);
  -[UIImageView setImage:](self->_leadingImageView, "setImage:", 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSComparisonResult v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NavTrayWaypointCell;
  -[NavTrayWaypointCell traitCollectionDidChange:](&v11, "traitCollectionDidChange:", v4);
  if (!v4
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayWaypointCell traitCollection](self, "traitCollection")),
        v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory")),
        v7 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory")),
        v8 = UIContentSizeCategoryCompareToCategory(v6, v7),
        v7,
        v6,
        v5,
        v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayWaypointCell traitCollection](self, "traitCollection"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:maximumContentSizeCategory:compatibleWithTraitCollection:](UIFont, "_preferredFontForTextStyle:maximumContentSizeCategory:compatibleWithTraitCollection:", UIFontTextStyleBody, UIContentSizeCategoryAccessibilityExtraExtraLarge, v9));
    -[MapsFadingLabel setFont:](self->_subtitleLabel, "setFont:", v10);

  }
}

- (NSSet)destinationPhoneNumbers
{
  return (NSSet *)objc_msgSend((id)objc_opt_class(self), "_destinationPhoneNumbersForWaypoint:", self->_waypoint);
}

+ (id)_destinationPhoneNumbersForWaypoint:(id)a3
{
  id v3;
  NSMutableSet *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v3 = a3;
  if ((+[TUCallCapabilities supportsTelephonyCalls](TUCallCapabilities, "supportsTelephonyCalls") & 1) == 0)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    goto LABEL_9;
  }
  v4 = objc_opt_new(NSMutableSet);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "findMyHandleID"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "findMyHandle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "phoneNumbers"));
    -[NSMutableSet unionSet:](v4, "unionSet:", v7);

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "addressBookAddress"));

    if (!v13)
      goto LABEL_5;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "addressBookAddress", 0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "contact"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "phoneNumbers"));

    v16 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v18)
            objc_enumerationMutation(v6);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i), "value"));
          -[NSMutableSet addObject:](v4, "addObject:", v20);

        }
        v17 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v17);
    }
  }

LABEL_5:
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "geoMapItem"));
  if (objc_msgSend(v8, "_hasTelephone"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_telephone"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CNPhoneNumber phoneNumberWithStringValue:](CNPhoneNumber, "phoneNumberWithStringValue:", v9));
    -[NSMutableSet addObject:](v4, "addObject:", v10);

  }
  v11 = -[NSMutableSet copy](v4, "copy");

LABEL_9:
  return v11;
}

- (void)updateWithWaypoint:(id)a3 etaInfo:(id)a4 shouldDisplayDeleteButton:(BOOL)a5
{
  GEOComposedWaypoint *v8;
  MNDisplayETALegInfo *v9;
  GEOComposedWaypoint *waypoint;
  GEOComposedWaypoint *v11;
  MNDisplayETALegInfo *etaInfo;

  v8 = (GEOComposedWaypoint *)a3;
  v9 = (MNDisplayETALegInfo *)a4;
  waypoint = self->_waypoint;
  self->_waypoint = v8;
  v11 = v8;

  etaInfo = self->_etaInfo;
  self->_etaInfo = v9;

  self->_shouldDisplayDeleteButton = a5;
  -[NavTrayWaypointCell _updateLabelsAndLeadingImageView](self, "_updateLabelsAndLeadingImageView");
  -[NavTrayWaypointCell _updateActionButtons](self, "_updateActionButtons");
  -[NavTrayWaypointCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateLabelsAndLeadingImageView
{
  void *v3;
  GEOComposedWaypoint *waypoint;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  GEOComposedWaypoint *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  MNDisplayETALegInfo *etaInfo;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  GEOComposedWaypoint *v29;
  uint64_t v30;
  uint64_t v31;
  GEOComposedWaypoint *v32;
  uint64_t v33;
  void *v34;
  GEOComposedWaypoint *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;

  -[UIImageView setAccessibilityLabel:](self->_leadingImageView, "setAccessibilityLabel:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint findMyHandleID](self->_waypoint, "findMyHandleID"));

  waypoint = self->_waypoint;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint findMyHandle](waypoint, "findMyHandle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayWaypointCell traitCollection](self, "traitCollection"));
    objc_msgSend(v6, "displayScale");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "thumbnailIconWithScale:size:"));
    -[UIImageView setImage:](self->_leadingImageView, "setImage:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint findMyHandle](self->_waypoint, "findMyHandle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayName"));
    -[UIImageView setAccessibilityLabel:](self->_leadingImageView, "setAccessibilityLabel:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint findMyHandle](self->_waypoint, "findMyHandle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "displayName"));
    -[MapsFadingLabel setText:](self->_titleLabel, "setText:", v11);
    goto LABEL_5;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint addressBookAddress](waypoint, "addressBookAddress"));

  v13 = self->_waypoint;
  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint addressBookAddress](v13, "addressBookAddress"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayWaypointCell traitCollection](self, "traitCollection"));
    objc_msgSend(v15, "displayScale");
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "thumbnailIconWithScale:size:", 3));
    -[UIImageView setImage:](self->_leadingImageView, "setImage:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint addressBookAddress](self->_waypoint, "addressBookAddress"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "waypointCompositeName"));
    -[UIImageView setAccessibilityLabel:](self->_leadingImageView, "setAccessibilityLabel:", v18);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint addressBookAddress](self->_waypoint, "addressBookAddress"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "waypointCompositeName"));
    -[MapsFadingLabel setText:](self->_titleLabel, "setText:", v11);
    goto LABEL_5;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint name](v13, "name"));
  if (v26)
  {
    -[MapsFadingLabel setText:](self->_titleLabel, "setText:", v26);
  }
  else
  {
    v27 = MKLocalizedStringForUnknownLocation();
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    -[MapsFadingLabel setText:](self->_titleLabel, "setText:", v28);

  }
  v29 = self->_waypoint;
  v30 = objc_opt_class(GEOComposedWaypointToRoute);
  if ((objc_opt_isKindOfClass(v29, v30) & 1) != 0)
  {
    v31 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes customSavedRouteStyleAttributes](GEOFeatureStyleAttributes, "customSavedRouteStyleAttributes"));
LABEL_27:
    v36 = (void *)v31;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayWaypointCell traitCollection](self, "traitCollection"));
    objc_msgSend(v37, "displayScale");
    v38 = objc_claimAutoreleasedReturnValue(+[MKIconManager imageForStyle:size:forScale:format:](MKIconManager, "imageForStyle:size:forScale:format:", v36, 3, 0));
    goto LABEL_28;
  }
  v32 = self->_waypoint;
  v33 = objc_opt_class(GEOComposedWaypointEVStop);
  if ((objc_opt_isKindOfClass(v32, v33) & 1) != 0)
  {
    v31 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes evChargerStyleAttributes](GEOFeatureStyleAttributes, "evChargerStyleAttributes"));
    goto LABEL_27;
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint styleAttributes](self->_waypoint, "styleAttributes"));

  v35 = self->_waypoint;
  if (v34)
  {
    v31 = objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint styleAttributes](v35, "styleAttributes"));
    goto LABEL_27;
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint mkMapItem](v35, "mkMapItem"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayWaypointCell traitCollection](self, "traitCollection"));
  objc_msgSend(v37, "displayScale");
  v38 = objc_claimAutoreleasedReturnValue(+[MKMapItem _maps_markerImageForMapItem:scale:size:useMarkerFallback:](MKMapItem, "_maps_markerImageForMapItem:scale:size:useMarkerFallback:", v36, 3, 1));
LABEL_28:
  v39 = (void *)v38;
  -[UIImageView setImage:](self->_leadingImageView, "setImage:", v38);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint geoMapItem](self->_waypoint, "geoMapItem"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "_poiCategory"));

  if (!v10 || !objc_msgSend(v10, "hasPrefix:", CFSTR("GEOPOICategory")))
    goto LABEL_6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "substringFromIndex:", objc_msgSend(CFSTR("GEOPOICategory"), "length")));
  -[UIImageView setAccessibilityLabel:](self->_leadingImageView, "setAccessibilityLabel:", v11);
LABEL_5:

LABEL_6:
  etaInfo = self->_etaInfo;
  if (etaInfo)
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[GuidanceETA etaStringFromEtaLegInfo:includingAMPMSymbols:](GuidanceETA, "etaStringFromEtaLegInfo:includingAMPMSymbols:", etaInfo, 1));
  else
    v20 = 0;
  if (objc_msgSend(v20, "length"))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("[NavTray] Arrival time format"), CFSTR("localized string not found"), 0));
    v41 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, v20));

    v20 = v21;
  }
  else
  {
    v41 = 0;
  }

  -[MapsFadingLabel setText:](self->_subtitleLabel, "setText:", v41);
  -[MapsFadingLabel setHidden:](self->_subtitleLabel, "setHidden:", self->_etaInfo == 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFadingLabel text](self->_subtitleLabel, "text"));
  if (!objc_msgSend(v23, "length"))
  {

    goto LABEL_16;
  }
  v24 = -[MapsFadingLabel isHidden](self->_subtitleLabel, "isHidden");

  if ((v24 & 1) != 0)
  {
LABEL_16:
    v25 = 2;
    goto LABEL_17;
  }
  v25 = 1;
LABEL_17:
  -[MapsFadingLabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", v25);

}

- (void)_updateActionButtons
{
  void *v3;
  id v4;
  _BOOL4 shouldDisplayDeleteButton;
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
  NSLayoutConstraint *trailingButtonContainerWidthConstraint;
  uint64_t v34;
  unsigned int v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[3];
  _QWORD v47[3];
  _QWORD v48[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayWaypointCell destinationPhoneNumbers](self, "destinationPhoneNumbers"));
  v4 = objc_msgSend(v3, "count");

  shouldDisplayDeleteButton = self->_shouldDisplayDeleteButton;
  if (v4)
  {
    -[UIView addSubview:](self->_trailingButtonContainerView, "addSubview:", self->_phoneCallView);
    if (shouldDisplayDeleteButton)
    {
      -[UIView addSubview:](self->_trailingButtonContainerView, "addSubview:", self->_deleteView);
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_deleteView, "trailingAnchor"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_trailingButtonContainerView, "trailingAnchor"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v42));
      v48[0] = v41;
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_deleteView, "centerYAnchor"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_trailingButtonContainerView, "centerYAnchor"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v39));
      v48[1] = v38;
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_phoneCallView, "trailingAnchor"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_deleteView, "leadingAnchor"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:constant:", v6, -10.0));
      v48[2] = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_phoneCallView, "leadingAnchor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_trailingButtonContainerView, "leadingAnchor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
      v48[3] = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_phoneCallView, "centerYAnchor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_trailingButtonContainerView, "centerYAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
      v48[4] = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v48, 5));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

    }
    else
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_phoneCallView, "leadingAnchor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_trailingButtonContainerView, "leadingAnchor"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v24));
      v47[0] = v25;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_phoneCallView, "trailingAnchor"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_trailingButtonContainerView, "trailingAnchor"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v27));
      v47[1] = v28;
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_phoneCallView, "centerYAnchor"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_trailingButtonContainerView, "centerYAnchor"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v30));
      v47[2] = v31;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 3));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v32);

    }
    goto LABEL_7;
  }
  if (self->_shouldDisplayDeleteButton)
  {
    -[UIView addSubview:](self->_trailingButtonContainerView, "addSubview:", self->_deleteView);
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_deleteView, "leadingAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_trailingButtonContainerView, "leadingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v15));
    v46[0] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_deleteView, "trailingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_trailingButtonContainerView, "trailingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));
    v46[1] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_deleteView, "centerYAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_trailingButtonContainerView, "centerYAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v21));
    v46[2] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 3));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v23);

LABEL_7:
    trailingButtonContainerWidthConstraint = self->_trailingButtonContainerWidthConstraint;
    v34 = 0;
    goto LABEL_8;
  }
  -[UIView removeFromSuperview](self->_phoneCallView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_deleteView, "removeFromSuperview");
  trailingButtonContainerWidthConstraint = self->_trailingButtonContainerWidthConstraint;
  v34 = 1;
LABEL_8:
  -[NSLayoutConstraint setActive:](trailingButtonContainerWidthConstraint, "setActive:", v34);
  v35 = -[NSLayoutConstraint isActive](self->_trailingButtonContainerWidthConstraint, "isActive");
  v36 = -12.0;
  if (v35)
    v36 = 0.0;
  -[NSLayoutConstraint setConstant:](self->_labelStackViewTrailingButtonConstraint, "setConstant:", v36);
}

- (void)_pressedPhoneCall
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[NavTrayWaypointCell delegate](self, "delegate"));
  objc_msgSend(v3, "pressedPhoneCallOnCell:", self);

}

- (void)_pressedDelete
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[NavTrayWaypointCell delegate](self, "delegate"));
  objc_msgSend(v3, "pressedDeleteOnCell:", self);

}

+ (double)heightForCellWithWaypoint:(id)a3 etaInfo:(id)a4 shouldDisplayDeleteButton:(BOOL)a5 width:(double)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  id v13;
  int v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  double v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v35;
  __CFString *v36;
  NSAttributedStringKey v37;
  void *v38;
  NSAttributedStringKey v39;
  void *v40;
  CGRect v41;
  CGRect v42;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_destinationPhoneNumbersForWaypoint:", v10));
  v13 = objc_msgSend(v12, "count");

  if (v13)
    v14 = 1;
  else
    v14 = v7;
  v15 = 72.0;
  if (!v14)
    v15 = 18.0;
  if (v13 != 0 && v7)
    v15 = 124.0;
  v16 = a6 + -76.0 - v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "findMyHandleID"));

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "findMyHandle"));
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "displayName"));
LABEL_12:
    v21 = (void *)v19;
    v22 = &stru_1011EB268;
    if (v19)
      v22 = (__CFString *)v19;
    v23 = v22;

    goto LABEL_15;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "addressBookAddress"));

  if (v20)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "addressBookAddress"));
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "waypointCompositeName"));
    goto LABEL_12;
  }
  v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
  v18 = (void *)v35;
  v36 = &stru_1011EB268;
  if (v35)
    v36 = (__CFString *)v35;
  v23 = v36;
LABEL_15:

  v24 = objc_alloc((Class)NSAttributedString);
  v39 = NSFontAttributeName;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle2));
  v40 = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
  v27 = objc_msgSend(v24, "initWithString:attributes:", v23, v26);

  objc_msgSend(v27, "boundingRectWithSize:options:context:", 1, 0, v16, 1.79769313e308);
  v28 = ceil(CGRectGetMaxY(v41)) + 0.0;
  if (v11)
  {
    v29 = objc_alloc((Class)NSAttributedString);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[GuidanceETA etaStringFromEtaLegInfo:includingAMPMSymbols:](GuidanceETA, "etaStringFromEtaLegInfo:includingAMPMSymbols:", v11, 1));
    v37 = NSFontAttributeName;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline));
    v38 = v31;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));
    v33 = objc_msgSend(v29, "initWithString:attributes:", v30, v32);

    objc_msgSend(v33, "boundingRectWithSize:options:context:", 1, 0, v16, 1.79769313e308);
    v28 = v28 + ceil(CGRectGetMaxY(v42));
    v27 = v33;
  }

  return fmax(v28, 78.0);
}

- (NavTrayWaypointCellDelegate)delegate
{
  return (NavTrayWaypointCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (GEOComposedWaypoint)waypoint
{
  return self->_waypoint;
}

- (MNDisplayETALegInfo)etaInfo
{
  return self->_etaInfo;
}

- (BOOL)shouldDisplayDeleteButton
{
  return self->_shouldDisplayDeleteButton;
}

- (UIImageView)leadingImageView
{
  return self->_leadingImageView;
}

- (void)setLeadingImageView:(id)a3
{
  objc_storeStrong((id *)&self->_leadingImageView, a3);
}

- (MapsFadingLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (MapsFadingLabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (UIView)phoneCallView
{
  return self->_phoneCallView;
}

- (void)setPhoneCallView:(id)a3
{
  objc_storeStrong((id *)&self->_phoneCallView, a3);
}

- (UIView)deleteView
{
  return self->_deleteView;
}

- (void)setDeleteView:(id)a3
{
  objc_storeStrong((id *)&self->_deleteView, a3);
}

- (UIView)trailingButtonContainerView
{
  return self->_trailingButtonContainerView;
}

- (void)setTrailingButtonContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_trailingButtonContainerView, a3);
}

- (NSLayoutConstraint)trailingButtonContainerWidthConstraint
{
  return self->_trailingButtonContainerWidthConstraint;
}

- (void)setTrailingButtonContainerWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_trailingButtonContainerWidthConstraint, a3);
}

- (NSLayoutConstraint)labelStackViewTrailingButtonConstraint
{
  return self->_labelStackViewTrailingButtonConstraint;
}

- (void)setLabelStackViewTrailingButtonConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_labelStackViewTrailingButtonConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelStackViewTrailingButtonConstraint, 0);
  objc_storeStrong((id *)&self->_trailingButtonContainerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_trailingButtonContainerView, 0);
  objc_storeStrong((id *)&self->_deleteView, 0);
  objc_storeStrong((id *)&self->_phoneCallView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_leadingImageView, 0);
  objc_storeStrong((id *)&self->_etaInfo, 0);
  objc_storeStrong((id *)&self->_waypoint, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
