@implementation PUIStylePickerViewController

- (PUIStylePickerViewController)initWithStylePickerConfiguration:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  PUIStylePickerViewController *v8;
  double v9;
  uint64_t v10;
  PUIStylePickerConfiguration *stylePickerConfiguration;
  uint64_t v12;
  NSHashTable *observers;
  PUIStylePickerViewController *v14;
  PUIStylePickerViewController *result;
  void *v16;
  objc_super v17;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "components");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "numberOfComponents"))
    {
      v17.receiver = self;
      v17.super_class = (Class)PUIStylePickerViewController;
      v8 = -[PUIStylePickerViewController initWithNibName:bundle:](&v17, sel_initWithNibName_bundle_, 0, 0);
      if (v8)
      {
        objc_msgSend(v6, "defaultContentsLuminance");
        v8->_contentsLuminance = v9;
        v10 = objc_msgSend(v6, "copy");
        stylePickerConfiguration = v8->_stylePickerConfiguration;
        v8->_stylePickerConfiguration = (PUIStylePickerConfiguration *)v10;

        objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
        v12 = objc_claimAutoreleasedReturnValue();
        observers = v8->_observers;
        v8->_observers = (NSHashTable *)v12;

      }
      self = v8;
      v14 = self;
    }
    else
    {
      v14 = 0;
    }

    return v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("stylePickerConfiguration"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIStylePickerViewController initWithStylePickerConfiguration:].cold.1(a2, (uint64_t)self, (uint64_t)v16);
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    result = (PUIStylePickerViewController *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (PUIStylePickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v5;
  PUIStylePickerViewController *v6;

  +[PUIStylePickerConfiguration defaultStylePickerConfigurationForRole:](PUIStylePickerConfiguration, "defaultStylePickerConfigurationForRole:", *MEMORY[0x24BE74D68], a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PUIStylePickerViewController initWithStylePickerConfiguration:](self, "initWithStylePickerConfiguration:", v5);

  return v6;
}

- (PUIStylePickerViewController)initWithComponents:(id)a3 previewTextString:(id)a4
{
  id v6;
  id v7;
  PUIStylePickerConfiguration *v8;
  PUIStylePickerConfiguration *v9;
  PUIStylePickerViewController *v10;

  v6 = a4;
  v7 = a3;
  v8 = [PUIStylePickerConfiguration alloc];
  v9 = -[PUIStylePickerConfiguration initWithPreviewTextString:defaultRole:components:defaultContentsLuminance:styleConfiguration:textLayoutConfiguration:](v8, "initWithPreviewTextString:defaultRole:components:defaultContentsLuminance:styleConfiguration:textLayoutConfiguration:", v6, *MEMORY[0x24BE74D68], v7, 0, 0, 0.5);

  v10 = -[PUIStylePickerViewController initWithStylePickerConfiguration:](self, "initWithStylePickerConfiguration:", v9);
  return v10;
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUIStylePickerViewController;
  -[PUIStylePickerViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[PUIStylePickerViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
}

- (void)viewSafeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUIStylePickerViewController;
  -[PUIStylePickerViewController viewSafeAreaInsetsDidChange](&v3, sel_viewSafeAreaInsetsDidChange);
  -[PUIStylePickerViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
}

- (void)viewLayoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUIStylePickerViewController;
  -[PUIStylePickerViewController viewLayoutMarginsDidChange](&v3, sel_viewLayoutMarginsDidChange);
  -[PUIStylePickerViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
}

- (void)_updatePreferredContentSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  -[PUIStylePickerViewController navigationController](self, "navigationController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v9, "navigationBar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    v5 = v4;

    -[PUIStylePickerViewController rootStackView](self, "rootStackView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    objc_msgSend(v9, "setPreferredContentSize:", v8, v5 + v7 + -15.0);

  }
  -[PUIStylePickerViewController _notifyObserversOfChangedDesiredDetent](self, "_notifyObserversOfChangedDesiredDetent");

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUIStylePickerViewController;
  -[PUIStylePickerViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  self->_hasNotifiedDelegateOfDismissal = 0;
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUIStylePickerViewController;
  -[PUIStylePickerViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[PUIStylePickerViewController _signalDelegateWillFinish](self, "_signalDelegateWillFinish");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUIStylePickerViewController;
  -[PUIStylePickerViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  if (!self->_hasNotifiedDelegateOfDismissal)
    -[PUIStylePickerViewController _signalDelegateDidFinish](self, "_signalDelegateDidFinish");
}

- (void)loadView
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id location;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  -[PUIStylePickerViewController _setupComponentViewControllersIfNeeded](self, "_setupComponentViewControllersIfNeeded");
  -[PUIStylePickerViewController rootStackView](self, "rootStackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6DD0]);
    v3 = (void *)objc_msgSend(v4, "initWithArrangedSubviews:", MEMORY[0x24BDBD1A8]);
    objc_msgSend(v3, "setAxis:", 1);
    objc_msgSend(v3, "setSpacing:", 48.0);
    objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUIStylePickerViewController setRootStackView:](self, "setRootStackView:", v3);
  }
  -[PUIStylePickerViewController backgroundView](self, "backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDF6FC8]);
    objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v6, "initWithEffect:", v7);

    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUIStylePickerViewController setBackgroundView:](self, "setBackgroundView:", v5);
  }
  if (!-[PUIStylePickerViewController isViewLoaded](self, "isViewLoaded")
    || (-[PUIStylePickerViewController view](self, "view"), (v8 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v8 = objc_alloc_init(MEMORY[0x24BDF6F90]);
    -[PUIStylePickerViewController setView:](self, "setView:", v8);
  }
  objc_msgSend(v8, "addSubview:", v5);
  objc_msgSend(v8, "addSubview:", v3);
  -[PUIStylePickerViewController _updateViews](self, "_updateViews");
  -[PUIStylePickerViewController _refreshComponentViewControllers](self, "_refreshComponentViewControllers");
  -[PUIStylePickerViewController _refreshBarButtonItems](self, "_refreshBarButtonItems");
  objc_initWeak(&location, self);
  objc_opt_self();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __40__PUIStylePickerViewController_loadView__block_invoke;
  v12[3] = &unk_25154BCF8;
  objc_copyWeak(&v13, &location);
  v11 = (id)-[PUIStylePickerViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v10, v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __40__PUIStylePickerViewController_loadView__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "numberSystemBarItem");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberingSystemPickerMenuController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "menu");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setMenu:", v4);

    WeakRetained = v5;
  }

}

- (double)desiredDetent
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  _BOOL4 v18;
  double v19;
  void *v20;
  double v21;
  uint64_t v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;

  -[PUIStylePickerViewController _refreshComponentViewControllers](self, "_refreshComponentViewControllers");
  -[PUIStylePickerViewController additionalSafeAreaInsets](self, "additionalSafeAreaInsets");
  v4 = v3;
  v6 = v5;
  -[PUIStylePickerViewController stylePickerConfiguration](self, "stylePickerConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "components");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "containsComponent:", 1))
  {
    -[PUIStylePickerViewController fontPickerComponentViewController](self, "fontPickerComponentViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 != 0;

  }
  else
  {
    v10 = 0;
  }
  if (objc_msgSend(v8, "containsComponent:", 8))
  {
    -[PUIStylePickerViewController textLayoutPickerComponentViewController](self, "textLayoutPickerComponentViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11 != 0;

  }
  else
  {
    v12 = 0;
  }
  if (objc_msgSend(v8, "containsComponent:", 4))
  {
    -[PUIStylePickerViewController stylePickerComponentViewController](self, "stylePickerComponentViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 != 0;

  }
  else
  {
    v14 = 0;
  }
  if (objc_msgSend(v8, "containsComponent:", 2))
  {
    -[PUIStylePickerViewController numberingSystemPickerComponentViewController](self, "numberingSystemPickerComponentViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15 != 0;

  }
  else
  {
    v16 = 0;
  }
  if (objc_msgSend(v8, "containsComponent:", 32))
  {
    -[PUIStylePickerViewController homeScreenComponentViewController](self, "homeScreenComponentViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17 != 0;

  }
  else
  {
    v18 = 0;
  }
  v19 = v4 + v6;
  if (v16)
  {
    -[PUIStylePickerViewController numberingSystemPickerComponentViewController](self, "numberingSystemPickerComponentViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "estimatedHeight");
    v19 = v19 + v21;

    v22 = 1;
    if (!v10)
      goto LABEL_22;
  }
  else
  {
    v22 = 0;
    if (!v10)
      goto LABEL_22;
  }
  -[PUIStylePickerViewController fontPickerComponentViewController](self, "fontPickerComponentViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "estimatedHeight");
  v19 = v19 + v24;

  ++v22;
  if (v14)
    v19 = v19 + 48.0;
LABEL_22:
  if (!v12)
  {
    if (!v14)
      goto LABEL_24;
LABEL_33:
    -[PUIStylePickerViewController stylePickerComponentViewController](self, "stylePickerComponentViewController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "estimatedHeight");
    v19 = v19 + v36;

    ++v22;
    if (!v18)
      goto LABEL_26;
    goto LABEL_25;
  }
  -[PUIStylePickerViewController textLayoutPickerComponentViewController](self, "textLayoutPickerComponentViewController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "estimatedHeight");
  v19 = v19 + v34;

  ++v22;
  if (v14)
    goto LABEL_33;
LABEL_24:
  if (v18)
  {
LABEL_25:
    -[PUIStylePickerViewController homeScreenComponentViewController](self, "homeScreenComponentViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "estimatedHeight");
    v19 = v19 + v26;

    v22 = 1;
  }
LABEL_26:
  -[PUIStylePickerViewController navigationController](self, "navigationController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "edgeInsets");
  if (v31 == *(double *)(MEMORY[0x24BDF65E8] + 8)
    && v28 == *MEMORY[0x24BDF65E8]
    && v30 == *(double *)(MEMORY[0x24BDF65E8] + 24))
  {
    v32 = v28 + v29;
    if (v29 == *(double *)(MEMORY[0x24BDF65E8] + 16))
      v32 = -0.0;
  }
  else
  {
    v32 = v28 + v29;
  }
  v37 = v19 + 100.0;
  if (v22)
    v37 = v19;
  if (v27)
    v37 = v37 + 44.0;
  v38 = v37 + v32;

  return v38;
}

- (BOOL)_shouldShowWeightSliderForSelectedFont
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;

  -[PUIStylePickerViewController stylePickerConfiguration](self, "stylePickerConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLayoutConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fontConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUIStylePickerViewController extensionBundleURL](self, "extensionBundleURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "PUIFontWithExtensionBundleURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isSystemItem"))
  {
    objc_msgSend(v7, "fontIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", CFSTR("PRTimeFontIdentifierRail")) ^ 1;

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (void)setContentsLuminance:(double)a3
{
  void *v5;
  id v6;

  if ((BSEqualDoubles() & 1) == 0)
  {
    self->_contentsLuminance = a3;
    -[PUIStylePickerViewController stylePickerComponentViewController](self, "stylePickerComponentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[PUIStylePickerViewController stylePickerComponentViewController](self, "stylePickerComponentViewController");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setContentsLuminance:", a3);

    }
  }
}

- (void)setTrailingBarButtonItems:(id)a3
{
  NSArray *v4;
  NSArray *trailingBarButtonItems;
  id v6;

  v6 = a3;
  if ((-[NSArray isEqual:](self->_trailingBarButtonItems, "isEqual:") & 1) == 0)
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    trailingBarButtonItems = self->_trailingBarButtonItems;
    self->_trailingBarButtonItems = v4;

    -[PUIStylePickerViewController _refreshBarButtonItems](self, "_refreshBarButtonItems");
  }

}

- (void)setLeadingBarButtonItems:(id)a3
{
  NSArray *v4;
  NSArray *leadingBarButtonItems;
  id v6;

  v6 = a3;
  if ((-[NSArray isEqual:](self->_leadingBarButtonItems, "isEqual:") & 1) == 0)
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    leadingBarButtonItems = self->_leadingBarButtonItems;
    self->_leadingBarButtonItems = v4;

    -[PUIStylePickerViewController _refreshBarButtonItems](self, "_refreshBarButtonItems");
  }

}

- (void)setCenterBarButtonItems:(id)a3
{
  NSArray *v4;
  NSArray *centerBarButtonItems;
  id v6;

  v6 = a3;
  if ((-[NSArray isEqual:](self->_centerBarButtonItems, "isEqual:") & 1) == 0)
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    centerBarButtonItems = self->_centerBarButtonItems;
    self->_centerBarButtonItems = v4;

    -[PUIStylePickerViewController _refreshBarButtonItems](self, "_refreshBarButtonItems");
  }

}

- (void)fontPickerComponentViewController:(id)a3 didChangeFontWeight:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  double v16;

  -[PUIStylePickerViewController stylePickerConfiguration](self, "stylePickerConfiguration", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textLayoutConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fontConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIStylePickerViewController extensionBundleURL](self, "extensionBundleURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "PUIFontWithExtensionBundleURL:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "defaultRole");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "effectiveFontForRole:ignoringWeight:", v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __86__PUIStylePickerViewController_fontPickerComponentViewController_didChangeFontWeight___block_invoke;
  v14[3] = &unk_25154CEC0;
  v15 = v12;
  v16 = a4;
  v13 = v12;
  -[PUIStylePickerViewController _notifyChangeHandlersOfChange:](self, "_notifyChangeHandlersOfChange:", v14);

}

void __86__PUIStylePickerViewController_fontPickerComponentViewController_didChangeFontWeight___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  unint64_t v5;
  unint64_t v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "pui_variantWeightRange");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 40) * (double)v6 + (1.0 - *(double *)(a1 + 40)) * (double)v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFontWeight:", v7);

}

- (void)fontPickerComponentViewController:(id)a3 didSelectItem:(id)a4
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
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  -[PUIStylePickerViewController stylePickerConfiguration](self, "stylePickerConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "defaultRole");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIStylePickerViewController numberingSystemPickerMenuController](self, "numberingSystemPickerMenuController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIStylePickerViewController numberSystemBarItem](self, "numberSystemBarItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "font");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "effectiveFontForRole:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setFont:", v13);
  -[PUIStylePickerViewController numberingSystemPickerMenuController](self, "numberingSystemPickerMenuController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "menu");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setMenu:", v15);
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __80__PUIStylePickerViewController_fontPickerComponentViewController_didSelectItem___block_invoke;
  v19[3] = &unk_25154CEE8;
  v19[4] = self;
  v20 = v7;
  v21 = v13;
  v22 = v6;
  v16 = v6;
  v17 = v13;
  v18 = v7;
  -[PUIStylePickerViewController _notifyChangeHandlersOfChange:](self, "_notifyChangeHandlersOfChange:", v19);

}

void __80__PUIStylePickerViewController_fontPickerComponentViewController_didSelectItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  id v17;
  void *v18;
  void *v19;
  __CFString *v20;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "additionalFonts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  objc_msgSend(*(id *)(a1 + 40), "font");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fontIdentifier");
  v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if ((v7 & 1) != 0 || v20 == CFSTR("PRTimeFontIdentifierRail"))
  {
    objc_msgSend(*(id *)(a1 + 40), "font");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "weight");
    v13 = v16;

    if (!v7)
      goto LABEL_4;
LABEL_6:
    v14 = *(void **)(a1 + 48);
    goto LABEL_7;
  }
  v9 = objc_msgSend(*(id *)(a1 + 48), "pui_variantWeightRange");
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 56), "fontWeight");
  v13 = v12 * (double)v11 + (1.0 - v12) * (double)v9;
  if (v7)
    goto LABEL_6;
LABEL_4:
  v14 = 0;
LABEL_7:
  v17 = v14;
  objc_msgSend(v4, "setFontIdentifier:", v20);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFontWeight:", v18);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isSystemItem"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSystemItem:", v19);

  objc_msgSend(v4, "setCustomFont:", v17);
}

- (void)textLayoutPickerComponentViewController:(id)a3 didSelectTextLayout:(unint64_t)a4 userSelected:(BOOL)a5
{
  unint64_t v5;
  void *v7;
  void *v8;
  unint64_t v9;
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
  _QWORD v23[5];

  v5 = a4;
  -[PUIStylePickerViewController stylePickerConfiguration](self, "stylePickerConfiguration", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "previewTextString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = +[PUITextLayoutConfiguration maximumVerticalTextCharacters](PUITextLayoutConfiguration, "maximumVerticalTextCharacters");
  if (PUITextLayoutIsVertical(v5) && objc_msgSend(v8, "length") > v9)
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    PUIBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CANNOT_CHANGE_LAYOUT_EXPLANATION"), &stru_25154D128, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v12, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x24BDF67F0];
    PUIBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("CANNOT_CHANGE_LAYOUT"), &stru_25154D128, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "alertControllerWithTitle:message:preferredStyle:", v16, v13, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x24BDF67E8];
    PUIBundle();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("CANNOT_CHANGE_LAYOUT_DISMISS_ACTION"), &stru_25154D128, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "actionWithTitle:style:handler:", v20, 0, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "addAction:", v21);
    -[PUIStylePickerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);

    v5 = 0;
  }
  -[PUIStylePickerViewController textLayoutPickerComponentViewController](self, "textLayoutPickerComponentViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setSelectedLayout:", v5);

  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __105__PUIStylePickerViewController_textLayoutPickerComponentViewController_didSelectTextLayout_userSelected___block_invoke;
  v23[3] = &__block_descriptor_40_e39_v16__0__PUIStylePickerSelectionChange_8l;
  v23[4] = v5;
  -[PUIStylePickerViewController _notifyChangeHandlersOfChange:](self, "_notifyChangeHandlersOfChange:", v23);

}

void __105__PUIStylePickerViewController_textLayoutPickerComponentViewController_didSelectTextLayout_userSelected___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x24BDD16E0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "numberWithUnsignedInteger:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreferredLayout:", v5);

}

- (void)numberingSystemPickerMenuController:(id)a3 didSelectNumberingSystem:(id)a4
{
  -[PUIStylePickerViewController _notifyClientsOfChangedNumberingSystem:](self, "_notifyClientsOfChangedNumberingSystem:", a4);
}

- (void)numberingSystemPickerViewController:(id)a3 didSelectNumberingSystem:(id)a4
{
  -[PUIStylePickerViewController _notifyClientsOfChangedNumberingSystem:](self, "_notifyClientsOfChangedNumberingSystem:", a4);
}

- (void)stylePickerComponentViewController:(id)a3 didSelectStyle:(id)a4 isSuggestedStyle:(BOOL)a5 userSelected:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  BOOL v13;

  v6 = a6;
  v9 = a4;
  v10 = v9;
  if (v6)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __112__PUIStylePickerViewController_stylePickerComponentViewController_didSelectStyle_isSuggestedStyle_userSelected___block_invoke;
    v11[3] = &unk_25154CF30;
    v12 = v9;
    v13 = a5;
    -[PUIStylePickerViewController _notifyChangeHandlersOfChange:](self, "_notifyChangeHandlersOfChange:", v11);

  }
}

void __112__PUIStylePickerViewController_stylePickerComponentViewController_didSelectStyle_isSuggestedStyle_userSelected___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setStyle:", v3);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSuggestedStyle:", v5);

}

- (id)stylePickerComponentViewController:(id)a3 coordinatorForStyle:(id)a4 isSuggested:(BOOL)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  BOOL v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v8 = a3;
  v9 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __99__PUIStylePickerViewController_stylePickerComponentViewController_coordinatorForStyle_isSuggested___block_invoke;
  v13[3] = &unk_25154CF58;
  v15 = &v17;
  v13[4] = self;
  v10 = v9;
  v14 = v10;
  v16 = a5;
  -[PUIStylePickerViewController _notifyDelegateRespondingToSelector:handler:](self, "_notifyDelegateRespondingToSelector:handler:", sel_stylePickerViewController_coordinatorForStyle_isSuggested_, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __99__PUIStylePickerViewController_stylePickerComponentViewController_coordinatorForStyle_isSuggested___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "stylePickerViewController:coordinatorForStyle:isSuggested:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)homeScreenComponentViewController:(id)a3 didUpdateHomeScreenConfiguration:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __99__PUIStylePickerViewController_homeScreenComponentViewController_didUpdateHomeScreenConfiguration___block_invoke;
  v7[3] = &unk_25154CF80;
  v8 = v5;
  v6 = v5;
  -[PUIStylePickerViewController _notifyClientsOfPickerConfigurationUpdate:](self, "_notifyClientsOfPickerConfigurationUpdate:", v7);

}

uint64_t __99__PUIStylePickerViewController_homeScreenComponentViewController_didUpdateHomeScreenConfiguration___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHomeScreenConfiguration:", *(_QWORD *)(a1 + 32));
}

- (void)addObserver:(id)a3
{
  if (a3)
    -[NSHashTable addObject:](self->_observers, "addObject:");
}

- (void)removeObserver:(id)a3
{
  if (a3)
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
}

- (void)_notifyDelegateRespondingToSelector:(SEL)a3 handler:(id)a4
{
  void (**v5)(id, void *);
  void *v6;
  void (**v7)(id, void *);

  v5 = (void (**)(id, void *))a4;
  if (v5)
  {
    v7 = v5;
    -[PUIStylePickerViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7[2](v7, v6);

    v5 = v7;
  }

}

- (void)_notifyObserversRespondingToSelector:(SEL)a3 enumerator:(id)a4
{
  void (**v5)(id, uint64_t, char *);
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(id, uint64_t, char *))a4;
  if (v5)
  {
    -[PUIStylePickerViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0 || (v17 = 0, v5[2](v5, (uint64_t)v6, &v17), !v17))
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      -[PUIStylePickerViewController observers](self, "observers", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v14;
LABEL_6:
        v11 = 0;
        while (1)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v17 = 0;
            v5[2](v5, v12, &v17);
            if (v17)
              break;
          }
          if (v9 == ++v11)
          {
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
            if (v9)
              goto LABEL_6;
            break;
          }
        }
      }

    }
  }

}

- (void)_notifyChangeHandlersOfChange:(id)a3
{
  void (**v4)(id, PUIStylePickerSelectionChange *);
  void (**v5)(_QWORD, _QWORD);
  PUIStylePickerSelectionChange *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PUICustomFontConfiguration *v20;
  PUISystemFontConfiguration *v21;
  double v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  id v36;
  id v37;
  PUICustomFontConfiguration *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  id v49;

  v4 = (void (**)(id, PUIStylePickerSelectionChange *))a3;
  -[PUIStylePickerViewController changeHandler](self, "changeHandler");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(PUIStylePickerSelectionChange);
  v4[2](v4, v6);

  if (-[PUIStylePickerSelectionChange hasChanges](v6, "hasChanges"))
  {
    if (v5)
      ((void (**)(_QWORD, PUIStylePickerSelectionChange *))v5)[2](v5, v6);
    -[PUIStylePickerViewController stylePickerConfiguration](self, "stylePickerConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIStylePickerSelectionChange fontIdentifier](v6, "fontIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIStylePickerSelectionChange preferredAlignment](v6, "preferredAlignment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIStylePickerSelectionChange preferredLayout](v6, "preferredLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIStylePickerSelectionChange fontWeight](v6, "fontWeight");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIStylePickerSelectionChange customFont](v6, "customFont");
    v12 = objc_claimAutoreleasedReturnValue();
    -[PUIStylePickerSelectionChange numberingSystem](v6, "numberingSystem");
    v13 = objc_claimAutoreleasedReturnValue();
    -[PUIStylePickerSelectionChange isSystemItem](v6, "isSystemItem");
    v14 = objc_claimAutoreleasedReturnValue();
    v45 = (void *)v13;
    v46 = (void *)v12;
    v42 = v11;
    v43 = v10;
    v44 = (void *)v14;
    if (v9 || v10 || v13 || v8 || v11 || v12 || v14)
    {
      objc_msgSend(v7, "textLayoutConfiguration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v16, "mutableCopy");

      if (v8 || v11 || v46 || v44)
      {
        if (v46)
        {
          v38 = [PUICustomFontConfiguration alloc];
          v17 = (void *)MEMORY[0x24BDD1488];
          -[PUIStylePickerViewController extensionBundleURL](self, "extensionBundleURL");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "bundleWithURL:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[PUICustomFontConfiguration initWithFont:extensionBundle:](v38, "initWithFont:extensionBundle:", v46, v19);

          v10 = v43;
        }
        else
        {
          v21 = [PUISystemFontConfiguration alloc];
          objc_msgSend(v11, "bs_CGFloatValue");
          v20 = -[PUISystemFontConfiguration initWithFontIdentifier:weight:systemItem:](v21, "initWithFontIdentifier:weight:systemItem:", v8, objc_msgSend(v44, "BOOLValue"), v22);
        }
        objc_msgSend(v15, "setFontConfiguration:", v20);

      }
      if (v10)
        objc_msgSend(v15, "setPreferredLayout:", objc_msgSend(v10, "unsignedIntegerValue"));
      if (v9)
        objc_msgSend(v15, "setPreferredAlignment:", objc_msgSend(v9, "unsignedIntegerValue"));
      if (v45)
      {
        objc_msgSend(v45, "type");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setNumberingSystemType:", v23);

      }
    }
    else
    {
      v15 = 0;
    }
    -[PUIStylePickerSelectionChange style](v6, "style");
    v24 = objc_claimAutoreleasedReturnValue();
    -[PUIStylePickerSelectionChange isSuggestedStyle](v6, "isSuggestedStyle");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    if (!(v24 | v25))
    {
      v30 = 0;
LABEL_39:
      v47[0] = MEMORY[0x24BDAC760];
      v47[1] = 3221225472;
      v47[2] = __62__PUIStylePickerViewController__notifyChangeHandlersOfChange___block_invoke;
      v47[3] = &unk_25154CFA8;
      v48 = v30;
      v49 = v15;
      v36 = v15;
      v37 = v30;
      -[PUIStylePickerViewController _notifyClientsOfPickerConfigurationUpdate:](self, "_notifyClientsOfPickerConfigurationUpdate:", v47);

      goto LABEL_40;
    }
    v40 = v8;
    v41 = v9;
    if (v25
      && (objc_msgSend(v7, "styleConfiguration"),
          v27 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v27, "suggestedStyle"),
          v28 = (void *)objc_claimAutoreleasedReturnValue(),
          v29 = objc_msgSend(v28, "isEqual:", v24),
          v28,
          v27,
          (v29 & 1) == 0))
    {
      objc_msgSend(v7, "styleConfiguration");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v31, "mutableCopy");

      objc_msgSend(v30, "setSuggestedStyle:", v24);
      if (!v24)
      {
LABEL_35:
        v8 = v40;
        v9 = v41;
        goto LABEL_39;
      }
    }
    else
    {
      v30 = 0;
      if (!v24)
        goto LABEL_35;
    }
    objc_msgSend(v7, "styleConfiguration", v7);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "selectedStyle");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isEqual:", v24);

    if ((v34 & 1) == 0)
    {
      v7 = v39;
      v8 = v40;
      v9 = v41;
      if (!v30)
      {
        objc_msgSend(v39, "styleConfiguration");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)objc_msgSend(v35, "mutableCopy");

        v9 = v41;
      }
      objc_msgSend(v30, "setSelectedStyle:", v24);
      goto LABEL_39;
    }
    v7 = v39;
    goto LABEL_35;
  }
LABEL_40:

}

void __62__PUIStylePickerViewController__notifyChangeHandlersOfChange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v3, "setStyleConfiguration:");
    v3 = v4;
  }
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v4, "setTextLayoutConfiguration:");
    v3 = v4;
  }

}

- (void)_notifyClientsOfPickerConfigurationUpdate:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[4];
  id v33;
  PUIStylePickerViewController *v34;
  id v35;

  if (a3)
  {
    v4 = (void (**)(id, void *))a3;
    -[PUIStylePickerViewController stylePickerConfiguration](self, "stylePickerConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    v4[2](v4, v6);

    v7 = (void *)objc_opt_new();
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __74__PUIStylePickerViewController__notifyClientsOfPickerConfigurationUpdate___block_invoke;
    v32[3] = &unk_25154C198;
    v8 = v7;
    v33 = v8;
    v34 = self;
    v9 = v6;
    v35 = v9;
    v10 = (void (**)(_QWORD))MEMORY[0x2495151FC](v32);
    objc_msgSend(v5, "textLayoutConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textLayoutConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if ((v13 & 1) == 0)
    {
      v10[2](v10);
      objc_msgSend(v9, "textLayoutConfiguration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __74__PUIStylePickerViewController__notifyClientsOfPickerConfigurationUpdate___block_invoke_2;
      v30[3] = &unk_25154CFD0;
      v30[4] = self;
      v31 = v14;
      v15 = v14;
      -[PUIStylePickerViewController _notifyObserversRespondingToSelector:enumerator:](self, "_notifyObserversRespondingToSelector:enumerator:", sel_stylePickerViewController_didUpdateStyleConfiguration_, v30);

    }
    objc_msgSend(v5, "styleConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "styleConfiguration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if ((v18 & 1) == 0)
    {
      v10[2](v10);
      objc_msgSend(v9, "styleConfiguration");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __74__PUIStylePickerViewController__notifyClientsOfPickerConfigurationUpdate___block_invoke_3;
      v28[3] = &unk_25154CFD0;
      v28[4] = self;
      v29 = v19;
      v20 = v19;
      -[PUIStylePickerViewController _notifyObserversRespondingToSelector:enumerator:](self, "_notifyObserversRespondingToSelector:enumerator:", sel_stylePickerViewController_didUpdateStyleConfiguration_, v28);

    }
    objc_msgSend(v5, "homeScreenConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "homeScreenConfiguration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if ((v23 & 1) == 0)
    {
      v10[2](v10);
      objc_msgSend(v9, "homeScreenConfiguration");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __74__PUIStylePickerViewController__notifyClientsOfPickerConfigurationUpdate___block_invoke_4;
      v26[3] = &unk_25154CFF8;
      v26[4] = self;
      v27 = v24;
      v25 = v24;
      -[PUIStylePickerViewController _notifyObserversRespondingToSelector:enumerator:](self, "_notifyObserversRespondingToSelector:enumerator:", sel_stylePickerViewController_didUpdateHomeScreenConfiguration_, v26);

    }
  }
}

void __74__PUIStylePickerViewController__notifyClientsOfPickerConfigurationUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "signal"))
  {
    v2 = *(void **)(a1 + 40);
    v3 = (id)objc_msgSend(*(id *)(a1 + 48), "copy");
    objc_msgSend(v2, "setStylePickerConfiguration:", v3);

  }
}

uint64_t __74__PUIStylePickerViewController__notifyClientsOfPickerConfigurationUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stylePickerViewController:didUpdateTextLayoutConfiguration:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __74__PUIStylePickerViewController__notifyClientsOfPickerConfigurationUpdate___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stylePickerViewController:didUpdateStyleConfiguration:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __74__PUIStylePickerViewController__notifyClientsOfPickerConfigurationUpdate___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stylePickerViewController:didUpdateHomeScreenConfiguration:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_notifyObserversOfChangedDesiredDetent
{
  double v3;
  _QWORD v4[6];

  -[PUIStylePickerViewController desiredDetent](self, "desiredDetent");
  if (v3 != self->_lastNotifiedDetent)
  {
    self->_lastNotifiedDetent = v3;
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __70__PUIStylePickerViewController__notifyObserversOfChangedDesiredDetent__block_invoke;
    v4[3] = &unk_25154D020;
    v4[4] = self;
    *(double *)&v4[5] = v3;
    -[PUIStylePickerViewController _notifyDelegateRespondingToSelector:handler:](self, "_notifyDelegateRespondingToSelector:handler:", sel_stylePickerViewController_didUpdateDesiredDetent_, v4);
  }
}

uint64_t __70__PUIStylePickerViewController__notifyObserversOfChangedDesiredDetent__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stylePickerViewController:didUpdateDesiredDetent:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));
}

- (void)_closeButtonTapped:(id)a3
{
  -[PUIStylePickerViewController _signalDelegateDidFinish](self, "_signalDelegateDidFinish", a3);
  -[PUIStylePickerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_signalDelegateWillFinish
{
  _QWORD v2[5];

  self->_hasNotifiedDelegateOfImpendingDismissal = 1;
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __57__PUIStylePickerViewController__signalDelegateWillFinish__block_invoke;
  v2[3] = &unk_25154D048;
  v2[4] = self;
  -[PUIStylePickerViewController _notifyDelegateRespondingToSelector:handler:](self, "_notifyDelegateRespondingToSelector:handler:", sel_stylePickerViewControllerWillFinish_, v2);
}

uint64_t __57__PUIStylePickerViewController__signalDelegateWillFinish__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stylePickerViewControllerWillFinish:", *(_QWORD *)(a1 + 32));
}

- (void)_signalDelegateDidFinish
{
  _QWORD v3[5];

  if (!self->_hasNotifiedDelegateOfImpendingDismissal)
    -[PUIStylePickerViewController _signalDelegateWillFinish](self, "_signalDelegateWillFinish");
  self->_hasNotifiedDelegateOfDismissal = 1;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __56__PUIStylePickerViewController__signalDelegateDidFinish__block_invoke;
  v3[3] = &unk_25154D048;
  v3[4] = self;
  -[PUIStylePickerViewController _notifyDelegateRespondingToSelector:handler:](self, "_notifyDelegateRespondingToSelector:handler:", sel_stylePickerViewControllerDidFinish_, v3);
}

uint64_t __56__PUIStylePickerViewController__signalDelegateDidFinish__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stylePickerViewControllerDidFinish:", *(_QWORD *)(a1 + 32));
}

- (void)_didPressTextAlignmentBarButtonItem:(id)a3
{
  void *v4;
  uint64_t v5;
  _QWORD v6[5];

  -[PUIStylePickerViewController textAlignmentBarItem](self, "textAlignmentBarItem", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "toggle");

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __68__PUIStylePickerViewController__didPressTextAlignmentBarButtonItem___block_invoke;
  v6[3] = &__block_descriptor_40_e39_v16__0__PUIStylePickerSelectionChange_8l;
  v6[4] = v5;
  -[PUIStylePickerViewController _notifyChangeHandlersOfChange:](self, "_notifyChangeHandlersOfChange:", v6);
}

void __68__PUIStylePickerViewController__didPressTextAlignmentBarButtonItem___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x24BDD16E0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "numberWithUnsignedInteger:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreferredAlignment:", v5);

}

- (void)_notifyClientsOfChangedNumberingSystem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  if (!v4)
  {
    +[PUINumberingSystem systemDefaultNumberingSystem](PUINumberingSystem, "systemDefaultNumberingSystem");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[PUIStylePickerViewController fontPickerComponentViewController](self, "fontPickerComponentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "locale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLocale:", v6);

  }
  -[PUIStylePickerViewController numberingSystemPickerMenuController](self, "numberingSystemPickerMenuController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIStylePickerViewController numberSystemBarItem](self, "numberSystemBarItem");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7 && v8)
  {
    objc_msgSend(v7, "menu");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMenu:", v10);

  }
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __71__PUIStylePickerViewController__notifyClientsOfChangedNumberingSystem___block_invoke;
  v12[3] = &unk_25154D070;
  v13 = v4;
  v11 = v4;
  -[PUIStylePickerViewController _notifyChangeHandlersOfChange:](self, "_notifyChangeHandlersOfChange:", v12);

}

uint64_t __71__PUIStylePickerViewController__notifyClientsOfChangedNumberingSystem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setNumberingSystem:", *(_QWORD *)(a1 + 32));
}

- (void)_setupComponentViewControllersIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  unint64_t v29;
  _BOOL4 v30;
  int v31;
  PUIFontPickerComponentViewController *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unint64_t v38;
  void *v39;
  void *v40;
  unint64_t v41;
  unint64_t v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  PUITextAlignmentBarButtonItem *v48;
  int v49;
  void *v50;
  PUITextLayoutPickerComponentViewController *v51;
  void *v52;
  void *v53;
  void *v54;
  PUIStylePickerComponentViewController *v55;
  void *v56;
  void *v57;
  void *v58;
  PUINumberingSystemPickerMenuController *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  PUIStylePickerHomeScreenComponentViewController *v72;
  void *v73;
  void *v74;
  int v75;
  uint64_t v76;
  void *v77;
  int v78;
  int v79;
  uint64_t v80;
  void *v81;
  int v82;
  int v83;
  void *v84;
  int v85;
  void *v86;
  void *v87;
  id v88;
  _QWORD v89[4];
  id v90;
  id v91;
  _QWORD v92[4];
  id v93;
  id v94;
  _QWORD v95[4];
  id v96;
  _QWORD v97[4];
  id v98;
  PUIStylePickerViewController *v99;

  -[PUIStylePickerViewController stylePickerConfiguration](self, "stylePickerConfiguration");
  v88 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "components");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "defaultRole");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "previewTextString");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "styleConfiguration");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "textLayoutConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIStylePickerViewController contentsLuminance](self, "contentsLuminance");
  v8 = v7;
  v9 = objc_msgSend(v3, "containsComponent:", 2);
  v85 = objc_msgSend(v3, "containsComponent:", 4);
  v10 = objc_msgSend(v3, "containsComponent:", 1);
  v82 = objc_msgSend(v3, "containsComponent:", 16);
  v11 = objc_msgSend(v3, "containsComponent:", 8);
  v83 = objc_msgSend(v3, "containsComponent:", 32);
  -[PUIStylePickerViewController extensionBundleURL](self, "extensionBundleURL");
  v12 = objc_claimAutoreleasedReturnValue();
  v86 = (void *)v12;
  if (v12)
  {
    objc_msgSend(v6, "effectiveFontWithExtensionBundleURL:forRole:", v12, v4);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  -[PUIStylePickerViewController delegate](self, "delegate");
  v14 = objc_claimAutoreleasedReturnValue();
  v84 = (void *)v14;
  if (v10)
  {
    v15 = (void *)v14;
    v76 = v5;
    +[PUIFontPickerComponentViewController defaultItemsForRole:text:](PUIFontPickerComponentViewController, "defaultItemsForRole:text:", v4, v87);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = v11;
    v80 = v13;
    v75 = v9;
    if (v4
      && (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE74D58]) & 1) == 0
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v15, "additionalFontsForStylePickerViewController:", self);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUIStylePickerViewController setAdditionalFonts:](self, "setAdditionalFonts:", v17);
      objc_msgSend(v17, "bs_map:", &__block_literal_global_28);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "arrayByAddingObjectsFromArray:", v18);
      v19 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v19;
    }
    else
    {
      -[PUIStylePickerViewController setAdditionalFonts:](self, "setAdditionalFonts:", 0);
    }
    v20 = objc_opt_respondsToSelector();
    v21 = MEMORY[0x24BDAC760];
    if ((v20 & 1) != 0)
    {
      v97[0] = MEMORY[0x24BDAC760];
      v97[1] = 3221225472;
      v97[2] = __70__PUIStylePickerViewController__setupComponentViewControllersIfNeeded__block_invoke_2;
      v97[3] = &unk_25154D0B8;
      v98 = v15;
      v99 = self;
      objc_msgSend(v16, "bs_filter:", v97);
      v22 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v22;
    }
    objc_msgSend(v6, "fontConfiguration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "PUIFontWithExtensionBundleURL:", v86);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "customFont");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v74 = v24;
    if (v25)
    {
      objc_msgSend(v24, "customFont");
      v95[0] = v21;
      v95[1] = 3221225472;
      v95[2] = __70__PUIStylePickerViewController__setupComponentViewControllersIfNeeded__block_invoke_3;
      v95[3] = &unk_25154D0E0;
      v96 = (id)objc_claimAutoreleasedReturnValue();
      v26 = v96;
      objc_msgSend(v16, "bs_firstObjectPassingTest:", v95);
      v77 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v92[0] = v21;
      v92[1] = 3221225472;
      v92[2] = __70__PUIStylePickerViewController__setupComponentViewControllersIfNeeded__block_invoke_4;
      v92[3] = &unk_25154D0B8;
      v27 = v24;
      v93 = v27;
      v28 = v23;
      v94 = v28;
      objc_msgSend(v16, "bs_firstObjectPassingTest:", v92);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v77)
      {
        v89[0] = v21;
        v89[1] = 3221225472;
        v89[2] = __70__PUIStylePickerViewController__setupComponentViewControllersIfNeeded__block_invoke_5;
        v89[3] = &unk_25154D0B8;
        v90 = v27;
        v91 = v28;
        objc_msgSend(v16, "bs_firstObjectPassingTest:", v89);
        v77 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v26 = v93;
    }

    v29 = objc_msgSend(v16, "count");
    v30 = -[PUIStylePickerViewController _shouldShowWeightSliderForSelectedFont](self, "_shouldShowWeightSliderForSelectedFont");
    v31 = v29 > 1 || v30;
    v79 = v31;
    v13 = v80;
    v11 = v78;
    if (v31 == 1)
    {
      v73 = v23;
      -[PUIStylePickerViewController fontPickerComponentViewController](self, "fontPickerComponentViewController");
      v32 = (PUIFontPickerComponentViewController *)objc_claimAutoreleasedReturnValue();
      if (!v32)
      {
        v32 = -[PUIFontPickerComponentViewController initWithItems:selectedItem:role:titleString:]([PUIFontPickerComponentViewController alloc], "initWithItems:selectedItem:role:titleString:", v16, v77, v4, v87);
        -[PUIFontPickerComponentViewController setDelegate:](v32, "setDelegate:", self);
        -[PUIStylePickerViewController setFontPickerComponentViewController:](self, "setFontPickerComponentViewController:", v32);
      }
      objc_msgSend(v6, "fontConfiguration");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUIStylePickerViewController extensionBundleURL](self, "extensionBundleURL");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "PUIFontWithExtensionBundleURL:", v34);
      v35 = v6;
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v36, "effectiveFontForRole:ignoringWeight:", v4, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "pui_variantWeightRange");
      v39 = v16;
      v40 = v4;
      v42 = v41;
      objc_msgSend(v36, "weight");
      -[PUIFontPickerComponentViewController setFontWeight:](v32, "setFontWeight:", (v43 - (double)v38) / ((double)v42 - (double)v38));
      objc_msgSend(v35, "numberingSystemType");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      +[PUINumberingSystem numberingSystemForType:](PUINumberingSystem, "numberingSystemForType:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v45, "locale");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUIFontPickerComponentViewController setLocale:](v32, "setLocale:", v46);

      v4 = v40;
      v16 = v39;

      v6 = v35;
      v13 = v80;
      v9 = v75;
      v11 = v78;
      v23 = v73;
    }
    else
    {
      -[PUIStylePickerViewController setFontPickerComponentViewController:](self, "setFontPickerComponentViewController:", 0);
      v9 = v75;
    }

    v5 = v76;
  }
  else
  {
    v79 = 0;
  }
  if (v82)
  {
    -[PUIStylePickerViewController textAlignmentBarItem](self, "textAlignmentBarItem");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v47)
    {
      v48 = -[PUITextAlignmentBarButtonItem initWithTextAlignment:target:action:]([PUITextAlignmentBarButtonItem alloc], "initWithTextAlignment:target:action:", objc_msgSend(v6, "preferredAlignment"), self, sel__didPressTextAlignmentBarButtonItem_);
      -[PUIStylePickerViewController setTextAlignmentBarItem:](self, "setTextAlignmentBarItem:", v48);

    }
    if (v11)
      goto LABEL_31;
LABEL_35:
    -[PUIStylePickerViewController setTextLayoutPickerComponentViewController:](self, "setTextLayoutPickerComponentViewController:", 0);
    v52 = v84;
    goto LABEL_36;
  }
  -[PUIStylePickerViewController setTextAlignmentBarItem:](self, "setTextAlignmentBarItem:", 0);
  if (!v11)
    goto LABEL_35;
LABEL_31:
  v49 = v9;
  +[PUITextLayoutSet supportedTextLayoutSetForRole:](PUITextLayoutSet, "supportedTextLayoutSetForRole:", v4);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIStylePickerViewController textLayoutPickerComponentViewController](self, "textLayoutPickerComponentViewController");
  v51 = (PUITextLayoutPickerComponentViewController *)objc_claimAutoreleasedReturnValue();
  if (!v51)
  {
    v51 = -[PUITextLayoutPickerComponentViewController initWithLayouts:selectedLayout:]([PUITextLayoutPickerComponentViewController alloc], "initWithLayouts:selectedLayout:", v50, objc_msgSend(v6, "preferredLayout"));
    -[PUITextLayoutPickerComponentViewController setDelegate:](v51, "setDelegate:", self);
    -[PUIStylePickerViewController setTextLayoutPickerComponentViewController:](self, "setTextLayoutPickerComponentViewController:", v51);
  }

  v52 = v84;
  v9 = v49;
LABEL_36:
  v53 = (void *)v13;
  v54 = (void *)v5;
  if (v85)
  {
    -[PUIStylePickerViewController stylePickerComponentViewController](self, "stylePickerComponentViewController");
    v55 = (PUIStylePickerComponentViewController *)objc_claimAutoreleasedReturnValue();
    if (!v55)
    {
      v55 = -[PUIStylePickerComponentViewController initWithConfiguration:]([PUIStylePickerComponentViewController alloc], "initWithConfiguration:", v5);
      -[PUIStylePickerComponentViewController setDelegate:](v55, "setDelegate:", self);
      -[PUIStylePickerViewController setStylePickerComponentViewController:](self, "setStylePickerComponentViewController:", v55);
    }
    -[PUIStylePickerComponentViewController setContentsLuminance:](v55, "setContentsLuminance:", v8);

  }
  else
  {
    -[PUIStylePickerViewController setStylePickerComponentViewController:](self, "setStylePickerComponentViewController:", 0);
  }
  v56 = v86;
  if (v9)
  {
    objc_msgSend(v6, "effectiveNumberingSystemType");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUINumberingSystem numberingSystemForType:](PUINumberingSystem, "numberingSystemForType:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (((v85 | v79) & 1) != 0)
    {
      -[PUIStylePickerViewController numberingSystemPickerMenuController](self, "numberingSystemPickerMenuController");
      v59 = (PUINumberingSystemPickerMenuController *)objc_claimAutoreleasedReturnValue();
      if (!v59)
      {
        v59 = -[PUINumberingSystemPickerMenuController initWithNumberingSystem:font:]([PUINumberingSystemPickerMenuController alloc], "initWithNumberingSystem:font:", v58, v53);
        -[PUINumberingSystemPickerMenuController setDelegate:](v59, "setDelegate:", self);
        -[PUIStylePickerViewController setNumberingSystemPickerMenuController:](self, "setNumberingSystemPickerMenuController:", v59);
      }
      v81 = v53;
      -[PUIStylePickerViewController numberSystemBarItem](self, "numberSystemBarItem");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v60)
      {
        v61 = (void *)MEMORY[0x24BDF6AC8];
        objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithScale:", 3);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "systemImageNamed:withConfiguration:", CFSTR("globe"), v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        v64 = objc_alloc(MEMORY[0x24BDF6860]);
        -[PUINumberingSystemPickerMenuController menu](v59, "menu");
        v65 = v54;
        v66 = v6;
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = (void *)objc_msgSend(v64, "initWithImage:menu:", v63, v67);

        v6 = v66;
        v54 = v65;
        v56 = v86;
        -[PUIStylePickerViewController setNumberSystemBarItem:](self, "setNumberSystemBarItem:", v60);

      }
      v53 = v81;
      v52 = v84;
    }
    else
    {
      -[PUIStylePickerViewController numberingSystemPickerComponentViewController](self, "numberingSystemPickerComponentViewController");
      v59 = (PUINumberingSystemPickerMenuController *)objc_claimAutoreleasedReturnValue();
      v52 = v84;
      if (!v59)
      {
        v59 = -[PUINumberingSystemPickerComponentViewController initWithNumberingSystem:font:]([PUINumberingSystemPickerComponentViewController alloc], "initWithNumberingSystem:font:", v58, v53);
        -[PUINumberingSystemPickerMenuController setDelegate:](v59, "setDelegate:", self);
        -[PUIStylePickerViewController setNumberingSystemPickerComponentViewController:](self, "setNumberingSystemPickerComponentViewController:", v59);
      }
    }

  }
  else
  {
    -[PUIStylePickerViewController setNumberSystemBarItem:](self, "setNumberSystemBarItem:", 0);
    -[PUIStylePickerViewController setNumberingSystemPickerMenuController:](self, "setNumberingSystemPickerMenuController:", 0);
    -[PUIStylePickerViewController setNumberingSystemPickerComponentViewController:](self, "setNumberingSystemPickerComponentViewController:", 0);
  }
  if (v83)
  {
    objc_msgSend(v88, "homeScreenConfiguration");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v68;
    if (v68)
      v70 = v68;
    else
      v70 = (id)objc_opt_new();
    v71 = v70;

    -[PUIStylePickerViewController homeScreenComponentViewController](self, "homeScreenComponentViewController");
    v72 = (PUIStylePickerHomeScreenComponentViewController *)objc_claimAutoreleasedReturnValue();
    if (!v72)
    {
      v72 = -[PUIStylePickerHomeScreenComponentViewController initWithHomeScreenConfiguration:]([PUIStylePickerHomeScreenComponentViewController alloc], "initWithHomeScreenConfiguration:", v71);
      -[PUIStylePickerHomeScreenComponentViewController setDelegate:](v72, "setDelegate:", self);
      -[PUIStylePickerViewController setHomeScreenComponentViewController:](self, "setHomeScreenComponentViewController:", v72);
    }

  }
  else
  {
    -[PUIStylePickerViewController setHomeScreenComponentViewController:](self, "setHomeScreenComponentViewController:", 0);
  }

}

PUIFontPickerItem *__70__PUIStylePickerViewController__setupComponentViewControllersIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PUIFontPickerItem *v3;

  v2 = a2;
  v3 = -[PUIFontPickerItem initWithFont:systemItem:]([PUIFontPickerItem alloc], "initWithFont:systemItem:", v2, 0);

  return v3;
}

uint64_t __70__PUIStylePickerViewController__setupComponentViewControllersIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  if (objc_msgSend(v3, "isSystemItem"))
  {
    v5 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "font");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "stylePickerViewController:shouldShowFont:", v4, v6);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

uint64_t __70__PUIStylePickerViewController__setupComponentViewControllersIfNeeded__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "customFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "fontName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fontName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = BSEqualObjects();

  return v7;
}

uint64_t __70__PUIStylePickerViewController__setupComponentViewControllersIfNeeded__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;

  v3 = a2;
  objc_msgSend(v3, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  objc_msgSend(v3, "isSystemItem");
  objc_msgSend(*(id *)(a1 + 40), "isSystemItem");
  return v5 & BSFloatEqualToFloat();
}

uint64_t __70__PUIStylePickerViewController__setupComponentViewControllersIfNeeded__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  v3 = a2;
  objc_msgSend(v3, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fontIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fontIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = BSEqualObjects();

  objc_msgSend(v3, "isSystemItem");
  objc_msgSend(*(id *)(a1 + 40), "isSystemItem");
  return v7 & BSFloatEqualToFloat();
}

- (void)_refreshComponentViewControllers
{
  void *v3;
  int v4;
  int v5;
  void *v6;
  int v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  -[PUIStylePickerViewController stylePickerConfiguration](self, "stylePickerConfiguration");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "components");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsComponent:", 2);
  v5 = objc_msgSend(v3, "containsComponent:", 4);
  LODWORD(v6) = objc_msgSend(v3, "containsComponent:", 16);
  v7 = objc_msgSend(v3, "containsComponent:", 8);
  v8 = objc_msgSend(v3, "containsComponent:", 32);
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (!(_DWORD)v6
    || (-[PUIStylePickerViewController fontPickerComponentViewController](self, "fontPickerComponentViewController"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    v13 = 1;
    if (!v7)
      goto LABEL_8;
    goto LABEL_7;
  }
  -[PUIStylePickerViewController fontPickerComponentViewController](self, "fontPickerComponentViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12 >= 2)
  {
    -[PUIStylePickerViewController fontPickerComponentViewController](self, "fontPickerComponentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v6);

    v13 = 0;
    LODWORD(v6) = 1;
    if (!v7)
      goto LABEL_8;
LABEL_7:
    -[PUIStylePickerViewController textLayoutPickerComponentViewController](self, "textLayoutPickerComponentViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bs_safeAddObject:", v14);

    goto LABEL_8;
  }
  v13 = 0;
  LODWORD(v6) = 0;
  if (v7)
    goto LABEL_7;
LABEL_8:
  if (((v13 | v6) & 1) == 0)
  {
    -[PUIStylePickerViewController fontPickerComponentViewController](self, "fontPickerComponentViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bs_safeAddObject:", v15);

  }
  if (v4)
  {
    -[PUIStylePickerViewController numberingSystemPickerComponentViewController](self, "numberingSystemPickerComponentViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[PUIStylePickerViewController numberingSystemPickerComponentViewController](self, "numberingSystemPickerComponentViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v17);

    }
  }
  if (v5)
  {
    -[PUIStylePickerViewController stylePickerComponentViewController](self, "stylePickerComponentViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bs_safeAddObject:", v18);

  }
  if (v8)
  {
    -[PUIStylePickerViewController homeScreenComponentViewController](self, "homeScreenComponentViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bs_safeAddObject:", v19);

  }
}

- (void)_refreshBarButtonItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;

  if (!-[PUIStylePickerViewController isViewLoaded](self, "isViewLoaded"))
    return;
  -[PUIStylePickerViewController stylePickerConfiguration](self, "stylePickerConfiguration");
  v39 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "components");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIStylePickerViewController leadingBarButtonItems](self, "leadingBarButtonItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIStylePickerViewController centerBarButtonItems](self, "centerBarButtonItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIStylePickerViewController trailingBarButtonItems](self, "trailingBarButtonItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v9 = objc_opt_new();
  v10 = objc_msgSend(v3, "containsComponent:", 2);
  v34 = v3;
  if (objc_msgSend(v3, "containsComponent:", 16))
  {
    -[PUIStylePickerViewController textAlignmentBarItem](self, "textAlignmentBarItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v11);

  }
  if (v10)
  {
    -[PUIStylePickerViewController numberingSystemPickerComponentViewController](self, "numberingSystemPickerComponentViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      -[PUIStylePickerViewController numberSystemBarItem](self, "numberSystemBarItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v13);

    }
  }
  -[PUIStylePickerViewController stylePickerComponentViewController](self, "stylePickerComponentViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "colorWell");
  v15 = objc_claimAutoreleasedReturnValue();
  v40 = (void *)v9;
  if (!v15)
    goto LABEL_10;
  v16 = (void *)v15;
  -[PUIStylePickerViewController numberSystemBarItem](self, "numberSystemBarItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    -[PUIStylePickerComponentViewController colorWellView](self->_stylePickerComponentViewController, "colorWellView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "colorWell");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithCustomView:", v14);
    objc_msgSend(v7, "addObject:", v19);

LABEL_10:
  }
  if (objc_msgSend(v4, "count"))
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6868]), "initWithBarButtonItems:representativeItem:", v4, 0);
  else
    v20 = 0;
  if (objc_msgSend(v7, "count"))
    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6868]), "initWithBarButtonItems:representativeItem:", v7, 0);
  else
    v43 = 0;
  if (objc_msgSend(v5, "count"))
    v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6868]), "initWithBarButtonItems:representativeItem:", v5, 0);
  else
    v42 = 0;
  if (objc_msgSend(v8, "count"))
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6868]), "initWithBarButtonItems:representativeItem:", v8, 0);
  else
    v41 = 0;
  v44 = v5;
  if (objc_msgSend(v6, "count"))
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6868]), "initWithBarButtonItems:representativeItem:", v6, 0);
  else
    v21 = 0;
  v37 = v6;
  v38 = v4;
  v35 = v8;
  v36 = v7;
  if (objc_msgSend(v40, "count"))
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6868]), "initWithBarButtonItems:representativeItem:", v40, 0);
  else
    v22 = 0;
  v23 = (void *)objc_opt_new();
  objc_msgSend(v23, "bs_safeAddObject:", v20);
  objc_msgSend(v23, "bs_safeAddObject:", v43);
  v24 = (void *)objc_opt_new();
  objc_msgSend(v24, "bs_safeAddObject:", v21);
  objc_msgSend(v24, "bs_safeAddObject:", v22);
  v25 = (void *)objc_opt_new();
  objc_msgSend(v25, "bs_safeAddObject:", v42);
  objc_msgSend(v25, "bs_safeAddObject:", v41);
  -[PUIStylePickerViewController navigationController](self, "navigationController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "navigationBar");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "topItem");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "_setManualScrollEdgeAppearanceProgress:", 0.0);
  objc_msgSend(v28, "setLeadingItemGroups:", v23);
  if (objc_msgSend(v44, "count"))
  {
    if (objc_msgSend(v44, "count") == 1
      && (objc_msgSend(v44, "firstObject"),
          v29 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v29, "customView"),
          v30 = (void *)objc_claimAutoreleasedReturnValue(),
          v30,
          v29,
          v30))
    {
      objc_msgSend(v44, "firstObject");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "customView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v32, "sizeToFit");
      objc_msgSend(v28, "setTitleView:", v32);

    }
    else
    {
      objc_msgSend(v28, "setCenterItemGroups:", v25);
      objc_msgSend(v28, "setTitle:", 0);
    }
  }
  else
  {
    -[PUIStylePickerViewController title](self, "title");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTitle:", v33);

  }
  objc_msgSend(v28, "setTrailingItemGroups:", v24);

}

- (id)componentViewControllers
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void *v12;
  id v13;
  PUIStylePickerViewController *v14;

  v3 = (void *)objc_opt_new();
  -[PUIStylePickerViewController stylePickerConfiguration](self, "stylePickerConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __56__PUIStylePickerViewController_componentViewControllers__block_invoke;
  v12 = &unk_25154D108;
  v13 = v3;
  v14 = self;
  v6 = v3;
  objc_msgSend(v5, "enumerateComponents:", &v9);

  v7 = (void *)objc_msgSend(v6, "copy", v9, v10, v11, v12);
  return v7;
}

void __56__PUIStylePickerViewController_componentViewControllers__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  switch(a2)
  {
    case 1:
      v2 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "fontPickerComponentViewController");
      v3 = objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      v2 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "numberingSystemPickerComponentViewController");
      v3 = objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      v2 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "stylePickerComponentViewController");
      v3 = objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      v2 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "textLayoutPickerComponentViewController");
      v3 = objc_claimAutoreleasedReturnValue();
      break;
    case 32:
      v2 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "homeScreenComponentViewController");
      v3 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      return;
  }
  v4 = (id)v3;
  objc_msgSend(v2, "bs_safeAddObject:");

}

- (void)_updateViews
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  PUIStylePickerViewController *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  void *v28;
  uint64_t m;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
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
  PUIStylePickerViewController *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  id obj;
  uint64_t v67;
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
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _QWORD v100[7];
  _QWORD v101[4];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  uint64_t v106;

  v106 = *MEMORY[0x24BDAC8D0];
  -[PUIStylePickerViewController view](self, "view");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIStylePickerViewController rootStackView](self, "rootStackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIStylePickerViewController backgroundView](self, "backgroundView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIStylePickerViewController componentViewControllers](self, "componentViewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v105, 16);
  v73 = v5;
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v97;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v97 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * i);
        objc_msgSend(v11, "view");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v5, "addObject:", v12);
        objc_msgSend(v11, "parentViewController");
        v13 = (PUIStylePickerViewController *)objc_claimAutoreleasedReturnValue();

        if (v13 != self)
        {
          objc_msgSend(v11, "willMoveToParentViewController:", self);
          -[PUIStylePickerViewController addChildViewController:](self, "addChildViewController:", v11);
          objc_msgSend(v11, "didMoveToParentViewController:", self);
          v8 = 1;
        }

        v5 = v73;
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v105, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  objc_msgSend(v3, "arrangedSubviews");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v5, "isEqualToArray:", v14);

  v60 = self;
  v61 = v3;
  if ((v15 & 1) != 0)
  {
    if ((v8 & 1) == 0)
      goto LABEL_41;
  }
  else
  {
    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    objc_msgSend(v3, "arrangedSubviews");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");

    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v92, v104, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v93;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v93 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(v3, "removeArrangedSubview:", *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * j));
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v92, v104, 16);
      }
      while (v19);
    }

    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    v22 = v73;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v88, v103, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v89;
      do
      {
        for (k = 0; k != v24; ++k)
        {
          if (*(_QWORD *)v89 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(v3, "addArrangedSubview:", *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * k));
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v88, v103, 16);
      }
      while (v24);
    }

  }
  -[PUIStylePickerViewController dividerViews](self, "dividerViews");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "makeObjectsPerformSelector:", sel_removeFromSuperview);

  v69 = (void *)objc_opt_new();
  if ((unint64_t)objc_msgSend(v73, "count") < 2)
  {
    v28 = 0;
  }
  else
  {
    objc_msgSend(v73, "subarrayWithRange:", 1, objc_msgSend(v73, "count") - 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v64 = v28;
  v71 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v84, v102, 16);
  if (v71)
  {
    v67 = *(_QWORD *)v85;
    do
    {
      for (m = 0; m != v71; ++m)
      {
        if (*(_QWORD *)v85 != v67)
          objc_enumerationMutation(v64);
        v30 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * m);
        v31 = objc_alloc_init(MEMORY[0x24BDF6F90]);
        objc_msgSend(MEMORY[0x24BDF6950], "separatorColor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setBackgroundColor:", v32);

        objc_msgSend(v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v30, "addSubview:", v31);
        objc_msgSend(v69, "addObject:", v31);
        v74 = (void *)MEMORY[0x24BDD1628];
        objc_msgSend(v31, "heightAnchor");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "constraintEqualToConstant:", 1.0);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v101[0] = v80;
        objc_msgSend(v31, "leadingAnchor");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "leadingAnchor");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "constraintEqualToAnchor:", v76);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v101[1] = v33;
        objc_msgSend(v31, "trailingAnchor");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "trailingAnchor");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "constraintEqualToAnchor:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v101[2] = v36;
        objc_msgSend(v31, "bottomAnchor");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "topAnchor");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "constraintEqualToAnchor:constant:", v38, -24.0);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v101[3] = v39;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v101, 4);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "activateConstraints:", v40);

      }
      v71 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v84, v102, 16);
    }
    while (v71);
  }

  -[PUIStylePickerViewController setDividerViews:](v60, "setDividerViews:", v69);
  v3 = v61;
LABEL_41:
  objc_msgSend(v63, "safeAreaLayoutGuide");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "leadingAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "constraintEqualToAnchor:", v79);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v100[0] = v77;
  objc_msgSend(v3, "trailingAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v41;
  objc_msgSend(v41, "trailingAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintEqualToAnchor:", v72);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v100[1] = v70;
  objc_msgSend(v3, "topAnchor");
  v65 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "safeAreaLayoutGuide");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "topAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:constant:", v59, 7.0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v100[2] = v58;
  objc_msgSend(v62, "leadingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "leadingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:", v56);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v100[3] = v55;
  objc_msgSend(v62, "trailingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "trailingAnchor");
  v43 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v100[4] = v44;
  objc_msgSend(v62, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "bottomAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v100[5] = v47;
  objc_msgSend(v62, "topAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "topAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v100[6] = v50;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v100, 7);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUIStylePickerViewController layoutConstraints](v60, "layoutConstraints");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v43) = objc_msgSend(v52, "isEqualToArray:", v51);

  if ((v43 & 1) == 0)
  {
    v53 = (void *)MEMORY[0x24BDD1628];
    -[PUIStylePickerViewController layoutConstraints](v60, "layoutConstraints");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "deactivateConstraints:", v54);

    -[PUIStylePickerViewController setLayoutConstraints:](v60, "setLayoutConstraints:", v51);
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v51);
  }

}

- (void)_navigateHomeScreenColorPickerSlidersToColor:(id)a3
{
  -[PUIStylePickerHomeScreenComponentViewController navigateHomeScreenColorPickerSlidersToColor:](self->_homeScreenComponentViewController, "navigateHomeScreenColorPickerSlidersToColor:", a3);
}

- (PUIStylePickerComponents)components
{
  return self->_components;
}

- (PUIStylePickerConfiguration)stylePickerConfiguration
{
  return self->_stylePickerConfiguration;
}

- (void)setStylePickerConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_stylePickerConfiguration, a3);
}

- (NSArray)leadingBarButtonItems
{
  return self->_leadingBarButtonItems;
}

- (NSArray)centerBarButtonItems
{
  return self->_centerBarButtonItems;
}

- (NSArray)trailingBarButtonItems
{
  return self->_trailingBarButtonItems;
}

- (double)contentsLuminance
{
  return self->_contentsLuminance;
}

- (PUIStylePickerViewControllerDelegate)delegate
{
  return (PUIStylePickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (void)setChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1056);
}

- (UIStackView)rootStackView
{
  return self->_rootStackView;
}

- (void)setRootStackView:(id)a3
{
  objc_storeStrong((id *)&self->_rootStackView, a3);
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (NSArray)dividerViews
{
  return self->_dividerViews;
}

- (void)setDividerViews:(id)a3
{
  objc_storeStrong((id *)&self->_dividerViews, a3);
}

- (UIBarButtonItem)numberSystemBarItem
{
  return self->_numberSystemBarItem;
}

- (void)setNumberSystemBarItem:(id)a3
{
  objc_storeStrong((id *)&self->_numberSystemBarItem, a3);
}

- (PUITextAlignmentBarButtonItem)textAlignmentBarItem
{
  return self->_textAlignmentBarItem;
}

- (void)setTextAlignmentBarItem:(id)a3
{
  objc_storeStrong((id *)&self->_textAlignmentBarItem, a3);
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_layoutConstraints, a3);
}

- (PUINumberingSystemPickerMenuController)numberingSystemPickerMenuController
{
  return self->_numberingSystemPickerMenuController;
}

- (void)setNumberingSystemPickerMenuController:(id)a3
{
  objc_storeStrong((id *)&self->_numberingSystemPickerMenuController, a3);
}

- (PUIFontPickerComponentViewController)fontPickerComponentViewController
{
  return self->_fontPickerComponentViewController;
}

- (void)setFontPickerComponentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_fontPickerComponentViewController, a3);
}

- (PUITextLayoutPickerComponentViewController)textLayoutPickerComponentViewController
{
  return self->_textLayoutPickerComponentViewController;
}

- (void)setTextLayoutPickerComponentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_textLayoutPickerComponentViewController, a3);
}

- (PUIStylePickerComponentViewController)stylePickerComponentViewController
{
  return self->_stylePickerComponentViewController;
}

- (void)setStylePickerComponentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_stylePickerComponentViewController, a3);
}

- (PUINumberingSystemPickerComponentViewController)numberingSystemPickerComponentViewController
{
  return self->_numberingSystemPickerComponentViewController;
}

- (void)setNumberingSystemPickerComponentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_numberingSystemPickerComponentViewController, a3);
}

- (PUIStylePickerHomeScreenComponentViewController)homeScreenComponentViewController
{
  return self->_homeScreenComponentViewController;
}

- (void)setHomeScreenComponentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_homeScreenComponentViewController, a3);
}

- (NSArray)additionalFonts
{
  return self->_additionalFonts;
}

- (void)setAdditionalFonts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1160);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (NSURL)extensionBundleURL
{
  return self->_extensionBundleURL;
}

- (void)setExtensionBundleURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionBundleURL, 0);
  objc_storeStrong((id *)&self->_additionalFonts, 0);
  objc_storeStrong((id *)&self->_homeScreenComponentViewController, 0);
  objc_storeStrong((id *)&self->_numberingSystemPickerComponentViewController, 0);
  objc_storeStrong((id *)&self->_stylePickerComponentViewController, 0);
  objc_storeStrong((id *)&self->_textLayoutPickerComponentViewController, 0);
  objc_storeStrong((id *)&self->_fontPickerComponentViewController, 0);
  objc_storeStrong((id *)&self->_numberingSystemPickerMenuController, 0);
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_textAlignmentBarItem, 0);
  objc_storeStrong((id *)&self->_numberSystemBarItem, 0);
  objc_storeStrong((id *)&self->_dividerViews, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_rootStackView, 0);
  objc_storeStrong(&self->_changeHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_trailingBarButtonItems, 0);
  objc_storeStrong((id *)&self->_centerBarButtonItems, 0);
  objc_storeStrong((id *)&self->_leadingBarButtonItems, 0);
  objc_storeStrong((id *)&self->_stylePickerConfiguration, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)initWithStylePickerConfiguration:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("PUIStylePickerViewController.m");
  v16 = 1024;
  v17 = 105;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_24464E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
