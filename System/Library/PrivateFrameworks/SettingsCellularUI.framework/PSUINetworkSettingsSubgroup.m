@implementation PSUINetworkSettingsSubgroup

- (PSUINetworkSettingsSubgroup)initWithListController:(id)a3 groupSpecifier:(id)a4 parentSpecifier:(id)a5
{
  id v7;
  id v8;
  PSUINetworkSettingsSubgroup *v9;
  PSUINetworkSettingsSubgroup *v10;
  objc_super v12;

  v7 = a3;
  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)PSUINetworkSettingsSubgroup;
  v9 = -[PSUINetworkSettingsSubgroup init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_listController, v7);
    objc_storeWeak((id *)&v10->_parentSpecifier, v8);
  }

  return v10;
}

- (PSUINetworkSettingsSubgroup)initWithListController:(id)a3 groupSpecifier:(id)a4
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
  PSUIVoiceAndDataSpecifier *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  PSUIVoiceAndDataSpecifier *v15;
  id WeakRetained;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v30 = (void *)objc_opt_new();
  v3 = (NSMutableArray *)objc_opt_new();
  bundleControllers = self->_bundleControllers;
  self->_bundleControllers = v3;

  objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
  v5 = (PSUIVoiceAndDataSpecifier *)objc_claimAutoreleasedReturnValue();
  -[PSUIVoiceAndDataSpecifier subscriptionContexts](v5, "subscriptionContexts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "count") <= 1)
  {

LABEL_6:
    goto LABEL_7;
  }
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "planItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "danglingPlanItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count") + v8;
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "plansPendingTransfer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v11 + objc_msgSend(v13, "count");

  if (v14 >= 2)
  {
    v15 = [PSUIVoiceAndDataSpecifier alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    v17 = objc_loadWeakRetained((id *)&self->_parentSpecifier);
    objc_msgSend(v17, "propertyForKey:", *MEMORY[0x24BE75CE8]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PSUIVoiceAndDataSpecifier initWithHostController:subscriptionContext:groupSpecifierToUpdateFooterFor:](v15, "initWithHostController:subscriptionContext:groupSpecifierToUpdateFooterFor:", WeakRetained, v18, 0);

    if (v5)
      objc_msgSend(v30, "addObject:", v5);
    goto LABEL_6;
  }
LABEL_7:
  v35 = *MEMORY[0x24BE758F8];
  v36[0] = CFSTR("EDGESettings");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v19;
  v33 = CFSTR("items");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v32, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_loadWeakRetained((id *)&self->_parentSpecifier);
  v23 = objc_loadWeakRetained((id *)&self->_listController);
  objc_msgSend(v23, "bundle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_loadWeakRetained((id *)&self->_listController);
  v31 = 0;
  SpecifiersFromPlist();
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = v31;
  -[NSMutableArray addObjectsFromArray:](self->_bundleControllers, "addObjectsFromArray:", v27, &v31);
  objc_msgSend(v30, "addObjectsFromArray:", v26);

  return v30;
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
  objc_destroyWeak((id *)&self->_parentSpecifier);
  objc_destroyWeak((id *)&self->_listController);
}

@end
