@implementation PSUIPlanPendingTransferMenusGroup

- (PSUIPlanPendingTransferMenusGroup)initWithHostController:(id)a3 parentSpecifier:(id)a4
{
  id v6;
  id v7;
  PSUIPlanPendingTransferMenusGroup *v8;
  PSUIPlanPendingTransferMenusGroup *v9;
  uint64_t v10;
  CTCellularPlanManager *cellularPlanManager;
  uint64_t v12;
  PSUICellularPlanManagerCache *planManagerCache;
  void *v14;
  uint64_t v15;
  CTCellularPlanPendingTransfer *planPendingTransfer;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PSUIPlanPendingTransferMenusGroup;
  v8 = -[PSUIPlanPendingTransferMenusGroup init](&v18, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_parentSpecifier, a4);
    objc_storeWeak((id *)&v9->_listController, v6);
    objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
    v10 = objc_claimAutoreleasedReturnValue();
    cellularPlanManager = v9->_cellularPlanManager;
    v9->_cellularPlanManager = (CTCellularPlanManager *)v10;

    +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
    v12 = objc_claimAutoreleasedReturnValue();
    planManagerCache = v9->_planManagerCache;
    v9->_planManagerCache = (PSUICellularPlanManagerCache *)v12;

    -[PSSpecifier propertyForKey:](v9->_parentSpecifier, "propertyForKey:", *MEMORY[0x24BE75958]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICellularPlanManagerCache planPendingTransferFromReference:](v9->_planManagerCache, "planPendingTransferFromReference:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    planPendingTransfer = v9->_planPendingTransfer;
    v9->_planPendingTransfer = (CTCellularPlanPendingTransfer *)v15;

  }
  return v9;
}

- (id)specifiers
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
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
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  uint8_t buf[4];
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  if (self->_planPendingTransfer)
  {
    -[PSUIPlanPendingTransferMenusGroup addSpecifierForHeaderString:](self, "addSpecifierForHeaderString:", v3);
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);
    -[PSUIPlanPendingTransferMenusGroup activatePlanSpecifier](self, "activatePlanSpecifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      -[CTCellularPlanPendingTransfer deviceName](self->_planPendingTransfer, "deviceName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "length");

      if (!v9)
      {
LABEL_9:
        objc_msgSend(v3, "addObject:", v4);
        if (-[CTCellularPlanPendingTransfer status](self->_planPendingTransfer, "status") != 2)
        {
          -[PSUIPlanPendingTransferMenusGroup getLogger](self, "getLogger");
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            v35 = "-[PSUIPlanPendingTransferMenusGroup specifiers]";
            _os_log_debug_impl(&dword_2161C6000, v27, OS_LOG_TYPE_DEBUG, "%s removing pending cellular plan", buf, 0xCu);
          }

          v28 = (void *)MEMORY[0x24BE75590];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("REMOVE_PENDING_CELLULAR_PLAN"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v30, self, 0, 0, 0, 13, 0);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v31, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
          objc_msgSend(v31, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
          objc_msgSend(v31, "setButtonAction:", sel_removePlanPendingTransfer_);
          objc_msgSend(v3, "addObject:", v31);

        }
        goto LABEL_14;
      }
      v33 = v5;
      objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("CARRIER_NAME"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTCellularPlanPendingTransfer carrierName](self->_planPendingTransfer, "carrierName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setName:", v11);

      objc_msgSend(v3, "addObject:", v10);
      v12 = (void *)MEMORY[0x24BE75590];
      v13 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("USED_ON_%@"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTCellularPlanPendingTransfer deviceName](self->_planPendingTransfer, "deviceName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v17, self, 0, 0, 0, 4, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "addObject:", v18);
    }
    else
    {
      v33 = v5;
      objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("CARRIER_NAME"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTCellularPlanPendingTransfer carrierName](self->_planPendingTransfer, "carrierName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setName:", v19);

      objc_msgSend(v3, "addObject:", v10);
      v20 = (void *)MEMORY[0x24BE75590];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_LABEL"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v22, self, 0, sel_planPendingTransferLabel_, 0, 4, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "addObject:", v18);
      v23 = (void *)MEMORY[0x24BE75590];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("MY_NUMBER"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v25, self, 0, sel_planPendingTransferNumber_, 0, 4, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "addObject:", v26);
    }

    v5 = v33;
    goto LABEL_9;
  }
  -[PSUIPlanPendingTransferMenusGroup getLogger](self, "getLogger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v35 = "-[PSUIPlanPendingTransferMenusGroup specifiers]";
    _os_log_impl(&dword_2161C6000, v4, OS_LOG_TYPE_DEFAULT, "%s No specifiers to show, because there is no pending plan with the given plan reference", buf, 0xCu);
  }
LABEL_14:

  return v3;
}

- (PSUIPlanPendingTransferMenusGroup)initWithListController:(id)a3 groupSpecifier:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_exception_throw((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE88]), "initWithName:reason:userInfo:", CFSTR("Unsupported initializer called"), CFSTR("Unsupported initializer called"), 0));
}

- (void)removePlanPendingTransfer:(id)a3
{
  NSObject *v4;
  CTCellularPlanManager *cellularPlanManager;
  CTCellularPlanPendingTransfer *planPendingTransfer;
  _QWORD v7[5];
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[PSUIPlanPendingTransferMenusGroup getLogger](self, "getLogger", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[PSUIPlanPendingTransferMenusGroup removePlanPendingTransfer:]";
    _os_log_impl(&dword_2161C6000, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  cellularPlanManager = self->_cellularPlanManager;
  planPendingTransfer = self->_planPendingTransfer;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__PSUIPlanPendingTransferMenusGroup_removePlanPendingTransfer___block_invoke;
  v7[3] = &unk_24D501738;
  v7[4] = self;
  -[CTCellularPlanManager deletePlanPendingTransfer:completion:](cellularPlanManager, "deletePlanPendingTransfer:completion:", planPendingTransfer, v7);
}

void __63__PSUIPlanPendingTransferMenusGroup_removePlanPendingTransfer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "getLogger");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      *(_DWORD *)buf = 138412546;
      v8 = v5;
      v9 = 2112;
      v10 = v3;
      _os_log_error_impl(&dword_2161C6000, v4, OS_LOG_TYPE_ERROR, "Failed to remove the plan pending transfer item: %@ with error: %@", buf, 0x16u);
    }

  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__PSUIPlanPendingTransferMenusGroup_removePlanPendingTransfer___block_invoke_2;
    block[3] = &unk_24D501660;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

void __63__PSUIPlanPendingTransferMenusGroup_removePlanPendingTransfer___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "listController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "popViewControllerAnimated:", 1);

}

- (id)planPendingTransferLabel:(id)a3
{
  void *v3;
  void *v4;

  -[CTCellularPlanPendingTransfer planLabel](self->_planPendingTransfer, "planLabel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)planPendingTransferNumber:(id)a3
{
  void *v3;
  void *v4;

  -[CTCellularPlanPendingTransfer phoneNumber](self->_planPendingTransfer, "phoneNumber", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SettingsCellularUtils formattedPhoneNumber:](SettingsCellularUtils, "formattedPhoneNumber:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)planActivationInfo
{
  id *p_isa;
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;

  p_isa = (id *)&self->super.isa;
  v3 = -[CTCellularPlanPendingTransfer status](self->_planPendingTransfer, "status");
  if (v3 - 2 < 2)
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("PLAN_PENDING_TRANSFER_CONSENT_%@"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa[2], "deviceName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v10, v11);
    p_isa = (id *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v3 > 1)
      return p_isa;
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v8 = CFSTR("PLAN_PENDING_TRANSFER_ACTIVATION_PAD");
    else
      v8 = CFSTR("PLAN_PENDING_TRANSFER_ACTIVATION");
    objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_24D5028C8, CFSTR("Gemini-Gemini"));
    p_isa = (id *)objc_claimAutoreleasedReturnValue();
  }

  return p_isa;
}

- (id)activatePlanSpecifier
{
  void *v2;
  unint64_t v4;
  PSUIPlanPendingTransferActivationButtonSpecifier *v5;
  id WeakRetained;
  PSUIPlanPendingTransferActivationButtonSpecifier *v7;

  v4 = -[CTCellularPlanPendingTransfer status](self->_planPendingTransfer, "status");
  if (v4 >= 3)
  {
    if (v4 == 3)
    {
      -[PSUIPlanPendingTransferMenusGroup cancelConsentRequestSpecifier](self, "cancelConsentRequestSpecifier");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    return v2;
  }
  else
  {
    v5 = [PSUIPlanPendingTransferActivationButtonSpecifier alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    v7 = -[PSUIPlanPendingTransferActivationButtonSpecifier initWithListController:planPendingTransfer:](v5, "initWithListController:planPendingTransfer:", WeakRetained, self->_planPendingTransfer);

    return v7;
  }
}

- (id)cancelConsentRequestSpecifier
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t buf[16];

  -[PSUIPlanPendingTransferMenusGroup getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "Consent request has been sent for plan pending transfer", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("REQUEST_SENT"), self, 0, 0, 0, 4, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSUICellularPlanUniversalReference referenceFromCellularPlanPendingTransfer:](PSUICellularPlanUniversalReference, "referenceFromCellularPlanPendingTransfer:", self->_planPendingTransfer);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v5, *MEMORY[0x24BE75958]);

  objc_msgSend(v4, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  return v4;
}

- (void)addSpecifierForHeaderString:(id)a3
{
  void *v4;
  PSSpecifier **p_groupSpecifier;
  void *v6;
  id WeakRetained;
  id v8;
  id v9;
  id v10;

  v10 = a3;
  if (-[CTCellularPlanPendingTransfer status](self->_planPendingTransfer, "status") != 2)
  {
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("PLAN_PENDING_TRANSFER_MENUS"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    p_groupSpecifier = &self->_groupSpecifier;
    objc_storeWeak((id *)&self->_groupSpecifier, v4);

    -[PSUIPlanPendingTransferMenusGroup planActivationInfo](self, "planActivationInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)p_groupSpecifier);
    objc_msgSend(WeakRetained, "setProperty:forKey:", v6, *MEMORY[0x24BE75A68]);

    v8 = objc_loadWeakRetained((id *)p_groupSpecifier);
    objc_msgSend(v8, "setProperty:forKey:", &unk_24D51C2F0, *MEMORY[0x24BE75A28]);

    v9 = objc_loadWeakRetained((id *)p_groupSpecifier);
    objc_msgSend(v10, "addObject:", v9);

  }
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("PlanPendingTransferMenusGroup"));
}

- (PSSpecifier)parentSpecifier
{
  return self->_parentSpecifier;
}

- (void)setParentSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_parentSpecifier, a3);
}

- (CTCellularPlanPendingTransfer)planPendingTransfer
{
  return self->_planPendingTransfer;
}

- (void)setPlanPendingTransfer:(id)a3
{
  objc_storeStrong((id *)&self->_planPendingTransfer, a3);
}

- (PSSpecifier)groupSpecifier
{
  return (PSSpecifier *)objc_loadWeakRetained((id *)&self->_groupSpecifier);
}

- (void)setGroupSpecifier:(id)a3
{
  objc_storeWeak((id *)&self->_groupSpecifier, a3);
}

- (PSListController)listController
{
  return (PSListController *)objc_loadWeakRetained((id *)&self->_listController);
}

- (void)setListController:(id)a3
{
  objc_storeWeak((id *)&self->_listController, a3);
}

- (CTCellularPlanManager)cellularPlanManager
{
  return self->_cellularPlanManager;
}

- (void)setCellularPlanManager:(id)a3
{
  objc_storeStrong((id *)&self->_cellularPlanManager, a3);
}

- (PSUICellularPlanManagerCache)planManagerCache
{
  return self->_planManagerCache;
}

- (void)setPlanManagerCache:(id)a3
{
  objc_storeStrong((id *)&self->_planManagerCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planManagerCache, 0);
  objc_storeStrong((id *)&self->_cellularPlanManager, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_destroyWeak((id *)&self->_groupSpecifier);
  objc_storeStrong((id *)&self->_planPendingTransfer, 0);
  objc_storeStrong((id *)&self->_parentSpecifier, 0);
}

@end
