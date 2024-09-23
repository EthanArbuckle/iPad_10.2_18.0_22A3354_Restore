@implementation STUIStatusBarDisplayItemPlacementIndicatorsGroup

+ (id)groupWithHighPriority:(int64_t)a3 lowPriority:(int64_t)a4 bluetoothPaddingInset:(double)a5
{
  int64_t v6;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
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
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[13];
  _QWORD v53[2];
  _QWORD v54[3];

  v54[1] = *MEMORY[0x1E0C80C00];
  v6 = a3 - a4;
  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarBluetoothItem, "defaultDisplayIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v7, 3);
  v8 = objc_claimAutoreleasedReturnValue();

  +[STUIStatusBarBluetoothItem batteryDisplayIdentifier](STUIStatusBarBluetoothItem, "batteryDisplayIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v9, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v8;
  v50 = (void *)v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requiringAllPlacements:", v11);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  +[STUIStatusBarDisplayItemPlacement spacerPlacementWithSize:priority:](STUIStatusBarDisplayItemPlacement, "spacerPlacementWithSize:priority:", 1, -a5, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v8;
  v53[1] = v49;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "requiringAllPlacements:", v13);
  v48 = objc_claimAutoreleasedReturnValue();

  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorSatelliteItem, "defaultDisplayIdentifier");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v45, v6 + 3);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v44;
  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarThermalItem, "defaultDisplayIdentifier");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v43, v6 + 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v42;
  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorAssistantItem, "defaultDisplayIdentifier");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v41, 7);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v52[2] = v40;
  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorAirPlayItem, "defaultDisplayIdentifier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v39, 8);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v52[3] = v38;
  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorCarPlayItem, "defaultDisplayIdentifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v37, 6);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v52[4] = v36;
  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorStudentItem, "defaultDisplayIdentifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v35, v6 + 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v52[5] = v14;
  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorTTYItem, "defaultDisplayIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v15, 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v52[6] = v16;
  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorAlarmItem, "defaultDisplayIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v17, 9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v52[7] = v18;
  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorRotationLockItem, "defaultDisplayIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v19, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v52[8] = v20;
  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorQuietModeItem, "defaultDisplayIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v21, 10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v52[9] = v22;
  v52[10] = v50;
  v52[11] = v48;
  v52[12] = v49;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 13);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "activityItemDisplayIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v24, 11);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "arrayByAddingObjectsFromArray:", v23);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "groupWithPriority:placements:", a4, v27);
  v28 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)v28[4];
  v28[4] = v23;
  v30 = v23;

  v31 = (void *)v28[5];
  v28[5] = v26;
  v32 = v26;

  v33 = (void *)v28[6];
  v28[6] = v48;

  return v28;
}

+ (STUIStatusBarIdentifier)activityItemDisplayIdentifier
{
  return +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarActivityItem_SyncOnly, "defaultDisplayIdentifier");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothInsetPaddingItem, 0);
  objc_storeStrong((id *)&self->_unstablePlacements, 0);
  objc_storeStrong((id *)&self->_stablePlacements, 0);
}

- (NSArray)stablePlacements
{
  return self->_stablePlacements;
}

- (NSArray)unstablePlacements
{
  return self->_unstablePlacements;
}

- (STUIStatusBarDisplayItemPlacement)bluetoothInsetPaddingItem
{
  return self->_bluetoothInsetPaddingItem;
}

@end
