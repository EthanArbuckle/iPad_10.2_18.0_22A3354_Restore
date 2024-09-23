@implementation CarShareTripContactCell

- (CarShareTripContactCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CarShareTripContactCell *v4;
  CarShareTripContactCell *v5;
  id v6;
  double y;
  double width;
  double height;
  UIImageView *v10;
  UIImageView *contactImageView;
  void *v12;
  UILabel *v13;
  UILabel *contactNameLabel;
  void *v15;
  SharedTripCapabilityBadgeView *v16;
  SharedTripCapabilityBadgeView *capabilityBadgeView;
  void *v18;
  CarSharingRingView *v19;
  CarSharingRingView *sharingRingView;
  void *v21;
  UILabel *v22;
  UILabel *subtitleLabel;
  void *v24;
  id v25;
  void *v26;
  id v27;
  double v28;
  double v29;
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
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
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
  objc_super v121;
  _QWORD v122[18];
  _QWORD v123[2];

  v121.receiver = self;
  v121.super_class = (Class)CarShareTripContactCell;
  v4 = -[CarShareTripContactCell initWithStyle:reuseIdentifier:](&v121, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CarShareTripContactCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("CarShareTripContactCell"));
    v6 = objc_alloc((Class)UIImageView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v10 = (UIImageView *)objc_msgSend(v6, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    contactImageView = v5->_contactImageView;
    v5->_contactImageView = v10;

    -[UIImageView setAccessibilityIdentifier:](v5->_contactImageView, "setAccessibilityIdentifier:", CFSTR("ContactImageView"));
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v5->_contactImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareTripContactCell contentView](v5, "contentView"));
    objc_msgSend(v12, "addSubview:", v5->_contactImageView);

    v13 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    contactNameLabel = v5->_contactNameLabel;
    v5->_contactNameLabel = v13;

    -[UILabel setAccessibilityIdentifier:](v5->_contactNameLabel, "setAccessibilityIdentifier:", CFSTR("ContactNameLabel"));
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_contactNameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 17.0));
    -[UILabel setFont:](v5->_contactNameLabel, "setFont:", v15);

    -[UILabel setMinimumScaleFactor:](v5->_contactNameLabel, "setMinimumScaleFactor:", 0.764705882);
    -[UILabel setAdjustsFontSizeToFitWidth:](v5->_contactNameLabel, "setAdjustsFontSizeToFitWidth:", 1);
    v16 = objc_alloc_init(SharedTripCapabilityBadgeView);
    capabilityBadgeView = v5->_capabilityBadgeView;
    v5->_capabilityBadgeView = v16;

    -[SharedTripCapabilityBadgeView setTranslatesAutoresizingMaskIntoConstraints:](v5->_capabilityBadgeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareTripContactCell contentView](v5, "contentView"));
    objc_msgSend(v18, "addSubview:", v5->_capabilityBadgeView);

    v19 = -[CarSharingRingView initWithFrame:]([CarSharingRingView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    sharingRingView = v5->_sharingRingView;
    v5->_sharingRingView = v19;

    -[CarSharingRingView setTranslatesAutoresizingMaskIntoConstraints:](v5->_sharingRingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CarSharingRingView setAnimationDelegate:](v5->_sharingRingView, "setAnimationDelegate:", v5);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareTripContactCell contentView](v5, "contentView"));
    objc_msgSend(v21, "insertSubview:aboveSubview:", v5->_sharingRingView, v5->_contactImageView);

    v22 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    subtitleLabel = v5->_subtitleLabel;
    v5->_subtitleLabel = v22;

    -[UILabel setAccessibilityIdentifier:](v5->_subtitleLabel, "setAccessibilityIdentifier:", CFSTR("SubtitleLabel"));
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 13.0));
    -[UILabel setFont:](v5->_subtitleLabel, "setFont:", v24);

    -[UILabel setMinimumScaleFactor:](v5->_subtitleLabel, "setMinimumScaleFactor:", 0.769230769);
    -[UILabel setAdjustsFontSizeToFitWidth:](v5->_subtitleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setHidden:](v5->_subtitleLabel, "setHidden:", 1);
    -[CarShareTripContactCell _updateAppearance](v5, "_updateAppearance");
    v25 = objc_alloc((Class)UIStackView);
    v123[0] = v5->_contactNameLabel;
    v123[1] = v5->_subtitleLabel;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v123, 2));
    v27 = objc_msgSend(v25, "initWithArrangedSubviews:", v26);

    objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v27, "setAlignment:", 0);
    objc_msgSend(v27, "setDistribution:", 2);
    objc_msgSend(v27, "setAxis:", 1);
    objc_msgSend(v27, "setSpacing:", 0.0);
    LODWORD(v28) = 1148846080;
    objc_msgSend(v27, "setContentHuggingPriority:forAxis:", 1, v28);
    LODWORD(v29) = 1148846080;
    objc_msgSend(v27, "setContentCompressionResistancePriority:forAxis:", 1, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareTripContactCell contentView](v5, "contentView"));
    objc_msgSend(v30, "addSubview:", v27);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](v5->_contactImageView, "leadingAnchor"));
    v119 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareTripContactCell contentView](v5, "contentView"));
    v120 = v31;
    v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "leadingAnchor"));
    v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", 6.0));
    v122[0] = v117;
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "leadingAnchor"));
    v115 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](v5->_contactImageView, "trailingAnchor"));
    v116 = v32;
    v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:constant:", v115, 6.0));
    v122[1] = v114;
    v113 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareTripContactCell contentView](v5, "contentView"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "trailingAnchor"));
    v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "trailingAnchor"));
    v112 = v33;
    v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:constant:", v111, 6.0));
    v122[2] = v110;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](v5->_contactImageView, "topAnchor"));
    v108 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareTripContactCell contentView](v5, "contentView"));
    v109 = v34;
    v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "topAnchor"));
    v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintGreaterThanOrEqualToAnchor:constant:", 6.0));
    v122[3] = v106;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v5->_contactImageView, "centerYAnchor"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareTripContactCell contentView](v5, "contentView"));
    v105 = v35;
    v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "centerYAnchor"));
    v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:"));
    v122[4] = v102;
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "topAnchor"));
    v100 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareTripContactCell contentView](v5, "contentView"));
    v101 = v36;
    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "topAnchor"));
    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintGreaterThanOrEqualToAnchor:constant:", 6.0));
    v122[5] = v98;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "centerYAnchor"));
    v96 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v5->_contactImageView, "centerYAnchor"));
    v97 = v37;
    v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v96));
    v122[6] = v95;
    v94 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareTripContactCell contentView](v5, "contentView"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "bottomAnchor"));
    v92 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](v5->_contactImageView, "bottomAnchor"));
    v93 = v38;
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintGreaterThanOrEqualToAnchor:constant:", v92, 6.0));
    v122[7] = v91;
    v90 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareTripContactCell contentView](v5, "contentView"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "bottomAnchor"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bottomAnchor"));
    v89 = v39;
    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintGreaterThanOrEqualToAnchor:constant:", v88, 6.0));
    v122[8] = v87;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v5->_contactImageView, "widthAnchor"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v5->_contactImageView, "heightAnchor"));
    v86 = v40;
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v85));
    v122[9] = v84;
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v5->_contactImageView, "widthAnchor"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "constraintEqualToConstant:", 34.0));
    v122[10] = v82;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripCapabilityBadgeView trailingAnchor](v5->_capabilityBadgeView, "trailingAnchor"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](v5->_contactImageView, "trailingAnchor"));
    v81 = v41;
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:constant:", v80, 2.0));
    v122[11] = v79;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripCapabilityBadgeView bottomAnchor](v5->_capabilityBadgeView, "bottomAnchor"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](v5->_contactImageView, "bottomAnchor"));
    v78 = v42;
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:constant:", v77, 2.0));
    v122[12] = v76;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharingRingView centerXAnchor](v5->_sharingRingView, "centerXAnchor"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](v5->_contactImageView, "centerXAnchor"));
    v75 = v43;
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v74));
    v122[13] = v73;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharingRingView centerYAnchor](v5->_sharingRingView, "centerYAnchor"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v5->_contactImageView, "centerYAnchor"));
    v72 = v44;
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v71));
    v122[14] = v70;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharingRingView widthAnchor](v5->_sharingRingView, "widthAnchor"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v5->_contactImageView, "widthAnchor"));
    v69 = v45;
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:constant:", v68, 4.0));
    v122[15] = v67;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharingRingView heightAnchor](v5->_sharingRingView, "heightAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v5->_contactImageView, "heightAnchor"));
    v66 = v46;
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:constant:", v47, 4.0));
    v122[16] = v48;
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareTripContactCell contentView](v5, "contentView"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "heightAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](v5->_contactNameLabel, "font"));
    objc_msgSend(v51, "lineHeight");
    v53 = v52;
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](v5->_subtitleLabel, "font"));
    objc_msgSend(v54, "lineHeight");
    v56 = v53 + v55;
    if (v56 <= 34.0)
    {
      v60 = 46.0;
    }
    else
    {
      v65 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](v5->_contactNameLabel, "font"));
      objc_msgSend(v65, "lineHeight");
      v58 = v57;
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](v5->_subtitleLabel, "font"));
      objc_msgSend(v64, "lineHeight");
      v60 = v58 + v59 + 12.0;
    }
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintGreaterThanOrEqualToConstant:", v60));
    v122[17] = v61;
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v122, 18));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v62);

    if (v56 > 34.0)
    {

    }
  }
  return v5;
}

- (void)prepareForReuse
{
  MSPSharedTripContact *contactValue;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CarShareTripContactCell;
  -[CarShareTripContactCell prepareForReuse](&v4, "prepareForReuse");
  -[CarShareTripContactCell _setSharingState:animated:](self, "_setSharingState:animated:", 0, 0);
  -[CarShareTripContactCell _setContactIdentifier:](self, "_setContactIdentifier:", 0);
  -[UILabel setText:](self->_contactNameLabel, "setText:", 0);
  -[UILabel setText:](self->_subtitleLabel, "setText:", 0);
  self->_showsSubtitleWhenNotSharing = 0;
  contactValue = self->_contactValue;
  self->_contactValue = 0;

  -[CarShareTripContactCell setSharingHandle:](self, "setSharingHandle:", 0);
}

- (void)_updateSharingRingAnimated:(BOOL)a3
{
  _BOOL8 v3;
  unint64_t v5;
  CarSharingRingView *sharingRingView;
  uint64_t v7;

  v3 = a3;
  v5 = -[CarShareTripContactCell sharingState](self, "sharingState");
  if (v5 - 2 < 2)
  {
    sharingRingView = self->_sharingRingView;
    v7 = 1;
LABEL_6:
    -[CarSharingRingView setFilled:](sharingRingView, "setFilled:", v7);
    return;
  }
  if (v5 != 1)
  {
    if (v5)
      return;
    sharingRingView = self->_sharingRingView;
    v7 = 0;
    goto LABEL_6;
  }
  -[CarSharingRingView setFilled:animated:](self->_sharingRingView, "setFilled:animated:", 1, v3);
}

- (void)_updateAppearance
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  if ((-[CarShareTripContactCell isFocused](self, "isFocused") & 1) != 0
    || (-[CarShareTripContactCell isSelected](self, "isSelected") & 1) != 0
    || (-[CarShareTripContactCell isHighlighted](self, "isHighlighted") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
    v4 = 1;
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v4 = 0;
  }
  -[UILabel setTextColor:](self->_contactNameLabel, "setTextColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareTripContactCell _sharingLabelColor:](self, "_sharingLabelColor:", v4));
  -[UILabel setTextColor:](self->_subtitleLabel, "setTextColor:", v5);

  self->_monogrammerStyle = v4;
  -[CarShareTripContactCell _redrawContactImage](self, "_redrawContactImage");
  v9 = (id)objc_claimAutoreleasedReturnValue(+[UITraitCollection _currentTraitCollection](UITraitCollection, "_currentTraitCollection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareTripContactCell traitCollection](self, "traitCollection"));
  +[UITraitCollection _setCurrentTraitCollection:](UITraitCollection, "_setCurrentTraitCollection:", v6);

  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[CarShareTripContactCell _sharingRingColor:](self, "_sharingRingColor:", v4)));
  v8 = objc_msgSend(v7, "CGColor");

  +[UITraitCollection _setCurrentTraitCollection:](UITraitCollection, "_setCurrentTraitCollection:", v9);
  -[CarSharingRingView setColor:](self->_sharingRingView, "setColor:", v8);

}

- (void)_updateSubtitleLabel
{
  void *v3;
  void *v4;
  uint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareTripContactCell _subtitleString](self, "_subtitleString"));
  -[UILabel setText:](self->_subtitleLabel, "setText:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_subtitleLabel, "text"));
  -[UILabel setHidden:](self->_subtitleLabel, "setHidden:", v4 == 0);

  if ((id)-[CarShareTripContactCell capabilityType](self, "capabilityType") == (id)2)
    v5 = 5;
  else
    v5 = 4;
  -[UILabel setLineBreakMode:](self->_subtitleLabel, "setLineBreakMode:", v5);
}

- (id)_subtitleString
{
  unint64_t sharingState;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  unsigned int v7;
  void *v9;

  sharingState = self->_sharingState;
  if (sharingState >= 2)
  {
    if (sharingState == 2)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
      v7 = objc_msgSend(v6, "supportsTouchInteractionModel");

      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      if (v7)
        v5 = CFSTR("CarPlay_SharedTrip_AlreadySharing");
      else
        v5 = CFSTR("CarPlay_SharedTrip_AlreadySharing_NoTouchInput");
      goto LABEL_13;
    }
    if (sharingState == 3)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("CarPlay_SharedTrip_JustStartedSharing");
      goto LABEL_13;
    }
    return 0;
  }
  if (self->_capabilityType == 2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("CarPlay_ShareTrip_SMS");
  }
  else
  {
    if (!self->_showsSubtitleWhenNotSharing)
      return 0;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("[Shared Trip] Start Sharing");
  }
LABEL_13:
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), 0));

  return v9;
}

- (void)_setContactIdentifier:(id)a3
{
  id v5;
  NSString *contactIdentifier;
  id v7;
  void *v8;
  unsigned __int8 v9;
  unint64_t v10;

  v5 = a3;
  contactIdentifier = self->_contactIdentifier;
  v10 = (unint64_t)v5;
  v7 = contactIdentifier;
  v8 = (void *)v10;
  if (v10 | (unint64_t)v7)
  {
    v9 = objc_msgSend((id)v10, "isEqual:", v7);

    v8 = (void *)v10;
    if ((v9 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_contactIdentifier, a3);
      -[CarShareTripContactCell _redrawContactImage](self, "_redrawContactImage");
      v8 = (void *)v10;
    }
  }

}

- (void)_redrawContactImage
{
  void *v3;
  void *v4;
  NSString *v5;
  void *monogrammerStyle;
  void *v7;
  NSString *v8;
  void *v9;
  _QWORD v10[4];
  NSString *v11;
  id v12[2];
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contactForCNContactIdentifier:", self->_contactIdentifier));

  if (v4)
  {
    v5 = self->_contactIdentifier;
    monogrammerStyle = (void *)self->_monogrammerStyle;
    objc_initWeak(&location, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsUIImageCache sharedCache](MapsUIImageCache, "sharedCache"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10083488C;
    v10[3] = &unk_1011D8B48;
    objc_copyWeak(v12, &location);
    v8 = v5;
    v11 = v8;
    v12[1] = monogrammerStyle;
    objc_msgSend(v7, "getImageForContact:style:tintColor:size:completion:", v4, monogrammerStyle, 0, v10, 34.0);

    objc_destroyWeak(v12);
    objc_destroyWeak(&location);

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("SharedTrip")));
    -[CarShareTripContactCell setContactImage:](self, "setContactImage:", v9);

  }
}

- (id)_sharingLabelColor:(BOOL)a3
{
  char *v3;
  unint64_t capabilityType;

  if (a3)
  {
    v3 = (char *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
  }
  else
  {
    v3 = -[CarShareTripContactCell sharingState](self, "sharingState");
    if ((unint64_t)(v3 - 1) >= 3)
    {
      if (v3)
        return v3;
      capabilityType = self->_capabilityType;
      if (capabilityType == 2)
      {
        v3 = (char *)objc_claimAutoreleasedReturnValue(+[UIColor externalSystemGreenColor](UIColor, "externalSystemGreenColor"));
        return v3;
      }
      if (!self->_showsSubtitleWhenNotSharing && capabilityType <= 1)
      {
        v3 = (char *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
        return v3;
      }
    }
    v3 = (char *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor"));
  }
  return v3;
}

- (id)_sharingRingColor:(BOOL)a3
{
  void *v3;

  if (a3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor"));
  return v3;
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CarShareTripContactCell;
  -[CarShareTripContactCell setHighlighted:animated:](&v5, "setHighlighted:animated:", a3, a4);
  -[CarShareTripContactCell _updateAppearance](self, "_updateAppearance");
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CarShareTripContactCell;
  -[CarShareTripContactCell setSelected:animated:](&v5, "setSelected:animated:", a3, a4);
  -[CarShareTripContactCell _updateAppearance](self, "_updateAppearance");
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  CarShareTripContactCell *v7;
  CarShareTripContactCell *v8;
  CarShareTripContactCell *v9;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CarShareTripContactCell;
  -[CarShareTripContactCell didUpdateFocusInContext:withAnimationCoordinator:](&v10, "didUpdateFocusInContext:withAnimationCoordinator:", v6, a4);
  v7 = (CarShareTripContactCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextFocusedItem"));
  if (v7 == self)
  {

LABEL_5:
    -[CarShareTripContactCell _updateAppearance](self, "_updateAppearance");
    goto LABEL_6;
  }
  v8 = v7;
  v9 = (CarShareTripContactCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "previouslyFocusedItem"));

  if (v9 == self)
    goto LABEL_5;
LABEL_6:

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CarShareTripContactCell;
  -[CarShareTripContactCell traitCollectionDidChange:](&v4, "traitCollectionDidChange:", a3);
  -[CarShareTripContactCell _updateAppearance](self, "_updateAppearance");
}

- (UIImage)contactImage
{
  return -[UIImageView image](self->_contactImageView, "image");
}

- (void)setContactImage:(id)a3
{
  -[UIImageView setImage:](self->_contactImageView, "setImage:", a3);
}

- (NSString)contactName
{
  return -[UILabel text](self->_contactNameLabel, "text");
}

- (void)setContactName:(id)a3
{
  -[UILabel setText:](self->_contactNameLabel, "setText:", a3);
}

- (BOOL)isSharing
{
  return self->_sharingState != 0;
}

- (void)setSharingState:(unint64_t)a3
{
  -[CarShareTripContactCell setSharingState:animated:](self, "setSharingState:animated:", a3, 1);
}

- (void)setSharingState:(unint64_t)a3 animated:(BOOL)a4
{
  if (self->_sharingState != a3)
    -[CarShareTripContactCell _setSharingState:animated:](self, "_setSharingState:animated:");
}

- (void)_setSharingState:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  self->_sharingState = a3;
  -[CarShareTripContactCell _updateSubtitleLabel](self, "_updateSubtitleLabel");
  -[CarShareTripContactCell _updateAppearance](self, "_updateAppearance");
  -[CarShareTripContactCell _updateSharingRingAnimated:](self, "_updateSharingRingAnimated:", v4);
}

- (void)setCapabilityType:(unint64_t)a3
{
  if (self->_capabilityType != a3)
  {
    self->_capabilityType = a3;
    -[SharedTripCapabilityBadgeView setCapabilityType:](self->_capabilityBadgeView, "setCapabilityType:");
    -[CarShareTripContactCell _updateSubtitleLabel](self, "_updateSubtitleLabel");
    -[CarShareTripContactCell _updateAppearance](self, "_updateAppearance");
  }
}

- (void)setShowsSubtitleWhenNotSharing:(BOOL)a3
{
  if (self->_showsSubtitleWhenNotSharing != a3)
  {
    self->_showsSubtitleWhenNotSharing = a3;
    -[CarShareTripContactCell _updateSubtitleLabel](self, "_updateSubtitleLabel");
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v5;

  if (a4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[CarShareTripContactCell delegate](self, "delegate", a3));
    objc_msgSend(v5, "carShareTripContactCellDidFinishRingAnimation:", self);

  }
}

- (CarShareTripContactCellDelegate)delegate
{
  return (CarShareTripContactCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)sharingState
{
  return self->_sharingState;
}

- (unint64_t)capabilityType
{
  return self->_capabilityType;
}

- (BOOL)showsSubtitleWhenNotSharing
{
  return self->_showsSubtitleWhenNotSharing;
}

- (MSPSharedTripContact)contactValue
{
  return self->_contactValue;
}

- (void)setContactValue:(id)a3
{
  objc_storeStrong((id *)&self->_contactValue, a3);
}

- (NSString)sharingHandle
{
  return self->_sharingHandle;
}

- (void)setSharingHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingHandle, 0);
  objc_storeStrong((id *)&self->_contactValue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_capabilityBadgeView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_contactNameLabel, 0);
  objc_storeStrong((id *)&self->_sharingRingView, 0);
  objc_storeStrong((id *)&self->_contactImageView, 0);
}

- (id)_contactNameStringFromContact:(id)a3
{
  return objc_msgSend(a3, "displayName");
}

- (void)configureWithMSPSharedTripContact:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_storeStrong((id *)&self->_contactValue, a3);
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareTripContactCell _contactNameStringFromContact:](self, "_contactNameStringFromContact:", v5));
  -[CarShareTripContactCell setContactName:](self, "setContactName:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));
  -[CarShareTripContactCell setSharingHandle:](self, "setSharingHandle:", v7);

  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contact"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  -[CarShareTripContactCell _setContactIdentifier:](self, "_setContactIdentifier:", v8);

}

- (void)configureWithSharedTrip:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  self->_sharingState = 0;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "carPlayListCellTitle"));
  -[UILabel setText:](self->_contactNameLabel, "setText:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "carPlayListCellSubtitle"));
  -[UILabel setText:](self->_subtitleLabel, "setText:", v6);

  -[UILabel setHidden:](self->_subtitleLabel, "setHidden:", 0);
  -[CarShareTripContactCell setSharingHandle:](self, "setSharingHandle:", 0);
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "senderInfo"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localContactIdentifier"));
  -[CarShareTripContactCell _setContactIdentifier:](self, "_setContactIdentifier:", v7);

}

@end
