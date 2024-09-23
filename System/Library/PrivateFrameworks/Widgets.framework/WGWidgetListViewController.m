@implementation WGWidgetListViewController

- (WGWidgetListViewController)initWithWidgetDiscoveryController:(id)a3
{
  id v6;
  WGWidgetListViewController *v7;
  WGWidgetListViewController *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WGWidgetListViewController.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("discoveryController"));

  }
  v11.receiver = self;
  v11.super_class = (Class)WGWidgetListViewController;
  v7 = -[WGWidgetListViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_discoveryController, a3);
    v8->_shouldIncludeScrollView = 0;
  }

  return v8;
}

- (WGWidgetListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WGWidgetListViewController.m"), 67, CFSTR("Not a valid initializer."));

  return 0;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[WGWidgetListViewController _invalidateAllCancelTouchesAssertions](self, "_invalidateAllCancelTouchesAssertions");
  v4.receiver = self;
  v4.super_class = (Class)WGWidgetListViewController;
  -[WGWidgetListViewController dealloc](&v4, sel_dealloc);
}

- (UIScrollView)widgetListView
{
  void *v3;
  id WeakRetained;

  if (-[WGWidgetListViewController shouldIncludeScrollView](self, "shouldIncludeScrollView"))
  {
    -[WGWidgetListViewController _scrollViewIfLoaded](self, "_scrollViewIfLoaded");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "scrollViewForWidgetListViewController:", self);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

  }
  return (UIScrollView *)v3;
}

- (unint64_t)widgetCount
{
  return 1;
}

- (void)setShouldBlurContent:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (self->_shouldBlurContent != a3)
  {
    self->_shouldBlurContent = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSMutableDictionary allValues](self->_widgetIDsToItemVCs, "allValues", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "platterView");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[WGWidgetListViewController _updateBackgroundViewForPlatter:](self, "_updateBackgroundViewForPlatter:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (NSString)_group
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WGWidgetListViewController.m"), 107, CFSTR("Abstract"));

  return 0;
}

- (id)_listItemViewControllerForWidgetWithIdentifier:(id)a3 creatingIfNecessary:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSMutableDictionary *widgetIDsToItemVCs;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  WGWidgetListItemViewController *v10;
  BOOL v11;
  void *v12;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    widgetIDsToItemVCs = self->_widgetIDsToItemVCs;
    if (!widgetIDsToItemVCs)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v9 = self->_widgetIDsToItemVCs;
      self->_widgetIDsToItemVCs = v8;

      widgetIDsToItemVCs = self->_widgetIDsToItemVCs;
    }
    -[NSMutableDictionary objectForKey:](widgetIDsToItemVCs, "objectForKey:", v6);
    v10 = (WGWidgetListItemViewController *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v11 = 1;
    else
      v11 = !v4;
    if (!v11)
    {
      v10 = -[WGWidgetListItemViewController initWithWidgetIdentifier:]([WGWidgetListItemViewController alloc], "initWithWidgetIdentifier:", v6);
      -[WGWidgetListItemViewController setDelegate:](v10, "setDelegate:", self);
      -[WGWidgetListItemViewController setAdjustsFontForContentSizeCategory:](v10, "setAdjustsFontForContentSizeCategory:", 1);
      -[WGWidgetListItemViewController platterView](v10, "platterView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[WGWidgetListViewController _updateBackgroundViewForPlatter:](self, "_updateBackgroundViewForPlatter:", v12);

      -[NSMutableDictionary setObject:forKey:](self->_widgetIDsToItemVCs, "setObject:forKey:", v10, v6);
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_platterViewForWidgetWithIdentifier:(id)a3 creatingIfNecessary:(BOOL)a4
{
  void *v4;
  void *v5;

  -[WGWidgetListViewController _listItemViewControllerForWidgetWithIdentifier:creatingIfNecessary:](self, "_listItemViewControllerForWidgetWithIdentifier:creatingIfNecessary:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "platterView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_configureStackView
{
  void *v3;
  uint64_t v4;
  UIStackView *v5;
  UIStackView *stackView;
  void *v7;
  void *v8;
  void *v9;
  UIStackView *v10;
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
  NSLayoutConstraint *v22;
  NSLayoutConstraint *stackViewBottomConstraint;
  id v24;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerForKey:", CFSTR("WGAzulWidgetsType"));

  v5 = (UIStackView *)objc_alloc_init(MEMORY[0x24BDF6DD0]);
  stackView = self->_stackView;
  self->_stackView = v5;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setSpacing:](self->_stackView, "setSpacing:", 8.0);
  -[UIStackView setPreservesSuperviewLayoutMargins:](self->_stackView, "setPreservesSuperviewLayoutMargins:", 1);
  if (-[WGWidgetListViewController shouldIncludeScrollView](self, "shouldIncludeScrollView"))
    -[WGWidgetListViewController widgetListView](self, "widgetListView");
  else
    -[WGWidgetListViewController view](self, "view");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addSubview:", self->_stackView);
  -[UIStackView leadingAnchor](self->_stackView, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  v10 = self->_stackView;
  if (v4 == 1)
  {
    -[UIStackView widthAnchor](v10, "widthAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToConstant:", 200.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setActive:", 1);
  }
  else
  {
    -[UIStackView trailingAnchor](v10, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setActive:", 1);

    -[UIStackView widthAnchor](self->_stackView, "widthAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "widthAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setActive:", 1);

  }
  -[UIStackView topAnchor](self->_stackView, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setActive:", 1);

  -[UIStackView bottomAnchor](self->_stackView, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v21);
  v22 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  stackViewBottomConstraint = self->_stackViewBottomConstraint;
  self->_stackViewBottomConstraint = v22;

  -[NSLayoutConstraint setActive:](self->_stackViewBottomConstraint, "setActive:", 1);
  -[UIStackView setAxis:](self->_stackView, "setAxis:", 1);

}

- (void)_repopulateStackViewWithWidgetIdentifiers:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v9++), "removeFromSuperview");
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v7);
  }

  -[WGWidgetListViewController _invalidateAllAlternateCaptureOnlyMaterialViews](self, "_invalidateAllAlternateCaptureOnlyMaterialViews");
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        -[WGWidgetListViewController _listItemViewControllerForWidgetWithIdentifier:creatingIfNecessary:](self, "_listItemViewControllerForWidgetWithIdentifier:creatingIfNecessary:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14), 1, (_QWORD)v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[WGWidgetListViewController _insert:listItem:withOrderedIdentifiers:animated:](self, "_insert:listItem:withOrderedIdentifiers:animated:", 1, v15, v10, 0);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        if (v16)
          (*(void (**)(uint64_t))(v16 + 16))(v16);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v12);
  }

}

- (unint64_t)_insertionIndexofListItem:(id)a3 intoWidgetViews:(id)a4 withOrderedIdentifiers:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  BOOL v17;
  _QWORD v19[4];
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
  {
    objc_msgSend(v7, "widgetIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "indexOfObject:", v10);

    if (v11 && v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = v11 - 1;
      if (v12 < 0)
      {
        v11 = 0;
      }
      else
      {
        v13 = MEMORY[0x24BDAC760];
        do
        {
          objc_msgSend(v9, "objectAtIndex:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v19[0] = v13;
          v19[1] = 3221225472;
          v19[2] = __95__WGWidgetListViewController__insertionIndexofListItem_intoWidgetViews_withOrderedIdentifiers___block_invoke;
          v19[3] = &unk_24D731E18;
          v20 = v14;
          v15 = v14;
          v16 = objc_msgSend(v8, "indexOfObjectPassingTest:", v19);

          v17 = v12-- != 0;
        }
        while (v17 && v16 == 0x7FFFFFFFFFFFFFFFLL);
        if (v16 == 0x7FFFFFFFFFFFFFFFLL)
          v11 = 0;
        else
          v11 = v16 + 1;
      }
    }
  }
  else
  {
    v11 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v11;
}

uint64_t __95__WGWidgetListViewController__insertionIndexofListItem_intoWidgetViews_withOrderedIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = a2;
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  WGSafeCast(v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "platterView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WGSafeCast(v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "listItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "widgetIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v11;
}

- (id)_beginInsertion:(BOOL)a3 ofListItem:(id)a4 withOrderedIdentifiers:(id)a5 removingViewIfPossible:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v8;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  WGWidgetListViewController *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  BOOL v20;
  uint64_t v21;
  NSMutableDictionary *widgetIDsToItemVCs;
  WGWidgetWrapperView *v23;
  void *v24;
  WGWidgetWrapperView *v25;
  void *v26;
  WGWidgetWrapperView *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v33[5];
  id v34;
  BOOL v35;
  _QWORD v36[5];
  WGWidgetWrapperView *v37;
  unint64_t v38;

  v6 = a6;
  v8 = a3;
  v11 = a4;
  v12 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WGWidgetListViewController.m"), 197, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("listItemVC"));

    -[WGWidgetListViewController isViewLoaded](self, "isViewLoaded");
    goto LABEL_18;
  }
  if (!-[WGWidgetListViewController isViewLoaded](self, "isViewLoaded"))
  {
LABEL_18:
    v29 = 0;
    goto LABEL_19;
  }
  v13 = MEMORY[0x24BDAC760];
  if (v8)
  {
    -[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[WGWidgetListViewController _insertionIndexofListItem:intoWidgetViews:withOrderedIdentifiers:](self, "_insertionIndexofListItem:intoWidgetViews:withOrderedIdentifiers:", v11, v14, v12);

    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v11, "parentViewController");
      v16 = (WGWidgetListViewController *)objc_claimAutoreleasedReturnValue();

      if (v16 == self)
      {
LABEL_14:
        v25 = [WGWidgetWrapperView alloc];
        objc_msgSend(v11, "platterView");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[WGWidgetWrapperView initWithPlatterView:](v25, "initWithPlatterView:", v26);

        v28 = (void *)MEMORY[0x24BDF6F90];
        v36[0] = v13;
        v36[1] = 3221225472;
        v36[2] = __103__WGWidgetListViewController__beginInsertion_ofListItem_withOrderedIdentifiers_removingViewIfPossible___block_invoke;
        v36[3] = &unk_24D731CD8;
        v36[4] = self;
        v37 = v27;
        v38 = v15;
        v23 = v27;
        objc_msgSend(v28, "performWithoutAnimation:", v36);

        goto LABEL_15;
      }
      -[WGWidgetListViewController addChildViewController:](self, "addChildViewController:", v11);
      objc_msgSend(v11, "widgetIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = WGIsWidgetWithBundleIdentifierBuiltOnOrAfterSystemVersion(v17, CFSTR("10.0"));

      if (v18)
      {
        objc_msgSend(v11, "widgetIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = WGIsWidgetWithBundleIdentifierBuiltOnOrAfterSystemVersion(v19, CFSTR("13.0"));

        if (v20)
        {
LABEL_13:
          objc_msgSend(v11, "didMoveToParentViewController:", self);
          goto LABEL_14;
        }
        v21 = 1;
      }
      else
      {
        v21 = 2;
      }
      objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", v21);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[WGWidgetListViewController setOverrideTraitCollection:forChildViewController:](self, "setOverrideTraitCollection:forChildViewController:", v24, v11);

      -[WGWidgetListViewController _configureAlternateCaptureOnlyMaterialViewWithUserInterfaceStyle:](self, "_configureAlternateCaptureOnlyMaterialViewWithUserInterfaceStyle:", v21);
      goto LABEL_13;
    }
  }
  else if (v6)
  {
    widgetIDsToItemVCs = self->_widgetIDsToItemVCs;
    objc_msgSend(v11, "widgetIdentifier");
    v23 = (WGWidgetWrapperView *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](widgetIDsToItemVCs, "removeObjectForKey:", v23);
LABEL_15:

  }
  v33[0] = v13;
  v33[1] = 3221225472;
  v33[2] = __103__WGWidgetListViewController__beginInsertion_ofListItem_withOrderedIdentifiers_removingViewIfPossible___block_invoke_2;
  v33[3] = &unk_24D731800;
  v35 = v8;
  v33[4] = self;
  v34 = v11;
  v29 = (void *)MEMORY[0x219A0A970](v33);

LABEL_19:
  v31 = (void *)objc_msgSend(v29, "copy");

  return v31;
}

uint64_t __103__WGWidgetListViewController__beginInsertion_ofListItem_withOrderedIdentifiers_removingViewIfPossible___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "insertArrangedSubview:atIndex:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "widgetListView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

  return objc_msgSend(*(id *)(a1 + 32), "_didUpdateStackViewArrangedSubviews");
}

void __103__WGWidgetListViewController__beginInsertion_ofListItem_withOrderedIdentifiers_removingViewIfPossible___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if (!*(_BYTE *)(a1 + 48))
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "platterView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_wrapperViewForWidgetPlatterView:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "removeFromSuperview");
    objc_msgSend(*(id *)(a1 + 40), "willMoveToParentViewController:", 0);
    objc_msgSend(*(id *)(a1 + 40), "removeFromParentViewController");

  }
}

- (void)_didUpdateStackViewArrangedSubviews
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[WGWidgetListViewController _createPropertiesForStackViewUpdate](self, "_createPropertiesForStackViewUpdate");
  v3 = (void *)MEMORY[0x24BDF6F90];
  -[WGWidgetListViewController _animatablePropertiesForStackViewUpdate](self, "_animatablePropertiesForStackViewUpdate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __65__WGWidgetListViewController__didUpdateStackViewArrangedSubviews__block_invoke;
  v5[3] = &unk_24D7314D8;
  v5[4] = self;
  objc_msgSend(v3, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v4, v5);

}

uint64_t __65__WGWidgetListViewController__didUpdateStackViewArrangedSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stackViewArrangedSubviewsTransformPresentationValueChanged");
}

- (void)_createPropertiesForStackViewUpdate
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[WGWidgetListViewController resizeContexts](self, "resizeContexts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[WGWidgetListViewController resizeContexts](self, "resizeContexts", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "resizeProgress");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "invalidate");

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    -[WGWidgetListViewController setResizeContexts:](self, "setResizeContexts:", 0);
  }
  -[WGWidgetListViewController resizeContexts](self, "resizeContexts");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[WGWidgetListViewController setResizeContexts:](self, "setResizeContexts:", v13);

  }
}

- (id)_animatablePropertiesForStackViewUpdate
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __69__WGWidgetListViewController__animatablePropertiesForStackViewUpdate__block_invoke;
  v9[3] = &unk_24D731D50;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

void __69__WGWidgetListViewController__animatablePropertiesForStackViewUpdate__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _WGCarouselCellResizeContext *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "_identifierForCell:", v9);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = objc_alloc_init(_WGCarouselCellResizeContext);
      v5 = objc_alloc_init(MEMORY[0x24BDF6FA0]);
      -[_WGCarouselCellResizeContext setResizeProgress:](v4, "setResizeProgress:", v5);

      -[_WGCarouselCellResizeContext setActive:](v4, "setActive:", 0);
      v6 = *(void **)(a1 + 40);
      -[_WGCarouselCellResizeContext resizeProgress](v4, "resizeProgress");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v7);

      objc_msgSend(*(id *)(a1 + 32), "resizeContexts");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v4, v3);

    }
  }

}

- (void)_resizeCell:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  v18 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v18, "platterView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "listItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "widgetIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[WGWidgetListViewController resizeContexts](self, "resizeContexts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = -1.0;
    if (objc_msgSend(v8, "isActive"))
    {
      objc_msgSend(v8, "compactHeight");
      v11 = v10;
      objc_msgSend(v8, "resizeProgress");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "presentationValue");
      v14 = v13;
      objc_msgSend(v8, "expandedHeight");
      v16 = v15;
      objc_msgSend(v8, "compactHeight");
      v9 = v11 + v14 * (v16 - v17);

    }
    objc_msgSend(v18, "setOverrideIntrinsicContentHeight:", v9);

  }
}

- (void)_stackViewArrangedSubviewsTransformPresentationValueChanged
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[WGWidgetListViewController _resizeCell:](self, "_resizeCell:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  -[UIStackView layoutIfNeeded](self->_stackView, "layoutIfNeeded");

}

- (id)_insert:(BOOL)a3 listItem:(id)a4 withOrderedIdentifiers:(id)a5 animated:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v8;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  WGWidgetListViewController *v27;
  BOOL v28;
  _QWORD v29[4];
  id v30;
  WGWidgetListViewController *v31;

  v6 = a6;
  v8 = a3;
  v11 = a4;
  v12 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WGWidgetListViewController.m"), 302, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("listItemVC"));

    -[WGWidgetListViewController isViewLoaded](self, "isViewLoaded");
    goto LABEL_7;
  }
  if (!-[WGWidgetListViewController isViewLoaded](self, "isViewLoaded"))
  {
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  -[WGWidgetListViewController _beginInsertion:ofListItem:withOrderedIdentifiers:removingViewIfPossible:](self, "_beginInsertion:ofListItem:withOrderedIdentifiers:removingViewIfPossible:", v8, v11, v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v11, "platterView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetListViewController _wrapperViewForWidgetPlatterView:](self, "_wrapperViewForWidgetPlatterView:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = MEMORY[0x24BDAC760];
    if (v8)
    {
      v17 = (void *)MEMORY[0x24BDF6F90];
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __79__WGWidgetListViewController__insert_listItem_withOrderedIdentifiers_animated___block_invoke;
      v29[3] = &unk_24D731670;
      v30 = v15;
      v31 = self;
      objc_msgSend(v17, "performWithoutAnimation:", v29);

    }
    v18 = (void *)MEMORY[0x24BDF6F90];
    v24 = v13;
    v25[0] = v16;
    v25[1] = 3221225472;
    v25[2] = __79__WGWidgetListViewController__insert_listItem_withOrderedIdentifiers_animated___block_invoke_2;
    v25[3] = &unk_24D731800;
    v28 = v8;
    v26 = v15;
    v27 = self;
    v23[0] = v16;
    v23[1] = 3221225472;
    v23[2] = __79__WGWidgetListViewController__insert_listItem_withOrderedIdentifiers_animated___block_invoke_3;
    v23[3] = &unk_24D731E40;
    v19 = v15;
    objc_msgSend(v18, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v25, v23, 0.5, 0.0, 1.0, 0.0);

    goto LABEL_7;
  }
LABEL_8:
  v20 = (void *)MEMORY[0x219A0A970](v13);

  return v20;
}

void __79__WGWidgetListViewController__insert_listItem_withOrderedIdentifiers_animated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setHidden:", 1);
  objc_msgSend(*(id *)(a1 + 40), "widgetListView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

}

void __79__WGWidgetListViewController__insert_listItem_withOrderedIdentifiers_animated___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setHidden:", *(_BYTE *)(a1 + 48) == 0);
  objc_msgSend(*(id *)(a1 + 40), "widgetListView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

}

uint64_t __79__WGWidgetListViewController__insert_listItem_withOrderedIdentifiers_animated___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_pruneAlternateCaptureOnlyMaterialViews
{
  id v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (self->_userInterfaceStylesToCaptureOnlyMaterialViews)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v4 = self->_widgetIDsToItemVCs;
    v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v26;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v26 != v7)
            objc_enumerationMutation(v4);
          -[WGWidgetListViewController overrideTraitCollectionForChildViewController:](self, "overrideTraitCollectionForChildViewController:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v8));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9;
          if (v9)
          {
            v11 = objc_msgSend(v9, "userInterfaceStyle");
            if (v11)
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v11);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "addObject:", v12);

            }
          }

          ++v8;
        }
        while (v6 != v8);
        v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v6);
    }

    v13 = objc_alloc(MEMORY[0x24BDBCEF0]);
    -[NSMutableDictionary allKeys](self->_userInterfaceStylesToCaptureOnlyMaterialViews, "allKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithArray:", v14);

    objc_msgSend(v15, "minusSet:", v3);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v22;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v22 != v19)
            objc_enumerationMutation(v16);
          -[WGWidgetListViewController _invalidateAlternateCaptureOnlyMaterialViewWithUserInterfaceStyle:](self, "_invalidateAlternateCaptureOnlyMaterialViewWithUserInterfaceStyle:", objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v20++), "integerValue", (_QWORD)v21));
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v18);
    }

  }
}

- (id)_newCaptureOnlyMaterialView
{
  void *v2;

  objc_msgSend(MEMORY[0x24BE64060], "materialViewWithRecipe:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGroupNameBase:", CFSTR("WGWidgetListViewControllerGroupName"));
  objc_msgSend(v2, "setCaptureOnly:", 1);
  objc_msgSend(v2, "setAutoresizingMask:", 18);
  return v2;
}

- (void)_configureCaptureOnlyMaterialView
{
  MTMaterialView *v3;
  MTMaterialView *captureOnlyMaterialView;
  MTMaterialView *v5;
  id v6;

  v3 = -[WGWidgetListViewController _newCaptureOnlyMaterialView](self, "_newCaptureOnlyMaterialView");
  captureOnlyMaterialView = self->_captureOnlyMaterialView;
  self->_captureOnlyMaterialView = v3;

  -[WGWidgetListViewController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = self->_captureOnlyMaterialView;
  objc_msgSend(v6, "bounds");
  -[MTMaterialView setFrame:](v5, "setFrame:");
  objc_msgSend(v6, "insertSubview:atIndex:", self->_captureOnlyMaterialView, 0);

}

- (void)_configureAlternateCaptureOnlyMaterialViewWithUserInterfaceStyle:(int64_t)a3
{
  void *v5;
  id v6;
  NSMutableDictionary *userInterfaceStylesToCaptureOnlyMaterialViews;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_userInterfaceStylesToCaptureOnlyMaterialViews, "objectForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = -[WGWidgetListViewController _newCaptureOnlyMaterialView](self, "_newCaptureOnlyMaterialView");
    objc_msgSend(v6, "setOverrideUserInterfaceStyle:", a3);
    userInterfaceStylesToCaptureOnlyMaterialViews = self->_userInterfaceStylesToCaptureOnlyMaterialViews;
    if (!userInterfaceStylesToCaptureOnlyMaterialViews)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v9 = self->_userInterfaceStylesToCaptureOnlyMaterialViews;
      self->_userInterfaceStylesToCaptureOnlyMaterialViews = v8;

      userInterfaceStylesToCaptureOnlyMaterialViews = self->_userInterfaceStylesToCaptureOnlyMaterialViews;
    }
    -[NSMutableDictionary setObject:forKey:](userInterfaceStylesToCaptureOnlyMaterialViews, "setObject:forKey:", v6, v11);
    -[WGWidgetListViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    objc_msgSend(v6, "setFrame:");
    objc_msgSend(v10, "insertSubview:aboveSubview:", v6, self->_captureOnlyMaterialView);

  }
}

- (void)_invalidateAlternateCaptureOnlyMaterialViewWithUserInterfaceStyle:(int64_t)a3
{
  void *v4;
  void *v5;
  NSMutableDictionary *userInterfaceStylesToCaptureOnlyMaterialViews;
  id v7;

  if (self->_userInterfaceStylesToCaptureOnlyMaterialViews)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_userInterfaceStylesToCaptureOnlyMaterialViews, "objectForKey:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "removeFromSuperview");
      -[NSMutableDictionary removeObjectForKey:](self->_userInterfaceStylesToCaptureOnlyMaterialViews, "removeObjectForKey:", v7);
      if (!-[NSMutableDictionary count](self->_userInterfaceStylesToCaptureOnlyMaterialViews, "count"))
      {
        userInterfaceStylesToCaptureOnlyMaterialViews = self->_userInterfaceStylesToCaptureOnlyMaterialViews;
        self->_userInterfaceStylesToCaptureOnlyMaterialViews = 0;

      }
    }

  }
}

- (void)_invalidateAllAlternateCaptureOnlyMaterialViews
{
  NSMutableDictionary *userInterfaceStylesToCaptureOnlyMaterialViews;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  userInterfaceStylesToCaptureOnlyMaterialViews = self->_userInterfaceStylesToCaptureOnlyMaterialViews;
  if (userInterfaceStylesToCaptureOnlyMaterialViews)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    -[NSMutableDictionary allKeys](userInterfaceStylesToCaptureOnlyMaterialViews, "allKeys", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          -[WGWidgetListViewController _invalidateAlternateCaptureOnlyMaterialViewWithUserInterfaceStyle:](self, "_invalidateAlternateCaptureOnlyMaterialViewWithUserInterfaceStyle:", objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "integerValue"));
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)_configureScrollView
{
  _WGWidgetListScrollView *v3;
  UIScrollView *scrollView;
  void *v5;
  UIScrollView *v6;
  id v7;

  v3 = objc_alloc_init(_WGWidgetListScrollView);
  scrollView = self->_scrollView;
  self->_scrollView = &v3->super;

  -[UIScrollView layer](self->_scrollView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHitTestsAsOpaque:", 1);

  -[UIScrollView setDelegate:](self->_scrollView, "setDelegate:", self);
  -[UIScrollView setAlwaysBounceVertical:](self->_scrollView, "setAlwaysBounceVertical:", 1);
  -[UIScrollView setShowsHorizontalScrollIndicator:](self->_scrollView, "setShowsHorizontalScrollIndicator:", 0);
  -[UIScrollView setShowsVerticalScrollIndicator:](self->_scrollView, "setShowsVerticalScrollIndicator:", 0);
  -[UIScrollView setPreservesSuperviewLayoutMargins:](self->_scrollView, "setPreservesSuperviewLayoutMargins:", 1);
  -[UIScrollView setClipsToBounds:](self->_scrollView, "setClipsToBounds:", 0);
  -[UIScrollView setAutoresizingMask:](self->_scrollView, "setAutoresizingMask:", 18);
  -[WGWidgetListViewController view](self, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = self->_scrollView;
  objc_msgSend(v7, "bounds");
  -[UIScrollView setFrame:](v6, "setFrame:");
  objc_msgSend(v7, "addSubview:", self->_scrollView);

}

- (id)_scrollViewLoadingIfNecessary:(BOOL)a3
{
  if (a3 && (-[WGWidgetListViewController isViewLoaded](self, "isViewLoaded") & 1) == 0)
    -[WGWidgetListViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  return self->_scrollView;
}

- (id)_scrollViewIfLoaded
{
  return -[WGWidgetListViewController _scrollViewLoadingIfNecessary:](self, "_scrollViewLoadingIfNecessary:", 0);
}

- (void)_updateBackgroundViewForPlatter:(id)a3
{
  objc_msgSend(a3, "setMaterialGroupNameBase:", CFSTR("WGWidgetListViewControllerGroupName"));
}

- (void)_repopulateStackView
{
  id v3;

  -[WGWidgetListViewController visibleWidgetIdentifiers](self, "visibleWidgetIdentifiers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[WGWidgetListViewController _repopulateStackViewWithWidgetIdentifiers:](self, "_repopulateStackViewWithWidgetIdentifiers:", v3);

}

- (id)_platterViewAtLocation:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  UIStackView *v6;
  UIStackView *stackView;
  UIStackView *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  UIStackView *v13;
  uint64_t *v14;
  CGFloat v15;
  CGFloat v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  y = a3.y;
  x = a3.x;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  v22 = 0;
  -[WGWidgetListViewController _scrollViewIfLoaded](self, "_scrollViewIfLoaded");
  v6 = (UIStackView *)objc_claimAutoreleasedReturnValue();
  stackView = v6;
  if (!self->_shouldIncludeScrollView)
    stackView = self->_stackView;
  v8 = stackView;
  if (v8)
  {
    -[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __53__WGWidgetListViewController__platterViewAtLocation___block_invoke;
    v12[3] = &unk_24D731E68;
    v15 = x;
    v16 = y;
    v13 = v8;
    v14 = &v17;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

  }
  v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

void __53__WGWidgetListViewController__platterViewAtLocation___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  CGRect v11;

  v10 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = v10;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v10, "platterView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v8, "bounds");
    objc_msgSend(v9, "convertRect:fromView:", v8);
    if (CGRectContainsPoint(v11, *(CGPoint *)(a1 + 48)))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v8);
      *a4 = 1;
    }

    v7 = v10;
  }

}

- (void)_cancelTouchesForHitWidgetIfNecessaryAndDisableTouchesOnAllWidgets
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[WGWidgetListViewController _scrollViewIfLoaded](self, "_scrollViewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v3;
  if (v3)
  {
    objc_msgSend(v3, "panGestureRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v12);
    v6 = v5;
    v8 = v7;

    -[WGWidgetListViewController _platterViewAtLocation:](self, "_platterViewAtLocation:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "widgetHost");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WGWidgetListViewController _cancelTouchesForWidget:](self, "_cancelTouchesForWidget:", v11);

    }
  }
  -[WGWidgetListViewController _disableTouchesOnAllWidgets](self, "_disableTouchesOnAllWidgets");

}

- (void)_cancelTouchesForWidget:(id)a3
{
  void *v4;
  void *v5;
  NSMutableDictionary *cancelTouchesAssertionsByWidgetID;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "widgetIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    -[NSMutableDictionary objectForKey:](self->_cancelTouchesAssertionsByWidgetID, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(v9, "_cancelTouches");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        cancelTouchesAssertionsByWidgetID = self->_cancelTouchesAssertionsByWidgetID;
        if (!cancelTouchesAssertionsByWidgetID)
        {
          v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
          v8 = self->_cancelTouchesAssertionsByWidgetID;
          self->_cancelTouchesAssertionsByWidgetID = v7;

          cancelTouchesAssertionsByWidgetID = self->_cancelTouchesAssertionsByWidgetID;
        }
        -[NSMutableDictionary setObject:forKey:](cancelTouchesAssertionsByWidgetID, "setObject:forKey:", v5, v4);
      }
    }

  }
}

- (void)_invalidateAllCancelTouchesAssertions
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_cancelTouchesAssertionsByWidgetID;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKey:](self->_cancelTouchesAssertionsByWidgetID, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7), (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "invalidate");

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[NSMutableDictionary removeAllObjects](self->_cancelTouchesAssertionsByWidgetID, "removeAllObjects");
  -[WGWidgetListViewController _enableTouchesOnAllWidgets](self, "_enableTouchesOnAllWidgets");
}

- (void)_disableTouchesOnAllWidgets
{
  -[WGWidgetListViewController _invokeBlockWithAllPlatterViews:](self, "_invokeBlockWithAllPlatterViews:", &__block_literal_global_4);
}

uint64_t __57__WGWidgetListViewController__disableTouchesOnAllWidgets__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setContentViewHitTestingDisabled:", 1);
}

- (void)_enableTouchesOnAllWidgets
{
  -[WGWidgetListViewController _invokeBlockWithAllPlatterViews:](self, "_invokeBlockWithAllPlatterViews:", &__block_literal_global_45);
}

uint64_t __56__WGWidgetListViewController__enableTouchesOnAllWidgets__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setContentViewHitTestingDisabled:", 0);
}

- (void)_adjustContentOffsetToInsideContent:(BOOL)a3
{
  UIScrollView *scrollView;
  _BOOL4 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _BOOL8 v16;

  if (self->_shouldIncludeScrollView)
  {
    scrollView = self->_scrollView;
    if (scrollView)
    {
      v5 = a3;
      -[UIScrollView contentSize](scrollView, "contentSize");
      v7 = v6;
      -[UIScrollView bounds](self->_scrollView, "bounds");
      v9 = v7 - v8;
      -[UIScrollView contentInset](self->_scrollView, "contentInset");
      v11 = v9 + v10;
      v12 = fmax(v9 + v10, 0.0);
      -[UIScrollView contentInset](self->_scrollView, "contentInset");
      v14 = v12 - v13;
      -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
      if (v15 > v14)
      {
        v16 = v11 >= 0.0 && v5;
        -[UIScrollView setContentOffset:animated:](self->_scrollView, "setContentOffset:animated:", v16, 0.0, v14);
      }
    }
  }
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WGWidgetListViewController;
  -[WGWidgetListViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[WGWidgetListViewController _configureCaptureOnlyMaterialView](self, "_configureCaptureOnlyMaterialView");
  if (self->_shouldIncludeScrollView)
    -[WGWidgetListViewController _configureScrollView](self, "_configureScrollView");
  -[WGWidgetListViewController _configureStackView](self, "_configureStackView");
  -[WGWidgetListViewController _repopulateStackView](self, "_repopulateStackView");
  -[WGWidgetDiscoveryController addDiscoveryObserver:](self->_discoveryController, "addDiscoveryObserver:", self);
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[4];
  BOOL v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WGWidgetListViewController;
  -[WGWidgetListViewController viewWillAppear:](&v9, sel_viewWillAppear_);
  -[WGWidgetListViewController _adjustContentOffsetToInsideContent:](self, "_adjustContentOffsetToInsideContent:", v3);
  -[WGWidgetListViewController _invalidateAllCancelTouchesAssertions](self, "_invalidateAllCancelTouchesAssertions");
  v5 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__WGWidgetListViewController_viewWillAppear___block_invoke;
  v7[3] = &__block_descriptor_33_e33_v24__0__WGWidgetPlatterView_8_B16l;
  v8 = v3;
  -[WGWidgetListViewController _invokeBlockWithPlatterViewsVisibleInBounds:](self, "_invokeBlockWithPlatterViewsVisibleInBounds:", v7);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __45__WGWidgetListViewController_viewWillAppear___block_invoke_2;
  v6[3] = &unk_24D731EF0;
  v6[4] = self;
  -[WGWidgetListViewController _invokeBlock:withPlatterViewsPassingTest:](self, "_invokeBlock:withPlatterViewsPassingTest:", v6, 0);
}

void __45__WGWidgetListViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "listItem");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wg_beginAppearanceTransitionIfNecessary:animated:", 1, *(unsigned __int8 *)(a1 + 32));

}

void __45__WGWidgetListViewController_viewWillAppear___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "listItem");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managingContainerWillAppear:", *(_QWORD *)(a1 + 32));

}

- (void)viewDidAppear:(BOOL)a3
{
  _QWORD v5[4];
  BOOL v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WGWidgetListViewController;
  -[WGWidgetListViewController viewDidAppear:](&v7, sel_viewDidAppear_);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__WGWidgetListViewController_viewDidAppear___block_invoke;
  v5[3] = &__block_descriptor_33_e33_v24__0__WGWidgetPlatterView_8_B16l;
  v6 = a3;
  -[WGWidgetListViewController _invokeBlockWithPlatterViewsVisibleInBounds:](self, "_invokeBlockWithPlatterViewsVisibleInBounds:", v5);
}

void __44__WGWidgetListViewController_viewDidAppear___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "listItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wg_beginAppearanceTransitionIfNecessary:animated:", 1, *(unsigned __int8 *)(a1 + 32));
  objc_msgSend(v3, "wg_endAppearanceTransitionIfNecessary");
  objc_msgSend(v3, "widgetHost");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 1.0;
  if ((objc_msgSend(v4, "isRemoteViewVisible") & 1) == 0
    && (objc_msgSend(v4, "isSnapshotLoaded") & 1) == 0
    && (objc_msgSend(v4, "isBrokenViewVisible") & 1) == 0)
  {
    if (objc_msgSend(v4, "isLockedOut"))
      v5 = 1.0;
    else
      v5 = 0.0;
  }
  objc_msgSend(v9, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", v5);

  +[WGWidgetEventTracker sharedInstance](WGWidgetEventTracker, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widgetIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "widget:didAppearInMode:", v8, objc_msgSend(v4, "activeDisplayMode"));

}

- (void)viewWillDisappear:(BOOL)a3
{
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WGWidgetListViewController;
  -[WGWidgetListViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __48__WGWidgetListViewController_viewWillDisappear___block_invoke;
  v4[3] = &unk_24D731EF0;
  v4[4] = self;
  -[WGWidgetListViewController _invokeBlockWithPlatterViewsVisibleInBounds:](self, "_invokeBlockWithPlatterViewsVisibleInBounds:", v4);
  -[WGWidgetListViewController _disableTouchesOnAllWidgets](self, "_disableTouchesOnAllWidgets");
}

void __48__WGWidgetListViewController_viewWillDisappear___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "widgetHost");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_cancelTouchesForWidget:", v3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WGWidgetListViewController;
  -[WGWidgetListViewController viewDidDisappear:](&v7, sel_viewDidDisappear_);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __47__WGWidgetListViewController_viewDidDisappear___block_invoke;
  v5[3] = &unk_24D731F18;
  v6 = a3;
  v5[4] = self;
  -[WGWidgetListViewController _invokeBlock:withPlatterViewsPassingTest:](self, "_invokeBlock:withPlatterViewsPassingTest:", v5, 0);
  -[WGWidgetListViewController _invokeBlockWithPlatterViewsVisibleInBounds:](self, "_invokeBlockWithPlatterViewsVisibleInBounds:", &__block_literal_global_57);
}

void __47__WGWidgetListViewController_viewDidDisappear___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "listItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wg_beginAppearanceTransitionIfNecessary:animated:", 0, *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(v5, "wg_endAppearanceTransitionIfNecessary");
  objc_msgSend(v5, "managingContainerDidDisappear:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAlpha:", 1.0);
}

void __47__WGWidgetListViewController_viewDidDisappear___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a2, "widgetHost");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[WGWidgetEventTracker sharedInstance](WGWidgetEventTracker, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widgetIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "widget:didDisappearInMode:", v3, objc_msgSend(v4, "activeDisplayMode"));

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  _QWORD v13[8];
  BOOL v14;
  objc_super v15;

  height = a3.height;
  width = a3.width;
  v15.receiver = self;
  v15.super_class = (Class)WGWidgetListViewController;
  -[WGWidgetListViewController viewWillTransitionToSize:withTransitionCoordinator:](&v15, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4);
  -[WGWidgetListViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;

  v13[0] = MEMORY[0x24BDAC760];
  v12 = v11 != height || v9 != width;
  v13[1] = 3221225472;
  v13[2] = __81__WGWidgetListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v13[3] = &__block_descriptor_65_e33_v24__0__WGWidgetPlatterView_8_B16l;
  v14 = v12;
  *(double *)&v13[4] = v9;
  *(double *)&v13[5] = v11;
  *(double *)&v13[6] = width;
  *(double *)&v13[7] = height;
  -[WGWidgetListViewController _invokeBlockWithPlatterViewsVisibleInBounds:](self, "_invokeBlockWithPlatterViewsVisibleInBounds:", v13);
}

void __81__WGWidgetListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(a2, "widgetHost");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    if ((BSFloatEqualToFloat() & 1) == 0)
      objc_msgSend(v2, "maximumSizeDidChangeForDisplayMode:", 0);
    objc_msgSend(v2, "maximumSizeDidChangeForDisplayMode:", 1);

  }
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGSize result;
  CGRect v35;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "preferredContentSize");
    v12 = v11;
    if (width == 0.0 && height == 0.0 && -[WGWidgetListViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[WGWidgetListViewController view](self, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bounds");
      width = CGRectGetWidth(v35);

    }
    objc_msgSend(v10, "contentSizeForPreferredContentSize:", width, v12);
    v15 = v14;
    v17 = v16;
    objc_msgSend(v10, "widgetHost");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetListViewController maxSizeForWidget:forDisplayMode:](self, "maxSizeForWidget:forDisplayMode:", v18, 0);
    v20 = v19;

    objc_msgSend(v10, "widgetHost");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "activeDisplayMode") < 1)
    {
      v25 = v20;
    }
    else
    {
      objc_msgSend(v10, "widgetHost");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "widgetHost");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[WGWidgetListViewController maxSizeForWidget:forDisplayMode:](self, "maxSizeForWidget:forDisplayMode:", v22, objc_msgSend(v23, "activeDisplayMode"));
      v25 = v24;

    }
    if (v20 >= v17)
      v28 = v20;
    else
      v28 = v17;
    if (v25 <= v28)
      v29 = v25;
    else
      v29 = v28;
    objc_msgSend(v10, "preferredContentSizeForContentOfSize:", v15, v29);
    v26 = v30;
    v27 = v31;
  }
  else
  {
    v26 = *MEMORY[0x24BDBF148];
    v27 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }

  v32 = v26;
  v33 = v27;
  result.height = v33;
  result.width = v32;
  return result;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id location;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[WGWidgetListViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    -[WGWidgetListViewController sizeForChildContentContainer:withParentContainerSize:](self, "sizeForChildContentContainer:withParentContainerSize:", v4, v8, v9);
    v11 = v10;
    v13 = v12;

    objc_msgSend(v6, "widgetIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetListViewController _platterViewForWidgetWithIdentifier:creatingIfNecessary:](self, "_platterViewForWidgetWithIdentifier:creatingIfNecessary:", v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[WGWidgetListViewController _wrapperViewForWidgetPlatterView:](self, "_wrapperViewForWidgetPlatterView:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "invalidateIntrinsicContentSize");
    ADClientPushValueForDistributionKey();
    v17 = -[WGWidgetListViewController _appearState](self, "_appearState") == 2;
    -[WGWidgetListViewController _widgetIdentifiersForPlatterViewsVisibleInBounds](self, "_widgetIdentifiersForPlatterViewsVisibleInBounds");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetListViewController _setPreviouslyVisibleWidgetIDs:](self, "_setPreviouslyVisibleWidgetIDs:", v18);

    v19 = objc_alloc_init(MEMORY[0x24BDF7178]);
    objc_msgSend(v19, "_setIsAnimated:", v17);
    objc_msgSend(v19, "_transitionCoordinator");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewWillTransitionToSize:withTransitionCoordinator:", v20, v11, v13);

    objc_initWeak(&location, self);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __84__WGWidgetListViewController_preferredContentSizeDidChangeForChildContentContainer___block_invoke;
    v23[3] = &unk_24D731F60;
    objc_copyWeak(&v25, &location);
    v21 = v19;
    v24 = v21;
    v22 = (void *)MEMORY[0x219A0A970](v23);
    -[WGWidgetListViewController resizeWidgetWrapperView:toSize:withTransitionContext:completion:](self, "resizeWidgetWrapperView:toSize:withTransitionContext:completion:", v16, v21, v22, v11, v13);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);

  }
}

void __84__WGWidgetListViewController_preferredContentSizeDidChangeForChildContentContainer___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_previouslyVisibleWidgetIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_updateWidgetViewStateWithPreviouslyVisibleWidgetIdentifiers:", v4);

  objc_msgSend(*(id *)(a1 + 32), "completeTransition:", a2);
}

- (id)_identifierForCell:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  objc_class *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a3;
  if (!v5)
    goto LABEL_13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_opt_class();
    v7 = v5;
    if (v6)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
    }
    v11 = v8;

    objc_msgSend(v11, "platterView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "listItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "widgetIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_12;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (v9 = (objc_class *)objc_opt_class(),
          NSStringFromClass(v9),
          (v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
LABEL_12:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recursiveDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WGWidgetListViewController.m"), 682, CFSTR("_identifierForCell: no identifier for cell with view hierarchy: %@"), v15);

LABEL_13:
      v10 = 0;
    }
  }

  return v10;
}

- (void)resizeWidgetWrapperView:(id)a3 toSize:(CGSize)a4 withTransitionContext:(id)a5 completion:(id)a6
{
  double height;
  CGFloat width;
  id v11;
  id v12;
  id v13;
  void (**v14)(_QWORD, _QWORD);
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  NSObject *v25;
  void *v26;
  double v27;
  double v28;
  char v29;
  int IsOne;
  int v31;
  double v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  id v38;
  NSObject *v39;
  void *v40;
  double v41;
  double v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  _QWORD block[4];
  void (**v48)(_QWORD, _QWORD);
  uint64_t v49;
  _QWORD v50[4];
  id v51;
  NSObject *v52;
  uint64_t v53;
  _QWORD v54[4];
  id v55;
  id v56;
  CGFloat v57;
  double v58;
  double v59;
  uint64_t v60;
  _QWORD v61[4];
  id v62;
  id v63;
  NSObject *v64;
  uint64_t v65;
  _QWORD v66[4];
  id v67;
  BOOL v68;
  _BYTE buf[12];
  __int16 v70;
  double v71;
  __int16 v72;
  double v73;
  __int16 v74;
  double v75;
  __int16 v76;
  int v77;
  uint64_t v78;

  height = a4.height;
  width = a4.width;
  v78 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = (void (**)(_QWORD, _QWORD))v13;
  if (v11)
  {
    v15 = objc_msgSend(v12, "isAnimated");
    -[WGWidgetListViewController _identifierForCell:](self, "_identifierForCell:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_resizeContexts, "objectForKey:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if ((v15 & 1) == 0)
    {
      if (objc_msgSend(v17, "isActive"))
      {
        objc_msgSend(v18, "setActive:", 0);
        objc_msgSend(v11, "setOverrideIntrinsicContentHeight:", -1.0);
      }
      -[WGWidgetListViewController widgetListView](self, "widgetListView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setNeedsLayout");

      objc_msgSend(v12, "__runAlongsideAnimations");
      if (v14)
        v14[2](v14, 1);
      goto LABEL_40;
    }
    objc_msgSend(v17, "resizeProgress");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "isActive"))
    {
      objc_msgSend(v19, "value");
      if (BSFloatIsZero())
        objc_msgSend(v18, "compactHeight");
      else
        objc_msgSend(v18, "expandedHeight");
      v23 = v20;
    }
    else
    {
      objc_msgSend(v11, "bounds");
      v23 = v22;
    }
    if (BSFloatEqualToFloat())
    {
      v24 = (void *)WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEBUG))
      {
        v25 = v24;
        -[WGWidgetListViewController _identifierForCell:](self, "_identifierForCell:", v11);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v26;
        v70 = 2048;
        v71 = v23;
        v72 = 2048;
        v73 = height;
        _os_log_debug_impl(&dword_2172E1000, v25, OS_LOG_TYPE_DEBUG, "Not animating for cell %@ from: %.2f to %.2f", buf, 0x20u);

      }
LABEL_39:

LABEL_40:
      goto LABEL_41;
    }
    if (height <= v23)
      v27 = height;
    else
      v27 = v23;
    if (height <= v23)
      v28 = v23;
    else
      v28 = height;
    v46 = v19;
    if (objc_msgSend(v18, "isActive")
      && ((objc_msgSend(v18, "compactHeight"), !BSFloatEqualToFloat())
        ? (v29 = 0)
        : (objc_msgSend(v18, "expandedHeight"), v29 = BSFloatEqualToFloat()),
          objc_msgSend(v19, "value"),
          IsOne = BSFloatIsOne(),
          (v29 & 1) != 0))
    {
      if ((((height > v23) ^ IsOne) & 1) != 0)
      {
        v31 = 1;
LABEL_34:
        objc_msgSend(v18, "setActive:", 1);
        v33 = ++resizeWidgetWrapperView_toSize_withTransitionContext_completion__animationId;
        v34 = (void *)WGLogWidgets;
        if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEBUG))
        {
          v44 = v34;
          -[WGWidgetListViewController _identifierForCell:](self, "_identifierForCell:", v11);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219010;
          *(_QWORD *)&buf[4] = v33;
          v70 = 2112;
          v71 = *(double *)&v45;
          v72 = 2048;
          v73 = v23;
          v74 = 2048;
          v75 = height;
          v76 = 1024;
          v77 = v31;
          _os_log_debug_impl(&dword_2172E1000, v44, OS_LOG_TYPE_DEBUG, "nmao _updateUtilityButtonForMoreContentState Starting animation %lu for cell %@ from: %.2f to %.2f reversing %{BOOL}d", buf, 0x30u);

        }
        v35 = dispatch_group_create();
        dispatch_group_enter(v35);
        v36 = (void *)MEMORY[0x24BDF6F90];
        v37 = MEMORY[0x24BDAC760];
        v66[0] = MEMORY[0x24BDAC760];
        v66[1] = 3221225472;
        v66[2] = __94__WGWidgetListViewController_resizeWidgetWrapperView_toSize_withTransitionContext_completion___block_invoke;
        v66[3] = &unk_24D731D28;
        v67 = v46;
        v68 = height > v23;
        v61[0] = v37;
        v61[1] = 3221225472;
        v61[2] = __94__WGWidgetListViewController_resizeWidgetWrapperView_toSize_withTransitionContext_completion___block_invoke_2;
        v61[3] = &unk_24D731F88;
        v65 = v33;
        v62 = v18;
        v38 = v11;
        v63 = v38;
        v39 = v35;
        v64 = v39;
        objc_msgSend(v36, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v66, v61, 341.02, 36.93);
        *(_QWORD *)buf = 0;
        v59 = 0.0;
        v60 = 0;
        WGConvertTensionAndFrictionToDampingRatioResponseAndSettlingDuration((double *)buf, (double *)&v60, &v59, 341.02, 36.93);
        dispatch_group_enter(v39);
        v40 = (void *)MEMORY[0x24BDF6F90];
        v41 = v59;
        v42 = *(double *)buf;
        v54[0] = v37;
        v54[1] = 3221225472;
        v54[2] = __94__WGWidgetListViewController_resizeWidgetWrapperView_toSize_withTransitionContext_completion___block_invoke_67;
        v54[3] = &unk_24D731FB0;
        v55 = v38;
        v57 = width;
        v58 = height;
        v56 = v12;
        v50[0] = v37;
        v50[1] = 3221225472;
        v50[2] = __94__WGWidgetListViewController_resizeWidgetWrapperView_toSize_withTransitionContext_completion___block_invoke_2_68;
        v50[3] = &unk_24D731FD8;
        v53 = v33;
        v51 = v55;
        v43 = v39;
        v52 = v43;
        objc_msgSend(v40, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 6, v54, v50, v41, 0.0, v42, 0.0);
        if (v14)
        {
          block[0] = v37;
          block[1] = 3221225472;
          block[2] = __94__WGWidgetListViewController_resizeWidgetWrapperView_toSize_withTransitionContext_completion___block_invoke_69;
          block[3] = &unk_24D732000;
          v49 = v33;
          v48 = v14;
          dispatch_group_notify(v43, MEMORY[0x24BDAC9B8], block);

        }
        v19 = v46;
        goto LABEL_39;
      }
    }
    else
    {
      objc_msgSend(v18, "setCompactHeight:", v27);
      objc_msgSend(v18, "setExpandedHeight:", v28);
    }
    v32 = 1.0;
    if (height > v23)
      v32 = 0.0;
    objc_msgSend(v19, "setValue:", v32);
    objc_msgSend(v11, "setOverrideIntrinsicContentHeight:", v23);
    v31 = 0;
    goto LABEL_34;
  }
  (*((void (**)(id, uint64_t))v13 + 2))(v13, 1);
LABEL_41:

}

uint64_t __94__WGWidgetListViewController_resizeWidgetWrapperView_toSize_withTransitionContext_completion___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  return objc_msgSend(*(id *)(a1 + 32), "setValue:", v1);
}

void __94__WGWidgetListViewController_resizeWidgetWrapperView_toSize_withTransitionContext_completion___block_invoke_2(uint64_t a1, uint64_t a2, char a3)
{
  NSObject *v5;
  void *v6;

  v5 = WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEBUG))
  {
    __94__WGWidgetListViewController_resizeWidgetWrapperView_toSize_withTransitionContext_completion___block_invoke_2_cold_1(a1, a3, v5);
    if ((a3 & 1) != 0)
      goto LABEL_4;
    goto LABEL_3;
  }
  if ((a3 & 1) == 0)
  {
LABEL_3:
    objc_msgSend(*(id *)(a1 + 32), "setActive:", 0);
    objc_msgSend(*(id *)(a1 + 40), "setOverrideIntrinsicContentHeight:", -1.0);
    objc_msgSend(*(id *)(a1 + 40), "platterView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setOverrideHeightForLayingOutContentView:", -1.0);

  }
LABEL_4:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __94__WGWidgetListViewController_resizeWidgetWrapperView_toSize_withTransitionContext_completion___block_invoke_67(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "platterView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setOverrideHeightForLayingOutContentView:", *(double *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 32), "platterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

  return objc_msgSend(*(id *)(a1 + 40), "__runAlongsideAnimations");
}

void __94__WGWidgetListViewController_resizeWidgetWrapperView_toSize_withTransitionContext_completion___block_invoke_2_68(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEBUG))
    __94__WGWidgetListViewController_resizeWidgetWrapperView_toSize_withTransitionContext_completion___block_invoke_2_68_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  objc_msgSend(*(id *)(a1 + 32), "platterView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setOverrideHeightForLayingOutContentView:", -1.0);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __94__WGWidgetListViewController_resizeWidgetWrapperView_toSize_withTransitionContext_completion___block_invoke_69(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEBUG))
    __94__WGWidgetListViewController_resizeWidgetWrapperView_toSize_withTransitionContext_completion___block_invoke_69_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WGWidgetListViewController;
  v4 = a3;
  -[WGWidgetListViewController traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  objc_msgSend(v4, "preferredContentSizeCategory", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[WGWidgetListViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if ((v8 & 1) == 0)
    -[WGWidgetListViewController _invokeBlockWithAllPlatterViews:](self, "_invokeBlockWithAllPlatterViews:", &__block_literal_global_72);
}

void __55__WGWidgetListViewController_traitCollectionDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "listItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "adjustForContentSizeCategoryChange");

}

- (void)_invokeBlock:(id)a3 withPlatterViewsPassingTest:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v9 = a3;
  v6 = a4;
  if (v9)
  {
    -[WGWidgetListViewController _scrollViewIfLoaded](self, "_scrollViewIfLoaded");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 || !self->_shouldIncludeScrollView)
    {
      -[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __71__WGWidgetListViewController__invokeBlock_withPlatterViewsPassingTest___block_invoke;
      v10[3] = &unk_24D732048;
      v11 = v6;
      v12 = v9;
      objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

    }
  }

}

void __71__WGWidgetListViewController__invokeBlock_withPlatterViewsPassingTest___block_invoke(uint64_t a1, void *a2)
{
  char isKindOfClass;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = v7;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "platterView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    if (!v6 || (*(unsigned int (**)(uint64_t, void *))(v6 + 16))(v6, v5))
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    v4 = v7;
  }

}

- (void)_invokeBlockWithAllPlatterViews:(id)a3
{
  -[WGWidgetListViewController _invokeBlock:withPlatterViewsPassingTest:](self, "_invokeBlock:withPlatterViewsPassingTest:", a3, 0);
}

- (void)_invokeBlockWithPlatterViewsVisibleInRect:(CGRect)a3 block:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  _QWORD v10[9];
  CGRect v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  if (v9)
  {
    v11.origin.x = x;
    v11.origin.y = y;
    v11.size.width = width;
    v11.size.height = height;
    if (CGRectGetHeight(v11) > 0.0)
    {
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __78__WGWidgetListViewController__invokeBlockWithPlatterViewsVisibleInRect_block___block_invoke;
      v10[3] = &unk_24D732070;
      v10[4] = self;
      *(CGFloat *)&v10[5] = x;
      *(CGFloat *)&v10[6] = y;
      *(CGFloat *)&v10[7] = width;
      *(CGFloat *)&v10[8] = height;
      -[WGWidgetListViewController _invokeBlock:withPlatterViewsPassingTest:](self, "_invokeBlock:withPlatterViewsPassingTest:", v9, v10);
    }
  }

}

BOOL __78__WGWidgetListViewController__invokeBlockWithPlatterViewsVisibleInRect_block___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  _BOOL8 v25;
  CGRect v27;

  v3 = a2;
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "widgetListView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "convertRect:toView:", v12, v5, v7, v9, v11);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  objc_msgSend(*(id *)(a1 + 32), "_wrapperViewForWidgetPlatterView:", v3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v27.origin.x = v14;
  v27.origin.y = v16;
  v27.size.width = v18;
  v27.size.height = v20;
  if (CGRectIntersectsRect(*(CGRect *)(a1 + 40), v27))
  {
    objc_msgSend(v21, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "alpha");
    if (v23 <= 0.0)
    {
      v25 = 0;
    }
    else
    {
      objc_msgSend(v21, "alpha");
      v25 = v24 > 0.0;
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (void)_invokeBlockWithPlatterViewsVisibleInBounds:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WGWidgetListViewController widgetListView](self, "widgetListView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  -[WGWidgetListViewController _invokeBlockWithPlatterViewsVisibleInRect:block:](self, "_invokeBlockWithPlatterViewsVisibleInRect:block:", v4);

}

- (id)_widgetIdentifiersForPlatterViewsVisibleInBounds
{
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __78__WGWidgetListViewController__widgetIdentifiersForPlatterViewsVisibleInBounds__block_invoke;
  v5[3] = &unk_24D732098;
  v5[4] = &v6;
  -[WGWidgetListViewController _invokeBlockWithPlatterViewsVisibleInBounds:](self, "_invokeBlockWithPlatterViewsVisibleInBounds:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __78__WGWidgetListViewController__widgetIdentifiersForPlatterViewsVisibleInBounds__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "widgetHost");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "widgetIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v4);

}

- (void)updateWidgetViewState
{
  NSArray *previouslyVisibleWidgetIDs;

  -[WGWidgetListViewController _updateWidgetViewStateWithPreviouslyVisibleWidgetIdentifiers:](self, "_updateWidgetViewStateWithPreviouslyVisibleWidgetIdentifiers:", self->_previouslyVisibleWidgetIDs);
  previouslyVisibleWidgetIDs = self->_previouslyVisibleWidgetIDs;
  self->_previouslyVisibleWidgetIDs = 0;

}

- (void)updatePreviouslyVisibleWidgetIDs
{
  NSArray *v3;
  NSArray *previouslyVisibleWidgetIDs;

  -[WGWidgetListViewController _widgetIdentifiersForPlatterViewsVisibleInBounds](self, "_widgetIdentifiersForPlatterViewsVisibleInBounds");
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  previouslyVisibleWidgetIDs = self->_previouslyVisibleWidgetIDs;
  self->_previouslyVisibleWidgetIDs = v3;

}

- (void)_updateWidgetViewStateWithPreviouslyVisibleWidgetIdentifiers:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  WGWidgetDiscoveryController *discoveryController;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[WGWidgetListViewController _appearState](self, "_appearState") == 2)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__3;
    v27 = __Block_byref_object_dispose__3;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v28 = (id)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __91__WGWidgetListViewController__updateWidgetViewStateWithPreviouslyVisibleWidgetIdentifiers___block_invoke;
    v22[3] = &unk_24D732098;
    v22[4] = &v23;
    -[WGWidgetListViewController _invokeBlockWithPlatterViewsVisibleInBounds:](self, "_invokeBlockWithPlatterViewsVisibleInBounds:", v22);
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "minusSet:", v24[5]);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    obj = v5;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v29, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v19 != v7)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          -[NSMutableDictionary objectForKey:](self->_widgetIDsToItemVCs, "objectForKey:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "wg_beginAppearanceTransitionIfNecessary:animated:", 0, 1);
          objc_msgSend(v10, "wg_endAppearanceTransitionIfNecessary");
          discoveryController = self->_discoveryController;
          v12 = (objc_class *)objc_opt_class();
          NSStringFromClass(v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[WGWidgetDiscoveryController widgetWithIdentifier:delegate:forRequesterWithIdentifier:](discoveryController, "widgetWithIdentifier:delegate:forRequesterWithIdentifier:", v9, self, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          +[WGWidgetEventTracker sharedInstance](WGWidgetEventTracker, "sharedInstance");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "widgetIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "widget:didDisappearInMode:", v16, objc_msgSend(v14, "activeDisplayMode"));

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v29, 16);
      }
      while (v6);
    }

    _Block_object_dispose(&v23, 8);
  }

}

void __91__WGWidgetListViewController__updateWidgetViewStateWithPreviouslyVisibleWidgetIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  void *v23;
  void *v24;

  v3 = a2;
  objc_msgSend(v3, "listItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "widgetIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "length"))
    {
      v7 = WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR))
        __91__WGWidgetListViewController__updateWidgetViewStateWithPreviouslyVisibleWidgetIdentifiers___block_invoke_cold_2((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
    }
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v6);
      objc_msgSend(v5, "wg_beginAppearanceTransitionIfNecessary:animated:", 1, 1);
      objc_msgSend(v5, "wg_endAppearanceTransitionIfNecessary");
      objc_msgSend(v5, "widgetHost");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "isRemoteViewVisible"))
      {
        objc_msgSend(v14, "_invalidateVisibleFrame");
      }
      else
      {
        v22 = 1.0;
        if ((objc_msgSend(v14, "isSnapshotLoaded") & 1) == 0 && (objc_msgSend(v14, "isBrokenViewVisible") & 1) == 0)
        {
          if (objc_msgSend(v14, "isLockedOut"))
            v22 = 1.0;
          else
            v22 = 0.0;
        }
        objc_msgSend(v3, "contentView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setAlpha:", v22);

        +[WGWidgetEventTracker sharedInstance](WGWidgetEventTracker, "sharedInstance");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "widget:didAppearInMode:", v6, objc_msgSend(v14, "activeDisplayMode"));

      }
    }

  }
  else
  {
    v15 = WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR))
      __91__WGWidgetListViewController__updateWidgetViewStateWithPreviouslyVisibleWidgetIdentifiers___block_invoke_cold_1((uint64_t)v3, v15, v16, v17, v18, v19, v20, v21);
  }

}

- (id)_wrapperViewForWidgetPlatterView:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  return v8;
}

- (void)setEditingIcons:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  self->_editingIcons = a3;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __46__WGWidgetListViewController_setEditingIcons___block_invoke;
  v3[3] = &__block_descriptor_33_e33_v24__0__WGWidgetPlatterView_8_B16l;
  v4 = a3;
  -[WGWidgetListViewController _invokeBlockWithAllPlatterViews:](self, "_invokeBlockWithAllPlatterViews:", v3);
}

uint64_t __46__WGWidgetListViewController_setEditingIcons___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setEditingIcons:", *(unsigned __int8 *)(a1 + 32));
}

- (UIControl)editButton
{
  UIControl *editButton;
  WGShortLookStyleButton *v4;
  void *v5;
  void *v6;
  UIControl *v7;

  editButton = self->_editButton;
  if (!editButton)
  {
    v4 = objc_alloc_init(WGShortLookStyleButton);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("WIDGETS_EDIT_BUTTON"), &stru_24D733868, CFSTR("Widgets"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGShortLookStyleButton setTitle:](v4, "setTitle:", v6);

    -[WGShortLookStyleButton setBackgroundBlurred:](v4, "setBackgroundBlurred:", self->_shouldBlurContent);
    -[WGShortLookStyleButton addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", self, sel__presentEditViewController, 64);
    -[WGShortLookStyleButton setMaterialGroupNameBase:](v4, "setMaterialGroupNameBase:", CFSTR("WGWidgetListViewControllerGroupName"));
    v7 = self->_editButton;
    self->_editButton = &v4->super;

    editButton = self->_editButton;
  }
  return editButton;
}

- (void)_presentEditViewController
{
  -[WGWidgetDiscoveryController presentWidgetListEditViewControllerFromViewController:animated:completion:](self->_discoveryController, "presentWidgetListEditViewControllerFromViewController:animated:completion:", self, 1, 0);
}

- (void)scrollViewDidScroll:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "performSelector:withObject:", sel_scrollViewDidScroll_, v5);

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  NSArray *v4;
  NSArray *previouslyVisibleWidgetIDs;
  id WeakRetained;
  id v7;

  v7 = a3;
  -[WGWidgetListViewController _cancelTouchesForHitWidgetIfNecessaryAndDisableTouchesOnAllWidgets](self, "_cancelTouchesForHitWidgetIfNecessaryAndDisableTouchesOnAllWidgets");
  -[WGWidgetListViewController _widgetIdentifiersForPlatterViewsVisibleInBounds](self, "_widgetIdentifiersForPlatterViewsVisibleInBounds");
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  previouslyVisibleWidgetIDs = self->_previouslyVisibleWidgetIDs;
  self->_previouslyVisibleWidgetIDs = v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "performSelector:withObject:", sel_scrollViewWillBeginDragging_, v7);

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  id WeakRetained;
  id v10;

  y = a4.y;
  x = a4.x;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v10, a5, x, y);

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;
  id v7;

  v4 = a4;
  v7 = a3;
  if (!v4 && (objc_msgSend(v7, "isDecelerating") & 1) == 0)
    -[WGWidgetListViewController _scrollViewDidStop](self, "_scrollViewDidStop");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "scrollViewDidEndDragging:willDecelerate:", v7, v4);

}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "performSelector:withObject:", sel_scrollViewWillBeginDecelerating_, v5);

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  -[WGWidgetListViewController _scrollViewDidStop](self, "_scrollViewDidStop");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "performSelector:withObject:", sel_scrollViewDidEndDecelerating_, v5);

}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  -[WGWidgetListViewController _scrollViewDidStop](self, "_scrollViewDidStop");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "performSelector:withObject:", sel_scrollViewDidEndScrollingAnimation_, v5);

}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  id v4;
  id WeakRetained;
  NSArray *v6;
  NSArray *previouslyVisibleWidgetIDs;
  BOOL v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && !objc_msgSend(WeakRetained, "scrollViewShouldScrollToTop:", v4))
  {
    v8 = 0;
  }
  else
  {
    -[WGWidgetListViewController _widgetIdentifiersForPlatterViewsVisibleInBounds](self, "_widgetIdentifiersForPlatterViewsVisibleInBounds");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    previouslyVisibleWidgetIDs = self->_previouslyVisibleWidgetIDs;
    self->_previouslyVisibleWidgetIDs = v6;

    v8 = 1;
  }

  return v8;
}

- (void)scrollViewDidScrollToTop:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  -[WGWidgetListViewController _scrollViewDidStop](self, "_scrollViewDidStop");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "performSelector:withObject:", sel_scrollViewDidScrollToTop_, v5);

}

- (void)_scrollViewDidStop
{
  NSArray *previouslyVisibleWidgetIDs;

  -[WGWidgetListViewController _updateWidgetViewStateWithPreviouslyVisibleWidgetIdentifiers:](self, "_updateWidgetViewStateWithPreviouslyVisibleWidgetIdentifiers:", self->_previouslyVisibleWidgetIDs);
  previouslyVisibleWidgetIDs = self->_previouslyVisibleWidgetIDs;
  self->_previouslyVisibleWidgetIDs = 0;

  -[WGWidgetListViewController _invalidateAllCancelTouchesAssertions](self, "_invalidateAllCancelTouchesAssertions");
}

- (void)widgetDiscoveryControllerSignificantWidgetsChange:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  -[WGWidgetListViewController widgetListView](self, "widgetListView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentOffset");
  v6 = v5;
  v8 = v7;

  -[WGWidgetListViewController _repopulateStackView](self, "_repopulateStackView");
  -[WGWidgetListViewController widgetListView](self, "widgetListView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContentOffset:", v6, v8);

}

- (void)widgetDiscoveryController:(id)a3 orderDidChangeForWidgetIdentifiers:(id)a4
{
  id v6;
  NSArray *v7;
  NSArray *previouslyVisibleWidgetIDs;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id obj;
  _QWORD v21[4];
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id location;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v19 = a3;
  v6 = a4;
  objc_initWeak(&location, self);
  -[WGWidgetListViewController _widgetIdentifiersForPlatterViewsVisibleInBounds](self, "_widgetIdentifiersForPlatterViewsVisibleInBounds");
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  previouslyVisibleWidgetIDs = self->_previouslyVisibleWidgetIDs;
  self->_previouslyVisibleWidgetIDs = v7;

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v27;
    v11 = MEMORY[0x24BDAC760];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(obj);
        -[WGWidgetListViewController _listItemViewControllerForWidgetWithIdentifier:creatingIfNecessary:](self, "_listItemViewControllerForWidgetWithIdentifier:creatingIfNecessary:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v12), 0, v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "platterView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[WGWidgetListViewController _wrapperViewForWidgetPlatterView:](self, "_wrapperViewForWidgetPlatterView:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x24BDF6F90];
        v23[0] = v11;
        v23[1] = 3221225472;
        v23[2] = __91__WGWidgetListViewController_widgetDiscoveryController_orderDidChangeForWidgetIdentifiers___block_invoke;
        v23[3] = &unk_24D731788;
        v23[4] = self;
        v17 = v13;
        v24 = v17;
        v18 = v15;
        v25 = v18;
        v21[0] = v11;
        v21[1] = 3221225472;
        v21[2] = __91__WGWidgetListViewController_widgetDiscoveryController_orderDidChangeForWidgetIdentifiers___block_invoke_2;
        v21[3] = &unk_24D7320C0;
        objc_copyWeak(&v22, &location);
        objc_msgSend(v16, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v23, v21, 0.5, 0.0, 1.0, 0.0);
        objc_destroyWeak(&v22);

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v9);
  }

  objc_destroyWeak(&location);
}

void __91__WGWidgetListViewController_widgetDiscoveryController_orderDidChangeForWidgetIdentifiers___block_invoke(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(id **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2[125], "arrangedSubviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "visibleWidgetIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "_insertionIndexofListItem:intoWidgetViews:withOrderedIdentifiers:", v3, v4, v5);

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "insertArrangedSubview:atIndex:", *(_QWORD *)(a1 + 48), v6);
}

void __91__WGWidgetListViewController_widgetDiscoveryController_orderDidChangeForWidgetIdentifiers___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_previouslyVisibleWidgetIDs");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_updateWidgetViewStateWithPreviouslyVisibleWidgetIdentifiers:", v1);

}

- (CGRect)_visibleContentFrameForBounds:(CGRect)a3 withContentOccludingInsets:(UIEdgeInsets)a4
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[WGWidgetListViewController widgetListView](self, "widgetListView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentInset");

  UIRectInset();
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGSize)_maxVisibleContentSize
{
  CGSize *p_maxVisibleContentSize;
  double width;
  double height;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id WeakRetained;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  CGSize result;

  p_maxVisibleContentSize = &self->_maxVisibleContentSize;
  width = self->_maxVisibleContentSize.width;
  height = self->_maxVisibleContentSize.height;
  if (width == 0.0 && height == 0.0)
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v8 = 4;
    else
      v8 = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "widgetListViewController:sizeForInterfaceOrientation:", self, v8);
    }
    else
    {
      -[WGWidgetListViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "widgetListViewController:contentOccludingInsetsForInterfaceOrientation:", self, v8);
    BSRectWithSize();
    -[WGWidgetListViewController _visibleContentFrameForBounds:withContentOccludingInsets:](self, "_visibleContentFrameForBounds:withContentOccludingInsets:");
    p_maxVisibleContentSize->width = v11;
    p_maxVisibleContentSize->height = v12;

    width = p_maxVisibleContentSize->width;
    height = p_maxVisibleContentSize->height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)maxSizeForWidget:(id)a3 forDisplayMode:(int64_t)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGSize result;

  v6 = a3;
  -[WGWidgetListViewController _maxVisibleContentSize](self, "_maxVisibleContentSize");
  v8 = v7;
  v10 = v9;
  +[WGWidgetInfo maximumContentHeightForCompactDisplayMode](WGWidgetInfo, "maximumContentHeightForCompactDisplayMode");
  v12 = v11;
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDE27F0], "defaultWidgetRowHeight");
    v14 = v13;
    objc_msgSend(MEMORY[0x24BDE27F0], "widgetRowHeight");
    v16 = v15;
    objc_msgSend(v6, "widgetIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetListViewController _platterViewForWidgetWithIdentifier:creatingIfNecessary:](self, "_platterViewForWidgetWithIdentifier:creatingIfNecessary:", v17, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "contentSizeForSize:", v8, v10);
    if (v14 <= v16)
      v20 = v14;
    else
      v20 = v16;
    v21 = floor(v19 / v20);

    if (v16 * (double)(uint64_t)v21 >= v12)
      v12 = v16 * (double)(uint64_t)v21;
  }

  v22 = v8;
  v23 = v12;
  result.height = v23;
  result.width = v22;
  return result;
}

- (void)registerWidgetForRefreshEvents:(id)a3
{
  WGWidgetDiscoveryController *discoveryController;
  id v4;

  discoveryController = self->_discoveryController;
  objc_msgSend(a3, "widgetIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WGWidgetDiscoveryController registerIdentifierForRefreshEvents:](discoveryController, "registerIdentifierForRefreshEvents:", v4);

}

- (void)unregisterWidgetForRefreshEvents:(id)a3
{
  WGWidgetDiscoveryController *discoveryController;
  id v4;

  discoveryController = self->_discoveryController;
  objc_msgSend(a3, "widgetIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WGWidgetDiscoveryController unregisterIdentifierForRefreshEvents:](discoveryController, "unregisterIdentifierForRefreshEvents:", v4);

}

- (UIEdgeInsets)marginInsetsForWidget:(id)a3
{
  void *v3;
  int v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIEdgeInsets result;

  -[WGWidgetListViewController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_shouldReverseLayoutDirection");
  if (v4)
    v5 = 0.0;
  else
    v5 = 15.0;
  if (v4)
    v6 = 15.0;
  else
    v6 = 0.0;

  v7 = 0.0;
  v8 = 0.0;
  v9 = v5;
  v10 = v6;
  result.right = v10;
  result.bottom = v8;
  result.left = v9;
  result.top = v7;
  return result;
}

- (UIEdgeInsets)layoutMarginForWidget:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIEdgeInsets result;

  v3 = *MEMORY[0x24BDE27F8];
  v4 = *(double *)(MEMORY[0x24BDE27F8] + 8);
  v5 = *(double *)(MEMORY[0x24BDE27F8] + 24);
  -[WGWidgetListViewController _maxVisibleContentSize](self, "_maxVisibleContentSize", a3);
  +[WGWidgetPlatterView contentBaselineToBoundsBottomWithWidth:](WGWidgetPlatterView, "contentBaselineToBoundsBottomWithWidth:");
  v7 = v6;
  v8 = v3;
  v9 = v4;
  v10 = v5;
  result.right = v10;
  result.bottom = v7;
  result.left = v9;
  result.top = v8;
  return result;
}

- (void)widget:(id)a3 didChangeLargestSupportedDisplayMode:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  int64_t v11;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDF6F90];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __74__WGWidgetListViewController_widget_didChangeLargestSupportedDisplayMode___block_invoke;
  v9[3] = &unk_24D731CD8;
  v9[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  objc_msgSend(v7, "animateWithDuration:animations:", v9, 0.5);

}

void __74__WGWidgetListViewController_widget_didChangeLargestSupportedDisplayMode___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "widgetIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_platterViewForWidgetWithIdentifier:creatingIfNecessary:", v4, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowMoreButtonVisible:", *(_QWORD *)(a1 + 48) == 1);

}

- (void)remoteViewControllerViewDidAppearForWidget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (-[UIViewController wg_isAppearingOrAppeared](self, "wg_isAppearingOrAppeared")
    && objc_msgSend(v4, "isRemoteViewVisible"))
  {
    objc_msgSend(v4, "_invalidateVisibleFrame");
    objc_msgSend(v4, "widgetIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetListViewController _platterViewForWidgetWithIdentifier:creatingIfNecessary:](self, "_platterViewForWidgetWithIdentifier:creatingIfNecessary:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x24BDF6F90];
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __73__WGWidgetListViewController_remoteViewControllerViewDidAppearForWidget___block_invoke;
      v8[3] = &unk_24D7314D8;
      v9 = v6;
      objc_msgSend(v7, "animateWithDuration:animations:", v8, 0.25);

    }
  }

}

void __73__WGWidgetListViewController_remoteViewControllerViewDidAppearForWidget___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)remoteViewControllerViewDidHideForWidget:(id)a3
{
  NSMutableDictionary *cancelTouchesAssertionsByWidgetID;
  void *v4;
  id v5;

  cancelTouchesAssertionsByWidgetID = self->_cancelTouchesAssertionsByWidgetID;
  objc_msgSend(a3, "widgetIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](cancelTouchesAssertionsByWidgetID, "objectForKey:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

}

- (void)brokenViewDidAppearForWidget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (-[UIViewController wg_isAppearingOrAppeared](self, "wg_isAppearingOrAppeared")
    && (objc_msgSend(v4, "isSnapshotLoaded") & 1) == 0
    && (objc_msgSend(v4, "isRemoteViewVisible") & 1) == 0)
  {
    objc_msgSend(v4, "widgetIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetListViewController _platterViewForWidgetWithIdentifier:creatingIfNecessary:](self, "_platterViewForWidgetWithIdentifier:creatingIfNecessary:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x24BDF6F90];
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __59__WGWidgetListViewController_brokenViewDidAppearForWidget___block_invoke;
      v8[3] = &unk_24D7314D8;
      v9 = v6;
      objc_msgSend(v7, "animateWithDuration:animations:", v8, 0.25);

    }
  }

}

void __59__WGWidgetListViewController_brokenViewDidAppearForWidget___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)remoteViewControllerDidDisconnectForWidget:(id)a3
{
  objc_msgSend(a3, "setDisconnectsImmediately:", 0);
}

- (CGRect)visibleFrameForWidget:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id WeakRetained;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double x;
  double y;
  double width;
  double height;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CGRect v55;
  CGRect v56;
  CGRect result;
  CGRect v58;

  v4 = a3;
  v5 = *MEMORY[0x24BDBF090];
  v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v8 = *(double *)(MEMORY[0x24BDBF090] + 24);
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "widgetListViewController:contentOccludingInsetsForInterfaceOrientation:", self, objc_msgSend((id)*MEMORY[0x24BDF74F8], "activeInterfaceOrientation"));
    -[WGWidgetListViewController widgetListView](self, "widgetListView", *(_QWORD *)&v8, *(_QWORD *)&v7, *(_QWORD *)&v6, *(_QWORD *)&v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    -[WGWidgetListViewController _visibleContentFrameForBounds:withContentOccludingInsets:](self, "_visibleContentFrameForBounds:withContentOccludingInsets:");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

    -[WGWidgetListViewController widgetListView](self, "widgetListView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "frame");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    objc_msgSend(v20, "superview");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "convertRect:fromView:", v29, v22, v24, v26, v28);
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v37 = v36;

    v55.origin.x = v12;
    v55.origin.y = v14;
    v55.size.width = v16;
    v55.size.height = v18;
    v58.origin.x = v31;
    v58.origin.y = v33;
    v58.size.width = v35;
    v58.size.height = v37;
    v56 = CGRectIntersection(v55, v58);
    x = v56.origin.x;
    y = v56.origin.y;
    width = v56.size.width;
    height = v56.size.height;
    v6 = v53;
    v5 = v54;
    v8 = v51;
    v7 = v52;
    if (!CGRectIsNull(v56))
    {
      objc_msgSend(v4, "view");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "convertRect:fromView:", v19, x, y, width, height);
      v5 = v43;
      v6 = v44;
      v7 = v45;
      v8 = v46;

    }
  }

  v47 = v5;
  v48 = v6;
  v49 = v7;
  v50 = v8;
  result.size.height = v50;
  result.size.width = v49;
  result.origin.y = v48;
  result.origin.x = v47;
  return result;
}

- (id)widgetListItemViewController:(id)a3 widgetHostWithIdentifier:(id)a4
{
  WGWidgetDiscoveryController *discoveryController;
  id v6;
  objc_class *v7;
  void *v8;
  void *v9;

  discoveryController = self->_discoveryController;
  v6 = a4;
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGWidgetDiscoveryController widgetWithIdentifier:delegate:forRequesterWithIdentifier:](discoveryController, "widgetWithIdentifier:delegate:forRequesterWithIdentifier:", v6, self, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isWidgetExtensionVisible:(id)a3
{
  id v4;
  char v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  if (-[WGWidgetListViewController _appearState](self, "_appearState"))
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __55__WGWidgetListViewController_isWidgetExtensionVisible___block_invoke;
    v7[3] = &unk_24D7320E8;
    v8 = v4;
    v9 = &v10;
    -[WGWidgetListViewController _invokeBlockWithPlatterViewsVisibleInBounds:](self, "_invokeBlockWithPlatterViewsVisibleInBounds:", v7);

  }
  v5 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __55__WGWidgetListViewController_isWidgetExtensionVisible___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  int v7;

  objc_msgSend(a2, "widgetHost");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "widgetIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (WGWidgetListViewControllerDelegatePrivate)delegate
{
  return (WGWidgetListViewControllerDelegatePrivate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldBlurContent
{
  return self->_shouldBlurContent;
}

- (void)setEditButton:(id)a3
{
  objc_storeStrong((id *)&self->_editButton, a3);
}

- (BOOL)isEditingIcons
{
  return self->_editingIcons;
}

- (BOOL)shouldIncludeScrollView
{
  return self->_shouldIncludeScrollView;
}

- (void)setShouldIncludeScrollView:(BOOL)a3
{
  self->_shouldIncludeScrollView = a3;
}

- (NSArray)_previouslyVisibleWidgetIDs
{
  return self->_previouslyVisibleWidgetIDs;
}

- (void)_setPreviouslyVisibleWidgetIDs:(id)a3
{
  objc_storeStrong((id *)&self->_previouslyVisibleWidgetIDs, a3);
}

- (NSLayoutConstraint)stackViewBottomConstraint
{
  return self->_stackViewBottomConstraint;
}

- (NSMutableDictionary)resizeContexts
{
  return self->_resizeContexts;
}

- (void)setResizeContexts:(id)a3
{
  objc_storeStrong((id *)&self->_resizeContexts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resizeContexts, 0);
  objc_storeStrong((id *)&self->_stackViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_previouslyVisibleWidgetIDs, 0);
  objc_storeStrong((id *)&self->_editButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_widgetIDsToItemVCs, 0);
  objc_storeStrong((id *)&self->_cancelTouchesAssertionsByWidgetID, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_userInterfaceStylesToCaptureOnlyMaterialViews, 0);
  objc_storeStrong((id *)&self->_captureOnlyMaterialView, 0);
  objc_storeStrong((id *)&self->_discoveryController, 0);
}

- (id)visibleWidgetIdentifiers
{
  WGWidgetDiscoveryController *discoveryController;
  void *v3;
  void *v4;

  discoveryController = self->_discoveryController;
  -[WGWidgetListViewController _group](self, "_group");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGWidgetDiscoveryController visibleWidgetIdentifiersForGroup:](discoveryController, "visibleWidgetIdentifiersForGroup:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)makeVisibleWidgetWithIdentifier:(id)a3 completion:(id)a4
{
  void (**v6)(id, BOOL);
  void *v7;
  NSArray *v8;
  NSArray *previouslyVisibleWidgetIDs;
  void *v10;
  id v11;

  v11 = a3;
  v6 = (void (**)(id, BOOL))a4;
  if (objc_msgSend(v11, "length"))
  {
    -[WGWidgetListViewController _platterViewForWidgetWithIdentifier:creatingIfNecessary:](self, "_platterViewForWidgetWithIdentifier:creatingIfNecessary:", v11, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[WGWidgetListViewController _widgetIdentifiersForPlatterViewsVisibleInBounds](self, "_widgetIdentifiersForPlatterViewsVisibleInBounds");
      v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
      previouslyVisibleWidgetIDs = self->_previouslyVisibleWidgetIDs;
      self->_previouslyVisibleWidgetIDs = v8;

      -[WGWidgetListViewController widgetListView](self, "widgetListView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "frame");
      objc_msgSend(v10, "scrollRectToVisible:animated:", 1);

    }
    if (v6)
      v6[2](v6, v7 != 0);

  }
  else if (v6)
  {
    v6[2](v6, 0);
  }

}

void __94__WGWidgetListViewController_resizeWidgetWrapperView_toSize_withTransitionContext_completion___block_invoke_2_cold_1(uint64_t a1, char a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 56);
  v4 = 134218240;
  v5 = v3;
  v6 = 1024;
  v7 = a2 & 1;
  _os_log_debug_impl(&dword_2172E1000, log, OS_LOG_TYPE_DEBUG, "C2 completion %lu - retargeted: %{BOOL}d", (uint8_t *)&v4, 0x12u);
  OUTLINED_FUNCTION_2();
}

void __94__WGWidgetListViewController_resizeWidgetWrapperView_toSize_withTransitionContext_completion___block_invoke_2_68_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_2172E1000, a2, a3, "CA completion %lu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __94__WGWidgetListViewController_resizeWidgetWrapperView_toSize_withTransitionContext_completion___block_invoke_69_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_2172E1000, a2, a3, "final completion %lu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __91__WGWidgetListViewController__updateWidgetViewStateWithPreviouslyVisibleWidgetIdentifiers___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_2172E1000, a2, a3, "Encountered widget short look view with no list item: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __91__WGWidgetListViewController__updateWidgetViewStateWithPreviouslyVisibleWidgetIdentifiers___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_2172E1000, a2, a3, "Encountered list item without a widget identifier: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
