@implementation STCategoryDetailsGroupSpecifierProvider

- (STCategoryDetailsGroupSpecifierProvider)initWithCategoryUsageItem:(id)a3 coordinator:(id)a4
{
  id v7;
  id v8;
  STCategoryDetailsGroupSpecifierProvider *v9;
  STCategoryDetailsGroupSpecifierProvider *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v35;
  void *v36;
  id v37;
  const __CFString *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  STCategoryDetailsGroupSpecifierProvider *v46;
  id obj;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  objc_super v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v43 = v7;
  if (objc_msgSend(v7, "itemType") != 3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STCategoryDetailsGroupSpecifierProvider.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("categoryUsageItem.itemType == STUsageItemTypeCategory"));

    v7 = v43;
  }
  v52.receiver = self;
  v52.super_class = (Class)STCategoryDetailsGroupSpecifierProvider;
  v9 = -[STGroupSpecifierProvider init](&v52, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_coordinator, a4);
    v11 = (void *)MEMORY[0x24BE75590];
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("MostUsedCategoryInfoGroupSpecifierName"), &stru_24DB8A1D0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "groupSpecifierWithName:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v10;
    -[STGroupSpecifierProvider setGroupSpecifier:](v10, "setGroupSpecifier:", v14);

    v45 = (void *)objc_opt_new();
    v44 = (void *)objc_opt_new();
    v37 = v8;
    objc_msgSend(v8, "usageDetailsCoordinator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "viewModel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "selectedUsageReport");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v36 = v17;
    objc_msgSend(v17, "appAndWebUsages");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v49;
      v40 = *MEMORY[0x24BE84700];
      v39 = *MEMORY[0x24BE75B88];
      v38 = (const __CFString *)*MEMORY[0x24BE75B70];
      v41 = *MEMORY[0x24BE75948];
      v42 = *MEMORY[0x24BE75AC8];
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v49 != v20)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          objc_msgSend(v7, "budgetItemIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "categoryIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v23, "isEqualToString:", v24);

          if (v25)
          {
            objc_msgSend(v45, "addObject:", v22);
            v26 = (void *)MEMORY[0x24BE75590];
            objc_msgSend(v22, "displayName");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v27, v46, 0, sel_totalUsageDescription_, 0, 2, 0);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v22, "itemType") == 4)
            {
              objc_msgSend(v22, "image");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "setObject:forKeyedSubscript:", v29, v42);
            }
            else
            {
              objc_msgSend(v22, "budgetItemIdentifier");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BE844B8], "sharedCache");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "appInfoForBundleIdentifier:", v29);
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v31, "source") == 2 && (objc_msgSend(v29, "isEqualToString:", v40) & 1) == 0)
              {
                objc_msgSend(v28, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v39);
                v32 = v38;
              }
              else
              {
                objc_msgSend(v28, "setObject:forKeyedSubscript:", objc_opt_class(), v41);
                v32 = CFSTR("STAppBundleID");
              }
              objc_msgSend(v28, "setObject:forKeyedSubscript:", v29, v32);

              v7 = v43;
            }

            objc_msgSend(v28, "setUserInfo:", v22);
            objc_msgSend(v28, "setControllerLoadAction:", sel_showMostUsedDetailListController_);
            objc_msgSend(v44, "addObject:", v28);

          }
        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      }
      while (v19);
    }

    v10 = v46;
    -[STGroupSpecifierProvider mutableSpecifiers](v46, "mutableSpecifiers");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObjectsFromArray:", v44);

    v8 = v37;
  }

  return v10;
}

- (id)totalUsageDescription:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "totalUsage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;
  if (v5 >= 60.0)
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setAllowedUnits:", 96);
    objc_msgSend(v7, "setUnitsStyle:", 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD14F8], "st_sharedAbbreviatedSecondsDateFormatter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "stringFromTimeInterval:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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
  -[STCategoryDetailsGroupSpecifierProvider coordinator](self, "coordinator");
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

- (STUsageDetailsViewModel)usageDetailsViewModel
{
  return self->_usageDetailsViewModel;
}

- (STRootViewModelCoordinator)coordinator
{
  return self->_coordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_usageDetailsViewModel, 0);
}

@end
