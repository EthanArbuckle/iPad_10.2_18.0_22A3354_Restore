@implementation STAllowanceItemSetupListController

- (STAllowanceItemSetupListController)init
{
  STAllowanceItemSetupListController *v2;
  uint64_t v3;
  NSMutableOrderedSet *selectedBundleIdentifiers;
  uint64_t v5;
  NSMutableOrderedSet *selectedWebDomains;
  uint64_t v7;
  NSMutableOrderedSet *selectedCategoryIdentifiers;
  uint64_t v9;
  NSMutableDictionary *applicationAndWebDomainSpecifiersByCategoryIdentifier;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)STAllowanceItemSetupListController;
  v2 = -[STAllowanceItemSetupListController init](&v12, sel_init);
  v3 = objc_opt_new();
  selectedBundleIdentifiers = v2->_selectedBundleIdentifiers;
  v2->_selectedBundleIdentifiers = (NSMutableOrderedSet *)v3;

  v5 = objc_opt_new();
  selectedWebDomains = v2->_selectedWebDomains;
  v2->_selectedWebDomains = (NSMutableOrderedSet *)v5;

  v7 = objc_opt_new();
  selectedCategoryIdentifiers = v2->_selectedCategoryIdentifiers;
  v2->_selectedCategoryIdentifiers = (NSMutableOrderedSet *)v7;

  v9 = objc_opt_new();
  applicationAndWebDomainSpecifiersByCategoryIdentifier = v2->_applicationAndWebDomainSpecifiersByCategoryIdentifier;
  v2->_applicationAndWebDomainSpecifiersByCategoryIdentifier = (NSMutableDictionary *)v9;

  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[STAllowanceItemSearchResultsController removeObserver:forKeyPath:context:](self->_searchResultsController, "removeObserver:forKeyPath:context:", self, CFSTR("hasNewSelection"), CFSTR("KVOContextAllowanceItemSetupListController"));
  v3.receiver = self;
  v3.super_class = (Class)STAllowanceItemSetupListController;
  -[STAllowanceItemSetupListController dealloc](&v3, sel_dealloc);
}

- (BOOL)canBeShownFromSuspendedState
{
  return 0;
}

- (int64_t)tableViewStyle
{
  return 2;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t v19[16];
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)STAllowanceItemSetupListController;
  -[STAllowanceItemSetupListController viewDidLoad](&v20, sel_viewDidLoad);
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("AllowanceChooseAppsTitle"), &stru_24DB8A1D0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAllowanceItemSetupListController setTitle:](self, "setTitle:", v4);

  -[STAllowanceItemSetupListController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__didPressCancelButton_);
  objc_msgSend(v5, "setLeftBarButtonItem:", v6);

  -[STAllowanceItemSetupListController specifier](self, "specifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RightBarButtonTitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithTitle:style:target:action:", v8, 2, self, sel__didPressDoneButton_);
  -[STAllowanceItemSetupListController selectedBundleIdentifiers](self, "selectedBundleIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v9, "setEnabled:", 1);
  }
  else
  {
    -[STAllowanceItemSetupListController selectedWebDomains](self, "selectedWebDomains");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(v9, "setEnabled:", 1);
    }
    else
    {
      -[STAllowanceItemSetupListController selectedCategoryIdentifiers](self, "selectedCategoryIdentifiers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setEnabled:", objc_msgSend(v12, "count") != 0);

    }
  }

  objc_msgSend(v5, "setRightBarButtonItem:", v9);
  objc_msgSend(MEMORY[0x24BEBD9A0], "storyboardWithName:bundle:", CFSTR("AllowanceItemSearch"), v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "instantiateInitialViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAllowanceItemSetupListController selectedBundleIdentifiers](self, "selectedBundleIdentifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSelectedBundleIdentifiers:", v15);

  -[STAllowanceItemSetupListController selectedWebDomains](self, "selectedWebDomains");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSelectedWebDomains:", v16);

  objc_msgSend(v14, "addObserver:forKeyPath:options:context:", self, CFSTR("hasNewSelection"), 3, CFSTR("KVOContextAllowanceItemSetupListController"));
  -[STAllowanceItemSetupListController setSearchResultsController:](self, "setSearchResultsController:", v14);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD928]), "initWithSearchResultsController:", v14);
  objc_msgSend(v17, "setSearchResultsUpdater:", v14);
  objc_msgSend(v17, "setDelegate:", self);
  objc_msgSend(v5, "setSearchController:", v17);
  -[STAllowanceItemSetupListController table](self, "table");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setEditing:", 1);
  objc_msgSend(v18, "setAllowsMultipleSelectionDuringEditing:", 1);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STAllowanceItemSetupListController.viewDidLoad", v19, 2u);
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id obj;
  uint8_t buf[16];
  _QWORD v17[5];
  id v18;
  _QWORD aBlock[5];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v25.receiver = self;
  v25.super_class = (Class)STAllowanceItemSetupListController;
  -[STAllowanceItemSetupListController viewWillAppear:](&v25, sel_viewWillAppear_, a3);
  -[STAllowanceItemSetupListController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__selectCellsForSelectedIdentifiers_, 0, 0.0);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[STAllowanceItemSetupListController categorySpecifiers](self, "categorySpecifiers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    v7 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        aBlock[0] = v7;
        aBlock[1] = 3221225472;
        aBlock[2] = __53__STAllowanceItemSetupListController_viewWillAppear___block_invoke;
        aBlock[3] = &unk_24DB864C0;
        aBlock[4] = self;
        v11 = v10;
        v20 = v11;
        v12 = _Block_copy(aBlock);
        objc_msgSend(v9, "setProperty:forKey:", v12, 0x24DB91C70);

        v17[0] = v7;
        v17[1] = 3221225472;
        v17[2] = __53__STAllowanceItemSetupListController_viewWillAppear___block_invoke_2;
        v17[3] = &unk_24DB864E8;
        v17[4] = self;
        v18 = v11;
        v13 = v11;
        v14 = _Block_copy(v17);
        objc_msgSend(v9, "setProperty:forKey:", v14, 0x24DB91C90);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v5);
  }

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STAllowanceItemSetupListController.viewWillAppear", buf, 2u);
  }
}

void __53__STAllowanceItemSetupListController_viewWillAppear___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id obj;
  id obja;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endEditing:", 0);

  if (!a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "applicationAndWebDomainSpecifiersByCategoryIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    obja = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "removeContiguousSpecifiers:animated:", obja, 1);
    return;
  }
  if (a2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "applicationAndWebDomainSpecifiersByCategoryIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "insertContiguousSpecifiers:afterSpecifierID:animated:", v8, *(_QWORD *)(a1 + 40), 1);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = v8;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (!v9)
      goto LABEL_16;
    v10 = v9;
    v11 = *(_QWORD *)v27;
    v23 = *MEMORY[0x24BE75A18];
    while (1)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "indexPathForSpecifier:", v13, v23);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *(void **)(a1 + 32);
        if (a3)
        {
          objc_msgSend(v16, "table");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "selectRowAtIndexPath:animated:scrollPosition:", v14, 0, 0);

          objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], v23);
          objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:animated:", v13, 0);
          goto LABEL_14;
        }
        objc_msgSend(v16, "selectedBundleIdentifiers");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "containsObject:", v15))
        {

        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "selectedWebDomains");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "containsObject:", v15);

          if (!v20)
            goto LABEL_14;
        }
        objc_msgSend(*(id *)(a1 + 32), "table");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "selectRowAtIndexPath:animated:scrollPosition:", v14, 0, 0);

LABEL_14:
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (!v10)
      {
LABEL_16:

        return;
      }
    }
  }
}

void __53__STAllowanceItemSetupListController_viewWillAppear___block_invoke_2(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  _BOOL8 v22;
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
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endEditing:", 0);

  objc_msgSend(*(id *)(a1 + 32), "table");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "specifierForID:", *(_QWORD *)(a1 + 40));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "indexPathForSpecifier:");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "selectedCategoryIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", *MEMORY[0x24BE84810]);
  v9 = v8;
  v32 = v5;
  v27 = v7;
  v28 = (void *)v6;
  if (a2)
  {
    if ((v8 & 1) == 0)
    {
      objc_msgSend(v7, "addObject:", *(_QWORD *)(a1 + 40));
      objc_msgSend(v5, "selectRowAtIndexPath:animated:scrollPosition:", v6, 0, 0);
    }
    v10 = MEMORY[0x24BDBD1C0];
  }
  else
  {
    objc_msgSend(v7, "removeObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v5, "deselectRowAtIndexPath:animated:", v6, 0);
    v10 = MEMORY[0x24BDBD1C8];
  }
  objc_msgSend(*(id *)(a1 + 32), "selectedBundleIdentifiers");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "selectedWebDomains");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "applicationAndWebDomainSpecifiersByCategoryIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v12;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v35;
    v16 = *MEMORY[0x24BE75A18];
    if (v9)
      v17 = v31;
    else
      v17 = v30;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v35 != v15)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if (a2)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "removeObject:", v20);

        }
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v10, v16);
        if (objc_msgSend(v19, "cellType") == 3
          && objc_msgSend(*(id *)(a1 + 32), "containsSpecifier:", v19))
        {
          objc_msgSend(*(id *)(a1 + 32), "indexPathForSpecifier:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (a2)
            objc_msgSend(v32, "selectRowAtIndexPath:animated:scrollPosition:", v21, 0, 0);
          else
            objc_msgSend(v32, "deselectRowAtIndexPath:animated:", v21, 0);
          objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:animated:", v19, 1);

        }
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v14);
  }

  if (objc_msgSend(v30, "count"))
  {
    v22 = 1;
    v23 = v32;
    v24 = v27;
  }
  else
  {
    v24 = v27;
    if (objc_msgSend(v31, "count"))
      v22 = 1;
    else
      v22 = objc_msgSend(v27, "count") != 0;
    v23 = v32;
  }
  objc_msgSend(*(id *)(a1 + 32), "navigationItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "rightBarButtonItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setEnabled:", v22);

  if (a2
    && (objc_msgSend(*(id *)(a1 + 32), "allAppsAndCategoriesSelected") & 1) == 0
    && ((objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", *MEMORY[0x24BE157F0]) & 1) != 0
     || (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", *MEMORY[0x24BE157C0]) & 1) != 0
     || objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", *MEMORY[0x24BE157E8])))
  {
    objc_msgSend(*(id *)(a1 + 32), "_showNewCategoriesCompatibilityAlertIfNeeded");
  }

}

- (void)_showNewCategoriesCompatibilityAlertIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;

  -[STAllowanceItemSetupListController specifier](self, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", 0x24DB91230);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "me");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "shouldShowCompatibilityAlerts"))
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("HasShownNewCategoriesCompatibilityAlertByDSID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "dsid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    if ((v12 & 1) == 0)
    {
      +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isRemoteUser"))
      {
        objc_msgSend(v6, "givenName");
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("UpdateChildDevicesAlertTitleFormat"), &stru_24DB8A1D0, 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:locale:", v24, v15, v14);
          objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("AppLimitChildCompatibilityAlertMessageFormat"), &stru_24DB8A1D0, 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:locale:", v17, v15, v14);

LABEL_9:
          objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v16, v18, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("ConfirmationButtonOK"), &stru_24DB8A1D0, 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v22, 0, 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addAction:", v23);
          objc_msgSend(v21, "setPreferredAction:", v23);
          v25[0] = MEMORY[0x24BDAC760];
          v25[1] = 3221225472;
          v25[2] = __82__STAllowanceItemSetupListController__showNewCategoriesCompatibilityAlertIfNeeded__block_invoke;
          v25[3] = &unk_24DB86440;
          v26 = v6;
          -[STAllowanceItemSetupListController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v21, 1, v25);

          goto LABEL_10;
        }
        objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("UpdateChildDevicesAlertTitle"), &stru_24DB8A1D0, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = CFSTR("AppLimitChildCompatibilityAlertMessage");
        v19 = v13;
      }
      else
      {
        objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("UpdateOtherDevicesAlertTitle"), &stru_24DB8A1D0, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("AppLimitCompatibilityAlertMessage"));
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v19 = v13;
        v20 = v14;
      }
      objc_msgSend(v19, "localizedStringForKey:value:table:", v20, &stru_24DB8A1D0, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
LABEL_10:

}

void __82__STAllowanceItemSetupListController__showNewCategoriesCompatibilityAlertIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("HasShownNewCategoriesCompatibilityAlertByDSID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dsid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v6 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v5);

  }
  else
  {
    v7 = v5;
    v8[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("HasShownNewCategoriesCompatibilityAlertByDSID"));

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STAllowanceItemSetupListController;
  -[STAllowanceItemSetupListController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  -[STAllowanceItemSetupListController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endEditing:", 0);

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STAllowanceItemSetupListController.viewWillDisappear", v5, 2u);
  }
}

- (void)willResignActive
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STAllowanceItemSetupListController;
  -[STAllowanceItemSetupListController willResignActive](&v4, sel_willResignActive);
  -[STAllowanceItemSetupListController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endEditing:", 0);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v10 = a5;
  if (a6 == CFSTR("KVOContextAllowanceItemSetupListController"))
  {
    v12 = a3;
    -[STAllowanceItemSetupListController searchResultsController](self, "searchResultsController");

    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("hasNewSelection"));
    if (v13)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 == v15)
      {

        v14 = 0;
      }
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16 == v17)
      {

        v16 = 0;
      }
      -[STAllowanceItemSetupListController _hasSelectionDidChangeFrom:to:](self, "_hasSelectionDidChangeFrom:to:", objc_msgSend(v14, "BOOLValue"), objc_msgSend(v16, "BOOLValue"));

    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)STAllowanceItemSetupListController;
    v11 = a3;
    -[STAllowanceItemSetupListController observeValueForKeyPath:ofObject:change:context:](&v18, sel_observeValueForKeyPath_ofObject_change_context_, v11, a4, v10, a6);

  }
}

- (void)_hasSelectionDidChangeFrom:(BOOL)a3 to:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (a3 != a4)
  {
    v4 = a4;
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v4)
      v8 = CFSTR("AllowanceAddBarButtonItemTitle");
    else
      v8 = CFSTR("AllowanceCancelBarButtonItemTitle");
    objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_24DB8A1D0, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    -[STAllowanceItemSetupListController navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "searchController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "searchBar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cancelButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTitle:forState:", v13, 0);

  }
}

- (void)setSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)STAllowanceItemSetupListController;
  -[STAllowanceItemSetupListController setSpecifier:](&v16, sel_setSpecifier_, v4);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("InitialSelectedBundleIdentifiers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[STAllowanceItemSetupListController selectedBundleIdentifiers](self, "selectedBundleIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v5);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("InitialSelectedWebDomains"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[STAllowanceItemSetupListController selectedWebDomains](self, "selectedWebDomains");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v7);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("InitialSelectedCategoryIdentifiers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[STAllowanceItemSetupListController selectedCategoryIdentifiers](self, "selectedCategoryIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v9);
    v11 = objc_alloc(MEMORY[0x24BDBCEF0]);
    objc_msgSend(MEMORY[0x24BE15820], "sharedCategories");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "availableCategoryIDs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithArray:", v13);

    objc_msgSend(v14, "removeObject:", *MEMORY[0x24BE157E0]);
    objc_msgSend(v14, "removeObject:", *MEMORY[0x24BE157D0]);
    objc_msgSend(v14, "removeObject:", *MEMORY[0x24BE157D8]);
    objc_msgSend(v10, "set");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[STAllowanceItemSetupListController setAllAppsAndCategoriesSelected:](self, "setAllAppsAndCategoriesSelected:", objc_msgSend(v14, "isEqualToSet:", v15));

  }
}

- (id)specifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t m;
  void *v56;
  void *v57;
  void *v58;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  id obj;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _QWORD v92[5];
  _QWORD v93[4];
  id v94;
  _QWORD v95[4];
  id v96;
  STAllowanceItemSetupListController *v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  uint64_t v106;

  v106 = *MEMORY[0x24BDAC8D0];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  if (!v3)
  {
    v77 = (int)*MEMORY[0x24BE756E0];
    -[STAllowanceItemSetupListController applicationAndWebDomainSpecifiersByCategoryIdentifier](self, "applicationAndWebDomainSpecifiersByCategoryIdentifier");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "removeAllObjects");
    v4 = (void *)objc_opt_new();
    -[STAllowanceItemSetupListController specifier](self, "specifier");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "objectForKeyedSubscript:", 0x24DB91230);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "usageDetailsCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectedWeekUsageReport");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "topUsageItemsWithMaxCount:type:includeAggregateItem:nonAggregateItems:darkColors:", 100, 2, 0, 0, 0);
    v98 = 0u;
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v105, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v99;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v99 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * i);
          objc_msgSend(v13, "budgetItemIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v14);
          objc_msgSend(v13, "categoryIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            -[STAllowanceItemSetupListController _updateApplicationSpecifiersWithBundleIdentifier:categoryIdentifier:shouldInsertSpecifier:](self, "_updateApplicationSpecifiersWithBundleIdentifier:categoryIdentifier:shouldInsertSpecifier:", v14, v15, 0);

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v105, 16);
      }
      while (v10);
    }
    v75 = v5;
    objc_msgSend(v5, "viewModel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "installedBundleIDsByCategoryIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "mutableCopy");

    objc_msgSend(v18, "removeObjectForKey:", *MEMORY[0x24BE157D8]);
    objc_msgSend(v18, "removeObjectForKey:", *MEMORY[0x24BE157D0]);
    objc_msgSend(v18, "removeObjectForKey:", *MEMORY[0x24BE157E0]);
    v19 = MEMORY[0x24BDAC760];
    v95[0] = MEMORY[0x24BDAC760];
    v95[1] = 3221225472;
    v95[2] = __48__STAllowanceItemSetupListController_specifiers__block_invoke;
    v95[3] = &unk_24DB86510;
    v20 = v4;
    v96 = v20;
    v97 = self;
    v73 = v18;
    objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v95);
    -[STAllowanceItemSetupListController selectedBundleIdentifiers](self, "selectedBundleIdentifiers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v93[0] = v19;
    v93[1] = 3221225472;
    v93[2] = __48__STAllowanceItemSetupListController_specifiers__block_invoke_2;
    v93[3] = &unk_24DB86538;
    v72 = v20;
    v94 = v72;
    objc_msgSend(v21, "indexesOfObjectsPassingTest:", v93);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "count"))
    {
      objc_msgSend(v21, "objectsAtIndexes:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE15820], "sharedCategories");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v92[0] = v19;
      v92[1] = 3221225472;
      v92[2] = __48__STAllowanceItemSetupListController_specifiers__block_invoke_3;
      v92[3] = &unk_24DB865B0;
      v92[4] = self;
      objc_msgSend(v24, "categoriesForBundleIDs:completionHandler:", v23, v92);

    }
    v70 = v22;
    v71 = v21;
    v74 = v8;
    objc_msgSend(v8, "topUsageItemsWithMaxCount:type:includeAggregateItem:nonAggregateItems:darkColors:", 100, 4, 0, 0, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v25, "count"));
    v27 = (void *)objc_opt_new();
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v28 = v25;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v88, v104, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v89;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v89 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * j);
          objc_msgSend(v33, "budgetItemIdentifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v34);
          -[STAllowanceItemSetupListController _webDomainSpecifierForDomain:usageItem:](self, "_webDomainSpecifierForDomain:usageItem:", v34, v33);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v35);

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v88, v104, 16);
      }
      while (v30);
    }

    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    -[STAllowanceItemSetupListController selectedWebDomains](self, "selectedWebDomains");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v84, v103, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v85;
      do
      {
        for (k = 0; k != v38; ++k)
        {
          if (*(_QWORD *)v85 != v39)
            objc_enumerationMutation(v36);
          v41 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * k);
          if ((objc_msgSend(v27, "containsObject:", v41) & 1) == 0)
          {
            -[STAllowanceItemSetupListController _webDomainSpecifierForDomain:usageItem:](self, "_webDomainSpecifierForDomain:usageItem:", v41, 0);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "addObject:", v42);

          }
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v84, v103, 16);
      }
      while (v38);
    }
    v69 = v28;

    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("AddWebsiteButtonTitle"), &stru_24DB8A1D0, 0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setButtonAction:", sel__addWebsiteButtonPressed_);
    v45 = *MEMORY[0x24BE84810];
    objc_msgSend(v44, "setObject:forKeyedSubscript:", *MEMORY[0x24BE84810], 0x24DB8A4B0);
    objc_msgSend(MEMORY[0x24BE84828], "sharedCache");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "blankSpaceImageWithSize:", 29.0, 29.0);
    v47 = objc_claimAutoreleasedReturnValue();

    v65 = (void *)v47;
    objc_msgSend(v44, "setObject:forKeyedSubscript:", v47, *MEMORY[0x24BE75AC8]);
    v66 = v44;
    objc_msgSend(v26, "addObject:", v44);
    v64 = v45;
    objc_msgSend(v78, "setObject:forKeyedSubscript:", v26, v45);
    objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("AppsCategoriesWebsitesGroupSpecifierName"), &stru_24DB8A1D0, 0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithName:");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v43;
    objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("AppsCategoriesWebsitesGroupFooter"), &stru_24DB8A1D0, 0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setObject:forKeyedSubscript:");
    -[STAllowanceItemSetupListController _categorySpecifierForIdentifier:](self, "_categorySpecifierForIdentifier:", *MEMORY[0x24BE847F8]);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v48;
    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v48, v60, 0);
    v50 = (void *)objc_opt_new();
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    STSortedCategoriesForUsageLimits();
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v80, v102, 16);
    if (v52)
    {
      v53 = v52;
      v54 = *(_QWORD *)v81;
      do
      {
        for (m = 0; m != v53; ++m)
        {
          if (*(_QWORD *)v81 != v54)
            objc_enumerationMutation(v51);
          -[STAllowanceItemSetupListController _categorySpecifierForIdentifier:](self, "_categorySpecifierForIdentifier:", *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * m));
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "addObject:", v56);
          objc_msgSend(v50, "addObject:", v56);

        }
        v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v80, v102, 16);
      }
      while (v53);
    }

    -[STAllowanceItemSetupListController _categorySpecifierForIdentifier:](self, "_categorySpecifierForIdentifier:", v64);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addObject:", v57);
    objc_msgSend(v50, "addObject:", v57);
    -[STAllowanceItemSetupListController setCategorySpecifiers:](self, "setCategorySpecifiers:", v50);
    v58 = *(Class *)((char *)&self->super.super.super.super.super.isa + v77);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v77) = (Class)v49;

    v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v77);
  }
  return v3;
}

void __48__STAllowanceItemSetupListController_specifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v11) & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 40), "_updateApplicationSpecifiersWithBundleIdentifier:categoryIdentifier:shouldInsertSpecifier:", v11, v5, 0);
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

uint64_t __48__STAllowanceItemSetupListController_specifiers__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

void __48__STAllowanceItemSetupListController_specifiers__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __48__STAllowanceItemSetupListController_specifiers__block_invoke_4;
    v17[3] = &unk_24DB86588;
    v8 = v5;
    v9 = *(_QWORD *)(a1 + 32);
    v18 = v8;
    v19 = v9;
    objc_msgSend(v7, "addOperationWithBlock:", v17);

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    __48__STAllowanceItemSetupListController_specifiers__block_invoke_3_cold_1((uint64_t)v6, v10, v11, v12, v13, v14, v15, v16);
  }

}

uint64_t __48__STAllowanceItemSetupListController_specifiers__block_invoke_4(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __48__STAllowanceItemSetupListController_specifiers__block_invoke_5;
  v3[3] = &unk_24DB86560;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v3);
}

void __48__STAllowanceItemSetupListController_specifiers__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_updateApplicationSpecifiersWithBundleIdentifier:categoryIdentifier:shouldInsertSpecifier:", v5, v6, 1);

}

- (void)_updateApplicationSpecifiersWithBundleIdentifier:(id)a3 categoryIdentifier:(id)a4 shouldInsertSpecifier:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a5;
  v15 = a4;
  -[STAllowanceItemSetupListController _applicationSpecifierForBundleIdentifier:categoryIdentifier:](self, "_applicationSpecifierForBundleIdentifier:categoryIdentifier:", a3, v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAllowanceItemSetupListController applicationAndWebDomainSpecifiersByCategoryIdentifier](self, "applicationAndWebDomainSpecifiersByCategoryIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = v10;
    objc_msgSend(v10, "addObject:", v8);
    if (!v5)
      goto LABEL_13;
  }
  else
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v8, 0);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, v15);
    if (!v5)
      goto LABEL_13;
  }
  v12 = objc_msgSend(v11, "count");
  if (v12 == 1)
  {
    -[STAllowanceItemSetupListController specifierForID:](self, "specifierForID:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", 0x24DB91CD0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "integerValue") == 1)
      -[STAllowanceItemSetupListController insertSpecifier:afterSpecifier:animated:](self, "insertSpecifier:afterSpecifier:animated:", v8, v13, 1);
    -[STAllowanceItemSetupListController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v13, 1);

  }
  else
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", v12 - 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[STAllowanceItemSetupListController containsSpecifier:](self, "containsSpecifier:", v13))
      -[STAllowanceItemSetupListController insertSpecifier:afterSpecifier:animated:](self, "insertSpecifier:afterSpecifier:animated:", v8, v13, 1);
    -[STAllowanceItemSetupListController reloadSpecifierID:animated:](self, "reloadSpecifierID:animated:", v15, 1);
  }

LABEL_13:
}

- (id)_applicationSpecifierForBundleIdentifier:(id)a3 categoryIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString **v13;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BE844B8];
  v8 = a4;
  objc_msgSend(v7, "sharedCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appInfoForBundleIdentifier:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "displayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, self, 0, 0, 0, 3, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setIdentifier:", v6);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, 0x24DB8A4B0);

  if (objc_msgSend(v10, "source") == 2 && (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE84700]) & 1) == 0)
  {
    objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75B88]);
    v13 = (__CFString **)MEMORY[0x24BE75B70];
  }
  else
  {
    objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
    v13 = &STAppBundleIDKey;
  }
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v6, *v13);

  return v12;
}

- (id)_categorySpecifierForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE847F8]))
  {
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("AllAppsAndCategoriesSpecifierName"), &stru_24DB8A1D0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, 0, 0, 0, 3, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE84810]))
    {
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("MostUsedWebsites"), &stru_24DB8A1D0, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, 0, sel__categoryDetailText_, 0, 3, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
      v8 = CFSTR("HidesEditControl");
      v9 = MEMORY[0x24BDBD1C8];
    }
    else
    {
      STCategoryNameWithIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, 0, sel__categoryDetailText_, 0, 3, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_class();
      v8 = (__CFString *)*MEMORY[0x24BE75948];
    }
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v8);
    if (-[STAllowanceItemSetupListController allAppsAndCategoriesSelected](self, "allAppsAndCategoriesSelected"))
      objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
  }
  objc_msgSend(v7, "setIdentifier:", v4);
  objc_msgSend(MEMORY[0x24BE84828], "sharedCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageForCategoryIdentifier:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE75AC8]);

  return v7;
}

- (id)_webDomainSpecifierForDomain:(id)a3 usageItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v35;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(v6, "_lp_userVisibleHost");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, self, 0, 0, 0, 3, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setIdentifier:", v6);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", *MEMORY[0x24BE84810], 0x24DB8A4B0);
  objc_msgSend(MEMORY[0x24BEBDAB0], "currentTraitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceStyle");

  v13 = v6;
  if (objc_msgSend(v13, "length"))
  {
    v35 = v12;
    v14 = (void *)objc_opt_new();
    objc_msgSend(v14, "setScheme:", CFSTR("https"));
    objc_msgSend(v14, "setHost:", v13);
    objc_msgSend(v14, "URL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_lp_highLevelDomain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "host");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v16;
    v20 = v17;
    v21 = v18;
    if (objc_msgSend(v19, "length"))
    {
      objc_msgSend(v19, "substringToIndex:", 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "uppercaseString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v20, "substringToIndex:", 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "uppercaseString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[STAllowanceItemSetupListController _webDomainSpecifierForDomain:usageItem:].cold.2();
    }

    v12 = v35;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[STAllowanceItemSetupListController _webDomainSpecifierForDomain:usageItem:].cold.1((uint64_t)v13, v24, v25, v26, v27, v28, v29, v30);
    v23 = 0;
  }

  if (v7)
  {
    objc_msgSend(v7, "image");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v32, *MEMORY[0x24BE75AC8]);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE84828], "sharedCache");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "monogramImageForInitial:useDarkColors:", v23, v12 == 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v33, *MEMORY[0x24BE75AC8]);

  }
  return v10;
}

- (id)_categoryDetailText:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[STAllowanceItemSetupListController allAppsAndCategoriesSelected](self, "allAppsAndCategoriesSelected")
    || (-[STAllowanceItemSetupListController selectedCategoryIdentifiers](self, "selectedCategoryIdentifiers"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "containsObject:", v4),
        v5,
        v6))
  {
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("AllItemsSelectedDetailText"), &stru_24DB8A1D0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE84810]))
    {
      -[STAllowanceItemSetupListController selectedWebDomains](self, "selectedWebDomains");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("NumberOfWebsitesFormat");
    }
    else
    {
      -[STAllowanceItemSetupListController selectedBundleIdentifiers](self, "selectedBundleIdentifiers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("NumberOfAppsFormat");
    }
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[STAllowanceItemSetupListController applicationAndWebDomainSpecifiersByCategoryIdentifier](self, "applicationAndWebDomainSpecifiersByCategoryIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v7, "containsObject:", v17);

          v14 += v18;
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v13);
    }
    else
    {
      v14 = 0;
    }

    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", v9, &stru_24DB8A1D0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v20, CFSTR("%lu"), 0, v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)_addWebsiteButtonPressed:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[STAllowanceItemSetupListController specifierForID:](self, "specifierForID:", CFSTR("WebDomainTextField"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE755F0], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, sel__addCustomWebDomain_specifier_, 0, 0, 8, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIdentifier:", CFSTR("WebDomainTextField"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A08]);
    v5 = *MEMORY[0x24BE84810];
    objc_msgSend(v4, "setObject:forKeyedSubscript:", *MEMORY[0x24BE84810], 0x24DB8A4B0);
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AddWebsitePlaceholderText"), &stru_24DB8A1D0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setPlaceholder:", v7);
    -[STAllowanceItemSetupListController applicationAndWebDomainSpecifiersByCategoryIdentifier](self, "applicationAndWebDomainSpecifiersByCategoryIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "insertObject:atIndex:", v4, objc_msgSend(v9, "indexOfObject:", v13));
    -[STAllowanceItemSetupListController insertSpecifier:atIndex:animated:](self, "insertSpecifier:atIndex:animated:", v4, -[STAllowanceItemSetupListController indexOfSpecifier:](self, "indexOfSpecifier:", v13), 1);

  }
  -[STAllowanceItemSetupListController indexPathForSpecifier:](self, "indexPathForSpecifier:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAllowanceItemSetupListController table](self, "table");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cellForRowAtIndexPath:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "becomeFirstResponder");
}

- (void)_addCustomWebDomain:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v50;
  uint64_t v51;
  void *v52;
  void *v53;
  _QWORD v54[2];

  v54[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[STAllowanceItemSetupListController applicationAndWebDomainSpecifiersByCategoryIdentifier](self, "applicationAndWebDomainSpecifiersByCategoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BE84810];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE84810]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_sf_bestURLForUserTypedString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "host");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "length"))
  {
    v13 = (void *)objc_opt_new();
    objc_msgSend(v13, "normalizeDomainName:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[STAllowanceItemSetupListController specifierForID:](self, "specifierForID:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      -[STAllowanceItemSetupListController removeSpecifier:animated:](self, "removeSpecifier:animated:", v15, 1);
      objc_msgSend(v10, "removeObject:", v16);
    }
    else
    {
      objc_msgSend(v14, "_lp_userVisibleHost");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v17, self, 0, 0, 0, 3, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setIdentifier:", v14);
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v9, 0x24DB8A4B0);
      objc_msgSend(MEMORY[0x24BEBDAB0], "currentTraitCollection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v18, "userInterfaceStyle");

      objc_msgSend(MEMORY[0x24BE84828], "sharedCache");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v17;
      v52 = v20;
      if (objc_msgSend(v20, "length"))
      {
        v46 = v19;
        v21 = (void *)objc_opt_new();
        objc_msgSend(v21, "setScheme:", CFSTR("https"));
        objc_msgSend(v21, "setHost:", v20);
        objc_msgSend(v21, "URL");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "_lp_highLevelDomain");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "host");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "URL");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v22;
        v26 = v23;
        v50 = v24;
        v48 = v9;
        if (objc_msgSend(v25, "length"))
        {
          objc_msgSend(v25, "substringToIndex:", 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "uppercaseString");
          v47 = objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(v26, "substringToIndex:", 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "uppercaseString");
          v37 = objc_claimAutoreleasedReturnValue();

          v47 = v37;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[STAllowanceItemSetupListController _webDomainSpecifierForDomain:usageItem:].cold.2();
        }
        v19 = v46;

        v35 = (void *)v47;
        v9 = v48;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[STAllowanceItemSetupListController _webDomainSpecifierForDomain:usageItem:].cold.1((uint64_t)v20, v28, v29, v30, v31, v32, v33, v34);
        v35 = 0;
      }

      objc_msgSend(v19, "monogramImageForInitial:useDarkColors:", v35, v51 == 2);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v38, *MEMORY[0x24BE75AC8]);

    }
    objc_msgSend(v10, "replaceObjectAtIndex:withObject:", objc_msgSend(v10, "indexOfObject:", v6), v16);
    v54[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v53, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[STAllowanceItemSetupListController replaceContiguousSpecifiers:withSpecifiers:animated:](self, "replaceContiguousSpecifiers:withSpecifiers:animated:", v39, v40, 1);

    -[STAllowanceItemSetupListController indexPathForSpecifier:](self, "indexPathForSpecifier:", v16);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[STAllowanceItemSetupListController table](self, "table");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "selectRowAtIndexPath:animated:scrollPosition:", v41, 0, 0);

    -[STAllowanceItemSetupListController selectedWebDomains](self, "selectedWebDomains");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObject:", v14);

    -[STAllowanceItemSetupListController navigationItem](self, "navigationItem");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "rightBarButtonItem");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setEnabled:", 1);

    -[STAllowanceItemSetupListController reloadSpecifierID:](self, "reloadSpecifierID:", v9);
  }
  else
  {
    objc_msgSend(v10, "removeObject:", v6);
    -[STAllowanceItemSetupListController removeSpecifier:animated:](self, "removeSpecifier:animated:", v6, 1);
    v14 = v12;
  }

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)STAllowanceItemSetupListController;
  v6 = a4;
  -[STAllowanceItemSetupListController tableView:cellForRowAtIndexPath:](&v22, sel_tableView_cellForRowAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAllowanceItemSetupListController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v22.receiver, v22.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", 0x24DB8A4B0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BEBD4B8], "tertiarySystemGroupedBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v11);

    objc_msgSend(v10, "setAlpha:", 0.3);
    objc_msgSend(v7, "setBackgroundView:", v10);

  }
  objc_msgSend(v8, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BE84810]) & 1) != 0)
  {

  }
  else
  {
    v13 = objc_msgSend(v8, "cellType");

    if (v13 != 8)
      goto LABEL_7;
  }
  objc_msgSend(v7, "_setIgnoresMultipleSelectionDuringEditing:", 1);
LABEL_7:
  if (objc_msgSend(v8, "cellType") != 13)
  {
    v14 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v15);

    objc_msgSend(v7, "setSelectedBackgroundView:", v14);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v7;
    objc_msgSend(v16, "setControllerDelegate:", self);
    objc_msgSend(v16, "setValueChangedTarget:action:specifier:", self, sel__addCustomWebDomain_specifier_, v8);
    objc_msgSend(v16, "editableTextField");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAutocapitalizationType:", 0);
    objc_msgSend(v17, "setAutocorrectionType:", 1);
    objc_msgSend(v17, "setKeyboardType:", 3);
    objc_msgSend(v17, "setReturnKeyType:", 9);
    objc_msgSend(v17, "setClearButtonMode:", 1);
    objc_msgSend(v17, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(MEMORY[0x24BE84828], "sharedCache");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "blankSpaceImageWithSize:", 29.0, 29.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "iconImageView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "setImage:", v19);
  }

  return v7;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  v7 = a5;
  if ((objc_msgSend(v9, "isUserInteractionEnabled") & 1) == 0 && (objc_msgSend(v9, "isSelected") & 1) == 0)
  {
    objc_msgSend(v9, "setUserInteractionEnabled:", 1);
    -[STAllowanceItemSetupListController table](self, "table");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectRowAtIndexPath:animated:scrollPosition:", v7, 0, 0);

    objc_msgSend(v9, "setUserInteractionEnabled:", 0);
  }

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void (**v19)(_QWORD, _QWORD);
  void *v20;
  int v21;
  _BOOL8 v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[STAllowanceItemSetupListController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endEditing:", 0);

  -[STAllowanceItemSetupListController selectedBundleIdentifiers](self, "selectedBundleIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAllowanceItemSetupListController selectedWebDomains](self, "selectedWebDomains");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAllowanceItemSetupListController specifierAtIndexPath:](self, "specifierAtIndexPath:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v11;
  if (objc_msgSend(v29, "isEqualToString:", *MEMORY[0x24BE847F8]))
  {
    v25 = v10;
    v26 = v7;
    v27 = v6;
    -[STAllowanceItemSetupListController setAllAppsAndCategoriesSelected:](self, "setAllAppsAndCategoriesSelected:", 1);
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[STAllowanceItemSetupListController categorySpecifiers](self, "categorySpecifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v31;
      v11 = (void *)*MEMORY[0x24BE75A18];
      v16 = MEMORY[0x24BDBD1C0];
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v31 != v15)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v18, "objectForKeyedSubscript:", 0x24DB91C90);
          v19 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v19[2](v19, 1);
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v16, v11);
          -[STAllowanceItemSetupListController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v18, 0);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v14);
    }

    v7 = v26;
    v6 = v27;
    v10 = v25;
  }
  else if (objc_msgSend(v11, "cellType") == 13)
  {
    objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
    objc_msgSend(v11, "performButtonAction");
  }
  else if (v29 && objc_msgSend(v11, "cellType") != 8)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", 0x24DB8A4B0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BE84810]))
      v20 = v10;
    else
      v20 = v9;
    objc_msgSend(v20, "addObject:", v29);
    -[STAllowanceItemSetupListController reloadSpecifierID:animated:](self, "reloadSpecifierID:animated:", v11, 0);

  }
  if (objc_msgSend(v9, "count") || objc_msgSend(v10, "count"))
  {
    v21 = 0;
    v22 = 1;
  }
  else
  {
    -[STAllowanceItemSetupListController selectedCategoryIdentifiers](self, "selectedCategoryIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v11, "count") != 0;
    v21 = 1;
  }
  -[STAllowanceItemSetupListController navigationItem](self, "navigationItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "rightBarButtonItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setEnabled:", v22);

  if (v21)
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  void *v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void (**v18)(_QWORD, _QWORD);
  void *v19;
  int v20;
  _BOOL8 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[STAllowanceItemSetupListController selectedBundleIdentifiers](self, "selectedBundleIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAllowanceItemSetupListController selectedWebDomains](self, "selectedWebDomains");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAllowanceItemSetupListController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v10;
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BE847F8]))
  {
    v24 = v9;
    v25 = v8;
    v26 = v6;
    -[STAllowanceItemSetupListController setAllAppsAndCategoriesSelected:](self, "setAllAppsAndCategoriesSelected:", 0);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[STAllowanceItemSetupListController categorySpecifiers](self, "categorySpecifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v29;
      v15 = *MEMORY[0x24BE75A18];
      v4 = (void *)MEMORY[0x24BDBD1C8];
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v17, "objectForKeyedSubscript:", 0x24DB91C90);
          v18 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v18[2](v18, 0);
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v4, v15);
          -[STAllowanceItemSetupListController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v17, 0);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v13);
    }

    v6 = v26;
    v9 = v24;
    v8 = v25;
  }
  else
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", 0x24DB8A4B0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE84810]))
      v19 = v8;
    else
      v19 = v7;
    objc_msgSend(v19, "removeObject:", v10);
    -[STAllowanceItemSetupListController reloadSpecifierID:animated:](self, "reloadSpecifierID:animated:", v4, 0);

  }
  if (objc_msgSend(v7, "count") || objc_msgSend(v8, "count"))
  {
    v20 = 0;
    v21 = 1;
  }
  else
  {
    -[STAllowanceItemSetupListController selectedCategoryIdentifiers](self, "selectedCategoryIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v4, "count") != 0;
    v20 = 1;
  }
  -[STAllowanceItemSetupListController navigationItem](self, "navigationItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "rightBarButtonItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setEnabled:", v21);

  if (v20)
}

- (void)_didPressCancelButton:(id)a3
{
  id v4;

  -[STAllowanceItemSetupListController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  -[STAllowanceItemSetupListController _cleanUpRetainCycles](self, "_cleanUpRetainCycles");
  -[STAllowanceItemSetupListController specifier](self, "specifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removePropertyForKey:", CFSTR("CompletionHandler"));

}

- (void)_didPressDoneButton:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(id, STAllowanceItemSetupListController *, void *, void *, void *);

  -[STAllowanceItemSetupListController specifier](self, "specifier", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CompletionHandler"));
  v11 = (void (**)(id, STAllowanceItemSetupListController *, void *, void *, void *))objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[STAllowanceItemSetupListController selectedBundleIdentifiers](self, "selectedBundleIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[STAllowanceItemSetupListController selectedWebDomains](self, "selectedWebDomains");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[STAllowanceItemSetupListController selectedCategoryIdentifiers](self, "selectedCategoryIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, self, v6, v8, v10);

  }
  else
  {
    -[STAllowanceItemSetupListController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  -[STAllowanceItemSetupListController _cleanUpRetainCycles](self, "_cleanUpRetainCycles");

}

- (void)_cleanUpRetainCycles
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[STAllowanceItemSetupListController categorySpecifiers](self, "categorySpecifiers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        objc_msgSend(v7, "removePropertyForKey:", 0x24DB91C70);
        objc_msgSend(v7, "removePropertyForKey:", 0x24DB91C90);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)willPresentSearchController:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  STAllowanceItemSetupListController *v37;
  id v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v38 = a3;
  v4 = (void *)objc_opt_new();
  -[STAllowanceItemSetupListController applicationAndWebDomainSpecifiersByCategoryIdentifier](self, "applicationAndWebDomainSpecifiersByCategoryIdentifier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v37 = self;
  -[STAllowanceItemSetupListController categorySpecifiers](self, "categorySpecifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v49 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v45;
          do
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v45 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
              if (objc_msgSend(v17, "cellType") == 3)
                objc_msgSend(v4, "addObject:", v17);
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
          }
          while (v14);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    }
    while (v7);
  }

  -[STAllowanceItemSetupListController specifier](v37, "specifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", 0x24DB91230);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "viewModel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "installedBundleIDsByCategoryIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *MEMORY[0x24BE157D0];
  objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x24BE157D0]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v24 = v23;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v41;
    do
    {
      for (k = 0; k != v26; ++k)
      {
        if (*(_QWORD *)v41 != v27)
          objc_enumerationMutation(v24);
        -[STAllowanceItemSetupListController _applicationSpecifierForBundleIdentifier:categoryIdentifier:](v37, "_applicationSpecifierForBundleIdentifier:categoryIdentifier:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * k), v22);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v29);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    }
    while (v26);
  }

  objc_msgSend(v38, "searchResultsController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setAllowanceItemSpecifiers:", v4);

  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("AllowanceCancelBarButtonItemTitle"), &stru_24DB8A1D0, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  -[STAllowanceItemSetupListController navigationItem](v37, "navigationItem");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "searchController");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "searchBar");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "cancelButton");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setTitle:forState:", v32, 0);

}

- (void)willDismissSearchController:(id)a3
{
  void *v3;
  void *v4;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  uint64_t v21;
  int v22;
  _BOOL8 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  -[STAllowanceItemSetupListController table](self, "table", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_opt_new();
  v27 = v6;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v6, "indexPathsForSelectedRows");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v8)
  {
    v3 = (void *)v8;
    v9 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(v7);
        v4 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        -[STAllowanceItemSetupListController specifierAtIndexPath:](self, "specifierAtIndexPath:", v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", 0x24DB8A4B0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          -[STAllowanceItemSetupListController selectedCategoryIdentifiers](self, "selectedCategoryIdentifiers");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "containsObject:", v12);

          if ((v14 & 1) == 0)
          {
            objc_msgSend(v27, "deselectRowAtIndexPath:animated:", v4, 0);
            objc_msgSend(v26, "addObject:", v12);
          }
        }

      }
      v3 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v3);
  }

  -[STAllowanceItemSetupListController _selectCellsForSelectedIdentifiers:](self, "_selectCellsForSelectedIdentifiers:", v26);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v15 = v26;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v29 != v18)
          objc_enumerationMutation(v15);
        -[STAllowanceItemSetupListController reloadSpecifierID:animated:](self, "reloadSpecifierID:animated:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j), 0);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v17);
  }

  -[STAllowanceItemSetupListController selectedBundleIdentifiers](self, "selectedBundleIdentifiers");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");
  if (v21)
  {
    v22 = 0;
    v23 = 1;
  }
  else
  {
    -[STAllowanceItemSetupListController selectedWebDomains](self, "selectedWebDomains");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
      v22 = 0;
      v23 = 1;
    }
    else
    {
      -[STAllowanceItemSetupListController selectedCategoryIdentifiers](self, "selectedCategoryIdentifiers");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v4, "count") != 0;
      v22 = 1;
    }
  }
  -[STAllowanceItemSetupListController navigationItem](self, "navigationItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "rightBarButtonItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setEnabled:", v23);

  if (v22)
  if (!v21)

}

- (void)_selectCellsForSelectedIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t m;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[5];
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[5];
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[STAllowanceItemSetupListController table](self, "table");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[STAllowanceItemSetupListController allAppsAndCategoriesSelected](self, "allAppsAndCategoriesSelected"))
  {
    -[STAllowanceItemSetupListController specifierForID:](self, "specifierForID:", *MEMORY[0x24BE847F8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[STAllowanceItemSetupListController indexPathForSpecifier:](self, "indexPathForSpecifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectRowAtIndexPath:animated:scrollPosition:", v7, 0, 0);
    if (v4)
    {
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      -[STAllowanceItemSetupListController categorySpecifiers](self, "categorySpecifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v60;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v60 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * i), "identifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v13);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
        }
        while (v10);
      }

    }
  }
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  -[STAllowanceItemSetupListController selectedCategoryIdentifiers](self, "selectedCategoryIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v56;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v56 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j);
        -[STAllowanceItemSetupListController specifierForID:](self, "specifierForID:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[STAllowanceItemSetupListController indexPathForSpecifier:](self, "indexPathForSpecifier:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "selectRowAtIndexPath:animated:scrollPosition:", v21, 0, 0);
        objc_msgSend(v4, "addObject:", v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
    }
    while (v16);
  }

  -[STAllowanceItemSetupListController applicationAndWebDomainSpecifiersByCategoryIdentifier](self, "applicationAndWebDomainSpecifiersByCategoryIdentifier");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  -[STAllowanceItemSetupListController selectedBundleIdentifiers](self, "selectedBundleIdentifiers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v52;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v52 != v25)
          objc_enumerationMutation(v22);
        v27 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * k);
        -[STAllowanceItemSetupListController specifierForID:](self, "specifierForID:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v28;
        if (v28)
        {
          objc_msgSend(v28, "objectForKeyedSubscript:", 0x24DB8A4B0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v30);

          -[STAllowanceItemSetupListController indexPathForSpecifier:](self, "indexPathForSpecifier:", v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31)
            objc_msgSend(v5, "selectRowAtIndexPath:animated:scrollPosition:", v31, 0, 0);

        }
        else if (v4)
        {
          v49[0] = MEMORY[0x24BDAC760];
          v49[1] = 3221225472;
          v49[2] = __73__STAllowanceItemSetupListController__selectCellsForSelectedIdentifiers___block_invoke;
          v49[3] = &unk_24DB865D8;
          v49[4] = v27;
          v50 = v4;
          objc_msgSend(v42, "enumerateKeysAndObjectsUsingBlock:", v49);

        }
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
    }
    while (v24);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  -[STAllowanceItemSetupListController selectedWebDomains](self, "selectedWebDomains");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v45, v63, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v46;
    do
    {
      for (m = 0; m != v34; ++m)
      {
        if (*(_QWORD *)v46 != v35)
          objc_enumerationMutation(v32);
        v37 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * m);
        -[STAllowanceItemSetupListController specifierForID:](self, "specifierForID:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v38;
        if (v38)
        {
          objc_msgSend(v38, "objectForKeyedSubscript:", 0x24DB8A4B0);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v40);

          -[STAllowanceItemSetupListController indexPathForSpecifier:](self, "indexPathForSpecifier:", v39);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          if (v41)
            objc_msgSend(v5, "selectRowAtIndexPath:animated:scrollPosition:", v41, 0, 0);

        }
        else if (v4)
        {
          v43[0] = MEMORY[0x24BDAC760];
          v43[1] = 3221225472;
          v43[2] = __73__STAllowanceItemSetupListController__selectCellsForSelectedIdentifiers___block_invoke_2;
          v43[3] = &unk_24DB865D8;
          v43[4] = v37;
          v44 = v4;
          objc_msgSend(v42, "enumerateKeysAndObjectsUsingBlock:", v43);

        }
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v45, v63, 16);
    }
    while (v34);
  }

}

void __73__STAllowanceItemSetupListController__selectCellsForSelectedIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = a3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "identifier", (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", *(_QWORD *)(a1 + 32));

        if (v14)
        {
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
          *a4 = 1;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

}

void __73__STAllowanceItemSetupListController__selectCellsForSelectedIdentifiers___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = a3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "identifier", (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", *(_QWORD *)(a1 + 32));

        if (v14)
        {
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
          *a4 = 1;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

}

- (BOOL)allAppsAndCategoriesSelected
{
  return self->_allAppsAndCategoriesSelected;
}

- (void)setAllAppsAndCategoriesSelected:(BOOL)a3
{
  self->_allAppsAndCategoriesSelected = a3;
}

- (NSMutableOrderedSet)selectedBundleIdentifiers
{
  return (NSMutableOrderedSet *)objc_getProperty(self, a2, 1384, 1);
}

- (NSMutableOrderedSet)selectedWebDomains
{
  return (NSMutableOrderedSet *)objc_getProperty(self, a2, 1392, 1);
}

- (NSMutableOrderedSet)selectedCategoryIdentifiers
{
  return (NSMutableOrderedSet *)objc_getProperty(self, a2, 1400, 1);
}

- (NSArray)categorySpecifiers
{
  return (NSArray *)objc_getProperty(self, a2, 1408, 1);
}

- (void)setCategorySpecifiers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1408);
}

- (NSMutableDictionary)applicationAndWebDomainSpecifiersByCategoryIdentifier
{
  return self->_applicationAndWebDomainSpecifiersByCategoryIdentifier;
}

- (STAllowanceItemSearchResultsController)searchResultsController
{
  return (STAllowanceItemSearchResultsController *)objc_getProperty(self, a2, 1424, 1);
}

- (void)setSearchResultsController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1424);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResultsController, 0);
  objc_storeStrong((id *)&self->_applicationAndWebDomainSpecifiersByCategoryIdentifier, 0);
  objc_storeStrong((id *)&self->_categorySpecifiers, 0);
  objc_storeStrong((id *)&self->_selectedCategoryIdentifiers, 0);
  objc_storeStrong((id *)&self->_selectedWebDomains, 0);
  objc_storeStrong((id *)&self->_selectedBundleIdentifiers, 0);
}

void __48__STAllowanceItemSetupListController_specifiers__block_invoke_3_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_219AB4000, MEMORY[0x24BDACB70], a3, "Failed to fetch categories: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_webDomainSpecifierForDomain:(uint64_t)a3 usageItem:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_219AB4000, MEMORY[0x24BDACB70], a3, "Web domain name must have at least one character for monogram: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_webDomainSpecifierForDomain:usageItem:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_219AB4000, MEMORY[0x24BDACB70], v0, "Failed to extract high level domain for URL: %@. Creating initial for host instead: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

@end
