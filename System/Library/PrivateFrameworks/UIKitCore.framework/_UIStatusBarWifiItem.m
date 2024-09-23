@implementation _UIStatusBarWifiItem

+ (_UIStatusBarIdentifier)signalStrengthDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("signalStrengthDisplayIdentifier"));
}

+ (_UIStatusBarIdentifier)iconDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("iconDisplayIdentifier"));
}

+ (_UIStatusBarIdentifier)rawDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("rawDisplayIdentifier"));
}

- (id)dependentEntryKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("wifiEntry"));
}

- (int64_t)_barCountForUpdate:(id)a3
{
  return 3;
}

- (double)_barThicknessForUpdate:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double result;

  objc_msgSend(a3, "styleAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayScale");
  v6 = v5;

  result = 2.5;
  if (v6 > 2.5)
    return 2.66666667;
  return result;
}

- (double)_interspaceForUpdate:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double result;

  objc_msgSend(a3, "styleAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayScale");
  v6 = v5;

  result = 1.66666667;
  if (v6 <= 2.5)
    return 1.5;
  return result;
}

- (double)_totalWidthForUpdate:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  _BOOL4 v6;

  objc_msgSend(a3, "styleAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayScale");
  v6 = v5 > 2.5;

  return dbl_186683040[v6];
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
    +[UIColor systemYellowColor](UIColor, "systemYellowColor");
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

- (id)_backgroundColorForUpdate:(id)a3 entry:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  if (objc_msgSend(a4, "lowDataModeActive"))
  {
    +[UIColor systemYellowColor](UIColor, "systemYellowColor");
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
  uint64_t v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  const __CFString *v29;
  void *v30;
  uint64_t v31;
  objc_super v33;

  v6 = a3;
  v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)_UIStatusBarWifiItem;
  -[_UIStatusBarItem applyUpdate:toDisplayItem:](&v33, sel_applyUpdate_toDisplayItem_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "wifiEntry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "signalStrengthDisplayIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 == v12)
  {
    v18 = objc_msgSend(v7, "isEnabled")
       && objc_msgSend(v10, "isEnabled")
       && objc_msgSend(v10, "type") != 1;
    objc_msgSend(v7, "setEnabled:", v18);
    -[_UIStatusBarWifiItem signalView](self, "signalView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEnabled"))
    {
      if ((objc_msgSend(v6, "styleAttributesChanged") & 1) != 0 || objc_msgSend(v6, "dataChanged"))
      {
        -[_UIStatusBarWifiItem _backgroundColorForUpdate:entry:](self, "_backgroundColorForUpdate:entry:", v6, v10);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setInactiveColor:", v20);

        -[_UIStatusBarWifiItem _fillColorForUpdate:entry:](self, "_fillColorForUpdate:entry:", v6, v10);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setActiveColor:", v21);

      }
      if (objc_msgSend(v6, "styleAttributesChanged"))
      {
        objc_msgSend(v6, "styleAttributes");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "mode");
        v24 = -0.666666667;
        if (v23 != 1)
          v24 = 0.0;
        objc_msgSend(v7, "setBaselineOffset:", v24);

      }
      if (objc_msgSend(v6, "dataChanged"))
      {
        v25 = 0;
        v26 = 0;
        switch(objc_msgSend(v10, "status"))
        {
          case 0:
          case 1:
          case 4:
            objc_msgSend(v7, "setEnabled:", 0);
            v26 = 0;
            v25 = 0;
            break;
          case 3:
            v26 = 0;
            v25 = 1;
            break;
          case 5:
            v26 = 1;
            v25 = 2;
            break;
          default:
            break;
        }
        if (objc_msgSend(v7, "isEnabled"))
        {
          v31 = objc_msgSend(v10, "displayValue");
          if (v26)
            objc_msgSend(v19, "setNumberOfActiveBars:", v31);
          objc_msgSend(v19, "setSignalMode:", v25);
        }
      }
    }
    goto LABEL_45;
  }
  objc_msgSend(v7, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "iconDisplayIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 == v14)
  {
    if (objc_msgSend(v7, "isEnabled"))
      v27 = objc_msgSend(v10, "isEnabled");
    else
      v27 = 0;
    objc_msgSend(v7, "setEnabled:", v27);
    if (!objc_msgSend(v7, "isEnabled"))
      goto LABEL_46;
    v28 = objc_msgSend(v10, "status");
    switch(v28)
    {
      case 5:
        if (objc_msgSend(v10, "type") == 1)
        {
          v29 = CFSTR("personalhotspot");
          goto LABEL_36;
        }
        break;
      case 4:
        v29 = CFSTR("wifi.exclamationmark");
        goto LABEL_36;
      case 1:
        v29 = CFSTR("wifi.slash");
LABEL_36:
        +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v29);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIStatusBarWifiItem networkIconView](self, "networkIconView");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setImage:", v19);
        goto LABEL_37;
    }
    objc_msgSend(v7, "setEnabled:", 0);
    goto LABEL_46;
  }
  objc_msgSend(v7, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "rawDisplayIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 == v16)
  {
    v17 = objc_msgSend(v7, "isEnabled") && objc_msgSend(v10, "isEnabled")
        ? objc_msgSend(v10, "displayRawValue")
        : 0;
    objc_msgSend(v7, "setEnabled:", v17);
    if (objc_msgSend(v7, "isEnabled"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v10, "rawValue"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIStatusBarWifiItem rawStringView](self, "rawStringView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setText:", v19);
LABEL_37:

LABEL_45:
    }
  }
LABEL_46:

  return v8;
}

- (_UIStatusBarWifiSignalView)signalView
{
  _UIStatusBarWifiSignalView *signalView;

  signalView = self->_signalView;
  if (!signalView)
  {
    -[_UIStatusBarWifiItem _create_signalView](self, "_create_signalView");
    signalView = self->_signalView;
  }
  return signalView;
}

- (void)_create_signalView
{
  _UIStatusBarWifiSignalView *v3;
  _UIStatusBarWifiSignalView *v4;
  _UIStatusBarWifiSignalView *signalView;

  v3 = [_UIStatusBarWifiSignalView alloc];
  v4 = -[UIView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  signalView = self->_signalView;
  self->_signalView = v4;

  -[_UIStatusBarSignalView setNumberOfBars:](self->_signalView, "setNumberOfBars:", 3);
}

- (_UIStatusBarImageView)networkIconView
{
  _UIStatusBarImageView *networkIconView;

  networkIconView = self->_networkIconView;
  if (!networkIconView)
  {
    -[_UIStatusBarWifiItem _create_networkIconView](self, "_create_networkIconView");
    networkIconView = self->_networkIconView;
  }
  return networkIconView;
}

- (void)_create_networkIconView
{
  _UIStatusBarImageView *v3;
  _UIStatusBarImageView *v4;
  _UIStatusBarImageView *networkIconView;

  v3 = [_UIStatusBarImageView alloc];
  v4 = -[_UIStatusBarImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  networkIconView = self->_networkIconView;
  self->_networkIconView = v4;

}

- (_UIStatusBarStringView)rawStringView
{
  _UIStatusBarStringView *rawStringView;

  rawStringView = self->_rawStringView;
  if (!rawStringView)
  {
    -[_UIStatusBarWifiItem _create_rawStringView](self, "_create_rawStringView");
    rawStringView = self->_rawStringView;
  }
  return rawStringView;
}

- (void)_create_rawStringView
{
  _UIStatusBarStringView *v3;
  _UIStatusBarStringView *v4;
  _UIStatusBarStringView *rawStringView;

  v3 = [_UIStatusBarStringView alloc];
  v4 = -[_UIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  rawStringView = self->_rawStringView;
  self->_rawStringView = v4;

}

- (id)viewForIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "signalStrengthDisplayIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[_UIStatusBarWifiItem signalView](self, "signalView");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "iconDisplayIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v4)
    {
      -[_UIStatusBarWifiItem networkIconView](self, "networkIconView");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "rawDisplayIdentifier");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (v7 == v4)
      {
        -[_UIStatusBarWifiItem rawStringView](self, "rawStringView");
        v8 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11.receiver = self;
        v11.super_class = (Class)_UIStatusBarWifiItem;
        -[_UIStatusBarItem viewForIdentifier:](&v11, sel_viewForIdentifier_, v4);
        v8 = objc_claimAutoreleasedReturnValue();
      }
    }
  }
  v9 = (void *)v8;

  return v9;
}

- (void)setSignalView:(id)a3
{
  objc_storeStrong((id *)&self->_signalView, a3);
}

- (void)setNetworkIconView:(id)a3
{
  objc_storeStrong((id *)&self->_networkIconView, a3);
}

- (void)setRawStringView:(id)a3
{
  objc_storeStrong((id *)&self->_rawStringView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawStringView, 0);
  objc_storeStrong((id *)&self->_networkIconView, 0);
  objc_storeStrong((id *)&self->_signalView, 0);
}

+ (id)groupWithPriority:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "signalStrengthDisplayIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v5, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "iconDisplayIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v7, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "excludingPlacements:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "rawDisplayIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v6;
  v16[1] = v10;
  v16[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacementGroup groupWithPriority:placements:](_UIStatusBarDisplayItemPlacementWifiGroup, "groupWithPriority:placements:", a3, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setSignalStrengthPlacement:", v6);
  objc_msgSend(v14, "setIconPlacement:", v10);
  objc_msgSend(v14, "setRawPlacement:", v12);

  return v14;
}

@end
