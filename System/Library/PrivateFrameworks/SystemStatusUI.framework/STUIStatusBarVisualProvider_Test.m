@implementation STUIStatusBarVisualProvider_Test

- (STUIStatusBarVisualProvider_Test)init
{
  STUIStatusBarVisualProvider_Test *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSSet *allRegionIdentifiers;
  objc_super v9;
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)STUIStatusBarVisualProvider_Test;
  v2 = -[STUIStatusBarVisualProvider_Test init](&v9, sel_init);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Test setOrderedDisplayItemPlacements:](v2, "setOrderedDisplayItemPlacements:", v3);

  v4 = (void *)MEMORY[0x1E0C99E60];
  v10[0] = CFSTR("top-left");
  v10[1] = CFSTR("top-right");
  v10[2] = CFSTR("top-center");
  v10[3] = CFSTR("bottom-left");
  v10[4] = CFSTR("bottom-right");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  allRegionIdentifiers = v2->_allRegionIdentifiers;
  v2->_allRegionIdentifiers = (NSSet *)v6;

  return v2;
}

- (id)setupInContainerView:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  STUIStatusBarRegion *v6;
  STUIStatusBarRegionAxesLayout *v7;
  STUIStatusBarRegionAxisStackingLayout *v8;
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
  STUIStatusBarRegion *v20;
  STUIStatusBarRegionAxesLayout *v21;
  STUIStatusBarRegionAxisStackingLayout *v22;
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
  STUIStatusBarRegion *v34;
  STUIStatusBarRegionAxesLayout *v35;
  STUIStatusBarRegionAxisCenteringLayout *v36;
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
  double v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  double v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  void *v72;
  STUIStatusBarRegion *v73;
  STUIStatusBarRegionAxesLayout *v74;
  STUIStatusBarRegionAxisStackingLayout *v75;
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
  STUIStatusBarRegion *v91;
  STUIStatusBarRegionAxesLayout *v92;
  STUIStatusBarRegionAxisStackingLayout *v93;
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
  double v115;
  void *v116;
  void *v118;
  void *v119;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("top-left"));
  v7 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v8 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  -[STUIStatusBarRegionAxisStackingLayout setAlignment:](v8, "setAlignment:", 5);
  -[STUIStatusBarRegionAxisStackingLayout setInterspace:](v8, "setInterspace:", 6.0);
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v7, "setHorizontalLayout:", v8);

  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v7, "setVerticalLayout:", v9);

  -[STUIStatusBarRegion setLayout:](v6, "setLayout:", v7);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("top-center"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegion setDependentRegionIdentifiers:](v6, "setDependentRegionIdentifiers:", v10);

  -[STUIStatusBarRegion layoutItem](v6, "layoutItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v14);

  objc_msgSend(v11, "leftAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leftAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, 10.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v17);

  objc_msgSend(v11, "heightAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToConstant:", 100.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v19);

  objc_msgSend(v4, "_ui_addSubLayoutItem:", v11);
  objc_msgSend(v118, "addObject:", v6);

  v20 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("top-right"));
  v21 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v22 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  -[STUIStatusBarRegionAxisStackingLayout setAlignment:](v22, "setAlignment:", 6);
  -[STUIStatusBarRegionAxisStackingLayout setInterspace:](v22, "setInterspace:", 6.0);
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v21, "setHorizontalLayout:", v22);

  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v21, "setVerticalLayout:", v23);

  -[STUIStatusBarRegion setLayout:](v20, "setLayout:", v21);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("top-center"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegion setDependentRegionIdentifiers:](v20, "setDependentRegionIdentifiers:", v24);

  -[STUIStatusBarRegion layoutItem](v20, "layoutItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v28);

  objc_msgSend(v25, "rightAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, -10.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v31);

  v119 = v25;
  objc_msgSend(v25, "heightAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToConstant:", 100.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v33);

  objc_msgSend(v4, "_ui_addSubLayoutItem:", v25);
  objc_msgSend(v118, "addObject:", v20);

  v34 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("top-center"));
  v35 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v36 = objc_alloc_init(STUIStatusBarRegionAxisCenteringLayout);
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v35, "setHorizontalLayout:", v36);

  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v35, "setVerticalLayout:", v37);

  -[STUIStatusBarRegion setLayout:](v34, "setLayout:", v35);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("top-left"), CFSTR("top-right"), 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegion setDependentRegionIdentifiers:](v34, "setDependentRegionIdentifiers:", v38);

  -[STUIStatusBarRegion layoutItem](v34, "layoutItem");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "topAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v42);

  -[STUIStatusBarRegion layoutItem](v34, "layoutItem");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "centerXAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerXAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v46);

  -[STUIStatusBarRegion layoutItem](v34, "layoutItem");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "leftAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rightAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintGreaterThanOrEqualToAnchor:constant:", v49, 10.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v50);

  -[STUIStatusBarRegion layoutItem](v34, "layoutItem");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "rightAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leftAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintLessThanOrEqualToAnchor:constant:", v53, -10.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v54);

  -[STUIStatusBarRegion layoutItem](v34, "layoutItem");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "heightAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToConstant:", 100.0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v57);

  -[STUIStatusBarRegion layoutItem](v34, "layoutItem");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "leftAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rightAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:constant:", v60, 10.0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v62) = 1132068864;
  objc_msgSend(v61, "setPriority:", v62);
  objc_msgSend(v5, "addObject:", v61);

  -[STUIStatusBarRegion layoutItem](v34, "layoutItem");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "rightAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leftAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:constant:", v65, -10.0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v67) = 1132068864;
  objc_msgSend(v66, "setPriority:", v67);
  objc_msgSend(v5, "addObject:", v66);

  -[STUIStatusBarRegion layoutItem](v34, "layoutItem");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "widthAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToConstant:", 50.0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v71) = 1132068864;
  objc_msgSend(v70, "setPriority:", v71);
  objc_msgSend(v5, "addObject:", v70);

  -[STUIStatusBarRegion layoutItem](v34, "layoutItem");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_ui_addSubLayoutItem:", v72);

  objc_msgSend(v118, "addObject:", v34);
  v73 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("bottom-left"));
  v74 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v75 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  -[STUIStatusBarRegionAxisStackingLayout setAlignment:](v75, "setAlignment:", 5);
  -[STUIStatusBarRegionAxisStackingLayout setInterspace:](v75, "setInterspace:", 6.0);
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v74, "setHorizontalLayout:", v75);

  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 4);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v74, "setVerticalLayout:", v76);

  -[STUIStatusBarRegion setLayout:](v73, "setLayout:", v74);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("bottom-right"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegion setDependentRegionIdentifiers:](v73, "setDependentRegionIdentifiers:", v77);

  -[STUIStatusBarRegion layoutItem](v73, "layoutItem");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "topAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bottomAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "constraintEqualToAnchor:", v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v81);

  -[STUIStatusBarRegion layoutItem](v73, "layoutItem");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "leftAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leftAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "constraintEqualToAnchor:constant:", v84, 10.0);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v85);

  -[STUIStatusBarRegion layoutItem](v73, "layoutItem");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "heightAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "constraintEqualToConstant:", 100.0);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v88);

  -[STUIStatusBarRegion layoutItem](v73, "layoutItem");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_ui_addSubLayoutItem:", v89);

  -[STUIStatusBarRegion layoutItem](v73, "layoutItem");
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v118, "addObject:", v73);
  v91 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("bottom-right"));
  v92 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v93 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  -[STUIStatusBarRegionAxisStackingLayout setAlignment:](v93, "setAlignment:", 6);
  -[STUIStatusBarRegionAxisStackingLayout setInterspace:](v93, "setInterspace:", 6.0);
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v92, "setHorizontalLayout:", v93);

  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 4);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v92, "setVerticalLayout:", v94);

  -[STUIStatusBarRegion setLayout:](v91, "setLayout:", v92);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("bottom-left"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegion setDependentRegionIdentifiers:](v91, "setDependentRegionIdentifiers:", v95);

  -[STUIStatusBarRegion layoutItem](v91, "layoutItem");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "topAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "topAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "constraintEqualToAnchor:", v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v99);

  -[STUIStatusBarRegion layoutItem](v91, "layoutItem");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "rightAnchor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightAnchor");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "constraintEqualToAnchor:constant:", v102, -10.0);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v103);

  -[STUIStatusBarRegion layoutItem](v91, "layoutItem");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "heightAnchor");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "constraintEqualToConstant:", 100.0);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v106);

  -[STUIStatusBarRegion layoutItem](v91, "layoutItem");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "leftAnchor");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "rightAnchor");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "constraintEqualToAnchor:constant:", v109, 10.0);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v110);

  -[STUIStatusBarRegion layoutItem](v91, "layoutItem");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "widthAnchor");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "widthAnchor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "constraintEqualToAnchor:", v113);
  v114 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v115) = 1132068864;
  objc_msgSend(v114, "setPriority:", v115);
  objc_msgSend(v5, "addObject:", v114);

  -[STUIStatusBarRegion layoutItem](v91, "layoutItem");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_ui_addSubLayoutItem:", v116);

  objc_msgSend(v118, "addObject:", v91);
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v5);

  return v118;
}

- (void)setOrderedDisplayItemPlacements:(id)a3 inRegionWithIdentifier:(id)a4
{
  id WeakRetained;

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_orderedDisplayItemPlacements, "setObject:forKeyedSubscript:", a3, a4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_statusBar);
  objc_msgSend(WeakRetained, "resetVisualProvider");

}

- (id)orderedDisplayItemPlacementsInRegionWithIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_orderedDisplayItemPlacements, "objectForKeyedSubscript:", a3);
}

- (id)styleAttributesForStyle:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[STUIStatusBarVisualProvider_Test statusBar](self, "statusBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarStyleAttributes styleAttributesForStatusBar:style:](STUIStatusBarStyleAttributes, "styleAttributesForStatusBar:style:", v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 16.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

  if (objc_msgSend(v5, "style") == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v7);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v8);

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImageTintColor:", v9);

  return v5;
}

- (void)setOverriddenStyleAttributes:(id)a3 forDisplayItemWithIdentifier:(id)a4
{
  id v6;
  NSMutableDictionary *overriddenStyleAttributes;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  overriddenStyleAttributes = self->_overriddenStyleAttributes;
  if (!overriddenStyleAttributes)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v9 = self->_overriddenStyleAttributes;
    self->_overriddenStyleAttributes = v8;

    overriddenStyleAttributes = self->_overriddenStyleAttributes;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](overriddenStyleAttributes, "setObject:forKeyedSubscript:", v10, v6);

}

- (id)overriddenStyleAttributesForDisplayItemWithIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_overriddenStyleAttributes, "objectForKeyedSubscript:", a3);
}

+ (CGSize)intrinsicContentSizeForOrientation:(int64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = *MEMORY[0x1E0DC55F0];
  v4 = 200.0;
  result.height = v4;
  result.width = v3;
  return result;
}

+ (BOOL)scalesWithScreenNativeScale
{
  return 0;
}

+ (BOOL)requiresIterativeOverflowLayout
{
  return 0;
}

- (UIFont)clockFont
{
  return 0;
}

- (BOOL)supportsIndirectPointerTouchActions
{
  return 0;
}

- (STUIStatusBar)statusBar
{
  return (STUIStatusBar *)objc_loadWeakRetained((id *)&self->_statusBar);
}

- (void)setStatusBar:(id)a3
{
  objc_storeWeak((id *)&self->_statusBar, a3);
}

- (NSSet)allRegionIdentifiers
{
  return self->_allRegionIdentifiers;
}

- (NSMutableDictionary)orderedDisplayItemPlacements
{
  return self->_orderedDisplayItemPlacements;
}

- (void)setOrderedDisplayItemPlacements:(id)a3
{
  objc_storeStrong((id *)&self->_orderedDisplayItemPlacements, a3);
}

- (NSMutableDictionary)overriddenStyleAttributes
{
  return self->_overriddenStyleAttributes;
}

- (void)setOverriddenStyleAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_overriddenStyleAttributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overriddenStyleAttributes, 0);
  objc_storeStrong((id *)&self->_orderedDisplayItemPlacements, 0);
  objc_storeStrong((id *)&self->_allRegionIdentifiers, 0);
  objc_destroyWeak((id *)&self->_statusBar);
}

@end
