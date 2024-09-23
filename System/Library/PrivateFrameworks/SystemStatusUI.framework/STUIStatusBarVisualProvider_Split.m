@implementation STUIStatusBarVisualProvider_Split

- (id)orderedDisplayItemPlacementsInRegionWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[STUIStatusBarVisualProvider_Split orderedDisplayItemPlacements](self, "orderedDisplayItemPlacements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[STUIStatusBarVisualProvider_Split _orderedDisplayItemPlacements](self, "_orderedDisplayItemPlacements");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarVisualProvider_Split setOrderedDisplayItemPlacements:](self, "setOrderedDisplayItemPlacements:", v6);

  }
  -[STUIStatusBarVisualProvider_Split orderedDisplayItemPlacements](self, "orderedDisplayItemPlacements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSDictionary)orderedDisplayItemPlacements
{
  return self->_orderedDisplayItemPlacements;
}

- (void)statusBarRegionsUpdated
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  STUIStatusBarVisualProvider_Split *v8;

  if (self)
  {
    if (-[STUIStatusBarVisualProvider_iOS expanded](self, "expanded"))
    {
      -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)*MEMORY[0x1E0DC4730];
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __66__STUIStatusBarVisualProvider_Split__updateExpandedTrailingRegion__block_invoke;
      v6[3] = &unk_1E8D62C88;
      v7 = v3;
      v8 = self;
      v5 = v3;
      objc_msgSend(v4, "_performBlockAfterCATransactionCommits:", v6);

    }
  }
}

- (void)setOrderedDisplayItemPlacements:(id)a3
{
  objc_storeStrong((id *)&self->_orderedDisplayItemPlacements, a3);
}

- (id)displayItemIdentifiersForPartWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString **v8;
  void *v9;
  void *v10;
  objc_super v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isEqual:", CFSTR("batteryPartIdentifier")))
  {
    if (-[STUIStatusBarVisualProvider_iOS expanded](self, "expanded")
      || (objc_msgSend((id)objc_opt_class(), "showsLargeBatteryChargingAnimation") & 1) == 0)
    {
      v5 = (void *)MEMORY[0x1E0C99E60];
      +[STUIStatusBarBatteryItem staticIconDisplayIdentifier](STUIStatusBarBatteryItem, "staticIconDisplayIdentifier");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = (void *)MEMORY[0x1E0C99E60];
      +[STUIStatusBarBatteryItem iconDisplayIdentifier](STUIStatusBarBatteryItem, "iconDisplayIdentifier");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v6;
    objc_msgSend(v5, "setWithObject:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (objc_msgSend(v4, "isEqual:", CFSTR("fittingLeadingPartIdentifier")))
  {
    -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[STUIStatusBarVisualProvider_iOS expanded](self, "expanded"))
    {
      v16[0] = CFSTR("expandedLeading");
      v8 = (const __CFString **)v16;
    }
    else
    {
      v15 = CFSTR("leading");
      v8 = &v15;
    }
LABEL_16:
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayItemIdentifiersInRegionsWithIdentifiers:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
    goto LABEL_18;
  }
  if (objc_msgSend(v4, "isEqual:", CFSTR("fittingTrailingPartIdentifier")))
  {
    -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[STUIStatusBarVisualProvider_iOS expanded](self, "expanded"))
    {
      v14 = CFSTR("expandedTrailing");
      v8 = &v14;
    }
    else
    {
      v13 = CFSTR("trailing");
      v8 = &v13;
    }
    goto LABEL_16;
  }
  v12.receiver = self;
  v12.super_class = (Class)STUIStatusBarVisualProvider_Split;
  -[STUIStatusBarVisualProvider_iOS displayItemIdentifiersForPartWithIdentifier:](&v12, sel_displayItemIdentifiersForPartWithIdentifier_, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return v9;
}

- (id)styleAttributesForStyle:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)STUIStatusBarVisualProvider_Split;
  -[STUIStatusBarVisualProvider_iOS styleAttributesForStyle:](&v16, sel_styleAttributesForStyle_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v4, "mode"))
  {
    case 0:
    case 2:
      goto LABEL_4;
    case 1:
      -[STUIStatusBarVisualProvider_Split expandedIconScale](self, "expandedIconScale");
      objc_msgSend(v4, "setIconScale:");
      objc_msgSend(v4, "setIconSize:", -[STUIStatusBarVisualProvider_Split expandedIconSize](self, "expandedIconSize"));
      -[STUIStatusBarVisualProvider_Split expandedFont](self, "expandedFont");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setFont:", v5);

      -[STUIStatusBarVisualProvider_Split expandedFont](self, "expandedFont");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setEmphasizedFont:", v6);

      -[STUIStatusBarVisualProvider_Split expandedFont](self, "expandedFont");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 3:
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "colorWithAlphaComponent:", 0.8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTextColor:", v9);

      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "colorWithAlphaComponent:", 0.8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setImageTintColor:", v11);

LABEL_4:
      -[STUIStatusBarVisualProvider_Split normalIconScale](self, "normalIconScale");
      objc_msgSend(v4, "setIconScale:");
      objc_msgSend(v4, "setIconSize:", -[STUIStatusBarVisualProvider_Split normalIconSize](self, "normalIconSize"));
      -[STUIStatusBarVisualProvider_Split normalFont](self, "normalFont");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setFont:", v12);

      -[STUIStatusBarVisualProvider_Split emphasizedFont](self, "emphasizedFont");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setEmphasizedFont:", v13);

      -[STUIStatusBarVisualProvider_Split smallFont](self, "smallFont");
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
      v14 = (void *)v7;
      objc_msgSend(v4, "setSmallFont:", v7);

      break;
    default:
      break;
  }
  objc_msgSend(v4, "setImageNamePrefixes:", &unk_1E8D80348);
  return v4;
}

- (UIFont)normalFont
{
  int IsBoldTextEnabled;
  void *v3;
  BOOL v4;
  void *v5;
  uint64_t v6;
  void *v7;

  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v3 = (void *)qword_1EFC01CD8;
  if (qword_1EFC01CD8)
    v4 = _MergedGlobals_6 == IsBoldTextEnabled;
  else
    v4 = 0;
  if (!v4)
  {
    _MergedGlobals_6 = IsBoldTextEnabled;
    v5 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend((id)objc_opt_class(), "baseFontSize");
    objc_msgSend(v5, "systemFontOfSize:weight:");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)qword_1EFC01CD8;
    qword_1EFC01CD8 = v6;

    v3 = (void *)qword_1EFC01CD8;
  }
  return (UIFont *)v3;
}

- (UIFont)emphasizedFont
{
  int IsBoldTextEnabled;
  void *v3;
  BOOL v4;
  void *v5;
  double v6;
  uint64_t v7;
  void *v8;

  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v3 = (void *)unk_1EFC01CE8;
  if (unk_1EFC01CE8)
    v4 = byte_1EFC01CCA == IsBoldTextEnabled;
  else
    v4 = 0;
  if (!v4)
  {
    byte_1EFC01CCA = IsBoldTextEnabled;
    v5 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend((id)objc_opt_class(), "baseFontSize");
    objc_msgSend(v5, "systemFontOfSize:weight:", v6 + 2.0, *MEMORY[0x1E0DC1448]);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)unk_1EFC01CE8;
    unk_1EFC01CE8 = v7;

    v3 = (void *)unk_1EFC01CE8;
  }
  return (UIFont *)v3;
}

- (int64_t)normalIconSize
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  int64_t v8;

  -[STUIStatusBarVisualProvider_Split normalIconScale](self, "normalIconScale");
  v4 = v3;
  -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_effectiveTargetScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_scale");
  if (v7 <= 2.5)
  {
    if (v4 == 1.07)
    {
      v8 = 5;
    }
    else if (v4 == 1.16)
    {
      v8 = 9;
    }
    else if (v4 == 1.2412)
    {
      v8 = 11;
    }
    else
    {
      v8 = 1;
    }
  }
  else if (v4 == 1.08)
  {
    v8 = 6;
  }
  else if (v4 == 1.06)
  {
    v8 = 4;
  }
  else if (v4 == 1.12)
  {
    v8 = 7;
  }
  else if (v4 == 1.26)
  {
    v8 = 8;
  }
  else if (v4 == 1.16)
  {
    v8 = 10;
  }
  else if (v4 == 1.2412)
  {
    v8 = 12;
  }
  else if (v4 == 1.2992)
  {
    v8 = 13;
  }
  else
  {
    v8 = 2;
  }

  return v8;
}

- (void)itemCreated:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  id v13;

  v13 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v13, "setTypeStringProvider:", self);
LABEL_11:
    v8 = v13;
    goto LABEL_12;
  }
  objc_msgSend(v13, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarItem identifier](STUIStatusBarVoiceControlPillItem, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    v9 = v13;
    -[STUIStatusBarVisualProvider_Split smallPillSize](self, "smallPillSize");
    objc_msgSend(v9, "setPillSize:");
LABEL_10:

    goto LABEL_11;
  }
  objc_msgSend(v13, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarItem identifier](STUIStatusBarBatteryItem, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v13;
  if (v6 == v7)
  {
    v9 = v13;
    +[STUIStatusBarSettingsDomain rootSettings](STUIStatusBarSettingsDomain, "rootSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "itemSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_msgSend(v11, "batteryPercentageAlwaysEnabled") & 1) != 0
       || -[STUIStatusBarVisualProvider_Split supportsCondensedBatteryPercentage](self, "supportsCondensedBatteryPercentage");
    objc_msgSend(v9, "setUsesCondensedPercentageDisplay:", v12);

    goto LABEL_10;
  }
LABEL_12:

}

- (UIFont)smallFont
{
  int IsBoldTextEnabled;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;

  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v3 = (void *)unk_1EFC01CF0;
  if (unk_1EFC01CF0)
    v4 = byte_1EFC01CCB == IsBoldTextEnabled;
  else
    v4 = 0;
  if (!v4)
  {
    byte_1EFC01CCB = IsBoldTextEnabled;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 11.0, *MEMORY[0x1E0DC1438]);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)unk_1EFC01CF0;
    unk_1EFC01CF0 = v5;

    v3 = (void *)unk_1EFC01CF0;
  }
  return (UIFont *)v3;
}

- (BOOL)supportsCondensedBatteryPercentage
{
  return 1;
}

- (id)overriddenStyleAttributesForDisplayItemWithIdentifier:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarNavigationItem, "defaultDisplayIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    +[STUIStatusBarStyleAttributes overriddenStyleAttributes](STUIStatusBarStyleAttributes, "overriddenStyleAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarVisualProvider_Split smallFont](self, "smallFont");
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v12 = (void *)v11;
    objc_msgSend(v10, "setFont:", v11);

    goto LABEL_11;
  }
  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorLocationItem, "defaultDisplayIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if ((id)v6 == v4)
  {

    goto LABEL_8;
  }
  v7 = (void *)v6;
  +[STUIStatusBarIndicatorLocationItem prominentDisplayIdentifier](STUIStatusBarIndicatorLocationItem, "prominentDisplayIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v4)
  {
LABEL_8:
    +[STUIStatusBarStyleAttributes overriddenStyleAttributes](STUIStatusBarStyleAttributes, "overriddenStyleAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarVisualProvider_Split emphasizedFont](self, "emphasizedFont");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarVoiceControlItem, "defaultDisplayIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v4)
  {
    +[STUIStatusBarStyleAttributes overriddenStyleAttributes](STUIStatusBarStyleAttributes, "overriddenStyleAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSymbolScale:", 1);
    -[STUIStatusBarVisualProvider_Split voiceControlFont](self, "voiceControlFont");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)willUpdateWithData:(id)a3
{
  STUIStatusBarVisualProvider_Split *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  char v16;
  void *v17;
  BOOL v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  id v40;
  void *v41;
  id v42;
  id obj;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  STUIStatusBarVisualProvider_Split *v47;
  id v48;
  objc_super v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v3 = self;
  v60 = *MEMORY[0x1E0C80C00];
  v49.receiver = self;
  v49.super_class = (Class)STUIStatusBarVisualProvider_Split;
  v4 = a3;
  -[STUIStatusBarVisualProvider_Phone willUpdateWithData:](&v49, sel_willUpdateWithData_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v4;
  if (!v3)
  {

    v40 = v42;
    goto LABEL_45;
  }
  v47 = v3;
  if (objc_msgSend((id)objc_opt_class(), "showsLargeBatteryChargingAnimation"))
  {
    objc_msgSend(v42, "mainBatteryEntry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarVisualProvider_iOS statusBar](v3, "statusBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentAggregatedData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mainBatteryEntry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6 || !v9 || -[STUIStatusBarVisualProvider_iOS expanded](v3, "expanded"))
      goto LABEL_15;
    if (!objc_msgSend(v9, "state")
      && objc_msgSend(v6, "state") == 1
      && !-[STUIStatusBarDisplayItemPlacement isEnabled](v3->_batteryChargingPlacement, "isEnabled"))
    {
      -[STUIStatusBarVisualProvider_iOS statusBar](v3, "statusBar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "areAnimationsEnabled") & 1) != 0)
      {
        -[STUIStatusBarVisualProvider_iOS statusBar](v3, "statusBar");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[STUIStatusBarBatteryItem iconDisplayIdentifier](STUIStatusBarBatteryItem, "iconDisplayIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "displayItemWithIdentifier:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEnabled");

        v3 = v47;
        if (v14)
        {
          -[STUIStatusBarDisplayItemPlacement setEnabled:](v47->_batteryChargingPlacement, "setEnabled:", 1);
LABEL_15:

          goto LABEL_16;
        }
      }
      else
      {

      }
    }
    -[STUIStatusBarVisualProvider_iOS statusBar](v3, "statusBar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "areAnimationsEnabled");

    if ((v16 & 1) == 0)
      -[STUIStatusBarVisualProvider_Split _collapseBattery]((id *)&v3->super.super.super.isa);
    goto LABEL_15;
  }
LABEL_16:

  v48 = v42;
  -[STUIStatusBarVisualProvider_iOS statusBar](v3, "statusBar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "areAnimationsEnabled"))
  {

    goto LABEL_44;
  }
  v18 = -[STUIStatusBarVisualProvider_iOS expanded](v3, "expanded");

  if (v18)
  {
LABEL_44:
    -[STUIStatusBarVisualProvider_Split _disableSystemUpdates](v3);
    goto LABEL_45;
  }
  v41 = v5;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  -[STUIStatusBarVisualProvider_Split orderedDisplayItemPlacementsInRegionWithIdentifier:](v3, "orderedDisplayItemPlacementsInRegionWithIdentifier:", CFSTR("systemUpdates"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
  if (v45)
  {
    v44 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v45; ++i)
      {
        if (*(_QWORD *)v55 != v44)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        -[STUIStatusBarVisualProvider_iOS statusBar](v3, "statusBar");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[STUIStatusBarItem itemIdentifierForDisplayItemIdentifier:](STUIStatusBarItem, "itemIdentifierForDisplayItemIdentifier:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "itemWithIdentifier:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        objc_msgSend(v24, "dependentEntryKeys");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v51;
          v46 = v24;
          while (2)
          {
            for (j = 0; j != v27; ++j)
            {
              if (*(_QWORD *)v51 != v28)
                objc_enumerationMutation(v25);
              v30 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * j);
              objc_msgSend(v48, "valueForKey:", v30);
              v31 = objc_claimAutoreleasedReturnValue();
              if (!v31)
                goto LABEL_39;
              v32 = (void *)v31;
              -[STUIStatusBarVisualProvider_iOS statusBar](v3, "statusBar");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "currentAggregatedData");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "valueForKey:", v30);
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v20, "identifier");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarVPNDisconnectItem, "defaultDisplayIdentifier");
              v37 = (void *)objc_claimAutoreleasedReturnValue();

              v38 = objc_msgSend(v32, "isEnabled");
              if (v36 == v37)
              {
                if ((v38 & 1) != 0 || (objc_msgSend(v35, "isEnabled") & 1) == 0)
                {
LABEL_38:

                  v3 = v47;
LABEL_39:

                  v24 = v46;
                  goto LABEL_40;
                }
              }
              else if (!v38 || objc_msgSend(v35, "isEnabled"))
              {
                goto LABEL_38;
              }

              v3 = v47;
            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
            v24 = v46;
            if (v27)
              continue;
            break;
          }
        }

        objc_msgSend(v20, "setEnabled:", 1);
LABEL_40:

      }
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    }
    while (v45);
  }

  v5 = v41;
LABEL_45:

  return v5;
}

+ (BOOL)showsLargeBatteryChargingAnimation
{
  return 0;
}

- (void)updateDataForService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)STUIStatusBarVisualProvider_Split;
  v4 = a3;
  -[STUIStatusBarVisualProvider_iOS updateDataForService:](&v10, sel_updateDataForService_, v4);
  objc_msgSend(v4, "cellularEntry", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "secondaryCellularEntry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[STUIStatusBarDisplayItemPlacementGroup setEnabled:](self->_lowerWifiGroup, "setEnabled:", objc_msgSend(v6, "type") != 0);
    if (v5)
      goto LABEL_7;
    -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentAggregatedData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellularEntry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v5)
      return;
    -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentAggregatedData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "secondaryCellularEntry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  if (objc_msgSend(v5, "status") == 5
    || (objc_msgSend(v5, "wifiCallingEnabled") & 1) != 0
    || objc_msgSend(v6, "status") == 5)
  {
    v9 = 1;
  }
  else
  {
    v9 = objc_msgSend(v6, "wifiCallingEnabled");
  }
  -[STUIStatusBarDisplayItemPlacement setEnabled:](self->_serviceNamePlacement, "setEnabled:", v9);

}

- (BOOL)_updateLowerRegionsWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  id v9;
  char v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  objc_msgSend(v4, "secondaryCellularEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEnabled"))
      v7 = (unint64_t)(objc_msgSend(v6, "orientation") - 1) < 2;
    else
      v7 = 0;
    -[STUIStatusBarVisualProvider_Split regionIdentifiersForPartWithIdentifier:](self, "regionIdentifiersForPartWithIdentifier:", CFSTR("expandedBottomPartIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __65__STUIStatusBarVisualProvider_Split__updateLowerRegionsWithData___block_invoke;
    v12[3] = &unk_1E8D62A80;
    v9 = v6;
    v15 = v7;
    v13 = v9;
    v14 = &v16;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);

    -[NSLayoutConstraint setActive:](self->_expandedLeadingLowerTopConstraint, "setActive:", v7);
  }
  v10 = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (id)regionIdentifiersForPartWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;

  v4 = a3;
  if (!objc_msgSend(v4, "isEqual:", CFSTR("batteryPartIdentifier")))
  {
    if (objc_msgSend(v4, "isEqual:", CFSTR("clockPartIdentifier")))
    {
      v5 = (void *)MEMORY[0x1E0C99E60];
      v6 = CFSTR("leading");
      goto LABEL_5;
    }
    if (objc_msgSend(v4, "isEqual:", CFSTR("leadingPartIdentifier")))
    {
      v8 = (void *)MEMORY[0x1E0C99E60];
      v21 = CFSTR("expandedLowerLeading");
      v23 = 0;
      v9 = CFSTR("expandedLeading");
      v10 = CFSTR("bottomLeading");
LABEL_8:
      objc_msgSend(v8, "setWithObjects:", CFSTR("leading"), v10, v9, v21, v23, v24);
LABEL_18:
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
    if (objc_msgSend(v4, "isEqual:", CFSTR("trailingPartIdentifier")))
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("trailing"), CFSTR("systemUpdates"), CFSTR("controlCenter"), CFSTR("expandedTrailing"), CFSTR("expandedLowerTrailing"), 0);
      goto LABEL_18;
    }
    if (objc_msgSend(v4, "isEqual:", CFSTR("normalPartIdentifier")))
    {
      v8 = (void *)MEMORY[0x1E0C99E60];
      v23 = CFSTR("bottomLeading");
      v24 = 0;
      v21 = CFSTR("controlCenter");
      v9 = CFSTR("systemUpdates");
      v10 = CFSTR("trailing");
      goto LABEL_8;
    }
    if (objc_msgSend(v4, "isEqual:", CFSTR("expandedPartIdentifier")))
      goto LABEL_14;
    if (!objc_msgSend(v4, "isEqual:", CFSTR("expandedPartTopIdentifier")))
    {
      if (objc_msgSend(v4, "isEqual:", CFSTR("expandedBottomPartIdentifier")))
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("expandedLowerLeading"), CFSTR("expandedLowerTrailing"), 0, v20, v22, v24);
        goto LABEL_18;
      }
      if (!objc_msgSend(v4, "isEqual:", CFSTR("visibleExpandedPartIdentifier")))
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "set");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
      -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "currentData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "secondaryCellularEntry");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v16, "isEnabled") & 1) != 0)
      {
        -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "orientation") - 1;

        if (v18 <= 1)
        {
LABEL_14:
          v11 = (void *)MEMORY[0x1E0C99E60];
          v20 = CFSTR("expandedLowerTrailing");
          v22 = 0;
          v19 = CFSTR("expandedLowerLeading");
LABEL_17:
          objc_msgSend(v11, "setWithObjects:", CFSTR("expandedLeading"), CFSTR("expandedTrailing"), v19, v20, v22, v24);
          goto LABEL_18;
        }
      }
      else
      {

      }
    }
    v11 = (void *)MEMORY[0x1E0C99E60];
    v19 = 0;
    goto LABEL_17;
  }
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = CFSTR("trailing");
LABEL_5:
  objc_msgSend(v5, "setWithObject:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_19:
  v12 = (void *)v7;

  return v12;
}

- (BOOL)canFixupDisplayItemAttributes
{
  STUIStatusBarDisplayItemPlacement *batteryChargingPlacement;

  batteryChargingPlacement = self->_batteryChargingPlacement;
  if (batteryChargingPlacement)
    LOBYTE(batteryChargingPlacement) = !-[STUIStatusBarDisplayItemPlacement isEnabled](batteryChargingPlacement, "isEnabled");
  return (char)batteryChargingPlacement;
}

+ (CGSize)intrinsicContentSizeForOrientation:(int64_t)a3
{
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  if ((unint64_t)(a3 - 1) >= 2)
  {
    v3 = *MEMORY[0x1E0C9D820];
    v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___STUIStatusBarVisualProvider_Split;
    objc_msgSendSuper2(&v5, sel_intrinsicContentSizeForOrientation_);
  }
  result.height = v4;
  result.width = v3;
  return result;
}

+ (BOOL)scalesWithScreenNativeScale
{
  return 1;
}

- (UILayoutGuide)cutoutLayoutGuide
{
  return self->_cutoutLayoutGuide;
}

- (UILayoutGuide)mainRegionsLayoutGuide
{
  return self->_mainRegionsLayoutGuide;
}

- (UIFont)systemUpdateFont
{
  int IsBoldTextEnabled;
  void *v3;
  BOOL v4;
  void *v5;
  double v6;
  uint64_t v7;
  void *v8;

  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v3 = (void *)unk_1EFC01D00;
  if (unk_1EFC01D00)
    v4 = byte_1EFC01CCD == IsBoldTextEnabled;
  else
    v4 = 0;
  if (!v4)
  {
    byte_1EFC01CCD = IsBoldTextEnabled;
    v5 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend((id)objc_opt_class(), "baseFontSize");
    objc_msgSend(v5, "systemFontOfSize:weight:", v6 + 2.0, *MEMORY[0x1E0DC1438]);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)unk_1EFC01D00;
    unk_1EFC01D00 = v7;

    v3 = (void *)unk_1EFC01D00;
  }
  return (UIFont *)v3;
}

- (double)bottomLeadingSpace
{
  return 12.0;
}

- (_UILumaTrackingBackdropView)trailingBackgroundLumaView
{
  return self->_trailingBackgroundLumaView;
}

- (_UILumaTrackingBackdropView)leadingBackgroundLumaView
{
  return self->_leadingBackgroundLumaView;
}

- (void)setTrailingBackgroundLumaView:(id)a3
{
  objc_storeStrong((id *)&self->_trailingBackgroundLumaView, a3);
}

- (void)setMainRegionsLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_mainRegionsLayoutGuide, a3);
}

- (void)setLeadingBackgroundLumaView:(id)a3
{
  objc_storeStrong((id *)&self->_leadingBackgroundLumaView, a3);
}

- (void)setCutoutLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_cutoutLayoutGuide, a3);
}

- (double)grabberHeight
{
  return 2.33333333;
}

- (void)_setupExpandedRegionsInContainerView:(id)a3 sensorHeight:(double)a4 constraints:(id *)a5 regions:(id *)a6
{
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  STUIStatusBarRegion *v22;
  STUIStatusBarRegionAxesLayout *v23;
  STUIStatusBarRegionAxisStackingLayout *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  STUIStatusBarRegion *v39;
  STUIStatusBarRegionAxesLayout *v40;
  STUIStatusBarRegionAxisStackingLayout *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  void *v62;
  double v63;
  double v64;
  STUIStatusBarRegion *v65;
  STUIStatusBarRegionAxesLayout *v66;
  STUIStatusBarRegionAxisStackingLayout *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  NSLayoutConstraint *v73;
  NSLayoutConstraint *expandedLeadingLowerTopConstraint;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  STUIStatusBarRegion *v83;
  STUIStatusBarRegionAxesLayout *v84;
  STUIStatusBarRegionAxisStackingLayout *v85;
  void *v86;
  id v87;
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
  NSLayoutConstraint *v102;
  NSLayoutConstraint *expandedTrailingBottomConstraint;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  double v112;
  void *v113;
  void *v114;
  void *v115;
  void *v117;
  id v118;
  id v119;

  v9 = *a5;
  v118 = *a6;
  v119 = v9;
  v10 = a3;
  -[STUIStatusBarVisualProvider_iOS expandedItemSpacing](self, "expandedItemSpacing");
  v12 = v11;
  -[STUIStatusBarVisualProvider_Split baselineBottomInset](self, "baselineBottomInset");
  v14 = v13;
  -[STUIStatusBarVisualProvider_Split expandedEdgeInsets](self, "expandedEdgeInsets");
  v16 = v15;
  v18 = v17;
  -[STUIStatusBarVisualProvider_Split expandedFont](self, "expandedFont");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "capHeight");
  v21 = v20;

  v22 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("expandedLeading"));
  v23 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v24 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  -[STUIStatusBarRegionAxisStackingLayout setAlignment:](v24, "setAlignment:", 3);
  -[STUIStatusBarRegionAxisStackingLayout setInterspace:](v24, "setInterspace:", v12);
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v23, "setHorizontalLayout:", v24);

  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v23, "setVerticalLayout:", v25);

  -[STUIStatusBarRegion setLayout:](v22, "setLayout:", v23);
  v26 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[STUIStatusBarRegion setContentView:](v22, "setContentView:", v26);

  -[STUIStatusBarRegion setOffsetable:](v22, "setOffsetable:", 1);
  -[STUIStatusBarRegion disableWithToken:](v22, "disableWithToken:", 10);
  -[STUIStatusBarRegion layoutItem](v22, "layoutItem");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, v16);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "addObject:", v30);

  objc_msgSend(v27, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = a4 - v14;
  objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v35) = 1147207680;
  objc_msgSend(v34, "_ui_constraintWithPriority:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "addObject:", v36);

  v117 = v27;
  objc_msgSend(v27, "heightAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToConstant:", v21);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "addObject:", v38);

  objc_msgSend(v10, "_ui_addSubLayoutItem:", v27);
  objc_msgSend(v118, "addObject:", v22);

  v39 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("expandedTrailing"));
  v40 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v41 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  -[STUIStatusBarRegionAxisStackingLayout setAlignment:](v41, "setAlignment:", 4);
  -[STUIStatusBarRegionAxisStackingLayout setInterspace:](v41, "setInterspace:", v12);
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v40, "setHorizontalLayout:", v41);

  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 6);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v40, "setVerticalLayout:", v42);

  -[STUIStatusBarRegion setLayout:](v39, "setLayout:", v40);
  v43 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[STUIStatusBarRegion setContentView:](v39, "setContentView:", v43);

  -[STUIStatusBarRegion setOffsetable:](v39, "setOffsetable:", 1);
  -[STUIStatusBarRegion disableWithToken:](v39, "disableWithToken:", 10);
  -[STUIStatusBarRegion layoutItem](v39, "layoutItem");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "trailingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:constant:", v46, -v18);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "addObject:", v47);

  objc_msgSend(v44, "bottomAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:constant:", v49, v33);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v51) = 1147207680;
  objc_msgSend(v50, "_ui_constraintWithPriority:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "addObject:", v52);

  objc_msgSend(v44, "heightAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToConstant:", v21);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "addObject:", v54);

  objc_msgSend(v44, "leadingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "trailingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:constant:", v56, v12);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "addObject:", v57);

  objc_msgSend(v44, "widthAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "widthAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v61) = 1131741184;
  objc_msgSend(v60, "_ui_constraintWithPriority:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "addObject:", v62);

  objc_msgSend(v10, "_ui_addSubLayoutItem:", v44);
  objc_msgSend(v118, "addObject:", v39);

  -[STUIStatusBarVisualProvider_Split lowerExpandedBaselineOffset](self, "lowerExpandedBaselineOffset");
  v64 = v63;
  v65 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("expandedLowerLeading"));
  v66 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v67 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  -[STUIStatusBarRegionAxisStackingLayout setAlignment:](v67, "setAlignment:", 3);
  -[STUIStatusBarRegionAxisStackingLayout setInterspace:](v67, "setInterspace:", v12);
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v66, "setHorizontalLayout:", v67);

  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 6);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v66, "setVerticalLayout:", v68);

  -[STUIStatusBarRegion setLayout:](v65, "setLayout:", v66);
  v69 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[STUIStatusBarRegion setContentView:](v65, "setContentView:", v69);

  -[STUIStatusBarRegion setOffsetable:](v65, "setOffsetable:", 1);
  -[STUIStatusBarRegion disableWithToken:](v65, "disableWithToken:", 10);
  -[STUIStatusBarRegion layoutItem](v65, "layoutItem");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "bottomAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToAnchor:constant:", v72, v33);
  v73 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  expandedLeadingLowerTopConstraint = self->_expandedLeadingLowerTopConstraint;
  self->_expandedLeadingLowerTopConstraint = v73;

  objc_msgSend(v70, "leadingAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintEqualToAnchor:constant:", v76, v16);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "addObject:", v77);

  objc_msgSend(v70, "bottomAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "bottomAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "constraintEqualToAnchor:constant:", v79, v64);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "addObject:", v80);

  objc_msgSend(v70, "heightAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "constraintEqualToConstant:", v21);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "addObject:", v82);

  objc_msgSend(v119, "addObject:", self->_expandedLeadingLowerTopConstraint);
  v115 = v10;
  objc_msgSend(v10, "_ui_addSubLayoutItem:", v70);

  objc_msgSend(v118, "addObject:", v65);
  v83 = -[STUIStatusBarRegion initWithIdentifier:]([STUIStatusBarRegion alloc], "initWithIdentifier:", CFSTR("expandedLowerTrailing"));
  v84 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v85 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  -[STUIStatusBarRegionAxisStackingLayout setAlignment:](v85, "setAlignment:", 4);
  -[STUIStatusBarRegionAxisStackingLayout setInterspace:](v85, "setInterspace:", v12);
  -[STUIStatusBarRegionAxesLayout setHorizontalLayout:](v84, "setHorizontalLayout:", v85);

  +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:](STUIStatusBarRegionAxisAligningLayout, "aligningLayoutWithAlignment:", 6);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegionAxesLayout setVerticalLayout:](v84, "setVerticalLayout:", v86);

  -[STUIStatusBarRegion setLayout:](v83, "setLayout:", v84);
  v87 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[STUIStatusBarRegion setContentView:](v83, "setContentView:", v87);

  -[STUIStatusBarRegion setOffsetable:](v83, "setOffsetable:", 1);
  -[STUIStatusBarRegion disableWithToken:](v83, "disableWithToken:", 10);
  -[STUIStatusBarRegion layoutItem](v83, "layoutItem");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "trailingAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "constraintEqualToAnchor:constant:", v90, -v18);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "addObject:", v91);

  -[STUIStatusBarRegion layoutItem](v83, "layoutItem");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "heightAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "constraintEqualToConstant:", v21);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "addObject:", v94);

  -[STUIStatusBarRegion layoutItem](v83, "layoutItem");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "bottomAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "bottomAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "constraintEqualToAnchor:", v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "addObject:", v98);

  -[STUIStatusBarRegion layoutItem](v83, "layoutItem");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "bottomAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "bottomAnchor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "constraintEqualToAnchor:constant:", v101, v64);
  v102 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  expandedTrailingBottomConstraint = self->_expandedTrailingBottomConstraint;
  self->_expandedTrailingBottomConstraint = v102;

  objc_msgSend(v119, "addObject:", self->_expandedTrailingBottomConstraint);
  -[STUIStatusBarRegion layoutItem](v83, "layoutItem");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "leadingAnchor");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "trailingAnchor");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "constraintEqualToAnchor:constant:", v106, v12);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "addObject:", v107);

  -[STUIStatusBarRegion layoutItem](v83, "layoutItem");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "widthAnchor");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "widthAnchor");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "constraintEqualToAnchor:", v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v112) = 1131741184;
  objc_msgSend(v111, "_ui_constraintWithPriority:", v112);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "addObject:", v113);

  -[STUIStatusBarRegion layoutItem](v83, "layoutItem");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "_ui_addSubLayoutItem:", v114);

  objc_msgSend(v118, "addObject:", v83);
}

- (double)lowerExpandedBaselineOffset
{
  return 25.0;
}

- (UIFont)expandedFont
{
  int IsBoldTextEnabled;
  void *v3;
  BOOL v4;
  void *v5;
  uint64_t v6;
  void *v7;

  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v3 = (void *)unk_1EFC01CE0;
  if (unk_1EFC01CE0)
    v4 = byte_1EFC01CC9 == IsBoldTextEnabled;
  else
    v4 = 0;
  if (!v4)
  {
    byte_1EFC01CC9 = IsBoldTextEnabled;
    v5 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend((id)objc_opt_class(), "expandedFontSize");
    objc_msgSend(v5, "systemFontOfSize:weight:");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)unk_1EFC01CE0;
    unk_1EFC01CE0 = v6;

    v3 = (void *)unk_1EFC01CE0;
  }
  return (UIFont *)v3;
}

- (double)baselineBottomInset
{
  return 1.66666667;
}

- (id)_orderedDisplayItemPlacements
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void **v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  EnumDescriptor **v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  EnumDescriptor *v48;
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
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
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
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
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
  int v103;
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
  id v131;
  void *v132;
  void *v133;
  uint64_t v134;
  void *v135;
  const __CFString *v136;
  const __CFString *v137;
  const __CFString *v138;
  _QWORD v139[4];
  const __CFString *v140;
  const __CFString *v141;
  const __CFString *v142;
  const __CFString *v143;
  _QWORD v144[5];
  _QWORD v145[8];
  _QWORD v146[8];
  const __CFString *v147;
  _QWORD v148[2];
  _QWORD v149[2];
  _QWORD v150[6];
  _QWORD v151[11];
  void *v152;
  void *v153;
  uint64_t v154;
  _QWORD v155[3];
  _QWORD v156[3];

  v156[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorSatelliteItem, "defaultDisplayIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v2, 1101);
  v129 = (void *)objc_claimAutoreleasedReturnValue();

  +[STUIStatusBarCellularItem signalStrengthDisplayIdentifier](STUIStatusBarCellularCondensedItem, "signalStrengthDisplayIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v3, 1104);
  v4 = objc_claimAutoreleasedReturnValue();

  +[STUIStatusBarCellularCondensedItem dualSignalStrengthDisplayIdentifier](STUIStatusBarCellularCondensedItem, "dualSignalStrengthDisplayIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v5, 1105);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v156[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v156, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "excludingPlacements:", v7);
  v8 = objc_claimAutoreleasedReturnValue();

  +[STUIStatusBarCellularItem sosDisplayIdentifier](STUIStatusBarCellularCondensedItem, "sosDisplayIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v9, 1100);
  v10 = objc_claimAutoreleasedReturnValue();

  +[STUIStatusBarCellularCondensedItem sosSignalStrengthDisplayIdentifier](STUIStatusBarCellularCondensedItem, "sosSignalStrengthDisplayIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v11, 1109);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v155[0] = v4;
  v155[1] = v8;
  v155[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v155, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "excludingPlacements:", v13);
  v14 = objc_claimAutoreleasedReturnValue();

  +[STUIStatusBarCellularItem warningDisplayIdentifier](STUIStatusBarCellularCondensedItem, "warningDisplayIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v15, 1106);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v154 = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v154, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "excludingPlacements:", v17);
  v18 = objc_claimAutoreleasedReturnValue();

  if (-[STUIStatusBarVisualProvider_Split supportsAnimatedCellularNetworkType](self, "supportsAnimatedCellularNetworkType"))
  {
    +[STUIStatusBarCellularCondensedItem animatedTypeDisplayIdentifier](STUIStatusBarCellularCondensedItem, "animatedTypeDisplayIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v19, 1102);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v129;
    v153 = v129;
    v22 = (void *)MEMORY[0x1E0C99D20];
    v23 = &v153;
  }
  else
  {
    +[STUIStatusBarCellularItem typeDisplayIdentifier](STUIStatusBarCellularCondensedItem, "typeDisplayIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v19, 1102);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v129;
    v152 = v129;
    v22 = (void *)MEMORY[0x1E0C99D20];
    v23 = &v152;
  }
  objc_msgSend(v22, "arrayWithObjects:count:", v23, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "excludingPlacements:", v24);
  v25 = objc_claimAutoreleasedReturnValue();

  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorAirplaneModeItem, "defaultDisplayIdentifier");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v127, 1200);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v150[0] = v4;
  v150[1] = v8;
  v150[2] = v14;
  v150[3] = v18;
  v150[4] = v10;
  v150[5] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v150, 6);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "excludingPlacements:", v117);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v151[0] = v115;
  v151[1] = v4;
  v125 = (void *)v8;
  v126 = (void *)v4;
  v151[2] = v8;
  v151[3] = v14;
  v122 = (void *)v18;
  v123 = (void *)v14;
  v151[4] = v18;
  v151[5] = v10;
  v124 = (void *)v10;
  +[STUIStatusBarWifiItem signalStrengthDisplayIdentifier](STUIStatusBarWifiItem, "signalStrengthDisplayIdentifier");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v113, 1107);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v149[0] = v25;
  v149[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v149, 2);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "excludingPlacements:", v109);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v151[6] = v26;
  v151[7] = v25;
  +[STUIStatusBarWifiItem iconDisplayIdentifier](STUIStatusBarWifiItem, "iconDisplayIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v27, 1103);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = (void *)v25;
  v148[0] = v25;
  v148[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v148, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "excludingPlacements:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v151[8] = v30;
  v151[9] = v21;
  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorLiquidDetectionItem, "defaultDisplayIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v31, 1108);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v151[10] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v151, 11);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "addObjectsFromArray:", v33);

  v34 = &off_1E8D60000;
  if (objc_msgSend((id)objc_opt_class(), "showsLargeBatteryChargingAnimation"))
  {
    +[STUIStatusBarBatteryItem iconDisplayIdentifier](STUIStatusBarBatteryItem, "iconDisplayIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v35, 1111);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "addObject:", v36);

    +[STUIStatusBarBatteryItem chargingDisplayIdentifier](STUIStatusBarBatteryItem, "chargingDisplayIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v37, 1300);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "subarrayWithRange:", 0, objc_msgSend(v132, "count") - 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "excludingPlacements:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "disabledPlacement");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarVisualProvider_Split setBatteryChargingPlacement:](self, "setBatteryChargingPlacement:", v41);

    v34 = &off_1E8D60000;
    -[STUIStatusBarVisualProvider_Split batteryChargingPlacement](self, "batteryChargingPlacement");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "addObject:", v42);
  }
  else
  {
    +[STUIStatusBarBatteryItem staticIconDisplayIdentifier](STUIStatusBarBatteryItem, "staticIconDisplayIdentifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v42, 1111);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "addObject:", v43);

  }
  v44 = objc_opt_class();
  +[STUIStatusBarDisplayItemPlacementNetworkGroup groupWithHighPriority:lowPriority:cellularItemClass:wifiItemClass:includeCellularName:](STUIStatusBarDisplayItemPlacementNetworkGroup, "groupWithHighPriority:lowPriority:cellularItemClass:wifiItemClass:includeCellularName:", 2500, 2200, v44, objc_opt_class(), 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "wifiGroup");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Split setLowerWifiGroup:](self, "setLowerWifiGroup:", v46);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v34[369];
  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorAirplaneModeItem, "defaultDisplayIdentifier");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[EnumDescriptor placementWithIdentifier:priority:](v48, "placementWithIdentifier:priority:", v49, 5000);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_iOS expandedCellularPlacementsAffectedByAirplaneMode](self, "expandedCellularPlacementsAffectedByAirplaneMode");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "cellularGroup");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "placementsAffectedByAirplaneMode");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "arrayByAddingObjectsFromArray:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "excludingPlacements:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "addObject:", v55);

  v120 = v45;
  objc_msgSend(v45, "placements");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = v47;
  objc_msgSend(v47, "addObjectsFromArray:", v56);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorLocationItem, "defaultDisplayIdentifier");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v58, 2450);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "addObject:", v59);

  -[STUIStatusBarVisualProvider_iOS bluetoothPaddingInset](self, "bluetoothPaddingInset");
  +[STUIStatusBarDisplayItemPlacementIndicatorsGroup groupWithHighPriority:lowPriority:bluetoothPaddingInset:](STUIStatusBarDisplayItemPlacementIndicatorsGroup, "groupWithHighPriority:lowPriority:bluetoothPaddingInset:", 2400, 200);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "placements");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "addObjectsFromArray:", v61);

  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarControlCenterItem, "defaultDisplayIdentifier");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v62, 1996);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v147 = CFSTR("trailing");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v147, 1);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "excludingAllPlacementsInRegions:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "disabledPlacement");
  v66 = objc_claimAutoreleasedReturnValue();

  v101 = (void *)MEMORY[0x1E0C99E08];
  v146[0] = v132;
  v145[0] = CFSTR("trailing");
  v145[1] = CFSTR("systemUpdates");
  +[STUIStatusBarSettingsDomain rootSettings](STUIStatusBarSettingsDomain, "rootSettings");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "visualProviderSettings");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v62) = objc_msgSend(v112, "showVPNDisconnect");
  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarVPNItem, "defaultDisplayIdentifier");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = (int)v62;
  v108 = v67;
  if ((_DWORD)v62)
  {
    v143 = CFSTR("trailing");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v143, 1);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "excludingAllPlacementsInRegions:");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "disabledPlacement");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v144[0] = v105;
    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarVPNDisconnectItem, "defaultDisplayIdentifier");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v142 = CFSTR("trailing");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v142, 1);
    v102 = v68;
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "excludingAllPlacementsInRegions:");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "disabledPlacement");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v144[1] = v98;
    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarThermalItem, "defaultDisplayIdentifier");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v141 = CFSTR("trailing");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v141, 1);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = v69;
    objc_msgSend(v69, "excludingAllPlacementsInRegions:", v95);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "disabledPlacement");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v144[2] = v93;
    +[STUIStatusBarActivityItem_Split syncStartDisplayIdentifier](STUIStatusBarActivityItem_Split, "syncStartDisplayIdentifier");
    v90 = objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v140 = CFSTR("trailing");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v140, 1);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = v70;
    objc_msgSend(v70, "excludingAllPlacementsInRegions:", v88);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "disabledPlacement");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v144[3] = v86;
    v144[4] = v66;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v144, 5);
    v71 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v138 = CFSTR("trailing");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v138, 1);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "excludingAllPlacementsInRegions:");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "disabledPlacement");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v139[0] = v105;
    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarThermalItem, "defaultDisplayIdentifier");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = CFSTR("trailing");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v137, 1);
    v102 = v72;
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "excludingAllPlacementsInRegions:");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "disabledPlacement");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v139[1] = v98;
    +[STUIStatusBarActivityItem_Split syncStartDisplayIdentifier](STUIStatusBarActivityItem_Split, "syncStartDisplayIdentifier");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v136 = CFSTR("trailing");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v136, 1);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = v73;
    objc_msgSend(v73, "excludingAllPlacementsInRegions:", v95);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "disabledPlacement");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v139[2] = v93;
    v139[3] = v66;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v139, 4);
    v71 = objc_claimAutoreleasedReturnValue();
  }
  v92 = (void *)v71;
  v146[1] = v71;
  v145[2] = CFSTR("controlCenter");
  +[STUIStatusBarControlCenterItem grabberIdentifier](STUIStatusBarControlCenterItem, "grabberIdentifier");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v91, 1995);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = (void *)v66;
  v134 = v66;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v134, 1);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "requiringAllPlacements:", v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = v76;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v135, 1);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v146[2] = v77;
  v145[3] = CFSTR("expandedLeading");
  -[STUIStatusBarVisualProvider_iOS expandedLeadingPlacements](self, "expandedLeadingPlacements");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v146[3] = v78;
  v146[4] = v128;
  v145[4] = CFSTR("expandedLowerLeading");
  v145[5] = CFSTR("expandedLowerTrailing");
  v118 = v57;
  v146[5] = v57;
  v145[6] = CFSTR("expandedTrailing");
  -[STUIStatusBarVisualProvider_iOS expandedTrailingPlacements](self, "expandedTrailingPlacements");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v146[6] = v79;
  v145[7] = CFSTR("bottomLeading");
  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarNavigationItem, "defaultDisplayIdentifier");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v80, 40);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = v81;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v133, 1);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v146[7] = v82;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v146, v145, 8);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "dictionaryWithDictionary:", v83);
  v131 = (id)objc_claimAutoreleasedReturnValue();

  v84 = v92;
  if (v103)
  {

    v84 = (void *)v90;
  }

  return v131;
}

- (void)_disableSystemUpdates
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v8 = 0u;
    v9 = 0u;
    v6 = 0u;
    v7 = 0u;
    objc_msgSend(a1, "orderedDisplayItemPlacementsInRegionWithIdentifier:", CFSTR("systemUpdates"), 0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    if (v2)
    {
      v3 = v2;
      v4 = *(_QWORD *)v7;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v7 != v4)
            objc_enumerationMutation(v1);
          objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "setEnabled:", 0);
        }
        while (v3 != v5);
        v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
      }
      while (v3);
    }

  }
}

- (STUIStatusBarDisplayItemPlacement)serviceNamePlacement
{
  return self->_serviceNamePlacement;
}

- (STUIStatusBarDisplayItemPlacement)dualServiceNamePlacement
{
  return self->_dualServiceNamePlacement;
}

- (BOOL)supportsAnimatedCellularNetworkType
{
  return 1;
}

- (void)setServiceNamePlacement:(id)a3
{
  objc_storeStrong((id *)&self->_serviceNamePlacement, a3);
}

- (void)setLowerWifiGroup:(id)a3
{
  objc_storeStrong((id *)&self->_lowerWifiGroup, a3);
}

- (void)setDualServiceNamePlacement:(id)a3
{
  objc_storeStrong((id *)&self->_dualServiceNamePlacement, a3);
}

- (id)regionIdentifiersForBackgroundLumaView:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  v4 = a3;
  -[STUIStatusBarVisualProvider_Split leadingBackgroundLumaView](self, "leadingBackgroundLumaView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("leading"), CFSTR("bottomLeading"), 0, v10);
LABEL_6:
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[STUIStatusBarVisualProvider_Split trailingBackgroundLumaView](self, "trailingBackgroundLumaView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("trailing"), CFSTR("systemUpdates"), CFSTR("controlCenter"), 0);
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v8 = (void *)v7;

  return v8;
}

- (BOOL)hasCustomAnimationForDisplayItemWithIdentifier:(id)a3 removal:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  char v7;
  id v8;
  id v9;
  objc_super v11;

  v4 = a4;
  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STUIStatusBarVisualProvider_Split;
  if (-[STUIStatusBarVisualProvider_iOS hasCustomAnimationForDisplayItemWithIdentifier:removal:](&v11, sel_hasCustomAnimationForDisplayItemWithIdentifier_removal_, v6, v4))
  {
    v7 = 1;
  }
  else
  {
    +[STUIStatusBarBatteryItem chargingDisplayIdentifier](STUIStatusBarBatteryItem, "chargingDisplayIdentifier");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8 == v6)
    {
      v7 = 1;
    }
    else
    {
      +[STUIStatusBarControlCenterItem grabberIdentifier](STUIStatusBarControlCenterItem, "grabberIdentifier");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (v9 == v6)
        v7 = 1;
      else
        v7 = -[STUIStatusBarVisualProvider_Split _shouldShowSystemUpdateForDisplayItemWithIdentifier:](self, v6);

    }
  }

  return v7;
}

- (uint64_t)_shouldShowSystemUpdateForDisplayItemWithIdentifier:(void *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1 && (objc_msgSend(a1, "expanded") & 1) == 0)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    objc_msgSend(a1, "orderedDisplayItemPlacementsInRegionWithIdentifier:", CFSTR("systemUpdates"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v6 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "identifier");
          v8 = (id)objc_claimAutoreleasedReturnValue();

          if (v8 == v3)
          {
            v4 = 1;
            goto LABEL_14;
          }
        }
        v4 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[STUIStatusBarVisualProvider_Split _resumeSystemUpdateData](self);
  v3.receiver = self;
  v3.super_class = (Class)STUIStatusBarVisualProvider_Split;
  -[STUIStatusBarVisualProvider_Split dealloc](&v3, sel_dealloc);
}

- (void)_resumeSystemUpdateData
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (a1)
  {
    objc_msgSend(a1, "delayedSystemUpdateDataToken");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(a1, "statusBar");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "dataAggregator");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "delayedSystemUpdateDataToken");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "endDelayingUpdates:", v5);

      objc_msgSend(a1, "setDelayedSystemUpdateDataToken:", 0);
    }
  }
}

- (id)delayedSystemUpdateDataToken
{
  return self->_delayedSystemUpdateDataToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingBackgroundLumaView, 0);
  objc_storeStrong((id *)&self->_leadingBackgroundLumaView, 0);
  objc_storeStrong(&self->_delayedSystemUpdateDataToken, 0);
  objc_storeStrong((id *)&self->_airplaneModeIgnoreChangesTimer, 0);
  objc_storeStrong((id *)&self->_batteryExpansionTimer, 0);
  objc_storeStrong((id *)&self->_systemUpdatesTimer, 0);
  objc_storeStrong((id *)&self->_expandedTrailingBottomConstraint, 0);
  objc_storeStrong((id *)&self->_expandedLeadingLowerTopConstraint, 0);
  objc_storeStrong((id *)&self->_mainRegionsLayoutGuide, 0);
  objc_storeStrong((id *)&self->_cutoutLayoutGuide, 0);
  objc_storeStrong((id *)&self->_batteryChargingPlacement, 0);
  objc_storeStrong((id *)&self->_lowerWifiGroup, 0);
  objc_storeStrong((id *)&self->_dualServiceNamePlacement, 0);
  objc_storeStrong((id *)&self->_serviceNamePlacement, 0);
  objc_storeStrong((id *)&self->_orderedDisplayItemPlacements, 0);
}

+ (Class)visualProviderSubclassForScreen:(id)a3 visualProviderInfo:(id)a4
{
  id v5;
  id v6;
  CGFloat Width;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  CGFloat v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[10];
  CGRect v28;

  v27[9] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "_nativeDisplayBounds");
  Width = CGRectGetWidth(v28);
  objc_msgSend(v5, "_exclusionArea");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rect");
  v10 = v9;
  v12 = v11;
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  v27[2] = objc_opt_class();
  v27[3] = objc_opt_class();
  v27[4] = objc_opt_class();
  v27[5] = objc_opt_class();
  v27[6] = objc_opt_class();
  v27[7] = objc_opt_class();
  v27[8] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v26 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __88__STUIStatusBarVisualProvider_Split_visualProviderSubclassForScreen_visualProviderInfo___block_invoke;
  v17[3] = &unk_1E8D64058;
  v20 = Width;
  v14 = v5;
  v21 = v10;
  v22 = v12;
  v18 = v14;
  v19 = &v23;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v17);
  v15 = (id)v24[3];

  _Block_object_dispose(&v23, 8);
  return (Class)v15;
}

+ (double)height
{
  return 47.0;
}

- (double)itemSpacing
{
  return 4.33333333;
}

+ (double)baseFontSize
{
  return 15.0;
}

+ (double)expandedFontSize
{
  double v2;

  objc_msgSend(a1, "baseFontSize");
  return v2 + 2.0;
}

+ (double)LTEAPlusFontSize
{
  return 13.0;
}

+ (BOOL)shrinksSingleCharacterTypes
{
  return 0;
}

- (CGSize)smallPillSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 20.0;
  v3 = 20.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIFont)voiceControlFont
{
  int IsBoldTextEnabled;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;

  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v3 = (void *)unk_1EFC01CF8;
  if (unk_1EFC01CF8)
    v4 = byte_1EFC01CCC == IsBoldTextEnabled;
  else
    v4 = 0;
  if (!v4)
  {
    byte_1EFC01CCC = IsBoldTextEnabled;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 13.0, *MEMORY[0x1E0DC1438]);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)unk_1EFC01CF8;
    unk_1EFC01CF8 = v5;

    v3 = (void *)unk_1EFC01CF8;
  }
  return (UIFont *)v3;
}

- (double)bottomLeadingTopOffset
{
  return 7.33333333;
}

- (double)normalIconScale
{
  return 1.12;
}

- (double)expandedIconScale
{
  return 1.2992;
}

- (int64_t)expandedIconSize
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  int64_t v8;

  -[STUIStatusBarVisualProvider_Split expandedIconScale](self, "expandedIconScale");
  v4 = v3;
  -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_effectiveTargetScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_scale");
  if (v7 <= 2.5)
  {
    if (v4 == 1.07)
    {
      v8 = 5;
    }
    else if (v4 == 1.16)
    {
      v8 = 9;
    }
    else if (v4 == 1.2412)
    {
      v8 = 11;
    }
    else
    {
      v8 = 1;
    }
  }
  else if (v4 == 1.08)
  {
    v8 = 6;
  }
  else if (v4 == 1.06)
  {
    v8 = 4;
  }
  else if (v4 == 1.12)
  {
    v8 = 7;
  }
  else if (v4 == 1.26)
  {
    v8 = 8;
  }
  else if (v4 == 1.16)
  {
    v8 = 10;
  }
  else if (v4 == 1.2412)
  {
    v8 = 12;
  }
  else if (v4 == 1.2992)
  {
    v8 = 13;
  }
  else
  {
    v8 = 2;
  }

  return v8;
}

- (NSDirectionalEdgeInsets)expandedEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  v2 = *MEMORY[0x1E0DC3298];
  v3 = *(double *)(MEMORY[0x1E0DC3298] + 8);
  v4 = *(double *)(MEMORY[0x1E0DC3298] + 16);
  v5 = *(double *)(MEMORY[0x1E0DC3298] + 24);
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

+ (double)expandedEdgeInset
{
  return 7.0;
}

- (double)cornerRadius
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[STUIStatusBarVisualProvider_iOS statusBar](self, "statusBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_effectiveTargetScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_displayCornerRadius");
  v5 = v4;
  objc_msgSend(v3, "_nativeScale");
  v7 = v5 * v6;
  objc_msgSend(v3, "_scale");
  v9 = v7 / v8;

  return v9;
}

- (double)condensedPointSizeForCellularType:(int64_t)a3 defaultPointSize:(double)a4 baselineOffset:(double *)a5
{
  int v6;
  double v7;
  double result;

  if ((unint64_t)(a3 - 8) < 2)
  {
    *a5 = 1.0;
    objc_msgSend((id)objc_opt_class(), "LTEAPlusFontSize");
  }
  else if ((unint64_t)(a3 - 2) > 1)
  {
    *a5 = 0.666666667;
    return a4 + -1.0;
  }
  else
  {
    v6 = objc_msgSend((id)objc_opt_class(), "shrinksSingleCharacterTypes");
    v7 = 0.0;
    if (v6)
      v7 = 1.0;
    return a4 - v7;
  }
  return result;
}

- (id)stringForCellularType:(int64_t)a3 condensed:(BOOL)a4
{
  const __CFString *v4;

  v4 = CFSTR("􀛳");
  if (a3 != 9)
    v4 = 0;
  if (a3 == 8)
    v4 = CFSTR("􀛲");
  if (a4)
    return (id)v4;
  else
    return 0;
}

- (id)condensedFontForCellularType:(int64_t)a3 defaultFont:(id)a4 baselineOffset:(double *)a5
{
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;

  v8 = a4;
  objc_msgSend(v8, "pointSize");
  v10 = v9;
  -[STUIStatusBarVisualProvider_Split condensedPointSizeForCellularType:defaultPointSize:baselineOffset:](self, "condensedPointSizeForCellularType:defaultPointSize:baselineOffset:", a3, a5);
  v12 = v11;
  if ((unint64_t)a3 <= 0xD && ((1 << a3) & 0x38C0) != 0)
  {
    objc_msgSend(v8, "fontDescriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fontDescriptorWithSymbolicTraits:", 64);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 == v10)
    {
      v15 = (void *)MEMORY[0x1E0DC1350];
      v17 = 0.0;
      v16 = v14;
      goto LABEL_6;
    }
  }
  else
  {
    v18 = v8;
    if (v11 == v10)
      goto LABEL_7;
    objc_msgSend(v8, "fontDescriptor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)MEMORY[0x1E0DC1350];
  v16 = v14;
  v17 = v12;
LABEL_6:
  objc_msgSend(v15, "fontWithDescriptor:size:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v18;
}

- (double)animatedTypeDisplayItemSpacingFactorForCellularType:(int64_t)a3
{
  double result;

  result = 1.0;
  if ((unint64_t)(a3 - 6) <= 7)
    return dbl_1CFEC0350[a3 - 6];
  return result;
}

- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4
{
  id v5;
  id v6;
  NSTimer *batteryExpansionTimer;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  id v26;
  id v27;
  objc_super v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[6];
  _QWORD v36[5];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v24 = a4;
  +[STUIStatusBarBatteryItem chargingDisplayIdentifier](STUIStatusBarBatteryItem, "chargingDisplayIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v26)
  {
    if (self && !-[STUIStatusBarVisualProvider_iOS expanded](self, "expanded"))
    {
      batteryExpansionTimer = self->_batteryExpansionTimer;
      if (batteryExpansionTimer)
      {
        -[NSTimer invalidate](batteryExpansionTimer, "invalidate");
        -[STUIStatusBarVisualProvider_Split setBatteryExpansionTimer:](self, "setBatteryExpansionTimer:", 0);
      }
      v8 = MEMORY[0x1E0C809B0];
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke;
      v36[3] = &unk_1E8D63958;
      v36[4] = self;
      +[STUIStatusBarAnimation animationWithBlock:](STUIStatusBarAnimation, "animationWithBlock:", v36);
      v27 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setPriority:", 200);
      objc_msgSend(v27, "setExclusivityGroupIdentifier:", CFSTR("trailing"));
      v35[0] = 0;
      v35[1] = v35;
      v35[2] = 0x3010000000;
      v35[4] = 0;
      v35[5] = 0;
      v35[3] = "";
      v34[0] = v8;
      v34[1] = 3221225472;
      v34[2] = __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_6;
      v34[3] = &unk_1E8D63180;
      v34[4] = v35;
      +[STUIStatusBarAnimation animationWithBlock:](STUIStatusBarAnimation, "animationWithBlock:", v34);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setPriority:", 200);
      v33[0] = v8;
      v33[1] = 3221225472;
      v33[2] = __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_8;
      v33[3] = &unk_1E8D631A8;
      v33[4] = v35;
      objc_msgSend(v9, "setPrepareBlock:", v33);
      +[STUIStatusBarBatteryItem iconDisplayIdentifier](STUIStatusBarBatteryItem, "iconDisplayIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addSubAnimation:forDisplayItemWithIdentifier:", v9, v10);

      +[STUIStatusBarAnimation animationWithBlock:](STUIStatusBarAnimation, "animationWithBlock:", &__block_literal_global_11);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setPriority:", 150);
      objc_msgSend(v11, "setPrepareBlock:", &__block_literal_global_119);
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      -[STUIStatusBarVisualProvider_Split orderedDisplayItemPlacementsInRegionWithIdentifier:](self, "orderedDisplayItemPlacementsInRegionWithIdentifier:", CFSTR("trailing"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v30 != v14)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "identifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            +[STUIStatusBarItem itemIdentifierForDisplayItemIdentifier:](STUIStatusBarItem, "itemIdentifierForDisplayItemIdentifier:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            +[STUIStatusBarItem identifier](STUIStatusBarBatteryItem, "identifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v17, "isEqual:", v18);

            if ((v19 & 1) == 0)
              objc_msgSend(v27, "addSubAnimation:forDisplayItemWithIdentifier:", v11, v16);

          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        }
        while (v13);
      }

      objc_msgSend(v27, "setDelaysDependentItems:", 1);
      v20 = (void *)MEMORY[0x1E0C99E60];
      -[STUIStatusBarVisualProvider_Split orderedDisplayItemPlacementsInRegionWithIdentifier:](self, "orderedDisplayItemPlacementsInRegionWithIdentifier:", CFSTR("systemUpdates"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setWithArray:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setDelayedDisplayItemPlacements:", v22);

      _Block_object_dispose(v35, 8);
    }
    else
    {
      v27 = 0;
    }
  }
  else
  {
    +[STUIStatusBarControlCenterItem grabberIdentifier](STUIStatusBarControlCenterItem, "grabberIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v26)
    {
      -[STUIStatusBarVisualProvider_Split _controlCenterGrabberAnimation]((uint64_t)self);
      v27 = (id)objc_claimAutoreleasedReturnValue();
    }
    else if (-[STUIStatusBarVisualProvider_Split _shouldShowSystemUpdateForDisplayItemWithIdentifier:](self, v26))
    {
      -[STUIStatusBarVisualProvider_Split _systemUpdateAnimationForDisplayItemWithIdentifier:](self, v26);
      v27 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28.receiver = self;
      v28.super_class = (Class)STUIStatusBarVisualProvider_Split;
      -[STUIStatusBarVisualProvider_Phone additionAnimationForDisplayItemWithIdentifier:itemAnimation:](&v28, sel_additionAnimationForDisplayItemWithIdentifier_itemAnimation_, v26, v24);
      v27 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v27;
}

- (id)_controlCenterGrabberAnimation
{
  void *v1;
  _QWORD v3[5];

  if (!a1)
    return 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __67__STUIStatusBarVisualProvider_Split__controlCenterGrabberAnimation__block_invoke;
  v3[3] = &unk_1E8D63958;
  v3[4] = a1;
  +[STUIStatusBarAnimation animationWithBlock:](STUIStatusBarAnimation, "animationWithBlock:", v3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setPriority:", 300);
  objc_msgSend(v1, "setPrepareBlock:", &__block_literal_global_123);
  return v1;
}

- (id)_systemUpdateAnimationForDisplayItemWithIdentifier:(void *)a1
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  char v43;
  _QWORD v44[5];
  id v45;
  char v46;
  char v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v30 = v3;
  if (a1)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "statusBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_shouldReverseLayoutDirection");

    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarControlCenterItem, "defaultDisplayIdentifier");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = v8 == v4;

    v9 = MEMORY[0x1E0C809B0];
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke;
    v44[3] = &unk_1E8D642A0;
    v44[4] = a1;
    v46 = (char)v4;
    v47 = v7;
    v10 = v5;
    v45 = v10;
    +[STUIStatusBarAnimation animationWithBlock:](STUIStatusBarAnimation, "animationWithBlock:", v44);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPriority:", 300);
    objc_msgSend(v11, "setExclusivityGroupIdentifier:", CFSTR("trailing"));
    objc_msgSend(v11, "setPrepareBlock:", &__block_literal_global_129);
    v41[0] = v9;
    v41[1] = 3221225472;
    v41[2] = __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_12;
    v41[3] = &unk_1E8D642E8;
    v12 = v10;
    v42 = v12;
    v43 = (char)v4;
    +[STUIStatusBarAnimation animationWithBlock:](STUIStatusBarAnimation, "animationWithBlock:", v41);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPriority:", 300);
    objc_msgSend(v13, "setIdentifier:", CFSTR("systemUpdateItem"));
    v39[0] = v9;
    v39[1] = 3221225472;
    v39[2] = __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_14;
    v39[3] = &unk_1E8D64310;
    v29 = v12;
    v40 = v29;
    objc_msgSend(v13, "setPrepareBlock:", v39);
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend(a1, "orderedDisplayItemPlacementsInRegionWithIdentifier:", CFSTR("trailing"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v36;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v36 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v18), "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addSubAnimation:forDisplayItemWithIdentifier:", v13, v19);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
      }
      while (v16);
    }

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(a1, "orderedDisplayItemPlacementsInRegionWithIdentifier:", CFSTR("systemUpdates"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v48, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v32;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v32 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v25), "identifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          +[STUIStatusBarItem itemIdentifierForDisplayItemIdentifier:](STUIStatusBarItem, "itemIdentifierForDisplayItemIdentifier:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v27);

          ++v25;
        }
        while (v23 != v25);
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v48, 16);
      }
      while (v23);
    }

    objc_msgSend(v11, "setDelayedItemIdentifiers:", v20);
    objc_msgSend(v11, "setDelaysDependentItems:", 1);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4
{
  id v5;
  id v6;
  NSTimer *batteryExpansionTimer;
  STUIStatusBarVisualProvider_Split *v8;
  __int128 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  id v28;
  id v30;
  id v31;
  objc_super v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[5];
  _QWORD v38[6];
  _QWORD v39[6];
  _QWORD v40[5];
  _QWORD v41[6];
  _QWORD v42[4];
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v28 = a4;
  +[STUIStatusBarBatteryItem chargingDisplayIdentifier](STUIStatusBarBatteryItem, "chargingDisplayIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v30)
  {
    if (self && !-[STUIStatusBarVisualProvider_iOS expanded](self, "expanded"))
    {
      batteryExpansionTimer = self->_batteryExpansionTimer;
      v8 = self;
      if (batteryExpansionTimer)
      {
        -[NSTimer invalidate](batteryExpansionTimer, "invalidate");
        -[STUIStatusBarVisualProvider_Split setBatteryExpansionTimer:](self, "setBatteryExpansionTimer:", 0);
        v8 = self;
      }
      v42[0] = 0;
      v42[1] = v42;
      v42[2] = 0x4010000000;
      v42[3] = "";
      v9 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
      v43 = *MEMORY[0x1E0C9D648];
      v44 = v9;
      v10 = MEMORY[0x1E0C809B0];
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke;
      v41[3] = &unk_1E8D64130;
      v41[4] = v8;
      v41[5] = v42;
      +[STUIStatusBarAnimation animationWithBlock:](STUIStatusBarAnimation, "animationWithBlock:", v41);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setPriority:", 200);
      objc_msgSend(v11, "setExclusivityGroupIdentifier:", CFSTR("trailing"));
      v40[0] = v10;
      v40[1] = 3221225472;
      v40[2] = __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_5;
      v40[3] = &unk_1E8D631A8;
      v40[4] = v42;
      objc_msgSend(v11, "setPrepareBlock:", v40);
      v39[0] = 0;
      v39[1] = v39;
      v39[2] = 0x3010000000;
      v39[4] = 0;
      v39[5] = 0;
      v39[3] = "";
      v38[0] = v10;
      v38[1] = 3221225472;
      v38[2] = __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_6;
      v38[3] = &unk_1E8D64130;
      v38[5] = v39;
      v38[4] = self;
      +[STUIStatusBarAnimation animationWithBlock:](STUIStatusBarAnimation, "animationWithBlock:", v38);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPriority:", 200);
      v37[0] = v10;
      v37[1] = 3221225472;
      v37[2] = __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_9;
      v37[3] = &unk_1E8D631A8;
      v37[4] = v39;
      objc_msgSend(v12, "setPrepareBlock:", v37);
      +[STUIStatusBarBatteryItem iconDisplayIdentifier](STUIStatusBarBatteryItem, "iconDisplayIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addSubAnimation:forDisplayItemWithIdentifier:", v12, v13);
      v27 = v12;
      v31 = v11;

      +[STUIStatusBarAnimation animationWithBlock:](STUIStatusBarAnimation, "animationWithBlock:", &__block_literal_global_122);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setPriority:", 150);
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      -[STUIStatusBarVisualProvider_Split orderedDisplayItemPlacementsInRegionWithIdentifier:](self, "orderedDisplayItemPlacementsInRegionWithIdentifier:", CFSTR("trailing"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v34 != v17)
              objc_enumerationMutation(v15);
            objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "identifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            +[STUIStatusBarItem itemIdentifierForDisplayItemIdentifier:](STUIStatusBarItem, "itemIdentifierForDisplayItemIdentifier:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            +[STUIStatusBarItem identifier](STUIStatusBarBatteryItem, "identifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v20, "isEqual:", v21);

            if ((v22 & 1) == 0)
              objc_msgSend(v31, "addSubAnimation:forDisplayItemWithIdentifier:", v14, v19);

          }
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
        }
        while (v16);
      }

      objc_msgSend(v31, "setDelaysDependentItems:", 1);
      v23 = (void *)MEMORY[0x1E0C99E60];
      -[STUIStatusBarVisualProvider_Split orderedDisplayItemPlacementsInRegionWithIdentifier:](self, "orderedDisplayItemPlacementsInRegionWithIdentifier:", CFSTR("systemUpdates"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setWithArray:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setDelayedDisplayItemPlacements:", v25);

      _Block_object_dispose(v39, 8);
      _Block_object_dispose(v42, 8);
    }
    else
    {
      v31 = 0;
    }
  }
  else
  {
    +[STUIStatusBarControlCenterItem grabberIdentifier](STUIStatusBarControlCenterItem, "grabberIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v30)
    {
      -[STUIStatusBarVisualProvider_Split _controlCenterGrabberAnimation]((uint64_t)self);
      v31 = (id)objc_claimAutoreleasedReturnValue();
    }
    else if (-[STUIStatusBarVisualProvider_Split _shouldShowSystemUpdateForDisplayItemWithIdentifier:](self, v30))
    {
      -[STUIStatusBarVisualProvider_Split _systemUpdateAnimationForDisplayItemWithIdentifier:](self, v30);
      v31 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32.receiver = self;
      v32.super_class = (Class)STUIStatusBarVisualProvider_Split;
      -[STUIStatusBarVisualProvider_Phone removalAnimationForDisplayItemWithIdentifier:itemAnimation:](&v32, sel_removalAnimationForDisplayItemWithIdentifier_itemAnimation_, v30, v28);
      v31 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v31;
}

- (double)airplaneTravelOffsetInProposedPartWithIdentifier:(id *)a3 animationType:(int64_t)a4
{
  _BOOL4 v7;
  double result;
  objc_super v9;

  v7 = -[STUIStatusBarVisualProvider_iOS expanded](self, "expanded");
  result = 20.0;
  if (v7)
  {
    v9.receiver = self;
    v9.super_class = (Class)STUIStatusBarVisualProvider_Split;
    -[STUIStatusBarVisualProvider_iOS airplaneTravelOffsetInProposedPartWithIdentifier:animationType:](&v9, sel_airplaneTravelOffsetInProposedPartWithIdentifier_animationType_, a3, a4, 20.0);
  }
  return result;
}

- (double)airplaneSpeedForAnimationType:(int64_t)a3
{
  double result;
  objc_super v6;

  if (-[STUIStatusBarVisualProvider_iOS expanded](self, "expanded"))
  {
    v6.receiver = self;
    v6.super_class = (Class)STUIStatusBarVisualProvider_Split;
    -[STUIStatusBarVisualProvider_iOS airplaneSpeedForAnimationType:](&v6, sel_airplaneSpeedForAnimationType_, a3);
  }
  else
  {
    result = 60.0;
    if (a3 == 2)
      return 100.0;
  }
  return result;
}

- (double)airplaneShouldFadeForAnimationType:(int64_t)a3
{
  _BOOL4 v5;
  double result;
  objc_super v7;

  v5 = -[STUIStatusBarVisualProvider_iOS expanded](self, "expanded");
  result = 0.0;
  if (v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)STUIStatusBarVisualProvider_Split;
    -[STUIStatusBarVisualProvider_iOS airplaneShouldFadeForAnimationType:](&v7, sel_airplaneShouldFadeForAnimationType_, a3, 0.0);
  }
  return result;
}

- (double)airplaneObstacleFadeOutDuration
{
  double result;
  objc_super v4;

  if (!-[STUIStatusBarVisualProvider_iOS expanded](self, "expanded"))
    return 0.15;
  v4.receiver = self;
  v4.super_class = (Class)STUIStatusBarVisualProvider_Split;
  -[STUIStatusBarVisualProvider_iOS airplaneObstacleFadeOutDuration](&v4, sel_airplaneObstacleFadeOutDuration);
  return result;
}

- (id)animationForAirplaneMode
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)STUIStatusBarVisualProvider_Split;
  -[STUIStatusBarVisualProvider_iOS animationForAirplaneMode](&v17, sel_animationForAirplaneMode);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExclusivityGroupIdentifier:", CFSTR("trailing"));
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[STUIStatusBarVisualProvider_Split orderedDisplayItemPlacementsInRegionWithIdentifier:](self, "orderedDisplayItemPlacementsInRegionWithIdentifier:", CFSTR("systemUpdates"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[STUIStatusBarItem itemIdentifierForDisplayItemIdentifier:](STUIStatusBarItem, "itemIdentifierForDisplayItemIdentifier:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "setDelayedItemIdentifiers:", v4);
  return v3;
}

- (id)animationForProminentLocation
{
  void *v2;
  __int128 v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[4];
  __int128 v11;
  __int128 v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)STUIStatusBarVisualProvider_Split;
  -[STUIStatusBarVisualProvider_iOS animationForProminentLocation](&v13, sel_animationForProminentLocation);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x4010000000;
  v10[3] = "";
  v3 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v11 = *MEMORY[0x1E0C9D648];
  v12 = v3;
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__STUIStatusBarVisualProvider_Split_animationForProminentLocation__block_invoke;
  v9[3] = &unk_1E8D63180;
  v9[4] = v10;
  +[STUIStatusBarAnimation animationWithBlock:](STUIStatusBarAnimation, "animationWithBlock:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __66__STUIStatusBarVisualProvider_Split_animationForProminentLocation__block_invoke_4;
  v8[3] = &unk_1E8D631A8;
  v8[4] = v10;
  objc_msgSend(v5, "setPrepareBlock:", v8);
  objc_msgSend(v5, "setPriority:", -300);
  +[STUIStatusBarTimeItem shortTimeDisplayIdentifier](STUIStatusBarTimeItem, "shortTimeDisplayIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubAnimation:forDisplayItemWithIdentifier:", v5, v6);

  _Block_object_dispose(v10, 8);
  return v2;
}

- (void)_collapseBattery
{
  void *v2;
  void *v3;
  char v4;

  if (a1 && objc_msgSend(a1[17], "isEnabled"))
  {
    objc_msgSend(a1[17], "setEnabled:", 0);
    objc_msgSend(a1, "statusBar");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "updateWithAnimations:", MEMORY[0x1E0C9AA60]);

    objc_msgSend(a1, "statusBar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "areAnimationsEnabled");

    if ((v4 & 1) == 0)
      -[STUIStatusBarVisualProvider_Split _resetBattery](a1);
  }
}

- (CGAffineTransform)_collapseChargingBoltTransformForDisplayItem:(void *)a3
{
  CGAffineTransform *v3;
  void *v4;
  double v5;
  __int128 v6;
  __int128 v7;
  CGAffineTransform v8;
  CGAffineTransform v9;

  v3 = result;
  if (a2)
  {
    objc_msgSend(a3, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "_shouldReverseLayoutDirection"))
      v5 = -12.0;
    else
      v5 = 12.0;

    *(_OWORD *)&v3->c = 0u;
    *(_OWORD *)&v3->tx = 0u;
    *(_OWORD *)&v3->a = 0u;
    CGAffineTransformMakeTranslation(v3, v5, 0.666666667);
    v6 = *(_OWORD *)&v3->c;
    *(_OWORD *)&v8.a = *(_OWORD *)&v3->a;
    *(_OWORD *)&v8.c = v6;
    *(_OWORD *)&v8.tx = *(_OWORD *)&v3->tx;
    result = CGAffineTransformScale(&v9, &v8, 0.1, 0.1);
    v7 = *(_OWORD *)&v9.c;
    *(_OWORD *)&v3->a = *(_OWORD *)&v9.a;
    *(_OWORD *)&v3->c = v7;
    *(_OWORD *)&v3->tx = *(_OWORD *)&v9.tx;
  }
  else
  {
    *(_OWORD *)&result->c = 0u;
    *(_OWORD *)&result->tx = 0u;
    *(_OWORD *)&result->a = 0u;
  }
  return result;
}

- (void)_resetBattery
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _OWORD v28[3];
  _OWORD v29[2];
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "statusBar");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarBatteryItem chargingDisplayIdentifier](STUIStatusBarBatteryItem, "chargingDisplayIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "displayItemWithIdentifier:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "statusBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarBatteryItem iconDisplayIdentifier](STUIStatusBarBatteryItem, "iconDisplayIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayItemWithIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v29[0] = *MEMORY[0x1E0C9BAA8];
    v21 = v29[0];
    v29[1] = v22;
    v30 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v20 = v30;
    v23 = v4;
    objc_msgSend(v4, "setTransform:", v29);
    v28[0] = v21;
    v28[1] = v22;
    v28[2] = v20;
    objc_msgSend(v7, "setTransform:", v28);
    objc_msgSend(a1, "statusBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarItem identifier](STUIStatusBarBatteryItem, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemWithIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setHighlighted:", 0);
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(a1, "orderedDisplayItemPlacementsInRegionWithIdentifier:", CFSTR("trailing"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v25;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v15);
          objc_msgSend(a1, "statusBar");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "displayItemWithIdentifier:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "setAlpha:", 1.0);
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
      }
      while (v13);
    }

  }
}

- (void)setExpanded:(BOOL)a3
{
  _BOOL8 v3;
  NSTimer *batteryExpansionTimer;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  _QWORD v10[5];

  v3 = a3;
  if (-[STUIStatusBarVisualProvider_iOS expanded](self, "expanded") != a3)
  {
    if (self)
    {
      batteryExpansionTimer = self->_batteryExpansionTimer;
      if (batteryExpansionTimer)
      {
        -[NSTimer invalidate](batteryExpansionTimer, "invalidate");
        -[STUIStatusBarVisualProvider_Split setBatteryExpansionTimer:](self, "setBatteryExpansionTimer:", 0);
      }
    }
    if (-[STUIStatusBarVisualProvider_iOS expanded](self, "expanded"))
    {
      -[STUIStatusBarVisualProvider_Phone pillRegionCoordinator](self, "pillRegionCoordinator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pillIconPlacement");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setEnabled:", 1);

      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __49__STUIStatusBarVisualProvider_Split_setExpanded___block_invoke;
      v10[3] = &unk_1E8D62A38;
      v10[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v10);
    }
    -[STUIStatusBarVisualProvider_Phone pillRegionCoordinator](self, "pillRegionCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updatePill");

    v9.receiver = self;
    v9.super_class = (Class)STUIStatusBarVisualProvider_Split;
    -[STUIStatusBarVisualProvider_iOS setExpanded:](&v9, sel_setExpanded_, v3);
  }
}

- (id)defaultAnimationForDisplayItemWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)STUIStatusBarVisualProvider_Split;
  -[STUIStatusBarVisualProvider_iOS defaultAnimationForDisplayItemWithIdentifier:](&v9, sel_defaultAnimationForDisplayItemWithIdentifier_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E60];
  -[STUIStatusBarVisualProvider_Split orderedDisplayItemPlacementsInRegionWithIdentifier:](self, "orderedDisplayItemPlacementsInRegionWithIdentifier:", CFSTR("systemUpdates"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelayedDisplayItemPlacements:", v7);

  return v4;
}

- (double)animatedTypeDisplayItemSpacingFactor
{
  return self->_animatedTypeDisplayItemSpacingFactor;
}

- (STUIStatusBarDisplayItemPlacementGroup)lowerWifiGroup
{
  return self->_lowerWifiGroup;
}

- (STUIStatusBarDisplayItemPlacement)batteryChargingPlacement
{
  return self->_batteryChargingPlacement;
}

- (void)setBatteryChargingPlacement:(id)a3
{
  objc_storeStrong((id *)&self->_batteryChargingPlacement, a3);
}

- (NSLayoutConstraint)expandedLeadingLowerTopConstraint
{
  return self->_expandedLeadingLowerTopConstraint;
}

- (void)setExpandedLeadingLowerTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_expandedLeadingLowerTopConstraint, a3);
}

- (NSLayoutConstraint)expandedTrailingBottomConstraint
{
  return self->_expandedTrailingBottomConstraint;
}

- (void)setExpandedTrailingBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_expandedTrailingBottomConstraint, a3);
}

- (NSTimer)systemUpdatesTimer
{
  return self->_systemUpdatesTimer;
}

- (void)setSystemUpdatesTimer:(id)a3
{
  objc_storeStrong((id *)&self->_systemUpdatesTimer, a3);
}

- (NSTimer)batteryExpansionTimer
{
  return self->_batteryExpansionTimer;
}

- (void)setBatteryExpansionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_batteryExpansionTimer, a3);
}

- (NSTimer)airplaneModeIgnoreChangesTimer
{
  return self->_airplaneModeIgnoreChangesTimer;
}

- (void)setAirplaneModeIgnoreChangesTimer:(id)a3
{
  objc_storeStrong((id *)&self->_airplaneModeIgnoreChangesTimer, a3);
}

- (void)setDelayedSystemUpdateDataToken:(id)a3
{
  objc_storeStrong(&self->_delayedSystemUpdateDataToken, a3);
}

@end
