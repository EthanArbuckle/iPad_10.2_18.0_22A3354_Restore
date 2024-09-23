@implementation UINavigationItem

- (BOOL)_hasInlineSearchBar
{
  UINavigationItem *v2;
  void *v3;
  void *v4;
  BOOL v5;

  if (!self->_searchController)
    return 0;
  v2 = self;
  -[UINavigationItem _navigationBar](v2, "_navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = _UINavigationItemUseInlineSearchLayoutForTraits(v2, v4);

  return v5;
}

- (UINavigationItemSearchBarPlacement)preferredSearchBarPlacement
{
  return self->_preferredSearchBarPlacement;
}

- (UINavigationBar)navigationBar
{
  return (UINavigationBar *)objc_loadWeakRetained((id *)&self->_navigationBar);
}

- (BOOL)hidesSearchBarWhenScrolling
{
  return (*(_WORD *)&self->_navigationItemFlags & 4) == 0;
}

- (_UINavigationBarItemStackEntry)_stackEntry
{
  return self->__stackEntry;
}

- (UISearchController)_searchControllerIfAllowed
{
  return self->_searchController;
}

- (BOOL)_alwaysUseManualScrollEdgeAppearance
{
  return self->_alwaysUseManualScrollEdgeAppearance;
}

- (double)_manualScrollEdgeAppearanceProgress
{
  return self->_manualScrollEdgeAppearanceProgress;
}

- (BOOL)_backgroundHidden
{
  return self->__backgroundHidden;
}

- (BOOL)_preserveSearchBarAcrossTransitions
{
  return self->__preserveSearchBarAcrossTransitions;
}

- (BOOL)_isManualScrollEdgeAppearanceEnabled
{
  return self->_manualScrollEdgeAppearanceEnabled;
}

- (NSString)prompt
{
  return self->_prompt;
}

- (_UINavigationBarPalette)_bottomPalette
{
  return self->_bottomPalette;
}

- (_UINavigationBarPalette)_topPalette
{
  return self->_topPalette;
}

- (BOOL)_hasInlineSearchBarForTraits:(id)a3
{
  return self->_searchController && _UINavigationItemUseInlineSearchLayoutForTraits(self, a3);
}

- (UINavigationItemLargeTitleDisplayMode)largeTitleDisplayMode
{
  return self->_largeTitleDisplayMode;
}

- (NSDirectionalEdgeInsets)largeTitleInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_largeTitleInsets.top;
  leading = self->_largeTitleInsets.leading;
  bottom = self->_largeTitleInsets.bottom;
  trailing = self->_largeTitleInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (BOOL)useRelativeLargeTitleInsets
{
  return self->_useRelativeLargeTitleInsets;
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)_setManualScrollEdgeAppearanceProgress:(double)a3
{
  id WeakRetained;

  self->_manualScrollEdgeAppearanceProgress = fmin(fmax(a3, 0.0), 1.0);
  WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
  objc_msgSend(WeakRetained, "navigationItemUpdatedScrollEdgeProgress:", self);

}

- (UINavigationBarAppearance)scrollEdgeAppearance
{
  return self->_scrollEdgeAppearance;
}

- (double)_autoScrollEdgeTransitionDistance
{
  return self->_autoScrollEdgeTransitionDistance;
}

- (NSString)title
{
  return self->_title;
}

- (_UINavigationItemRenameHandler)_dci_renameHandler
{
  return self->_renameHandler;
}

- (BOOL)hidesBackButton
{
  return *(_WORD *)&self->_navigationItemFlags & 1;
}

- (NSString)_weeTitle
{
  return self->__weeTitle;
}

- (UIView)titleView
{
  return self->_titleView;
}

- (UIAction)backAction
{
  return self->_backAction;
}

- (NSString)customizationIdentifier
{
  return self->_customizationIdentifier;
}

- (NSArray)centerItemGroups
{
  if (self->_centerItemGroups)
    return self->_centerItemGroups;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)_setTitleViewDataSource:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  UINavigationItem *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  _UINavigationBarCastToAugmentedTitleView(self->_titleView);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if (v9)
    {
      v6 = v9;
      v7 = self;
      v8 = 1;
    }
    else
    {
      v6 = 0;
      v7 = 0;
      v8 = 0;
    }
    objc_msgSend(v4, "_setDataSource:navigationItem:titleLocation:", v6, v7, v8);
  }

}

- (UIView)_largeTitleAccessoryView
{
  return self->__largeTitleAccessoryView;
}

- (unint64_t)_largeTitleTwoLineMode
{
  return self->__largeTitleTwoLineMode;
}

- (void)titleMenuProvider
{
  return self->_titleMenuProvider;
}

- (BOOL)leftItemsSupplementBackButton
{
  return (*(_WORD *)&self->_navigationItemFlags >> 1) & 1;
}

- (UIDocumentProperties)documentProperties
{
  return self->_documentProperties;
}

- (UINavigationItemSearchBarPlacement)searchBarPlacement
{
  if (!-[UINavigationItem _hasInlineSearchBar](self, "_hasInlineSearchBar"))
    return 2;
  if (self->_preferredSearchBarPlacement == 3)
    return 3;
  return 1;
}

- (UINavigationItemStyle)style
{
  return self->_style;
}

- (UIBarButtonItemGroup)pinnedTrailingGroup
{
  return self->_pinnedTrailingGroup;
}

- (double)_minimumDesiredHeightForBarMetrics:(int64_t)a3
{
  NSMutableDictionary *minimumDesiredHeights;
  void *v4;
  void *v5;
  double v6;
  double v7;

  minimumDesiredHeights = self->_minimumDesiredHeights;
  if (!minimumDesiredHeights)
    return 0.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](minimumDesiredHeights, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 0.0;
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (unint64_t)_largeTitleAccessoryViewHorizontalAlignment
{
  return self->__largeTitleAccessoryViewHorizontalAlignment;
}

- (_UIBarButtonItemSearchBarGroup)_inlineSearchBarItemGroup
{
  _UIBarButtonItemSearchBarGroup *v3;
  _UIBarButtonItemSearchBarGroup *inlineSearchBarItemGroup;

  if (!self->_inlineSearchBarItemGroup)
  {
    v3 = objc_alloc_init(_UIBarButtonItemSearchBarGroup);
    inlineSearchBarItemGroup = self->_inlineSearchBarItemGroup;
    self->_inlineSearchBarItemGroup = v3;

  }
  -[UINavigationItem _updateSearchBarItemGroup](self, "_updateSearchBarItemGroup");
  return self->_inlineSearchBarItemGroup;
}

- (void)_updateSearchBarItemGroup
{
  void *v3;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;
  void *v6;
  int v7;
  _UIBarButtonItemSearchBarGroup *inlineSearchBarItemGroup;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[UISearchController searchBar](self->_searchController, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_inlineSearchBarItemGroup
    && (-[UINavigationItem _hasInlineSearchBar](self, "_hasInlineSearchBar")
     || objc_msgSend(v3, "_isHostedInlineByNavigationBar")))
  {
    -[_UIBarButtonItemSearchBarGroup searchItem]((id *)&self->_inlineSearchBarItemGroup->super.super.isa);
    v4 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
      -[UIBarButtonItem setCustomView:](v4, "setCustomView:", v3);
    }
    else
    {
      v5 = -[UIBarButtonItem initWithCustomView:]([UIBarButtonItem alloc], "initWithCustomView:", v3);
      v10[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIBarButtonItemSearchBarGroup setBarButtonItems:](self->_inlineSearchBarItemGroup, "setBarButtonItems:", v6);

    }
    objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_UIBarButtonItemSearchBarGroup setHidden:](self->_inlineSearchBarItemGroup, "setHidden:", v3 == 0);
    v7 = objc_msgSend(v3, "_requiresSearchTextField");
    inlineSearchBarItemGroup = self->_inlineSearchBarItemGroup;
    if (v7)
    {
      -[_UIBarButtonItemSearchBarGroup setRepresentativeItem:](inlineSearchBarItemGroup, "setRepresentativeItem:", 0);
      objc_msgSend(v3, "_idealInlineWidthForLayoutState:", objc_msgSend(v3, "_layoutState"));
      -[UIBarButtonItem setWidth:](v5, "setWidth:");
    }
    else
    {
      -[UIBarButtonItemGroup representativeItem](inlineSearchBarItemGroup, "representativeItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        objc_msgSend(v3, "_searchIconBarButtonItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIBarButtonItemSearchBarGroup setRepresentativeItem:](self->_inlineSearchBarItemGroup, "setRepresentativeItem:", v9);
      }
      objc_msgSend(v3, "_idealInlineWidthForLayoutState:", 1);
      objc_msgSend(v9, "setWidth:");
      objc_msgSend(v3, "_idealInlineWidthForLayoutState:", 2);
      -[UIBarButtonItem setWidth:](v5, "setWidth:");

    }
  }
  else
  {
    objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
    -[_UIBarButtonItemSearchBarGroup setHidden:](self->_inlineSearchBarItemGroup, "setHidden:", 1);
  }

}

- (void)_getTrailingItems:(id *)a3 groups:(id *)a4
{
  id v7;
  NSArray *v8;
  id v9;
  id v10;

  if (-[NSArray count](self->_trailingItemGroups, "count"))
  {
    v7 = *a3;
    *a3 = 0;

    v8 = self->_trailingItemGroups;
  }
  else
  {
    if (-[NSArray count](self->_rightBarButtonItems, "count"))
    {
      objc_storeStrong(a3, self->_rightBarButtonItems);
    }
    else
    {
      v9 = *a3;
      *a3 = 0;

    }
    v8 = 0;
  }
  v10 = *a4;
  *a4 = v8;

}

- (void)_getLeadingItems:(id *)a3 groups:(id *)a4
{
  id v7;
  NSArray *v8;
  id v9;
  id v10;

  if (-[NSArray count](self->_leadingItemGroups, "count"))
  {
    v7 = *a3;
    *a3 = 0;

    v8 = self->_leadingItemGroups;
  }
  else
  {
    if (-[NSArray count](self->_leftBarButtonItems, "count"))
    {
      objc_storeStrong(a3, self->_leftBarButtonItems);
    }
    else
    {
      v9 = *a3;
      *a3 = 0;

    }
    v8 = 0;
  }
  v10 = *a4;
  *a4 = v8;

}

- (NSArray)_alternateLargeTitles
{
  return self->__alternateLargeTitles;
}

- (BOOL)_alignLargeTitleAccessoryViewToBaseline
{
  return self->__alignLargeTitleAccessoryViewToBaseline;
}

- (UIDeferredMenuElement)additionalOverflowItems
{
  return self->_additionalOverflowItems;
}

- (UIMenu)_dci_documentMenu
{
  return self->_documentMenu;
}

- (void)setRightBarButtonItems:(NSArray *)rightBarButtonItems
{
  -[UINavigationItem setRightBarButtonItems:animated:](self, "setRightBarButtonItems:animated:", rightBarButtonItems, 0);
}

- (void)setHidesBackButton:(BOOL)hidesBackButton
{
  -[UINavigationItem setHidesBackButton:animated:](self, "setHidesBackButton:animated:", hidesBackButton, 0);
}

- (void)setLeftBarButtonItems:(NSArray *)leftBarButtonItems
{
  -[UINavigationItem setLeftBarButtonItems:animated:](self, "setLeftBarButtonItems:animated:", leftBarButtonItems, 0);
}

- (id)_barButtonForBackButtonIndicator
{
  NSArray *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_leftBarButtonItems;
  v3 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v6, "isHidden", (_QWORD)v8) & 1) == 0
          && ((objc_msgSend(v6, "_showsBackButtonIndicator") & 1) != 0
           || objc_msgSend(v6, "_actsAsFakeBackButton")))
        {
          v3 = v6;
          goto LABEL_13;
        }
      }
      v3 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_13:

  return v3;
}

- (UIBarButtonItem)leftBarButtonItem
{
  void *v2;
  void *v3;

  -[UINavigationItem leftBarButtonItems](self, "leftBarButtonItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIBarButtonItem *)v3;
}

- (NSArray)leftBarButtonItems
{
  return self->_leftBarButtonItems;
}

- (UIBarButtonItem)rightBarButtonItem
{
  void *v2;
  void *v3;

  -[UINavigationItem rightBarButtonItems](self, "rightBarButtonItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIBarButtonItem *)v3;
}

- (NSArray)rightBarButtonItems
{
  return self->_rightBarButtonItems;
}

- (void)_setLargeTitleAccessoryView:(id)a3 alignToBaseline:(BOOL)a4
{
  -[UINavigationItem _setLargeTitleAccessoryView:alignToBaseline:horizontalAlignment:](self, "_setLargeTitleAccessoryView:alignToBaseline:horizontalAlignment:", a3, a4, 0);
}

- (NSArray)trailingItemGroups
{
  if (self->_trailingItemGroups)
    return self->_trailingItemGroups;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSArray)leadingItemGroups
{
  if (self->_leadingItemGroups)
    return self->_leadingItemGroups;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)setHidesSearchBarWhenScrolling:(BOOL)hidesSearchBarWhenScrolling
{
  $EAADF271BA20BB470A6A707F12E883AD navigationItemFlags;
  __int16 v5;
  id WeakRetained;
  id v7;

  navigationItemFlags = self->_navigationItemFlags;
  if (hidesSearchBarWhenScrolling)
    v5 = 0;
  else
    v5 = 4;
  *(_WORD *)&self->_navigationItemFlags = *(_WORD *)&navigationItemFlags & 0xFFFB | v5;
  WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
  if (WeakRetained && ((*(_WORD *)&self->_navigationItemFlags ^ *(unsigned int *)&navigationItemFlags) & 4) != 0)
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "navigationItemUpdatedSearchController:oldSearchController:", self, self->_searchController);
    WeakRetained = v7;
  }

}

- (void)_messageChangeObserver:(id)a3 forTransitionFromSearchController:(id)a4
{
  id v6;
  int v7;
  void *v8;
  UINavigationItem *v9;
  id v10;

  v10 = a4;
  v6 = a3;
  objc_msgSend(v6, "navigationItemUpdatedSearchController:oldSearchController:", self, v10);
  v7 = objc_msgSend(v6, "navigationItemIsTopItem:", self);

  v8 = v10;
  if (v7)
  {
    objc_msgSend(v10, "_navigationItemCurrentlyDisplayingSearchController");
    v9 = (UINavigationItem *)objc_claimAutoreleasedReturnValue();

    if (v9 == self)
      objc_msgSend(v10, "_setNavigationItemCurrentlyDisplayingSearchController:", 0);
    -[UISearchController _setNavigationItemCurrentlyDisplayingSearchController:](self->_searchController, "_setNavigationItemCurrentlyDisplayingSearchController:", self);
    v8 = v10;
  }

}

- (id)_backButtonTitleAllowingGenericTitles:(BOOL)a3
{
  int64_t backButtonDisplayMode;
  UIBarButtonItem *backBarButtonItem;
  __CFString *v6;
  NSString *backButtonTitle;
  void *v8;

  if (a3)
  {
    backButtonDisplayMode = self->_backButtonDisplayMode;
    if (backButtonDisplayMode == 1)
    {
LABEL_9:
      -[UINavigationItem _abbreviatedBackButtonTitles](self, "_abbreviatedBackButtonTitles");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v6)
        return v6;
LABEL_10:
      v6 = &stru_1E16EDF20;
      return v6;
    }
    if (backButtonDisplayMode)
      goto LABEL_10;
  }
  backBarButtonItem = self->_backBarButtonItem;
  if (!backBarButtonItem
    || (-[UIBarButtonItem title](backBarButtonItem, "title"),
        (v6 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    backButtonTitle = self->_backButtonTitle;
    if (backButtonTitle)
    {
      v6 = backButtonTitle;
      return v6;
    }
    v6 = self->_title;
    if (v6)
      return v6;
    goto LABEL_9;
  }
  return v6;
}

- (id)_effectiveBackBarButtonItem
{
  UIBarButtonItem *backBarButtonItem;
  UIBarButtonItem *v3;
  UIBarButtonItem *v5;
  UIBarButtonItem *synthesizedBackBarButtonItem;
  __CFString *v7;
  void *v8;
  const __CFString *v9;

  backBarButtonItem = self->_backBarButtonItem;
  if (backBarButtonItem)
  {
    v3 = backBarButtonItem;
  }
  else
  {
    if (!self->_synthesizedBackBarButtonItem)
    {
      v5 = objc_alloc_init(UIBarButtonItem);
      synthesizedBackBarButtonItem = self->_synthesizedBackBarButtonItem;
      self->_synthesizedBackBarButtonItem = v5;

    }
    -[UINavigationItem _backButtonTitleAllowingGenericTitles:](self, "_backButtonTitleAllowingGenericTitles:", 1);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (self->_backButtonDisplayMode == 2)
    {
      v8 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      -[UINavigationItem _abbreviatedBackButtonTitles](self, "_abbreviatedBackButtonTitles");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v7)
      v9 = v7;
    else
      v9 = &stru_1E16EDF20;
    -[UIBarButtonItem setTitle:](self->_synthesizedBackBarButtonItem, "setTitle:", v9);
    -[UIBarButtonItem _setBackButtonAlternateTitles:](self->_synthesizedBackBarButtonItem, "_setBackButtonAlternateTitles:", v8);
    v3 = self->_synthesizedBackBarButtonItem;

  }
  return v3;
}

- (NSArray)_abbreviatedBackButtonTitles
{
  NSArray *abbreviatedBackButtonTitles;
  void *v4;
  NSArray *v5;
  NSArray *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  abbreviatedBackButtonTitles = self->_abbreviatedBackButtonTitles;
  if (!abbreviatedBackButtonTitles)
  {
    _UINSLocalizedStringWithDefaultValue(CFSTR("Back"), CFSTR("Back"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    v8[1] = &stru_1E16EDF20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_abbreviatedBackButtonTitles;
    self->_abbreviatedBackButtonTitles = v5;

    abbreviatedBackButtonTitles = self->_abbreviatedBackButtonTitles;
  }
  return abbreviatedBackButtonTitles;
}

- (void)setBackButtonTitle:(NSString *)backButtonTitle
{
  -[UINavigationItem _setBackButtonTitle:lineBreakMode:](self, "_setBackButtonTitle:lineBreakMode:", backButtonTitle, 4);
}

- (void)setNavigationBar:(id)a3
{
  objc_storeWeak((id *)&self->_navigationBar, a3);
}

- (UINavigationBarAppearance)standardAppearance
{
  return self->_standardAppearance;
}

- (UINavigationBarAppearance)compactAppearance
{
  return self->_compactAppearance;
}

- (void)_setStackEntry:(id)a3
{
  self->__stackEntry = (_UINavigationBarItemStackEntry *)a3;
}

- (void)_setChangeObserver:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);

  v5 = obj;
  if (WeakRetained != obj)
  {
    v6 = objc_loadWeakRetained((id *)&self->__changeObserver);

    objc_storeWeak((id *)&self->__changeObserver, obj);
    v5 = obj;
    if (!v6)
    {
      if (self->_searchController)
      {
        -[UINavigationItem _messageChangeObserver:forTransitionFromSearchController:](self, "_messageChangeObserver:forTransitionFromSearchController:", obj, 0);
        v5 = obj;
      }
    }
  }

}

- (void)_movingToTopOfStack
{
  UISearchController *searchController;
  uint64_t v4;
  UINavigationItemSearchBarPlacement v5;
  $EAADF271BA20BB470A6A707F12E883AD *p_navigationItemFlags;
  __int16 navigationItemFlags;
  id v8;

  if (!self || (searchController = self->_searchController) == 0)
  {
    p_navigationItemFlags = &self->_navigationItemFlags;
    navigationItemFlags = (__int16)self->_navigationItemFlags;
    goto LABEL_6;
  }
  v4 = -[UISearchController searchBarPlacement](searchController, "searchBarPlacement");
  -[UINavigationItem _hasInlineSearchBar](self, "_hasInlineSearchBar");
  v5 = -[UINavigationItem searchBarPlacement](self, "searchBarPlacement");
  p_navigationItemFlags = &self->_navigationItemFlags;
  navigationItemFlags = (__int16)self->_navigationItemFlags;
  if (v4 == v5)
  {
LABEL_6:
    *(_WORD *)p_navigationItemFlags = navigationItemFlags & 0xFFEF;
    goto LABEL_7;
  }
  *(_WORD *)&self->_navigationItemFlags = navigationItemFlags | 0x10;
  -[UINavigationItem _sendSearchBarPlacementChangeCallbackIfNecessaryWillChange:]((id *)&self->super.isa, 1);
LABEL_7:
  -[UISearchController _setNavigationItemCurrentlyDisplayingSearchController:](self->_searchController, "_setNavigationItemCurrentlyDisplayingSearchController:", self);
  -[UISearchController searchBar](self->_searchController, "searchBar");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setHostedInlineByNavigationBar:", -[UINavigationItem _hasInlineSearchBar](self, "_hasInlineSearchBar"));

}

- (void)_movedToTopOfStack:(BOOL)a3
{
  void *v4;

  if (a3)
  {
    -[UISearchController _setNavigationItemCurrentlyDisplayingSearchController:](self->_searchController, "_setNavigationItemCurrentlyDisplayingSearchController:", self);
    -[UISearchController searchBar](self->_searchController, "searchBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_resetIfNecessaryForNavigationBarHosting:", 1);

    if ((*(_WORD *)&self->_navigationItemFlags & 0x10) != 0)
      -[UINavigationItem _sendSearchBarPlacementChangeCallbackIfNecessaryWillChange:]((id *)&self->super.isa, 0);
  }
  *(_WORD *)&self->_navigationItemFlags &= ~0x10u;
}

- (void)_updateViewsForBarSizeChangeAndApply:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  UIView *titleView;
  id WeakRetained;

  v3 = a3;
  if (-[NSArray count](self->_leftBarButtonItems, "count"))
    v5 = -[UINavigationItem _accumulateViewsFromItems:isLeft:refreshViews:](self, "_accumulateViewsFromItems:isLeft:refreshViews:", self->_leftBarButtonItems, 1, 0);
  else
    v5 = 0;
  if (-[NSArray count](self->_rightBarButtonItems, "count"))
    v5 |= -[UINavigationItem _accumulateViewsFromItems:isLeft:refreshViews:](self, "_accumulateViewsFromItems:isLeft:refreshViews:", self->_rightBarButtonItems, 0, 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    titleView = self->_titleView;
    WeakRetained = objc_loadWeakRetained((id *)&self->_navigationBar);
    -[UIView updateForMiniBarState:](titleView, "updateForMiniBarState:", objc_msgSend(WeakRetained, "isMinibar"));

  }
  if ((v5 & v3) == 1)
    -[UINavigationItem updateNavigationBarButtonsAnimated:](self, "updateNavigationBarButtonsAnimated:", 0);
}

- (void)_movedFromTopOfStack:(BOOL)a3
{
  if (a3)
  {
    if ((*(_WORD *)&self->_navigationItemFlags & 0x20) != 0)
      -[UINavigationItem _sendSearchBarPlacementChangeCallbackIfNecessaryWillChange:]((id *)&self->super.isa, 0);
  }
  else
  {
    -[UISearchController _setNavigationItemCurrentlyDisplayingSearchController:](self->_searchController, "_setNavigationItemCurrentlyDisplayingSearchController:", self);
  }
  *(_WORD *)&self->_navigationItemFlags &= ~0x20u;
}

- (void)_movingFromTopOfStack
{
  UISearchController *searchController;
  uint64_t v4;
  UINavigationItemSearchBarPlacement v5;
  __int16 v6;
  $EAADF271BA20BB470A6A707F12E883AD *p_navigationItemFlags;
  __int16 navigationItemFlags;

  if (!self || (searchController = self->_searchController) == 0)
  {
    navigationItemFlags = (__int16)self->_navigationItemFlags;
    p_navigationItemFlags = &self->_navigationItemFlags;
    v6 = navigationItemFlags;
    goto LABEL_6;
  }
  v4 = -[UISearchController searchBarPlacement](searchController, "searchBarPlacement");
  -[UINavigationItem _hasInlineSearchBar](self, "_hasInlineSearchBar");
  v5 = -[UINavigationItem searchBarPlacement](self, "searchBarPlacement");
  v6 = (__int16)self->_navigationItemFlags;
  if (v4 == v5)
  {
    p_navigationItemFlags = &self->_navigationItemFlags;
LABEL_6:
    *(_WORD *)p_navigationItemFlags = v6 & 0xFFDF;
    return;
  }
  *(_WORD *)&self->_navigationItemFlags = v6 | 0x20;
  -[UINavigationItem _sendSearchBarPlacementChangeCallbackIfNecessaryWillChange:]((id *)&self->super.isa, 1);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)UINavigationItem;
  -[UINavigationItem dealloc](&v2, sel_dealloc);
}

- (void)_setLargeTitleAccessoryView:(id)a3
{
  -[UINavigationItem _setLargeTitleAccessoryView:alignToBaseline:](self, "_setLargeTitleAccessoryView:alignToBaseline:", a3, 1);
}

- (void)_setSupportsTwoLineLargeTitles:(BOOL)a3
{
  -[UINavigationItem _setLargeTitleTwoLineMode:](self, "_setLargeTitleTwoLineMode:", 1);
}

- (void)_setBottomPaletteNeedsUpdate
{
  -[UINavigationItem _setBottomPaletteNeedsUpdate:](self, "_setBottomPaletteNeedsUpdate:", self->_bottomPalette);
}

- (void)setLargeTitleDisplayMode:(UINavigationItemLargeTitleDisplayMode)largeTitleDisplayMode
{
  id WeakRetained;

  if (self->_largeTitleDisplayMode != largeTitleDisplayMode)
  {
    self->_largeTitleDisplayMode = largeTitleDisplayMode;
    WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    objc_msgSend(WeakRetained, "navigationItemUpdatedLargeTitleDisplayMode:", self);

  }
}

- (void)_setBottomPaletteNeedsUpdate:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
  if (WeakRetained)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v5 = objc_loadWeakRetained((id *)&self->__changeObserver);
      objc_msgSend(v5, "navigationItem:updatedPalettePart:oldPalette:", self, 7, v6);

    }
    else
    {
      objc_msgSend(WeakRetained, "navigationItemUpdatedBottomPalette:oldPalette:", self, v6);
    }
  }

}

- (void)setRightBarButtonItems:(NSArray *)items animated:(BOOL)animated
{
  _BOOL8 v4;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;
  char v9;
  NSArray *v10;
  NSArray *rightBarButtonItems;
  NSArray *trailingItemGroups;
  NSArray *WeakRetained;
  NSArray *v14;
  id v15;

  v4 = animated;
  -[UINavigationItem _barButtonItemsToAddWhenAttemptingToAddBarButtonItems:forRight:]((id *)&self->super.isa, items, 1);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_rightBarButtonItems, "count") || objc_msgSend(v15, "count"))
  {
    v6 = self->_rightBarButtonItems;
    v7 = (NSArray *)v15;
    v8 = v7;
    if (v6 == v7)
    {

    }
    else
    {
      if (v7 && v6)
      {
        v9 = -[NSArray isEqual:](v6, "isEqual:", v7);

        if ((v9 & 1) != 0)
          goto LABEL_15;
      }
      else
      {

      }
      _updateItemOwners(self->_rightBarButtonItems, 0);
      v10 = (NSArray *)-[NSArray copy](v8, "copy");
      rightBarButtonItems = self->_rightBarButtonItems;
      self->_rightBarButtonItems = v10;

      trailingItemGroups = self->_trailingItemGroups;
      self->_trailingItemGroups = 0;

      _updateItemOwners(self->_rightBarButtonItems, self);
      WeakRetained = (NSArray *)objc_loadWeakRetained((id *)&self->__changeObserver);
      v8 = WeakRetained;
      if (WeakRetained)
      {
        -[NSArray navigationItemUpdatedRightBarButtonItems:animated:](WeakRetained, "navigationItemUpdatedRightBarButtonItems:animated:", self, v4);
      }
      else
      {
        -[UINavigationItem _setCustomRightViews:](self, "_setCustomRightViews:", 0);
        -[UINavigationItem updateNavigationBarButtonsAnimated:](self, "updateNavigationBarButtonsAnimated:", v4);
      }
    }
  }
  else
  {
    v14 = (NSArray *)v15;
    v8 = self->_rightBarButtonItems;
    self->_rightBarButtonItems = v14;
  }

LABEL_15:
}

- (void)setRightBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated
{
  _BOOL8 v4;
  UIBarButtonItem *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *rightBarButtonItems;
  NSArray *trailingItemGroups;
  id WeakRetained;
  void *v15;
  _QWORD v16[2];

  v4 = animated;
  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = item;
  if (-[UIBarButtonItem isSystemItem](v6, "isSystemItem")
    && (-[UIBarButtonItem systemItem](v6, "systemItem") == 5 || -[UIBarButtonItem systemItem](v6, "systemItem") == 6))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Fixed and flexible space items not allowed as individual navigation bar button item. Please use the rightBarButtonItems (that's plural) property."));
  }
  if (v6)
  {
    v16[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationItem _barButtonItemsToAddWhenAttemptingToAddBarButtonItems:forRight:]((id *)&self->super.isa, v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  -[UINavigationItem rightBarButtonItem](self, "rightBarButtonItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 != v10)
  {
    _updateItemOwners(self->_rightBarButtonItems, 0);
    _itemListUpdatingFirstItem(self->_rightBarButtonItems, v9);
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    rightBarButtonItems = self->_rightBarButtonItems;
    self->_rightBarButtonItems = v11;

    trailingItemGroups = self->_trailingItemGroups;
    self->_trailingItemGroups = 0;

    _updateItemOwners(self->_rightBarButtonItems, self);
    WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    v15 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "navigationItemUpdatedRightBarButtonItems:animated:", self, v4);
    }
    else
    {
      -[UINavigationItem _setCustomRightViews:](self, "_setCustomRightViews:", 0);
      -[UINavigationItem updateNavigationBarButtonsAnimated:](self, "updateNavigationBarButtonsAnimated:", v4);
    }

  }
}

- (void)setLeftBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated
{
  _BOOL8 v4;
  UIBarButtonItem *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *leftBarButtonItems;
  NSArray *leadingItemGroups;
  id WeakRetained;
  void *v15;
  _QWORD v16[2];

  v4 = animated;
  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = item;
  if (-[UIBarButtonItem isSystemItem](v6, "isSystemItem")
    && (-[UIBarButtonItem systemItem](v6, "systemItem") == 5 || -[UIBarButtonItem systemItem](v6, "systemItem") == 6))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Fixed and flexible space items not allowed as individual navigation bar button item. Please use the leftBarButtonItems (that's plural) property."));
  }
  if (v6)
  {
    v16[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationItem _barButtonItemsToAddWhenAttemptingToAddBarButtonItems:forRight:]((id *)&self->super.isa, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  -[UINavigationItem leftBarButtonItem](self, "leftBarButtonItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 != v10)
  {
    _updateItemOwners(self->_leftBarButtonItems, 0);
    _itemListUpdatingFirstItem(self->_leftBarButtonItems, v9);
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    leftBarButtonItems = self->_leftBarButtonItems;
    self->_leftBarButtonItems = v11;

    leadingItemGroups = self->_leadingItemGroups;
    self->_leadingItemGroups = 0;

    _updateItemOwners(self->_leftBarButtonItems, self);
    WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    v15 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "navigationItemUpdatedLeftBarButtonItems:animated:", self, v4);
    }
    else
    {
      -[UINavigationItem _setCustomLeftViews:](self, "_setCustomLeftViews:", 0);
      -[UINavigationItem updateNavigationBarButtonsAnimated:](self, "updateNavigationBarButtonsAnimated:", v4);
    }

  }
}

- (void)setLeadingItemGroups:(NSArray *)leadingItemGroups
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;
  char v8;
  NSArray *v9;
  id WeakRetained;
  NSArray *v11;
  NSArray *v12;
  NSArray *leftBarButtonItems;
  NSArray *v14;

  v4 = leadingItemGroups;
  if (v4)
    v5 = v4;
  else
    v5 = (NSArray *)MEMORY[0x1E0C9AA60];
  v6 = self->_leadingItemGroups;
  v7 = v5;
  v14 = v7;
  if (v6 == v7)
  {

    WeakRetained = v14;
  }
  else
  {
    if (v6)
    {
      v8 = -[NSArray isEqual:](v6, "isEqual:", v7);

      v9 = v14;
      if ((v8 & 1) != 0)
        goto LABEL_12;
    }
    else
    {

    }
    _updateItemGroupOwners(self->_leadingItemGroups, 0);
    v11 = (NSArray *)-[NSArray copy](v14, "copy");
    v12 = self->_leadingItemGroups;
    self->_leadingItemGroups = v11;

    _updateItemGroupOwners(self->_leadingItemGroups, self);
    leftBarButtonItems = self->_leftBarButtonItems;
    self->_leftBarButtonItems = 0;

    WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    objc_msgSend(WeakRetained, "navigationItemUpdatedLeftBarButtonItems:animated:", self, 0);
  }

  v9 = v14;
LABEL_12:

}

- (void)setCenterItemGroups:(NSArray *)centerItemGroups
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;
  char v8;
  id v9;
  NSArray *v10;
  NSArray *v11;
  id WeakRetained;
  char v13;
  NSArray *v14;

  v4 = centerItemGroups;
  if (v4)
    v5 = v4;
  else
    v5 = (NSArray *)MEMORY[0x1E0C9AA60];
  v6 = self->_centerItemGroups;
  v7 = v5;
  v14 = v7;
  if (v6 == v7)
  {

    v9 = v14;
LABEL_12:

    goto LABEL_13;
  }
  if (v6)
  {
    v8 = -[NSArray isEqual:](v6, "isEqual:", v7);

    if ((v8 & 1) != 0)
      goto LABEL_13;
  }
  else
  {

  }
  _updateItemGroupOwners(self->_centerItemGroups, 0);
  v10 = (NSArray *)-[NSArray copy](v14, "copy");
  v11 = self->_centerItemGroups;
  self->_centerItemGroups = v10;

  _updateItemGroupOwners(self->_centerItemGroups, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->__changeObserver);
    objc_msgSend(v9, "navigationItemUpdatedCenterBarButtonItems:animated:", self, 0);
    goto LABEL_12;
  }
LABEL_13:

}

- (void)setTrailingItemGroups:(NSArray *)trailingItemGroups
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;
  char v8;
  NSArray *v9;
  id WeakRetained;
  NSArray *v11;
  NSArray *v12;
  NSArray *rightBarButtonItems;
  NSArray *v14;

  v4 = trailingItemGroups;
  if (v4)
    v5 = v4;
  else
    v5 = (NSArray *)MEMORY[0x1E0C9AA60];
  v6 = self->_trailingItemGroups;
  v7 = v5;
  v14 = v7;
  if (v6 == v7)
  {

    WeakRetained = v14;
  }
  else
  {
    if (v6)
    {
      v8 = -[NSArray isEqual:](v6, "isEqual:", v7);

      v9 = v14;
      if ((v8 & 1) != 0)
        goto LABEL_12;
    }
    else
    {

    }
    _updateItemGroupOwners(self->_trailingItemGroups, 0);
    v11 = (NSArray *)-[NSArray copy](v14, "copy");
    v12 = self->_trailingItemGroups;
    self->_trailingItemGroups = v11;

    _updateItemGroupOwners(self->_trailingItemGroups, self);
    rightBarButtonItems = self->_rightBarButtonItems;
    self->_rightBarButtonItems = 0;

    WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    objc_msgSend(WeakRetained, "navigationItemUpdatedRightBarButtonItems:animated:", self, 0);
  }

  v9 = v14;
LABEL_12:

}

- (id)_barButtonItemsToAddWhenAttemptingToAddBarButtonItems:(int)a3 forRight:
{
  void *v3;
  id v6;
  void *v7;
  id v8;
  void *WeakRetained;
  char v10;
  id v11;
  char v12;
  id v13;
  id v14;
  void *v15;
  int v16;
  id *v17;
  void *v18;
  id *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  const __CFString *v35;
  BOOL v36;
  id *v38;
  id *v39;
  id v40;
  id v41;
  id v42;
  id v43;

  v6 = a2;
  v7 = v6;
  if (!a1)
  {
    v8 = 0;
    goto LABEL_26;
  }
  v8 = v6;
  WeakRetained = objc_loadWeakRetained(a1 + 8);
  v10 = objc_msgSend(WeakRetained, "isLocked");
  if ((v10 & 1) == 0)
  {
    v3 = objc_loadWeakRetained(a1 + 8);
    if ((objc_msgSend(v3, "_wasDecodedUnlockedWithNavigationControllerDelegate") & 1) == 0)
      goto LABEL_25;
  }
  v11 = objc_loadWeakRetained(a1 + 8);
  v12 = objc_msgSend(v11, "_lostNavigationControllerDelegate");

  if ((v10 & 1) == 0)
  if ((v12 & 1) == 0)
  {
    v13 = objc_loadWeakRetained(a1 + 8);
    objc_msgSend(v13, "_effectiveDelegate");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "disappearingViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      goto LABEL_25;
    v14 = objc_loadWeakRetained(a1 + 8);
    objc_msgSend(v14, "_stack");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "state");

    if (v16)
      goto LABEL_25;
    objc_msgSend(v3, "_existingNavigationItem");
    v17 = (id *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_nestedTopViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_existingNavigationItem");
    v19 = (id *)objc_claimAutoreleasedReturnValue();

    if (v17 == a1 && v19)
    {
      v38 = v17;
      objc_msgSend(v19, "rightBarButtonItems");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 0;
      _itemListExcludingOtherItemList(v8, v20, &v43);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v43;

      v39 = v19;
      objc_msgSend(v19, "leftBarButtonItems");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0;
      _itemListExcludingOtherItemList(v21, v23, &v42);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v24 = v42;

      v25 = v22;
      v26 = objc_msgSend(v24, "count");
      if (!(v26 + objc_msgSend(v22, "count")))
      {
        v17 = v38;
        v19 = v39;
LABEL_23:

LABEL_24:
LABEL_25:

        goto LABEL_26;
      }
      v33 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v24, "arrayByAddingObjectsFromArray:", v22);
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = CFSTR("left");
      v36 = a3 == 0;
      v28 = (void *)v34;
      if (!v36)
        v35 = CFSTR("right");
      objc_msgSend(v33, "stringWithFormat:", CFSTR("%@ not added to %@BarButtonItems of %@"), v34, v35, a1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      UINavigationItemLogSettingUpSharedBarButtonItemsDuringTransition(v30);
      v17 = v38;
    }
    else
    {
      if (v19 != a1 || !v17)
        goto LABEL_24;
      v39 = v19;
      objc_msgSend(v17, "rightBarButtonItems");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 0;
      _itemListExcludingOtherItemList(v27, v8, &v41);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v41;

      objc_msgSend(v17, "leftBarButtonItems");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 0;
      _itemListExcludingOtherItemList(v29, v8, &v40);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v40;

      if (objc_msgSend(v25, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ removed from rightBarButtonItems of %@"), v25, v17);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        UINavigationItemLogSettingUpSharedBarButtonItemsDuringTransition(v31);

        objc_msgSend(v17, "setRightBarButtonItems:", v28);
      }
      if (objc_msgSend(v24, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ removed from leftBarButtonItems of %@"), v24, v17);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        UINavigationItemLogSettingUpSharedBarButtonItemsDuringTransition(v32);

        objc_msgSend(v17, "setLeftBarButtonItems:", v30);
      }
    }

    v19 = v39;
    goto LABEL_23;
  }
LABEL_26:

  return v8;
}

- (UINavigationItem)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  UINavigationItem *v5;
  void *v6;
  uint64_t v7;
  NSString *title;
  void *v9;
  uint64_t v10;
  NSString *prompt;
  void *v12;
  uint64_t v13;
  NSString *backButtonTitle;
  uint64_t v15;
  UIBarButtonItem *backBarButtonItem;
  __int16 v17;
  void *v18;
  uint64_t v19;
  NSArray *leftBarButtonItems;
  uint64_t v21;
  NSArray *v22;
  uint64_t v23;
  UIView *titleView;
  uint64_t v25;
  NSArray *centerItemGroups;
  uint64_t v27;
  NSString *customizationIdentifier;
  void *v29;
  uint64_t v30;
  NSArray *rightBarButtonItems;
  uint64_t v32;
  NSArray *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;
  UINavigationBarAppearance *standardAppearance;
  uint64_t v38;
  UINavigationBarAppearance *compactAppearance;
  uint64_t v40;
  UINavigationBarAppearance *scrollEdgeAppearance;
  uint64_t v42;
  UINavigationBarAppearance *compactScrollEdgeAppearance;
  objc_super v45;

  v4 = coder;
  v45.receiver = self;
  v45.super_class = (Class)UINavigationItem;
  v5 = -[UINavigationItem init](&v45, sel_init);
  if (v5)
  {
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UITitle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    title = v5->_title;
    v5->_title = (NSString *)v7;

    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIPrompt"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    prompt = v5->_prompt;
    v5->_prompt = (NSString *)v10;

    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIBackButtonTitle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    backButtonTitle = v5->_backButtonTitle;
    v5->_backButtonTitle = (NSString *)v13;

    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIBackBarButtonItem"));
    v15 = objc_claimAutoreleasedReturnValue();
    backBarButtonItem = v5->_backBarButtonItem;
    v5->_backBarButtonItem = (UIBarButtonItem *)v15;

    v5->_backButtonDisplayMode = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UIBackButtonDisplayMode"));
    if (-[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UILeftItemsSupplementBackButton")))
      v17 = 2;
    else
      v17 = 0;
    *(_WORD *)&v5->_navigationItemFlags = *(_WORD *)&v5->_navigationItemFlags & 0xFFFD | v17;
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UILeftBarButtonItem"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UILeftBarButtonItems"));
    v19 = objc_claimAutoreleasedReturnValue();
    leftBarButtonItems = v5->_leftBarButtonItems;
    v5->_leftBarButtonItems = (NSArray *)v19;

    if (v18 && !v5->_leftBarButtonItems)
    {
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v18, 0);
      v22 = v5->_leftBarButtonItems;
      v5->_leftBarButtonItems = (NSArray *)v21;

    }
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UITitleView"));
    v23 = objc_claimAutoreleasedReturnValue();
    titleView = v5->_titleView;
    v5->_titleView = (UIView *)v23;

    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UICenterItemGroups")))
    {
      -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UICenterItemGroups"));
      v25 = objc_claimAutoreleasedReturnValue();
      centerItemGroups = v5->_centerItemGroups;
      v5->_centerItemGroups = (NSArray *)v25;

    }
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UICustomizationIdentifier")))
    {
      -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UICustomizationIdentifier"));
      v27 = objc_claimAutoreleasedReturnValue();
      customizationIdentifier = v5->_customizationIdentifier;
      v5->_customizationIdentifier = (NSString *)v27;

    }
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIStyle")))
      v5->_style = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UIStyle"));
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIRightBarButtonItem"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIRightBarButtonItems"));
    v30 = objc_claimAutoreleasedReturnValue();
    rightBarButtonItems = v5->_rightBarButtonItems;
    v5->_rightBarButtonItems = (NSArray *)v30;

    if (v29 && !v5->_rightBarButtonItems)
    {
      v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v29, 0);
      v33 = v5->_rightBarButtonItems;
      v5->_rightBarButtonItems = (NSArray *)v32;

    }
    if (dyld_program_sdk_at_least()
      && -[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UILargeTitleDisplayMode")))
    {
      v5->_largeTitleDisplayMode = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UILargeTitleDisplayMode"));
    }
    if (-[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIAlwaysShowsSearchBar")))
      v34 = 4;
    else
      v34 = 0;
    *(_WORD *)&v5->_navigationItemFlags = *(_WORD *)&v5->_navigationItemFlags & 0xFFFB | v34;
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UINavigationBar"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_navigationBar, v35);

    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UINavigationBarStandardAppearance"));
    v36 = objc_claimAutoreleasedReturnValue();
    standardAppearance = v5->_standardAppearance;
    v5->_standardAppearance = (UINavigationBarAppearance *)v36;

    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UINavigationBarCompactAppearance"));
    v38 = objc_claimAutoreleasedReturnValue();
    compactAppearance = v5->_compactAppearance;
    v5->_compactAppearance = (UINavigationBarAppearance *)v38;

    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UINavigationBarScrollEdgeAppearance"));
    v40 = objc_claimAutoreleasedReturnValue();
    scrollEdgeAppearance = v5->_scrollEdgeAppearance;
    v5->_scrollEdgeAppearance = (UINavigationBarAppearance *)v40;

    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UINavigationBarCompactScrollEdgeAppearance"));
    v42 = objc_claimAutoreleasedReturnValue();
    compactScrollEdgeAppearance = v5->_compactScrollEdgeAppearance;
    v5->_compactScrollEdgeAppearance = (UINavigationBarAppearance *)v42;

  }
  return v5;
}

- (void)setLargeTitleInsets:(NSDirectionalEdgeInsets)a3
{
  self->_largeTitleInsets = a3;
}

- (void)setScrollEdgeAppearance:(UINavigationBarAppearance *)scrollEdgeAppearance
{
  UINavigationBarAppearance *v4;
  UINavigationBarAppearance *v5;
  UINavigationBarAppearance *v6;
  BOOL v7;
  UINavigationBarAppearance *v8;
  UINavigationBarAppearance *v9;
  UINavigationBarAppearance *v10;
  id WeakRetained;
  UINavigationBarAppearance *v12;
  UINavigationBarAppearance *v13;

  v4 = scrollEdgeAppearance;
  v5 = self->_scrollEdgeAppearance;
  v6 = v4;
  v13 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[UIBarAppearance isEqual:](v5, "isEqual:", v6);

      if (v7)
        goto LABEL_12;
    }
    else
    {

    }
    v8 = self->_scrollEdgeAppearance;
    if (v8)
      objc_storeWeak((id *)&v8->super._changeObserver, 0);
    v9 = -[UIBarAppearance copy](v13, "copy");
    v10 = self->_scrollEdgeAppearance;
    self->_scrollEdgeAppearance = v9;

    WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    objc_msgSend(WeakRetained, "navigationItem:appearance:categoriesChanged:", self, self->_scrollEdgeAppearance, -1);

    v12 = self->_scrollEdgeAppearance;
    if (v12)
      objc_storeWeak((id *)&v12->super._changeObserver, self);
  }
LABEL_12:

}

- (void)setStandardAppearance:(UINavigationBarAppearance *)standardAppearance
{
  UINavigationBarAppearance *v4;
  UINavigationBarAppearance *v5;
  UINavigationBarAppearance *v6;
  BOOL v7;
  UINavigationBarAppearance *v8;
  UINavigationBarAppearance *v9;
  UINavigationBarAppearance *v10;
  id WeakRetained;
  UINavigationBarAppearance *v12;
  UINavigationBarAppearance *v13;

  v4 = standardAppearance;
  v5 = self->_standardAppearance;
  v6 = v4;
  v13 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[UIBarAppearance isEqual:](v5, "isEqual:", v6);

      if (v7)
        goto LABEL_12;
    }
    else
    {

    }
    v8 = self->_standardAppearance;
    if (v8)
      objc_storeWeak((id *)&v8->super._changeObserver, 0);
    v9 = -[UIBarAppearance copy](v13, "copy");
    v10 = self->_standardAppearance;
    self->_standardAppearance = v9;

    WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    objc_msgSend(WeakRetained, "navigationItem:appearance:categoriesChanged:", self, self->_standardAppearance, -1);

    v12 = self->_standardAppearance;
    if (v12)
      objc_storeWeak((id *)&v12->super._changeObserver, self);
  }
LABEL_12:

}

- (void)appearance:(id)a3 categoriesChanged:(int64_t)a4
{
  _UINavigationItemChangeObserver **p_changeObserver;
  id v7;
  id WeakRetained;

  p_changeObserver = &self->__changeObserver;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_changeObserver);
  objc_msgSend(WeakRetained, "navigationItem:appearance:categoriesChanged:", self, v7, a4);

}

- (UIBarButtonItem)backBarButtonItem
{
  return self->_backBarButtonItem;
}

- (void)setRightBarButtonItem:(UIBarButtonItem *)rightBarButtonItem
{
  -[UINavigationItem setRightBarButtonItem:animated:](self, "setRightBarButtonItem:animated:", rightBarButtonItem, 0);
}

- (void)setLeftBarButtonItem:(UIBarButtonItem *)leftBarButtonItem
{
  -[UINavigationItem setLeftBarButtonItem:animated:](self, "setLeftBarButtonItem:animated:", leftBarButtonItem, 0);
}

- (UINavigationBarAppearance)compactScrollEdgeAppearance
{
  return self->_compactScrollEdgeAppearance;
}

- (void)setDocumentProperties:(UIDocumentProperties *)documentProperties
{
  UIDocumentProperties *v5;
  UIDocumentProperties *v6;
  id WeakRetained;
  UIDocumentProperties *v8;

  v5 = documentProperties;
  v6 = self->_documentProperties;
  if (v6 != v5)
  {
    v8 = v5;
    -[UIDocumentProperties _setAssociatedNavigationItem:](v6, "_setAssociatedNavigationItem:", 0);
    objc_storeStrong((id *)&self->_documentProperties, documentProperties);
    -[UIDocumentProperties _setAssociatedNavigationItem:](self->_documentProperties, "_setAssociatedNavigationItem:", self);
    WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    objc_msgSend(WeakRetained, "navigationItemUpdatedTitleContent:animated:", self, 0);

    v5 = v8;
  }

}

- (UINavigationItem)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UINavigationItem;
  return -[UINavigationItem init](&v3, sel_init);
}

- (void)setPreferredSearchBarPlacement:(UINavigationItemSearchBarPlacement)preferredSearchBarPlacement
{
  void *v4;
  void *v5;
  id WeakRetained;

  if (self->_preferredSearchBarPlacement != preferredSearchBarPlacement)
  {
    self->_preferredSearchBarPlacement = preferredSearchBarPlacement;
    -[UINavigationItem _searchControllerIfAllowed](self, "_searchControllerIfAllowed");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setHostedInlineByNavigationBar:", -[UINavigationItem _hasInlineSearchBar](self, "_hasInlineSearchBar"));

    WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    objc_msgSend(WeakRetained, "navigationItemUpdatedSearchController:oldSearchController:", self, self->_searchController);

  }
}

- (void)setSearchController:(UISearchController *)searchController
{
  UISearchController *v5;
  void *v6;
  UISearchController *v7;
  void *v8;
  _UIBarButtonItemSearchBarGroup *inlineSearchBarItemGroup;
  id WeakRetained;
  UISearchController *v11;

  v5 = searchController;
  if (self->_searchController != v5)
  {
    v11 = v5;
    -[UISearchController searchBar](v5, "searchBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_resetIfNecessaryForNavigationBarHosting:", 1);

    v7 = self->_searchController;
    objc_storeStrong((id *)&self->_searchController, searchController);
    -[UISearchController searchBar](v11, "searchBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setHostedInlineByNavigationBar:", -[UINavigationItem _hasInlineSearchBar](self, "_hasInlineSearchBar"));

    inlineSearchBarItemGroup = self->_inlineSearchBarItemGroup;
    self->_inlineSearchBarItemGroup = 0;

    WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    if (WeakRetained)
      -[UINavigationItem _messageChangeObserver:forTransitionFromSearchController:](self, "_messageChangeObserver:forTransitionFromSearchController:", WeakRetained, v7);

    v5 = v11;
  }

}

- (void)setCustomizationIdentifier:(NSString *)customizationIdentifier
{
  NSString *v4;
  NSString *v5;
  NSString *v6;
  char v7;
  NSString *v8;
  id v9;
  NSString *v10;
  NSString *v11;
  id WeakRetained;
  char v13;
  NSString *v14;

  v4 = customizationIdentifier;
  v5 = self->_customizationIdentifier;
  v6 = v4;
  v14 = v6;
  if (v5 == v6)
  {

    v9 = v14;
LABEL_10:

    v8 = v14;
    goto LABEL_11;
  }
  if (v6 && v5)
  {
    v7 = -[NSString isEqual:](v5, "isEqual:", v6);

    v8 = v14;
    if ((v7 & 1) != 0)
      goto LABEL_11;
  }
  else
  {

  }
  v10 = (NSString *)-[NSString copy](v14, "copy");
  v11 = self->_customizationIdentifier;
  self->_customizationIdentifier = v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
  v13 = objc_opt_respondsToSelector();

  v8 = v14;
  if ((v13 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->__changeObserver);
    objc_msgSend(v9, "navigationItemUpdatedCenterBarButtonItems:animated:", self, 0);
    goto LABEL_10;
  }
LABEL_11:

}

- (void)_setWeeTitle:(id)a3
{
  NSString *v4;
  NSString *weeTitle;
  id WeakRetained;
  id v7;

  v7 = a3;
  if (!-[NSString isEqualToString:](self->__weeTitle, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v7, "copy");
    weeTitle = self->__weeTitle;
    self->__weeTitle = v4;

    WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    objc_msgSend(WeakRetained, "navigationItemUpdatedTitleContent:animated:", self, 0);

  }
}

- (void)_setBackButtonTitle:(id)a3 lineBreakMode:(int64_t)a4
{
  NSString *v6;
  NSString *v7;
  BOOL v8;
  NSString *v9;
  NSString *backButtonTitle;
  id WeakRetained;
  void *v12;
  id v13;
  NSString *v14;
  UIView *v15;
  UIView *backButtonView;
  void *v17;
  NSString *v18;

  v6 = (NSString *)a3;
  v7 = v6;
  if (self->_backButtonTitle != v6)
  {
    v18 = v6;
    v8 = -[NSString isEqualToString:](v6, "isEqualToString:");
    v7 = v18;
    if (!v8)
    {
      v9 = (NSString *)-[NSString copy](v18, "copy");
      backButtonTitle = self->_backButtonTitle;
      self->_backButtonTitle = v9;

      WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
      v12 = WeakRetained;
      if (WeakRetained)
      {
        objc_msgSend(WeakRetained, "navigationItemUpdatedBackButtonContent:animated:", self, 0);
      }
      else
      {
        v13 = objc_loadWeakRetained((id *)&self->_navigationBar);
        if (v13)
        {
          v14 = self->_backButtonTitle;
          if (v14 && -[NSString length](v14, "length"))
          {
            -[UINavigationItem backButtonView](self, "backButtonView");
            v15 = (UIView *)objc_claimAutoreleasedReturnValue();
            backButtonView = self->_backButtonView;
            self->_backButtonView = v15;

          }
          else
          {
            -[UINavigationItem _removeBackButtonView](self, "_removeBackButtonView");
          }
          -[UIView _setLineBreakMode:](self->_backButtonView, "_setLineBreakMode:", a4);
          -[UIView _resetTitleSize](self->_backButtonView, "_resetTitleSize");
          -[UIView setNeedsDisplay](self->_backButtonView, "setNeedsDisplay");
          -[UINavigationItem _defaultTitleView](self, "_defaultTitleView");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setNeedsDisplay");
          objc_msgSend(v13, "setNeedsLayout");

        }
      }

      v7 = v18;
    }
  }

}

- (void)setBackButtonDisplayMode:(UINavigationItemBackButtonDisplayMode)backButtonDisplayMode
{
  id WeakRetained;

  if (self->_backButtonDisplayMode != backButtonDisplayMode)
  {
    self->_backButtonDisplayMode = backButtonDisplayMode;
    WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    objc_msgSend(WeakRetained, "navigationItemUpdatedBackButtonContent:animated:", self, 0);

  }
}

- (void)setTitle:(NSString *)title
{
  char v4;
  void *v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  UINavigationItem *v10;
  void *v11;
  void *v12;
  id obj;

  -[UINavigationItem _effectiveTitleForTitle:](self, "_effectiveTitleForTitle:", title);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "isEqualToString:", self->_title);
  v5 = obj;
  if ((v4 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_title, obj);
    WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    v7 = WeakRetained;
    if (WeakRetained)
    {
      if (objc_msgSend(WeakRetained, "navigationItemIsTopItem:", self))
      {
        objc_msgSend(v7, "navigationItemUpdatedTitleContent:animated:", self, 0);
        objc_msgSend(v7, "navigationItemUpdatedLargeTitleContent:", self);
      }
      else if (objc_msgSend(v7, "navigationItemIsBackItem:", self))
      {
        objc_msgSend(v7, "navigationItemUpdatedBackButtonContent:animated:", self, 0);
      }
    }
    else
    {
      v8 = objc_loadWeakRetained((id *)&self->_navigationBar);
      if (v8)
      {
        -[UINavigationItem _addDefaultTitleViewToNavigationBarIfNecessary:](self, "_addDefaultTitleViewToNavigationBarIfNecessary:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_resetTitleSize");
        -[UINavigationItem _setPendingTitle:](self, "_setPendingTitle:", 0);
        -[UIView setNeedsDisplay](self->_backButtonView, "setNeedsDisplay");
        objc_msgSend(v9, "setNeedsDisplay");
        objc_msgSend(v8, "setNeedsLayout");
        if (objc_msgSend(v8, "state"))
        {
          objc_msgSend(v8, "topItem");
          v10 = (UINavigationItem *)objc_claimAutoreleasedReturnValue();

          if (v10 == self)
          {
            objc_msgSend(v8, "backItem");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "backButtonView");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "_setAbbreviatedTitleIndex:", 0x7FFFFFFFFFFFFFFFLL);

          }
        }
        objc_msgSend(v8, "_accessibility_navigationBarContentsDidChange");

      }
    }

    v5 = obj;
  }

}

- (UINavigationItem)initWithTitle:(NSString *)title
{
  NSString *v4;
  UINavigationItem *v5;
  UINavigationItem *v6;
  uint64_t v7;
  NSString *v8;
  objc_super v10;

  v4 = title;
  v10.receiver = self;
  v10.super_class = (Class)UINavigationItem;
  v5 = -[UINavigationItem init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[UINavigationItem _effectiveTitleForTitle:](v5, "_effectiveTitleForTitle:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v6->_title;
    v6->_title = (NSString *)v7;

  }
  return v6;
}

- (void)_setLargeTitleTwoLineMode:(unint64_t)a3
{
  id WeakRetained;

  if (self->__largeTitleTwoLineMode != a3)
  {
    self->__largeTitleTwoLineMode = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    objc_msgSend(WeakRetained, "navigationItemUpdatedLargeTitleContent:", self);

  }
}

- (void)_setLargeTitleAccessoryView:(id)a3 alignToBaseline:(BOOL)a4 horizontalAlignment:(unint64_t)a5
{
  _BOOL4 v6;
  UIView *v9;
  id WeakRetained;
  UIView *v11;

  v6 = a4;
  v9 = (UIView *)a3;
  if (self->__largeTitleAccessoryView != v9
    || self->__alignLargeTitleAccessoryViewToBaseline != v6
    || self->__largeTitleAccessoryViewHorizontalAlignment != a5)
  {
    v11 = v9;
    objc_storeStrong((id *)&self->__largeTitleAccessoryView, a3);
    self->__alignLargeTitleAccessoryViewToBaseline = v6;
    self->__largeTitleAccessoryViewHorizontalAlignment = a5;
    WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    objc_msgSend(WeakRetained, "navigationItemUpdatedLargeTitleContent:", self);

    v9 = v11;
  }

}

- (void)setTitleView:(UIView *)titleView
{
  UIView *v5;
  UIView *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  id v10;
  double Width;
  UIView *v12;
  CGRect v13;

  v5 = titleView;
  v6 = self->_titleView;
  if (v6 != v5)
  {
    v12 = v5;
    _UINavigationBarCastToAugmentedTitleView(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setDataSource:navigationItem:titleLocation:", 0, 0, 0);

    objc_storeStrong((id *)&self->_titleView, titleView);
    WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    v9 = WeakRetained;
    if (WeakRetained)
    {
      if (objc_msgSend(WeakRetained, "navigationItemIsTopItem:", self))
        objc_msgSend(v9, "navigationItemUpdatedTitleContent:animated:", self, 0);
    }
    else
    {
      v10 = objc_loadWeakRetained((id *)&self->_navigationBar);
      if (v10)
      {
        if (v12)
        {
          -[UIView frame](v12, "frame");
          Width = CGRectGetWidth(v13);
        }
        else
        {
          Width = 0.0;
        }
        -[UINavigationItem _setIdealCustomTitleWidth:](self, "_setIdealCustomTitleWidth:", Width);
        if (!self->_titleView)
          -[UIView removeFromSuperview](self->_defaultTitleView, "removeFromSuperview");
        objc_msgSend(v10, "_updateTitleViewIfTop:", self);
        objc_msgSend(v10, "_accessibility_navigationBarContentsDidChange");
      }

    }
    v5 = v12;
  }

}

- (void)setBackAction:(UIAction *)backAction
{
  UIAction *v4;
  UIAction *v5;
  id WeakRetained;

  if (self->_backAction != backAction)
  {
    v4 = (UIAction *)-[UIAction copy](backAction, "copy");
    v5 = self->_backAction;
    self->_backAction = v4;

    WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    objc_msgSend(WeakRetained, "navigationItemUpdatedTitleContent:animated:", self, 0);

  }
}

- (void)setTitleMenuProvider:(void *)titleMenuProvider
{
  void *v4;
  id v5;
  id WeakRetained;

  if (self->_titleMenuProvider != titleMenuProvider)
  {
    v4 = (void *)objc_msgSend(titleMenuProvider, "copy");
    v5 = self->_titleMenuProvider;
    self->_titleMenuProvider = v4;

    WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    objc_msgSend(WeakRetained, "navigationItemUpdatedTitleContent:animated:", self, 0);

  }
}

- (void)set_alternateLargeTitles:(id)a3
{
  objc_storeStrong((id *)&self->__alternateLargeTitles, a3);
}

- (void)_setPreserveSearchBarAcrossTransitions:(BOOL)a3
{
  self->__preserveSearchBarAcrossTransitions = a3;
}

- (void)setHidesBackButton:(BOOL)hidesBackButton animated:(BOOL)animated
{
  __int16 navigationItemFlags;
  _BOOL8 v5;
  id WeakRetained;
  id v8;
  id v9;

  navigationItemFlags = (__int16)self->_navigationItemFlags;
  if (((((navigationItemFlags & 1) == 0) ^ hidesBackButton) & 1) == 0)
  {
    v5 = animated;
    *(_WORD *)&self->_navigationItemFlags = navigationItemFlags & 0xFFFE | hidesBackButton;
    WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    v9 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "navigationItemUpdatedContentLayout:animated:", self, v5);
    }
    else
    {
      v8 = objc_loadWeakRetained((id *)&self->_navigationBar);
      objc_msgSend(v8, "_updateBackButtonVisibilityIfTop:animated:", self, v5);
      objc_msgSend(v8, "_accessibility_navigationBarContentsDidChange");

    }
  }
}

- (void)setLeftBarButtonItems:(NSArray *)items animated:(BOOL)animated
{
  _BOOL8 v4;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;
  char v9;
  NSArray *v10;
  NSArray *leftBarButtonItems;
  NSArray *leadingItemGroups;
  NSArray *WeakRetained;
  NSArray *v14;
  id v15;

  v4 = animated;
  -[UINavigationItem _barButtonItemsToAddWhenAttemptingToAddBarButtonItems:forRight:]((id *)&self->super.isa, items, 0);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_leftBarButtonItems, "count") || objc_msgSend(v15, "count"))
  {
    v6 = self->_leftBarButtonItems;
    v7 = (NSArray *)v15;
    v8 = v7;
    if (v6 == v7)
    {

    }
    else
    {
      if (v7 && v6)
      {
        v9 = -[NSArray isEqual:](v6, "isEqual:", v7);

        if ((v9 & 1) != 0)
          goto LABEL_15;
      }
      else
      {

      }
      _updateItemOwners(self->_leftBarButtonItems, 0);
      v10 = (NSArray *)-[NSArray copy](v8, "copy");
      leftBarButtonItems = self->_leftBarButtonItems;
      self->_leftBarButtonItems = v10;

      leadingItemGroups = self->_leadingItemGroups;
      self->_leadingItemGroups = 0;

      _updateItemOwners(self->_leftBarButtonItems, self);
      WeakRetained = (NSArray *)objc_loadWeakRetained((id *)&self->__changeObserver);
      v8 = WeakRetained;
      if (WeakRetained)
      {
        -[NSArray navigationItemUpdatedLeftBarButtonItems:animated:](WeakRetained, "navigationItemUpdatedLeftBarButtonItems:animated:", self, v4);
      }
      else
      {
        -[UINavigationItem _setCustomLeftViews:](self, "_setCustomLeftViews:", 0);
        -[UINavigationItem updateNavigationBarButtonsAnimated:](self, "updateNavigationBarButtonsAnimated:", v4);
      }
    }
  }
  else
  {
    v14 = (NSArray *)v15;
    v8 = self->_leftBarButtonItems;
    self->_leftBarButtonItems = v14;
  }

LABEL_15:
}

- (void)_setCustomLeftViews:(id)a3
{
  NSArray *v4;
  NSArray *customLeftViews;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  customLeftViews = self->_customLeftViews;
  self->_customLeftViews = v4;

}

- (void)setLeftItemsSupplementBackButton:(BOOL)leftItemsSupplementBackButton
{
  __int16 navigationItemFlags;
  __int16 v5;
  id WeakRetained;
  id v7;

  navigationItemFlags = (__int16)self->_navigationItemFlags;
  if (((((navigationItemFlags & 2) == 0) ^ leftItemsSupplementBackButton) & 1) == 0)
  {
    if (leftItemsSupplementBackButton)
      v5 = 2;
    else
      v5 = 0;
    *(_WORD *)&self->_navigationItemFlags = navigationItemFlags & 0xFFFD | v5;
    WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    v7 = WeakRetained;
    if (WeakRetained)
      objc_msgSend(WeakRetained, "navigationItemUpdatedContentLayout:animated:", self, 0);
    else
      -[UINavigationItem updateNavigationBarButtonsAnimated:](self, "updateNavigationBarButtonsAnimated:", 0);

  }
}

- (void)updateNavigationBarButtonsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationBar);
  objc_msgSend(WeakRetained, "_updateContentIfTopItem:animated:", self, v3);

}

- (void)_dci_setRenameHandler:(id)a3
{
  _UINavigationItemRenameHandler *v5;
  _UINavigationItemRenameHandler *renameHandler;
  id WeakRetained;
  _UINavigationItemRenameHandler *v8;

  v5 = (_UINavigationItemRenameHandler *)a3;
  renameHandler = self->_renameHandler;
  v8 = v5;
  if (renameHandler != v5)
  {
    -[_UINavigationItemRenameHandler setAssociatedItem:](renameHandler, "setAssociatedItem:", 0);
    objc_storeStrong((id *)&self->_renameHandler, a3);
    -[_UINavigationItemRenameHandler setAssociatedItem:](v8, "setAssociatedItem:", self);
    WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    objc_msgSend(WeakRetained, "navigationItemUpdatedTitleContent:animated:", self, 0);

  }
}

- (void)_setManualScrollEdgeAppearanceEnabled:(BOOL)a3
{
  id WeakRetained;
  id v5;
  id v6;
  id v7;

  if (self->_manualScrollEdgeAppearanceEnabled != a3)
  {
    self->_manualScrollEdgeAppearanceEnabled = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    objc_msgSend(WeakRetained, "navigationItemUpdatedScrollEdgeProgress:", self);

    if (self->_autoScrollEdgeTransitionDistance > 0.0)
    {
      v5 = objc_loadWeakRetained((id *)&self->_navigationBar);
      objc_msgSend(v5, "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v6 = objc_loadWeakRetained((id *)&self->_navigationBar);
        objc_msgSend(v7, "_navigationBar:itemEnabledAutoScrollTransition:", v6, self);

      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__alternateLargeTitles, 0);
  objc_storeStrong((id *)&self->__canvasView, 0);
  objc_storeStrong((id *)&self->__weeTitle, 0);
  objc_storeStrong((id *)&self->__largeTitleAccessoryView, 0);
  objc_storeStrong((id *)&self->__rightItemSpaceList, 0);
  objc_storeStrong((id *)&self->__leftItemSpaceList, 0);
  objc_destroyWeak((id *)&self->__changeObserver);
  objc_storeStrong((id *)&self->_compactScrollEdgeAppearance, 0);
  objc_storeStrong((id *)&self->_scrollEdgeAppearance, 0);
  objc_storeStrong((id *)&self->_compactAppearance, 0);
  objc_storeStrong((id *)&self->_standardAppearance, 0);
  objc_storeStrong((id *)&self->_additionalOverflowItems, 0);
  objc_storeStrong((id *)&self->_pinnedTrailingGroup, 0);
  objc_storeStrong((id *)&self->_customizationIdentifier, 0);
  objc_storeStrong((id *)&self->_documentProperties, 0);
  objc_destroyWeak((id *)&self->_renameDelegate);
  objc_storeStrong(&self->_titleMenuProvider, 0);
  objc_storeStrong((id *)&self->_backAction, 0);
  objc_storeStrong((id *)&self->_renameHandler, 0);
  objc_storeStrong((id *)&self->_documentMenu, 0);
  objc_storeStrong((id *)&self->_trailingItemGroups, 0);
  objc_storeStrong((id *)&self->_centerItemGroups, 0);
  objc_storeStrong((id *)&self->_leadingItemGroups, 0);
  objc_storeStrong((id *)&self->_inlineSearchBarItemGroup, 0);
  objc_storeStrong((id *)&self->_pendingTitle, 0);
  objc_storeStrong((id *)&self->_bottomPalette, 0);
  objc_storeStrong((id *)&self->_topPalette, 0);
  objc_storeStrong((id *)&self->_minimumDesiredHeights, 0);
  objc_storeStrong((id *)&self->_abbreviatedBackButtonTitles, 0);
  objc_storeStrong((id *)&self->_frozenTitleView, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_customRightViews, 0);
  objc_storeStrong((id *)&self->_customLeftViews, 0);
  objc_storeStrong((id *)&self->_rightBarButtonItems, 0);
  objc_storeStrong((id *)&self->_leftBarButtonItems, 0);
  objc_storeStrong((id *)&self->_backButtonView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_defaultTitleView, 0);
  objc_destroyWeak((id *)&self->_navigationBar);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_synthesizedBackBarButtonItem, 0);
  objc_storeStrong((id *)&self->_backBarButtonItem, 0);
  objc_storeStrong((id *)&self->_backButtonTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)_setBottomPalette:(id)a3
{
  _UINavigationBarPalette *v5;
  _UINavigationBarPalette *bottomPalette;
  _UINavigationBarPalette *v7;
  _UINavigationBarPalette *v8;

  v5 = (_UINavigationBarPalette *)a3;
  bottomPalette = self->_bottomPalette;
  if (bottomPalette != v5)
  {
    v8 = v5;
    v7 = bottomPalette;
    -[_UINavigationBarPalette setOwningNavigationItem:](v7, "setOwningNavigationItem:", 0);
    objc_storeStrong((id *)&self->_bottomPalette, a3);
    -[_UINavigationBarPalette setOwningNavigationItem:](self->_bottomPalette, "setOwningNavigationItem:", self);
    -[UINavigationItem _setBottomPaletteNeedsUpdate:](self, "_setBottomPaletteNeedsUpdate:", v7);

    v5 = v8;
  }

}

- (BOOL)_accumulateViewsFromItems:(id)a3 isLeft:(BOOL)a4 refreshViews:(BOOL)a5
{
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  UINavigationItem *v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  char v33;
  int v34;
  id v35;
  int v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  char v42;
  void *v43;
  id v45;
  id *location;
  void *v47;
  UINavigationItem *v48;
  char v49;
  void *v50;
  _BOOL4 v51;
  id obj;
  void *v53;
  _BOOL4 v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v54 = a5;
  v51 = a4;
  v61 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  location = (id *)&self->_navigationBar;
  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationBar);
  v8 = WeakRetained;
  if (!WeakRetained || (objc_msgSend(WeakRetained, "_isAlwaysHidden") & 1) != 0)
  {
    LOBYTE(v9) = 0;
    goto LABEL_63;
  }
  v48 = self;
  v10 = objc_msgSend(v8, "isMinibar");
  v9 = objc_msgSend(v6, "count");
  if (!v9)
  {
    v11 = 0;
    v12 = 0;
    v41 = 0;
    goto LABEL_59;
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v9);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v9);
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v13 = v6;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
  if (!v14)
  {

    v42 = 0;
    v41 = 0;
    goto LABEL_57;
  }
  v15 = v14;
  obj = v13;
  v53 = v12;
  v50 = v11;
  v45 = v6;
  v55 = 0;
  v16 = 0;
  v49 = 0;
  v17 = *(_QWORD *)v57;
  v47 = v8;
  v18 = v48;
  do
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v57 != v17)
        objc_enumerationMutation(obj);
      v20 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
      if (!objc_msgSend(v20, "isSystemItem")
        || objc_msgSend(v20, "systemItem") != 6 && objc_msgSend(v20, "systemItem") != 5)
      {
        v24 = objc_msgSend(v20, "isCustomViewItem");
        objc_msgSend(v20, "view");
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v25;
        if (v54)
        {
          objc_msgSend(v20, "createViewForNavigationItem:", v18);
          v27 = objc_claimAutoreleasedReturnValue();

          if (v27)
          {
            objc_msgSend(v20, "setView:", v27);
            v49 = 1;
            v26 = (void *)v27;
            goto LABEL_46;
          }
LABEL_30:
          objc_msgSend(v20, "setIsMinibarView:", v10);
          v26 = 0;
LABEL_50:

          continue;
        }
        if (v25)
        {
          if ((objc_msgSend(v20, "isSystemItem") & 1) != 0)
          {
            if ((v24 & 1) == 0)
            {
              if ((_DWORD)v10 == objc_msgSend(v20, "isMinibarView"))
                goto LABEL_22;
LABEL_41:
              v35 = objc_loadWeakRetained(location);
              v36 = objc_msgSend(v35, "_hasLegacyProvider");

              if (v36)
              {
                objc_msgSend(v26, "superview");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                if (v37)
                  objc_msgSend(v26, "removeFromSuperview");
                v38 = objc_msgSend(v26, "isHidden");
                objc_msgSend(v20, "createViewForNavigationItem:", v18);
                v39 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v20, "setView:", v39);
                objc_msgSend(v39, "setHidden:", v38);

                v49 = 1;
                v26 = v39;
                v8 = v47;
                v18 = v48;
                goto LABEL_38;
              }
LABEL_45:
              v8 = v47;
LABEL_46:
              objc_msgSend(v20, "setIsMinibarView:", v10);
LABEL_47:
              objc_msgSend(v26, "setSemanticContentAttribute:", objc_msgSend(v8, "semanticContentAttribute"));
              objc_msgSend(v26, "_uinavigationbar_prepareToAppearInNavigationItem:onLeft:", v18, v51);
              objc_msgSend(v50, "addObject:", v26);
              if ((v16 & 1) == 0)
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "addObject:", v40);

                v18 = v48;
              }
              v16 = 0;
              goto LABEL_50;
            }
          }
          else
          {
            objc_msgSend(v20, "landscapeImagePhone");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = v31;
            if (v31)
              v33 = v24;
            else
              v33 = 1;
            if ((v33 & 1) == 0)
            {
              v34 = objc_msgSend(v20, "isMinibarView");

              if ((_DWORD)v10 != v34)
                goto LABEL_41;
LABEL_22:
              objc_opt_respondsToSelector();
              goto LABEL_45;
            }

            v8 = v47;
          }
          if ((objc_opt_respondsToSelector() & v24 & 1) == 0)
            goto LABEL_46;
        }
        else if ((objc_opt_respondsToSelector() & v24) != 1)
        {
          objc_msgSend(v20, "createViewForNavigationItem:", v18);
          v30 = objc_claimAutoreleasedReturnValue();
          if (!v30)
            goto LABEL_30;
          v26 = (void *)v30;
          objc_msgSend(v20, "setView:", v30);
          v49 = 1;
          goto LABEL_46;
        }
        objc_msgSend(v26, "updateForMiniBarState:", v10);
LABEL_38:
        objc_msgSend(v20, "setIsMinibarView:", v10);
        if (!v26)
          goto LABEL_50;
        goto LABEL_47;
      }
      if ((v16 & 1) != 0)
      {
        objc_msgSend(v53, "lastObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        v23 = v20;
      }
      else
      {
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v20, 0);
        v21 = v53;
        v23 = v22;
      }
      objc_msgSend(v21, "addObject:", v23);

      v28 = objc_msgSend(v20, "systemItem");
      v29 = v55;
      if (v28 == 5)
        v29 = v55 + 1;
      v55 = v29;
      v16 = 1;
    }
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
  }
  while (v15);

  v6 = v45;
  v11 = v50;
  v12 = v53;
  v41 = v55;
  v42 = v49;
  if ((v16 & 1) == 0)
  {
LABEL_57:
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v43);

  }
  LOBYTE(v9) = v42 & 1;
LABEL_59:
  if (v51)
  {
    -[UINavigationItem _setCustomLeftViews:](v48, "_setCustomLeftViews:", v11);
    -[UINavigationItem _setLeftItemSpaceList:](v48, "_setLeftItemSpaceList:", v12);
    -[UINavigationItem _setLeftFlexibleSpaceCount:](v48, "_setLeftFlexibleSpaceCount:", v41);
  }
  else
  {
    -[UINavigationItem _setCustomRightViews:](v48, "_setCustomRightViews:", v11);
    -[UINavigationItem _setRightItemSpaceList:](v48, "_setRightItemSpaceList:", v12);
    -[UINavigationItem _setRightFlexibleSpaceCount:](v48, "_setRightFlexibleSpaceCount:", v41);
  }

LABEL_63:
  return v9;
}

- (void)_setCustomRightViews:(id)a3
{
  NSArray *v4;
  NSArray *customRightViews;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  customRightViews = self->_customRightViews;
  self->_customRightViews = v4;

}

- (void)_setRightItemSpaceList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (void)_setRightFlexibleSpaceCount:(unint64_t)a3
{
  self->__rightFlexibleSpaceCount = a3;
}

- (void)setStyle:(UINavigationItemStyle)style
{
  id WeakRetained;

  if (self->_style != style)
  {
    self->_style = style;
    WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    objc_msgSend(WeakRetained, "navigationItemUpdatedTitleContent:animated:", self, 0);

  }
}

- (void)setCompactScrollEdgeAppearance:(UINavigationBarAppearance *)compactScrollEdgeAppearance
{
  UINavigationBarAppearance *v4;
  UINavigationBarAppearance *v5;
  UINavigationBarAppearance *v6;
  BOOL v7;
  UINavigationBarAppearance *v8;
  UINavigationBarAppearance *v9;
  UINavigationBarAppearance *v10;
  id WeakRetained;
  UINavigationBarAppearance *v12;
  UINavigationBarAppearance *v13;

  v4 = compactScrollEdgeAppearance;
  v5 = self->_compactScrollEdgeAppearance;
  v6 = v4;
  v13 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[UIBarAppearance isEqual:](v5, "isEqual:", v6);

      if (v7)
        goto LABEL_12;
    }
    else
    {

    }
    v8 = self->_compactScrollEdgeAppearance;
    if (v8)
      objc_storeWeak((id *)&v8->super._changeObserver, 0);
    v9 = -[UIBarAppearance copy](v13, "copy");
    v10 = self->_compactScrollEdgeAppearance;
    self->_compactScrollEdgeAppearance = v9;

    WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    objc_msgSend(WeakRetained, "navigationItem:appearance:categoriesChanged:", self, self->_compactScrollEdgeAppearance, -1);

    v12 = self->_compactScrollEdgeAppearance;
    if (v12)
      objc_storeWeak((id *)&v12->super._changeObserver, self);
  }
LABEL_12:

}

- (void)setCompactAppearance:(UINavigationBarAppearance *)compactAppearance
{
  UINavigationBarAppearance *v4;
  UINavigationBarAppearance *v5;
  UINavigationBarAppearance *v6;
  BOOL v7;
  UINavigationBarAppearance *v8;
  UINavigationBarAppearance *v9;
  UINavigationBarAppearance *v10;
  id WeakRetained;
  UINavigationBarAppearance *v12;
  UINavigationBarAppearance *v13;

  v4 = compactAppearance;
  v5 = self->_compactAppearance;
  v6 = v4;
  v13 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[UIBarAppearance isEqual:](v5, "isEqual:", v6);

      if (v7)
        goto LABEL_12;
    }
    else
    {

    }
    v8 = self->_compactAppearance;
    if (v8)
      objc_storeWeak((id *)&v8->super._changeObserver, 0);
    v9 = -[UIBarAppearance copy](v13, "copy");
    v10 = self->_compactAppearance;
    self->_compactAppearance = v9;

    WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    objc_msgSend(WeakRetained, "navigationItem:appearance:categoriesChanged:", self, self->_compactAppearance, -1);

    v12 = self->_compactAppearance;
    if (v12)
      objc_storeWeak((id *)&v12->super._changeObserver, self);
  }
LABEL_12:

}

- (void)setPinnedTrailingGroup:(UIBarButtonItemGroup *)pinnedTrailingGroup
{
  UIBarButtonItemGroup *v5;
  id WeakRetained;
  UIBarButtonItemGroup *v7;

  v5 = pinnedTrailingGroup;
  if (self->_pinnedTrailingGroup != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_pinnedTrailingGroup, pinnedTrailingGroup);
    WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    objc_msgSend(WeakRetained, "navigationItemUpdatedRightBarButtonItems:animated:", self, 0);

    v5 = v7;
  }

}

- (void)_setAutoScrollEdgeTransitionDistance:(double)a3
{
  double v5;
  void *v7;

  if (self->_manualScrollEdgeAppearanceEnabled)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINavigationItem.m"), 1531, CFSTR("_autoScrollEdgeTransitionDistance may only be changed while _manualScrollEdgeAppearanceEnabled==NO"));

  }
  v5 = fmax(a3, 0.0);
  if (self->_autoScrollEdgeTransitionDistance != v5)
    self->_autoScrollEdgeTransitionDistance = v5;
}

- (void)_setBackgroundHidden:(BOOL)a3
{
  id WeakRetained;

  if (self->__backgroundHidden != a3)
  {
    self->__backgroundHidden = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    objc_msgSend(WeakRetained, "navigationItemUpdatedBackgroundAppearance:", self);

  }
}

- (void)_setTopPalette:(id)a3
{
  _UINavigationBarPalette *v5;
  _UINavigationBarPalette *topPalette;
  _UINavigationBarPalette *v7;
  id WeakRetained;
  _UINavigationBarPalette *v9;

  v5 = (_UINavigationBarPalette *)a3;
  topPalette = self->_topPalette;
  if (topPalette != v5)
  {
    v9 = v5;
    v7 = topPalette;
    -[_UINavigationBarPalette setOwningNavigationItem:](v7, "setOwningNavigationItem:", 0);
    objc_storeStrong((id *)&self->_topPalette, a3);
    -[_UINavigationBarPalette setOwningNavigationItem:](self->_topPalette, "setOwningNavigationItem:", self);
    WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    objc_msgSend(WeakRetained, "navigationItem:updatedPalettePart:oldPalette:", self, 6, v7);

    v5 = v9;
  }

}

void __60__UINavigationItem__setAlwaysUseManualScrollEdgeAppearance___block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_962 = objc_msgSend(CFSTR("com.apple.MobileSMS"), "isEqualToString:", v0);

}

- (void)_setAlwaysUseManualScrollEdgeAppearance:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  NSObject *v6;
  id WeakRetained;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v3 = a3;
  if (qword_1ECD7CD38 != -1)
    dispatch_once(&qword_1ECD7CD38, &__block_literal_global_148);
  if (!_MergedGlobals_962)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v8, OS_LOG_TYPE_FAULT, "Application that is not Messages using an SPI designated only for Messages. Disabling", buf, 2u);
      }

    }
    else
    {
      v5 = qword_1ECD7CD40;
      if (!qword_1ECD7CD40)
      {
        v5 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v5, (unint64_t *)&qword_1ECD7CD40);
      }
      v6 = *(NSObject **)(v5 + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "Application that is not Messages using an SPI designated only for Messages. Disabling", v9, 2u);
      }
    }
    v3 = 0;
  }
  if (self->_alwaysUseManualScrollEdgeAppearance != v3)
  {
    self->_alwaysUseManualScrollEdgeAppearance = v3;
    if (self->_manualScrollEdgeAppearanceEnabled)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
      objc_msgSend(WeakRetained, "navigationItemUpdatedScrollEdgeProgress:", self);

    }
  }
}

- (NSString)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  int64_t backButtonDisplayMode;
  const __CFString *v7;
  id titleMenuProvider;
  void *v9;
  id WeakRetained;
  id v11;
  NSArray **p_leadingItemGroups;
  const __CFString *v13;
  NSArray **p_trailingItemGroups;
  const __CFString *v15;
  unint64_t v16;
  unint64_t v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)UINavigationItem;
  -[UINavigationItem description](&v19, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (self->_title)
    objc_msgSend(v4, "appendFormat:", CFSTR(" title='%@'"), self->_title);
  if (self->_titleView)
    objc_msgSend(v4, "appendFormat:", CFSTR(" titleView=%p"), self->_titleView);
  if (self->_prompt)
    objc_msgSend(v4, "appendFormat:", CFSTR(" prompt='%@'"), self->_prompt);
  v5 = self->_style + 1;
  if (v5 <= 3)
    objc_msgSend(v4, "appendString:", off_1E16B5EB8[v5]);
  if (self->_backBarButtonItem)
  {
    objc_msgSend(v4, "appendFormat:", CFSTR(" backBarButtonItem=%p"), self->_backBarButtonItem);
    goto LABEL_18;
  }
  if (self->_backButtonTitle)
    objc_msgSend(v4, "appendFormat:", CFSTR(" backButtonTitle='%@'"), self->_backButtonTitle);
  backButtonDisplayMode = self->_backButtonDisplayMode;
  if (backButtonDisplayMode == 2)
  {
    v7 = CFSTR(" backButtonDisplayMode=minimal");
  }
  else
  {
    if (backButtonDisplayMode != 1)
      goto LABEL_18;
    v7 = CFSTR(" backButtonDisplayMode=generic");
  }
  objc_msgSend(v4, "appendString:", v7);
LABEL_18:
  if (self->_backAction)
    objc_msgSend(v4, "appendFormat:", CFSTR(" backAction=%p"), self->_backAction);
  if ((*(_WORD *)&self->_navigationItemFlags & 1) != 0)
    objc_msgSend(v4, "appendString:", CFSTR(" hidesBackButton"));
  titleMenuProvider = self->_titleMenuProvider;
  if (titleMenuProvider)
  {
    v9 = _Block_copy(titleMenuProvider);
    objc_msgSend(v4, "appendFormat:", CFSTR(" titleMenuProvider=%p"), v9);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_renameDelegate);

  if (WeakRetained)
  {
    v11 = objc_loadWeakRetained((id *)&self->_renameDelegate);
    objc_msgSend(v4, "appendFormat:", CFSTR(" renameDelegate=%p"), v11);

  }
  if (self->_documentProperties)
    objc_msgSend(v4, "appendFormat:", CFSTR(" documentProperties=%p"), self->_documentProperties);
  if (self->_customizationIdentifier)
    objc_msgSend(v4, "appendFormat:", CFSTR(" customizationIdentifier='%@'"), self->_customizationIdentifier);
  p_leadingItemGroups = &self->_leadingItemGroups;
  if (-[NSArray count](self->_leadingItemGroups, "count"))
  {
    v13 = CFSTR(" leadingItemGroups=%p");
  }
  else
  {
    p_leadingItemGroups = &self->_leftBarButtonItems;
    if (!-[NSArray count](self->_leftBarButtonItems, "count"))
      goto LABEL_35;
    v13 = CFSTR(" leftBarButtonItems=%p");
  }
  objc_msgSend(v4, "appendFormat:", v13, *p_leadingItemGroups);
LABEL_35:
  if ((*(_WORD *)&self->_navigationItemFlags & 2) != 0)
    objc_msgSend(v4, "appendString:", CFSTR(" leftItemsSupplementBackButton"));
  if (-[NSArray count](self->_centerItemGroups, "count"))
    objc_msgSend(v4, "appendFormat:", CFSTR(" centerItemGroups=%p"), self->_centerItemGroups);
  p_trailingItemGroups = &self->_trailingItemGroups;
  if (-[NSArray count](self->_trailingItemGroups, "count"))
  {
    v15 = CFSTR(" trailingItemGroups=%p");
  }
  else
  {
    p_trailingItemGroups = &self->_rightBarButtonItems;
    if (!-[NSArray count](self->_rightBarButtonItems, "count"))
      goto LABEL_44;
    v15 = CFSTR(" rightBarButtonItems=%p");
  }
  objc_msgSend(v4, "appendFormat:", v15, *p_trailingItemGroups);
LABEL_44:
  if (self->_additionalOverflowItems)
    objc_msgSend(v4, "appendFormat:", CFSTR(" additionalOverflowItems=%p"), self->_additionalOverflowItems);
  v16 = self->_largeTitleDisplayMode - 1;
  if (v16 <= 2)
    objc_msgSend(v4, "appendString:", off_1E16B5ED8[v16]);
  if (self->_searchController)
  {
    objc_msgSend(v4, "appendFormat:", CFSTR(" searchController=%p"), self->_searchController);
    if ((*(_WORD *)&self->_navigationItemFlags & 4) == 0)
      objc_msgSend(v4, "appendString:", CFSTR(" hidesSearchBarWhenScrolling"));
    v17 = self->_preferredSearchBarPlacement - 1;
    if (v17 <= 2)
      objc_msgSend(v4, "appendString:", off_1E16B5EF0[v17]);
  }
  if (self->_standardAppearance)
    objc_msgSend(v4, "appendFormat:", CFSTR(" standardAppearance=%p"), self->_standardAppearance);
  if (self->_scrollEdgeAppearance)
    objc_msgSend(v4, "appendFormat:", CFSTR(" scrollEdgeAppearance=%p"), self->_scrollEdgeAppearance);
  if (self->_compactAppearance)
    objc_msgSend(v4, "appendFormat:", CFSTR(" compactAppearance=%p"), self->_compactAppearance);
  if (self->_compactScrollEdgeAppearance)
    objc_msgSend(v4, "appendFormat:", CFSTR(" compactScrollEdgeAppearance=%p"), self->_compactScrollEdgeAppearance);
  return (NSString *)v4;
}

- (void)setAdditionalOverflowItems:(UIDeferredMenuElement *)additionalOverflowItems
{
  UIDeferredMenuElement *v5;
  id WeakRetained;
  UIDeferredMenuElement *v7;

  v5 = additionalOverflowItems;
  if (self->_additionalOverflowItems != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_additionalOverflowItems, additionalOverflowItems);
    WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "navigationItemUpdatedAdditionalOverflowItems:", self);
    else
      objc_msgSend(WeakRetained, "navigationItemUpdatedRightBarButtonItems:animated:", self, 0);

    v5 = v7;
  }

}

- (void)_setFontScaleAdjustment:(double)a3
{
  uint64_t v4;
  void (**v5)(void *, NSArray *);
  _QWORD aBlock[5];

  if (self->_fontScaleAdjustment != a3)
  {
    v4 = MEMORY[0x1E0C809B0];
    self->_fontScaleAdjustment = a3;
    aBlock[0] = v4;
    aBlock[1] = 3221225472;
    aBlock[2] = __44__UINavigationItem__setFontScaleAdjustment___block_invoke;
    aBlock[3] = &__block_descriptor_40_e17_v16__0__NSArray_8l;
    *(double *)&aBlock[4] = a3;
    v5 = (void (**)(void *, NSArray *))_Block_copy(aBlock);
    v5[2](v5, self->_leftBarButtonItems);
    v5[2](v5, self->_rightBarButtonItems);

  }
}

void __44__UINavigationItem__setFontScaleAdjustment___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v8, "isCustomViewItem") & 1) == 0)
        {
          objc_msgSend(v8, "view");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "titleForState:", 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "length");

          if (v11)
          {
            objc_msgSend(v9, "_setFontScaleAdjustment:", *(double *)(a1 + 32));
            objc_msgSend(v9, "_updateStyle");
            objc_msgSend(v9, "sizeToFit");
          }

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (void)_setAbbreviatedBackButtonTitles:(id)a3
{
  id v4;
  NSArray *abbreviatedBackButtonTitles;
  id WeakRetained;
  NSArray *v7;
  NSArray *v8;
  UIView *backButtonView;
  id v10;
  double v11;
  double v12;
  id v13;

  v4 = a3;
  abbreviatedBackButtonTitles = self->_abbreviatedBackButtonTitles;
  v13 = v4;
  if (v4 && !abbreviatedBackButtonTitles
    || abbreviatedBackButtonTitles && !-[NSArray isEqualToArray:](abbreviatedBackButtonTitles, "isEqualToArray:", v4))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_navigationBar);
    v7 = (NSArray *)objc_msgSend(v13, "copy");
    v8 = self->_abbreviatedBackButtonTitles;
    self->_abbreviatedBackButtonTitles = v7;

    backButtonView = self->_backButtonView;
    if (backButtonView)
    {
      if (-[UIView _abbreviatedTitleIndex](backButtonView, "_abbreviatedTitleIndex") != 0x7FFFFFFFFFFFFFFFLL
        && !objc_msgSend(WeakRetained, "state"))
      {
        -[UIView _setAbbreviatedTitleIndex:](self->_backButtonView, "_setAbbreviatedTitleIndex:", 0x7FFFFFFFFFFFFFFFLL);
        if (WeakRetained)
        {
          -[UIView superview](self->_backButtonView, "superview");
          v10 = (id)objc_claimAutoreleasedReturnValue();
          if (v10 == WeakRetained && !-[UIView isHidden](self->_backButtonView, "isHidden"))
          {
            -[UIView alpha](self->_backButtonView, "alpha");
            v12 = v11;

            if (v12 != 0.0)
              objc_msgSend(WeakRetained, "setNeedsLayout");
          }
          else
          {

          }
        }
      }
    }

  }
}

- (void)_setBackButtonPressed:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UINavigationItem existingBackButtonView](self, "existingBackButtonView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPressed:", v3);

}

+ (id)defaultFont
{
  void *v2;
  void *v3;

  +[UINavigationBar _defaultVisualStyleForOrientation:](UINavigationBar, "_defaultVisualStyleForOrientation:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "headingFontSize");
  objc_msgSend(off_1E167A828, "boldSystemFontOfSize:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *prompt;
  NSString *backButtonTitle;
  UIBarButtonItem *backBarButtonItem;
  int64_t backButtonDisplayMode;
  void *v8;
  void *v9;
  NSArray *leftBarButtonItems;
  UIView *titleView;
  NSArray *centerItemGroups;
  NSString *customizationIdentifier;
  int64_t style;
  NSArray *rightBarButtonItems;
  id WeakRetained;
  UINavigationBarAppearance *standardAppearance;
  UINavigationBarAppearance *compactAppearance;
  UINavigationBarAppearance *scrollEdgeAppearance;
  UINavigationBarAppearance *compactScrollEdgeAppearance;
  id v21;

  v21 = a3;
  if (-[NSString length](self->_title, "length"))
    objc_msgSend(v21, "encodeObject:forKey:", self->_title, CFSTR("UITitle"));
  prompt = self->_prompt;
  if (prompt)
    objc_msgSend(v21, "encodeObject:forKey:", prompt, CFSTR("UIPrompt"));
  backButtonTitle = self->_backButtonTitle;
  if (backButtonTitle)
    objc_msgSend(v21, "encodeObject:forKey:", backButtonTitle, CFSTR("UIBackButtonTitle"));
  backBarButtonItem = self->_backBarButtonItem;
  if (backBarButtonItem)
    objc_msgSend(v21, "encodeObject:forKey:", backBarButtonItem, CFSTR("UIBackBarButtonItem"));
  backButtonDisplayMode = self->_backButtonDisplayMode;
  if (backButtonDisplayMode)
    objc_msgSend(v21, "encodeInteger:forKey:", backButtonDisplayMode, CFSTR("UIBackButtonDisplayMode"));
  if ((*(_WORD *)&self->_navigationItemFlags & 2) != 0)
    objc_msgSend(v21, "encodeBool:forKey:", 1, CFSTR("UILeftItemsSupplementBackButton"));
  -[NSArray firstObject](self->_leftBarButtonItems, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v21, "encodeObject:forKey:", v8, CFSTR("UILeftBarButtonItem"));
  -[NSArray firstObject](self->_rightBarButtonItems, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v21, "encodeObject:forKey:", v9, CFSTR("UIRightBarButtonItem"));
  leftBarButtonItems = self->_leftBarButtonItems;
  if (leftBarButtonItems)
    objc_msgSend(v21, "encodeObject:forKey:", leftBarButtonItems, CFSTR("UILeftBarButtonItems"));
  titleView = self->_titleView;
  if (titleView)
    objc_msgSend(v21, "encodeObject:forKey:", titleView, CFSTR("UITitleView"));
  centerItemGroups = self->_centerItemGroups;
  if (centerItemGroups)
    objc_msgSend(v21, "encodeObject:forKey:", centerItemGroups, CFSTR("UICenterItemGroups"));
  customizationIdentifier = self->_customizationIdentifier;
  if (customizationIdentifier)
    objc_msgSend(v21, "encodeObject:forKey:", customizationIdentifier, CFSTR("UICustomizationIdentifier"));
  style = self->_style;
  if (style)
    objc_msgSend(v21, "encodeInteger:forKey:", style, CFSTR("UIStyle"));
  rightBarButtonItems = self->_rightBarButtonItems;
  if (rightBarButtonItems)
    objc_msgSend(v21, "encodeObject:forKey:", rightBarButtonItems, CFSTR("UIRightBarButtonItems"));
  if (dyld_program_sdk_at_least())
    objc_msgSend(v21, "encodeInteger:forKey:", self->_largeTitleDisplayMode, CFSTR("UILargeTitleDisplayMode"));
  if ((*(_WORD *)&self->_navigationItemFlags & 4) != 0)
    objc_msgSend(v21, "encodeBool:forKey:", 1, CFSTR("UIAlwaysShowsSearchBar"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationBar);
  if (WeakRetained)
    objc_msgSend(v21, "encodeConditionalObject:forKey:", WeakRetained, CFSTR("UINavigationBar"));
  standardAppearance = self->_standardAppearance;
  if (standardAppearance)
    objc_msgSend(v21, "encodeObject:forKey:", standardAppearance, CFSTR("UINavigationBarStandardAppearance"));
  compactAppearance = self->_compactAppearance;
  if (compactAppearance)
    objc_msgSend(v21, "encodeObject:forKey:", compactAppearance, CFSTR("UINavigationBarCompactAppearance"));
  scrollEdgeAppearance = self->_scrollEdgeAppearance;
  if (scrollEdgeAppearance)
    objc_msgSend(v21, "encodeObject:forKey:", scrollEdgeAppearance, CFSTR("UINavigationBarScrollEdgeAppearance"));
  compactScrollEdgeAppearance = self->_compactScrollEdgeAppearance;
  if (compactScrollEdgeAppearance)
    objc_msgSend(v21, "encodeObject:forKey:", compactScrollEdgeAppearance, CFSTR("UINavigationBarCompactScrollEdgeAppearance"));

}

- (void)_freezeCurrentTitleView
{
  CGFloat v3;
  CGFloat v4;
  void *v5;
  _QWORD *ContextStack;
  uint64_t v7;
  void *v8;
  UIImageView *v9;
  UIImageView *frozenTitleView;
  void *v11;
  id v12;

  -[UINavigationItem _defaultTitleView](self, "_defaultTitleView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  if (v3 > 0.0 && v4 > 0.0)
  {
    _UIGraphicsBeginImageContextWithOptions(0, 0, v3, v4, 0.0);
    objc_msgSend(v12, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1)
      v7 = 0;
    else
      v7 = ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    objc_msgSend(v5, "renderInContext:", v7);

    _UIGraphicsGetImageFromCurrentImageContext(0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    if (v8)
    {
      if (self->_frozenTitleView)
        -[UINavigationItem _cleanupFrozenTitleView](self, "_cleanupFrozenTitleView");
      v9 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v8);
      frozenTitleView = self->_frozenTitleView;
      self->_frozenTitleView = v9;

      -[UIView setAlpha:](self->_frozenTitleView, "setAlpha:", 1.0);
      objc_msgSend(v12, "frame");
      -[UIImageView setFrame:](self->_frozenTitleView, "setFrame:");
      objc_msgSend(v12, "superview");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addSubview:", self->_frozenTitleView);

      objc_msgSend(v12, "setAlpha:", 0.0);
    }

  }
}

- (void)_cleanupFrozenTitleView
{
  UIImageView *frozenTitleView;

  -[UIView removeFromSuperview](self->_frozenTitleView, "removeFromSuperview");
  frozenTitleView = self->_frozenTitleView;
  self->_frozenTitleView = 0;

}

- (id)_addDefaultTitleViewToNavigationBarIfNecessary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UINavigationItem *v9;

  v4 = a3;
  v5 = v4;
  v6 = 0;
  if (v4 && !self->_titleView)
  {
    if ((objc_msgSend(v4, "_isAlwaysHidden") & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      -[UINavigationItem _defaultTitleView](self, "_defaultTitleView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v7;
      if (v7)
      {
        objc_msgSend(v7, "superview");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          objc_msgSend(v5, "topItem");
          v9 = (UINavigationItem *)objc_claimAutoreleasedReturnValue();

          if (v9 != self)
            goto LABEL_9;
          objc_msgSend(v5, "_contentView");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addSubview:", v6);
        }

      }
    }
  }
LABEL_9:

  return v6;
}

- (void)_setTitle:(id)a3 animated:(BOOL)a4 matchBarButtonItemAnimationDuration:(BOOL)a5
{
  _BOOL4 v5;
  NSString *v8;
  NSString *v9;
  id WeakRetained;
  NSString *v11;
  NSString *title;
  id v13;
  void *v14;
  NSString *v15;
  NSString *v16;
  void *v17;
  double v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  _QWORD v22[5];
  id v23;

  v5 = a5;
  v8 = (NSString *)a3;
  v9 = v8;
  if (a4)
  {
    if (self->_title != v8 && !-[NSString isEqualToString:](v8, "isEqualToString:"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
      if (WeakRetained)
      {
        v11 = (NSString *)-[NSString copy](v9, "copy");
        title = self->_title;
        self->_title = v11;

        if (objc_msgSend(WeakRetained, "navigationItemIsTopItem:", self))
        {
          objc_msgSend(WeakRetained, "navigationItemUpdatedTitleContent:animated:", self, 1);
        }
        else if (objc_msgSend(WeakRetained, "navigationItemIsBackItem:", self))
        {
          objc_msgSend(WeakRetained, "navigationItemUpdatedBackButtonContent:animated:", self, 0);
        }
      }
      else
      {
        v13 = objc_loadWeakRetained((id *)&self->_navigationBar);
        v14 = v13;
        if (v13)
        {
          if (objc_msgSend(v13, "state"))
          {
            -[UINavigationItem _setPendingTitle:](self, "_setPendingTitle:", v9);
          }
          else
          {
            -[UINavigationItem _freezeCurrentTitleView](self, "_freezeCurrentTitleView");
            v15 = (NSString *)-[NSString copy](v9, "copy");
            v16 = self->_title;
            self->_title = v15;

            -[UINavigationItem _setPendingTitle:](self, "_setPendingTitle:", 0);
            -[UINavigationItem _addDefaultTitleViewToNavigationBarIfNecessary:](self, "_addDefaultTitleViewToNavigationBarIfNecessary:", v14);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "_resetTitleSize");
            -[UIView setNeedsDisplay](self->_backButtonView, "setNeedsDisplay");
            objc_msgSend(v17, "setNeedsDisplay");
            objc_msgSend(v14, "setNeedsLayout");
            if (v5)
              v18 = 0.35;
            else
              v18 = 0.175;
            objc_msgSend(v14, "animationFactory");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v21[4] = self;
            v22[0] = MEMORY[0x1E0C809B0];
            v22[1] = 3221225472;
            v22[2] = __75__UINavigationItem__setTitle_animated_matchBarButtonItemAnimationDuration___block_invoke;
            v22[3] = &unk_1E16B1B50;
            v22[4] = self;
            v23 = v17;
            v21[0] = MEMORY[0x1E0C809B0];
            v21[1] = 3221225472;
            v21[2] = __75__UINavigationItem__setTitle_animated_matchBarButtonItemAnimationDuration___block_invoke_2;
            v21[3] = &unk_1E16B3FD8;
            v20 = v17;
            +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v19, v22, v21, v18, 0.0);

          }
        }

      }
    }
  }
  else
  {
    -[UINavigationItem setTitle:](self, "setTitle:", v8);
  }

}

uint64_t __75__UINavigationItem__setTitle_animated_matchBarButtonItemAnimationDuration___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
}

uint64_t __75__UINavigationItem__setTitle_animated_matchBarButtonItemAnimationDuration___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanupFrozenTitleView");
}

- (void)_setTitle:(id)a3 animated:(BOOL)a4
{
  -[UINavigationItem _setTitle:animated:matchBarButtonItemAnimationDuration:](self, "_setTitle:animated:matchBarButtonItemAnimationDuration:", a3, a4, 0);
}

- (id)_effectiveTitleForTitle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "length"))
    {
      v12 = v6;
    }
    else
    {
      _UILocalizedFormat(CFSTR("NAVIGATION_TITLE_QUOTES"), (uint64_t)CFSTR("The title in quotes"), CFSTR("“%@”"), v7, v8, v9, v10, v11, (uint64_t)v4);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

  }
  else
  {
    v13 = (void *)objc_msgSend(v4, "copy");
  }

  return v13;
}

- (BOOL)_supportsTwoLineLargeTitles
{
  return self->__largeTitleTwoLineMode != 0;
}

- (void)_setPreferredNavigationBarVisibility:(unint64_t)a3
{
  unint64_t v5;
  id WeakRetained;

  if (self->__preferredNavigationBarVisibility != a3)
  {
    v5 = -[UINavigationItem _navigationBarVisibility](self, "_navigationBarVisibility");
    self->__preferredNavigationBarVisibility = a3;
    if (-[UINavigationItem _navigationBarVisibility](self, "_navigationBarVisibility") != v5)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
      objc_msgSend(WeakRetained, "navigationItemUpdatedNavigationBarVisibility:", self);

    }
  }
}

- (void)_setNavigationBarHidden:(BOOL)a3
{
  id WeakRetained;

  if (self->__navigationBarHidden != a3)
  {
    self->__navigationBarHidden = a3;
    if (!self->__preferredNavigationBarVisibility)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
      objc_msgSend(WeakRetained, "navigationItemUpdatedNavigationBarVisibility:", self);

    }
  }
}

- (BOOL)_allowsInteractivePopWhenNavigationBarHidden
{
  return HIBYTE(*(_WORD *)&self->_navigationItemFlags) & 1;
}

- (void)_setAllowsInteractivePopWhenNavigationBarHidden:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_navigationItemFlags = *(_WORD *)&self->_navigationItemFlags & 0xFEFF | v3;
}

- (unint64_t)_navigationBarVisibility
{
  unint64_t preferredNavigationBarVisibility;

  preferredNavigationBarVisibility = self->__preferredNavigationBarVisibility;
  if (preferredNavigationBarVisibility == 2)
    return 2;
  if (preferredNavigationBarVisibility)
    return 1;
  return self->__navigationBarHidden;
}

- (UINavigationBar)_navigationBar
{
  return (UINavigationBar *)objc_loadWeakRetained((id *)&self->_navigationBar);
}

- (void)_setNavigationBar:(id)a3
{
  objc_storeWeak((id *)&self->_navigationBar, a3);
}

- (void)_searchControllerReadyForDeferredAutomaticShowsScopeBar
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
  objc_msgSend(WeakRetained, "navigationItemSearchControllerReadyForDeferredAutomaticShowsScopeBar:", self);

}

- (BOOL)_shouldSearchControllerDeferPresentationTransition:(id)a3
{
  UINavigationItem *v3;
  id WeakRetained;

  v3 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
  LOBYTE(v3) = objc_msgSend(WeakRetained, "shouldSearchControllerDeferPresentationTransitionForNavigationItem:", v3);

  return (char)v3;
}

- (void)setBackBarButtonItem:(UIBarButtonItem *)backBarButtonItem
{
  UIBarButtonItem *v5;
  void *v6;
  _BOOL4 v7;
  id WeakRetained;
  void *v9;
  id v10;
  void *v11;
  UIView *backButtonView;
  char v13;
  UIView *v14;
  UIView *v15;
  void *v16;
  void *v17;
  UIView *v18;
  void *v19;
  void *v20;
  void *v21;
  UIBarButtonItem *object;

  v5 = backBarButtonItem;
  if (self->_backBarButtonItem != v5)
  {
    object = v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[UIView _appearanceStorage](self->_backButtonView, "_appearanceStorage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6 != 0;

    }
    else
    {
      v7 = 0;
    }
    objc_storeStrong((id *)&self->_backBarButtonItem, backBarButtonItem);
    WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    v9 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "navigationItemUpdatedBackButtonContent:animated:", self, 0);
    }
    else
    {
      v10 = objc_loadWeakRetained((id *)&self->_navigationBar);
      v11 = v10;
      if (v10)
      {
        if (self->_backBarButtonItem)
        {
          backButtonView = self->_backButtonView;
          if (backButtonView)
            v13 = v7;
          else
            v13 = 1;
          if ((v13 & 1) != 0)
          {
            if (v7)
              -[UINavigationItem _removeBackButtonView](self, "_removeBackButtonView");
            -[UINavigationItem backButtonView](self, "backButtonView");
            v14 = (UIView *)objc_claimAutoreleasedReturnValue();
            v15 = self->_backButtonView;
            self->_backButtonView = v14;

          }
          else
          {
            objc_msgSend(v10, "_appearanceStorage");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "_barButtonAppearanceStorage");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIView _applyBarButtonAppearanceStorage:withTaggedSelectors:](backButtonView, "_applyBarButtonAppearanceStorage:withTaggedSelectors:", v17, 0);

            v18 = self->_backButtonView;
            -[UIBarButtonItem _appearanceStorage](object, "_appearanceStorage");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_getAssociatedObject(object, &_UIAppearanceCustomizedSelectorsAssociationKey);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIView _applyBarButtonAppearanceStorage:withTaggedSelectors:](v18, "_applyBarButtonAppearanceStorage:withTaggedSelectors:", v19, v20);

          }
        }
        else
        {
          -[UINavigationItem _removeBackButtonView](self, "_removeBackButtonView");
        }
        -[UIView setNeedsDisplay](self->_backButtonView, "setNeedsDisplay");
        -[UINavigationItem _defaultTitleView](self, "_defaultTitleView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setNeedsDisplay");
        objc_msgSend(v11, "setNeedsLayout");
        objc_msgSend(v11, "_accessibility_navigationBarContentsDidChange");

      }
    }

    v5 = object;
  }

}

- (NSString)backButtonTitle
{
  return self->_backButtonTitle;
}

- (id)currentBackButtonTitle
{
  void *v3;
  void *v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIView title](self->_backButtonView, "title");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copy");

  }
  else
  {
    -[UINavigationItem backButtonTitle](self, "backButtonTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)_removeBarButtonItemViews
{
  void *v3;
  id v4;

  -[UINavigationItem leftBarButtonItems](self, "leftBarButtonItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __45__UINavigationItem__removeBarButtonItemViews__block_invoke(v3);

  -[UINavigationItem rightBarButtonItems](self, "rightBarButtonItems");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  __45__UINavigationItem__removeBarButtonItemViews__block_invoke(v4);

}

void __45__UINavigationItem__removeBarButtonItemViews__block_invoke(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v5), "view");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "removeFromSuperview");

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

- (void)_removeTitleAndButtonViews
{
  void *v3;
  UIView *defaultTitleView;

  -[UINavigationItem _removeBackButtonView](self, "_removeBackButtonView");
  -[UINavigationItem titleView](self, "titleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[UIView removeFromSuperview](self->_defaultTitleView, "removeFromSuperview");
  defaultTitleView = self->_defaultTitleView;
  self->_defaultTitleView = 0;

}

- (void)_removeBackButtonView
{
  UIView *backButtonView;

  -[UIView removeFromSuperview](self->_backButtonView, "removeFromSuperview");
  backButtonView = self->_backButtonView;
  self->_backButtonView = 0;

}

- (void)_replaceCustomLeftRightViewAtIndex:(unint64_t)a3 withView:(id)a4 left:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v5 = a5;
  v12 = a4;
  objc_msgSend(v12, "_uinavigationbar_prepareToAppearInNavigationItem:onLeft:", self, v5);
  v8 = 120;
  if (v5)
    v8 = 112;
  v9 = *(id *)((char *)&self->super.isa + v8);
  objc_msgSend(v9, "objectAtIndex:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 != v12)
  {
    v11 = (void *)objc_msgSend(v9, "mutableCopy");
    objc_msgSend(v11, "replaceObjectAtIndex:withObject:", a3, v12);
    if (v5)
      -[UINavigationItem _setCustomLeftViews:](self, "_setCustomLeftViews:", v11);
    else
      -[UINavigationItem _setCustomRightViews:](self, "_setCustomRightViews:", v11);

  }
}

- (id)existingBackButtonView
{
  return self->_backButtonView;
}

- (id)backButtonView
{
  id WeakRetained;
  void *v4;
  int v5;
  UIView *backButtonView;
  _UINavigationItemButtonView *v7;
  UIView *v8;
  UIView *v9;
  void *v10;
  void *v11;
  UIView *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  UIView *v16;

  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationBar);
  objc_msgSend(WeakRetained, "_screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(WeakRetained, "_shouldShowBackButtonForScreen:", v4);

  if (v5)
  {
    backButtonView = self->_backButtonView;
    if (!backButtonView)
    {
      v7 = -[_UINavigationItemButtonView initWithNavigationItem:]([_UINavigationItemButtonView alloc], "initWithNavigationItem:", self);
      v8 = self->_backButtonView;
      self->_backButtonView = &v7->super.super;

      v9 = self->_backButtonView;
      objc_msgSend(WeakRetained, "_appearanceStorage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_barButtonAppearanceStorage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView _applyBarButtonAppearanceStorage:withTaggedSelectors:](v9, "_applyBarButtonAppearanceStorage:withTaggedSelectors:", v11, 0);

      v12 = self->_backButtonView;
      -[UIBarButtonItem _appearanceStorage](self->_backBarButtonItem, "_appearanceStorage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_getAssociatedObject(self->_backBarButtonItem, &_UIAppearanceCustomizedSelectorsAssociationKey);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView _applyBarButtonAppearanceStorage:withTaggedSelectors:](v12, "_applyBarButtonAppearanceStorage:withTaggedSelectors:", v13, v14);

      -[UIView setSemanticContentAttribute:](self->_backButtonView, "setSemanticContentAttribute:", objc_msgSend(WeakRetained, "semanticContentAttribute"));
      v15 = +[_UIAppearance _hasCustomizationsForClass:guideClass:](_UIAppearance, "_hasCustomizationsForClass:guideClass:", objc_opt_class(), -[UIView _appearanceGuideClass](self->_backButtonView, "_appearanceGuideClass"));
      backButtonView = self->_backButtonView;
      if (v15)
      {
        -[UIView _setAppearanceIsInvalid:](backButtonView, "_setAppearanceIsInvalid:", 1);
        backButtonView = self->_backButtonView;
      }
    }
    v16 = backButtonView;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)setPrompt:(NSString *)prompt
{
  NSString *v4;
  NSString *v5;
  id WeakRetained;
  id v7;
  id v8;

  if (self->_prompt != prompt)
  {
    v4 = (NSString *)-[NSString copy](prompt, "copy");
    v5 = self->_prompt;
    self->_prompt = v4;

    WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    v8 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "navigationItemUpdatedPromptContent:", self);
    }
    else
    {
      v7 = objc_loadWeakRetained((id *)&self->_navigationBar);
      objc_msgSend(v7, "updatePrompt");
      objc_msgSend(v7, "_accessibility_navigationBarContentsDidChange");

    }
  }
}

- (BOOL)_leftItemsWantBackButton
{
  _BOOL4 v3;

  if (-[NSArray count](self->_leftBarButtonItems, "count"))
    v3 = -[NSArray count](self->_leadingItemGroups, "count") != 0;
  else
    v3 = 1;
  return v3 | ((*(_WORD *)&self->_navigationItemFlags & 2) >> 1);
}

- (BOOL)_wantsBackButtonIndicator
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_leftBarButtonItems;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if ((objc_msgSend(v6, "isHidden", (_QWORD)v8) & 1) == 0)
        {
          LOBYTE(v3) = objc_msgSend(v6, "_showsBackButtonIndicator");
          goto LABEL_11;
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)_buttonForBackButtonIndicator
{
  void *v2;
  void *v3;

  -[UINavigationItem _barButtonForBackButtonIndicator](self, "_barButtonForBackButtonIndicator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)_dci_preferredSearchBarPlacement
{
  return self->_preferredSearchBarPlacement;
}

- (_UIBarButtonItemSearchBarGroup)_existingInlineSearchBarItemGroup
{
  return self->_inlineSearchBarItemGroup;
}

- (void)set_alwaysUseManualScrollEdgeAppearance:(BOOL)a3
{
  -[UINavigationItem doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (BOOL)_shouldDismissPresentedViewControllerWhenPopped
{
  return (*(_WORD *)&self->_navigationItemFlags & 8) == 0;
}

- (void)_setShouldDismissPresentedViewControllerWhenPopped:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0;
  else
    v3 = 8;
  *(_WORD *)&self->_navigationItemFlags = *(_WORD *)&self->_navigationItemFlags & 0xFFF7 | v3;
}

- (void)_sendSearchBarPlacementChangeCallbackIfNecessaryWillChange:(id *)a1
{
  uint64_t v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;

  if (a1)
  {
    objc_msgSend(a1[16], "delegate");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
    {
      v11 = (void *)v4;
      if (a2)
      {
        v6 = objc_opt_respondsToSelector();
        v5 = v11;
        if ((v6 & 1) != 0)
        {
          v7 = objc_msgSend(a1, "searchBarPlacement", v11);
          objc_msgSend(a1[16], "delegate");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "searchController:willChangeToSearchBarPlacement:", a1[16], v7);
LABEL_8:

          v5 = v11;
        }
      }
      else
      {
        v9 = objc_opt_respondsToSelector();
        v5 = v11;
        if ((v9 & 1) != 0)
        {
          v10 = objc_msgSend(a1, "searchBarPlacement", v11);
          objc_msgSend(a1[16], "delegate");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "searchController:didChangeFromSearchBarPlacement:", a1[16], v10);
          goto LABEL_8;
        }
      }
    }

  }
}

- (UIView)customLeftView
{
  return 0;
}

- (UIView)customRightView
{
  return 0;
}

- (UIBarButtonItem)customLeftItem
{
  return 0;
}

- (UIBarButtonItem)customRightItem
{
  return 0;
}

- (void)_updatePalette:(id)a3
{
  _UINavigationBarPalette *v4;
  _UINavigationBarPalette *v5;
  id WeakRetained;
  _UINavigationBarPalette *v7;

  v4 = (_UINavigationBarPalette *)a3;
  v5 = v4;
  if (self->_topPalette == v4)
  {
    v7 = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    objc_msgSend(WeakRetained, "navigationItem:updatedPalettePart:oldPalette:", self, 6, v7);

    goto LABEL_5;
  }
  if (self->_bottomPalette == v4)
  {
    v7 = v4;
    -[UINavigationItem _setBottomPaletteNeedsUpdate:](self, "_setBottomPaletteNeedsUpdate:");
LABEL_5:
    v5 = v7;
  }

}

- (void)_dci_setDocumentMenu:(id)a3
{
  UIMenu *v4;
  UIMenu *documentMenu;
  id WeakRetained;

  if (self->_documentMenu != a3)
  {
    v4 = (UIMenu *)objc_msgSend(a3, "copy");
    documentMenu = self->_documentMenu;
    self->_documentMenu = v4;

    WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
    objc_msgSend(WeakRetained, "navigationItemUpdatedTitleContent:animated:", self, 0);

  }
}

- (id)_dci_documentMenuProvider
{
  return _Block_copy(self->_titleMenuProvider);
}

- (_UIDocumentMenuHeader)_dci_documentMenuHeader
{
  void *v2;
  void *v3;
  _UIDocumentMenuHeader *v4;

  -[UINavigationItem documentProperties](self, "documentProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSArray)_dci_centerItemGroups
{
  void *v2;
  void *v3;
  NSArray *v4;

  -[UINavigationItem centerItemGroups](self, "centerItemGroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA60];
  v4 = v2;

  return v4;
}

- (NSArray)_dci_centerItems
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (id)overflowPresentationSource
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "presentationSourceForContent:navigationItem:", 0, self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setRenameDelegate:(id)renameDelegate
{
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id from;
  id location[2];

  v4 = renameDelegate;
  objc_storeWeak((id *)&self->_renameDelegate, v4);
  if (v4)
  {
    objc_initWeak(location, self);
    objc_initWeak(&from, v4);
    v5 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __38__UINavigationItem_setRenameDelegate___block_invoke;
    v25[3] = &unk_1E16B5DA8;
    objc_copyWeak(&v26, location);
    objc_copyWeak(&v27, &from);
    +[_UINavigationItemRenameHandler handlerWithDidEndRenamingHandler:](_UINavigationItemRenameHandler, "handlerWithDidEndRenamingHandler:", v25);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v5;
    v22[1] = 3221225472;
    v22[2] = __38__UINavigationItem_setRenameDelegate___block_invoke_2;
    v22[3] = &unk_1E16B5DD0;
    objc_copyWeak(&v23, location);
    objc_copyWeak(&v24, &from);
    objc_msgSend(v6, "setShouldBeginRenamingHandler:", v22);
    v19[0] = v5;
    v19[1] = 3221225472;
    v19[2] = __38__UINavigationItem_setRenameDelegate___block_invoke_3;
    v19[3] = &unk_1E16B5DF8;
    objc_copyWeak(&v20, location);
    objc_copyWeak(&v21, &from);
    objc_msgSend(v6, "setWillBeginRenamingWithRangeHandler:", v19);
    v16[0] = v5;
    v16[1] = 3221225472;
    v16[2] = __38__UINavigationItem_setRenameDelegate___block_invoke_4;
    v16[3] = &unk_1E16B5E20;
    objc_copyWeak(&v17, location);
    objc_copyWeak(&v18, &from);
    objc_msgSend(v6, "setShouldEndRenamingHandler:", v16);
    v13[0] = v5;
    v13[1] = 3221225472;
    v13[2] = __38__UINavigationItem_setRenameDelegate___block_invoke_5;
    v13[3] = &unk_1E16B5E48;
    objc_copyWeak(&v14, location);
    objc_copyWeak(&v15, &from);
    objc_msgSend(v6, "setFileURLForRenaming:", v13);
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __38__UINavigationItem_setRenameDelegate___block_invoke_6;
    v10[3] = &unk_1E16B5E70;
    objc_copyWeak(&v11, location);
    objc_copyWeak(&v12, &from);
    objc_msgSend(v6, "setFileRenameDidFail:", v10);
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __38__UINavigationItem_setRenameDelegate___block_invoke_7;
    v7[3] = &unk_1E16B5E98;
    objc_copyWeak(&v8, location);
    objc_copyWeak(&v9, &from);
    objc_msgSend(v6, "setFileRenameDidEnd:", v7);
    -[UINavigationItem _dci_setRenameHandler:](self, "_dci_setRenameHandler:", v6);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v23);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&from);
    objc_destroyWeak(location);
  }
  else
  {
    -[UINavigationItem _dci_setRenameHandler:](self, "_dci_setRenameHandler:", 0);
  }

}

void __38__UINavigationItem_setRenameDelegate___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id v5;
  void *v6;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = v5;
  if (WeakRetained && v5)
    objc_msgSend(v5, "navigationItem:didEndRenamingWithTitle:", WeakRetained, v4);
  else
    +[_UINavigationItemRenameHandler defaultNavigationItem:didEndRenamingWithTitle:](_UINavigationItemRenameHandler, "defaultNavigationItem:didEndRenamingWithTitle:", WeakRetained, v4);

}

uint64_t __38__UINavigationItem_setRenameDelegate___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = v3;
  if (WeakRetained && v3 && (objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v4, "navigationItemShouldBeginRenaming:", WeakRetained);
  else
    v5 = +[_UINavigationItemRenameHandler defaultNavigationItemShouldBeginRenaming:forValidDelegate:](_UINavigationItemRenameHandler, "defaultNavigationItemShouldBeginRenaming:forValidDelegate:", WeakRetained, v4 != 0);
  v6 = v5;

  return v6;
}

id __38__UINavigationItem_setRenameDelegate___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = v7;
  if (WeakRetained && v7 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "navigationItem:willBeginRenamingWithSuggestedTitle:selectedRange:", WeakRetained, v5, a3);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[_UINavigationItemRenameHandler defaultNavigationItem:willBeginRenamingWithSuggestedTitle:selectedRange:](_UINavigationItemRenameHandler, "defaultNavigationItem:willBeginRenamingWithSuggestedTitle:selectedRange:", WeakRetained, v5, a3);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

uint64_t __38__UINavigationItem_setRenameDelegate___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = v5;
  if (WeakRetained && v5 && (objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v6, "navigationItem:shouldEndRenamingWithTitle:", WeakRetained, v3);
  else
    v7 = +[_UINavigationItemRenameHandler defaultNavigationItem:shouldEndRenamingWithTitle:](_UINavigationItemRenameHandler, "defaultNavigationItem:shouldEndRenamingWithTitle:", WeakRetained, v3);
  v8 = v7;

  return v8;
}

id __38__UINavigationItem_setRenameDelegate___block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = v3;
  v5 = 0;
  if (WeakRetained && v3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "_navigationItemFileURLForRenaming:", WeakRetained);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

void __38__UINavigationItem_setRenameDelegate___block_invoke_6(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = v4;
  if (WeakRetained && v4 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "_navigationItem:fileRenameDidFailWithError:", WeakRetained, v6);

}

void __38__UINavigationItem_setRenameDelegate___block_invoke_7(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = v4;
  if (WeakRetained && v4 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "_navigationItem:fileRenameDidEndWithFinalURL:", WeakRetained, v6);

}

- (BOOL)_canRename
{
  void *v2;
  char v3;

  -[UINavigationItem _dci_renameHandler](self, "_dci_renameHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_canRename");

  return v3;
}

- (id)_customLeftViews
{
  if (!self->_customLeftViews && -[NSArray count](self->_leftBarButtonItems, "count"))
    -[UINavigationItem _accumulateViewsFromItems:isLeft:refreshViews:](self, "_accumulateViewsFromItems:isLeft:refreshViews:", self->_leftBarButtonItems, 1, 1);
  return self->_customLeftViews;
}

- (id)_customRightViews
{
  if (!self->_customRightViews && -[NSArray count](self->_rightBarButtonItems, "count"))
    -[UINavigationItem _accumulateViewsFromItems:isLeft:refreshViews:](self, "_accumulateViewsFromItems:isLeft:refreshViews:", self->_rightBarButtonItems, 0, 1);
  return self->_customRightViews;
}

- (void)_removeContentInView:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  -[UIView superview](self->_defaultTitleView, "superview");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v8)
    -[UIView removeFromSuperview](self->_defaultTitleView, "removeFromSuperview");
  -[UIView superview](self->_titleView, "superview");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v8)
    -[UIView removeFromSuperview](self->_titleView, "removeFromSuperview");
  -[UIView superview](self->_backButtonView, "superview");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v6 == v8)
  {
    -[UIView removeFromSuperview](self->_backButtonView, "removeFromSuperview");
    v7 = v8;
  }

}

- (BOOL)_hasDefaultTitleView
{
  UIView *titleView;

  titleView = self->_titleView;
  if (titleView)
    return -[UIView isMemberOfClass:](titleView, "isMemberOfClass:", objc_opt_class());
  else
    return 1;
}

- (id)_defaultTitleView
{
  void *v3;
  uint64_t v4;
  _UINavigationItemView *v5;
  UIView *defaultTitleView;

  if (!self->_defaultTitleView)
  {
    -[UINavigationItem title](self, "title");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length");

    if (v4)
    {
      v5 = -[_UINavigationItemView initWithNavigationItem:]([_UINavigationItemView alloc], "initWithNavigationItem:", self);
      defaultTitleView = self->_defaultTitleView;
      self->_defaultTitleView = &v5->super;

    }
  }
  return self->_defaultTitleView;
}

- (id)_titleView
{
  id WeakRetained;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationBar);
  v4 = objc_msgSend(WeakRetained, "_isAlwaysHidden");

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[UINavigationItem titleView](self, "titleView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      -[UINavigationItem _defaultTitleView](self, "_defaultTitleView");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v8;

  }
  return v5;
}

- (id)_firstNonSpaceItemInList:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = a3;
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if ((!objc_msgSend(v7, "isSystemItem", (_QWORD)v9)
           || (unint64_t)(objc_msgSend(v7, "systemItem") - 5) >= 2)
          && (objc_msgSend(v7, "isHidden") & 1) == 0)
        {
          v4 = v7;
          goto LABEL_13;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_13:

  return v4;
}

- (id)_firstNonSpaceLeftItem
{
  return -[UINavigationItem _firstNonSpaceItemInList:](self, "_firstNonSpaceItemInList:", self->_leftBarButtonItems);
}

- (id)_firstNonSpaceRightItem
{
  return -[UINavigationItem _firstNonSpaceItemInList:](self, "_firstNonSpaceItemInList:", self->_rightBarButtonItems);
}

- (void)_setMinimumDesiredHeight:(double)a3 forBarMetrics:(int64_t)a4
{
  NSMutableDictionary *minimumDesiredHeights;
  void *v8;
  double v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  void *v17;
  id WeakRetained;
  id v19;

  minimumDesiredHeights = self->_minimumDesiredHeights;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](minimumDesiredHeights, "objectForKeyedSubscript:", v8);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  v9 = fmax(a3, 0.0);
  v10 = self->_minimumDesiredHeights;
  if (v9 != 0.0)
  {
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v14 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v15 = self->_minimumDesiredHeights;
      self->_minimumDesiredHeights = v14;

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = self->_minimumDesiredHeights;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v13, v17);

    if (!v19 || (objc_msgSend(v19, "isEqual:", v13) & 1) == 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);
      objc_msgSend(WeakRetained, "navigationItemUpdatedCanvasView:", self);

    }
    goto LABEL_10;
  }
  v11 = v19;
  if (v10 && v19)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v10, "removeObjectForKey:", v12);

    v13 = objc_loadWeakRetained((id *)&self->__changeObserver);
    objc_msgSend(v13, "navigationItemUpdatedCanvasView:", self);
LABEL_10:

    v11 = v19;
  }

}

- (double)_desiredHeightForBarMetrics:(int64_t)a3 defaultHeightBlock:(id)a4
{
  double v6;
  NSMutableDictionary *minimumDesiredHeights;
  void *v8;
  void *v9;
  double v10;

  v6 = (*((double (**)(id, int64_t))a4 + 2))(a4, a3);
  minimumDesiredHeights = self->_minimumDesiredHeights;
  if (minimumDesiredHeights)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](minimumDesiredHeights, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "doubleValue");
      if (v6 < v10)
        v6 = v10;

    }
  }
  return v6;
}

- (id)_minimumDesiredHeights
{
  return self->_minimumDesiredHeights;
}

- (int64_t)_independentBarStyle
{
  return 0;
}

- (id)_independentBackgroundImageForBarMetrics:(int64_t)a3
{
  return 0;
}

- (id)_independentShadowImage
{
  return 0;
}

- (double)_fontScaleAdjustment
{
  return self->_fontScaleAdjustment;
}

- (NSString)_pendingTitle
{
  return self->_pendingTitle;
}

- (void)_setPendingTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (UINavigationItemBackButtonDisplayMode)backButtonDisplayMode
{
  return self->_backButtonDisplayMode;
}

- (id)renameDelegate
{
  return objc_loadWeakRetained((id *)&self->_renameDelegate);
}

- (_UINavigationItemChangeObserver)_changeObserver
{
  return (_UINavigationItemChangeObserver *)objc_loadWeakRetained((id *)&self->__changeObserver);
}

- (double)_titleViewWidthForAnimations
{
  return self->__titleViewWidthForAnimations;
}

- (void)set_titleViewWidthForAnimations:(double)a3
{
  self->__titleViewWidthForAnimations = a3;
}

- (double)_idealCustomTitleWidth
{
  return self->__idealCustomTitleWidth;
}

- (void)_setIdealCustomTitleWidth:(double)a3
{
  self->__idealCustomTitleWidth = a3;
}

- (unint64_t)_preferredNavigationBarVisibility
{
  return self->__preferredNavigationBarVisibility;
}

- (unint64_t)_leftFlexibleSpaceCount
{
  return self->__leftFlexibleSpaceCount;
}

- (void)_setLeftFlexibleSpaceCount:(unint64_t)a3
{
  self->__leftFlexibleSpaceCount = a3;
}

- (unint64_t)_rightFlexibleSpaceCount
{
  return self->__rightFlexibleSpaceCount;
}

- (NSArray)_leftItemSpaceList
{
  return self->__leftItemSpaceList;
}

- (void)_setLeftItemSpaceList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (NSArray)_rightItemSpaceList
{
  return self->__rightItemSpaceList;
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong(&self->_context, a3);
}

- (int64_t)tag
{
  return self->_tag;
}

- (void)setTag:(int64_t)a3
{
  self->_tag = a3;
}

- (BOOL)_isNavigationBarHidden
{
  return self->__navigationBarHidden;
}

- (UIView)_canvasView
{
  return self->__canvasView;
}

- (void)_setCanvasView:(id)a3
{
  objc_storeStrong((id *)&self->__canvasView, a3);
}

- (void)setUseRelativeLargeTitleInsets:(BOOL)a3
{
  self->_useRelativeLargeTitleInsets = a3;
}

@end
