@implementation PSUINetworkSelectionSubgroup

- (PSUINetworkSelectionSubgroup)initWithListController:(id)a3 groupSpecifier:(id)a4 parentSpecifier:(id)a5
{
  id v7;
  id v8;
  PSUINetworkSelectionSubgroup *v9;
  PSUINetworkSelectionSubgroup *v10;
  id v11;
  uint64_t v12;
  CoreTelephonyClient *ctClient;
  void *v14;
  objc_super v16;

  v7 = a3;
  v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PSUINetworkSelectionSubgroup;
  v9 = -[PSUINetworkSelectionSubgroup init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_listController, v7);
    objc_storeWeak((id *)&v10->_parentSpecifier, v8);
    v11 = objc_alloc(MEMORY[0x24BDC2810]);
    v12 = objc_msgSend(v11, "initWithQueue:", MEMORY[0x24BDAC9B8]);
    ctClient = v10->_ctClient;
    v10->_ctClient = (CoreTelephonyClient *)v12;

    -[CoreTelephonyClient setDelegate:](v10->_ctClient, "setDelegate:", v10);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v10, sel_willEnterForeground, *MEMORY[0x24BEBE008], 0);

  }
  return v10;
}

- (PSUINetworkSelectionSubgroup)initWithListController:(id)a3 groupSpecifier:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_exception_throw((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE88]), "initWithName:reason:userInfo:", CFSTR("Unsupported initializer called"), CFSTR("Unsupported initializer called"), 0));
}

- (id)specifiers
{
  NSMutableArray *v3;
  NSMutableArray *bundleControllers;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  char *v14;
  char *v15;
  void *v17;
  id v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v17 = (void *)objc_opt_new();
  v3 = (NSMutableArray *)objc_opt_new();
  bundleControllers = self->_bundleControllers;
  self->_bundleControllers = v3;

  v22 = *MEMORY[0x24BE758F8];
  v23[0] = CFSTR("CellularNetworkTelephonySettings");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v5;
  v20 = CFSTR("items");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v19, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentSpecifier);
  v9 = objc_loadWeakRetained((id *)&self->_listController);
  objc_msgSend(v9, "bundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_loadWeakRetained((id *)&self->_listController);
  v18 = 0;
  SpecifiersFromPlist();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v18;
  objc_msgSend(v12, "firstObject", &v18);
  v14 = (char *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "setTarget:", self);
    *(_QWORD *)&v15[*MEMORY[0x24BE75750]] = sel_localizedCellularNetworkName_;
  }
  objc_msgSend(v17, "addObjectsFromArray:", v12);
  -[NSMutableArray addObjectsFromArray:](self->_bundleControllers, "addObjectsFromArray:", v13);

  return v17;
}

- (id)localizedCellularNetworkName:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  int v10;
  __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentSpecifier);
  objc_msgSend(WeakRetained, "propertyForKey:", *MEMORY[0x24BE75CE8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_5;
  +[PSUICoreTelephonyRegistrationCache sharedInstance](PSUICoreTelephonyRegistrationCache, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedOperatorName:", v5);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  -[PSUINetworkSelectionSubgroup getLogger](self, "getLogger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "Localized cellular network name: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  if (!v7)
LABEL_5:
    v7 = &stru_24D5028C8;

  return v7;
}

- (void)reloadCellularNetworkSpecifier
{
  NSObject *v3;
  PSListController **p_listController;
  id WeakRetained;
  void *v6;
  id v7;
  uint8_t v8[16];

  -[PSUINetworkSelectionSubgroup getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "Reloading telephony settings", v8, 2u);
  }

  p_listController = &self->_listController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  objc_msgSend(WeakRetained, "specifierForID:", CFSTR("CELLULAR_NETWORK_TELEPHONY_SETTINGS"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_loadWeakRetained((id *)p_listController);
    objc_msgSend(v7, "reloadSpecifier:animated:", v6, 1);

  }
}

- (void)networkSelected:(id)a3 success:(BOOL)a4 mode:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  v9 = objc_msgSend(v7, "slotID");
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentSpecifier);
  objc_msgSend(WeakRetained, "propertyForKey:", *MEMORY[0x24BE75CE8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "slotID");

  -[PSUINetworkSelectionSubgroup getLogger](self, "getLogger");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v9 == v12)
  {
    if (v14)
    {
      v15 = 138543362;
      v16 = v8;
      _os_log_impl(&dword_2161C6000, v13, OS_LOG_TYPE_DEFAULT, "Network selected changed to %{public}@", (uint8_t *)&v15, 0xCu);
    }

    -[PSUINetworkSelectionSubgroup reloadCellularNetworkSpecifier](self, "reloadCellularNetworkSpecifier");
  }
  else
  {
    if (v14)
    {
      v15 = 138412290;
      v16 = v7;
      _os_log_impl(&dword_2161C6000, v13, OS_LOG_TYPE_DEFAULT, "Ignoring network selected for %@", (uint8_t *)&v15, 0xCu);
    }

  }
}

- (void)operatorNameChanged:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "slotID");
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentSpecifier);
  objc_msgSend(WeakRetained, "propertyForKey:", *MEMORY[0x24BE75CE8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "slotID");

  -[PSUINetworkSelectionSubgroup getLogger](self, "getLogger");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v8 == v11)
  {
    if (v13)
    {
      v14 = 138543362;
      v15 = v7;
      _os_log_impl(&dword_2161C6000, v12, OS_LOG_TYPE_DEFAULT, "Operator name changed to %{public}@", (uint8_t *)&v14, 0xCu);
    }

    -[PSUINetworkSelectionSubgroup reloadCellularNetworkSpecifier](self, "reloadCellularNetworkSpecifier");
  }
  else
  {
    if (v13)
    {
      v14 = 138412290;
      v15 = v6;
      _os_log_impl(&dword_2161C6000, v12, OS_LOG_TYPE_DEFAULT, "Ignoring operator name change for %@", (uint8_t *)&v14, 0xCu);
    }

  }
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("NetworkSelection"));
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

- (CoreTelephonyClient)ctClient
{
  return self->_ctClient;
}

- (void)setCtClient:(id)a3
{
  objc_storeStrong((id *)&self->_ctClient, a3);
}

- (NSMutableArray)bundleControllers
{
  return self->_bundleControllers;
}

- (void)setBundleControllers:(id)a3
{
  objc_storeStrong((id *)&self->_bundleControllers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleControllers, 0);
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_destroyWeak((id *)&self->_parentSpecifier);
  objc_destroyWeak((id *)&self->_listController);
}

@end
