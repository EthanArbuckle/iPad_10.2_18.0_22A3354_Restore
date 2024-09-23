@implementation _UIStatusBarCellularItem

+ (_UIStatusBarIdentifier)signalStrengthDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("signalStrengthDisplayIdentifier"));
}

+ (_UIStatusBarIdentifier)warningDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("warningDisplayIdentifier"));
}

+ (_UIStatusBarIdentifier)nameDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("nameDisplayIdentifier"));
}

+ (_UIStatusBarIdentifier)typeDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("typeDisplayIdentifier"));
}

+ (_UIStatusBarIdentifier)callForwardingDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("callForwardingDisplayIdentifier"));
}

+ (_UIStatusBarIdentifier)rawDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("rawDisplayIdentifier"));
}

- (_UIStatusBarCellularItem)initWithIdentifier:(id)a3 statusBar:(id)a4
{
  _UIStatusBarCellularItem *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarCellularItem;
  v4 = -[_UIStatusBarItem initWithIdentifier:statusBar:](&v6, sel_initWithIdentifier_statusBar_, a3, a4);
  -[_UIStatusBarCellularItem setShowsDisabledSignalBars:](v4, "setShowsDisabledSignalBars:", 1);
  -[_UIStatusBarCellularItem setMarqueeServiceName:](v4, "setMarqueeServiceName:", 1);
  return v4;
}

- (NSString)cellularDataEntryKey
{
  return (NSString *)CFSTR("cellularEntry");
}

- (id)dependentEntryKeys
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[_UIStatusBarCellularItem cellularDataEntryKey](self, "cellularDataEntryKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObjects:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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
    -[_UIStatusBarCellularItem _backgroundColorForUpdate:entry:](self, "_backgroundColorForUpdate:entry:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setInactiveColor:", v13);

    -[_UIStatusBarCellularItem _fillColorForUpdate:entry:](self, "_fillColorForUpdate:entry:", v11, v12);
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

- (id)entryForDisplayItemWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[_UIStatusBarItem statusBar](self, "statusBar", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentAggregatedData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarCellularItem cellularDataEntryKey](self, "cellularDataEntryKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v6);
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _BOOL8 v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  _BOOL8 v32;
  _BOOL8 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  objc_super v41;

  v6 = a3;
  v7 = a4;
  v41.receiver = self;
  v41.super_class = (Class)_UIStatusBarCellularItem;
  -[_UIStatusBarItem applyUpdate:toDisplayItem:](&v41, sel_applyUpdate_toDisplayItem_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarCellularItem entryForDisplayItemWithIdentifier:](self, "entryForDisplayItemWithIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "signalStrengthDisplayIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 == v12)
  {
    -[_UIStatusBarCellularItem signalView](self, "signalView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[_UIStatusBarCellularItem _updateSignalView:withUpdate:entry:forceShowingDisabledSignalBars:](self, "_updateSignalView:withUpdate:entry:forceShowingDisabledSignalBars:", v24, v6, v10, 0);

    if (objc_msgSend(v6, "dataChanged") && v10)
      objc_msgSend(v7, "setEnabled:", v25);
    goto LABEL_43;
  }
  objc_msgSend(v7, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "nameDisplayIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 == v14)
  {
    objc_msgSend(v10, "string");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEnabled") && objc_msgSend(v26, "length"))
      v27 = objc_msgSend(v10, "isBootstrapCellular") ^ 1;
    else
      v27 = 0;
    objc_msgSend(v7, "setEnabled:", v27);
    if (!objc_msgSend(v7, "isEnabled"))
      goto LABEL_42;
    -[_UIStatusBarCellularItem serviceNameView](self, "serviceNameView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setText:", v26);
    objc_msgSend(v10, "crossfadeString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setAlternateText:", v29);

    objc_msgSend(v28, "setMarqueeRunning:", 1);
LABEL_41:

LABEL_42:
    goto LABEL_43;
  }
  objc_msgSend(v7, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "typeDisplayIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 != v16)
  {
    objc_msgSend(v7, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "warningDisplayIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17 == v18)
    {
      if (!v10)
        goto LABEL_43;
      v32 = objc_msgSend(v7, "isEnabled") && (unint64_t)(objc_msgSend(v10, "status") == 4);
      objc_msgSend(v7, "setEnabled:", v32);
      if (!objc_msgSend(v7, "isEnabled"))
        goto LABEL_43;
      -[_UIStatusBarCellularItem warningView](self, "warningView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "image");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
        goto LABEL_43;
      +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("exclamationmark.triangle.fill"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIStatusBarCellularItem warningView](self, "warningView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v7, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "callForwardingDisplayIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19 != v20)
      {
        objc_msgSend(v7, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "rawDisplayIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21 == v22 && v10)
        {
          v23 = objc_msgSend(v7, "isEnabled") ? objc_msgSend(v10, "displayRawValue") : 0;
          objc_msgSend(v7, "setEnabled:", v23);
          if (objc_msgSend(v7, "isEnabled"))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v10, "rawValue"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UIStatusBarCellularItem rawStringView](self, "rawStringView");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_40:
            v28 = v34;
            objc_msgSend(v34, "setText:", v26);
            goto LABEL_41;
          }
        }
        goto LABEL_43;
      }
      if (!v10)
        goto LABEL_43;
      v33 = objc_msgSend(v7, "isEnabled")
         && -[_UIStatusBarCellularItem _showCallFowardingForEntry:](self, "_showCallFowardingForEntry:", v10);
      objc_msgSend(v7, "setEnabled:", v33);
      if (!objc_msgSend(v7, "isEnabled"))
        goto LABEL_43;
      -[_UIStatusBarCellularItem callForwardingView](self, "callForwardingView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "image");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (v40)
        goto LABEL_43;
      +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("phone.fill.arrow.right"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIStatusBarCellularItem callForwardingView](self, "callForwardingView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v28 = v37;
    objc_msgSend(v37, "setImage:", v26);
    goto LABEL_41;
  }
  if (v10)
  {
    if ((objc_msgSend(v10, "isEnabled") & 1) != 0)
    {
      -[_UIStatusBarCellularItem _stringForCellularType:](self, "_stringForCellularType:", objc_msgSend(v10, "type"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v7, "isEnabled");
      v31 = 0;
      if (v30 && v26)
        v31 = objc_msgSend(v10, "isBootstrapCellular", 0) ^ 1;
    }
    else
    {
      objc_msgSend(v7, "isEnabled");
      v26 = 0;
      v31 = 0;
    }
    objc_msgSend(v7, "setEnabled:", v31);
    if (!objc_msgSend(v7, "isEnabled"))
      goto LABEL_42;
    -[_UIStatusBarCellularItem networkTypeView](self, "networkTypeView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_40;
  }
LABEL_43:

  return v8;
}

- (id)_stringForCellularType:(int64_t)a3
{
  _UIStatusBarCellularItemTypeStringProvider **p_typeStringProvider;
  id WeakRetained;
  id v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;

  p_typeStringProvider = &self->_typeStringProvider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_typeStringProvider);

  if (!WeakRetained
    || (v6 = objc_loadWeakRetained((id *)p_typeStringProvider),
        objc_msgSend(v6, "stringForCellularType:condensed:", a3, 0),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    switch(a3)
    {
      case 1:
        v8 = CFSTR("1x[statusBarDataNetwork]");
        v9 = CFSTR("1x");
        goto LABEL_17;
      case 2:
        v8 = CFSTR("GPRS");
        goto LABEL_16;
      case 3:
        v8 = CFSTR("EDGE");
        goto LABEL_16;
      case 4:
        v8 = CFSTR("3G");
        goto LABEL_16;
      case 5:
        v8 = CFSTR("4G");
        goto LABEL_16;
      case 6:
        v8 = CFSTR("LTE");
        goto LABEL_16;
      case 7:
        v8 = CFSTR("5GE");
        v9 = CFSTR("5G   ");
        goto LABEL_17;
      case 8:
        v8 = CFSTR("LTE-A");
        goto LABEL_16;
      case 9:
        v8 = CFSTR("LTE+");
        goto LABEL_16;
      case 10:
        v8 = CFSTR("5G");
        goto LABEL_16;
      case 11:
        v8 = CFSTR("5G+");
LABEL_16:
        v9 = v8;
        goto LABEL_17;
      case 12:
        v8 = CFSTR("5GUW");
        v9 = CFSTR("5G");
        goto LABEL_17;
      case 13:
        v8 = CFSTR("5GUC");
        v9 = CFSTR("5G");
LABEL_17:
        _UINSLocalizedStringWithDefaultValue(v8, v9);
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
      -[_UIStatusBarCellularItem serviceNameView](self, "serviceNameView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setMarqueeRunning:", 0);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __60___UIStatusBarCellularItem_prepareAnimation_forDisplayItem___block_invoke;
      v12[3] = &unk_1E16B42D0;
      v13 = v10;
      v11 = v10;
      objc_msgSend(v6, "addCompletionHandler:", v12);

    }
  }

}

- (_UIStatusBarCellularSignalView)signalView
{
  _UIStatusBarCellularSignalView *signalView;

  signalView = self->_signalView;
  if (!signalView)
  {
    -[_UIStatusBarCellularItem _create_signalView](self, "_create_signalView");
    signalView = self->_signalView;
  }
  return signalView;
}

- (void)_create_signalView
{
  _UIStatusBarCellularSignalView *v3;
  _UIStatusBarCellularSignalView *v4;
  _UIStatusBarCellularSignalView *signalView;

  v3 = [_UIStatusBarCellularSignalView alloc];
  v4 = -[UIView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  signalView = self->_signalView;
  self->_signalView = v4;

  -[_UIStatusBarSignalView setNumberOfBars:](self->_signalView, "setNumberOfBars:", 4);
}

- (_UIStatusBarStringView)serviceNameView
{
  _UIStatusBarStringView *serviceNameView;

  serviceNameView = self->_serviceNameView;
  if (!serviceNameView)
  {
    -[_UIStatusBarCellularItem _create_serviceNameView](self, "_create_serviceNameView");
    serviceNameView = self->_serviceNameView;
  }
  return serviceNameView;
}

- (void)_create_serviceNameView
{
  _UIStatusBarStringView *v3;
  _UIStatusBarStringView *v4;
  _UIStatusBarStringView *serviceNameView;
  _UIStatusBarStringView *v6;
  double v7;

  v3 = [_UIStatusBarStringView alloc];
  v4 = -[_UIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  serviceNameView = self->_serviceNameView;
  self->_serviceNameView = v4;

  -[UILabel setNumberOfLines:](self->_serviceNameView, "setNumberOfLines:", 1);
  -[_UIStatusBarStringView setFontStyle:](self->_serviceNameView, "setFontStyle:", 0);
  v6 = self->_serviceNameView;
  if (self->_marqueeServiceName)
    -[UILabel setMarqueeEnabled:](v6, "setMarqueeEnabled:", 1);
  else
    -[UILabel setLineBreakMode:](v6, "setLineBreakMode:", 4);
  LODWORD(v7) = 1132068864;
  -[UIView setContentCompressionResistancePriority:forAxis:](self->_serviceNameView, "setContentCompressionResistancePriority:forAxis:", 0, v7);
}

- (_UIStatusBarStringView)networkTypeView
{
  _UIStatusBarStringView *networkTypeView;

  networkTypeView = self->_networkTypeView;
  if (!networkTypeView)
  {
    -[_UIStatusBarCellularItem _create_networkTypeView](self, "_create_networkTypeView");
    networkTypeView = self->_networkTypeView;
  }
  return networkTypeView;
}

- (void)_create_networkTypeView
{
  _UIStatusBarStringView *v3;
  _UIStatusBarStringView *v4;
  _UIStatusBarStringView *networkTypeView;

  v3 = [_UIStatusBarStringView alloc];
  v4 = -[_UIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  networkTypeView = self->_networkTypeView;
  self->_networkTypeView = v4;

  -[UILabel setLineBreakMode:](self->_networkTypeView, "setLineBreakMode:", 2);
}

- (_UIStatusBarImageView)warningView
{
  _UIStatusBarImageView *warningView;

  warningView = self->_warningView;
  if (!warningView)
  {
    -[_UIStatusBarCellularItem _create_warningView](self, "_create_warningView");
    warningView = self->_warningView;
  }
  return warningView;
}

- (void)_create_warningView
{
  _UIStatusBarImageView *v3;
  _UIStatusBarImageView *v4;
  _UIStatusBarImageView *warningView;

  v3 = [_UIStatusBarImageView alloc];
  v4 = -[_UIStatusBarImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  warningView = self->_warningView;
  self->_warningView = v4;

}

- (_UIStatusBarImageView)callForwardingView
{
  _UIStatusBarImageView *callForwardingView;

  callForwardingView = self->_callForwardingView;
  if (!callForwardingView)
  {
    -[_UIStatusBarCellularItem _create_callForwardingView](self, "_create_callForwardingView");
    callForwardingView = self->_callForwardingView;
  }
  return callForwardingView;
}

- (void)_create_callForwardingView
{
  _UIStatusBarImageView *v3;
  _UIStatusBarImageView *v4;
  _UIStatusBarImageView *callForwardingView;

  v3 = [_UIStatusBarImageView alloc];
  v4 = -[_UIStatusBarImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  callForwardingView = self->_callForwardingView;
  self->_callForwardingView = v4;

}

- (_UIStatusBarStringView)rawStringView
{
  _UIStatusBarStringView *rawStringView;

  rawStringView = self->_rawStringView;
  if (!rawStringView)
  {
    -[_UIStatusBarCellularItem _create_rawStringView](self, "_create_rawStringView");
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

- (void)setmarqueeServiceName:(BOOL)a3
{
  _UIStatusBarStringView *serviceNameView;

  if (self->_marqueeServiceName != a3)
  {
    self->_marqueeServiceName = a3;
    serviceNameView = self->_serviceNameView;
    if (serviceNameView)
    {
      if (a3)
      {
        -[UILabel setMarqueeEnabled:](serviceNameView, "setMarqueeEnabled:", 1);
      }
      else
      {
        -[UILabel setMarqueeEnabled:](serviceNameView, "setMarqueeEnabled:");
        -[UILabel setLineBreakMode:](self->_serviceNameView, "setLineBreakMode:", 4);
      }
    }
  }
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
  uint64_t v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "signalStrengthDisplayIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[_UIStatusBarCellularItem signalView](self, "signalView");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "nameDisplayIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v4)
    {
      -[_UIStatusBarCellularItem serviceNameView](self, "serviceNameView");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "typeDisplayIdentifier");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (v7 == v4)
      {
        -[_UIStatusBarCellularItem networkTypeView](self, "networkTypeView");
        v11 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "warningDisplayIdentifier");
        v8 = (id)objc_claimAutoreleasedReturnValue();

        if (v8 == v4)
        {
          -[_UIStatusBarCellularItem warningView](self, "warningView");
          v11 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend((id)objc_opt_class(), "callForwardingDisplayIdentifier");
          v9 = (id)objc_claimAutoreleasedReturnValue();

          if (v9 == v4)
          {
            -[_UIStatusBarCellularItem callForwardingView](self, "callForwardingView");
            v11 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend((id)objc_opt_class(), "rawDisplayIdentifier");
            v10 = (id)objc_claimAutoreleasedReturnValue();

            if (v10 == v4)
            {
              -[_UIStatusBarCellularItem rawStringView](self, "rawStringView");
              v11 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v14.receiver = self;
              v14.super_class = (Class)_UIStatusBarCellularItem;
              -[_UIStatusBarItem viewForIdentifier:](&v14, sel_viewForIdentifier_, v4);
              v11 = objc_claimAutoreleasedReturnValue();
            }
          }
        }
      }
    }
  }
  v12 = (void *)v11;

  return v12;
}

- (BOOL)showsDisabledSignalBars
{
  return self->_showsDisabledSignalBars;
}

- (void)setShowsDisabledSignalBars:(BOOL)a3
{
  self->_showsDisabledSignalBars = a3;
}

- (BOOL)marqueeServiceName
{
  return self->_marqueeServiceName;
}

- (void)setMarqueeServiceName:(BOOL)a3
{
  self->_marqueeServiceName = a3;
}

- (_UIStatusBarCellularItemTypeStringProvider)typeStringProvider
{
  return (_UIStatusBarCellularItemTypeStringProvider *)objc_loadWeakRetained((id *)&self->_typeStringProvider);
}

- (void)setTypeStringProvider:(id)a3
{
  objc_storeWeak((id *)&self->_typeStringProvider, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawStringView, 0);
  objc_storeStrong((id *)&self->_callForwardingView, 0);
  objc_storeStrong((id *)&self->_warningView, 0);
  objc_storeStrong((id *)&self->_networkTypeView, 0);
  objc_storeStrong((id *)&self->_signalView, 0);
  objc_storeStrong((id *)&self->_serviceNameView, 0);
  objc_destroyWeak((id *)&self->_typeStringProvider);
}

+ (id)groupWithHighPriority:(int64_t)a3 lowPriority:(int64_t)a4 typeClass:(Class)a5 allowDualNetwork:(BOOL)a6
{
  int64_t v8;
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
  void *v28;
  _QWORD v30[4];
  _QWORD v31[6];
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v8 = a3 - a4;
  if (a3 <= a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIStatusBarDisplayItemPlacementCellularGroup.m"), 35, CFSTR("The lowPriority should be smaller than the highPriority"));

  }
  objc_msgSend(a1, "signalStrengthDisplayIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v9, v8 + 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "warningDisplayIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v11, v8 + 8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "nameDisplayIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v13, v8 + 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[objc_class typeDisplayIdentifier](a5, "typeDisplayIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v15, v8 + 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "requiringAnyPlacements:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "callForwardingDisplayIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v19, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "rawDisplayIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v21, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v31[0] = v10;
  v31[1] = v12;
  v31[2] = v22;
  v31[3] = v14;
  v31[4] = v18;
  v31[5] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacementGroup groupWithPriority:placements:](_UIStatusBarDisplayItemPlacementCellularGroup, "groupWithPriority:placements:", a4, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "setSignalStrengthPlacement:", v10);
  objc_msgSend(v24, "setWarningPlacement:", v12);
  objc_msgSend(v24, "setNamePlacement:", v14);
  objc_msgSend(v24, "setTypePlacement:", v18);
  objc_msgSend(v24, "setCallForwardingPlacement:", v20);
  objc_msgSend(v24, "setRawPlacement:", v22);
  v30[0] = v10;
  v30[1] = v12;
  v30[2] = v22;
  v30[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setPlacementsAffectedByAirplaneMode:", v25);

  return v24;
}

@end
