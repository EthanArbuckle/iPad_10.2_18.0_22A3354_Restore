@implementation PSSearchController

- (PSSearchController)initWithListController:(id)a3
{
  id v4;
  PSSearchController *v5;
  PSSearchController *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int *v11;
  NSObject *v12;
  id v13;
  _QWORD handler[5];
  _QWORD v16[5];
  int *v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PSSearchController;
  v5 = -[PSSearchController init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_listController, v4);
    +[PSSearchModel sharedInstance](PSSearchModel, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addDelegate:", v6);

    +[PSSearchModel sharedInstance](PSSearchModel, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDataSource:", v6);

    v6->_searchEnabled = 1;
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "sf_isInternalInstall");

    if (v10)
    {
      v16[0] = 0;
      v16[1] = v16;
      v16[2] = 0x3032000000;
      v16[3] = __Block_byref_object_copy__9;
      v16[4] = __Block_byref_object_dispose__9;
      v11 = v6;
      v17 = v11;
      v12 = MEMORY[0x1E0C80D38];
      v13 = MEMORY[0x1E0C80D38];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __45__PSSearchController_initWithListController___block_invoke;
      handler[3] = &unk_1E4A68160;
      handler[4] = v16;
      notify_register_dispatch("com.apple.preferences.internal.searchSettingsChanged", v11 + 7, v12, handler);

      objc_msgSend(v11, "_reloadSettings:", 0);
      _Block_object_dispose(v16, 8);

    }
    -[PSSearchController _buildSearchUIIfNecessary](v6, "_buildSearchUIIfNecessary");
  }

  return v6;
}

uint64_t __45__PSSearchController_initWithListController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_reloadSettings:", 1);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  int v5;
  objc_super v6;

  +[PSSearchModel sharedInstance](PSSearchModel, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeDelegate:", self);

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sf_isInternalInstall");

  if (v5)
    notify_cancel(self->_notifyToken);
  v6.receiver = self;
  v6.super_class = (Class)PSSearchController;
  -[PSSearchController dealloc](&v6, sel_dealloc);
}

- (UISearchBar)searchBar
{
  return -[UISearchController searchBar](self->_searchController, "searchBar");
}

- (void)_buildSearchUIIfNecessary
{
  PSSearchResultsController *v3;
  PSSearchResultsController *resultsController;
  PSUISearchController *v5;
  UISearchController *searchController;
  void *v7;
  id v8;

  if (!self->_resultsController)
  {
    v3 = objc_alloc_init(PSSearchResultsController);
    resultsController = self->_resultsController;
    self->_resultsController = v3;

    -[PSSearchResultsController setModalPresentationStyle:](self->_resultsController, "setModalPresentationStyle:", 3);
    -[PSSearchResultsController setDelegate:](self->_resultsController, "setDelegate:", self);
  }
  if (!self->_searchController)
  {
    v5 = -[PSUISearchController initWithSearchResultsController:]([PSUISearchController alloc], "initWithSearchResultsController:", self->_resultsController);
    searchController = self->_searchController;
    self->_searchController = &v5->super;

    -[UISearchController setDelegate:](self->_searchController, "setDelegate:", self);
    -[UISearchController setSearchResultsUpdater:](self->_searchController, "setSearchResultsUpdater:", self);
    -[UISearchController searchBar](self->_searchController, "searchBar");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    PS_LocalizedString(CFSTR("SEARCH_SETTINGS_PLACEHOLDER"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPlaceholder:", v7);

    objc_msgSend(v8, "sizeToFit");
  }
}

- (BOOL)_setBoolValue:(BOOL)a3 forIvar:(BOOL *)a4
{
  BOOL result;

  result = *a4 != a3;
  *a4 = a3;
  return result;
}

- (void)_reloadSettings:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  void *v7;
  int AppBooleanValue;
  BOOL v9;
  uint64_t v10;
  Boolean keyExistsAndHasValidFormat;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sf_isInternalInstall");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "sf_isInternalInstall"))
    {
      keyExistsAndHasValidFormat = 0;
      AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("PSSearchIsEnabled"), CFSTR("com.apple.Preferences"), &keyExistsAndHasValidFormat);
      if (keyExistsAndHasValidFormat)
        v9 = AppBooleanValue == 0;
      else
        v9 = 0;
      v10 = !v9;
    }
    else
    {
      v10 = 1;
    }

    if (-[PSSearchController _setBoolValue:forIvar:](self, "_setBoolValue:forIvar:", v10, &self->_searchEnabled))
    {
      -[PSSearchController _updateListControllerHeaderView:](self, "_updateListControllerHeaderView:", 0);
      if (v3 && self->_searchEnabled)
        -[PSSearchResultsController reloadData](self->_resultsController, "reloadData");
    }
  }
}

- (void)_updateListControllerHeaderView:(BOOL)a3
{
  id v4;
  int v5;
  PSListController **p_listController;
  id WeakRetained;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  if (a3
    || (v4 = objc_loadWeakRetained((id *)&self->_listController),
        v5 = objc_msgSend(v4, "isViewLoaded"),
        v4,
        v5))
  {
    if (self->_searchEnabled)
    {
      -[PSSearchController searchBar](self, "searchBar");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    p_listController = &self->_listController;
    WeakRetained = objc_loadWeakRetained((id *)p_listController);
    objc_msgSend(WeakRetained, "table");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tableHeaderView");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9 != v12)
    {
      v10 = objc_loadWeakRetained((id *)p_listController);
      objc_msgSend(v10, "table");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTableHeaderView:", v12);

    }
  }
}

- (BOOL)isActive
{
  return -[UISearchController isActive](self->_searchController, "isActive");
}

- (void)setActive:(BOOL)a3
{
  -[UISearchController setActive:](self->_searchController, "setActive:", a3);
}

- (void)setSearchBarVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  PSListController **p_listController;
  id WeakRetained;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  id v18;

  v4 = a4;
  v5 = a3;
  p_listController = &self->_listController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  objc_msgSend(WeakRetained, "table");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  v9 = objc_loadWeakRetained((id *)p_listController);
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safeAreaLayoutGuide");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutFrame");
  v13 = v12;

  -[PSSearchController searchBar](self, "searchBar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  v16 = v15;

  v17 = -v13;
  if (!v5)
    v17 = v16 - v13;
  objc_msgSend(v18, "setContentOffset:animated:", v4, 0.0, v17);

}

- (BOOL)activateWithInitialText:(id)a3 animated:(BOOL)a4
{
  id v5;
  BOOL v6;
  void *v7;
  void *v8;

  v5 = a3;
  if (-[PSSearchController isActive](self, "isActive") || !objc_msgSend(v5, "length"))
  {
    v6 = 0;
  }
  else
  {
    v6 = 1;
    -[PSSearchController setActive:](self, "setActive:", 1);
    -[PSSearchController searchBar](self, "searchBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "becomeFirstResponder");

    -[PSSearchController searchBar](self, "searchBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v5);

    -[PSSearchController _updateSearchResultsWithText:](self, "_updateSearchResultsWithText:", v5);
  }

  return v6;
}

- (void)addRootSpecifiers:(id)a3
{
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", &__block_literal_global_29);
}

void __40__PSSearchController_addRootSpecifiers___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[PSSearchModel sharedInstance](PSSearchModel, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addRootSpecifier:", v2);

}

- (void)reloadRootSpecifiers:(id)a3
{
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", &__block_literal_global_11);
}

void __43__PSSearchController_reloadRootSpecifiers___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[PSSearchModel sharedInstance](PSSearchModel, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadRootSpecifier:", v2);

}

- (void)removeRootSpecifiers:(id)a3
{
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", &__block_literal_global_12_0);
}

void __43__PSSearchController_removeRootSpecifiers___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[PSSearchModel sharedInstance](PSSearchModel, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeRootSpecifier:", v2);

}

- (BOOL)searchResultsController:(id)a3 shouldShowSwitchForSearchEntry:(id)a4
{
  return 0;
}

- (void)searchResultsController:(id)a3 didSelectSearchEntry:(id)a4
{
  id v5;
  int v6;
  void *v7;
  NSObject *v8;
  const __CFString *v9;
  id WeakRetained;
  int v11;
  void *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_msgSend(v5, "isRootURL");
  objc_msgSend(v5, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    _PSLoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = CFSTR("NO");
      if (v6)
        v9 = CFSTR("YES");
      v11 = 138412546;
      v12 = v7;
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_1A3819000, v8, OS_LOG_TYPE_DEFAULT, "Opening URL %@, is root: %@", (uint8_t *)&v11, 0x16u);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "searchController:openURL:", self, v7);

  }
}

- (id)searchResultsController:(id)a3 switchActionForSearchEntry:(id)a4
{
  return +[PSSpecifierAction actionWithGetter:setter:](PSSpecifierAction, "actionWithGetter:setter:", &__block_literal_global_19, &__block_literal_global_22);
}

id __73__PSSearchController_searchResultsController_switchActionForSearchEntry___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  void *v5;

  v2 = a2;
  v3 = v2;
  if (!v2)
    goto LABEL_7;
  objc_msgSend(v2, "target");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 || !v3[2] || (objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_7:
    +[PSRootController readPreferenceValue:](PSRootController, "readPreferenceValue:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_msgSend(v3, "performGetter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v5;
}

void __73__PSSearchController_searchResultsController_switchActionForSearchEntry___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  _QWORD *v5;
  id v6;
  void *v7;
  _QWORD *v8;

  v8 = a2;
  v4 = a3;
  v5 = v8;
  v6 = v4;
  if (!v8)
    goto LABEL_7;
  objc_msgSend(v8, "target");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || !v8[3] || (objc_opt_respondsToSelector() & 1) == 0)
  {

    v5 = v8;
LABEL_7:
    +[PSRootController setPreferenceValue:specifier:](PSRootController, "setPreferenceValue:specifier:", v6, v5);
    goto LABEL_8;
  }
  objc_msgSend(v8, "performSetterWithValue:", v6);

LABEL_8:
}

- (id)searchResultsController:(id)a3 iconForSearchEntry:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void (**iconForSearchEntryHandler)(id, id, id, void *);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "specifierForID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  iconForSearchEntryHandler = (void (**)(id, id, id, void *))self->_iconForSearchEntryHandler;
  if (!iconForSearchEntryHandler)
  {
    objc_msgSend(v10, "propertyForKey:", CFSTR("searchIcon"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "length"))
    {
      v14 = (void *)MEMORY[0x1E0CEA638];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "traitCollection");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "imageNamed:inBundle:compatibleWithTraitCollection:", v13, v15, v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v10, "propertyForKey:", CFSTR("iconImage"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        goto LABEL_13;
      objc_msgSend(v10, "propertyForKey:", CFSTR("useLazyIcons"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "BOOLValue");

      if (!v19)
      {
        v12 = 0;
        goto LABEL_13;
      }
      objc_msgSend(v10, "propertyForKey:", CFSTR("appIDForLazyIcon"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v20 = (void *)MEMORY[0x1E0CEA638];
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "scale");
        objc_msgSend(v20, "_applicationIconImageForBundleIdentifier:format:scale:", v15, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v10, "propertyForKey:", CFSTR("dontUnloadLazyIcon"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "BOOLValue");

          if (v23)
            objc_msgSend(v10, "setProperty:forKey:", v12, CFSTR("iconImage"));
        }
      }
      else
      {
        v12 = 0;
      }
    }

LABEL_13:
    goto LABEL_14;
  }
  iconForSearchEntryHandler[2](iconForSearchEntryHandler, v6, v7, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v12;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "searchBar");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSearchController _updateSearchResultsWithText:](self, "_updateSearchResultsWithText:", v4);

}

- (void)willPresentSearchController:(id)a3
{
  id v3;

  +[PSSearchModel sharedInstance](PSSearchModel, "sharedInstance", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preheat");

}

- (void)didDismissSearchController:(id)a3
{
  -[PSSearchResultsController setSearchResults:](self->_resultsController, "setSearchResults:", 0);
}

- (void)_updateSearchResultsWithText:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[PSSearchModel sharedInstance](PSSearchModel, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchForQuery:", v3);

}

- (void)searchModel:(id)a3 updatedWithNewResults:(id)a4 forQuery:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  PSSearchController *v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__PSSearchController_searchModel_updatedWithNewResults_forQuery___block_invoke;
  v8[3] = &unk_1E4A655B8;
  v9 = v6;
  v10 = self;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

uint64_t __65__PSSearchController_searchModel_updatedWithNewResults_forQuery___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setTreatSectionEntriesAsRegularEntries:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "setSearchResults:", *(_QWORD *)(a1 + 32));
}

- (void)searchModelWillBeginIndexing:(id)a3
{
  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_27);
}

void __51__PSSearchController_searchModelWillBeginIndexing___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setNetworkActivityIndicatorVisible:", 1);

}

- (void)searchModelDidFinishIndexing:(id)a3
{
  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_29);
}

void __51__PSSearchController_searchModelDidFinishIndexing___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setNetworkActivityIndicatorVisible:", 0);

}

- (id)rootSpecifiersForSearchModel:(id)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "rootSpecifiersForSearchController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (Class)rootSearchControllerClassForSearchModel:(id)a3
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_opt_class();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v4;
}

- (PSListController)listController
{
  return (PSListController *)objc_loadWeakRetained((id *)&self->_listController);
}

- (PSSearchControllerDelegate)delegate
{
  return (PSSearchControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)iconForSearchEntryHandler
{
  return self->_iconForSearchEntryHandler;
}

- (void)setIconForSearchEntryHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_iconForSearchEntryHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_resultsController, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
}

@end
