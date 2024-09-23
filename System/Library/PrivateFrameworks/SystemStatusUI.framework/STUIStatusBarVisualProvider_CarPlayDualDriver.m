@implementation STUIStatusBarVisualProvider_CarPlayDualDriver

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
  void *v5;
  STUIStatusBarRegion *v6;
  STUIStatusBarRegionAxesLayout *v7;
  void *v8;
  void *v9;
  STUIStatusBarRegion *v10;
  STUIStatusBarRegionAxesLayout *v11;
  void *v12;
  void *v13;
  void *v14;
  STUIStatusBarRegion *v15;
  void *v16;
  void *v17;
  STUIStatusBarRegionAxesLayout *v18;
  void *v19;
  void *v20;
  STUIStatusBarRegion *v21;
  STUIStatusBarRegionAxesLayout *v22;
  void *v23;
  STUIStatusBarRegionAxisStackingLayout *v24;
  id v25;
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
  id v114;
  void *v115;
  STUIStatusBarRegion *v116;
  STUIStatusBarRegionAxesLayout *v117;
  STUIStatusBarRegionAxesLayout *v118;
  STUIStatusBarRegionAxesLayout *v119;
  STUIStatusBarRegionAxesLayout *v120;
  STUIStatusBarRegion *v121;
  _QWORD v122[5];

  v122[4] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99DE8];
  v114 = a3;
  objc_msgSend(v4, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("time"));
  v7 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  +[STUIStatusBarRegionAxisFillingLayout fillingLayout](STUIStatusBarRegionAxisFillingLayout, "fillingLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = v7;
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v7, "setHorizontalLayout:", v8);

  +[STUIStatusBarRegionAxisFillingLayout fillingLayout](STUIStatusBarRegionAxisFillingLayout, "fillingLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v7, "setVerticalLayout:", v9);

  -[STUIStatusBarRegion setLayout:](v6, "setLayout:", v7);
  -[STUIStatusBarVisualProvider_CarPlay setTimeRegion:](self, "setTimeRegion:", v6);
  v10 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("pill"));
  v11 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  +[STUIStatusBarRegionAxisFillingLayout fillingLayout](STUIStatusBarRegionAxisFillingLayout, "fillingLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = v11;
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v11, "setHorizontalLayout:", v12);

  +[STUIStatusBarRegionAxisFillingLayout fillingLayout](STUIStatusBarRegionAxisFillingLayout, "fillingLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v11, "setVerticalLayout:", v13);

  -[STUIStatusBarRegion setLayout:](v10, "setLayout:", v11);
  v121 = v10;
  -[STUIStatusBarRegion setActionInsets:](v10, "setActionInsets:", 0.0, -3.0, -13.0, -3.0);
  -[STUIStatusBarVisualProvider_CarPlay pillRegionCoordinator](self, "pillRegionCoordinator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPillRegion:", v10);

  v15 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("pillContent"));
  -[STUIStatusBarVisualProvider_CarPlay pillRegionCoordinator](self, "pillRegionCoordinator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pillRegion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegion setEnabilityRegion:](v15, "setEnabilityRegion:", v17);

  v18 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  +[STUIStatusBarRegionAxisFillingLayout fillingLayout](STUIStatusBarRegionAxisFillingLayout, "fillingLayout");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = v18;
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v18, "setHorizontalLayout:", v19);

  +[STUIStatusBarRegionAxisFillingLayout fillingLayout](STUIStatusBarRegionAxisFillingLayout, "fillingLayout");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v18, "setVerticalLayout:", v20);

  -[STUIStatusBarRegion setLayout:](v15, "setLayout:", v18);
  v21 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("bottom"));
  v22 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = v22;
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v22, "setHorizontalLayout:", v23);

  v24 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  -[STUIStatusBarRegionAxisStackingLayout setAlignment:](v24, "setAlignment:", 1);
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v22, "setVerticalLayout:", v24);

  v116 = v21;
  -[STUIStatusBarRegion setLayout:](v21, "setLayout:", v22);
  -[STUIStatusBarRegion setActionInsets:](v21, "setActionInsets:", 0.0, -3.0, -10.0, -10.0);
  -[STUIStatusBarVisualProvider_CarPlay setRadarRegion:](self, "setRadarRegion:", v21);
  v25 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
  objc_msgSend(v114, "addLayoutGuide:", v25);
  objc_msgSend(v25, "heightAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToConstant:", 103.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v27);

  objc_msgSend(v25, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v30);

  v115 = v25;
  objc_msgSend(v25, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v33);

  objc_msgSend(v25, "centerYAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "centerYAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v36);

  -[STUIStatusBarRegion layoutItem](v6, "layoutItem");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "topAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "topAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:constant:", v39, 7.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v40);

  -[STUIStatusBarRegion layoutItem](v6, "layoutItem");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "heightAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToConstant:", 18.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v43);

  -[STUIStatusBarRegion layoutItem](v6, "layoutItem");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "widthAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToConstant:", 39.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v46);

  -[STUIStatusBarRegion layoutItem](v6, "layoutItem");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "centerXAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "centerXAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v50);

  -[STUIStatusBarRegion layoutItem](v6, "layoutItem");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "_ui_addSubLayoutItem:", v51);

  -[STUIStatusBarRegion layoutItem](v121, "layoutItem");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "topAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegion layoutItem](v6, "layoutItem");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "topAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v56);

  -[STUIStatusBarRegion layoutItem](v121, "layoutItem");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "bottomAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegion layoutItem](v6, "layoutItem");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "bottomAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v61);

  -[STUIStatusBarRegion layoutItem](v121, "layoutItem");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "leadingAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegion layoutItem](v6, "layoutItem");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "leadingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:", v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v66);

  -[STUIStatusBarRegion layoutItem](v121, "layoutItem");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "trailingAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegion layoutItem](v6, "layoutItem");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "trailingAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "constraintEqualToAnchor:", v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v71);

  -[STUIStatusBarRegion layoutItem](v121, "layoutItem");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "_ui_addSubLayoutItem:", v72);

  -[STUIStatusBarRegion layoutItem](v15, "layoutItem");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "topAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegion layoutItem](v121, "layoutItem");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "topAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintEqualToAnchor:", v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v77);

  -[STUIStatusBarRegion layoutItem](v15, "layoutItem");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "bottomAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegion layoutItem](v121, "layoutItem");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "bottomAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "constraintEqualToAnchor:", v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v82);

  -[STUIStatusBarRegion layoutItem](v15, "layoutItem");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "leadingAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegion layoutItem](v121, "layoutItem");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "leadingAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "constraintEqualToAnchor:", v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v87);

  -[STUIStatusBarRegion layoutItem](v15, "layoutItem");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "trailingAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegion layoutItem](v121, "layoutItem");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "trailingAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "constraintEqualToAnchor:", v91);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v92);

  -[STUIStatusBarRegion layoutItem](v15, "layoutItem");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "_ui_addSubLayoutItem:", v93);

  -[STUIStatusBarRegion layoutItem](v116, "layoutItem");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "topAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "bottomAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "constraintEqualToAnchor:constant:", v96, 4.0);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v97);

  -[STUIStatusBarRegion layoutItem](v116, "layoutItem");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "bottomAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "safeAreaLayoutGuide");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "bottomAnchor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "constraintEqualToAnchor:constant:", v101, -34.0);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v102);

  -[STUIStatusBarRegion layoutItem](v116, "layoutItem");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "leadingAnchor");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "leadingAnchor");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "constraintEqualToAnchor:", v105);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v106);

  -[STUIStatusBarRegion layoutItem](v116, "layoutItem");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "trailingAnchor");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "trailingAnchor");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "constraintEqualToAnchor:", v109);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v110);

  -[STUIStatusBarRegion layoutItem](v116, "layoutItem");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "_ui_addSubLayoutItem:", v111);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v5);
  v122[0] = v15;
  v122[1] = v121;
  v122[2] = v6;
  v122[3] = v116;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v122, 4);
  v112 = (void *)objc_claimAutoreleasedReturnValue();

  return v112;
}

- (id)orderedDisplayItemPlacementsInRegionWithIdentifier:(id)a3
{
  id v4;
  NSDictionary *orderedDisplayItemPlacements;
  void *v6;
  uint64_t v7;
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
  NSDictionary *v26;
  NSDictionary *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  _QWORD v36[3];
  void *v37;
  uint64_t v38;
  _QWORD v39[4];
  _QWORD v40[4];
  void *v41;
  void *v42;
  _QWORD v43[3];

  v43[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  orderedDisplayItemPlacements = self->_orderedDisplayItemPlacements;
  if (!orderedDisplayItemPlacements)
  {
    v34 = v4;
    +[STUIStatusBarTimeItem shortTimeDisplayIdentifier](STUIStatusBarTimeItem, "shortTimeDisplayIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v6, 400);
    v7 = objc_claimAutoreleasedReturnValue();

    +[STUIStatusBarBackgroundActivityItem backgroundDisplayIdentifier](STUIStatusBarPillBackgroundActivityItem, "backgroundDisplayIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v8, 500);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v7;
    v31 = (void *)v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "excludingPlacements:", v10);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    +[STUIStatusBarTimeItem pillTimeDisplayIdentifier](STUIStatusBarTimeItem, "pillTimeDisplayIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v11, 450);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarPillBackgroundActivityItem, "defaultDisplayIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v12, 475);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "excludingPlacements:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[STUIStatusBarVisualProvider_CarPlay pillRegionCoordinator](self, "pillRegionCoordinator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPillIconPlacement:", v15);

    +[STUIStatusBarBackgroundActivityItem secondaryIconDisplayIdentifier](STUIStatusBarPillBackgroundActivityItem, "secondaryIconDisplayIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v17, 474);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "requiringAllPlacements:", v19);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarRadarItem, "defaultDisplayIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v20, 155);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = v7;
    v39[0] = CFSTR("time");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v22;
    v39[1] = CFSTR("pill");
    v37 = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v23;
    v39[2] = CFSTR("pillContent");
    v36[0] = v15;
    v36[1] = v30;
    v36[2] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v40[2] = v24;
    v39[3] = CFSTR("bottom");
    v35 = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v40[3] = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 4);
    v26 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v27 = self->_orderedDisplayItemPlacements;
    self->_orderedDisplayItemPlacements = v26;

    v4 = v34;
    orderedDisplayItemPlacements = self->_orderedDisplayItemPlacements;
  }
  -[NSDictionary objectForKeyedSubscript:](orderedDisplayItemPlacements, "objectForKeyedSubscript:", v4, v30);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
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
