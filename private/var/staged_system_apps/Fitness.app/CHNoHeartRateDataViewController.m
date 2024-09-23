@implementation CHNoHeartRateDataViewController

+ (id)heartRateModalNavigationController
{
  CHNoHeartRateDataViewController *v2;
  id v3;

  v2 = -[CHNoHeartRateDataViewController initWithNibName:bundle:]([CHNoHeartRateDataViewController alloc], "initWithNibName:bundle:", 0, 0);
  v3 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v2);

  return v3;
}

- (void)loadView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
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
  id v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  double v33;
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
  id v45;
  double y;
  double width;
  double height;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  void *v59;
  double v60;
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
  id v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  double v95;
  void *v96;
  double v97;
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
  id v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  double v132;
  void *v133;
  double v134;
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
  void *v174;
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
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  objc_super v207;
  _QWORD v208[4];
  _QWORD v209[5];
  _QWORD v210[4];
  _QWORD v211[4];
  _QWORD v212[2];
  _QWORD v213[3];

  v207.receiver = self;
  v207.super_class = (Class)CHNoHeartRateDataViewController;
  -[CHNoHeartRateDataViewController loadView](&v207, "loadView");
  -[CHNoHeartRateDataViewController setUrlRetryCount:](self, "setUrlRetryCount:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "doneTapped:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v6, "setRightBarButtonItem:", v5);

  v7 = objc_alloc_init((Class)UILayoutGuide);
  -[CHNoHeartRateDataViewController setContainerGuide:](self, "setContainerGuide:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController containerGuide](self, "containerGuide"));
  objc_msgSend(v8, "addLayoutGuide:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController containerGuide](self, "containerGuide"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "centerYAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "safeAreaLayoutGuide"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "centerYAnchor"));
  v206 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v14));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController containerGuide](self, "containerGuide"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "safeAreaLayoutGuide"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leadingAnchor"));
  v205 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v19));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController containerGuide](self, "containerGuide"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController view](self, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "safeAreaLayoutGuide"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "trailingAnchor"));
  v204 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v24));

  v213[0] = v206;
  v213[1] = v205;
  v213[2] = v204;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v213, 3));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("info.circle")));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithTextStyle:](UIImageSymbolConfiguration, "configurationWithTextStyle:"));
  v203 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "imageWithSymbolConfiguration:", v27));

  v28 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v203);
  -[CHNoHeartRateDataViewController setIconImageView:](self, "setIconImageView:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController iconImageView](self, "iconImageView"));
  objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController iconImageView](self, "iconImageView"));
  LODWORD(v31) = 1148846080;
  objc_msgSend(v30, "setContentHuggingPriority:forAxis:", 1, v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController iconImageView](self, "iconImageView"));
  LODWORD(v33) = 1148846080;
  objc_msgSend(v32, "setContentCompressionResistancePriority:forAxis:", 1, v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController view](self, "view"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController iconImageView](self, "iconImageView"));
  objc_msgSend(v34, "addSubview:", v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController iconImageView](self, "iconImageView"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "centerXAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController containerGuide](self, "containerGuide"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "centerXAnchor"));
  v202 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v39));

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController iconImageView](self, "iconImageView"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "topAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController containerGuide](self, "containerGuide"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "topAnchor"));
  v201 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v43));

  v212[0] = v202;
  v212[1] = v201;
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v212, 2));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v44);

  v45 = objc_alloc((Class)UILabel);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v49 = objc_msgSend(v45, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[CHNoHeartRateDataViewController setTitleLabel:](self, "setTitleLabel:", v49);

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v50, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v200 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", UIFontTextStyleTitle2, 2, 0));
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v200, 0.0));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v52, "setFont:", v51);

  v53 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v54, "setTextColor:", v53);

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v55, "setAllowsDefaultTighteningForTruncation:", 1);

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v56, "setTextAlignment:", 1);

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController titleLabel](self, "titleLabel"));
  LODWORD(v58) = 1148846080;
  objc_msgSend(v57, "setContentCompressionResistancePriority:forAxis:", 1, v58);

  v59 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController titleLabel](self, "titleLabel"));
  LODWORD(v60) = 1148846080;
  objc_msgSend(v59, "setContentHuggingPriority:forAxis:", 1, v60);

  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "localizedStringForKey:value:table:", CFSTR("HEART_RATE_NO_DATA_MODAL_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v63, "setText:", v62);

  v64 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController view](self, "view"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v64, "addSubview:", v65);

  v66 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController titleLabel](self, "titleLabel"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "centerXAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController containerGuide](self, "containerGuide"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "centerXAnchor"));
  v199 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToAnchor:", v69));

  v70 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController titleLabel](self, "titleLabel"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "firstBaselineAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController iconImageView](self, "iconImageView"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "bottomAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController titleLabel](self, "titleLabel"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "font"));
  objc_msgSend(v75, "_scaledValueForValue:", 44.0);
  v198 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintEqualToAnchor:constant:", v73));

  v76 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController titleLabel](self, "titleLabel"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "leadingAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController containerGuide](self, "containerGuide"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "leadingAnchor"));
  v197 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintGreaterThanOrEqualToAnchor:constant:", v79, 12.0));

  v80 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController titleLabel](self, "titleLabel"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "trailingAnchor"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController containerGuide](self, "containerGuide"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "trailingAnchor"));
  v196 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "constraintGreaterThanOrEqualToAnchor:constant:", v83, -12.0));

  v211[0] = v199;
  v211[1] = v198;
  v211[2] = v197;
  v211[3] = v196;
  v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v211, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v84);

  v85 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[CHNoHeartRateDataViewController setBodyLabel:](self, "setBodyLabel:", v85);

  v86 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController bodyLabel](self, "bodyLabel"));
  objc_msgSend(v86, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v87 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController bodyLabel](self, "bodyLabel"));
  objc_msgSend(v87, "setNumberOfLines:", 0);

  v88 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController bodyLabel](self, "bodyLabel"));
  objc_msgSend(v89, "setFont:", v88);

  v90 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController bodyLabel](self, "bodyLabel"));
  objc_msgSend(v91, "setTextColor:", v90);

  v92 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController bodyLabel](self, "bodyLabel"));
  objc_msgSend(v92, "setAllowsDefaultTighteningForTruncation:", 1);

  v93 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController bodyLabel](self, "bodyLabel"));
  objc_msgSend(v93, "setTextAlignment:", 1);

  v94 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController bodyLabel](self, "bodyLabel"));
  LODWORD(v95) = 1148846080;
  objc_msgSend(v94, "setContentCompressionResistancePriority:forAxis:", 1, v95);

  v96 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController bodyLabel](self, "bodyLabel"));
  LODWORD(v97) = 1148846080;
  objc_msgSend(v96, "setContentHuggingPriority:forAxis:", 1, v97);

  v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "localizedStringForKey:value:table:", CFSTR("HEART_RATE_NO_DATA_MODAL_BODY"), &stru_1007AE1D0, CFSTR("Localizable")));
  v100 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController bodyLabel](self, "bodyLabel"));
  objc_msgSend(v100, "setText:", v99);

  v101 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController view](self, "view"));
  v102 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController bodyLabel](self, "bodyLabel"));
  objc_msgSend(v101, "addSubview:", v102);

  v103 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController bodyLabel](self, "bodyLabel"));
  v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "centerXAnchor"));
  v105 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController containerGuide](self, "containerGuide"));
  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "centerXAnchor"));
  v195 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "constraintEqualToAnchor:", v106));

  v107 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController bodyLabel](self, "bodyLabel"));
  v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "firstBaselineAnchor"));
  v109 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController titleLabel](self, "titleLabel"));
  v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "lastBaselineAnchor"));
  v111 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController bodyLabel](self, "bodyLabel"));
  v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "font"));
  objc_msgSend(v112, "_scaledValueForValue:", 32.0);
  v194 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "constraintEqualToAnchor:constant:", v110));

  v113 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController bodyLabel](self, "bodyLabel"));
  v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "leadingAnchor"));
  v115 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController containerGuide](self, "containerGuide"));
  v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "leadingAnchor"));
  v193 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "constraintEqualToAnchor:constant:", v116, 12.0));

  v117 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController bodyLabel](self, "bodyLabel"));
  v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "trailingAnchor"));
  v119 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController containerGuide](self, "containerGuide"));
  v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "trailingAnchor"));
  v192 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "constraintEqualToAnchor:constant:", v120, -12.0));

  v210[0] = v195;
  v210[1] = v194;
  v210[2] = v193;
  v210[3] = v192;
  v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v210, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v121);

  v122 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[CHNoHeartRateDataViewController setLinkLabel:](self, "setLinkLabel:", v122);

  v123 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController linkLabel](self, "linkLabel"));
  objc_msgSend(v123, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v124 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  v125 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController linkLabel](self, "linkLabel"));
  objc_msgSend(v125, "setFont:", v124);

  v126 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors energyColors](ARUIMetricColors, "energyColors"));
  v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "nonGradientTextColor"));
  v128 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController linkLabel](self, "linkLabel"));
  objc_msgSend(v128, "setTextColor:", v127);

  v129 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController linkLabel](self, "linkLabel"));
  objc_msgSend(v129, "setAllowsDefaultTighteningForTruncation:", 1);

  v130 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController linkLabel](self, "linkLabel"));
  objc_msgSend(v130, "setTextAlignment:", 1);

  v131 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController linkLabel](self, "linkLabel"));
  LODWORD(v132) = 1148846080;
  objc_msgSend(v131, "setContentCompressionResistancePriority:forAxis:", 1, v132);

  v133 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController linkLabel](self, "linkLabel"));
  LODWORD(v134) = 1148846080;
  objc_msgSend(v133, "setContentHuggingPriority:forAxis:", 1, v134);

  v135 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "localizedStringForKey:value:table:", CFSTR("HEART_RATE_KB_LINK_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));
  v137 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController linkLabel](self, "linkLabel"));
  objc_msgSend(v137, "setText:", v136);

  v138 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController view](self, "view"));
  v139 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController linkLabel](self, "linkLabel"));
  objc_msgSend(v138, "addSubview:", v139);

  v140 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController linkLabel](self, "linkLabel"));
  v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "centerXAnchor"));
  v142 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController containerGuide](self, "containerGuide"));
  v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "centerXAnchor"));
  v191 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "constraintEqualToAnchor:", v143));

  v144 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController linkLabel](self, "linkLabel"));
  v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "firstBaselineAnchor"));
  v146 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController bodyLabel](self, "bodyLabel"));
  v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "lastBaselineAnchor"));
  v148 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController linkLabel](self, "linkLabel"));
  v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "font"));
  objc_msgSend(v149, "_scaledValueForValue:", 30.0);
  v190 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "constraintEqualToAnchor:constant:", v147));

  v150 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController linkLabel](self, "linkLabel"));
  v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "lastBaselineAnchor"));
  v152 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController containerGuide](self, "containerGuide"));
  v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "bottomAnchor"));
  v189 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "constraintEqualToAnchor:", v153));

  v154 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController linkLabel](self, "linkLabel"));
  v155 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v154, "leadingAnchor"));
  v156 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController containerGuide](self, "containerGuide"));
  v157 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v156, "leadingAnchor"));
  v158 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v155, "constraintGreaterThanOrEqualToAnchor:constant:", v157, 12.0));

  v159 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController linkLabel](self, "linkLabel"));
  v160 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v159, "trailingAnchor"));
  v161 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController containerGuide](self, "containerGuide"));
  v162 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v161, "trailingAnchor"));
  v163 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v160, "constraintGreaterThanOrEqualToAnchor:constant:", v162, -12.0));

  v209[0] = v191;
  v209[1] = v190;
  v209[2] = v189;
  v209[3] = v158;
  v209[4] = v163;
  v164 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v209, 5));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v164);

  v165 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
  -[CHNoHeartRateDataViewController setLinkButton:](self, "setLinkButton:", v165);

  v166 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController linkButton](self, "linkButton"));
  objc_msgSend(v166, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v167 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController linkButton](self, "linkButton"));
  objc_msgSend(v167, "addTarget:action:forControlEvents:", self, "kbLinkTapped:", 64);

  v168 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController view](self, "view"));
  v169 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController linkButton](self, "linkButton"));
  objc_msgSend(v168, "addSubview:", v169);

  v170 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController linkButton](self, "linkButton"));
  v171 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v170, "centerXAnchor"));
  v172 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController linkLabel](self, "linkLabel"));
  v173 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v172, "centerXAnchor"));
  v174 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v171, "constraintEqualToAnchor:", v173));

  v175 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController linkButton](self, "linkButton"));
  v176 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v175, "centerYAnchor"));
  v177 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController linkLabel](self, "linkLabel"));
  v178 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v177, "centerYAnchor"));
  v179 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v176, "constraintEqualToAnchor:", v178));

  v180 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController linkButton](self, "linkButton"));
  v181 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v180, "heightAnchor"));
  v182 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v181, "constraintEqualToConstant:", 44.0));

  v183 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController linkButton](self, "linkButton"));
  v184 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "widthAnchor"));
  v185 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController containerGuide](self, "containerGuide"));
  v186 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v185, "widthAnchor"));
  v187 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v184, "constraintEqualToAnchor:constant:", v186, -24.0));

  v208[0] = v174;
  v208[1] = v179;
  v208[2] = v182;
  v208[3] = v187;
  v188 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v208, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v188);

}

- (id)_constructKBURLWithLocale:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = objc_alloc_init((Class)NSURLComponents);
  objc_msgSend(v4, "setScheme:", CFSTR("https"));
  objc_msgSend(v4, "setHost:", CFSTR("support.apple.com"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localeIdentifier"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lowercaseString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-")));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/%@/%@"), v7, CFSTR("HT204666")));
  objc_msgSend(v4, "setPath:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));
  return v9;
}

- (void)doneTapped:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController navigationController](self, "navigationController", a3));
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_openKBURLWithRetry
{
  void *v3;
  Block_layout *v4;
  _QWORD v5[5];

  if (-[CHNoHeartRateDataViewController urlRetryCount](self, "urlRetryCount") > 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale localeWithLocaleIdentifier:](NSLocale, "localeWithLocaleIdentifier:", CFSTR("en_US")));
    v4 = &stru_100778DF0;
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10007D820;
    v5[3] = &unk_100778DB0;
    v5[4] = self;
    v4 = (Block_layout *)v5;
  }
  -[CHNoHeartRateDataViewController _openKBURLWithLocale:completionHandler:](self, "_openKBURLWithLocale:completionHandler:", v3, v4);

  -[CHNoHeartRateDataViewController setUrlRetryCount:](self, "setUrlRetryCount:", (char *)-[CHNoHeartRateDataViewController urlRetryCount](self, "urlRetryCount") + 1);
}

- (void)_openKBURLWithLocale:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHNoHeartRateDataViewController _constructKBURLWithLocale:](self, "_constructKBURLWithLocale:", v7));

  objc_msgSend(v9, "openURL:withCompletionHandler:", v8, v6);
}

- (UILayoutGuide)containerGuide
{
  return self->_containerGuide;
}

- (void)setContainerGuide:(id)a3
{
  objc_storeStrong((id *)&self->_containerGuide, a3);
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)bodyLabel
{
  return self->_bodyLabel;
}

- (void)setBodyLabel:(id)a3
{
  objc_storeStrong((id *)&self->_bodyLabel, a3);
}

- (UILabel)linkLabel
{
  return self->_linkLabel;
}

- (void)setLinkLabel:(id)a3
{
  objc_storeStrong((id *)&self->_linkLabel, a3);
}

- (UIButton)linkButton
{
  return self->_linkButton;
}

- (void)setLinkButton:(id)a3
{
  objc_storeStrong((id *)&self->_linkButton, a3);
}

- (int64_t)urlRetryCount
{
  return self->_urlRetryCount;
}

- (void)setUrlRetryCount:(int64_t)a3
{
  self->_urlRetryCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkButton, 0);
  objc_storeStrong((id *)&self->_linkLabel, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_containerGuide, 0);
}

@end
