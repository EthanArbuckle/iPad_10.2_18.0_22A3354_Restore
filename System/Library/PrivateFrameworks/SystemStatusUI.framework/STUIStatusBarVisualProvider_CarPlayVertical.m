@implementation STUIStatusBarVisualProvider_CarPlayVertical

+ (CGSize)intrinsicContentSizeForOrientation:(int64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = *MEMORY[0x1E0DC55F0];
  v4 = 45.0;
  result.height = v3;
  result.width = v4;
  return result;
}

- (void)itemCreated:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v7;
    objc_msgSend(v3, "setItemSpacing:", 3.0);
    objc_msgSend(v3, "setAdditionRemovalScale:", 0.25);
    objc_msgSend(v3, "setAdditionRemovalDuration:", 0.25);
LABEL_5:

    goto LABEL_6;
  }
  objc_msgSend(v7, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarItem identifier](STUIStatusBarVoiceControlPillItem, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    v6 = v7;
    objc_msgSend(v6, "setPillSize:", 15.0, 15.0);
    objc_msgSend(v6, "setPillPadding:", 3.0);
    goto LABEL_5;
  }
LABEL_6:

}

- (id)setupInContainerView:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  STUIStatusBarRegion *v7;
  STUIStatusBarRegionAxesLayout *v8;
  void *v9;
  void *v10;
  STUIStatusBarRegion *v11;
  STUIStatusBarRegionAxesLayout *v12;
  void *v13;
  void *v14;
  void *v15;
  STUIStatusBarRegion *v16;
  void *v17;
  void *v18;
  STUIStatusBarRegionAxesLayout *v19;
  void *v20;
  void *v21;
  void *v22;
  STUIStatusBarRegionAxesLayout *v23;
  void *v24;
  STUIStatusBarRegionAxisStackingLayout *v25;
  STUIStatusBarRegion *v26;
  STUIStatusBarRegionAxesLayout *v27;
  void *v28;
  STUIStatusBarRegionAxisStackingLayout *v29;
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
  STUIStatusBarRegion *v155;
  STUIStatusBarRegionAxesLayout *v156;
  STUIStatusBarRegionAxesLayout *v157;
  STUIStatusBarRegionAxesLayout *v158;
  STUIStatusBarRegionAxisCenteringLayout *v159;
  STUIStatusBarRegionAxesLayout *v160;
  STUIStatusBarRegionAxesLayout *v161;
  STUIStatusBarRegionAxesLayout *v162;
  STUIStatusBarRegion *v163;
  STUIStatusBarRegion *v164;
  STUIStatusBarRegion *v165;
  STUIStatusBarRegion *v166;
  _QWORD v167[8];

  v167[6] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("time"));
  v8 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  +[STUIStatusBarRegionAxisFillingLayout fillingLayout](STUIStatusBarRegionAxisFillingLayout, "fillingLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v162 = v8;
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v8, "setHorizontalLayout:", v9);

  +[STUIStatusBarRegionAxisFillingLayout fillingLayout](STUIStatusBarRegionAxisFillingLayout, "fillingLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v8, "setVerticalLayout:", v10);

  v163 = v7;
  -[STUIStatusBarRegion setLayout:](v7, "setLayout:", v8);
  -[STUIStatusBarVisualProvider_CarPlay setTimeRegion:](self, "setTimeRegion:", v7);
  v11 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("pill"));
  v12 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  +[STUIStatusBarRegionAxisFillingLayout fillingLayout](STUIStatusBarRegionAxisFillingLayout, "fillingLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v161 = v12;
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v12, "setHorizontalLayout:", v13);

  +[STUIStatusBarRegionAxisFillingLayout fillingLayout](STUIStatusBarRegionAxisFillingLayout, "fillingLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v12, "setVerticalLayout:", v14);

  -[STUIStatusBarRegion setLayout:](v11, "setLayout:", v12);
  v164 = v11;
  -[STUIStatusBarRegion setActionInsets:](v11, "setActionInsets:", 0.0, -3.0, -13.0, -3.0);
  -[STUIStatusBarVisualProvider_CarPlay pillRegionCoordinator](self, "pillRegionCoordinator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPillRegion:", v11);

  v16 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("pillContent"));
  -[STUIStatusBarVisualProvider_CarPlay pillRegionCoordinator](self, "pillRegionCoordinator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pillRegion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v165 = v16;
  -[STUIStatusBarRegion setEnabilityRegion:](v16, "setEnabilityRegion:", v18);

  v19 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  +[STUIStatusBarRegionAxisFillingLayout fillingLayout](STUIStatusBarRegionAxisFillingLayout, "fillingLayout");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v160 = v19;
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v19, "setHorizontalLayout:", v20);

  +[STUIStatusBarRegionAxisFillingLayout fillingLayout](STUIStatusBarRegionAxisFillingLayout, "fillingLayout");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v19, "setVerticalLayout:", v21);

  -[STUIStatusBarRegion setLayout:](v16, "setLayout:", v19);
  v166 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("signal"));
  v158 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v159 = objc_alloc_init(STUIStatusBarRegionAxisCenteringLayout);
  -[STUIStatusBarRegionAxisCenteringLayout setInterspace:](v159, "setInterspace:", 3.0);
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v158, "setHorizontalLayout:", v159);
  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v158, "setVerticalLayout:", v22);

  -[STUIStatusBarRegion setLayout:](v166, "setLayout:", v158);
  v155 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("top"));
  v23 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = v23;
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v23, "setHorizontalLayout:", v24);

  v25 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  -[STUIStatusBarRegionAxisStackingLayout setAlignment:](v25, "setAlignment:", 3);
  -[STUIStatusBarRegionAxisStackingLayout setInterspace:](v25, "setInterspace:", 8.0);
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v23, "setVerticalLayout:", v25);

  -[STUIStatusBarRegion setLayout:](v155, "setLayout:", v23);
  v26 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("bottom"));
  v27 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v156 = v27;
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v27, "setHorizontalLayout:", v28);

  v29 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  -[STUIStatusBarRegionAxisStackingLayout setAlignment:](v29, "setAlignment:", 1);
  -[STUIStatusBarRegionAxisStackingLayout setInterspace:](v29, "setInterspace:", 8.0);
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v27, "setVerticalLayout:", v29);

  -[STUIStatusBarRegion setLayout:](v26, "setLayout:", v27);
  -[STUIStatusBarRegion setActionInsets:](v26, "setActionInsets:", 0.0, -3.0, -10.0, -10.0);
  -[STUIStatusBarVisualProvider_CarPlay setRadarRegion:](self, "setRadarRegion:", v26);
  v30 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
  objc_msgSend(v5, "addLayoutGuide:", v30);
  objc_msgSend(v30, "heightAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToConstant:", 103.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v32);

  objc_msgSend(v30, "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v35);

  objc_msgSend(v30, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v38);

  objc_msgSend(v30, "centerYAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "centerYAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v41);

  -[STUIStatusBarRegion layoutItem](v163, "layoutItem");
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

  -[STUIStatusBarRegion layoutItem](v163, "layoutItem");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "heightAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToConstant:", 18.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v49);

  -[STUIStatusBarRegion layoutItem](v163, "layoutItem");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "widthAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToConstant:", 39.0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v52);

  -[STUIStatusBarRegion layoutItem](v163, "layoutItem");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "centerXAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "centerXAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v56);

  -[STUIStatusBarRegion layoutItem](v163, "layoutItem");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_ui_addSubLayoutItem:", v57);

  -[STUIStatusBarRegion layoutItem](v164, "layoutItem");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "topAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegion layoutItem](v163, "layoutItem");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "topAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v62);

  -[STUIStatusBarRegion layoutItem](v164, "layoutItem");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "bottomAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegion layoutItem](v163, "layoutItem");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "bottomAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v67);

  -[STUIStatusBarRegion layoutItem](v164, "layoutItem");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "leadingAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegion layoutItem](v163, "layoutItem");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "leadingAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:", v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v72);

  -[STUIStatusBarRegion layoutItem](v164, "layoutItem");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "trailingAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegion layoutItem](v163, "layoutItem");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "trailingAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintEqualToAnchor:", v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v77);

  -[STUIStatusBarRegion layoutItem](v164, "layoutItem");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_ui_addSubLayoutItem:", v78);

  -[STUIStatusBarRegion layoutItem](v165, "layoutItem");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "topAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegion layoutItem](v164, "layoutItem");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "topAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "constraintEqualToAnchor:", v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v83);

  -[STUIStatusBarRegion layoutItem](v165, "layoutItem");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "bottomAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegion layoutItem](v164, "layoutItem");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "bottomAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "constraintEqualToAnchor:", v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v88);

  -[STUIStatusBarRegion layoutItem](v165, "layoutItem");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "leadingAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegion layoutItem](v164, "layoutItem");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "leadingAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "constraintEqualToAnchor:", v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v93);

  -[STUIStatusBarRegion layoutItem](v165, "layoutItem");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "trailingAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegion layoutItem](v164, "layoutItem");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "trailingAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "constraintEqualToAnchor:", v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v98);

  -[STUIStatusBarRegion layoutItem](v165, "layoutItem");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_ui_addSubLayoutItem:", v99);

  -[STUIStatusBarRegion layoutItem](v166, "layoutItem");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "topAnchor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegion layoutItem](v163, "layoutItem");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "bottomAnchor");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "constraintEqualToAnchor:constant:", v103, 3.0);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v104);

  -[STUIStatusBarRegion layoutItem](v166, "layoutItem");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "heightAnchor");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "constraintEqualToConstant:", 10.0);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v107);

  -[STUIStatusBarRegion layoutItem](v166, "layoutItem");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "leadingAnchor");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "constraintEqualToAnchor:", v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v111);

  -[STUIStatusBarRegion layoutItem](v166, "layoutItem");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "trailingAnchor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "constraintEqualToAnchor:", v114);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v115);

  -[STUIStatusBarRegion layoutItem](v166, "layoutItem");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_ui_addSubLayoutItem:", v116);

  -[STUIStatusBarRegion layoutItem](v155, "layoutItem");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "topAnchor");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegion layoutItem](v166, "layoutItem");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "bottomAnchor");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "constraintEqualToAnchor:constant:", v120, 8.0);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v121);

  -[STUIStatusBarRegion layoutItem](v155, "layoutItem");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "bottomAnchor");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "topAnchor");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "constraintEqualToAnchor:constant:", v124, -5.0);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v125);

  -[STUIStatusBarRegion layoutItem](v155, "layoutItem");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "leadingAnchor");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "constraintEqualToAnchor:", v128);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v129);

  -[STUIStatusBarRegion layoutItem](v155, "layoutItem");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "trailingAnchor");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "constraintEqualToAnchor:", v132);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v133);

  -[STUIStatusBarRegion layoutItem](v155, "layoutItem");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_ui_addSubLayoutItem:", v134);

  -[STUIStatusBarRegion layoutItem](v26, "layoutItem");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "topAnchor");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bottomAnchor");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "constraintEqualToAnchor:constant:", v137, 5.0);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v138);

  -[STUIStatusBarRegion layoutItem](v26, "layoutItem");
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

  -[STUIStatusBarRegion layoutItem](v26, "layoutItem");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "leadingAnchor");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "constraintEqualToAnchor:", v146);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v147);

  -[STUIStatusBarRegion layoutItem](v26, "layoutItem");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "trailingAnchor");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "constraintEqualToAnchor:", v150);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v151);

  -[STUIStatusBarRegion layoutItem](v26, "layoutItem");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_ui_addSubLayoutItem:", v152);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v6);
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
  STUIStatusBarVisualProvider_CarPlayVertical *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
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
  uint64_t v53;
  NSDictionary *v54;
  void *v55;
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
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  STUIStatusBarVisualProvider_CarPlayVertical *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  _QWORD v81[6];
  _QWORD v82[4];
  _QWORD v83[6];
  _QWORD v84[3];
  void *v85;
  void *v86;
  _QWORD v87[6];
  _QWORD v88[6];
  _QWORD v89[5];
  _QWORD v90[2];
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  _QWORD v95[3];

  v95[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  orderedDisplayItemPlacements = self->_orderedDisplayItemPlacements;
  if (!orderedDisplayItemPlacements)
  {
    v6 = self;
    +[STUIStatusBarTimeItem shortTimeDisplayIdentifier](STUIStatusBarTimeItem, "shortTimeDisplayIdentifier");
    v67 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v7, 400);
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    +[STUIStatusBarBackgroundActivityItem backgroundDisplayIdentifier](STUIStatusBarPillBackgroundActivityItem, "backgroundDisplayIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v8, 500);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v95[0] = v80;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "excludingPlacements:", v10);
    v79 = (void *)objc_claimAutoreleasedReturnValue();

    +[STUIStatusBarTimeItem pillTimeDisplayIdentifier](STUIStatusBarTimeItem, "pillTimeDisplayIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v11, 450);
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarPillBackgroundActivityItem, "defaultDisplayIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v12, 475);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = v78;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v94, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "excludingPlacements:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v73 = v6;
    -[STUIStatusBarVisualProvider_CarPlay pillRegionCoordinator](v6, "pillRegionCoordinator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = (void *)v15;
    objc_msgSend(v16, "setPillIconPlacement:", v15);

    +[STUIStatusBarBackgroundActivityItem secondaryIconDisplayIdentifier](STUIStatusBarPillBackgroundActivityItem, "secondaryIconDisplayIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v17, 474);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v93, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "requiringAllPlacements:", v19);
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarSensorActivityItem, "defaultDisplayIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v20, 600);
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarSensorActivityItem, "defaultDisplayIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v21, 599);
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    +[STUIStatusBarCellularItem signalStrengthDisplayIdentifier](STUIStatusBarCellularCondensedItem, "signalStrengthDisplayIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v22, 350);
    v23 = objc_claimAutoreleasedReturnValue();

    +[STUIStatusBarCellularCondensedItem dualSignalStrengthDisplayIdentifier](STUIStatusBarCellularCondensedItem, "dualSignalStrengthDisplayIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v24, 375);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = v23;
    v26 = v23;
    v72 = (void *)v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v92, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "excludingPlacements:", v27);
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    +[STUIStatusBarCellularItem typeDisplayIdentifier](STUIStatusBarCellularCondensedItem, "typeDisplayIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v28, 250);
    v29 = objc_claimAutoreleasedReturnValue();

    +[STUIStatusBarWifiItem signalStrengthDisplayIdentifier](STUIStatusBarWifiItem, "signalStrengthDisplayIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v30, 300);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v91, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "excludingPlacements:", v32);
    v33 = objc_claimAutoreleasedReturnValue();

    +[STUIStatusBarWifiItem iconDisplayIdentifier](STUIStatusBarWifiItem, "iconDisplayIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v34, 301);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v90[0] = v33;
    v90[1] = v29;
    v71 = (void *)v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "excludingPlacements:", v36);
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorAirplaneModeItem, "defaultDisplayIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v37, 1200);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v89[0] = v26;
    v89[1] = v68;
    v89[2] = v33;
    v89[3] = v70;
    v89[4] = v29;
    v63 = (void *)v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 5);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "excludingPlacements:", v39);
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarVoiceControlPillItem, "defaultDisplayIdentifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v40, 601);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarVoiceControlPillItem, "defaultDisplayIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v41, 598);
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    +[STUIStatusBarBatteryItem iconDisplayIdentifier](STUIStatusBarBatteryItem, "iconDisplayIdentifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v42, 100);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    +[STUIStatusBarBatteryItem iconDisplayIdentifier](STUIStatusBarBatteryItem, "iconDisplayIdentifier");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v43, 50);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorQuietModeAnnounceItem, "defaultDisplayIdentifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v44, 90);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorQuietModeAnnounceItem, "defaultDisplayIdentifier");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v45, 85);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarRadarItem, "defaultDisplayIdentifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v46, 155);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarElectronicTollCollectionItem, "defaultDisplayIdentifier");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v47, 150);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v86 = v80;
    v87[0] = CFSTR("time");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v86, 1);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v88[0] = v62;
    v87[1] = CFSTR("pill");
    v85 = v79;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v85, 1);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v88[1] = v60;
    v87[2] = CFSTR("pillContent");
    v84[0] = v77;
    v84[1] = v74;
    v84[2] = v78;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 3);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v88[2] = v49;
    v87[3] = CFSTR("signal");
    v83[0] = v72;
    v83[1] = v68;
    v83[2] = v29;
    v83[3] = v33;
    v83[4] = v70;
    v83[5] = v69;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 6);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v88[3] = v50;
    v87[4] = CFSTR("top");
    v82[0] = v58;
    v82[1] = v59;
    v82[2] = v66;
    v82[3] = v76;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 4);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v88[4] = v51;
    v87[5] = CFSTR("bottom");
    v81[0] = v48;
    v81[1] = v57;
    v81[2] = v64;
    v81[3] = v65;
    v81[4] = v61;
    v81[5] = v75;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 6);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v88[5] = v52;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, v87, 6);
    v53 = objc_claimAutoreleasedReturnValue();
    v54 = v73->_orderedDisplayItemPlacements;
    v73->_orderedDisplayItemPlacements = (NSDictionary *)v53;

    v4 = v67;
    orderedDisplayItemPlacements = v73->_orderedDisplayItemPlacements;
  }
  -[NSDictionary objectForKeyedSubscript:](orderedDisplayItemPlacements, "objectForKeyedSubscript:", v4, v57);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  return v55;
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
