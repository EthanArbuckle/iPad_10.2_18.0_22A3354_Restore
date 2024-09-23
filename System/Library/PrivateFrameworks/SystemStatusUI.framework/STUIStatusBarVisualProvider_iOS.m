@implementation STUIStatusBarVisualProvider_iOS

- (BOOL)expanded
{
  return self->_expanded;
}

- (void)setStatusBar:(id)a3
{
  objc_storeWeak((id *)&self->_statusBar, a3);
}

+ (BOOL)requiresIterativeOverflowLayout
{
  return 0;
}

- (id)displayItemIdentifiersForPartWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;

  v3 = a3;
  if (objc_msgSend(v3, "isEqual:", CFSTR("batteryPartIdentifier")))
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    +[STUIStatusBarBatteryItem staticIconDisplayIdentifier](STUIStatusBarBatteryItem, "staticIconDisplayIdentifier");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v6 = (void *)v5;
    objc_msgSend(v4, "setWithObject:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (objc_msgSend(v3, "isEqual:", CFSTR("backNavigationPartIdentifier")))
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarNavigationItem, "defaultDisplayIdentifier");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (objc_msgSend(v3, "isEqual:", CFSTR("clockPartIdentifier")))
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    +[STUIStatusBarTimeItem shortTimeDisplayIdentifier](STUIStatusBarTimeItem, "shortTimeDisplayIdentifier");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (objc_msgSend(v3, "isEqual:", CFSTR("dateAndTimePartIdentifier")))
  {
    v9 = (void *)MEMORY[0x1E0C99E60];
    +[STUIStatusBarTimeItem shortTimeDisplayIdentifier](STUIStatusBarTimeItem, "shortTimeDisplayIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarTimeItem timeDisplayIdentifier](STUIStatusBarTimeItem, "timeDisplayIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarTimeItem dateDisplayIdentifier](STUIStatusBarTimeItem, "dateDisplayIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithObjects:", v6, v10, v11, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = objc_msgSend(v3, "isEqual:", CFSTR("lockPartIdentifier"));
    v13 = (void *)MEMORY[0x1E0C99E60];
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarLockItem, "defaultDisplayIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarLockItem textDisplayIdentifier](STUIStatusBarLockItem, "textDisplayIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithObjects:", v6, v10, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_8:
LABEL_9:

  return v7;
}

- (id)styleAttributesForStyle:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarStyleAttributes styleAttributesForStatusBar:style:](STUIStatusBarStyleAttributes, "styleAttributesForStatusBar:style:", v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "textColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 == 1)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTextColor:", v7);

    }
    objc_msgSend(v5, "imageTintColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v12 = (void *)v9;
      objc_msgSend(v5, "setImageTintColor:", v9);

    }
  }
  else
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTextColor:", v10);

    }
    objc_msgSend(v5, "imageTintColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }
  +[STUIStatusBarSettingsDomain rootSettings](STUIStatusBarSettingsDomain, "rootSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "visualProviderSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "redInSpringBoard");

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v16);

    objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImageTintColor:", v17);

  }
  objc_msgSend(v5, "imageTintColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "colorWithAlphaComponent:", 0.2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImageDimmedTintColor:", v19);

  objc_msgSend(v5, "setSymbolScale:", 1);
  return v5;
}

- (STUIStatusBar)statusBar
{
  return (STUIStatusBar *)objc_loadWeakRetained((id *)&self->_statusBar);
}

- (STUIStatusBarVisualProvider_iOS)init
{
  STUIStatusBarVisualProvider_iOS *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STUIStatusBarVisualProvider_iOS;
  v2 = -[STUIStatusBarVisualProvider_iOS init](&v4, sel_init);
  -[STUIStatusBarVisualProvider_iOS _createExpandedPlacements](v2, "_createExpandedPlacements");
  return v2;
}

- (id)willUpdateWithData:(id)a3
{
  id v4;

  v4 = a3;
  -[STUIStatusBarVisualProvider_iOS updateDataForService:](self, "updateDataForService:", v4);
  -[STUIStatusBarVisualProvider_iOS updateDataForSystemNavigation:](self, "updateDataForSystemNavigation:", v4);

  return (id)MEMORY[0x1E0C9AA60];
}

- (void)updateDataForSystemNavigation:(id)a3
{
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v4 = _UIStatusBarHostedInSpringBoard();
  v5 = v16;
  if ((v4 & 1) == 0)
  {
    objc_msgSend(v16, "backNavigationEntry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentAggregatedData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "backNavigationEntry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend((id)*MEMORY[0x1E0DC4730], "_systemNavigationAction");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "destinations");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "containsObject:", &unk_1E8D80408);

      v14 = (void *)MEMORY[0x1E0DB09F0];
      if (v13)
      {
        objc_msgSend(v11, "titleForDestination:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "entryWithStringValue:", v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DB09F0], "disabledEntry");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }

      if (v10 && (objc_msgSend(v10, "isEqual:", v9) & 1) == 0)
        objc_msgSend(v16, "setBackNavigationEntry:", v10);
    }

    v5 = v16;
  }

}

- (void)updateDataForService:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "secondaryCellularEntry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[STUIStatusBarDisplayItemPlacementGroup setEnabled:](self->_secondaryWifiGroup, "setEnabled:", objc_msgSend(v4, "type") != 0);
    v4 = v5;
  }

}

- (void)updateLumaTracking:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v3 = a3;
  -[STUIStatusBarVisualProvider_iOS lumaTrackingGroup](self, "lumaTrackingGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v5;
  if (v3)
  {
    v6 = objc_msgSend(v5, "isPaused");

    if ((v6 & 1) == 0)
    {
      -[STUIStatusBarVisualProvider_iOS lumaTrackingGroup](self, "lumaTrackingGroup");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPaused:", 1);

    }
    -[STUIStatusBarVisualProvider_iOS lumaTrackingGroup](self, "lumaTrackingGroup");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "style") >> 6;
    if (v9 == 2)
      v10 = 1;
    else
      v10 = 2 * (v9 == 1);
    objc_msgSend(v11, "unpauseAfterSeedingWithLumaLevel:", v10);

  }
  else
  {
    objc_msgSend(v5, "setPaused:", 1);
  }

}

- (_UILumaTrackingGroup)lumaTrackingGroup
{
  return self->_lumaTrackingGroup;
}

+ (CGSize)intrinsicContentSizeForOrientation:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  v3 = *MEMORY[0x1E0DC55F0];
  objc_msgSend(a1, "height", a3);
  v5 = v4;
  v6 = v3;
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)setLumaTrackingGroup:(id)a3
{
  objc_storeStrong((id *)&self->_lumaTrackingGroup, a3);
}

- (NSArray)expandedTrailingPlacements
{
  return self->_expandedTrailingPlacements;
}

- (NSArray)expandedLeadingPlacements
{
  return self->_expandedLeadingPlacements;
}

- (NSArray)expandedCellularPlacementsAffectedByAirplaneMode
{
  return self->_expandedCellularPlacementsAffectedByAirplaneMode;
}

- (void)_createExpandedPlacements
{
  NSArray *v3;
  NSArray *v4;
  void *v5;
  STUIStatusBarDisplayItemPlacement *v6;
  STUIStatusBarDisplayItemPlacement *expandedPillPlacement;
  void *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  STUIStatusBarDisplayItemPlacementNetworkGroup *v12;
  STUIStatusBarDisplayItemPlacementNetworkGroup *expandedNetworkGroup;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  STUIStatusBarDisplayItemPlacementGroup *v32;
  STUIStatusBarDisplayItemPlacementGroup *secondaryWifiGroup;
  void *expandedCellularPlacementsAffectedByAirplaneMode;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSArray *expandedLeadingPlacements;
  NSArray *v45;
  NSArray *expandedTrailingPlacements;
  id v47;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (-[STUIStatusBarVisualProvider_iOS wantsPillInExpandedTrailingPlacements](self, "wantsPillInExpandedTrailingPlacements"))
  {
    +[STUIStatusBarPillBackgroundActivityItem pillCombinedDisplayIdentifier](STUIStatusBarExpandedPillBackgroundActivityItem, "pillCombinedDisplayIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v5, 300);
    v6 = (STUIStatusBarDisplayItemPlacement *)objc_claimAutoreleasedReturnValue();
    expandedPillPlacement = self->_expandedPillPlacement;
    self->_expandedPillPlacement = v6;

    -[NSArray addObject:](v4, "addObject:", self->_expandedPillPlacement);
  }
  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorLocationItem, "defaultDisplayIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v8, 450);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](v4, "addObject:", v9);

  if (-[STUIStatusBarVisualProvider_iOS wantsExpandedLeadingPlacements](self, "wantsExpandedLeadingPlacements"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();
    +[STUIStatusBarDisplayItemPlacementNetworkGroup groupWithHighPriority:lowPriority:cellularItemClass:wifiItemClass:includeCellularName:](STUIStatusBarDisplayItemPlacementNetworkGroup, "groupWithHighPriority:lowPriority:cellularItemClass:wifiItemClass:includeCellularName:", 1500, 1200, v11, objc_opt_class(), 1);
    v12 = (STUIStatusBarDisplayItemPlacementNetworkGroup *)objc_claimAutoreleasedReturnValue();
    expandedNetworkGroup = self->_expandedNetworkGroup;
    self->_expandedNetworkGroup = v12;

    -[STUIStatusBarDisplayItemPlacementNetworkGroup cellularGroup](self->_expandedNetworkGroup, "cellularGroup");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "placementsAffectedByAirplaneMode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v10, "addObjectsFromArray:", v15);

    v16 = objc_opt_class();
    +[STUIStatusBarDisplayItemPlacementNetworkGroup secondaryGroupWithHighPriority:lowPriority:cellularItemClass:wifiItemClass:](STUIStatusBarDisplayItemPlacementNetworkGroup, "secondaryGroupWithHighPriority:lowPriority:cellularItemClass:wifiItemClass:", 500, 200, v16, objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "cellularGroup");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "placementsAffectedByAirplaneMode");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v10, "addObjectsFromArray:", v19);

    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorAirplaneModeItem, "defaultDisplayIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v20, 4000);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "excludingPlacements:", v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v3, "addObject:", v22);

    -[STUIStatusBarDisplayItemPlacementGroup placements](self->_expandedNetworkGroup, "placements");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v3, "addObjectsFromArray:", v23);

    -[STUIStatusBarVisualProvider_iOS regionSpacing](self, "regionSpacing");
    v25 = v24;
    -[STUIStatusBarVisualProvider_iOS expandedItemSpacing](self, "expandedItemSpacing");
    +[STUIStatusBarDisplayItemPlacement spacerPlacementWithSize:priority:](STUIStatusBarDisplayItemPlacement, "spacerPlacementWithSize:priority:", -[STUIStatusBarDisplayItemPlacementGroup minimumPriority](self->_expandedNetworkGroup, "minimumPriority") - 5, v25 + v26 * -2.0, 0.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarDisplayItemPlacementNetworkGroup cellularGroup](self->_expandedNetworkGroup, "cellularGroup");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "placements");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "requiringAnyPlacements:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v3, "addObject:", v30);

    objc_msgSend(v17, "placements");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v3, "addObjectsFromArray:", v31);

    objc_msgSend(v17, "wifiGroup");
    v32 = (STUIStatusBarDisplayItemPlacementGroup *)objc_claimAutoreleasedReturnValue();
    secondaryWifiGroup = self->_secondaryWifiGroup;
    self->_secondaryWifiGroup = v32;

    expandedCellularPlacementsAffectedByAirplaneMode = self->_expandedCellularPlacementsAffectedByAirplaneMode;
    self->_expandedCellularPlacementsAffectedByAirplaneMode = v10;
  }
  else
  {
    +[STUIStatusBarWifiItem groupWithPriority:](STUIStatusBarWifiItem, "groupWithPriority:", 500);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorAirplaneModeItem, "defaultDisplayIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v35, 4000);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v4, "addObject:", v36);

    objc_msgSend(v17, "placements");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v4, "addObjectsFromArray:", v37);

    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarVPNItem, "defaultDisplayIdentifier");
    expandedCellularPlacementsAffectedByAirplaneMode = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", expandedCellularPlacementsAffectedByAirplaneMode, 54);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v4, "addObject:", v38);

  }
  -[STUIStatusBarVisualProvider_iOS bluetoothPaddingInset](self, "bluetoothPaddingInset");
  +[STUIStatusBarDisplayItemPlacementIndicatorsGroup groupWithHighPriority:lowPriority:bluetoothPaddingInset:](STUIStatusBarDisplayItemPlacementExpandedIndicatorsGroup, "groupWithHighPriority:lowPriority:bluetoothPaddingInset:", 400, 100);
  v47 = (id)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacementBatteryGroup groupWithHighPriority:lowPriority:](STUIStatusBarDisplayItemPlacementBatteryGroup, "groupWithHighPriority:lowPriority:", objc_msgSend(v47, "maximumPriority") + 1, objc_msgSend(v47, "minimumPriority") - 5);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "placements");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObjectsFromArray:](v4, "addObjectsFromArray:", v40);

  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarBuildVersionItem, "defaultDisplayIdentifier");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v41, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](v4, "addObject:", v42);

  objc_msgSend(v39, "placements");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObjectsFromArray:](v4, "addObjectsFromArray:", v43);

  expandedLeadingPlacements = self->_expandedLeadingPlacements;
  self->_expandedLeadingPlacements = v3;
  v45 = v3;

  expandedTrailingPlacements = self->_expandedTrailingPlacements;
  self->_expandedTrailingPlacements = v4;

}

- (double)bluetoothPaddingInset
{
  double v2;

  -[STUIStatusBarVisualProvider_iOS expandedItemSpacing](self, "expandedItemSpacing");
  return round(v2 * 1.5);
}

- (double)expandedItemSpacing
{
  return 4.0;
}

- (BOOL)wantsPillInExpandedTrailingPlacements
{
  return self->_wantsPillInExpandedTrailingPlacements;
}

- (double)regionSpacing
{
  return 16.0;
}

- (BOOL)hasCellularCapability
{
  return MGGetBoolAnswer();
}

- (void)backgroundLumaGroup:(id)a3 didTransitionToLevel:(unint64_t)a4 viewsWithDifferentLevels:(id)a5
{
  id v5;
  void *v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v24;
  uint64_t v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v5;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v26)
  {
    v24 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v33 != v24)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(obj, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "integerValue");
        v11 = 4;
        if (v10 == 2)
          v11 = 1;
        if (v10 == 1)
          v12 = 2;
        else
          v12 = v11;

        -[STUIStatusBarVisualProvider_iOS regionIdentifiersForBackgroundLumaView:](self, "regionIdentifiersForBackgroundLumaView:", v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v29;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v29 != v16)
                objc_enumerationMutation(v13);
              v18 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, v18);

            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          }
          while (v15);
        }

      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v26);
  }
  v20 = 4;
  if (a4 == 2)
    v20 = 1;
  if (a4 == 1)
    v21 = 2;
  else
    v21 = v20;

  -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_setAutomaticStyle:additionalStylesForRegionIdentifiers:", v21, v6);

}

- (BOOL)supportsIndirectPointerTouchActions
{
  return objc_msgSend((id)*MEMORY[0x1E0DC4730], "_supportsIndirectInputEvents");
}

- (BOOL)hasCustomAnimationForDisplayItemWithIdentifier:(id)a3 removal:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a4;
  v6 = a3;
  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorAirplaneModeItem, "defaultDisplayIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = (id)v7 == v6 || v4;
  if (v4 && (id)v7 != v6)
  {
    +[STUIStatusBarIndicatorLocationItem prominentDisplayIdentifier](STUIStatusBarIndicatorLocationItem, "prominentDisplayIdentifier");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10 == v6)
    {
      -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "currentAggregatedData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "locationEntry");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v13, "isEnabled");

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryWifiGroup, 0);
  objc_storeStrong((id *)&self->_lumaTrackingGroup, 0);
  objc_storeStrong((id *)&self->_expandedPillPlacement, 0);
  objc_storeStrong((id *)&self->_expandedTrailingPlacements, 0);
  objc_storeStrong((id *)&self->_expandedLeadingPlacements, 0);
  objc_storeStrong((id *)&self->_expandedCellularPlacementsAffectedByAirplaneMode, 0);
  objc_storeStrong((id *)&self->_expandedNetworkGroup, 0);
  objc_destroyWeak((id *)&self->_statusBar);
}

+ (Class)visualProviderSubclassForScreen:(id)a3 visualProviderInfo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (!v8 || v8 == 3 || v8 == 1)
  {
    v9 = (void *)objc_opt_class();
    STUIStatusBarGetVisualProviderSubclassForScreenWithVisualProviderInfo(v9, v5, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return (Class)v10;
}

- (BOOL)wantsBackgroundActivityPillInExpandedTrailingPlacements
{
  return 0;
}

+ (BOOL)scalesWithScreenNativeScale
{
  return 0;
}

+ (double)height
{
  return 0.0;
}

+ (double)cornerRadius
{
  return 0.0;
}

- (UIFont)clockFont
{
  return 0;
}

- (id)orderedDisplayItemPlacementsInRegionWithIdentifier:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)setupInContainerView:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)modeUpdatedFromMode:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  STUIStatusBarVisualProvider_iOS *v6;
  uint64_t v7;
  uint64_t v8;

  -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "mode");

  switch(v5)
  {
    case 0:
      -[STUIStatusBarVisualProvider_iOS setOnLockScreen:](self, "setOnLockScreen:", 0);
      v6 = self;
      v7 = 0;
      goto LABEL_4;
    case 1:
      -[STUIStatusBarVisualProvider_iOS setOnLockScreen:](self, "setOnLockScreen:", 0);
      v6 = self;
      v7 = 1;
LABEL_4:
      -[STUIStatusBarVisualProvider_iOS setExpanded:](v6, "setExpanded:", v7);
      goto LABEL_6;
    case 2:
      -[STUIStatusBarVisualProvider_iOS setExpanded:](self, "setExpanded:", 0);
      -[STUIStatusBarVisualProvider_iOS setOnLockScreen:](self, "setOnLockScreen:", 1);
LABEL_6:
      v8 = 0;
      goto LABEL_8;
    case 3:
      -[STUIStatusBarVisualProvider_iOS setExpanded:](self, "setExpanded:", 0);
      v8 = 1;
      -[STUIStatusBarVisualProvider_iOS setOnLockScreen:](self, "setOnLockScreen:", 1);
LABEL_8:
      -[STUIStatusBarVisualProvider_iOS setOnAODLockScreen:](self, "setOnAODLockScreen:", v8);
      break;
    default:
      return;
  }
}

- (void)actionable:(id)a3 highlighted:(BOOL)a4 initialPress:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v5 = a5;
  v6 = a4;
  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "layoutItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_ui_view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0DC3518];
    v11[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setVisuallyHighlighted:forViews:initialPress:", v6, v10, v5);

  }
}

- (void)setExpanded:(BOOL)a3
{
  id v4;

  if (self->_expanded != a3)
  {
    self->_expanded = a3;
    -[STUIStatusBarVisualProvider_iOS _applyToAppearingRegions:block:](self, "_applyToAppearingRegions:block:", 0, &__block_literal_global_2);
    -[STUIStatusBarVisualProvider_iOS _applyToAppearingRegions:block:](self, "_applyToAppearingRegions:block:", 1, &__block_literal_global_27);
    -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateWithAnimations:", MEMORY[0x1E0C9AA60]);

  }
}

- (void)_applyToAppearingRegions:(BOOL)a3 block:(id)a4
{
  int v4;
  void (**v6)(id, void *);
  int v7;
  __CFString **v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *))a4;
  v7 = -[STUIStatusBarVisualProvider_iOS expanded](self, "expanded");
  v8 = STUIStatusBarPartIdentifierNormal;
  if (v7 == v4)
    v8 = STUIStatusBarPartIdentifierExpanded;
  -[STUIStatusBarVisualProvider_iOS regionIdentifiersForPartWithIdentifier:](self, "regionIdentifiersForPartWithIdentifier:", *v8);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13);
        -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar", (_QWORD)v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "regions");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v6[2](v6, v17);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

}

- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorAirplaneModeItem, "defaultDisplayIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    -[STUIStatusBarVisualProvider_iOS animationForAirplaneMode](self, "animationForAirplaneMode");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (v7)
  {
    v9 = v7;
  }
  else
  {
    -[STUIStatusBarVisualProvider_iOS defaultAnimationForDisplayItemWithIdentifier:](self, "defaultAnimationForDisplayItemWithIdentifier:", v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorAirplaneModeItem, "defaultDisplayIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    -[STUIStatusBarVisualProvider_iOS animationForAirplaneMode](self, "animationForAirplaneMode");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[STUIStatusBarIndicatorLocationItem prominentDisplayIdentifier](STUIStatusBarIndicatorLocationItem, "prominentDisplayIdentifier");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9 == v6)
    {
      -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "currentAggregatedData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "locationEntry");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEnabled");

      if (v14)
      {
        -[STUIStatusBarVisualProvider_iOS animationForProminentLocation](self, "animationForProminentLocation");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
    }
    else
    {

    }
    if (v7)
    {
      v10 = v7;
    }
    else
    {
      -[STUIStatusBarVisualProvider_iOS defaultAnimationForDisplayItemWithIdentifier:](self, "defaultAnimationForDisplayItemWithIdentifier:", v6);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_10:
  v15 = v10;

  return v15;
}

- (double)airplaneTravelOffsetInProposedPartWithIdentifier:(id *)a3 animationType:(int64_t)a4
{
  double result;
  void *v6;

  result = 0.0;
  if (a4 == 2)
  {
    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorAirplaneModeItem, "defaultDisplayIdentifier", 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringRepresentation");
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    return 100.0;
  }
  return result;
}

- (double)airplaneSpeedForAnimationType:(int64_t)a3
{
  double result;

  result = 40.0;
  if (a3 == 2)
    return 160.0;
  return result;
}

- (double)airplaneShouldFadeForAnimationType:(int64_t)a3
{
  double result;

  result = 0.0;
  if (a3 == 2)
    return 1.0;
  return result;
}

- (double)airplaneObstacleFadeOutDuration
{
  return 0.05;
}

- (double)airplaneObstacleFadeInDuration
{
  return 0.3;
}

- (STUIStatusBarAnimation)animationForAirplaneMode
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id obj;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD *v35;
  _QWORD v36[9];
  _QWORD v37[5];
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[5];
  _QWORD v44[8];
  BOOL v45;
  _QWORD v46[5];
  id v47;
  _QWORD v48[4];
  _QWORD v49[4];
  uint64_t v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x2020000000;
  v49[3] = 0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  v48[3] = 0;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x3032000000;
  v46[3] = __Block_byref_object_copy__1;
  v46[4] = __Block_byref_object_dispose__1;
  v47 = 0;
  -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "styleAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "effectiveLayoutDirection") == 1;

  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke;
  v44[3] = &unk_1E8D63078;
  v44[4] = self;
  v44[5] = v46;
  v45 = v5;
  v44[6] = v48;
  v44[7] = v49;
  +[STUIStatusBarAnimation animationWithBlock:](STUIStatusBarAnimation, "animationWithBlock:", v44);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPriority:", 100);
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_3;
  v43[3] = &unk_1E8D631A8;
  v43[4] = v48;
  objc_msgSend(v6, "setPrepareBlock:", v43);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_statusBar);
  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorAirplaneModeItem, "defaultDisplayIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "stateForDisplayItemWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "potentialPlacementRegionIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v10;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
  if (v11)
  {
    v26 = *(_QWORD *)v40;
    do
    {
      v28 = v11;
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v40 != v26)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
        v14 = objc_loadWeakRetained((id *)&self->_statusBar);
        objc_msgSend(v14, "regions");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = v6;
        v37[0] = 0;
        v37[1] = v37;
        v37[2] = 0x3032000000;
        v37[3] = __Block_byref_object_copy__1;
        v37[4] = __Block_byref_object_dispose__1;
        v38 = 0;
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_4;
        v36[3] = &unk_1E8D630C8;
        v36[6] = v48;
        v36[7] = v49;
        v36[8] = v37;
        v36[4] = self;
        v36[5] = v46;
        +[STUIStatusBarAnimation animationWithBlock:](STUIStatusBarAnimation, "animationWithBlock:", v36);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setPriority:", 100);
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_15;
        v33[3] = &unk_1E8D630F0;
        v35 = v37;
        v19 = v16;
        v34 = v19;
        objc_msgSend(v18, "setPrepareBlock:", v33);
        -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "displayItemIdentifiersInRegionsWithIdentifiers:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_16;
        v29[3] = &unk_1E8D63118;
        v30 = v27;
        v31 = v17;
        v23 = v18;
        v32 = v23;
        objc_msgSend(v22, "enumerateObjectsUsingBlock:", v29);

        v6 = v17;
        _Block_object_dispose(v37, 8);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    }
    while (v11);
  }

  objc_msgSend(v6, "setDelaysDependentItems:", 1);
  _Block_object_dispose(v46, 8);

  _Block_object_dispose(v48, 8);
  _Block_object_dispose(v49, 8);
  return (STUIStatusBarAnimation *)v6;
}

- (STUIStatusBarAnimation)animationForProminentLocation
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[4];
  __int128 v10;

  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3010000000;
  v9[3] = "";
  v10 = *MEMORY[0x1E0C9D538];
  +[STUIStatusBarAnimation animationWithBlock:](STUIStatusBarAnimation, "animationWithBlock:", &__block_literal_global_38);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPriority:", 100);
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__STUIStatusBarVisualProvider_iOS_animationForProminentLocation__block_invoke_3;
  v8[3] = &unk_1E8D63180;
  v8[4] = v9;
  +[STUIStatusBarAnimation animationWithBlock:](STUIStatusBarAnimation, "animationWithBlock:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPriority:", 100);
  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorLocationItem, "defaultDisplayIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubAnimation:forDisplayItemWithIdentifier:", v4, v5);

  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __64__STUIStatusBarVisualProvider_iOS_animationForProminentLocation__block_invoke_5;
  v7[3] = &unk_1E8D631A8;
  v7[4] = v9;
  objc_msgSend(v2, "setPrepareBlock:", v7);
  objc_msgSend(v2, "setDelaysAnimatingItems:", 1);

  _Block_object_dispose(v9, 8);
  return (STUIStatusBarAnimation *)v2;
}

- (id)defaultAnimationForDisplayItemWithIdentifier:(id)a3
{
  return STUIStatusBarDefaultScaleAnimation(self, a3, 0.75);
}

- (id)regionIdentifiersForBackgroundLumaView:(id)a3
{
  return 0;
}

- (double)leadingItemSpacing
{
  return self->_leadingItemSpacing;
}

- (BOOL)onLockScreen
{
  return self->_onLockScreen;
}

- (void)setOnLockScreen:(BOOL)a3
{
  self->_onLockScreen = a3;
}

- (BOOL)onAODLockScreen
{
  return self->_onAODLockScreen;
}

- (void)setOnAODLockScreen:(BOOL)a3
{
  self->_onAODLockScreen = a3;
}

- (STUIStatusBarDisplayItemPlacementNetworkGroup)expandedNetworkGroup
{
  return self->_expandedNetworkGroup;
}

- (STUIStatusBarDisplayItemPlacement)expandedPillPlacement
{
  return self->_expandedPillPlacement;
}

- (STUIStatusBarDisplayItemPlacementGroup)secondaryWifiGroup
{
  return self->_secondaryWifiGroup;
}

- (void)setSecondaryWifiGroup:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryWifiGroup, a3);
}

@end
