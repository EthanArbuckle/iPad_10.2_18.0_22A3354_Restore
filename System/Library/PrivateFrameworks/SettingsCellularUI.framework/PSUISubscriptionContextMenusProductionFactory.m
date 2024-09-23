@implementation PSUISubscriptionContextMenusProductionFactory

- (PSUISubscriptionContextMenusProductionFactory)initWithHostController:(id)a3 parentSpecifier:(id)a4 groupSpecifier:(id)a5 popViewControllerOnPlanRemoval:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  PSUISubscriptionContextMenusProductionFactory *v13;
  PSUISubscriptionContextMenusProductionFactory *v14;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PSUISubscriptionContextMenusProductionFactory;
  v13 = -[PSUISubscriptionContextMenusProductionFactory init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_hostController, v10);
    objc_storeWeak((id *)&v14->_parentSpecifier, v11);
    objc_storeWeak((id *)&v14->_groupSpecifier, v12);
    v14->_popViewControllerOnPlanRemoval = a6;
  }

  return v14;
}

- (PSListController)hostController
{
  return (PSListController *)objc_loadWeakRetained((id *)&self->_hostController);
}

- (PSSpecifier)parentSpecifier
{
  return (PSSpecifier *)objc_loadWeakRetained((id *)&self->_parentSpecifier);
}

- (PSSpecifier)groupSpecifier
{
  return (PSSpecifier *)objc_loadWeakRetained((id *)&self->_groupSpecifier);
}

- (BOOL)shouldPopViewControllerOnPlanRemoval
{
  return self->_popViewControllerOnPlanRemoval;
}

- (id)createCallingSubgroup
{
  PSUICallingSubgroup *v3;
  id WeakRetained;
  id v5;
  id v6;
  PSUICallingSubgroup *v7;

  v3 = [PSUICallingSubgroup alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  v5 = objc_loadWeakRetained((id *)&self->_groupSpecifier);
  v6 = objc_loadWeakRetained((id *)&self->_parentSpecifier);
  v7 = -[PSUICallingSubgroup initWithListController:groupSpecifier:parentSpecifier:](v3, "initWithListController:groupSpecifier:parentSpecifier:", WeakRetained, v5, v6);

  return v7;
}

- (id)createCarrierSpaceSubgroup
{
  PSUICarrierSpaceGroup *v3;
  id WeakRetained;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  PSUICarrierSpaceGroup *v10;

  v3 = [PSUICarrierSpaceGroup alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  v5 = objc_loadWeakRetained((id *)&self->_groupSpecifier);
  v6 = objc_loadWeakRetained((id *)&self->_parentSpecifier);
  v7 = objc_alloc(MEMORY[0x24BDC2810]);
  objc_msgSend(MEMORY[0x24BE856B8], "createCTClientSerialQueue:", CFSTR("carrier_space"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithQueue:", v8);
  v10 = -[PSUICarrierSpaceGroup initWithListController:groupSpecifier:parentSpecifier:ctClient:](v3, "initWithListController:groupSpecifier:parentSpecifier:ctClient:", WeakRetained, v5, v6, v9);

  return v10;
}

- (id)createNetworkSelectionSubgroup
{
  PSUINetworkSelectionSubgroup *v3;
  id WeakRetained;
  id v5;
  id v6;
  PSUINetworkSelectionSubgroup *v7;

  v3 = [PSUINetworkSelectionSubgroup alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  v5 = objc_loadWeakRetained((id *)&self->_groupSpecifier);
  v6 = objc_loadWeakRetained((id *)&self->_parentSpecifier);
  v7 = -[PSUINetworkSelectionSubgroup initWithListController:groupSpecifier:parentSpecifier:](v3, "initWithListController:groupSpecifier:parentSpecifier:", WeakRetained, v5, v6);

  return v7;
}

- (id)createMyNumberSubgroup
{
  PSUIMyNumberSubgroup *v3;
  id WeakRetained;
  id v5;
  id v6;
  PSUIMyNumberSubgroup *v7;

  v3 = [PSUIMyNumberSubgroup alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  v5 = objc_loadWeakRetained((id *)&self->_groupSpecifier);
  v6 = objc_loadWeakRetained((id *)&self->_parentSpecifier);
  v7 = -[PSUIMyNumberSubgroup initWithListController:groupSpecifier:parentSpecifier:](v3, "initWithListController:groupSpecifier:parentSpecifier:", WeakRetained, v5, v6);

  return v7;
}

- (id)createNetworkSettingsSubgroup
{
  PSUINetworkSettingsSubgroup *v3;
  id WeakRetained;
  id v5;
  id v6;
  PSUINetworkSettingsSubgroup *v7;

  v3 = [PSUINetworkSettingsSubgroup alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  v5 = objc_loadWeakRetained((id *)&self->_groupSpecifier);
  v6 = objc_loadWeakRetained((id *)&self->_parentSpecifier);
  v7 = -[PSUINetworkSettingsSubgroup initWithListController:groupSpecifier:parentSpecifier:](v3, "initWithListController:groupSpecifier:parentSpecifier:", WeakRetained, v5, v6);

  return v7;
}

- (id)createSimSubgroup
{
  PSUISIMSubgroup *v3;
  id WeakRetained;
  id v5;
  id v6;
  PSUISIMSubgroup *v7;

  v3 = [PSUISIMSubgroup alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  v5 = objc_loadWeakRetained((id *)&self->_groupSpecifier);
  v6 = objc_loadWeakRetained((id *)&self->_parentSpecifier);
  v7 = -[PSUISIMSubgroup initWithListController:groupSpecifier:parentSpecifier:](v3, "initWithListController:groupSpecifier:parentSpecifier:", WeakRetained, v5, v6);

  return v7;
}

- (id)createCallCache
{
  return +[PSUICoreTelephonyCallCache sharedInstance](PSUICoreTelephonyCallCache, "sharedInstance");
}

- (id)createSimStatusCache
{
  return (id)objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
}

- (id)createCarrierBundleCache
{
  return +[PSUICoreTelephonyCarrierBundleCache sharedInstance](PSUICoreTelephonyCarrierBundleCache, "sharedInstance");
}

- (id)createDataCache
{
  return +[PSUICoreTelephonyDataCache sharedInstance](PSUICoreTelephonyDataCache, "sharedInstance");
}

- (id)createCellularPlanManagerCache
{
  return +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
}

- (id)createCellularPlanManager
{
  return (id)objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
}

- (id)createPasscodeStatusCache
{
  return +[PSUIDevicePasscodeState sharedInstance](PSUIDevicePasscodeState, "sharedInstance");
}

- (id)createDataModeSubgroupWithContext:(id)a3
{
  id v4;
  PSUIDataModeSubgroup *v5;
  id WeakRetained;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  PSUIDataModeSubgroup *v12;

  v4 = a3;
  v5 = [PSUIDataModeSubgroup alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  v7 = objc_loadWeakRetained((id *)&self->_parentSpecifier);
  +[PSUICoreTelephonyDataCache sharedInstance](PSUICoreTelephonyDataCache, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x24BDC2810]);
  objc_msgSend(MEMORY[0x24BE856B8], "createCTClientSerialQueue:", CFSTR("data_mode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithQueue:", v10);
  v12 = -[PSUIDataModeSubgroup initWithHostController:parentSpecifier:dataCache:context:ctClient:](v5, "initWithHostController:parentSpecifier:dataCache:context:ctClient:", WeakRetained, v7, v8, v4, v11);

  return v12;
}

- (id)createRoamingSpecifiersSubgroupWithServiceDescriptor:(id)a3
{
  id v4;
  PSUIRoamingSpecifiersSubgroup *v5;
  id WeakRetained;
  void *v7;
  PSUIRoamingSpecifiersSubgroup *v8;

  v4 = a3;
  v5 = [PSUIRoamingSpecifiersSubgroup alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  +[PSUICoreTelephonyDataCache sharedInstance](PSUICoreTelephonyDataCache, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PSUIRoamingSpecifiersSubgroup initWithListController:dataCache:serviceDescriptor:](v5, "initWithListController:dataCache:serviceDescriptor:", WeakRetained, v7, v4);

  return v8;
}

- (id)createCapabilitiesCache
{
  return +[PSUICoreTelephonyCapabilitiesCache sharedInstance](PSUICoreTelephonyCapabilitiesCache, "sharedInstance");
}

- (void)setHostController:(id)a3
{
  objc_storeWeak((id *)&self->_hostController, a3);
}

- (void)setParentSpecifier:(id)a3
{
  objc_storeWeak((id *)&self->_parentSpecifier, a3);
}

- (void)setGroupSpecifier:(id)a3
{
  objc_storeWeak((id *)&self->_groupSpecifier, a3);
}

- (BOOL)popViewControllerOnPlanRemoval
{
  return self->_popViewControllerOnPlanRemoval;
}

- (void)setPopViewControllerOnPlanRemoval:(BOOL)a3
{
  self->_popViewControllerOnPlanRemoval = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_groupSpecifier);
  objc_destroyWeak((id *)&self->_parentSpecifier);
  objc_destroyWeak((id *)&self->_hostController);
}

@end
