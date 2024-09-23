@implementation STWebFilterDetailController

- (STWebFilterDetailController)init
{
  STWebFilterDetailController *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STWebFilterDetailController;
  v2 = -[STPINListViewController init](&v7, sel_init);
  if (v2)
  {
    +[STScreenTimeSettingsUIBundle restrictionsStringsTable](STScreenTimeSettingsUIBundle, "restrictionsStringsTable");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("WebContentSpecifierName"), &stru_24DB8A1D0, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[STWebFilterDetailController setTitle:](v2, "setTitle:", v5);

  }
  return v2;
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_class *v31;
  uint64_t v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[5];

  v39[4] = *MEMORY[0x24BDAC8D0];
  -[STPINListViewController coordinator](self, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentPrivacyCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isLoaded"))
  {
    v35 = v5;
    v6 = (void *)objc_opt_new();
    +[STScreenTimeSettingsUIBundle restrictionsStringsTable](STScreenTimeSettingsUIBundle, "restrictionsStringsTable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("UnrestrictedAccessSpecifierName"), &stru_24DB8A1D0, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("LimitAdultWebsitesSpecifierName"), &stru_24DB8A1D0, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("AADC_AllowedWebsitesSpecifierName"), &stru_24DB8A1D0, v7);
    v11 = objc_claimAutoreleasedReturnValue();
    -[STWebFilterDetailController groupSpecifierWithConfiguration:key:footerText:radio:](self, "groupSpecifierWithConfiguration:key:footerText:radio:", 0x24DB8DC50, 0x24DB8DD50, 0, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v12;
    v37 = (void *)v9;
    -[STWebFilterDetailController listItemSpecifierWithGroup:name:value:](self, "listItemSpecifierWithGroup:name:value:", v12, v9, &unk_24DBBEE50);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v13;
    v36 = (void *)v10;
    -[STWebFilterDetailController listItemSpecifierWithGroup:name:value:](self, "listItemSpecifierWithGroup:name:value:", v12, v10, &unk_24DBBEE68);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2] = v14;
    v38 = (void *)v11;
    -[STWebFilterDetailController listItemSpecifierWithGroup:name:value:](self, "listItemSpecifierWithGroup:name:value:", v12, v11, &unk_24DBBEE80);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v39[3] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v16);

    -[STWebFilterDetailController getItemSpecifierValue:](self, "getItemSpecifierValue:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "unsignedIntegerValue");

    if (v18 == 1)
    {
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("WebContentAutoFilterFooterText"), &stru_24DB8A1D0, v7);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v26, *MEMORY[0x24BE75A68]);

      -[STWebFilterDetailController groupSpecifierWithConfiguration:key:footerText:radio:](self, "groupSpecifierWithConfiguration:key:footerText:radio:", CFSTR("system.webcontentfilter.basic"), CFSTR("filterWhiteList"), 0, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v27);
      -[STWebFilterDetailController _listItemSpecifiersForSitesGroup:](self, "_listItemSpecifiersForSitesGroup:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v28);

      -[STWebFilterDetailController _addButtonSpecifierWithGroup:action:](self, "_addButtonSpecifierWithGroup:action:", v27, sel_gatedAddSite_);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v29);

      -[STWebFilterDetailController groupSpecifierWithConfiguration:key:footerText:radio:](self, "groupSpecifierWithConfiguration:key:footerText:radio:", CFSTR("system.webcontentfilter.basic"), CFSTR("filterBlackList"), 0, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v22);
      -[STWebFilterDetailController _listItemSpecifiersForSitesGroup:](self, "_listItemSpecifiersForSitesGroup:", v22);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v30);

      -[STWebFilterDetailController _addButtonSpecifierWithGroup:action:](self, "_addButtonSpecifierWithGroup:action:", v22, sel_gatedAddSite_);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v36;
      v19 = v37;
      v5 = v35;
    }
    else
    {
      v20 = v36;
      v19 = v37;
      v5 = v35;
      if (v18 != 2)
      {
LABEL_8:
        v31 = (objc_class *)objc_msgSend(v6, "copy");
        v32 = (int)*MEMORY[0x24BE756E0];
        v33 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v32);
        *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v32) = v31;

        v25 = *(id *)((char *)&self->super.super.super.super.super.super.super.isa + v32);
        goto LABEL_9;
      }
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("WebContentCustomFilterFooterText"), &stru_24DB8A1D0, v7);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, *MEMORY[0x24BE75A68]);

      -[STWebFilterDetailController groupSpecifierWithConfiguration:key:footerText:radio:](self, "groupSpecifierWithConfiguration:key:footerText:radio:", CFSTR("system.webcontentfilter.basic"), CFSTR("siteWhiteList"), 0, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v22);
      -[STWebFilterDetailController _listItemSpecifiersForNamedSitesGroup:](self, "_listItemSpecifiersForNamedSitesGroup:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v23);

      -[STWebFilterDetailController _addButtonSpecifierWithGroup:action:](self, "_addButtonSpecifierWithGroup:action:", v22, sel_gatedAddNamedSite_);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "addObject:", v24);

    goto LABEL_8;
  }
  v25 = (id)MEMORY[0x24BDBD1A8];
LABEL_9:

  return v25;
}

- (id)_listItemSpecifiersForNamedSitesGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[STWebFilterDetailController getItemSpecifierValue:](self, "getItemSpecifierValue:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:selector:", CFSTR("payloadPageTitle"), 1, sel_localizedCaseInsensitiveCompare_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingDescriptors:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v15, "payloadPageTitle", (_QWORD)v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[STWebFilterDetailController listItemSpecifierWithGroup:name:value:](self, "listItemSpecifierWithGroup:name:value:", v4, v16, v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v17);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  return v6;
}

- (id)_listItemSpecifiersForSitesGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[STWebFilterDetailController getItemSpecifierValue:](self, "getItemSpecifierValue:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        -[STWebFilterDetailController listItemSpecifierWithGroup:name:value:](self, "listItemSpecifierWithGroup:name:value:", v4, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[STPINListViewController coordinator](self, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentPrivacyCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("viewModel.isLoaded"), CFSTR("WebFilterViewModelLoadedContext"));

  v5.receiver = self;
  v5.super_class = (Class)STWebFilterDetailController;
  -[STListViewController dealloc](&v5, sel_dealloc);
}

- (void)setCoordinator:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  -[STPINListViewController coordinator](self, "coordinator");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    -[STPINListViewController coordinator](self, "coordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentPrivacyCoordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:forKeyPath:context:", self, CFSTR("viewModel.isLoaded"), CFSTR("WebFilterViewModelLoadedContext"));

    v10.receiver = self;
    v10.super_class = (Class)STWebFilterDetailController;
    -[STPINListViewController setCoordinator:](&v10, sel_setCoordinator_, v4);
    -[STPINListViewController coordinator](self, "coordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentPrivacyCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:forKeyPath:options:context:", self, CFSTR("viewModel.isLoaded"), 0, CFSTR("WebFilterViewModelLoadedContext"));

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  void *v8;
  void *v9;
  int v10;
  objc_super v11;

  if (a6 == CFSTR("WebFilterViewModelLoadedContext"))
  {
    -[STPINListViewController coordinator](self, "coordinator", a3, a4, a5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentPrivacyCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isLoaded");

    if (v10)
      -[STWebFilterDetailController reloadSpecifiers](self, "reloadSpecifiers");
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)STWebFilterDetailController;
    -[STListViewController observeValueForKeyPath:ofObject:change:context:](&v11, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)gatedAddNamedSite:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (-[PSListController st_shouldShowPINSheetForPINSpecifier](self, "st_shouldShowPINSheetForPINSpecifier"))
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __49__STWebFilterDetailController_gatedAddNamedSite___block_invoke;
    v5[3] = &unk_24DB864E8;
    v5[4] = self;
    v6 = v4;
    -[PSListController st_showPINSheetWithCompletion:](self, "st_showPINSheetWithCompletion:", v5);

  }
  else
  {
    -[STWebFilterDetailController addNamedSite:](self, "addNamedSite:", v4);
  }

}

uint64_t __49__STWebFilterDetailController_gatedAddNamedSite___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addNamedSite:", *(_QWORD *)(result + 40));
  return result;
}

- (void)gatedAddSite:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (-[PSListController st_shouldShowPINSheetForPINSpecifier](self, "st_shouldShowPINSheetForPINSpecifier"))
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __44__STWebFilterDetailController_gatedAddSite___block_invoke;
    v5[3] = &unk_24DB864E8;
    v5[4] = self;
    v6 = v4;
    -[PSListController st_showPINSheetWithCompletion:](self, "st_showPINSheetWithCompletion:", v5);

  }
  else
  {
    -[STWebFilterDetailController addSite:](self, "addSite:", v4);
  }

}

uint64_t __44__STWebFilterDetailController_gatedAddSite___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addSite:", *(_QWORD *)(result + 40));
  return result;
}

- (void)addNamedSite:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = (id)objc_opt_new();
  -[STPINListViewController coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentPrivacyCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCoordinator:", v6);

  objc_msgSend(v8, "setParentController:", self);
  objc_msgSend(v4, "objectForKeyedSubscript:", 0x24DB8DCB0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setRestriction:", v7);
  objc_msgSend(v8, "setIsNamedSite:", 1);
  -[STWebFilterDetailController showController:animate:](self, "showController:animate:", v8, 1);

}

- (void)addSite:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = (id)objc_opt_new();
  -[STPINListViewController coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentPrivacyCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCoordinator:", v6);

  objc_msgSend(v8, "setParentController:", self);
  objc_msgSend(v4, "objectForKeyedSubscript:", 0x24DB8DCB0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setRestriction:", v7);
  -[STWebFilterDetailController showController:animate:](self, "showController:animate:", v8, 1);

}

- (id)getItemSpecifierValue:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  objc_msgSend(a3, "objectForKeyedSubscript:", 0x24DB8DCB0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STPINListViewController coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentPrivacyCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "valuesByRestriction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(v7, "defaultValueForRestriction:", v4);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

- (void)saveRemovingItem:(id)a3 value:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v6 = a4;
  -[STPINListViewController coordinator](self, "coordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentPrivacyCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "valuesByRestriction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v24);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(v9, "defaultValueForRestriction:", v24);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  objc_msgSend(v24, "payloadKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("siteWhiteList"));

  v17 = (void *)MEMORY[0x24BDD1758];
  if (v16)
  {
    objc_msgSend(v6, "payloadAddress");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "predicateWithFormat:", CFSTR("%K != %@"), CFSTR("payloadAddress"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "filteredArrayUsingPredicate:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("self != %@"), v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "filteredArrayUsingPredicate:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[STPINListViewController coordinator](self, "coordinator");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "contentPrivacyCoordinator");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v20, "copy");
  objc_msgSend(v22, "saveRestrictionValue:forItem:completionHandler:", v23, v24, &__block_literal_global_27);

}

- (void)saveItemValue:(id)a3 specifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  id v16;
  _QWORD v17[5];

  v6 = a3;
  objc_msgSend(a4, "objectForKeyedSubscript:", 0x24DB8DCB0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STPINListViewController coordinator](self, "coordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentPrivacyCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __55__STWebFilterDetailController_saveItemValue_specifier___block_invoke;
  v17[3] = &unk_24DB866E0;
  v17[4] = self;
  objc_msgSend(v9, "saveRestrictionValue:forItem:completionHandler:", v6, v7, v17);

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x24BE84498], "sharedController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE84498], "sharedController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "viewContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v13 = objc_msgSend(v10, "saveContext:error:", v12, &v16);
    v14 = v16;

    if ((v13 & 1) == 0)
    {
      +[STUILog communicationSafety](STUILog, "communicationSafety");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        __94__STCommunicationSafetyAnalyticsTipGroupSpecifierProvider__setCommunicationSafetyAnalyticsTip__block_invoke_3_cold_1((uint64_t)v14, v15);

    }
  }

}

uint64_t __55__STWebFilterDetailController_saveItemValue_specifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performSelectorOnMainThread:withObject:waitUntilDone:", sel_reloadSpecifiers, 0, 0);
}

- (void)updateParent
{
  id v2;

  -[STWebFilterDetailController parentMediaRestrictionsController](self, "parentMediaRestrictionsController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_reloadSpecifiers, 0, 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  id WeakRetained;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STWebFilterDetailController;
  -[STPINListViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.super.super.isa
                                            + (int)*MEMORY[0x24BE75790]));
  -[STWebFilterDetailController setParentMediaRestrictionsController:](self, "setParentMediaRestrictionsController:", WeakRetained);

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STWebFilterDetailController.viewDidAppear", v5, 2u);
  }
}

- (void)willResignActive
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STWebFilterDetailController;
  -[STWebFilterDetailController willResignActive](&v3, sel_willResignActive);
  -[STWebFilterDetailController updateParent](self, "updateParent");
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint8_t v4[16];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STWebFilterDetailController;
  -[STWebFilterDetailController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[STWebFilterDetailController updateParent](self, "updateParent");
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STWebFilterDetailController.viewWillDisappear", v4, 2u);
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  BOOL v6;

  -[STWebFilterDetailController specifierAtIndexPath:](self, "specifierAtIndexPath:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", 0x24DB8DCB0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "restrictionType") == 2 && objc_msgSend(v4, "cellType") != 13;

  return v6;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  -[STWebFilterDetailController specifierAtIndexPath:](self, "specifierAtIndexPath:", a5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PSListController st_shouldShowPINSheetForPINSpecifier](self, "st_shouldShowPINSheetForPINSpecifier"))
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __78__STWebFilterDetailController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke;
    v9[3] = &unk_24DB864E8;
    v9[4] = self;
    v10 = v6;
    -[PSListController st_showPINSheetWithCompletion:](self, "st_showPINSheetWithCompletion:", v9);

  }
  else
  {
    -[STWebFilterDetailController removeSpecifier:animated:](self, "removeSpecifier:animated:", v6, 1);
    objc_msgSend(v6, "objectForKeyedSubscript:", 0x24DB8DCB0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE75DA0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[STWebFilterDetailController saveRemovingItem:value:](self, "saveRemovingItem:value:", v7, v8);

  }
}

void __78__STWebFilterDetailController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  id v5;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeSpecifier:animated:", *(_QWORD *)(a1 + 40), 1);
    v3 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", 0x24DB8DCB0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x24BE75DA0]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "saveRemovingItem:value:", v5, v4);

  }
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v5 = a4;
  -[STWebFilterDetailController specifierAtIndexPath:](self, "specifierAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STWebFilterDetailController getGroupSpecifierForSpecifier:](self, "getGroupSpecifierForSpecifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE75B28]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "BOOLValue") & 1) != 0)
  {

LABEL_5:
    v10 = v5;
    goto LABEL_6;
  }
  v9 = objc_msgSend(v6, "cellType");

  if (v9 != 3)
    goto LABEL_5;
  v10 = 0;
LABEL_6:

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
  void *v14;
  objc_super v15;
  _QWORD v16[5];
  id v17;

  v6 = a3;
  v7 = a4;
  -[STWebFilterDetailController specifierAtIndexPath:](self, "specifierAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STWebFilterDetailController getGroupSpecifierForSpecifier:](self, "getGroupSpecifierForSpecifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", 0x24DB8DCB0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE75B28]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  if (v12)
    v13 = v10 == 0;
  else
    v13 = 1;
  if (!v13)
  {
    if (-[PSListController st_shouldShowPINSheetForPINSpecifier](self, "st_shouldShowPINSheetForPINSpecifier"))
    {
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __65__STWebFilterDetailController_tableView_didSelectRowAtIndexPath___block_invoke;
      v16[3] = &unk_24DB864E8;
      v16[4] = self;
      v17 = v8;
      -[PSListController st_showPINSheetWithCompletion:](self, "st_showPINSheetWithCompletion:", v16);

    }
    else
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE75DA0]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[STWebFilterDetailController saveItemValue:specifier:](self, "saveItemValue:specifier:", v14, v8);

    }
  }
  v15.receiver = self;
  v15.super_class = (Class)STWebFilterDetailController;
  -[STPINListViewController tableView:didSelectRowAtIndexPath:](&v15, sel_tableView_didSelectRowAtIndexPath_, v6, v7);

}

void __65__STWebFilterDetailController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  id v4;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x24BE75DA0]);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "saveItemValue:specifier:", v4, *(_QWORD *)(a1 + 40));

  }
}

- (id)groupSpecifierWithConfiguration:(id)a3 key:(id)a4 footerText:(id)a5 radio:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
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
  void *v23;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  +[STScreenTimeSettingsUIBundle restrictionsStringsTable](STScreenTimeSettingsUIBundle, "restrictionsStringsTable");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[STPINListViewController coordinator](self, "coordinator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "contentPrivacyCoordinator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "viewModel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "visibleRestrictionWithConfiguration:key:", v12, v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(v18, "uiLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", v20, &stru_24DB8A1D0, v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "groupSpecifierWithName:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "setObject:forKeyedSubscript:", v18, 0x24DB8DCB0);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, *MEMORY[0x24BE75B28]);

  if (v10)
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE75A68]);

  return v22;
}

- (id)listItemSpecifierWithGroup:(id)a3 name:(id)a4 value:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a3;
  v9 = (void *)MEMORY[0x24BE75590];
  v10 = a5;
  objc_msgSend(v9, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", a4, self, 0, 0, 0, 3, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", 0x24DB8DCB0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDD16E0];
  -[STPINListViewController coordinator](self, "coordinator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentPrivacyCoordinator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "viewModel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberWithBool:", objc_msgSend(v16, "restrictionsEnabled"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BE75A18]);

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, 0x24DB8DCB0);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE75DA0]);
  -[STWebFilterDetailController getItemSpecifierValue:](self, "getItemSpecifierValue:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v10, "isEqual:", v18);

  if ((_DWORD)v9)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE75C20]);

  return v11;
}

- (id)_addButtonSpecifierWithGroup:(id)a3 action:(SEL)a4
{
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

  objc_msgSend(a3, "objectForKeyedSubscript:", 0x24DB8DCB0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle restrictionsStringsTable](STScreenTimeSettingsUIBundle, "restrictionsStringsTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("AddWebsiteButton"), &stru_24DB8A1D0, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, self, 0, 0, 0, 13, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD16E0];
  -[STPINListViewController coordinator](self, "coordinator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentPrivacyCoordinator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "viewModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithBool:", objc_msgSend(v13, "restrictionsEnabled"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BE75A18]);

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, 0x24DB8DCB0);
  objc_msgSend(v9, "setButtonAction:", a4);

  return v9;
}

- (void)didCancelEnteringPIN
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STWebFilterDetailController;
  -[STPINListViewController didCancelEnteringPIN](&v3, sel_didCancelEnteringPIN);
  -[STWebFilterDetailController reloadSpecifiers](self, "reloadSpecifiers");
}

- (STContentPrivacyMediaRestrictionsDetailController)parentMediaRestrictionsController
{
  return (STContentPrivacyMediaRestrictionsDetailController *)objc_loadWeakRetained((id *)&self->_parentMediaRestrictionsController);
}

- (void)setParentMediaRestrictionsController:(id)a3
{
  objc_storeWeak((id *)&self->_parentMediaRestrictionsController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentMediaRestrictionsController);
}

@end
