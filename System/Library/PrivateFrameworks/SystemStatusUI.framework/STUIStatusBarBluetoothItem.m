@implementation STUIStatusBarBluetoothItem

- (id)indicatorEntryKey
{
  return (id)*MEMORY[0x1E0DB0CA0];
}

+ (STUIStatusBarIdentifier)batteryDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("batteryDisplayIdentifier"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryImageView, 0);
}

- (id)systemImageNameForUpdate:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  objc_msgSend(a3, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bluetoothEntry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "state");

  if (v5 > 2)
    return 0;
  else
    return off_1E8D64438[v5];
}

+ (BOOL)alwaysShowRegulatoryBluetoothIndicator
{
  if (qword_1EDBEDFC0 != -1)
    dispatch_once(&qword_1EDBEDFC0, &__block_literal_global_12);
  return _MergedGlobals_47;
}

uint64_t __68__STUIStatusBarBluetoothItem_alwaysShowRegulatoryBluetoothIndicator__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  _MergedGlobals_47 = result;
  return result;
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
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  _BOOL8 v34;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  STUIStatusBarBluetoothItem *v42;
  objc_super v43;

  v6 = a3;
  v7 = a4;
  v43.receiver = self;
  v43.super_class = (Class)STUIStatusBarBluetoothItem;
  -[STUIStatusBarIndicatorItem applyUpdate:toDisplayItem:](&v43, sel_applyUpdate_toDisplayItem_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bluetoothEntry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarBluetoothItem, "defaultDisplayIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 == v12)
  {
    if (objc_msgSend(v6, "dataChanged"))
    {
      objc_msgSend(v10, "batteryEntry");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend((id)objc_opt_class(), "alwaysShowRegulatoryBluetoothIndicator") & 1) == 0
        && objc_msgSend(v10, "state") != 2
        && (objc_msgSend(v17, "isEnabled") & 1) == 0)
      {
        objc_msgSend(v7, "setEnabled:", 0);
      }
      goto LABEL_23;
    }
  }
  else
  {
    objc_msgSend(v7, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarBluetoothItem batteryDisplayIdentifier](STUIStatusBarBluetoothItem, "batteryDisplayIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 == v14)
    {
      if ((objc_msgSend(v6, "dataChanged") & 1) != 0 || objc_msgSend(v6, "styleAttributesChanged"))
      {
        objc_msgSend(v10, "batteryEntry");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "isEnabled"))
          v16 = objc_msgSend(v15, "isEnabled");
        else
          v16 = 0;
        objc_msgSend(v7, "setEnabled:", v16);
        if (objc_msgSend(v7, "isEnabled"))
        {
          +[STUIStatusBarImageProvider sharedProvider](STUIStatusBarImageProvider, "sharedProvider");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "styleAttributes");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "imageNamed:styleAttributes:", CFSTR("HeadsetBatteryBG"), v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "styleAttributes");
          v37 = v15;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "imageTintColor");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "_flatImageWithColor:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = objc_alloc(MEMORY[0x1E0DC3828]);
          objc_msgSend(v22, "size");
          v24 = (void *)objc_msgSend(v23, "initWithSize:");
          v38[0] = MEMORY[0x1E0C809B0];
          v38[1] = 3221225472;
          v38[2] = __56__STUIStatusBarBluetoothItem_applyUpdate_toDisplayItem___block_invoke;
          v38[3] = &unk_1E8D64418;
          v39 = v22;
          v40 = v37;
          v25 = v6;
          v41 = v25;
          v42 = self;
          v26 = v22;
          objc_msgSend(v24, "imageWithActions:", v38);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "styleAttributes");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "effectiveLayoutDirection");

          if (v29)
            v30 = 0.0;
          else
            v30 = 2.0;
          if (v29)
            v31 = 2.0;
          else
            v31 = 0.0;
          objc_msgSend(v27, "imageWithAlignmentRectInsets:", 0.0, v30, 0.0, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          -[STUIStatusBarBluetoothItem batteryImageView](self, "batteryImageView");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setImage:", v32);

          v15 = v37;
        }

      }
      v34 = objc_msgSend(v10, "state") == 0;
      -[STUIStatusBarIndicatorItem imageView](self, "imageView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setUseDisabledAppearanceForAccessibilityHUD:", v34);
LABEL_23:

    }
  }

  return v8;
}

void __56__STUIStatusBarBluetoothItem_applyUpdate_toDisplayItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  id v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v3 = *(void **)(a1 + 32);
  v4 = *MEMORY[0x1E0C9D538];
  v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v6 = a2;
  objc_msgSend(v3, "drawAtPoint:", v4, v5);
  objc_msgSend(v6, "format");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "bounds");
  UIRectInset();
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v31.origin.x = v9;
  v31.origin.y = v11;
  v31.size.width = v13;
  v31.size.height = v15;
  CGRectGetHeight(v31);
  objc_msgSend(*(id *)(a1 + 40), "capacity");
  v32.origin.x = v9;
  v32.origin.y = v11;
  v32.size.width = v13;
  v32.size.height = v15;
  CGRectGetHeight(v32);
  objc_msgSend(*(id *)(a1 + 48), "styleAttributes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "traitCollection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "displayScale");
  UIRectIntegralWithScale();
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  v26 = *(void **)(a1 + 56);
  v27 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "styleAttributes");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "imageTintColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "_batteryFillColorForEntry:usingTintColor:", v27, v29);
  v30 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v30, "setFill");
  v33.origin.x = v19;
  v33.origin.y = v21;
  v33.size.width = v23;
  v33.size.height = v25;
  UIRectFill(v33);

}

- (id)_batteryFillColorForEntry:(id)a3 usingTintColor:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = a3;
  objc_msgSend(a4, "colorWithAlphaComponent:", 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "capacity");

  if (v7 > 26)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  return v6;
}

- (STUIStatusBarImageView)batteryImageView
{
  STUIStatusBarImageView *batteryImageView;

  batteryImageView = self->_batteryImageView;
  if (!batteryImageView)
  {
    -[STUIStatusBarBluetoothItem _create_batteryImageView](self, "_create_batteryImageView");
    batteryImageView = self->_batteryImageView;
  }
  return batteryImageView;
}

- (void)_create_batteryImageView
{
  STUIStatusBarImageView *v3;
  STUIStatusBarImageView *v4;
  STUIStatusBarImageView *batteryImageView;

  v3 = [STUIStatusBarImageView alloc];
  v4 = -[STUIStatusBarImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  batteryImageView = self->_batteryImageView;
  self->_batteryImageView = v4;

}

- (id)viewForIdentifier:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  +[STUIStatusBarBluetoothItem batteryDisplayIdentifier](STUIStatusBarBluetoothItem, "batteryDisplayIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[STUIStatusBarBluetoothItem batteryImageView](self, "batteryImageView");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)STUIStatusBarBluetoothItem;
    -[STUIStatusBarIndicatorItem viewForIdentifier:](&v9, sel_viewForIdentifier_, v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (void)setBatteryImageView:(id)a3
{
  objc_storeStrong((id *)&self->_batteryImageView, a3);
}

@end
