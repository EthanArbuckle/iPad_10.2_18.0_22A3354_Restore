@implementation STUIStatusBarVisualProvider_CarPlayDualPassenger

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
  void *v3;
  id v4;
  void *v5;
  STUIStatusBarRegion *v6;
  void *v7;
  STUIStatusBarRegion *v8;
  STUIStatusBarRegionAxesLayout *v9;
  void *v10;
  void *v11;
  STUIStatusBarRegionAxesLayout *v12;
  void *v13;
  STUIStatusBarRegionAxisStackingLayout *v14;
  STUIStatusBarRegion *v15;
  STUIStatusBarRegionAxesLayout *v16;
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
  STUIStatusBarRegion *v86;
  STUIStatusBarRegionAxesLayout *v87;
  STUIStatusBarRegionAxesLayout *v88;
  STUIStatusBarRegionAxesLayout *v89;
  STUIStatusBarRegionAxesLayout *v90;
  STUIStatusBarRegionAxisCenteringLayout *v91;
  _QWORD v92[5];

  v92[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("signal"));
  v90 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v91 = objc_alloc_init(STUIStatusBarRegionAxisCenteringLayout);
  -[STUIStatusBarRegionAxisCenteringLayout setInterspace:](v91, "setInterspace:", 3.0);
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v90, "setHorizontalLayout:", v91);
  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v90, "setVerticalLayout:", v7);

  -[STUIStatusBarRegion setLayout:](v6, "setLayout:", v90);
  v8 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("etc"));
  v9 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = v9;
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v9, "setHorizontalLayout:", v10);

  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v9, "setVerticalLayout:", v11);

  -[STUIStatusBarRegion setLayout:](v8, "setLayout:", v9);
  v86 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("bottom"));
  v12 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = v12;
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v12, "setHorizontalLayout:", v13);

  v14 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  -[STUIStatusBarRegionAxisStackingLayout setAlignment:](v14, "setAlignment:", 4);
  -[STUIStatusBarRegionAxisStackingLayout setInterspace:](v14, "setInterspace:", 8.0);
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v12, "setVerticalLayout:", v14);

  -[STUIStatusBarRegion setLayout:](v86, "setLayout:", v12);
  v15 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("battery"));
  v16 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v16;
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v16, "setHorizontalLayout:", v17);

  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v16, "setVerticalLayout:", v18);

  -[STUIStatusBarRegion setLayout:](v15, "setLayout:", v16);
  -[STUIStatusBarRegion layoutItem](v6, "layoutItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, 7.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v22);

  -[STUIStatusBarRegion layoutItem](v6, "layoutItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "heightAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToConstant:", 14.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v25);

  -[STUIStatusBarRegion layoutItem](v6, "layoutItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v29);

  -[STUIStatusBarRegion layoutItem](v6, "layoutItem");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v33);

  -[STUIStatusBarRegion layoutItem](v6, "layoutItem");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_ui_addSubLayoutItem:", v34);

  -[STUIStatusBarRegion layoutItem](v8, "layoutItem");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "topAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegion layoutItem](v6, "layoutItem");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bottomAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:constant:", v38, 47.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v39);

  -[STUIStatusBarRegion layoutItem](v8, "layoutItem");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v43);

  -[STUIStatusBarRegion layoutItem](v8, "layoutItem");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "trailingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v47);

  -[STUIStatusBarRegion layoutItem](v8, "layoutItem");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "heightAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToConstant:", 20.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v50);

  -[STUIStatusBarRegion layoutItem](v8, "layoutItem");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_ui_addSubLayoutItem:", v51);

  -[STUIStatusBarRegion layoutItem](v86, "layoutItem");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "topAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegion layoutItem](v8, "layoutItem");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "bottomAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v56);

  -[STUIStatusBarRegion layoutItem](v86, "layoutItem");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "bottomAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegion layoutItem](v15, "layoutItem");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "lastBaselineAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:constant:", v60, -22.0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v61);

  -[STUIStatusBarRegion layoutItem](v86, "layoutItem");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "leadingAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v65);

  -[STUIStatusBarRegion layoutItem](v86, "layoutItem");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "trailingAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintEqualToAnchor:", v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v69);

  -[STUIStatusBarRegion layoutItem](v86, "layoutItem");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_ui_addSubLayoutItem:", v70);

  -[STUIStatusBarRegion layoutItem](v15, "layoutItem");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "bottomAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintEqualToAnchor:constant:", v73, -15.0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v74);

  -[STUIStatusBarRegion layoutItem](v15, "layoutItem");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "leadingAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintEqualToAnchor:", v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v78);

  -[STUIStatusBarRegion layoutItem](v15, "layoutItem");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "trailingAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "constraintEqualToAnchor:", v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v82);

  -[STUIStatusBarRegion layoutItem](v15, "layoutItem");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_ui_addSubLayoutItem:", v83);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v5);
  v92[0] = v6;
  v92[1] = v8;
  v92[2] = v86;
  v92[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 4);
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  return v84;
}

- (id)orderedDisplayItemPlacementsInRegionWithIdentifier:(id)a3
{
  id v4;
  NSDictionary *orderedDisplayItemPlacements;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
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
  NSDictionary *v36;
  NSDictionary *v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[3];
  void *v50;
  _QWORD v51[6];
  _QWORD v52[4];
  _QWORD v53[4];
  _QWORD v54[5];
  _QWORD v55[2];
  void *v56;
  _QWORD v57[3];

  v57[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  orderedDisplayItemPlacements = self->_orderedDisplayItemPlacements;
  if (!orderedDisplayItemPlacements)
  {
    v43 = v4;
    +[STUIStatusBarCellularItem signalStrengthDisplayIdentifier](STUIStatusBarCellularCondensedItem, "signalStrengthDisplayIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v6, 350);
    v7 = objc_claimAutoreleasedReturnValue();

    +[STUIStatusBarCellularCondensedItem dualSignalStrengthDisplayIdentifier](STUIStatusBarCellularCondensedItem, "dualSignalStrengthDisplayIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v8, 375);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v7;
    v10 = v7;
    v47 = (void *)v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "excludingPlacements:", v11);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    +[STUIStatusBarCellularItem typeDisplayIdentifier](STUIStatusBarCellularCondensedItem, "typeDisplayIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v12, 250);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[STUIStatusBarWifiItem signalStrengthDisplayIdentifier](STUIStatusBarWifiItem, "signalStrengthDisplayIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v14, 300);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "excludingPlacements:", v16);
    v17 = objc_claimAutoreleasedReturnValue();

    +[STUIStatusBarWifiItem iconDisplayIdentifier](STUIStatusBarWifiItem, "iconDisplayIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v18, 301);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v17;
    v55[1] = v13;
    v46 = (void *)v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "excludingPlacements:", v20);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorAirplaneModeItem, "defaultDisplayIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v21, 1200);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v10;
    v54[1] = v44;
    v54[2] = v17;
    v54[3] = v45;
    v54[4] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "excludingPlacements:", v23);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarElectronicTollCollectionItem, "defaultDisplayIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v24, 150);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarSensorActivityItem, "defaultDisplayIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v25, 600);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorQuietModeItem, "defaultDisplayIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v26, 85);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorAnnounceNotificationsItem, "defaultDisplayIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v28, 84);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    +[STUIStatusBarBatteryItem iconDisplayIdentifier](STUIStatusBarBatteryItem, "iconDisplayIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v30, 50);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v51[5] = v42;
    v52[0] = CFSTR("signal");
    v51[0] = v47;
    v51[1] = v44;
    v51[2] = v13;
    v51[3] = v17;
    v51[4] = v45;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 6);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v32;
    v52[1] = CFSTR("etc");
    v50 = v40;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v53[1] = v33;
    v52[2] = CFSTR("bottom");
    v49[0] = v41;
    v49[1] = v29;
    v49[2] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 3);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v53[2] = v34;
    v52[3] = CFSTR("battery");
    v48 = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v53[3] = v35;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 4);
    v36 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v37 = self->_orderedDisplayItemPlacements;
    self->_orderedDisplayItemPlacements = v36;

    v4 = v43;
    orderedDisplayItemPlacements = self->_orderedDisplayItemPlacements;
  }
  -[NSDictionary objectForKeyedSubscript:](orderedDisplayItemPlacements, "objectForKeyedSubscript:", v4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
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
