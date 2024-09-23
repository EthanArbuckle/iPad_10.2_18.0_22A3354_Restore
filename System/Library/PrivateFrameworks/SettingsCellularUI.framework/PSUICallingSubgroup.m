@implementation PSUICallingSubgroup

- (PSUICallingSubgroup)initWithListController:(id)a3 groupSpecifier:(id)a4 parentSpecifier:(id)a5
{
  id v7;
  id v8;
  PSUICallingSubgroup *v9;
  PSUICallingSubgroup *v10;
  id v11;
  void *v12;
  objc_super v14;

  v7 = a3;
  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PSUICallingSubgroup;
  v9 = -[PSUICallingSubgroup init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_listController, v7);
    v11 = objc_storeWeak((id *)&v10->_parentSpecifier, v8);
    objc_msgSend(v8, "propertyForKey:", *MEMORY[0x24BE75CE8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v10->_supportsWiFiCalling = +[SettingsCellularUtils supportsWiFiCalling:](SettingsCellularUtils, "supportsWiFiCalling:", v12);
  }

  return v10;
}

- (PSUICallingSubgroup)initWithListController:(id)a3 groupSpecifier:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_exception_throw((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE88]), "initWithName:reason:userInfo:", CFSTR("Unsupported initializer called"), CFSTR("Unsupported initializer called"), 0));
}

- (void)viewWillAppear
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  PSListController **p_listController;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_wifiCallingSpecifiers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    p_listController = &self->_listController;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        WeakRetained = objc_loadWeakRetained((id *)p_listController);
        objc_msgSend(WeakRetained, "reloadSpecifier:", v9, (_QWORD)v11);

        ++v8;
      }
      while (v5 != v8);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (id)specifiers
{
  void *v3;
  void *v4;
  id WeakRetained;
  PSListController **p_listController;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id *location;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  uint64_t v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  uint64_t v37;
  _QWORD v38[3];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v23 = (void *)objc_opt_new();
  v37 = *MEMORY[0x24BE758F8];
  v24 = v37;
  v38[0] = CFSTR("WiFiCallingTelephonySettings");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v26;
  v35 = CFSTR("items");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v34, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  location = (id *)&self->_parentSpecifier;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentSpecifier);
  p_listController = &self->_listController;
  v7 = objc_loadWeakRetained((id *)&self->_listController);
  objc_msgSend(v7, "bundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_loadWeakRetained((id *)&self->_listController);
  v28 = 0;
  SpecifiersFromPlist();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = v28;
  v11 = (void *)objc_msgSend(v10, "copy", &v28);
  -[PSUICallingSubgroup setWifiCallingSpecifiers:](self, "setWifiCallingSpecifiers:", v11);

  objc_msgSend(v23, "addObjectsFromArray:", self->_wifiCallingSpecifiers);
  v32 = v24;
  v33 = CFSTR("PrimaryCloudCallingSettingsBundle");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v12;
  v30 = CFSTR("items");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_loadWeakRetained(location);
  v16 = objc_loadWeakRetained((id *)p_listController);
  objc_msgSend(v16, "bundle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_loadWeakRetained((id *)p_listController);
  v27 = 0;
  SpecifiersFromPlist();
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v27;
  objc_msgSend(v23, "addObjectsFromArray:", v19, &v27);

  return v23;
}

- (void)setWifiCallingSpecifiers:(id)a3
{
  id v5;
  NSObject *p_super;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (self->_supportsWiFiCalling)
  {
    objc_storeStrong((id *)&self->_wifiCallingSpecifiers, a3);
    -[PSUICallingSubgroup getLogger](self, "getLogger");
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "-[PSUICallingSubgroup setWifiCallingSpecifiers:]";
      _os_log_impl(&dword_2161C6000, p_super, OS_LOG_TYPE_DEFAULT, "%s WiFi calling is supported, adding specifiers", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    -[PSUICallingSubgroup getLogger](self, "getLogger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "-[PSUICallingSubgroup setWifiCallingSpecifiers:]";
      _os_log_impl(&dword_2161C6000, v7, OS_LOG_TYPE_DEFAULT, "%s WiFi calling is not supported, omitting specifiers", (uint8_t *)&v8, 0xCu);
    }

    p_super = &self->_wifiCallingSpecifiers->super;
    self->_wifiCallingSpecifiers = 0;
  }

}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("CallingSubgroup"));
}

- (PSListController)listController
{
  return (PSListController *)objc_loadWeakRetained((id *)&self->_listController);
}

- (void)setListController:(id)a3
{
  objc_storeWeak((id *)&self->_listController, a3);
}

- (PSSpecifier)parentSpecifier
{
  return (PSSpecifier *)objc_loadWeakRetained((id *)&self->_parentSpecifier);
}

- (void)setParentSpecifier:(id)a3
{
  objc_storeWeak((id *)&self->_parentSpecifier, a3);
}

- (NSArray)wifiCallingSpecifiers
{
  return self->_wifiCallingSpecifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiCallingSpecifiers, 0);
  objc_destroyWeak((id *)&self->_parentSpecifier);
  objc_destroyWeak((id *)&self->_listController);
}

@end
