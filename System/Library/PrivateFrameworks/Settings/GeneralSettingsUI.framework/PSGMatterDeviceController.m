@implementation PSGMatterDeviceController

+ (BOOL)shouldShowTestSpecifiers
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "sf_isInternalInstall"))
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("PSGMatterControllerShowTestDevices"));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)testSpecifiers
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

+ (id)serviceSpecifierWithPairing:(id)a3 target:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = (void *)MEMORY[0x24BE75590];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "fabric");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ecosystem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "vendor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, v6, 0, sel_detailText_, 0, 4, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setIdentifier:", v14);

  objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v7, CFSTR("PSGDevicePairingKey"));
  objc_msgSend(v7, "fabric");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "displayName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BE75DA0]);

  return v12;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PSGMatterDeviceController;
  -[PSGMatterDeviceController viewDidLoad](&v4, sel_viewDidLoad);
  -[PSGMatterDeviceController table](self, "table");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsSelectionDuringEditing:", 1);

}

- (void)didBecomeActive:(id)a3
{
  -[PSGMatterDeviceController reloadServicesWithCompletion:](self, "reloadServicesWithCompletion:", 0);
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v28;
  uint64_t v29;

  v3 = (int)*MEMORY[0x24BE756E0];
  if (!*(Class *)((char *)&self->super.super.super.super.super.super.isa + v3))
  {
    v29 = (int)*MEMORY[0x24BE756E0];
    -[PSGMatterDeviceController pairing](self, "pairing");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[PSGMatterDeviceController specifier](self, "specifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PSGDevicePairingKey"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSGMatterDeviceController setPairing:](self, "setPairing:", v6);

    }
    v7 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("MATTER_INFO_GROUP"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v28);
    v8 = (void *)MEMORY[0x24BE75590];
    PSG_LocalizedStringForMatter(CFSTR("MATTER_NAME"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, self, 0, sel_detailText_, 0, 4, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setIdentifier:", CFSTR("MATTER_INFO_NAME"));
    -[PSGMatterDeviceController pairing](self, "pairing");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x24BE75DA0];
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE75DA0]);

    v14 = *MEMORY[0x24BE759C8];
    v15 = MEMORY[0x24BDBD1C8];
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE759C8]);
    objc_msgSend(v7, "addObject:", v10);
    v16 = (void *)MEMORY[0x24BE75590];
    PSG_LocalizedStringForMatter(CFSTR("MATTER_SERIAL"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v17, self, 0, sel_detailText_, 0, 4, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setIdentifier:", CFSTR("MATTER_INFO_SERIAL"));
    -[PSGMatterDeviceController pairing](self, "pairing");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "serialNumber");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, v13);

    objc_msgSend(v18, "setObject:forKeyedSubscript:", v15, v14);
    objc_msgSend(v7, "addObject:", v18);
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("MATTER_INFO_REMOVE_GROUP"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v21);
    v22 = (void *)MEMORY[0x24BE75590];
    PSG_LocalizedStringForMatter(CFSTR("ACCESSORY_REMOVE_FROM_ALL_PROMPT"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v23, self, 0, sel_detailText_, 0, 13, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "setIdentifier:", CFSTR("MATTER_INFO_REMOVE"));
    objc_msgSend(v24, "setButtonAction:", sel_showDeleteFromMatterLocker);
    objc_msgSend(v24, "setObject:forKeyedSubscript:", &unk_24F9D4248, *MEMORY[0x24BE75860]);
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BE75868]);
    objc_msgSend(v7, "addObject:", v24);
    v25 = (objc_class *)objc_msgSend(v7, "copy");
    v3 = v29;
    v26 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v29);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v29) = v25;

  }
  -[PSGMatterDeviceController reloadServicesWithCompletion:](self, "reloadServicesWithCompletion:", 0);
  return *(id *)((char *)&self->super.super.super.super.super.super.isa + v3);
}

- (void)reloadServicesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  void *v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PSGMatterDeviceController pairingManager](self, "pairingManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDDB860]);
    -[PSGMatterDeviceController pairing](self, "pairing");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithSystemCommissionerPairing:", v7);
    -[PSGMatterDeviceController setPairingManager:](self, "setPairingManager:", v8);

  }
  _PSGLoggingFacility();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[PSGMatterDeviceController reloadServicesWithCompletion:]";
    _os_log_impl(&dword_22E024000, v9, OS_LOG_TYPE_DEFAULT, "%s: querying for pairings.", buf, 0xCu);
  }

  -[PSEditableListController setEditingButtonHidden:animated:](self, "setEditingButtonHidden:animated:", 1, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithCustomView:", v10);
  v18 = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGMatterDeviceController navigationItem](self, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRightBarButtonItems:", v12);

  objc_msgSend(v10, "startAnimating");
  -[PSGMatterDeviceController pairingManager](self, "pairingManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __58__PSGMatterDeviceController_reloadServicesWithCompletion___block_invoke;
  v16[3] = &unk_24F9C7DD0;
  v16[4] = self;
  v17 = v4;
  v15 = v4;
  objc_msgSend(v14, "fetchPairingsWithCompletionHandler:", v16);

}

void __58__PSGMatterDeviceController_reloadServicesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id obj;
  uint64_t v32;
  _QWORD block[4];
  id v34;
  uint64_t v35;
  id v36;
  BOOL v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  if (v5)
  {
    _PSGLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __58__PSGMatterDeviceController_reloadServicesWithCompletion___block_invoke_cold_1();

  }
  v28 = v5;
  v7 = (void *)objc_opt_new();
  if (+[PSGMatterDeviceController shouldShowTestSpecifiers](PSGMatterDeviceController, "shouldShowTestSpecifiers"))
  {
    +[PSGMatterDeviceController testSpecifiers](PSGMatterDeviceController, "testSpecifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v8);

  }
  v29 = v7;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v4;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v9)
  {
    v10 = v9;
    v32 = *(_QWORD *)v39;
    v11 = (void *)*MEMORY[0x24BDDB838];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v39 != v32)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        _PSGLoggingFacility();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v43 = "-[PSGMatterDeviceController reloadServicesWithCompletion:]_block_invoke";
          v44 = 2112;
          v45 = v13;
          _os_log_impl(&dword_22E024000, v14, OS_LOG_TYPE_DEFAULT, "%s: found device pairing %@", buf, 0x16u);
        }

        objc_msgSend(v13, "fabric");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "ecosystem");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "vendor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "integerValue");
        v20 = objc_msgSend(v11, "integerValue");

        if (v19 != v20)
        {
          +[PSGMatterDeviceController serviceSpecifierWithPairing:target:](PSGMatterDeviceController, "serviceSpecifierWithPairing:target:", v13, *(_QWORD *)(a1 + 32));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObject:", v21);

        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v29, "count"))
  {
    v22 = (void *)MEMORY[0x24BE75590];
    PSG_LocalizedStringForMatter(CFSTR("CONNECTED_SERVICES"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "groupSpecifierWithID:name:", CFSTR("CONNECTED_SERVICES"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "insertObject:atIndex:", v24, 0);
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__PSGMatterDeviceController_reloadServicesWithCompletion___block_invoke_38;
  block[3] = &unk_24F9C7DA8;
  v25 = *(_QWORD *)(a1 + 32);
  v26 = *(void **)(a1 + 40);
  v34 = v29;
  v35 = v25;
  v37 = v28 != 0;
  v36 = v26;
  v27 = v29;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __58__PSGMatterDeviceController_reloadServicesWithCompletion___block_invoke_38(uint64_t a1)
{
  void *v2;
  void *v3;
  char *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(*(id *)(a1 + 40), "serviceSpecifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(char **)(a1 + 40);
  if (*(_QWORD *)&v4[*MEMORY[0x24BE756E0]])
  {
    objc_msgSend(v4, "specifierForID:", CFSTR("MATTER_INFO_GROUP"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (*(_BYTE *)(a1 + 56))
    {
      PSG_LocalizedStringForMatter(CFSTR("MATTER_NO_RESPONSE_FOOTER"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE75A68]);

    }
    else
    {
      objc_msgSend(v5, "setObject:forKeyedSubscript:", &stru_24F9C95C8, *MEMORY[0x24BE75A68]);
    }
    objc_msgSend(*(id *)(a1 + 40), "reloadSpecifier:", v6);
    v8 = objc_msgSend(v2, "count");
    v9 = objc_msgSend(v3, "count");
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = v3;
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
          objc_msgSend(*(id *)(a1 + 40), "removeSpecifier:animated:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), 0, (_QWORD)v19);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }

    objc_msgSend(*(id *)(a1 + 40), "insertContiguousSpecifiers:atIndex:animated:", v2, 0, v8 != v9);
    v4 = *(char **)(a1 + 40);
  }
  objc_msgSend(v4, "setServiceSpecifiers:", v2, (_QWORD)v19);
  objc_msgSend(*(id *)(a1 + 40), "navigationItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setRightBarButtonItems:", 0);

  v16 = *(void **)(a1 + 40);
  objc_msgSend(v16, "serviceSpecifiers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setEditingButtonHidden:animated:", objc_msgSend(v17, "count") == 0, 0);

  v18 = *(_QWORD *)(a1 + 48);
  if (v18)
    (*(void (**)(void))(v18 + 16))();

}

- (id)detailText:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x24BE75DA0]);
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return -[PSGMatterDeviceController isServiceAtIndexPath:](self, "isServiceAtIndexPath:", a4);
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return -[PSGMatterDeviceController isServiceAtIndexPath:](self, "isServiceAtIndexPath:", a4);
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  return PSG_LocalizedStringForMatter(CFSTR("TABLEVIEW_SLIDE_TO_REMOVE_BUTTON"));
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  _BOOL4 v8;
  void *v9;
  id v10;

  v7 = a5;
  if (a4 == 1)
  {
    v10 = v7;
    v8 = -[PSGMatterDeviceController isServiceAtIndexPath:](self, "isServiceAtIndexPath:", v7);
    v7 = v10;
    if (v8)
    {
      -[PSGMatterDeviceController specifierAtIndexPath:](self, "specifierAtIndexPath:", v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSGMatterDeviceController showDeleteService:](self, "showDeleteService:", v9);

      v7 = v10;
    }
  }

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PSGMatterDeviceController;
  v6 = a4;
  -[PSGMatterDeviceController tableView:cellForRowAtIndexPath:](&v16, sel_tableView_cellForRowAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGMatterDeviceController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v16.receiver, v16.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_6;
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE75AC0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("MATTER_INFO_REMOVE"));

  if (!v10)
    goto LABEL_6;
  v11 = v7;
  if (objc_msgSend(v11, "type") != 13)
  {

LABEL_6:
    v14 = v7;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTextColor:", v12);

LABEL_7:
  return v7;
}

- (BOOL)isServiceAtIndexPath:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  -[PSGMatterDeviceController specifierAtIndexPath:](self, "specifierAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PSGDevicePairingKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (void)showDeleteService:(id)a3
{
  id v4;
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
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  _QWORD v24[4];
  id v25;
  PSGMatterDeviceController *v26;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD17C8];
  PSG_LocalizedStringForMatter(CFSTR("SERVICE_DELETE_PROMPT_DETAIL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BEBD3B0];
  PSG_LocalizedStringForMatter(CFSTR("SERVICE_DELETE_PROMPT"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", v10, v8, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BDD17C8];
  PSG_LocalizedStringForMatter(CFSTR("SERVICE_DELETE_PROMPT_DELETE"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x24BEBD3A8];
  v17 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __47__PSGMatterDeviceController_showDeleteService___block_invoke;
  v24[3] = &unk_24F9C7E20;
  v25 = v4;
  v26 = self;
  v18 = v4;
  objc_msgSend(v16, "actionWithTitle:style:handler:", v15, 2, v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v19);

  v20 = (void *)MEMORY[0x24BEBD3A8];
  PSG_LocalizedStringForMatter(CFSTR("SERVICE_DELETE_PROMPT_CANCEL"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v17;
  v23[1] = 3221225472;
  v23[2] = __47__PSGMatterDeviceController_showDeleteService___block_invoke_2;
  v23[3] = &unk_24F9C7E48;
  v23[4] = self;
  objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 1, v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v22);

  -[PSGMatterDeviceController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
}

void __47__PSGMatterDeviceController_showDeleteService___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("PSGDevicePairingKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "pairingManager");
    v3 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __47__PSGMatterDeviceController_showDeleteService___block_invoke_60;
    v6[3] = &unk_24F9C7DF8;
    v6[4] = *(_QWORD *)(a1 + 40);
    -[NSObject removePairingWithUUID:completionHandler:](v3, "removePairingWithUUID:completionHandler:", v4, v6);

  }
  else
  {
    _PSGLoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v8 = "-[PSGMatterDeviceController showDeleteService:]_block_invoke";
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_22E024000, v3, OS_LOG_TYPE_DEFAULT, "%s: not deleting device because it has no pairing.: %@", buf, 0x16u);

    }
  }

}

void __47__PSGMatterDeviceController_showDeleteService___block_invoke_60(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = a2;
  if (v3)
  {
    _PSGLoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __47__PSGMatterDeviceController_showDeleteService___block_invoke_60_cold_1();

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__PSGMatterDeviceController_showDeleteService___block_invoke_61;
  block[3] = &unk_24F9C7C88;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __47__PSGMatterDeviceController_showDeleteService___block_invoke_61(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadServicesWithCompletion:", 0);
}

uint64_t __47__PSGMatterDeviceController_showDeleteService___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadServicesWithCompletion:", 0);
}

- (void)showDeleteFromMatterLocker
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
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];

  v3 = (void *)MEMORY[0x24BEBD3B0];
  PSG_LocalizedStringForMatter(CFSTR("ACCESSORY_DELETE_PROMPT"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PSG_LocalizedStringForMatter(CFSTR("ACCESSORY_DELETE_PROMPT_DETAIL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BEBD3A8];
  PSG_LocalizedStringForMatter(CFSTR("ACCESSORY_DELETE_PROMPT_REMOVE_FROM_MATTER"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __55__PSGMatterDeviceController_showDeleteFromMatterLocker__block_invoke;
  v15[3] = &unk_24F9C7E48;
  v15[4] = self;
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 2, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v10);

  v11 = (void *)MEMORY[0x24BEBD3A8];
  PSG_LocalizedStringForMatter(CFSTR("ACCESSORY_DELETE_PROMPT_CANCEL"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __55__PSGMatterDeviceController_showDeleteFromMatterLocker__block_invoke_76;
  v14[3] = &unk_24F9C7E48;
  v14[4] = self;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 1, v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v13);

  -[PSGMatterDeviceController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
}

void __55__PSGMatterDeviceController_showDeleteFromMatterLocker__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PSGDevicePairingKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_opt_new();
    objc_msgSend(v3, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __55__PSGMatterDeviceController_showDeleteFromMatterLocker__block_invoke_73;
    v6[3] = &unk_24F9C7DF8;
    v6[4] = *(_QWORD *)(a1 + 32);
    -[NSObject removePairingWithUUID:completionHandler:](v4, "removePairingWithUUID:completionHandler:", v5, v6);

  }
  else
  {
    _PSGLoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v8 = "-[PSGMatterDeviceController showDeleteFromMatterLocker]_block_invoke";
      _os_log_impl(&dword_22E024000, v4, OS_LOG_TYPE_DEFAULT, "%s: not deleting device because it has no pairing.", buf, 0xCu);
    }
  }

}

void __55__PSGMatterDeviceController_showDeleteFromMatterLocker__block_invoke_73(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__PSGMatterDeviceController_showDeleteFromMatterLocker__block_invoke_2;
  v6[3] = &unk_24F9C7E70;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __55__PSGMatterDeviceController_showDeleteFromMatterLocker__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v2 = a1 + 32;
  if (*(_QWORD *)(a1 + 32))
  {
    _PSGLoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __55__PSGMatterDeviceController_showDeleteFromMatterLocker__block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  }
  objc_msgSend(*(id *)(a1 + 40), "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "popViewControllerAnimated:", 1);

}

uint64_t __55__PSGMatterDeviceController_showDeleteFromMatterLocker__block_invoke_76(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadServicesWithCompletion:", 0);
}

- (MTSSystemCommissionerPairing)pairing
{
  return self->_pairing;
}

- (void)setPairing:(id)a3
{
  objc_storeStrong((id *)&self->_pairing, a3);
}

- (MTSDevicePairingManager)pairingManager
{
  return self->_pairingManager;
}

- (void)setPairingManager:(id)a3
{
  objc_storeStrong((id *)&self->_pairingManager, a3);
}

- (NSArray)serviceSpecifiers
{
  return self->_serviceSpecifiers;
}

- (void)setServiceSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_serviceSpecifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceSpecifiers, 0);
  objc_storeStrong((id *)&self->_pairingManager, 0);
  objc_storeStrong((id *)&self->_pairing, 0);
}

void __58__PSGMatterDeviceController_reloadServicesWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E024000, v0, v1, "%s: error when fetching pairings: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __47__PSGMatterDeviceController_showDeleteService___block_invoke_60_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E024000, v0, v1, "%s: error when deleting pairing: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __55__PSGMatterDeviceController_showDeleteFromMatterLocker__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22E024000, a2, a3, "%s: error when deleting pairing: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
