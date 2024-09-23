@implementation PSUIPlanPendingTransferListGroup

- (PSUIPlanPendingTransferListGroup)initWithListController:(id)a3 groupSpecifier:(id)a4
{
  id v6;
  id v7;
  PSUIPlanPendingTransferListGroup *v8;
  PSUIPlanPendingTransferListGroup *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PSUIPlanPendingTransferListGroup;
  v8 = -[PSUIPlanPendingTransferListGroup init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_listController, v6);
    objc_storeStrong((id *)&v9->_groupSpecifier, a4);
  }

  return v9;
}

- (id)specifiers
{
  void *v3;
  id v4;
  PSSpecifier *transferPlanSpecifier;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  PSSpecifier *v10;
  PSSpecifier *groupSpecifier;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v29;
  id obj;
  PSUIPlanPendingTransferListGroup *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[5];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v32 = (id)objc_opt_new();
  v31 = self;
  if (!_os_feature_enabled_impl())
  {
    +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "plansPendingTransfer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = v15;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v34;
      v29 = *MEMORY[0x24BE75948];
      v18 = *MEMORY[0x24BE75958];
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v34 != v17)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          v21 = (void *)MEMORY[0x24BE75590];
          objc_msgSend(v20, "carrierName");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "userInterfaceIdiom");

          if ((v24 & 0xFFFFFFFFFFFFFFFBLL) == 1)
            v25 = 0;
          else
            v25 = objc_opt_class();
          objc_msgSend(v21, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v22, v31, 0, 0, v25, 2, 0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if ((unint64_t)objc_msgSend(v20, "status") <= 3)
            objc_msgSend(v26, "setProperty:forKey:", objc_opt_class(), v29);
          +[PSUICellularPlanUniversalReference referenceFromCellularPlanPendingTransfer:](PSUICellularPlanUniversalReference, "referenceFromCellularPlanPendingTransfer:", v20);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setProperty:forKey:", v27, v18);

          objc_msgSend(v32, "addObject:", v26);
        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
      }
      while (v16);
    }
    v13 = obj;
    v12 = obj;
    goto LABEL_23;
  }
  if (!-[PSUIPlanPendingTransferListGroup _isChinaRegionCellularDevice](self, "_isChinaRegionCellularDevice"))
    goto LABEL_7;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2050000000;
  v3 = (void *)_MergedGlobals_67;
  v41 = _MergedGlobals_67;
  if (!_MergedGlobals_67)
  {
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __getCLLocationManagerClass_block_invoke_1;
    v37[3] = &unk_24D5018D0;
    v37[4] = &v38;
    __getCLLocationManagerClass_block_invoke_1((uint64_t)v37);
    v3 = (void *)v39[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v38, 8);
  if (objc_msgSend(v4, "locationServicesEnabled"))
  {
    self = v31;
    if (!-[PSUIPlanPendingTransferListGroup _isInChina](v31, "_isInChina"))
    {
LABEL_7:
      transferPlanSpecifier = self->_transferPlanSpecifier;
      if (!transferPlanSpecifier)
      {
        v6 = (void *)MEMORY[0x24BE75590];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("TRANSFER_PLAN"), &stru_24D5028C8, CFSTR("Cellular"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, v31, 0, 0, 0, 13, 0);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = v31->_transferPlanSpecifier;
        v31->_transferPlanSpecifier = (PSSpecifier *)v9;

        -[PSSpecifier setButtonAction:](v31->_transferPlanSpecifier, "setButtonAction:", sel_transferablePlanPressed_);
        transferPlanSpecifier = v31->_transferPlanSpecifier;
      }
      objc_msgSend(v32, "addObject:", transferPlanSpecifier);
      groupSpecifier = v31->_groupSpecifier;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("TRANSFER_PLAN_FOOTER"), &stru_24D5028C8, CFSTR("Cellular"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifier setProperty:forKey:](groupSpecifier, "setProperty:forKey:", v13, *MEMORY[0x24BE75A68]);
LABEL_23:

    }
  }
  return v32;
}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  _QWORD v3[4];
  id v4;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __58__PSUIPlanPendingTransferListGroup_simSetupFlowCompleted___block_invoke;
  v3[3] = &unk_24D5017E8;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __58__PSUIPlanPendingTransferListGroup_simSetupFlowCompleted___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained[1];
    WeakRetained[1] = 0;
    v4 = WeakRetained;

    v3 = objc_loadWeakRetained(v4 + 5);
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

    WeakRetained = v4;
  }

}

- (void)transferablePlanPressed:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  TSSIMSetupFlow *v9;
  TSSIMSetupFlow *flow;
  TSSIMSetupFlow *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id location;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
  -[PSUIPlanPendingTransferListGroup _showSpinner:](self, "_showSpinner:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  objc_msgSend(WeakRetained, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", 0);

  v17 = *MEMORY[0x24BE82B48];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE82B38], "flowWithOptions:", v8);
  v9 = (TSSIMSetupFlow *)objc_claimAutoreleasedReturnValue();
  flow = self->_flow;
  self->_flow = v9;

  -[TSSIMSetupFlow setDelegate:](self->_flow, "setDelegate:", self);
  location = 0;
  objc_initWeak(&location, self);
  v11 = self->_flow;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __60__PSUIPlanPendingTransferListGroup_transferablePlanPressed___block_invoke;
  v13[3] = &unk_24D502200;
  objc_copyWeak(&v15, &location);
  v13[4] = self;
  v12 = v4;
  v14 = v12;
  -[TSSIMSetupFlow firstViewController:](v11, "firstViewController:", v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __60__PSUIPlanPendingTransferListGroup_transferablePlanPressed___block_invoke(id *a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  id v6;
  int v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint8_t v13[16];

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained(WeakRetained + 5);
    v7 = objc_msgSend(v6, "isInModalPresentation");

    if (v7)
    {
      v8 = objc_loadWeakRetained(v5 + 5);
      objc_msgSend(v8, "navigationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pushViewController:animated:", v3, 1);
    }
    else
    {
      v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v3);
      objc_msgSend(v8, "setModalPresentationStyle:", 2);
      v9 = objc_loadWeakRetained(v5 + 5);
      objc_msgSend(v9, "presentViewController:animated:completion:", v8, 1, 0);
    }

    v11 = objc_loadWeakRetained(v5 + 5);
    objc_msgSend(v11, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setUserInteractionEnabled:", 1);

    objc_msgSend(a1[5], "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
    objc_msgSend(a1[4], "_showSpinner:", 0);
  }
  else
  {
    objc_msgSend(a1[4], "getLogger");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_2161C6000, v10, OS_LOG_TYPE_DEFAULT, "Invalid specifier", v13, 2u);
    }

  }
}

- (void)_showSpinner:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  UIActivityIndicatorView *v7;
  UIActivityIndicatorView *spinner;
  void *v9;
  void *v10;
  void *v11;
  id originAccessoryView;
  void *v13;
  void *v14;
  _QWORD block[5];

  v3 = a3;
  if (!self->_spinner)
  {
    v7 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    spinner = self->_spinner;
    self->_spinner = v7;

    -[PSUIPlanPendingTransferListGroup transferPlanSpecifier](self, "transferPlanSpecifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "propertyForKey:", *MEMORY[0x24BE75D18]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accessoryView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    originAccessoryView = self->_originAccessoryView;
    self->_originAccessoryView = v11;

    if (v3)
      goto LABEL_3;
LABEL_5:
    -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
    -[PSUIPlanPendingTransferListGroup transferPlanSpecifier](self, "transferPlanSpecifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "propertyForKey:", *MEMORY[0x24BE75D18]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAccessoryView:", self->_originAccessoryView);

    goto LABEL_6;
  }
  if (!a3)
    goto LABEL_5;
LABEL_3:
  -[PSUIPlanPendingTransferListGroup transferPlanSpecifier](self, "transferPlanSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessoryView:", self->_spinner);

  -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
LABEL_6:
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__PSUIPlanPendingTransferListGroup__showSpinner___block_invoke;
  block[3] = &unk_24D501660;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __49__PSUIPlanPendingTransferListGroup__showSpinner___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(*(id *)(a1 + 32), "transferPlanSpecifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "reloadSpecifier:", v2);

}

- (BOOL)_isChinaRegionCellularDevice
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "sf_isChinaRegionCellularDevice"))
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "sf_isiPad");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)_isInChina
{
  void *v2;
  char v3;

  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCarrierItemFlowSupported") ^ 1;

  return v3;
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("PendingXferListGroup"));
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

- (PSSpecifier)transferPlanSpecifier
{
  return self->_transferPlanSpecifier;
}

- (void)setTransferPlanSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_transferPlanSpecifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferPlanSpecifier, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong(&self->_originAccessoryView, 0);
  objc_storeStrong((id *)&self->_flow, 0);
}

@end
