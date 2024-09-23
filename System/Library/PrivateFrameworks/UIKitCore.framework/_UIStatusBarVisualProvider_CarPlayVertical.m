@implementation _UIStatusBarVisualProvider_CarPlayVertical

+ (CGSize)intrinsicContentSizeForOrientation:(int64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 45.0;
  v4 = -1.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)itemCreated:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v4;
    objc_msgSend(v3, "setItemSpacing:", 3.0);
    objc_msgSend(v3, "setAdditionRemovalScale:", 0.25);
    objc_msgSend(v3, "setAdditionRemovalDuration:", 0.25);

  }
}

- (id)setupInContainerView:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  _UIStatusBarRegion *v7;
  _UIStatusBarRegionAxesLayout *v8;
  void *v9;
  void *v10;
  _UIStatusBarRegion *v11;
  _UIStatusBarRegionAxesLayout *v12;
  void *v13;
  void *v14;
  void *v15;
  _UIStatusBarRegion *v16;
  void *v17;
  void *v18;
  _UIStatusBarRegionAxesLayout *v19;
  void *v20;
  void *v21;
  void *v22;
  _UIStatusBarRegionAxesLayout *v23;
  void *v24;
  _UIStatusBarRegionAxisStackingLayout *v25;
  _UIStatusBarRegion *v26;
  _UIStatusBarRegionAxesLayout *v27;
  void *v28;
  _UIStatusBarRegionAxisStackingLayout *v29;
  UILayoutGuide *v30;
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
  void *v152;
  void *v153;
  _UIStatusBarRegion *v155;
  _UIStatusBarRegionAxesLayout *v156;
  _UIStatusBarRegionAxesLayout *v157;
  _UIStatusBarRegionAxesLayout *v158;
  _UIStatusBarRegionAxisCenteringLayout *v159;
  _UIStatusBarRegionAxesLayout *v160;
  _UIStatusBarRegionAxesLayout *v161;
  _UIStatusBarRegionAxesLayout *v162;
  _UIStatusBarRegion *v163;
  _UIStatusBarRegion *v164;
  _UIStatusBarRegion *v165;
  _UIStatusBarRegion *v166;
  _QWORD v167[8];

  v167[6] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_UIStatusBarRegion initWithIdentifier:]([_UIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("time"));
  v8 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  +[_UIStatusBarRegionAxisFillingLayout fillingLayout](_UIStatusBarRegionAxisFillingLayout, "fillingLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v162 = v8;
  -[_UIStatusBarRegionAxesLayout setHorizontalLayout:](v8, "setHorizontalLayout:", v9);

  +[_UIStatusBarRegionAxisFillingLayout fillingLayout](_UIStatusBarRegionAxisFillingLayout, "fillingLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegionAxesLayout setVerticalLayout:](v8, "setVerticalLayout:", v10);

  v163 = v7;
  -[_UIStatusBarRegion setLayout:](v7, "setLayout:", v8);
  -[_UIStatusBarVisualProvider_CarPlay setTimeRegion:](self, "setTimeRegion:", v7);
  v11 = -[_UIStatusBarRegion initWithIdentifier:]([_UIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("pill"));
  v12 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  +[_UIStatusBarRegionAxisFillingLayout fillingLayout](_UIStatusBarRegionAxisFillingLayout, "fillingLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v161 = v12;
  -[_UIStatusBarRegionAxesLayout setHorizontalLayout:](v12, "setHorizontalLayout:", v13);

  +[_UIStatusBarRegionAxisFillingLayout fillingLayout](_UIStatusBarRegionAxisFillingLayout, "fillingLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegionAxesLayout setVerticalLayout:](v12, "setVerticalLayout:", v14);

  -[_UIStatusBarRegion setLayout:](v11, "setLayout:", v12);
  v164 = v11;
  -[_UIStatusBarRegion setActionInsets:](v11, "setActionInsets:", 0.0, -3.0, -13.0, -3.0);
  -[_UIStatusBarVisualProvider_CarPlay pillRegionCoordinator](self, "pillRegionCoordinator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPillRegion:", v11);

  v16 = -[_UIStatusBarRegion initWithIdentifier:]([_UIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("pillContent"));
  -[_UIStatusBarVisualProvider_CarPlay pillRegionCoordinator](self, "pillRegionCoordinator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pillRegion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v165 = v16;
  -[_UIStatusBarRegion setEnabilityRegion:](v16, "setEnabilityRegion:", v18);

  v19 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  +[_UIStatusBarRegionAxisFillingLayout fillingLayout](_UIStatusBarRegionAxisFillingLayout, "fillingLayout");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v160 = v19;
  -[_UIStatusBarRegionAxesLayout setHorizontalLayout:](v19, "setHorizontalLayout:", v20);

  +[_UIStatusBarRegionAxisFillingLayout fillingLayout](_UIStatusBarRegionAxisFillingLayout, "fillingLayout");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegionAxesLayout setVerticalLayout:](v19, "setVerticalLayout:", v21);

  -[_UIStatusBarRegion setLayout:](v16, "setLayout:", v19);
  v166 = -[_UIStatusBarRegion initWithIdentifier:]([_UIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("signal"));
  v158 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v159 = objc_alloc_init(_UIStatusBarRegionAxisCenteringLayout);
  -[_UIStatusBarRegionAxisCenteringLayout setInterspace:](v159, "setInterspace:", 3.0);
  -[_UIStatusBarRegionAxesLayout setHorizontalLayout:](v158, "setHorizontalLayout:", v159);
  +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](_UIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegionAxesLayout setVerticalLayout:](v158, "setVerticalLayout:", v22);

  -[_UIStatusBarRegion setLayout:](v166, "setLayout:", v158);
  v155 = -[_UIStatusBarRegion initWithIdentifier:]([_UIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("top"));
  v23 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](_UIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = v23;
  -[_UIStatusBarRegionAxesLayout setHorizontalLayout:](v23, "setHorizontalLayout:", v24);

  v25 = objc_alloc_init(_UIStatusBarRegionAxisStackingLayout);
  -[_UIStatusBarRegionAxisStackingLayout setAlignment:](v25, "setAlignment:", 3);
  -[_UIStatusBarRegionAxisStackingLayout setInterspace:](v25, "setInterspace:", 8.0);
  -[_UIStatusBarRegionAxesLayout setVerticalLayout:](v23, "setVerticalLayout:", v25);

  -[_UIStatusBarRegion setLayout:](v155, "setLayout:", v23);
  v26 = -[_UIStatusBarRegion initWithIdentifier:]([_UIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("bottom"));
  v27 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](_UIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v156 = v27;
  -[_UIStatusBarRegionAxesLayout setHorizontalLayout:](v27, "setHorizontalLayout:", v28);

  v29 = objc_alloc_init(_UIStatusBarRegionAxisStackingLayout);
  -[_UIStatusBarRegionAxisStackingLayout setAlignment:](v29, "setAlignment:", 1);
  -[_UIStatusBarRegionAxisStackingLayout setInterspace:](v29, "setInterspace:", 8.0);
  -[_UIStatusBarRegionAxesLayout setVerticalLayout:](v27, "setVerticalLayout:", v29);

  -[_UIStatusBarRegion setLayout:](v26, "setLayout:", v27);
  -[_UIStatusBarRegion setActionInsets:](v26, "setActionInsets:", 0.0, -3.0, -10.0, -10.0);
  -[_UIStatusBarVisualProvider_CarPlay setRadarRegion:](self, "setRadarRegion:", v26);
  v30 = objc_alloc_init(UILayoutGuide);
  objc_msgSend(v5, "addLayoutGuide:", v30);
  -[UILayoutGuide heightAnchor](v30, "heightAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToConstant:", 103.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v32);

  -[UILayoutGuide leadingAnchor](v30, "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v35);

  -[UILayoutGuide trailingAnchor](v30, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v38);

  -[UILayoutGuide centerYAnchor](v30, "centerYAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "centerYAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v41);

  -[_UIStatusBarRegion layoutItem](v163, "layoutItem");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "topAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeAreaLayoutGuide");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "topAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v46);

  -[_UIStatusBarRegion layoutItem](v163, "layoutItem");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "heightAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToConstant:", 18.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v49);

  -[_UIStatusBarRegion layoutItem](v163, "layoutItem");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "widthAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToConstant:", 39.0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v52);

  -[_UIStatusBarRegion layoutItem](v163, "layoutItem");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "centerXAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "centerXAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v56);

  -[_UIStatusBarRegion layoutItem](v163, "layoutItem");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_ui_addSubLayoutItem:", v57);

  -[_UIStatusBarRegion layoutItem](v164, "layoutItem");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "topAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegion layoutItem](v163, "layoutItem");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "topAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v62);

  -[_UIStatusBarRegion layoutItem](v164, "layoutItem");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "bottomAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegion layoutItem](v163, "layoutItem");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "bottomAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v67);

  -[_UIStatusBarRegion layoutItem](v164, "layoutItem");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "leadingAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegion layoutItem](v163, "layoutItem");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "leadingAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:", v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v72);

  -[_UIStatusBarRegion layoutItem](v164, "layoutItem");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "trailingAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegion layoutItem](v163, "layoutItem");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "trailingAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintEqualToAnchor:", v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v77);

  -[_UIStatusBarRegion layoutItem](v164, "layoutItem");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_ui_addSubLayoutItem:", v78);

  -[_UIStatusBarRegion layoutItem](v165, "layoutItem");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "topAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegion layoutItem](v164, "layoutItem");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "topAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "constraintEqualToAnchor:", v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v83);

  -[_UIStatusBarRegion layoutItem](v165, "layoutItem");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "bottomAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegion layoutItem](v164, "layoutItem");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "bottomAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "constraintEqualToAnchor:", v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v88);

  -[_UIStatusBarRegion layoutItem](v165, "layoutItem");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "leadingAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegion layoutItem](v164, "layoutItem");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "leadingAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "constraintEqualToAnchor:", v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v93);

  -[_UIStatusBarRegion layoutItem](v165, "layoutItem");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "trailingAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegion layoutItem](v164, "layoutItem");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "trailingAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "constraintEqualToAnchor:", v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v98);

  -[_UIStatusBarRegion layoutItem](v165, "layoutItem");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_ui_addSubLayoutItem:", v99);

  -[_UIStatusBarRegion layoutItem](v166, "layoutItem");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "topAnchor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegion layoutItem](v163, "layoutItem");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "bottomAnchor");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "constraintEqualToAnchor:constant:", v103, 3.0);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v104);

  -[_UIStatusBarRegion layoutItem](v166, "layoutItem");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "heightAnchor");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "constraintEqualToConstant:", 10.0);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v107);

  -[_UIStatusBarRegion layoutItem](v166, "layoutItem");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "leadingAnchor");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "constraintEqualToAnchor:", v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v111);

  -[_UIStatusBarRegion layoutItem](v166, "layoutItem");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "trailingAnchor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "constraintEqualToAnchor:", v114);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v115);

  -[_UIStatusBarRegion layoutItem](v166, "layoutItem");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_ui_addSubLayoutItem:", v116);

  -[_UIStatusBarRegion layoutItem](v155, "layoutItem");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "topAnchor");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegion layoutItem](v166, "layoutItem");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "bottomAnchor");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "constraintEqualToAnchor:constant:", v120, 8.0);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v121);

  -[_UIStatusBarRegion layoutItem](v155, "layoutItem");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "bottomAnchor");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide topAnchor](v30, "topAnchor");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "constraintEqualToAnchor:constant:", v124, -5.0);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v125);

  -[_UIStatusBarRegion layoutItem](v155, "layoutItem");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "leadingAnchor");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "constraintEqualToAnchor:", v128);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v129);

  -[_UIStatusBarRegion layoutItem](v155, "layoutItem");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "trailingAnchor");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "constraintEqualToAnchor:", v132);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v133);

  -[_UIStatusBarRegion layoutItem](v155, "layoutItem");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_ui_addSubLayoutItem:", v134);

  -[_UIStatusBarRegion layoutItem](v26, "layoutItem");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "topAnchor");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide bottomAnchor](v30, "bottomAnchor");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "constraintEqualToAnchor:constant:", v137, 5.0);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v138);

  -[_UIStatusBarRegion layoutItem](v26, "layoutItem");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "bottomAnchor");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeAreaLayoutGuide");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "bottomAnchor");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "constraintEqualToAnchor:constant:", v142, -5.0);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v143);

  -[_UIStatusBarRegion layoutItem](v26, "layoutItem");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "leadingAnchor");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "constraintEqualToAnchor:", v146);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v147);

  -[_UIStatusBarRegion layoutItem](v26, "layoutItem");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "trailingAnchor");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "constraintEqualToAnchor:", v150);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v151);

  -[_UIStatusBarRegion layoutItem](v26, "layoutItem");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_ui_addSubLayoutItem:", v152);

  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v6);
  v167[0] = v165;
  v167[1] = v164;
  v167[2] = v163;
  v167[3] = v166;
  v167[4] = v155;
  v167[5] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v167, 6);
  v153 = (void *)objc_claimAutoreleasedReturnValue();

  return v153;
}

- (id)orderedDisplayItemPlacementsInRegionWithIdentifier:(id)a3
{
  id v4;
  NSDictionary *orderedDisplayItemPlacements;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
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
  uint64_t v54;
  NSDictionary *v55;
  void *v56;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  _UIStatusBarVisualProvider_CarPlayVertical *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  _QWORD v77[5];
  _QWORD v78[3];
  _QWORD v79[6];
  _QWORD v80[3];
  void *v81;
  void *v82;
  _QWORD v83[6];
  _QWORD v84[6];
  _QWORD v85[5];
  _QWORD v86[2];
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  _QWORD v91[3];

  v91[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  orderedDisplayItemPlacements = self->_orderedDisplayItemPlacements;
  if (!orderedDisplayItemPlacements)
  {
    +[_UIStatusBarTimeItem shortTimeDisplayIdentifier](_UIStatusBarTimeItem, "shortTimeDisplayIdentifier");
    v65 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v6, 400);
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    +[_UIStatusBarBackgroundActivityItem backgroundDisplayIdentifier](_UIStatusBarPillBackgroundActivityItem, "backgroundDisplayIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v7, 500);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v91[0] = v75;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "excludingPlacements:", v9);
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    +[_UIStatusBarTimeItem pillTimeDisplayIdentifier](_UIStatusBarTimeItem, "pillTimeDisplayIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v10, 450);
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarPillBackgroundActivityItem, "defaultDisplayIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v11, 475);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = v74;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v90, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "excludingPlacements:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    -[_UIStatusBarVisualProvider_CarPlay pillRegionCoordinator](self, "pillRegionCoordinator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = (void *)v14;
    objc_msgSend(v15, "setPillIconPlacement:", v14);

    +[_UIStatusBarBackgroundActivityItem secondaryIconDisplayIdentifier](_UIStatusBarPillBackgroundActivityItem, "secondaryIconDisplayIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v16, 474);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v89, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "requiringAllPlacements:", v18);
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarSensorActivityItem, "defaultDisplayIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v19, 600);
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarSensorActivityItem, "defaultDisplayIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v20, 599);
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    +[_UIStatusBarCellularItem signalStrengthDisplayIdentifier](_UIStatusBarCellularCondensedItem, "signalStrengthDisplayIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v21, 350);
    v22 = objc_claimAutoreleasedReturnValue();

    +[_UIStatusBarCellularCondensedItem dualSignalStrengthDisplayIdentifier](_UIStatusBarCellularCondensedItem, "dualSignalStrengthDisplayIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v23, 375);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = v22;
    v25 = (void *)v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v88, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "excludingPlacements:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    +[_UIStatusBarCellularItem typeDisplayIdentifier](_UIStatusBarCellularCondensedItem, "typeDisplayIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v28, 250);
    v69 = self;
    v29 = objc_claimAutoreleasedReturnValue();

    +[_UIStatusBarWifiItem signalStrengthDisplayIdentifier](_UIStatusBarWifiItem, "signalStrengthDisplayIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v30, 300);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = v29;
    v32 = (void *)v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v87, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "excludingPlacements:", v33);
    v34 = objc_claimAutoreleasedReturnValue();

    +[_UIStatusBarWifiItem iconDisplayIdentifier](_UIStatusBarWifiItem, "iconDisplayIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v35, 301);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v86[0] = v34;
    v86[1] = v32;
    v66 = (void *)v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 2);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "excludingPlacements:", v37);
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarIndicatorAirplaneModeItem, "defaultDisplayIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v38, 1200);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v85[0] = v25;
    v85[1] = v27;
    v85[2] = v34;
    v85[3] = v68;
    v85[4] = v32;
    v40 = v32;
    v62 = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 5);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "excludingPlacements:", v41);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    +[_UIStatusBarBatteryItem iconDisplayIdentifier](_UIStatusBarBatteryItem, "iconDisplayIdentifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v42, 100);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    +[_UIStatusBarBatteryItem iconDisplayIdentifier](_UIStatusBarBatteryItem, "iconDisplayIdentifier");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v43, 50);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarIndicatorQuietModeAnnounceItem, "defaultDisplayIdentifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v44, 90);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarIndicatorQuietModeAnnounceItem, "defaultDisplayIdentifier");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v45, 85);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarRadarItem, "defaultDisplayIdentifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v46, 155);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarElectronicTollCollectionItem, "defaultDisplayIdentifier");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v48, 150);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v82 = v75;
    v83[0] = CFSTR("time");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v82, 1);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v84[0] = v60;
    v83[1] = CFSTR("pill");
    v81 = v76;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v84[1] = v59;
    v83[2] = CFSTR("pillContent");
    v80[0] = v73;
    v80[1] = v70;
    v80[2] = v74;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 3);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v84[2] = v50;
    v83[3] = CFSTR("signal");
    v79[0] = v25;
    v79[1] = v27;
    v79[2] = v40;
    v79[3] = v66;
    v79[4] = v68;
    v79[5] = v67;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 6);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v84[3] = v51;
    v83[4] = CFSTR("top");
    v78[0] = v58;
    v78[1] = v64;
    v78[2] = v72;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 3);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v84[4] = v52;
    v83[5] = CFSTR("bottom");
    v77[0] = v49;
    v77[1] = v61;
    v77[2] = v63;
    v77[3] = v47;
    v77[4] = v71;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 5);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v84[5] = v53;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 6);
    v54 = objc_claimAutoreleasedReturnValue();
    v55 = v69->_orderedDisplayItemPlacements;
    v69->_orderedDisplayItemPlacements = (NSDictionary *)v54;

    v4 = v65;
    orderedDisplayItemPlacements = v69->_orderedDisplayItemPlacements;
  }
  -[NSDictionary objectForKeyedSubscript:](orderedDisplayItemPlacements, "objectForKeyedSubscript:", v4);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  return v56;
}

- (NSDictionary)orderedDisplayItemPlacements
{
  return self->_orderedDisplayItemPlacements;
}

- (void)setOrderedDisplayItemPlacements:(id)a3
{
  objc_storeStrong((id *)&self->_orderedDisplayItemPlacements, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedDisplayItemPlacements, 0);
}

@end
