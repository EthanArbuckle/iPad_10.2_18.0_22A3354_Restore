@implementation PSGMatterController

+ (void)shouldShowMatterControllerWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __64__PSGMatterController_shouldShowMatterControllerWithCompletion___block_invoke;
  v6[3] = &unk_24F9C8710;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "fetchPairingsWithCompletionHandler:", v6);

}

void __64__PSGMatterController_shouldShowMatterControllerWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL8 v8;
  void *v9;
  uint64_t v10;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _PSGLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __64__PSGMatterController_shouldShowMatterControllerWithCompletion___block_invoke_cold_1();

  }
  if (objc_msgSend(v5, "count"))
  {
    v8 = 1;
  }
  else if (+[PSGMatterController shouldShowTestSpecifiers](PSGMatterController, "shouldShowTestSpecifiers"))
  {
    +[PSGMatterController testSpecifiers](PSGMatterController, "testSpecifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "count") != 0;

  }
  else
  {
    v8 = 0;
  }
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, _BOOL8))(v10 + 16))(v10, v8);

}

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

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "accessorySpecifierWithID:name:pairing:target:", v5, CFSTR("Mock test device #1"), 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "accessorySpecifierWithID:name:pairing:target:", v8, CFSTR("Mock test device #2"), 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "accessorySpecifierWithID:name:pairing:target:", v11, CFSTR("Mock test device #3"), 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  v13 = (void *)objc_msgSend(v3, "copy");
  return v13;
}

+ (id)accessorySpecifierWithID:(id)a3 name:(id)a4 pairing:(id)a5 target:(id)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v9 = (void *)MEMORY[0x24BE75590];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v9, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v12, v10, 0, sel_detailText_, objc_opt_class(), 2, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setIdentifier:", v13);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, CFSTR("PSGDevicePairingKey"));

  return v14;
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
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  NSRange v17;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = (void *)objc_opt_new();
    PSG_LocalizedStringForMatter(CFSTR("MATTER_ACCESSORIES_GROUP_FOOTER"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PSG_LocalizedStringForMatter(CFSTR("MATTER_ACCESSORIES_GROUP_FOOTER_LINK"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("MATTER_ACCESSORIES_GROUP"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE75A30]);

    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BE75A58]);
    v17.location = objc_msgSend(v8, "rangeOfString:", v7);
    NSStringFromRange(v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE75A40]);

    objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BE75A50]);

    objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("aboutLinkWasTapped"), *MEMORY[0x24BE75A38]);
    objc_msgSend(v5, "addObject:", v9);
    v14 = (objc_class *)objc_msgSend(v5, "copy");
    v15 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = v14;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)detailText:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x24BE75DA0]);
}

- (BOOL)shouldDeferPushForSpecifierID:(id)a3
{
  return 1;
}

- (void)didBecomeActive:(id)a3
{
  -[PSGMatterController reloadAccessoriesWithCompletion:](self, "reloadAccessoriesWithCompletion:", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;
  _QWORD v14[2];

  v3 = a3;
  v14[1] = *MEMORY[0x24BDAC8D0];
  -[PSGMatterController reloadAccessoriesWithCompletion:](self, "reloadAccessoriesWithCompletion:", 0);
  v13.receiver = self;
  v13.super_class = (Class)PSGMatterController;
  -[PSGMatterController viewDidAppear:](&v13, sel_viewDidAppear_, v3);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.General/MATTER_ACCESSORIES"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PSG_BundleForGeneralSettingsUIFramework();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithKey:table:locale:bundleURL:", CFSTR("MATTER_ACCESSORIES"), CFSTR("General"), v7, v9);

  objc_msgSend(MEMORY[0x24BDD19B8], "general_rootPaneComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGMatterController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.matter-accessories"), v10, v12, v5);

}

- (void)aboutLinkWasTapped
{
  void *v2;
  int v3;
  const __CFString *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sf_isiPad");

  if (v3)
    v4 = CFSTR("https://support.apple.com/ht213441?cid=mc-ols-iphone-article_ht213441-ipados_ui-09062022");
  else
    v4 = CFSTR("https://support.apple.com/ht213441?cid=mc-ols-iphone-articl_ht213441-ios_ui-09062022");
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openURL:options:completionHandler:", v6, MEMORY[0x24BDBD1B8], 0);

}

- (void)reloadAccessoriesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PSGMatterController pairingManager](self, "pairingManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_opt_new();
    -[PSGMatterController setPairingManager:](self, "setPairingManager:", v6);

  }
  _PSGLoggingFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[PSGMatterController reloadAccessoriesWithCompletion:]";
    _os_log_impl(&dword_22E024000, v7, OS_LOG_TYPE_DEFAULT, "%s: querying for pairings.", buf, 0xCu);
  }

  -[PSGMatterController pairingManager](self, "pairingManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __55__PSGMatterController_reloadAccessoriesWithCompletion___block_invoke;
  v10[3] = &unk_24F9C7DD0;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "fetchPairingsWithCompletionHandler:", v10);

}

void __55__PSGMatterController_reloadAccessoriesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id obj;
  _QWORD block[4];
  id v30;
  uint64_t v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _PSGLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __55__PSGMatterController_reloadAccessoriesWithCompletion___block_invoke_cold_1();

  }
  v27 = v6;
  v8 = (void *)objc_opt_new();
  if (+[PSGMatterController shouldShowTestSpecifiers](PSGMatterController, "shouldShowTestSpecifiers"))
  {
    +[PSGMatterController testSpecifiers](PSGMatterController, "testSpecifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v9);

  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v5;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v14, "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "UUIDString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[PSGMatterController accessorySpecifierWithID:name:pairing:target:](PSGMatterController, "accessorySpecifierWithID:name:pairing:target:", v16, v17, v14, *(_QWORD *)(a1 + 32));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        _PSGLoggingFacility();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v14, "name");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "uuid");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "UUIDString");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v39 = "-[PSGMatterController reloadAccessoriesWithCompletion:]_block_invoke";
          v40 = 2112;
          v41 = v20;
          v42 = 2112;
          v43 = v22;
          _os_log_impl(&dword_22E024000, v19, OS_LOG_TYPE_DEFAULT, "%s: found pairing %@ with uuid: %@", buf, 0x20u);

        }
        objc_msgSend(v8, "addObject:", v18);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    }
    while (v11);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__PSGMatterController_reloadAccessoriesWithCompletion___block_invoke_51;
  block[3] = &unk_24F9C8788;
  v23 = *(_QWORD *)(a1 + 32);
  v24 = *(void **)(a1 + 40);
  v30 = v8;
  v31 = v23;
  v32 = v27;
  v33 = v24;
  v25 = v27;
  v26 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __55__PSGMatterController_reloadAccessoriesWithCompletion___block_invoke_51(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  _BOOL8 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id obj;
  _QWORD v36[4];
  id v37;
  id v38;
  void *v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v1 = a1;
  v57 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(*(id *)(v1 + 40), "accessorySpecifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(char **)(v1 + 40);
  v31 = v3;
  if (*(_QWORD *)&v4[*MEMORY[0x24BE756E0]])
  {
    v5 = objc_msgSend(v2, "count", v3);
    v6 = objc_msgSend(v3, "count");
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v46 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(v1 + 40), "removeSpecifier:animated:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i), 0);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
      }
      while (v9);
    }
    v12 = v5 != v6;

    v13 = *(void **)(v1 + 40);
    objc_msgSend(v13, "specifierForID:", CFSTR("MATTER_ACCESSORIES_GROUP"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "insertContiguousSpecifiers:afterSpecifier:animated:", v2, v14, v12);

    v4 = *(char **)(v1 + 40);
  }
  v33 = v2;
  objc_msgSend(v4, "setAccessorySpecifiers:", v2, v31);
  objc_msgSend(*(id *)(v1 + 40), "handlePendingURL");
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend(*(id *)(v1 + 40), "accessorySpecifiers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v42;
    v18 = 0x24BDDB000uLL;
    v34 = v1;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v42 != v17)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("PSGDevicePairingKey"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_msgSend(objc_alloc(*(Class *)(v18 + 2144)), "initWithSystemCommissionerPairing:", v21);
        _PSGLoggingFacility();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v21, "name");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "uuid");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "UUIDString");
          v26 = v16;
          v27 = v17;
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v50 = "-[PSGMatterController reloadAccessoriesWithCompletion:]_block_invoke";
          v51 = 2112;
          v52 = v24;
          v53 = 2112;
          v54 = v28;
          _os_log_impl(&dword_22E024000, v23, OS_LOG_TYPE_DEFAULT, "%s: querying for device pairings pairings for pairing %@ with uuid %@.", buf, 0x20u);

          v17 = v27;
          v16 = v26;
          v1 = v34;

          v18 = 0x24BDDB000;
        }

        v36[0] = MEMORY[0x24BDAC760];
        v36[1] = 3221225472;
        v36[2] = __55__PSGMatterController_reloadAccessoriesWithCompletion___block_invoke_53;
        v36[3] = &unk_24F9C8760;
        v37 = v21;
        v38 = *(id *)(v1 + 48);
        v39 = v20;
        v40 = *(_QWORD *)(v1 + 40);
        v29 = v21;
        objc_msgSend(v22, "fetchPairingsWithCompletionHandler:", v36);

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
    }
    while (v16);
  }

  v30 = *(_QWORD *)(v1 + 56);
  if (v30)
    (*(void (**)(void))(v30 + 16))();

}

void __55__PSGMatterController_reloadAccessoriesWithCompletion___block_invoke_53(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  __int128 v14;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__PSGMatterController_reloadAccessoriesWithCompletion___block_invoke_2;
  v9[3] = &unk_24F9C8738;
  v10 = v6;
  v11 = *(id *)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v13 = v5;
  v14 = *(_OWORD *)(a1 + 48);
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

}

void __55__PSGMatterController_reloadAccessoriesWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id obj;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  _PSGLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __55__PSGMatterController_reloadAccessoriesWithCompletion___block_invoke_2_cold_1(a1, v4);
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v42 = "-[PSGMatterController reloadAccessoriesWithCompletion:]_block_invoke";
    v43 = 2112;
    v44 = v5;
    v45 = 2112;
    v46 = v7;
    _os_log_impl(&dword_22E024000, v4, OS_LOG_TYPE_DEFAULT, "%s: fetched device pairings for pairing %@ with uuid %@", buf, 0x20u);

  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v32 = a1;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = *(id *)(a1 + 56);
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (!v8)
      goto LABEL_22;
    v9 = v8;
    v35 = *(_QWORD *)v37;
    v10 = (void *)*MEMORY[0x24BDDB838];
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v37 != v35)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        _PSGLoggingFacility();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v42 = "-[PSGMatterController reloadAccessoriesWithCompletion:]_block_invoke";
          v43 = 2112;
          v44 = v12;
          _os_log_impl(&dword_22E024000, v13, OS_LOG_TYPE_DEFAULT, "%s: found device pairing %@", buf, 0x16u);
        }

        objc_msgSend(v12, "fabric");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "ecosystem");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "vendor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "integerValue");
        v19 = objc_msgSend(v10, "integerValue");

        if (v18 != v19)
        {
          objc_msgSend(v12, "fabric");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "displayName");
          v21 = objc_claimAutoreleasedReturnValue();
          if (!v21)
          {

LABEL_19:
            objc_msgSend(v12, "fabric", v32);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "displayName");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "addObject:", v27);

            continue;
          }
          v22 = (void *)v21;
          objc_msgSend(v12, "fabric");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "displayName");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "length");

          if (v25)
            goto LABEL_19;
        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (!v9)
      {
LABEL_22:

        v28 = (void *)MEMORY[0x24BDD1640];
        objc_msgSend(v33, "allObjects");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "sortedArrayUsingSelector:", sel_localizedStandardCompare_);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "localizedStringByJoiningStrings:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(v32 + 64), "setObject:forKeyedSubscript:", v31, *MEMORY[0x24BE75DA0]);
        objc_msgSend(*(id *)(v32 + 72), "reloadSpecifier:", *(_QWORD *)(v32 + 64));

        return;
      }
    }
  }
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  int64_t v8;

  v5 = -[PSGMatterController indexForIndexPath:](self, "indexForIndexPath:", a4);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndex:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PSGDevicePairingKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;

  return v8;
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  return PSG_LocalizedStringForMatter(CFSTR("TABLEVIEW_SLIDE_TO_REMOVE_BUTTON"));
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v6;

  -[PSGMatterController specifierAtIndexPath:](self, "specifierAtIndexPath:", a5, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PSGMatterController deleteAccessory:](self, "deleteAccessory:", v6);

}

- (void)deleteAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[5];
  id v23;
  _QWORD v24[4];
  id v25;
  PSGMatterController *v26;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BEBD3B0];
  PSG_LocalizedStringForMatter(CFSTR("ACCESSORY_DELETE_PROMPT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PSG_LocalizedStringForMatter(CFSTR("ACCESSORY_DELETE_PROMPT_MULTIPLE_OPTIONS_DETAIL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BEBD3A8];
  PSG_LocalizedStringForMatter(CFSTR("ACCESSORY_DELETE_PROMPT_REMOVE_FROM_MATTER"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __39__PSGMatterController_deleteAccessory___block_invoke;
  v24[3] = &unk_24F9C7E20;
  v12 = v4;
  v25 = v12;
  v26 = self;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 2, v24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v13);

  v14 = (void *)MEMORY[0x24BEBD3A8];
  PSG_LocalizedStringForMatter(CFSTR("ACCESSORY_DELETE_PROMPT_REMOVE_FROM_ALL"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v11;
  v22[1] = 3221225472;
  v22[2] = __39__PSGMatterController_deleteAccessory___block_invoke_74;
  v22[3] = &unk_24F9C7E20;
  v22[4] = self;
  v23 = v12;
  v16 = v12;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 2, v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v17);

  v18 = (void *)MEMORY[0x24BEBD3A8];
  PSG_LocalizedStringForMatter(CFSTR("ACCESSORY_DELETE_PROMPT_CANCEL"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __39__PSGMatterController_deleteAccessory___block_invoke_2;
  v21[3] = &unk_24F9C7E48;
  v21[4] = self;
  objc_msgSend(v18, "actionWithTitle:style:handler:", v19, 1, v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v20);

  -[PSGMatterController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
}

void __39__PSGMatterController_deleteAccessory___block_invoke(uint64_t a1)
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
    v6[2] = __39__PSGMatterController_deleteAccessory___block_invoke_69;
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
      v8 = "-[PSGMatterController deleteAccessory:]_block_invoke";
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_22E024000, v3, OS_LOG_TYPE_DEFAULT, "%s: not deleting device because it has no pairing.: %@", buf, 0x16u);

    }
  }

}

void __39__PSGMatterController_deleteAccessory___block_invoke_69(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    _PSGLoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __39__PSGMatterController_deleteAccessory___block_invoke_69_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 32), "reloadAccessoriesWithCompletion:", 0);

}

uint64_t __39__PSGMatterController_deleteAccessory___block_invoke_74(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showDeleteAllConfirmation:", *(_QWORD *)(a1 + 40));
}

uint64_t __39__PSGMatterController_deleteAccessory___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadAccessoriesWithCompletion:", 0);
}

- (void)showDeleteAllConfirmation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;
  PSGMatterController *v20;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BEBD3B0];
  PSG_LocalizedStringForMatter(CFSTR("ACCESSORY_REMOVE_FROM_ALL_PROMPT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PSG_LocalizedStringForMatter(CFSTR("ACCESSORY_REMOVE_FROM_ALL_DETAIL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BEBD3A8];
  PSG_LocalizedStringForMatter(CFSTR("ACCESSORY_REMOVE_FROM_ALL_CONFIRM"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __49__PSGMatterController_showDeleteAllConfirmation___block_invoke;
  v18[3] = &unk_24F9C7E20;
  v19 = v4;
  v20 = self;
  v12 = v4;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 2, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v13);

  v14 = (void *)MEMORY[0x24BEBD3A8];
  PSG_LocalizedStringForMatter(CFSTR("ACCESSORY_REMOVE_FROM_ALL_CANCEL"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __49__PSGMatterController_showDeleteAllConfirmation___block_invoke_2;
  v17[3] = &unk_24F9C7E48;
  v17[4] = self;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 1, v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v16);

  -[PSGMatterController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
}

void __49__PSGMatterController_showDeleteAllConfirmation___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("PSGDevicePairingKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDDB860]), "initWithSystemCommissionerPairing:", v2);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __49__PSGMatterController_showDeleteAllConfirmation___block_invoke_83;
    v5[3] = &unk_24F9C7DF8;
    v5[4] = *(_QWORD *)(a1 + 40);
    -[NSObject removeAllPairingsWithCompletionHandler:](v3, "removeAllPairingsWithCompletionHandler:", v5);
  }
  else
  {
    _PSGLoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v7 = "-[PSGMatterController showDeleteAllConfirmation:]_block_invoke";
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_22E024000, v3, OS_LOG_TYPE_DEFAULT, "%s: not deleting device because it has no pairing.: %@", buf, 0x16u);

    }
  }

}

void __49__PSGMatterController_showDeleteAllConfirmation___block_invoke_83(uint64_t a1, void *a2)
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
      __49__PSGMatterController_showDeleteAllConfirmation___block_invoke_83_cold_1();

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__PSGMatterController_showDeleteAllConfirmation___block_invoke_84;
  block[3] = &unk_24F9C7C88;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __49__PSGMatterController_showDeleteAllConfirmation___block_invoke_84(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadAccessoriesWithCompletion:", 0);
}

uint64_t __49__PSGMatterController_showDeleteAllConfirmation___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadAccessoriesWithCompletion:", 0);
}

- (MTSSystemCommissionerPairingManager)pairingManager
{
  return self->_pairingManager;
}

- (void)setPairingManager:(id)a3
{
  objc_storeStrong((id *)&self->_pairingManager, a3);
}

- (NSArray)accessorySpecifiers
{
  return self->_accessorySpecifiers;
}

- (void)setAccessorySpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_accessorySpecifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessorySpecifiers, 0);
  objc_storeStrong((id *)&self->_pairingManager, 0);
}

void __64__PSGMatterController_shouldShowMatterControllerWithCompletion___block_invoke_cold_1()
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

void __55__PSGMatterController_reloadAccessoriesWithCompletion___block_invoke_cold_1()
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

void __55__PSGMatterController_reloadAccessoriesWithCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 40), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 48);
  v8 = 136315906;
  v9 = "-[PSGMatterController reloadAccessoriesWithCompletion:]_block_invoke_2";
  v10 = 2112;
  v11 = v4;
  v12 = 2112;
  v13 = v6;
  v14 = 2112;
  v15 = v7;
  _os_log_error_impl(&dword_22E024000, a2, OS_LOG_TYPE_ERROR, "%s: error when fetching device pairings for pairing %@ with uuid %@: %@", (uint8_t *)&v8, 0x2Au);

}

void __39__PSGMatterController_deleteAccessory___block_invoke_69_cold_1()
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

void __49__PSGMatterController_showDeleteAllConfirmation___block_invoke_83_cold_1()
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

@end
