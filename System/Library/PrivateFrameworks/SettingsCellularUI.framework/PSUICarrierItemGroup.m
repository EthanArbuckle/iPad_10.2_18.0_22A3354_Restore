@implementation PSUICarrierItemGroup

- (BOOL)isFlowRunning
{
  return self->_flow != 0;
}

- (PSUICarrierItemGroup)init
{
  objc_exception_throw((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE88]), "initWithName:reason:userInfo:", CFSTR("Unsupported initializer called"), CFSTR("Unsupported initializer called"), 0));
}

- (PSUICarrierItemGroup)initWithListController:(id)a3 groupSpecifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  PSUICarrierItemGroup *v10;

  v6 = a4;
  v7 = a3;
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PSUICarrierItemGroup initWithListController:groupSpecifier:planManager:ctPlanManager:showCarrierItems:](self, "initWithListController:groupSpecifier:planManager:ctPlanManager:showCarrierItems:", v7, v6, v8, v9, 1);

  return v10;
}

- (PSUICarrierItemGroup)initWithListController:(id)a3 groupSpecifier:(id)a4 showCarrierItems:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  PSUICarrierItemGroup *v12;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PSUICarrierItemGroup initWithListController:groupSpecifier:planManager:ctPlanManager:showCarrierItems:](self, "initWithListController:groupSpecifier:planManager:ctPlanManager:showCarrierItems:", v9, v8, v10, v11, v5);

  return v12;
}

- (PSUICarrierItemGroup)initWithListController:(id)a3 groupSpecifier:(id)a4 planManager:(id)a5 ctPlanManager:(id)a6 showCarrierItems:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  PSUICarrierItemGroup *v16;
  PSUICarrierItemGroup *v17;
  TSSIMSetupFlow *flow;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PSUICarrierItemGroup;
  v16 = -[PSUICarrierItemGroup init](&v20, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_listController, v12);
    objc_storeStrong((id *)&v17->_groupSpecifier, a4);
    objc_storeStrong((id *)&v17->_cellularPlanManagerCache, a5);
    objc_storeStrong((id *)&v17->_ctCellularPlanManager, a6);
    v17->_showCarrierItems = a7;
    flow = v17->_flow;
    v17->_flow = 0;

  }
  return v17;
}

- (id)specifiers
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  PSSpecifier *groupSpecifier;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint8_t v28[16];
  uint8_t buf[16];

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (self->_showCarrierItems)
  {
    -[PSUICarrierItemGroup specifiersForCarrierItems](self, "specifiersForCarrierItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v4);

    if (objc_msgSend(v3, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CELLULAR_CHOOSE_NETWORK"), &stru_24D5028C8, CFSTR("Cellular"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifier setName:](self->_groupSpecifier, "setName:", v6);

      groupSpecifier = self->_groupSpecifier;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CELLULAR_SETUP_DATA_COLLECTION_DISCLOSURE"), &stru_24D5028C8, CFSTR("Cellular"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifier setProperty:forKey:](groupSpecifier, "setProperty:forKey:", v9, *MEMORY[0x24BE75A68]);

    }
    if (!objc_msgSend(v3, "count"))
      -[PSUICarrierItemGroup _addLocationFooterIfNecessary](self, "_addLocationFooterIfNecessary");
    if ((_os_feature_enabled_impl() & 1) == 0
      && -[PSUICellularPlanManagerCache isActivationCodeFlowSupported](self->_cellularPlanManagerCache, "isActivationCodeFlowSupported"))
    {
      -[PSUICarrierItemGroup addCellularPlanSpecifier](self, "addCellularPlanSpecifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        objc_msgSend(v3, "addObject:", v10);

    }
  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[PSUICarrierItemGroup specifiersForCarrierItems](self, "specifiersForCarrierItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v12);

    if ((objc_msgSend(getCLLocationManagerClass_1(), "locationServicesEnabled") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CARRIER_ITEM_FOOTER"), &stru_24D5028C8, CFSTR("Cellular"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = -[PSUICellularPlanManagerCache isCarrierItemBeingFetched](self->_cellularPlanManagerCache, "isCarrierItemBeingFetched");
      v16 = (void *)MEMORY[0x24BE75590];
      if (v15)
      {
        objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24D5028C8, self, 0, 0, 0, 13, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
        objc_msgSend(v17, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("CARRIER_ITEM"), &stru_24D5028C8, CFSTR("Cellular"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v23, self, 0, 0, 0, 13, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v11, "count"))
        {
          -[PSUICarrierItemGroup getLogger](self, "getLogger");
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v28 = 0;
            _os_log_impl(&dword_2161C6000, v24, OS_LOG_TYPE_DEFAULT, "No carrier item(s) is available in this location", v28, 2u);
          }

          objc_msgSend(v17, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("NO_CARRIER_ITEM_FOOTER"), &stru_24D5028C8, CFSTR("Cellular"));
          v26 = objc_claimAutoreleasedReturnValue();

          v14 = (void *)v26;
        }
      }
      -[PSSpecifier setProperty:forKey:](self->_groupSpecifier, "setProperty:forKey:", v14, *MEMORY[0x24BE75A68]);

    }
    else
    {
      -[PSUICarrierItemGroup getLogger](self, "getLogger");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2161C6000, v18, OS_LOG_TYPE_DEFAULT, "Location Services is off", buf, 2u);
      }

      v19 = (void *)MEMORY[0x24BE75590];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("CARRIER_ITEM"), &stru_24D5028C8, CFSTR("Cellular"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v21, self, 0, 0, 0, 13, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
      -[PSUICarrierItemGroup _addLocationFooterIfNecessary](self, "_addLocationFooterIfNecessary");
    }
    objc_msgSend(v3, "addObject:", v17);
    objc_msgSend(v17, "setButtonAction:", sel_carrierItemOptionPressed_);

  }
  return v3;
}

- (id)addCellularPlanSpecifier
{
  PSUIAddCellularPlanSpecifier *addCellularPlanSpecifierEmbedded;
  PSUIAddCellularPlanSpecifier **p_addCellularPlanSpecifierEmbedded;
  PSUIAddCellularPlanSpecifier *v5;
  id WeakRetained;
  PSUIAddCellularPlanSpecifier *v7;
  PSUIAddCellularPlanSpecifier *addCellularPlanSpecifierStandard;
  PSUIAddCellularPlanSpecifier *v9;
  PSUIAddCellularPlanSpecifier *v10;
  PSUIAddCellularPlanSpecifier *v11;

  if (-[PSUICarrierItemGroup hasCarrierItems](self, "hasCarrierItems"))
  {
    if (!self->_showCarrierItems)
    {
      v11 = 0;
      return v11;
    }
    p_addCellularPlanSpecifierEmbedded = &self->_addCellularPlanSpecifierEmbedded;
    addCellularPlanSpecifierEmbedded = self->_addCellularPlanSpecifierEmbedded;
    if (!addCellularPlanSpecifierEmbedded)
    {
      v5 = [PSUIAddCellularPlanSpecifier alloc];
      WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
      v7 = -[PSUIAddCellularPlanSpecifier initWithHostController:isEmbeddedInCarrierList:](v5, "initWithHostController:isEmbeddedInCarrierList:", WeakRetained, 1);
      addCellularPlanSpecifierStandard = self->_addCellularPlanSpecifierEmbedded;
      self->_addCellularPlanSpecifierEmbedded = v7;
LABEL_7:

      addCellularPlanSpecifierEmbedded = *p_addCellularPlanSpecifierEmbedded;
    }
  }
  else
  {
    p_addCellularPlanSpecifierEmbedded = &self->_addCellularPlanSpecifierStandard;
    addCellularPlanSpecifierEmbedded = self->_addCellularPlanSpecifierStandard;
    if (!addCellularPlanSpecifierEmbedded)
    {
      v9 = [PSUIAddCellularPlanSpecifier alloc];
      WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
      v10 = -[PSUIAddCellularPlanSpecifier initWithHostController:isEmbeddedInCarrierList:](v9, "initWithHostController:isEmbeddedInCarrierList:", WeakRetained, 0);
      addCellularPlanSpecifierStandard = self->_addCellularPlanSpecifierStandard;
      self->_addCellularPlanSpecifierStandard = v10;
      goto LABEL_7;
    }
  }
  v11 = addCellularPlanSpecifierEmbedded;
  return v11;
}

- (BOOL)hasCarrierItems
{
  void *v3;
  BOOL v4;

  if (!-[PSUICellularPlanManagerCache isCarrierItemFlowSupported](self->_cellularPlanManagerCache, "isCarrierItemFlowSupported"))return 0;
  -[PSUICellularPlanManagerCache carrierItems](self->_cellularPlanManagerCache, "carrierItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (id)specifiersForCarrierItems
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1
    && -[PSUICellularPlanManagerCache isCarrierItemFlowSupported](self->_cellularPlanManagerCache, "isCarrierItemFlowSupported"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[PSUICellularPlanManagerCache carrierItems](self->_cellularPlanManagerCache, "carrierItems");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          v11 = (void *)MEMORY[0x24BE75590];
          objc_msgSend(v10, "name");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v12, self, 0, 0, 0, 3, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "setButtonAction:", sel_carrierItemPressed_);
          objc_msgSend(v13, "setUserInfo:", v10);
          objc_msgSend(v3, "addObject:", v13);

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      }
      while (v7);
    }

    -[PSUICarrierItemGroup getLogger](self, "getLogger");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v3;
      _os_log_impl(&dword_2161C6000, v14, OS_LOG_TYPE_DEFAULT, "Carrier Group specifiers:  %@", buf, 0xCu);
    }

  }
  return v3;
}

- (void)carrierItemPressed:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  _QWORD v27[5];
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUICarrierItemGroup getLogger](self, "getLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v5;
    _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  objc_msgSend(v5, "warningText");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7,
        objc_msgSend(v5, "warningText"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "length"),
        v9,
        v8,
        v10))
  {
    v11 = (void *)MEMORY[0x24BEBD3B0];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CARRIER_LOCK_WARNING_TITLE"), &stru_24D5028C8, CFSTR("Cellular"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "warningText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "alertControllerWithTitle:message:preferredStyle:", v13, v14, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_24D5028C8, CFSTR("Cellular"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x24BDAC760];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __43__PSUICarrierItemGroup_carrierItemPressed___block_invoke;
    v27[3] = &unk_24D502750;
    v27[4] = self;
    v28 = v5;
    v29 = v4;
    objc_msgSend(v16, "actionWithTitle:style:handler:", v18, 0, v27);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "addAction:", v20);
    v21 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24D5028C8, CFSTR("Cellular"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v19;
    v26[1] = 3221225472;
    v26[2] = __43__PSUICarrierItemGroup_carrierItemPressed___block_invoke_48;
    v26[3] = &unk_24D5017B8;
    v26[4] = self;
    objc_msgSend(v21, "actionWithTitle:style:handler:", v23, 1, v26);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "addAction:", v24);
    -[PSUICarrierItemGroup listController](self, "listController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "presentViewController:animated:completion:", v15, 1, 0);

  }
  else
  {
    objc_msgSend(v5, "plan");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICarrierItemGroup _handleAddCarrierItem:specifier:](self, "_handleAddCarrierItem:specifier:", v15, v4);
  }

}

void __43__PSUICarrierItemGroup_carrierItemPressed___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2161C6000, v2, OS_LOG_TYPE_DEFAULT, "continue pressed", v5, 2u);
  }

  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "plan");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_handleAddCarrierItem:specifier:", v4, *(_QWORD *)(a1 + 48));

}

void __43__PSUICarrierItemGroup_carrierItemPressed___block_invoke_48(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[16];

  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_2161C6000, v1, OS_LOG_TYPE_DEFAULT, "cancel pressed", v2, 2u);
  }

}

- (void)_handleAddCarrierItem:(id)a3 specifier:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  TSSIMSetupFlow *v16;
  TSSIMSetupFlow *flow;
  TSSIMSetupFlow *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (objc_class *)MEMORY[0x24BEBD398];
  v8 = a4;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(v8, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setAccessoryView:", v9);
  objc_msgSend(v9, "startAnimating");
  WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  objc_msgSend(WeakRetained, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setUserInteractionEnabled:", 0);

  v27[0] = *MEMORY[0x24BE82B48];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = *MEMORY[0x24BE82B60];
  v28[0] = v13;
  v28[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSUICarrierItemGroup getLogger](self, "getLogger");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v14;
    _os_log_impl(&dword_2161C6000, v15, OS_LOG_TYPE_DEFAULT, "launching flow with options: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BE82B38], "flowWithOptions:", v14);
  v16 = (TSSIMSetupFlow *)objc_claimAutoreleasedReturnValue();
  flow = self->_flow;
  self->_flow = v16;

  -[TSSIMSetupFlow setDelegate:](self->_flow, "setDelegate:", self);
  v18 = self->_flow;
  v19 = objc_loadWeakRetained((id *)&self->_listController);
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __56__PSUICarrierItemGroup__handleAddCarrierItem_specifier___block_invoke;
  v22[3] = &unk_24D502778;
  v22[4] = self;
  v23 = v9;
  v24 = v10;
  v20 = v10;
  v21 = v9;
  -[TSSIMSetupFlow showFirstViewControllerWithHostController:completion:](v18, "showFirstViewControllerWithHostController:completion:", v19, v22);

}

void __56__PSUICarrierItemGroup__handleAddCarrierItem_specifier___block_invoke(id *a1)
{
  _QWORD v2[4];
  id v3;
  id v4;
  id v5;
  id location;

  location = 0;
  objc_initWeak(&location, a1[4]);
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __56__PSUICarrierItemGroup__handleAddCarrierItem_specifier___block_invoke_2;
  v2[3] = &unk_24D501880;
  objc_copyWeak(&v5, &location);
  v3 = a1[5];
  v4 = a1[6];
  dispatch_async(MEMORY[0x24BDAC9B8], v2);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __56__PSUICarrierItemGroup__handleAddCarrierItem_specifier___block_invoke_2(id *a1)
{
  id *WeakRetained;
  id v3;
  void *v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 8);
    objc_msgSend(v3, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUserInteractionEnabled:", 1);

    objc_msgSend(a1[4], "stopAnimating");
    objc_msgSend(a1[5], "setAccessoryView:", 0);
    WeakRetained = v5;
  }

}

- (void)_addLocationFooterIfNecessary
{
  int v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint8_t buf[16];
  NSRange v34;

  v3 = _os_feature_enabled_impl();
  v4 = objc_msgSend(getCLLocationManagerClass_1(), "locationServicesEnabled");
  if (v4 && -[PSUICarrierItemGroup isCellNetworkSearchAuthorized](self, "isCellNetworkSearchAuthorized"))
  {
    +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
    v31 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v31, "isActivationCodeFlowSupported") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "sf_isChinaRegionCellularDevice") & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "sf_isiPad");

        if (v7)
        {
          -[PSUICarrierItemGroup groupSpecifier](self, "groupSpecifier");
          v32 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CELLULAR_SETUP_DATA_COLLECTION_DISCLOSURE"), &stru_24D5028C8, CFSTR("Cellular"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setProperty:forKey:", v9, *MEMORY[0x24BE75A68]);

        }
        return;
      }

    }
    return;
  }
  -[PSUICarrierItemGroup getLogger](self, "getLogger");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2161C6000, v10, OS_LOG_TYPE_DEFAULT, "Cellular: Location Services off", buf, 2u);
  }

  if (v4)
    v11 = CFSTR("prefs:root=Privacy&path=LOCATION/SYSTEM_SERVICES");
  else
    v11 = CFSTR("prefs:root=Privacy&path=LOCATION");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("TURN_ON_LOCATION_SERVICES_FAUX_CARD_SCANNER_FOOTER_HYPERLINK_SUBSTRING"), &stru_24D5028C8, CFSTR("Cellular"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v3)
    v17 = CFSTR("TURN_ON_LOCATION_SERVICES_FAUX_CARD_SCANNER_FOOTER_NEW_UI_%@");
  else
    v17 = CFSTR("TURN_ON_LOCATION_SERVICES_FAUX_CARD_SCANNER_FOOTER_%@");
  objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_24D5028C8, CFSTR("Cellular"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", v18, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSUICarrierItemGroup groupSpecifier](self, "groupSpecifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (objc_class *)objc_opt_class();
  NSStringFromClass(v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setProperty:forKey:", v22, *MEMORY[0x24BE75A30]);

  -[PSUICarrierItemGroup groupSpecifier](self, "groupSpecifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setProperty:forKey:", v19, *MEMORY[0x24BE75A58]);

  -[PSUICarrierItemGroup groupSpecifier](self, "groupSpecifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v34.location = objc_msgSend(v19, "rangeOfString:", v13);
  NSStringFromRange(v34);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setProperty:forKey:", v25, *MEMORY[0x24BE75A40]);

  -[PSUICarrierItemGroup groupSpecifier](self, "groupSpecifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v11);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setProperty:forKey:", v27, *MEMORY[0x24BE75A60]);

  -[PSUICarrierItemGroup groupSpecifier](self, "groupSpecifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setProperty:forKey:", v29, *MEMORY[0x24BE75A50]);

  -[PSUICarrierItemGroup groupSpecifier](self, "groupSpecifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setProperty:forKey:", CFSTR("turnOnLocationServicesPressed:"), *MEMORY[0x24BE75A38]);

}

- (void)turnOnLocationServicesPressed:(id)a3
{
  id v4;
  NSObject *v5;
  PSListController **p_listController;
  id WeakRetained;
  int v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PSUICarrierItemGroup getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "URL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v13;
    _os_log_debug_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v14, 0xCu);

  }
  p_listController = &self->_listController;
  WeakRetained = objc_loadWeakRetained((id *)p_listController);
  v8 = objc_msgSend(WeakRetained, "isInModalPresentation");

  if (v8)
  {
    v9 = objc_loadWeakRetained((id *)p_listController);
    objc_msgSend(v9, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dismissViewControllerAnimated:completion:", 1, 0);

  }
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "openSensitiveURL:withOptions:", v12, 0);

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
  block[2] = __46__PSUICarrierItemGroup_simSetupFlowCompleted___block_invoke;
  block[3] = &unk_24D502548;
  objc_copyWeak(v5, &location);
  v5[1] = (id)a3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

void __46__PSUICarrierItemGroup_simSetupFlowCompleted___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  id v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[5];
    WeakRetained[5] = 0;
    v5 = WeakRetained;

    WeakRetained = v5;
    if (*(_QWORD *)(a1 + 40) != 1)
    {
      v4 = objc_loadWeakRetained((id *)v5 + 8);
      objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

      WeakRetained = v5;
    }
  }

}

- (void)carrierItemOptionPressed:(id)a3
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
    v10 = -[PSUICarrierListController initWithOptions:showCarrierItemGroup:]([PSUICarrierListController alloc], "initWithOptions:showCarrierItemGroup:", 0, 1);
    v6 = objc_loadWeakRetained((id *)p_listController);
    objc_msgSend(v6, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pushViewController:animated:", v10, 1);

  }
  else
  {
    v8 = objc_alloc(MEMORY[0x24BEBD7A0]);
    v9 = -[PSUICarrierListController initWithOptions:showCarrierItemGroup:]([PSUICarrierListController alloc], "initWithOptions:showCarrierItemGroup:", 0, 1);
    v10 = (PSUICarrierListController *)objc_msgSend(v8, "initWithRootViewController:", v9);

    -[PSUICarrierListController setModalPresentationStyle:](v10, "setModalPresentationStyle:", 2);
    v6 = objc_loadWeakRetained((id *)p_listController);
    objc_msgSend(v6, "presentViewController:animated:completion:", v10, 1, 0);
  }

}

- (BOOL)isCellNetworkSearchAuthorized
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  _Unwind_Exception *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v2 = getCLCopyAppsUsingLocationSymbolLoc_ptr_1;
  v12 = getCLCopyAppsUsingLocationSymbolLoc_ptr_1;
  if (!getCLCopyAppsUsingLocationSymbolLoc_ptr_1)
  {
    v3 = (void *)CoreLocationLibrary_1();
    v2 = dlsym(v3, "CLCopyAppsUsingLocation");
    v10[3] = (uint64_t)v2;
    getCLCopyAppsUsingLocationSymbolLoc_ptr_1 = v2;
  }
  _Block_object_dispose(&v9, 8);
  if (!v2)
  {
    dlerror();
    v8 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v9, 8);
    _Unwind_Resume(v8);
  }
  v4 = (void *)((uint64_t (*)(void))v2)();
  objc_msgSend(v4, "objectForKey:", CFSTR("/System/Library/Frameworks/CoreTelephony.framework"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("com.apple.locationd.bundle-/System/Library/Frameworks/CoreTelephony.framework"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = objc_msgSend(getCLLocationManagerClass_1(), "isEntityAuthorizedForLocationDictionary:", v5);

  return v6;
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("CarrierItemGroup"));
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
  objc_storeStrong((id *)&self->_flow, 0);
  objc_storeStrong((id *)&self->_addCellularPlanSpecifierStandard, 0);
  objc_storeStrong((id *)&self->_addCellularPlanSpecifierEmbedded, 0);
  objc_storeStrong((id *)&self->_ctCellularPlanManager, 0);
  objc_storeStrong((id *)&self->_cellularPlanManagerCache, 0);
}

@end
