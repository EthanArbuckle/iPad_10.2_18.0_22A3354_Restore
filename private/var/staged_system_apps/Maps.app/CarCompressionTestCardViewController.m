@implementation CarCompressionTestCardViewController

- (CarCompressionTestCardViewController)init
{
  CarCompressionTestCardViewController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CarCompressionTestCardViewController;
  result = -[CarCompressionTestCardViewController init](&v3, "init");
  if (result)
  {
    result->_spacerHeight = 0.0;
    result->_spacerPriority = 999.0;
  }
  return result;
}

- (void)viewDidLoad
{
  NSArray *priorities;
  id v4;
  double y;
  double width;
  double height;
  UIView *v8;
  UIView *spacerView;
  double v10;
  double v11;
  void *v12;
  UILabel *v13;
  UILabel *heightLabel;
  void *v15;
  void *v16;
  double v17;
  double v18;
  CarFocusableButton *v19;
  CarFocusableButton *tallerButton;
  void *v21;
  CarFocusableButton *v22;
  CarFocusableButton *shorterButton;
  void *v24;
  double v25;
  CarFocusableButton *v26;
  CarFocusableButton *reloadButton;
  void *v28;
  void *v29;
  void *v30;
  CarFocusableButton *v31;
  CarFocusableButton *priorityButton;
  void *v33;
  CarFocusableButton *v34;
  CarFocusableButton *dismissButton;
  void *v36;
  id v37;
  void *v38;
  CarFocusableButton *v39;
  void *v40;
  CarFocusableButton *v41;
  void *v42;
  CarFocusableButton *v43;
  void *v44;
  id v45;
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
  double v58;
  double v59;
  int v60;
  double v61;
  NSLayoutConstraint *v62;
  NSLayoutConstraint *spacerHeightConstraint;
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
  NSMutableArray *v152;
  objc_super v153;
  _QWORD v154[22];
  _QWORD v155[6];
  _QWORD v156[7];

  v153.receiver = self;
  v153.super_class = (Class)CarCompressionTestCardViewController;
  -[CarCompressionTestCardViewController viewDidLoad](&v153, "viewDidLoad");
  priorities = self->_priorities;
  self->_priorities = (NSArray *)&off_101273AD0;

  v4 = objc_alloc((Class)UIView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v8 = (UIView *)objc_msgSend(v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  spacerView = self->_spacerView;
  self->_spacerView = v8;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_spacerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v10) = 1112014848;
  -[UIView setContentHuggingPriority:forAxis:](self->_spacerView, "setContentHuggingPriority:forAxis:", 1, v10);
  LODWORD(v11) = 1112014848;
  -[UIView setContentHuggingPriority:forAxis:](self->_spacerView, "setContentHuggingPriority:forAxis:", 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarCompressionTestCardViewController view](self, "view"));
  objc_msgSend(v12, "addSubview:", self->_spacerView);

  v13 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  heightLabel = self->_heightLabel;
  self->_heightLabel = v13;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_heightLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 8.0, UIFontWeightSemibold));
  -[UILabel setFont:](self->_heightLabel, "setFont:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_heightLabel, "setTextColor:", v16);

  -[UILabel setTextAlignment:](self->_heightLabel, "setTextAlignment:", 1);
  LODWORD(v17) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_heightLabel, "setContentCompressionResistancePriority:forAxis:", 1, v17);
  LODWORD(v18) = 1112014848;
  -[UILabel setContentHuggingPriority:forAxis:](self->_heightLabel, "setContentHuggingPriority:forAxis:", 1, v18);
  -[UIView addSubview:](self->_spacerView, "addSubview:", self->_heightLabel);
  v19 = (CarFocusableButton *)objc_claimAutoreleasedReturnValue(-[CarCompressionTestCardViewController _buttonWithTitle:](self, "_buttonWithTitle:", CFSTR("▲9")));
  tallerButton = self->_tallerButton;
  self->_tallerButton = v19;

  -[CarFocusableButton addTarget:action:forControlEvents:](self->_tallerButton, "addTarget:action:forControlEvents:", self, "_increaseHeight", 64);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarCompressionTestCardViewController view](self, "view"));
  objc_msgSend(v21, "addSubview:", self->_tallerButton);

  v22 = (CarFocusableButton *)objc_claimAutoreleasedReturnValue(-[CarCompressionTestCardViewController _buttonWithTitle:](self, "_buttonWithTitle:", CFSTR("▼11")));
  shorterButton = self->_shorterButton;
  self->_shorterButton = v22;

  -[CarFocusableButton addTarget:action:forControlEvents:](self->_shorterButton, "addTarget:action:forControlEvents:", self, "_decreaseHeight", 64);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarCompressionTestCardViewController view](self, "view"));
  objc_msgSend(v24, "addSubview:", self->_shorterButton);

  -[CarCompressionTestCardViewController spacerHeight](self, "spacerHeight");
  -[CarFocusableButton setEnabled:](self->_shorterButton, "setEnabled:", v25 > 0.0);
  v26 = (CarFocusableButton *)objc_claimAutoreleasedReturnValue(-[CarCompressionTestCardViewController _buttonWithTitle:](self, "_buttonWithTitle:", CFSTR("⟲")));
  reloadButton = self->_reloadButton;
  self->_reloadButton = v26;

  -[CarFocusableButton addTarget:action:forControlEvents:](self->_reloadButton, "addTarget:action:forControlEvents:", self, "_disappearAndReturn", 64);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarCompressionTestCardViewController view](self, "view"));
  objc_msgSend(v28, "addSubview:", self->_reloadButton);

  -[CarCompressionTestCardViewController spacerPriority](self, "spacerPriority");
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "stringValue"));
  v31 = (CarFocusableButton *)objc_claimAutoreleasedReturnValue(-[CarCompressionTestCardViewController _buttonWithTitle:](self, "_buttonWithTitle:", v30));
  priorityButton = self->_priorityButton;
  self->_priorityButton = v31;

  -[CarFocusableButton addTarget:action:forControlEvents:](self->_priorityButton, "addTarget:action:forControlEvents:", self, "_incrementPriority", 64);
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CarCompressionTestCardViewController view](self, "view"));
  objc_msgSend(v33, "addSubview:", self->_priorityButton);

  v34 = (CarFocusableButton *)objc_claimAutoreleasedReturnValue(-[CarCompressionTestCardViewController _buttonWithTitle:](self, "_buttonWithTitle:", CFSTR("Dismiss")));
  dismissButton = self->_dismissButton;
  self->_dismissButton = v34;

  -[CarFocusableButton addTarget:action:forControlEvents:](self->_dismissButton, "addTarget:action:forControlEvents:", self, "_dismiss", 64);
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[CarCompressionTestCardViewController view](self, "view"));
  objc_msgSend(v36, "addSubview:", self->_dismissButton);

  v37 = objc_alloc((Class)UIStackView);
  v156[0] = self->_tallerButton;
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[CarHairlineView hairlineViewAlongAxis:](CarHairlineView, "hairlineViewAlongAxis:", 1));
  v39 = self->_priorityButton;
  v156[1] = v38;
  v156[2] = v39;
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[CarHairlineView hairlineViewAlongAxis:](CarHairlineView, "hairlineViewAlongAxis:", 1));
  v41 = self->_reloadButton;
  v156[3] = v40;
  v156[4] = v41;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[CarHairlineView hairlineViewAlongAxis:](CarHairlineView, "hairlineViewAlongAxis:", 1));
  v43 = self->_shorterButton;
  v156[5] = v42;
  v156[6] = v43;
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v156, 7));
  v45 = objc_msgSend(v37, "initWithArrangedSubviews:", v44);

  objc_msgSend(v45, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v45, "setAlignment:", 0);
  objc_msgSend(v45, "setDistribution:", 2);
  objc_msgSend(v45, "setAxis:", 0);
  v149 = v45;
  objc_msgSend(v45, "setSpacing:", 0.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[CarCompressionTestCardViewController view](self, "view"));
  objc_msgSend(v46, "addSubview:", v45);

  v151 = (void *)objc_claimAutoreleasedReturnValue(+[CarHairlineView hairlineViewAlongAxis:](CarHairlineView, "hairlineViewAlongAxis:", 0));
  objc_msgSend(v151, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[CarCompressionTestCardViewController view](self, "view"));
  objc_msgSend(v47, "addSubview:", v151);

  v150 = (void *)objc_claimAutoreleasedReturnValue(+[CarHairlineView hairlineViewAlongAxis:](CarHairlineView, "hairlineViewAlongAxis:", 0));
  objc_msgSend(v150, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[CarCompressionTestCardViewController view](self, "view"));
  objc_msgSend(v48, "addSubview:", v150);

  v152 = objc_opt_new(NSMutableArray);
  v147 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_heightLabel, "topAnchor"));
  v144 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_spacerView, "topAnchor"));
  v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "constraintGreaterThanOrEqualToAnchor:", v144));
  v155[0] = v142;
  v139 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_heightLabel, "leadingAnchor"));
  v135 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_spacerView, "leadingAnchor"));
  v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "constraintGreaterThanOrEqualToAnchor:", v135));
  v155[1] = v133;
  v131 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_heightLabel, "trailingAnchor"));
  v129 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_spacerView, "trailingAnchor"));
  v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "constraintLessThanOrEqualToAnchor:", v129));
  v155[2] = v127;
  v125 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_heightLabel, "bottomAnchor"));
  v123 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_spacerView, "bottomAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "constraintLessThanOrEqualToAnchor:", v123));
  v155[3] = v49;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](self->_heightLabel, "centerXAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_spacerView, "centerXAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v51));
  v155[4] = v52;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](self->_heightLabel, "centerYAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_spacerView, "centerYAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v54));
  v155[5] = v55;
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v155, 6));
  -[NSMutableArray addObjectsFromArray:](v152, "addObjectsFromArray:", v56);

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_spacerView, "heightAnchor"));
  -[CarCompressionTestCardViewController spacerHeight](self, "spacerHeight");
  v59 = v58;
  -[CarCompressionTestCardViewController spacerPriority](self, "spacerPriority");
  LODWORD(v61) = v60;
  v62 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToConstant:priority:", v59, v61));
  spacerHeightConstraint = self->_spacerHeightConstraint;
  self->_spacerHeightConstraint = v62;

  v154[0] = self->_spacerHeightConstraint;
  v148 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton widthAnchor](self->_tallerButton, "widthAnchor"));
  v146 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton widthAnchor](self->_shorterButton, "widthAnchor"));
  v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "constraintEqualToAnchor:", v146));
  v154[1] = v145;
  v143 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton widthAnchor](self->_tallerButton, "widthAnchor"));
  v141 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton widthAnchor](self->_reloadButton, "widthAnchor"));
  v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "constraintEqualToAnchor:", v141));
  v154[2] = v140;
  v138 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton widthAnchor](self->_tallerButton, "widthAnchor"));
  v137 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton widthAnchor](self->_priorityButton, "widthAnchor"));
  v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "constraintEqualToAnchor:", v137));
  v154[3] = v136;
  v132 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_spacerView, "topAnchor"));
  v134 = (void *)objc_claimAutoreleasedReturnValue(-[CarCompressionTestCardViewController view](self, "view"));
  v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "topAnchor"));
  v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "constraintEqualToAnchor:", v130));
  v154[4] = v128;
  v124 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leftAnchor](self->_spacerView, "leftAnchor"));
  v126 = (void *)objc_claimAutoreleasedReturnValue(-[CarCompressionTestCardViewController view](self, "view"));
  v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "leftAnchor"));
  v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "constraintEqualToAnchor:", v122));
  v154[5] = v121;
  v119 = (void *)objc_claimAutoreleasedReturnValue(-[UIView rightAnchor](self->_spacerView, "rightAnchor"));
  v120 = (void *)objc_claimAutoreleasedReturnValue(-[CarCompressionTestCardViewController view](self, "view"));
  v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "rightAnchor"));
  v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "constraintEqualToAnchor:", v118));
  v154[6] = v117;
  v116 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_spacerView, "bottomAnchor"));
  v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "topAnchor"));
  v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "constraintEqualToAnchor:", v115));
  v154[7] = v114;
  v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "leftAnchor"));
  v113 = (void *)objc_claimAutoreleasedReturnValue(-[CarCompressionTestCardViewController view](self, "view"));
  v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "leftAnchor"));
  v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "constraintEqualToAnchor:", v111));
  v154[8] = v110;
  v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "rightAnchor"));
  v109 = (void *)objc_claimAutoreleasedReturnValue(-[CarCompressionTestCardViewController view](self, "view"));
  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "rightAnchor"));
  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "constraintEqualToAnchor:", v107));
  v154[9] = v106;
  v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "topAnchor"));
  v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "bottomAnchor"));
  v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "constraintEqualToAnchor:", v104));
  v154[10] = v103;
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "leadingAnchor"));
  v102 = (void *)objc_claimAutoreleasedReturnValue(-[CarCompressionTestCardViewController view](self, "view"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "leadingAnchor"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "constraintEqualToAnchor:", v100));
  v154[11] = v99;
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "trailingAnchor"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(-[CarCompressionTestCardViewController view](self, "view"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "trailingAnchor"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "constraintEqualToAnchor:", v96));
  v154[12] = v95;
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "bottomAnchor"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "topAnchor"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "constraintEqualToAnchor:", v93));
  v154[13] = v92;
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "heightAnchor"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "constraintEqualToConstant:", 20.0));
  v154[14] = v90;
  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "leftAnchor"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[CarCompressionTestCardViewController view](self, "view"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "leftAnchor"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "constraintEqualToAnchor:", v87));
  v154[15] = v86;
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "rightAnchor"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[CarCompressionTestCardViewController view](self, "view"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "rightAnchor"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintEqualToAnchor:", v83));
  v154[16] = v82;
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "bottomAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton topAnchor](self->_dismissButton, "topAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "constraintEqualToAnchor:", v80));
  v154[17] = v79;
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton leadingAnchor](self->_dismissButton, "leadingAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[CarCompressionTestCardViewController view](self, "view"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "leadingAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToAnchor:", v76));
  v154[18] = v75;
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton trailingAnchor](self->_dismissButton, "trailingAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[CarCompressionTestCardViewController view](self, "view"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "trailingAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToAnchor:", v65));
  v154[19] = v66;
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton heightAnchor](self->_dismissButton, "heightAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToConstant:", 20.0));
  v154[20] = v68;
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton bottomAnchor](self->_dismissButton, "bottomAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[CarCompressionTestCardViewController view](self, "view"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "bottomAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:", v71));
  v154[21] = v72;
  v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v154, 22));
  -[NSMutableArray addObjectsFromArray:](v152, "addObjectsFromArray:", v73);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v152);
}

- (id)_buttonWithTitle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusableButton button](CarFocusableButton, "button"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "setModifiesBackgroundColor:", 1);
  objc_msgSend(v4, "setTitle:forState:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 11.0, UIFontWeightBold));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "titleLabel"));
  objc_msgSend(v6, "setFont:", v5);

  objc_msgSend(v4, "setContentHorizontalAlignment:", 0);
  return v4;
}

- (void)_updateLabel
{
  uint64_t v3;
  uint64_t v4;
  CGFloat Height;
  NSString *v6;
  void *v7;
  void *v8;
  id v9;
  CGRect v10;
  CGRect v11;

  -[CarCompressionTestCardViewController spacerHeight](self, "spacerHeight");
  v4 = v3;
  -[UIView bounds](self->_spacerView, "bounds");
  Height = CGRectGetHeight(v10);
  v9 = (id)objc_claimAutoreleasedReturnValue(-[CarCompressionTestCardViewController view](self, "view"));
  objc_msgSend(v9, "bounds");
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Height=%.1f (=%.1f/%.1f)"), v4, *(_QWORD *)&Height, CGRectGetHeight(v11));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarCompressionTestCardViewController heightLabel](self, "heightLabel"));
  objc_msgSend(v8, "setText:", v7);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CarCompressionTestCardViewController;
  -[CarCompressionTestCardViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  -[CarCompressionTestCardViewController _updateLabel](self, "_updateLabel");
}

- (void)setSpacerHeight:(double)a3
{
  double v4;
  void *v5;
  _BOOL8 v6;
  void *v7;

  if (self->_spacerHeight != a3)
  {
    if (a3 >= 0.0)
      v4 = a3;
    else
      v4 = 0.0;
    self->_spacerHeight = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarCompressionTestCardViewController spacerHeightConstraint](self, "spacerHeightConstraint"));
    objc_msgSend(v5, "setConstant:", v4);

    v6 = self->_spacerHeight != 0.0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarCompressionTestCardViewController shorterButton](self, "shorterButton"));
    objc_msgSend(v7, "setEnabled:", v6);

    -[CarCompressionTestCardViewController _updateLabel](self, "_updateLabel");
  }
}

- (void)setSpacerPriority:(float)a3
{
  float v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;

  if (self->_spacerPriority != a3)
  {
    v5 = 0.0;
    if (a3 >= 0.0)
      v5 = a3;
    self->_spacerPriority = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarCompressionTestCardViewController spacerHeightConstraint](self, "spacerHeightConstraint"));
    objc_msgSend(v6, "setActive:", 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarCompressionTestCardViewController spacerHeightConstraint](self, "spacerHeightConstraint"));
    *(float *)&v8 = a3;
    objc_msgSend(v7, "setPriority:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarCompressionTestCardViewController spacerHeightConstraint](self, "spacerHeightConstraint"));
    objc_msgSend(v9, "setActive:", 1);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarCompressionTestCardViewController priorityButton](self, "priorityButton"));
    *(float *)&v11 = a3;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringValue"));
    objc_msgSend(v10, "setTitle:forState:", v13, 0);

    -[CarCompressionTestCardViewController _updateLabel](self, "_updateLabel");
  }
}

- (void)_increaseHeight
{
  double v3;

  -[CarCompressionTestCardViewController spacerHeight](self, "spacerHeight");
  -[CarCompressionTestCardViewController setSpacerHeight:](self, "setSpacerHeight:", v3 + 9.0);
}

- (void)_decreaseHeight
{
  double v3;

  -[CarCompressionTestCardViewController spacerHeight](self, "spacerHeight");
  -[CarCompressionTestCardViewController setSpacerHeight:](self, "setSpacerHeight:", v3 + -11.0);
}

- (void)_dismiss
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CarCompressionTestCardViewController delegate](self, "delegate"));
  objc_msgSend(v3, "compressionTestCardRequestsDismiss:", self);

}

- (void)_disappearAndReturn
{
  double v3;
  double v4;
  int v5;
  double v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[CarCompressionTestCardViewController delegate](self, "delegate"));
  -[CarCompressionTestCardViewController spacerHeight](self, "spacerHeight");
  v4 = v3;
  -[CarCompressionTestCardViewController spacerPriority](self, "spacerPriority");
  LODWORD(v6) = v5;
  objc_msgSend(v7, "compressionTestCard:reloadWithSpacerHeight:priority:", self, v4, v6);

}

- (void)_incrementPriority
{
  double v2;
  void *v4;
  NSUInteger v5;
  unint64_t v6;
  unint64_t v7;
  id v8;

  *(float *)&v2 = self->_spacerPriority;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v2));
  v5 = -[NSArray indexOfObject:](self->_priorities, "indexOfObject:", v4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v6 = v5 + 1;
  if (v6 >= -[NSArray count](self->_priorities, "count"))
    v7 = 0;
  else
    v7 = v6;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_priorities, "objectAtIndexedSubscript:", v7));

  objc_msgSend(v8, "floatValue");
  -[CarCompressionTestCardViewController setSpacerPriority:](self, "setSpacerPriority:");

}

- (NSArray)focusOrderSubItems
{
  CarFocusableButton *priorityButton;
  CarFocusableButton *shorterButton;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  priorityButton = self->_priorityButton;
  v8[0] = self->_tallerButton;
  v8[1] = priorityButton;
  shorterButton = self->_shorterButton;
  v8[2] = self->_reloadButton;
  v8[3] = shorterButton;
  v8[4] = self->_dismissButton;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 5));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexesOfObjectsPassingTest:", &stru_1011C0978));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectsAtIndexes:", v5));

  return (NSArray *)v6;
}

- (CarCompressionTestCardDelegate)delegate
{
  return (CarCompressionTestCardDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)spacerHeight
{
  return self->_spacerHeight;
}

- (float)spacerPriority
{
  return self->_spacerPriority;
}

- (UIView)spacerView
{
  return self->_spacerView;
}

- (void)setSpacerView:(id)a3
{
  objc_storeStrong((id *)&self->_spacerView, a3);
}

- (NSLayoutConstraint)spacerHeightConstraint
{
  return self->_spacerHeightConstraint;
}

- (void)setSpacerHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_spacerHeightConstraint, a3);
}

- (UILabel)heightLabel
{
  return self->_heightLabel;
}

- (void)setHeightLabel:(id)a3
{
  objc_storeStrong((id *)&self->_heightLabel, a3);
}

- (CarFocusableButton)tallerButton
{
  return self->_tallerButton;
}

- (void)setTallerButton:(id)a3
{
  objc_storeStrong((id *)&self->_tallerButton, a3);
}

- (CarFocusableButton)reloadButton
{
  return self->_reloadButton;
}

- (void)setReloadButton:(id)a3
{
  objc_storeStrong((id *)&self->_reloadButton, a3);
}

- (CarFocusableButton)shorterButton
{
  return self->_shorterButton;
}

- (void)setShorterButton:(id)a3
{
  objc_storeStrong((id *)&self->_shorterButton, a3);
}

- (CarFocusableButton)priorityButton
{
  return self->_priorityButton;
}

- (void)setPriorityButton:(id)a3
{
  objc_storeStrong((id *)&self->_priorityButton, a3);
}

- (CarFocusableButton)dismissButton
{
  return self->_dismissButton;
}

- (void)setDismissButton:(id)a3
{
  objc_storeStrong((id *)&self->_dismissButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_priorityButton, 0);
  objc_storeStrong((id *)&self->_shorterButton, 0);
  objc_storeStrong((id *)&self->_reloadButton, 0);
  objc_storeStrong((id *)&self->_tallerButton, 0);
  objc_storeStrong((id *)&self->_heightLabel, 0);
  objc_storeStrong((id *)&self->_spacerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_spacerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_priorityNames, 0);
  objc_storeStrong((id *)&self->_priorities, 0);
}

@end
