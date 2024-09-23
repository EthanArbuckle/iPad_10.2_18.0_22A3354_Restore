@implementation STUIStatusBarCellularItem

- (id)dependentEntryKeys
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[STUIStatusBarCellularItem cellularDataEntryKey](self, "cellularDataEntryKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObjects:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setTypeStringProvider:(id)a3
{
  objc_storeWeak((id *)&self->_typeStringProvider, a3);
}

+ (STUIStatusBarIdentifier)nameDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("nameDisplayIdentifier"));
}

+ (STUIStatusBarIdentifier)typeDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("typeDisplayIdentifier"));
}

- (id)entryForDisplayItemWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[STUIStatusBarItem statusBar](self, "statusBar", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentAggregatedData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarCellularItem cellularDataEntryKey](self, "cellularDataEntryKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)cellularDataEntryKey
{
  return (NSString *)(id)*MEMORY[0x1E0DB0CB0];
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6;
  id v7;
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
  uint64_t v25;
  void *v26;
  _BOOL8 v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  _BOOL8 v34;
  _BOOL8 v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  double v42;
  void *v43;
  _BOOL8 v44;
  void *v45;
  void *v46;
  void *v47;
  void *v49;
  void *v50;
  objc_super v51;

  v6 = a3;
  v7 = a4;
  v51.receiver = self;
  v51.super_class = (Class)STUIStatusBarCellularItem;
  -[STUIStatusBarItem applyUpdate:toDisplayItem:](&v51, sel_applyUpdate_toDisplayItem_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarCellularItem entryForDisplayItemWithIdentifier:](self, "entryForDisplayItemWithIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "signalStrengthDisplayIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 == v12)
  {
    -[STUIStatusBarCellularItem signalView](self, "signalView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[STUIStatusBarCellularItem _updateSignalView:withUpdate:entry:forceShowingDisabledSignalBars:](self, "_updateSignalView:withUpdate:entry:forceShowingDisabledSignalBars:", v26, v6, v10, 0);

    if (objc_msgSend(v6, "dataChanged") && v10)
      objc_msgSend(v7, "setEnabled:", v27);
    goto LABEL_55;
  }
  objc_msgSend(v7, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "nameDisplayIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 == v14)
  {
    objc_msgSend(v10, "string");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEnabled") && objc_msgSend(v28, "length"))
      v29 = objc_msgSend(v10, "isBootstrapCellular") ^ 1;
    else
      v29 = 0;
    objc_msgSend(v7, "setEnabled:", v29);
    if (!objc_msgSend(v7, "isEnabled"))
      goto LABEL_54;
    -[STUIStatusBarCellularItem serviceNameView](self, "serviceNameView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setText:", v28);
    objc_msgSend(v10, "crossfadeString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setAlternateText:", v31);

    objc_msgSend(v30, "setMarqueeRunning:", 1);
LABEL_53:

LABEL_54:
    goto LABEL_55;
  }
  objc_msgSend(v7, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "typeDisplayIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 != v16)
  {
    objc_msgSend(v7, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "sosDisplayIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17 == v18)
    {
      if (v10)
      {
        v34 = objc_msgSend(v7, "isEnabled")
           && objc_msgSend(v10, "showsSOSWhenDisabled")
           && (unint64_t)(objc_msgSend(v10, "status") == 1);
        objc_msgSend(v7, "setEnabled:", v34);
        if (objc_msgSend(v7, "isEnabled"))
        {
          -[STUIStatusBarCellularItem sosView](self, "sosView");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "image");
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v38)
          {
            objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("sos"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            -[STUIStatusBarCellularItem sosView](self, "sosView");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "setImage:", v39);

          }
          v41 = objc_msgSend(v10, "sosAvailable");
          v42 = 0.3;
          if (v41)
            v42 = 1.0;
          objc_msgSend(v7, "setViewAlpha:", v42);
          -[STUIStatusBarCellularItem sosView](self, "sosView");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setUseDisabledAppearanceForAccessibilityHUD:", v41 ^ 1u);

        }
      }
      goto LABEL_55;
    }
    objc_msgSend(v7, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "warningDisplayIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19 == v20)
    {
      if (!v10)
        goto LABEL_55;
      v35 = objc_msgSend(v7, "isEnabled") && (unint64_t)(objc_msgSend(v10, "status") == 4);
      objc_msgSend(v7, "setEnabled:", v35);
      if (!objc_msgSend(v7, "isEnabled"))
        goto LABEL_55;
      -[STUIStatusBarCellularItem warningView](self, "warningView");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "image");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (v46)
        goto LABEL_55;
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("exclamationmark.triangle.fill"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[STUIStatusBarCellularItem warningView](self, "warningView");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v7, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "callForwardingDisplayIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21 != v22)
      {
        objc_msgSend(v7, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "rawDisplayIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23 == v24 && v10)
        {
          v25 = objc_msgSend(v7, "isEnabled") ? objc_msgSend(v10, "displayRawValue") : 0;
          objc_msgSend(v7, "setEnabled:", v25);
          if (objc_msgSend(v7, "isEnabled"))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v10, "rawValue"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[STUIStatusBarCellularItem rawStringView](self, "rawStringView");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_52:
            v30 = v36;
            objc_msgSend(v36, "setText:", v28);
            goto LABEL_53;
          }
        }
        goto LABEL_55;
      }
      if (!v10)
        goto LABEL_55;
      v44 = objc_msgSend(v7, "isEnabled")
         && -[STUIStatusBarCellularItem _showCallFowardingForEntry:](self, "_showCallFowardingForEntry:", v10);
      objc_msgSend(v7, "setEnabled:", v44);
      if (!objc_msgSend(v7, "isEnabled"))
        goto LABEL_55;
      -[STUIStatusBarCellularItem callForwardingView](self, "callForwardingView");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "image");
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      if (v50)
        goto LABEL_55;
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("phone.fill.arrow.right"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[STUIStatusBarCellularItem callForwardingView](self, "callForwardingView");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v30 = v47;
    objc_msgSend(v47, "setImage:", v28);
    goto LABEL_53;
  }
  if (v10)
  {
    if ((objc_msgSend(v10, "isEnabled") & 1) != 0)
    {
      -[STUIStatusBarCellularItem _stringForCellularType:](self, "_stringForCellularType:", objc_msgSend(v10, "type"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v7, "isEnabled");
      v33 = 0;
      if (v32 && v28)
        v33 = objc_msgSend(v10, "isBootstrapCellular", 0) ^ 1;
    }
    else
    {
      objc_msgSend(v7, "isEnabled");
      v28 = 0;
      v33 = 0;
    }
    objc_msgSend(v7, "setEnabled:", v33);
    if (!objc_msgSend(v7, "isEnabled"))
      goto LABEL_54;
    -[STUIStatusBarCellularItem networkTypeView](self, "networkTypeView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_52;
  }
LABEL_55:

  return v8;
}

+ (STUIStatusBarIdentifier)signalStrengthDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("signalStrengthDisplayIdentifier"));
}

+ (STUIStatusBarIdentifier)warningDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("warningDisplayIdentifier"));
}

+ (STUIStatusBarIdentifier)sosDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("sosDisplayIdentifier"));
}

- (BOOL)_updateSignalView:(id)a3 withUpdate:(id)a4 entry:(id)a5 forceShowingDisabledSignalBars:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  int v17;
  BOOL v18;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((objc_msgSend(v11, "styleAttributesChanged") & 1) != 0 || objc_msgSend(v11, "dataChanged"))
  {
    -[STUIStatusBarCellularItem _backgroundColorForUpdate:entry:](self, "_backgroundColorForUpdate:entry:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setInactiveColor:", v13);

    -[STUIStatusBarCellularItem _fillColorForUpdate:entry:](self, "_fillColorForUpdate:entry:", v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setActiveColor:", v14);

  }
  if (!objc_msgSend(v11, "dataChanged"))
    goto LABEL_22;
  if (objc_msgSend(v12, "isEnabled"))
    v15 = objc_msgSend(v12, "status") != 4;
  else
    v15 = 0;
  v16 = objc_msgSend(v10, "signalMode");
  switch(objc_msgSend(v12, "status"))
  {
    case 0:
      objc_msgSend(v12, "isBootstrapCellular");
      goto LABEL_22;
    case 1:
      v17 = self->_showsDisabledSignalBars || v6;
      v15 &= v17;
      if (v17)
        v16 = 0;
      break;
    case 2:
      v16 = 0;
      break;
    case 3:
      v16 = 1;
      break;
    case 5:
      v16 = 2;
      break;
    default:
      break;
  }
  if (!objc_msgSend(v12, "isBootstrapCellular") || !v15)
  {
    if (!v15)
      goto LABEL_22;
LABEL_24:
    objc_msgSend(v10, "setSignalMode:", v16);
    objc_msgSend(v10, "setNumberOfActiveBars:", objc_msgSend(v12, "displayValue"));
    v18 = 1;
    goto LABEL_25;
  }
  if (objc_msgSend(v12, "status") == 5)
    goto LABEL_24;
LABEL_22:
  v18 = 0;
LABEL_25:

  return v18;
}

- (id)_backgroundColorForUpdate:(id)a3 entry:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  if (objc_msgSend(a4, "lowDataModeActive"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "colorWithAlphaComponent:", 0.3);
  }
  else
  {
    objc_msgSend(v5, "styleAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageDimmedTintColor");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_fillColorForUpdate:(id)a3 entry:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  if (objc_msgSend(a4, "lowDataModeActive"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "styleAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageTintColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "colorWithAlphaComponent:", 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (STUIStatusBarIdentifier)rawDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("rawDisplayIdentifier"));
}

+ (STUIStatusBarIdentifier)callForwardingDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("callForwardingDisplayIdentifier"));
}

- (STUIStatusBarImageView)sosView
{
  STUIStatusBarImageView *sosView;

  sosView = self->_sosView;
  if (!sosView)
  {
    -[STUIStatusBarCellularItem _create_sosView](self, "_create_sosView");
    sosView = self->_sosView;
  }
  return sosView;
}

- (STUIStatusBarCellularSignalView)signalView
{
  STUIStatusBarCellularSignalView *signalView;

  signalView = self->_signalView;
  if (!signalView)
  {
    -[STUIStatusBarCellularItem _create_signalView](self, "_create_signalView");
    signalView = self->_signalView;
  }
  return signalView;
}

- (void)_create_signalView
{
  STUIStatusBarCellularSignalView *v3;
  STUIStatusBarCellularSignalView *v4;
  STUIStatusBarCellularSignalView *signalView;

  v3 = [STUIStatusBarCellularSignalView alloc];
  v4 = -[STUIStatusBarCellularSignalView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  signalView = self->_signalView;
  self->_signalView = v4;

  -[STUIStatusBarSignalView setNumberOfBars:](self->_signalView, "setNumberOfBars:", 4);
}

- (void)_create_sosView
{
  STUIStatusBarImageView *v3;
  STUIStatusBarImageView *v4;
  STUIStatusBarImageView *sosView;

  v3 = [STUIStatusBarImageView alloc];
  v4 = -[STUIStatusBarImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  sosView = self->_sosView;
  self->_sosView = v4;

}

- (STUIStatusBarCellularItem)initWithIdentifier:(id)a3 statusBar:(id)a4
{
  STUIStatusBarCellularItem *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STUIStatusBarCellularItem;
  v4 = -[STUIStatusBarItem initWithIdentifier:statusBar:](&v6, sel_initWithIdentifier_statusBar_, a3, a4);
  -[STUIStatusBarCellularItem setShowsDisabledSignalBars:](v4, "setShowsDisabledSignalBars:", 1);
  -[STUIStatusBarCellularItem setMarqueeServiceName:](v4, "setMarqueeServiceName:", 1);
  return v4;
}

- (void)setShowsDisabledSignalBars:(BOOL)a3
{
  self->_showsDisabledSignalBars = a3;
}

- (void)setMarqueeServiceName:(BOOL)a3
{
  self->_marqueeServiceName = a3;
}

+ (id)groupWithHighPriority:(int64_t)a3 lowPriority:(int64_t)a4 typeClass:(Class)a5 allowDualNetwork:(BOOL)a6
{
  int64_t v9;
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
  _QWORD v28[4];
  _QWORD v29[6];
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v9 = a3 - a4;
  objc_msgSend(a1, "signalStrengthDisplayIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v10, v9 + 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "warningDisplayIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v12, v9 + 8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "nameDisplayIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v14, v9 + 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[objc_class typeDisplayIdentifier](a5, "typeDisplayIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v16, v9 + 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "requiringAnyPlacements:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "callForwardingDisplayIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v20, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "rawDisplayIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v22, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v29[0] = v11;
  v29[1] = v13;
  v29[2] = v23;
  v29[3] = v15;
  v29[4] = v19;
  v29[5] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacementGroup groupWithPriority:placements:](STUIStatusBarDisplayItemPlacementCellularGroup, "groupWithPriority:placements:", a4, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "setSignalStrengthPlacement:", v11);
  objc_msgSend(v25, "setWarningPlacement:", v13);
  objc_msgSend(v25, "setNamePlacement:", v15);
  objc_msgSend(v25, "setTypePlacement:", v19);
  objc_msgSend(v25, "setCallForwardingPlacement:", v21);
  objc_msgSend(v25, "setRawPlacement:", v23);
  v28[0] = v11;
  v28[1] = v13;
  v28[2] = v23;
  v28[3] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setPlacementsAffectedByAirplaneMode:", v26);

  return v25;
}

- (id)viewForIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "signalStrengthDisplayIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[STUIStatusBarCellularItem signalView](self, "signalView");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "nameDisplayIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v4)
    {
      -[STUIStatusBarCellularItem serviceNameView](self, "serviceNameView");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "typeDisplayIdentifier");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (v7 == v4)
      {
        -[STUIStatusBarCellularItem networkTypeView](self, "networkTypeView");
        v12 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "sosDisplayIdentifier");
        v8 = (id)objc_claimAutoreleasedReturnValue();

        if (v8 == v4)
        {
          -[STUIStatusBarCellularItem sosView](self, "sosView");
          v12 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend((id)objc_opt_class(), "warningDisplayIdentifier");
          v9 = (id)objc_claimAutoreleasedReturnValue();

          if (v9 == v4)
          {
            -[STUIStatusBarCellularItem warningView](self, "warningView");
            v12 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend((id)objc_opt_class(), "callForwardingDisplayIdentifier");
            v10 = (id)objc_claimAutoreleasedReturnValue();

            if (v10 == v4)
            {
              -[STUIStatusBarCellularItem callForwardingView](self, "callForwardingView");
              v12 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend((id)objc_opt_class(), "rawDisplayIdentifier");
              v11 = (id)objc_claimAutoreleasedReturnValue();

              if (v11 == v4)
              {
                -[STUIStatusBarCellularItem rawStringView](self, "rawStringView");
                v12 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v15.receiver = self;
                v15.super_class = (Class)STUIStatusBarCellularItem;
                -[STUIStatusBarItem viewForIdentifier:](&v15, sel_viewForIdentifier_, v4);
                v12 = objc_claimAutoreleasedReturnValue();
              }
            }
          }
        }
      }
    }
  }
  v13 = (void *)v12;

  return v13;
}

- (STUIStatusBarImageView)callForwardingView
{
  STUIStatusBarImageView *callForwardingView;

  callForwardingView = self->_callForwardingView;
  if (!callForwardingView)
  {
    -[STUIStatusBarCellularItem _create_callForwardingView](self, "_create_callForwardingView");
    callForwardingView = self->_callForwardingView;
  }
  return callForwardingView;
}

- (void)_create_callForwardingView
{
  STUIStatusBarImageView *v3;
  STUIStatusBarImageView *v4;
  STUIStatusBarImageView *callForwardingView;

  v3 = [STUIStatusBarImageView alloc];
  v4 = -[STUIStatusBarImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  callForwardingView = self->_callForwardingView;
  self->_callForwardingView = v4;

}

- (STUIStatusBarStringView)networkTypeView
{
  STUIStatusBarStringView *networkTypeView;

  networkTypeView = self->_networkTypeView;
  if (!networkTypeView)
  {
    -[STUIStatusBarCellularItem _create_networkTypeView](self, "_create_networkTypeView");
    networkTypeView = self->_networkTypeView;
  }
  return networkTypeView;
}

- (void)_create_networkTypeView
{
  STUIStatusBarStringView *v3;
  STUIStatusBarStringView *v4;
  STUIStatusBarStringView *networkTypeView;

  v3 = [STUIStatusBarStringView alloc];
  v4 = -[STUIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  networkTypeView = self->_networkTypeView;
  self->_networkTypeView = v4;

  -[STUIStatusBarStringView setLineBreakMode:](self->_networkTypeView, "setLineBreakMode:", 2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawStringView, 0);
  objc_storeStrong((id *)&self->_callForwardingView, 0);
  objc_storeStrong((id *)&self->_warningView, 0);
  objc_storeStrong((id *)&self->_sosView, 0);
  objc_storeStrong((id *)&self->_networkTypeView, 0);
  objc_storeStrong((id *)&self->_signalView, 0);
  objc_storeStrong((id *)&self->_serviceNameView, 0);
  objc_destroyWeak((id *)&self->_typeStringProvider);
}

- (id)_stringForCellularType:(int64_t)a3
{
  STUIStatusBarCellularItemTypeStringProvider **p_typeStringProvider;
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;

  p_typeStringProvider = &self->_typeStringProvider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_typeStringProvider);

  if (!WeakRetained
    || (v6 = objc_loadWeakRetained((id *)p_typeStringProvider),
        objc_msgSend(v6, "stringForCellularType:condensed:", a3, 0),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    switch(a3)
    {
      case 1:
        v10 = CFSTR("1x[statusBarDataNetwork]");
        v11 = CFSTR("1x");
        goto LABEL_17;
      case 2:
        v10 = CFSTR("GPRS");
        goto LABEL_16;
      case 3:
        v10 = CFSTR("EDGE");
        goto LABEL_16;
      case 4:
        v10 = CFSTR("3G");
        goto LABEL_16;
      case 5:
        v10 = CFSTR("4G");
        goto LABEL_16;
      case 6:
        v10 = CFSTR("LTE");
        goto LABEL_16;
      case 7:
        v10 = CFSTR("5GE");
        v11 = CFSTR("5G   ");
        goto LABEL_17;
      case 8:
        v10 = CFSTR("LTE-A");
        goto LABEL_16;
      case 9:
        v10 = CFSTR("LTE+");
        goto LABEL_16;
      case 10:
        v10 = CFSTR("5G");
        goto LABEL_16;
      case 11:
        v10 = CFSTR("5G+");
LABEL_16:
        v11 = &stru_1E8D64C18;
        goto LABEL_17;
      case 12:
        v10 = CFSTR("5GUW");
        v11 = CFSTR("5G");
        goto LABEL_17;
      case 13:
        v10 = CFSTR("5GUC");
        v11 = CFSTR("5G");
LABEL_17:
        objc_msgSend(v8, "localizedStringForKey:value:table:", v10, v11, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      default:
        v7 = 0;
        break;
    }

  }
  return v7;
}

- (BOOL)_showCallFowardingForEntry:(id)a3
{
  return objc_msgSend(a3, "callForwardingEnabled");
}

- (void)prepareAnimation:(id)a3 forDisplayItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "type") == 1)
  {
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "nameDisplayIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == v9)
    {
      -[STUIStatusBarCellularItem serviceNameView](self, "serviceNameView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setMarqueeRunning:", 0);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __61__STUIStatusBarCellularItem_prepareAnimation_forDisplayItem___block_invoke;
      v12[3] = &unk_1E8D628C0;
      v13 = v10;
      v11 = v10;
      objc_msgSend(v6, "addCompletionHandler:", v12);

    }
  }

}

uint64_t __61__STUIStatusBarCellularItem_prepareAnimation_forDisplayItem___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2)
    return objc_msgSend(*(id *)(result + 32), "setMarqueeRunning:", 1);
  return result;
}

- (STUIStatusBarStringView)serviceNameView
{
  STUIStatusBarStringView *serviceNameView;

  serviceNameView = self->_serviceNameView;
  if (!serviceNameView)
  {
    -[STUIStatusBarCellularItem _create_serviceNameView](self, "_create_serviceNameView");
    serviceNameView = self->_serviceNameView;
  }
  return serviceNameView;
}

- (void)_create_serviceNameView
{
  STUIStatusBarStringView *v3;
  STUIStatusBarStringView *v4;
  STUIStatusBarStringView *serviceNameView;
  STUIStatusBarStringView *v6;
  double v7;

  v3 = [STUIStatusBarStringView alloc];
  v4 = -[STUIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  serviceNameView = self->_serviceNameView;
  self->_serviceNameView = v4;

  -[STUIStatusBarStringView setNumberOfLines:](self->_serviceNameView, "setNumberOfLines:", 1);
  -[STUIStatusBarStringView setFontStyle:](self->_serviceNameView, "setFontStyle:", 0);
  v6 = self->_serviceNameView;
  if (self->_marqueeServiceName)
    -[STUIStatusBarStringView setMarqueeEnabled:](v6, "setMarqueeEnabled:", 1);
  else
    -[STUIStatusBarStringView setLineBreakMode:](v6, "setLineBreakMode:", 4);
  LODWORD(v7) = 1132068864;
  -[STUIStatusBarStringView setContentCompressionResistancePriority:forAxis:](self->_serviceNameView, "setContentCompressionResistancePriority:forAxis:", 0, v7);
}

- (STUIStatusBarImageView)warningView
{
  STUIStatusBarImageView *warningView;

  warningView = self->_warningView;
  if (!warningView)
  {
    -[STUIStatusBarCellularItem _create_warningView](self, "_create_warningView");
    warningView = self->_warningView;
  }
  return warningView;
}

- (void)_create_warningView
{
  STUIStatusBarImageView *v3;
  STUIStatusBarImageView *v4;
  STUIStatusBarImageView *warningView;

  v3 = [STUIStatusBarImageView alloc];
  v4 = -[STUIStatusBarImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  warningView = self->_warningView;
  self->_warningView = v4;

}

- (STUIStatusBarStringView)rawStringView
{
  STUIStatusBarStringView *rawStringView;

  rawStringView = self->_rawStringView;
  if (!rawStringView)
  {
    -[STUIStatusBarCellularItem _create_rawStringView](self, "_create_rawStringView");
    rawStringView = self->_rawStringView;
  }
  return rawStringView;
}

- (void)_create_rawStringView
{
  STUIStatusBarStringView *v3;
  STUIStatusBarStringView *v4;
  STUIStatusBarStringView *rawStringView;

  v3 = [STUIStatusBarStringView alloc];
  v4 = -[STUIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  rawStringView = self->_rawStringView;
  self->_rawStringView = v4;

}

- (void)setmarqueeServiceName:(BOOL)a3
{
  STUIStatusBarStringView *serviceNameView;

  if (self->_marqueeServiceName != a3)
  {
    self->_marqueeServiceName = a3;
    serviceNameView = self->_serviceNameView;
    if (serviceNameView)
    {
      if (a3)
      {
        -[STUIStatusBarStringView setMarqueeEnabled:](serviceNameView, "setMarqueeEnabled:", 1);
      }
      else
      {
        -[STUIStatusBarStringView setMarqueeEnabled:](serviceNameView, "setMarqueeEnabled:");
        -[STUIStatusBarStringView setLineBreakMode:](self->_serviceNameView, "setLineBreakMode:", 4);
      }
    }
  }
}

- (BOOL)showsDisabledSignalBars
{
  return self->_showsDisabledSignalBars;
}

- (BOOL)marqueeServiceName
{
  return self->_marqueeServiceName;
}

- (STUIStatusBarCellularItemTypeStringProvider)typeStringProvider
{
  return (STUIStatusBarCellularItemTypeStringProvider *)objc_loadWeakRetained((id *)&self->_typeStringProvider);
}

- (void)setServiceNameView:(id)a3
{
  objc_storeStrong((id *)&self->_serviceNameView, a3);
}

- (void)setSignalView:(id)a3
{
  objc_storeStrong((id *)&self->_signalView, a3);
}

- (void)setNetworkTypeView:(id)a3
{
  objc_storeStrong((id *)&self->_networkTypeView, a3);
}

- (void)setSosView:(id)a3
{
  objc_storeStrong((id *)&self->_sosView, a3);
}

- (void)setWarningView:(id)a3
{
  objc_storeStrong((id *)&self->_warningView, a3);
}

- (void)setCallForwardingView:(id)a3
{
  objc_storeStrong((id *)&self->_callForwardingView, a3);
}

- (void)setRawStringView:(id)a3
{
  objc_storeStrong((id *)&self->_rawStringView, a3);
}

@end
