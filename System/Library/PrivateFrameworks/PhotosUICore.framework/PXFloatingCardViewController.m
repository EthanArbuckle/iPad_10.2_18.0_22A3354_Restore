@implementation PXFloatingCardViewController

- (PXFloatingCardViewController)initWithContentViewController:(id)a3
{
  id v4;
  PXFloatingCardViewController *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  UIVisualEffectView *v21;
  UIVisualEffectView *backgroundVisualEffectView;
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
  id v36;
  double v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  UIView *contentView;
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
  uint64_t v54;
  UIView *grabberFooterView;
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
  _UIGrabber *v77;
  _UIGrabber *grabber;
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
  UIView *v89;
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
  uint64_t v101;
  UIView *headerView;
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
  UILabel *v113;
  void *v114;
  void *v115;
  UILabel *headerLabel;
  UILabel *v117;
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
  PXFloatingCardViewController *v176;
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
  UILabel *v190;
  id obj;
  _QWORD v192[4];
  PXFloatingCardViewController *v193;
  objc_super v194;
  _QWORD v195[3];
  _QWORD v196[3];
  _QWORD v197[5];
  _QWORD v198[3];
  _QWORD v199[2];
  _QWORD v200[4];
  _QWORD v201[5];
  _QWORD v202[3];
  _QWORD v203[6];

  v203[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v194.receiver = self;
  v194.super_class = (Class)PXFloatingCardViewController;
  v5 = -[PXFloatingCardViewController initWithNibName:bundle:](&v194, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    obj = v4;
    v7 = objc_msgSend(v6, "CGColor");
    -[PXFloatingCardViewController view](v5, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShadowColor:", v7);

    -[PXFloatingCardViewController view](v5, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = 1036831949;
    objc_msgSend(v11, "setShadowOpacity:", v12);

    v13 = *MEMORY[0x1E0C9D820];
    v14 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    -[PXFloatingCardViewController view](v5, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setShadowOffset:", v13, v14);

    -[PXFloatingCardViewController view](v5, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setShadowRadius:", 5.0);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXFloatingCardViewController view](v5, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setBackgroundColor:", v19);

    v21 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E0DC3F58]);
    backgroundVisualEffectView = v5->_backgroundVisualEffectView;
    v5->_backgroundVisualEffectView = v21;

    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setEffect:](v5->_backgroundVisualEffectView, "setEffect:", v23);

    -[UIVisualEffectView layer](v5->_backgroundVisualEffectView, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setCornerRadius:", 10.0);

    -[UIVisualEffectView layer](v5->_backgroundVisualEffectView, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setMasksToBounds:", 1);

    -[PXFloatingCardViewController view](v5, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSubview:", v5->_backgroundVisualEffectView);

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v5->_backgroundVisualEffectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v147 = (void *)MEMORY[0x1E0CB3718];
    -[UIVisualEffectView topAnchor](v5->_backgroundVisualEffectView, "topAnchor");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXFloatingCardViewController view](v5, "view");
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v189, "topAnchor");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v181, "constraintEqualToAnchor:", v177);
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    v203[0] = v169;
    -[UIVisualEffectView bottomAnchor](v5->_backgroundVisualEffectView, "bottomAnchor");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXFloatingCardViewController view](v5, "view");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "bottomAnchor");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v155, "constraintEqualToAnchor:", v150);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    v203[1] = v144;
    -[UIVisualEffectView leadingAnchor](v5->_backgroundVisualEffectView, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXFloatingCardViewController view](v5, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v203[2] = v30;
    -[UIVisualEffectView trailingAnchor](v5->_backgroundVisualEffectView, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXFloatingCardViewController view](v5, "view");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v203[3] = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v203, 4);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "activateConstraints:", v35);

    v36 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v37 = *MEMORY[0x1E0C9D648];
    v38 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v39 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v40 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v41 = objc_msgSend(v36, "initWithFrame:", *MEMORY[0x1E0C9D648], v38, v39, v40);
    contentView = v5->_contentView;
    v5->_contentView = (UIView *)v41;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5->_grabberFooterView, "setBackgroundColor:", v43);

    -[UIView setClipsToBounds:](v5->_contentView, "setClipsToBounds:", 1);
    -[UIVisualEffectView contentView](v5->_backgroundVisualEffectView, "contentView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addSubview:", v5->_contentView);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v151 = (void *)MEMORY[0x1E0CB3718];
    -[UIView topAnchor](v5->_contentView, "topAnchor");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXFloatingCardViewController backgroundView](v5, "backgroundView");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "topAnchor");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v170, "constraintEqualToAnchor:", v163);
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    v202[0] = v156;
    -[UIView leadingAnchor](v5->_contentView, "leadingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXFloatingCardViewController backgroundView](v5, "backgroundView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v202[1] = v48;
    -[UIView trailingAnchor](v5->_contentView, "trailingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXFloatingCardViewController backgroundView](v5, "backgroundView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "trailingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v202[2] = v52;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v202, 3);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "activateConstraints:", v53);

    v54 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v37, v38, v39, v40);
    grabberFooterView = v5->_grabberFooterView;
    v5->_grabberFooterView = (UIView *)v54;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5->_grabberFooterView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIVisualEffectView contentView](v5->_backgroundVisualEffectView, "contentView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "addSubview:", v5->_grabberFooterView);

    v145 = (void *)MEMORY[0x1E0CB3718];
    -[UIView topAnchor](v5->_grabberFooterView, "topAnchor");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v5->_contentView, "bottomAnchor");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v186, "constraintEqualToAnchor:", v179);
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    v201[0] = v171;
    -[UIView bottomAnchor](v5->_grabberFooterView, "bottomAnchor");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXFloatingCardViewController backgroundView](v5, "backgroundView");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "bottomAnchor");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v157, "constraintEqualToAnchor:", v152);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    v201[1] = v148;
    -[UIView leadingAnchor](v5->_grabberFooterView, "leadingAnchor");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXFloatingCardViewController backgroundView](v5, "backgroundView");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "leadingAnchor");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "constraintEqualToAnchor:", v140);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v201[2] = v57;
    -[UIView trailingAnchor](v5->_grabberFooterView, "trailingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXFloatingCardViewController backgroundView](v5, "backgroundView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "trailingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v201[3] = v61;
    -[UIView heightAnchor](v5->_grabberFooterView, "heightAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToConstant:", 21.0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v201[4] = v63;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v201, 5);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "activateConstraints:", v64);

    v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v37, v38, v39, v40);
    objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setBackgroundColor:", v66);

    objc_msgSend(v65, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v5->_grabberFooterView, "addSubview:", v65);
    v158 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v65, "topAnchor");
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v5->_grabberFooterView, "topAnchor");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v187, "constraintEqualToAnchor:", v172);
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    v200[0] = v165;
    v67 = v65;
    objc_msgSend(v65, "leadingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v5->_grabberFooterView, "leadingAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:", v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v200[1] = v70;
    v180 = v67;
    objc_msgSend(v67, "trailingAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v5->_grabberFooterView, "trailingAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:", v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v200[2] = v73;
    objc_msgSend(v67, "heightAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToConstant:", 1.0);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v200[3] = v75;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v200, 4);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "activateConstraints:", v76);

    v77 = (_UIGrabber *)objc_alloc_init(MEMORY[0x1E0DC4190]);
    grabber = v5->_grabber;
    v5->_grabber = v77;

    -[_UIGrabber sizeToFit](v5->_grabber, "sizeToFit");
    -[UIView addSubview:](v5->_grabberFooterView, "addSubview:", v5->_grabber);
    -[_UIGrabber setTranslatesAutoresizingMaskIntoConstraints:](v5->_grabber, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v79 = (void *)MEMORY[0x1E0CB3718];
    -[_UIGrabber centerXAnchor](v5->_grabber, "centerXAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](v5->_grabberFooterView, "centerXAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintEqualToAnchor:", v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v199[0] = v82;
    -[_UIGrabber centerYAnchor](v5->_grabber, "centerYAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](v5->_grabberFooterView, "centerYAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "constraintEqualToAnchor:", v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v199[1] = v85;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v199, 2);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "activateConstraints:", v86);

    objc_storeWeak((id *)&v5->_contentViewController, obj);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "view");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "setBackgroundColor:", v87);

    v89 = v5->_contentView;
    objc_msgSend(obj, "view");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v89, "addSubview:", v90);

    -[PXFloatingCardViewController addChildViewController:](v5, "addChildViewController:", obj);
    objc_msgSend(obj, "didMoveToParentViewController:", v5);
    objc_msgSend(obj, "setAdditionalSafeAreaInsets:", 62.0, 0.0, 21.0, 0.0);
    objc_msgSend(obj, "view");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v159 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(obj, "view");
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v188, "bottomAnchor");
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v5->_contentView, "bottomAnchor");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v182, "constraintEqualToAnchor:", v173);
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    v198[0] = v166;
    objc_msgSend(obj, "view");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "leadingAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v5->_contentView, "leadingAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "constraintEqualToAnchor:", v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v198[1] = v95;
    objc_msgSend(obj, "view");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "trailingAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v5->_contentView, "trailingAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "constraintEqualToAnchor:", v98);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v198[2] = v99;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v198, 3);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v159, "activateConstraints:", v100);

    v101 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v37, v38, v39, v40);
    headerView = v5->_headerView;
    v5->_headerView = (UIView *)v101;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5->_headerView, "setBackgroundColor:", v103);

    -[UIView addSubview:](v5->_contentView, "addSubview:", v5->_headerView);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5->_headerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v146 = (void *)MEMORY[0x1E0CB3718];
    -[UIView topAnchor](v5->_headerView, "topAnchor");
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v5->_contentView, "topAnchor");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "constraintEqualToAnchor:", v174);
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    v197[0] = v167;
    -[UIView bottomAnchor](v5->_headerView, "bottomAnchor");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "view");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v160, "topAnchor");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "constraintEqualToAnchor:", v149);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    v197[1] = v143;
    -[UIView leadingAnchor](v5->_headerView, "leadingAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v5->_contentView, "leadingAnchor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "constraintEqualToAnchor:", v105);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v197[2] = v106;
    -[UIView trailingAnchor](v5->_headerView, "trailingAnchor");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v5->_contentView, "trailingAnchor");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "constraintEqualToAnchor:", v108);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v197[3] = v109;
    -[UIView heightAnchor](v5->_headerView, "heightAnchor");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "constraintEqualToConstant:", 62.0);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v197[4] = v111;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v197, 5);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "activateConstraints:", v112);

    v113 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    PXLocalizedStringFromTable(CFSTR("PXInfoPanelFloatingTitle"), CFSTR("PhotosUICore"));
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v113, "setText:", v114);

    -[UILabel setAccessibilityTraits:](v113, "setAccessibilityTraits:", *MEMORY[0x1E0DC4670]);
    -[UILabel setAccessibilityIdentifier:](v113, "setAccessibilityIdentifier:", CFSTR("com.apple.photos.infoPanel.title"));
    -[PXFloatingCardViewController _systemFontWithTextStyle:weight:](v5, "_systemFontWithTextStyle:weight:", 3, *MEMORY[0x1E0DC1448]);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v113, "setFont:", v115);

    headerLabel = v5->_headerLabel;
    v5->_headerLabel = v113;
    v117 = v113;

    -[UIView addSubview:](v5->_headerView, "addSubview:", v117);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v117, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v175 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel topAnchor](v117, "topAnchor");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v5->_headerView, "topAnchor");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v184, "constraintEqualToAnchor:", v118);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v196[0] = v119;
    v190 = v117;
    -[UILabel bottomAnchor](v117, "bottomAnchor");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v5->_headerView, "bottomAnchor");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "constraintEqualToAnchor:", v121);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v196[1] = v122;
    -[UILabel leadingAnchor](v117, "leadingAnchor");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v5->_headerView, "leadingAnchor");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "constraintEqualToAnchor:constant:", v124, 16.0);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v196[2] = v125;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v196, 3);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v175, "activateConstraints:", v126);

    v127 = (void *)MEMORY[0x1E0DC3428];
    v192[0] = MEMORY[0x1E0C809B0];
    v192[1] = 3221225472;
    v192[2] = __62__PXFloatingCardViewController_initWithContentViewController___block_invoke;
    v192[3] = &unk_1E513C038;
    v176 = v5;
    v193 = v176;
    objc_msgSend(v127, "actionWithHandler:", v192);
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:primaryAction:", 7, v185);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringFromTable(CFSTR("PXInfoPanelCloseButtonAXHint"), CFSTR("PhotosUICore"));
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "setAccessibilityHint:", v129);

    objc_msgSend(v128, "setAccessibilityIdentifier:", CFSTR("com.apple.photos.infoPanel.dismiss"));
    -[UIView addSubview:](v5->_headerView, "addSubview:", v128);
    objc_msgSend(v128, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v154 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v128, "centerYAnchor");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](v5->_headerView, "centerYAnchor");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v168, "constraintEqualToAnchor:", v161);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v195[0] = v130;
    objc_msgSend(v128, "leadingAnchor");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v190, "trailingAnchor");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "constraintEqualToAnchor:constant:", v132, 16.0);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    v195[1] = v133;
    objc_msgSend(v128, "trailingAnchor");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v5->_headerView, "trailingAnchor");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "constraintEqualToAnchor:constant:", v135, -16.0);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v195[2] = v136;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v195, 3);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "activateConstraints:", v137);

    v4 = obj;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "addObserver:selector:name:object:", v176, sel_contentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v5;
}

- (id)_systemFontWithTextStyle:(int64_t)a3 weight:(double)a4
{
  return (id)PXCappedFontWithTextStyleAndWeight();
}

- (void)removeFromParentViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[PXFloatingCardViewController contentViewController](self, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "willMoveToParentViewController:", 0);

  -[PXFloatingCardViewController contentViewController](self, "contentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  -[PXFloatingCardViewController contentViewController](self, "contentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromParentViewController");

  v7.receiver = self;
  v7.super_class = (Class)PXFloatingCardViewController;
  -[PXFloatingCardViewController removeFromParentViewController](&v7, sel_removeFromParentViewController);
}

- (void)_dismissTapped
{
  id v3;

  -[PXFloatingCardViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatingCardViewControllerDismissTapped:", self);

}

- (PXFloatingCardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFloatingCardViewController.m"), 193, CFSTR("%s is not available as initializer"), "-[PXFloatingCardViewController initWithNibName:bundle:]");

  abort();
}

- (PXFloatingCardViewController)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFloatingCardViewController.m"), 197, CFSTR("%s is not available as initializer"), "-[PXFloatingCardViewController initWithCoder:]");

  abort();
}

- (void)setSize:(CGSize)a3
{
  double height;
  double width;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  height = a3.height;
  width = a3.width;
  if (self->_size.width != a3.width || self->_size.height != a3.height)
  {
    self->_size = a3;
    -[PXFloatingCardViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v9 = v8;
    v11 = v10;

    -[PXFloatingCardViewController view](self, "view");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFrame:", v9, v11, width, height);

  }
}

- (CGRect)grabAreaBounds
{
  void *v3;
  CGFloat v4;
  void *v5;
  CGFloat Width;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect v11;
  CGRect v12;
  CGRect result;

  -[PXFloatingCardViewController backgroundView](self, "backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v4 = CGRectGetMaxY(v11) + -60.0;
  -[PXFloatingCardViewController backgroundView](self, "backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  Width = CGRectGetWidth(v12);

  v7 = 60.0;
  v8 = 0.0;
  v9 = v4;
  v10 = Width;
  result.size.height = v7;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (UIView)backgroundView
{
  return (UIView *)self->_backgroundVisualEffectView;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)contentSizeCategoryDidChangeNotification:(id)a3
{
  void *v4;
  id v5;

  -[PXFloatingCardViewController _systemFontWithTextStyle:weight:](self, "_systemFontWithTextStyle:weight:", 3, *MEMORY[0x1E0DC1448]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PXFloatingCardViewController headerLabel](self, "headerLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);

}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIView)grabberFooterView
{
  return self->_grabberFooterView;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (PXFloatingCardViewControllerDelegate)delegate
{
  return (PXFloatingCardViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (UIVisualEffectView)backgroundVisualEffectView
{
  return self->_backgroundVisualEffectView;
}

- (void)setBackgroundVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundVisualEffectView, a3);
}

- (UILabel)headerLabel
{
  return self->_headerLabel;
}

- (void)setHeaderLabel:(id)a3
{
  objc_storeStrong((id *)&self->_headerLabel, a3);
}

- (_UIGrabber)grabber
{
  return self->_grabber;
}

- (void)setGrabber:(id)a3
{
  objc_storeStrong((id *)&self->_grabber, a3);
}

- (UIViewController)contentViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_contentViewController);
}

- (void)setContentViewController:(id)a3
{
  objc_storeWeak((id *)&self->_contentViewController, a3);
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_destroyWeak((id *)&self->_contentViewController);
  objc_storeStrong((id *)&self->_grabber, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_backgroundVisualEffectView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_grabberFooterView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

uint64_t __62__PXFloatingCardViewController_initWithContentViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismissTapped");
}

@end
