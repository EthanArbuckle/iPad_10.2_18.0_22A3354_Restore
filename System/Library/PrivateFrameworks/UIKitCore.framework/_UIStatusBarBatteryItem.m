@implementation _UIStatusBarBatteryItem

+ (_UIStatusBarIdentifier)iconDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("iconDisplayIdentifier"));
}

+ (_UIStatusBarIdentifier)staticIconDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("staticIconDisplayIdentifier"));
}

+ (_UIStatusBarIdentifier)chargingDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("chargingDisplayIdentifier"));
}

+ (_UIStatusBarIdentifier)percentDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("percentDisplayIdentifier"));
}

- (id)dependentEntryKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("mainBatteryEntry"));
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  double v28;
  unint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  uint64_t v39;
  double v40;
  _BOOL8 v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _BOOL4 v47;
  void *v48;
  uint64_t v49;
  double v50;
  double v51;
  int v52;
  int v53;
  objc_super v54;

  v6 = a3;
  v7 = a4;
  v54.receiver = self;
  v54.super_class = (Class)_UIStatusBarBatteryItem;
  -[_UIStatusBarItem applyUpdate:toDisplayItem:](&v54, sel_applyUpdate_toDisplayItem_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mainBatteryEntry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "iconDisplayIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v11 == (void *)v12)
  {

    goto LABEL_12;
  }
  v13 = (void *)v12;
  objc_msgSend(v7, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "staticIconDisplayIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 == v15)
  {
LABEL_12:
    objc_msgSend(v7, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "iconDisplayIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24 == v25)
      -[_UIStatusBarBatteryItem batteryView](self, "batteryView");
    else
      -[_UIStatusBarBatteryItem staticBatteryView](self, "staticBatteryView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "styleAttributes");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "dataChanged"))
    {
      v27 = objc_msgSend(v10, "capacity");
      if ((double)v27 / 100.0 <= 0.01)
        v28 = 0.0;
      else
        v28 = (double)v27 / 100.0;
      v29 = objc_msgSend(v10, "state");
      if (v29 <= 3)
        objc_msgSend(v20, "setChargingState:", qword_186682FE0[v29]);
      if (-[_UIStatusBarBatteryItem usesCondensedPercentageDisplay](self, "usesCondensedPercentageDisplay")
        && objc_msgSend(v26, "mode") != 1)
      {
        if ((objc_msgSend(v10, "prominentlyShowsDetailString") & 1) != 0)
        {
          v30 = 1;
        }
        else
        {
          if (_UIInternalPreferencesRevisionOnce != -1)
            dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
          if (_UIInternalPreferencesRevisionVar < 1
            || (v52 = _UIInternalPreference_StatusBarBatteryCondensedPercentageForceEnabled,
                _UIInternalPreferencesRevisionVar == _UIInternalPreference_StatusBarBatteryCondensedPercentageForceEnabled))
          {
            v47 = 0;
          }
          else
          {
            v53 = _UIInternalPreferencesRevisionVar;
            do
            {
              v47 = v53 < v52;
              if (v53 < v52)
                break;
              _UIInternalPreferenceSync(v53, &_UIInternalPreference_StatusBarBatteryCondensedPercentageForceEnabled, (uint64_t)CFSTR("StatusBarBatteryCondensedPercentageForceEnabled"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
              v52 = _UIInternalPreference_StatusBarBatteryCondensedPercentageForceEnabled;
            }
            while (v53 != _UIInternalPreference_StatusBarBatteryCondensedPercentageForceEnabled);
          }
          if (byte_1EDDA82AC)
            v30 = v47;
          else
            v30 = 0;
        }
      }
      else
      {
        v30 = 0;
      }
      objc_msgSend(v20, "setShowsPercentage:", v30);
      objc_msgSend(v20, "setChargePercent:", v28);
      objc_msgSend(v20, "setSaverModeActive:", objc_msgSend(v10, "saverModeActive"));
    }
    if (objc_msgSend(v6, "styleAttributesChanged"))
    {
      objc_msgSend(v26, "imageTintColor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setFillColor:", v31);

      objc_msgSend(v7, "identifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "iconDisplayIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32 == v33)
      {
        objc_msgSend(v20, "layer");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setShouldRasterize:", 1);

        objc_msgSend(v26, "traitCollection");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "displayScale");
        v37 = v36;
        objc_msgSend(v20, "layer");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setRasterizationScale:", v37);

      }
      v39 = objc_msgSend(v26, "mode");
      v40 = -0.333333333;
      if (v39 == 1)
        v40 = -1.0;
      objc_msgSend(v7, "setBaselineOffset:", v40);
    }
    goto LABEL_31;
  }
  objc_msgSend(v7, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "chargingDisplayIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16 == v17)
  {
    if (objc_msgSend(v7, "isEnabled"))
      v42 = objc_msgSend(v10, "state") == 1;
    else
      v42 = 0;
    objc_msgSend(v7, "setEnabled:", v42);
    if (objc_msgSend(v7, "isEnabled"))
    {
      -[_UIStatusBarBatteryItem chargingView](self, "chargingView");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "image");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v44)
      {
        +[_UIStatusBarImageProvider sharedProvider](_UIStatusBarImageProvider, "sharedProvider");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "styleAttributes");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "imageNamed:styleAttributes:", CFSTR("Large_Bolt"), v26);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIStatusBarBatteryItem chargingView](self, "chargingView");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setImage:", v45);

        goto LABEL_31;
      }
    }
  }
  else
  {
    objc_msgSend(v7, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "percentDisplayIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18 == v19)
    {
      objc_msgSend(v10, "detailString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "styleAttributes");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "mode") != 1)
      {
        v22 = objc_msgSend(v10, "prominentlyShowsDetailString");

        if ((v22 & 1) != 0)
        {
LABEL_9:
          if (objc_msgSend(v20, "length"))
          {
            -[_UIStatusBarBatteryItem percentView](self, "percentView");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setText:", v20);

          }
          else
          {
            objc_msgSend(v7, "setEnabled:", 0);
          }
          if (!objc_msgSend(v6, "styleAttributesChanged"))
            goto LABEL_32;
          objc_msgSend(v6, "styleAttributes");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "effectiveLayoutDirection");

          if (v49 == 1)
            v50 = 2.0;
          else
            v50 = 0.0;
          if (v49 == 1)
            v51 = 0.0;
          else
            v51 = 2.0;
          -[_UIStatusBarBatteryItem percentView](self, "percentView");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setAlignmentRectInsets:", 0.0, v50, 0.0, v51);
LABEL_31:

LABEL_32:
          goto LABEL_33;
        }
        v21 = v20;
        v20 = 0;
      }

      goto LABEL_9;
    }
  }
LABEL_33:

  return v8;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  double v5;
  double v6;
  id v7;

  if (self->_highlighted != a3)
  {
    v3 = a3;
    self->_highlighted = a3;
    -[_UIStatusBarBatteryItem batteryView](self, "batteryView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v4;
    v5 = 0.4;
    if (v3)
    {
      v5 = 0.8;
      v6 = 0.9;
    }
    else
    {
      v6 = 0.5;
    }
    objc_msgSend(v4, "setBodyColorAlpha:", v5);
    objc_msgSend(v7, "setPinColorAlpha:", v6);
    objc_msgSend(v7, "setShowsInlineChargingIndicator:", !v3);

  }
}

- (_UIStatusBarBatteryView)batteryView
{
  _UIStatusBarBatteryView *batteryView;

  batteryView = self->_batteryView;
  if (!batteryView)
  {
    -[_UIStatusBarBatteryItem _create_batteryView](self, "_create_batteryView");
    batteryView = self->_batteryView;
  }
  return batteryView;
}

- (void)_create_batteryView
{
  _UIStatusBarBatteryView *v3;
  _UIStatusBarBatteryView *v4;
  _UIStatusBarBatteryView *batteryView;

  v3 = [_UIStatusBarBatteryView alloc];
  v4 = -[_UIStatusBarBatteryView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  batteryView = self->_batteryView;
  self->_batteryView = v4;

  -[_UIStatusBarBatteryView setInternalSizeCategory:](self->_batteryView, "setInternalSizeCategory:", 0);
  -[_UIStatusBarBatteryView setShowsInlineChargingIndicator:](self->_batteryView, "setShowsInlineChargingIndicator:", 1);
}

- (_UIStatusBarStaticBatteryView)staticBatteryView
{
  _UIStatusBarStaticBatteryView *staticBatteryView;

  staticBatteryView = self->_staticBatteryView;
  if (!staticBatteryView)
  {
    -[_UIStatusBarBatteryItem _create_staticBatteryView](self, "_create_staticBatteryView");
    staticBatteryView = self->_staticBatteryView;
  }
  return staticBatteryView;
}

- (void)_create_staticBatteryView
{
  _UIStatusBarStaticBatteryView *v3;
  _UIStatusBarStaticBatteryView *v4;
  _UIStatusBarStaticBatteryView *staticBatteryView;

  v3 = [_UIStatusBarStaticBatteryView alloc];
  v4 = -[_UIStatusBarBatteryView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  staticBatteryView = self->_staticBatteryView;
  self->_staticBatteryView = v4;

  -[_UIStatusBarBatteryView setInternalSizeCategory:](self->_staticBatteryView, "setInternalSizeCategory:", 0);
  -[_UIStatusBarBatteryView setShowsInlineChargingIndicator:](self->_staticBatteryView, "setShowsInlineChargingIndicator:", 1);
}

- (_UIStatusBarImageView)chargingView
{
  _UIStatusBarImageView *chargingView;

  chargingView = self->_chargingView;
  if (!chargingView)
  {
    -[_UIStatusBarBatteryItem _create_chargingView](self, "_create_chargingView");
    chargingView = self->_chargingView;
  }
  return chargingView;
}

- (void)_create_chargingView
{
  _UIStatusBarImageView *v3;
  _UIStatusBarImageView *v4;
  _UIStatusBarImageView *chargingView;
  id v6;

  v3 = [_UIStatusBarImageView alloc];
  v4 = -[_UIStatusBarImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  chargingView = self->_chargingView;
  self->_chargingView = v4;

  +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", CFSTR("Black_lightning"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarImageView setAccessibilityHUDImage:](self->_chargingView, "setAccessibilityHUDImage:", v6);

}

- (_UIStatusBarStringView)percentView
{
  _UIStatusBarStringView *percentView;

  percentView = self->_percentView;
  if (!percentView)
  {
    -[_UIStatusBarBatteryItem _create_percentView](self, "_create_percentView");
    percentView = self->_percentView;
  }
  return percentView;
}

- (void)_create_percentView
{
  _UIStatusBarStringView *v3;
  _UIStatusBarStringView *v4;
  _UIStatusBarStringView *percentView;

  v3 = [_UIStatusBarStringView alloc];
  v4 = -[_UIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  percentView = self->_percentView;
  self->_percentView = v4;

}

- (id)viewForIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "iconDisplayIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[_UIStatusBarBatteryItem batteryView](self, "batteryView");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "staticIconDisplayIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v4)
    {
      -[_UIStatusBarBatteryItem staticBatteryView](self, "staticBatteryView");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "chargingDisplayIdentifier");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (v7 == v4)
      {
        -[_UIStatusBarBatteryItem chargingView](self, "chargingView");
        v9 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "percentDisplayIdentifier");
        v8 = (id)objc_claimAutoreleasedReturnValue();

        if (v8 == v4)
        {
          -[_UIStatusBarBatteryItem percentView](self, "percentView");
          v9 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v12.receiver = self;
          v12.super_class = (Class)_UIStatusBarBatteryItem;
          -[_UIStatusBarItem viewForIdentifier:](&v12, sel_viewForIdentifier_, v4);
          v9 = objc_claimAutoreleasedReturnValue();
        }
      }
    }
  }
  v10 = (void *)v9;

  return v10;
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (BOOL)usesCondensedPercentageDisplay
{
  return self->_usesCondensedPercentageDisplay;
}

- (void)setUsesCondensedPercentageDisplay:(BOOL)a3
{
  self->_usesCondensedPercentageDisplay = a3;
}

- (void)setBatteryView:(id)a3
{
  objc_storeStrong((id *)&self->_batteryView, a3);
}

- (void)setStaticBatteryView:(id)a3
{
  objc_storeStrong((id *)&self->_staticBatteryView, a3);
}

- (void)setChargingView:(id)a3
{
  objc_storeStrong((id *)&self->_chargingView, a3);
}

- (void)setPercentView:(id)a3
{
  objc_storeStrong((id *)&self->_percentView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_percentView, 0);
  objc_storeStrong((id *)&self->_chargingView, 0);
  objc_storeStrong((id *)&self->_staticBatteryView, 0);
  objc_storeStrong((id *)&self->_batteryView, 0);
}

@end
