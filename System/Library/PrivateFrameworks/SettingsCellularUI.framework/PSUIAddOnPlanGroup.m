@implementation PSUIAddOnPlanGroup

- (PSUIAddOnPlanGroup)init
{
  objc_exception_throw((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE88]), "initWithName:reason:userInfo:", CFSTR("Unsupported initializer called"), CFSTR("Unsupported initializer called"), 0));
}

- (PSUIAddOnPlanGroup)initWithListController:(id)a3 groupSpecifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  PSUIAddOnPlanGroup *v10;

  v6 = a4;
  v7 = a3;
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PSUIAddOnPlanGroup initWithListController:groupSpecifier:planManager:ctPlanManager:showAddOnPlans:](self, "initWithListController:groupSpecifier:planManager:ctPlanManager:showAddOnPlans:", v7, v6, v8, v9, 1);

  return v10;
}

- (PSUIAddOnPlanGroup)initWithListController:(id)a3 groupSpecifier:(id)a4 showAddOnPlans:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  PSUIAddOnPlanGroup *v12;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PSUIAddOnPlanGroup initWithListController:groupSpecifier:planManager:ctPlanManager:showAddOnPlans:](self, "initWithListController:groupSpecifier:planManager:ctPlanManager:showAddOnPlans:", v9, v8, v10, v11, v5);

  return v12;
}

- (PSUIAddOnPlanGroup)initWithListController:(id)a3 groupSpecifier:(id)a4 planManager:(id)a5 ctPlanManager:(id)a6 showAddOnPlans:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  PSUIAddOnPlanGroup *v16;
  PSUIAddOnPlanGroup *v17;
  NSMutableArray *v18;
  NSMutableArray *remotePlansSpecifiers;
  objc_super v21;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PSUIAddOnPlanGroup;
  v16 = -[PSUIAddOnPlanGroup init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_listController, v12);
    objc_storeStrong((id *)&v17->_groupSpecifier, a4);
    objc_storeStrong((id *)&v17->_cellularPlanManager, a5);
    objc_storeStrong((id *)&v17->_ctCellularPlanManager, a6);
    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    remotePlansSpecifiers = v17->_remotePlansSpecifiers;
    v17->_remotePlansSpecifiers = v18;

    v17->_showAddOnPlans = a7;
  }

  return v17;
}

- (id)specifiers
{
  id v3;
  char v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  PSSpecifier *groupSpecifier;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  PSSpecifier *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint8_t v26[16];
  uint8_t buf[16];

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = _os_feature_enabled_impl();
  if (self->_showAddOnPlans)
  {
    v5 = v4;
    -[PSUIAddOnPlanGroup specifiersForRemotePlans:](self, "specifiersForRemotePlans:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v6);

    if (objc_msgSend(v3, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ADD_ON_PLAN_CHOOSE_NETWORK"), &stru_24D5028C8, CFSTR("Cellular"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifier setName:](self->_groupSpecifier, "setName:", v8);

      if (-[PSUICellularPlanManagerCache remoteListFetchCompleted](self->_cellularPlanManager, "remoteListFetchCompleted"))
      {
        groupSpecifier = self->_groupSpecifier;
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if ((v5 & 1) != 0)
          v12 = CFSTR("ADD_ON_PLAN_FOOTER_NEW");
        else
          v12 = CFSTR("ADD_ON_PLAN_FOOTER");
        objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_24D5028C8, CFSTR("Cellular"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSSpecifier setProperty:forKey:](groupSpecifier, "setProperty:forKey:", v23, *MEMORY[0x24BE75A68]);

      }
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ADD_ON_PLAN"), &stru_24D5028C8, CFSTR("Cellular"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, self, 0, 0, 0, 13, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setButtonAction:", sel__addOnPlanOptionPressed_);
    objc_msgSend(v3, "addObject:", v16);
    v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[PSUIAddOnPlanGroup specifiersForRemotePlans:](self, "specifiersForRemotePlans:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObjectsFromArray:", v18);

    if (-[PSUIAddOnPlanGroup _shouldShowWiFiOffFooter](self, "_shouldShowWiFiOffFooter"))
    {
      -[PSUIAddOnPlanGroup getLogger](self, "getLogger");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2161C6000, v19, OS_LOG_TYPE_DEFAULT, "WiFi/Cellular is off while iCloud signed in", buf, 2u);
      }

      objc_msgSend(v16, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
      -[PSUIAddOnPlanGroup _addWiFiOffFooter](self, "_addWiFiOffFooter");
    }
    else if (objc_msgSend(v17, "count"))
    {
      v20 = self->_groupSpecifier;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("ADD_ON_PLAN_FOOTER_NEW"), &stru_24D5028C8, CFSTR("Cellular"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifier setProperty:forKey:](v20, "setProperty:forKey:", v22, *MEMORY[0x24BE75A68]);

    }
    else
    {
      -[PSUIAddOnPlanGroup getLogger](self, "getLogger");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_2161C6000, v24, OS_LOG_TYPE_DEFAULT, "No add-on plan(s) is available", v26, 2u);
      }

      objc_msgSend(v3, "removeAllObjects");
    }

  }
  return v3;
}

- (id)specifiersForRemotePlans:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  char v6;
  BOOL v7;
  NSMutableArray *remotePlansSpecifiers;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  NSMutableArray *v13;
  NSObject *v14;
  NSString *v15;
  NSString *carrierName;
  PSUICellularPlanAddOnPlanSpecifier *v17;
  void *v18;
  NSObject *v19;
  NSMutableArray *v20;
  NSMutableArray *v21;
  NSMutableArray *v23;
  uint8_t buf[4];
  NSMutableArray *v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sf_isiPad");

  if ((v6 & 1) == 0)
    return self->_remotePlansSpecifiers;
  v7 = -[PSUICellularPlanManagerCache isCarrierItemFlowSupported](self->_cellularPlanManager, "isCarrierItemFlowSupported");
  remotePlansSpecifiers = self->_remotePlansSpecifiers;
  if (v7)
  {
    -[NSMutableArray removeAllObjects](remotePlansSpecifiers, "removeAllObjects");
    if (!self->_showAddOnPlans
      && v3
      && !-[PSUICellularPlanManagerCache remoteListFetchCompleted](self->_cellularPlanManager, "remoteListFetchCompleted"))
    {
      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, 0, 0, 0, 15, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](self->_remotePlansSpecifiers, "addObject:", v9);

    }
    -[PSUICellularPlanManagerCache remotePlans](self->_cellularPlanManager, "remotePlans");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "plans");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count"))
    {
      v12 = 0;
      do
      {
        objc_msgSend(v11, "objectAtIndex:", v12);
        v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        -[PSUIAddOnPlanGroup getLogger](self, "getLogger");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v13;
          _os_log_impl(&dword_2161C6000, v14, OS_LOG_TYPE_DEFAULT, "remote plan: %@", buf, 0xCu);
        }

        if (-[NSMutableArray attributes](v13, "attributes") == 8)
        {
          -[NSMutableArray carrierName](v13, "carrierName");
          v15 = (NSString *)objc_claimAutoreleasedReturnValue();
          carrierName = self->_carrierName;
          self->_carrierName = v15;

          v17 = -[PSUICellularPlanAddOnPlanSpecifier initWithTarget:action:displayPlan:]([PSUICellularPlanAddOnPlanSpecifier alloc], "initWithTarget:action:displayPlan:", self, sel__addButtonPressed_, v13);
          -[PSUICellularPlanAddOnPlanSpecifier addButton](v17, "addButton");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setTag:", v12);

          -[NSMutableArray insertObject:atIndex:](self->_remotePlansSpecifiers, "insertObject:atIndex:", v17, v12);
        }
        else
        {
          -[PSUIAddOnPlanGroup getLogger](self, "getLogger");
          v17 = (PSUICellularPlanAddOnPlanSpecifier *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v17->super.super, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2161C6000, &v17->super.super, OS_LOG_TYPE_DEFAULT, "plan not addon type, skipping...", buf, 2u);
          }
        }

        ++v12;
      }
      while (objc_msgSend(v11, "count") > v12);
    }
    -[PSUIAddOnPlanGroup getLogger](self, "getLogger");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = self->_remotePlansSpecifiers;
      *(_DWORD *)buf = 138412290;
      v25 = v20;
      _os_log_impl(&dword_2161C6000, v19, OS_LOG_TYPE_DEFAULT, "specifiers:  %@", buf, 0xCu);
    }

    v21 = self->_remotePlansSpecifiers;
    return v21;
  }
  else
  {
    v23 = remotePlansSpecifiers;
    return v23;
  }
}

- (void)_addButtonPressed:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id WeakRetained;
  _QWORD v30[5];
  id v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sf_isiPad");

  if ((v6 & 1) != 0)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_remotePlansSpecifiers, "objectAtIndexedSubscript:", objc_msgSend(v4, "tag"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIAddOnPlanGroup getLogger](self, "getLogger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v33 = v9;
      _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "Remote item pressed: %@", buf, 0xCu);

    }
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("ADD_ON_PLAN_ALERT_BODY_%@"), &stru_24D5028C8, CFSTR("Cellular"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "carrierName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v12, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x24BEBD3B0];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("ADD_ON_PLAN_ALERT_TITILE"), &stru_24D5028C8, CFSTR("Cellular"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "alertControllerWithTitle:message:preferredStyle:", v18, v15, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("NOT_ALLOW_BUTTON"), &stru_24D5028C8, CFSTR("Cellular"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "actionWithTitle:style:handler:", v22, 1, &__block_literal_global_19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "addAction:", v23);
    v24 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("OK_BUTTON"), &stru_24D5028C8, CFSTR("Cellular"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __40__PSUIAddOnPlanGroup__addButtonPressed___block_invoke_2;
    v30[3] = &unk_24D501B58;
    v30[4] = self;
    v31 = v7;
    v27 = v7;
    objc_msgSend(v24, "actionWithTitle:style:handler:", v26, 0, v30);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "addAction:", v28);
    WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v19, 1, 0);

  }
  else
  {
    -[PSUIAddOnPlanGroup getLogger](self, "getLogger");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_2161C6000, v15, OS_LOG_TYPE_FAULT, "Invalid action", buf, 2u);
    }
  }

}

uint64_t __40__PSUIAddOnPlanGroup__addButtonPressed___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAddRemotePlan:", *(_QWORD *)(a1 + 40));
}

- (void)_handleAddRemotePlan:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  TSSIMSetupFlow *v15;
  TSSIMSetupFlow *flow;
  TSSIMSetupFlow *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  objc_msgSend(WeakRetained, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", 0);

  objc_msgSend(v4, "addButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 1);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessoryView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessoryView:", v8);
  objc_msgSend(v8, "startAnimating");
  v28[0] = *MEMORY[0x24BE82B48];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v11;
  v28[1] = *MEMORY[0x24BE82B60];
  objc_msgSend(v4, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "plan");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE82B38], "flowWithOptions:", v14);
  v15 = (TSSIMSetupFlow *)objc_claimAutoreleasedReturnValue();
  flow = self->_flow;
  self->_flow = v15;

  -[TSSIMSetupFlow setDelegate:](self->_flow, "setDelegate:", self);
  v17 = self->_flow;
  v18 = objc_loadWeakRetained((id *)&self->_listController);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __43__PSUIAddOnPlanGroup__handleAddRemotePlan___block_invoke;
  v23[3] = &unk_24D502520;
  v23[4] = self;
  v24 = v8;
  v25 = v9;
  v26 = v10;
  v27 = v4;
  v19 = v4;
  v20 = v10;
  v21 = v9;
  v22 = v8;
  -[TSSIMSetupFlow showFirstViewControllerWithHostController:completion:](v17, "showFirstViewControllerWithHostController:completion:", v18, v23);

}

void __43__PSUIAddOnPlanGroup__handleAddRemotePlan___block_invoke(id *a1)
{
  _QWORD v2[4];
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id location;

  location = 0;
  objc_initWeak(&location, a1[4]);
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __43__PSUIAddOnPlanGroup__handleAddRemotePlan___block_invoke_2;
  v2[3] = &unk_24D5024F8;
  objc_copyWeak(&v7, &location);
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[7];
  v6 = a1[8];
  dispatch_async(MEMORY[0x24BDAC9B8], v2);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __43__PSUIAddOnPlanGroup__handleAddRemotePlan___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  void *v4;
  void *v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 7);
    objc_msgSend(v3, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUserInteractionEnabled:", 1);

    objc_msgSend(*(id *)(a1 + 32), "stopAnimating");
    objc_msgSend(*(id *)(a1 + 40), "setAccessoryView:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 56), "addButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 0);

    WeakRetained = v6;
  }

}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  _QWORD block[4];
  id v5[2];
  id location;

  location = 0;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__PSUIAddOnPlanGroup_simSetupFlowCompleted___block_invoke;
  block[3] = &unk_24D502548;
  objc_copyWeak(v5, &location);
  v5[1] = (id)a3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

void __44__PSUIAddOnPlanGroup_simSetupFlowCompleted___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[8];
    WeakRetained[8] = 0;
    v5 = WeakRetained;

    WeakRetained = v5;
    if (*(_QWORD *)(a1 + 40) != 1)
    {
      objc_msgSend(v5, "listController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

      WeakRetained = v5;
    }
  }

}

- (void)_addOnPlanOptionPressed:(id)a3
{
  PSListController **p_listController;
  id WeakRetained;
  int v5;
  id v6;
  void *v7;
  id v8;
  PSUICarrierListController *v9;
  PSUICarrierListController *v10;

  p_listController = &self->_listController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  v5 = objc_msgSend(WeakRetained, "isInModalPresentation");

  if (v5)
  {
    v10 = -[PSUICarrierListController initWithOptions:showCarrierItemGroup:]([PSUICarrierListController alloc], "initWithOptions:showCarrierItemGroup:", 1, 0);
    v6 = objc_loadWeakRetained((id *)p_listController);
    objc_msgSend(v6, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pushViewController:animated:", v10, 1);

  }
  else
  {
    v8 = objc_alloc(MEMORY[0x24BEBD7A0]);
    v9 = -[PSUICarrierListController initWithOptions:showCarrierItemGroup:]([PSUICarrierListController alloc], "initWithOptions:showCarrierItemGroup:", 1, 0);
    v10 = (PSUICarrierListController *)objc_msgSend(v8, "initWithRootViewController:", v9);

    -[PSUICarrierListController setModalPresentationStyle:](v10, "setModalPresentationStyle:", 2);
    v6 = objc_loadWeakRetained((id *)p_listController);
    objc_msgSend(v6, "presentViewController:animated:completion:", v10, 1, 0);
  }

}

- (BOOL)_shouldShowWiFiOffFooter
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isSingleActivationCodeFlowSupported") & 1) != 0)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "sf_isiPad"))
    {
      objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "aa_primaryAppleAccount");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        +[PSUIDeviceWiFiState sharedInstance](PSUIDeviceWiFiState, "sharedInstance");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v7, "isConnectedOverWiFi") & 1) != 0)
        {
          LOBYTE(v3) = 0;
        }
        else
        {
          +[PSUIDeviceCellularState sharedInstance](PSUIDeviceCellularState, "sharedInstance");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v3 = objc_msgSend(v8, "isConnectedOverCellular") ^ 1;

        }
      }
      else
      {
        LOBYTE(v3) = 0;
      }

    }
    else
    {
      LOBYTE(v3) = 0;
    }

  }
  return v3;
}

- (void)_addWiFiOffFooter
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  PSSpecifier *groupSpecifier;
  objc_class *v17;
  void *v18;
  PSSpecifier *v19;
  void *v20;
  PSSpecifier *v21;
  void *v22;
  PSSpecifier *v23;
  void *v24;
  id v25;
  NSRange v26;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("TURN_ON_WIFI_FAUX_CARD_SCANNER_FOOTER_HYPERLINK_SUBSTRING"), &stru_24D5028C8, CFSTR("Cellular"));
  v25 = (id)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("TURN_ON_WIFI_FAUX_CARD_SCANNER_FOOTER_%@"), &stru_24D5028C8, CFSTR("Cellular"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6, v25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "sf_isChinaRegionCellularDevice");

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("TURN_ON_WLAN_FAUX_CARD_SCANNER_FOOTER_HYPERLINK_SUBSTRING"), &stru_24D5028C8, CFSTR("Cellular"));
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("TURN_ON_WLAN_FAUX_CARD_SCANNER_FOOTER_%@"), &stru_24D5028C8, CFSTR("Cellular"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", v14, v11);
    v15 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v15;
    v25 = (id)v11;
  }
  groupSpecifier = self->_groupSpecifier;
  v17 = (objc_class *)objc_opt_class();
  NSStringFromClass(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSpecifier setProperty:forKey:](groupSpecifier, "setProperty:forKey:", v18, *MEMORY[0x24BE75A30]);

  -[PSSpecifier setProperty:forKey:](self->_groupSpecifier, "setProperty:forKey:", v7, *MEMORY[0x24BE75A58]);
  v19 = self->_groupSpecifier;
  v26.location = objc_msgSend(v7, "rangeOfString:", v25);
  NSStringFromRange(v26);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSpecifier setProperty:forKey:](v19, "setProperty:forKey:", v20, *MEMORY[0x24BE75A40]);

  v21 = self->_groupSpecifier;
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=WIFI"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSpecifier setProperty:forKey:](v21, "setProperty:forKey:", v22, *MEMORY[0x24BE75A60]);

  v23 = self->_groupSpecifier;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSpecifier setProperty:forKey:](v23, "setProperty:forKey:", v24, *MEMORY[0x24BE75A50]);

  -[PSSpecifier setProperty:forKey:](self->_groupSpecifier, "setProperty:forKey:", CFSTR("_turnOnWifiPressed:"), *MEMORY[0x24BE75A38]);
}

- (void)_turnOnWifiPressed:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDC1548];
  v4 = a3;
  objc_msgSend(v3, "defaultWorkspace");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "openSensitiveURL:withOptions:", v5, 0);
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("AddOnPlan"));
}

- (PSSpecifier)groupSpecifier
{
  return self->_groupSpecifier;
}

- (void)setGroupSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_groupSpecifier, a3);
}

- (PSListController)listController
{
  return (PSListController *)objc_loadWeakRetained((id *)&self->_listController);
}

- (void)setListController:(id)a3
{
  objc_storeWeak((id *)&self->_listController, a3);
}

- (TSSIMSetupFlow)flow
{
  return (TSSIMSetupFlow *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFlow:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flow, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
  objc_storeStrong((id *)&self->_remotePlansSpecifiers, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_ctCellularPlanManager, 0);
  objc_storeStrong((id *)&self->_cellularPlanManager, 0);
}

@end
