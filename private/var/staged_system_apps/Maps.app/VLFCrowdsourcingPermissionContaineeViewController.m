@implementation VLFCrowdsourcingPermissionContaineeViewController

- (VLFCrowdsourcingPermissionContaineeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;
  id v6;
  VLFCrowdsourcingPermissionContaineeViewController *result;

  v5 = a3;
  v6 = a4;
  result = (VLFCrowdsourcingPermissionContaineeViewController *)+[NSException raise:format:](NSException, "raise:format:", CFSTR("MethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (VLFCrowdsourcingPermissionContaineeViewController)initWithCoder:(id)a3
{
  id v3;
  VLFCrowdsourcingPermissionContaineeViewController *result;

  v3 = a3;
  result = (VLFCrowdsourcingPermissionContaineeViewController *)+[NSException raise:format:](NSException, "raise:format:", CFSTR("MethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (VLFCrowdsourcingPermissionContaineeViewController)init
{
  VLFCrowdsourcingPermissionContaineeViewController *result;

  result = (VLFCrowdsourcingPermissionContaineeViewController *)+[NSException raise:format:](NSException, "raise:format:", CFSTR("MethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (VLFCrowdsourcingPermissionContaineeViewController)initWithCompletion:(id)a3
{
  id v4;
  VLFCrowdsourcingPermissionContaineeViewController *v5;
  id v6;
  NSObject *v7;
  id v8;
  id completion;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;
  uint8_t buf[4];
  VLFCrowdsourcingPermissionContaineeViewController *v18;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VLFCrowdsourcingPermissionContaineeViewController;
  v5 = -[VLFCrowdsourcingPermissionContaineeViewController initWithNibName:bundle:](&v16, "initWithNibName:bundle:", 0, 0);
  if (v5)
  {
    v6 = sub_1002AD0D8();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    v8 = objc_msgSend(v4, "copy");
    completion = v5->_completion;
    v5->_completion = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v5, "cardPresentationController"));
    objc_msgSend(v10, "setHideGrabber:", 1);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v5, "cardPresentationController"));
    objc_msgSend(v11, "setAllowsSwipeToDismiss:", 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v5, "cardPresentationController"));
    objc_msgSend(v12, "setPresentedModally:", 1);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v5, "cardPresentationController"));
    objc_msgSend(v13, "setEdgeAttachedRegularHeightDimmingBehavior:", 2);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v5, "cardPresentationController"));
    objc_msgSend(v14, "setTakesAvailableHeight:", 1);

  }
  return v5;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  VLFCrowdsourcingPermissionContaineeViewController *v7;

  v3 = sub_1002AD0D8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)VLFCrowdsourcingPermissionContaineeViewController;
  -[VLFCrowdsourcingPermissionContaineeViewController dealloc](&v5, "dealloc");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
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
  double v13;
  void *v14;
  double v15;
  id v16;
  double y;
  double width;
  double height;
  double v20;
  double v21;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
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
  id v52;
  void *v53;
  void *v54;
  double v55;
  void *v56;
  double v57;
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
  id v79;
  void *v80;
  void *v81;
  double v82;
  void *v83;
  double v84;
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
  double v106;
  void *v107;
  double v108;
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
  id v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  id v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  double v148;
  void *v149;
  double v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  double v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  double v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  double v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  id v277;
  id v278;
  void *v279;
  id v280;
  _QWORD v281[4];
  id v282;
  _QWORD v283[4];
  id v284;
  _QWORD v285[4];
  id v286;
  id location;
  objc_super v288;
  _QWORD v289[6];
  _QWORD v290[4];
  _QWORD v291[4];
  _QWORD v292[3];
  _QWORD v293[4];
  _QWORD v294[3];
  _QWORD v295[3];
  _QWORD v296[4];
  _QWORD v297[5];
  _QWORD v298[3];
  void *v299;

  v288.receiver = self;
  v288.super_class = (Class)VLFCrowdsourcingPermissionContaineeViewController;
  -[ContaineeViewController viewDidLoad](&v288, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  objc_msgSend(v3, "removeFromSuperview");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v7));
  v299 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v299, 1));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("TeachableMomentCardBackgoundColor")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  objc_msgSend(v11, "setBackgroundColor:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  LODWORD(v13) = 1148846080;
  objc_msgSend(v12, "setContentCompressionResistancePriority:forAxis:", 1, v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  LODWORD(v15) = 1148846080;
  objc_msgSend(v14, "setContentHuggingPriority:forAxis:", 1, v15);

  v16 = objc_alloc((Class)UIScrollView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v278 = objc_msgSend(v16, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  objc_msgSend(v278, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v20) = 1148846080;
  objc_msgSend(v278, "setContentCompressionResistancePriority:forAxis:", 1, v20);
  LODWORD(v21) = 1148846080;
  objc_msgSend(v278, "setContentHuggingPriority:forAxis:", 1, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  objc_msgSend(v22, "addSubview:", v278);

  v275 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v278, "leadingAnchor"));
  v279 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v266 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v279, "leadingAnchor"));
  v258 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v275, "constraintEqualToAnchor:", v266));
  v298[0] = v258;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v278, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "trailingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v25));
  v298[1] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v278, "topAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "topAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v29));
  v298[2] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v298, 3));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v31);

  v280 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  objc_msgSend(v280, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v278, "addSubview:", v280);
  v276 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v280, "leadingAnchor"));
  v267 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v278, "leadingAnchor"));
  v259 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v276, "constraintEqualToAnchor:", v267));
  v297[0] = v259;
  v251 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v280, "trailingAnchor"));
  v245 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v278, "trailingAnchor"));
  v239 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v251, "constraintEqualToAnchor:", v245));
  v297[1] = v239;
  v234 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v280, "topAnchor"));
  v229 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v278, "topAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v234, "constraintEqualToAnchor:", v229));
  v297[2] = v32;
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v280, "bottomAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v278, "bottomAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v34));
  v297[3] = v35;
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v280, "widthAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "widthAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v38));
  v297[4] = v39;
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v297, 5));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v40);

  v41 = objc_alloc((Class)UIImageView);
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("arkit")));
  v277 = objc_msgSend(v41, "initWithImage:", v42);

  objc_msgSend(v277, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v280, "addSubview:", v277);
  v268 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v277, "centerXAnchor"));
  v260 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v280, "centerXAnchor"));
  v252 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v268, "constraintEqualToAnchor:", v260));
  v296[0] = v252;
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v277, "topAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v280, "topAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:constant:", v44, 30.0));
  v296[1] = v45;
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v277, "widthAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v277, "heightAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v47));
  v296[2] = v48;
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v277, "heightAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToConstant:", 80.0));
  v296[3] = v50;
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v296, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v51);

  v52 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[VLFCrowdsourcingPermissionContaineeViewController setTitleLabel:](self, "setTitleLabel:", v52);

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v53, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController titleLabel](self, "titleLabel"));
  LODWORD(v55) = 1148846080;
  objc_msgSend(v54, "setContentCompressionResistancePriority:forAxis:", 1, v55);

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController titleLabel](self, "titleLabel"));
  LODWORD(v57) = 1148846080;
  objc_msgSend(v56, "setContentHuggingPriority:forAxis:", 1, v57);

  v58 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v58, "setNumberOfLines:", 0);

  v59 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v60, "setTextColor:", v59);

  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "localizedStringForKey:value:table:", CFSTR("[VLF Crowdsourcing] permission card title"), CFSTR("localized string not found"), 0));
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v63, "setText:", v62);

  v64 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v64, "setTextAlignment:", 1);

  v65 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController titleLabel](self, "titleLabel"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "firstBaselineAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v277, "bottomAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:constant:", v67, 30.0));
  -[VLFCrowdsourcingPermissionContaineeViewController setTitleLabelBaselineConstraint:](self, "setTitleLabelBaselineConstraint:", v68);

  v69 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v280, "addSubview:", v69);

  v269 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController titleLabel](self, "titleLabel"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v269, "leadingAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v280, "leadingAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToAnchor:constant:", v71, 24.0));
  v295[0] = v72;
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController titleLabel](self, "titleLabel"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "trailingAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v280, "trailingAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToAnchor:constant:", v75, -24.0));
  v295[1] = v76;
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController titleLabelBaselineConstraint](self, "titleLabelBaselineConstraint"));
  v295[2] = v77;
  v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v295, 3));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v78);

  v79 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[VLFCrowdsourcingPermissionContaineeViewController setDescriptionLabel:](self, "setDescriptionLabel:", v79);

  v80 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController descriptionLabel](self, "descriptionLabel"));
  objc_msgSend(v80, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v81 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController descriptionLabel](self, "descriptionLabel"));
  LODWORD(v82) = 1148846080;
  objc_msgSend(v81, "setContentCompressionResistancePriority:forAxis:", 1, v82);

  v83 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController descriptionLabel](self, "descriptionLabel"));
  LODWORD(v84) = 1148846080;
  objc_msgSend(v83, "setContentHuggingPriority:forAxis:", 1, v84);

  v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "localizedStringForKey:value:table:", CFSTR("[VLF Crowdsourcing] permission card description"), CFSTR("localized string not found"), 0));
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController descriptionLabel](self, "descriptionLabel"));
  objc_msgSend(v87, "setText:", v86);

  v88 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController descriptionLabel](self, "descriptionLabel"));
  objc_msgSend(v89, "setTextColor:", v88);

  v90 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController descriptionLabel](self, "descriptionLabel"));
  objc_msgSend(v90, "setTextAlignment:", 1);

  v91 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController descriptionLabel](self, "descriptionLabel"));
  objc_msgSend(v91, "setNumberOfLines:", 0);

  v92 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController descriptionLabel](self, "descriptionLabel"));
  objc_msgSend(v280, "addSubview:", v92);

  v270 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController descriptionLabel](self, "descriptionLabel"));
  v261 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v270, "leadingAnchor"));
  v253 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v280, "leadingAnchor"));
  v246 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v261, "constraintEqualToAnchor:constant:", v253, 24.0));
  v294[0] = v246;
  v240 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController descriptionLabel](self, "descriptionLabel"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v240, "trailingAnchor"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v280, "trailingAnchor"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintEqualToAnchor:constant:", v94, -24.0));
  v294[1] = v95;
  v96 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController descriptionLabel](self, "descriptionLabel"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "topAnchor"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController titleLabel](self, "titleLabel"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "bottomAnchor"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "constraintEqualToAnchor:constant:", v99, 16.0));
  v294[2] = v100;
  v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v294, 3));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v101);

  objc_initWeak(&location, self);
  v285[0] = _NSConcreteStackBlock;
  v285[1] = 3221225472;
  v285[2] = sub_1002AF0A0;
  v285[3] = &unk_1011AF8A0;
  objc_copyWeak(&v286, &location);
  v102 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v285));
  v103 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:primaryAction:](UIButton, "buttonWithType:primaryAction:", 1, v102));
  -[VLFCrowdsourcingPermissionContaineeViewController setLearnMoreButton:](self, "setLearnMoreButton:", v103);

  v104 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController learnMoreButton](self, "learnMoreButton"));
  objc_msgSend(v104, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v105 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController learnMoreButton](self, "learnMoreButton"));
  LODWORD(v106) = 1148846080;
  objc_msgSend(v105, "setContentCompressionResistancePriority:forAxis:", 1, v106);

  v107 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController learnMoreButton](self, "learnMoreButton"));
  LODWORD(v108) = 1148846080;
  objc_msgSend(v107, "setContentHuggingPriority:forAxis:", 1, v108);

  v109 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController learnMoreButton](self, "learnMoreButton"));
  v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "localizedStringForKey:value:table:", CFSTR("[VLF Crowdsourcing] permission card learn more link"), CFSTR("localized string not found"), 0));
  objc_msgSend(v109, "setTitle:forState:", v111, 0);

  v112 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController learnMoreButton](self, "learnMoreButton"));
  objc_msgSend(v280, "addSubview:", v112);

  v271 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController learnMoreButton](self, "learnMoreButton"));
  v262 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v271, "leadingAnchor"));
  v254 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v280, "leadingAnchor"));
  v247 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v262, "constraintGreaterThanOrEqualToAnchor:constant:", v254, 24.0));
  v293[0] = v247;
  v241 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController learnMoreButton](self, "learnMoreButton"));
  v235 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v241, "trailingAnchor"));
  v230 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v280, "trailingAnchor"));
  v225 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v235, "constraintLessThanOrEqualToAnchor:constant:", v230, -24.0));
  v293[1] = v225;
  v221 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController learnMoreButton](self, "learnMoreButton"));
  v219 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v221, "centerXAnchor"));
  v113 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController descriptionLabel](self, "descriptionLabel"));
  v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "centerXAnchor"));
  v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v219, "constraintEqualToAnchor:", v114));
  v293[2] = v115;
  v116 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController learnMoreButton](self, "learnMoreButton"));
  v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "topAnchor"));
  v118 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController descriptionLabel](self, "descriptionLabel"));
  v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "bottomAnchor"));
  v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "constraintEqualToAnchor:constant:", v119, 16.0));
  v293[3] = v120;
  v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v293, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v121);

  v122 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("person.3.fill")));
  v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "imageWithRenderingMode:", 2));
  v124 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "localizedStringForKey:value:table:", CFSTR("[VLF Crowdsourcing] permission card top info text"), CFSTR("localized string not found"), 0));
  v126 = (void *)objc_claimAutoreleasedReturnValue(+[VLFInfoRowView infoRowWithImage:text:](VLFInfoRowView, "infoRowWithImage:text:", v123, v125));
  -[VLFCrowdsourcingPermissionContaineeViewController setTopRow:](self, "setTopRow:", v126);

  v127 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("camera.viewfinder")));
  v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "imageWithRenderingMode:", 2));
  v129 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "localizedStringForKey:value:table:", CFSTR("[VLF Crowdsourcing] permission card middle info text"), CFSTR("localized string not found"), 0));
  v131 = (void *)objc_claimAutoreleasedReturnValue(+[VLFInfoRowView infoRowWithImage:text:](VLFInfoRowView, "infoRowWithImage:text:", v128, v130));
  -[VLFCrowdsourcingPermissionContaineeViewController setMiddleRow:](self, "setMiddleRow:", v131);

  v132 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("lock.fill")));
  v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "imageWithRenderingMode:", 2));
  v134 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "localizedStringForKey:value:table:", CFSTR("[VLF Crowdsourcing] permission card bottom info text"), CFSTR("localized string not found"), 0));
  v136 = (void *)objc_claimAutoreleasedReturnValue(+[VLFInfoRowView infoRowWithImage:text:](VLFInfoRowView, "infoRowWithImage:text:", v133, v135));
  -[VLFCrowdsourcingPermissionContaineeViewController setBottomRow:](self, "setBottomRow:", v136);

  v137 = objc_alloc((Class)UIStackView);
  v138 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController topRow](self, "topRow"));
  v292[0] = v138;
  v139 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController middleRow](self, "middleRow"));
  v292[1] = v139;
  v140 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController bottomRow](self, "bottomRow"));
  v292[2] = v140;
  v141 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v292, 3));
  v142 = objc_msgSend(v137, "initWithArrangedSubviews:", v141);
  -[VLFCrowdsourcingPermissionContaineeViewController setIconStackView:](self, "setIconStackView:", v142);

  v143 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController iconStackView](self, "iconStackView"));
  objc_msgSend(v143, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v144 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController iconStackView](self, "iconStackView"));
  objc_msgSend(v144, "setAxis:", 1);

  v145 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController iconStackView](self, "iconStackView"));
  objc_msgSend(v145, "setAlignment:", 0);

  v146 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController iconStackView](self, "iconStackView"));
  objc_msgSend(v146, "setSpacing:", 26.0);

  v147 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController iconStackView](self, "iconStackView"));
  LODWORD(v148) = 1148846080;
  objc_msgSend(v147, "setContentCompressionResistancePriority:forAxis:", 1, v148);

  v149 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController iconStackView](self, "iconStackView"));
  LODWORD(v150) = 1148846080;
  objc_msgSend(v149, "setContentHuggingPriority:forAxis:", 1, v150);

  v151 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController iconStackView](self, "iconStackView"));
  objc_msgSend(v280, "addSubview:", v151);

  v272 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController iconStackView](self, "iconStackView"));
  v263 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v272, "leadingAnchor"));
  v255 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v280, "leadingAnchor"));
  v248 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v263, "constraintEqualToAnchor:constant:", v255, 48.0));
  v291[0] = v248;
  v242 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController iconStackView](self, "iconStackView"));
  v236 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v242, "trailingAnchor"));
  v231 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v280, "trailingAnchor"));
  v226 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v236, "constraintEqualToAnchor:constant:", v231, -48.0));
  v291[1] = v226;
  v222 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController iconStackView](self, "iconStackView"));
  v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v222, "topAnchor"));
  v153 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController learnMoreButton](self, "learnMoreButton"));
  v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v153, "bottomAnchor"));
  v155 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "constraintEqualToAnchor:constant:", v154, 16.0));
  v291[2] = v155;
  v156 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController iconStackView](self, "iconStackView"));
  v157 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v156, "bottomAnchor"));
  v158 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v280, "bottomAnchor"));
  v159 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v157, "constraintLessThanOrEqualToAnchor:", v158));
  v291[3] = v159;
  v160 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v291, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v160);

  v283[0] = _NSConcreteStackBlock;
  v283[1] = 3221225472;
  v283[2] = sub_1002AF18C;
  v283[3] = &unk_1011AF8A0;
  objc_copyWeak(&v284, &location);
  v161 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v283));
  v162 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:primaryAction:](UIButton, "buttonWithType:primaryAction:", 1, v161));
  -[VLFCrowdsourcingPermissionContaineeViewController setAllowButton:](self, "setAllowButton:", v162);

  v163 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController allowButton](self, "allowButton"));
  objc_msgSend(v163, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v164 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController allowButton](self, "allowButton"));
  v165 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v166 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v165, "localizedStringForKey:value:table:", CFSTR("[VLF Crowdsourcing] permission card allow button"), CFSTR("localized string not found"), 0));
  objc_msgSend(v164, "setTitle:forState:", v166, 0);

  v167 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  v168 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController allowButton](self, "allowButton"));
  objc_msgSend(v168, "setBackgroundColor:", v167);

  v169 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController allowButton](self, "allowButton"));
  v170 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v169, "setTitleColor:forState:", v170, 0);

  v171 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController allowButton](self, "allowButton"));
  v172 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v171, "layer"));
  objc_msgSend(v172, "setCornerRadius:", 12.0);

  v173 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController allowButton](self, "allowButton"));
  LODWORD(v174) = 1148846080;
  objc_msgSend(v173, "setContentCompressionResistancePriority:forAxis:", 1, v174);

  v175 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v176 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController allowButton](self, "allowButton"));
  objc_msgSend(v175, "addSubview:", v176);

  v273 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController allowButton](self, "allowButton"));
  v256 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v273, "leadingAnchor"));
  v264 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v249 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v264, "leadingAnchor"));
  v243 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256, "constraintEqualToAnchor:constant:", v249, 24.0));
  v290[0] = v243;
  v237 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController allowButton](self, "allowButton"));
  v227 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v237, "trailingAnchor"));
  v232 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v223 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v232, "trailingAnchor"));
  v177 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v227, "constraintEqualToAnchor:constant:", v223, -24.0));
  v290[1] = v177;
  v178 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController allowButton](self, "allowButton"));
  v179 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v178, "topAnchor"));
  v180 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v278, "bottomAnchor"));
  v181 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v179, "constraintEqualToAnchor:constant:", v180, 24.0));
  v290[2] = v181;
  v182 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController allowButton](self, "allowButton"));
  v183 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v182, "heightAnchor"));
  v184 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "constraintEqualToConstant:", 60.0));
  v290[3] = v184;
  v185 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v290, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v185);

  v281[0] = _NSConcreteStackBlock;
  v281[1] = 3221225472;
  v281[2] = sub_1002AF2D8;
  v281[3] = &unk_1011AF8A0;
  objc_copyWeak(&v282, &location);
  v186 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v281));
  v187 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:primaryAction:](UIButton, "buttonWithType:primaryAction:", 1, v186));
  -[VLFCrowdsourcingPermissionContaineeViewController setDenyButton:](self, "setDenyButton:", v187);

  v188 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController denyButton](self, "denyButton"));
  objc_msgSend(v188, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v189 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController denyButton](self, "denyButton"));
  v190 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v191 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v190, "localizedStringForKey:value:table:", CFSTR("[VLF Crowdsourcing] permission card deny button"), CFSTR("localized string not found"), 0));
  objc_msgSend(v189, "setTitle:forState:", v191, 0);

  v192 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController denyButton](self, "denyButton"));
  v193 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v192, "layer"));
  objc_msgSend(v193, "setCornerRadius:", 12.0);

  v194 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController denyButton](self, "denyButton"));
  LODWORD(v195) = 1148846080;
  objc_msgSend(v194, "setContentCompressionResistancePriority:forAxis:", 1, v195);

  v196 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v197 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController denyButton](self, "denyButton"));
  objc_msgSend(v196, "addSubview:", v197);

  v274 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController denyButton](self, "denyButton"));
  v257 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v274, "leadingAnchor"));
  v265 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v250 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v265, "leadingAnchor"));
  v244 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v257, "constraintEqualToAnchor:constant:", v250, 24.0));
  v289[0] = v244;
  v238 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController denyButton](self, "denyButton"));
  v228 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v238, "trailingAnchor"));
  v233 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v224 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v233, "trailingAnchor"));
  v220 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v228, "constraintEqualToAnchor:constant:", v224, -24.0));
  v289[1] = v220;
  v218 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController denyButton](self, "denyButton"));
  v216 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v218, "topAnchor"));
  v217 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController allowButton](self, "allowButton"));
  v215 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v217, "bottomAnchor"));
  v214 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v216, "constraintEqualToAnchor:constant:", v215, 6.0));
  v289[2] = v214;
  v213 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController denyButton](self, "denyButton"));
  v212 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v213, "heightAnchor"));
  v211 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v212, "constraintEqualToConstant:", 60.0));
  v289[3] = v211;
  v210 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController denyButton](self, "denyButton"));
  v208 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v210, "bottomAnchor"));
  v209 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v198 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v209, "safeAreaLayoutGuide"));
  v199 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v198, "bottomAnchor"));
  LODWORD(v200) = 1148829696;
  v201 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v208, "constraintEqualToAnchor:constant:priority:", v199, 0.0, v200));
  v289[4] = v201;
  v202 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController denyButton](self, "denyButton"));
  v203 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v202, "bottomAnchor"));
  v204 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v205 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v204, "bottomAnchor"));
  v206 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v203, "constraintLessThanOrEqualToAnchor:constant:", v205, -16.0));
  v289[5] = v206;
  v207 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v289, 6));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v207);

  -[VLFCrowdsourcingPermissionContaineeViewController _updateForCurrentState](self, "_updateForCurrentState");
  objc_destroyWeak(&v282);
  objc_destroyWeak(&v284);
  objc_destroyWeak(&v286);
  objc_destroyWeak(&location);

}

- (void)viewDidAppear:(BOOL)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  VLFCrowdsourcingPermissionContaineeViewController *v8;

  v6.receiver = self;
  v6.super_class = (Class)VLFCrowdsourcingPermissionContaineeViewController;
  -[VLFCrowdsourcingPermissionContaineeViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  v4 = sub_1002AD0D8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] VLF Crowdsourcing Permission Card has been shown", buf, 0xCu);
  }

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 45, 75, 0);
  byte_1014D1F80 = 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VLFCrowdsourcingPermissionContaineeViewController;
  -[MapsThemeViewController traitCollectionDidChange:](&v10, "traitCollectionDidChange:", v4);
  v5 = objc_msgSend(v4, "userInterfaceStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController traitCollection](self, "traitCollection"));
  if (v5 == objc_msgSend(v6, "userInterfaceStyle"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController traitCollection](self, "traitCollection"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "preferredContentSizeCategory"));

    if (v7 == v9)
      goto LABEL_6;
  }
  else
  {

  }
  -[VLFCrowdsourcingPermissionContaineeViewController _updateForCurrentState](self, "_updateForCurrentState");
LABEL_6:

}

+ (BOOL)shouldShowPermissionViewController
{
  id v3;
  NSObject *v4;
  const char *v5;
  id v6;
  id v7;
  id v8;
  BOOL v9;
  void *v11;
  char *v12;
  void *v13;
  char *v14;
  int v15;
  id v16;

  if ((GEOVisualLocalizationCrowdsourcingIsSupported(a1, a2) & 1) != 0)
  {
    if ((GEOVisualLocalizationCrowdsourcingIsAllowed() & 1) != 0)
    {
      if (_GEOConfigHasValue(GeoServicesConfig_VLFCrowdsourcingDataCollectionEnabled[0], GeoServicesConfig_VLFCrowdsourcingDataCollectionEnabled[1]))
      {
        v3 = sub_1002AD0D8();
        v4 = objc_claimAutoreleasedReturnValue(v3);
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          v15 = 134349056;
          v16 = a1;
          v5 = "[%{public}p] Not showing VLF Crowdsourcing Permission Card because the user has already made a decision";
LABEL_13:
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, v5, (uint8_t *)&v15, 0xCu);
        }
      }
      else
      {
        if (byte_1014D1F80 != 1)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[PedestrianARSessionUsageTracker sharedInstance](PedestrianARSessionUsageTracker, "sharedInstance"));
          v12 = (char *)objc_msgSend(v11, "numberOfTimesARLocalized");
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[VLFSessionUsageTracker sharedInstance](VLFSessionUsageTracker, "sharedInstance"));
          v14 = &v12[(_QWORD)objc_msgSend(v13, "numberOfTimesVLFLocalized")];
          v9 = (uint64_t)v14 >= GEOConfigGetInteger(MapsConfig_VLFCrowdsourcingPermissionDialogLocalizationCountRequirement, off_1014B48B8);

          return v9;
        }
        v8 = sub_1002AD0D8();
        v4 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          v15 = 134349056;
          v16 = a1;
          v5 = "[%{public}p] Not showing VLF Crowdsourcing Permission Card because the user has already seen the crowdsou"
               "rcing permission card";
          goto LABEL_13;
        }
      }
    }
    else
    {
      v7 = sub_1002AD0D8();
      v4 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v15 = 134349056;
        v16 = a1;
        v5 = "[%{public}p] Not showing VLF Crowdsourcing Permission Card because the feature is not supported for the cur"
             "rent device posture";
        goto LABEL_13;
      }
    }
  }
  else
  {
    v6 = sub_1002AD0D8();
    v4 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v15 = 134349056;
      v16 = a1;
      v5 = "[%{public}p] Not showing VLF Crowdsourcing Permission Card because the feature is not enabled";
      goto LABEL_13;
    }
  }

  return 0;
}

- (void)_updateForCurrentState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
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
  NSString *v44;
  NSComparisonResult v45;
  void *v46;
  double v47;
  id v48;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController traitCollection](self, "traitCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontWithTextStyle:weight:compatibleWithTraitCollection:](UIFont, "_maps_fontWithTextStyle:weight:compatibleWithTraitCollection:", UIFontTextStyleLargeTitle, v3, UIFontWeightBold));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v5, "setFont:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController titleLabel](self, "titleLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "font"));
  objc_msgSend(v7, "capHeight");
  v9 = v8 + 30.0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController titleLabelBaselineConstraint](self, "titleLabelBaselineConstraint"));
  objc_msgSend(v10, "setConstant:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController traitCollection](self, "traitCollection"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", UIFontTextStyleBody, v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v12, 0.0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController descriptionLabel](self, "descriptionLabel"));
  objc_msgSend(v14, "setFont:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController traitCollection](self, "traitCollection"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", UIFontTextStyleBody, v15));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v16, 0.0));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController learnMoreButton](self, "learnMoreButton"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "titleLabel"));
  objc_msgSend(v19, "setFont:", v17);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController traitCollection](self, "traitCollection"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", UIFontTextStyleBody, v20));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v21, 0.0));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController topRow](self, "topRow"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "infoLabel"));
  objc_msgSend(v24, "setFont:", v22);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController traitCollection](self, "traitCollection"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", UIFontTextStyleBody, v25));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v26, 0.0));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController middleRow](self, "middleRow"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "infoLabel"));
  objc_msgSend(v29, "setFont:", v27);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController traitCollection](self, "traitCollection"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", UIFontTextStyleBody, v30));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v31, 0.0));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController bottomRow](self, "bottomRow"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "infoLabel"));
  objc_msgSend(v34, "setFont:", v32);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController traitCollection](self, "traitCollection"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontWithTextStyle:weight:compatibleWithTraitCollection:](UIFont, "_maps_fontWithTextStyle:weight:compatibleWithTraitCollection:", UIFontTextStyleBody, v35, UIFontWeightBold));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController allowButton](self, "allowButton"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "titleLabel"));
  objc_msgSend(v38, "setFont:", v36);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController traitCollection](self, "traitCollection"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontWithTextStyle:weight:compatibleWithTraitCollection:](UIFont, "_maps_fontWithTextStyle:weight:compatibleWithTraitCollection:", UIFontTextStyleBody, v39, UIFontWeightBold));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController denyButton](self, "denyButton"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "titleLabel"));
  objc_msgSend(v42, "setFont:", v40);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController traitCollection](self, "traitCollection"));
  v44 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "preferredContentSizeCategory"));
  v45 = UIContentSizeCategoryCompareToCategory(v44, UIContentSizeCategoryAccessibilityExtraExtraExtraLarge);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCrowdsourcingPermissionContaineeViewController iconStackView](self, "iconStackView"));
  v48 = v46;
  v47 = 52.0;
  if (v45)
    v47 = 26.0;
  objc_msgSend(v46, "setSpacing:", v47);

}

- (int64_t)floatingControlsOptions
{
  return 267;
}

- (void)willChangeContainerStyle:(unint64_t)a3
{
  id v4;
  NSObject *v5;
  int v6;
  VLFCrowdsourcingPermissionContaineeViewController *v7;

  if (a3 > 7 || ((1 << a3) & 0xA3) == 0)
  {
    v4 = sub_1002AD0D8();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 134349056;
      v7 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Layout changed to landscape; dismissing",
        (uint8_t *)&v6,
        0xCu);
    }

    -[ContaineeViewController handleDismissAction:](self, "handleDismissAction:", 0);
  }
}

- (double)heightForLayout:(unint64_t)a3
{
  void *v3;
  double v4;
  double v5;

  if (a3 != 5)
    return -1.0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v3, "availableHeight");
  v5 = v4;

  return v5;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (NSLayoutConstraint)titleLabelBaselineConstraint
{
  return self->_titleLabelBaselineConstraint;
}

- (void)setTitleLabelBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelBaselineConstraint, a3);
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabel, a3);
}

- (UIButton)learnMoreButton
{
  return self->_learnMoreButton;
}

- (void)setLearnMoreButton:(id)a3
{
  objc_storeStrong((id *)&self->_learnMoreButton, a3);
}

- (UIStackView)iconStackView
{
  return self->_iconStackView;
}

- (void)setIconStackView:(id)a3
{
  objc_storeStrong((id *)&self->_iconStackView, a3);
}

- (VLFInfoRowView)topRow
{
  return self->_topRow;
}

- (void)setTopRow:(id)a3
{
  objc_storeStrong((id *)&self->_topRow, a3);
}

- (VLFInfoRowView)middleRow
{
  return self->_middleRow;
}

- (void)setMiddleRow:(id)a3
{
  objc_storeStrong((id *)&self->_middleRow, a3);
}

- (VLFInfoRowView)bottomRow
{
  return self->_bottomRow;
}

- (void)setBottomRow:(id)a3
{
  objc_storeStrong((id *)&self->_bottomRow, a3);
}

- (UIButton)allowButton
{
  return self->_allowButton;
}

- (void)setAllowButton:(id)a3
{
  objc_storeStrong((id *)&self->_allowButton, a3);
}

- (UIButton)denyButton
{
  return self->_denyButton;
}

- (void)setDenyButton:(id)a3
{
  objc_storeStrong((id *)&self->_denyButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_denyButton, 0);
  objc_storeStrong((id *)&self->_allowButton, 0);
  objc_storeStrong((id *)&self->_bottomRow, 0);
  objc_storeStrong((id *)&self->_middleRow, 0);
  objc_storeStrong((id *)&self->_topRow, 0);
  objc_storeStrong((id *)&self->_iconStackView, 0);
  objc_storeStrong((id *)&self->_learnMoreButton, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end
