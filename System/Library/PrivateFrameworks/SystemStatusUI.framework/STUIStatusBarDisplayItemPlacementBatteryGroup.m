@implementation STUIStatusBarDisplayItemPlacementBatteryGroup

+ (id)groupWithHighPriority:(int64_t)a3 lowPriority:(int64_t)a4
{
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v6 = a3 - a4;
  +[STUIStatusBarBatteryItem staticIconDisplayIdentifier](STUIStatusBarBatteryItem, "staticIconDisplayIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v7, v6 + 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[STUIStatusBarBatteryItem percentDisplayIdentifier](STUIStatusBarBatteryItem, "percentDisplayIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorLiquidDetectionItem, "defaultDisplayIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v11, v6 + 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v12;
  v16[1] = v10;
  v16[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "groupWithPriority:placements:", a4, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
