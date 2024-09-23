@implementation _UIStatusBarBluetoothItem

+ (_UIStatusBarIdentifier)batteryDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("batteryDisplayIdentifier"));
}

- (id)indicatorEntryKey
{
  return CFSTR("bluetoothEntry");
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
    return off_1E16E03E0[v5];
}

+ (BOOL)alwaysShowRegulatoryBluetoothIndicator
{
  if (qword_1ECD80250 != -1)
    dispatch_once(&qword_1ECD80250, &__block_literal_global_475);
  return _MergedGlobals_1210;
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
  UIGraphicsImageRenderer *v23;
  UIGraphicsImageRenderer *v24;
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
  _UIStatusBarBluetoothItem *v42;
  objc_super v43;

  v6 = a3;
  v7 = a4;
  v43.receiver = self;
  v43.super_class = (Class)_UIStatusBarBluetoothItem;
  -[_UIStatusBarIndicatorItem applyUpdate:toDisplayItem:](&v43, sel_applyUpdate_toDisplayItem_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bluetoothEntry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarBluetoothItem, "defaultDisplayIdentifier");
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
    +[_UIStatusBarBluetoothItem batteryDisplayIdentifier](_UIStatusBarBluetoothItem, "batteryDisplayIdentifier");
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
          +[_UIStatusBarImageProvider sharedProvider](_UIStatusBarImageProvider, "sharedProvider");
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

          v23 = [UIGraphicsImageRenderer alloc];
          objc_msgSend(v22, "size");
          v24 = -[UIGraphicsImageRenderer initWithSize:](v23, "initWithSize:");
          v38[0] = MEMORY[0x1E0C809B0];
          v38[1] = 3221225472;
          v38[2] = __55___UIStatusBarBluetoothItem_applyUpdate_toDisplayItem___block_invoke;
          v38[3] = &unk_1E16E03C0;
          v39 = v22;
          v40 = v37;
          v25 = v6;
          v41 = v25;
          v42 = self;
          v26 = v22;
          -[UIGraphicsImageRenderer imageWithActions:](v24, "imageWithActions:", v38);
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

          -[_UIStatusBarBluetoothItem batteryImageView](self, "batteryImageView");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setImage:", v32);

          v15 = v37;
        }

      }
      v34 = objc_msgSend(v10, "state") == 0;
      -[_UIStatusBarIndicatorItem imageView](self, "imageView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setUseDisabledAppearanceForAccessibilityHUD:", v34);
LABEL_23:

    }
  }

  return v8;
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
      +[UIColor blackColor](UIColor, "blackColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    +[UIColor systemRedColor](UIColor, "systemRedColor");
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  return v6;
}

- (_UIStatusBarImageView)batteryImageView
{
  _UIStatusBarImageView *batteryImageView;

  batteryImageView = self->_batteryImageView;
  if (!batteryImageView)
  {
    -[_UIStatusBarBluetoothItem _create_batteryImageView](self, "_create_batteryImageView");
    batteryImageView = self->_batteryImageView;
  }
  return batteryImageView;
}

- (void)_create_batteryImageView
{
  _UIStatusBarImageView *v3;
  _UIStatusBarImageView *v4;
  _UIStatusBarImageView *batteryImageView;

  v3 = [_UIStatusBarImageView alloc];
  v4 = -[_UIStatusBarImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
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
  +[_UIStatusBarBluetoothItem batteryDisplayIdentifier](_UIStatusBarBluetoothItem, "batteryDisplayIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[_UIStatusBarBluetoothItem batteryImageView](self, "batteryImageView");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_UIStatusBarBluetoothItem;
    -[_UIStatusBarIndicatorItem viewForIdentifier:](&v9, sel_viewForIdentifier_, v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (void)setBatteryImageView:(id)a3
{
  objc_storeStrong((id *)&self->_batteryImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryImageView, 0);
}

@end
