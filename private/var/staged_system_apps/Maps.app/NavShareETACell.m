@implementation NavShareETACell

- (NavShareETACell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  NavShareETACell *v4;
  NavShareETACell *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  CAShapeLayer *circleLayer;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  double v17;
  UIView *v18;
  UIView *imageBackgroundView;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  UIImageView *v24;
  UIImageView *leadingImageView;
  void *v26;
  void *v27;
  UIImageView *v28;
  UIImageView *badgeImageView;
  void *v30;
  UIView *v31;
  void *v32;
  UILabel *v33;
  UILabel *titleLabel;
  UILabel *v35;
  UILabel *subtitleLabel;
  UIView *v37;
  UILabel *v38;
  UILabel *smsLabel;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  NSLayoutConstraint *textCenterConstraint;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  NSLayoutConstraint *titleCenterConstraint;
  void *v56;
  void *v57;
  uint64_t v58;
  NSLayoutConstraint *textTrailingConstrant;
  UIView *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
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
  UIView *v92;
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
  objc_super v131;
  _QWORD v132[24];

  v131.receiver = self;
  v131.super_class = (Class)NavShareETACell;
  v4 = -[NavShareETACell initWithStyle:reuseIdentifier:](&v131, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (objc_class *)objc_opt_class(v4);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[NavShareETACell setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", v8);

    v130 = (void *)objc_claimAutoreleasedReturnValue(+[UIBackgroundConfiguration listCellConfiguration](UIBackgroundConfiguration, "listCellConfiguration"));
    objc_msgSend(v130, "setCornerRadius:", 10.0);
    -[NavShareETACell setBackgroundConfiguration:](v5, "setBackgroundConfiguration:", v130);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETACell contentView](v5, "contentView"));
    objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("NavShareETACellContent"));

    v10 = objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
    circleLayer = v5->_circleLayer;
    v5->_circleLayer = (CAShapeLayer *)v10;

    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, 60.0, 60.0, 60.0)));
    -[CAShapeLayer setPath:](v5->_circleLayer, "setPath:", objc_msgSend(v12, "CGPath"));

    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
    -[CAShapeLayer setFillColor:](v5->_circleLayer, "setFillColor:", objc_msgSend(v13, "CGColor"));

    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor")));
    -[CAShapeLayer setStrokeColor:](v5->_circleLayer, "setStrokeColor:", objc_msgSend(v14, "CGColor"));

    -[CAShapeLayer setLineWidth:](v5->_circleLayer, "setLineWidth:", 2.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETACell contentView](v5, "contentView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "layer"));
    objc_msgSend(v16, "insertSublayer:atIndex:", v5->_circleLayer, 0);

    LODWORD(v17) = 0;
    -[CAShapeLayer setOpacity:](v5->_circleLayer, "setOpacity:", v17);
    -[CAShapeLayer setStrokeEnd:](v5->_circleLayer, "setStrokeEnd:", 0.0);
    v18 = objc_opt_new(UIView);
    imageBackgroundView = v5->_imageBackgroundView;
    v5->_imageBackgroundView = v18;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5->_imageBackgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v5->_imageBackgroundView, "layer"));
    objc_msgSend(v20, "setCornerRadius:", 27.0);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v5->_imageBackgroundView, "layer"));
    objc_msgSend(v21, "setMasksToBounds:", 1);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor"));
    -[UIView setBackgroundColor:](v5->_imageBackgroundView, "setBackgroundColor:", v22);

    -[UIView setAccessibilityIdentifier:](v5->_imageBackgroundView, "setAccessibilityIdentifier:", CFSTR("ImageBackgroundView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETACell contentView](v5, "contentView"));
    objc_msgSend(v23, "addSubview:", v5->_imageBackgroundView);

    v24 = objc_opt_new(UIImageView);
    leadingImageView = v5->_leadingImageView;
    v5->_leadingImageView = v24;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v5->_leadingImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v5->_leadingImageView, "layer"));
    objc_msgSend(v26, "setCornerRadius:", 27.0);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    -[UIImageView setTintColor:](v5->_leadingImageView, "setTintColor:", v27);

    -[UIImageView setAccessibilityIdentifier:](v5->_leadingImageView, "setAccessibilityIdentifier:", CFSTR("LeadingImageView"));
    -[UIImageView setAccessibilityIgnoresInvertColors:](v5->_leadingImageView, "setAccessibilityIgnoresInvertColors:", 1);
    -[UIView addSubview:](v5->_imageBackgroundView, "addSubview:", v5->_leadingImageView);
    v28 = objc_opt_new(UIImageView);
    badgeImageView = v5->_badgeImageView;
    v5->_badgeImageView = v28;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v5->_badgeImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v5->_badgeImageView, "setContentMode:", 1);
    -[UIImageView setAccessibilityIdentifier:](v5->_badgeImageView, "setAccessibilityIdentifier:", CFSTR("BadgeImageView"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETACell contentView](v5, "contentView"));
    objc_msgSend(v30, "addSubview:", v5->_badgeImageView);

    v31 = objc_opt_new(UIView);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setAccessibilityIdentifier:](v31, "setAccessibilityIdentifier:", CFSTR("TextContainer"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETACell contentView](v5, "contentView"));
    objc_msgSend(v32, "addSubview:", v31);

    v33 = objc_opt_new(UILabel);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v33;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v5->_titleLabel, "setNumberOfLines:", 2);
    -[UILabel setAccessibilityIdentifier:](v5->_titleLabel, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
    -[UIView addSubview:](v31, "addSubview:", v5->_titleLabel);
    v35 = objc_opt_new(UILabel);
    subtitleLabel = v5->_subtitleLabel;
    v5->_subtitleLabel = v35;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAccessibilityIdentifier:](v5->_subtitleLabel, "setAccessibilityIdentifier:", CFSTR("SubtitleLabel"));
    v37 = v31;
    -[UIView addSubview:](v31, "addSubview:", v5->_subtitleLabel);
    v38 = objc_opt_new(UILabel);
    smsLabel = v5->_smsLabel;
    v5->_smsLabel = v38;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_smsLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
    -[UILabel setTextColor:](v5->_smsLabel, "setTextColor:", v40);

    LODWORD(v41) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v5->_smsLabel, "setContentCompressionResistancePriority:forAxis:", 1, v41);
    LODWORD(v42) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v5->_smsLabel, "setContentCompressionResistancePriority:forAxis:", 0, v42);
    LODWORD(v43) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v5->_smsLabel, "setContentHuggingPriority:forAxis:", 1, v43);
    LODWORD(v44) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v5->_smsLabel, "setContentHuggingPriority:forAxis:", 0, v44);
    -[UILabel setAccessibilityIdentifier:](v5->_smsLabel, "setAccessibilityIdentifier:", CFSTR("SMSLabel"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETACell contentView](v5, "contentView"));
    objc_msgSend(v45, "addSubview:", v5->_smsLabel);

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v31, "centerYAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETACell contentView](v5, "contentView"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "centerYAnchor"));
    v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v48));
    textCenterConstraint = v5->_textCenterConstraint;
    v5->_textCenterConstraint = (NSLayoutConstraint *)v49;

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](v5->_titleLabel, "centerYAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETACell contentView](v5, "contentView"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "centerYAnchor"));
    v54 = objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v53));
    titleCenterConstraint = v5->_titleCenterConstraint;
    v5->_titleCenterConstraint = (NSLayoutConstraint *)v54;

    v56 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v37, "trailingAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v5->_smsLabel, "leadingAnchor"));
    v58 = objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:constant:", v57, -16.0));
    textTrailingConstrant = v5->_textTrailingConstrant;
    v5->_textTrailingConstrant = (NSLayoutConstraint *)v58;

    v128 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v5->_imageBackgroundView, "leadingAnchor"));
    v129 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETACell contentView](v5, "contentView"));
    v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "leadingAnchor"));
    v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "constraintEqualToAnchor:constant:", v127, 12.0));
    v132[0] = v126;
    v125 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v5->_imageBackgroundView, "widthAnchor"));
    v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "constraintEqualToConstant:", 54.0));
    v132[1] = v124;
    v122 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v5->_imageBackgroundView, "centerYAnchor"));
    v123 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETACell contentView](v5, "contentView"));
    v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "centerYAnchor"));
    v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "constraintEqualToAnchor:", v121));
    v132[2] = v120;
    v119 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v5->_imageBackgroundView, "heightAnchor"));
    v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "constraintEqualToConstant:", 54.0));
    v132[3] = v118;
    v117 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](v5->_leadingImageView, "leadingAnchor"));
    v116 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v5->_imageBackgroundView, "leadingAnchor"));
    v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "constraintEqualToAnchor:", v116));
    v132[4] = v115;
    v114 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](v5->_leadingImageView, "trailingAnchor"));
    v113 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v5->_imageBackgroundView, "trailingAnchor"));
    v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "constraintEqualToAnchor:", v113));
    v132[5] = v112;
    v111 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](v5->_leadingImageView, "topAnchor"));
    v110 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v5->_imageBackgroundView, "topAnchor"));
    v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "constraintEqualToAnchor:", v110));
    v132[6] = v109;
    v108 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](v5->_leadingImageView, "bottomAnchor"));
    v107 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v5->_imageBackgroundView, "bottomAnchor"));
    v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "constraintEqualToAnchor:", v107));
    v132[7] = v106;
    v105 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](v5->_badgeImageView, "trailingAnchor"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v5->_imageBackgroundView, "trailingAnchor"));
    v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "constraintEqualToAnchor:constant:", v104, 2.0));
    v132[8] = v103;
    v102 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](v5->_badgeImageView, "bottomAnchor"));
    v101 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v5->_imageBackgroundView, "bottomAnchor"));
    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "constraintEqualToAnchor:constant:", v101, 2.0));
    v132[9] = v99;
    v98 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v5->_badgeImageView, "widthAnchor"));
    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "constraintEqualToConstant:", 20.0));
    v132[10] = v97;
    v96 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v5->_badgeImageView, "heightAnchor"));
    v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "constraintEqualToConstant:", 20.0));
    v132[11] = v95;
    v93 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v5->_smsLabel, "trailingAnchor"));
    v94 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETACell contentView](v5, "contentView"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "trailingAnchor"));
    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintEqualToAnchor:constant:", v91, -16.0));
    v132[12] = v90;
    v88 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](v5->_smsLabel, "centerYAnchor"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETACell contentView](v5, "contentView"));
    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "centerYAnchor"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "constraintEqualToAnchor:", v87));
    v132[13] = v86;
    v85 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v37, "leadingAnchor"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v5->_imageBackgroundView, "trailingAnchor"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintEqualToAnchor:constant:", v84, 10.0));
    v132[14] = v83;
    v132[15] = v5->_textTrailingConstrant;
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v5->_titleLabel, "leadingAnchor"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v37, "leadingAnchor"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "constraintEqualToAnchor:", v81));
    v132[16] = v80;
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v5->_titleLabel, "trailingAnchor"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v37, "trailingAnchor"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "constraintEqualToAnchor:", v78));
    v132[17] = v77;
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v5->_titleLabel, "topAnchor"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v37, "topAnchor"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "constraintEqualToAnchor:", v75));
    v132[18] = v74;
    v132[19] = v5->_titleCenterConstraint;
    v100 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v5->_subtitleLabel, "leadingAnchor"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v37, "leadingAnchor"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "constraintEqualToAnchor:", v73));
    v132[20] = v72;
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v5->_subtitleLabel, "trailingAnchor"));
    v60 = v37;
    v92 = v37;
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v37, "trailingAnchor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintEqualToAnchor:", v61));
    v132[21] = v62;
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v5->_subtitleLabel, "topAnchor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v5->_titleLabel, "bottomAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:", v64));
    v132[22] = v65;
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v5->_subtitleLabel, "bottomAnchor"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v60, "bottomAnchor"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:", v67));
    v132[23] = v68;
    v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v132, 24));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v69);

    -[NavShareETACell _updateFonts](v5, "_updateFonts");
    -[NavShareETACell _updateContactContent](v5, "_updateContactContent");
    -[NavShareETACell _updateCapabilityContent](v5, "_updateCapabilityContent");
    -[NavShareETACell setSharingState:animated:](v5, "setSharingState:animated:", 0, 0);

  }
  return v5;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NavShareETACell;
  v4 = a3;
  -[NavShareETACell traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETACell traitCollection](self, "traitCollection", v8.receiver, v8.super_class));
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
  {
    -[NavShareETACell _updateFonts](self, "_updateFonts");
    -[NavShareETACell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NavShareETACell;
  -[NavShareETACell layoutSubviews](&v6, "layoutSubviews");
  -[UIView frame](self->_imageBackgroundView, "frame");
  v4 = v3 + -3.0;
  -[UIView frame](self->_imageBackgroundView, "frame");
  -[CAShapeLayer setPosition:](self->_circleLayer, "setPosition:", v4, v5 + -3.0);
}

- (void)setContact:(id)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 v8;
  id v9;

  v5 = a3;
  v6 = self->_contact;
  v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    v9 = (id)v7;
    v8 = objc_msgSend((id)v6, "isEqual:", v7);

    v7 = (unint64_t)v9;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_contact, a3);
      -[NavShareETACell _updateContactContent](self, "_updateContactContent");
      v7 = (unint64_t)v9;
    }
  }

}

- (void)setCapabilityType:(unint64_t)a3
{
  if (self->_capabilityType != a3)
  {
    self->_capabilityType = a3;
    -[NavShareETACell _updateCapabilityContent](self, "_updateCapabilityContent");
  }
}

- (void)setSharingState:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  if (self->_sharingState != a3)
  {
    v4 = a4;
    self->_sharingState = a3;
    -[NavShareETACell _updateSharingContent](self, "_updateSharingContent");
    -[NavShareETACell _updateSharingRingAnimated:](self, "_updateSharingRingAnimated:", v4);
  }
}

- (void)setIsStandaloneSharingSuggestion:(BOOL)a3
{
  if (self->_isStandaloneSharingSuggestion != a3)
  {
    self->_isStandaloneSharingSuggestion = a3;
    -[NavShareETACell _updateSharingContent](self, "_updateSharingContent");
  }
}

- (void)_updateFonts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETACell traitCollection](self, "traitCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_maps_traitCollectionWithMaximumContentSizeCategory:", UIContentSizeCategoryAccessibilityLarge));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:](UIFont, "preferredFontForTextStyle:compatibleWithTraitCollection:", UIFontTextStyleTitle2, v4));
  -[UILabel setFont:](self->_titleLabel, "setFont:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETACell traitCollection](self, "traitCollection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_maps_traitCollectionWithMaximumContentSizeCategory:", UIContentSizeCategoryAccessibilityLarge));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:](UIFont, "preferredFontForTextStyle:compatibleWithTraitCollection:", UIFontTextStyleBody, v7));
  -[UILabel setFont:](self->_subtitleLabel, "setFont:", v8);

  v11 = (id)objc_claimAutoreleasedReturnValue(-[NavShareETACell traitCollection](self, "traitCollection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_maps_traitCollectionWithMaximumContentSizeCategory:", UIContentSizeCategoryExtraExtraLarge));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:](UIFont, "preferredFontForTextStyle:compatibleWithTraitCollection:", UIFontTextStyleHeadline, v9));
  -[UILabel setFont:](self->_smsLabel, "setFont:", v10);

}

- (void)_updateContactContent
{
  void *v3;
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
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETACell contact](self, "contact"));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayName"));
    -[UILabel setText:](self->_titleLabel, "setText:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v6);

    objc_initWeak(&location, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsUIImageCache sharedCache](MapsUIImageCache, "sharedCache"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contact"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100C58568;
    v15[3] = &unk_1011C6C88;
    objc_copyWeak(&v17, &location);
    v16 = v4;
    objc_msgSend(v7, "getImageForContact:size:completion:", v8, v15, 54.0);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("[SharedETA] Open Contacts"), CFSTR("localized string not found"), 0));
    -[UILabel setText:](self->_titleLabel, "setText:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 30.0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("person.crop.circle.fill"), v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "imageWithRenderingMode:", 2));
    -[UIImageView setImage:](self->_leadingImageView, "setImage:", v14);

    -[UIImageView setContentMode:](self->_leadingImageView, "setContentMode:", 4);
  }

}

- (void)_updateCapabilityContent
{
  unint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;

  v3 = -[NavShareETACell capabilityType](self, "capabilityType");
  if (v3 - 2 >= 2)
  {
    if (v3 == 4)
    {
      v6 = MapsAppBundleId;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETACell traitCollection](self, "traitCollection"));
      objc_msgSend(v7, "displayScale");
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v6, 0));
      -[UIImageView setImage:](self->_badgeImageView, "setImage:", v8);

    }
    else
    {
      -[UIImageView setImage:](self->_badgeImageView, "setImage:", 0);
    }
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETACell traitCollection](self, "traitCollection"));
    objc_msgSend(v4, "displayScale");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", CFSTR("com.apple.MobileSMS"), 0));
    -[UIImageView setImage:](self->_badgeImageView, "setImage:", v5);

  }
  if ((id)-[NavShareETACell capabilityType](self, "capabilityType") == (id)2)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("[SharedETA] SMS"), CFSTR("localized string not found"), 0));
    -[UILabel setText:](self->_smsLabel, "setText:", v10);

    v11 = -16.0;
  }
  else
  {
    -[UILabel setText:](self->_smsLabel, "setText:", 0);
    v11 = 0.0;
  }
  -[NSLayoutConstraint setConstant:](self->_textTrailingConstrant, "setConstant:", v11);
}

- (void)_updateSharingContent
{
  unint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = -[NavShareETACell sharingState](self, "sharingState");
  if (v3 - 2 < 2)
  {
    -[NSLayoutConstraint setActive:](self->_titleCenterConstraint, "setActive:", 0);
    -[NSLayoutConstraint setActive:](self->_textCenterConstraint, "setActive:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] Already Sharing"), CFSTR("localized string not found"), 0));
    -[UILabel setText:](self->_subtitleLabel, "setText:", v8);

    v6 = objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
    goto LABEL_8;
  }
  if (v3 == 1)
  {
    -[NSLayoutConstraint setActive:](self->_titleCenterConstraint, "setActive:", 0);
    -[NSLayoutConstraint setActive:](self->_textCenterConstraint, "setActive:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] Just Started"), CFSTR("localized string not found"), 0));
    -[UILabel setText:](self->_subtitleLabel, "setText:", v10);

    v6 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    goto LABEL_8;
  }
  if (!v3)
  {
    if (self->_isStandaloneSharingSuggestion)
    {
      -[NSLayoutConstraint setActive:](self->_titleCenterConstraint, "setActive:", 0);
      -[NSLayoutConstraint setActive:](self->_textCenterConstraint, "setActive:", 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] Start Sharing"), CFSTR("localized string not found"), 0));
      -[UILabel setText:](self->_subtitleLabel, "setText:", v5);

      v6 = objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
LABEL_8:
      v11 = (id)v6;
      -[UILabel setTextColor:](self->_subtitleLabel, "setTextColor:", v6);

      return;
    }
    -[NSLayoutConstraint setActive:](self->_textCenterConstraint, "setActive:", 0);
    -[NSLayoutConstraint setActive:](self->_titleCenterConstraint, "setActive:", 1);
    -[UILabel setText:](self->_subtitleLabel, "setText:", 0);
  }
}

- (void)updateConfigurationUsingState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETACell backgroundConfiguration](self, "backgroundConfiguration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "updatedConfigurationForState:", v10));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETACell traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if ((objc_msgSend(v10, "isHighlighted") & 1) != 0 || objc_msgSend(v10, "isSelected"))
  {
    if (v7 == (id)2)
      v8 = objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemGroupedBackgroundColor](UIColor, "tertiarySystemGroupedBackgroundColor"));
    else
      v8 = objc_claimAutoreleasedReturnValue(+[UIColor systemLightMidGrayColor](UIColor, "systemLightMidGrayColor"));
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemGroupedBackgroundColor](UIColor, "secondarySystemGroupedBackgroundColor"));
  }
  v9 = (void *)v8;
  objc_msgSend(v5, "setBackgroundColor:", v8);

  -[NavShareETACell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", v5);
}

- (double)heightForWidth:(double)a3
{
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_smsLabel, "text"));
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    -[UILabel sizeThatFits:](self->_smsLabel, "sizeThatFits:", a3, 78.0);
    v8 = v7 + 16.0 + 16.0;
  }
  else
  {
    v8 = 16.0;
  }
  v9 = a3 + -76.0 - v8;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v9, 78.0);
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_subtitleLabel, "text"));
  if (objc_msgSend(v12, "length"))
  {
    -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v9, 78.0);
    v14 = ceil(v13);
  }
  else
  {
    v14 = 0.0;
  }

  return fmax(ceil(v11) + 32.0 + v14, 78.0);
}

- (void)_updateSharingRingAnimated:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  double v6;
  CAShapeLayer *circleLayer;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  id v13;

  v3 = a3;
  v5 = -[NavShareETACell sharingState](self, "sharingState");
  if (v5 - 2 < 2)
  {
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    -[CAShapeLayer setStrokeEnd:](self->_circleLayer, "setStrokeEnd:", 1.0);
    LODWORD(v8) = 1.0;
    -[CAShapeLayer setOpacity:](self->_circleLayer, "setOpacity:", v8);
    +[CATransaction commit](CATransaction, "commit");
    circleLayer = self->_circleLayer;
LABEL_6:
    -[CAShapeLayer removeAnimationForKey:](circleLayer, "removeAnimationForKey:", CFSTR("drawCircleAnimation"));
    return;
  }
  if (v5 != 1)
  {
    if (v5)
      return;
    LODWORD(v6) = 0;
    -[CAShapeLayer setOpacity:](self->_circleLayer, "setOpacity:", v6);
    circleLayer = self->_circleLayer;
    goto LABEL_6;
  }
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  -[CAShapeLayer setStrokeEnd:](self->_circleLayer, "setStrokeEnd:", 0.0);
  LODWORD(v9) = 1.0;
  -[CAShapeLayer setOpacity:](self->_circleLayer, "setOpacity:", v9);
  +[CATransaction commit](CATransaction, "commit");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("strokeEnd")));
  v13 = v10;
  v11 = 1.5;
  if (!v3)
    v11 = 0.0;
  objc_msgSend(v10, "setDuration:", v11);
  objc_msgSend(v13, "setToValue:", &off_101271488);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
  objc_msgSend(v13, "setTimingFunction:", v12);

  objc_msgSend(v13, "setDelegate:", self);
  objc_msgSend(v13, "setFillMode:", kCAFillModeBoth);
  objc_msgSend(v13, "setRemovedOnCompletion:", 0);
  -[CAShapeLayer addAnimation:forKey:](self->_circleLayer, "addAnimation:forKey:", v13, CFSTR("drawCircleAnimation"));

}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void *v5;

  if (a4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETACell delegate](self, "delegate", a3));
    objc_msgSend(v5, "cellDidFinishRingAnimation:", self);

  }
  -[CAShapeLayer setDelegate:](self->_circleLayer, "setDelegate:", 0);
}

- (NavShareETACellDelegate)delegate
{
  return (NavShareETACellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MSPSharedTripContact)contact
{
  return self->_contact;
}

- (unint64_t)capabilityType
{
  return self->_capabilityType;
}

- (unint64_t)sharingState
{
  return self->_sharingState;
}

- (BOOL)isStandaloneSharingSuggestion
{
  return self->_isStandaloneSharingSuggestion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_textTrailingConstrant, 0);
  objc_storeStrong((id *)&self->_titleCenterConstraint, 0);
  objc_storeStrong((id *)&self->_textCenterConstraint, 0);
  objc_storeStrong((id *)&self->_smsLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_badgeImageView, 0);
  objc_storeStrong((id *)&self->_leadingImageView, 0);
  objc_storeStrong((id *)&self->_imageBackgroundView, 0);
  objc_storeStrong((id *)&self->_circleLayer, 0);
}

@end
