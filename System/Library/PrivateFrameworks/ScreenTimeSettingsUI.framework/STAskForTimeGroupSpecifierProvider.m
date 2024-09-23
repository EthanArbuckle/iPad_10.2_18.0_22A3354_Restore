@implementation STAskForTimeGroupSpecifierProvider

- (STAskForTimeGroupSpecifierProvider)init
{
  STAskForTimeGroupSpecifierProvider *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STAskForTimeGroupSpecifierProvider;
  v2 = -[STGroupSpecifierProvider init](&v8, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x24BE75590];
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AskForTimeGroupSpecifierName"), &stru_24DB8A1D0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "groupSpecifierWithName:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[STGroupSpecifierProvider setGroupSpecifier:](v2, "setGroupSpecifier:", v6);

  }
  return v2;
}

- (void)setCoordinator:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("viewModel.canViewAskForTimeRequests"), "STAskForTimeGroupSpecifierProviderObservationContext");
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("timeAllowancesCoordinator.viewModel.pendingAskForTimeByIdentifier"), "STAskForTimeGroupSpecifierProviderObservationContext");
  v6.receiver = self;
  v6.super_class = (Class)STAskForTimeGroupSpecifierProvider;
  -[STRootGroupSpecifierProvider setCoordinator:](&v6, sel_setCoordinator_, v4);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("timeAllowancesCoordinator.viewModel.pendingAskForTimeByIdentifier"), 4, "STAskForTimeGroupSpecifierProviderObservationContext");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("viewModel.canViewAskForTimeRequests"), 4, "STAskForTimeGroupSpecifierProviderObservationContext");

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  id v11;
  objc_super v12;

  if (a6 == "STAskForTimeGroupSpecifierProviderObservationContext")
  {
    -[STAskForTimeGroupSpecifierProvider requestSpecifiers](self, "requestSpecifiers", a3, a4, a5);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "canViewAskForTimeRequests"))
      v9 = objc_msgSend(v11, "count") == 0;
    else
      v9 = 1;
    -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", v9);

    -[STGroupSpecifierProvider mutableSpecifiers](self, "mutableSpecifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "replaceObjectsInRange:withObjectsFromArray:", 0, objc_msgSend(v10, "count"), v11);

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)STAskForTimeGroupSpecifierProvider;
    -[STAskForTimeGroupSpecifierProvider observeValueForKeyPath:ofObject:change:context:](&v12, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (id)_createSpecifierForAskForMore:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString **v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL8 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  objc_class *v44;
  void *v45;
  uint64_t v47;
  void *v48;
  void *v49;

  v4 = a3;
  v5 = objc_msgSend(v4, "usageType");
  switch(v5)
  {
    case 2:
      objc_msgSend(v4, "budgetedIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_lp_userVisibleHost");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, self, 0, 0, 0, 2, objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BE75D50]);
      objc_msgSend(MEMORY[0x24BEBDAB0], "currentTraitCollection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "userInterfaceStyle");
      v17 = v14;
      if (objc_msgSend(v17, "length"))
      {
        v47 = v16;
        v48 = v15;
        v49 = v13;
        v18 = (void *)objc_opt_new();
        objc_msgSend(v18, "setScheme:", CFSTR("https"));
        objc_msgSend(v18, "setHost:", v17);
        objc_msgSend(v18, "URL");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "_lp_highLevelDomain");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "host");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "URL");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v20;
        v24 = v21;
        v25 = v22;
        if (objc_msgSend(v23, "length"))
        {
          objc_msgSend(v23, "substringToIndex:", 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "uppercaseString");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(v24, "substringToIndex:", 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "uppercaseString");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[STAllowanceItemSearchResultsController tableView:cellForRowAtIndexPath:].cold.2((uint64_t)v25, (uint64_t)v24);
        }
        v16 = v47;

        v15 = v48;
        v13 = v49;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[STAllowanceItemSearchResultsController tableView:cellForRowAtIndexPath:].cold.1((uint64_t)v17);
        v27 = 0;
      }
      v36 = v16 == 2;

      objc_msgSend(MEMORY[0x24BE84828], "sharedCache");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "monogramImageForInitial:useDarkColors:", v27, v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v38, *MEMORY[0x24BE75AC8]);

      +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("AskForTimeTypeWebsite"), &stru_24DB8A1D0, 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v40, *MEMORY[0x24BE75D28]);

      break;
    case 1:
      objc_msgSend(v4, "budgetedIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      STCategoryNameWithIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, self, 0, 0, 0, 2, objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
      objc_msgSend(MEMORY[0x24BE84828], "sharedCache");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "imageForCategoryIdentifier:", v6);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v29, *MEMORY[0x24BE75AC8]);

      objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BE75D50]);
      +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      v32 = CFSTR("AskForTimeTypeCategory");
LABEL_17:
      objc_msgSend(v30, "localizedStringForKey:value:table:", v32, &stru_24DB8A1D0, 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v34, *MEMORY[0x24BE75D28]);

      break;
    case 0:
      objc_msgSend(v4, "budgetedIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE844B8], "sharedCache");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appInfoForBundleIdentifier:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)MEMORY[0x24BE75590];
      objc_msgSend(v8, "displayName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v10, self, 0, 0, 0, 2, objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v8, "source") == 2 && (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE84700]) & 1) == 0)
      {
        objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
        objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75B88]);
        v12 = (__CFString **)MEMORY[0x24BE75B70];
      }
      else
      {
        objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
        v12 = &STAppBundleIDKey;
      }
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, *v12);
      objc_msgSend(v8, "displayName");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v33, *MEMORY[0x24BE75D50]);

      +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      v32 = CFSTR("AskForTimeTypeApp");
      goto LABEL_17;
    default:
      v11 = 0;
      break;
  }
  v41 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "identifier");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "stringWithFormat:", CFSTR("ASK_%@"), v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIdentifier:", v43);

  objc_msgSend(v11, "setUserInfo:", v4);
  v44 = (objc_class *)objc_opt_class();
  NSStringFromClass(v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v45, *MEMORY[0x24BE75C60]);

  objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_24DBBE6D0, *MEMORY[0x24BE75E18]);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], 0x24DB91010);
  objc_msgSend(v11, "setControllerLoadAction:", sel_confirmRespondToRequest_);

  return v11;
}

- (id)requestSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeAllowancesCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v5, "pendingAskForTimeByIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v5, "pendingAskForTimeByIdentifier", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        -[STAskForTimeGroupSpecifierProvider _createSpecifierForAskForMore:](self, "_createSpecifierForAskForMore:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  return v8;
}

- (void)confirmRespondToRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[5];
  id v40;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sf_isiPad");

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", 0, 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_opt_new();
  objc_msgSend(v31, "setAllowedUnits:", 64);
  objc_msgSend(v31, "setUnitsStyle:", 3);
  objc_msgSend(v31, "stringFromTimeInterval:", 900.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BEBD3A8];
  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("AskForTimeActionApproveFifteen"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringWithFormat:", v11, v32);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __62__STAskForTimeGroupSpecifierProvider_confirmRespondToRequest___block_invoke;
  v39[3] = &unk_24DB868F8;
  v39[4] = self;
  v13 = v4;
  v40 = v13;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v12, 0, v39);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v14);

  v15 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("AskForTimeActionApproveHour"), &stru_24DB8A1D0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __62__STAskForTimeGroupSpecifierProvider_confirmRespondToRequest___block_invoke_43;
  v37[3] = &unk_24DB868F8;
  v37[4] = self;
  v18 = v13;
  v38 = v18;
  objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 0, v37);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v19);

  v20 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("AskForTimeActionApproveDay"), &stru_24DB8A1D0, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v17;
  v35[1] = 3221225472;
  v35[2] = __62__STAskForTimeGroupSpecifierProvider_confirmRespondToRequest___block_invoke_47;
  v35[3] = &unk_24DB868F8;
  v35[4] = self;
  v22 = v18;
  v36 = v22;
  objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 0, v35);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v23);

  v24 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("AskForTimeActionDontApprove"), &stru_24DB8A1D0, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v17;
  v33[1] = 3221225472;
  v33[2] = __62__STAskForTimeGroupSpecifierProvider_confirmRespondToRequest___block_invoke_51;
  v33[3] = &unk_24DB868F8;
  v33[4] = self;
  v34 = v22;
  v26 = v22;
  objc_msgSend(v24, "actionWithTitle:style:handler:", v25, 2, v33);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v27);

  v28 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ConfirmationButtonCancel"), &stru_24DB8A1D0, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "actionWithTitle:style:handler:", v29, 1, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v30);

  -[STGroupSpecifierProvider presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
}

uint64_t __62__STAskForTimeGroupSpecifierProvider_confirmRespondToRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondToRequest:withApproval:timeApproved:", *(_QWORD *)(a1 + 40), 1, &unk_24DBBE6E8);
}

uint64_t __62__STAskForTimeGroupSpecifierProvider_confirmRespondToRequest___block_invoke_43(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondToRequest:withApproval:timeApproved:", *(_QWORD *)(a1 + 40), 1, &unk_24DBBE700);
}

uint64_t __62__STAskForTimeGroupSpecifierProvider_confirmRespondToRequest___block_invoke_47(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondToRequest:withApproval:timeApproved:", *(_QWORD *)(a1 + 40), 1, &unk_24DBBE718);
}

uint64_t __62__STAskForTimeGroupSpecifierProvider_confirmRespondToRequest___block_invoke_51(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondToRequest:withApproval:timeApproved:", *(_QWORD *)(a1 + 40), 0, 0);
}

- (void)respondToRequest:(id)a3 withApproval:(BOOL)a4 timeApproved:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  BOOL v17;

  v5 = a4;
  v8 = a5;
  objc_msgSend(a3, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeAllowancesCoordinator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __81__STAskForTimeGroupSpecifierProvider_respondToRequest_withApproval_timeApproved___block_invoke;
  v14[3] = &unk_24DB867F0;
  v17 = v5;
  v15 = v8;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  objc_msgSend(v11, "respondToAskForTime:withApproval:timeApproved:completionHandler:", v12, v5, v13, v14);

}

void __81__STAskForTimeGroupSpecifierProvider_respondToRequest_withApproval_timeApproved___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  char v3;
  __CFString *v4;
  void *v5;
  float v6;
  void *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  __CFString *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    if (*(_BYTE *)(a1 + 48))
      v2 = CFSTR("Approving");
    else
      v2 = CFSTR("Not approving");
    v3 = objc_msgSend(*(id *)(a1 + 32), "isEqual:", &unk_24DBBE718);
    if ((v3 & 1) != 0)
    {
      v4 = CFSTR("all day");
    }
    else
    {
      v5 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(*(id *)(a1 + 32), "floatValue");
      objc_msgSend(v5, "numberWithDouble:", v6 / 60.0);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543874;
    v9 = v2;
    v10 = 2114;
    v11 = v4;
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%{public}@ request for %{public}@ [minutes] for request %{public}@", (uint8_t *)&v8, 0x20u);

    if ((v3 & 1) == 0)
  }
}

@end
