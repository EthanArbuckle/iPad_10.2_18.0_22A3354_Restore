@implementation PSUIPendingInstallPlanGroup

- (PSUIPendingInstallPlanGroup)init
{
  objc_exception_throw((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE88]), "initWithName:reason:userInfo:", CFSTR("Unsupported initializer called"), CFSTR("Unsupported initializer called"), 0));
}

- (PSUIPendingInstallPlanGroup)initWithListController:(id)a3 groupSpecifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PSUIPendingInstallPlanGroup *v9;

  v6 = a4;
  v7 = a3;
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PSUIPendingInstallPlanGroup initWithListController:groupSpecifier:planManager:](self, "initWithListController:groupSpecifier:planManager:", v7, v6, v8);

  return v9;
}

- (PSUIPendingInstallPlanGroup)initWithListController:(id)a3 groupSpecifier:(id)a4 planManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  PSUIPendingInstallPlanGroup *v11;
  PSUIPendingInstallPlanGroup *v12;
  id v13;
  uint64_t v14;
  CoreTelephonyClient *coreTelephonyClient;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PSUIPendingInstallPlanGroup;
  v11 = -[PSUIPendingInstallPlanGroup init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_listController, v8);
    objc_storeStrong((id *)&v12->_groupSpecifier, a4);
    objc_storeStrong((id *)&v12->_cellularPlanManager, a5);
    v13 = objc_alloc(MEMORY[0x24BDC2810]);
    v14 = objc_msgSend(v13, "initWithQueue:", MEMORY[0x24BDAC9B8]);
    coreTelephonyClient = v12->_coreTelephonyClient;
    v12->_coreTelephonyClient = (CoreTelephonyClient *)v14;

    -[CoreTelephonyClient setDelegate:](v12->_coreTelephonyClient, "setDelegate:", v12);
  }

  return v12;
}

- (id)specifiers
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[PSUIPendingInstallPlanGroup specifiersForPendingInstallPlans](self, "specifiersForPendingInstallPlans");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  return v3;
}

- (id)specifiersForPendingInstallPlans
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  PSSpecifier *groupSpecifier;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[PSUICellularPlanManagerCache pendingInstallPlans](self->_cellularPlanManager, "pendingInstallPlans");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "plans");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count"))
    {
      v8 = 0;
      do
      {
        objc_msgSend(v7, "objectAtIndex:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("PENDING_INSTALL_NAME_%@"), &stru_24D5028C8, CFSTR("Cellular"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "carrierName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, self, 0, 0, 0, 13, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setProperty:forKey:", v9, CFSTR("plan"));
        objc_msgSend(v15, "setButtonAction:", sel_pendingInstallPlanPressed_);
        objc_msgSend(v3, "addObject:", v15);

        ++v8;
      }
      while (objc_msgSend(v7, "count") > v8);
    }
    -[PSUIPendingInstallPlanGroup getLogger](self, "getLogger");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v3;
      _os_log_impl(&dword_2161C6000, v16, OS_LOG_TYPE_DEFAULT, "Pending install group specifiers: %@", buf, 0xCu);
    }

  }
  if (objc_msgSend(v3, "count"))
  {
    groupSpecifier = self->_groupSpecifier;
    v18 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("PENDING_INSTALL_FOOTER"), &stru_24D5028C8, CFSTR("Cellular"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setProperty:forKey:](groupSpecifier, "setProperty:forKey:", v21, *MEMORY[0x24BE75A68]);

  }
  return v3;
}

- (void)pendingInstallPlanPressed:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  CoreTelephonyClient *coreTelephonyClient;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id WeakRetained;
  _QWORD v13[5];
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PSUIPendingInstallPlanGroup getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v4;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  objc_msgSend(v4, "propertyForKey:", CFSTR("plan"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  coreTelephonyClient = self->_coreTelephonyClient;
  objc_msgSend(v6, "plan");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "carrierName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __57__PSUIPendingInstallPlanGroup_pendingInstallPlanPressed___block_invoke;
  v13[3] = &unk_24D502060;
  v13[4] = self;
  -[CoreTelephonyClient startPendingPlanInstallationForPlan:carrierName:completionHandler:](coreTelephonyClient, "startPendingPlanInstallationForPlan:carrierName:completionHandler:", v8, v9, v13);

  -[PSUICellularPlanManagerCache planItems](self->_cellularPlanManager, "planItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

void __57__PSUIPendingInstallPlanGroup_pendingInstallPlanPressed___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];
  uint64_t v6;
  uint64_t v7;

  if (a2 != 2)
  {
    v6 = v2;
    v7 = v3;
    objc_msgSend(*(id *)(a1 + 32), "getLogger");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_2161C6000, v4, OS_LOG_TYPE_ERROR, "Failed to install pending plan", v5, 2u);
    }

  }
}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  NSObject *v4;
  _QWORD block[4];
  id v6;
  _BYTE buf[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[PSUIPendingInstallPlanGroup getLogger](self, "getLogger", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[PSUIPendingInstallPlanGroup simSetupFlowCompleted:]";
    _os_log_impl(&dword_2161C6000, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__PSUIPendingInstallPlanGroup_simSetupFlowCompleted___block_invoke;
  block[3] = &unk_24D5017E8;
  objc_copyWeak(&v6, (id *)buf);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __53__PSUIPendingInstallPlanGroup_simSetupFlowCompleted___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained[4];
    WeakRetained[4] = 0;
    v4 = WeakRetained;

    v3 = objc_loadWeakRetained(v4 + 5);
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

    WeakRetained = v4;
  }

}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("PendingInstall"));
}

- (PSListController)listController
{
  return (PSListController *)objc_loadWeakRetained((id *)&self->_listController);
}

- (void)setListController:(id)a3
{
  objc_storeWeak((id *)&self->_listController, a3);
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
  objc_storeStrong((id *)&self->_coreTelephonyClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_flow, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
  objc_storeStrong((id *)&self->_cellularPlanManager, 0);
}

@end
