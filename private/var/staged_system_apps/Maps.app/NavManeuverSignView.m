@implementation NavManeuverSignView

- (void)clearContent
{
  void *v3;
  objc_super v4;

  self->_maneuverSignType = 0;
  -[NavManeuverSignView setManeuverGuidanceInfo:](self, "setManeuverGuidanceInfo:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverView](self, "maneuverView"));
  objc_msgSend(v3, "setManeuverArtwork:", 0);

  v4.receiver = self;
  v4.super_class = (Class)NavManeuverSignView;
  -[NavSignView clearContent](&v4, "clearContent");
}

- (void)updateTheme
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NavManeuverSignView;
  -[NavSignView updateTheme](&v9, "updateTheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView theme](self, "theme"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "navSignGuidanceManeuverColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverView](self, "maneuverView"));
  objc_msgSend(v5, "setArrowColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView theme](self, "theme"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "navSignGuidanceManeuverAccentColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverView](self, "maneuverView"));
  objc_msgSend(v8, "setAccentColor:", v7);

}

- (id)_defaultSignLayoutDelegate
{
  return +[NavSignLayoutDelegateManager defaultLayoutDelegateForWalking](NavSignLayoutDelegateManager, "defaultLayoutDelegateForWalking");
}

- (void)refreshSign
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
  objc_super v12;
  _BYTE v13[496];
  _OWORD v14[31];
  _BYTE __dst[496];
  _OWORD __src[31];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "maneuverViewArrowMetricsForSign:", self);
  else
    memset(__src, 0, sizeof(__src));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverView](self, "maneuverView"));
  memcpy(__dst, __src, sizeof(__dst));
  objc_msgSend(v5, "setArrowMetrics:", __dst);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "maneuverViewJunctionArrowMetricsForSign:", self);
  else
    memset(v14, 0, sizeof(v14));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverView](self, "maneuverView"));
  memcpy(v13, v14, sizeof(v13));
  objc_msgSend(v8, "setJunctionArrowMetrics:", v13);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverGuidanceInfo](self, "maneuverGuidanceInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "maneuverArtwork"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverView](self, "maneuverView"));
  objc_msgSend(v11, "setManeuverArtwork:", v10);

  -[NavManeuverSignView _setNeedsUpdateShield](self, "_setNeedsUpdateShield");
  v12.receiver = self;
  v12.super_class = (Class)NavManeuverSignView;
  -[NavSignView refreshSign](&v12, "refreshSign");
}

- (void)_setupSubviews
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  GuidanceManeuverView *v6;
  double y;
  double width;
  double height;
  GuidanceManeuverView *v10;
  GuidanceManeuverView *maneuverView;
  double v12;
  double v13;
  UIImageView *v14;
  UIImageView *shieldView;
  double v16;
  void *v17;
  float v18;
  float v19;
  double v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)NavManeuverSignView;
  -[NavSignView _setupSubviews](&v21, "_setupSubviews");
  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[NavManeuverSignView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v5);

  self->_shieldSize = 4;
  v6 = [GuidanceManeuverView alloc];
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v10 = -[GuidanceManeuverView initWithFrame:textureProvider:](v6, "initWithFrame:textureProvider:", 0, CGRectZero.origin.x, y, width, height);
  maneuverView = self->_maneuverView;
  self->_maneuverView = v10;

  -[GuidanceManeuverView setTranslatesAutoresizingMaskIntoConstraints:](self->_maneuverView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[GuidanceManeuverView setOverrideUserInterfaceStyle:](self->_maneuverView, "setOverrideUserInterfaceStyle:", 2);
  LODWORD(v12) = 1148846080;
  -[GuidanceManeuverView setContentCompressionResistancePriority:forAxis:](self->_maneuverView, "setContentCompressionResistancePriority:forAxis:", 0, v12);
  LODWORD(v13) = 1148829696;
  -[GuidanceManeuverView setContentHuggingPriority:forAxis:](self->_maneuverView, "setContentHuggingPriority:forAxis:", 0, v13);
  -[GuidanceManeuverView setFraming:](self->_maneuverView, "setFraming:", 1);
  -[NavManeuverSignView addSubview:](self, "addSubview:", self->_maneuverView);
  v14 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  shieldView = self->_shieldView;
  self->_shieldView = v14;

  -[UIImageView setAccessibilityIdentifier:](self->_shieldView, "setAccessibilityIdentifier:", CFSTR("ShieldView"));
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_shieldView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setContentMode:](self->_shieldView, "setContentMode:", 1);
  -[UIImageView setOverrideUserInterfaceStyle:](self->_shieldView, "setOverrideUserInterfaceStyle:", 2);
  LODWORD(v16) = 1148829696;
  -[UIImageView setContentHuggingPriority:forAxis:](self->_shieldView, "setContentHuggingPriority:forAxis:", 0, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabel](self, "majorLabel"));
  objc_msgSend(v17, "contentCompressionResistancePriorityForAxis:", 0);
  v19 = v18;

  *(float *)&v20 = v19 + -1.0;
  -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_shieldView, "setContentCompressionResistancePriority:forAxis:", 0, v20);
  -[UIImageView setAccessibilityIdentifier:](self->_shieldView, "setAccessibilityIdentifier:", CFSTR("ShieldView"));
  -[NavManeuverSignView addSubview:](self, "addSubview:", self->_shieldView);
}

- (void)_setupConstraints
{
  id v3;
  void *v4;
  NSDictionary *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *maneuverViewLeadingMarginConstraint;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSLayoutConstraint *v21;
  NSLayoutConstraint *trailingToShieldViewTrailingConstraint;
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
  NSArray *v34;
  NSArray *maneuverViewLeadingLayoutGuideConstraints;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSArray *v45;
  NSArray *maneuverViewTrailingLayoutGuideConstraints;
  void *v47;
  void *v48;
  void *v49;
  NSLayoutConstraint *v50;
  NSLayoutConstraint *maneuverViewMinLeadingMarginConstraint;
  void *v52;
  void *v53;
  NSLayoutConstraint *v54;
  NSLayoutConstraint *maneuverViewMinWidthConstraint;
  void *v56;
  void *v57;
  NSLayoutConstraint *v58;
  NSLayoutConstraint *maneuverViewHeightConstraint;
  void *v60;
  void *v61;
  void *v62;
  NSLayoutConstraint *v63;
  NSLayoutConstraint *maneuverViewCenterYConstraint;
  void *v65;
  void *v66;
  void *v67;
  NSLayoutConstraint *v68;
  NSLayoutConstraint *maneuverViewTopToTopConstraint;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  NSLayoutConstraint *v74;
  NSLayoutConstraint *maneuverViewTrailingMarginConstraint;
  void *v76;
  void *v77;
  NSLayoutConstraint *v78;
  NSLayoutConstraint *maneuverViewEqualSideMarginsConstraint;
  double v80;
  void *v81;
  void *v82;
  void *v83;
  NSLayoutConstraint *v84;
  NSLayoutConstraint *shieldViewTopToTopConstraint;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  NSLayoutConstraint *v90;
  NSLayoutConstraint *shieldViewTrailingMajorLabelConstraint;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  NSLayoutConstraint *v96;
  NSLayoutConstraint *sheildViewBottomToMinorLabelTopConstraint;
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
  id v114;
  objc_super v115;
  _QWORD v116[4];
  _QWORD v117[4];

  v115.receiver = self;
  v115.super_class = (Class)NavManeuverSignView;
  -[NavSignView _setupConstraints](&v115, "_setupConstraints");
  v3 = objc_alloc_init((Class)UILayoutGuide);
  -[NavManeuverSignView addLayoutGuide:](self, "addLayoutGuide:");
  v114 = objc_alloc_init((Class)UILayoutGuide);
  -[NavManeuverSignView addLayoutGuide:](self, "addLayoutGuide:", v114);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = _NSDictionaryOfVariableBindings(CFSTR("_maneuverView, _shieldView"), self->_maneuverView, self->_shieldView, 0);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[_maneuverView]-(>=0)-|"), 0, 0, v6));
  objc_msgSend(v4, "addObjectsFromArray:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(>=0)-[_maneuverView]-(>=0)-|"), 0, 0, v6));
  objc_msgSend(v4, "addObjectsFromArray:", v8);

  v113 = (void *)v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(>=0)-[_shieldView]-(>=0)-|"), 0, 0, v6));
  objc_msgSend(v4, "addObjectsFromArray:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(>=0)-[_shieldView]-(>=0)-|"), 0, 0, v6));
  objc_msgSend(v4, "addObjectsFromArray:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverView](self, "maneuverView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leadingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView leadingAnchor](self, "leadingAnchor"));
  v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
  maneuverViewLeadingMarginConstraint = self->_maneuverViewLeadingMarginConstraint;
  self->_maneuverViewLeadingMarginConstraint = v14;

  LODWORD(v16) = 1148829696;
  -[NSLayoutConstraint setPriority:](self->_maneuverViewLeadingMarginConstraint, "setPriority:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverViewLeadingMarginConstraint](self, "maneuverViewLeadingMarginConstraint"));
  objc_msgSend(v4, "addObject:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView trailingAnchor](self, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView shieldView](self, "shieldView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trailingAnchor"));
  v21 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v20));
  trailingToShieldViewTrailingConstraint = self->_trailingToShieldViewTrailingConstraint;
  self->_trailingToShieldViewTrailingConstraint = v21;

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView trailingToShieldViewTrailingConstraint](self, "trailingToShieldViewTrailingConstraint"));
  v112 = v4;
  objc_msgSend(v4, "addObject:", v23);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v4);
  v24 = v3;
  v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v107 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView leadingAnchor](self, "leadingAnchor"));
  v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "constraintEqualToAnchor:", v107));
  v117[0] = v105;
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v103 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverView](self, "maneuverView"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "constraintEqualToAnchor:", v99));
  v117[1] = v25;
  v111 = v3;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverView](self, "maneuverView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "topAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v28));
  v117[2] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "heightAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverView](self, "maneuverView"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "heightAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v32));
  v117[3] = v33;
  v34 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v117, 4));
  maneuverViewLeadingLayoutGuideConstraints = self->_maneuverViewLeadingLayoutGuideConstraints;
  self->_maneuverViewLeadingLayoutGuideConstraints = v34;

  v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "leadingAnchor"));
  v110 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverView](self, "maneuverView"));
  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "trailingAnchor"));
  v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "constraintEqualToAnchor:", v106));
  v116[0] = v104;
  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "trailingAnchor"));
  v102 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabel](self, "majorLabel"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "leadingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "constraintEqualToAnchor:", v98));
  v116[1] = v36;
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "topAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverView](self, "maneuverView"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "topAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v39));
  v116[2] = v40;
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "heightAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverView](self, "maneuverView"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "heightAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v43));
  v116[3] = v44;
  v45 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v116, 4));
  maneuverViewTrailingLayoutGuideConstraints = self->_maneuverViewTrailingLayoutGuideConstraints;
  self->_maneuverViewTrailingLayoutGuideConstraints = v45;

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverView](self, "maneuverView"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "leadingAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView leadingAnchor](self, "leadingAnchor"));
  v50 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintGreaterThanOrEqualToAnchor:", v49));
  maneuverViewMinLeadingMarginConstraint = self->_maneuverViewMinLeadingMarginConstraint;
  self->_maneuverViewMinLeadingMarginConstraint = v50;

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverView](self, "maneuverView"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "widthAnchor"));
  v54 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintGreaterThanOrEqualToConstant:", 0.0));
  maneuverViewMinWidthConstraint = self->_maneuverViewMinWidthConstraint;
  self->_maneuverViewMinWidthConstraint = v54;

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverView](self, "maneuverView"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "heightAnchor"));
  v58 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToConstant:", 0.0));
  maneuverViewHeightConstraint = self->_maneuverViewHeightConstraint;
  self->_maneuverViewHeightConstraint = v58;

  v60 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverView](self, "maneuverView"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "centerYAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView centerYAnchor](self, "centerYAnchor"));
  v63 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:", v62));
  maneuverViewCenterYConstraint = self->_maneuverViewCenterYConstraint;
  self->_maneuverViewCenterYConstraint = v63;

  v65 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverView](self, "maneuverView"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "topAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView topAnchor](self, "topAnchor"));
  v68 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:", v67));
  maneuverViewTopToTopConstraint = self->_maneuverViewTopToTopConstraint;
  self->_maneuverViewTopToTopConstraint = v68;

  v70 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabel](self, "majorLabel"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "leadingAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverView](self, "maneuverView"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "trailingAnchor"));
  v74 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintEqualToAnchor:", v73));
  maneuverViewTrailingMarginConstraint = self->_maneuverViewTrailingMarginConstraint;
  self->_maneuverViewTrailingMarginConstraint = v74;

  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "widthAnchor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "widthAnchor"));
  v78 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "constraintEqualToAnchor:", v77));
  maneuverViewEqualSideMarginsConstraint = self->_maneuverViewEqualSideMarginsConstraint;
  self->_maneuverViewEqualSideMarginsConstraint = v78;

  LODWORD(v80) = 1148813312;
  -[NSLayoutConstraint setPriority:](self->_maneuverViewEqualSideMarginsConstraint, "setPriority:", v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView shieldView](self, "shieldView"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "topAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView topAnchor](self, "topAnchor"));
  v84 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "constraintEqualToAnchor:", v83));
  shieldViewTopToTopConstraint = self->_shieldViewTopToTopConstraint;
  self->_shieldViewTopToTopConstraint = v84;

  v86 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView shieldView](self, "shieldView"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "leadingAnchor"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabel](self, "majorLabel"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "trailingAnchor"));
  v90 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "constraintEqualToAnchor:", v89));
  shieldViewTrailingMajorLabelConstraint = self->_shieldViewTrailingMajorLabelConstraint;
  self->_shieldViewTrailingMajorLabelConstraint = v90;

  v92 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self, "minorLabel"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "topAnchor"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView shieldView](self, "shieldView"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "bottomAnchor"));
  v96 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintGreaterThanOrEqualToAnchor:", v95));
  sheildViewBottomToMinorLabelTopConstraint = self->_sheildViewBottomToMinorLabelTopConstraint;
  self->_sheildViewBottomToMinorLabelTopConstraint = v96;

}

- (void)_updateConstraints
{
  void *v2;
  void *v4;
  uint64_t v5;
  unsigned int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double Width;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  unsigned int v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  LayoutConstraintActivationHelper *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  _BYTE v78[496];
  _OWORD v79[31];
  _BYTE __dst[496];
  objc_super __src[31];
  objc_super v82;
  _QWORD v83[3];
  _QWORD v84[3];
  CGRect v85;

  v82.receiver = self;
  v82.super_class = (Class)NavManeuverSignView;
  -[NavSignView _updateConstraints](&v82, "_updateConstraints");
  if (-[NavManeuverSignView hasManeuverArtwork](self, "hasManeuverArtwork"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
    v5 = objc_msgSend(v4, "forceHideManeuverViewForSign:", self) ^ 1;

  }
  else
  {
    v5 = 0;
  }
  if (-[NavManeuverSignView hasShieldImage](self, "hasShieldImage")
    && !-[NavManeuverSignView suppressShieldView](self, "suppressShieldView"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
    v6 = objc_msgSend(v7, "forceHideShieldViewForSign:", self) ^ 1;

  }
  else
  {
    v6 = 0;
  }
  v8 = v5 ^ 1;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverView](self, "maneuverView"));
  objc_msgSend(v9, "setHidden:", v8);

  if (v6)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[NavManeuverSignView shieldView](self, "shieldView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v8, "layer"));
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "animationKeys"));
    v10 = v2 != 0;
  }
  else
  {
    v10 = 1;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView shieldView](self, "shieldView"));
  objc_msgSend(v11, "setHidden:", v10);

  if (v6)
  {

  }
  if (-[NavManeuverSignView animatingToHideManeuverView](self, "animatingToHideManeuverView"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverView](self, "maneuverView"));
    objc_msgSend(v12, "setHidden:", 0);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
  v14 = v13;
  if (v13)
    objc_msgSend(v13, "maneuverViewArrowMetricsForSign:", self);
  else
    memset(__src, 0, sizeof(__src));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverView](self, "maneuverView"));
  memcpy(__dst, __src, sizeof(__dst));
  objc_msgSend(v15, "setArrowMetrics:", __dst);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
  v17 = v16;
  if (v16)
    objc_msgSend(v16, "maneuverViewJunctionArrowMetricsForSign:", self);
  else
    memset(v79, 0, sizeof(v79));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverView](self, "maneuverView"));
  memcpy(v78, v79, sizeof(v78));
  objc_msgSend(v18, "setJunctionArrowMetrics:", v78);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
  objc_msgSend(v19, "maneuverViewSizeForSign:", self);
  v21 = v20;
  v23 = v22;

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverViewMinWidthConstraint](self, "maneuverViewMinWidthConstraint"));
  objc_msgSend(v24, "setConstant:", v21);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverViewHeightConstraint](self, "maneuverViewHeightConstraint"));
  objc_msgSend(v25, "setConstant:", v23);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
  objc_msgSend(v26, "contentSideMarginForSign:", self);
  v28 = v27;

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverView](self, "maneuverView"));
  objc_msgSend(v29, "frame");
  Width = CGRectGetWidth(v85);

  if ((_DWORD)v5)
    v31 = v28;
  else
    v31 = -Width;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverViewLeadingMarginConstraint](self, "maneuverViewLeadingMarginConstraint"));
  objc_msgSend(v32, "setConstant:", v31);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverViewMinLeadingMarginConstraint](self, "maneuverViewMinLeadingMarginConstraint"));
  objc_msgSend(v33, "setConstant:", v28);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView trailingToShieldViewTrailingConstraint](self, "trailingToShieldViewTrailingConstraint"));
  objc_msgSend(v34, "setConstant:", v28);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
  objc_msgSend(v35, "maneuverViewTopMarginForSign:", self);
  v37 = round(v36);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverViewTopToTopConstraint](self, "maneuverViewTopToTopConstraint"));
  objc_msgSend(v38, "setConstant:", v37);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
  v40 = 1;
  objc_msgSend(v39, "navSignView:textLeadingMarginForMajorText:", self, 1);
  v42 = v41;

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverViewTrailingMarginConstraint](self, "maneuverViewTrailingMarginConstraint"));
  objc_msgSend(v43, "setConstant:", v42);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
  objc_msgSend(v44, "navSignView:textTrailingMarginForMajorText:", self, 1);
  v46 = v45;

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView shieldViewTrailingMajorLabelConstraint](self, "shieldViewTrailingMajorLabelConstraint"));
  objc_msgSend(v47, "setConstant:", v46);

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self, "minorLabel"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "font"));
  objc_msgSend(v49, "_scaledValueForValue:useLanguageAwareScaling:", 1, 2.0);
  v51 = v50;

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView sheildViewBottomToMinorLabelTopConstraint](self, "sheildViewBottomToMinorLabelTopConstraint"));
  objc_msgSend(v52, "setConstant:", v51);

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
  objc_msgSend(v53, "shieldViewTopMarginForSign:", self);
  v55 = round(v54);

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView shieldViewTopToTopConstraint](self, "shieldViewTopToTopConstraint"));
  objc_msgSend(v56, "setConstant:", v55);

  v57 = objc_alloc_init(LayoutConstraintActivationHelper);
  if (!-[NavSignView hasMajorText](self, "hasMajorText"))
    v40 = -[NavSignView hasMinorText](self, "hasMinorText");
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverViewLeadingLayoutGuideConstraints](self, "maneuverViewLeadingLayoutGuideConstraints"));
  -[LayoutConstraintActivationHelper scheduleConstraints:activate:](v57, "scheduleConstraints:activate:", v58, v5);

  v59 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverViewTrailingLayoutGuideConstraints](self, "maneuverViewTrailingLayoutGuideConstraints"));
  -[LayoutConstraintActivationHelper scheduleConstraints:activate:](v57, "scheduleConstraints:activate:", v59, v5 & v40);

  v60 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverViewMinLeadingMarginConstraint](self, "maneuverViewMinLeadingMarginConstraint"));
  v84[0] = v60;
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverViewMinWidthConstraint](self, "maneuverViewMinWidthConstraint"));
  v84[1] = v61;
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverViewHeightConstraint](self, "maneuverViewHeightConstraint"));
  v84[2] = v62;
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v84, 3));
  -[LayoutConstraintActivationHelper scheduleConstraints:activate:](v57, "scheduleConstraints:activate:", v63, v5);

  v64 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
  v65 = objc_msgSend(v64, "maneuverViewPositionForSign:", self);

  v66 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverViewCenterYConstraint](self, "maneuverViewCenterYConstraint"));
  if (v65 == (id)2)
    v67 = 0;
  else
    v67 = v5;
  if (v65 == (id)2)
    v68 = v5;
  else
    v68 = 0;
  -[LayoutConstraintActivationHelper scheduleConstraint:activate:](v57, "scheduleConstraint:activate:", v66, v67);

  v69 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverViewTopToTopConstraint](self, "maneuverViewTopToTopConstraint"));
  -[LayoutConstraintActivationHelper scheduleConstraint:activate:](v57, "scheduleConstraint:activate:", v69, v68);

  v70 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverViewEqualSideMarginsConstraint](self, "maneuverViewEqualSideMarginsConstraint"));
  if (v65 == (id)1)
    v71 = v5 & v40;
  else
    v71 = 0;
  -[LayoutConstraintActivationHelper scheduleConstraint:activate:](v57, "scheduleConstraint:activate:", v70, v71);

  v72 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverViewTrailingMarginConstraint](self, "maneuverViewTrailingMarginConstraint"));
  if ((_DWORD)v5)
  {
    if (v65 == (id)1)
      v73 = 0;
    else
      v73 = v40;
  }
  else
  {
    v73 = 0;
  }
  -[LayoutConstraintActivationHelper scheduleConstraint:activate:](v57, "scheduleConstraint:activate:", v72, v73);

  v74 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView shieldViewTopToTopConstraint](self, "shieldViewTopToTopConstraint"));
  v83[0] = v74;
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView shieldViewTrailingMajorLabelConstraint](self, "shieldViewTrailingMajorLabelConstraint"));
  v83[1] = v75;
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView sheildViewBottomToMinorLabelTopConstraint](self, "sheildViewBottomToMinorLabelTopConstraint"));
  v83[2] = v76;
  v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v83, 3));
  -[LayoutConstraintActivationHelper scheduleConstraints:activate:](v57, "scheduleConstraints:activate:", v77, v6);

  -[LayoutConstraintActivationHelper commitPendingConstraints](v57, "commitPendingConstraints");
}

- (void)_updateLabelText
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  if (-[NavManeuverSignView flipMajorAndMinorTextInLabels](self, "flipMajorAndMinorTextInLabels")
    && !-[NavManeuverSignView maneuverSignType](self, "maneuverSignType"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverGuidanceInfo](self, "maneuverGuidanceInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "minorTextAlternatives"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabel](self, "majorLabel"));
    objc_msgSend(v12, "setTextAlternatives:", v11);

    v18 = (id)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverGuidanceInfo](self, "maneuverGuidanceInfo"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "majorTextAlternatives"));
  }
  else
  {
    if ((id)-[NavManeuverSignView maneuverSignType](self, "maneuverSignType") == (id)1)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverGuidanceInfo](self, "maneuverGuidanceInfo"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "majorTextAlternatives"));
      v5 = objc_msgSend(v4, "count");

      if (!v5)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverGuidanceInfo](self, "maneuverGuidanceInfo"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "minorTextAlternatives"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabel](self, "majorLabel"));
        objc_msgSend(v17, "setTextAlternatives:", v16);

        v18 = (id)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self, "minorLabel"));
        objc_msgSend(v18, "setTextAlternatives:", 0);
        goto LABEL_8;
      }
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverGuidanceInfo](self, "maneuverGuidanceInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "majorTextAlternatives"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabel](self, "majorLabel"));
    objc_msgSend(v8, "setTextAlternatives:", v7);

    v18 = (id)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverGuidanceInfo](self, "maneuverGuidanceInfo"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "minorTextAlternatives"));
  }
  v13 = (void *)v9;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self, "minorLabel"));
  objc_msgSend(v14, "setTextAlternatives:", v13);

LABEL_8:
}

- (void)setManeuverGuidanceInfo:(id)a3
{
  -[NavManeuverSignView setManeuverGuidanceInfo:hasArrived:](self, "setManeuverGuidanceInfo:hasArrived:", a3, 0);
}

- (void)setManeuverGuidanceInfo:(id)a3 hasArrived:(BOOL)a4
{
  _BOOL4 v4;
  NavSignManeuverGuidanceInfo *v7;
  void *v8;
  unsigned __int8 v9;
  int64_t v10;
  void *v11;
  unsigned __int8 v12;
  NavSignManeuverGuidanceInfo *v13;

  v4 = a4;
  v7 = (NavSignManeuverGuidanceInfo *)a3;
  if (self->_maneuverGuidanceInfo != v7)
  {
    v13 = v7;
    objc_storeStrong((id *)&self->_maneuverGuidanceInfo, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverGuidanceInfo maneuverArtwork](v13, "maneuverArtwork"));
    v9 = objc_msgSend(v8, "isStartRouteManeuver");

    if ((v9 & 1) != 0)
    {
      v10 = 1;
    }
    else if (v4
           && (v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverGuidanceInfo maneuverArtwork](v13, "maneuverArtwork")),
               v12 = objc_msgSend(v11, "isArriveManeuver"),
               v11,
               (v12 & 1) != 0))
    {
      v10 = 2;
    }
    else
    {
      v10 = 0;
    }
    self->_maneuverSignType = v10;
    -[NavManeuverSignView refreshSign](self, "refreshSign");
    v7 = v13;
  }

}

- (void)configureForProceedToRouteWithSignID:(id)a3 displayString:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NavSignManeuverGuidanceInfo *v11;
  void *v12;
  void *v13;
  NavSignManeuverGuidanceInfo *v14;
  void *v15;

  v6 = a4;
  v7 = a3;
  -[NavManeuverSignView clearContent](self, "clearContent");
  if (objc_msgSend(v6, "length"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mkServerFormattedString"));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Proceed to the route [Driving/Walking Navigation]"), CFSTR("localized string not found"), 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mkServerFormattedString"));

  }
  v11 = [NavSignManeuverGuidanceInfo alloc];
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GuidanceManeuverArtwork artworkWithManeuver:](GuidanceManeuverArtwork, "artworkWithManeuver:", 17));
  v15 = v8;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  v14 = -[NavSignManeuverGuidanceInfo initWithSignID:maneuverArtwork:majorTextAlternatives:minorTextAlternatives:shieldInfo:](v11, "initWithSignID:maneuverArtwork:majorTextAlternatives:minorTextAlternatives:shieldInfo:", v7, v12, v13, 0, 0);

  -[NavManeuverSignView setManeuverGuidanceInfo:](self, "setManeuverGuidanceInfo:", v14);
}

- (void)configureForArrivalWithSignID:(id)a3 titles:(id)a4 details:(id)a5 maneuverType:(int)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NavSignManeuverGuidanceInfo *v17;
  void *v18;
  NavSignManeuverGuidanceInfo *v19;
  void *v20;

  v6 = *(_QWORD *)&a6;
  v10 = a4;
  v11 = a5;
  v12 = a3;
  -[NavManeuverSignView clearContent](self, "clearContent");
  if (!objc_msgSend(v10, "count"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Arrived [Driving/Walking Navigation]"), CFSTR("localized string not found"), 0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mkServerFormattedString"));
    v20 = v15;
    v16 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));

    v10 = (id)v16;
  }
  v17 = [NavSignManeuverGuidanceInfo alloc];
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[GuidanceManeuverArtwork artworkWithManeuver:](GuidanceManeuverArtwork, "artworkWithManeuver:", v6));
  v19 = -[NavSignManeuverGuidanceInfo initWithSignID:maneuverArtwork:majorTextAlternatives:minorTextAlternatives:shieldInfo:](v17, "initWithSignID:maneuverArtwork:majorTextAlternatives:minorTextAlternatives:shieldInfo:", v12, v18, v10, v11, 0);

  -[NavManeuverSignView setManeuverGuidanceInfo:hasArrived:](self, "setManeuverGuidanceInfo:hasArrived:", v19, 1);
}

- (BOOL)hasManeuverArtwork
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverGuidanceInfo](self, "maneuverGuidanceInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "maneuverArtwork"));
  v4 = v3 != 0;

  return v4;
}

- (BOOL)hasShieldInfo
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverGuidanceInfo](self, "maneuverGuidanceInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "shieldInfo"));
  v4 = v3 != 0;

  return v4;
}

- (BOOL)hasShieldImage
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView shieldView](self, "shieldView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "image"));
  v4 = v3 != 0;

  return v4;
}

- (void)setShieldSize:(int64_t)a3
{
  if (self->_shieldSize != a3)
  {
    self->_shieldSize = a3;
    -[NavManeuverSignView _setNeedsUpdateShield](self, "_setNeedsUpdateShield");
  }
}

- (void)setSuppressShieldView:(BOOL)a3
{
  if (self->_suppressShieldView != a3)
  {
    self->_suppressShieldView = a3;
    if (-[NavManeuverSignView hasShieldInfo](self, "hasShieldInfo"))
    {
      if (-[NavManeuverSignView hasShieldImage](self, "hasShieldImage"))
        -[NavManeuverSignView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (double)shieldCompressionRatio
{
  void *v3;
  double Width;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double result;
  CGRect v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView shieldView](self, "shieldView"));
  objc_msgSend(v3, "bounds");
  Width = CGRectGetWidth(v10);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView shieldView](self, "shieldView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "image"));
  objc_msgSend(v6, "size");
  v8 = v7;

  result = Width / v8;
  if (v8 <= 0.0)
    return 0.0;
  return result;
}

- (void)setFlipMajorAndMinorTextInLabels:(BOOL)a3
{
  if (self->_flipMajorAndMinorTextInLabels != a3)
  {
    self->_flipMajorAndMinorTextInLabels = a3;
    -[NavManeuverSignView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_setNeedsUpdateShield
{
  _QWORD block[5];

  if (!self->_needsUpdateShield)
  {
    self->_needsUpdateShield = 1;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1005014F4;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_updateShieldView
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (self->_needsUpdateShield)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v3, "scale");
    v5 = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverGuidanceInfo](self, "maneuverGuidanceInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shieldInfo"));
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "shieldImageWithSize:scale:idiom:", -[NavManeuverSignView shieldSize](self, "shieldSize"), 0, v5));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", objc_msgSend(v11, "image"), 0, v5));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView shieldView](self, "shieldView"));
    objc_msgSend(v9, "setImage:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView shieldView](self, "shieldView"));
    objc_msgSend(v10, "sizeToFit");

    -[NavManeuverSignView setNeedsLayout](self, "setNeedsLayout");
    self->_needsUpdateShield = 0;

  }
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[NavManeuverSignView _updateShieldView](self, "_updateShieldView");
  -[NavManeuverSignView setNeedsLayout](self, "setNeedsLayout");
  -[NavManeuverSignView layoutIfNeeded](self, "layoutIfNeeded");
  v14.receiver = self;
  v14.super_class = (Class)NavManeuverSignView;
  *(float *)&v10 = a4;
  *(float *)&v11 = a5;
  -[NavManeuverSignView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v14, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v10, v11);
  result.height = v13;
  result.width = v12;
  return result;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NavManeuverSignView;
  v3 = -[NavManeuverSignView debugDescription](&v8, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverGuidanceInfo](self, "maneuverGuidanceInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\nManeuver: [%@]"), v4, v5));

  return v6;
}

- (void)navSignLabel:(id)a3 didSelectAlternate:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NavManeuverSignView *v13;
  unint64_t v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabel](self, "majorLabel"));

  if (v6 == v16)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView analyticsDelegate](self, "analyticsDelegate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverGuidanceInfo](self, "maneuverGuidanceInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "signID"));
    v12 = v9;
    v13 = self;
    v14 = a4;
    v15 = 1;
    goto LABEL_5;
  }
  v7 = (id)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self, "minorLabel"));

  v8 = v16;
  if (v7 == v16)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView analyticsDelegate](self, "analyticsDelegate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverGuidanceInfo](self, "maneuverGuidanceInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "signID"));
    v12 = v9;
    v13 = self;
    v14 = a4;
    v15 = 0;
LABEL_5:
    objc_msgSend(v12, "navSignView:didSelectAlternate:forPrimaryString:inSign:", v13, v14, v15, v11);

    v8 = v16;
  }

}

- (int64_t)maneuverSignType
{
  return self->_maneuverSignType;
}

- (NavSignManeuverGuidanceInfo)maneuverGuidanceInfo
{
  return self->_maneuverGuidanceInfo;
}

- (GuidanceManeuverView)maneuverView
{
  return self->_maneuverView;
}

- (UIImageView)shieldView
{
  return self->_shieldView;
}

- (int64_t)shieldSize
{
  return self->_shieldSize;
}

- (BOOL)suppressShieldView
{
  return self->_suppressShieldView;
}

- (BOOL)animatingToHideManeuverView
{
  return self->_animatingToHideManeuverView;
}

- (void)setAnimatingToHideManeuverView:(BOOL)a3
{
  self->_animatingToHideManeuverView = a3;
}

- (BOOL)flipMajorAndMinorTextInLabels
{
  return self->_flipMajorAndMinorTextInLabels;
}

- (NSLayoutConstraint)maneuverViewMinWidthConstraint
{
  return self->_maneuverViewMinWidthConstraint;
}

- (NSLayoutConstraint)maneuverViewHeightConstraint
{
  return self->_maneuverViewHeightConstraint;
}

- (NSLayoutConstraint)maneuverViewMinLeadingMarginConstraint
{
  return self->_maneuverViewMinLeadingMarginConstraint;
}

- (NSLayoutConstraint)maneuverViewLeadingMarginConstraint
{
  return self->_maneuverViewLeadingMarginConstraint;
}

- (NSLayoutConstraint)maneuverViewTrailingMarginConstraint
{
  return self->_maneuverViewTrailingMarginConstraint;
}

- (NSLayoutConstraint)maneuverViewEqualSideMarginsConstraint
{
  return self->_maneuverViewEqualSideMarginsConstraint;
}

- (NSLayoutConstraint)maneuverViewCenterYConstraint
{
  return self->_maneuverViewCenterYConstraint;
}

- (NSLayoutConstraint)maneuverViewTopToTopConstraint
{
  return self->_maneuverViewTopToTopConstraint;
}

- (NSLayoutConstraint)shieldViewTopToTopConstraint
{
  return self->_shieldViewTopToTopConstraint;
}

- (NSLayoutConstraint)trailingToShieldViewTrailingConstraint
{
  return self->_trailingToShieldViewTrailingConstraint;
}

- (NSLayoutConstraint)shieldViewTrailingMajorLabelConstraint
{
  return self->_shieldViewTrailingMajorLabelConstraint;
}

- (NSLayoutConstraint)sheildViewBottomToMinorLabelTopConstraint
{
  return self->_sheildViewBottomToMinorLabelTopConstraint;
}

- (NSArray)maneuverViewLeadingLayoutGuideConstraints
{
  return self->_maneuverViewLeadingLayoutGuideConstraints;
}

- (NSArray)maneuverViewTrailingLayoutGuideConstraints
{
  return self->_maneuverViewTrailingLayoutGuideConstraints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maneuverViewTrailingLayoutGuideConstraints, 0);
  objc_storeStrong((id *)&self->_maneuverViewLeadingLayoutGuideConstraints, 0);
  objc_storeStrong((id *)&self->_sheildViewBottomToMinorLabelTopConstraint, 0);
  objc_storeStrong((id *)&self->_shieldViewTrailingMajorLabelConstraint, 0);
  objc_storeStrong((id *)&self->_trailingToShieldViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_shieldViewTopToTopConstraint, 0);
  objc_storeStrong((id *)&self->_maneuverViewTopToTopConstraint, 0);
  objc_storeStrong((id *)&self->_maneuverViewCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_maneuverViewEqualSideMarginsConstraint, 0);
  objc_storeStrong((id *)&self->_maneuverViewTrailingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_maneuverViewLeadingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_maneuverViewMinLeadingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_maneuverViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_maneuverViewMinWidthConstraint, 0);
  objc_storeStrong((id *)&self->_shieldView, 0);
  objc_storeStrong((id *)&self->_maneuverView, 0);
  objc_storeStrong((id *)&self->_maneuverGuidanceInfo, 0);
}

@end
