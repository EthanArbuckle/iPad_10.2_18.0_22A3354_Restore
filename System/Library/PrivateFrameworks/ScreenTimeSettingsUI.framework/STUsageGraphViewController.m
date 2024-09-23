@implementation STUsageGraphViewController

- (STUsageGraphViewController)initWithTitleView:(id)a3 graphHeight:(double)a4 includePaddle:(BOOL)a5 useVibrancy:(BOOL)a6
{
  UIView *v10;
  STUsageGraphViewController *v11;
  UIView *titleView;
  objc_super v14;

  v10 = (UIView *)a3;
  v14.receiver = self;
  v14.super_class = (Class)STUsageGraphViewController;
  v11 = -[STUsageGraphViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  titleView = v11->_titleView;
  v11->_titleView = v10;

  v11->_graphHeight = a4;
  v11->_includePaddle = a5;
  v11->_useVibrancy = a6;
  -[STUsageGraphViewController _stUsageGraphViewControllerCommonInit](v11, "_stUsageGraphViewControllerCommonInit");
  return v11;
}

- (STUsageGraphViewController)initWithCoder:(id)a3
{
  STUsageGraphViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STUsageGraphViewController;
  v3 = -[STUsageGraphViewController initWithCoder:](&v5, sel_initWithCoder_, a3);
  -[STUsageGraphViewController _stUsageGraphViewControllerCommonInit](v3, "_stUsageGraphViewControllerCommonInit");
  return v3;
}

- (void)_stUsageGraphViewControllerCommonInit
{
  self->_week = 0x7FFFFFFFFFFFFFFFLL;
  self->_day = 0x7FFFFFFFFFFFFFFFLL;
}

- (void)loadView
{
  void *v4;
  uint64_t v5;
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
  uint64_t v21;
  void *v22;
  _BOOL4 v23;
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
  STHorizontalDivider *v77;
  void *v78;
  STHorizontalDivider *v79;
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
  id v101;
  id v102;
  id v103;
  void *v104;
  id v105;
  STHorizontalDivider *v106;
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
  double v130;
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
  STHorizontalDivider *v146;
  id v147;
  id v148;
  void *v149;
  _BOOL4 v150;
  id v151;
  void *v152;
  void *v153;
  _BOOL4 v154;
  void *v155;
  void *v156;
  void *v157;
  id v158;
  id v159;
  _QWORD v160[4];
  id v161;
  id v162;
  id v163;
  id v164;
  id v165;
  STHorizontalDivider *v166;
  id v167;
  BOOL v168;

  v4 = (void *)objc_opt_new();
  -[STUsageGraphViewController setView:](self, "setView:", v4);
  v5 = objc_opt_new();
  -[STUsageGraphViewController setGraphLayoutGuide:](self, "setGraphLayoutGuide:", v5);
  v157 = (void *)v5;
  objc_msgSend(v4, "addLayoutGuide:", v5);
  v6 = (void *)objc_opt_new();
  v154 = -[STUsageGraphViewController useVibrancy](self, "useVibrancy");
  if (v154)
  {
    objc_msgSend(MEMORY[0x24BEBDAF0], "widgetEffectForVibrancyStyle:", 102);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB38]), "initWithEffect:", v7);
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v4, "addSubview:", v8);
    objc_msgSend(v8, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v11);

    objc_msgSend(v8, "leadingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v14);

    objc_msgSend(v8, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v17);

    objc_msgSend(v8, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v20);

    objc_msgSend(v8, "contentView");
    v21 = objc_claimAutoreleasedReturnValue();
    -[STUsageGraphViewController setVibrancyEffectContentView:](self, "setVibrancyEffectContentView:", v21);

  }
  else
  {
    v21 = 0;
  }
  -[STUsageGraphViewController titleView](self, "titleView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[STUsageGraphViewController includePaddle](self, "includePaddle");
  v150 = v23;
  if (v22)
  {
    objc_msgSend(v4, "addSubview:", v22);
    objc_msgSend(v22, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v26);

    objc_msgSend(v22, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v29);

    objc_msgSend(v22, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v32);

LABEL_6:
    goto LABEL_8;
  }
  if (v23)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUsageGraphViewController.m"), 140, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!includePaddle"));
    goto LABEL_6;
  }
LABEL_8:
  v158 = (id)v21;
  objc_msgSend(v157, "leftAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leftAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v35);

  objc_msgSend(v157, "rightAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v38);

  objc_msgSend(v157, "bottomAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v41);

  v42 = (void *)objc_opt_new();
  -[STUsageGraphViewController setXAxisLabelSectionLayoutGuide:](self, "setXAxisLabelSectionLayoutGuide:", v42);
  objc_msgSend(v4, "addLayoutGuide:", v42);
  objc_msgSend(v42, "leftAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "leftAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v45);

  objc_msgSend(v42, "rightAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "rightAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v48);

  objc_msgSend(v42, "bottomAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "bottomAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v51);

  v52 = (void *)objc_opt_new();
  -[STUsageGraphViewController setYAxisLabelSectionLayoutGuide:](self, "setYAxisLabelSectionLayoutGuide:", v52);
  objc_msgSend(v4, "addLayoutGuide:", v52);
  objc_msgSend(v52, "topAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "topAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:", v54);
  v156 = v22;
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v55);

  objc_msgSend(v52, "rightAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "rightAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v58);

  objc_msgSend(v52, "bottomAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "bottomAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v61);

  v62 = (void *)objc_opt_new();
  -[STUsageGraphViewController setBarSectionLayoutGuide:](self, "setBarSectionLayoutGuide:", v62);
  objc_msgSend(v4, "addLayoutGuide:", v62);
  objc_msgSend(v62, "topAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "topAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v65);

  objc_msgSend(v62, "leftAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "leftAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintEqualToAnchor:", v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v68);

  objc_msgSend(v62, "bottomAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v153 = v42;
  objc_msgSend(v42, "topAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:", v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v71);

  objc_msgSend(v62, "rightAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "leftAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintLessThanOrEqualToAnchor:", v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v74);

  objc_msgSend(v62, "heightAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUsageGraphViewController graphHeight](self, "graphHeight");
  objc_msgSend(v75, "constraintEqualToConstant:");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v76);

  v77 = [STHorizontalDivider alloc];
  if (v154)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = -[STHorizontalDivider initWithTintColor:](v77, "initWithTintColor:", v78);

    -[STHorizontalDivider setTranslatesAutoresizingMaskIntoConstraints:](v79, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v80 = v158;
    objc_msgSend(v158, "addSubview:", v79);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGray3Color");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = -[STHorizontalDivider initWithTintColor:](v77, "initWithTintColor:", v81);

    -[STHorizontalDivider setTranslatesAutoresizingMaskIntoConstraints:](v79, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v4, "addSubview:", v79);
    v80 = v158;
  }
  -[STHorizontalDivider leftAnchor](v79, "leftAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "leftAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "constraintEqualToAnchor:", v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v84);

  -[STHorizontalDivider centerYAnchor](v79, "centerYAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "bottomAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "constraintEqualToAnchor:", v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v87);

  -[STHorizontalDivider rightAnchor](v79, "rightAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "rightAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "constraintEqualToAnchor:", v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v90);

  -[STHorizontalDivider horizontalLineRightAnchor](v79, "horizontalLineRightAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "rightAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "constraintEqualToAnchor:", v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v93);

  -[STHorizontalDivider label](v79, "label");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "leftAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v152 = v52;
  objc_msgSend(v52, "leftAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "constraintEqualToAnchor:", v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v97);

  v98 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v79, 0);
  v99 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 4);
  v100 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15E0]), "initWithIndexesInRange:", 1, 4);
  v160[0] = MEMORY[0x24BDAC760];
  v160[1] = 3221225472;
  v160[2] = __38__STUsageGraphViewController_loadView__block_invoke;
  v160[3] = &unk_24DB884B8;
  v159 = v4;
  v161 = v159;
  v101 = v98;
  v162 = v101;
  v102 = v6;
  v163 = v102;
  v103 = v99;
  v104 = v101;
  v148 = v103;
  v164 = v103;
  v168 = v154;
  v105 = v80;
  v165 = v105;
  v106 = v79;
  v166 = v106;
  v147 = v94;
  v167 = v147;
  v149 = v100;
  objc_msgSend(v100, "enumerateIndexesUsingBlock:", v160);
  objc_msgSend(v101, "lastObject");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "topAnchor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = v156;
  if (v156)
  {
    objc_msgSend(v156, "bottomAnchor");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v109, 1.0);
  }
  else
  {
    objc_msgSend(v159, "topAnchor");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "constraintEqualToAnchor:", v109);
  }
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "addObject:", v110);

  objc_msgSend(v155, "centerYAnchor");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "topAnchor");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "constraintEqualToAnchor:", v112);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "addObject:", v113);

  -[STUsageGraphViewController setHorizontalDividers:](self, "setHorizontalDividers:", v104);
  if (v150)
  {
    v151 = v105;
    v114 = (void *)objc_opt_new();
    objc_msgSend(v114, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v114, "setHidden:", 1);
    -[STUsageGraphViewController setPaddleView:](self, "setPaddleView:", v114);
    objc_msgSend(v159, "addSubview:", v114);
    objc_msgSend(v114, "topAnchor");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "topAnchor");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "constraintEqualToAnchor:", v116);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "addObject:", v117);

    objc_msgSend(v114, "leftAnchor");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "leftAnchor");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "constraintGreaterThanOrEqualToAnchor:", v119);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "addObject:", v120);

    objc_msgSend(v114, "bottomAnchor");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "bottomAnchor");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "constraintEqualToAnchor:", v122);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "addObject:", v123);

    objc_msgSend(v114, "rightAnchor");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "rightAnchor");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "constraintLessThanOrEqualToAnchor:", v125);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "addObject:", v126);

    objc_msgSend(v114, "centerXAnchor");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "centerXAnchor");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "constraintEqualToAnchor:", v128);
    v129 = (void *)objc_claimAutoreleasedReturnValue();

    -[STUsageGraphViewController setPaddleViewCenterXConstraint:](self, "setPaddleViewCenterXConstraint:", v129);
    LODWORD(v130) = 1132068864;
    objc_msgSend(v129, "setPriority:", v130);
    objc_msgSend(v102, "addObject:", v129);
    v131 = (void *)objc_opt_new();
    objc_msgSend(v131, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v131, "setHidden:", 1);
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGreenColor");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "setBackgroundColor:", v132);

    -[STUsageGraphViewController setPaddleConnectorView:](self, "setPaddleConnectorView:", v131);
    objc_msgSend(v159, "addSubview:", v131);
    objc_msgSend(v131, "topAnchor");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "bottomAnchor");
    v146 = v106;
    v134 = v104;
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "constraintEqualToAnchor:", v135);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "addObject:", v136);

    objc_msgSend(v131, "bottomAnchor");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "bottomAnchor");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "constraintEqualToAnchor:", v138);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "addObject:", v139);

    objc_msgSend(v131, "widthAnchor");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "constraintEqualToConstant:", 1.0);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "addObject:", v141);

    objc_msgSend(v131, "centerXAnchor");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "centerXAnchor");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "constraintEqualToAnchor:", v143);
    v144 = (void *)objc_claimAutoreleasedReturnValue();

    -[STUsageGraphViewController setPaddleViewConnectorCenterXConstraint:](self, "setPaddleViewConnectorCenterXConstraint:", v144);
    objc_msgSend(v102, "addObject:", v144);
    v145 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD740]), "initWithTarget:action:", self, sel__handleLongPressGestureForPaddle_);
    objc_msgSend(v145, "setMinimumPressDuration:", 0.1);

    v104 = v134;
    v106 = v146;
    v108 = v156;

    v105 = v151;
  }
  else
  {
    v145 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD740]), "initWithTarget:action:", self, sel__handleLongPressGestureForBarSelection_);
    objc_msgSend(v145, "setMinimumPressDuration:", 0.0);
  }
  objc_msgSend(v145, "setDelegate:", self);
  objc_msgSend(v159, "addGestureRecognizer:", v145);
  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v102);

}

void __38__STUsageGraphViewController_loadView__block_invoke(uint64_t a1, uint64_t a2)
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  STHorizontalDivider *v22;
  void *v23;
  STHorizontalDivider *v24;
  uint64_t v25;
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
  void *v44;
  void *v45;
  void *v46;
  id v47;

  v47 = (id)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "addLayoutGuide:", v47);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2 - 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 48);
  objc_msgSend(v47, "leftAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leftAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v8);

  v9 = *(void **)(a1 + 48);
  objc_msgSend(v47, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerYAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v12);

  v13 = *(void **)(a1 + 48);
  objc_msgSend(v47, "rightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v16);

  objc_msgSend(*(id *)(a1 + 56), "lastObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = *(void **)(a1 + 48);
    objc_msgSend(v47, "heightAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "heightAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v21);

  }
  objc_msgSend(*(id *)(a1 + 56), "addObject:", v47);
  v22 = [STHorizontalDivider alloc];
  if (*(_BYTE *)(a1 + 88))
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGray3Color");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[STHorizontalDivider initWithTintColor:](v22, "initWithTintColor:", v23);

  -[STHorizontalDivider setTranslatesAutoresizingMaskIntoConstraints:](v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v25 = 64;
  if (!*(_BYTE *)(a1 + 88))
    v25 = 32;
  objc_msgSend(*(id *)(a1 + v25), "addSubview:", v24);
  v26 = *(void **)(a1 + 48);
  -[STHorizontalDivider leftAnchor](v24, "leftAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "leftAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObject:", v29);

  v30 = *(void **)(a1 + 48);
  -[STHorizontalDivider centerYAnchor](v24, "centerYAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:", v33);

  v34 = *(void **)(a1 + 48);
  -[STHorizontalDivider rightAnchor](v24, "rightAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "rightAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addObject:", v37);

  v38 = *(void **)(a1 + 48);
  -[STHorizontalDivider horizontalLineRightAnchor](v24, "horizontalLineRightAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 72), "horizontalLineRightAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addObject:", v41);

  v42 = *(void **)(a1 + 48);
  -[STHorizontalDivider label](v24, "label");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "leftAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 80), "leftAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addObject:", v46);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v24);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  _BOOL8 v26;
  void *v27;
  uint8_t v28[16];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;
  CGRect v35;
  CGRect v36;

  v34 = *MEMORY[0x24BDAC8D0];
  -[STUsageGraphViewController dataSet](self, "dataSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "timePeriod");

  if (v4 == 2)
  {
    -[STUsageGraphViewController weeklyAverageLabel](self, "weeklyAverageLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      v7 = objc_msgSend(v5, "isHidden") ^ 1;
    else
      v7 = 0;
    objc_msgSend(v6, "frame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[STUsageGraphViewController horizontalDividers](self, "horizontalDividers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v30 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          if (v7)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "frame");
            v36.origin.x = v22;
            v36.origin.y = v23;
            v36.size.width = v24;
            v36.size.height = v25;
            v35.origin.x = v9;
            v35.origin.y = v11;
            v35.size.width = v13;
            v35.size.height = v15;
            v26 = CGRectIntersectsRect(v35, v36);
          }
          else
          {
            v26 = 0;
          }
          objc_msgSend(v21, "label");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setHidden:", v26);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v18);
    }

  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v28 = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STUsageGraphViewController.viewDidLayoutSubviews", v28, 2u);
  }
}

- (void)setDataSet:(id)a3
{
  -[STUsageGraphViewController setDataSet:animated:](self, "setDataSet:animated:", a3, 0);
}

- (void)setDataSet:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  STUsageReportGraphDataSet *v8;
  STUsageReportGraphDataSet **p_dataSet;
  void *v10;
  uint64_t v11;
  void *v12;
  _BOOL8 v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t m;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  SEL v48;
  _QWORD v49[4];
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v4 = a4;
  v71 = *MEMORY[0x24BDAC8D0];
  v8 = (STUsageReportGraphDataSet *)a3;
  p_dataSet = &self->_dataSet;
  if (self->_dataSet != v8)
  {
    v48 = a2;
    -[STUsageGraphViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[STUsageReportGraphDataSet timePeriod](v8, "timePeriod");
    if (*p_dataSet)
    {
      if (-[STUsageReportGraphDataSet timePeriod](*p_dataSet, "timePeriod") == v11)
      {
        -[STUsageReportGraphDataSet dataPoints](*p_dataSet, "dataPoints");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v11;
        v13 = v4;
        v14 = objc_msgSend(v12, "count");
        -[STUsageReportGraphDataSet dataPoints](v8, "dataPoints");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count");

        v17 = v14 == v16;
        v4 = v13;
        v11 = v47;
        if (v17)
        {
          objc_storeStrong((id *)&self->_dataSet, a3);
          -[STUsageGraphViewController _updateBarViewsAndIndicators](self, "_updateBarViewsAndIndicators");
LABEL_43:
          -[STUsageGraphViewController _setUpHorizontalDividerLabels](self, "_setUpHorizontalDividerLabels");
          if (v11 == 2
            && (-[STUsageReportGraphDataSet averageAsPercentageOfMax](v8, "averageAsPercentageOfMax"), v43 > 0.05))
          {
            -[STUsageGraphViewController setUpWeeklyAverageLine:](self, "setUpWeeklyAverageLine:", v4);
            if (!v4)
            {
LABEL_46:
              -[STUsageGraphViewController setUpBarViewHeightContraints](self, "setUpBarViewHeightContraints");
LABEL_49:

              goto LABEL_50;
            }
          }
          else
          {
            -[STUsageGraphViewController weeklyAverageLine](self, "weeklyAverageLine");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "setHidden:", 1);

            -[STUsageGraphViewController weeklyAverageLabel](self, "weeklyAverageLabel");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "setHidden:", 1);

            if (!v4)
              goto LABEL_46;
          }
          objc_msgSend(v10, "layoutIfNeeded");
          -[STUsageGraphViewController setUpBarViewHeightContraints](self, "setUpBarViewHeightContraints");
          v46 = (void *)MEMORY[0x24BEBDB00];
          v49[0] = MEMORY[0x24BDAC760];
          v49[1] = 3221225472;
          v49[2] = __50__STUsageGraphViewController_setDataSet_animated___block_invoke;
          v49[3] = &unk_24DB86440;
          v50 = v10;
          objc_msgSend(v46, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v49, 0, 0.6, 0.0, 0.9, 0.1);

          goto LABEL_49;
        }
      }
    }
    objc_storeStrong((id *)&self->_dataSet, a3);
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    -[STUsageGraphViewController verticalDividers](self, "verticalDividers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v64 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * i), "removeFromSuperview");
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
      }
      while (v20);
    }

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    -[STUsageGraphViewController barViews](self, "barViews");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v60;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v60 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * j), "removeFromSuperview");
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
      }
      while (v25);
    }

    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    -[STUsageGraphViewController barIndicators](self, "barIndicators");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v56;
      do
      {
        for (k = 0; k != v30; ++k)
        {
          if (*(_QWORD *)v56 != v31)
            objc_enumerationMutation(v28);
          objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * k), "removeFromSuperview");
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
      }
      while (v30);
    }

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    -[STUsageGraphViewController verticalLayoutGuides](self, "verticalLayoutGuides");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v52;
      do
      {
        for (m = 0; m != v35; ++m)
        {
          if (*(_QWORD *)v52 != v36)
            objc_enumerationMutation(v33);
          objc_msgSend(v10, "removeLayoutGuide:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * m));
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
      }
      while (v35);
    }

    -[STUsageGraphViewController paddleView](self, "paddleView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setHidden:", 1);

    -[STUsageGraphViewController paddleConnectorView](self, "paddleConnectorView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setHidden:", 1);

    v40 = (void *)objc_opt_new();
    objc_msgSend(v40, "setFormattingContext:", 3);
    if (v11 == 2)
    {
      v42 = CFSTR("ccccc");
    }
    else
    {
      if (v11 != 1)
      {
        if (!v11)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", v48, self, CFSTR("STUsageGraphViewController.m"), 321, CFSTR("We don't have a graph for hourly reports."));

        }
        goto LABEL_42;
      }
      v42 = CFSTR("hj");
    }
    objc_msgSend(v40, "setLocalizedDateFormatFromTemplate:", v42);
LABEL_42:
    -[STUsageGraphViewController setUpGraphWithLabelFormatter:](self, "setUpGraphWithLabelFormatter:", v40);

    goto LABEL_43;
  }
LABEL_50:

}

uint64_t __50__STUsageGraphViewController_setDataSet_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setSelectedWeekday:(int64_t)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  STUsageGraphViewController *v15;
  id v16;
  int64_t v17;

  -[STUsageGraphViewController dataSet](self, "dataSet");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "timePeriod") != 2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUsageGraphViewController.m"), 363, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSet.timePeriod == STUsageReportTimePeriodWeek"));

  }
  if (self->_selectedWeekday != a3)
  {
    self->_selectedWeekday = a3;
    -[STUsageGraphViewController barViews](self, "barViews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[STUsageGraphViewController _selectBarView:](self, "_selectBarView:", 0);
    }
    else if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dataPoints");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __49__STUsageGraphViewController_setSelectedWeekday___block_invoke;
      v13[3] = &unk_24DB884E0;
      v17 = a3;
      v14 = v8;
      v15 = self;
      v16 = v7;
      v10 = v8;
      objc_msgSend(v9, "enumerateObjectsUsingBlock:", v13);

    }
  }

}

void __49__STUsageGraphViewController_setSelectedWeekday___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v7 = *(void **)(a1 + 32);
  objc_msgSend(a2, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "component:fromDate:", 512, v8);
  v10 = *(_QWORD *)(a1 + 56);

  if (v9 == v10)
  {
    v11 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_selectBarView:", v12);

    *a4 = 1;
  }
}

- (void)setPressedBarView:(id)a3
{
  STBarView *v4;
  STBarView *pressedBarView;
  STBarView *v6;

  v4 = (STBarView *)a3;
  -[STBarView setDarkened:](self->_pressedBarView, "setDarkened:", 0);
  pressedBarView = self->_pressedBarView;
  self->_pressedBarView = v4;
  v6 = v4;

  -[STBarView setDarkened:](v6, "setDarkened:", 1);
}

- (double)maximumYAxisLabelWidth
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[STUsageGraphViewController weeklyAverageLabel](self, "weeklyAverageLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  v5 = v4;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[STUsageGraphViewController horizontalDividers](self, "horizontalDividers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "label");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
        v13 = v12;

        if (v5 < v13)
          v5 = v13;
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)setYAxisLabelSectionWidth:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[STUsageGraphViewController yAxisLabelSectionWidthConstraint](self, "yAxisLabelSectionWidthConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v8 = v5;
    objc_msgSend(v5, "setConstant:", a3);
  }
  else
  {
    -[STUsageGraphViewController yAxisLabelSectionLayoutGuide](self, "yAxisLabelSectionLayoutGuide");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "widthAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToConstant:", a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setActive:", 1);
    -[STUsageGraphViewController setYAxisLabelSectionWidthConstraint:](self, "setYAxisLabelSectionWidthConstraint:", v8);
  }

}

- (void)_setUpHorizontalDividerLabels
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  _QWORD v18[6];
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  double v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  -[STUsageGraphViewController dataSet](self, "dataSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "itemType");
  if ((unint64_t)(v4 - 1) >= 4)
  {
    if ((unint64_t)(v4 - 5) < 2)
    {
      v23 = 0;
      v24 = &v23;
      v25 = 0x2020000000;
      v26 = 0;
      objc_msgSend(v3, "max");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "doubleValue");
      v16 = v15;

      -[STUsageGraphViewController horizontalDividers](self, "horizontalDividers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18[1] = 3221225472;
      v18[0] = MEMORY[0x24BDAC760];
      v18[2] = __59__STUsageGraphViewController__setUpHorizontalDividerLabels__block_invoke_2;
      v18[3] = &unk_24DB88530;
      v18[4] = &v23;
      *(double *)&v18[5] = v16 / (double)4uLL;
      objc_msgSend(v17, "enumerateObjectsUsingBlock:", v18);

      _Block_object_dispose(&v23, 8);
    }
  }
  else
  {
    v5 = objc_msgSend(v3, "timePeriod");
    objc_msgSend(v3, "max");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "setFormattingContext:", 3);
    if (v8 <= 3600.0 && v5 == 1)
      v11 = 64;
    else
      v11 = 32;
    objc_msgSend(v9, "setAllowedUnits:", v11);
    objc_msgSend(v9, "setUnitsStyle:", 1);
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0;
    -[STUsageGraphViewController horizontalDividers](self, "horizontalDividers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __59__STUsageGraphViewController__setUpHorizontalDividerLabels__block_invoke;
    v19[3] = &unk_24DB88508;
    v21 = &v23;
    v13 = v9;
    v20 = v13;
    v22 = v8 / (double)4uLL;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v19);

    _Block_object_dispose(&v23, 8);
  }

}

void __59__STUsageGraphViewController__setUpHorizontalDividerLabels__block_invoke(uint64_t a1, void *a2, char a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a2, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  if ((a3 & 1) != 0)
  {
    objc_msgSend(v5, "setText:", 0);
  }
  else if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == 0.0)
  {
    v6 = (void *)MEMORY[0x24BDD16F0];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringFromNumber:numberStyle:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "stringFromTimeInterval:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v9);

  }
  objc_msgSend(v10, "setHidden:", 0);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(a1 + 48)
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24);

}

void __59__STUsageGraphViewController__setUpHorizontalDividerLabels__block_invoke_2(uint64_t a1, void *a2, char a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a2, "label");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((a3 & 1) != 0)
  {
    objc_msgSend(v8, "setText:", 0);
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDD16F0];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringFromNumber:numberStyle:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v7);

  }
  objc_msgSend(v8, "setHidden:", 0);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(double *)(a1 + 40)
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);

}

- (void)setUpGraphWithLabelFormatter:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  double v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  SEL v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  STUsageGraphViewController *v61;
  void *v62;
  void *v63;

  v53 = a3;
  v61 = self;
  -[STUsageGraphViewController dataSet](self, "dataSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataPoints");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v56, "count");
  if (!v6)
    goto LABEL_37;
  v7 = v6;
  v49 = a2;
  v50 = v5;
  v8 = objc_msgSend(v5, "timePeriod");
  v52 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v7);
  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v7);
  v62 = 0;
  v63 = 0;
  v10 = 0;
  v11 = 0;
  v58 = v8;
  if (v8 == 1)
    v12 = 0.5;
  else
    v12 = 1.0;
  v54 = v7;
  do
  {
    objc_msgSend(v56, "objectAtIndexedSubscript:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "date");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v59 = v13;
    if (v58 != 2)
    {
      if (v58 != 1)
        goto LABEL_14;
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "component:fromDate:", 32, v14);

      v17 = __ROR8__(v16, 1);
      v13 = v59;
      v18 = (1 << v17) & 0x249;
      if (v17 > 9 || v18 == 0)
      {
LABEL_14:

        if (v63)
        {
          v20 = 0;
          v21 = 0;
          ++v10;
          goto LABEL_18;
        }
LABEL_16:
        -[STUsageGraphViewController createFirstDivider](v61, "createFirstDivider");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0;
        goto LABEL_17;
      }
    }

    if (!v63)
      goto LABEL_16;
    v20 = (void *)objc_opt_new();
    objc_msgSend(v9, "addObject:", v20);
    -[STUsageGraphViewController createDividerWithView:layoutGuide:previousLayoutGuide:layoutGuideWidthMultiplier:](v61, "createDividerWithView:layoutGuide:previousLayoutGuide:layoutGuideWidthMultiplier:", v63, v20, v62, v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
    objc_msgSend(v53, "stringFromDate:", v14);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setLabelText:", v22);

    objc_msgSend(v52, "addObject:", v21);
    v10 = 0;
    v13 = v59;
LABEL_18:
    if (v21)
      v23 = v21;
    else
      v23 = v63;
    v24 = v23;

    if (v20)
      v25 = v20;
    else
      v25 = v62;
    v26 = v25;

    v27 = objc_opt_new();
    v62 = (void *)v27;
    objc_msgSend(v9, "addObject:", v27);
    if (!v24)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", v49, v61, CFSTR("STUsageGraphViewController.m"), 517, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("previousView"));

    }
    if (v10 == 1)
      v28 = 2.0;
    else
      v28 = 1.0;
    -[STUsageGraphViewController createBarViewWithDataPoint:layoutGuide:previousView:previousLayoutGuide:layoutGuideWidthMultiplier:](v61, "createBarViewWithDataPoint:layoutGuide:previousView:previousLayoutGuide:layoutGuideWidthMultiplier:", v13, v27, v24, v26, v28);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "addObject:");
    objc_msgSend(v13, "indicatorImageName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      -[STUsageGraphViewController createBarIndicatorWithImageName:barView:](v61, "createBarIndicatorWithImageName:barView:", v29, v63);
      v57 = v21;
      v30 = v11;
      v31 = v10;
      v32 = v14;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "indicatorImageColor");
      v34 = v26;
      v35 = v9;
      v36 = v24;
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setTintColor:", v37);

      v24 = v36;
      v9 = v35;
      v26 = v34;
      v13 = v59;
      objc_msgSend(v51, "addObject:", v33);

      v14 = v32;
      v10 = v31;
      v11 = v30;
      v21 = v57;
    }
    if (!v11)
    {
      -[STUsageGraphViewController paddleView](v61, "paddleView");
      v38 = v10;
      v39 = v14;
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setDataPoint:", v13);

      v14 = v39;
      v10 = v38;
      v11 = 0;
    }

    ++v11;
  }
  while (v54 != v11);
  v42 = (void *)objc_opt_new();
  objc_msgSend(v9, "addObject:", v42);
  v60 = v9;
  if (!v63)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", v49, v61, CFSTR("STUsageGraphViewController.m"), 543, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("previousView"));

  }
  -[STUsageGraphViewController createDividerWithView:layoutGuide:previousLayoutGuide:layoutGuideWidthMultiplier:](v61, "createDividerWithView:layoutGuide:previousLayoutGuide:layoutGuideWidthMultiplier:", v63, v42, v62, v12);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "addObject:", v43);
  objc_msgSend(v43, "rightAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUsageGraphViewController barSectionLayoutGuide](v61, "barSectionLayoutGuide");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "rightAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setActive:", 1);

  -[STUsageGraphViewController setVerticalDividers:](v61, "setVerticalDividers:", v52);
  -[STUsageGraphViewController setVerticalLayoutGuides:](v61, "setVerticalLayoutGuides:", v60);
  -[STUsageGraphViewController setBarViews:](v61, "setBarViews:", v55);
  -[STUsageGraphViewController setBarIndicators:](v61, "setBarIndicators:", v51);

  v5 = v50;
LABEL_37:

}

- (void)setUpBarViewHeightContraints
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[STUsageGraphViewController barViewHeightConstraints](self, "barViewHeightConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v7++), "setActive:", 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }

  -[STUsageGraphViewController barViews](self, "barViews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUsageGraphViewController barSectionLayoutGuide](self, "barSectionLayoutGuide");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "heightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[STUsageGraphViewController dataSet](self, "dataSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dataPoints");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __58__STUsageGraphViewController_setUpBarViewHeightContraints__block_invoke;
  v17[3] = &unk_24DB88558;
  v18 = v12;
  v19 = v10;
  v20 = v13;
  v14 = v13;
  v15 = v10;
  v16 = v12;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v17);
  -[STUsageGraphViewController setBarViewHeightConstraints:](self, "setBarViewHeightConstraints:", v14);

}

void __58__STUsageGraphViewController_setUpBarViewHeightContraints__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "heightAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v10, "totalAsPercentageOfMax");
  objc_msgSend(v7, "constraintEqualToAnchor:multiplier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setActive:", 1);
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v9);

}

- (void)_updateBarViewsAndIndicators
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  STUsageGraphViewController *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[STUsageGraphViewController barIndicators](self, "barIndicators");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v7++), "removeFromSuperview");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }

  -[STUsageGraphViewController dataSet](self, "dataSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataPoints");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v9, "count"));
  -[STUsageGraphViewController barViews](self, "barViews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __58__STUsageGraphViewController__updateBarViewsAndIndicators__block_invoke;
  v14[3] = &unk_24DB88558;
  v15 = v9;
  v16 = self;
  v17 = v10;
  v12 = v10;
  v13 = v9;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v14);

  -[STUsageGraphViewController setBarIndicators:](self, "setBarIndicators:", v12);
}

void __58__STUsageGraphViewController__updateBarViewsAndIndicators__block_invoke(id *a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(a1[4], "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDataPoint:", v5);
  objc_msgSend(v5, "indicatorImageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(a1[5], "createBarIndicatorWithImageName:barView:", v6, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "indicatorImageColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTintColor:", v8);

    objc_msgSend(a1[6], "addObject:", v7);
  }

}

- (void)setUpWeeklyAverageLine:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
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
  id v23;

  v3 = a3;
  -[STUsageGraphViewController view](self, "view");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  -[STUsageGraphViewController weeklyAverageLine](self, "weeklyAverageLine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUsageGraphViewController weeklyAverageLayoutGuide](self, "weeklyAverageLayoutGuide");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v23, "bringSubviewToFront:", v5);
    objc_msgSend(v5, "setHidden:", 0);
    -[STUsageGraphViewController weeklyAverageLabel](self, "weeklyAverageLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 0);

  }
  else
  {
    v8 = objc_opt_new();

    -[STUsageGraphViewController setWeeklyAverageLayoutGuide:](self, "setWeeklyAverageLayoutGuide:", v8);
    -[STUsageGraphViewController createWeeklyAverageLineWithLayoutGuide:](self, "createWeeklyAverageLineWithLayoutGuide:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUsageGraphViewController setWeeklyAverageLine:](self, "setWeeklyAverageLine:", v5);
    v6 = (void *)v8;
  }
  -[STUsageGraphViewController barSectionLayoutGuide](self, "barSectionLayoutGuide");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUsageGraphViewController weeklyAverageHeightConstraint](self, "weeklyAverageHeightConstraint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActive:", 0);
  objc_msgSend(v6, "heightAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "heightAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUsageGraphViewController dataSet](self, "dataSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "averageAsPercentageOfMax");
  objc_msgSend(v11, "constraintEqualToAnchor:multiplier:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setActive:", 1);
  -[STUsageGraphViewController setWeeklyAverageHeightConstraint:](self, "setWeeklyAverageHeightConstraint:", v14);
  -[STUsageGraphViewController weeklyAverageTrailingConstraint](self, "weeklyAverageTrailingConstraint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v3)
  {
    objc_msgSend(v15, "setActive:", 0);
    objc_msgSend(v5, "rightAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "leftAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "setActive:", 1);
    objc_msgSend(v23, "layoutIfNeeded");
    v16 = v19;
  }
  objc_msgSend(v16, "setActive:", 0);
  objc_msgSend(v5, "rightAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rightAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "setActive:", 1);
  -[STUsageGraphViewController setWeeklyAverageTrailingConstraint:](self, "setWeeklyAverageTrailingConstraint:", v22);

}

- (id)createFirstDivider
{
  void *v3;
  STDashedVerticalDivider *v4;
  void *v5;
  STDashedVerticalDivider *v6;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];

  v29[4] = *MEMORY[0x24BDAC8D0];
  -[STUsageGraphViewController vibrancyEffectContentView](self, "vibrancyEffectContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [STDashedVerticalDivider alloc];
  v28 = v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemDarkGrayColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[STDashedVerticalDivider initWithTintColor:](v4, "initWithTintColor:", v5);

    -[STDashedVerticalDivider setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v3, "addSubview:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGray3Color");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[STDashedVerticalDivider initWithTintColor:](v4, "initWithTintColor:", v7);

    -[STDashedVerticalDivider setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[STUsageGraphViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v6);

  }
  -[STUsageGraphViewController graphLayoutGuide](self, "graphLayoutGuide");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x24BDD1628];
  -[STDashedVerticalDivider topAnchor](v6, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v9;
  objc_msgSend(v9, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v25;
  -[STDashedVerticalDivider leftAnchor](v6, "leftAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUsageGraphViewController xAxisLabelSectionLayoutGuide](self, "xAxisLabelSectionLayoutGuide");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "leftAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v10;
  -[STDashedVerticalDivider bottomAnchor](v6, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v13;
  -[STDashedVerticalDivider labelTopAnchor](v6, "labelTopAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUsageGraphViewController barSectionLayoutGuide](self, "barSectionLayoutGuide");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16, 6.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "activateConstraints:", v18);

  return v6;
}

- (id)createDividerWithView:(id)a3 layoutGuide:(id)a4 previousLayoutGuide:(id)a5 layoutGuideWidthMultiplier:(double)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  STDashedVerticalDivider *v15;
  void *v16;
  STDashedVerticalDivider *v17;
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
  void *v44;
  void *v45;
  void *v47;

  v10 = a4;
  v11 = a5;
  v12 = a3;
  -[STUsageGraphViewController vibrancyEffectContentView](self, "vibrancyEffectContentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUsageGraphViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = [STDashedVerticalDivider alloc];
  v47 = v11;
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemDarkGrayColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[STDashedVerticalDivider initWithTintColor:](v15, "initWithTintColor:", v16);

    -[STDashedVerticalDivider setTranslatesAutoresizingMaskIntoConstraints:](v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v18 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGray3Color");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[STDashedVerticalDivider initWithTintColor:](v15, "initWithTintColor:", v19);

    -[STDashedVerticalDivider setTranslatesAutoresizingMaskIntoConstraints:](v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v18 = v14;
  }
  objc_msgSend(v18, "addSubview:", v17);
  -[STUsageGraphViewController graphLayoutGuide](self, "graphLayoutGuide");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[STDashedVerticalDivider topAnchor](v17, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setActive:", 1);

  -[STDashedVerticalDivider bottomAnchor](v17, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setActive:", 1);

  -[STDashedVerticalDivider labelTopAnchor](v17, "labelTopAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUsageGraphViewController barSectionLayoutGuide](self, "barSectionLayoutGuide");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:constant:", v29, 6.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setActive:", 1);

  objc_msgSend(v14, "addLayoutGuide:", v10);
  objc_msgSend(v10, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setActive:", 1);

  objc_msgSend(v10, "leftAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rightAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "constraintEqualToAnchor:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setActive:", 1);

  objc_msgSend(v10, "bottomAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bottomAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setActive:", 1);

  objc_msgSend(v10, "rightAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[STDashedVerticalDivider dashedLineCenterXAnchor](v17, "dashedLineCenterXAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setActive:", 1);

  if (v47)
  {
    objc_msgSend(v10, "widthAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "widthAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:multiplier:", v44, a6);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setActive:", 1);

  }
  return v17;
}

- (id)createBarViewWithDataPoint:(id)a3 layoutGuide:(id)a4 previousView:(id)a5 previousLayoutGuide:(id)a6 layoutGuideWidthMultiplier:(double)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  STBarView *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
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

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a3;
  v16 = -[STBarView initWithDataPoint:useVibrancy:]([STBarView alloc], "initWithDataPoint:useVibrancy:", v15, -[STUsageGraphViewController useVibrancy](self, "useVibrancy"));

  -[STBarView setTranslatesAutoresizingMaskIntoConstraints:](v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[STUsageGraphViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", v16);
  -[STUsageGraphViewController barSectionLayoutGuide](self, "barSectionLayoutGuide");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBarView bottomAnchor](v16, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  -[STUsageGraphViewController dataSet](self, "dataSet");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "timePeriod");
  objc_msgSend(v22, "dataPoints");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  if (v25)
  {
    v26 = 0.7;
    if (v23 != 1)
      v26 = 0.5;
    v27 = (double)v25;
    if ((double)v25 < 1.0)
      v27 = 1.0;
    v28 = v26 / v27;
  }
  else
  {
    v28 = 0.0;
  }
  -[STBarView widthAnchor](v16, "widthAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "widthAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:multiplier:", v30, v28);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setActive:", 1);

  objc_msgSend(v17, "addLayoutGuide:", v12);
  objc_msgSend(v12, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setActive:", 1);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v35 = v13;
    objc_msgSend(v12, "leftAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "dashedLineCenterXAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v12, "leftAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "rightAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v36, "constraintEqualToAnchor:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setActive:", 1);

  objc_msgSend(v12, "bottomAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bottomAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setActive:", 1);

  objc_msgSend(v12, "rightAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBarView leftAnchor](v16, "leftAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setActive:", 1);

  if (v14)
  {
    objc_msgSend(v12, "widthAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "widthAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:multiplier:", v46, a7);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setActive:", 1);

  }
  return v16;
}

- (id)createWeeklyAverageLineWithLayoutGuide:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
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
  double v17;
  double v18;
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
  id v30;
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
  void *v52;
  _QWORD v53[11];

  v53[9] = *MEMORY[0x24BDAC8D0];
  v4 = (objc_class *)MEMORY[0x24BEBD668];
  v5 = a3;
  v6 = [v4 alloc];
  -[STUsageGraphViewController dashedAverageLineImage](self, "dashedAverageLineImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithImage:", v7);

  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGreenColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTintColor:", v9);

  -[STUsageGraphViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v8);
  -[STUsageGraphViewController barSectionLayoutGuide](self, "barSectionLayoutGuide");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v10;
  objc_msgSend(v10, "addLayoutGuide:", v5);
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v13);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGreenColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTextColor:", v14);

  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("DailyAverageLineLabel"), &stru_24DB8A1D0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v16);

  LODWORD(v17) = 1144750080;
  objc_msgSend(v12, "setContentHuggingPriority:forAxis:", 0, v17);
  LODWORD(v18) = 1144766464;
  objc_msgSend(v12, "setContentCompressionResistancePriority:forAxis:", 0, v18);
  -[STUsageGraphViewController setWeeklyAverageLabel:](self, "setWeeklyAverageLabel:", v12);
  objc_msgSend(v10, "addSubview:", v12);
  -[STUsageGraphViewController yAxisLabelSectionLayoutGuide](self, "yAxisLabelSectionLayoutGuide");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v8, "leftAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leftAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v50);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v49;
  objc_msgSend(v8, "heightAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToConstant:", 1.5);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v47;
  objc_msgSend(v5, "leftAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leftAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v44);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v53[2] = v43;
  objc_msgSend(v5, "bottomAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v11;
  objc_msgSend(v11, "bottomAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v53[3] = v40;
  objc_msgSend(v5, "rightAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rightAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v53[4] = v36;
  objc_msgSend(v5, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "centerYAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v53[5] = v32;
  objc_msgSend(v12, "leftAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v19;
  objc_msgSend(v19, "leftAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v53[6] = v21;
  objc_msgSend(v12, "centerYAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v8;
  objc_msgSend(v8, "centerYAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v53[7] = v24;
  objc_msgSend(v12, "rightAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "rightAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v53[8] = v27;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 9);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "activateConstraints:", v28);

  return v30;
}

- (id)createBarIndicatorWithImageName:(id)a3 barView:(id)a4
{
  void *v6;
  id v7;
  id v8;
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

  v6 = (void *)MEMORY[0x24BEBD640];
  v7 = a4;
  v8 = a3;
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageNamed:inBundle:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v10);
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[STUsageGraphViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v11);

  objc_msgSend(v11, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActive:", 1);

  objc_msgSend(v11, "centerXAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "centerXAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  return v11;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)_handleLongPressGestureForPaddle:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  _QWORD v21[5];
  CGPoint v22;
  CGRect v23;

  v4 = a3;
  -[STUsageGraphViewController barViews](self, "barViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    if ((unint64_t)objc_msgSend(v4, "state") > 2)
    {
      -[STUsageGraphViewController paddleView](self, "paddleView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setHidden:", 1);

      -[STUsageGraphViewController paddleConnectorView](self, "paddleConnectorView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setHidden:", 1);

      -[STUsageGraphViewController selectedBarView](self, "selectedBarView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setColor:", 0);

      -[STUsageGraphViewController titleView](self, "titleView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "alpha");
      v20 = v19;

      if (v20 <= 0.00000011920929)
      {
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 3221225472;
        v21[2] = __63__STUsageGraphViewController__handleLongPressGestureForPaddle___block_invoke;
        v21[3] = &unk_24DB86440;
        v21[4] = self;
        objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v21, 0.2);
      }
    }
    else
    {
      -[STUsageGraphViewController view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "locationInView:", v7);
      v9 = v8;
      v11 = v10;

      -[STUsageGraphViewController graphLayoutGuide](self, "graphLayoutGuide");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "layoutFrame");
      v22.x = v9;
      v22.y = v11;
      v13 = CGRectContainsPoint(v23, v22);

      if (v13)
      {
        -[STUsageGraphViewController _closestBarViewToPoint:](self, "_closestBarViewToPoint:", v9, v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[STUsageGraphViewController _showPaddleForBarView:](self, "_showPaddleForBarView:", v14);

      }
    }
  }

}

void __63__STUsageGraphViewController__handleLongPressGestureForPaddle___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "titleView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (id)_closestBarViewToPoint:(CGPoint)a3
{
  double x;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;
  CGRect v26;

  x = a3.x;
  v25 = *MEMORY[0x24BDAC8D0];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[STUsageGraphViewController barViews](self, "barViews", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v21;
    v9 = 1.79769313e308;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v11, "dataPoint");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "total");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "doubleValue");
        v15 = v14;

        if (v15 > 0.0)
        {
          objc_msgSend(v11, "frame");
          v16 = CGRectGetMidX(v26) - x;
          if (v16 >= 0.0)
            v17 = v16;
          else
            v17 = -v16;
          if (v17 < v9)
          {
            v18 = v11;

            v9 = v17;
            v7 = v18;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_showPaddleForBarView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];

  v4 = a3;
  -[STUsageGraphViewController selectedBarView](self, "selectedBarView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColor:", 0);
  if (v4)
  {
    -[STUsageGraphViewController titleView](self, "titleView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "alpha");
    v8 = v7;

    if (v8 > 0.00000011920929)
    {
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __52__STUsageGraphViewController__showPaddleForBarView___block_invoke;
      v25[3] = &unk_24DB86440;
      v25[4] = self;
      objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v25, 0.2);
    }
    v9 = v4;

    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGreenColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setColor:", v10);

    -[STUsageGraphViewController setSelectedBarView:](self, "setSelectedBarView:", v9);
    -[STUsageGraphViewController paddleView](self, "paddleView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidden:", 0);
    objc_msgSend(v9, "dataPoint");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDataPoint:", v12);

    -[STUsageGraphViewController paddleViewCenterXConstraint](self, "paddleViewCenterXConstraint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActive:", 0);
    objc_msgSend(v11, "centerXAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "centerXAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v17) = 1132068864;
    objc_msgSend(v16, "setPriority:", v17);
    objc_msgSend(v16, "setActive:", 1);
    -[STUsageGraphViewController setPaddleViewCenterXConstraint:](self, "setPaddleViewCenterXConstraint:", v16);
    -[STUsageGraphViewController paddleConnectorView](self, "paddleConnectorView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setHidden:", 0);
    -[STUsageGraphViewController paddleViewConnectorCenterXConstraint](self, "paddleViewConnectorCenterXConstraint");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setActive:", 0);
    objc_msgSend(v18, "centerXAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "centerXAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "setActive:", 1);
    -[STUsageGraphViewController setPaddleViewConnectorCenterXConstraint:](self, "setPaddleViewConnectorCenterXConstraint:", v22);

    v5 = v9;
  }
  else
  {
    -[STUsageGraphViewController paddleView](self, "paddleView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setHidden:", 1);

    -[STUsageGraphViewController paddleConnectorView](self, "paddleConnectorView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setHidden:", 1);

  }
}

void __52__STUsageGraphViewController__showPaddleForBarView___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "titleView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

- (void)_handleLongPressGestureForBarSelection:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  unint64_t v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  BOOL v22;
  id v23;
  CGPoint v24;
  CGPoint v25;
  CGRect v26;
  CGRect v27;

  v23 = a3;
  -[STUsageGraphViewController barViews](self, "barViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "count"))
    goto LABEL_19;
  -[STUsageGraphViewController dataSet](self, "dataSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "timePeriod");

  if (v6 == 2)
  {
    -[STUsageGraphViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "locationInView:", v4);
    v8 = v7;
    v10 = v9;
    -[STUsageGraphViewController _closestBarViewToPoint:](self, "_closestBarViewToPoint:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v23, "state");
    objc_msgSend(v23, "_translationInView:", v4);
    v15 = -v13;
    if (v13 >= 0.0)
      v15 = v13;
    if (v15 <= 10.0)
    {
      if (v14 < 0.0)
        v14 = -v14;
      if (v14 <= 10.0)
      {
        if (v12 < 3)
        {
          -[STUsageGraphViewController graphLayoutGuide](self, "graphLayoutGuide");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "layoutFrame");
          v25.x = v8;
          v25.y = v10;
          v22 = CGRectContainsPoint(v27, v25);

          v20 = v11;
          if (!v22)
            goto LABEL_18;
          goto LABEL_17;
        }
        if (v12 - 4 >= 2)
        {
          if (v12 != 3)
          {
LABEL_18:

LABEL_19:
            goto LABEL_20;
          }
          -[STUsageGraphViewController graphLayoutGuide](self, "graphLayoutGuide");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "layoutFrame");
          v24.x = v8;
          v24.y = v10;
          v17 = CGRectContainsPoint(v26, v24);

          if (v17)
          {
            -[STUsageGraphViewController selectedBarView](self, "selectedBarView");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "isEqual:", v11);

            if (v19)
            {

              v11 = 0;
            }
            -[STUsageGraphViewController _selectBarView:](self, "_selectBarView:", v11);
          }
        }
      }
    }
    v20 = 0;
LABEL_17:
    -[STUsageGraphViewController setPressedBarView:](self, "setPressedBarView:", v20);
    goto LABEL_18;
  }
LABEL_20:

}

- (void)_selectBarView:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  BOOL v18;

  v14 = (unint64_t)a3;
  -[STUsageGraphViewController selectedBarView](self, "selectedBarView");
  v4 = objc_claimAutoreleasedReturnValue();
  -[STUsageGraphViewController setSelectedBarView:](self, "setSelectedBarView:", v14);
  -[STUsageGraphViewController verticalDividers](self, "verticalDividers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUsageGraphViewController barViews](self, "barViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v14)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v6, "indexOfObject:", v14));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  -[STUsageGraphViewController selectedVerticalDivider](self, "selectedVerticalDivider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUsageGraphViewController setSelectedVerticalDivider:](self, "setSelectedVerticalDivider:", v8);
  if (v14 && v4)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGray4Color");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v4, "setColor:", v10);

    objc_msgSend(v9, "setSelected:", 0);
    objc_msgSend((id)v14, "setColor:", 0);
    objc_msgSend(v8, "setSelected:", 1);
  }
  else if (v14 | v4)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __45__STUsageGraphViewController__selectBarView___block_invoke;
    v15[3] = &unk_24DB88580;
    v18 = v4 != 0;
    v16 = v5;
    v17 = (id)v14;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v15);
    if (v14)
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    else
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemGreenColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUsageGraphViewController weeklyAverageLine](self, "weeklyAverageLine");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTintColor:", v11);

    -[STUsageGraphViewController weeklyAverageLabel](self, "weeklyAverageLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextColor:", v11);

  }
}

void __45__STUsageGraphViewController__selectBarView___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v5 = a2;
  v10 = v5;
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(v5, "setColor:", 0);
  }
  else
  {
    if (*(id *)(a1 + 40) == v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = 1;
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGray4Color");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setColor:", v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = 0;
LABEL_6:
  objc_msgSend(v7, "setSelected:", v9);

}

- (UIImage)dashedAverageLineImage
{
  if (dashedAverageLineImage_onceToken[0] != -1)
    dispatch_once(dashedAverageLineImage_onceToken, &__block_literal_global_25);
  return (UIImage *)(id)dashedAverageLineImage_dashedAverageLineImage;
}

void __52__STUsageGraphViewController_dashedAverageLineImage__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD618]), "initWithSize:", 8.0, 1.5);
  objc_msgSend(v6, "imageWithActions:", &__block_literal_global_56);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)dashedAverageLineImage_dashedAverageLineImage;
  dashedAverageLineImage_dashedAverageLineImage = v0;

  objc_msgSend((id)dashedAverageLineImage_dashedAverageLineImage, "resizableImageWithCapInsets:", *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)dashedAverageLineImage_dashedAverageLineImage;
  dashedAverageLineImage_dashedAverageLineImage = v2;

  objc_msgSend((id)dashedAverageLineImage_dashedAverageLineImage, "imageWithRenderingMode:", 2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)dashedAverageLineImage_dashedAverageLineImage;
  dashedAverageLineImage_dashedAverageLineImage = v4;

}

void __52__STUsageGraphViewController_dashedAverageLineImage__block_invoke_2(uint64_t a1, void *a2)
{
  CGContext *v2;
  CGPoint v3[2];
  CGFloat lengths[3];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = (CGContext *)objc_msgSend(a2, "CGContext");
  CGContextSetLineWidth(v2, 1.5);
  *(_OWORD *)lengths = xmmword_219BA4E50;
  CGContextSetLineDash(v2, 0.0, lengths, 2uLL);
  v3[0] = (CGPoint)xmmword_219BA4E30;
  v3[1] = (CGPoint)xmmword_219BA4E40;
  CGContextAddLines(v2, v3, 2uLL);
  CGContextStrokeLineSegments(v2, v3, 2uLL);
}

- (STUsageReportGraphDataSet)dataSet
{
  return self->_dataSet;
}

- (int64_t)selectedWeekday
{
  return self->_selectedWeekday;
}

- (STBarView)selectedBarView
{
  return (STBarView *)objc_getProperty(self, a2, 992, 1);
}

- (void)setSelectedBarView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 992);
}

- (unint64_t)week
{
  return self->_week;
}

- (void)setWeek:(unint64_t)a3
{
  self->_week = a3;
}

- (unint64_t)day
{
  return self->_day;
}

- (void)setDay:(unint64_t)a3
{
  self->_day = a3;
}

- (UIView)titleView
{
  return (UIView *)objc_getProperty(self, a2, 1016, 1);
}

- (STPaddleView)paddleView
{
  return (STPaddleView *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setPaddleView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (UIView)paddleConnectorView
{
  return (UIView *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setPaddleConnectorView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1032);
}

- (NSLayoutConstraint)paddleViewCenterXConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setPaddleViewCenterXConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1040);
}

- (NSLayoutConstraint)paddleViewConnectorCenterXConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setPaddleViewConnectorCenterXConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1048);
}

- (NSArray)verticalDividers
{
  return (NSArray *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setVerticalDividers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1056);
}

- (NSArray)horizontalDividers
{
  return (NSArray *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setHorizontalDividers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1064);
}

- (NSArray)barViews
{
  return (NSArray *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setBarViews:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1072);
}

- (NSArray)barIndicators
{
  return (NSArray *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setBarIndicators:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1080);
}

- (NSArray)barViewHeightConstraints
{
  return (NSArray *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setBarViewHeightConstraints:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1088);
}

- (NSArray)verticalLayoutGuides
{
  return (NSArray *)objc_getProperty(self, a2, 1096, 1);
}

- (void)setVerticalLayoutGuides:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1096);
}

- (UILayoutGuide)graphLayoutGuide
{
  return (UILayoutGuide *)objc_getProperty(self, a2, 1104, 1);
}

- (void)setGraphLayoutGuide:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1104);
}

- (UILayoutGuide)xAxisLabelSectionLayoutGuide
{
  return (UILayoutGuide *)objc_getProperty(self, a2, 1112, 1);
}

- (void)setXAxisLabelSectionLayoutGuide:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1112);
}

- (UILayoutGuide)yAxisLabelSectionLayoutGuide
{
  return (UILayoutGuide *)objc_getProperty(self, a2, 1120, 1);
}

- (void)setYAxisLabelSectionLayoutGuide:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1120);
}

- (UILayoutGuide)barSectionLayoutGuide
{
  return (UILayoutGuide *)objc_getProperty(self, a2, 1128, 1);
}

- (void)setBarSectionLayoutGuide:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1128);
}

- (NSLayoutConstraint)yAxisLabelSectionWidthConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1136, 1);
}

- (void)setYAxisLabelSectionWidthConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1136);
}

- (UIImageView)weeklyAverageLine
{
  return (UIImageView *)objc_getProperty(self, a2, 1144, 1);
}

- (void)setWeeklyAverageLine:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1144);
}

- (UILabel)weeklyAverageLabel
{
  return (UILabel *)objc_getProperty(self, a2, 1152, 1);
}

- (void)setWeeklyAverageLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1152);
}

- (UILayoutGuide)weeklyAverageLayoutGuide
{
  return (UILayoutGuide *)objc_getProperty(self, a2, 1160, 1);
}

- (void)setWeeklyAverageLayoutGuide:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1160);
}

- (NSLayoutConstraint)weeklyAverageHeightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1168, 1);
}

- (void)setWeeklyAverageHeightConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1168);
}

- (NSLayoutConstraint)weeklyAverageTrailingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1176, 1);
}

- (void)setWeeklyAverageTrailingConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1176);
}

- (UIView)vibrancyEffectContentView
{
  return (UIView *)objc_getProperty(self, a2, 1184, 1);
}

- (void)setVibrancyEffectContentView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1184);
}

- (STDashedVerticalDivider)selectedVerticalDivider
{
  return (STDashedVerticalDivider *)objc_getProperty(self, a2, 1192, 1);
}

- (void)setSelectedVerticalDivider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1192);
}

- (STBarView)pressedBarView
{
  return self->_pressedBarView;
}

- (double)graphHeight
{
  return self->_graphHeight;
}

- (BOOL)includePaddle
{
  return self->_includePaddle;
}

- (BOOL)useVibrancy
{
  return self->_useVibrancy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pressedBarView, 0);
  objc_storeStrong((id *)&self->_selectedVerticalDivider, 0);
  objc_storeStrong((id *)&self->_vibrancyEffectContentView, 0);
  objc_storeStrong((id *)&self->_weeklyAverageTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_weeklyAverageHeightConstraint, 0);
  objc_storeStrong((id *)&self->_weeklyAverageLayoutGuide, 0);
  objc_storeStrong((id *)&self->_weeklyAverageLabel, 0);
  objc_storeStrong((id *)&self->_weeklyAverageLine, 0);
  objc_storeStrong((id *)&self->_yAxisLabelSectionWidthConstraint, 0);
  objc_storeStrong((id *)&self->_barSectionLayoutGuide, 0);
  objc_storeStrong((id *)&self->_yAxisLabelSectionLayoutGuide, 0);
  objc_storeStrong((id *)&self->_xAxisLabelSectionLayoutGuide, 0);
  objc_storeStrong((id *)&self->_graphLayoutGuide, 0);
  objc_storeStrong((id *)&self->_verticalLayoutGuides, 0);
  objc_storeStrong((id *)&self->_barViewHeightConstraints, 0);
  objc_storeStrong((id *)&self->_barIndicators, 0);
  objc_storeStrong((id *)&self->_barViews, 0);
  objc_storeStrong((id *)&self->_horizontalDividers, 0);
  objc_storeStrong((id *)&self->_verticalDividers, 0);
  objc_storeStrong((id *)&self->_paddleViewConnectorCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_paddleViewCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_paddleConnectorView, 0);
  objc_storeStrong((id *)&self->_paddleView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_selectedBarView, 0);
  objc_storeStrong((id *)&self->_dataSet, 0);
}

@end
