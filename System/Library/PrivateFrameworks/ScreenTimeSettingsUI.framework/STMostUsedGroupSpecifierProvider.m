@implementation STMostUsedGroupSpecifierProvider

- (STMostUsedGroupSpecifierProvider)init
{
  STMostUsedGroupSpecifierProvider *v2;
  STMostUsedGroupSpecifierProvider *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)STMostUsedGroupSpecifierProvider;
  v2 = -[STShowMoreUsageGroupSpecifierProvider init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_selectedItemType = 0;
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MostUsedGroupSpecifierName"), &stru_24DB8A1D0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "groupSpecifierWithName:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setTarget:", v3);
    objc_msgSend(v7, "setButtonAction:", sel_toggleSelectedItemType_);
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BE75AA0]);

    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ShowMostUsedCategoriesButtonText"), &stru_24DB8A1D0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, 0x24DB92470);

    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], 0x24DB92490);
    -[STGroupSpecifierProvider setGroupSpecifier:](v3, "setGroupSpecifier:", v7);
    -[STShowMoreUsageGroupSpecifierProvider setNumberOfItemsToShow:](v3, "setNumberOfItemsToShow:", 8);

  }
  return v3;
}

- (void)setCoordinator:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[STUsageGroupSpecifierProvider coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("usageDetailsCoordinator.viewModel.selectedUsageReport"), "KVOContextMostUsedGroupSpecifierProvider");
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("timeAllowancesCoordinator.viewModel.allowancesByIdentifier"), "KVOContextMostUsedGroupSpecifierProvider");
  v6.receiver = self;
  v6.super_class = (Class)STMostUsedGroupSpecifierProvider;
  -[STUsageGroupSpecifierProvider setCoordinator:](&v6, sel_setCoordinator_, v4);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("usageDetailsCoordinator.viewModel.selectedUsageReport"), 7, "KVOContextMostUsedGroupSpecifierProvider");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("timeAllowancesCoordinator.viewModel.allowancesByIdentifier"), 7, "KVOContextMostUsedGroupSpecifierProvider");

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v10 = a3;
  v11 = a5;
  if (a6 == "KVOContextMostUsedGroupSpecifierProvider")
  {
    -[STUsageGroupSpecifierProvider coordinator](self, "coordinator");

    if (objc_msgSend(v10, "isEqualToString:", CFSTR("usageDetailsCoordinator.viewModel.selectedUsageReport")))
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 == v13)
      {

        v12 = 0;
      }
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 == v15)
      {

        v14 = 0;
      }
      -[STMostUsedGroupSpecifierProvider _selectedUsageReportDidChangeFrom:to:](self, "_selectedUsageReportDidChangeFrom:to:", v12, v14);
    }
    else
    {
      -[STUsageGroupSpecifierProvider coordinator](self, "coordinator");

      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("timeAllowancesCoordinator.viewModel.allowancesByIdentifier")))goto LABEL_16;
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 == v16)
      {

        v12 = 0;
      }
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 == v17)
      {

        v14 = 0;
      }
      -[STMostUsedGroupSpecifierProvider _allowancesByIdentifierDidChangeFrom:to:](self, "_allowancesByIdentifierDidChangeFrom:to:", v12, v14);
    }

    goto LABEL_16;
  }
  v18.receiver = self;
  v18.super_class = (Class)STMostUsedGroupSpecifierProvider;
  -[STMostUsedGroupSpecifierProvider observeValueForKeyPath:ofObject:change:context:](&v18, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, v11, a6);
LABEL_16:

}

- (void)_selectedUsageReportDidChangeFrom:(id)a3 to:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  objc_msgSend(v6, "appAndWebUsages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", v8 == 0);
  if (v13 != v6 && (objc_msgSend(v13, "isEqual:", v6) & 1) == 0)
  {
    objc_msgSend(v6, "categoryUsageByTrustIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
      v10 = 0;
    else
      v10 = -[STMostUsedGroupSpecifierProvider selectedItemType](self, "selectedItemType") == 0;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[STGroupSpecifierProvider groupSpecifier](self, "groupSpecifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, 0x24DB92490);

    if (v8)
      -[STMostUsedGroupSpecifierProvider reloadMostUsedSpecifiers](self, "reloadMostUsedSpecifiers");
  }

}

- (void)_allowancesByIdentifierDidChangeFrom:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  objc_msgSend(a3, "allValues");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v7 && (objc_msgSend(v8, "isEqual:", v7) & 1) == 0)
  {
    -[STMostUsedGroupSpecifierProvider loadActiveBudgetedIdentifiers](self, "loadActiveBudgetedIdentifiers");
    -[STShowMoreUsageGroupSpecifierProvider refreshUsageSpecifiersWithUpdates:](self, "refreshUsageSpecifiersWithUpdates:", 1);
  }

}

- (id)newSpecifierWithUsageItem:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x24BE75590];
  v5 = a3;
  objc_msgSend(v5, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, 0, sel_getUsageItem_, 0, 2, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
  objc_msgSend(v5, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setName:", v8);

  objc_msgSend(v7, "setUserInfo:", v5);
  objc_msgSend(v7, "setControllerLoadAction:", sel_showMostUsedDetailListController_);
  -[STMostUsedGroupSpecifierProvider allowanceIconForUsageItem:](self, "allowanceIconForUsageItem:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, 0x24DB90690);
  else
    objc_msgSend(v7, "removePropertyForKey:", 0x24DB90690);

  return v7;
}

- (void)updateSpecifier:(id)a3 usageItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(v6, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setName:", v7);

  objc_msgSend(v9, "setUserInfo:", v6);
  -[STMostUsedGroupSpecifierProvider allowanceIconForUsageItem:](self, "allowanceIconForUsageItem:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, 0x24DB90690);
  else
    objc_msgSend(v9, "removePropertyForKey:", 0x24DB90690);

}

- (void)loadActiveBudgetedIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  STMostUsedGroupSpecifierProvider *v41;
  id obj;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
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
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v41 = self;
  -[STUsageGroupSpecifierProvider coordinator](self, "coordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeAllowancesCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allowancesByIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v8;
  v44 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
  if (v44)
  {
    v43 = *(_QWORD *)v59;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v59 != v43)
          objc_enumerationMutation(obj);
        v45 = v9;
        v10 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v9);
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        objc_msgSend(v10, "bundleIdentifiers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v55;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v55 != v14)
                objc_enumerationMutation(v11);
              v16 = *(id *)(*((_QWORD *)&v54 + 1) + 8 * v15);
              v17 = v10;
              v18 = v3;
              objc_msgSend(v18, "objectForKeyedSubscript:", v16);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (v19)
              {
                v20 = v19;
                objc_msgSend(v19, "addObject:", v17);
              }
              else
              {
                v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithObjects:", v17, 0);
                objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, v16);
              }

              ++v15;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
          }
          while (v13);
        }

        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        objc_msgSend(v10, "webDomains");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v51;
          do
          {
            v25 = 0;
            do
            {
              if (*(_QWORD *)v51 != v24)
                objc_enumerationMutation(v21);
              v26 = *(id *)(*((_QWORD *)&v50 + 1) + 8 * v25);
              v27 = v10;
              v28 = v3;
              objc_msgSend(v28, "objectForKeyedSubscript:", v26);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              if (v29)
              {
                v30 = v29;
                objc_msgSend(v29, "addObject:", v27);
              }
              else
              {
                v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithObjects:", v27, 0);
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v30, v26);
              }

              ++v25;
            }
            while (v23 != v25);
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
          }
          while (v23);
        }

        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        objc_msgSend(v10, "categoryIdentifiers");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
        if (v32)
        {
          v33 = v32;
          v34 = *(_QWORD *)v47;
          do
          {
            v35 = 0;
            do
            {
              if (*(_QWORD *)v47 != v34)
                objc_enumerationMutation(v31);
              v36 = *(id *)(*((_QWORD *)&v46 + 1) + 8 * v35);
              v37 = v10;
              v38 = v3;
              objc_msgSend(v38, "objectForKeyedSubscript:", v36);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              if (v39)
              {
                v40 = v39;
                objc_msgSend(v39, "addObject:", v37);
              }
              else
              {
                v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithObjects:", v37, 0);
                objc_msgSend(v38, "setObject:forKeyedSubscript:", v40, v36);
              }

              ++v35;
            }
            while (v33 != v35);
            v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
          }
          while (v33);
        }

        v9 = v45 + 1;
      }
      while (v45 + 1 != v44);
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
    }
    while (v44);
  }

  -[STMostUsedGroupSpecifierProvider setAllowancesByActiveBudgetedIdentifier:](v41, "setAllowancesByActiveBudgetedIdentifier:", v3);
}

- (id)getUsageItem:(id)a3
{
  return (id)objc_msgSend(a3, "userInfo");
}

- (void)toggleSelectedItemType:(id)a3
{
  unint64_t selectedItemType;
  uint64_t v5;
  id v6;

  v6 = a3;
  selectedItemType = self->_selectedItemType;
  if (!selectedItemType)
  {
    v5 = 1;
    goto LABEL_5;
  }
  if (selectedItemType == 1)
  {
    v5 = 0;
LABEL_5:
    -[STMostUsedGroupSpecifierProvider setSelectedItemType:](self, "setSelectedItemType:", v5);
  }
  -[STMostUsedGroupSpecifierProvider reloadMostUsedSpecifiers](self, "reloadMostUsedSpecifiers");

}

- (void)reloadMostUsedSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  id v14;

  -[STGroupSpecifierProvider groupSpecifier](self, "groupSpecifier");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[STUsageGroupSpecifierProvider coordinator](self, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "usageDetailsCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "selectedUsageReport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[STMostUsedGroupSpecifierProvider selectedItemType](self, "selectedItemType");
  if (v7 == 1)
  {
    objc_msgSend(v6, "categoryUsages");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = CFSTR("ShowMostUsedAppsButtonText");
  }
  else
  {
    if (v7)
    {
      v8 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v6, "appAndWebUsages");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = CFSTR("ShowMostUsedCategoriesButtonText");
  }
  objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_24DB8A1D0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, 0x24DB92470);

LABEL_7:
  objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BE75AB0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "reloadFromSpecifier");
  -[STShowMoreUsageGroupSpecifierProvider setUsageItems:](self, "setUsageItems:", v8);
  -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", objc_msgSend(v8, "count") == 0);

}

- (void)showMostUsedDetailListController:(id)a3
{
  id v4;
  STDrillInDetailListController *v5;
  void *v6;
  STDrillInDetailListController *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [STDrillInDetailListController alloc];
  -[STUsageGroupSpecifierProvider coordinator](self, "coordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[STDrillInDetailListController initWithUsageItem:coordinator:](v5, "initWithUsageItem:coordinator:", v10, v6);

  -[STGroupSpecifierProvider delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STDrillInDetailListController setParentController:](v7, "setParentController:", v8);
  objc_msgSend(v8, "rootController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STDrillInDetailListController setRootController:](v7, "setRootController:", v9);

  -[STDrillInDetailListController setSpecifier:](v7, "setSpecifier:", v4);
  -[STGroupSpecifierProvider showController:animated:](self, "showController:animated:", v7, 1);

}

- (id)allowanceIconForUsageItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *i;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  const __CFString *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "budgetItemIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STMostUsedGroupSpecifierProvider allowancesByActiveBudgetedIdentifier](self, "allowancesByActiveBudgetedIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = v7;
    v9 = (void *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (!v9)
    {
LABEL_17:

      goto LABEL_18;
    }
    v10 = 0;
    v11 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "allowanceEnabled", (_QWORD)v22))
        {
          objc_msgSend(v13, "timeToday");
          v15 = v14;
          objc_msgSend(v4, "totalUsage");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "doubleValue");
          v18 = v15 - v17;

          if (v18 <= 0.0)
          {

            v19 = CFSTR("HourGlassEmpty");
            goto LABEL_16;
          }
          v10 = 1;
        }
      }
      v9 = (void *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v9)
        continue;
      break;
    }

    if ((v10 & 1) != 0)
    {
      v19 = CFSTR("HourGlassFilling");
LABEL_16:
      v20 = (void *)MEMORY[0x24BEBD640];
      +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "imageNamed:inBundle:", v19, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
  }
  v9 = 0;
LABEL_18:

  return v9;
}

- (NSDictionary)allowancesByActiveBudgetedIdentifier
{
  return self->_allowancesByActiveBudgetedIdentifier;
}

- (void)setAllowancesByActiveBudgetedIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (unint64_t)selectedItemType
{
  return self->_selectedItemType;
}

- (void)setSelectedItemType:(unint64_t)a3
{
  self->_selectedItemType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowancesByActiveBudgetedIdentifier, 0);
}

@end
