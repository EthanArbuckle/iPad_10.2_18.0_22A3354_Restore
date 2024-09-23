@implementation NavSignManeuverCell

- (NavSignManeuverCell)initWithFrame:(CGRect)a3
{
  NavSignManeuverCell *v3;
  NavSignManeuverCell *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  UIView *v8;
  UIView *mapsBackgroundView;
  void *v10;
  void *v11;
  UIView *v12;
  void *v13;
  GuidanceManeuverView *v14;
  double y;
  double width;
  double height;
  GuidanceManeuverView *v18;
  GuidanceManeuverView *guidanceManeuverView;
  UIImageView *v20;
  UIImageView *shieldImageView;
  UILabel *v22;
  UILabel *primaryTextLabel;
  double v24;
  void *v25;
  UIImageView *v26;
  UIImageView *exitShieldImageView;
  double v28;
  double v29;
  void *v30;
  UILabel *v31;
  UILabel *secondaryTextLabel;
  void *v33;
  UILabel *v34;
  UILabel *tertiaryTextLabel;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSLayoutConstraint *imageLeadingConstraint;
  void *v42;
  uint64_t v43;
  NSLayoutConstraint *imageAreaWidthConstraint;
  void *v45;
  uint64_t v46;
  NSLayoutConstraint *imageWidthConstraint;
  void *v48;
  uint64_t v49;
  NSLayoutConstraint *imageHeightConstraint;
  void *v51;
  void *v52;
  uint64_t v53;
  NSLayoutConstraint *primaryLeadingConstraint;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  NSLayoutConstraint *primaryTrailingConstraint;
  void *v60;
  void *v61;
  uint64_t v62;
  NSLayoutConstraint *primaryToExitShieldConstraint;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  NSLayoutConstraint *exitShieldTrailingConstraint;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  NSLayoutConstraint *secondaryTrailingConstraint;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  NSLayoutConstraint *tertiaryBottomConstraint;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  NSLayoutConstraint *primaryTopConstraint;
  void *v84;
  void *v85;
  uint64_t v86;
  NSLayoutConstraint *secondaryTopConstraint;
  void *v88;
  void *v89;
  uint64_t v90;
  NSLayoutConstraint *tertiaryTopConstraint;
  uint64_t v92;
  NSArray *primaryTopAnchoredConstraints;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  NSArray *primaryCenteredAnchoredConstraints;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
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
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  UIView *v160;
  objc_super v161;
  _QWORD v162[29];
  void *v163;
  _QWORD v164[2];

  v161.receiver = self;
  v161.super_class = (Class)NavSignManeuverCell;
  v3 = -[RouteStepListCollectionCell initWithFrame:](&v161, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (objc_class *)objc_opt_class(v3);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[NavSignManeuverCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v7);

    v8 = objc_opt_new(UIView);
    mapsBackgroundView = v4->_mapsBackgroundView;
    v4->_mapsBackgroundView = v8;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_mapsBackgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell contentView](v4, "contentView"));
    objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("NavSignManeuverCellContent"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell contentView](v4, "contentView"));
    objc_msgSend(v11, "addSubview:", v4->_mapsBackgroundView);

    v12 = objc_opt_new(UIView);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setAccessibilityIdentifier:](v12, "setAccessibilityIdentifier:", CFSTR("ImageContainerView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell contentView](v4, "contentView"));
    objc_msgSend(v13, "addSubview:", v12);

    v14 = [GuidanceManeuverView alloc];
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v18 = -[GuidanceManeuverView initWithFrame:textureProvider:](v14, "initWithFrame:textureProvider:", 0, CGRectZero.origin.x, y, width, height);
    guidanceManeuverView = v4->_guidanceManeuverView;
    v4->_guidanceManeuverView = v18;

    -[GuidanceManeuverView setTranslatesAutoresizingMaskIntoConstraints:](v4->_guidanceManeuverView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[GuidanceManeuverView setFraming:](v4->_guidanceManeuverView, "setFraming:", 1);
    -[UIView addSubview:](v12, "addSubview:", v4->_guidanceManeuverView);
    v20 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    shieldImageView = v4->_shieldImageView;
    v4->_shieldImageView = v20;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_shieldImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setAccessibilityIdentifier:](v4->_shieldImageView, "setAccessibilityIdentifier:", CFSTR("ShieldImageView"));
    -[UIView addSubview:](v12, "addSubview:", v4->_shieldImageView);
    v22 = objc_opt_new(UILabel);
    primaryTextLabel = v4->_primaryTextLabel;
    v4->_primaryTextLabel = v22;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_primaryTextLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v4->_primaryTextLabel, "setNumberOfLines:", 0);
    -[UILabel setAccessibilityIdentifier:](v4->_primaryTextLabel, "setAccessibilityIdentifier:", CFSTR("PrimaryTextLabel"));
    LODWORD(v24) = 1148829696;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_primaryTextLabel, "setContentCompressionResistancePriority:forAxis:", 1, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell contentView](v4, "contentView"));
    objc_msgSend(v25, "addSubview:", v4->_primaryTextLabel);

    v26 = objc_opt_new(UIImageView);
    exitShieldImageView = v4->_exitShieldImageView;
    v4->_exitShieldImageView = v26;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_exitShieldImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v4->_exitShieldImageView, "setContentMode:", 1);
    -[UIImageView setIsAccessibilityElement:](v4->_exitShieldImageView, "setIsAccessibilityElement:", 1);
    -[UIImageView setAccessibilityIdentifier:](v4->_exitShieldImageView, "setAccessibilityIdentifier:", CFSTR("ExitShieldImageView"));
    LODWORD(v28) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](v4->_exitShieldImageView, "setContentHuggingPriority:forAxis:", 0, v28);
    LODWORD(v29) = 1148829696;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v4->_exitShieldImageView, "setContentCompressionResistancePriority:forAxis:", 1, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell contentView](v4, "contentView"));
    objc_msgSend(v30, "addSubview:", v4->_exitShieldImageView);

    v31 = objc_opt_new(UILabel);
    secondaryTextLabel = v4->_secondaryTextLabel;
    v4->_secondaryTextLabel = v31;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_secondaryTextLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v4->_secondaryTextLabel, "setNumberOfLines:", 0);
    -[UILabel setAccessibilityIdentifier:](v4->_secondaryTextLabel, "setAccessibilityIdentifier:", CFSTR("SecondaryTextLabel"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell contentView](v4, "contentView"));
    objc_msgSend(v33, "addSubview:", v4->_secondaryTextLabel);

    v34 = objc_opt_new(UILabel);
    tertiaryTextLabel = v4->_tertiaryTextLabel;
    v4->_tertiaryTextLabel = v34;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_tertiaryTextLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v4->_tertiaryTextLabel, "setNumberOfLines:", 0);
    -[UILabel setAccessibilityIdentifier:](v4->_tertiaryTextLabel, "setAccessibilityIdentifier:", CFSTR("TertiaryTextLabel"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell contentView](v4, "contentView"));
    objc_msgSend(v36, "addSubview:", v4->_tertiaryTextLabel);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v12, "leadingAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell contentView](v4, "contentView"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "leadingAnchor"));
    v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v39));
    imageLeadingConstraint = v4->_imageLeadingConstraint;
    v4->_imageLeadingConstraint = (NSLayoutConstraint *)v40;

    v160 = v12;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v12, "widthAnchor"));
    v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToConstant:", 0.0));
    imageAreaWidthConstraint = v4->_imageAreaWidthConstraint;
    v4->_imageAreaWidthConstraint = (NSLayoutConstraint *)v43;

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView widthAnchor](v4->_guidanceManeuverView, "widthAnchor"));
    v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToConstant:", 0.0));
    imageWidthConstraint = v4->_imageWidthConstraint;
    v4->_imageWidthConstraint = (NSLayoutConstraint *)v46;

    v48 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView heightAnchor](v4->_guidanceManeuverView, "heightAnchor"));
    v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToConstant:", 0.0));
    imageHeightConstraint = v4->_imageHeightConstraint;
    v4->_imageHeightConstraint = (NSLayoutConstraint *)v49;

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_primaryTextLabel, "leadingAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v12, "trailingAnchor"));
    v53 = objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v52));
    primaryLeadingConstraint = v4->_primaryLeadingConstraint;
    v4->_primaryLeadingConstraint = (NSLayoutConstraint *)v53;

    v55 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_primaryTextLabel, "trailingAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell contentView](v4, "contentView"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "trailingAnchor"));
    v58 = objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:", v57));
    primaryTrailingConstraint = v4->_primaryTrailingConstraint;
    v4->_primaryTrailingConstraint = (NSLayoutConstraint *)v58;

    v60 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_primaryTextLabel, "trailingAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](v4->_exitShieldImageView, "leadingAnchor"));
    v62 = objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v61));
    primaryToExitShieldConstraint = v4->_primaryToExitShieldConstraint;
    v4->_primaryToExitShieldConstraint = (NSLayoutConstraint *)v62;

    v64 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](v4->_exitShieldImageView, "trailingAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell contentView](v4, "contentView"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "trailingAnchor"));
    v67 = objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:", v66));
    exitShieldTrailingConstraint = v4->_exitShieldTrailingConstraint;
    v4->_exitShieldTrailingConstraint = (NSLayoutConstraint *)v67;

    v69 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_secondaryTextLabel, "trailingAnchor"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell contentView](v4, "contentView"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "trailingAnchor"));
    v72 = objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:", v71));
    secondaryTrailingConstraint = v4->_secondaryTrailingConstraint;
    v4->_secondaryTrailingConstraint = (NSLayoutConstraint *)v72;

    v74 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v4->_tertiaryTextLabel, "bottomAnchor"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell contentView](v4, "contentView"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "bottomAnchor"));
    v77 = objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintLessThanOrEqualToAnchor:", v76));
    tertiaryBottomConstraint = v4->_tertiaryBottomConstraint;
    v4->_tertiaryBottomConstraint = (NSLayoutConstraint *)v77;

    v79 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v4->_primaryTextLabel, "topAnchor"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell contentView](v4, "contentView"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "topAnchor"));
    v82 = objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "constraintEqualToAnchor:", v81));
    primaryTopConstraint = v4->_primaryTopConstraint;
    v4->_primaryTopConstraint = (NSLayoutConstraint *)v82;

    v84 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v4->_secondaryTextLabel, "topAnchor"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v4->_primaryTextLabel, "bottomAnchor"));
    v86 = objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintEqualToAnchor:", v85));
    secondaryTopConstraint = v4->_secondaryTopConstraint;
    v4->_secondaryTopConstraint = (NSLayoutConstraint *)v86;

    v88 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v4->_tertiaryTextLabel, "topAnchor"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v4->_secondaryTextLabel, "bottomAnchor"));
    v90 = objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "constraintEqualToAnchor:", v89));
    tertiaryTopConstraint = v4->_tertiaryTopConstraint;
    v4->_tertiaryTopConstraint = (NSLayoutConstraint *)v90;

    v164[0] = v4->_primaryTopConstraint;
    v164[1] = v4->_tertiaryBottomConstraint;
    v92 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v164, 2));
    primaryTopAnchoredConstraints = v4->_primaryTopAnchoredConstraints;
    v4->_primaryTopAnchoredConstraints = (NSArray *)v92;

    v94 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](v4->_primaryTextLabel, "centerYAnchor"));
    v95 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell contentView](v4, "contentView"));
    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "centerYAnchor"));
    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "constraintEqualToAnchor:", v96));
    v163 = v97;
    v98 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v163, 1));
    primaryCenteredAnchoredConstraints = v4->_primaryCenteredAnchoredConstraints;
    v4->_primaryCenteredAnchoredConstraints = (NSArray *)v98;

    v152 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v4->_mapsBackgroundView, "leadingAnchor"));
    v153 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell contentView](v4, "contentView"));
    v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v153, "leadingAnchor"));
    v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "constraintEqualToAnchor:", v150));
    v162[0] = v148;
    v145 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v4->_mapsBackgroundView, "trailingAnchor"));
    v146 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell contentView](v4, "contentView"));
    v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "trailingAnchor"));
    v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "constraintEqualToAnchor:", v144));
    v162[1] = v143;
    v140 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v4->_mapsBackgroundView, "topAnchor"));
    v141 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell contentView](v4, "contentView"));
    v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "topAnchor"));
    v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "constraintEqualToAnchor:", v139));
    v162[2] = v138;
    v137 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v4->_mapsBackgroundView, "bottomAnchor"));
    v158 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell contentView](v4, "contentView"));
    v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v158, "bottomAnchor"));
    v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "constraintEqualToAnchor:", v136));
    v162[3] = v135;
    v162[4] = v4->_imageLeadingConstraint;
    v134 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v160, "topAnchor"));
    v149 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell contentView](v4, "contentView"));
    v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "topAnchor"));
    v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "constraintEqualToAnchor:", v133));
    v162[5] = v132;
    v130 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v160, "bottomAnchor"));
    v131 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell contentView](v4, "contentView"));
    v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "bottomAnchor"));
    v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "constraintEqualToAnchor:", v129));
    v162[6] = v128;
    v162[7] = v4->_imageAreaWidthConstraint;
    v154 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView centerXAnchor](v4->_guidanceManeuverView, "centerXAnchor"));
    v127 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v160, "centerXAnchor"));
    v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v154, "constraintEqualToAnchor:", v127));
    v162[8] = v126;
    v125 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView centerYAnchor](v4->_guidanceManeuverView, "centerYAnchor"));
    v124 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v160, "centerYAnchor"));
    v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "constraintEqualToAnchor:", v124));
    v162[9] = v123;
    v162[10] = v4->_imageWidthConstraint;
    v162[11] = v4->_imageHeightConstraint;
    v156 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](v4->_shieldImageView, "topAnchor"));
    v151 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView topAnchor](v4->_guidanceManeuverView, "topAnchor"));
    v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v156, "constraintEqualToAnchor:", v151));
    v162[12] = v122;
    v121 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](v4->_shieldImageView, "bottomAnchor"));
    v120 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView bottomAnchor](v4->_guidanceManeuverView, "bottomAnchor"));
    v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "constraintEqualToAnchor:", v120));
    v162[13] = v119;
    v118 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](v4->_shieldImageView, "leadingAnchor"));
    v117 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView leadingAnchor](v4->_guidanceManeuverView, "leadingAnchor"));
    v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "constraintEqualToAnchor:", v117));
    v162[14] = v116;
    v159 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](v4->_shieldImageView, "trailingAnchor"));
    v147 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView trailingAnchor](v4->_guidanceManeuverView, "trailingAnchor"));
    v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v159, "constraintEqualToAnchor:", v147));
    v162[15] = v115;
    v162[16] = v4->_primaryLeadingConstraint;
    v162[17] = v4->_primaryTrailingConstraint;
    v162[18] = v4->_primaryTopConstraint;
    v162[19] = v4->_exitShieldTrailingConstraint;
    v155 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v4->_exitShieldImageView, "widthAnchor"));
    v157 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell contentView](v4, "contentView"));
    v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v157, "widthAnchor"));
    v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v155, "constraintLessThanOrEqualToAnchor:multiplier:", v142, 0.349999994));
    v162[20] = v114;
    v113 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v4->_exitShieldImageView, "centerYAnchor"));
    v112 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](v4->_primaryTextLabel, "centerYAnchor"));
    v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "constraintEqualToAnchor:", v112));
    v162[21] = v111;
    v110 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_secondaryTextLabel, "leadingAnchor"));
    v100 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_primaryTextLabel, "leadingAnchor"));
    v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "constraintEqualToAnchor:", v100));
    v162[22] = v101;
    v162[23] = v4->_secondaryTrailingConstraint;
    v162[24] = v4->_secondaryTopConstraint;
    v102 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_tertiaryTextLabel, "leadingAnchor"));
    v103 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_secondaryTextLabel, "leadingAnchor"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "constraintEqualToAnchor:", v103));
    v162[25] = v104;
    v105 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_tertiaryTextLabel, "trailingAnchor"));
    v106 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_secondaryTextLabel, "trailingAnchor"));
    v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "constraintEqualToAnchor:", v106));
    v162[26] = v107;
    v162[27] = v4->_tertiaryTopConstraint;
    v162[28] = v4->_tertiaryBottomConstraint;
    v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v162, 29));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v108);

    -[NavSignManeuverCell setSelectedWithLayoutProgress:](v4, "setSelectedWithLayoutProgress:", 0.0);
  }
  return v4;
}

+ (double)heightForItem:(id)a3 width:(double)a4 maximumHeight:(double)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  void *v55;
  double y;
  double Height;
  void *v58;
  double v59;
  double v60;
  uint64_t v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v67;
  double v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  v7 = a3;
  v8 = objc_opt_class(RouteStepManeuverItem);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metrics"));
  objc_msgSend(v11, "imageAreaWidth");
  v13 = a4 - v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metrics"));
  objc_msgSend(v14, "textTrailingMargin");
  v16 = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metrics"));
  objc_msgSend(v17, "imageTopMargin");
  v19 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metrics"));
  objc_msgSend(v20, "stepImageHeight");
  v22 = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metrics"));
  objc_msgSend(v23, "imageBottomMargin");
  v25 = v24;

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "primaryText"));
  if (v26)
  {
    v67 = v19;
    v68 = v25;
    v27 = v16;
    v28 = a5;
    v29 = a4 * 0.349999994;
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "exitSignImage"));
    objc_msgSend(v30, "size");
    v32 = v31;
    v33 = v29;
    if (v29 >= v31)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "exitSignImage"));
      objc_msgSend(v23, "size");
      v33 = v34;
    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metrics"));
    objc_msgSend(v35, "exitSignPadding");
    v37 = v36;

    if (v29 >= v32)
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "exitSignImage"));
    a5 = v28;
    if (v38)
    {
      v39 = v33 + v37 * 2.0;
    }
    else
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metrics"));
      objc_msgSend(v41, "textTrailingMargin");
      v39 = v42;

    }
    v16 = v27;

    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metrics"));
    objc_msgSend(v43, "primaryTextTopMargin");
    v45 = v44 + 0.0;

    objc_msgSend(v26, "boundingRectWithSize:options:context:", 1, 0, v13 - v39, 1.79769313e308);
    v40 = v45 + ceil(CGRectGetHeight(v69) + v69.origin.y);
    v19 = v67;
    v25 = v68;
  }
  else
  {
    v40 = 0.0;
  }
  v46 = v19 + v22;
  v47 = v13 - v16;
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "secondaryText"));
  if (v48)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metrics"));
    objc_msgSend(v49, "secondaryTextTopMargin");
    v51 = v40 + v50;

    objc_msgSend(v48, "boundingRectWithSize:options:context:", 1, 0, v47, 1.79769313e308);
    v40 = v51 + ceil(CGRectGetHeight(v70) + v70.origin.y);
  }
  v52 = v46 + v25;
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tertiaryText"));
  v55 = v53;
  if (v53)
  {
    objc_msgSend(v53, "boundingRectWithSize:options:context:", 1, 0, v47, 1.79769313e308);
    y = v71.origin.y;
    Height = CGRectGetHeight(v71);
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metrics"));
    objc_msgSend(v58, "tertiaryTextTopMargin");
    v60 = v59 + ceil(Height + y);

    v54 = v40 + v60;
    v61 = 4 * (v40 + v60 > a5);
    if (v40 + v60 <= a5)
      v40 = v40 + v60;
  }
  else
  {
    v61 = 4;
  }
  objc_msgSend(v10, "setExcludedFieldsMask:", v61, v54);
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metrics"));
  objc_msgSend(v62, "textBottomMargin");
  v64 = v40 + v63;

  if (v52 <= v64)
    v52 = v64;
  if (sub_100B229E4())
    v65 = 98.0;
  else
    v65 = 110.0;
  if (v52 <= v65)
  {
    if (sub_100B229E4())
      v52 = 98.0;
    else
      v52 = 110.0;
  }

  return v52;
}

- (void)setItem:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NavSignManeuverCell;
  -[RouteStepListCollectionCell setItem:](&v4, "setItem:", a3);
  -[NavSignManeuverCell redrawContent](self, "redrawContent");
}

- (void)setHideManeuverArrow:(BOOL)a3
{
  if (self->_hideManeuverArrow != a3)
  {
    self->_hideManeuverArrow = a3;
    -[NavSignManeuverCell redrawContent](self, "redrawContent");
  }
}

- (void)setState:(unint64_t)a3 layoutProgress:(double)a4
{
  self->_state = a3;
  -[NavSignManeuverCell _updateStateWithLayoutProgress:](self, "_updateStateWithLayoutProgress:", a4);
}

- (void)setSelectedWithLayoutProgress:(double)a3
{
  void *v5;
  unsigned int v6;
  id v7;
  void *v8;
  double v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  if (self->_state == 1
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell traitCollection](self, "traitCollection")),
        v6 = objc_msgSend(v5, "isLuminanceReduced"),
        v5,
        v6))
  {
    v7 = sub_1006E68C4();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v13 = v8;
    v9 = a3;
  }
  else
  {
    v10 = sub_1006E66E4();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v9 = a3 * 0.239999995;
    v13 = v8;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "colorWithAlphaComponent:", v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell mapsBackgroundView](self, "mapsBackgroundView"));
  objc_msgSend(v12, "setBackgroundColor:", v11);

}

- (void)redrawContent
{
  void *v3;
  unsigned int v4;
  unsigned __int8 v5;
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
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  double v61;
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
  id v99;
  void *v100;
  void *v101;
  void *v102;
  int *v103;
  int *v104;
  void *v105;
  _BYTE v106[496];
  _OWORD v107[31];
  _BYTE __dst[496];
  _OWORD __src[31];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListCollectionCell item](self, "item"));
  v4 = -[NavSignManeuverCell _shouldPostBacklightSceneRequiresUpdateNotification:](self, "_shouldPostBacklightSceneRequiresUpdateNotification:", v3);
  v5 = objc_msgSend(v3, "excludedFieldsMask");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metrics"));
  objc_msgSend(v6, "imageAreaWidth");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell imageAreaWidthConstraint](self, "imageAreaWidthConstraint"));
  objc_msgSend(v9, "setConstant:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metrics"));
  objc_msgSend(v10, "stepImageWidth");
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell imageWidthConstraint](self, "imageWidthConstraint"));
  objc_msgSend(v13, "setConstant:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metrics"));
  objc_msgSend(v14, "stepImageHeight");
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell imageHeightConstraint](self, "imageHeightConstraint"));
  objc_msgSend(v17, "setConstant:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metrics"));
  objc_msgSend(v18, "exitSignPadding");
  v20 = -v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell primaryToExitShieldConstraint](self, "primaryToExitShieldConstraint"));
  objc_msgSend(v21, "setConstant:", v20);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metrics"));
  objc_msgSend(v22, "exitSignPadding");
  v24 = -v23;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell exitShieldTrailingConstraint](self, "exitShieldTrailingConstraint"));
  objc_msgSend(v25, "setConstant:", v24);

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metrics"));
  objc_msgSend(v26, "primaryTextTopMargin");
  v28 = v27;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell primaryTopConstraint](self, "primaryTopConstraint"));
  objc_msgSend(v29, "setConstant:", v28);

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metrics"));
  objc_msgSend(v30, "secondaryTextTopMargin");
  v32 = v31;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell secondaryTopConstraint](self, "secondaryTopConstraint"));
  objc_msgSend(v33, "setConstant:", v32);

  if ((v5 & 4) != 0)
  {
    v35 = 0.0;
  }
  else
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metrics"));
    objc_msgSend(v30, "tertiaryTextTopMargin");
    v35 = v34;
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell tertiaryTopConstraint](self, "tertiaryTopConstraint"));
  objc_msgSend(v36, "setConstant:", v35);

  if ((v5 & 4) == 0)
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metrics"));
  objc_msgSend(v37, "textBottomMargin");
  v39 = -v38;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell tertiaryBottomConstraint](self, "tertiaryBottomConstraint"));
  objc_msgSend(v40, "setConstant:", v39);

  if (-[NavSignManeuverCell hideManeuverArrow](self, "hideManeuverArrow"))
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metrics"));
    objc_msgSend(v41, "imageAreaWidth");
    v43 = -v42;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell imageLeadingConstraint](self, "imageLeadingConstraint"));
    objc_msgSend(v44, "setConstant:", v43);

    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metrics"));
    objc_msgSend(v45, "textTrailingMargin");
    v47 = v46;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell primaryLeadingConstraint](self, "primaryLeadingConstraint"));
    objc_msgSend(v48, "setConstant:", v47);

    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metrics"));
    objc_msgSend(v49, "imageAreaWidth");
    v51 = -v50;
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell primaryTrailingConstraint](self, "primaryTrailingConstraint"));
    objc_msgSend(v52, "setConstant:", v51);

    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metrics"));
    objc_msgSend(v53, "imageAreaWidth");
  }
  else
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell imageLeadingConstraint](self, "imageLeadingConstraint"));
    objc_msgSend(v55, "setConstant:", 0.0);

    v56 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell primaryLeadingConstraint](self, "primaryLeadingConstraint"));
    objc_msgSend(v56, "setConstant:", 0.0);

    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metrics"));
    objc_msgSend(v57, "textTrailingMargin");
    v59 = -v58;
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell primaryTrailingConstraint](self, "primaryTrailingConstraint"));
    objc_msgSend(v60, "setConstant:", v59);

    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metrics"));
    objc_msgSend(v53, "textTrailingMargin");
  }
  v61 = -v54;
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell secondaryTrailingConstraint](self, "secondaryTrailingConstraint"));
  objc_msgSend(v62, "setConstant:", v61);

  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "primaryText"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell primaryTextLabel](self, "primaryTextLabel"));
  objc_msgSend(v64, "setAttributedText:", v63);

  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "secondaryText"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell secondaryTextLabel](self, "secondaryTextLabel"));
  objc_msgSend(v66, "setAttributedText:", v65);

  if ((v5 & 4) != 0)
    v67 = 0;
  else
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tertiaryText"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell tertiaryTextLabel](self, "tertiaryTextLabel"));
  objc_msgSend(v68, "setAttributedText:", v67);

  if ((v5 & 4) == 0)
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "exitSignImage"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell exitShieldImageView](self, "exitShieldImageView"));
  objc_msgSend(v70, "setImage:", v69);

  v71 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell shieldImageView](self, "shieldImageView"));
  objc_msgSend(v71, "setImage:", 0);

  v72 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell guidanceManeuverView](self, "guidanceManeuverView"));
  objc_msgSend(v72, "setManeuverArtwork:", 0);

  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shieldImage"));
  if (v73)
  {
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shieldImage"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell shieldImageView](self, "shieldImageView"));
    objc_msgSend(v75, "setImage:", v74);
  }
  else
  {
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "maneuverArtwork"));

    if (!v76)
      goto LABEL_25;
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "maneuverArtwork"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell guidanceManeuverView](self, "guidanceManeuverView"));
    objc_msgSend(v78, "setManeuverArtwork:", v77);

    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metrics"));
    v80 = v79;
    if (v79)
      objc_msgSend(v79, "arrowMetrics");
    else
      memset(__src, 0, sizeof(__src));
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell guidanceManeuverView](self, "guidanceManeuverView"));
    memcpy(__dst, __src, sizeof(__dst));
    objc_msgSend(v81, "setArrowMetrics:", __dst);

    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metrics"));
    v83 = v82;
    if (v82)
      objc_msgSend(v82, "junctionArrowMetrics");
    else
      memset(v107, 0, sizeof(v107));
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell guidanceManeuverView](self, "guidanceManeuverView"));
    memcpy(v106, v107, sizeof(v106));
    objc_msgSend(v84, "setJunctionArrowMetrics:", v106);

    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metrics"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "arrowColor"));
    v87 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell guidanceManeuverView](self, "guidanceManeuverView"));
    objc_msgSend(v87, "setArrowColor:", v86);

    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metrics"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "arrowAccentColor"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell guidanceManeuverView](self, "guidanceManeuverView"));
    objc_msgSend(v88, "setAccentColor:", v75);

  }
LABEL_25:
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "backgroundColor"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell contentView](self, "contentView"));
  objc_msgSend(v90, "setBackgroundColor:", v89);

  v91 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell exitShieldImageView](self, "exitShieldImageView"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "image"));

  if (v92)
  {
    v93 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell primaryTrailingConstraint](self, "primaryTrailingConstraint"));
    objc_msgSend(v93, "setActive:", 0);

    v94 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell primaryToExitShieldConstraint](self, "primaryToExitShieldConstraint"));
  }
  else
  {
    v95 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell primaryToExitShieldConstraint](self, "primaryToExitShieldConstraint"));
    objc_msgSend(v95, "setActive:", 0);

    v94 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell primaryTrailingConstraint](self, "primaryTrailingConstraint"));
  }
  v96 = v94;
  objc_msgSend(v94, "setActive:", 1);

  v97 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell secondaryTextLabel](self, "secondaryTextLabel"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "attributedText"));
  v99 = objc_msgSend(v98, "length");

  v100 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell secondaryTextLabel](self, "secondaryTextLabel"));
  v101 = v100;
  if (v99)
  {
    objc_msgSend(v100, "setHidden:", 0);

    v102 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell tertiaryTextLabel](self, "tertiaryTextLabel"));
    objc_msgSend(v102, "setHidden:", 0);
    v103 = &OBJC_IVAR___NavSignManeuverCell__primaryTopAnchoredConstraints;
    v104 = &OBJC_IVAR___NavSignManeuverCell__primaryCenteredAnchoredConstraints;
  }
  else
  {
    objc_msgSend(v100, "setHidden:", 1);

    v102 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell tertiaryTextLabel](self, "tertiaryTextLabel"));
    objc_msgSend(v102, "setHidden:", 1);
    v104 = &OBJC_IVAR___NavSignManeuverCell__primaryTopAnchoredConstraints;
    v103 = &OBJC_IVAR___NavSignManeuverCell__primaryCenteredAnchoredConstraints;
  }

  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v104));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v103));
  if (v4)
  {
    v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v105, "postNotificationName:object:", CFSTR("NavContainerShouldUpdateBacklightSceneEnvironmentNotification"), self);

  }
}

- (void)_updateStateWithLayoutProgress:(double)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CGAffineTransform *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  CGAffineTransform v34;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CGAffineTransform v37;
  _OWORD v38[3];
  _OWORD v39[2];
  __int128 v40;
  _OWORD v41[3];
  _OWORD v42[2];
  __int128 v43;

  v5 = -[NavSignManeuverCell state](self, "state");
  if (v5 == 2)
  {
    -[NavSignManeuverCell setSelectedWithLayoutProgress:](self, "setSelectedWithLayoutProgress:", 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell guidanceManeuverView](self, "guidanceManeuverView"));
    objc_msgSend(v16, "setAlpha:", 1.0);

    CGAffineTransformMakeScale(&v37, 0.800000012, 0.800000012);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell guidanceManeuverView](self, "guidanceManeuverView"));
    v36 = v37;
    objc_msgSend(v17, "setTransform:", &v36);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell shieldImageView](self, "shieldImageView"));
    objc_msgSend(v18, "setAlpha:", 1.0);

    CGAffineTransformMakeScale(&v35, 0.800000012, 0.800000012);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell shieldImageView](self, "shieldImageView"));
    v20 = v19;
    v34 = v35;
    v21 = &v34;
LABEL_7:
    objc_msgSend(v19, "setTransform:", v21);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell primaryTextLabel](self, "primaryTextLabel"));
    objc_msgSend(v25, "setAlpha:", 1.0);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell exitShieldImageView](self, "exitShieldImageView"));
    objc_msgSend(v26, "setAlpha:", 1.0);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell secondaryTextLabel](self, "secondaryTextLabel"));
    objc_msgSend(v27, "setAlpha:", 1.0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell tertiaryTextLabel](self, "tertiaryTextLabel"));
    v14 = v13;
    v15 = 1.0;
    goto LABEL_8;
  }
  if (v5 == 1)
  {
    -[NavSignManeuverCell setSelectedWithLayoutProgress:](self, "setSelectedWithLayoutProgress:", a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell guidanceManeuverView](self, "guidanceManeuverView"));
    objc_msgSend(v22, "setAlpha:", 1.0);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell guidanceManeuverView](self, "guidanceManeuverView"));
    v33 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v39[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v31 = v39[0];
    v39[1] = v33;
    v40 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    v29 = v40;
    objc_msgSend(v23, "setTransform:", v39);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell shieldImageView](self, "shieldImageView"));
    objc_msgSend(v24, "setAlpha:", 1.0);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell shieldImageView](self, "shieldImageView"));
    v20 = v19;
    v38[0] = v31;
    v38[1] = v33;
    v38[2] = v29;
    v21 = (CGAffineTransform *)v38;
    goto LABEL_7;
  }
  if (v5)
    return;
  -[NavSignManeuverCell setSelectedWithLayoutProgress:](self, "setSelectedWithLayoutProgress:", 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell guidanceManeuverView](self, "guidanceManeuverView"));
  objc_msgSend(v6, "setAlpha:", 0.150000006);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell guidanceManeuverView](self, "guidanceManeuverView"));
  v32 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v42[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v30 = v42[0];
  v42[1] = v32;
  v43 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  v28 = v43;
  objc_msgSend(v7, "setTransform:", v42);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell shieldImageView](self, "shieldImageView"));
  objc_msgSend(v8, "setAlpha:", 0.150000006);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell shieldImageView](self, "shieldImageView"));
  v41[0] = v30;
  v41[1] = v32;
  v41[2] = v28;
  objc_msgSend(v9, "setTransform:", v41);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell primaryTextLabel](self, "primaryTextLabel"));
  objc_msgSend(v10, "setAlpha:", 0.150000006);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell exitShieldImageView](self, "exitShieldImageView"));
  objc_msgSend(v11, "setAlpha:", 0.150000006);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell secondaryTextLabel](self, "secondaryTextLabel"));
  objc_msgSend(v12, "setAlpha:", 0.150000006);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell tertiaryTextLabel](self, "tertiaryTextLabel"));
  v14 = v13;
  v15 = 0.150000006;
LABEL_8:
  objc_msgSend(v13, "setAlpha:", v15);

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NavSignManeuverCell;
  -[NavSignManeuverCell touchesBegan:withEvent:](&v6, "touchesBegan:withEvent:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell delegate](self, "delegate"));
  objc_msgSend(v5, "cell:setPressed:", self, 1);

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NavSignManeuverCell;
  -[NavSignManeuverCell touchesCancelled:withEvent:](&v6, "touchesCancelled:withEvent:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell delegate](self, "delegate"));
  objc_msgSend(v5, "cell:setPressed:", self, 0);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NavSignManeuverCell;
  -[NavSignManeuverCell touchesEnded:withEvent:](&v6, "touchesEnded:withEvent:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell delegate](self, "delegate"));
  objc_msgSend(v5, "cell:setPressed:", self, 0);

}

- (BOOL)_shouldPostBacklightSceneRequiresUpdateNotification:(id)a3
{
  id v4;
  void *v5;
  unint64_t state;
  unsigned __int8 v7;
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
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  char v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  unsigned __int8 v36;
  void *v37;
  void *v38;
  void *v39;
  BOOL v40;
  char v41;
  void *v42;
  unsigned __int8 v43;
  unsigned __int8 v44;

  v4 = a3;
  if (!GEOConfigGetBOOL(MapsConfig_BacklightSceneUpdaterOptimizationEnabled, off_1014B49F8))
    goto LABEL_7;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell traitCollection](self, "traitCollection"));
  if (!objc_msgSend(v5, "isLuminanceReduced"))
  {

    goto LABEL_7;
  }
  state = self->_state;

  if (state != 1)
  {
LABEL_7:
    v25 = 0;
    goto LABEL_8;
  }
  v7 = objc_msgSend(v4, "excludedFieldsMask");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell primaryTextLabel](self, "primaryTextLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "attributedText"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "string"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "primaryText"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "string"));
  v44 = objc_msgSend(v10, "isEqualToString:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell secondaryTextLabel](self, "secondaryTextLabel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "attributedText"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "string"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "secondaryText"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "string"));
  v43 = objc_msgSend(v15, "isEqualToString:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell tertiaryTextLabel](self, "tertiaryTextLabel"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "attributedText"));
  v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "string"));
  v21 = (void *)v20;
  if ((v7 & 4) != 0)
  {
    LOBYTE(v24) = v20 != 0;
  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tertiaryText"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "string"));
    v24 = objc_msgSend(v21, "isEqualToString:", v23) ^ 1;

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell shieldImageView](self, "shieldImageView"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "image"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shieldImage"));

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell exitShieldImageView](self, "exitShieldImageView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "image"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "exitSignImage"));

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell guidanceManeuverView](self, "guidanceManeuverView"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "maneuverArtwork"));
  v34 = v24;
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "maneuverArtwork"));
  v36 = objc_msgSend(v33, "isEqual:", v35);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverCell contentView](self, "contentView"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "backgroundColor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "backgroundColor"));
  v40 = v38 != v39;

  v41 = v44 & v43 ^ 1 | v34;
  if (v42 != v28)
    v41 = 1;
  if (v30 != v31)
    v41 = 1;
  v25 = v41 | v36 ^ 1 | v40;
LABEL_8:

  return v25 & 1;
}

- (NavSignManeuverCellDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (NavSignManeuverCellDelegate *)a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (BOOL)hideManeuverArrow
{
  return self->_hideManeuverArrow;
}

- (UIView)mapsBackgroundView
{
  return self->_mapsBackgroundView;
}

- (void)setMapsBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_mapsBackgroundView, a3);
}

- (GuidanceManeuverView)guidanceManeuverView
{
  return self->_guidanceManeuverView;
}

- (void)setGuidanceManeuverView:(id)a3
{
  objc_storeStrong((id *)&self->_guidanceManeuverView, a3);
}

- (UIImageView)shieldImageView
{
  return self->_shieldImageView;
}

- (void)setShieldImageView:(id)a3
{
  objc_storeStrong((id *)&self->_shieldImageView, a3);
}

- (UILabel)primaryTextLabel
{
  return self->_primaryTextLabel;
}

- (void)setPrimaryTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_primaryTextLabel, a3);
}

- (UIImageView)exitShieldImageView
{
  return self->_exitShieldImageView;
}

- (void)setExitShieldImageView:(id)a3
{
  objc_storeStrong((id *)&self->_exitShieldImageView, a3);
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

- (NSLayoutConstraint)imageLeadingConstraint
{
  return self->_imageLeadingConstraint;
}

- (void)setImageLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageLeadingConstraint, a3);
}

- (NSLayoutConstraint)imageAreaWidthConstraint
{
  return self->_imageAreaWidthConstraint;
}

- (void)setImageAreaWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageAreaWidthConstraint, a3);
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

- (NSLayoutConstraint)primaryLeadingConstraint
{
  return self->_primaryLeadingConstraint;
}

- (void)setPrimaryLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_primaryLeadingConstraint, a3);
}

- (NSLayoutConstraint)primaryTrailingConstraint
{
  return self->_primaryTrailingConstraint;
}

- (void)setPrimaryTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_primaryTrailingConstraint, a3);
}

- (NSLayoutConstraint)primaryToExitShieldConstraint
{
  return self->_primaryToExitShieldConstraint;
}

- (void)setPrimaryToExitShieldConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_primaryToExitShieldConstraint, a3);
}

- (NSLayoutConstraint)exitShieldTrailingConstraint
{
  return self->_exitShieldTrailingConstraint;
}

- (void)setExitShieldTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_exitShieldTrailingConstraint, a3);
}

- (NSLayoutConstraint)secondaryTrailingConstraint
{
  return self->_secondaryTrailingConstraint;
}

- (void)setSecondaryTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryTrailingConstraint, a3);
}

- (NSLayoutConstraint)tertiaryBottomConstraint
{
  return self->_tertiaryBottomConstraint;
}

- (void)setTertiaryBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_tertiaryBottomConstraint, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tertiaryTopConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryTopConstraint, 0);
  objc_storeStrong((id *)&self->_primaryTopConstraint, 0);
  objc_storeStrong((id *)&self->_tertiaryBottomConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_exitShieldTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_primaryToExitShieldConstraint, 0);
  objc_storeStrong((id *)&self->_primaryTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_primaryLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_imageHeightConstraint, 0);
  objc_storeStrong((id *)&self->_imageWidthConstraint, 0);
  objc_storeStrong((id *)&self->_imageAreaWidthConstraint, 0);
  objc_storeStrong((id *)&self->_imageLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_tertiaryTextLabel, 0);
  objc_storeStrong((id *)&self->_secondaryTextLabel, 0);
  objc_storeStrong((id *)&self->_exitShieldImageView, 0);
  objc_storeStrong((id *)&self->_primaryTextLabel, 0);
  objc_storeStrong((id *)&self->_shieldImageView, 0);
  objc_storeStrong((id *)&self->_guidanceManeuverView, 0);
  objc_storeStrong((id *)&self->_mapsBackgroundView, 0);
  objc_storeStrong((id *)&self->_primaryCenteredAnchoredConstraints, 0);
  objc_storeStrong((id *)&self->_primaryTopAnchoredConstraints, 0);
}

@end
