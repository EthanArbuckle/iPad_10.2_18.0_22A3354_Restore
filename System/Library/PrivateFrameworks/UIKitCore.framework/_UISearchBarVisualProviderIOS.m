@implementation _UISearchBarVisualProviderIOS

- (BOOL)isHostedInlineByNavigationBar
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 3) >> 3) & 1;
}

- (double)defaultHeightForOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  int64_t layoutState;
  uint64_t v9;
  void *v10;
  void *v11;
  _UISearchBarLayout *v12;
  double v13;
  double v14;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "_expectedInterfaceOrientation");
    layoutState = self->_layoutState;
    -[_UISearchBarVisualProviderIOS transitioner](self, "transitioner");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v7 == a3)
    {
      if (v9)
      {
        -[_UISearchBarVisualProviderIOS transitioner](self, "transitioner");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "activeLayout");
        v12 = (_UISearchBarLayout *)objc_claimAutoreleasedReturnValue();

        layoutState = -[_UISearchBarLayout representedLayoutState](v12, "representedLayoutState");
      }
      else
      {
        v12 = self->_currentLayout;
      }
      -[_UISearchBarVisualProviderIOS configureLayout:forState:](self, "configureLayout:forState:", v12, layoutState);
    }
    else
    {
      v12 = self->_prospectiveLayout;
      -[_UISearchBarLayout setRepresentedLayoutState:](self->_prospectiveLayout, "setRepresentedLayoutState:", layoutState);
      -[_UISearchBarVisualProviderIOS configureLayout:forState:](self, "configureLayout:forState:", v12, layoutState);
      -[_UISearchBarLayoutBase setBarMetrics:](v12, "setBarMetrics:", -[_UISearchBarVisualProviderIOS barMetricsForOrientation:](self, "barMetricsForOrientation:", a3));
    }
    -[_UISearchBarLayout naturalTotalHeight](v12, "naturalTotalHeight");
    v13 = v14;

  }
  else
  {
    v13 = 0.0;
  }

  return v13;
}

- (_UISearchBarTransitionerBase)transitioner
{
  return self->_transitioner;
}

- (void)invalidateLayout
{
  -[_UISearchBarLayoutBase invalidateLayout](self->_currentLayout, "invalidateLayout");
}

- (void)layoutBackgroundViewConsideringTopBarStatusAndChangedHeight:(BOOL)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  double v22;
  id v23;
  CGRect v24;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    *(_QWORD *)&self->_searchBarVisualProviderFlags &= ~0x8000uLL;
    v23 = v5;
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(v23, "window");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      if (self->_barPosition == 3 || -[_UISearchBarVisualProviderIOS isAtTop](self, "isAtTop"))
      {
        __UIStatusBarManagerForWindow(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "statusBarHeight");
        v17 = v16;

        v9 = v9 - v17;
        v13 = v13 + v17;
      }
    }
    else
    {
      *(_QWORD *)&self->_searchBarVisualProviderFlags |= 0x8000uLL;
    }
    -[UIView frame](self->_searchBarBackground, "frame");
    if (a3
      || (v24.origin.x = v7,
          v24.origin.y = v9,
          v24.size.width = v11,
          v24.size.height = v13,
          !CGRectEqualToRect(*(CGRect *)&v18, v24)))
    {
      if (-[_UISearchBarVisualProviderIOS scopeBarIsVisible](self, "scopeBarIsVisible"))
      {
        -[_UISearchBarVisualProviderIOS scopeBarHeight](self, "scopeBarHeight");
        v13 = v13 - v22;
      }
      -[UISearchBarBackground setFrame:](self->_searchBarBackground, "setFrame:", v7, v9, v11, v13);
    }

    v5 = v23;
  }

}

- (void)updateNavigationBarLayoutInsertDataForSearchBar:(id)a3 collapsibleScopeBar:(id)a4 forLayoutState:(int64_t)a5
{
  double *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _BOOL4 v16;
  double v17;
  double *v18;

  v18 = (double *)a3;
  v8 = (double *)a4;
  -[_UISearchBarVisualProviderIOS configureLayout:forState:](self, "configureLayout:forState:", self->_prospectiveLayout, a5);
  -[_UISearchBarLayout naturalTotalHeight](self->_prospectiveLayout, "naturalTotalHeight");
  v10 = v9;
  -[_UISearchBarLayout naturalScopeContainerHeight](self->_prospectiveLayout, "naturalScopeContainerHeight");
  v12 = v11;
  if ((*((_BYTE *)&self->_searchBarVisualProviderFlags + 3) & 8) != 0)
  {
    if (v18)
    {
      v18[4] = 0.0;
      v18[5] = 0.0;
    }
    v16 = -[_UISearchBarLayout hasScopeBar](self->_prospectiveLayout, "hasScopeBar");
    if (v8)
    {
      v17 = 0.0;
      if (v16)
        v17 = v12;
      v8[4] = v17;
      v8[5] = v17;
      goto LABEL_20;
    }
  }
  else
  {
    if (-[_UISearchBarLayout hasScopeBar](self->_prospectiveLayout, "hasScopeBar"))
    {
      if (v18)
      {
        v18[4] = v10 - v12;
        v18[5] = v10 - v12;
      }
      if (v8)
      {
        v8[4] = v12;
        v8[5] = v12;
      }
      -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "traitCollection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "verticalSizeClass");
      if (v8)
        *((_BYTE *)v8 + 8) = (v15 == 1) | (2 * (v15 == 1)) | (_BYTE)v8[1] & 0xFC;

      goto LABEL_21;
    }
    if (v18)
    {
      v18[4] = v10;
      v18[5] = v10;
    }
    if (v8)
    {
      v8[4] = 0.0;
      v8[5] = 0.0;
LABEL_20:
      *((_BYTE *)v8 + 8) &= ~1u;
    }
  }
LABEL_21:

}

- (void)configureLayout:(id)a3 forState:(int64_t)a4
{
  id v6;
  unsigned int *v7;
  int has_internal_diagnostics;
  void *v9;
  BOOL v10;
  int v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  _BOOL4 v23;
  int v24;
  NSUInteger v25;
  _BOOL8 v26;
  uint64_t v27;
  void *backdropVisualEffectView;
  id WeakRetained;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  _BOOL4 v36;
  double leftInsetForInlineSearch;
  double rightInsetForInlineSearch;
  double v39;
  double v40;
  void *v41;
  BOOL v42;
  NSObject *v43;
  unint64_t v44;
  NSObject *v45;
  const __CFString *v46;
  NSObject *v47;
  const __CFString *v48;
  uint64_t v49;
  uint64_t v50;
  double (*v51)(uint64_t, uint64_t);
  void *v52;
  id v53;
  _QWORD v54[4];
  id v55;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v7 = (unsigned int *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_61;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  objc_msgSend(v7, "_searchController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
    v10 = v9 == 0;
  else
    v10 = 0;
  v11 = v10;

  if (has_internal_diagnostics)
  {
    if (v11)
    {
      __UIFaultDebugAssertLog();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
      {
        if ((unint64_t)(a4 + 1) > 4)
          v48 = CFSTR("Unknown _UISearchBarLayoutState");
        else
          v48 = off_1E16B71A0[a4 + 1];
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = (id)v48;
        _os_log_fault_impl(&dword_185066000, v43, OS_LOG_TYPE_FAULT, "When there is no search controller, configuring for %@ may result in broken search bar layout. This is an internal UIKit problem.", (uint8_t *)location, 0xCu);
      }

    }
  }
  else if (v11)
  {
    v44 = configureLayout_forState____s_category;
    if (!configureLayout_forState____s_category)
    {
      v44 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v44, (unint64_t *)&configureLayout_forState____s_category);
    }
    v45 = *(NSObject **)(v44 + 8);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      if ((unint64_t)(a4 + 1) > 4)
        v46 = CFSTR("Unknown _UISearchBarLayoutState");
      else
        v46 = off_1E16B71A0[a4 + 1];
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = (id)v46;
      v47 = v45;
      _os_log_impl(&dword_185066000, v47, OS_LOG_TYPE_ERROR, "When there is no search controller, configuring for %@ may result in broken search bar layout. This is an internal UIKit problem.", (uint8_t *)location, 0xCu);

    }
  }
  objc_msgSend(v6, "setHostedInlineByNavigationBar:", (*(_QWORD *)&self->_searchBarVisualProviderFlags >> 27) & 1);
  objc_msgSend(v6, "setRepresentedLayoutState:", a4);
  objc_msgSend(v6, "setBarMetrics:", -[_UISearchBarVisualProviderIOS barMetricsForOrientation:](self, "barMetricsForOrientation:", objc_msgSend(v7, "_expectedInterfaceOrientation")));
  -[_UISearchBarVisualProviderIOS recalculatedEffectiveContentInsetForLayoutState:](self, "recalculatedEffectiveContentInsetForLayoutState:", a4);
  objc_msgSend(v6, "setContentInset:");
  objc_msgSend(v6, "setSearchFieldContainer:", self->_searchFieldContainerView);
  -[_UISearchBarVisualProviderIOS searchField](self, "searchField");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSearchField:", v12);

  objc_msgSend(v6, "setSearchIconBarButtonItem:", self->_searchIconBarButtonItem);
  -[_UISearchBarVisualProviderIOS defaultActiveSearchFieldWidth](self, "defaultActiveSearchFieldWidth");
  objc_msgSend(v6, "setDefaultActiveWidth:");
  -[_UISearchBarVisualProviderIOS defaultInactiveSearchFieldWidth](self, "defaultInactiveSearchFieldWidth");
  objc_msgSend(v6, "setDefaultInactiveWidth:");
  -[_UISearchBarVisualProviderBase overrideInlineInactiveWidth](self, "overrideInlineInactiveWidth");
  objc_msgSend(v6, "setOverrideInactiveWidth:");
  -[_UISearchBarVisualProviderBase overrideInlineActiveWidth](self, "overrideInlineActiveWidth");
  objc_msgSend(v6, "setOverrideActiveWidth:");
  if (a4 == 1)
  {
    if (objc_msgSend(v6, "isProspective"))
      -[_UISearchBarVisualProviderIOS floatingSearchIconViewSuitableForMeasuring](self, "floatingSearchIconViewSuitableForMeasuring");
    else
      -[_UISearchBarVisualProviderIOS floatingSearchIconView](self, "floatingSearchIconView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFloatingSearchIconView:", v14);

    -[_UISearchBarVisualProviderIOS floatingSearchIconBackgroundView](self, "floatingSearchIconBackgroundView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHasFloatingSearchIconBackgroundView:", v15 != 0);

    -[_UISearchBarVisualProviderIOS floatingSearchIconBackgroundView](self, "floatingSearchIconBackgroundView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFloatingSearchIconBackgroundView:", v16);

  }
  else
  {
    objc_msgSend(v6, "setFloatingSearchIconView:", self->_floatingSearchIconView);
    if (!a4)
    {
      v13 = 1;
      goto LABEL_19;
    }
  }
  objc_msgSend(v7, "_searchController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "automaticallyShowsCancelButton");

  v13 = 0;
  if ((v18 & 1) != 0)
  {
    v19 = (unint64_t)(a4 - 3) < 0xFFFFFFFFFFFFFFFELL;
    goto LABEL_20;
  }
LABEL_19:
  v19 = (*(_DWORD *)&self->_searchBarVisualProviderFlags >> 18) & 1;
LABEL_20:
  objc_msgSend(v6, "setHasCancelButton:", v19);
  if ((*((_BYTE *)&self->_searchBarVisualProviderFlags + 2) & 0x10) != 0)
  {
    objc_msgSend(v6, "setHasDeleteButton:", 1);
    objc_msgSend(v6, "setHasCancelButton:", 0);
    objc_msgSend(v6, "setCancelButton:", 0);
    objc_msgSend(v6, "setDeleteButton:", self->_cancelButton);
  }
  else
  {
    objc_msgSend(v6, "setHasDeleteButton:", 0);
    objc_msgSend(v6, "setDeleteButton:", 0);
    objc_msgSend(v6, "setCancelButton:", self->_cancelButton);
  }
  objc_msgSend(v6, "setHasLeftButton:", self->_leftButton != 0);
  objc_msgSend(v6, "setLeftButton:", self->_leftButton);
  if ((v13 & 1) != 0)
  {
    if (!-[_UISearchBarVisualProviderIOS isTextFieldManagedInNSToolbar](self, "isTextFieldManagedInNSToolbar"))
      goto LABEL_34;
LABEL_32:
    v23 = 0;
    goto LABEL_36;
  }
  objc_msgSend(v7, "_searchController");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v20)
  {
    v22 = ((unint64_t)*(unsigned int *)(v20 + 1044) >> 5) & 3;
    if (!(_DWORD)v22)
    {
      if (dyld_program_sdk_at_least())
        v22 = 2;
      else
        v22 = 3;
    }
  }
  else
  {
    v22 = 0;
  }

  if (-[_UISearchBarVisualProviderIOS isTextFieldManagedInNSToolbar](self, "isTextFieldManagedInNSToolbar"))
    goto LABEL_32;
  if (v22 != 1)
  {
    v24 = a4 != 2 && (*((_BYTE *)&self->_searchBarVisualProviderFlags + 3) & 0x80) == 0;
    goto LABEL_35;
  }
LABEL_34:
  v24 = (*(_DWORD *)&self->_searchBarVisualProviderFlags >> 30) & 1;
LABEL_35:
  v23 = v24 != 0;
LABEL_36:
  v25 = -[NSArray count](self->_scopeTitles, "count");
  if (v25)
    v26 = v23;
  else
    v26 = 0;
  objc_msgSend(v6, "setHasScopeBar:", v26);
  objc_msgSend(v6, "setNumberOfScopeTitles:", v25);
  -[_UISearchBarVisualProviderIOS defaultScopeBarInsets](self, "defaultScopeBarInsets");
  objc_msgSend(v6, "setDefaultScopeBarInsets:");
  objc_initWeak(location, self);
  v27 = MEMORY[0x1E0C809B0];
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __58___UISearchBarVisualProviderIOS_configureLayout_forState___block_invoke;
  v54[3] = &unk_1E16B7180;
  objc_copyWeak(&v55, location);
  objc_msgSend(v6, "setHostedScopeBarHeightForBarMetrics:", v54);
  v49 = v27;
  v50 = 3221225472;
  v51 = __58___UISearchBarVisualProviderIOS_configureLayout_forState___block_invoke_2;
  v52 = &unk_1E16B7180;
  objc_copyWeak(&v53, location);
  objc_msgSend(v6, "setHostedScopeBarTopInsetForBarMetrics:", &v49);
  objc_msgSend(v6, "setScopeBarContainer:", self->_scopeBarContainerView, v49, v50, v51, v52);
  objc_msgSend(v6, "setScopeBar:", self->_scopeBar);
  objc_msgSend(v6, "setHasSearchBarBackground:", self->_searchBarBackground != 0);
  -[_UISearchBarVisualProviderIOS effectiveBackgroundExtension](self, "effectiveBackgroundExtension");
  objc_msgSend(v6, "setBackgroundExtension:");
  objc_msgSend(v6, "setSearchBarBackground:", self->_searchBarBackground);
  objc_msgSend(v6, "setHasSearchBarBackdrop:", -[_UISearchBarVisualProviderIOS usesBackdrop](self, "usesBackdrop"));
  backdropVisualEffectView = self->_backdropVisualEffectView;
  if (!backdropVisualEffectView)
    backdropVisualEffectView = self->_backdrop;
  objc_msgSend(v6, "setSearchBarBackdrop:", backdropVisualEffectView);
  objc_msgSend(v6, "setHasSeparator:", self->_separator != 0);
  objc_msgSend(v6, "setSeparator:", self->_separator);
  WeakRetained = objc_loadWeakRetained((id *)&self->_navBarTitleViewDataSource);
  if (WeakRetained || (*((_BYTE *)&self->_searchBarVisualProviderFlags + 3) & 5) != 0)
  {

  }
  else
  {
    -[_UISearchBarVisualProviderIOS prompt](self, "prompt");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "length") == 0;

    if (!v42)
    {
      objc_msgSend(v6, "setHasPromptLabel:", 1);
      -[_UISearchBarVisualProviderIOS setUpPromptLabel](self, "setUpPromptLabel");
      objc_msgSend(v6, "setPromptContainer:", self->_promptContainerView);
      objc_msgSend(v7, "addSubview:", self->_promptContainerView);
      goto LABEL_45;
    }
  }
  objc_msgSend(v6, "setHasPromptLabel:", 0);
  objc_msgSend(v6, "setPromptContainer:", 0);
  -[UIView removeFromSuperview](self->_promptContainerView, "removeFromSuperview");
LABEL_45:
  if (a4 == 3)
    v30 = 0;
  else
    v30 = (*(_QWORD *)&self->_searchBarVisualProviderFlags >> 26) & 1;
  objc_msgSend(v6, "setAllowSearchFieldShrinkage:", v30);
  -[_UISearchBarAppearanceStorage searchFieldBackgroundImageForState:](self->_appearanceStorage, "searchFieldBackgroundImageForState:", 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSearchFieldUsesCustomBackgroundImage:", v31 != 0);

  objc_msgSend(v6, "setSearchFieldEffectivelySupportsDynamicType:", objc_msgSend(v7, "_effectivelySupportsDynamicType"));
  -[UITextField font](self->_searchField, "font");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSearchFieldFont:", v32);

  objc_msgSend(v6, "setLayoutRTL:", ((unint64_t)v7[30] >> 19) & 1);
  if (-[_UISearchBarVisualProviderIOS isInBarButNotHosted](self, "isInBarButNotHosted"))
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "userInterfaceIdiom");

    if ((v34 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      goto LABEL_51;
  }
  objc_msgSend(v7, "traitCollection");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "userInterfaceIdiom") == 6;

  if (v36)
LABEL_51:
    objc_msgSend(v6, "setHasCancelButton:", 0);
  objc_msgSend(v6, "setHostedByNavigationBar:", (*(_QWORD *)&self->_searchBarVisualProviderFlags >> 26) & 1);
  objc_msgSend(v6, "setTextFieldManagedInNSToolbar:", (*(_QWORD *)&self->_searchBarVisualProviderFlags >> 28) & 1);
  objc_msgSend(v6, "setSearchBarReadableWidth:", _UIViewReadableWidthForView(v7));
  leftInsetForInlineSearch = 0.0;
  if (self->_layoutState == 1)
  {
    rightInsetForInlineSearch = 0.0;
  }
  else
  {
    rightInsetForInlineSearch = 0.0;
    if ((*((_BYTE *)&self->_searchBarVisualProviderFlags + 3) & 8) != 0)
    {
      leftInsetForInlineSearch = self->_leftInsetForInlineSearch;
      rightInsetForInlineSearch = self->_rightInsetForInlineSearch;
    }
  }
  objc_msgSend(v6, "leftContentInsetForInlineSearch");
  if (v39 != leftInsetForInlineSearch
    || (objc_msgSend(v6, "rightContentInsetForInlineSearch"), v40 != rightInsetForInlineSearch))
  {
    objc_msgSend(v6, "setLeftContentInsetForInlineSearch:", leftInsetForInlineSearch);
    objc_msgSend(v6, "setRightContentInsetForInlineSearch:", rightInsetForInlineSearch);
    if ((objc_msgSend(v6, "isProspective") & 1) == 0)
    {
      objc_msgSend(v7, "setNeedsLayout");
      -[_UISearchBarSearchContainerView setNeedsLayout](self->_searchFieldContainerView, "setNeedsLayout");
    }
  }
  objc_destroyWeak(&v53);
  objc_destroyWeak(&v55);
  objc_destroyWeak(location);
LABEL_61:

}

- (id)searchField
{
  UISearchBarTextField *searchField;

  searchField = self->_searchField;
  if (!searchField)
  {
    -[_UISearchBarVisualProviderIOS setUpSearchField](self, "setUpSearchField");
    searchField = self->_searchField;
  }
  return searchField;
}

- (UIEdgeInsets)recalculatedEffectiveContentInsetForLayoutState:(int64_t)a3 forcingInlineCalculation:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  uint64_t v9;
  $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags;
  double v11;
  double v12;
  double v13;
  double tableViewIndexWidth;
  double v15;
  double v16;
  double right;
  double bottom;
  double left;
  double top;
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
  double v34;
  unint64_t overriddenContentInsetEdges;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  UIEdgeInsets result;

  v4 = a4;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    right = 0.0;
    bottom = 0.0;
    left = 0.0;
    top = 0.0;
    goto LABEL_45;
  }
  v42 = 0.0;
  v43 = 0.0;
  v9 = objc_msgSend(v7, "effectiveUserInterfaceLayoutDirection");
  if (!-[_UISearchBarVisualProviderIOS _getNavigationTitleLeadingInset:trailingInset:isRTL:](self, "_getNavigationTitleLeadingInset:trailingInset:isRTL:", &v43, &v42, v9 == 1))
  {
    searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x3000000) == 0)
    {
      if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x4000000) != 0)
      {
        objc_msgSend(v8, "_searchController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "_navigationItemCurrentlyDisplayingSearchController");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "_navigationBar");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
          objc_msgSend(v23, "_resolvedSearchBarMargins");
        else
          objc_msgSend(v8, "directionalLayoutMargins");
        v42 = v25;
        v43 = v24;

      }
      else
      {
        if (-[_UISearchBarVisualProviderIOS alwaysUsesLayoutMarginsForHorizontalContentInset](self, "alwaysUsesLayoutMarginsForHorizontalContentInset"))
        {
          objc_msgSend(v8, "directionalLayoutMargins");
          v12 = v11;
          v43 = v13;
          tableViewIndexWidth = self->_tableViewIndexWidth;
          -[_UISearchBarVisualProviderIOS minimumHorizontalMargin](self, "minimumHorizontalMargin");
          v16 = tableViewIndexWidth + v15;
          if (v12 >= v16)
            v16 = v12;
        }
        else
        {
          v26 = self->_tableViewIndexWidth;
          if (v26 <= 0.0)
          {
            objc_msgSend(v8, "safeAreaInsets");
            if (v9 == 1)
              v30 = v29;
            else
              v30 = v28;
            v43 = v30;
            if (v9 == 1)
              v16 = v28;
            else
              v16 = v29;
          }
          else
          {
            -[_UISearchBarVisualProviderIOS minimumHorizontalMargin](self, "minimumHorizontalMargin");
            v16 = v26 + v27;
          }
        }
        v42 = v16;
      }
      v31 = v43;
      -[_UISearchBarVisualProviderIOS minimumHorizontalMargin](self, "minimumHorizontalMargin");
      if (v31 >= v32)
        v32 = v31;
      v43 = v32;
      v33 = v42;
      -[_UISearchBarVisualProviderIOS minimumHorizontalMargin](self, "minimumHorizontalMargin");
      if (v33 >= v34)
        v34 = v33;
      v42 = v34;
    }
  }
  v41 = 0.0;
  -[_UISearchBarVisualProviderIOS getTopInset:bottomInset:forBarMetrics:barPosition:layoutState:forcingInlineCalculation:](self, "getTopInset:bottomInset:forBarMetrics:barPosition:layoutState:forcingInlineCalculation:", &v41, &v40, -[_UISearchBarVisualProviderIOS barMetricsForOrientation:](self, "barMetricsForOrientation:", objc_msgSend(v8, "_expectedInterfaceOrientation", 0)), self->_barPosition, a3, v4);
  top = v41;
  if (v9 == 1)
    left = v42;
  else
    left = v43;
  bottom = v40;
  if (v9 == 1)
    right = v43;
  else
    right = v42;
  overriddenContentInsetEdges = self->_overriddenContentInsetEdges;
  if (!overriddenContentInsetEdges)
  {
    top = fmax(v41, self->_contentInsetPrivateMinOrOverride.top);
    left = fmax(left, self->_contentInsetPrivateMinOrOverride.left);
    bottom = fmax(v40, self->_contentInsetPrivateMinOrOverride.bottom);
    right = fmax(right, self->_contentInsetPrivateMinOrOverride.right);
    goto LABEL_45;
  }
  if ((overriddenContentInsetEdges & 1) == 0)
  {
    if ((overriddenContentInsetEdges & 2) == 0)
      goto LABEL_37;
LABEL_42:
    left = self->_contentInsetPrivateMinOrOverride.left;
    if ((overriddenContentInsetEdges & 4) == 0)
    {
LABEL_38:
      if ((overriddenContentInsetEdges & 8) == 0)
        goto LABEL_45;
      goto LABEL_44;
    }
    goto LABEL_43;
  }
  top = self->_contentInsetPrivateMinOrOverride.top;
  if ((overriddenContentInsetEdges & 2) != 0)
    goto LABEL_42;
LABEL_37:
  if ((overriddenContentInsetEdges & 4) == 0)
    goto LABEL_38;
LABEL_43:
  bottom = self->_contentInsetPrivateMinOrOverride.bottom;
  if ((overriddenContentInsetEdges & 8) != 0)
LABEL_44:
    right = self->_contentInsetPrivateMinOrOverride.right;
LABEL_45:

  v36 = top;
  v37 = left;
  v38 = bottom;
  v39 = right;
  result.right = v39;
  result.bottom = v38;
  result.left = v37;
  result.top = v36;
  return result;
}

- (double)minimumHorizontalMargin
{
  return 8.0;
}

- (int64_t)barMetricsForOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int64_t v9;
  void *v10;
  uint64_t v11;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v9 = 0;
    goto LABEL_14;
  }
  -[UILabel text](self->_promptLabel, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if ((unint64_t)(a3 - 1) <= 1 || (*((_BYTE *)&self->_searchBarVisualProviderFlags + 3) & 1) == 0)
    goto LABEL_11;
  objc_msgSend(v5, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "userInterfaceIdiom") == 1)
  {

    goto LABEL_11;
  }
  objc_msgSend(v5, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "horizontalSizeClass");

  if (v11 != 1)
  {
LABEL_11:
    if (v7)
      v9 = 101;
    else
      v9 = 0;
    goto LABEL_14;
  }
  if (v7)
    v9 = 102;
  else
    v9 = 1;
LABEL_14:

  return v9;
}

- (void)getTopInset:(double *)a3 bottomInset:(double *)a4 forBarMetrics:(int64_t)a5 barPosition:(int64_t)a6 layoutState:(int64_t)a7 forcingInlineCalculation:(BOOL)a8
{
  _BOOL4 v8;
  void *v15;
  _BOOL8 v17;
  $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags;
  double v19;
  double v20;
  void *v21;
  _UISearchBarLayout *v22;
  _UISearchBarLayout *currentLayout;
  _UISearchBarLayout *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  id v31;

  v8 = a8;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v17 = a5 == 1 || a5 == 102;
    searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    v31 = v15;
    if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x8000000) != 0 || v8)
    {
      -[_UISearchBarVisualProviderIOS allowedHeightInNavigationContentView](self, "allowedHeightInNavigationContentView");
      v20 = v19;
      -[_UISearchBarVisualProviderIOS transitioner](self, "transitioner");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "activeLayout");
      v22 = (_UISearchBarLayout *)objc_claimAutoreleasedReturnValue();
      currentLayout = v22;
      if (!v22)
        currentLayout = self->_currentLayout;
      v24 = currentLayout;

      -[_UISearchBarLayout naturalSearchFieldHeight](v24, "naturalSearchFieldHeight");
      v26 = v25;

      UIFloorToViewScale(v31);
      v15 = v31;
      v28 = fmax(v27, 0.0);
      *a3 = v28;
      *a4 = fmax(v20 - v28 - v26, 0.0);
    }
    else
    {
      if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x4000000) != 0)
      {
        if (a7 == 3)
        {
          objc_msgSend(v15, "_searchController");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "hidesNavigationBarDuringPresentation");

        }
        else
        {
          v30 = 0;
        }
        -[_UISearchBarVisualProviderIOS getNavigationBarHostedTopInset:bottomInset:forActive:isCompact:](self, "getNavigationBarHostedTopInset:bottomInset:forActive:isCompact:", a3, a4, v30, v17);
      }
      else if (a6 == 3)
      {
        -[_UISearchBarVisualProviderIOS getTopAttachedTopInset:bottomInset:isCompact:](self, "getTopAttachedTopInset:bottomInset:isCompact:", a3, a4, v17);
      }
      else
      {
        -[_UISearchBarVisualProviderIOS getDefaultTopInset:bottomInset:](self, "getDefaultTopInset:bottomInset:", a3, a4);
      }
      v15 = v31;
    }
  }

}

- (BOOL)_getNavigationTitleLeadingInset:(double *)a3 trailingInset:(double *)a4 isRTL:(BOOL)a5
{
  _BOOL4 v5;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  double (**v23)(_QWORD, double, double, double, double);
  double (**v24)(_QWORD, double, double, double, double);
  double v25;
  double x;
  double v27;
  double y;
  double v29;
  double width;
  double v31;
  double height;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  double v42;
  BOOL v43;
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
  double v55;
  double v56;
  double v57;
  _QWORD v58[8];
  BOOL v59;
  _QWORD aBlock[8];
  BOOL v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;

  v5 = a5;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && self->_navBarTitleViewLocation && self->_navBarTitleViewOverlayRects)
  {
    objc_msgSend(v9, "bounds");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    objc_msgSend(v10, "_contentMargin");
    v57 = v19;
    objc_msgSend(v10, "safeAreaInsets");
    v55 = v21;
    v56 = v20;
    v22 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __85___UISearchBarVisualProviderIOS__getNavigationTitleLeadingInset_trailingInset_isRTL___block_invoke;
    aBlock[3] = &__block_descriptor_65_e39_d40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
    v61 = v5;
    aBlock[4] = v12;
    aBlock[5] = v14;
    aBlock[6] = v16;
    aBlock[7] = v18;
    v23 = (double (**)(_QWORD, double, double, double, double))_Block_copy(aBlock);
    v58[0] = v22;
    v58[1] = 3221225472;
    v58[2] = __85___UISearchBarVisualProviderIOS__getNavigationTitleLeadingInset_trailingInset_isRTL___block_invoke_2;
    v58[3] = &__block_descriptor_65_e39_d40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
    v59 = v5;
    v58[4] = v12;
    v58[5] = v14;
    v58[6] = v16;
    v58[7] = v18;
    v24 = (double (**)(_QWORD, double, double, double, double))_Block_copy(v58);
    -[_UINavigationBarTitleViewOverlayRects backButtonRect](self->_navBarTitleViewOverlayRects, "backButtonRect");
    x = v25;
    y = v27;
    width = v29;
    height = v31;
    -[_UINavigationBarTitleViewOverlayRects leadingItemsRect](self->_navBarTitleViewOverlayRects, "leadingItemsRect");
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v40 = v39;
    v62.origin.x = x;
    v62.origin.y = y;
    v62.size.width = width;
    v62.size.height = height;
    if (CGRectIsNull(v62)
      && (v63.origin.x = v34, v63.origin.y = v36, v63.size.width = v38, v63.size.height = v40, CGRectIsNull(v63)))
    {
      v41 = v56;
      if (v5)
        v41 = v55;
      v42 = v57 + v41;
    }
    else
    {
      v64.origin.x = v34;
      v64.origin.y = v36;
      v64.size.width = v38;
      v64.size.height = v40;
      if (!CGRectIsNull(v64))
      {
        v65.origin.x = x;
        v65.origin.y = y;
        v65.size.width = width;
        v65.size.height = height;
        if (CGRectIsNull(v65))
        {
          x = v34;
          y = v36;
          width = v38;
          height = v40;
        }
        else
        {
          v66.origin.x = v34;
          v66.origin.y = v36;
          v66.size.width = v38;
          v66.size.height = v40;
          v69.origin.x = x;
          v69.origin.y = y;
          v69.size.width = width;
          v69.size.height = height;
          v67 = CGRectUnion(v66, v69);
          x = v67.origin.x;
          y = v67.origin.y;
          width = v67.size.width;
          height = v67.size.height;
        }
      }
      v44 = v23[2](v23, x, y, width, height);
      -[_UISearchBarVisualProviderIOS minimumHorizontalMargin](self, "minimumHorizontalMargin");
      v42 = v44 + v45;
    }
    *a3 = v42;
    -[_UINavigationBarTitleViewOverlayRects trailingItemsRect](self->_navBarTitleViewOverlayRects, "trailingItemsRect");
    v46 = v68.origin.x;
    v47 = v68.origin.y;
    v48 = v68.size.width;
    v49 = v68.size.height;
    if (CGRectIsNull(v68))
    {
      v50 = v56;
      if (!v5)
        v50 = v55;
      v51 = v57 + v50;
    }
    else
    {
      v52 = v24[2](v24, v46, v47, v48, v49);
      -[_UISearchBarVisualProviderIOS minimumHorizontalMargin](self, "minimumHorizontalMargin");
      v51 = v52 + v53;
    }
    *a4 = v51;

    v43 = 1;
  }
  else
  {
    v43 = 0;
  }

  return v43;
}

- (UIEdgeInsets)recalculatedEffectiveContentInsetForLayoutState:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  -[_UISearchBarVisualProviderIOS recalculatedEffectiveContentInsetForLayoutState:forcingInlineCalculation:](self, "recalculatedEffectiveContentInsetForLayoutState:forcingInlineCalculation:", a3, 0);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)getNavigationBarHostedTopInset:(double *)a3 bottomInset:(double *)a4 forActive:(BOOL)a5 isCompact:(BOOL)a6
{
  _BOOL4 v6;
  BOOL v9;
  double v10;
  double v11;
  double v12;
  int v13;
  double v14;

  v6 = a5;
  if (a6)
  {
    v9 = !a5;
    v10 = 0.0;
    v11 = 4.0;
    if (a5)
      v10 = 4.0;
    *a3 = v10;
    v12 = 8.0;
  }
  else
  {
    v13 = _UIBarsUseNewPadHeights();
    v9 = !v6;
    v14 = 1.0;
    if (v13)
      v11 = 7.0;
    else
      v11 = 8.0;
    if (v6)
      v14 = v11;
    *a3 = v14;
    v12 = 15.0;
  }
  if (!v9)
    v12 = v11;
  *a4 = v12;
}

- (BOOL)usesBackdrop
{
  void *v3;
  BOOL v4;

  -[UISearchBarBackground backgroundImage](self->_searchBarBackground, "backgroundImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = 0;
  else
    v4 = (*(_QWORD *)&self->_searchBarVisualProviderFlags & 0x38) == 0x10
      && (*(_QWORD *)&self->_searchBarVisualProviderFlags & 0x2000) == 0;

  return v4;
}

- (BOOL)isInBarButNotHosted
{
  _BOOL8 v3;
  $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags;

  if (-[_UISearchBarVisualProviderIOS isHostedByNavigationBar](self, "isHostedByNavigationBar"))
  {
    LOBYTE(v3) = 0;
  }
  else if (self->_navBarTitleViewLocation
         || (searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags,
             (*(_DWORD *)&searchBarVisualProviderFlags & 0x1000000) != 0))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    return (*(unint64_t *)&searchBarVisualProviderFlags >> 25) & 1;
  }
  return v3;
}

- (BOOL)isHostedByNavigationBar
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 3) >> 2) & 1;
}

- (BOOL)isTextFieldManagedInNSToolbar
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 3) >> 4) & 1;
}

- (double)effectiveBackgroundExtension
{
  double backgroundExtension;
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  double v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _DWORD *v16;
  void *v17;
  double v18;
  unint64_t v20;
  NSObject *v21;
  __CFString *v22;
  const __CFString *v23;
  double v24;
  const __CFString *v25;
  uint8_t buf[4];
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  backgroundExtension = self->_backgroundExtension;
  if (backgroundExtension == 0.0)
  {
    -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "barPosition") != 3)
    {
LABEL_16:

      return backgroundExtension;
    }
    objc_msgSend(v3, "window");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v4)
      goto LABEL_15;
    objc_msgSend(v3, "_searchController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5
      || (objc_msgSend(v3, "superview"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "safeAreaInsets"),
          backgroundExtension = v7,
          v6,
          backgroundExtension != 0.0))
    {
LABEL_15:

      goto LABEL_16;
    }
    v8 = -[__CFString _isHostedInAnotherProcess](v4, "_isHostedInAnotherProcess");
    -[__CFString rootViewController](v4, "rootViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      objc_msgSend(v9, "presentedViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        v13 = v11;
      }
      else
      {
        -[__CFString rootViewController](v4, "rootViewController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "childViewControllers");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "firstObject");
        v13 = (id)objc_claimAutoreleasedReturnValue();

      }
      v10 = v13;
    }
    objc_msgSend(v10, "_viewControllerForRotation");
    v16 = (_DWORD *)objc_claimAutoreleasedReturnValue();

    if (v16 && ((v16[92] >> 1) & 3u) - 1 < 2)
    {
      objc_msgSend(v16, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "safeAreaInsets");
      backgroundExtension = v18;

LABEL_14:
      goto LABEL_15;
    }
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        goto LABEL_28;
      if (v16)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("; viewController is not appearing or appeared: %@"),
          v16);
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v25 = v22;
      }
      else
      {
        objc_msgSend(v3, "superview");
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v25 = &stru_1E16EDF20;
        if (v22 == v4)
          v25 = CFSTR(". Don't make the search bar a direct subview of the window.");
      }
      *(_DWORD *)buf = 138412290;
      v27 = v25;
      _os_log_fault_impl(&dword_185066000, v21, OS_LOG_TYPE_FAULT, "Failed to find view controller source of information for search bar's background extension%@", buf, 0xCu);
    }
    else
    {
      v20 = effectiveBackgroundExtension___s_category;
      if (!effectiveBackgroundExtension___s_category)
      {
        v20 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v20, (unint64_t *)&effectiveBackgroundExtension___s_category);
      }
      v21 = *(id *)(v20 + 8);
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        goto LABEL_28;
      if (v16)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("; viewController is not appearing or appeared: %@"),
          v16);
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
      }
      else
      {
        objc_msgSend(v3, "superview");
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v23 = &stru_1E16EDF20;
        if (v22 == v4)
          v23 = CFSTR(". Don't make the search bar a direct subview of the window.");
      }
      *(_DWORD *)buf = 138412290;
      v27 = v23;
      _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_ERROR, "Failed to find view controller source of information for search bar's background extension%@", buf, 0xCu);
    }

LABEL_28:
    -[__CFString safeAreaInsets](v4, "safeAreaInsets");
    backgroundExtension = v24;
    goto LABEL_14;
  }
  return backgroundExtension;
}

- (UIEdgeInsets)defaultScopeBarInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 7.0;
  v3 = 8.0;
  v4 = 8.0;
  v5 = 8.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)defaultInactiveSearchFieldWidth
{
  return 240.0;
}

- (double)defaultActiveSearchFieldWidth
{
  return 280.0;
}

- (int64_t)barPosition
{
  if (self->_searchBarBackground)
    return -[UISearchBarBackground _barPosition](self->_searchBarBackground, "_barPosition");
  else
    return self->_barPosition;
}

- (double)hostedScopeBarHeightForBarMetrics:(int64_t)a3
{
  BOOL v3;
  double result;

  v3 = a3 == 102 || a3 == 1;
  result = 44.0;
  if (v3)
    return 32.0;
  return result;
}

- (BOOL)alwaysUsesLayoutMarginsForHorizontalContentInset
{
  return dyld_program_sdk_at_least();
}

- (void)getDefaultTopInset:(double *)a3 bottomInset:(double *)a4
{
  *a3 = 10.0;
  *a4 = 10.0;
}

- (id)prompt
{
  return -[UILabel text](self->_promptLabel, "text");
}

- (BOOL)scopeBarIsVisible
{
  -[_UISearchBarVisualProviderIOS configureLayout:](self, "configureLayout:", self->_currentLayout);
  return -[_UISearchBarLayout hasScopeBar](self->_currentLayout, "hasScopeBar");
}

- (void)configureLayout:(id)a3
{
  -[_UISearchBarVisualProviderIOS configureLayout:forState:](self, "configureLayout:forState:", a3, self->_layoutState);
}

- (BOOL)showsSearchResultsButton
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 2) >> 5) & 1;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  int v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  CGSize v24;
  CGSize result;

  width = a3.width;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar", a3.width, a3.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    -[_UISearchBarVisualProviderIOS defaultHeightForOrientation:](self, "defaultHeightForOrientation:", objc_msgSend(v6, "_expectedInterfaceOrientation"));
    v9 = v8;
    v10 = dyld_program_sdk_at_least();
    v11 = fabs(width);
    if (v10)
    {
      if (v11 >= INFINITY && v11 <= INFINITY)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v24.width = width;
        v24.height = v9;
        NSStringFromCGSize(v24);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISearchBarVisualProviderIOS.m"), 3184, CFSTR("-[UISearchBar sizeThatFits:] does not support passing non-finite values (%@)"), v13);

      }
    }
    else
    {
      if (v11 == INFINITY)
        v14 = 0.0;
      else
        v14 = width;
      width = v14;
    }
    if (!-[_UISearchBarVisualProviderIOS isInBarButNotHosted](self, "isInBarButNotHosted")
      || (+[UIDevice currentDevice](UIDevice, "currentDevice"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v15, "userInterfaceIdiom"),
          v15,
          (v16 & 0xFFFFFFFFFFFFFFFBLL) != 1))
    {
      if (width == 0.0)
      {
        objc_msgSend(v7, "superview");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
        {
          objc_msgSend(v17, "bounds");
          width = v19;
        }
        else if (fabs(width) < 2.22044605e-16)
        {
          objc_msgSend(v7, "_screen");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "bounds");
          width = v21;

        }
      }
    }
  }
  else
  {
    width = *MEMORY[0x1E0C9D820];
    v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v22 = width;
  v23 = v9;
  result.height = v23;
  result.width = v22;
  return result;
}

- (void)updateMagnifyingGlassView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (self->_searchField)
    {
      v11 = v3;
      objc_msgSend(v3, "_searchBarTextField");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UISearchBarVisualProviderIOS internalImageForSearchBarIcon:state:customImage:](self, "internalImageForSearchBarIcon:state:customImage:", 0, (*(_QWORD *)&self->_searchBarVisualProviderFlags >> 11) & 2, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_setMagnifyingGlassImage:", v5);

      objc_msgSend(v11, "traitCollection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "userInterfaceIdiom");

      v3 = v11;
      if (v7 == 3)
      {
        -[_UISearchBarVisualProviderIOS colorForComponent:disabled:](self, "colorForComponent:disabled:", 2, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_searchBarTextField");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "leftView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setTintColor:", v8);

        v3 = v11;
      }
    }
  }

}

- (id)internalImageForSearchBarIcon:(int64_t)a3 state:(unint64_t)a4 customImage:(BOOL *)a5
{
  void *v9;
  uint64_t v10;
  void *v11;
  UIImage *v12;
  const __CFString *v13;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v12 = objc_alloc_init(UIImage);
LABEL_13:
    v11 = v12;
    goto LABEL_14;
  }
  -[_UISearchBarAppearanceStorage imageForIcon:state:](self->_appearanceStorage, "imageForIcon:state:", a3, a4);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    if (a5)
      *a5 = 0;
    if (a3 == 3)
    {
      v13 = CFSTR("chevron.down.circle.fill");
    }
    else
    {
      if (a3 != 2)
      {
        v11 = 0;
        goto LABEL_14;
      }
      v13 = CFSTR("book");
    }
    +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v13);
    v12 = (UIImage *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v11 = (void *)v10;
  if (a5)
    *a5 = 1;
LABEL_14:

  return v11;
}

- (void)updateDictationButtonForDynamicTypeWithSearchField:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = -[_UISearchBarVisualProviderIOS supportsDynamicType](self, "supportsDynamicType");
  if (v4)
  {
    -[UIButton imageForState:](self->_dictationButton, "imageForState:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "font");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferredContentSizeCategory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v8))
    {
      if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v8, CFSTR("UICTContentSizeCategoryAccessibilityXL")) != NSOrderedAscending)
      {
        v9 = 1;
LABEL_7:

        +[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v6, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "imageWithConfiguration:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[UIButton setImage:forState:](self->_dictationButton, "setImage:forState:", v11, 0);
        goto LABEL_8;
      }
      UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v8, CFSTR("UICTContentSizeCategoryAccessibilityM"));
    }
    v9 = 2;
    goto LABEL_7;
  }
LABEL_8:
  -[UIView setShowsLargeContentViewer:](self->_dictationButton, "setShowsLargeContentViewer:", !v4);

}

- (BOOL)supportsDynamicType
{
  void *v2;
  char v3;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_effectivelySupportsDynamicType");

  return v3;
}

- (BOOL)centerPlaceholder
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 1) >> 3) & 1;
}

- (void)updateRightView
{
  void *v3;
  void *v4;
  void *v5;
  $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags;
  uint64_t v7;
  $3CCFBAC33A89B83EF2A602DE1312B683 v8;
  void *v9;
  void *v10;
  void *v11;
  UIButton *v12;
  id v13;
  UIButton *v14;
  void *v15;
  double v16;
  UIButton *v17;
  UIButton *v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  UIButton *v23;
  id v24;
  _QWORD v25[4];
  UIButton *v26;
  id v27;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v21 = v3;
    objc_msgSend(v3, "_searchBarTextField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    if ((*(_QWORD *)&searchBarVisualProviderFlags & 0x200000) != 0)
      v7 = 2;
    else
      v7 = (*(unint64_t *)&searchBarVisualProviderFlags >> 22) & 2;
    objc_msgSend(v4, "setRightViewMode:", v7);
    v8 = self->_searchBarVisualProviderFlags;
    if ((*(_DWORD *)&v8 & 0x200000) != 0)
    {
      -[_UISearchBarVisualProviderIOS internalImageForSearchBarIcon:state:](self, "internalImageForSearchBarIcon:state:", 3, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UISearchBarVisualProviderIOS internalImageForSearchBarIcon:state:](self, "internalImageForSearchBarIcon:state:", 3, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UISearchBarVisualProviderIOS internalImageForSearchBarIcon:state:](self, "internalImageForSearchBarIcon:state:", 3, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_alloc_init(UIButton);
      -[UIControl addTarget:action:forControlEvents:](v12, "addTarget:action:forControlEvents:", v21, sel__resultsListButtonPressed, 64);
      -[UIButton setImage:forStates:](v12, "setImage:forStates:", v9, 0);
      -[UIButton setImage:forStates:](v12, "setImage:forStates:", v10, 1);
      -[UIButton setImage:forStates:](v12, "setImage:forStates:", v10, 4);
      -[UIButton setImage:forStates:](v12, "setImage:forStates:", v11, 2);
      -[UIButton setSelected:](v12, "setSelected:", (*(_QWORD *)&self->_searchBarVisualProviderFlags >> 22) & 1);
      -[UIControl setPointerInteractionEnabled:](v12, "setPointerInteractionEnabled:", 1);
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __48___UISearchBarVisualProviderIOS_updateRightView__block_invoke;
      v25[3] = &unk_1E16B1B50;
      v26 = v12;
      v13 = v5;
      v27 = v13;
      v14 = v12;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v25);
      -[_UISearchBarVisualProviderIOS colorForComponent:disabled:](self, "colorForComponent:disabled:", 0, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTintColor:](v14, "setTintColor:", v15);

      LODWORD(v16) = -0.5;
      -[UIView setCharge:](v14, "setCharge:", v16);
      objc_msgSend(v13, "setRightView:", v14);
      objc_msgSend(v13, "_setRightViewOffset:", -1.0, -1.0);

      v17 = v26;
    }
    else
    {
      if ((*(_DWORD *)&v8 & 0x800000) == 0)
      {
        if (-[_UISearchBarVisualProviderIOS canShowDictationButton](self, "canShowDictationButton"))
        {
          -[_UISearchBarVisualProviderIOS setUpDictationMicWithSearchField:](self, "setUpDictationMicWithSearchField:", v5);
          -[_UISearchBarVisualProviderIOS setShowDictationButton:shouldUpdateView:](self, "setShowDictationButton:shouldUpdateView:", 1, 0);
        }
        goto LABEL_12;
      }
      -[_UISearchBarVisualProviderIOS internalImageForSearchBarIcon:state:](self, "internalImageForSearchBarIcon:state:", 2, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UISearchBarVisualProviderIOS internalImageForSearchBarIcon:state:](self, "internalImageForSearchBarIcon:state:", 2, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UISearchBarVisualProviderIOS internalImageForSearchBarIcon:state:](self, "internalImageForSearchBarIcon:state:", 2, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_alloc_init(UIButton);
      -[UIControl addTarget:action:forControlEvents:](v18, "addTarget:action:forControlEvents:", v21, sel__bookmarkButtonPressed, 64);
      -[UIButton setImage:forStates:](v18, "setImage:forStates:", v9, 0);
      -[UIButton setImage:forStates:](v18, "setImage:forStates:", v10, 1);
      -[UIButton setImage:forStates:](v18, "setImage:forStates:", v11, 2);
      -[UIControl setPointerInteractionEnabled:](v18, "setPointerInteractionEnabled:", 1);
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __48___UISearchBarVisualProviderIOS_updateRightView__block_invoke_2;
      v22[3] = &unk_1E16B1B50;
      v23 = v18;
      v19 = v5;
      v24 = v19;
      v14 = v18;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v22);
      -[_UISearchBarVisualProviderIOS colorForComponent:disabled:](self, "colorForComponent:disabled:", 0, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTintColor:](v14, "setTintColor:", v20);

      objc_msgSend(v19, "setRightView:", v14);
      v17 = v23;
    }

LABEL_12:
    v3 = v21;
  }

}

- (BOOL)canShowDictationButton
{
  _BOOL8 v3;
  $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags;

  LODWORD(v3) = -[_UISearchBarVisualProviderIOS wantsDictationButton](self, "wantsDictationButton");
  if (v3)
  {
    searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    if ((*(_QWORD *)&searchBarVisualProviderFlags & 0x400000000) == 0)
    {
      self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&searchBarVisualProviderFlags | 0x400000000);
      -[_UISearchBarVisualProviderIOS updateDictationButton](self, "updateDictationButton");
      searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    }
    return (*(unint64_t *)&searchBarVisualProviderFlags >> 33) & 1;
  }
  return v3;
}

- (BOOL)wantsDictationButton
{
  return *((_BYTE *)&self->_searchBarVisualProviderFlags + 4) & 1;
}

- (void)setUpDictationMicWithSearchField:(id)a3
{
  id v4;
  UIDictationSearchButton *v5;
  UIDictationSearchButton *dictationButton;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (!self->_dictationButton)
  {
    +[UIDictationSearchButton searchButton](UIDictationSearchButton, "searchButton");
    v5 = (UIDictationSearchButton *)objc_claimAutoreleasedReturnValue();
    dictationButton = self->_dictationButton;
    self->_dictationButton = v5;

    -[_UISearchBarVisualProviderIOS colorForComponent:disabled:](self, "colorForComponent:disabled:", 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](self->_dictationButton, "setTintColor:", v7);

    -[UIControl addTarget:action:forControlEvents:](self->_dictationButton, "addTarget:action:forControlEvents:", self, sel_dictationButtonPressed_withEvent_, 64);
    -[UIView _setDisableDictationTouchCancellation:](self->_dictationButton, "_setDisableDictationTouchCancellation:", 1);
    _UINSLocalizedStringWithDefaultValue(CFSTR("Dictation"), CFSTR("Dictation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setLargeContentTitle:](self->_dictationButton, "setLargeContentTitle:", v8);

    v4 = v10;
  }
  -[_UISearchBarVisualProviderIOS updateDictationButtonForDynamicTypeWithSearchField:](self, "updateDictationButtonForDynamicTypeWithSearchField:", v4);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_dictationControllerDidFinish_, CFSTR("UIDictationControllerDictationDidFinish"), 0);

  objc_msgSend(v10, "setRightView:", self->_dictationButton);
  objc_msgSend(v10, "setRightViewMode:", 2);

}

- (void)setShowDictationButton:(BOOL)a3 shouldUpdateView:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;

  v4 = a4;
  v6 = 0x100000000;
  if (!a3)
    v6 = 0;
  self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFEFFFFFFFFLL | v6);
  -[UISearchBarTextField setShowDictationButton:](self->_searchField, "setShowDictationButton:");
  if (v4)
    -[_UISearchBarVisualProviderIOS updateRightView](self, "updateRightView");
}

- (id)viewStackedInNavigationBar
{
  _UISearchBarScopeContainerView *v3;
  _UISearchBarScopeContainerView *scopeBarContainerView;

  if ((*((_BYTE *)&self->_searchBarVisualProviderFlags + 3) & 8) != 0)
  {
    if (-[_UISearchBarLayout hasScopeBar](self->_currentLayout, "hasScopeBar"))
      scopeBarContainerView = self->_scopeBarContainerView;
    else
      scopeBarContainerView = 0;
    v3 = scopeBarContainerView;
  }
  else
  {
    -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
    v3 = (_UISearchBarScopeContainerView *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)updateIfNecessaryForOldSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  void *v10;
  _UISearchBarTransitionerBase *transitioner;
  id v12;

  height = a3.height;
  width = a3.width;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v12 = v6;
    objc_msgSend(v6, "bounds");
    v6 = v12;
    if (width != v8 || height != v7)
    {
      -[_UISearchBarVisualProviderIOS layoutBackgroundViewConsideringTopBarStatusAndChangedHeight:](self, "layoutBackgroundViewConsideringTopBarStatusAndChangedHeight:", v7 != height);
      objc_msgSend(v12, "window");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10
        || !+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
      {

        goto LABEL_11;
      }
      transitioner = self->_transitioner;

      v6 = v12;
      if (!transitioner)
      {
        objc_msgSend(v12, "setNeedsLayout");
        -[_UISearchBarSearchContainerView setNeedsLayout](self->_searchFieldContainerView, "setNeedsLayout");
        -[_UISearchBarScopeContainerView setNeedsLayout](self->_scopeBarContainerView, "setNeedsLayout");
        objc_msgSend(v12, "layoutIfNeeded");
LABEL_11:
        v6 = v12;
      }
    }
  }

}

- (BOOL)isFrozenForDismissalCrossfade
{
  return *((_BYTE *)&self->_searchBarVisualProviderFlags + 2) & 1;
}

- (void)applySearchBarStyle
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t backdropStyle;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v15 = v3;
    objc_msgSend(v3, "_searchBarTextField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_systemBackgroundView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)&self->_searchBarVisualProviderFlags & 0x38;
    objc_msgSend(v15, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6 == 16)
    {
      objc_msgSend(v7, "setAllowsGroupBlending:", 0);

      objc_msgSend(v15, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAllowsGroupOpacity:", 0);

      objc_msgSend(v5, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAllowsGroupBlending:", 0);

      objc_msgSend(v5, "setBackgroundContainer:", 1);
      if (dyld_program_sdk_at_least())
        backdropStyle = self->_backdropStyle;
      else
        backdropStyle = 2;
      objc_msgSend(v4, "updateForBackdropStyle:", backdropStyle);
    }
    else
    {
      objc_msgSend(v7, "setAllowsGroupBlending:", 1);

      objc_msgSend(v15, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAllowsGroupOpacity:", 1);

      objc_msgSend(v5, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAllowsGroupBlending:", 1);

      objc_msgSend(v5, "setBackgroundContainer:", 0);
      objc_msgSend(v4, "_removeEffectsBackgroundViews");
      objc_msgSend(v5, "updateView");
    }
    -[_UISearchBarVisualProviderIOS updateNeedForBackdrop](self, "updateNeedForBackdrop");
    if (self->_backdropStyle)
      v14 = 2;
    else
      v14 = (*(_QWORD *)&self->_searchBarVisualProviderFlags >> 3) & 7;
    -[UISearchBarBackground setSearchBarStyle:](self->_searchBarBackground, "setSearchBarStyle:", v14);
    -[_UISearchBarVisualProviderIOS updatePlaceholderColor](self, "updatePlaceholderColor");
    -[_UISearchBarVisualProviderIOS updateMagnifyingGlassView](self, "updateMagnifyingGlassView");
    -[_UISearchBarVisualProviderIOS updateRightView](self, "updateRightView");
    objc_msgSend(v15, "setNeedsLayout");

    v3 = v15;
  }

}

- (void)setUpSearchField
{
  void *v3;
  objc_class *v4;
  UISearchBarTextField *v5;
  UISearchBarTextField *searchField;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  _QWORD v13[5];

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_UISearchBarVisualProviderIOS setUpSearchBarSearchContainerIfNecessary](self, "setUpSearchBarSearchContainerIfNecessary");
    v4 = (objc_class *)objc_msgSend(v3, "_classForSearchTextField");
    if (v4 == (objc_class *)objc_opt_class())
      v4 = (objc_class *)objc_opt_class();
    v5 = (UISearchBarTextField *)objc_msgSend([v4 alloc], "_initWithDeferredSearchIconImageConfiguration");
    searchField = self->_searchField;
    self->_searchField = v5;

    -[UISearchTextField _setSearchBar:](self->_searchField, "_setSearchBar:", v3);
    -[UIView setOpaque:](self->_searchField, "setOpaque:", 0);
    -[UITextField setSemanticContentAttribute:](self->_searchField, "setSemanticContentAttribute:", objc_msgSend(v3, "semanticContentAttribute"));
    -[_UISearchBarVisualProviderIOS updateSearchFieldForDynamicType](self, "updateSearchFieldForDynamicType");
    -[_UISearchBarVisualProviderIOS updateSearchFieldControlSize](self, "updateSearchFieldControlSize");
    -[_UISearchBarVisualProviderIOS updateMagnifyingGlassView](self, "updateMagnifyingGlassView");
    -[UITextField setLeftViewMode:](self->_searchField, "setLeftViewMode:", (*(_QWORD *)&self->_searchBarVisualProviderFlags >> 9) & 3);
    -[_UISearchBarVisualProviderIOS updateRightView](self, "updateRightView");
    -[UITextField setClearButtonMode:](self->_searchField, "setClearButtonMode:", 3);
    -[UITextField setBorderStyle:](self->_searchField, "setBorderStyle:", 3);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __49___UISearchBarVisualProviderIOS_setUpSearchField__block_invoke;
    v13[3] = &unk_1E16B1B28;
    v13[4] = self;
    +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v13);
    if (-[_UISearchBarVisualProviderIOS centerPlaceholder](self, "centerPlaceholder"))
    {
      objc_msgSend(v3, "textInputTraits");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDeferBecomingResponder:", 1);

    }
    v12 = 0;
    -[_UISearchBarVisualProviderIOS internalImageForSearchBarIcon:state:customImage:](self, "internalImageForSearchBarIcon:state:customImage:", 1, 0, &v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && v12)
      -[UISearchTextField _setClearButtonImage:forState:](self->_searchField, "_setClearButtonImage:forState:", v8, 0);
    -[_UISearchBarVisualProviderIOS internalImageForSearchBarIcon:state:customImage:](self, "internalImageForSearchBarIcon:state:customImage:", 1, 1, &v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && v12)
      -[UISearchTextField _setClearButtonImage:forState:](self->_searchField, "_setClearButtonImage:forState:", v9, 1);
    -[_UISearchBarVisualProviderIOS internalImageForSearchBarIcon:state:customImage:](self, "internalImageForSearchBarIcon:state:customImage:", 1, 2, &v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && v12)
      -[UISearchTextField _setClearButtonImage:forState:](self->_searchField, "_setClearButtonImage:forState:", v10, 2);
    -[_UISearchBarVisualProviderIOS updateSearchFieldArt](self, "updateSearchFieldArt");
    -[UIControl addTarget:action:forControlEvents:](self->_searchField, "addTarget:action:forControlEvents:", v3, sel__searchFieldBeginEditing, 0x10000);
    -[UIControl addTarget:action:forControlEvents:](self->_searchField, "addTarget:action:forControlEvents:", v3, sel__searchFieldEditingChanged, 0x20000);
    -[UIControl addTarget:action:forControlEvents:](self->_searchField, "addTarget:action:forControlEvents:", v3, sel__searchFieldEndEditing, 0x40000);
    -[UIControl addTarget:action:forControlEvents:](self->_searchField, "addTarget:action:forControlEvents:", v3, sel__searchFieldReturnPressed, 0x80000);
    if ((*((_BYTE *)&self->_searchBarVisualProviderFlags + 3) & 0x10) == 0)
    {
      -[UIView addSubview:](self->_searchFieldContainerView, "addSubview:", self->_searchField);
      -[_UISearchBarSearchContainerView setNeedsLayout](self->_searchFieldContainerView, "setNeedsLayout");
    }
    -[UIView layer](self->_searchField, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAllowsGroupOpacity:", 0);

    if ((*(_QWORD *)&self->_searchBarVisualProviderFlags & 0x38) == 0x10)
      -[_UISearchBarVisualProviderIOS applySearchBarStyle](self, "applySearchBarStyle");

  }
}

- (void)updateSearchFieldControlSize
{
  void *v3;
  unint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  id v7;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v7 = v3;
    objc_msgSend(v3, "traitCollection");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (_QWORD *)v4;
    if (v4)
    {
      _UIRecordTraitUsage(v4, 0x13uLL);
      v6 = 2 * (v5[16] == 2);
    }
    else
    {
      v6 = 0;
    }
    -[UITextField setControlSize:](self->_searchField, "setControlSize:", v6);

    -[_UISearchBarVisualProviderIOS updateSearchFieldForDynamicType](self, "updateSearchFieldForDynamicType");
    v3 = v7;
  }

}

- (void)updateSearchFieldArt
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  id v19;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v19 = v3;
    objc_msgSend(v3, "_searchBarTextField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISearchBarAppearanceStorage searchFieldBackgroundImageForState:](self->_appearanceStorage, "searchFieldBackgroundImageForState:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(v4, "setBorderStyle:", 3);
      objc_msgSend(v4, "_systemBackgroundView");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBarStyle:", -[_UISearchBarVisualProviderIOS barStyle](self, "barStyle"));
LABEL_16:

      v3 = v19;
      goto LABEL_17;
    }
    -[_UISearchBarAppearanceStorage searchFieldBackgroundImageForState:](self->_appearanceStorage, "searchFieldBackgroundImageForState:", 2);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (void *)v6;
    else
      v8 = v5;
    v9 = v8;

    if (objc_msgSend(v5, "_isResizable"))
    {
      objc_msgSend(v4, "setBackground:", v5);
      if (!objc_msgSend(v9, "_isResizable"))
      {
        v10 = objc_msgSend(v5, "leftCapWidth");
        v11 = objc_msgSend(v5, "topCapHeight");
        v12 = v9;
        v13 = v10;
LABEL_13:
        objc_msgSend(v12, "stretchableImageWithLeftCapWidth:topCapHeight:", v13, v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setDisabledBackground:", v17);

LABEL_14:
        objc_msgSend(v4, "setBorderStyle:", 0);
        objc_msgSend(v5, "size");
        if (v18 != 28.0)
          objc_msgSend(v19, "setNeedsLayout");
        goto LABEL_16;
      }
    }
    else
    {
      objc_msgSend(v5, "size");
      v15 = (uint64_t)((v14 + -1.0) * 0.5);
      objc_msgSend(v5, "stretchableImageWithLeftCapWidth:topCapHeight:", v15, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setBackground:", v16);

      if (!objc_msgSend(v9, "_isResizable"))
      {
        v12 = v9;
        v13 = v15;
        v11 = 0;
        goto LABEL_13;
      }
    }
    objc_msgSend(v4, "setDisabledBackground:", v9);
    goto LABEL_14;
  }
LABEL_17:

}

- (void)setUpSearchBarSearchContainerIfNecessary
{
  uint64_t v3;
  void *v4;
  _UISearchBarSearchContainerView *v5;
  _UISearchBarSearchContainerView *v6;
  _UISearchBarSearchContainerView *searchFieldContainerView;
  _UISearchBarSearchContainerView *v8;
  void *v9;
  void *v10;

  if (!self->_searchFieldContainerView)
  {
    -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
    {
      v10 = (void *)v3;
      v5 = [_UISearchBarSearchContainerView alloc];
      objc_msgSend(v10, "bounds");
      v6 = -[UIView initWithFrame:](v5, "initWithFrame:");
      searchFieldContainerView = self->_searchFieldContainerView;
      self->_searchFieldContainerView = v6;

      -[UIView setAutoresizingMask:](self->_searchFieldContainerView, "setAutoresizingMask:", 2);
      if (!-[_UISearchBarVisualProviderIOS supportsDynamicType](self, "supportsDynamicType"))
      {
        v8 = self->_searchFieldContainerView;
        v9 = (void *)objc_opt_new();
        -[UIView addInteraction:](v8, "addInteraction:", v9);

      }
      objc_msgSend(v10, "addSubview:", self->_searchFieldContainerView);
      objc_msgSend(v10, "setNeedsLayout");
      v4 = v10;
    }

  }
}

- (void)updateSearchFieldForDynamicType
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;

  v3 = -[_UISearchBarVisualProviderIOS supportsDynamicType](self, "supportsDynamicType");
  if (v3)
  {
    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleBody"));
  }
  else
  {
    objc_msgSend(off_1E167A828, "defaultFontSize");
    objc_msgSend(off_1E167A828, "systemFontOfSize:");
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setFont:](self->_searchField, "setFont:", v4);

  -[UITextField setAdjustsFontForContentSizeCategory:](self->_searchField, "setAdjustsFontForContentSizeCategory:", v3);
  v5 = v3 ^ 1;
  -[UISearchTextField _setIgnoresDynamicType:](self->_searchField, "_setIgnoresDynamicType:", v5);
  -[UIView setShowsLargeContentViewer:](self->_searchField, "setShowsLargeContentViewer:", v5);
}

- (void)setBackdropStyle:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && self->_backdropStyle != a3)
  {
    self->_backdropStyle = a3;
    self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFFFFFFFC7 | 0x10);
    v12 = v5;
    -[_UISearchBarVisualProviderIOS updateNeedForBackdrop](self, "updateNeedForBackdrop");
    -[UISearchBarBackground setSearchBarStyle:](self->_searchBarBackground, "setSearchBarStyle:", (*(_QWORD *)&self->_searchBarVisualProviderFlags >> 3) & 7);
    objc_msgSend(v12, "_searchBarTextField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_systemBackgroundView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsGroupBlending:", 0);

    objc_msgSend(v12, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAllowsGroupOpacity:", 0);

    objc_msgSend(v7, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAllowsGroupBlending:", 0);

    objc_msgSend(v7, "setBackgroundContainer:", 1);
    objc_msgSend(v6, "updateForBackdropStyle:", self->_backdropStyle);
    -[_UISearchBarVisualProviderIOS colorForComponent:disabled:](self, "colorForComponent:disabled:", 4, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v11);

    -[_UISearchBarVisualProviderIOS updatePlaceholderColor](self, "updatePlaceholderColor");
    -[_UISearchBarVisualProviderIOS updateMagnifyingGlassView](self, "updateMagnifyingGlassView");
    -[_UISearchBarVisualProviderIOS updateRightView](self, "updateRightView");
    objc_msgSend(v12, "setNeedsLayout");

    v5 = v12;
  }

}

- (void)updatePlaceholderColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v9 = v3;
    objc_msgSend(v3, "_searchBarTextField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_placeholderLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UISearchBarVisualProviderIOS colorForComponent:disabled:](self, "colorForComponent:disabled:", 3, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (dyld_program_sdk_at_least())
    {
      objc_msgSend(v5, "_defaultAttributes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v7, "mutableCopy");

      objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, *(_QWORD *)off_1E1678D98);
      objc_msgSend(v5, "_setDefaultAttributes:", v8);

    }
    else
    {
      objc_msgSend(v5, "setTextColor:", v6);
    }

    v3 = v9;
  }

}

- (id)colorForComponent:(unint64_t)a3 disabled:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int64_t backdropStyle;
  double v13;
  double v14;
  void *v15;
  int64_t v16;
  void *v17;
  uint64_t v19;

  v4 = a4;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
LABEL_5:
    +[UIColor labelColor](UIColor, "labelColor");
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_27:
    v15 = (void *)v11;
    goto LABEL_28;
  }
  objc_msgSend(v7, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  if (v10 == 3)
  {
    switch(a3)
    {
      case 0uLL:
      case 2uLL:
        +[UIColor _carSystemPrimaryColor](UIColor, "_carSystemPrimaryColor");
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_27;
      case 1uLL:
      case 3uLL:
        +[UIColor _carSystemSecondaryColor](UIColor, "_carSystemSecondaryColor");
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_27;
      case 4uLL:
        goto LABEL_5;
      default:
        v15 = 0;
        break;
    }
    goto LABEL_28;
  }
  backdropStyle = self->_backdropStyle;
  if (backdropStyle == 2030)
  {
    if (!v4)
    {
      v14 = 1.0;
      if (a3 == 4)
        v13 = 1.0;
      else
        v13 = 0.5;
      goto LABEL_26;
    }
    goto LABEL_12;
  }
  if (backdropStyle == 2020)
  {
    if (!v4)
    {
LABEL_24:
      +[UIColor whiteColor](UIColor, "whiteColor");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
LABEL_12:
    v13 = 0.35;
    v14 = 1.0;
    goto LABEL_26;
  }
  if (-[_UISearchBarVisualProviderIOS barStyle](self, "barStyle"))
  {
    if (!v4)
    {
      if (a3 != 4)
      {
        +[UIColor _searchFieldPlaceholderTextClearButtonColor](UIColor, "_searchFieldPlaceholderTextClearButtonColor");
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_27;
      }
      goto LABEL_24;
    }
    v14 = 0.47;
    v13 = 0.35;
LABEL_26:
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v14, v13);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  v16 = self->_backdropStyle;
  if ((v16 == 2010 || v16 == 2005) && a3 == 4)
  {
    +[UIColor labelColor](UIColor, "labelColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15 = v17;
  if (v4)
  {
    objc_msgSend(v17, "colorWithAlphaComponent:", 0.35);
    v19 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v19;
  }
LABEL_28:

  return v15;
}

- (int64_t)barStyle
{
  return *(_QWORD *)&self->_searchBarVisualProviderFlags & 7;
}

- (void)removeBackdropVisualEffectView
{
  UIVisualEffectView *backdropVisualEffectView;

  -[UIView removeFromSuperview](self->_backdropVisualEffectView, "removeFromSuperview");
  backdropVisualEffectView = self->_backdropVisualEffectView;
  self->_backdropVisualEffectView = 0;

}

- (void)updateNeedForBackdrop
{
  _UIBackdropView *backdrop;
  int64_t backdropStyle;
  UIVisualEffectView *v5;
  void *v6;
  UIVisualEffectView *v7;
  UIVisualEffectView *backdropVisualEffectView;
  int64_t v9;
  _UIBackdropView *v10;
  _UIBackdropView *v11;

  if (-[_UISearchBarVisualProviderIOS usesBackdrop](self, "usesBackdrop"))
  {
    if (self->_backdropStyle == 2005)
    {
      -[_UISearchBarVisualProviderIOS removeLegacyBackdropView](self, "removeLegacyBackdropView");
      if (!self->_backdropVisualEffectView)
      {
        v5 = [UIVisualEffectView alloc];
        +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 10);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = -[UIVisualEffectView initWithEffect:](v5, "initWithEffect:", v6);
        backdropVisualEffectView = self->_backdropVisualEffectView;
        self->_backdropVisualEffectView = v7;

        -[UIView addSubview:](self->_searchBarBackground, "addSubview:", self->_backdropVisualEffectView);
        -[UIView setUserInteractionEnabled:](self->_backdropVisualEffectView, "setUserInteractionEnabled:", 1);
      }
    }
    else
    {
      -[_UISearchBarVisualProviderIOS removeBackdropVisualEffectView](self, "removeBackdropVisualEffectView");
      backdrop = self->_backdrop;
      backdropStyle = self->_backdropStyle;
      if (backdrop)
      {
        -[_UIBackdropView transitionToPrivateStyle:](backdrop, "transitionToPrivateStyle:", backdropStyle);
      }
      else
      {
        if (backdropStyle)
          v9 = self->_backdropStyle;
        else
          v9 = -2;
        v10 = -[_UIBackdropView initWithPrivateStyle:]([_UIBackdropView alloc], "initWithPrivateStyle:", v9);
        v11 = self->_backdrop;
        self->_backdrop = v10;

        -[UIView addSubview:](self->_searchBarBackground, "addSubview:", self->_backdrop);
        -[UIView setUserInteractionEnabled:](self->_backdrop, "setUserInteractionEnabled:", 1);
      }
      -[UIView setHidden:](self->_backdrop, "setHidden:", self->_backdropStyle == 0);
    }
  }
  else
  {
    -[_UISearchBarVisualProviderIOS removeLegacyBackdropView](self, "removeLegacyBackdropView");
    -[_UISearchBarVisualProviderIOS removeBackdropVisualEffectView](self, "removeBackdropVisualEffectView");
  }
}

- (void)removeLegacyBackdropView
{
  _UIBackdropView *backdrop;

  -[UIView removeFromSuperview](self->_backdrop, "removeFromSuperview");
  backdrop = self->_backdrop;
  self->_backdrop = 0;

}

- (id)existingSearchIconBarButtonItem
{
  return self->_searchIconBarButtonItem;
}

- (void)prepare
{
  void *v4;
  void *v5;
  id v6;
  UIView *v7;
  UIView *searchBarClippingView;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  UISearchBarBackground *v12;
  UISearchBarBackground *v13;
  UISearchBarBackground *searchBarBackground;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_UISearchBarVisualProviderIOS;
  -[_UISearchBarVisualProviderBase prepare](&v16, sel_prepare);
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISearchBarVisualProviderIOS.m"), 1027, CFSTR("visual provider can not prepare without the search bar"));

  }
  self->_tableViewIndexWidth = 0.0;
  *(_OWORD *)&self->_contentInsetPrivateMinOrOverride.top = 0u;
  *(_OWORD *)&self->_contentInsetPrivateMinOrOverride.bottom = 0u;
  *(_QWORD *)&self->_searchBarVisualProviderFlags |= 0x80000uLL;
  -[_UISearchBarVisualProviderIOS updateEffectiveContentInset](self, "updateEffectiveContentInset");
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    _UIMainBundleIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "isEqualToString:", CFSTR("com.sina.weibo"));

  }
  v6 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(v4, "bounds");
  v7 = (UIView *)objc_msgSend(v6, "initWithFrame:");
  searchBarClippingView = self->_searchBarClippingView;
  self->_searchBarClippingView = v7;

  -[UIView setAutoresizingMask:](self->_searchBarClippingView, "setAutoresizingMask:", 18);
  -[UIView setClipsToBounds:](self->_searchBarClippingView, "setClipsToBounds:", 1);
  objc_msgSend(v4, "addSubview:", self->_searchBarClippingView);
  v9 = UISearchBarUsesModernAppearance();
  v10 = 0x300008600;
  if (!v9)
    v10 = 0x300008E00;
  self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFFFFFF7FFLL | v10);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_dictationAvailabilityDidChange_, CFSTR("UIKeyboardDictationAvailabilityDidChangeNotification"), 0);

  v12 = [UISearchBarBackground alloc];
  objc_msgSend(v4, "bounds");
  v13 = -[UISearchBarBackground initWithFrame:](v12, "initWithFrame:");
  searchBarBackground = self->_searchBarBackground;
  self->_searchBarBackground = v13;

  objc_msgSend(v4, "insertSubview:atIndex:", self->_searchBarBackground, 0);
}

- (id)searchBarClippingView
{
  return self->_searchBarClippingView;
}

- (void)updateEffectiveContentInset
{
  void *v3;
  _UISearchBarTransitionerBase *transitioner;
  void *v5;
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
  double v16;
  double v17;
  BOOL v20;
  void *v21;
  id v22;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v22 = v3;
    transitioner = self->_transitioner;
    if (transitioner)
    {
      -[_UISearchBarTransitionerBase activeLayout](transitioner, "activeLayout");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UISearchBarVisualProviderIOS recalculatedEffectiveContentInsetForLayoutState:](self, "recalculatedEffectiveContentInsetForLayoutState:", objc_msgSend(v5, "representedLayoutState"));
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;

    }
    else
    {
      -[_UISearchBarVisualProviderIOS recalculatedEffectiveContentInsetForLayoutState:](self, "recalculatedEffectiveContentInsetForLayoutState:", self->_layoutState);
      v7 = v14;
      v9 = v15;
      v11 = v16;
      v13 = v17;
    }
    v20 = v9 == self->_effectiveContentInset.left
       && v7 == self->_effectiveContentInset.top
       && v13 == self->_effectiveContentInset.right
       && v11 == self->_effectiveContentInset.bottom;
    v3 = v22;
    if (!v20)
    {
      self->_effectiveContentInset.top = v7;
      self->_effectiveContentInset.left = v9;
      self->_effectiveContentInset.bottom = v11;
      self->_effectiveContentInset.right = v13;
      objc_msgSend(v22, "window");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = v22;
      if (v21)
      {
        objc_msgSend(v22, "setNeedsLayout");
        -[_UISearchBarSearchContainerView setNeedsLayout](self->_searchFieldContainerView, "setNeedsLayout");
        -[_UISearchBarScopeContainerView setNeedsLayout](self->_scopeBarContainerView, "setNeedsLayout");
        v3 = v22;
      }
    }
  }

}

- (void)updateForAllowedToShowDictationChange
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v10 = v3;
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "dictationSearchFieldUISupportsTraitCollection:", v5);

    v7 = 0x400000000;
    if (v6)
    {
      +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "dictationSearchFieldUIEnabled");

      if (v9)
        v7 = 0x600000000;
    }
    self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFFFF9FFFFFFFFLL | v7);
    v3 = v10;
  }

}

- (void)setAutoDisableCancelButton:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFFFF7FFFFLL | v3);
  if (!a3)
    -[UIButton setEnabled:](self->_cancelButton, "setEnabled:", 1);
}

- (void)setActiveSearchDeferringScopeBar:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (void)resetLayoutState
{
  self->_layoutState = 0;
}

- (int)visualProviderType
{
  return 2;
}

- (void)setBarTranslucence:(int64_t)a3
{
  $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags;

  searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
  if (((*(unint64_t *)&searchBarVisualProviderFlags >> 6) & 7) != a3)
  {
    self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&searchBarVisualProviderFlags & 0xFFFFFFFFFFFFFE3FLL | ((unint64_t)(a3 & 7) << 6));
    -[UISearchBarBackground setTranslucent:](self->_searchBarBackground, "setTranslucent:", -[_UISearchBarVisualProviderIOS isTranslucent](self, "isTranslucent"));
    -[_UISearchBarVisualProviderIOS updateSearchBarOpacity](self, "updateSearchBarOpacity");
  }
}

- (void)layoutSubviews
{
  void *v3;
  id v4;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "bounds");
    -[_UISearchBarVisualProviderIOS layoutSubviewsInBounds:](self, "layoutSubviewsInBounds:");
    v3 = v4;
  }

}

- (void)layoutSubviewsInBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  int has_internal_diagnostics;
  _UISearchBarTransitionerBase *transitioner;
  UISearchBarTextField *v11;
  UISearchBarTextField *searchField;
  _UISearchBarLayout *v13;
  _UISearchBarLayout *currentLayout;
  _UISearchBarLayout *v15;
  double v16;
  double v17;
  int v18;
  _BOOL4 v19;
  NSObject *v20;
  void *v21;
  unint64_t v22;
  NSObject *v23;
  NSObject *v24;
  unint64_t v25;
  NSObject *v26;
  int v27;
  void *v28;
  uint64_t v29;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v29 = *MEMORY[0x1E0C80C00];
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (!self->_searchField)
    {
      has_internal_diagnostics = os_variant_has_internal_diagnostics();
      transitioner = self->_transitioner;
      if (has_internal_diagnostics)
      {
        if (transitioner)
        {
          __UIFaultDebugAssertLog();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
          {
            LOWORD(v27) = 0;
            _os_log_fault_impl(&dword_185066000, v24, OS_LOG_TYPE_FAULT, "Unexpected late creation of UISearchBar's searchField during a transition. This is a UIKit bug.", (uint8_t *)&v27, 2u);
          }

        }
      }
      else if (transitioner)
      {
        v25 = qword_1ECD795B8;
        if (!qword_1ECD795B8)
        {
          v25 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v25, (unint64_t *)&qword_1ECD795B8);
        }
        v26 = *(NSObject **)(v25 + 8);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v27) = 0;
          _os_log_impl(&dword_185066000, v26, OS_LOG_TYPE_ERROR, "Unexpected late creation of UISearchBar's searchField during a transition. This is a UIKit bug.", (uint8_t *)&v27, 2u);
        }
      }
      objc_msgSend(v8, "_searchBarTextField");
      v11 = (UISearchBarTextField *)objc_claimAutoreleasedReturnValue();
      searchField = self->_searchField;
      self->_searchField = v11;

      -[UIView setShowsLargeContentViewer:](self->_searchField, "setShowsLargeContentViewer:", -[_UISearchBarVisualProviderIOS supportsDynamicType](self, "supportsDynamicType") ^ 1);
    }
    -[_UISearchBarTransitionerBase activeLayout](self->_transitioner, "activeLayout");
    v13 = (_UISearchBarLayout *)objc_claimAutoreleasedReturnValue();
    currentLayout = v13;
    if (!v13)
      currentLayout = self->_currentLayout;
    v15 = currentLayout;

    if (!self->_transitioner)
      -[_UISearchBarVisualProviderIOS configureLayout:](self, "configureLayout:", v15);
    -[_UISearchBarVisualProviderIOS boundsForSearchBarAndUpdateIfNecessaryFromSuggestedBounds:](self, "boundsForSearchBarAndUpdateIfNecessaryFromSuggestedBounds:", x, y, width, height);
    -[_UISearchBarLayoutBase setLayoutSize:](v15, "setLayoutSize:", v16, v17);
    -[_UISearchBarLayout applyLayout](v15, "applyLayout");
    v18 = os_variant_has_internal_diagnostics();
    v19 = -[_UISearchBarLayout isProspective](v15, "isProspective");
    if (v18)
    {
      if (!v19)
      {
LABEL_12:

        goto LABEL_13;
      }
      __UIFaultDebugAssertLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
LABEL_22:

        goto LABEL_12;
      }
      objc_msgSend(v8, "recursiveDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138412290;
      v28 = v21;
      _os_log_fault_impl(&dword_185066000, v20, OS_LOG_TYPE_FAULT, "Live layout with a prospective search layout. Search Bar layout may be incorrect. Please send to UIKit for investigation, and include the following recursive description.\n%@", (uint8_t *)&v27, 0xCu);
    }
    else
    {
      if (!v19)
        goto LABEL_12;
      v22 = qword_1ECD795C0;
      if (!qword_1ECD795C0)
      {
        v22 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v22, (unint64_t *)&qword_1ECD795C0);
      }
      v23 = *(NSObject **)(v22 + 8);
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        goto LABEL_12;
      v20 = v23;
      objc_msgSend(v8, "recursiveDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138412290;
      v28 = v21;
      _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_ERROR, "Live layout with a prospective search layout. Search Bar layout may be incorrect. Please send to UIKit for investigation, and include the following recursive description.\n%@", (uint8_t *)&v27, 0xCu);
    }

    goto LABEL_22;
  }
LABEL_13:

}

- (CGRect)boundsForSearchBarAndUpdateIfNecessaryFromSuggestedBounds:(CGRect)a3
{
  CGFloat height;
  double width;
  double y;
  double x;
  void *v8;
  id WeakRetained;
  _UINavigationBarTitleViewOverlayRects *navBarTitleViewOverlayRects;
  _BOOL8 v11;
  _UINavigationBarTitleViewOverlayRects *v12;
  _UINavigationBarTitleViewOverlayRects *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_navBarTitleViewDataSource);
    if (WeakRetained)
    {
      navBarTitleViewOverlayRects = self->_navBarTitleViewOverlayRects;
      if (navBarTitleViewOverlayRects)
      {
        -[_UINavigationBarTitleViewOverlayRects reset](navBarTitleViewOverlayRects, "reset");
      }
      else
      {
        v12 = objc_alloc_init(_UINavigationBarTitleViewOverlayRects);
        v13 = self->_navBarTitleViewOverlayRects;
        self->_navBarTitleViewOverlayRects = v12;

      }
      objc_msgSend(WeakRetained, "titleView:needsUpdatedContentOverlayRects:", v8, self->_navBarTitleViewOverlayRects);
      -[_UISearchBarVisualProviderIOS updateEffectiveContentInset](self, "updateEffectiveContentInset");
    }
    else if (!-[_UISearchBarVisualProviderIOS isInBarButNotHosted](self, "isInBarButNotHosted"))
    {
      -[UIImageView setHidden:](self->_searchBarBackground, "setHidden:", (*(_QWORD *)&self->_searchBarVisualProviderFlags >> 14) & 1);
      v11 = (*((_BYTE *)&self->_searchBarVisualProviderFlags + 1) & 0x40) == 0 && self->_searchBarBackground != 0;
      -[_UISearchBarLayout setHasSearchBarBackground:](self->_currentLayout, "setHasSearchBarBackground:", v11);
      -[_UISearchBarVisualProviderIOS updateSearchBarOpacity](self, "updateSearchBarOpacity");
LABEL_16:

      goto LABEL_17;
    }
    objc_msgSend(v8, "superview");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "topItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "titleView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16 != v8)
      {
        objc_msgSend(v14, "frame");
        height = v17;
        objc_msgSend(v8, "setBounds:", x, y, width);
      }

    }
    -[UIImageView setHidden:](self->_searchBarBackground, "setHidden:", 1);
    -[_UISearchBarLayout setHasSearchBarBackground:](self->_currentLayout, "setHasSearchBarBackground:", 0);
    -[_UISearchBarVisualProviderIOS updateSearchBarOpacity](self, "updateSearchBarOpacity");

    goto LABEL_16;
  }
  x = *MEMORY[0x1E0C9D648];
  y = *(double *)(MEMORY[0x1E0C9D648] + 8);
  width = *(double *)(MEMORY[0x1E0C9D648] + 16);
  height = *(double *)(MEMORY[0x1E0C9D648] + 24);
LABEL_17:

  v18 = x;
  v19 = y;
  v20 = width;
  v21 = height;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (void)updateSearchBarOpacity
{
  id v3;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v3, "setOpaque:", -[_UISearchBarVisualProviderIOS isTranslucent](self, "isTranslucent") ^ 1);

}

- (BOOL)isTranslucent
{
  return (*(_QWORD *)&self->_searchBarVisualProviderFlags & 0x1C0) == 64;
}

- (void)setHostedInlineByNavigationBar:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  double v13;
  _UISearchBarScopeContainerView *scopeBarContainerView;

  v3 = a3;
  v5 = -[_UISearchBarVisualProviderIOS isHostedInlineByNavigationBar](self, "isHostedInlineByNavigationBar");
  v6 = v5;
  v7 = 0x8000000;
  if (v3)
  {
    if (!v5)
    {
      -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v9) = 1.0;
      objc_msgSend(v8, "setContentHuggingPriority:forAxis:", 0, v9);
      -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "traitCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "userInterfaceIdiom") == 6;

      LODWORD(v13) = dword_1866793A0[v12];
      objc_msgSend(v8, "setContentCompressionResistancePriority:forAxis:", 0, v13);
      if (!self->_layoutState)
      {
        self->_layoutState = 2;
        self->_previousLayoutState = 2;
      }
      scopeBarContainerView = self->_scopeBarContainerView;
      if (scopeBarContainerView)
        -[UIView removeFromSuperview](scopeBarContainerView, "removeFromSuperview");

      v7 = 0x8000000;
    }
  }
  else
  {
    v7 = 0;
  }
  self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFF7FFFFFFLL | v7);
  if (!v3 && v6)
  {
    -[_UISearchBarVisualProviderIOS _establishScopeBarInSearchBarIfNecessary]((uint64_t)self);
    -[_UISearchBarVisualProviderIOS growToSearchFieldIfNecessary](self, "growToSearchFieldIfNecessary");
  }
}

- (BOOL)isInNavigationPalette
{
  return 0;
}

- (void)setPlacedInNavigationBar:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (void)setInNavigationPalette:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  unint64_t v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v3 = a3;
  if (os_variant_has_internal_diagnostics())
  {
    if (v3)
    {
      __UIFaultDebugAssertLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v4, OS_LOG_TYPE_FAULT, "_UISearchBarVisualProviderIOS doesn't support search bars in navigation palettes. This code path is a UIKit bug.", buf, 2u);
      }

    }
  }
  else if (v3)
  {
    v5 = setInNavigationPalette____s_category;
    if (!setInNavigationPalette____s_category)
    {
      v5 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&setInNavigationPalette____s_category);
    }
    v6 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "_UISearchBarVisualProviderIOS doesn't support search bars in navigation palettes. This code path is a UIKit bug.", v7, 2u);
    }
  }
}

- (void)setPlacedInToolbar:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (void)updateScopeBarBackground
{
  void *v3;
  void *v4;
  _UISearchBarScopeBarBackground *scopeBarBackgroundView;
  void *v6;
  _BOOL4 v7;
  _UISearchBarScopeBarBackground *v8;
  $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  double v15;
  id v16;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && self->_scopeBarContainerView)
  {
    v16 = v3;
    -[_UISearchBarVisualProviderIOS scopeBarBackgroundImage](self, "scopeBarBackgroundImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      scopeBarBackgroundView = self->_scopeBarBackgroundView;
      -[_UISearchBarVisualProviderIOS scopeBarBackgroundImage](self, "scopeBarBackgroundImage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](scopeBarBackgroundView, "setImage:", v6);

      -[UIImageView setBackgroundColor:](self->_scopeBarBackgroundView, "setBackgroundColor:", 0);
    }
    else
    {
      v7 = -[_UISearchBarVisualProviderIOS isHostedByNavigationBar](self, "isHostedByNavigationBar");
      v8 = self->_scopeBarBackgroundView;
      if (v7)
      {
        -[UIImageView setHidden:](v8, "setHidden:", 1);
      }
      else
      {
        -[UIImageView setHidden:](v8, "setHidden:", 0);
        searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
        -[_UISearchBarVisualProviderIOS effectiveBarTintColor](self, "effectiveBarTintColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        v12 = v10;
        if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x20000) != 0)
        {
          _GetLightenedTintColor(v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        _UISearchBarBackgroundFillColor(*(_BYTE *)&searchBarVisualProviderFlags & 7, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView setBackgroundColor:](self->_scopeBarBackgroundView, "setBackgroundColor:", v13);

        if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x20000) != 0)
        -[UIImageView setImage:](self->_scopeBarBackgroundView, "setImage:", 0);
      }
    }
    v14 = -[_UISearchBarVisualProviderIOS isTranslucent](self, "isTranslucent");
    v15 = 0.96;
    if (!v14)
      v15 = 1.0;
    -[UIView setAlpha:](self->_scopeBarBackgroundView, "setAlpha:", v15);
    v3 = v16;
  }

}

- (BOOL)isPlacedInNavigationBar
{
  return *((_BYTE *)&self->_searchBarVisualProviderFlags + 3) & 1;
}

- (BOOL)isPlacedInToolbar
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 3) >> 1) & 1;
}

- (void)setBarPosition:(int64_t)a3
{
  void *v5;
  void *v6;
  int64_t barPosition;
  _BOOL8 v8;
  id v9;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && self->_barPosition != a3)
  {
    if (!a3)
      a3 = 2;
    v9 = v5;
    -[UISearchBarBackground _setBarPosition:](self->_searchBarBackground, "_setBarPosition:", a3);
    self->_barPosition = a3;
    *(_QWORD *)&self->_searchBarVisualProviderFlags |= 0x8000uLL;
    objc_msgSend(v9, "_searchController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6 || (barPosition = self->_barPosition, v6, barPosition == 3))
    {
      v8 = self->_barPosition != 3 && (*((_BYTE *)&self->_searchBarVisualProviderFlags + 3) & 4) == 0;
      -[_UISearchBarVisualProviderIOS setClippingViewActive:](self, "setClippingViewActive:", v8);
    }
    -[_UISearchBarVisualProviderIOS updateEffectiveContentInset](self, "updateEffectiveContentInset");
    objc_msgSend(v9, "setNeedsLayout");
    v5 = v9;
  }

}

- (id)searchDisplayController
{
  return 0;
}

- (void)setReliesOnNavigationBarBackdrop:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (void)setHostedByNavigationBar:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (void)setClippingViewActive:(BOOL)a3
{
  uint64_t v3;
  void *v5;
  id v6;

  LODWORD(v3) = a3;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if ((*(_QWORD *)&self->_searchBarVisualProviderFlags & 0x4000000) != 0)
      v3 = (*(_QWORD *)&self->_searchBarVisualProviderFlags & 0x8000000) == 0;
    else
      v3 = v3;
    v6 = v5;
    -[UIView setClipsToBounds:](self->_searchBarClippingView, "setClipsToBounds:", v3);
    v5 = v6;
    if ((v3 & 1) == 0)
    {
      objc_msgSend(v6, "bounds");
      -[_UISearchBarVisualProviderIOS setClippingViewBounds:](self, "setClippingViewBounds:");
      v5 = v6;
    }
  }

}

- (void)setClippingViewBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  UIView *searchBarClippingView;
  BOOL v10;
  void *v11;
  CGRect v12;
  CGRect v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    searchBarClippingView = self->_searchBarClippingView;
    if (searchBarClippingView)
    {
      v11 = v8;
      -[UIView frame](searchBarClippingView, "frame");
      v13.origin.x = x;
      v13.origin.y = y;
      v13.size.width = width;
      v13.size.height = height;
      v10 = CGRectEqualToRect(v12, v13);
      v8 = v11;
      if (!v10)
      {
        objc_msgSend(v11, "frame");
        -[UIView setBounds:](self->_searchBarClippingView, "setBounds:", x, y);
        -[UIView setFrame:](self->_searchBarClippingView, "setFrame:", x, y, width, height);
        v8 = v11;
      }
    }
  }

}

- (BOOL)backgroundLayoutNeedsUpdate
{
  return *((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 1) >> 7;
}

- (void)teardown
{
  void *v4;
  void *v5;
  objc_super v6;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISearchBarVisualProviderIOS.m"), 1075, CFSTR("visual provider can not clean up without delegate"));

  }
  -[UIControl removeTarget:action:forControlEvents:](self->_scopeBar, "removeTarget:action:forControlEvents:", v4, 0, 0xFFFFFFFFLL);
  -[UIControl removeTarget:action:forControlEvents:](self->_searchField, "removeTarget:action:forControlEvents:", v4, 0, 0xFFFFFFFFLL);
  -[UISearchTextField setDelegate:](self->_searchField, "setDelegate:", 0);
  -[UITextField removeFromSuperview](self->_searchField, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_promptLabel, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_cancelButton, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_separator, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_searchBarBackground, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_scopeBarContainerView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_scopeBarBackgroundView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_searchFieldContainerView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_promptContainerView, "removeFromSuperview");
  v6.receiver = self;
  v6.super_class = (Class)_UISearchBarVisualProviderIOS;
  -[_UISearchBarVisualProviderBase teardown](&v6, sel_teardown);

}

- (_UISearchBarVisualProviderIOS)initWithDelegate:(id)a3
{
  _UISearchBarVisualProviderIOS *v3;
  _UISearchBarLayout *v4;
  _UISearchBarLayout *currentLayout;
  _UISearchBarLayout *v6;
  _UISearchBarLayout *prospectiveLayout;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UISearchBarVisualProviderIOS;
  v3 = -[_UISearchBarVisualProviderBase initWithDelegate:](&v9, sel_initWithDelegate_, a3);
  if (v3)
  {
    v4 = objc_alloc_init(_UISearchBarLayout);
    currentLayout = v3->_currentLayout;
    v3->_currentLayout = v4;

    v6 = objc_alloc_init(_UISearchBarLayout);
    prospectiveLayout = v3->_prospectiveLayout;
    v3->_prospectiveLayout = v6;

    -[_UISearchBarLayout setProspective:](v3->_prospectiveLayout, "setProspective:", 1);
  }
  return v3;
}

- (void)setSearchBarStyle:(unint64_t)a3
{
  $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags;
  uint64_t v4;

  if (!self->_backdropStyle)
  {
    searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    v4 = (*(unint64_t *)&searchBarVisualProviderFlags >> 3) & 7;
    if (v4 != a3)
    {
      if (a3 != 2 || v4 == 2)
      {
        self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&searchBarVisualProviderFlags & 0xFFFFFFFFFFFFFFC7 | (8 * (a3 & 7)));
        if (a3 == 2 || v4 != 2)
          return;
      }
      else
      {
        self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&searchBarVisualProviderFlags & 0xFFFFFFFFFFFFFFC7 | 0x10);
      }
      if (self->_searchField)
        -[_UISearchBarVisualProviderIOS applySearchBarStyle](self, "applySearchBarStyle");
    }
  }
}

- (BOOL)showsCancelButton
{
  _UISearchBarVisualProviderIOS *v2;
  void *v3;
  void *v4;
  int v5;

  v2 = self;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_searchController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "automaticallyShowsCancelButton");

  if (v5)
    LOBYTE(v2) = v2->_layoutState == 3;
  else
    LODWORD(v2) = (*((unsigned __int8 *)&v2->_searchBarVisualProviderFlags + 2) >> 2) & 1;

  return (char)v2;
}

- (int64_t)selectedScope
{
  return self->_selectedScope;
}

- (id)scopeTitles
{
  return self->_scopeTitles;
}

- (BOOL)isAtTop
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  char v9;
  _BOOL8 v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
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
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4
      && (objc_msgSend(v3, "_containingScrollView"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v5,
          !v5))
    {
      if (objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle"))
      {
        v7 = objc_msgSend((id)UIApp, "_sceneInterfaceOrientationFromWindow:", v4);
        __UIStatusBarManagerForWindow(v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isStatusBarHidden");

        if ((v9 & 1) != 0)
        {
          v10 = 1;
        }
        else
        {
          __UIStatusBarManagerForWindow(v4);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "defaultStatusBarHeightInOrientation:", v7);
          v22 = v21;

          v10 = v22 == 0.0;
        }
        objc_msgSend(v4, "_referenceFrameFromSceneUsingScreenBounds:", v10);
        v13 = v23;
        v15 = v24;
        v17 = v25;
        v19 = v26;
      }
      else
      {
        objc_msgSend(v3, "_screen");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_applicationFrame");
        v13 = v12;
        v15 = v14;
        v17 = v16;
        v19 = v18;

      }
      objc_msgSend(v4, "convertRect:fromWindow:", 0, v13, v15, v17, v19);
      v28 = v27;
      v30 = v29;
      v32 = v31;
      v34 = v33;
      objc_msgSend(v3, "superview");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "convertRect:fromView:", 0, v28, v30, v32, v34);
      v37 = v36;

      objc_msgSend(v3, "frame");
      v6 = v37 == v38;
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setDrawsBackground:(BOOL)a3
{
  $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags;
  uint64_t v4;

  searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
  if (((*(unint64_t *)&searchBarVisualProviderFlags >> 14) & 1) == a3)
  {
    v4 = 0x4000;
    if (a3)
      v4 = 0;
    self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&searchBarVisualProviderFlags & 0xFFFFFFFFFFFFBFFFLL | v4);
    -[UIImageView setHidden:](self->_searchBarBackground, "setHidden:", !a3);
  }
}

- (void)dictationAvailabilityDidChange:(id)a3
{
  int v4;

  -[_UISearchBarVisualProviderIOS updateForAllowedToShowDictationChange](self, "updateForAllowedToShowDictationChange", a3);
  v4 = -[UISearchBarTextField showDictationButton](self->_searchField, "showDictationButton");
  if (v4 != -[_UISearchBarVisualProviderIOS canShowDictationButton](self, "canShowDictationButton"))
  {
    if (v4)
      -[_UISearchBarVisualProviderIOS cleanUpDictationMicsWithSearchField:](self, "cleanUpDictationMicsWithSearchField:", self->_searchField);
    -[_UISearchBarVisualProviderIOS updateRightView](self, "updateRightView");
  }
  -[_UISearchBarVisualProviderIOS updateDictationButtonActiveState](self, "updateDictationButtonActiveState");
}

- (void)setOverrideContentInsets:(UIEdgeInsets)a3 forRectEdges:(unint64_t)a4
{
  unint64_t overriddenContentInsetEdges;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  id v27;

  overriddenContentInsetEdges = self->_overriddenContentInsetEdges;
  v6 = self->_contentInsetPrivateMinOrOverride.top + 0.0;
  if ((overriddenContentInsetEdges & 1) == 0)
    v6 = 0.0;
  v7 = self->_contentInsetPrivateMinOrOverride.left + 0.0;
  if ((overriddenContentInsetEdges & 2) == 0)
    v7 = 0.0;
  v8 = self->_contentInsetPrivateMinOrOverride.bottom + 0.0;
  if ((overriddenContentInsetEdges & 4) == 0)
    v8 = 0.0;
  v9 = self->_contentInsetPrivateMinOrOverride.right + 0.0;
  if ((overriddenContentInsetEdges & 8) == 0)
    v9 = 0.0;
  v10 = a3.top + 0.0;
  if ((a4 & 1) == 0)
    v10 = 0.0;
  v11 = a3.left + 0.0;
  if ((a4 & 2) == 0)
    v11 = 0.0;
  v12 = a3.bottom + 0.0;
  if ((a4 & 4) == 0)
    v12 = 0.0;
  v13 = a3.right + 0.0;
  if ((a4 & 8) == 0)
    v13 = 0.0;
  if (v7 == v11 && v6 == v10 && v9 == v13 && v8 == v12)
  {
    if (overriddenContentInsetEdges != a4)
      self->_overriddenContentInsetEdges = a4;
  }
  else
  {
    self->_overriddenContentInsetEdges = a4;
    self->_contentInsetPrivateMinOrOverride.top = v10;
    self->_contentInsetPrivateMinOrOverride.left = v11;
    self->_contentInsetPrivateMinOrOverride.bottom = v12;
    self->_contentInsetPrivateMinOrOverride.right = v13;
    -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setNeedsLayout");
    -[_UISearchBarSearchContainerView setNeedsLayout](self->_searchFieldContainerView, "setNeedsLayout");
    -[_UISearchBarScopeContainerView setNeedsLayout](self->_scopeBarContainerView, "setNeedsLayout");
    if (self->_transitioner
      && +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
    {
      objc_msgSend(v27, "window");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        -[_UISearchBarVisualProviderIOS updateEffectiveContentInset](self, "updateEffectiveContentInset");
        -[_UISearchBarVisualProviderIOS effectiveContentInset](self, "effectiveContentInset");
        v19 = v18;
        v21 = v20;
        v23 = v22;
        v25 = v24;
        -[_UISearchBarTransitionerBase activeLayout](self->_transitioner, "activeLayout");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setContentInset:", v19, v21, v23, v25);

        objc_msgSend(v27, "layoutIfNeeded");
      }
    }

  }
}

- (void)updateDictationButtonActiveState
{
  -[UIButton setEnabled:](self->_dictationButton, "setEnabled:", (*(_QWORD *)&self->_searchBarVisualProviderFlags >> 33) & 1);
}

- (void)setEnabled:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _BYTE *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  BOOL v23;
  _QWORD v24[4];
  id v25;
  BOOL v26;
  BOOL v27;

  v4 = a4;
  v5 = a3;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    if (((*(unint64_t *)&searchBarVisualProviderFlags >> 12) & 1) == v5)
    {
      v10 = 4096;
      if (v5)
        v10 = 0;
      self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&searchBarVisualProviderFlags & 0xFFFFFFFFFFFFEFFFLL | v10);
      objc_msgSend(v7, "setUserInteractionEnabled:", v5);
      v11 = MEMORY[0x1E0C809B0];
      if (v4)
      {
        objc_msgSend(v8, "_searchBarTextField");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_setEnabled:animated:", v5, 1);
      }
      else
      {
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __53___UISearchBarVisualProviderIOS_setEnabled_animated___block_invoke;
        v24[3] = &unk_1E16B70C0;
        v25 = v8;
        v26 = v5;
        v27 = v4;
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v24);
        v12 = v25;
      }

      -[UIButton setEnabled:](self->_cancelButton, "setEnabled:", v5);
      -[_UISearchBarVisualProviderIOS existingSearchIconBarButtonItem](self, "existingSearchIconBarButtonItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setEnabled:", v5);
      objc_msgSend(v8, "_searchController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_navigationItemCurrentlyDisplayingSearchController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_inlineSearchBarItemGroup");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (_BYTE *)v16;
      if (v5)
      {
        if (v16)
          *(_BYTE *)(v16 + 89) = 0;
      }
      else
      {
        objc_msgSend(v13, "view");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "window");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          v17[89] = v19 != 0;

        v11 = MEMORY[0x1E0C809B0];
      }

      v22[0] = v11;
      v22[1] = 3221225472;
      v22[2] = __53___UISearchBarVisualProviderIOS_setEnabled_animated___block_invoke_2;
      v22[3] = &unk_1E16B1B78;
      v22[4] = self;
      v23 = v5;
      v20 = _Block_copy(v22);
      v21 = v20;
      if (v4)
        +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v20, 0.35);
      else
        (*((void (**)(void *))v20 + 2))(v20);

    }
  }

}

- (void)setCenterPlaceholder:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a3;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && ((*(_QWORD *)&self->_searchBarVisualProviderFlags & 0x800) == 0) == v3)
  {
    v6 = 2048;
    if (!v3)
      v6 = 0;
    self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFFFFFF7FFLL | v6);
    v8 = v5;
    objc_msgSend(v5, "textInputTraits");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDeferBecomingResponder:", v3);

    v5 = v8;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitioner, 0);
  objc_storeStrong((id *)&self->_prospectiveLayout, 0);
  objc_storeStrong((id *)&self->_currentLayout, 0);
  objc_storeStrong((id *)&self->_searchIconBarButtonItem, 0);
  objc_destroyWeak((id *)&self->_navBarTitleViewDataSource);
  objc_storeStrong((id *)&self->_navBarTitleViewOverlayRects, 0);
  objc_storeStrong((id *)&self->_barTintColor, 0);
  objc_storeStrong((id *)&self->_scopeTitles, 0);
  objc_storeStrong((id *)&self->_scopeBarBackgroundView, 0);
  objc_storeStrong((id *)&self->_scopeBar, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_promptLabel, 0);
  objc_storeStrong((id *)&self->_leftButton, 0);
  objc_storeStrong((id *)&self->_cancelButtonText, 0);
  objc_storeStrong((id *)&self->_cancelBarButtonItem, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_searchBarClippingView, 0);
  objc_storeStrong((id *)&self->_backdropVisualEffectView, 0);
  objc_storeStrong((id *)&self->_backdrop, 0);
  objc_storeStrong((id *)&self->_searchBarBackground, 0);
  objc_storeStrong((id *)&self->_searchField, 0);
  objc_storeStrong((id *)&self->_inlineWidthConstraints, 0);
  objc_storeStrong((id *)&self->_searchNavigationItem, 0);
  objc_storeStrong((id *)&self->_animatedAppearanceBarButtonItem, 0);
  objc_storeStrong((id *)&self->_appearanceStorage, 0);
  objc_storeStrong((id *)&self->_floatingSearchIconView, 0);
  objc_storeStrong((id *)&self->_scopeBarContainerView, 0);
  objc_storeStrong((id *)&self->_promptContainerView, 0);
  objc_storeStrong((id *)&self->_searchFieldContainerView, 0);
  objc_storeStrong((id *)&self->_dictationButton, 0);
}

- (void)setBarStyle:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags;
  BOOL v8;
  int v9;
  UIImageView *separator;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    if ((*(_BYTE *)&searchBarVisualProviderFlags & 7) != a3)
    {
      v15 = (void *)v5;
      if (a3)
        v8 = (*(_BYTE *)&searchBarVisualProviderFlags & 7) == 0;
      else
        v8 = 1;
      self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&searchBarVisualProviderFlags & 0xFFFFFFFFFFFFFFF8 | a3 & 7);
      v9 = v8;
      -[UISearchBarBackground setBarStyle:](self->_searchBarBackground, "setBarStyle:", a3);
      if (!self->_barTintColor)
      {
        if (self->_cancelButton)
        {
          -[_UISearchBarVisualProviderIOS setUpCancelButtonWithAppearance:](self, "setUpCancelButtonWithAppearance:", 0);
          objc_msgSend(v15, "setNeedsLayout");
          -[_UISearchBarSearchContainerView setNeedsLayout](self->_searchFieldContainerView, "setNeedsLayout");
        }
        if (self->_promptLabel)
        {
          -[_UISearchBarVisualProviderIOS setUpPromptLabel](self, "setUpPromptLabel");
          objc_msgSend(v15, "setNeedsLayout");
          -[UIView setNeedsLayout](self->_promptContainerView, "setNeedsLayout");
        }
        if (v9)
          -[_UISearchBarVisualProviderIOS updateSearchFieldArt](self, "updateSearchFieldArt");
        separator = self->_separator;
        if (separator)
        {
          -[_UISearchBarVisualProviderIOS currentSeparatorImage](self, "currentSeparatorImage");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIImageView setImage:](separator, "setImage:", v11);

        }
        -[UISegmentedControl setBarStyle:](self->_scopeBar, "setBarStyle:", a3);
        -[_UISearchBarVisualProviderIOS updateScopeBarBackground](self, "updateScopeBarBackground");
        -[_UISearchBarVisualProviderIOS updateSearchBarOpacity](self, "updateSearchBarOpacity");
      }
      v6 = v15;
      if (v9)
      {
        -[_UISearchBarVisualProviderIOS updatePlaceholderColor](self, "updatePlaceholderColor");
        -[_UISearchBarVisualProviderIOS updateRightView](self, "updateRightView");
        -[_UISearchBarVisualProviderIOS updateMagnifyingGlassView](self, "updateMagnifyingGlassView");
        v12 = -[UISearchBarBackground _hasCustomBackgroundImage](self->_searchBarBackground, "_hasCustomBackgroundImage");
        v6 = v15;
        if (!v12 && !self->_backdropStyle)
        {
          objc_msgSend(v15, "_searchBarTextField");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UISearchBarVisualProviderIOS textColor](self, "textColor");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setTextColor:", v14);

          v6 = v15;
        }
      }
    }
  }

}

- (void)setDelegateSearchFieldFrameManipulationBlock:(id)a3
{
  _UISearchBarLayout *currentLayout;
  id v5;

  currentLayout = self->_currentLayout;
  v5 = a3;
  -[_UISearchBarLayout setDelegateSearchFieldFrameManipulationBlock:](currentLayout, "setDelegateSearchFieldFrameManipulationBlock:", v5);
  -[_UISearchBarLayout setDelegateSearchFieldFrameManipulationBlock:](self->_prospectiveLayout, "setDelegateSearchFieldFrameManipulationBlock:", v5);

}

- (void)_establishScopeBarInSearchBarIfNecessary
{
  id v2;

  if (a1 && (*(_BYTE *)(a1 + 155) & 8) == 0)
  {
    if (*(_QWORD *)(a1 + 64))
    {
      objc_msgSend((id)a1, "searchBar");
      v2 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "insertSubview:atIndex:", *(_QWORD *)(a1 + 64), 0);
      objc_msgSend(v2, "setNeedsLayout");
      objc_msgSend(*(id *)(a1 + 64), "setNeedsLayout");

    }
  }
}

- (void)setTextFieldManagedInNSToolbar:(BOOL)a3
{
  uint64_t v4;

  if (a3)
  {
    v4 = 0x10000000;
  }
  else
  {
    if ((*((_BYTE *)&self->_searchBarVisualProviderFlags + 3) & 0x10) != 0 && self->_searchField)
      -[UIView addSubview:](self->_searchFieldContainerView, "addSubview:");
    v4 = 0;
  }
  self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFEFFFFFFFLL | v4);
}

- (void)setProvidesRestingMeasurementValues:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)providesRestingMeasurementValues
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 3) >> 5) & 1;
}

- (void)_setSearchResultsButtonSelected:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)isSearchResultsButtonSelected
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 2) >> 6) & 1;
}

- (void)_setShowsBookmarkButton:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)showsBookmarkButton
{
  return *((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 2) >> 7;
}

- (void)_setShowsSearchResultsButton:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (void)_setAutoDisableCancelButton:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)autoDisableCancelButton
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 2) >> 3) & 1;
}

- (BOOL)reliesOnNavigationBarBackdrop
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 1) >> 5) & 1;
}

- (BOOL)isActiveSearchDeferringScopeBar
{
  return *((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 3) >> 7;
}

- (void)_setBarStyle:(int64_t)a3
{
  self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFFFFFFFF8 | a3 & 7);
}

- (unint64_t)searchBarStyle
{
  return (*(_QWORD *)&self->_searchBarVisualProviderFlags >> 3) & 7;
}

- (void)_setBarTranslucence:(int64_t)a3
{
  self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFFFFFFE3FLL | ((unint64_t)(a3 & 7) << 6));
}

- (int64_t)barTranslucence
{
  return (*(_QWORD *)&self->_searchBarVisualProviderFlags >> 6) & 7;
}

- (void)setSearchFieldLeftViewMode:(int64_t)a3
{
  UISearchBarTextField *searchField;

  self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFFFFFF9FFLL | ((unint64_t)(a3 & 3) << 9));
  searchField = self->_searchField;
  if (searchField)
    -[UITextField setLeftViewMode:](searchField, "setLeftViewMode:", a3 & 3);
}

- (int64_t)searchFieldLeftViewMode
{
  if (self->_searchField)
    return -[UITextField leftViewMode](self->_searchField, "leftViewMode");
  else
    return (*(_QWORD *)&self->_searchBarVisualProviderFlags >> 9) & 3;
}

- (void)setEnabled:(BOOL)a3
{
  -[_UISearchBarVisualProviderIOS setEnabled:animated:](self, "setEnabled:animated:", a3, 0);
}

- (BOOL)isEnabled
{
  return (*((_BYTE *)&self->_searchBarVisualProviderFlags + 1) & 0x10) == 0;
}

- (void)setDrawsBackgroundInPalette:(BOOL)a3
{
  NSObject *v4;
  unint64_t v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    if (!a3)
    {
      __UIFaultDebugAssertLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v4, OS_LOG_TYPE_FAULT, "_UISearchBarVisualProviderIOS doesn't support drawsBackgroundInPalette. This code path is a UIKit bug.", buf, 2u);
      }

    }
  }
  else if (!a3)
  {
    v5 = setDrawsBackgroundInPalette____s_category;
    if (!setDrawsBackgroundInPalette____s_category)
    {
      v5 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&setDrawsBackgroundInPalette____s_category);
    }
    v6 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "_UISearchBarVisualProviderIOS doesn't support drawsBackgroundInPalette. This code path is a UIKit bug.", v7, 2u);
    }
  }
}

- (BOOL)drawsBackgroundInPalette
{
  return 1;
}

- (void)_setHideBackground:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)drawsBackground
{
  return (*((_BYTE *)&self->_searchBarVisualProviderFlags + 1) & 0x40) == 0;
}

- (void)setUsesEmbeddedAppearance:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags;
  uint64_t v7;
  UIColor *barTintColor;
  id v9;

  v3 = a3;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    if (((*(_QWORD *)&searchBarVisualProviderFlags & 0x20000) == 0) == v3)
    {
      v9 = v5;
      v7 = 0x20000;
      if (!v3)
        v7 = 0;
      self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&searchBarVisualProviderFlags & 0xFFFFFFFFFFFDFFFFLL | v7);
      -[UISearchBarBackground setUsesEmbeddedAppearance:](self->_searchBarBackground, "setUsesEmbeddedAppearance:", v3);
      barTintColor = self->_barTintColor;
      if (barTintColor)
        -[_UISearchBarVisualProviderIOS setBarTintColor:forceUpdate:](self, "setBarTintColor:forceUpdate:", barTintColor, 1);
      objc_msgSend(v9, "setNeedsLayout");
      v5 = v9;
    }
  }

}

- (BOOL)usesEmbeddedAppearance
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 2) >> 1) & 1;
}

- (void)allowCursorToAppear:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v9 = v5;
    v6 = -[_UISearchBarVisualProviderIOS centerPlaceholder](self, "centerPlaceholder");
    v5 = v9;
    if (v6)
    {
      objc_msgSend(v9, "_searchBarTextField");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v3)
      {
        objc_msgSend(v7, "_setPreventSelectionViewActivation:", 0);
        if (objc_msgSend(v8, "isFirstResponder"))
        {
          objc_msgSend(v8, "__resumeBecomeFirstResponder");
          objc_msgSend(v8, "_activateSelectionView");
        }
      }
      else
      {
        objc_msgSend(v7, "_setPreventSelectionViewActivation:", 1);
      }

      v5 = v9;
    }
  }

}

- (void)setShowsCancelButton:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void (**v11)(_QWORD);
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _BOOL4 v17;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  _UISearchBarVisualProviderIOS *v23;
  id v24;
  BOOL v25;
  char v26;
  _QWORD v27[4];
  id v28;
  _QWORD aBlock[5];
  id v30;
  BOOL v31;
  BOOL v32;

  v4 = a4;
  v5 = a3;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (dyld_program_sdk_at_least())
    {
      objc_msgSend(v7, "_searchController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAutomaticallyShowsCancelButton:", 0);

    }
    if (((((*((_BYTE *)&self->_searchBarVisualProviderFlags + 2) & 4) == 0) ^ v5) & 1) == 0)
    {
      v9 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __63___UISearchBarVisualProviderIOS_setShowsCancelButton_animated___block_invoke;
      aBlock[3] = &unk_1E16B4E20;
      v31 = v5;
      aBlock[4] = self;
      v32 = v4;
      v10 = v7;
      v30 = v10;
      v11 = (void (**)(_QWORD))_Block_copy(aBlock);
      objc_msgSend(v10, "_searchController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_managedPalette");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        v11[2](v11);
      else
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v11);
      v14 = 0x40000;
      if (!v5)
        v14 = 0;
      self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFFFFBFFFFLL | v14);
      objc_msgSend(v10, "setNeedsLayout");
      -[_UISearchBarSearchContainerView setNeedsLayout](self->_searchFieldContainerView, "setNeedsLayout");
      if (-[_UISearchBarVisualProviderIOS centerPlaceholder](self, "centerPlaceholder")
        && v4
        && (*((_BYTE *)&self->_searchBarVisualProviderFlags + 2) & 4) != 0)
      {
        -[_UISearchBarVisualProviderIOS allowCursorToAppear:](self, "allowCursorToAppear:", 0);
        objc_msgSend(v10, "textInputTraits");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setDeferBecomingResponder:", 0);

      }
      v16 = objc_msgSend(v10, "_isHostedInlineByNavigationBar") & v5 ^ 1;
      v17 = -[_UISearchBarVisualProviderIOS isHostedByNavigationBar](self, "isHostedByNavigationBar");
      v18 = v17;
      if (v4)
      {
        if (v17)
          objc_msgSend(v10, "_setClipsToBounds:", 1);
        v27[0] = v9;
        v27[1] = 3221225472;
        v27[2] = __63___UISearchBarVisualProviderIOS_setShowsCancelButton_animated___block_invoke_2;
        v27[3] = &unk_1E16B1B28;
        v28 = v10;
        v19 = v9;
        v20 = 3221225472;
        v21 = __63___UISearchBarVisualProviderIOS_setShowsCancelButton_animated___block_invoke_3;
        v22 = &unk_1E16B70E8;
        v23 = self;
        v24 = v28;
        v25 = v18;
        v26 = v16;
        +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v27, &v19, 0.25, 0.0);

      }
      else
      {
        if ((*((_BYTE *)&self->_searchBarVisualProviderFlags + 2) & 4) == 0)
          -[_UISearchBarVisualProviderIOS destroyCancelButton](self, "destroyCancelButton");
        if (v18)
          objc_msgSend(v10, "_setClipsToBounds:", v16);
      }
      if (-[_UISearchBarVisualProviderIOS isInBarButNotHosted](self, "isInBarButNotHosted", v19, v20, v21, v22, v23))
        -[_UISearchBarVisualProviderIOS displayNavBarCancelButton:animated:](self, "displayNavBarCancelButton:animated:", (*(_QWORD *)&self->_searchBarVisualProviderFlags >> 18) & 1, v4);

    }
  }

}

- (void)setShowsCancelButton:(BOOL)a3
{
  -[_UISearchBarVisualProviderIOS setShowsCancelButton:animated:](self, "setShowsCancelButton:animated:", a3, 0);
}

- (void)_setShowsCancelButton:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (void)setShowsSearchResultsButton:(BOOL)a3
{
  $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags;
  uint64_t v4;

  searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
  if (((((*(_QWORD *)&searchBarVisualProviderFlags & 0x200000) == 0) ^ a3) & 1) == 0)
  {
    v4 = 0x200000;
    if (!a3)
      v4 = 0;
    self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&searchBarVisualProviderFlags & 0xFFFFFFFFFFDFFFFFLL | v4);
    -[_UISearchBarVisualProviderIOS updateRightView](self, "updateRightView");
  }
}

- (void)setSearchResultsButtonSelected:(BOOL)a3
{
  $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags;
  uint64_t v4;

  searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
  if (((((*(_QWORD *)&searchBarVisualProviderFlags & 0x400000) == 0) ^ a3) & 1) == 0)
  {
    v4 = 0x400000;
    if (!a3)
      v4 = 0;
    self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&searchBarVisualProviderFlags & 0xFFFFFFFFFFBFFFFFLL | v4);
    -[_UISearchBarVisualProviderIOS updateRightView](self, "updateRightView");
  }
}

- (void)setShowsBookmarkButton:(BOOL)a3
{
  $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags;
  uint64_t v4;

  searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
  if (((((*(_QWORD *)&searchBarVisualProviderFlags & 0x800000) == 0) ^ a3) & 1) == 0)
  {
    v4 = 0x800000;
    if (!a3)
      v4 = 0;
    self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&searchBarVisualProviderFlags & 0xFFFFFFFFFF7FFFFFLL | v4);
    -[_UISearchBarVisualProviderIOS updateRightView](self, "updateRightView");
  }
}

- (void)animateShowsScopeBarAnimatingOut:(void *)a1
{
  void *v4;
  char v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  void *v13;
  id v14;
  char v15;
  _QWORD v16[5];
  char v17;
  _QWORD aBlock[5];
  id v19;
  char v20;

  if (a1)
  {
    objc_msgSend(a1, "searchBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(a1, "isHostedInlineByNavigationBar") ^ 1;
    v6 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __66___UISearchBarVisualProviderIOS_animateShowsScopeBarAnimatingOut___block_invoke;
    aBlock[3] = &unk_1E16B4008;
    v20 = a2;
    aBlock[4] = a1;
    v7 = v4;
    v19 = v7;
    v8 = _Block_copy(aBlock);
    v16[0] = v6;
    v16[1] = 3221225472;
    v16[2] = __66___UISearchBarVisualProviderIOS_animateShowsScopeBarAnimatingOut___block_invoke_6;
    v16[3] = &unk_1E16B1B78;
    v16[4] = a1;
    v17 = a2;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v16);
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __66___UISearchBarVisualProviderIOS_animateShowsScopeBarAnimatingOut___block_invoke_7;
    v11[3] = &unk_1E16B1CF0;
    v15 = v5;
    v12 = v7;
    v13 = a1;
    v14 = v8;
    v9 = v8;
    v10 = v7;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v11, 0, 0.25, 0.0);

  }
}

- (void)setShowsScopeBar:(BOOL)a3 animateOpacity:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  uint64_t v9;
  $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags;
  void *v11;
  uint64_t v12;
  _BOOL8 v13;
  id v14;

  v4 = a4;
  v5 = a3;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v14 = v7;
    if (dyld_program_sdk_at_least())
    {
      objc_msgSend(v14, "_searchController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setScopeBarActivation:", 1);

    }
    if (-[_UISearchBarVisualProviderIOS isTextFieldManagedInNSToolbar](self, "isTextFieldManagedInNSToolbar"))
    {
      v9 = 0x40000000;
      if (!v5)
        v9 = 0;
      self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFBFFFFFFFLL | v9);
LABEL_25:
      v7 = v14;
      goto LABEL_26;
    }
    if (v5 && !self->_cancelButton)
      -[_UISearchBarVisualProviderIOS setUpCancelButton](self, "setUpCancelButton");
    searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    v7 = v14;
    if (((((*(_DWORD *)&searchBarVisualProviderFlags & 0x40000000) == 0) ^ v5) & 1) == 0)
    {
      if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x4000000) != 0)
      {
        objc_msgSend(v14, "_searchController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UISearchController _scopeBarWillShowOrHide]((uint64_t)v11);

        v7 = v14;
        searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
      }
      v12 = 0x40000000;
      if (!v5)
        v12 = 0;
      self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&searchBarVisualProviderFlags & 0xFFFFFFFFBFFFFFFFLL | v12);
      objc_msgSend(v7, "invalidateIntrinsicContentSize");
      objc_msgSend(v14, "setNeedsLayout");
      if (v5)
        -[UIView setHidden:](self->_scopeBarContainerView, "setHidden:", 0);
      if (v4)
        -[_UISearchBarVisualProviderIOS animateShowsScopeBarAnimatingOut:](self, !v5);
      else
        -[UIView setAlpha:](self->_scopeBarContainerView, "setAlpha:", (double)v5);
      if (self->_scopeBarContainerView)
        v13 = v5;
      else
        v13 = 0;
      -[UISearchBarBackground setUsesContiguousBarBackground:](self->_searchBarBackground, "setUsesContiguousBarBackground:", v13);
      goto LABEL_25;
    }
  }
LABEL_26:

}

- (void)setShowsScopeBar:(BOOL)a3
{
  -[_UISearchBarVisualProviderIOS setShowsScopeBar:animateOpacity:](self, "setShowsScopeBar:animateOpacity:", a3, 0);
}

- (void)_setShowsScopeBar:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (void)setDeferredAutomaticShowsScopeBarInNavigationBar:(id)a3 hasContent:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CGFloat Width;
  uint64_t v14;
  id v15;
  _QWORD v16[9];
  _QWORD v17[4];
  id v18;
  CGRect v19;

  v4 = a4;
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __93___UISearchBarVisualProviderIOS_setDeferredAutomaticShowsScopeBarInNavigationBar_hasContent___block_invoke;
  v17[3] = &unk_1E16B1B28;
  v15 = v6;
  v18 = v15;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v17);
  searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
  if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x80000000) == 0 || v4)
  {
    self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&searchBarVisualProviderFlags & 0xFFFFFFFF3FFFFFFFLL | 0x40000000);
    -[_UISearchBarVisualProviderIOS setUpScopeBar](self, "setUpScopeBar");
    -[UIView frame](self->_scopeBarContainerView, "frame");
    v10 = v9;
    v12 = v11;
    objc_msgSend(v15, "bounds");
    Width = CGRectGetWidth(v19);
    -[_UISearchBarVisualProviderIOS scopeBarHeight](self, "scopeBarHeight");
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __93___UISearchBarVisualProviderIOS_setDeferredAutomaticShowsScopeBarInNavigationBar_hasContent___block_invoke_2;
    v16[3] = &unk_1E16B20D8;
    v16[4] = self;
    v16[5] = v10;
    v16[6] = v12;
    *(CGFloat *)&v16[7] = Width;
    v16[8] = v14;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v16);
    -[_UISearchBarVisualProviderIOS animateShowsScopeBarAnimatingOut:](self, 0);
    -[_UISearchBarVisualProviderIOS configureLayout:](self, "configureLayout:", self->_currentLayout);
  }

}

- (BOOL)showsScopeBar
{
  _UISearchBarVisualProviderIOS *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _DWORD *v6;
  void *v7;
  int v8;
  BOOL v9;

  v2 = self;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_searchController");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_9;
  v5 = (void *)v4;
  objc_msgSend(v3, "_searchController");
  v6 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = (v6[261] >> 5) & 3;
    if (v8 == 1)
    {

      goto LABEL_9;
    }
    if (!v8)
      dyld_program_sdk_at_least();
  }
  v9 = -[_UISearchBarVisualProviderIOS isActiveSearchDeferringScopeBar](v2, "isActiveSearchDeferringScopeBar");

  if (v9)
  {
LABEL_9:
    LODWORD(v2) = (*((unsigned __int8 *)&v2->_searchBarVisualProviderFlags + 3) >> 6) & 1;
    goto LABEL_10;
  }
  LOBYTE(v2) = v2->_layoutState == 3;
LABEL_10:

  return (char)v2;
}

- (BOOL)allowsInlineScopeBar
{
  return 0;
}

- (UIView)searchFieldContainerView
{
  return (UIView *)self->_searchFieldContainerView;
}

- (void)setCancelButton:(id)a3
{
  UIButton *v5;
  UIButton *cancelButton;
  UIButton *v7;

  v5 = (UIButton *)a3;
  cancelButton = self->_cancelButton;
  if (cancelButton != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](cancelButton, "removeFromSuperview");
    objc_storeStrong((id *)&self->_cancelButton, a3);
    -[_UISearchBarVisualProviderIOS updateCancelButtonForDynamicType](self, "updateCancelButtonForDynamicType");
    v5 = v7;
  }

}

- (void)setScopeTitles:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *scopeTitles;
  UISegmentedControl *scopeBar;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t selectedScope;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[NSArray isEqualToArray:](self->_scopeTitles, "isEqualToArray:", v4) || v4 && !self->_scopeTitles)
  {
    v5 = (NSArray *)objc_msgSend(v4, "copy");
    scopeTitles = self->_scopeTitles;
    self->_scopeTitles = v5;

    -[_UISearchBarVisualProviderIOS setUpScopeBar](self, "setUpScopeBar");
    scopeBar = self->_scopeBar;
    if (scopeBar)
    {
      -[UISegmentedControl removeAllSegments](scopeBar, "removeAllSegments");
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v8 = v4;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
      {
        v10 = v9;
        v11 = 0;
        v12 = *(_QWORD *)v17;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v17 != v12)
              objc_enumerationMutation(v8);
            -[UISegmentedControl insertSegmentWithTitle:atIndex:animated:](self->_scopeBar, "insertSegmentWithTitle:atIndex:animated:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), v11 + v13, 0, (_QWORD)v16);
            ++v13;
          }
          while (v10 != v13);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          v11 += v13;
        }
        while (v10);
      }

      selectedScope = self->_selectedScope;
      if (selectedScope >= objc_msgSend(v8, "count"))
      {
        v15 = objc_msgSend(v8, "count") - 1;
        self->_selectedScope = v15;
      }
      else
      {
        v15 = self->_selectedScope;
      }
      -[UISegmentedControl setSelectedSegmentIndex:](self->_scopeBar, "setSelectedSegmentIndex:", v15, (_QWORD)v16);
    }
  }

}

- (void)setMinimumContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInsetPrivateMinOrOverride.left != a3.left
    || self->_contentInsetPrivateMinOrOverride.top != a3.top
    || self->_contentInsetPrivateMinOrOverride.right != a3.right
    || self->_contentInsetPrivateMinOrOverride.bottom != a3.bottom)
  {
    self->_contentInsetPrivateMinOrOverride = a3;
    -[_UISearchBarVisualProviderIOS updateEffectiveContentInset](self, "updateEffectiveContentInset");
  }
}

- (void)setPrompt:(id)a3
{
  void *v4;
  UILabel *v5;
  void *v6;
  char v7;
  UILabel *promptLabel;
  id v9;

  v9 = a3;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = self->_promptLabel;
    if (v9)
    {
      if (v5)
      {
        -[UILabel text](v5, "text");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v9, "isEqualToString:", v6);

        -[UILabel setText:](v5, "setText:", v9);
        if ((v7 & 1) != 0)
          goto LABEL_10;
      }
      else
      {
        -[_UISearchBarVisualProviderIOS setUpPromptLabel](self, "setUpPromptLabel");
        v5 = self->_promptLabel;
        objc_msgSend(v4, "invalidateIntrinsicContentSize");
        -[UILabel setText:](v5, "setText:", v9);
      }
    }
    else
    {
      if (!v5)
      {
LABEL_10:

        goto LABEL_11;
      }
      -[UIView removeFromSuperview](self->_promptLabel, "removeFromSuperview");
      promptLabel = self->_promptLabel;
      self->_promptLabel = 0;

      objc_msgSend(v4, "invalidateIntrinsicContentSize");
    }
    -[UIView setNeedsLayout](self->_promptContainerView, "setNeedsLayout");
    goto LABEL_10;
  }
LABEL_11:

}

- (void)setBackgroundExtension:(double)a3
{
  void *v5;
  id v6;

  if (self->_backgroundExtension != a3)
  {
    -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      self->_backgroundExtension = a3;
      v6 = v5;
      objc_msgSend(v5, "setNeedsLayout");
      v5 = v6;
    }

  }
}

- (id)searchFieldIfExists
{
  return self->_searchField;
}

- (id)floatingSearchIconView
{
  UIImageView *floatingSearchIconView;

  floatingSearchIconView = self->_floatingSearchIconView;
  if (!floatingSearchIconView || (*((_BYTE *)&self->_searchBarVisualProviderFlags + 4) & 0x10) == 0)
  {
    -[_UISearchBarVisualProviderIOS setUpFloatingSearchIconView](self, "setUpFloatingSearchIconView");
    floatingSearchIconView = self->_floatingSearchIconView;
  }
  return floatingSearchIconView;
}

- (id)floatingSearchIconViewIfExists
{
  return self->_floatingSearchIconView;
}

- (UIView)floatingSearchIconBackgroundView
{
  return 0;
}

- (id)leftButton
{
  -[_UISearchBarVisualProviderIOS setUpLeftButton](self, "setUpLeftButton");
  return self->_leftButton;
}

- (id)leftButtonIfExists
{
  return self->_leftButton;
}

- (id)cancelBarButtonItem
{
  void *v3;
  UIBarButtonItem *v4;
  NSString *cancelButtonText;
  void *v6;
  UIBarButtonItem *v7;
  UIBarButtonItem *cancelBarButtonItem;
  UIBarButtonItem *v9;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (!self->_cancelBarButtonItem)
    {
      v4 = [UIBarButtonItem alloc];
      cancelButtonText = self->_cancelButtonText;
      v6 = cancelButtonText;
      if (!cancelButtonText)
      {
        _UINSLocalizedStringWithDefaultValue(CFSTR("Cancel"), CFSTR("Cancel"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v7 = -[UIBarButtonItem initWithTitle:style:target:action:](v4, "initWithTitle:style:target:action:", v6, 2, v3, sel__cancelButtonPressed);
      cancelBarButtonItem = self->_cancelBarButtonItem;
      self->_cancelBarButtonItem = v7;

      if (!cancelButtonText)
    }
    v9 = self->_cancelBarButtonItem;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)cancelBarButtonItemIfExists
{
  return self->_cancelBarButtonItem;
}

- (id)runtimeOnlyViews
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_searchBarClippingView)
    objc_msgSend(v3, "addObject:");
  if (self->_promptLabel)
    objc_msgSend(v4, "addObject:");
  if (self->_cancelButton)
    objc_msgSend(v4, "addObject:");
  if (self->_searchField)
    objc_msgSend(v4, "addObject:");
  if (self->_separator)
    objc_msgSend(v4, "addObject:");
  if (self->_searchBarBackground)
    objc_msgSend(v4, "addObject:");
  if (self->_scopeBarContainerView)
    objc_msgSend(v4, "addObject:");
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (void)revertViewHierarchyIfNecessary
{
  __63___UISearchBarVisualProviderIOS_revertViewHierarchyIfNecessary__block_invoke(self->_searchFieldContainerView);
  __63___UISearchBarVisualProviderIOS_revertViewHierarchyIfNecessary__block_invoke(self->_promptContainerView);
}

- (void)destroyCancelButton
{
  UIButton *cancelButton;

  -[UIView removeFromSuperview](self->_cancelButton, "removeFromSuperview");
  cancelButton = self->_cancelButton;
  self->_cancelButton = 0;

  -[_UISearchBarLayout setCancelButton:](self->_prospectiveLayout, "setCancelButton:", 0);
  -[_UISearchBarLayout setCancelButton:](self->_currentLayout, "setCancelButton:", 0);
}

- (void)destroyPromptLabel
{
  _UISearchBarPromptContainerView *promptContainerView;
  UILabel *promptLabel;

  -[UIView removeFromSuperview](self->_promptContainerView, "removeFromSuperview");
  promptContainerView = self->_promptContainerView;
  self->_promptContainerView = 0;

  -[UIView removeFromSuperview](self->_promptLabel, "removeFromSuperview");
  promptLabel = self->_promptLabel;
  self->_promptLabel = 0;

}

- (id)currentSeparatorImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;

  -[_UISearchBarAppearanceStorage separatorImage](self->_appearanceStorage, "separatorImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UISearchBarAppearanceStorage separatorImage](self->_appearanceStorage, "separatorImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((*(_BYTE *)&self->_searchBarVisualProviderFlags & 7) != 0
      || (-[_UISearchBarVisualProviderIOS effectiveBarTintColor](self, "effectiveBarTintColor"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v5,
          v5))
    {
      -[_UISearchBarVisualProviderIOS effectiveBarTintColor](self, "effectiveBarTintColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v6 || (*(_QWORD *)&self->_searchBarVisualProviderFlags & 7) == 1)
        && (v7 = *(_QWORD *)&self->_searchBarVisualProviderFlags & 0x1C0, v6, v7 != 64))
      {
        v8 = CFSTR("UISearchBarBlackSeparator.png");
      }
      else
      {
        v8 = CFSTR("UISearchBarBlackTranslucentSeparator.png");
      }
    }
    else
    {
      v8 = CFSTR("UISearchBarDefaultSeparator.png");
    }
    _UIImageWithName(v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)separatorImage
{
  return -[_UISearchBarAppearanceStorage separatorImage](self->_appearanceStorage, "separatorImage");
}

- (void)setSeparatorImage:(id)a3
{
  id v4;
  _UISearchBarAppearanceStorage *appearanceStorage;
  _UISearchBarAppearanceStorage *v6;
  _UISearchBarAppearanceStorage *v7;
  id v8;
  UIImageView *separator;
  void *v10;
  id v11;

  v4 = a3;
  appearanceStorage = self->_appearanceStorage;
  v11 = v4;
  if (v4)
  {
    if (!appearanceStorage)
    {
      v6 = objc_alloc_init(_UISearchBarAppearanceStorage);
      v7 = self->_appearanceStorage;
      self->_appearanceStorage = v6;

      appearanceStorage = self->_appearanceStorage;
    }
  }
  else if (!appearanceStorage)
  {
    goto LABEL_7;
  }
  -[_UISearchBarAppearanceStorage separatorImage](appearanceStorage, "separatorImage");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v11;
  if (v8 != v11)
  {
    -[_UISearchBarAppearanceStorage setSeparatorImage:](self->_appearanceStorage, "setSeparatorImage:", v11);
    separator = self->_separator;
    -[_UISearchBarVisualProviderIOS currentSeparatorImage](self, "currentSeparatorImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](separator, "setImage:", v10);

    v4 = v11;
  }
LABEL_7:

}

- (void)setSearchFieldBackgroundImage:(id)a3 forState:(unint64_t)a4
{
  id v6;
  _UISearchBarAppearanceStorage *appearanceStorage;
  _UISearchBarAppearanceStorage *v8;
  _UISearchBarAppearanceStorage *v9;
  id v10;
  id v11;

  v6 = a3;
  appearanceStorage = self->_appearanceStorage;
  v11 = v6;
  if (v6)
  {
    if (!appearanceStorage)
    {
      v8 = objc_alloc_init(_UISearchBarAppearanceStorage);
      v9 = self->_appearanceStorage;
      self->_appearanceStorage = v8;

      appearanceStorage = self->_appearanceStorage;
    }
  }
  else if (!appearanceStorage)
  {
    goto LABEL_7;
  }
  -[_UISearchBarAppearanceStorage searchFieldBackgroundImageForState:](appearanceStorage, "searchFieldBackgroundImageForState:", a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v11;
  if (v10 != v11)
  {
    -[_UISearchBarAppearanceStorage setSearchFieldBackgroundImage:forState:](self->_appearanceStorage, "setSearchFieldBackgroundImage:forState:", v11, 2 * (a4 != 0));
    -[_UISearchBarVisualProviderIOS updateSearchFieldArt](self, "updateSearchFieldArt");
    v6 = v11;
  }
LABEL_7:

}

- (id)searchFieldBackgroundImageForState:(unint64_t)a3
{
  return -[_UISearchBarAppearanceStorage searchFieldBackgroundImageForState:](self->_appearanceStorage, "searchFieldBackgroundImageForState:", 2 * (a3 != 0));
}

- (id)internalImageForSearchBarIcon:(int64_t)a3 state:(unint64_t)a4
{
  return -[_UISearchBarVisualProviderIOS internalImageForSearchBarIcon:state:customImage:](self, "internalImageForSearchBarIcon:state:customImage:", a3, a4, 0);
}

- (void)setImage:(id)a3 forSearchBarIcon:(int64_t)a4 state:(unint64_t)a5
{
  void *v8;
  _UISearchBarAppearanceStorage *appearanceStorage;
  _UISearchBarAppearanceStorage *v10;
  _UISearchBarAppearanceStorage *v11;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    appearanceStorage = self->_appearanceStorage;
    if (v14)
    {
      if (!appearanceStorage)
      {
        v10 = objc_alloc_init(_UISearchBarAppearanceStorage);
        v11 = self->_appearanceStorage;
        self->_appearanceStorage = v10;

        appearanceStorage = self->_appearanceStorage;
      }
    }
    else if (!appearanceStorage)
    {
      goto LABEL_14;
    }
    if (a5 >= 3)
      a5 = 1;
    -[_UISearchBarAppearanceStorage imageForIcon:state:](appearanceStorage, "imageForIcon:state:", a4, a5);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v12 != v14)
    {
      -[_UISearchBarAppearanceStorage setImage:forIcon:state:](self->_appearanceStorage, "setImage:forIcon:state:", v14, a4, a5);
      if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        -[_UISearchBarVisualProviderIOS updateRightView](self, "updateRightView");
      }
      else if (a4)
      {
        objc_msgSend(v8, "_searchBarTextField");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_setClearButtonImage:forState:", v14, a5);

      }
      else
      {
        -[_UISearchBarVisualProviderIOS updateMagnifyingGlassView](self, "updateMagnifyingGlassView");
      }
    }
  }
LABEL_14:

}

- (id)imageForSearchBarIcon:(int64_t)a3 state:(unint64_t)a4
{
  _UISearchBarAppearanceStorage *appearanceStorage;

  appearanceStorage = self->_appearanceStorage;
  if (a4 >= 3)
    a4 = 1;
  return -[_UISearchBarAppearanceStorage imageForIcon:state:](appearanceStorage, "imageForIcon:state:", a3, a4);
}

- (void)setScopeBarBackgroundImage:(id)a3
{
  id v4;
  _UISearchBarAppearanceStorage *appearanceStorage;
  _UISearchBarAppearanceStorage *v6;
  _UISearchBarAppearanceStorage *v7;
  id v8;
  id v9;

  v4 = a3;
  if (v4 || self->_scopeBar)
  {
    v9 = v4;
    appearanceStorage = self->_appearanceStorage;
    if (!appearanceStorage)
    {
      v6 = objc_alloc_init(_UISearchBarAppearanceStorage);
      v7 = self->_appearanceStorage;
      self->_appearanceStorage = v6;

      appearanceStorage = self->_appearanceStorage;
    }
    -[_UISearchBarAppearanceStorage scopeBarBackgroundImage](appearanceStorage, "scopeBarBackgroundImage");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 != v9)
      -[_UISearchBarAppearanceStorage setScopeBarBackgroundImage:](self->_appearanceStorage, "setScopeBarBackgroundImage:", v9);
    -[_UISearchBarVisualProviderIOS setUpScopeBar](self, "setUpScopeBar");
    v4 = v9;
  }

}

- (id)scopeBarBackgroundImage
{
  return -[_UISearchBarAppearanceStorage scopeBarBackgroundImage](self->_appearanceStorage, "scopeBarBackgroundImage");
}

- (void)setSearchFieldBackgroundPositionAdjustment:(UIOffset)a3
{
  double vertical;
  double horizontal;
  void *v6;
  _UISearchBarAppearanceStorage *appearanceStorage;
  _UISearchBarAppearanceStorage *v8;
  _UISearchBarAppearanceStorage *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  _UISearchBarAppearanceStorage *v15;
  void *v16;
  _QWORD v17[2];

  vertical = a3.vertical;
  horizontal = a3.horizontal;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    appearanceStorage = self->_appearanceStorage;
    if (!appearanceStorage)
    {
      if (horizontal == 0.0 && vertical == 0.0)
        goto LABEL_15;
      v8 = objc_alloc_init(_UISearchBarAppearanceStorage);
      v9 = self->_appearanceStorage;
      self->_appearanceStorage = v8;

      appearanceStorage = self->_appearanceStorage;
    }
    -[_UISearchBarAppearanceStorage searchFieldPositionAdjustment](appearanceStorage, "searchFieldPositionAdjustment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "UIOffsetValue");
    }
    else
    {
      v12 = 0.0;
      v13 = 0.0;
    }
    if (horizontal != v12 || vertical != v13)
    {
      v15 = self->_appearanceStorage;
      *(double *)v17 = horizontal;
      *(double *)&v17[1] = vertical;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v17, "{UIOffset=dd}");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UISearchBarAppearanceStorage setSearchFieldPositionAdjustment:](v15, "setSearchFieldPositionAdjustment:", v16);

      objc_msgSend(v6, "setNeedsLayout");
    }

  }
LABEL_15:

}

- (UIOffset)searchFieldBackgroundPositionAdjustment
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIOffset result;

  -[_UISearchBarAppearanceStorage searchFieldPositionAdjustment](self->_appearanceStorage, "searchFieldPositionAdjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "UIOffsetValue");
    v5 = v4;
    v7 = v6;
  }
  else
  {
    v5 = 0.0;
    v7 = 0.0;
  }

  v8 = v5;
  v9 = v7;
  result.vertical = v9;
  result.horizontal = v8;
  return result;
}

- (void)setBackgroundImage:(id)a3 forBarPosition:(int64_t)a4 barMetrics:(int64_t)a5
{
  -[UISearchBarBackground _setBackgroundImage:forBarPosition:barMetrics:](self->_searchBarBackground, "_setBackgroundImage:forBarPosition:barMetrics:", a3, a4, a5);
  -[_UISearchBarVisualProviderIOS updateNeedForBackdrop](self, "updateNeedForBackdrop");
}

- (id)backgroundImageForBarPosition:(int64_t)a3 barMetrics:(int64_t)a4
{
  return -[UISearchBarBackground _backgroundImageForBarPosition:barMetrics:](self->_searchBarBackground, "_backgroundImageForBarPosition:barMetrics:", a3, a4);
}

- (BOOL)hasDarkUIAppearance
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceStyle");

    v6 = objc_msgSend(v3, "keyboardAppearance");
    v7 = 0;
    if (v6 <= 8)
    {
      if (v6)
      {
        if (v6 != 1)
          goto LABEL_11;
        goto LABEL_9;
      }
LABEL_10:
      v7 = v5 == 2;
      goto LABEL_11;
    }
    if (v6 == 10)
      goto LABEL_10;
    if (v6 == 9)
LABEL_9:
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }
LABEL_11:

  return v7;
}

- (id)textColor
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v7;
  void *v8;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (self->_backdropStyle)
    {
      -[_UISearchBarVisualProviderIOS colorForComponent:disabled:](self, "colorForComponent:disabled:", 4, 0);
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!-[_UISearchBarVisualProviderIOS barStyle](self, "barStyle"))
      {
        objc_msgSend(v3, "_searchBarTextField");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "visualStyle");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "defaultTextColor");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_8;
      }
      +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.47, 1.0);
      v4 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    +[UIColor labelColor](UIColor, "labelColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
LABEL_8:

  return v5;
}

- (void)_setBarTintColor:(id)a3
{
  int v4;
  void *v5;
  id obj;

  obj = a3;
  v4 = dyld_program_sdk_at_least();
  v5 = obj;
  if (v4)
  {
    objc_msgSend(obj, "colorWithAlphaComponent:", 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)&self->_barTintColor, v5);
  if (v4)

}

- (void)setBarTintColor:(id)a3 forceUpdate:(BOOL)a4
{
  if (self->_barTintColor != a3 || a4)
  {
    -[_UISearchBarVisualProviderIOS _setBarTintColor:](self, "_setBarTintColor:");
    -[_UISearchBarVisualProviderIOS effectiveBarTintColorDidChange:](self, "effectiveBarTintColorDidChange:", 1);
  }
}

- (void)effectiveBarTintColorDidChange:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags;
  void *v7;
  void *v8;
  void *v9;
  UIImageView *separator;
  void *v11;
  id v12;

  v3 = a3;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v12 = v5;
    searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    -[_UISearchBarVisualProviderIOS effectiveBarTintColor](self, "effectiveBarTintColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x20000) != 0)
    {
      _GetLightenedTintColor(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISearchBarBackground setBarTintColor:](self->_searchBarBackground, "setBarTintColor:", v9);

    }
    else
    {
      -[UISearchBarBackground setBarTintColor:](self->_searchBarBackground, "setBarTintColor:", v7);
    }

    if (self->_cancelButton)
      -[_UISearchBarVisualProviderIOS setUpCancelButtonWithAppearance:](self, "setUpCancelButtonWithAppearance:", 0);
    if (self->_promptLabel)
      -[_UISearchBarVisualProviderIOS setUpPromptLabel](self, "setUpPromptLabel");
    if (v3)
    {
      -[_UISearchBarVisualProviderIOS updateSearchFieldArt](self, "updateSearchFieldArt");
      -[_UISearchBarVisualProviderIOS updateMagnifyingGlassView](self, "updateMagnifyingGlassView");
      separator = self->_separator;
      if (separator)
      {
        -[_UISearchBarVisualProviderIOS currentSeparatorImage](self, "currentSeparatorImage");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView setImage:](separator, "setImage:", v11);

      }
    }
    -[_UISearchBarVisualProviderIOS updateScopeBarBackground](self, "updateScopeBarBackground");
    v5 = v12;
  }

}

- (id)effectiveBarTintColor
{
  return self->_barTintColor;
}

- (void)updateCancelButtonForDynamicType
{
  UIButton *cancelButton;
  void *v4;

  if (-[_UISearchBarVisualProviderIOS supportsDynamicType](self, "supportsDynamicType"))
  {
    cancelButton = self->_cancelButton;
    v4 = (void *)objc_opt_new();
    -[UIView addInteraction:](cancelButton, "addInteraction:", v4);

  }
  -[UIView setShowsLargeContentViewer:](self->_cancelButton, "setShowsLargeContentViewer:", 1);
}

- (void)updateForDynamicType
{
  void *v3;
  id v4;

  -[_UISearchBarVisualProviderIOS updateSearchFieldForDynamicType](self, "updateSearchFieldForDynamicType");
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_searchBarTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISearchBarVisualProviderIOS updateDictationButtonForDynamicTypeWithSearchField:](self, "updateDictationButtonForDynamicTypeWithSearchField:", v3);

}

- (void)updateForDrawsBackgroundInPalette
{
  unint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v4, OS_LOG_TYPE_FAULT, "Incorrect code path for UISearchBar in navigation palette. This is a UIKit bug.", buf, 2u);
    }

  }
  else
  {
    v2 = updateForDrawsBackgroundInPalette___s_category;
    if (!updateForDrawsBackgroundInPalette___s_category)
    {
      v2 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v2, (unint64_t *)&updateForDrawsBackgroundInPalette___s_category);
    }
    v3 = *(NSObject **)(v2 + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "Incorrect code path for UISearchBar in navigation palette. This is a UIKit bug.", v5, 2u);
    }
  }
}

- (void)updateScopeBarForSelectedScope
{
  -[UISegmentedControl setSelectedSegmentIndex:](self->_scopeBar, "setSelectedSegmentIndex:", self->_selectedScope);
}

- (void)dictationControllerDidFinish:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUseAutomaticEndpointing:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("UIDictationControllerDictationDidFinish"), 0);

  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissSoftwareKeyboardIfNeeded");

}

- (void)dictationButtonPressed:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_searchBarTextField");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v9);

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDictationInputModeOptions dictationInputModeOptionsWithInvocationSource:](UIDictationInputModeOptions, "dictationInputModeOptionsWithInvocationSource:", CFSTR("UIDictationInputModeInvocationSourceMicButtonMicButtonInFirstResponderSearchBar"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66___UISearchBarVisualProviderIOS_dictationButtonPressed_withEvent___block_invoke;
  v12[3] = &unk_1E16B3F40;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v10, "toggleDictationForResponder:withOption:firstResponderSetupCompletion:", v8, v11, v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)cleanUpDictationMicsWithSearchField:(id)a3
{
  void *v4;
  char isKindOfClass;
  UIDictationSearchButton *dictationButton;
  id v7;

  v7 = a3;
  if (v7)
  {
    objc_msgSend(v7, "rightView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      objc_msgSend(v7, "setRightView:", 0);
  }
  -[UIView removeFromSuperview](self->_dictationButton, "removeFromSuperview");
  dictationButton = self->_dictationButton;
  self->_dictationButton = 0;

  objc_msgSend(v7, "setShowDictationButton:", 0);
}

- (void)setDisableDictationButton:(BOOL)a3
{
  -[_UISearchBarVisualProviderIOS setShowDictationButton:shouldUpdateView:](self, "setShowDictationButton:shouldUpdateView:", !a3, 1);
}

- (void)setUpCancelButton
{
  -[_UISearchBarVisualProviderIOS setUpCancelButtonWithAppearance:](self, "setUpCancelButtonWithAppearance:", 0);
}

- (void)setUpCancelButtonWithAppearance:(id)a3
{
  void *v4;
  UIButton *cancelButton;
  NSString *v6;
  UINavigationButton *v7;
  void *v8;
  UIButton *v9;
  UIButton *v10;
  _BOOL8 v11;
  id v12;

  v12 = a3;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[_UISearchBarVisualProviderIOS setUpSearchBarSearchContainerIfNecessary](self, "setUpSearchBarSearchContainerIfNecessary");
    cancelButton = self->_cancelButton;
    if (cancelButton)
    {
      -[UIButton setBarStyle:](cancelButton, "setBarStyle:", *(_QWORD *)&self->_searchBarVisualProviderFlags & 7);
      -[_UISearchBarVisualProviderIOS effectiveBarTintColor](self, "effectiveBarTintColor");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      -[UIButton _setTintColor:](self->_cancelButton, "_setTintColor:", v6);
    }
    else
    {
      v6 = self->_cancelButtonText;
      if (!v6)
      {
        _UINSLocalizedStringWithDefaultValue(CFSTR("Cancel"), CFSTR("Cancel"));
        v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      v7 = [UINavigationButton alloc];
      -[_UISearchBarVisualProviderIOS effectiveBarTintColor](self, "effectiveBarTintColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[UINavigationButton initWithValue:width:style:barStyle:possibleTitles:tintColor:](v7, "initWithValue:width:style:barStyle:possibleTitles:tintColor:", v6, 3, 0, 0, v8, 0.0);
      v10 = self->_cancelButton;
      self->_cancelButton = v9;

      -[UIButton _setAppearanceGuideClass:](self->_cancelButton, "_setAppearanceGuideClass:", objc_opt_class());
      -[UIControl addTarget:action:forControlEvents:](self->_cancelButton, "addTarget:action:forControlEvents:", v4, sel__cancelButtonPressed, 64);
      v11 = (objc_msgSend(v4, "isFirstResponder") & 1) != 0
         || (*((_BYTE *)&self->_searchBarVisualProviderFlags + 2) & 8) == 0;
      -[UIButton setEnabled:](self->_cancelButton, "setEnabled:", v11);
      -[_UISearchBarVisualProviderIOS updateCancelButtonForDynamicType](self, "updateCancelButtonForDynamicType");
      -[UIView addSubview:](self->_searchFieldContainerView, "addSubview:", self->_cancelButton);
      -[_UISearchBarSearchContainerView setNeedsLayout](self->_searchFieldContainerView, "setNeedsLayout");
      -[_UISearchBarScopeContainerView setNeedsLayout](self->_scopeBarContainerView, "setNeedsLayout");
      objc_msgSend(v4, "setNeedsLayout");
    }

    if (v12)
      -[UIButton _applyBarButtonAppearanceStorage:withTaggedSelectors:](self->_cancelButton, "_applyBarButtonAppearanceStorage:withTaggedSelectors:", v12, 0);
  }

}

- (void)setUpLeftButton
{
  void *v3;
  void *v4;
  UINavigationButton *v5;
  void *v6;
  UINavigationButton *v7;
  UINavigationButton *leftButton;
  id v9;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v9 = v3;
    if (self->_leftButton)
    {
      -[_UISearchBarVisualProviderIOS effectiveBarTintColor](self, "effectiveBarTintColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[UINavigationButton _setTintColor:](self->_leftButton, "_setTintColor:", v4);

    }
    else
    {
      v5 = [UINavigationButton alloc];
      -[_UISearchBarVisualProviderIOS effectiveBarTintColor](self, "effectiveBarTintColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[UINavigationButton initWithValue:width:style:barStyle:possibleTitles:tintColor:](v5, "initWithValue:width:style:barStyle:possibleTitles:tintColor:", CFSTR("<configure>"), 3, 0, 0, v6, 0.0);
      leftButton = self->_leftButton;
      self->_leftButton = v7;

      -[UINavigationButton _setAppearanceGuideClass:](self->_leftButton, "_setAppearanceGuideClass:", objc_opt_class());
      -[UIView addSubview:](self->_searchFieldContainerView, "addSubview:", self->_leftButton);
      objc_msgSend(v9, "setNeedsLayout");
    }
    v3 = v9;
  }

}

- (void)setUpPromptLabel
{
  void *v3;
  UIColor *v4;
  void *v5;
  UIColor *v6;
  void *v7;
  UIColor *v8;
  void *v9;
  UIColor *v10;
  void *v11;
  UILabel *v12;
  UILabel *promptLabel;
  void *v14;
  _UISearchBarPromptContainerView *v15;
  _UISearchBarPromptContainerView *v16;
  _UISearchBarPromptContainerView *promptContainerView;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  double v24;
  void *v25;
  uint64_t v26;
  id v27;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v27 = v3;
    if (!_MergedGlobals_61)
    {
      v4 = -[UIColor initWithRed:green:blue:alpha:]([UIColor alloc], "initWithRed:green:blue:alpha:", 0.168, 0.243, 0.353, 1.0);
      v5 = (void *)_MergedGlobals_61;
      _MergedGlobals_61 = (uint64_t)v4;

    }
    if (!qword_1ECD795A0)
    {
      v6 = -[UIColor initWithWhite:alpha:]([UIColor alloc], "initWithWhite:alpha:", 1.0, 0.44);
      v7 = (void *)qword_1ECD795A0;
      qword_1ECD795A0 = (uint64_t)v6;

    }
    if (!qword_1ECD795A8)
    {
      v8 = -[UIColor initWithWhite:alpha:]([UIColor alloc], "initWithWhite:alpha:", 1.0, 0.6);
      v9 = (void *)qword_1ECD795A8;
      qword_1ECD795A8 = (uint64_t)v8;

    }
    if (!qword_1ECD795B0)
    {
      v10 = -[UIColor initWithWhite:alpha:]([UIColor alloc], "initWithWhite:alpha:", 0.0, 1.0);
      v11 = (void *)qword_1ECD795B0;
      qword_1ECD795B0 = (uint64_t)v10;

    }
    if (!self->_promptLabel)
    {
      v12 = objc_alloc_init(UILabel);
      promptLabel = self->_promptLabel;
      self->_promptLabel = v12;

      objc_msgSend(off_1E167A828, "systemFontOfSize:", 14.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](self->_promptLabel, "setFont:", v14);

      -[UILabel setNumberOfLines:](self->_promptLabel, "setNumberOfLines:", 1);
      -[UILabel setTextAlignment:](self->_promptLabel, "setTextAlignment:", 1);
      -[UIView setBackgroundColor:](self->_promptLabel, "setBackgroundColor:", 0);
      -[UIView setOpaque:](self->_promptLabel, "setOpaque:", 0);
      v15 = [_UISearchBarPromptContainerView alloc];
      objc_msgSend(v27, "bounds");
      v16 = -[UIView initWithFrame:](v15, "initWithFrame:");
      promptContainerView = self->_promptContainerView;
      self->_promptContainerView = v16;

      -[UIView setAutoresizingMask:](self->_promptContainerView, "setAutoresizingMask:", 2);
      objc_msgSend(v27, "addSubview:", self->_promptContainerView);
      -[UIView addSubview:](self->_promptContainerView, "addSubview:", self->_promptLabel);
      -[_UISearchBarPromptContainerView setPromptLabel:](self->_promptContainerView, "setPromptLabel:", self->_promptLabel);
    }
    v18 = (id)_MergedGlobals_61;
    v19 = (id)qword_1ECD795A0;
    -[_UISearchBarVisualProviderIOS effectiveBarTintColor](self, "effectiveBarTintColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[_UISearchBarVisualProviderIOS effectiveBarTintColor](self, "effectiveBarTintColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      _GetLightenedTintColor(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      GetTintedPromptTextColor(v22);
      v23 = (id)objc_claimAutoreleasedReturnValue();

      v24 = 1.0;
    }
    else
    {
      if ((*(_BYTE *)&self->_searchBarVisualProviderFlags & 7) == 0)
      {
        objc_msgSend(v27, "traitCollection");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "userInterfaceStyle");

        if (v26 != 2)
        {
          v24 = 1.0;
          goto LABEL_18;
        }
      }
      v23 = (id)qword_1ECD795A8;

      v21 = v19;
      v24 = -1.0;
      v19 = (id)qword_1ECD795B0;
    }

    v18 = v23;
LABEL_18:
    -[UILabel setTextColor:](self->_promptLabel, "setTextColor:", v18);
    -[UILabel setShadowColor:](self->_promptLabel, "setShadowColor:", v19);
    -[UILabel setShadowOffset:](self->_promptLabel, "setShadowOffset:", 0.0, v24);

    v3 = v27;
  }

}

- (void)setUpScopeBar
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  float v8;
  UISegmentedControl *v9;
  UISegmentedControl *scopeBar;
  UISegmentedControl *v11;
  double v12;
  _UISearchBarScopeContainerView *v13;
  _UISearchBarScopeContainerView *scopeBarContainerView;
  _UISearchBarScopeBarBackground *v15;
  _UISearchBarScopeBarBackground *v16;
  _UISearchBarScopeBarBackground *scopeBarBackgroundView;
  id v18;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (v18 && !-[_UISearchBarVisualProviderIOS isTextFieldManagedInNSToolbar](self, "isTextFieldManagedInNSToolbar"))
  {
    if (!self->_scopeBar)
    {
      objc_msgSend(v18, "sizeToFit");
      objc_msgSend(v18, "bounds");
      v4 = v3;
      v6 = v5;
      +[UISegmentedControl defaultHeightForStyle:size:](UISegmentedControl, "defaultHeightForStyle:size:", 7, 0);
      v8 = v7;
      v9 = -[UISegmentedControl initWithFrame:withStyle:withItems:]([UISegmentedControl alloc], "initWithFrame:withStyle:withItems:", 7, self->_scopeTitles, 0.0, v6 - v8, v4);
      scopeBar = self->_scopeBar;
      self->_scopeBar = v9;
      v11 = v9;

      -[UISegmentedControl setSelectedSegmentIndex:](v11, "setSelectedSegmentIndex:", self->_selectedScope);
      -[UIControl addTarget:action:forControlEvents:](v11, "addTarget:action:forControlEvents:", v18, sel__scopeChanged_, 4096);
      -[UISegmentedControl setBarStyle:](v11, "setBarStyle:", *(_QWORD *)&self->_searchBarVisualProviderFlags & 7);
      -[_UISearchBarVisualProviderIOS scopeBarHeight](self, "scopeBarHeight");
      v13 = -[_UISearchBarScopeContainerView initWithFrame:]([_UISearchBarScopeContainerView alloc], "initWithFrame:", 0.0, v6 - v12, v4, v12);
      scopeBarContainerView = self->_scopeBarContainerView;
      self->_scopeBarContainerView = v13;

      -[UIView setAutoresizingMask:](self->_scopeBarContainerView, "setAutoresizingMask:", 2);
      v15 = [_UISearchBarScopeBarBackground alloc];
      -[UIView bounds](self->_scopeBarContainerView, "bounds");
      v16 = -[UIImageView initWithFrame:](v15, "initWithFrame:");
      scopeBarBackgroundView = self->_scopeBarBackgroundView;
      self->_scopeBarBackgroundView = v16;

      -[UIView setAutoresizingMask:](self->_scopeBarBackgroundView, "setAutoresizingMask:", 18);
      -[UIView addSubview:](self->_scopeBarContainerView, "addSubview:", self->_scopeBarBackgroundView);
      -[_UISearchBarVisualProviderIOS updateScopeBarBackground](self, "updateScopeBarBackground");
      -[UIView setAutoresizingMask:](v11, "setAutoresizingMask:", 2);
      -[UIView addSubview:](self->_scopeBarContainerView, "addSubview:", v11);

      -[_UISearchBarVisualProviderIOS _establishScopeBarInSearchBarIfNecessary]((uint64_t)self);
    }
    -[_UISearchBarVisualProviderIOS updateScopeBarBackground](self, "updateScopeBarBackground");
  }

}

- (id)floatingSearchIconViewSuitableForMeasuring
{
  UIImageView *floatingSearchIconView;
  void *v4;
  void *v5;
  UIImageView *v6;
  UIImageView *v7;

  floatingSearchIconView = self->_floatingSearchIconView;
  if (!floatingSearchIconView)
  {
    -[_UISearchBarVisualProviderIOS searchIconBarButtonItem](self, "searchIconBarButtonItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v5);
    v7 = self->_floatingSearchIconView;
    self->_floatingSearchIconView = v6;

    floatingSearchIconView = self->_floatingSearchIconView;
  }
  return floatingSearchIconView;
}

- (void)setUpFloatingSearchIconView
{
  void *v3;
  $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags;
  UIImageView *v5;
  UIImageView *floatingSearchIconView;
  id v7;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x8000000) != 0
      && ((*(_QWORD *)&searchBarVisualProviderFlags & 0x1000000000) == 0 || !self->_floatingSearchIconView))
    {
      v7 = v3;
      -[_UISearchBarVisualProviderIOS setUpSearchBarSearchContainerIfNecessary](self, "setUpSearchBarSearchContainerIfNecessary");
      -[_UISearchBarVisualProviderIOS floatingSearchIconViewSuitableForMeasuring](self, "floatingSearchIconViewSuitableForMeasuring");
      v5 = (UIImageView *)objc_claimAutoreleasedReturnValue();
      floatingSearchIconView = self->_floatingSearchIconView;
      self->_floatingSearchIconView = v5;

      -[UIView addSubview:](self->_searchFieldContainerView, "addSubview:", self->_floatingSearchIconView);
      -[_UISearchBarSearchContainerView setNeedsLayout](self->_searchFieldContainerView, "setNeedsLayout");
      v3 = v7;
      *(_QWORD *)&self->_searchBarVisualProviderFlags |= 0x1000000000uLL;
    }
  }

}

- (void)driveTransitionToSearchLayoutState:(int64_t)a3
{
  _QWORD *v5;
  _QWORD *v6;
  _QWORD v7[4];
  id v8;
  _UISearchBarVisualProviderIOS *v9;
  int64_t v10;
  _QWORD v11[6];

  if (self->_layoutState != a3)
  {
    -[_UISearchBarVisualProviderIOS prepareForTransitionToSearchLayoutState:](self, "prepareForTransitionToSearchLayoutState:");
    -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
    v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v5[13] |= 2uLL;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __68___UISearchBarVisualProviderIOS_driveTransitionToSearchLayoutState___block_invoke;
    v11[3] = &unk_1E16B1888;
    v11[4] = self;
    v11[5] = a3;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __68___UISearchBarVisualProviderIOS_driveTransitionToSearchLayoutState___block_invoke_2;
    v7[3] = &unk_1E16B7138;
    v6 = v5;
    v8 = v6;
    v9 = self;
    v10 = a3;
    if (+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
    {
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v11, v7, 0.25, 0.0);
    }
    else
    {
      -[_UISearchBarVisualProviderIOS animateTransitionToSearchLayoutState:](self, "animateTransitionToSearchLayoutState:", a3);
      v6[13] &= ~2uLL;
      if (self->_previousLayoutState != a3)
        -[_UISearchBarVisualProviderIOS completeTransitionToSearchLayoutState:](self, "completeTransitionToSearchLayoutState:", a3);
    }

  }
}

- (void)prepareForTransitionToSearchLayoutState:(int64_t)a3
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  int64_t layoutState;
  id v15;
  __objc2_class **v16;
  id v17;
  unint64_t v18;
  NSObject *v19;
  const __CFString *v20;
  const __CFString *v21;
  NSObject *v22;
  unint64_t v23;
  NSObject *v24;
  const __CFString *v25;
  const __CFString *v26;
  NSObject *v27;
  _UISearchBarTransitionerBase *v28;
  _UISearchBarTransitionerBase *transitioner;
  void *v30;
  const __CFString *v31;
  NSObject *v32;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  _BYTE v36[24];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    goto LABEL_60;
  objc_msgSend(v6, "_searchController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISearchBarVisualProviderIOS.m"), 2399, CFSTR("layoutState transitions for a search bar without a search controller are not supported. This is an internal UIKit bug."));

  }
  objc_msgSend(v7, "_searchController");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    if (a3 != 3)
      goto LABEL_15;
    goto LABEL_14;
  }
  v10 = (void *)v9;
  v11 = ((unint64_t)*(unsigned int *)(v9 + 1044) >> 5) & 3;
  if (!(_DWORD)v11)
  {
    if (dyld_program_sdk_at_least())
      v11 = 2;
    else
      v11 = 3;
  }

  if (a3 == 3 && v11 != 1)
  {
    if (v11 == 2)
    {
      objc_msgSend(v7, "_searchBarTextField");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UISearchBarVisualProviderIOS setActiveSearchDeferringScopeBar:](self, "setActiveSearchDeferringScopeBar:", objc_msgSend(v12, "_hasContent") ^ 1);

      goto LABEL_15;
    }
LABEL_14:
    -[_UISearchBarVisualProviderIOS setActiveSearchDeferringScopeBar:](self, "setActiveSearchDeferringScopeBar:", 0);
  }
LABEL_15:
  layoutState = self->_layoutState;
  if (self->_transitioner)
  {
    -[_UISearchBarVisualProviderIOS cancelTransitionToSearchLayoutState:](self, "cancelTransitionToSearchLayoutState:", self->_layoutState);
    layoutState = self->_layoutState;
    if (layoutState == a3)
      goto LABEL_60;
  }
  if (!layoutState)
  {
    self->_previousLayoutState = 2;
    self->_layoutState = 2;
    v17 = v7;
LABEL_25:
    layoutState = 2;
    if (a3 == 1)
    {
      v16 = off_1E167CD58;
    }
    else
    {
      if (a3 != 3)
        goto LABEL_31;
      v16 = off_1E167CD50;
      layoutState = 2;
    }
    goto LABEL_56;
  }
  v15 = v7;
  if (layoutState == 3)
  {
    if ((unint64_t)(a3 - 1) >= 2)
      goto LABEL_31;
    v16 = off_1E167CD40;
    goto LABEL_56;
  }
  if (layoutState == 2)
    goto LABEL_25;
  if (layoutState != 1)
    goto LABEL_31;
  if (a3 != 2)
  {
    if (a3 == 3)
    {
      v16 = off_1E167CD50;
      layoutState = 1;
      goto LABEL_56;
    }
LABEL_31:
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        if ((unint64_t)(layoutState + 1) > 4)
          v31 = CFSTR("Unknown _UISearchBarLayoutState");
        else
          v31 = off_1E16B71A0[layoutState + 1];
        if ((unint64_t)(a3 + 1) > 4)
          v34 = CFSTR("Unknown _UISearchBarLayoutState");
        else
          v34 = off_1E16B71C8[a3 + 1];
        *(_DWORD *)v36 = 138412546;
        *(_QWORD *)&v36[4] = v31;
        *(_WORD *)&v36[12] = 2112;
        *(_QWORD *)&v36[14] = v34;
        _os_log_fault_impl(&dword_185066000, v22, OS_LOG_TYPE_FAULT, "UISearchBar transition from %@ to %@ is not supported. This is an internal UIKit problem.", v36, 0x16u);
      }
    }
    else
    {
      v18 = qword_1ECD795C8;
      if (!qword_1ECD795C8)
      {
        v18 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v18, (unint64_t *)&qword_1ECD795C8);
      }
      v19 = *(NSObject **)(v18 + 8);
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        goto LABEL_43;
      if ((unint64_t)(layoutState + 1) > 4)
        v20 = CFSTR("Unknown _UISearchBarLayoutState");
      else
        v20 = off_1E16B71A0[layoutState + 1];
      if ((unint64_t)(a3 + 1) > 4)
        v21 = CFSTR("Unknown _UISearchBarLayoutState");
      else
        v21 = off_1E16B71C8[a3 + 1];
      *(_DWORD *)v36 = 138412546;
      *(_QWORD *)&v36[4] = v20;
      *(_WORD *)&v36[12] = 2112;
      *(_QWORD *)&v36[14] = v21;
      v22 = v19;
      _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_ERROR, "UISearchBar transition from %@ to %@ is not supported. This is an internal UIKit problem.", v36, 0x16u);
    }

LABEL_43:
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      {
        if ((unint64_t)(layoutState + 1) > 4)
          v33 = CFSTR("Unknown _UISearchBarLayoutState");
        else
          v33 = off_1E16B71A0[layoutState + 1];
        if ((unint64_t)(a3 + 1) > 4)
          v35 = CFSTR("Unknown _UISearchBarLayoutState");
        else
          v35 = off_1E16B71C8[a3 + 1];
        *(_DWORD *)v36 = 138412546;
        *(_QWORD *)&v36[4] = v33;
        *(_WORD *)&v36[12] = 2112;
        *(_QWORD *)&v36[14] = v35;
        _os_log_fault_impl(&dword_185066000, v32, OS_LOG_TYPE_FAULT, "TODO: create and implement a transitioner for %@ to %@. This is an internal UIKit task.", v36, 0x16u);
      }

    }
    else
    {
      v23 = qword_1ECD795D0;
      if (!qword_1ECD795D0)
      {
        v23 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v23, (unint64_t *)&qword_1ECD795D0);
      }
      v24 = *(NSObject **)(v23 + 8);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        if ((unint64_t)(layoutState + 1) > 4)
          v25 = CFSTR("Unknown _UISearchBarLayoutState");
        else
          v25 = off_1E16B71A0[layoutState + 1];
        if ((unint64_t)(a3 + 1) > 4)
          v26 = CFSTR("Unknown _UISearchBarLayoutState");
        else
          v26 = off_1E16B71C8[a3 + 1];
        *(_DWORD *)v36 = 138412546;
        *(_QWORD *)&v36[4] = v25;
        *(_WORD *)&v36[12] = 2112;
        *(_QWORD *)&v36[14] = v26;
        v27 = v24;
        _os_log_impl(&dword_185066000, v27, OS_LOG_TYPE_ERROR, "TODO: create and implement a transitioner for %@ to %@. This is an internal UIKit task.", v36, 0x16u);

      }
    }
    v28 = 0;
    goto LABEL_57;
  }
  v16 = off_1E167CD38;
LABEL_56:
  v28 = (_UISearchBarTransitionerBase *)objc_msgSend(objc_alloc(*v16), "initWithNewTransitionContextForSearchBar:", v7);
  if (!v28)
    goto LABEL_43;
LABEL_57:

  transitioner = self->_transitioner;
  self->_transitioner = v28;

  if (!self->_cancelButton)
    -[_UISearchBarVisualProviderIOS setUpCancelButton](self, "setUpCancelButton");
  self->_previousLayoutState = self->_layoutState;
  self->_layoutState = a3;
  -[_UISearchBarVisualProviderIOS configureLayout:forState:](self, "configureLayout:forState:", self->_prospectiveLayout, self->_previousLayoutState, *(_OWORD *)v36, *(_QWORD *)&v36[16]);
  -[_UISearchBarVisualProviderIOS configureLayout:](self, "configureLayout:", self->_currentLayout);
  -[_UISearchBarTransitionerBase transitionContext](self->_transitioner, "transitionContext");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setFromLayout:", self->_prospectiveLayout);
  objc_msgSend(v30, "setToLayout:", self->_currentLayout);
  -[_UISearchBarTransitionerBase prepare](self->_transitioner, "prepare");

LABEL_60:
}

- (void)freezeForAnimatedTransitionToSearchLayoutState:(int64_t)a3
{
  RaiseForUnexpectedLayoutState(a3, self->_layoutState);
  -[_UISearchBarSearchContainerView setFrozenLayout:](self->_searchFieldContainerView, "setFrozenLayout:", 1);
  if (a3 == 2)
    *(_QWORD *)&self->_searchBarVisualProviderFlags |= 0x10000uLL;
}

- (void)animateTransitionToSearchLayoutState:(int64_t)a3
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  RaiseForUnexpectedLayoutState(a3, self->_layoutState);
  v5 = -[_UISearchBarVisualProviderIOS isHostedInlineByNavigationBar](self, "isHostedInlineByNavigationBar");
  v6 = v5;
  if (a3 == 3 && v5)
    -[_UISearchBarVisualProviderIOS setRequiresSearchTextField:](self, "setRequiresSearchTextField:", 1);
  -[_UISearchBarTransitionerBase transitionContext](self->_transitioner, "transitionContext");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "toLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fromLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISearchBarVisualProviderIOS configureLayout:forState:](self, "configureLayout:forState:", v7, a3);
  if (v6)
  {
    -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invalidateIntrinsicContentSize");

  }
  if (-[_UISearchBarVisualProviderIOS searchFieldContainerViewNeedsLayoutForTransitionFromLayoutState:toLayout:](self, "searchFieldContainerViewNeedsLayoutForTransitionFromLayoutState:toLayout:", v8, v7))
  {
    -[_UISearchBarSearchContainerView setNeedsLayout](self->_searchFieldContainerView, "setNeedsLayout");
  }
  -[_UISearchBarTransitionerBase animate](self->_transitioner, "animate");

}

- (BOOL)searchFieldContainerViewNeedsLayoutForTransitionFromLayoutState:(id)a3 toLayout:(id)a4
{
  id v5;
  char v6;

  v5 = a4;
  LOBYTE(a3) = objc_msgSend(a3, "hasCancelButton");
  v6 = objc_msgSend(v5, "hasCancelButton");

  return a3 ^ v6;
}

- (void)_resetScopeBarFlagsAfterCompleteOrCancelTransition
{
  void *v2;
  unsigned int *v3;
  unsigned int v4;
  int v5;
  uint64_t v6;
  BOOL v7;
  unint64_t v8;
  unsigned int *v9;

  if (a1)
  {
    objc_msgSend(a1, "searchBar");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_searchController");
    v9 = (unsigned int *)objc_claimAutoreleasedReturnValue();

    v3 = v9;
    if (v9)
    {
      v4 = v9[261];
      v5 = (v4 >> 5) & 3;
      if (v5 == 1)
      {
LABEL_11:

        return;
      }
      if (!v5)
      {
        dyld_program_sdk_at_least();
        v3 = v9;
        v4 = v9[261];
      }
      v6 = (v4 >> 5) & 3;
      if (!(_DWORD)v6)
      {
        v7 = dyld_program_sdk_at_least() == 0;
        v3 = v9;
        v6 = 2;
        if (v7)
          v6 = 3;
      }
    }
    else
    {
      v6 = 0;
    }
    v8 = a1[19] & 0xFFFFFFFF7FFFFFFFLL | ((unint64_t)(v6 == 2) << 31);
    a1[19] = v8;
    if (v6 == 2)
      a1[19] = v8 & 0xFFFFFFFFBFFFFFFFLL;
    goto LABEL_11;
  }
}

- (void)completeTransitionToSearchLayoutState:(int64_t)a3
{
  _UISearchBarTransitionerBase *transitioner;
  void *v6;
  UISearchBarTextField *v7;
  UISearchBarTextField *searchField;
  void *v9;

  RaiseForUnexpectedLayoutState(a3, self->_layoutState);
  -[_UISearchBarSearchContainerView setFrozenLayout:](self->_searchFieldContainerView, "setFrozenLayout:", 0);
  *(_QWORD *)&self->_searchBarVisualProviderFlags &= ~0x10000uLL;
  -[_UISearchBarTransitionerBase complete](self->_transitioner, "complete");
  transitioner = self->_transitioner;
  self->_transitioner = 0;

  self->_previousLayoutState = self->_layoutState;
  if (a3 != 3)
  {
    -[_UISearchBarVisualProviderIOS _resetScopeBarFlagsAfterCompleteOrCancelTransition](self);
    if (a3 == 2)
    {
      -[UIView window](self->_searchField, "window");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstResponder");
      v7 = (UISearchBarTextField *)objc_claimAutoreleasedReturnValue();
      searchField = self->_searchField;

      if (v7 == searchField)
      {
        -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "resignFirstResponder");

        -[UISearchTextField setText:](self->_searchField, "setText:", &stru_1E16EDF20);
        -[UISearchTextField setTokens:](self->_searchField, "setTokens:", MEMORY[0x1E0C9AA60]);
      }
    }
  }
  -[_UISearchBarVisualProviderIOS setRequiresSearchTextField:](self, "setRequiresSearchTextField:", self->_layoutState == 3);
  -[_UISearchBarLayout prepareSearchContainerLayout](self->_currentLayout, "prepareSearchContainerLayout");
}

- (void)cancelTransitionToSearchLayoutState:(int64_t)a3
{
  _UISearchBarTransitionerBase *transitioner;

  -[_UISearchBarSearchContainerView setFrozenLayout:](self->_searchFieldContainerView, "setFrozenLayout:", 0);
  *(_QWORD *)&self->_searchBarVisualProviderFlags &= ~0x10000uLL;
  -[_UISearchBarTransitionerBase cancel](self->_transitioner, "cancel");
  transitioner = self->_transitioner;
  self->_transitioner = 0;

  self->_layoutState = self->_previousLayoutState;
  if (a3 == 3)
    -[_UISearchBarVisualProviderIOS _resetScopeBarFlagsAfterCompleteOrCancelTransition](self);
  -[_UISearchBarVisualProviderIOS configureLayout:](self, "configureLayout:", self->_currentLayout);
  -[_UISearchBarVisualProviderIOS setRequiresSearchTextField:](self, "setRequiresSearchTextField:", self->_layoutState == 3);
  if ((*((_BYTE *)&self->_searchBarVisualProviderFlags + 4) & 8) != 0)
    -[_UISearchBarLayout prepareSearchContainerLayout](self->_currentLayout, "prepareSearchContainerLayout");
}

- (void)growToSearchFieldIfNecessary
{
  void *v3;

  if (self->_layoutState == 1)
  {
    self->_previousLayoutState = 1;
    self->_layoutState = 2;
    -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidateIntrinsicContentSize");

    -[_UISearchBarSearchContainerView setNeedsLayout](self->_searchFieldContainerView, "setNeedsLayout");
  }
}

- (void)shrinkToButtonIfNecessary
{
  int64_t layoutState;
  void *v4;

  layoutState = self->_layoutState;
  if (layoutState != 1)
  {
    self->_previousLayoutState = layoutState;
    self->_layoutState = 1;
    -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidateIntrinsicContentSize");

    -[_UISearchBarSearchContainerView setNeedsLayout](self->_searchFieldContainerView, "setNeedsLayout");
  }
}

- (void)navigationBarSlideTransitionWillBegin
{
  unint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  if (-[_UISearchBarLayout isHostingNavBarTransitionActive](self->_currentLayout, "isHostingNavBarTransitionActive"))
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v5, OS_LOG_TYPE_FAULT, "Unexpected nesting of -navigationBarSlideTransitionWillBegin may result in incorrect visibility of search scope bar", buf, 2u);
      }

    }
    else
    {
      v3 = navigationBarSlideTransitionWillBegin___s_category;
      if (!navigationBarSlideTransitionWillBegin___s_category)
      {
        v3 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v3, (unint64_t *)&navigationBarSlideTransitionWillBegin___s_category);
      }
      v4 = *(NSObject **)(v3 + 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "Unexpected nesting of -navigationBarSlideTransitionWillBegin may result in incorrect visibility of search scope bar", v6, 2u);
      }
    }
  }
  -[_UISearchBarLayout setHostingNavBarTransitionActive:](self->_currentLayout, "setHostingNavBarTransitionActive:", 1);
}

- (void)navigationBarSlideTransitionDidEnd
{
  -[_UISearchBarLayout setHostingNavBarTransitionActive:](self->_currentLayout, "setHostingNavBarTransitionActive:", 0);
}

- (void)setShowsSeparator:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  UIImageView *separator;
  UIImageView *v7;
  void *v8;
  UIImageView *v9;
  UIImageView *v10;
  UIImageView *v11;
  void *v12;

  v3 = a3;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    separator = self->_separator;
    if (v3)
    {
      if (!separator)
      {
        v12 = v5;
        v7 = [UIImageView alloc];
        -[_UISearchBarVisualProviderIOS currentSeparatorImage](self, "currentSeparatorImage");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[UIImageView initWithImage:](v7, "initWithImage:", v8);
        v10 = self->_separator;
        self->_separator = v9;

        objc_msgSend(v12, "addSubview:", self->_separator);
        objc_msgSend(v12, "setNeedsLayout");
LABEL_7:
        v5 = v12;
      }
    }
    else if (separator)
    {
      v12 = v5;
      -[UIView removeFromSuperview](separator, "removeFromSuperview");
      v11 = self->_separator;
      self->_separator = 0;

      goto LABEL_7;
    }
  }

}

- (void)setShowsDeleteButton:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  UINavigationButton *v13;
  void *v14;
  UIButton *v15;
  UIButton *cancelButton;
  _BOOL8 v17;
  id v18;

  v3 = a3;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    if (((((*(_QWORD *)&searchBarVisualProviderFlags & 0x100000) == 0) ^ v3) & 1) == 0)
    {
      v18 = v5;
      v7 = 0x100000;
      if (!v3)
        v7 = 0;
      self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&searchBarVisualProviderFlags & 0xFFFFFFFFFFEFFFFFLL | v7);
      -[_UISearchBarVisualProviderIOS destroyCancelButton](self, "destroyCancelButton");
      if ((*((_BYTE *)&self->_searchBarVisualProviderFlags + 2) & 0x10) != 0)
      {
        objc_msgSend(v18, "_searchController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "traitCollection");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          v11 = v9;
        }
        else
        {
          objc_msgSend(v18, "traitCollection");
          v11 = (id)objc_claimAutoreleasedReturnValue();
        }
        v12 = v11;

        v13 = [UINavigationButton alloc];
        _UIImageWithNameAndTraitCollection(CFSTR("delete-on"), v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[UINavigationButton initWithImage:style:](v13, "initWithImage:style:", v14, 3);
        cancelButton = self->_cancelButton;
        self->_cancelButton = v15;

        -[UIButton _setAppearanceGuideClass:](self->_cancelButton, "_setAppearanceGuideClass:", objc_opt_class());
        -[UIControl addTarget:action:forControlEvents:](self->_cancelButton, "addTarget:action:forControlEvents:", v18, sel__deleteButtonPressed, 64);
        -[_UISearchBarVisualProviderIOS updateCancelButtonForDynamicType](self, "updateCancelButtonForDynamicType");
        -[_UISearchBarVisualProviderIOS setUpSearchBarSearchContainerIfNecessary](self, "setUpSearchBarSearchContainerIfNecessary");
        -[UIView addSubview:](self->_searchFieldContainerView, "addSubview:", self->_cancelButton);
        v17 = (objc_msgSend(v18, "isFirstResponder") & 1) != 0
           || (*((_BYTE *)&self->_searchBarVisualProviderFlags + 2) & 8) == 0;
        -[UIButton setEnabled:](self->_cancelButton, "setEnabled:", v17);
        -[_UISearchBarSearchContainerView setNeedsLayout](self->_searchFieldContainerView, "setNeedsLayout");

      }
      else
      {
        -[_UISearchBarVisualProviderIOS setUpCancelButton](self, "setUpCancelButton");
      }
      v5 = v18;
    }
  }

}

- (void)navigationBarTransitionWillBegin:(int64_t)a3 willBeDisplayed:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  double v8;
  UIView *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;

  v4 = a4;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = 1.0;
    if (v4)
      v8 = 0.0;
    v21 = v7;
    objc_msgSend(v7, "setAlpha:", v8);
    v7 = v21;
    if (a3 == 2)
    {
      v9 = self->_searchBarClippingView;
      objc_msgSend(v21, "bounds");
      v11 = v10;
      if (_UIBarsUseNewPadHeights())
        v12 = 50.0;
      else
        v12 = 56.0;
      -[UIView setFrame:](v9, "setFrame:", 0.0, 0.0, v11, v12);
      -[UIView setAutoresizingMask:](v9, "setAutoresizingMask:", 0);
      -[UIView bounds](v9, "bounds");
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;

      -[_UISearchBarVisualProviderIOS layoutSubviewsInBounds:](self, "layoutSubviewsInBounds:", v14, v16, v18, v20);
      v7 = v21;
    }
  }

}

- (void)navigationBarTransitionCompleted:(int64_t)a3 willBeDisplayed:(BOOL)a4
{
  void *v6;
  id v7;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "setAlpha:", 1.0);
    v6 = v7;
    if (a3 == 2)
    {
      objc_msgSend(v7, "bounds");
      -[UIView setFrame:](self->_searchBarClippingView, "setFrame:");
      -[UIView setAutoresizingMask:](self->_searchBarClippingView, "setAutoresizingMask:", 18);
      objc_msgSend(v7, "layoutSubviews");
      v6 = v7;
    }
  }

}

- (void)getTopAttachedTopInset:(double *)a3 bottomInset:(double *)a4 isCompact:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  v5 = a5;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v5)
    {
      *a3 = 7.0;
      *a4 = 7.0;
    }
    else
    {
      v12 = v8;
      if (_UIBarsUseNewPadHeights())
      {
        *a3 = 7.0;
        *a4 = 7.0;
      }
      else
      {
        *a3 = 4.0;
        objc_msgSend(v12, "_screen");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "_isEmbeddedScreen")
          || (objc_msgSend(v9, "_peripheryInsets"), v10 = 15.0, v11 <= 0.0))
        {
          v10 = 10.0;
        }
        *a4 = v10;

      }
      v8 = v12;
    }
  }

}

- (void)getTopInset:(double *)a3 bottomInset:(double *)a4 forBarMetrics:(int64_t)a5 barPosition:(int64_t)a6
{
  _UISearchBarTransitionerBase *transitioner;
  id v12;

  transitioner = self->_transitioner;
  if (transitioner)
  {
    -[_UISearchBarTransitionerBase activeLayout](transitioner, "activeLayout");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[_UISearchBarVisualProviderIOS getTopInset:bottomInset:forBarMetrics:barPosition:layoutState:](self, "getTopInset:bottomInset:forBarMetrics:barPosition:layoutState:", a3, a4, a5, a6, objc_msgSend(v12, "representedLayoutState"));

  }
  else
  {
    -[_UISearchBarVisualProviderIOS getTopInset:bottomInset:forBarMetrics:barPosition:layoutState:](self, "getTopInset:bottomInset:forBarMetrics:barPosition:layoutState:", a3, a4, a5, a6, self->_layoutState);
  }
}

- (void)getTopInset:(double *)a3 bottomInset:(double *)a4 forBarMetrics:(int64_t)a5 barPosition:(int64_t)a6 layoutState:(int64_t)a7
{
  -[_UISearchBarVisualProviderIOS getTopInset:bottomInset:forBarMetrics:barPosition:layoutState:forcingInlineCalculation:](self, "getTopInset:bottomInset:forBarMetrics:barPosition:layoutState:forcingInlineCalculation:", a3, a4, a5, a6, a7, 0);
}

- (void)getOverrideContentInsets:(UIEdgeInsets *)a3 overriddenEdges:(unint64_t *)a4
{
  UIEdgeInsets *p_contentInsetPrivateMinOrOverride;
  __int128 v5;

  if (a4)
    *a4 = self->_overriddenContentInsetEdges;
  if (a3)
  {
    if (self->_overriddenContentInsetEdges)
      p_contentInsetPrivateMinOrOverride = &self->_contentInsetPrivateMinOrOverride;
    else
      p_contentInsetPrivateMinOrOverride = (UIEdgeInsets *)&UIEdgeInsetsZero;
    v5 = *(_OWORD *)&p_contentInsetPrivateMinOrOverride->bottom;
    *(_OWORD *)&a3->top = *(_OWORD *)&p_contentInsetPrivateMinOrOverride->top;
    *(_OWORD *)&a3->bottom = v5;
  }
}

- (UIEdgeInsets)scopeBarInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  -[_UISearchBarVisualProviderIOS configureLayout:](self, "configureLayout:", self->_currentLayout);
  -[_UISearchBarLayout scopeContainerSpecificInsets](self->_currentLayout, "scopeContainerSpecificInsets");
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (double)scopeBarHeight
{
  double result;

  -[_UISearchBarVisualProviderIOS configureLayout:](self, "configureLayout:", self->_currentLayout);
  -[_UISearchBarLayout naturalScopeContainerHeight](self->_currentLayout, "naturalScopeContainerHeight");
  return result;
}

- (BOOL)containsScopeBar
{
  void *v3;
  BOOL v4;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[UIView isDescendantOfView:](self->_scopeBarContainerView, "isDescendantOfView:", v3);
  else
    v4 = 0;

  return v4;
}

- (double)barHeightForBarMetrics:(int64_t)a3 withEffectiveInsets:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  void *v10;
  BOOL v11;
  BOOL v12;
  int *v13;
  int v14;
  id v15;
  double v16;
  double v17;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UISearchBarVisualProviderIOS barMetricsForOrientation:](self, "barMetricsForOrientation:", objc_msgSend(v10, "_expectedInterfaceOrientation")) == a3&& (left == self->_effectiveContentInset.left ? (v11 = top == self->_effectiveContentInset.top) : (v11 = 0), v11 ? (v12 = right == self->_effectiveContentInset.right) : (v12 = 0), v12 && bottom == self->_effectiveContentInset.bottom))
  {
    v14 = 0;
    v13 = &OBJC_IVAR____UISearchBarVisualProviderIOS__prospectiveLayout;
  }
  else
  {
    v13 = &OBJC_IVAR____UISearchBarVisualProviderIOS__currentLayout;
    v14 = 1;
  }
  v15 = *(id *)((char *)&self->super.super.isa + *v13);
  -[_UISearchBarVisualProviderIOS configureLayout:](self, "configureLayout:", v15);
  if (v14)
  {
    objc_msgSend(v15, "setBarMetrics:", a3);
    objc_msgSend(v15, "setContentInset:", top, left, bottom, right);
  }
  objc_msgSend(v15, "naturalSearchFieldContainerHeight");
  v17 = v16;

  return v17;
}

- (double)searchFieldHeight
{
  double result;

  -[_UISearchBarVisualProviderIOS configureLayout:](self, "configureLayout:", self->_currentLayout);
  -[_UISearchBarLayout naturalSearchFieldHeight](self->_currentLayout, "naturalSearchFieldHeight");
  return result;
}

- (double)barHeightForBarMetrics:(int64_t)a3 barPosition:(int64_t)a4
{
  CGFloat top;
  double left;
  double right;
  double result;
  double bottom;
  double v11;

  top = self->_effectiveContentInset.top;
  left = self->_effectiveContentInset.left;
  right = self->_effectiveContentInset.right;
  bottom = self->_effectiveContentInset.bottom;
  v11 = top;
  -[_UISearchBarVisualProviderIOS getTopInset:bottomInset:forBarMetrics:barPosition:](self, "getTopInset:bottomInset:forBarMetrics:barPosition:", &v11, &bottom, a3, a4);
  -[_UISearchBarVisualProviderIOS barHeightForBarMetrics:withEffectiveInsets:](self, "barHeightForBarMetrics:withEffectiveInsets:", a3, v11, left, bottom, right);
  return result;
}

- (double)barHeightForBarMetrics:(int64_t)a3
{
  double result;

  -[_UISearchBarVisualProviderIOS barHeightForBarMetrics:withEffectiveInsets:](self, "barHeightForBarMetrics:withEffectiveInsets:", a3, self->_effectiveContentInset.top, self->_effectiveContentInset.left, self->_effectiveContentInset.bottom, self->_effectiveContentInset.right);
  return result;
}

- (double)allowedHeightInNavigationContentView
{
  return 44.0;
}

- (double)navigationBarContentHeight
{
  double v4;

  if ((_UIBarsUseNewPadHeights() & 1) != 0)
    return 50.0;
  -[_UISearchBarVisualProviderIOS intrinsicContentSize](self, "intrinsicContentSize");
  return v4;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  _UISearchBarLayout *v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    -[_UISearchBarVisualProviderIOS defaultHeightForOrientation:](self, "defaultHeightForOrientation:", objc_msgSend(v3, "_expectedInterfaceOrientation"));
    v6 = -1.0;
    if (v5 == 0.0)
      v7 = -1.0;
    else
      v7 = v5;
    if ((*((_BYTE *)&self->_searchBarVisualProviderFlags + 3) & 8) != 0)
    {
      -[_UISearchBarVisualProviderIOS transitioner](self, "transitioner");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[_UISearchBarVisualProviderIOS transitioner](self, "transitioner");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "activeLayout");
        v10 = (_UISearchBarLayout *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v10 = self->_currentLayout;
      }

      -[_UISearchBarVisualProviderIOS configureLayout:forState:](self, "configureLayout:forState:", v10, -[_UISearchBarLayout representedLayoutState](v10, "representedLayoutState"));
      -[_UISearchBarLayout prescribedSearchContainerWidth](v10, "prescribedSearchContainerWidth");
      if (v11 == 0.0)
        v6 = -1.0;
      else
        v6 = v11;

    }
  }
  else
  {
    v7 = -1.0;
    v6 = -1.0;
  }

  v12 = v6;
  v13 = v7;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)displayNavBarCancelButton:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  void *cancelBarButtonItem;
  void *v11;
  void *v12;
  id v13;

  v4 = a4;
  v5 = a3;
  -[_UISearchBarVisualProviderIOS searchNavigationItem](self, "searchNavigationItem");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[_UISearchBarVisualProviderIOS cancelBarButtonItem](self, "cancelBarButtonItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v13, "rightBarButtonItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayWithArray:", v9);
    cancelBarButtonItem = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(cancelBarButtonItem, "addObject:", v7);
    objc_msgSend(v13, "setRightBarButtonItems:animated:", cancelBarButtonItem, v4);
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v13, "rightBarButtonItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayWithArray:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "removeObjectIdenticalTo:", self->_cancelBarButtonItem);
    objc_msgSend(v13, "setRightBarButtonItems:animated:", v7, v4);
    cancelBarButtonItem = self->_cancelBarButtonItem;
    self->_cancelBarButtonItem = 0;
  }

}

- (double)availableBoundsWidth
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "bounds");
    -[_UISearchBarVisualProviderIOS availableBoundsWidthForSize:](self, "availableBoundsWidthForSize:", v5, v6);
    v8 = v7;
  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

- (double)availableBoundsWidthForSize:(CGSize)a3
{
  UIEdgeInsets *p_effectiveContentInset;
  double v5;
  UINavigationButton *leftButton;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double right;
  double v18;
  BOOL v19;
  double v20;
  CGRect v22;
  CGRect v23;

  p_effectiveContentInset = &self->_effectiveContentInset;
  v5 = a3.width - self->_effectiveContentInset.left - self->_effectiveContentInset.right;
  leftButton = self->_leftButton;
  if (leftButton)
  {
    -[UINavigationButton _pathTitleEdgeInsets](leftButton, "_pathTitleEdgeInsets");
    v9 = v7 + v8;
    -[UIView frame](self->_leftButton, "frame");
    v5 = v5 - (CGRectGetWidth(v22) + 11.0 - v9);
  }
  if (self->_cancelButton)
  {
    if ((*((_BYTE *)&self->_searchBarVisualProviderFlags + 2) & 4) != 0)
    {
      if (!-[_UISearchBarVisualProviderIOS isInBarButNotHosted](self, "isInBarButNotHosted")
        || (+[UIDevice currentDevice](UIDevice, "currentDevice"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = objc_msgSend(v10, "userInterfaceIdiom"),
            v10,
            (v11 & 0xFFFFFFFFFFFFFFFBLL) != 1))
      {
        -[UIButton _pathTitleEdgeInsets](self->_cancelButton, "_pathTitleEdgeInsets");
        v13 = v12;
        v15 = v14;
        -[UIView frame](self->_cancelButton, "frame");
        v16 = v5 - (CGRectGetWidth(v23) + 11.0 - v15 - v13);
        right = p_effectiveContentInset->right;
        v18 = 8.0 - right;
        v19 = right < 8.0;
        v20 = 0.0;
        if (v19)
          v20 = v18;
        return v16 - v20;
      }
    }
  }
  return v5;
}

- (BOOL)shouldCombineLandscapeBarsForOrientation:(int64_t)a3
{
  return 0;
}

- (BOOL)wouldCombineLandscapeBarsForSize:(CGSize)a3
{
  return 0;
}

- (id)searchIconBarButtonItem
{
  UIBarButtonItem *searchIconBarButtonItem;
  UIBarButtonItem *v4;
  void *v5;
  void *v6;
  UIBarButtonItem *v7;
  UIBarButtonItem *v8;

  searchIconBarButtonItem = self->_searchIconBarButtonItem;
  if (!searchIconBarButtonItem)
  {
    v4 = [UIBarButtonItem alloc];
    +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("magnifyingglass"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[UIBarButtonItem initWithImage:style:target:action:](v4, "initWithImage:style:target:action:", v5, 0, v6, sel__searchButtonAction_);
    v8 = self->_searchIconBarButtonItem;
    self->_searchIconBarButtonItem = v7;

    -[UIBarButtonItem setEnabled:](self->_searchIconBarButtonItem, "setEnabled:", (*(_QWORD *)&self->_searchBarVisualProviderFlags & 0x1000) == 0);
    searchIconBarButtonItem = self->_searchIconBarButtonItem;
  }
  return searchIconBarButtonItem;
}

- (void)setRequiresSearchTextField:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a3;
  v5 = -[_UISearchBarVisualProviderIOS requiresSearchTextField](self, "requiresSearchTextField");
  v6 = 0x2000000000;
  if (!v3)
    v6 = 0;
  self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFFFDFFFFFFFFFLL | v6);
  if (v5 != -[_UISearchBarVisualProviderIOS requiresSearchTextField](self, "requiresSearchTextField"))
  {
    -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_searchController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_searchBarSearchTextFieldRequirementDidChange:", v8);

  }
}

- (BOOL)requiresSearchTextField
{
  _BOOL4 v3;

  if (-[_UISearchBarVisualProviderIOS isHostedInlineByNavigationBar](self, "isHostedInlineByNavigationBar"))
    return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 4) >> 5) & 1;
  else
    LOBYTE(v3) = 1;
  return v3;
}

- (double)idealInlineWidthForLayoutState:(int64_t)a3
{
  int64_t v5;
  double result;

  if (a3 == -1 || (*(_QWORD *)&self->_searchBarVisualProviderFlags & 0x4000000) == 0)
    return 0.0;
  -[_UISearchBarVisualProviderIOS setUpCancelButton](self, "setUpCancelButton");
  if (a3)
    v5 = a3;
  else
    v5 = 2;
  -[_UISearchBarVisualProviderIOS configureLayout:forState:](self, "configureLayout:forState:", self->_prospectiveLayout, v5);
  -[_UISearchBarLayout setHostedInlineByNavigationBar:](self->_prospectiveLayout, "setHostedInlineByNavigationBar:", 1);
  if (!-[_UISearchBarVisualProviderIOS isHostedInlineByNavigationBar](self, "isHostedInlineByNavigationBar"))
  {
    -[_UISearchBarVisualProviderIOS recalculatedEffectiveContentInsetForLayoutState:forcingInlineCalculation:](self, "recalculatedEffectiveContentInsetForLayoutState:forcingInlineCalculation:", a3, 1);
    -[_UISearchBarLayoutBase setContentInset:](self->_prospectiveLayout, "setContentInset:");
  }
  -[_UISearchBarLayout prescribedSearchContainerWidth](self->_prospectiveLayout, "prescribedSearchContainerWidth");
  return result;
}

- (void)setLeftInsetForInlineSearch:(double)a3
{
  _UISearchBarTransitionerBase *transitioner;
  id v5;

  if (self->_leftInsetForInlineSearch != a3)
  {
    self->_leftInsetForInlineSearch = a3;
    transitioner = self->_transitioner;
    if (transitioner)
    {
      -[_UISearchBarTransitionerBase activeLayout](transitioner, "activeLayout");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[_UISearchBarVisualProviderIOS configureLayout:](self, "configureLayout:", v5);

    }
  }
}

- (void)setRightInsetForInlineSearch:(double)a3
{
  _UISearchBarTransitionerBase *transitioner;
  id v5;

  if (self->_rightInsetForInlineSearch != a3)
  {
    self->_rightInsetForInlineSearch = a3;
    transitioner = self->_transitioner;
    if (transitioner)
    {
      -[_UISearchBarTransitionerBase activeLayout](transitioner, "activeLayout");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[_UISearchBarVisualProviderIOS configureLayout:](self, "configureLayout:", v5);

    }
  }
}

- (id)description
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  unint64_t overriddenContentInsetEdges;
  uint64_t v9;
  uint64_t v10;
  double top;
  double left;
  double right;
  $3CCFBAC33A89B83EF2A602DE1312B683 searchBarVisualProviderFlags;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)_UISearchBarVisualProviderIOS;
  -[_UISearchBarVisualProviderIOS description](&v25, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    return v3;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" searchBar=%p effectiveContentInset={%g, %g, %g, %g}"), v5, *(_QWORD *)&self->_effectiveContentInset.top, *(_QWORD *)&self->_effectiveContentInset.left, *(_QWORD *)&self->_effectiveContentInset.bottom, *(_QWORD *)&self->_effectiveContentInset.right);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_overriddenContentInsetEdges)
  {
    objc_msgSend(v6, "stringByAppendingString:", CFSTR(" [SPI contentInset overrides"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    overriddenContentInsetEdges = self->_overriddenContentInsetEdges;
    if ((overriddenContentInsetEdges & 1) != 0)
    {
      objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(" .top=%g"), *(_QWORD *)&self->_contentInsetPrivateMinOrOverride.top);
      v17 = objc_claimAutoreleasedReturnValue();

      overriddenContentInsetEdges = self->_overriddenContentInsetEdges;
      v7 = (void *)v17;
      if ((overriddenContentInsetEdges & 2) == 0)
      {
LABEL_7:
        if ((overriddenContentInsetEdges & 4) == 0)
          goto LABEL_8;
        goto LABEL_24;
      }
    }
    else if ((overriddenContentInsetEdges & 2) == 0)
    {
      goto LABEL_7;
    }
    objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(" .left=%g"), *(_QWORD *)&self->_contentInsetPrivateMinOrOverride.left);
    v18 = objc_claimAutoreleasedReturnValue();

    overriddenContentInsetEdges = self->_overriddenContentInsetEdges;
    v7 = (void *)v18;
    if ((overriddenContentInsetEdges & 4) == 0)
    {
LABEL_8:
      if ((overriddenContentInsetEdges & 8) == 0)
      {
LABEL_10:
        objc_msgSend(v7, "stringByAppendingString:", CFSTR("]"));
        v10 = objc_claimAutoreleasedReturnValue();
        v6 = v7;
LABEL_16:

        v6 = (void *)v10;
        goto LABEL_17;
      }
LABEL_9:
      objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(" .right=%g"), *(_QWORD *)&self->_contentInsetPrivateMinOrOverride.right);
      v9 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v9;
      goto LABEL_10;
    }
LABEL_24:
    objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(" .bottom=%g"), *(_QWORD *)&self->_contentInsetPrivateMinOrOverride.bottom);
    v19 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v19;
    if ((self->_overriddenContentInsetEdges & 8) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  top = self->_contentInsetPrivateMinOrOverride.top;
  left = self->_contentInsetPrivateMinOrOverride.left;
  right = self->_contentInsetPrivateMinOrOverride.right;
  if (left != 0.0 || top != 0.0 || right != 0.0 || self->_contentInsetPrivateMinOrOverride.bottom != 0.0)
  {
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(" SPI min contentInset={%g, %g, %g, %g}"), *(_QWORD *)&top, *(_QWORD *)&left, *(_QWORD *)&self->_contentInsetPrivateMinOrOverride.bottom, *(_QWORD *)&right);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
LABEL_17:
  searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
  if ((*(_QWORD *)&searchBarVisualProviderFlags & 0x800000000) != 0)
  {
    objc_msgSend(v6, "stringByAppendingString:", CFSTR(" [using searchFieldContainerLayout customization SPI]"));
    v15 = objc_claimAutoreleasedReturnValue();

    searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    v6 = (void *)v15;
  }
  if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x8000000) != 0)
  {
    objc_msgSend(v6, "stringByAppendingString:", CFSTR(" inline"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_searchIconBarButtonItem)
    {
      objc_msgSend(v16, "stringByAppendingFormat:", CFSTR(" searchIcon=%p"), self->_searchIconBarButtonItem);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = v16;
    }
  }
  if (self->_transitioner)
  {
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(" transitioner=%p"), self->_transitioner);
    v20 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v20;
  }
  v21 = self->_layoutState + 1;
  if (v21 > 4)
    v22 = CFSTR("Unknown _UISearchBarLayoutState");
  else
    v22 = off_1E16B71C8[v21];
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(" %@"), v22);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_prospectiveLayout)
  {
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" prospectiveLayout=%p"), self->_prospectiveLayout);
    v23 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v23;
  }
  if (self->_currentLayout)
  {
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" currentLayout=%p"), self->_currentLayout);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    return v24;
  }
  return v3;
}

- (double)hostedScopeBarTopInsetForBarMetrics:(int64_t)a3
{
  return 2.0;
}

- (void)setLayoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback:(id)a3
{
  BOOL v4;

  v4 = a3 != 0;
  -[_UISearchBarLayout setLayoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback:](self->_currentLayout, "setLayoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback:");
  self->_searchBarVisualProviderFlags = ($3CCFBAC33A89B83EF2A602DE1312B683)(*(_QWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFFFF7FFFFFFFFLL | ((unint64_t)v4 << 35));
}

- (void)setAdditionalPaddingForCancelButtonAtLeadingEdge:(double)a3
{
  double v5;
  id v6;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_UISearchBarVisualProviderIOS additionalPaddingForCancelButtonAtLeadingEdge](self, "additionalPaddingForCancelButtonAtLeadingEdge");
  if (v5 != a3)
  {
    objc_msgSend(v6, "setNeedsLayout");
    -[_UISearchBarSearchContainerView setNeedsLayout](self->_searchFieldContainerView, "setNeedsLayout");
    -[_UISearchBarLayout setAdditionalPaddingForCancelButtonAtLeadingEdge:](self->_currentLayout, "setAdditionalPaddingForCancelButtonAtLeadingEdge:", a3);
    -[_UISearchBarLayout setAdditionalPaddingForCancelButtonAtLeadingEdge:](self->_prospectiveLayout, "setAdditionalPaddingForCancelButtonAtLeadingEdge:", a3);
  }

}

- (double)additionalPaddingForCancelButtonAtLeadingEdge
{
  double result;

  -[_UISearchBarLayout additionalPaddingForCancelButtonAtLeadingEdge](self->_currentLayout, "additionalPaddingForCancelButtonAtLeadingEdge");
  return result;
}

- (void)setAdditionalPaddingForSearchFieldAtLeadingEdge:(double)a3
{
  double v5;
  id v6;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_UISearchBarVisualProviderIOS additionalPaddingForSearchFieldAtLeadingEdge](self, "additionalPaddingForSearchFieldAtLeadingEdge");
  if (v5 != a3)
  {
    objc_msgSend(v6, "setNeedsLayout");
    -[_UISearchBarSearchContainerView setNeedsLayout](self->_searchFieldContainerView, "setNeedsLayout");
    -[_UISearchBarLayout setAdditionalPaddingForSearchFieldAtLeadingEdge:](self->_currentLayout, "setAdditionalPaddingForSearchFieldAtLeadingEdge:", a3);
    -[_UISearchBarLayout setAdditionalPaddingForSearchFieldAtLeadingEdge:](self->_prospectiveLayout, "setAdditionalPaddingForSearchFieldAtLeadingEdge:", a3);
  }

}

- (double)additionalPaddingForSearchFieldAtLeadingEdge
{
  double result;

  -[_UISearchBarLayout additionalPaddingForSearchFieldAtLeadingEdge](self->_currentLayout, "additionalPaddingForSearchFieldAtLeadingEdge");
  return result;
}

- (void)updateBackgroundToBackdropStyle:(int64_t)a3
{
  unint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v5, OS_LOG_TYPE_FAULT, "UISearchDisplayController should not call through to the iOS 13.0+ search bar visual provider. This is a UIKit bug", buf, 2u);
    }

  }
  else
  {
    v3 = updateBackgroundToBackdropStyle____s_category;
    if (!updateBackgroundToBackdropStyle____s_category)
    {
      v3 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v3, (unint64_t *)&updateBackgroundToBackdropStyle____s_category);
    }
    v4 = *(NSObject **)(v3 + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "UISearchDisplayController should not call through to the iOS 13.0+ search bar visual provider. This is a UIKit bug", v6, 2u);
    }
  }
}

- (void)setBackgroundLayoutNeedsUpdate
{
  unint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v5, OS_LOG_TYPE_FAULT, "UISearchDisplayController should not call through to the iOS 13.0+ search bar visual provider. This is a UIKit bug", buf, 2u);
    }

  }
  else
  {
    v3 = setBackgroundLayoutNeedsUpdate___s_category;
    if (!setBackgroundLayoutNeedsUpdate___s_category)
    {
      v3 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v3, (unint64_t *)&setBackgroundLayoutNeedsUpdate___s_category);
    }
    v4 = *(NSObject **)(v3 + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "UISearchDisplayController should not call through to the iOS 13.0+ search bar visual provider. This is a UIKit bug", v6, 2u);
    }
  }
  *(_QWORD *)&self->_searchBarVisualProviderFlags |= 0x8000uLL;
}

- (id)shadowView
{
  unint64_t v2;
  NSObject *v3;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v5, OS_LOG_TYPE_FAULT, "UISearchDisplayController should not call through to the iOS 13.0+ search bar visual provider. This is a UIKit bug", buf, 2u);
    }

  }
  else
  {
    v2 = shadowView___s_category;
    if (!shadowView___s_category)
    {
      v2 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v2, (unint64_t *)&shadowView___s_category);
    }
    v3 = *(NSObject **)(v2 + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "UISearchDisplayController should not call through to the iOS 13.0+ search bar visual provider. This is a UIKit bug", v6, 2u);
    }
  }
  return 0;
}

- (id)makeShadowView
{
  unint64_t v2;
  NSObject *v3;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v5, OS_LOG_TYPE_FAULT, "UISearchDisplayController should not call through to the iOS 13.0+ search bar visual provider. This is a UIKit bug", buf, 2u);
    }

  }
  else
  {
    v2 = makeShadowView___s_category;
    if (!makeShadowView___s_category)
    {
      v2 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v2, (unint64_t *)&makeShadowView___s_category);
    }
    v3 = *(NSObject **)(v2 + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "UISearchDisplayController should not call through to the iOS 13.0+ search bar visual provider. This is a UIKit bug", v6, 2u);
    }
  }
  return 0;
}

- (void)setShadowVisibleIfNecessary:(BOOL)a3
{
  unint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v5, OS_LOG_TYPE_FAULT, "UISearchDisplayController should not call through to the iOS 13.0+ search bar visual provider. This is a UIKit bug", buf, 2u);
    }

  }
  else
  {
    v3 = setShadowVisibleIfNecessary____s_category;
    if (!setShadowVisibleIfNecessary____s_category)
    {
      v3 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v3, (unint64_t *)&setShadowVisibleIfNecessary____s_category);
    }
    v4 = *(NSObject **)(v3 + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "UISearchDisplayController should not call through to the iOS 13.0+ search bar visual provider. This is a UIKit bug", v6, 2u);
    }
  }
}

- (void)setSearchDisplayControllerShowsCancelButton:(BOOL)a3
{
  unint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v5, OS_LOG_TYPE_FAULT, "UISearchDisplayController should not call through to the iOS 13.0+ search bar visual provider. This is a UIKit bug", buf, 2u);
    }

  }
  else
  {
    v3 = setSearchDisplayControllerShowsCancelButton____s_category;
    if (!setSearchDisplayControllerShowsCancelButton____s_category)
    {
      v3 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v3, (unint64_t *)&setSearchDisplayControllerShowsCancelButton____s_category);
    }
    v4 = *(NSObject **)(v3 + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "UISearchDisplayController should not call through to the iOS 13.0+ search bar visual provider. This is a UIKit bug", v6, 2u);
    }
  }
}

- (void)setSearchDisplayController:(id)a3
{
  unint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v5, OS_LOG_TYPE_FAULT, "UISearchDisplayController is not supported by the iOS 13.0+ provider. This is a UIKit problem", buf, 2u);
    }

  }
  else
  {
    v3 = setSearchDisplayController____s_category;
    if (!setSearchDisplayController____s_category)
    {
      v3 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v3, (unint64_t *)&setSearchDisplayController____s_category);
    }
    v4 = *(NSObject **)(v3 + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "UISearchDisplayController is not supported by the iOS 13.0+ provider. This is a UIKit problem", v6, 2u);
    }
  }
}

- (id)searchNavigationItem
{
  void *v3;
  _UISearchBarNavigationItem *v4;
  void *v5;
  UINavigationItem *v6;
  UINavigationItem *searchNavigationItem;

  if (!self->_searchNavigationItem)
  {
    -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = [_UISearchBarNavigationItem alloc];
      _UINSLocalizedStringWithDefaultValue(CFSTR("Search"), CFSTR("Search"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[UINavigationItem initWithTitle:](v4, "initWithTitle:", v5);
      searchNavigationItem = self->_searchNavigationItem;
      self->_searchNavigationItem = v6;

      -[_UISearchBarVisualProviderIOS setUpSearchNavigationItem](self, "setUpSearchNavigationItem");
    }
  }
  return self->_searchNavigationItem;
}

- (void)setUpSearchNavigationItem
{
  void *v3;
  UINavigationItem *v4;
  void *v5;
  double v6;
  void *v7;
  UISearchBarBackground *searchBarBackground;
  id v9;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v9 = v3;
    v4 = self->_searchNavigationItem;
    objc_msgSend(v9, "_searchBarTextField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISearchBarVisualProviderIOS searchFieldHeight](self, "searchFieldHeight");
    objc_msgSend(v5, "setFrame:", 0.0, 0.0, 14433663.0, v6);
    -[UINavigationItem setTitleView:](v4, "setTitleView:", v5);
    if ((*((_BYTE *)&self->_searchBarVisualProviderFlags + 2) & 4) != 0)
      -[_UISearchBarVisualProviderIOS displayNavBarCancelButton:animated:](self, "displayNavBarCancelButton:animated:", 1, 0);
    -[_UISearchBarVisualProviderIOS prompt](self, "prompt");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationItem setPrompt:](v4, "setPrompt:", v7);

    -[UIView removeFromSuperview](self->_searchBarBackground, "removeFromSuperview");
    searchBarBackground = self->_searchBarBackground;
    self->_searchBarBackground = 0;

    v3 = v9;
  }

}

- (void)setSearchField:(id)a3
{
  objc_storeStrong((id *)&self->_searchField, a3);
}

- (id)searchBarBackground
{
  return self->_searchBarBackground;
}

- (void)setSearchBarBackground:(id)a3
{
  objc_storeStrong((id *)&self->_searchBarBackground, a3);
}

- (id)backdrop
{
  return self->_backdrop;
}

- (void)setBackdrop:(id)a3
{
  objc_storeStrong((id *)&self->_backdrop, a3);
}

- (id)backdropVisualEffectView
{
  return self->_backdropVisualEffectView;
}

- (void)setBackdropVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_backdropVisualEffectView, a3);
}

- (id)cancelButton
{
  return self->_cancelButton;
}

- (id)cancelButtonText
{
  return self->_cancelButtonText;
}

- (void)setCancelButtonText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (id)promptLabel
{
  return self->_promptLabel;
}

- (void)setPromptLabel:(id)a3
{
  objc_storeStrong((id *)&self->_promptLabel, a3);
}

- (id)separator
{
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_separator, a3);
}

- (id)scopeBar
{
  return self->_scopeBar;
}

- (void)setScopeBar:(id)a3
{
  objc_storeStrong((id *)&self->_scopeBar, a3);
}

- (id)scopeBarContainerView
{
  return self->_scopeBarContainerView;
}

- (id)scopeBarBackgroundView
{
  return self->_scopeBarBackgroundView;
}

- (void)setScopeBarBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_scopeBarBackgroundView, a3);
}

- (void)setSelectedScope:(int64_t)a3
{
  self->_selectedScope = a3;
}

- (int64_t)backdropStyle
{
  return self->_backdropStyle;
}

- (id)barTintColor
{
  return self->_barTintColor;
}

- (void)setBarTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_barTintColor, a3);
}

- (unint64_t)scopeBarPosition
{
  return self->_scopeBarPosition;
}

- (void)setScopeBarPosition:(unint64_t)a3
{
  self->_scopeBarPosition = a3;
}

- (UIEdgeInsets)effectiveContentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_effectiveContentInset.top;
  left = self->_effectiveContentInset.left;
  bottom = self->_effectiveContentInset.bottom;
  right = self->_effectiveContentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)minimumContentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsetPrivateMinOrOverride.top;
  left = self->_contentInsetPrivateMinOrOverride.left;
  bottom = self->_contentInsetPrivateMinOrOverride.bottom;
  right = self->_contentInsetPrivateMinOrOverride.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)tableViewIndexWidth
{
  return self->_tableViewIndexWidth;
}

- (void)setTableViewIndexWidth:(double)a3
{
  self->_tableViewIndexWidth = a3;
}

- (int64_t)navBarTitleViewLocation
{
  return self->_navBarTitleViewLocation;
}

- (void)setNavBarTitleViewLocation:(int64_t)a3
{
  self->_navBarTitleViewLocation = a3;
}

- (id)navBarTitleViewOverlayRects
{
  return self->_navBarTitleViewOverlayRects;
}

- (void)setNavBarTitleViewOverlayRects:(id)a3
{
  objc_storeStrong((id *)&self->_navBarTitleViewOverlayRects, a3);
}

- (id)navBarTitleViewDataSource
{
  return objc_loadWeakRetained((id *)&self->_navBarTitleViewDataSource);
}

- (void)setNavBarTitleViewDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_navBarTitleViewDataSource, a3);
}

- (id)animatedAppearanceBarButtonItem
{
  return self->_animatedAppearanceBarButtonItem;
}

- (int64_t)layoutState
{
  return self->_layoutState;
}

- (double)leftInsetForInlineSearch
{
  return self->_leftInsetForInlineSearch;
}

- (double)rightInsetForInlineSearch
{
  return self->_rightInsetForInlineSearch;
}

- (int64_t)previousLayoutState
{
  return self->_previousLayoutState;
}

- (double)backgroundExtension
{
  return self->_backgroundExtension;
}

- (_UISearchBarLayout)currentLayout
{
  return self->_currentLayout;
}

- (void)setCurrentLayout:(id)a3
{
  objc_storeStrong((id *)&self->_currentLayout, a3);
}

- (_UISearchBarLayout)prospectiveLayout
{
  return self->_prospectiveLayout;
}

- (void)setProspectiveLayout:(id)a3
{
  objc_storeStrong((id *)&self->_prospectiveLayout, a3);
}

- (void)setTransitioner:(id)a3
{
  objc_storeStrong((id *)&self->_transitioner, a3);
}

@end
