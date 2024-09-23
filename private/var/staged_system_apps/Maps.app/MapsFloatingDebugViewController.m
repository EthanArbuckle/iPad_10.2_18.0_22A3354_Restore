@implementation MapsFloatingDebugViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MapsFloatingDebugViewController)init
{
  MapsFloatingDebugViewController *v2;
  void *v3;
  PassThroughWindow *v4;
  void *v5;
  PassThroughWindow *v6;
  PassThroughWindow *floatingDebugWindow;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MapsFloatingDebugViewController;
  v2 = -[MapsFloatingDebugViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0, 0);
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "sceneDidActivateNotification:", UISceneDidActivateNotification, 0);

    v4 = [PassThroughWindow alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController windowScene](v2, "windowScene"));
    v6 = -[PassThroughWindow initWithWindowScene:](v4, "initWithWindowScene:", v5);
    floatingDebugWindow = v2->_floatingDebugWindow;
    v2->_floatingDebugWindow = v6;

    -[PassThroughWindow setWindowLevel:](v2->_floatingDebugWindow, "setWindowLevel:", UIHUDWindowLevel);
  }
  return v2;
}

- (void)viewDidLoad
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
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
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  void *v49;
  double v50;
  FloatingDebugIconLabel *v51;
  double y;
  double width;
  double height;
  FloatingDebugIconLabel *v55;
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
  id v69;
  void *v70;
  id v71;
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
  id v83;
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
  UIScrollView *v95;
  void *v96;
  void *v97;
  double v98;
  void *v99;
  double v100;
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
  id v154;
  id v155;
  id v156;
  objc_super v157;
  _QWORD v158[4];
  _QWORD v159[2];
  _QWORD v160[4];
  _QWORD v161[6];

  v157.receiver = self;
  v157.super_class = (Class)MapsFloatingDebugViewController;
  -[MapsFloatingDebugViewController viewDidLoad](&v157, "viewDidLoad");
  v156 = objc_msgSend(objc_alloc((Class)UIPanGestureRecognizer), "initWithTarget:action:", self, "panGestureRecognizerFired:");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController floatingDebugWindow](self, "floatingDebugWindow"));
  objc_msgSend(v3, "addGestureRecognizer:", v156);

  v155 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "tapGestureRecognizerFired:");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController floatingDebugWindow](self, "floatingDebugWindow"));
  objc_msgSend(v4, "addGestureRecognizer:", v155);

  v154 = objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", self, "longPressGestureRecognizerFired:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController floatingDebugWindow](self, "floatingDebugWindow"));
  objc_msgSend(v5, "addGestureRecognizer:", v154);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController floatingDebugWindow](self, "floatingDebugWindow"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController view](self, "view"));
  objc_msgSend(v6, "addSubview:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController view](self, "view"));
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController tintColor](self, "tintColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController view](self, "view"));
  objc_msgSend(v10, "setBackgroundColor:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leadingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "superview"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leadingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v15));
  -[MapsFloatingDebugViewController setLeadingConstraint:](self, "setLeadingConstraint:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController view](self, "view"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "superview"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v21));
  -[MapsFloatingDebugViewController setTopConstraint:](self, "setTopConstraint:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController leadingConstraint](self, "leadingConstraint"));
  LODWORD(v24) = 1148829696;
  objc_msgSend(v23, "setPriority:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController topConstraint](self, "topConstraint"));
  LODWORD(v26) = 1148829696;
  objc_msgSend(v25, "setPriority:", v26);

  -[MapsFloatingDebugViewController initialPosition](self, "initialPosition");
  v28 = v27;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController leadingConstraint](self, "leadingConstraint"));
  objc_msgSend(v29, "setConstant:", v28);

  -[MapsFloatingDebugViewController initialPosition](self, "initialPosition");
  v31 = v30;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController topConstraint](self, "topConstraint"));
  objc_msgSend(v32, "setConstant:", v31);

  v152 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController view](self, "view"));
  v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "topAnchor"));
  v149 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController view](self, "view"));
  v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "superview"));
  v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "safeAreaLayoutGuide"));
  v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "topAnchor"));
  v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "constraintGreaterThanOrEqualToAnchor:", v137));
  v161[0] = v134;
  v132 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController view](self, "view"));
  v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "bottomAnchor"));
  v130 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController view](self, "view"));
  v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "superview"));
  v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "safeAreaLayoutGuide"));
  v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "bottomAnchor"));
  v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "constraintLessThanOrEqualToAnchor:", v123));
  v161[1] = v120;
  v119 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController view](self, "view"));
  v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "leadingAnchor"));
  v118 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController view](self, "view"));
  v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "superview"));
  v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "safeAreaLayoutGuide"));
  v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "leadingAnchor"));
  v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "constraintGreaterThanOrEqualToAnchor:", v114));
  v161[2] = v113;
  v112 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController view](self, "view"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "trailingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController view](self, "view"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "superview"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "safeAreaLayoutGuide"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "trailingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintLessThanOrEqualToAnchor:", v37));
  v161[3] = v38;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController leadingConstraint](self, "leadingConstraint"));
  v161[4] = v39;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController topConstraint](self, "topConstraint"));
  v161[5] = v40;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v161, 6));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v41);

  v42 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", 0);
  -[MapsFloatingDebugViewController setThumbnailImageView:](self, "setThumbnailImageView:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController thumbnailImageView](self, "thumbnailImageView"));
  objc_msgSend(v43, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController thumbnailImageView](self, "thumbnailImageView"));
  objc_msgSend(v45, "setTintColor:", v44);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController thumbnailImageView](self, "thumbnailImageView"));
  objc_msgSend(v46, "setContentMode:", 1);

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController thumbnailImageView](self, "thumbnailImageView"));
  LODWORD(v48) = 1148846080;
  objc_msgSend(v47, "setContentCompressionResistancePriority:forAxis:", 1, v48);

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController thumbnailImageView](self, "thumbnailImageView"));
  LODWORD(v50) = 1148846080;
  objc_msgSend(v49, "setContentCompressionResistancePriority:forAxis:", 0, v50);

  v51 = [FloatingDebugIconLabel alloc];
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v55 = -[FloatingDebugIconLabel initWithFrame:](v51, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[MapsFloatingDebugViewController setThumbnailIconLabel:](self, "setThumbnailIconLabel:", v55);

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController thumbnailIconLabel](self, "thumbnailIconLabel"));
  objc_msgSend(v56, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController thumbnailIconLabel](self, "thumbnailIconLabel"));
  objc_msgSend(v57, "setTextAlignment:", 1);

  v58 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController thumbnailIconLabel](self, "thumbnailIconLabel"));
  objc_msgSend(v59, "setTextColor:", v58);

  v60 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 14.0));
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController thumbnailIconLabel](self, "thumbnailIconLabel"));
  objc_msgSend(v61, "setFont:", v60);

  v62 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController tintColor](self, "tintColor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController thumbnailIconLabel](self, "thumbnailIconLabel"));
  objc_msgSend(v63, "setBackgroundColor:", v62);

  v64 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController thumbnailIconLabel](self, "thumbnailIconLabel"));
  objc_msgSend(v64, "setClipsToBounds:", 1);

  v65 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController iconText](self, "iconText"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController thumbnailIconLabel](self, "thumbnailIconLabel"));
  objc_msgSend(v66, "setText:", v65);

  v67 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController thumbnailIconLabel](self, "thumbnailIconLabel"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "layer"));
  objc_msgSend(v68, "setCornerRadius:", 9.0);

  v69 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[MapsFloatingDebugViewController setGrabberContainerView:](self, "setGrabberContainerView:", v69);

  v70 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController grabberContainerView](self, "grabberContainerView"));
  objc_msgSend(v70, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v71 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  objc_msgSend(v71, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v72 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v71, "setBackgroundColor:", v72);

  v73 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController grabberContainerView](self, "grabberContainerView"));
  objc_msgSend(v73, "addSubview:", v71);

  v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "leadingAnchor"));
  v150 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController grabberContainerView](self, "grabberContainerView"));
  v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "leadingAnchor"));
  v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "constraintEqualToAnchor:constant:", v144, 8.0));
  v160[0] = v141;
  v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "trailingAnchor"));
  v138 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController grabberContainerView](self, "grabberContainerView"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "trailingAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "constraintEqualToAnchor:constant:", v74, -8.0));
  v160[1] = v75;
  v153 = v71;
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "bottomAnchor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController grabberContainerView](self, "grabberContainerView"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "bottomAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "constraintEqualToAnchor:", v78));
  v160[2] = v79;
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "heightAnchor"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "constraintEqualToConstant:", 1.0));
  v160[3] = v81;
  v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v160, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v82);

  v83 = objc_msgSend(objc_alloc((Class)_UIGrabber), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  objc_msgSend(v83, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v84 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v83, "setBackgroundColor:", v84);

  v85 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController grabberContainerView](self, "grabberContainerView"));
  objc_msgSend(v85, "addSubview:", v83);

  v151 = v83;
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "centerXAnchor"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController grabberContainerView](self, "grabberContainerView"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "centerXAnchor"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "constraintEqualToAnchor:", v88));
  v159[0] = v89;
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "centerYAnchor"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController grabberContainerView](self, "grabberContainerView"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "centerYAnchor"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "constraintEqualToAnchor:", v92));
  v159[1] = v93;
  v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v159, 2));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v94);

  v95 = objc_opt_new(UIScrollView);
  -[MapsFloatingDebugViewController setScrollView:](self, "setScrollView:", v95);

  v96 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController scrollView](self, "scrollView"));
  objc_msgSend(v96, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v97 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController scrollView](self, "scrollView"));
  LODWORD(v98) = 1148846080;
  objc_msgSend(v97, "setContentHuggingPriority:forAxis:", 1, v98);

  v99 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController scrollView](self, "scrollView"));
  LODWORD(v100) = 1132068864;
  objc_msgSend(v99, "setContentCompressionResistancePriority:forAxis:", 1, v100);

  v101 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController scrollView](self, "scrollView"));
  v102 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController contentView](self, "contentView"));
  objc_msgSend(v101, "addSubview:", v102);

  v148 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController contentView](self, "contentView"));
  v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "leadingAnchor"));
  v145 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController scrollView](self, "scrollView"));
  v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "leadingAnchor"));
  v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "constraintEqualToAnchor:", v139));
  v158[0] = v136;
  v133 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController contentView](self, "contentView"));
  v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "trailingAnchor"));
  v131 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController scrollView](self, "scrollView"));
  v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "trailingAnchor"));
  v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "constraintEqualToAnchor:", v127));
  v158[1] = v124;
  v122 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController contentView](self, "contentView"));
  v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "topAnchor"));
  v103 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController scrollView](self, "scrollView"));
  v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "topAnchor"));
  v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "constraintEqualToAnchor:", v104));
  v158[2] = v105;
  v106 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController contentView](self, "contentView"));
  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "bottomAnchor"));
  v108 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController scrollView](self, "scrollView"));
  v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "bottomAnchor"));
  v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "constraintEqualToAnchor:", v109));
  v158[3] = v110;
  v111 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v158, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v111);

  -[MapsFloatingDebugViewController updateViewForCurrentState](self, "updateViewForCurrentState");
}

- (UIView)contentView
{
  UIView *contentView;
  UIView *v4;
  UIView *v5;
  double v6;
  double v7;

  contentView = self->_contentView;
  if (!contentView)
  {
    v4 = objc_opt_new(UIView);
    v5 = self->_contentView;
    self->_contentView = v4;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v6) = 1148846080;
    -[UIView setContentCompressionResistancePriority:forAxis:](self->_contentView, "setContentCompressionResistancePriority:forAxis:", 1, v6);
    LODWORD(v7) = 1148846080;
    -[UIView setContentCompressionResistancePriority:forAxis:](self->_contentView, "setContentCompressionResistancePriority:forAxis:", 0, v7);
    contentView = self->_contentView;
  }
  return contentView;
}

- (void)attach
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController floatingDebugWindow](self, "floatingDebugWindow"));
  objc_msgSend(v3, "setHidden:", 0);

  -[MapsFloatingDebugViewController loadViewIfNeeded](self, "loadViewIfNeeded");
}

- (void)detach
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController floatingDebugWindow](self, "floatingDebugWindow"));
  objc_msgSend(v2, "setHidden:", 1);

}

- (BOOL)isAttached
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController floatingDebugWindow](self, "floatingDebugWindow"));
  v3 = objc_msgSend(v2, "isHidden") ^ 1;

  return v3;
}

- (id)windowScene
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_lockScreenSceneDelegate](UIApplication, "_maps_lockScreenSceneDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lockScreenWindow"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "windowScene"));
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_keyMapsSceneDelegate](UIApplication, "_maps_keyMapsSceneDelegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "windowScene"));

  }
  return v6;
}

- (void)toggleState
{
  int64_t v3;
  uint64_t v4;
  _QWORD v5[5];

  v3 = -[MapsFloatingDebugViewController viewState](self, "viewState");
  if (!v3)
  {
    v4 = 1;
    goto LABEL_5;
  }
  if (v3 == 1)
  {
    v4 = 0;
LABEL_5:
    -[MapsFloatingDebugViewController setViewState:](self, "setViewState:", v4);
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1004B5C78;
  v5[3] = &unk_1011AC860;
  v5[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 6, v5, 0, 0.5, 0.0);
}

- (void)updateViewForCurrentState
{
  int64_t v3;
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
  double v31;
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
  void *v52;
  void *v53;
  void *v54;
  void *v55;
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
  _QWORD v113[6];
  _QWORD v114[4];
  _QWORD v115[3];
  _QWORD v116[6];

  v3 = -[MapsFloatingDebugViewController viewState](self, "viewState");
  if (v3 == 1)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController thumbnailImageView](self, "thumbnailImageView"));
    objc_msgSend(v32, "removeFromSuperview");

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController thumbnailIconLabel](self, "thumbnailIconLabel"));
    objc_msgSend(v33, "removeFromSuperview");

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController view](self, "view"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController grabberContainerView](self, "grabberContainerView"));
    objc_msgSend(v34, "addSubview:", v35);

    v111 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController grabberContainerView](self, "grabberContainerView"));
    v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "leadingAnchor"));
    v107 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController view](self, "view"));
    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "leadingAnchor"));
    v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "constraintEqualToAnchor:", v99));
    v114[0] = v95;
    v91 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController grabberContainerView](self, "grabberContainerView"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "trailingAnchor"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController view](self, "view"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "trailingAnchor"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintEqualToAnchor:", v80));
    v114[1] = v77;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController grabberContainerView](self, "grabberContainerView"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "topAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController view](self, "view"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "topAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v39));
    v114[2] = v40;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController grabberContainerView](self, "grabberContainerView"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "heightAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToConstant:", 44.0));
    v114[3] = v43;
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v114, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v44);

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController view](self, "view"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController scrollView](self, "scrollView"));
    objc_msgSend(v45, "addSubview:", v46);

    v112 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController scrollView](self, "scrollView"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "leadingAnchor"));
    v108 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController view](self, "view"));
    v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "leadingAnchor"));
    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "constraintEqualToAnchor:", v100));
    v113[0] = v96;
    v92 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController scrollView](self, "scrollView"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "trailingAnchor"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController view](self, "view"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "trailingAnchor"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "constraintEqualToAnchor:", v83));
    v113[1] = v81;
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController scrollView](self, "scrollView"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "topAnchor"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController grabberContainerView](self, "grabberContainerView"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "bottomAnchor"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToAnchor:", v71));
    v113[2] = v69;
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController scrollView](self, "scrollView"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "bottomAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController view](self, "view"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "bottomAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:", v61));
    v113[3] = v59;
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController contentView](self, "contentView"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "widthAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController view](self, "view"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "widthAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:", v48));
    v113[4] = v49;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController contentView](self, "contentView"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "heightAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController view](self, "view"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "heightAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintGreaterThanOrEqualToAnchor:constant:", v53, -44.0));
    v113[5] = v54;
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v113, 6));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v55);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController view](self, "view"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "layer"));
    v30 = v29;
    v31 = 5.0;
  }
  else
  {
    if (v3)
      return;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController grabberContainerView](self, "grabberContainerView"));
    objc_msgSend(v4, "removeFromSuperview");

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController scrollView](self, "scrollView"));
    objc_msgSend(v5, "removeFromSuperview");

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController view](self, "view"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController thumbnailImageView](self, "thumbnailImageView"));
    objc_msgSend(v6, "addSubview:", v7);

    v109 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController thumbnailImageView](self, "thumbnailImageView"));
    v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "leadingAnchor"));
    v105 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController view](self, "view"));
    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "leadingAnchor"));
    v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "constraintEqualToAnchor:constant:", v97, 5.0));
    v116[0] = v93;
    v90 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController thumbnailImageView](self, "thumbnailImageView"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "trailingAnchor"));
    v87 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController view](self, "view"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "trailingAnchor"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintEqualToAnchor:constant:", v82, -5.0));
    v116[1] = v79;
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController thumbnailImageView](self, "thumbnailImageView"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "topAnchor"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController view](self, "view"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "topAnchor"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintEqualToAnchor:constant:", v70, 5.0));
    v116[2] = v68;
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController thumbnailImageView](self, "thumbnailImageView"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "bottomAnchor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController view](self, "view"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "bottomAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:constant:", v60, -5.0));
    v116[3] = v58;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController thumbnailImageView](self, "thumbnailImageView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "widthAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToConstant:", 34.0));
    v116[4] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController thumbnailImageView](self, "thumbnailImageView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "heightAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController thumbnailImageView](self, "thumbnailImageView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "widthAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:multiplier:", v14, 1.0));
    v116[5] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v116, 6));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController view](self, "view"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController thumbnailIconLabel](self, "thumbnailIconLabel"));
    objc_msgSend(v17, "addSubview:", v18);

    v110 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController thumbnailIconLabel](self, "thumbnailIconLabel"));
    v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "centerXAnchor"));
    v106 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController view](self, "view"));
    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "centerXAnchor"));
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "constraintEqualToAnchor:", v98));
    v115[0] = v94;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController thumbnailIconLabel](self, "thumbnailIconLabel"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "topAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController view](self, "view"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bottomAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22, 5.0));
    v115[1] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController thumbnailIconLabel](self, "thumbnailIconLabel"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "heightAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToConstant:", 18.0));
    v115[2] = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v115, 3));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController view](self, "view"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "layer"));
    v30 = v29;
    v31 = 22.0;
  }
  objc_msgSend(v29, "setCornerRadius:", v31);

}

- (void)updateTintAndIconLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController tintColor](self, "tintColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController tintColor](self, "tintColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController thumbnailIconLabel](self, "thumbnailIconLabel"));
  objc_msgSend(v6, "setBackgroundColor:", v5);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController iconText](self, "iconText"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController thumbnailIconLabel](self, "thumbnailIconLabel"));
  objc_msgSend(v7, "setText:", v8);

}

- (id)tintColor
{
  return 0;
}

- (CGPoint)initialPosition
{
  objc_class *v2;
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  CGPoint v8;
  CGFloat x;
  CGFloat y;
  double v11;
  double v12;
  CGPoint result;

  v2 = (objc_class *)objc_opt_class(self);
  v3 = NSStringFromClass(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), CFSTR("kFloatingDebugViewControllerInitialPositionKeyPrefix"), v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringForKey:", v5));

  if (v7)
  {
    v8 = CGPointFromString(v7);
    x = v8.x;
    y = v8.y;
  }
  else
  {
    x = CGPointZero.x;
    y = CGPointZero.y;
  }

  v11 = x;
  v12 = y;
  result.y = v12;
  result.x = v11;
  return result;
}

- (void)setInitialPosition:(CGPoint)a3
{
  NSString *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = NSStringFromCGPoint(a3);
  v10 = (id)objc_claimAutoreleasedReturnValue(v4);
  v5 = (objc_class *)objc_opt_class(self);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), CFSTR("kFloatingDebugViewControllerInitialPositionKeyPrefix"), v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v9, "setObject:forKey:", v10, v8);

}

- (id)additionalLongPressActions
{
  return 0;
}

- (void)panGestureRecognizerFired:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));
  objc_msgSend(v4, "translationInView:", v6);
  v8 = v7;
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController view](self, "view"));
  objc_msgSend(v11, "frame");
  v13 = v8 + v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController view](self, "view"));
  objc_msgSend(v14, "frame");
  v16 = v10 + v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController leadingConstraint](self, "leadingConstraint"));
  objc_msgSend(v17, "setConstant:", v13);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController topConstraint](self, "topConstraint"));
  objc_msgSend(v18, "setConstant:", v16);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController view](self, "view"));
  objc_msgSend(v4, "setTranslation:inView:", v19, CGPointZero.x, CGPointZero.y);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController contentView](self, "contentView"));
  objc_msgSend(v20, "setNeedsLayout");

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController contentView](self, "contentView"));
  objc_msgSend(v21, "layoutIfNeeded");

  v22 = objc_msgSend(v4, "state");
  if (v22 == (id)3)
    -[MapsFloatingDebugViewController setInitialPosition:](self, "setInitialPosition:", v13, v16);
}

- (void)tapGestureRecognizerFired:(id)a3
{
  -[MapsFloatingDebugViewController toggleState](self, "toggleState", a3);
}

- (void)longPressGestureRecognizerFired:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[5];
  _BYTE v17[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Choose an action"), 0, 0));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1004B6D40;
  v16[3] = &unk_1011AD938;
  v16[4] = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Dismiss foating debug UI"), 0, v16));
  objc_msgSend(v4, "addAction:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController additionalLongPressActions](self, "additionalLongPressActions"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v4, "addAction:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v10));
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v8);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0));
  objc_msgSend(v4, "addAction:", v11);

  -[MapsFloatingDebugViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);
}

- (void)sceneDidActivateNotification:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController windowScene](self, "windowScene", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController floatingDebugWindow](self, "floatingDebugWindow"));
  objc_msgSend(v4, "setWindowScene:", v5);

}

- (int64_t)viewState
{
  return self->_viewState;
}

- (void)setViewState:(int64_t)a3
{
  self->_viewState = a3;
}

- (UIImageView)thumbnailImageView
{
  return self->_thumbnailImageView;
}

- (void)setThumbnailImageView:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailImageView, a3);
}

- (PassThroughWindow)floatingDebugWindow
{
  return self->_floatingDebugWindow;
}

- (void)setFloatingDebugWindow:(id)a3
{
  objc_storeStrong((id *)&self->_floatingDebugWindow, a3);
}

- (NSLayoutConstraint)leadingConstraint
{
  return self->_leadingConstraint;
}

- (void)setLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leadingConstraint, a3);
}

- (NSLayoutConstraint)topConstraint
{
  return self->_topConstraint;
}

- (void)setTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topConstraint, a3);
}

- (UIView)grabberContainerView
{
  return self->_grabberContainerView;
}

- (void)setGrabberContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_grabberContainerView, a3);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (FloatingDebugIconLabel)thumbnailIconLabel
{
  return self->_thumbnailIconLabel;
}

- (void)setThumbnailIconLabel:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailIconLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailIconLabel, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_grabberContainerView, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_floatingDebugWindow, 0);
  objc_storeStrong((id *)&self->_thumbnailImageView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
