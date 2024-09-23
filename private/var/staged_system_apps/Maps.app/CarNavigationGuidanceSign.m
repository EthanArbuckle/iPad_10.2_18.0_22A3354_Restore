@implementation CarNavigationGuidanceSign

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (CarNavigationGuidanceSign)initWithDestination:(unint64_t)a3
{
  double y;
  double width;
  double height;
  CarNavigationGuidanceSign *v7;
  CarNavigationGuidanceSign *v8;
  void *v9;
  UIView *v10;
  UIView *primaryView;
  double v12;
  uint64_t v13;
  CarHairlineView *hairlineView;
  double v15;
  id v16;
  void *v17;
  UIView *v18;
  UIView *secondaryView;
  double v20;
  id v21;
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
  NavJunctionViewController *v32;
  NavJunctionViewController *junctionViewController;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  double v38;
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
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  NSLayoutConstraint *secondaryViewHeightConstraint;
  void *v63;
  void *v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  double v74;
  void *v75;
  void *v76;
  UILayoutGuide *v77;
  UILayoutGuide *minimumCompressedContentLayoutGuide;
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
  unint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  id v113;
  objc_super v114;
  _QWORD v115[4];
  _QWORD v116[7];
  NSLayoutConstraint *v117;
  void *v118;
  void *v119;
  _QWORD v120[3];
  _QWORD v121[3];

  v114.receiver = self;
  v114.super_class = (Class)CarNavigationGuidanceSign;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = -[CarNavigationGuidanceSign initWithFrame:](&v114, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v8 = v7;
  if (v7)
  {
    -[CarNavigationGuidanceSign setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", CFSTR("CarNavigationGuidanceSign"));
    v8->_destination = a3;
    v106 = a3;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v8, "_handleCarScreenSizeChange", CFSTR("CarDisplayDidChangeConnectedNotification"), 0);

    v8->_desiredHeight = UIViewNoIntrinsicMetric;
    v8->_compressionStage = 0;
    v10 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    primaryView = v8->_primaryView;
    v8->_primaryView = v10;

    -[UIView setAccessibilityIdentifier:](v8->_primaryView, "setAccessibilityIdentifier:", CFSTR("CarNavigationGuidanceSignPrimaryView"));
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v8->_primaryView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v12) = 1148846080;
    -[UIView setContentHuggingPriority:forAxis:](v8->_primaryView, "setContentHuggingPriority:forAxis:", 1, v12);
    -[CarNavigationGuidanceSign addSubview:](v8, "addSubview:", v8->_primaryView);
    v13 = objc_claimAutoreleasedReturnValue(+[CarHairlineView hairlineViewAlongAxis:](CarHairlineView, "hairlineViewAlongAxis:", 0));
    hairlineView = v8->_hairlineView;
    v8->_hairlineView = (CarHairlineView *)v13;

    -[CarHairlineView setTranslatesAutoresizingMaskIntoConstraints:](v8->_hairlineView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v15) = 1148846080;
    -[CarHairlineView setContentHuggingPriority:forAxis:](v8->_hairlineView, "setContentHuggingPriority:forAxis:", 1, v15);
    v16 = sub_100C55668();
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    -[CarHairlineView setBackgroundColor:](v8->_hairlineView, "setBackgroundColor:", v17);

    -[CarHairlineView setHidden:](v8->_hairlineView, "setHidden:", 1);
    -[CarNavigationGuidanceSign addSubview:](v8, "addSubview:", v8->_hairlineView);
    v18 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    secondaryView = v8->_secondaryView;
    v8->_secondaryView = v18;

    -[UIView setAccessibilityIdentifier:](v8->_secondaryView, "setAccessibilityIdentifier:", CFSTR("CarNavigationGuidanceSignSecondaryView"));
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v8->_secondaryView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v20) = 1148846080;
    -[UIView setContentHuggingPriority:forAxis:](v8->_secondaryView, "setContentHuggingPriority:forAxis:", 1, v20);
    v21 = sub_100C5553C((id)-[CarNavigationGuidanceSign destination](v8, "destination") == (id)1);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    -[UIView setBackgroundColor:](v8->_secondaryView, "setBackgroundColor:", v22);

    -[UIView setHidden:](v8->_secondaryView, "setHidden:", 1);
    -[CarNavigationGuidanceSign insertSubview:belowSubview:](v8, "insertSubview:belowSubview:", v8->_secondaryView, v8->_primaryView);
    v103 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v8->_primaryView, "topAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign topAnchor](v8, "topAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "constraintEqualToAnchor:", v23));
    v121[0] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v8->_primaryView, "leadingAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign leadingAnchor](v8, "leadingAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v26));
    v121[1] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v8->_primaryView, "trailingAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign trailingAnchor](v8, "trailingAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v29));
    v121[2] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v121, 3));
    v113 = objc_msgSend(v31, "mutableCopy");

    if (!v106)
    {
      v32 = objc_alloc_init(NavJunctionViewController);
      junctionViewController = v8->_junctionViewController;
      v8->_junctionViewController = v32;

      -[NavJunctionViewController setDelegate:](v8->_junctionViewController, "setDelegate:", v8);
      -[NavJunctionViewController setLightModeSource:](v8->_junctionViewController, "setLightModeSource:", 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign junctionView](v8, "junctionView"));
      objc_msgSend(v34, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      v35 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign junctionView](v8, "junctionView"));
      LODWORD(v36) = 1132068864;
      objc_msgSend(v35, "setContentCompressionResistancePriority:forAxis:", 1, v36);

      v37 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign junctionView](v8, "junctionView"));
      LODWORD(v38) = 1132068864;
      objc_msgSend(v37, "setContentCompressionResistancePriority:forAxis:", 0, v38);

      v39 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign junctionView](v8, "junctionView"));
      objc_msgSend(v39, "setHidden:", 1);

      v40 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign junctionView](v8, "junctionView"));
      -[CarNavigationGuidanceSign insertSubview:aboveSubview:](v8, "insertSubview:aboveSubview:", v40, v8->_secondaryView);

      v107 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign junctionView](v8, "junctionView"));
      v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "leadingAnchor"));
      v101 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign leadingAnchor](v8, "leadingAnchor"));
      v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "constraintEqualToAnchor:", v101));
      v120[0] = v99;
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign junctionView](v8, "junctionView"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "trailingAnchor"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign trailingAnchor](v8, "trailingAnchor"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v43));
      v120[1] = v44;
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign junctionView](v8, "junctionView"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "topAnchor"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v8->_primaryView, "bottomAnchor"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v47));
      v120[2] = v48;
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v120, 3));
      objc_msgSend(v113, "addObjectsFromArray:", v49);

      v50 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign junctionView](v8, "junctionView"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "bottomAnchor"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign bottomAnchor](v8, "bottomAnchor"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v52));
      v119 = v53;
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v119, 1));
      -[CarNavigationGuidanceSign setJunctionViewConstraints:](v8, "setJunctionViewConstraints:", v54);

    }
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v113);
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v8->_primaryView, "bottomAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign bottomAnchor](v8, "bottomAnchor"));
    LODWORD(v57) = 1148846080;
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:constant:priority:", v56, 0.0, v57));
    v118 = v58;
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v118, 1));
    -[CarNavigationGuidanceSign setPrimaryViewOnlyConstraints:](v8, "setPrimaryViewOnlyConstraints:", v59);

    v60 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v8->_secondaryView, "heightAnchor"));
    v61 = objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintLessThanOrEqualToConstant:", 200.0));
    secondaryViewHeightConstraint = v8->_secondaryViewHeightConstraint;
    v8->_secondaryViewHeightConstraint = (NSLayoutConstraint *)v61;

    v63 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign primaryViewOnlyConstraints](v8, "primaryViewOnlyConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v63);

    v117 = v8->_secondaryViewHeightConstraint;
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v117, 1));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v64);

    v110 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v8->_primaryView, "bottomAnchor"));
    v108 = (void *)objc_claimAutoreleasedReturnValue(-[CarHairlineView topAnchor](v8->_hairlineView, "topAnchor"));
    LODWORD(v65) = 1148846080;
    v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "constraintEqualToAnchor:constant:priority:", v108, 0.0, v65));
    v116[0] = v105;
    v102 = (void *)objc_claimAutoreleasedReturnValue(-[CarHairlineView leftAnchor](v8->_hairlineView, "leftAnchor"));
    v100 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign leftAnchor](v8, "leftAnchor"));
    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "constraintEqualToAnchor:", v100));
    v116[1] = v98;
    v97 = (void *)objc_claimAutoreleasedReturnValue(-[CarHairlineView rightAnchor](v8->_hairlineView, "rightAnchor"));
    v96 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign rightAnchor](v8, "rightAnchor"));
    v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "constraintEqualToAnchor:", v96));
    v116[2] = v95;
    v109 = (void *)objc_claimAutoreleasedReturnValue(-[CarHairlineView bottomAnchor](v8->_hairlineView, "bottomAnchor"));
    v94 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v8->_secondaryView, "topAnchor"));
    LODWORD(v66) = 1148846080;
    v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "constraintEqualToAnchor:constant:priority:", v94, 0.0, v66));
    v116[3] = v93;
    v92 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v8->_secondaryView, "leadingAnchor"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign leadingAnchor](v8, "leadingAnchor"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "constraintEqualToAnchor:", v67));
    v116[4] = v68;
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v8->_secondaryView, "trailingAnchor"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign trailingAnchor](v8, "trailingAnchor"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:", v70));
    v116[5] = v71;
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v8->_secondaryView, "bottomAnchor"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign bottomAnchor](v8, "bottomAnchor"));
    LODWORD(v74) = 1148846080;
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintEqualToAnchor:constant:priority:", v73, 0.0, v74));
    v116[6] = v75;
    v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v116, 7));
    -[CarNavigationGuidanceSign setSecondaryViewConstraints:](v8, "setSecondaryViewConstraints:", v76);

    v77 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
    minimumCompressedContentLayoutGuide = v8->_minimumCompressedContentLayoutGuide;
    v8->_minimumCompressedContentLayoutGuide = v77;

    -[CarNavigationGuidanceSign addLayoutGuide:](v8, "addLayoutGuide:", v8->_minimumCompressedContentLayoutGuide);
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](v8->_minimumCompressedContentLayoutGuide, "heightAnchor"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "constraintEqualToConstant:", 0.0));
    -[CarNavigationGuidanceSign setMinimumCompressedContentLayoutGuideHeightConstraint:](v8, "setMinimumCompressedContentLayoutGuideHeightConstraint:", v80);

    v112 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v8->_minimumCompressedContentLayoutGuide, "leadingAnchor"));
    v111 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign leadingAnchor](v8, "leadingAnchor"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "constraintEqualToAnchor:", v111));
    v115[0] = v81;
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign trailingAnchor](v8, "trailingAnchor"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v8->_minimumCompressedContentLayoutGuide, "trailingAnchor"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "constraintEqualToAnchor:", v83));
    v115[1] = v84;
    v85 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v8->_minimumCompressedContentLayoutGuide, "topAnchor"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign topAnchor](v8, "topAnchor"));
    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintEqualToAnchor:", v86));
    v115[2] = v87;
    v88 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign minimumCompressedContentLayoutGuideHeightConstraint](v8, "minimumCompressedContentLayoutGuideHeightConstraint"));
    v115[3] = v88;
    v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v115, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v89);

    v90 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign sizeProvider](v8, "sizeProvider"));
    v8->_layoutType = (unint64_t)objc_msgSend(v90, "maneuverViewLayoutType");

  }
  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("CarDisplayDidChangeConnectedNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)CarNavigationGuidanceSign;
  -[CarNavigationGuidanceSign dealloc](&v4, "dealloc");
}

- (void)setSignStyle:(int64_t)a3
{
  if (self->_signStyle != a3)
    self->_signStyle = a3;
}

- (double)_heightForCompressionStage:(unint64_t)a3 isMaximumCompression:(BOOL *)a4
{
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  const __CFString *v24;
  void *v25;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  CarNavigationGuidanceSign *v30;
  __int16 v31;
  unint64_t v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  double v36;
  __int16 v37;
  double v38;
  __int16 v39;
  double v40;
  __int16 v41;
  double v42;
  CGRect v43;
  CGRect v44;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign secondaryGuidanceSignID](self, "secondaryGuidanceSignID"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign junctionView](self, "junctionView"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign junctionViewInfo](self, "junctionViewInfo"));
    v10 = v9 != 0;

  }
  else
  {
    v10 = 0;
  }

  +[CarNavigationGuidanceSignCompression compressionForStage:hasSecondary:hasJunctionView:forDestination:](CarNavigationGuidanceSignCompression, "compressionForStage:hasSecondary:hasJunctionView:forDestination:", a3, v7 != 0, v10, -[CarNavigationGuidanceSign destination](self, "destination"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign primaryManeuverView](self, "primaryManeuverView"));
  objc_msgSend(v11, "sizeForCompressionStage:", 0);
  v13 = v12;

  v14 = 0.0;
  v15 = 0.0;
  v16 = v13;
  if (!-[CarNavigationGuidanceSign _shouldForceSecondaryManeuverViewHidden](self, "_shouldForceSecondaryManeuverViewHidden"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign secondaryManeuverView](self, "secondaryManeuverView"));
    v16 = v13;
    if (v17)
    {

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign secondaryManeuverView](self, "secondaryManeuverView"));
      objc_msgSend(v18, "sizeForCompressionStage:", 0);
      v15 = v19;

      v16 = v13 + v15;
      if (v15 > 0.0)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign hairlineView](self, "hairlineView"));
        objc_msgSend(v20, "frame");
        v16 = v16 + CGRectGetHeight(v43);

      }
    }
  }
  if (v10)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign junctionView](self, "junctionView"));
    objc_msgSend(v21, "bounds");
    v14 = CGRectGetWidth(v44) * 0.352657005;

    v16 = v16 + v14 - v15;
  }
  if (a4)
    *a4 = 0;
  v22 = sub_10043341C();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    v24 = sub_10029A24C(-[CarNavigationGuidanceSign destination](self, "destination"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    *(_DWORD *)buf = 138414082;
    v28 = v25;
    v29 = 2048;
    v30 = self;
    v31 = 2048;
    v32 = a3;
    v33 = 2080;
    v34 = "";
    v35 = 2048;
    v36 = v13;
    v37 = 2048;
    v38 = v15;
    v39 = 2048;
    v40 = v14;
    v41 = 2048;
    v42 = v16;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%@ navSign: %p, _heightForCompressionStage %lu%s, primary: %.1f, secondary: %.1f, junctionViewHeight: %.1f, total: %.1f", buf, 0x52u);

  }
  return v16;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CarNavigationGuidanceSign;
  -[CarNavigationGuidanceSign layoutSubviews](&v12, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign primaryManeuverView](self, "primaryManeuverView"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign sizeProvider](self, "sizeProvider"));
    -[CarNavigationGuidanceSign setLayoutType:](self, "setLayoutType:", objc_msgSend(v4, "maneuverViewLayoutType"));

    -[CarNavigationGuidanceSign _updateCompressionStage](self, "_updateCompressionStage");
    v5 = objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign junctionViewInfo](self, "junctionViewInfo"));
    if (v5)
    {
      v6 = (void *)v5;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign junctionView](self, "junctionView"));
      v8 = objc_msgSend(v7, "isHidden");

      if ((v8 & 1) == 0)
      {
        -[CarNavigationGuidanceSign maxAvailableHeightForJunctionView:](self, "maxAvailableHeightForJunctionView:", 0.0);
        v10 = v9;
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign junctionViewController](self, "junctionViewController"));
        objc_msgSend(v11, "setAvailableHeight:", v10);

      }
    }
  }
}

- (CarManeuverView)primaryManeuverView
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign nextPrimaryManeuver](self, "nextPrimaryManeuver"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign nextPrimaryManeuver](self, "nextPrimaryManeuver"));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign primaryManeuver](self, "primaryManeuver"));

    if (v5)
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign primaryManeuver](self, "primaryManeuver"));
    else
      v4 = 0;
  }
  return (CarManeuverView *)v4;
}

- (CarManeuverView)secondaryManeuverView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign secondaryGuidanceSignID](self, "secondaryGuidanceSignID"));

  if (!v3)
    goto LABEL_6;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign nextSecondaryManeuver](self, "nextSecondaryManeuver"));

  if (!v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign secondaryManeuver](self, "secondaryManeuver"));

    if (v6)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign secondaryManeuver](self, "secondaryManeuver"));
      return (CarManeuverView *)v5;
    }
LABEL_6:
    v5 = 0;
    return (CarManeuverView *)v5;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign nextSecondaryManeuver](self, "nextSecondaryManeuver"));
  return (CarManeuverView *)v5;
}

- (UIView)junctionView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign junctionViewController](self, "junctionViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "view"));

  return (UIView *)v3;
}

- (BOOL)isPointInJunctionView:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  BOOL v17;
  CGPoint v19;
  CGRect v20;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign junctionViewInfo](self, "junctionViewInfo"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign junctionView](self, "junctionView"));
    objc_msgSend(v7, "bounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign junctionView](self, "junctionView"));
    -[CarNavigationGuidanceSign convertRect:fromView:](self, "convertRect:fromView:", v16, v9, v11, v13, v15);
    v19.x = x;
    v19.y = y;
    v17 = CGRectContainsPoint(v20, v19);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)_shouldForceSecondaryManeuverViewHidden
{
  unint64_t v3;

  v3 = -[CarNavigationGuidanceSign destination](self, "destination");
  if (v3 == 2)
    return GEOConfigGetBOOL(MapsConfig_CarPlayHybridInstrumentClusterHideSecondaryGuidance, off_1014B51E8);
  if (v3)
    return 1;
  return (id)-[CarNavigationGuidanceSign signStyle](self, "signStyle") == (id)1;
}

- (void)setSecondaryViewHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  NSObject *v10;
  const __CFString *v11;
  void *v12;
  unint64_t v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  _BOOL8 secondaryViewHidden;
  void *v20;
  _BOOL8 v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  int v26;
  void *v27;
  __int16 v28;
  CarNavigationGuidanceSign *v29;
  __int16 v30;
  unint64_t v31;
  __int16 v32;
  __CFString *v33;
  __int16 v34;
  __CFString *v35;

  v3 = a3;
  if (-[CarNavigationGuidanceSign _shouldForceSecondaryManeuverViewHidden](self, "_shouldForceSecondaryManeuverViewHidden"))
  {
    v5 = sub_10043341C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = sub_10029A24C(-[CarNavigationGuidanceSign destination](self, "destination"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v26 = 138412546;
      v27 = v8;
      v28 = 2048;
      v29 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%@ navSign: %p, forcing secondaryViewHidden for nav signs displayed in widgets.", (uint8_t *)&v26, 0x16u);

    }
    v3 = 1;
  }
  if (self->_secondaryViewHidden != v3)
  {
    v9 = sub_10043341C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = sub_10029A24C(-[CarNavigationGuidanceSign destination](self, "destination"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = -[CarNavigationGuidanceSign compressionStage](self, "compressionStage");
      if (self->_secondaryViewHidden)
        v14 = CFSTR("YES");
      else
        v14 = CFSTR("NO");
      v15 = v14;
      if (v3)
        v16 = CFSTR("YES");
      else
        v16 = CFSTR("NO");
      v17 = v16;
      v26 = 138413314;
      v27 = v12;
      v28 = 2048;
      v29 = self;
      v30 = 2048;
      v31 = v13;
      v32 = 2112;
      v33 = v15;
      v34 = 2112;
      v35 = v17;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%@ navSign: %p, compression: %lu. setSecondaryViewHidden: before: %@, after: %@", (uint8_t *)&v26, 0x34u);

    }
    self->_secondaryViewHidden = v3;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign secondaryManeuver](self, "secondaryManeuver"));
    objc_msgSend(v18, "setHidden:", v3);

    secondaryViewHidden = self->_secondaryViewHidden;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign nextSecondaryManeuver](self, "nextSecondaryManeuver"));
    objc_msgSend(v20, "setHidden:", secondaryViewHidden);

    v21 = self->_secondaryViewHidden;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign hairlineView](self, "hairlineView"));
    objc_msgSend(v22, "setHidden:", v21);

    LODWORD(v21) = self->_secondaryViewHidden;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign secondaryViewHeightConstraint](self, "secondaryViewHeightConstraint"));
    v24 = v23;
    v25 = 200.0;
    if (v21)
      v25 = 0.0;
    objc_msgSend(v23, "setConstant:", v25);

  }
}

- (void)setJunctionViewHidden:(BOOL)a3
{
  double v4;
  double v5;
  id v6;

  if (self->_junctionViewHidden != a3)
  {
    self->_junctionViewHidden = a3;
    -[CarNavigationGuidanceSign maxAvailableHeightForJunctionView:](self, "maxAvailableHeightForJunctionView:", 0.0);
    v5 = v4;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign junctionViewController](self, "junctionViewController"));
    objc_msgSend(v6, "setAvailableHeight:", v5);

  }
}

- (void)setJunctionViewTemporarilyHidden:(BOOL)a3
{
  double v4;
  double v5;
  id v6;

  if (self->_junctionViewTemporarilyHidden != a3)
  {
    self->_junctionViewTemporarilyHidden = a3;
    -[CarNavigationGuidanceSign maxAvailableHeightForJunctionView:](self, "maxAvailableHeightForJunctionView:", 0.0);
    v5 = v4;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign junctionViewController](self, "junctionViewController"));
    objc_msgSend(v6, "setAvailableHeight:", v5);

  }
}

- (void)setPrimaryGuidance:(id)a3
{
  NavSignManeuverGuidanceInfo *v5;
  NavSignManeuverGuidanceInfo **p_primaryGuidance;
  id v7;
  NSObject *v8;
  CarNavigationGuidanceSign *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NavSignManeuverGuidanceInfo *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  NavSignManeuverGuidanceInfo *v20;
  __int16 v21;
  NavSignManeuverGuidanceInfo *v22;

  v5 = (NavSignManeuverGuidanceInfo *)a3;
  p_primaryGuidance = &self->_primaryGuidance;
  if (self->_primaryGuidance != v5)
  {
    v7 = sub_10043341C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      objc_storeStrong((id *)p_primaryGuidance, a3);
      goto LABEL_10;
    }
    v9 = self;
    v10 = (objc_class *)objc_opt_class(v9);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if ((objc_opt_respondsToSelector(v9, "accessibilityIdentifier") & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign performSelector:](v9, "performSelector:", "accessibilityIdentifier"));
      v14 = v13;
      if (v13 && !objc_msgSend(v13, "isEqualToString:", v12))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v12, v9, v14));

        goto LABEL_8;
      }

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v12, v9));
LABEL_8:

    v16 = *p_primaryGuidance;
    *(_DWORD *)buf = 138543874;
    v18 = v15;
    v19 = 2112;
    v20 = v16;
    v21 = 2112;
    v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] Changing primaryGuidance from %@ to %@", buf, 0x20u);

    goto LABEL_9;
  }
LABEL_10:

}

- (void)setSecondaryGuidance:(id)a3
{
  id v5;
  id *p_secondaryGuidance;
  id v7;
  NSObject *v8;
  id v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;

  v5 = a3;
  p_secondaryGuidance = (id *)&self->_secondaryGuidance;
  if (*p_secondaryGuidance != v5)
  {
    v7 = sub_10043341C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = *p_secondaryGuidance;
      v10 = 138412546;
      v11 = v9;
      v12 = 2112;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Changing secondaryGuidance from %@ to %@", (uint8_t *)&v10, 0x16u);
    }

    objc_storeStrong(p_secondaryGuidance, a3);
  }

}

- (void)setPrimaryGuidanceSignID:(id)a3
{
  NSUUID *v5;
  NSUUID **p_primaryGuidanceSignID;
  id v7;
  NSObject *v8;
  CarNavigationGuidanceSign *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSUUID *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  NSUUID *v20;
  __int16 v21;
  NSUUID *v22;

  v5 = (NSUUID *)a3;
  p_primaryGuidanceSignID = &self->_primaryGuidanceSignID;
  if (self->_primaryGuidanceSignID != v5)
  {
    v7 = sub_10043341C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      objc_storeStrong((id *)p_primaryGuidanceSignID, a3);
      goto LABEL_10;
    }
    v9 = self;
    v10 = (objc_class *)objc_opt_class(v9);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if ((objc_opt_respondsToSelector(v9, "accessibilityIdentifier") & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign performSelector:](v9, "performSelector:", "accessibilityIdentifier"));
      v14 = v13;
      if (v13 && !objc_msgSend(v13, "isEqualToString:", v12))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v12, v9, v14));

        goto LABEL_8;
      }

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v12, v9));
LABEL_8:

    v16 = *p_primaryGuidanceSignID;
    *(_DWORD *)buf = 138543874;
    v18 = v15;
    v19 = 2112;
    v20 = v16;
    v21 = 2112;
    v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] Changing primary sign ID from %@ to %@", buf, 0x20u);

    goto LABEL_9;
  }
LABEL_10:

}

- (void)setSecondaryGuidanceSignID:(id)a3
{
  NSUUID *v5;
  NSUUID **p_secondaryGuidanceSignID;
  id v7;
  NSObject *v8;
  CarNavigationGuidanceSign *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSUUID *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  NSUUID *v20;
  __int16 v21;
  NSUUID *v22;

  v5 = (NSUUID *)a3;
  p_secondaryGuidanceSignID = &self->_secondaryGuidanceSignID;
  if (self->_secondaryGuidanceSignID != v5)
  {
    v7 = sub_10043341C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      objc_storeStrong((id *)p_secondaryGuidanceSignID, a3);
      goto LABEL_10;
    }
    v9 = self;
    v10 = (objc_class *)objc_opt_class(v9);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if ((objc_opt_respondsToSelector(v9, "accessibilityIdentifier") & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign performSelector:](v9, "performSelector:", "accessibilityIdentifier"));
      v14 = v13;
      if (v13 && !objc_msgSend(v13, "isEqualToString:", v12))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v12, v9, v14));

        goto LABEL_8;
      }

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v12, v9));
LABEL_8:

    v16 = *p_secondaryGuidanceSignID;
    *(_DWORD *)buf = 138543874;
    v18 = v15;
    v19 = 2112;
    v20 = v16;
    v21 = 2112;
    v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] Changing secondary sign ID from %@ to %@", buf, 0x20u);

    goto LABEL_9;
  }
LABEL_10:

}

- (void)setPrimaryManeuver:(id)a3
{
  id v5;
  id *p_primaryManeuver;
  id v7;
  NSObject *v8;
  id v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;

  v5 = a3;
  p_primaryManeuver = (id *)&self->_primaryManeuver;
  if (*p_primaryManeuver != v5)
  {
    v7 = sub_10043341C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = *p_primaryManeuver;
      v10 = 138412546;
      v11 = v9;
      v12 = 2112;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Changing primaryManeuver from %@ to %@", (uint8_t *)&v10, 0x16u);
    }

    objc_storeStrong(p_primaryManeuver, a3);
  }

}

- (void)setNextPrimaryManeuver:(id)a3
{
  id v5;
  id *p_nextPrimaryManeuver;
  id v7;
  NSObject *v8;
  id v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;

  v5 = a3;
  p_nextPrimaryManeuver = (id *)&self->_nextPrimaryManeuver;
  if (*p_nextPrimaryManeuver != v5)
  {
    v7 = sub_10043341C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = *p_nextPrimaryManeuver;
      v10 = 138412546;
      v11 = v9;
      v12 = 2112;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Changing nextPrimaryManeuver from %@ to %@", (uint8_t *)&v10, 0x16u);
    }

    objc_storeStrong(p_nextPrimaryManeuver, a3);
  }

}

- (void)setBlurMode:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign primaryManeuver](self, "primaryManeuver"));
  objc_msgSend(v5, "setBlurMode:", v3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign nextPrimaryManeuver](self, "nextPrimaryManeuver"));
  objc_msgSend(v6, "setBlurMode:", v3);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign secondaryManeuver](self, "secondaryManeuver"));
  objc_msgSend(v7, "setBlurMode:", v3);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign nextSecondaryManeuver](self, "nextSecondaryManeuver"));
  objc_msgSend(v8, "setBlurMode:", v3);

}

- (void)_resetPrecalculatedCompressionSizes
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign primaryManeuver](self, "primaryManeuver"));
  objc_msgSend(v3, "resetCompressionSizes");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign nextPrimaryManeuver](self, "nextPrimaryManeuver"));
  objc_msgSend(v4, "resetCompressionSizes");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign secondaryManeuver](self, "secondaryManeuver"));
  objc_msgSend(v5, "resetCompressionSizes");

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign nextSecondaryManeuver](self, "nextSecondaryManeuver"));
  objc_msgSend(v6, "resetCompressionSizes");

}

- (void)_updateCompressionStage
{
  double v3;
  id v4;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  CarNavigationGuidanceSign *v8;
  unint64_t v9;
  double v10;
  id v11;
  NSObject *v12;
  const __CFString *v13;
  void *v14;
  double widthAtLastCompressionUpdate;
  double v16;
  double v17;
  void *v18;
  id v19;
  NSObject *v20;
  const __CFString *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  CarNavigationGuidanceSign *v26;
  __int16 v27;
  double v28;
  __int16 v29;
  double v30;

  -[CarNavigationGuidanceSign availableWidth](self, "availableWidth");
  if (v3 == 0.0)
  {
    v4 = sub_10043341C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = sub_10029A24C(-[CarNavigationGuidanceSign destination](self, "destination"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      v23 = 138412546;
      v24 = v7;
      v25 = 2048;
      v26 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%@ navSign: %p, layoutSubviews, but availableWidth was 0. setting compressionStage to None.", (uint8_t *)&v23, 0x16u);

    }
    v8 = self;
    v9 = 0;
  }
  else
  {
    v10 = v3;
    if (v3 != self->_widthAtLastCompressionUpdate)
    {
      v11 = sub_10043341C();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v13 = sub_10029A24C(-[CarNavigationGuidanceSign destination](self, "destination"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        widthAtLastCompressionUpdate = self->_widthAtLastCompressionUpdate;
        v23 = 138413058;
        v24 = v14;
        v25 = 2048;
        v26 = self;
        v27 = 2048;
        v28 = widthAtLastCompressionUpdate;
        v29 = 2048;
        v30 = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%@ navSign: %p, availableWidth has changed from %.1f to %.1f since last layout, we need to recalculate compression stages", (uint8_t *)&v23, 0x2Au);

      }
      -[CarNavigationGuidanceSign _resetPrecalculatedCompressionSizes](self, "_resetPrecalculatedCompressionSizes");
      self->_widthAtLastCompressionUpdate = v10;
      -[CarNavigationGuidanceSign _heightForCompressionStage:isMaximumCompression:](self, "_heightForCompressionStage:isMaximumCompression:", -1, 0);
      v17 = v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign minimumCompressedContentLayoutGuideHeightConstraint](self, "minimumCompressedContentLayoutGuideHeightConstraint"));
      objc_msgSend(v18, "setConstant:", v17);

    }
    v19 = sub_10043341C();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v21 = sub_10029A24C(-[CarNavigationGuidanceSign destination](self, "destination"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v23 = 138412802;
      v24 = v22;
      v25 = 2048;
      v26 = self;
      v27 = 2048;
      v28 = v10;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%@ navSign: %p, layoutSubviews, availableWidth width is %1.f.", (uint8_t *)&v23, 0x20u);

    }
    v9 = -[CarNavigationGuidanceSign _desiredCompressionStage](self, "_desiredCompressionStage");
    v8 = self;
  }
  -[CarNavigationGuidanceSign setCompressionStage:](v8, "setCompressionStage:", v9);
}

- (void)setCompressionStage:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  const __CFString *v17;
  void *v18;
  unint64_t compressionStage;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  CarNavigationGuidanceSign *v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  unint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign primaryManeuver](self, "primaryManeuver"));
  v6 = objc_msgSend(v5, "compressionStage");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign secondaryManeuver](self, "secondaryManeuver"));
  v8 = objc_msgSend(v7, "compressionStage");

  self->_compressionStage = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign secondaryGuidanceSignID](self, "secondaryGuidanceSignID"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign junctionView](self, "junctionView"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign junctionViewInfo](self, "junctionViewInfo"));
    v12 = v11 != 0;

  }
  else
  {
    v12 = 0;
  }

  +[CarNavigationGuidanceSignCompression compressionForStage:hasSecondary:hasJunctionView:forDestination:](CarNavigationGuidanceSignCompression, "compressionForStage:hasSecondary:hasJunctionView:forDestination:", a3, v9 != 0, v12, -[CarNavigationGuidanceSign destination](self, "destination"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign primaryManeuver](self, "primaryManeuver"));
  objc_msgSend(v13, "setCompressionStage:", 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign nextPrimaryManeuver](self, "nextPrimaryManeuver"));
  objc_msgSend(v14, "setCompressionStage:", 0);

  v15 = sub_10043341C();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = sub_10029A24C(-[CarNavigationGuidanceSign destination](self, "destination"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    compressionStage = self->_compressionStage;
    *(_DWORD *)buf = 138413570;
    v26 = v18;
    v27 = 2048;
    v28 = self;
    v29 = 2048;
    v30 = compressionStage;
    v31 = 2048;
    v32 = a3;
    v33 = 2048;
    v34 = 0;
    v35 = 2048;
    v36 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%@ navSign: %p, setCompressionStage: before: %lu, after: %lu. primaryCompression: %lu, secondaryCompression: %lu", buf, 0x3Eu);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign secondaryManeuver](self, "secondaryManeuver"));
  objc_msgSend(v20, "setCompressionStage:", 0);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign nextSecondaryManeuver](self, "nextSecondaryManeuver"));
  objc_msgSend(v21, "setCompressionStage:", 0);

  -[CarNavigationGuidanceSign setSecondaryViewHidden:](self, "setSecondaryViewHidden:", 0);
  -[CarNavigationGuidanceSign setJunctionViewHidden:](self, "setJunctionViewHidden:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign primaryManeuver](self, "primaryManeuver"));
  if (v6 != objc_msgSend(v22, "compressionStage"))
  {

    goto LABEL_10;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign secondaryManeuver](self, "secondaryManeuver"));
  v24 = objc_msgSend(v23, "compressionStage");

  if (v8 != v24)
  {
LABEL_10:
    -[CarNavigationGuidanceSign setNeedsLayout](self, "setNeedsLayout");
    -[CarNavigationGuidanceSign layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)refreshJunctionView
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign junctionView](self, "junctionView"));
  objc_msgSend(v2, "setNeedsLayout");

}

- (void)setJunctionViewInfo:(id)a3
{
  NavJunctionViewInfo *v5;
  void *v6;
  NavJunctionViewInfo *junctionViewInfo;
  void *v8;
  NavJunctionViewInfo *v9;

  v5 = (NavJunctionViewInfo *)a3;
  if (self->_junctionViewController)
  {
    v9 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign sizeProvider](self, "sizeProvider"));
    -[CarNavigationGuidanceSign setLayoutType:](self, "setLayoutType:", objc_msgSend(v6, "maneuverViewLayoutType"));

    v5 = v9;
    if (self->_junctionViewInfo != v9)
    {
      objc_storeStrong((id *)&self->_junctionViewInfo, a3);
      junctionViewInfo = self->_junctionViewInfo;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign junctionViewController](self, "junctionViewController"));
      objc_msgSend(v8, "setJunctionViewInfo:", junctionViewInfo);

      v5 = v9;
    }
  }

}

- (void)showJunctionViewAnimated:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  CarNavigationGuidanceSign *v15;
  __int16 v16;
  __CFString *v17;

  v3 = a3;
  v5 = sub_10043341C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = sub_10029A24C(-[CarNavigationGuidanceSign destination](self, "destination"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = CFSTR("NO");
    if (v3)
      v9 = CFSTR("YES");
    v10 = v9;
    *(_DWORD *)buf = 138412802;
    v13 = v8;
    v14 = 2048;
    v15 = self;
    v16 = 2112;
    v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%@ navSign: %p, showJunctionViewAnimated: %@", buf, 0x20u);

  }
  -[CarNavigationGuidanceSign setJunctionViewTemporarilyHidden:](self, "setJunctionViewTemporarilyHidden:", 0);
  if (v3)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1006C3DEC;
    v11[3] = &unk_1011AC860;
    v11[4] = self;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v11, 0.4);
  }
  else
  {
    -[CarNavigationGuidanceSign layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)hideJunctionViewAnimated:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  CarNavigationGuidanceSign *v16;
  __int16 v17;
  __CFString *v18;

  v3 = a3;
  v5 = sub_10043341C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = sub_10029A24C(-[CarNavigationGuidanceSign destination](self, "destination"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = CFSTR("NO");
    if (v3)
      v9 = CFSTR("YES");
    v10 = v9;
    *(_DWORD *)buf = 138412802;
    v14 = v8;
    v15 = 2048;
    v16 = self;
    v17 = 2112;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%@ navSign: %p, hideJunctionViewAnimated: %@", buf, 0x20u);

  }
  -[CarNavigationGuidanceSign setJunctionViewTemporarilyHidden:](self, "setJunctionViewTemporarilyHidden:", 1);
  if (v3)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1006C3F78;
    v12[3] = &unk_1011AC860;
    v12[4] = self;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v12, 0.4);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign junctionView](self, "junctionView"));
    objc_msgSend(v11, "layoutIfNeeded");

    -[CarNavigationGuidanceSign layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (double)maxAvailableHeightForJunctionView:(double)a3
{
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double Height;
  void *v10;
  double v11;
  double v12;
  CGRect v14;
  CGRect v15;

  v4 = 0.0;
  if ((id)-[CarNavigationGuidanceSign destination](self, "destination", a3) != (id)1
    && (id)-[CarNavigationGuidanceSign destination](self, "destination") != (id)2
    && !-[CarNavigationGuidanceSign junctionViewHidden](self, "junctionViewHidden")
    && !-[CarNavigationGuidanceSign junctionViewTemporarilyHidden](self, "junctionViewTemporarilyHidden"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign sizeProvider](self, "sizeProvider"));
    objc_msgSend(v5, "availableSize");
    v7 = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign primaryManeuverView](self, "primaryManeuverView"));
    objc_msgSend(v8, "frame");
    Height = CGRectGetHeight(v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign hairlineView](self, "hairlineView"));
    objc_msgSend(v10, "frame");
    v11 = v7 - (Height + CGRectGetHeight(v15));

    v12 = sub_1004B31F0();
    return v12 * floor(v11 / v12);
  }
  return v4;
}

- (void)hideJunctionViewTemporarily
{
  -[CarNavigationGuidanceSign hideJunctionViewAnimated:](self, "hideJunctionViewAnimated:", 1);
}

- (void)_prepareManeuverView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  id v22;
  NSObject *v23;
  const __CFString *v24;
  void *v25;
  NSString *v26;
  void *v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  CarNavigationGuidanceSign *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  unint64_t v38;
  _QWORD v39[3];
  CGSize v40;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign sizeProvider](self, "sizeProvider"));
  objc_msgSend(v5, "availableSize");
  v7 = v6;
  v9 = v8;

  v10 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, v7, 1.79769313e308);
  objc_msgSend(v10, "addSubview:", v4);
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v28));
  v39[0] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
  v39[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
  v39[2] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v39, 3));

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v18);
  objc_msgSend(v10, "setNeedsLayout");
  objc_msgSend(v10, "layoutIfNeeded");
  -[CarNavigationGuidanceSign complementarySignHeightForManeuverView:](self, "complementarySignHeightForManeuverView:", v4);
  v20 = v9 - v19;
  objc_msgSend(v4, "frame");
  if (v21 > v20)
  {
    objc_msgSend(v4, "setCompressionStage:", objc_msgSend(v4, "compressionStageForSize:", v7, v9));
    objc_msgSend(v10, "setNeedsLayout");
    objc_msgSend(v10, "layoutIfNeeded");
  }
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v18);
  v22 = sub_10043341C();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    v24 = sub_10029A24C(-[CarNavigationGuidanceSign destination](self, "destination"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v40.width = v7;
    v40.height = v9;
    v26 = NSStringFromCGSize(v40);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    *(_DWORD *)buf = 138413058;
    v32 = v25;
    v33 = 2048;
    v34 = self;
    v35 = 2112;
    v36 = v27;
    v37 = 2048;
    v38 = -[CarNavigationGuidanceSign compressionStage](self, "compressionStage");
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%@ navSign: %p, _prepareManeuverView. for availableSize: %@, with compressionStage: %lu", buf, 0x2Au);

  }
}

- (double)complementarySignHeightForManeuverView:(id)a3
{
  id v4;
  void *v5;
  double Height;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  CGRect v13;
  CGRect v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign secondaryManeuverView](self, "secondaryManeuverView"));
  Height = 0.0;
  if (!v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign hairlineView](self, "hairlineView"));
    objc_msgSend(v7, "frame");
    Height = CGRectGetHeight(v13);

  }
  v8 = objc_msgSend(v4, "variant");

  if (v8 == (id)2)
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign primaryManeuverView](self, "primaryManeuverView"));
  else
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign secondaryManeuverView](self, "secondaryManeuverView"));
  v10 = v9;
  objc_msgSend(v9, "frame");
  v11 = CGRectGetHeight(v14);

  return Height + v11;
}

- (void)_replacePrimaryViewManeuver:(id)a3 initialConstraints:(id)a4 finalConstraints:(id)a5 slide:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  CarNavigationGuidanceSign *v17;
  CarNavigationGuidanceSign *v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  __CFString *v30;
  __CFString *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  void *v39;
  id v40;
  NSObject *v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  void *i;
  void *v50;
  id v51;
  NSObject *v52;
  const __CFString *v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  double v69;
  CGFloat v70;
  double v71;
  CGFloat v72;
  double v73;
  CGFloat v74;
  double v75;
  CGFloat v76;
  id v77;
  void *v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  id v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  double v94;
  CGFloat v95;
  double v96;
  CGFloat v97;
  double v98;
  CGFloat v99;
  double v100;
  CGFloat v101;
  id v102;
  void *v103;
  void *v104;
  void *v105;
  id v106;
  NSObject *v107;
  id v108;
  NSObject *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  id v114;
  void *v115;
  id v116;
  void *v117;
  void *v118;
  _BOOL4 v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  CarNavigationGuidanceSign *v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  uint8_t v131[128];
  _BYTE buf[24];
  void *v133;
  __int16 v134;
  void *v135;
  __int16 v136;
  uint64_t v137;
  __int16 v138;
  __CFString *v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;

  v119 = a6;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v9;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign primaryManeuver](self, "primaryManeuver"));
  v126 = self;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign primaryView](self, "primaryView"));
  v15 = sub_10043341C();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v125 = v13;
  v122 = v10;
  if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    goto LABEL_13;
  v17 = self;
  v18 = v17;
  if (!v17)
  {
    v24 = CFSTR("<nil>");
    goto LABEL_10;
  }
  v19 = (objc_class *)objc_opt_class(v17);
  v20 = NSStringFromClass(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  if ((objc_opt_respondsToSelector(v18, "accessibilityIdentifier") & 1) != 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign performSelector:](v18, "performSelector:", "accessibilityIdentifier"));
    v23 = v22;
    if (v22 && !objc_msgSend(v22, "isEqualToString:", v21))
    {
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v21, v18, v23));

      goto LABEL_8;
    }

  }
  v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v21, v18));
LABEL_8:

LABEL_10:
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "guidance"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "signID"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "guidance"));
  v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "signID"));
  v29 = (void *)v28;
  *(_DWORD *)buf = 138544642;
  v30 = CFSTR("NO");
  *(_QWORD *)&buf[4] = v24;
  if (v119)
    v30 = CFSTR("YES");
  *(_WORD *)&buf[12] = 2112;
  *(_QWORD *)&buf[14] = v12;
  *(_WORD *)&buf[22] = 2112;
  v133 = v26;
  v134 = 2112;
  v135 = v13;
  v136 = 2112;
  v137 = v28;
  v138 = 2112;
  v139 = v30;
  v31 = v30;
  _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}@] _replacePrimaryViewManeuver incoming: %@ (%@) outgoing: %@ (%@) shouldSlide: %@", buf, 0x3Eu);

  v13 = v125;
  v10 = v122;
LABEL_13:

  if (v12)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "subviews"));
    v33 = sub_10039E080(v32, &stru_1011C0620);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);

    v117 = v34;
    v116 = v11;
    v118 = v14;
    if ((unint64_t)objc_msgSend(v34, "count") >= 2)
    {
      v35 = sub_1004318FC();
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "-[CarNavigationGuidanceSign _replacePrimaryViewManeuver:initialConstraints:finalConstraints:slide:]";
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "CarNavigationGuidanceSign.m";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v133) = 613;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
      }

      if (sub_100A70734())
      {
        v37 = sub_1004318FC();
        v38 = objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v39;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
      v114 = v12;
      v40 = sub_10043341C();
      v41 = objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
      {
        v42 = sub_10029A24C(-[CarNavigationGuidanceSign destination](v126, "destination"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign recursiveDescription](v126, "recursiveDescription"));
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v43;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v126;
        *(_WORD *)&buf[22] = 2112;
        v133 = v44;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_FAULT, "%@ navSign: %p, _replacePrimaryViewManeuver found lingering views in primaryView -> will forcefully remove them. view hierarchy: %@", buf, 0x20u);

      }
      v129 = 0u;
      v130 = 0u;
      v127 = 0u;
      v128 = 0u;
      v45 = v117;
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v127, v131, 16);
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v128;
        do
        {
          for (i = 0; i != v47; i = (char *)i + 1)
          {
            if (*(_QWORD *)v128 != v48)
              objc_enumerationMutation(v45);
            v50 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * (_QWORD)i);
            if (v50 != v13)
            {
              v51 = sub_10043341C();
              v52 = objc_claimAutoreleasedReturnValue(v51);
              if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
              {
                v53 = sub_10029A24C(-[CarNavigationGuidanceSign destination](v126, "destination"));
                v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
                *(_DWORD *)buf = 138412802;
                *(_QWORD *)&buf[4] = v54;
                *(_WORD *)&buf[12] = 2048;
                *(_QWORD *)&buf[14] = v126;
                *(_WORD *)&buf[22] = 2112;
                v133 = v50;
                _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "%@ navSign: %p, will remove lingering view: %@", buf, 0x20u);

                v13 = v125;
              }

              objc_msgSend(v50, "removeFromSuperview");
            }
          }
          v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v127, v131, 16);
        }
        while (v47);
      }

      v10 = v122;
      v12 = v114;
      v11 = v116;
    }
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CarNavigationGuidanceSign _prepareManeuverView:](v126, "_prepareManeuverView:", v12);
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign primaryView](v126, "primaryView"));
    objc_msgSend(v55, "addSubview:", v12);

    if (v119)
    {
      v60 = v14;
      v61 = v12;
      v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "topAnchor"));
      v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "topAnchor"));
      v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "constraintEqualToAnchor:", v120));
      *(_QWORD *)buf = v115;
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "leadingAnchor"));
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "trailingAnchor"));
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:", v63));
      *(_QWORD *)&buf[8] = v64;
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "heightAnchor"));
      objc_msgSend(v61, "bounds");
      v66 = objc_msgSend(v65, "constraintEqualToConstant:", CGRectGetHeight(v140));
      v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
      *(_QWORD *)&buf[16] = v67;
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "widthAnchor"));

      objc_msgSend(v60, "bounds");
      v70 = v69;
      v72 = v71;
      v74 = v73;
      v76 = v75;

      v141.origin.x = v70;
      v141.origin.y = v72;
      v141.size.width = v74;
      v141.size.height = v76;
      v77 = objc_msgSend(v68, "constraintEqualToConstant:", CGRectGetWidth(v141));
      v78 = (void *)objc_claimAutoreleasedReturnValue(v77);
      v133 = v78;
      v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", buf, 4));

      v10 = v122;
      v11 = v116;

      objc_msgSend(v122, "addObjectsFromArray:", v79);
      if (!v125)
      {
LABEL_47:
        LODWORD(v80) = 1148846080;
        v14 = v118;
        LODWORD(v81) = 1148846080;
        LODWORD(v82) = 1148846080;
        LODWORD(v83) = 1148846080;
        v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_maps_constraintsForCenteringInView:edgeInsets:priorities:", v118, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, v80, v81, v82, v83));
        -[CarNavigationGuidanceSign setPrimaryManeuverConstraints:](v126, "setPrimaryManeuverConstraints:", v111);

        v112 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign primaryManeuverConstraints](v126, "primaryManeuverConstraints"));
        objc_msgSend(v11, "addObjectsFromArray:", v112);

        v113 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign primaryManeuver](v126, "primaryManeuver"));
        objc_msgSend(v113, "setStopUpdatingCompressionStage:", 1);

        v13 = v125;
        goto LABEL_48;
      }
      v84 = v60;
      v85 = v125;
      v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "topAnchor"));
      v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "topAnchor"));
      v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "constraintEqualToAnchor:", v124));
      *(_QWORD *)buf = v121;
      v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "trailingAnchor"));
      v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "leadingAnchor"));
      v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "constraintEqualToAnchor:", v88));
      *(_QWORD *)&buf[8] = v89;
      v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "heightAnchor"));
      objc_msgSend(v85, "bounds");
      v91 = objc_msgSend(v90, "constraintEqualToConstant:", CGRectGetHeight(v142));
      v92 = (void *)objc_claimAutoreleasedReturnValue(v91);
      *(_QWORD *)&buf[16] = v92;
      v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "widthAnchor"));

      objc_msgSend(v84, "bounds");
      v95 = v94;
      v97 = v96;
      v99 = v98;
      v101 = v100;

      v143.origin.x = v95;
      v143.origin.y = v97;
      v143.size.width = v99;
      v143.size.height = v101;
      v102 = objc_msgSend(v93, "constraintEqualToConstant:", CGRectGetWidth(v143));
      v103 = (void *)objc_claimAutoreleasedReturnValue(v102);
      v133 = v103;
      v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", buf, 4));

      v10 = v122;
      v11 = v116;

      v105 = v116;
    }
    else
    {
      LODWORD(v56) = 1148846080;
      LODWORD(v57) = 1148846080;
      LODWORD(v58) = 1148846080;
      LODWORD(v59) = 1148846080;
      v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_maps_constraintsForCenteringInView:edgeInsets:priorities:", v14, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, v56, v57, v58, v59));
      v105 = v10;
    }
    objc_msgSend(v105, "addObjectsFromArray:", v104);

    goto LABEL_47;
  }
  v106 = sub_1004318FC();
  v107 = objc_claimAutoreleasedReturnValue(v106);
  if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[CarNavigationGuidanceSign _replacePrimaryViewManeuver:initialConstraints:finalConstraints:slide:]";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "CarNavigationGuidanceSign.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v133) = 599;
    _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
  }

  if (sub_100A70734())
  {
    v108 = sub_1004318FC();
    v109 = objc_claimAutoreleasedReturnValue(v108);
    if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
    {
      v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v110;
      _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
  }
  objc_msgSend(v13, "setStopUpdatingCompressionStage:", 1);
  objc_msgSend(v13, "removeFromSuperview");
LABEL_48:

}

- (void)_replaceSecondaryViewManeuver:(id)a3 initialConstraints:(id)a4 finalConstraints:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  CarNavigationGuidanceSign *v13;
  CarNavigationGuidanceSign *v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  NSMutableArray *v21;
  void *v22;
  _BOOL8 v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  uint8_t buf[4];
  __CFString *v39;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = sub_10043341C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    goto LABEL_11;
  v13 = self;
  v14 = v13;
  if (!v13)
  {
    v20 = CFSTR("<nil>");
    goto LABEL_10;
  }
  v15 = (objc_class *)objc_opt_class(v13);
  v16 = NSStringFromClass(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  if ((objc_opt_respondsToSelector(v14, "accessibilityIdentifier") & 1) != 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign performSelector:](v14, "performSelector:", "accessibilityIdentifier"));
    v19 = v18;
    if (v18 && !objc_msgSend(v18, "isEqualToString:", v17))
    {
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v17, v14, v19));

      goto LABEL_8;
    }

  }
  v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v17, v14));
LABEL_8:

LABEL_10:
  *(_DWORD *)buf = 138543362;
  v39 = v20;
  _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}@] _replaceSecondaryViewManeuver.", buf, 0xCu);

LABEL_11:
  v21 = objc_opt_new(NSMutableArray);
  if (v8)
  {
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CarNavigationGuidanceSign _prepareManeuverView:](self, "_prepareManeuverView:", v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign secondaryView](self, "secondaryView"));
    objc_msgSend(v22, "setHidden:", 0);

    v23 = -[CarNavigationGuidanceSign secondaryViewHidden](self, "secondaryViewHidden");
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign hairlineView](self, "hairlineView"));
    objc_msgSend(v24, "setHidden:", v23);

    objc_msgSend(v8, "setHidden:", -[CarNavigationGuidanceSign secondaryViewHidden](self, "secondaryViewHidden"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign secondaryView](self, "secondaryView"));
    objc_msgSend(v25, "addSubview:", v8);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign secondaryView](self, "secondaryView"));
    LODWORD(v27) = 1148846080;
    LODWORD(v28) = 1148846080;
    LODWORD(v29) = 1148846080;
    LODWORD(v30) = 1148846080;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_maps_constraintsForCenteringInView:edgeInsets:priorities:", v26, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, v27, v28, v29, v30));
    -[NSMutableArray addObjectsFromArray:](v21, "addObjectsFromArray:", v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign secondaryViewConstraints](self, "secondaryViewConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v32);
  }
  else
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign secondaryView](self, "secondaryView"));
    objc_msgSend(v33, "setHidden:", 1);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign hairlineView](self, "hairlineView"));
    objc_msgSend(v34, "setHidden:", 1);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign secondaryViewConstraints](self, "secondaryViewConstraints"));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v32);
  }

  if (-[CarNavigationGuidanceSign secondaryViewHidden](self, "secondaryViewHidden"))
    v35 = 0.0;
  else
    v35 = 200.0;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign secondaryViewHeightConstraint](self, "secondaryViewHeightConstraint"));
  objc_msgSend(v36, "setConstant:", v35);

  objc_msgSend(v10, "addObjectsFromArray:", v21);
  objc_msgSend(v9, "addObjectsFromArray:", v21);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign secondaryManeuver](self, "secondaryManeuver"));
  objc_msgSend(v37, "setStopUpdatingCompressionStage:", 1);

}

- (unint64_t)_desiredCompressionStage
{
  id v3;
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  const char *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  const __CFString *v14;
  unint64_t v15;
  double v16;
  double v17;
  double v18;
  id v19;
  NSObject *v20;
  const __CFString *v21;
  void *v22;
  unint64_t v23;
  NSString *v24;
  void *v25;
  char v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  CarNavigationGuidanceSign *v31;
  __int16 v32;
  unint64_t v33;
  __int16 v34;
  unint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  double v39;
  CGSize v40;

  if ((id)-[CarNavigationGuidanceSign signStyle](self, "signStyle") == (id)1)
  {
    v3 = sub_10043341C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = sub_10029A24C(-[CarNavigationGuidanceSign destination](self, "destination"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      *(_DWORD *)buf = 138412546;
      v29 = v6;
      v30 = 2048;
      v31 = self;
      v7 = "%@ navSign: %p, _desiredCompressionStage isLowGuidance, because signStyle is .Mini.";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, v7, buf, 0x16u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign sizeProvider](self, "sizeProvider"));
  objc_msgSend(v8, "availableSize");
  v10 = v9;
  v12 = v11;

  if (v10 < 125.0)
  {
    v13 = sub_10043341C();
    v4 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v14 = sub_10029A24C(-[CarNavigationGuidanceSign destination](self, "destination"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(v14);
      *(_DWORD *)buf = 138412546;
      v29 = v6;
      v30 = 2048;
      v31 = self;
      v7 = "%@ navSign: %p, _desiredCompressionStage isLowGuidance, because availableWidth is < MinWidthSupportingFullGuidanceView";
      goto LABEL_7;
    }
LABEL_8:

    return 9;
  }
  v27 = 0;
  -[CarNavigationGuidanceSign _heightForCompressionStage:isMaximumCompression:](self, "_heightForCompressionStage:isMaximumCompression:", 0, &v27);
  v17 = v16;
  v15 = 0;
  do
  {
    if (v17 < v12)
      break;
    -[CarNavigationGuidanceSign _heightForCompressionStage:isMaximumCompression:](self, "_heightForCompressionStage:isMaximumCompression:", ++v15, &v27);
    v17 = v18;
  }
  while (!v27);
  v19 = sub_10043341C();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v21 = sub_10029A24C(-[CarNavigationGuidanceSign destination](self, "destination"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = -[CarNavigationGuidanceSign compressionStage](self, "compressionStage");
    v40.width = v10;
    v40.height = v12;
    v24 = NSStringFromCGSize(v40);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    *(_DWORD *)buf = 138413570;
    v29 = v22;
    v30 = 2048;
    v31 = self;
    v32 = 2048;
    v33 = v23;
    v34 = 2048;
    v35 = v15;
    v36 = 2112;
    v37 = v25;
    v38 = 2048;
    v39 = v17;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%@ navSign: %p, _desiredCompressionStage. before: %lu, after: %lu. availableSize: %@, final used height: %.1f", buf, 0x3Eu);

  }
  return v15;
}

- (void)setLayoutType:(unint64_t)a3
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;

  if (-[CarNavigationGuidanceSign layoutType](self, "layoutType") != a3)
  {
    self->_layoutType = a3;
    v5 = sub_10043341C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = sub_10029A24C(-[CarNavigationGuidanceSign destination](self, "destination"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v9 = sub_100ABF438(-[CarNavigationGuidanceSign layoutType](self, "layoutType"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v17 = 138412546;
      v18 = v8;
      v19 = 2112;
      v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%@ navSign layoutType changed to %@. Updating carManeuver views.", (uint8_t *)&v17, 0x16u);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign primaryManeuver](self, "primaryManeuver"));
    objc_msgSend(v11, "setLayoutType:", -[CarNavigationGuidanceSign layoutType](self, "layoutType"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign nextPrimaryManeuver](self, "nextPrimaryManeuver"));
    objc_msgSend(v12, "setLayoutType:", -[CarNavigationGuidanceSign layoutType](self, "layoutType"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign secondaryManeuver](self, "secondaryManeuver"));
    objc_msgSend(v13, "setLayoutType:", -[CarNavigationGuidanceSign layoutType](self, "layoutType"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign nextSecondaryManeuver](self, "nextSecondaryManeuver"));
    objc_msgSend(v14, "setLayoutType:", -[CarNavigationGuidanceSign layoutType](self, "layoutType"));

    if ((id)-[CarNavigationGuidanceSign layoutType](self, "layoutType") == (id)1)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign secondaryManeuverView](self, "secondaryManeuverView"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign primaryManeuverView](self, "primaryManeuverView"));
      objc_msgSend(v15, "alignSubviewsTo:", v16);

    }
  }
}

- (unint64_t)_primaryManeuverViewVariant
{
  return (id)-[CarNavigationGuidanceSign signStyle](self, "signStyle") == (id)1;
}

- (void)updateWithGroupAnimation:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  NSMutableArray *v15;
  NSMutableArray *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  NSMutableArray *v19;
  NSMutableArray *v20;
  NSMutableArray *v21;
  _QWORD v22[5];
  NSMutableArray *v23;
  NSMutableArray *v24;
  NSMutableArray *v25;
  uint8_t buf[4];
  CarNavigationGuidanceSign *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;

  v4 = a3;
  v5 = objc_opt_new(NSMutableArray);
  v6 = objc_opt_new(NSMutableArray);
  v7 = objc_opt_new(NSMutableArray);
  v8 = sub_10043341C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign primaryManeuver](self, "primaryManeuver"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign primaryManeuver](self, "primaryManeuver"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "guidance"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "signID"));
    *(_DWORD *)buf = 134218498;
    v27 = self;
    v28 = 2112;
    v29 = v10;
    v30 = 2112;
    v31 = v13;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%p: updateWithGroupAnimation in primary sign %@ (%@)", buf, 0x20u);

  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1006C59C8;
  v22[3] = &unk_1011AF1B0;
  v22[4] = self;
  v23 = v7;
  v24 = v5;
  v25 = v6;
  v17[4] = self;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1006C696C;
  v18[3] = &unk_1011AF1B0;
  v18[4] = self;
  v19 = v24;
  v20 = v25;
  v21 = v23;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1006C6B10;
  v17[3] = &unk_1011AE8F8;
  v14 = v23;
  v15 = v25;
  v16 = v24;
  objc_msgSend(v4, "addPreparation:animations:completion:", v22, v18, v17);

}

- (double)availableWidth
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign sizeProvider](self, "sizeProvider"));
  objc_msgSend(v2, "availableSize");
  v4 = v3;

  return v4;
}

- (double)dynamicPointScaleValue
{
  double result;

  if ((id)-[CarNavigationGuidanceSign destination](self, "destination") != (id)2)
    return 1.0;
  -[CarNavigationGuidanceSign _car_dynamicPointScaleValue](self, "_car_dynamicPointScaleValue");
  return result;
}

- (void)_handleCarScreenSizeChange
{
  id v3;
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  CarNavigationGuidanceSign *v11;

  v3 = sub_10043341C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = sub_10029A24C(-[CarNavigationGuidanceSign destination](self, "destination"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v8 = 138412546;
    v9 = v6;
    v10 = 2048;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%@ navSign: %p, _handleCarScreenSizeChange", (uint8_t *)&v8, 0x16u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationGuidanceSign sizeProvider](self, "sizeProvider"));
  -[CarNavigationGuidanceSign setLayoutType:](self, "setLayoutType:", objc_msgSend(v7, "maneuverViewLayoutType"));

}

- (NSString)description
{
  NSString *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CarNavigationGuidanceSign;
  v3 = -[CarNavigationGuidanceSign description](&v9, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = sub_10029A24C(-[CarNavigationGuidanceSign destination](self, "destination"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v6));

  return (NSString *)v7;
}

- (UILayoutGuide)minimumCompressedContentLayoutGuide
{
  return self->_minimumCompressedContentLayoutGuide;
}

- (CarGuidanceCardSizeProviding)sizeProvider
{
  return (CarGuidanceCardSizeProviding *)objc_loadWeakRetained((id *)&self->_sizeProvider);
}

- (void)setSizeProvider:(id)a3
{
  objc_storeWeak((id *)&self->_sizeProvider, a3);
}

- (int64_t)signStyle
{
  return self->_signStyle;
}

- (NavSignManeuverGuidanceInfo)primaryGuidance
{
  return self->_primaryGuidance;
}

- (NavSignManeuverGuidanceInfo)secondaryGuidance
{
  return self->_secondaryGuidance;
}

- (NavSignLaneGuidanceInfo)laneGuidanceInfo
{
  return self->_laneGuidanceInfo;
}

- (void)setLaneGuidanceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_laneGuidanceInfo, a3);
}

- (NavJunctionViewInfo)junctionViewInfo
{
  return self->_junctionViewInfo;
}

- (GuidanceETA)latestETA
{
  return self->_latestETA;
}

- (void)setLatestETA:(id)a3
{
  objc_storeStrong((id *)&self->_latestETA, a3);
}

- (UIView)primaryView
{
  return self->_primaryView;
}

- (void)setPrimaryView:(id)a3
{
  objc_storeStrong((id *)&self->_primaryView, a3);
}

- (NSArray)primaryViewOnlyConstraints
{
  return self->_primaryViewOnlyConstraints;
}

- (void)setPrimaryViewOnlyConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_primaryViewOnlyConstraints, a3);
}

- (CarHairlineView)hairlineView
{
  return self->_hairlineView;
}

- (void)setHairlineView:(id)a3
{
  objc_storeStrong((id *)&self->_hairlineView, a3);
}

- (UIView)secondaryView
{
  return self->_secondaryView;
}

- (void)setSecondaryView:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryView, a3);
}

- (NSArray)secondaryViewConstraints
{
  return self->_secondaryViewConstraints;
}

- (void)setSecondaryViewConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryViewConstraints, a3);
}

- (NSLayoutConstraint)secondaryViewHeightConstraint
{
  return self->_secondaryViewHeightConstraint;
}

- (void)setSecondaryViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryViewHeightConstraint, a3);
}

- (CarManeuverView)primaryManeuver
{
  return self->_primaryManeuver;
}

- (NSArray)primaryManeuverConstraints
{
  return self->_primaryManeuverConstraints;
}

- (void)setPrimaryManeuverConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_primaryManeuverConstraints, a3);
}

- (CarManeuverView)secondaryManeuver
{
  return self->_secondaryManeuver;
}

- (void)setSecondaryManeuver:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryManeuver, a3);
}

- (NSArray)secondaryManeuverConstraints
{
  return self->_secondaryManeuverConstraints;
}

- (void)setSecondaryManeuverConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryManeuverConstraints, a3);
}

- (NavJunctionViewController)junctionViewController
{
  return self->_junctionViewController;
}

- (void)setJunctionViewController:(id)a3
{
  objc_storeStrong((id *)&self->_junctionViewController, a3);
}

- (NSArray)junctionViewConstraints
{
  return self->_junctionViewConstraints;
}

- (void)setJunctionViewConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_junctionViewConstraints, a3);
}

- (CarManeuverView)nextPrimaryManeuver
{
  return self->_nextPrimaryManeuver;
}

- (CarManeuverView)nextSecondaryManeuver
{
  return self->_nextSecondaryManeuver;
}

- (void)setNextSecondaryManeuver:(id)a3
{
  objc_storeStrong((id *)&self->_nextSecondaryManeuver, a3);
}

- (NSUUID)primaryGuidanceSignID
{
  return self->_primaryGuidanceSignID;
}

- (NSUUID)secondaryGuidanceSignID
{
  return self->_secondaryGuidanceSignID;
}

- (NSUUID)laneGuidanceInfoID
{
  return self->_laneGuidanceInfoID;
}

- (void)setLaneGuidanceInfoID:(id)a3
{
  objc_storeStrong((id *)&self->_laneGuidanceInfoID, a3);
}

- (NSUUID)junctionViewInfoID
{
  return self->_junctionViewInfoID;
}

- (void)setJunctionViewInfoID:(id)a3
{
  objc_storeStrong((id *)&self->_junctionViewInfoID, a3);
}

- (double)desiredHeight
{
  return self->_desiredHeight;
}

- (void)setDesiredHeight:(double)a3
{
  self->_desiredHeight = a3;
}

- (unint64_t)compressionStage
{
  return self->_compressionStage;
}

- (BOOL)secondaryViewHidden
{
  return self->_secondaryViewHidden;
}

- (BOOL)junctionViewHidden
{
  return self->_junctionViewHidden;
}

- (BOOL)junctionViewTemporarilyHidden
{
  return self->_junctionViewTemporarilyHidden;
}

- (unint64_t)layoutType
{
  return self->_layoutType;
}

- (unint64_t)destination
{
  return self->_destination;
}

- (void)setDestination:(unint64_t)a3
{
  self->_destination = a3;
}

- (NSLayoutConstraint)minimumCompressedContentLayoutGuideHeightConstraint
{
  return self->_minimumCompressedContentLayoutGuideHeightConstraint;
}

- (void)setMinimumCompressedContentLayoutGuideHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_minimumCompressedContentLayoutGuideHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumCompressedContentLayoutGuideHeightConstraint, 0);
  objc_storeStrong((id *)&self->_junctionViewInfoID, 0);
  objc_storeStrong((id *)&self->_laneGuidanceInfoID, 0);
  objc_storeStrong((id *)&self->_secondaryGuidanceSignID, 0);
  objc_storeStrong((id *)&self->_primaryGuidanceSignID, 0);
  objc_storeStrong((id *)&self->_nextSecondaryManeuver, 0);
  objc_storeStrong((id *)&self->_nextPrimaryManeuver, 0);
  objc_storeStrong((id *)&self->_junctionViewConstraints, 0);
  objc_storeStrong((id *)&self->_junctionViewController, 0);
  objc_storeStrong((id *)&self->_secondaryManeuverConstraints, 0);
  objc_storeStrong((id *)&self->_secondaryManeuver, 0);
  objc_storeStrong((id *)&self->_primaryManeuverConstraints, 0);
  objc_storeStrong((id *)&self->_primaryManeuver, 0);
  objc_storeStrong((id *)&self->_secondaryViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryViewConstraints, 0);
  objc_storeStrong((id *)&self->_secondaryView, 0);
  objc_storeStrong((id *)&self->_hairlineView, 0);
  objc_storeStrong((id *)&self->_primaryViewOnlyConstraints, 0);
  objc_storeStrong((id *)&self->_primaryView, 0);
  objc_storeStrong((id *)&self->_latestETA, 0);
  objc_storeStrong((id *)&self->_junctionViewInfo, 0);
  objc_storeStrong((id *)&self->_laneGuidanceInfo, 0);
  objc_storeStrong((id *)&self->_secondaryGuidance, 0);
  objc_storeStrong((id *)&self->_primaryGuidance, 0);
  objc_destroyWeak((id *)&self->_sizeProvider);
  objc_storeStrong((id *)&self->_minimumCompressedContentLayoutGuide, 0);
}

@end
