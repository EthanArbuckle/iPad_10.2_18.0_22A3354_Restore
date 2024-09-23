@implementation _UIStatusBarDisplayItemPlacementIndicatorsGroup

+ (_UIStatusBarIdentifier)activityItemDisplayIdentifier
{
  return +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarActivityItem, "defaultDisplayIdentifier");
}

+ (id)groupWithHighPriority:(int64_t)a3 lowPriority:(int64_t)a4 bluetoothPaddingInset:(double)a5
{
  int64_t v7;
  void *v8;
  uint64_t v9;
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
  void *v28;
  _QWORD *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
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
  id v49;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[13];
  _QWORD v56[2];
  _QWORD v57[3];

  v57[1] = *MEMORY[0x1E0C80C00];
  v7 = a3 - a4;
  if (a3 <= a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIStatusBarDisplayItemPlacementIndicatorsGroup.m"), 31, CFSTR("The lowPriority should be smaller than the highPriority"));

  }
  v49 = a1;
  +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarBluetoothItem, "defaultDisplayIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v8, 3);
  v9 = objc_claimAutoreleasedReturnValue();

  +[_UIStatusBarBluetoothItem batteryDisplayIdentifier](_UIStatusBarBluetoothItem, "batteryDisplayIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v10, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v9;
  v53 = (void *)v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "requiringAllPlacements:", v12);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  +[_UIStatusBarDisplayItemPlacement spacerPlacementWithSize:priority:](_UIStatusBarDisplayItemPlacement, "spacerPlacementWithSize:priority:", 1, -a5, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v9;
  v56[1] = v52;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "requiringAllPlacements:", v14);
  v51 = objc_claimAutoreleasedReturnValue();

  +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarIndicatorSatelliteItem, "defaultDisplayIdentifier");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v48, v7 + 3);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v47;
  +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarThermalItem, "defaultDisplayIdentifier");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v46, v7 + 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v45;
  +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarIndicatorAssistantItem, "defaultDisplayIdentifier");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v44, 7);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v43;
  +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarIndicatorAirPlayItem, "defaultDisplayIdentifier");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v42, 8);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v55[3] = v41;
  +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarIndicatorCarPlayItem, "defaultDisplayIdentifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v40, 6);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v55[4] = v39;
  +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarIndicatorStudentItem, "defaultDisplayIdentifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v38, v7 + 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v55[5] = v15;
  +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarIndicatorTTYItem, "defaultDisplayIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v16, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v55[6] = v17;
  +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarIndicatorAlarmItem, "defaultDisplayIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v18, 9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v55[7] = v19;
  +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarIndicatorRotationLockItem, "defaultDisplayIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v20, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v55[8] = v21;
  +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarIndicatorQuietModeItem, "defaultDisplayIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v22, 10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v55[9] = v23;
  v55[10] = v53;
  v55[11] = v51;
  v55[12] = v52;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 13);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "activityItemDisplayIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v25, 11);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "arrayByAddingObjectsFromArray:", v24);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "groupWithPriority:placements:", a4, v28);
  v29 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)v29[4];
  v29[4] = v24;
  v31 = v24;

  v32 = (void *)v29[5];
  v29[5] = v27;
  v33 = v27;

  v34 = (void *)v29[6];
  v29[6] = v51;

  return v29;
}

- (NSArray)stablePlacements
{
  return self->_stablePlacements;
}

- (NSArray)unstablePlacements
{
  return self->_unstablePlacements;
}

- (_UIStatusBarDisplayItemPlacement)bluetoothInsetPaddingItem
{
  return self->_bluetoothInsetPaddingItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothInsetPaddingItem, 0);
  objc_storeStrong((id *)&self->_unstablePlacements, 0);
  objc_storeStrong((id *)&self->_stablePlacements, 0);
}

@end
