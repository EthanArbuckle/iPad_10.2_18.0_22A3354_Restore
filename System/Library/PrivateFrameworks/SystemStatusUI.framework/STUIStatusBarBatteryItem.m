@implementation STUIStatusBarBatteryItem

+ (STUIStatusBarIdentifier)iconDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("iconDisplayIdentifier"));
}

+ (STUIStatusBarIdentifier)staticIconDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("staticIconDisplayIdentifier"));
}

- (id)dependentEntryKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0DB0D00]);
}

- (void)setUsesCondensedPercentageDisplay:(BOOL)a3
{
  self->_usesCondensedPercentageDisplay = a3;
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
    -[STUIStatusBarBatteryItem batteryView](self, "batteryView");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "staticIconDisplayIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v4)
    {
      -[STUIStatusBarBatteryItem staticBatteryView](self, "staticBatteryView");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "chargingDisplayIdentifier");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (v7 == v4)
      {
        -[STUIStatusBarBatteryItem chargingView](self, "chargingView");
        v9 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "percentDisplayIdentifier");
        v8 = (id)objc_claimAutoreleasedReturnValue();

        if (v8 == v4)
        {
          -[STUIStatusBarBatteryItem percentView](self, "percentView");
          v9 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v12.receiver = self;
          v12.super_class = (Class)STUIStatusBarBatteryItem;
          -[STUIStatusBarItem viewForIdentifier:](&v12, sel_viewForIdentifier_, v4);
          v9 = objc_claimAutoreleasedReturnValue();
        }
      }
    }
  }
  v10 = (void *)v9;

  return v10;
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
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  uint64_t v54;
  objc_super v55;

  v6 = a3;
  v7 = a4;
  v55.receiver = self;
  v55.super_class = (Class)STUIStatusBarBatteryItem;
  -[STUIStatusBarItem applyUpdate:toDisplayItem:](&v55, sel_applyUpdate_toDisplayItem_, v6, v7);
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

LABEL_12:
    objc_msgSend(v7, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "iconDisplayIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24 == v25)
      -[STUIStatusBarBatteryItem batteryView](self, "batteryView");
    else
      -[STUIStatusBarBatteryItem staticBatteryView](self, "staticBatteryView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "styleAttributes");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "dataChanged"))
    {
LABEL_26:
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
      goto LABEL_32;
    }
    v27 = objc_msgSend(v10, "capacity");
    if ((double)v27 / 100.0 <= 0.01)
      v28 = 0.0;
    else
      v28 = (double)v27 / 100.0;
    v29 = objc_msgSend(v10, "state");
    if (v29 <= 3)
      objc_msgSend(v20, "setChargingState:", qword_1CFEBF868[v29]);
    if (-[STUIStatusBarBatteryItem usesCondensedPercentageDisplay](self, "usesCondensedPercentageDisplay")
      && objc_msgSend(v26, "mode") != 1)
    {
      if (!objc_msgSend(v10, "prominentlyShowsDetailString"))
      {
        +[STUIStatusBarSettingsDomain rootSettings](STUIStatusBarSettingsDomain, "rootSettings");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "itemSettings");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setShowsPercentage:", objc_msgSend(v48, "batteryCondensedPercentageForceEnabled"));

        goto LABEL_25;
      }
      v30 = 1;
    }
    else
    {
      v30 = 0;
    }
    objc_msgSend(v20, "setShowsPercentage:", v30);
LABEL_25:
    objc_msgSend(v20, "setChargePercent:", v28);
    objc_msgSend(v20, "setSaverModeActive:", objc_msgSend(v10, "saverModeActive"));
    goto LABEL_26;
  }
  v13 = (void *)v12;
  objc_msgSend(v7, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "staticIconDisplayIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 == v15)
    goto LABEL_12;
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
      -[STUIStatusBarBatteryItem chargingView](self, "chargingView");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "image");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v44)
      {
        +[STUIStatusBarImageProvider sharedProvider](STUIStatusBarImageProvider, "sharedProvider");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "styleAttributes");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "imageNamed:styleAttributes:", CFSTR("Large_Bolt"), v26);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[STUIStatusBarBatteryItem chargingView](self, "chargingView");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setImage:", v45);

        goto LABEL_32;
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
            -[STUIStatusBarBatteryItem percentView](self, "percentView");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setText:", v20);

          }
          else
          {
            objc_msgSend(v7, "setEnabled:", 0);
          }
          if (!objc_msgSend(v6, "styleAttributesChanged"))
            goto LABEL_33;
          v49 = *MEMORY[0x1E0DC49E8];
          v50 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
          v51 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
          v52 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
          objc_msgSend(v6, "styleAttributes");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v53, "effectiveLayoutDirection");

          if (v54 == 1)
            v50 = 2.0;
          else
            v52 = 2.0;
          -[STUIStatusBarBatteryItem percentView](self, "percentView");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setAlignmentRectInsets:", v49, v50, v51, v52);
LABEL_32:

LABEL_33:
          goto LABEL_34;
        }
        v21 = v20;
        v20 = 0;
      }

      goto LABEL_9;
    }
  }
LABEL_34:

  return v8;
}

- (STUIStatusBarStaticBatteryView)staticBatteryView
{
  STUIStatusBarStaticBatteryView *staticBatteryView;

  staticBatteryView = self->_staticBatteryView;
  if (!staticBatteryView)
  {
    -[STUIStatusBarBatteryItem _create_staticBatteryView](self, "_create_staticBatteryView");
    staticBatteryView = self->_staticBatteryView;
  }
  return staticBatteryView;
}

- (BOOL)usesCondensedPercentageDisplay
{
  return self->_usesCondensedPercentageDisplay;
}

- (void)_create_staticBatteryView
{
  STUIStatusBarStaticBatteryView *v3;
  STUIStatusBarStaticBatteryView *v4;
  STUIStatusBarStaticBatteryView *staticBatteryView;

  v3 = [STUIStatusBarStaticBatteryView alloc];
  v4 = -[_UIBatteryView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  staticBatteryView = self->_staticBatteryView;
  self->_staticBatteryView = v4;

  -[_UIBatteryView setInternalSizeCategory:](self->_staticBatteryView, "setInternalSizeCategory:", 0);
  -[_UIBatteryView setShowsInlineChargingIndicator:](self->_staticBatteryView, "setShowsInlineChargingIndicator:", 1);
}

- (STUIStatusBarStringView)percentView
{
  STUIStatusBarStringView *percentView;

  percentView = self->_percentView;
  if (!percentView)
  {
    -[STUIStatusBarBatteryItem _create_percentView](self, "_create_percentView");
    percentView = self->_percentView;
  }
  return percentView;
}

- (void)_create_percentView
{
  STUIStatusBarStringView *v3;
  STUIStatusBarStringView *v4;
  STUIStatusBarStringView *percentView;

  v3 = [STUIStatusBarStringView alloc];
  v4 = -[STUIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  percentView = self->_percentView;
  self->_percentView = v4;

}

+ (STUIStatusBarIdentifier)percentDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("percentDisplayIdentifier"));
}

+ (STUIStatusBarIdentifier)chargingDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("chargingDisplayIdentifier"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_percentView, 0);
  objc_storeStrong((id *)&self->_chargingView, 0);
  objc_storeStrong((id *)&self->_staticBatteryView, 0);
  objc_storeStrong((id *)&self->_batteryView, 0);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  double v4;
  id v5;

  if (self->_highlighted != a3)
  {
    v3 = a3;
    self->_highlighted = a3;
    -[STUIStatusBarBatteryItem batteryView](self, "batteryView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(v5, "setBodyColorAlpha:", 0.8);
      v4 = 0.9;
    }
    else
    {
      objc_msgSend(v5, "setBodyColorAlpha:", *MEMORY[0x1E0DC5778]);
      v4 = *MEMORY[0x1E0DC5780];
    }
    objc_msgSend(v5, "setPinColorAlpha:", v4);
    objc_msgSend(v5, "setShowsInlineChargingIndicator:", !v3);

  }
}

- (STUIStatusBarBatteryView)batteryView
{
  STUIStatusBarBatteryView *batteryView;

  batteryView = self->_batteryView;
  if (!batteryView)
  {
    -[STUIStatusBarBatteryItem _create_batteryView](self, "_create_batteryView");
    batteryView = self->_batteryView;
  }
  return batteryView;
}

- (void)_create_batteryView
{
  STUIStatusBarBatteryView *v3;
  STUIStatusBarBatteryView *v4;
  STUIStatusBarBatteryView *batteryView;

  v3 = [STUIStatusBarBatteryView alloc];
  v4 = -[_UIBatteryView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  batteryView = self->_batteryView;
  self->_batteryView = v4;

  -[_UIBatteryView setInternalSizeCategory:](self->_batteryView, "setInternalSizeCategory:", 0);
  -[_UIBatteryView setShowsInlineChargingIndicator:](self->_batteryView, "setShowsInlineChargingIndicator:", 1);
}

- (STUIStatusBarImageView)chargingView
{
  STUIStatusBarImageView *chargingView;

  chargingView = self->_chargingView;
  if (!chargingView)
  {
    -[STUIStatusBarBatteryItem _create_chargingView](self, "_create_chargingView");
    chargingView = self->_chargingView;
  }
  return chargingView;
}

- (void)_create_chargingView
{
  STUIStatusBarImageView *v3;
  STUIStatusBarImageView *v4;
  STUIStatusBarImageView *chargingView;
  id v6;

  v3 = [STUIStatusBarImageView alloc];
  v4 = -[STUIStatusBarImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  chargingView = self->_chargingView;
  self->_chargingView = v4;

  objc_msgSend(MEMORY[0x1E0DC3870], "kitImageNamed:", CFSTR("Black_lightning"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarImageView setAccessibilityHUDImage:](self->_chargingView, "setAccessibilityHUDImage:", v6);

}

- (BOOL)highlighted
{
  return self->_highlighted;
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

@end
