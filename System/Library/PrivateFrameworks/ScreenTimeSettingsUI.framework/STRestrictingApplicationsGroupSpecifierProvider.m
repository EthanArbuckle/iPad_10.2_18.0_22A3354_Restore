@implementation STRestrictingApplicationsGroupSpecifierProvider

- (STRestrictingApplicationsGroupSpecifierProvider)init
{
  STRestrictingApplicationsGroupSpecifierProvider *v2;
  NSArray *authorizationRecords;
  NSObject *v4;
  STRestrictingApplicationsGroupSpecifierProvider *v5;
  _QWORD block[4];
  STRestrictingApplicationsGroupSpecifierProvider *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)STRestrictingApplicationsGroupSpecifierProvider;
  v2 = -[STGroupSpecifierProvider init](&v9, sel_init);
  authorizationRecords = v2->_authorizationRecords;
  v2->_authorizationRecords = (NSArray *)MEMORY[0x24BDBD1A8];

  -[STGroupSpecifierProvider setIsHidden:](v2, "setIsHidden:", 1);
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__STRestrictingApplicationsGroupSpecifierProvider_init__block_invoke;
  block[3] = &unk_24DB86440;
  v5 = v2;
  v8 = v5;
  dispatch_async(v4, block);

  return v5;
}

void __55__STRestrictingApplicationsGroupSpecifierProvider_init__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD block[4];
  id v5;

  objc_msgSend(MEMORY[0x24BE30BD8], "sharedCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authorizationRecords");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setAuthorizationRecords:", v3);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__STRestrictingApplicationsGroupSpecifierProvider_init__block_invoke_2;
  block[3] = &unk_24DB86440;
  v5 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __55__STRestrictingApplicationsGroupSpecifierProvider_init__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSpecifiersWithAuthorizationRecords");
}

- (void)_updateSpecifiersWithAuthorizationRecords
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
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
  void *v24;
  uint64_t v25;
  void *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  -[STRestrictingApplicationsGroupSpecifierProvider authorizationRecords](self, "authorizationRecords");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("STAccessListTitle"), &stru_24DB8A1D0, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithName:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("STAccessListDetail"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v4;
    objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24DB8A1D0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE75A68]);

    objc_msgSend(v5, "setTarget:", self);
    v21 = v5;
    -[STGroupSpecifierProvider setGroupSpecifier:](self, "setGroupSpecifier:", v5);
    -[STGroupSpecifierProvider mutableSpecifiers](self, "mutableSpecifiers");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v24 = v3;
    obj = v3;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v29;
      v25 = *MEMORY[0x24BE75AC8];
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v29 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v12, "bundleIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "recordIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "status") != 1)
          {
            objc_msgSend(MEMORY[0x24BE844B8], "sharedCache");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "appInfoForBundleIdentifier:", v13);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "displayName");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BE84828], "sharedCache");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "imageForBundleIdentifier:", v13);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v17, self, sel_setFamilyControlsEnabled_forSpecifier_, sel_isFamilyControlsEnabled_, 0, 6, 0);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, v25);
            objc_msgSend(v20, "setObject:forKeyedSubscript:", v14, CFSTR("RecordID"));
            objc_msgSend(v26, "addObject:", v20);

          }
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v9);
    }

    -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", 0);
    v3 = v24;
  }
  else
  {
    -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", 1);
  }

}

- (int64_t)getAuthorizationStatusForRecordIdentifier:(id)a3 fromRecords:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  int64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "recordIdentifier", (_QWORD)v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "UUIDString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "UUIDString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqualToString:", v14);

        if ((v15 & 1) != 0)
        {
          v16 = objc_msgSend(v11, "status");
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v8)
        continue;
      break;
    }
  }
  v16 = 1;
LABEL_11:

  return v16;
}

- (void)setFamilyControlsEnabled:(id)a3 forSpecifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  id *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;

  v5 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("RecordID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STRestrictingApplicationsGroupSpecifierProvider authorizationRecords](self, "authorizationRecords");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[STRestrictingApplicationsGroupSpecifierProvider getAuthorizationStatusForRecordIdentifier:fromRecords:](self, "getAuthorizationStatusForRecordIdentifier:fromRecords:", v6, v7);

  objc_msgSend(MEMORY[0x24BE30BD8], "sharedCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("RecordID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == 2)
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __89__STRestrictingApplicationsGroupSpecifierProvider_setFamilyControlsEnabled_forSpecifier___block_invoke;
    v16[3] = &unk_24DB87670;
    v11 = &v17;
    v16[4] = self;
    v17 = v5;
    v12 = v5;
    objc_msgSend(v9, "resetAuthorizationForRecordIdentifier:completionHandler:", v10, v16);
  }
  else
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __89__STRestrictingApplicationsGroupSpecifierProvider_setFamilyControlsEnabled_forSpecifier___block_invoke_20;
    v14[3] = &unk_24DB87670;
    v11 = &v15;
    v14[4] = self;
    v15 = v5;
    v13 = v5;
    objc_msgSend(v9, "requestAuthorizationForRecordIdentifier:completionHandler:", v10, v14);
  }

}

void __89__STRestrictingApplicationsGroupSpecifierProvider_setFamilyControlsEnabled_forSpecifier___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  uint64_t v21;
  id v22;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE30BD8], "sharedCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "authorizationRecords");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setAuthorizationRecords:", v7);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __89__STRestrictingApplicationsGroupSpecifierProvider_setFamilyControlsEnabled_forSpecifier___block_invoke_2;
    v20 = &unk_24DB86588;
    v9 = *(void **)(a1 + 40);
    v21 = *(_QWORD *)(a1 + 32);
    v22 = v9;
    objc_msgSend(v8, "addOperationWithBlock:", &v17);

    +[STUILog accessList](STUILog, "accessList", v17, v18, v19, v20, v21);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __89__STRestrictingApplicationsGroupSpecifierProvider_setFamilyControlsEnabled_forSpecifier___block_invoke_cold_1((uint64_t)v5, v10, v11, v12, v13, v14, v15, v16);

  }
}

uint64_t __89__STRestrictingApplicationsGroupSpecifierProvider_setFamilyControlsEnabled_forSpecifier___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:animated:", *(_QWORD *)(a1 + 40), 1);
}

void __89__STRestrictingApplicationsGroupSpecifierProvider_setFamilyControlsEnabled_forSpecifier___block_invoke_20(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  uint64_t v21;
  id v22;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE30BD8], "sharedCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "authorizationRecords");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setAuthorizationRecords:", v7);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __89__STRestrictingApplicationsGroupSpecifierProvider_setFamilyControlsEnabled_forSpecifier___block_invoke_2_21;
    v20 = &unk_24DB86588;
    v9 = *(void **)(a1 + 40);
    v21 = *(_QWORD *)(a1 + 32);
    v22 = v9;
    objc_msgSend(v8, "addOperationWithBlock:", &v17);

    +[STUILog accessList](STUILog, "accessList", v17, v18, v19, v20, v21);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __89__STRestrictingApplicationsGroupSpecifierProvider_setFamilyControlsEnabled_forSpecifier___block_invoke_20_cold_1((uint64_t)v5, v10, v11, v12, v13, v14, v15, v16);

  }
}

uint64_t __89__STRestrictingApplicationsGroupSpecifierProvider_setFamilyControlsEnabled_forSpecifier___block_invoke_2_21(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:animated:", *(_QWORD *)(a1 + 40), 1);
}

- (id)isFamilyControlsEnabled:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("RecordID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STRestrictingApplicationsGroupSpecifierProvider authorizationRecords](self, "authorizationRecords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[STRestrictingApplicationsGroupSpecifierProvider getAuthorizationStatusForRecordIdentifier:fromRecords:](self, "getAuthorizationStatusForRecordIdentifier:fromRecords:", v4, v5) == 2)v6 = (void *)MEMORY[0x24BDBD1C8];
  else
    v6 = (void *)MEMORY[0x24BDBD1C0];
  v7 = v6;

  return v7;
}

- (NSArray)authorizationRecords
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAuthorizationRecords:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizationRecords, 0);
}

void __89__STRestrictingApplicationsGroupSpecifierProvider_setFamilyControlsEnabled_forSpecifier___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_219AB4000, a2, a3, "Authorization's reset failed: %{public}@", a5, a6, a7, a8, 2u);
}

void __89__STRestrictingApplicationsGroupSpecifierProvider_setFamilyControlsEnabled_forSpecifier___block_invoke_20_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_219AB4000, a2, a3, "Request for authorization failed: %{public}@", a5, a6, a7, a8, 2u);
}

@end
