@implementation PSUIRoamingSpecifiersSubgroup

- (PSUIRoamingSpecifiersSubgroup)initWithListController:(id)a3 dataCache:(id)a4 serviceDescriptor:(id)a5
{
  id v8;
  id v9;
  id v10;
  PSUIRoamingSpecifiersSubgroup *v11;
  PSUIRoamingSpecifiersSubgroup *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PSUIRoamingSpecifiersSubgroup;
  v11 = -[PSUIRoamingSpecifiersSubgroup init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_listController, v8);
    objc_storeWeak((id *)&v12->_dataCache, v9);
    objc_storeStrong((id *)&v12->_serviceDescriptor, a5);
  }

  return v12;
}

- (PSUIRoamingSpecifiersSubgroup)initWithListController:(id)a3 groupSpecifier:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_exception_throw((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE88]), "initWithName:reason:userInfo:", CFSTR("Unsupported initializer called"), CFSTR("Unsupported initializer called"), 0));
}

- (id)specifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DATA_ROAMING_TOGGLE"), &stru_24D5028C8, CFSTR("Cellular"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, sel_setDataRoamingEnabled_specifier_, sel_getDataRoamingStatus_, 0, 6, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setIdentifier:", CFSTR("DATA_ROAMING"));
  v7 = (void *)MEMORY[0x24BDD16E0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataCache);
  objc_msgSend(v7, "numberWithInt:", objc_msgSend(WeakRetained, "hideDataRoaming:", self->_serviceDescriptor) ^ 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", v9, *MEMORY[0x24BE75A18]);

  v12[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)getDataRoamingStatus:(id)a3
{
  id WeakRetained;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  CTServiceDescriptor *serviceDescriptor;
  int v10;
  const char *v11;
  __int16 v12;
  CTServiceDescriptor *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataCache);
  v5 = objc_msgSend(WeakRetained, "getInternationalDataAccessStatus:", self->_serviceDescriptor);

  -[PSUIRoamingSpecifiersSubgroup getLogger](self, "getLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("disabled");
    serviceDescriptor = self->_serviceDescriptor;
    v11 = "-[PSUIRoamingSpecifiersSubgroup getDataRoamingStatus:]";
    v10 = 136315650;
    if ((_DWORD)v5)
      v7 = CFSTR("enabled");
    v12 = 2112;
    v13 = serviceDescriptor;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "%s For service %@, roaming is %@", (uint8_t *)&v10, 0x20u);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setDataRoamingEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  CTServiceDescriptor *serviceDescriptor;
  id WeakRetained;
  int v10;
  const char *v11;
  __int16 v12;
  CTServiceDescriptor *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(a3, "BOOLValue");
  -[PSUIRoamingSpecifiersSubgroup getLogger](self, "getLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("disabled");
    serviceDescriptor = self->_serviceDescriptor;
    v11 = "-[PSUIRoamingSpecifiersSubgroup setDataRoamingEnabled:specifier:]";
    v10 = 136315650;
    if ((_DWORD)v5)
      v7 = CFSTR("enabled");
    v12 = 2112;
    v13 = serviceDescriptor;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "%s For service %@, setting roaming = %@", (uint8_t *)&v10, 0x20u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataCache);
  objc_msgSend(WeakRetained, "setInternationalDataAccessStatus:status:", self->_serviceDescriptor, v5);

  -[PSUIRoamingSpecifiersSubgroup roamingOptionsDidChange](self, "roamingOptionsDidChange");
}

- (void)roamingOptionsDidChange
{
  _QWORD v2[4];
  id v3;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __56__PSUIRoamingSpecifiersSubgroup_roamingOptionsDidChange__block_invoke;
  v2[3] = &unk_24D5017E8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __56__PSUIRoamingSpecifiersSubgroup_roamingOptionsDidChange__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained(v1);
    objc_msgSend(v4, "listController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadSpecifiers");

  }
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("RoamingSpecifiersSubgroup"));
}

- (PSListController)listController
{
  return (PSListController *)objc_loadWeakRetained((id *)&self->_listController);
}

- (void)setListController:(id)a3
{
  objc_storeWeak((id *)&self->_listController, a3);
}

- (PSUICoreTelephonyDataCache)dataCache
{
  return (PSUICoreTelephonyDataCache *)objc_loadWeakRetained((id *)&self->_dataCache);
}

- (void)setDataCache:(id)a3
{
  objc_storeWeak((id *)&self->_dataCache, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataCache);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_serviceDescriptor, 0);
}

@end
