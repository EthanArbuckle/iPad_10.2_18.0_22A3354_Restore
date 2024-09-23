@implementation PRXCardContentWrapperView

- (PRXCardContentWrapperView)initWithContentView:(id)a3
{
  id v5;
  PRXCardContentWrapperView *v6;
  PRXCardContentWrapperView *v7;
  void *v8;
  UIScrollView *v9;
  UIScrollView *scrollView;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  uint64_t v16;
  double *v17;
  double *v18;
  double v19;
  double *v20;
  double v21;
  double *v22;
  UIView *v23;
  UIView *topKeyline;
  void *v25;
  UIView *v26;
  UIView *titleContainer;
  void *v28;
  UILabel *v29;
  UILabel *scrolledTitleLabel;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  PRXCardBottomTray *v38;
  PRXCardBottomTray *bottomTray;
  UIView *v40;
  UIView *bottomKeyline;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  NSLayoutConstraint *scrollViewBottomConstraint;
  double v48;
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
  UIScrollView *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  double v70;
  void *v71;
  void *v72;
  double v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  void *v81;
  void *v82;
  double v83;
  void *v84;
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
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  id v159;
  id *p_contentView;
  objc_super v161;
  _QWORD v162[30];

  v162[28] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v161.receiver = self;
  v161.super_class = (Class)PRXCardContentWrapperView;
  v6 = -[PRXCardContentWrapperView initWithFrame:](&v161, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v7 = v6;
  if (v6)
  {
    v159 = v5;
    -[PRXCardContentWrapperView setInsetsLayoutMarginsFromSafeArea:](v6, "setInsetsLayoutMarginsFromSafeArea:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXCardContentWrapperView setBackgroundColor:](v7, "setBackgroundColor:", v8);

    objc_storeStrong((id *)&v7->_contentView, a3);
    -[PRXCardContentView setTranslatesAutoresizingMaskIntoConstraints:](v7->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PRXCardContentView setDelegate:](v7->_contentView, "setDelegate:", v7);
    p_contentView = (id *)&v7->_contentView;
    -[PRXCardContentView setPreservesSuperviewLayoutMargins:](v7->_contentView, "setPreservesSuperviewLayoutMargins:", 1);
    v9 = (UIScrollView *)objc_alloc_init(MEMORY[0x24BDF6D50]);
    scrollView = v7->_scrollView;
    v7->_scrollView = v9;

    -[UIScrollView setTranslatesAutoresizingMaskIntoConstraints:](v7->_scrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIScrollView setDelegate:](v7->_scrollView, "setDelegate:", v7);
    -[UIScrollView setShowsHorizontalScrollIndicator:](v7->_scrollView, "setShowsHorizontalScrollIndicator:", 0);
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v16 = PRXCardPreferredSizeClassForContainerBounds(v12, v13, v14, v15);
    v17 = (double *)&PRXCardCompactLayoutMargins;
    v18 = (double *)&unk_211637788;
    if (v16 != 1)
      v18 = (double *)&unk_211637768;
    v19 = *v18;
    v20 = (double *)&unk_211637780;
    if (v16 != 1)
      v20 = (double *)&unk_211637760;
    v21 = *v20;
    v22 = (double *)&unk_211637778;
    if (v16 != 1)
    {
      v22 = (double *)&unk_211637758;
      v17 = (double *)&PRXCardDefaultLayoutMargins;
    }
    -[UIScrollView setDirectionalLayoutMargins:](v7->_scrollView, "setDirectionalLayoutMargins:", *v17, *v22, v21, v19);

    -[UIScrollView setVerticalScrollIndicatorInsets:](v7->_scrollView, "setVerticalScrollIndicatorInsets:", 54.0, 0.0, 0.0, 0.0);
    -[UIScrollView setContentInsetAdjustmentBehavior:](v7->_scrollView, "setContentInsetAdjustmentBehavior:", 2);
    -[UIScrollView addSubview:](v7->_scrollView, "addSubview:", v7->_contentView);
    -[PRXCardContentWrapperView addSubview:](v7, "addSubview:", v7->_scrollView);
    v23 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
    topKeyline = v7->_topKeyline;
    v7->_topKeyline = v23;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v7->_topKeyline, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "separatorColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v7->_topKeyline, "setBackgroundColor:", v25);

    -[UIView setAlpha:](v7->_topKeyline, "setAlpha:", 0.2);
    -[UIView setHidden:](v7->_topKeyline, "setHidden:", 1);
    -[PRXCardContentWrapperView addSubview:](v7, "addSubview:", v7->_topKeyline);
    v26 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
    titleContainer = v7->_titleContainer;
    v7->_titleContainer = v26;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v7->_titleContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v7->_titleContainer, "setBackgroundColor:", v28);

    -[UIView setHidden:](v7->_titleContainer, "setHidden:", 1);
    -[PRXCardContentWrapperView addSubview:](v7, "addSubview:", v7->_titleContainer);
    v29 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    scrolledTitleLabel = v7->_scrolledTitleLabel;
    v7->_scrolledTitleLabel = v29;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v7->_scrolledTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTextAlignment:](v7->_scrolledTitleLabel, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x24BDF6A70], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x24BDF77E8], *MEMORY[0x24BDF76A0]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7->_scrolledTitleLabel, "setFont:", v31);

    -[UIView addSubview:](v7->_titleContainer, "addSubview:", v7->_scrolledTitleLabel);
    -[UIScrollView directionalLayoutMargins](v7->_scrollView, "directionalLayoutMargins");
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v38 = objc_alloc_init(PRXCardBottomTray);
    bottomTray = v7->_bottomTray;
    v7->_bottomTray = v38;

    -[PRXCardBottomTray setTranslatesAutoresizingMaskIntoConstraints:](v7->_bottomTray, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PRXCardBottomTray setDirectionalLayoutMargins:](v7->_bottomTray, "setDirectionalLayoutMargins:", v33, v35, v33, v37);
    -[PRXCardBottomTray setInsetsLayoutMarginsFromSafeArea:](v7->_bottomTray, "setInsetsLayoutMarginsFromSafeArea:", 0);
    -[PRXCardBottomTray setDelegate:](v7->_bottomTray, "setDelegate:", v7);
    -[PRXCardContentWrapperView addSubview:](v7, "addSubview:", v7->_bottomTray);
    v40 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
    bottomKeyline = v7->_bottomKeyline;
    v7->_bottomKeyline = v40;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v7->_bottomKeyline, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "separatorColor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v7->_bottomKeyline, "setBackgroundColor:", v42);

    -[UIView setAlpha:](v7->_bottomKeyline, "setAlpha:", 0.2);
    -[UIView setHidden:](v7->_bottomKeyline, "setHidden:", 1);
    -[PRXCardContentWrapperView addSubview:](v7, "addSubview:", v7->_bottomKeyline);
    -[UIScrollView bottomAnchor](v7->_scrollView, "bottomAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXCardContentWrapperView bottomTray](v7, "bottomTray");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "topAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v45);
    v46 = objc_claimAutoreleasedReturnValue();
    scrollViewBottomConstraint = v7->_scrollViewBottomConstraint;
    v7->_scrollViewBottomConstraint = (NSLayoutConstraint *)v46;

    -[UIScrollView directionalLayoutMargins](v7->_scrollView, "directionalLayoutMargins");
    -[NSLayoutConstraint setConstant:](v7->_scrollViewBottomConstraint, "setConstant:", -v48);
    v126 = (void *)MEMORY[0x24BDBCEB8];
    -[UIScrollView leadingAnchor](v7->_scrollView, "leadingAnchor");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXCardContentWrapperView leadingAnchor](v7, "leadingAnchor");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "constraintEqualToAnchor:", v157);
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    v162[0] = v156;
    -[UIScrollView trailingAnchor](v7->_scrollView, "trailingAnchor");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXCardContentWrapperView trailingAnchor](v7, "trailingAnchor");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v155, "constraintEqualToAnchor:", v154);
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    v162[1] = v153;
    -[UIScrollView topAnchor](v7->_scrollView, "topAnchor");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXCardContentWrapperView layoutMarginsGuide](v7, "layoutMarginsGuide");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "topAnchor");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "constraintEqualToAnchor:", v150);
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    v162[2] = v149;
    v162[3] = v7->_scrollViewBottomConstraint;
    -[UIScrollView leadingAnchor](v7->_scrollView, "leadingAnchor");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_contentView, "leadingAnchor");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "constraintEqualToAnchor:", v147);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    v162[4] = v146;
    -[UIScrollView trailingAnchor](v7->_scrollView, "trailingAnchor");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_contentView, "trailingAnchor");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "constraintEqualToAnchor:", v144);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    v162[5] = v143;
    -[UIScrollView topAnchor](v7->_scrollView, "topAnchor");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_contentView, "topAnchor");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "constraintEqualToAnchor:", v141);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    v162[6] = v140;
    -[UIScrollView bottomAnchor](v7->_scrollView, "bottomAnchor");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_contentView, "bottomAnchor");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "constraintEqualToAnchor:", v138);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    v162[7] = v137;
    -[UIScrollView widthAnchor](v7->_scrollView, "widthAnchor");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_contentView, "widthAnchor");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "constraintEqualToAnchor:", v134);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    v162[8] = v133;
    -[UIView leadingAnchor](v7->_titleContainer, "leadingAnchor");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXCardContentWrapperView leadingAnchor](v7, "leadingAnchor");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "constraintEqualToAnchor:", v131);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v162[9] = v130;
    -[UIView trailingAnchor](v7->_titleContainer, "trailingAnchor");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXCardContentWrapperView trailingAnchor](v7, "trailingAnchor");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "constraintEqualToAnchor:", v128);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v162[10] = v127;
    -[UIView topAnchor](v7->_titleContainer, "topAnchor");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXCardContentWrapperView topAnchor](v7, "topAnchor");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "constraintEqualToAnchor:", v124);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v162[11] = v123;
    -[UIView heightAnchor](v7->_titleContainer, "heightAnchor");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "constraintEqualToConstant:", 62.0);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v162[12] = v121;
    -[UILabel leadingAnchor](v7->_scrolledTitleLabel, "leadingAnchor");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v7->_titleContainer, "leadingAnchor");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "constraintGreaterThanOrEqualToAnchor:constant:", v119, 60.0);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v162[13] = v118;
    -[UILabel trailingAnchor](v7->_scrolledTitleLabel, "trailingAnchor");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v7->_titleContainer, "trailingAnchor");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "constraintGreaterThanOrEqualToAnchor:constant:", v116, -60.0);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v162[14] = v115;
    -[UILabel centerXAnchor](v7->_scrolledTitleLabel, "centerXAnchor");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](v7->_titleContainer, "centerXAnchor");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "constraintEqualToAnchor:", v113);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v162[15] = v112;
    -[UILabel topAnchor](v7->_scrolledTitleLabel, "topAnchor");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v7->_titleContainer, "topAnchor");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "constraintEqualToAnchor:constant:", v110, 22.0);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v162[16] = v109;
    -[UIView leadingAnchor](v7->_topKeyline, "leadingAnchor");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v7->_titleContainer, "leadingAnchor");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "constraintEqualToAnchor:", v107);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v162[17] = v106;
    -[UIView trailingAnchor](v7->_topKeyline, "trailingAnchor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v7->_titleContainer, "trailingAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "constraintEqualToAnchor:", v104);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v162[18] = v103;
    -[UIView topAnchor](v7->_topKeyline, "topAnchor");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v7->_titleContainer, "bottomAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "constraintEqualToAnchor:", v101);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v162[19] = v100;
    -[UIView heightAnchor](v7->_topKeyline, "heightAnchor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "constraintEqualToConstant:", 1.0);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v162[20] = v98;
    -[PRXCardBottomTray leadingAnchor](v7->_bottomTray, "leadingAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXCardContentWrapperView leadingAnchor](v7, "leadingAnchor");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "constraintEqualToAnchor:", v96);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v162[21] = v95;
    -[PRXCardBottomTray trailingAnchor](v7->_bottomTray, "trailingAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXCardContentWrapperView trailingAnchor](v7, "trailingAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "constraintEqualToAnchor:", v93);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v162[22] = v92;
    -[PRXCardBottomTray bottomAnchor](v7->_bottomTray, "bottomAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXCardContentWrapperView bottomAnchor](v7, "bottomAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "constraintEqualToAnchor:", v90);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v162[23] = v89;
    -[UIView leadingAnchor](v7->_bottomKeyline, "leadingAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXCardBottomTray leadingAnchor](v7->_bottomTray, "leadingAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "constraintEqualToAnchor:", v87);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v162[24] = v86;
    -[UIView trailingAnchor](v7->_bottomKeyline, "trailingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXCardBottomTray trailingAnchor](v7->_bottomTray, "trailingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v162[25] = v51;
    -[UIView bottomAnchor](v7->_bottomKeyline, "bottomAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXCardBottomTray topAnchor](v7->_bottomTray, "topAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v162[26] = v54;
    -[UIView heightAnchor](v7->_bottomKeyline, "heightAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToConstant:", 1.0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v162[27] = v56;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v162, 28);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "arrayWithArray:", v57);
    v136 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "bundleIdentifier");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v56) = objc_msgSend(v59, "isEqualToString:", CFSTR("com.apple.FMDMagSafeSetupRemoteUI"));

    v60 = v7->_scrollView;
    if ((_DWORD)v56)
    {
      -[UIScrollView contentLayoutGuide](v60, "contentLayoutGuide");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "heightAnchor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*p_contentView, "heightAnchor");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "constraintEqualToAnchor:", v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v65) = 1132068864;
      objc_msgSend(v64, "setPriority:", v65);
      -[UIScrollView heightAnchor](v7->_scrollView, "heightAnchor");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIScrollView contentLayoutGuide](v7->_scrollView, "contentLayoutGuide");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "heightAnchor");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "constraintGreaterThanOrEqualToAnchor:", v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v70) = 1132068864;
      objc_msgSend(v69, "setPriority:", v70);
      -[UIScrollView heightAnchor](v7->_scrollView, "heightAnchor");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "bounds");
      objc_msgSend(v71, "constraintLessThanOrEqualToConstant:", v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = v136;
      objc_msgSend(v136, "addObject:", v74);

      objc_msgSend(v136, "addObject:", v64);
    }
    else
    {
      -[UIScrollView frameLayoutGuide](v60, "frameLayoutGuide");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "heightAnchor");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIScrollView contentLayoutGuide](v7->_scrollView, "contentLayoutGuide");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "heightAnchor");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "constraintEqualToAnchor:", v79);
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v80) = 1144733696;
      objc_msgSend(v69, "setPriority:", v80);
      -[UIScrollView frameLayoutGuide](v7->_scrollView, "frameLayoutGuide");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "heightAnchor");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "bounds");
      objc_msgSend(v81, "constraintLessThanOrEqualToConstant:", v83);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = v136;
      objc_msgSend(v136, "addObject:", v84);

    }
    objc_msgSend(v75, "addObject:", v69);
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v75);

    v5 = v159;
  }

  return v7;
}

- (void)layoutSubviews
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  objc_msgSend(a1, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentSize");
  v9 = 134218240;
  v10 = v6;
  v11 = 2048;
  v12 = v8;
  _os_log_debug_impl(&dword_21161A000, a2, OS_LOG_TYPE_DEBUG, "Frame height (%f) content height (%f)", (uint8_t *)&v9, 0x16u);

}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  NSObject *v9;
  double v10;
  double v11;
  objc_super v12;
  CGSize result;

  v12.receiver = self;
  v12.super_class = (Class)PRXCardContentWrapperView;
  -[PRXCardContentWrapperView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v12, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, a3.width, a3.height);
  v6 = v5;
  v8 = v7;
  PRXDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[PRXCardContentWrapperView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:].cold.1(v9, v6, v8);

  v10 = v6;
  v11 = v8;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[PRXCardContentWrapperView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "cardStyle");
  -[PRXCardContentWrapperView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PRXCardPreferredSize(v4, objc_msgSend(v5, "prx_cardSizeClass"));
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[PRXCardContentWrapperView traitCollection](self, "traitCollection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "customBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PRXCardContentWrapperView traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "customBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXCardContentWrapperView setBackgroundColor:](self, "setBackgroundColor:", v7);

    -[PRXCardContentWrapperView traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "customBackgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXCardContentWrapperView titleContainer](self, "titleContainer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v9);

    -[PRXCardContentWrapperView traitCollection](self, "traitCollection");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "customBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXCardContentWrapperView bottomTray](self, "bottomTray");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v11);

  }
}

- (void)setTitle:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_title, a3);
  v5 = a3;
  -[PRXCardContentWrapperView scrolledTitleLabel](self, "scrolledTitleLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;
  id v7;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  -[PRXCardContentWrapperView scrollView](self, "scrollView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentOffset:animated:", v4, x, y);

}

- (void)scrollToBottom
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  -[PRXCardContentWrapperView scrollView](self, "scrollView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentSize");
  v4 = v3;
  -[PRXCardContentWrapperView scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v4 - v6;
  -[PRXCardContentWrapperView scrollView](self, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentInset");
  v10 = v7 + v9;
  -[PRXCardContentWrapperView scrollView](self, "scrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContentOffset:", 0.0, v10);

}

- (void)setInfoButtonAction:(id)a3
{
  PRXAction *v5;
  PRXAction *infoButtonAction;
  void *v7;
  void *v8;
  _BOOL4 v9;
  uint64_t *v10;
  double v11;
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
  PRXAction *v24;
  _QWORD v25[5];

  v25[4] = *MEMORY[0x24BDAC8D0];
  v5 = (PRXAction *)a3;
  infoButtonAction = self->_infoButtonAction;
  if (infoButtonAction != v5)
  {
    v24 = v5;
    -[PRXAction button](infoButtonAction, "button");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperview");

    objc_storeStrong((id *)&self->_infoButtonAction, a3);
    +[PRXButton buttonWithProximityType:](PRXButton, "buttonWithProximityType:", 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PRXAction setButton:](self->_infoButtonAction, "setButton:", v8);
    -[PRXCardContentWrapperView addSubview:](self, "addSubview:", v8);
    v9 = PRXIsEdgeToEdgePhone();
    v10 = &PRXDismissButtonEdgeToEdgeMargin;
    if (!v9)
      v10 = &PRXDismissButtonDefaultMargin;
    v11 = *(double *)v10;
    v21 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v8, "centerYAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXCardContentWrapperView topAnchor](self, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:constant:", v22, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v12;
    objc_msgSend(v8, "centerXAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXCardContentWrapperView leadingAnchor](self, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v15;
    objc_msgSend(v8, "heightAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToConstant:", 24.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v17;
    objc_msgSend(v8, "widthAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToConstant:", 24.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25[3] = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "activateConstraints:", v20);

    v5 = v24;
  }

}

- (void)removeBottomTray
{
  id v2;

  -[PRXCardContentWrapperView bottomTray](self, "bottomTray");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double MaxY;
  double v8;
  double v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  id v13;
  CGRect v14;

  v4 = a3;
  -[PRXCardContentWrapperView contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "titleView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  MaxY = CGRectGetMaxY(v14);

  objc_msgSend(v4, "contentOffset");
  v9 = v8;

  if (v9 <= MaxY)
  {
    v11 = 1;
  }
  else
  {
    -[PRXCardContentWrapperView title](self, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 == 0;

  }
  -[PRXCardContentWrapperView topKeyline](self, "topKeyline");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHidden:", v11);

  -[PRXCardContentWrapperView titleContainer](self, "titleContainer");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidden:", v11);

}

- (void)setDismissButton:(id)a3
{
  PRXButton *v5;
  PRXButton **p_dismissButton;
  PRXButton *dismissButton;
  _BOOL4 v8;
  uint64_t *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v5 = (PRXButton *)a3;
  p_dismissButton = &self->_dismissButton;
  dismissButton = self->_dismissButton;
  if (dismissButton != v5)
  {
    -[PRXButton removeFromSuperview](dismissButton, "removeFromSuperview");
    objc_storeStrong((id *)&self->_dismissButton, a3);
    -[PRXButton setTranslatesAutoresizingMaskIntoConstraints:](*p_dismissButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PRXCardContentWrapperView addSubview:](self, "addSubview:", *p_dismissButton);
    v8 = PRXIsEdgeToEdgePhone();
    v9 = &PRXDismissButtonEdgeToEdgeMargin;
    if (!v8)
      v9 = &PRXDismissButtonDefaultMargin;
    v10 = *(double *)v9;
    v11 = (void *)MEMORY[0x24BDD1628];
    -[PRXButton centerYAnchor](*p_dismissButton, "centerYAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXCardContentWrapperView topAnchor](self, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v14;
    -[PRXButton centerXAnchor](*p_dismissButton, "centerXAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXCardContentWrapperView trailingAnchor](self, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, -v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "activateConstraints:", v18);

  }
}

- (NSArray)auxiliaryViews
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  -[PRXCardContentWrapperView bottomTray](self, "bottomTray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)actionButtons
{
  void *v2;
  void *v3;

  -[PRXCardContentWrapperView bottomTray](self, "bottomTray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionButtons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setActionButtons:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PRXCardContentWrapperView bottomTray](self, "bottomTray");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActionButtons:", v4);

}

- (void)didChangeContentsOfBottomTray:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v4 = a3;
  -[PRXCardContentWrapperView bottomTray](self, "bottomTray");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[PRXCardContentWrapperView bottomTray](self, "bottomTray");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsContents");

    if ((v7 & 1) != 0)
    {
      -[PRXCardContentWrapperView scrollViewBottomConstraint](self, "scrollViewBottomConstraint");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 0.0;
      v12 = v8;
    }
    else
    {
      -[UIScrollView directionalLayoutMargins](self->_scrollView, "directionalLayoutMargins");
      v11 = -v10;
      -[PRXCardContentWrapperView scrollViewBottomConstraint](self, "scrollViewBottomConstraint");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v8;
      v9 = v11;
    }
    objc_msgSend(v8, "setConstant:", v9);

  }
}

- (PRXButton)dismissButton
{
  return self->_dismissButton;
}

- (NSString)title
{
  return self->_title;
}

- (PRXAction)infoButtonAction
{
  return self->_infoButtonAction;
}

- (PRXCardBottomTray)bottomTray
{
  return self->_bottomTray;
}

- (PRXCardContentView)contentView
{
  return self->_contentView;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (UIView)bottomKeyline
{
  return self->_bottomKeyline;
}

- (UIView)topKeyline
{
  return self->_topKeyline;
}

- (UIView)titleContainer
{
  return self->_titleContainer;
}

- (UILabel)scrolledTitleLabel
{
  return self->_scrolledTitleLabel;
}

- (NSLayoutConstraint)scrollViewBottomConstraint
{
  return self->_scrollViewBottomConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_scrolledTitleLabel, 0);
  objc_storeStrong((id *)&self->_titleContainer, 0);
  objc_storeStrong((id *)&self->_topKeyline, 0);
  objc_storeStrong((id *)&self->_bottomKeyline, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_bottomTray, 0);
  objc_storeStrong((id *)&self->_infoButtonAction, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
}

- (void)systemLayoutSizeFittingSize:(NSObject *)a1 withHorizontalFittingPriority:(double)a2 verticalFittingPriority:(double)a3 .cold.1(NSObject *a1, double a2, double a3)
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  NSStringFromCGSize(*(CGSize *)&a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl(&dword_21161A000, a1, OS_LOG_TYPE_DEBUG, "Layout size fitting size: %@", (uint8_t *)&v5, 0xCu);

}

@end
