@implementation STUIStatusBarDisplayItemPlacementNetworkGroup

+ (id)secondaryGroupWithHighPriority:(int64_t)a3 lowPriority:(int64_t)a4 cellularItemClass:(Class)a5 wifiItemClass:(Class)a6
{
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
  void *v22;
  void *v23;
  void *v24;
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  -[objc_class groupWithHighPriority:lowPriority:typeClass:allowDualNetwork:](a5, "groupWithHighPriority:lowPriority:typeClass:allowDualNetwork:", a3, a4, a5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class groupWithPriority:](a6, "groupWithPriority:", objc_msgSend(v7, "maximumPriority") + 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "signalStrengthPlacement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPriority:", objc_msgSend(v9, "priority") + objc_msgSend(v8, "maximumPriority"));

  objc_msgSend(v7, "warningPlacement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPriority:", objc_msgSend(v10, "priority") + objc_msgSend(v8, "maximumPriority"));

  objc_msgSend(v8, "signalStrengthPlacement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "typePlacement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "excludingPlacements:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "signalStrengthPlacement");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v15;
  objc_msgSend(v7, "warningPlacement");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "requiringAnyPlacements:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSignalStrengthPlacement:", v18);

  objc_msgSend(v8, "iconPlacement");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "signalStrengthPlacement");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v20;
  objc_msgSend(v7, "warningPlacement");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "requiringAnyPlacements:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIconPlacement:", v23);

  objc_msgSend(a1, "_groupWithCellularGroup:wifiGroup:includeCellularName:", v7, v8, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (STUIStatusBarDisplayItemPlacementNetworkGroup)groupWithHighPriority:(int64_t)a3 lowPriority:(int64_t)a4 cellularItemClass:(Class)a5 wifiItemClass:(Class)a6 cellularTypeClass:(Class)a7 includeCellularName:(BOOL)a8 allowDualNetwork:(BOOL)a9
{
  _BOOL8 v9;
  Class v11;
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
  void *v25;
  _QWORD v26[2];

  v9 = a8;
  v11 = a5;
  v26[1] = *MEMORY[0x1E0C80C00];
  if (a7)
    a5 = a7;
  -[objc_class groupWithHighPriority:lowPriority:typeClass:allowDualNetwork:](v11, "groupWithHighPriority:lowPriority:typeClass:allowDualNetwork:", a3, a4, a5, a9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class groupWithPriority:](a6, "groupWithPriority:", objc_msgSend(v13, "maximumPriority") + 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "signalStrengthPlacement");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "typePlacement");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "excludingPlacements:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSignalStrengthPlacement:", v18);

  objc_msgSend(v14, "iconPlacement");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "typePlacement");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "excludingPlacements:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setIconPlacement:", v22);

  objc_msgSend(a1, "_groupWithCellularGroup:wifiGroup:includeCellularName:", v13, v14, v9);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return (STUIStatusBarDisplayItemPlacementNetworkGroup *)v23;
}

+ (id)_groupWithCellularGroup:(id)a3 wifiGroup:(id)a4 includeCellularName:(BOOL)a5
{
  _BOOL4 v5;
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
  uint64_t v19;
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
  _QWORD *v49;
  void *v50;
  id v51;
  void *v52;
  _QWORD v55[6];
  void *v56;
  void *v57;
  void *v58;
  _QWORD v59[2];
  void *v60;
  _QWORD v61[4];

  v5 = a5;
  v61[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarVPNItem, "defaultDisplayIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v9, objc_msgSend(v7, "minimumPriority") + 10);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "typePlacement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v11;
  objc_msgSend(v8, "signalStrengthPlacement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v61[1] = v12;
  objc_msgSend(v8, "iconPlacement");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v61[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requiringAnyPlacements:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dualNameAndTypePlacement");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v7, "dualNameAndTypePlacement");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "requiringAnyPlacements:", v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v19;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "signalStrengthPlacement");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v21);

  objc_msgSend(v7, "dualSignalStrengthPlacement");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v7, "dualSignalStrengthPlacement");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v23);

  }
  objc_msgSend(v7, "warningPlacement");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v24;
  objc_msgSend(v7, "rawPlacement");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObjectsFromArray:", v26);

  if (v5)
  {
    objc_msgSend(v7, "badgePlacement");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(v7, "badgePlacement");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v28);

    }
    objc_msgSend(v7, "namePlacement");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v29);

    objc_msgSend(v7, "dualNamePlacement");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(v7, "dualNamePlacement");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v31);

    }
    objc_msgSend(v7, "dualNameAndTypePlacement");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend(v7, "dualNameAndTypePlacement");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "signalStrengthPlacement");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v33;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "excludingPlacements:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setSignalStrengthPlacement:", v36);

      objc_msgSend(v8, "iconPlacement");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v33;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "excludingPlacements:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setIconPlacement:", v39);

      objc_msgSend(v8, "rawPlacement");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v33;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "excludingPlacements:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setRawPlacement:", v42);

      objc_msgSend(v20, "addObject:", v33);
    }
  }
  objc_msgSend(v7, "typePlacement");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v43;
  objc_msgSend(v8, "signalStrengthPlacement");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v44;
  objc_msgSend(v8, "iconPlacement");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v45;
  objc_msgSend(v8, "rawPlacement");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v55[3] = v46;
  v55[4] = v15;
  objc_msgSend(v7, "callForwardingPlacement");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v55[5] = v47;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 6);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObjectsFromArray:", v48);

  objc_msgSend(a1, "groupWithPriority:placements:", 0, v20);
  v49 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)v49[4];
  v49[4] = v7;
  v51 = v7;

  v52 = (void *)v49[5];
  v49[5] = v8;

  return v49;
}

- (STUIStatusBarDisplayItemPlacementWifiGroup)wifiGroup
{
  return self->_wifiGroup;
}

+ (STUIStatusBarDisplayItemPlacementNetworkGroup)groupWithHighPriority:(int64_t)a3 lowPriority:(int64_t)a4 cellularItemClass:(Class)a5 wifiItemClass:(Class)a6 includeCellularName:(BOOL)a7
{
  uint64_t v8;

  LOBYTE(v8) = 0;
  return (STUIStatusBarDisplayItemPlacementNetworkGroup *)objc_msgSend(a1, "groupWithHighPriority:lowPriority:cellularItemClass:wifiItemClass:cellularTypeClass:includeCellularName:allowDualNetwork:", a3, a4, a5, a6, 0, a7, v8);
}

- (STUIStatusBarDisplayItemPlacementCellularGroup)cellularGroup
{
  return self->_cellularGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiGroup, 0);
  objc_storeStrong((id *)&self->_cellularGroup, 0);
}

@end
