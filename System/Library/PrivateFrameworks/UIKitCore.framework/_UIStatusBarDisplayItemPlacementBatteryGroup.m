@implementation _UIStatusBarDisplayItemPlacementBatteryGroup

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
  void *v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v6 = a3 - a4;
  if (a3 <= a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIStatusBarDisplayItemPlacementBatteryGroup.m"), 16, CFSTR("The lowPriority should be smaller than the highPriority"));

  }
  +[_UIStatusBarBatteryItem staticIconDisplayIdentifier](_UIStatusBarBatteryItem, "staticIconDisplayIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v7, v6 + 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[_UIStatusBarBatteryItem percentDisplayIdentifier](_UIStatusBarBatteryItem, "percentDisplayIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarIndicatorLiquidDetectionItem, "defaultDisplayIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v11, v6 + 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v12;
  v18[1] = v10;
  v18[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "groupWithPriority:placements:", a4, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
