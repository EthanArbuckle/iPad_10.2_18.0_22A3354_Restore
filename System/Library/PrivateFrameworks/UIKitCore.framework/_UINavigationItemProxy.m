@implementation _UINavigationItemProxy

- (_UINavigationItemProxy)initWithDestinationNavigationItem:(id)a3 sourceNavigationItem:(id)a4
{
  id v7;
  id v8;
  _UINavigationItemProxy *v9;
  _UINavigationItemProxy *v10;
  id v11;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t v16[16];
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_UINavigationItemProxy;
  v9 = -[_UINavigationItemProxy init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    if (v7 == v8)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v16 = 0;
          _os_log_fault_impl(&dword_185066000, v15, OS_LOG_TYPE_FAULT, "destinationNavigationItem == sourceNavigationItem. This will cause infinite recursion and is not a valid configuration.", v16, 2u);
        }

      }
      else
      {
        v13 = initWithDestinationNavigationItem_sourceNavigationItem____s_category;
        if (!initWithDestinationNavigationItem_sourceNavigationItem____s_category)
        {
          v13 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v13, (unint64_t *)&initWithDestinationNavigationItem_sourceNavigationItem____s_category);
        }
        v14 = *(NSObject **)(v13 + 8);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v16 = 0;
          _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "destinationNavigationItem == sourceNavigationItem. This will cause infinite recursion and is not a valid configuration.", v16, 2u);
        }
      }
    }
    else
    {
      objc_storeStrong((id *)&v9->_destinationNavigationItem, a3);
      v11 = objc_storeWeak((id *)&v10->_sourceNavigationItem, v8);
      objc_msgSend(v8, "_setChangeObserver:", v10);

      -[_UINavigationItemProxy reloadDestinationItemFromSource](v10, "reloadDestinationItemFromSource");
    }
  }

  return v10;
}

- (void)reloadDestinationItemFromSource
{
  id WeakRetained;
  id v4;
  _QWORD v5[5];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sourceNavigationItem);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57___UINavigationItemProxy_reloadDestinationItemFromSource__block_invoke;
  v5[3] = &unk_1E16B1B50;
  v5[4] = self;
  v6 = WeakRetained;
  v4 = WeakRetained;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v5);

}

- (BOOL)navigationItemIsTopItem:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  -[UINavigationItem _changeObserver](self->_destinationNavigationItem, "_changeObserver", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 1;
  -[UINavigationItem _changeObserver](self->_destinationNavigationItem, "_changeObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "navigationItemIsTopItem:", self->_destinationNavigationItem);

  return v6;
}

- (BOOL)navigationItemIsBackItem:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  -[UINavigationItem _changeObserver](self->_destinationNavigationItem, "_changeObserver", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  -[UINavigationItem _changeObserver](self->_destinationNavigationItem, "_changeObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "navigationItemIsBackItem:", self->_destinationNavigationItem);

  return v6;
}

- (void)navigationItemUpdatedTitleContent:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  UINavigationItem *destinationNavigationItem;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  destinationNavigationItem = self->_destinationNavigationItem;
  v7 = a3;
  objc_msgSend(v7, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationItem _setTitle:animated:](destinationNavigationItem, "_setTitle:animated:", v8, v4);

  objc_msgSend(v7, "titleView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationItem setTitleView:](self->_destinationNavigationItem, "setTitleView:", v9);

  objc_msgSend(v7, "_weeTitle");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[UINavigationItem _setWeeTitle:](self->_destinationNavigationItem, "_setWeeTitle:", v10);
}

- (void)navigationItemUpdatedLeftBarButtonItems:(id)a3 animated:(BOOL)a4
{
  id v5;
  UINavigationItem *destinationNavigationItem;
  UINavigationItem *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;

  v5 = a3;
  v14 = 0;
  v15 = 0;
  objc_msgSend(v5, "_getLeadingItems:groups:", &v15, &v14);
  if (v15)
  {
    destinationNavigationItem = self->_destinationNavigationItem;
LABEL_3:
    -[UINavigationItem setLeftBarButtonItems:](destinationNavigationItem, "setLeftBarButtonItems:");
    goto LABEL_6;
  }
  v7 = self->_destinationNavigationItem;
  if (v14)
  {
LABEL_5:
    -[UINavigationItem setLeadingItemGroups:](v7, "setLeadingItemGroups:");
    goto LABEL_6;
  }
  -[UINavigationItem leftBarButtonItems](v7, "leftBarButtonItems");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(v5, "leftBarButtonItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      destinationNavigationItem = self->_destinationNavigationItem;
      goto LABEL_3;
    }
  }
  -[UINavigationItem leadingItemGroups](self->_destinationNavigationItem, "leadingItemGroups");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "count"))
  {

    goto LABEL_6;
  }
  objc_msgSend(v5, "leadingItemGroups");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (!v13)
  {
    v7 = self->_destinationNavigationItem;
    goto LABEL_5;
  }
LABEL_6:

}

- (void)navigationItemUpdatedRightBarButtonItems:(id)a3 animated:(BOOL)a4
{
  id v5;
  UINavigationItem *destinationNavigationItem;
  UINavigationItem *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;

  v5 = a3;
  v14 = 0;
  v15 = 0;
  objc_msgSend(v5, "_getTrailingItems:groups:", &v15, &v14);
  if (v15)
  {
    destinationNavigationItem = self->_destinationNavigationItem;
LABEL_3:
    -[UINavigationItem setRightBarButtonItems:](destinationNavigationItem, "setRightBarButtonItems:");
    goto LABEL_6;
  }
  v7 = self->_destinationNavigationItem;
  if (v14)
  {
LABEL_5:
    -[UINavigationItem setTrailingItemGroups:](v7, "setTrailingItemGroups:");
    goto LABEL_6;
  }
  -[UINavigationItem rightBarButtonItems](v7, "rightBarButtonItems");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(v5, "rightBarButtonItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      destinationNavigationItem = self->_destinationNavigationItem;
      goto LABEL_3;
    }
  }
  -[UINavigationItem trailingItemGroups](self->_destinationNavigationItem, "trailingItemGroups");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "count"))
  {

    goto LABEL_6;
  }
  objc_msgSend(v5, "trailingItemGroups");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (!v13)
  {
    v7 = self->_destinationNavigationItem;
    goto LABEL_5;
  }
LABEL_6:

}

- (void)navigationItemUpdatedContentLayout:(id)a3 animated:(BOOL)a4
{
  id v5;
  uint64_t v6;

  v5 = a3;
  -[UINavigationItem setHidesBackButton:](self->_destinationNavigationItem, "setHidesBackButton:", objc_msgSend(v5, "hidesBackButton"));
  v6 = objc_msgSend(v5, "leftItemsSupplementBackButton");

  -[UINavigationItem setLeftItemsSupplementBackButton:](self->_destinationNavigationItem, "setLeftItemsSupplementBackButton:", v6);
}

- (void)navigationItemUpdatedBackButtonContent:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  if (-[_UINavigationItemProxy navigationItemIsBackItem:](self, "navigationItemIsBackItem:"))
  {
    -[_UINavigationItemProxy navigationItemUpdatedTitleContent:animated:](self, "navigationItemUpdatedTitleContent:animated:", v8, v4);
  }
  else
  {
    objc_msgSend(v8, "backButtonTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationItem setBackButtonTitle:](self->_destinationNavigationItem, "setBackButtonTitle:", v6);

    objc_msgSend(v8, "backBarButtonItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationItem setBackBarButtonItem:](self->_destinationNavigationItem, "setBackBarButtonItem:", v7);

  }
}

- (void)navigationItemUpdatedLargeTitleDisplayMode:(id)a3
{
  -[UINavigationItem setLargeTitleDisplayMode:](self->_destinationNavigationItem, "setLargeTitleDisplayMode:", objc_msgSend(a3, "largeTitleDisplayMode"));
}

- (void)navigationItemUpdatedLargeTitleContent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(v4, "_largeTitleAccessoryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationItem _setLargeTitleAccessoryView:](self->_destinationNavigationItem, "_setLargeTitleAccessoryView:", v5);

  v6 = objc_msgSend(v4, "_largeTitleTwoLineMode");
  -[UINavigationItem _setLargeTitleTwoLineMode:](self->_destinationNavigationItem, "_setLargeTitleTwoLineMode:", v6);
}

- (void)navigationItem:(id)a3 appearance:(id)a4 categoriesChanged:(int64_t)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  objc_msgSend(v6, "compactAppearance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationItem setCompactAppearance:](self->_destinationNavigationItem, "setCompactAppearance:", v7);

  objc_msgSend(v6, "standardAppearance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationItem setStandardAppearance:](self->_destinationNavigationItem, "setStandardAppearance:", v8);

  objc_msgSend(v6, "scrollEdgeAppearance");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[UINavigationItem setScrollEdgeAppearance:](self->_destinationNavigationItem, "setScrollEdgeAppearance:", v9);
}

- (void)navigationItemSearchControllerReadyForDeferredAutomaticShowsScopeBar:(id)a3
{
  -[UINavigationItem _searchControllerReadyForDeferredAutomaticShowsScopeBar](self->_destinationNavigationItem, "_searchControllerReadyForDeferredAutomaticShowsScopeBar", a3);
}

- (void)navigationItemUpdatedBackgroundAppearance:(id)a3
{
  -[UINavigationItem _setBackgroundHidden:](self->_destinationNavigationItem, "_setBackgroundHidden:", objc_msgSend(a3, "_backgroundHidden"));
}

- (void)navigationItemUpdatedScrollEdgeProgress:(id)a3
{
  id v4;
  double v5;
  double v6;

  v4 = a3;
  -[UINavigationItem _setManualScrollEdgeAppearanceEnabled:](self->_destinationNavigationItem, "_setManualScrollEdgeAppearanceEnabled:", objc_msgSend(v4, "_isManualScrollEdgeAppearanceEnabled"));
  objc_msgSend(v4, "_manualScrollEdgeAppearanceProgress");
  v6 = v5;

  -[UINavigationItem _setManualScrollEdgeAppearanceProgress:](self->_destinationNavigationItem, "_setManualScrollEdgeAppearanceProgress:", v6);
}

- (void)navigationItemUpdatedPromptContent:(id)a3
{
  id v4;

  objc_msgSend(a3, "prompt");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UINavigationItem setPrompt:](self->_destinationNavigationItem, "setPrompt:", v4);

}

- (void)navigationItemUpdatedSearchController:(id)a3 oldSearchController:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;

  v5 = a3;
  objc_msgSend(v5, "searchController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationItem setSearchController:](self->_destinationNavigationItem, "setSearchController:", v6);

  -[UINavigationItem setHidesSearchBarWhenScrolling:](self->_destinationNavigationItem, "setHidesSearchBarWhenScrolling:", objc_msgSend(v5, "hidesSearchBarWhenScrolling"));
  v7 = objc_msgSend(v5, "preferredSearchBarPlacement");

  -[UINavigationItem setPreferredSearchBarPlacement:](self->_destinationNavigationItem, "setPreferredSearchBarPlacement:", v7);
}

- (void)navigationItemUpdatedBottomPalette:(id)a3 oldPalette:(id)a4
{
  id v5;

  objc_msgSend(a3, "_bottomPalette");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UINavigationItem _setBottomPalette:](self->_destinationNavigationItem, "_setBottomPalette:", v5);

}

- (void)navigationItemUpdatedCenterBarButtonItems:(id)a3 animated:(BOOL)a4
{
  id v5;

  objc_msgSend(a3, "centerItemGroups");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UINavigationItem setCenterItemGroups:](self->_destinationNavigationItem, "setCenterItemGroups:", v5);

}

- (void)navigationItemUpdatedAdditionalOverflowItems:(id)a3
{
  id v4;

  objc_msgSend(a3, "additionalOverflowItems");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UINavigationItem setAdditionalOverflowItems:](self->_destinationNavigationItem, "setAdditionalOverflowItems:", v4);

}

- (void)navigationItemUpdatedNavigationBarVisibility:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  -[UINavigationItem _setPreferredNavigationBarVisibility:](self->_destinationNavigationItem, "_setPreferredNavigationBarVisibility:", objc_msgSend(v4, "_navigationBarVisibility"));
  v5 = objc_msgSend(v4, "_isNavigationBarHidden");

  -[UINavigationItem _setNavigationBarHidden:](self->_destinationNavigationItem, "_setNavigationBarHidden:", v5);
}

- (void)navigationItem:(id)a3 updatedPalettePart:(int64_t)a4 oldPalette:(id)a5
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  objc_msgSend(v6, "_topPalette");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationItem _setTopPalette:](self->_destinationNavigationItem, "_setTopPalette:", v7);

  objc_msgSend(v6, "_bottomPalette");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[UINavigationItem _setBottomPalette:](self->_destinationNavigationItem, "_setBottomPalette:", v8);
}

- (BOOL)shouldSearchControllerDeferPresentationTransitionForNavigationItem:(id)a3
{
  UINavigationItem *destinationNavigationItem;
  void *v4;

  destinationNavigationItem = self->_destinationNavigationItem;
  objc_msgSend(a3, "searchController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(destinationNavigationItem) = -[UINavigationItem _shouldSearchControllerDeferPresentationTransition:](destinationNavigationItem, "_shouldSearchControllerDeferPresentationTransition:", v4);

  return (char)destinationNavigationItem;
}

- (id)presentationSourceForContent:(int64_t)a3 navigationItem:(id)a4
{
  return -[UINavigationItem overflowPresentationSource](self->_destinationNavigationItem, "overflowPresentationSource", a3, a4);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sourceNavigationItem);
  objc_storeStrong((id *)&self->_destinationNavigationItem, 0);
}

@end
