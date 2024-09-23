@implementation PSUICellularDataPlanDetailGroup

+ (id)specifiersFromCellularPlanItem:(id)a3 target:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "plan");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(a1, "configurePlanSpecifiers:planItem:target:", v8, v6, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("CellularDataPlanDetailGroup"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315138;
      v13 = "+[PSUICellularDataPlanDetailGroup specifiersFromCellularPlanItem:target:]";
      _os_log_impl(&dword_2161C6000, v10, OS_LOG_TYPE_DEFAULT, "%s: Invalid selected cellular plan", (uint8_t *)&v12, 0xCu);
    }

  }
  return v8;
}

+ (id)accountManageButtonForPlanItem:(id)a3 target:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "plan");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "status");

  if (v8 == 1)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("CELLULAR_ACCOUNT_OPTIONS_RENEW...");
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CELLULAR_ACCOUNT_OPTIONS_RENEW..."), &stru_24D5028C8, CFSTR("Cellular"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "plan");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "carrierName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "length"))
    {
      v13 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("CELLULAR_ACCOUNT_OPTIONS_MANAGE_CARRIER_%@_ACCOUNT..."), &stru_24D5028C8, CFSTR("Cellular"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", v15, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("CELLULAR_ACCOUNT_OPTIONS_MANAGE_ACCOUNT..."), &stru_24D5028C8, CFSTR("Cellular"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v10 = 0;
  }

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, v6, 0, 0, 0, 13, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setIdentifier:", v10);
  objc_msgSend(v16, "setButtonAction:", sel_managePlanPressed_);
  if ((objc_msgSend(v5, "isSelectable") & 1) == 0)
  {
    objc_msgSend(v16, "setCellType:", 4);
    objc_msgSend(v16, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
  }

  return v16;
}

+ (void)configurePlanSpecifiers:(id)a3 planItem:(id)a4 target:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  char v45;
  id v46;

  v46 = a3;
  v8 = a4;
  v9 = a5;
  if (v46)
  {
    objc_msgSend(v8, "plan");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v8, "plan");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "status");

      if (v12)
      {
        v13 = 0;
      }
      else
      {
        objc_msgSend(v8, "plan");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "billingStartDate");
        v16 = v15;

        if (v16 <= 0.0)
        {
          v13 = 0;
        }
        else
        {
          v17 = (void *)MEMORY[0x24BE75590];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_PURCHASE_TITLE"), &stru_24D5028C8, CFSTR("Cellular"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v19, v9, 0, sel_getPlanPurchaseDate_, 0, 4, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "setIdentifier:", CFSTR("CELLULAR_PLAN_PURCHASE_DATE"));
          objc_msgSend(v46, "addObject:", v13);
        }
        objc_msgSend(v8, "plan");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "billingEndDate");
        v22 = v21;

        if (v22 > 0.0)
        {
          v23 = (void *)MEMORY[0x24BE75590];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_EXPIRE_TITLE"), &stru_24D5028C8, CFSTR("Cellular"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v25, v9, 0, sel_getPlanExpireDate_, 0, 4, 0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v26, "setIdentifier:", CFSTR("CELLULAR_PLAN_EXPIRE"));
          objc_msgSend(v46, "addObject:", v26);
          v13 = v26;
        }
        objc_msgSend(v8, "plan");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "timestamp");
        v29 = v28;

        if (v29 > 0.0)
        {
          v30 = (void *)MEMORY[0x24BE75590];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_STATUS_DATE_TITLE"), &stru_24D5028C8, CFSTR("Cellular"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v32, v9, 0, sel_getPlanStatusDate_, 0, 4, 0);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v33, "setIdentifier:", CFSTR("CELLULAR_PLAN_STATUS_DATE"));
          objc_msgSend(v46, "addObject:", v33);
          v13 = v33;
        }
      }
      objc_msgSend(v8, "plan");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "phoneNumber");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v35, "length"))
      {
        v36 = (void *)MEMORY[0x24BE75590];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_CELL_NUMBER_TITLE"), &stru_24D5028C8, CFSTR("Cellular"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v38, v9, 0, sel_getPlanCellDataNumber_, 0, 4, 0);
        v39 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v46, "addObject:", v39);
        v13 = (void *)v39;
      }
      objc_msgSend(v8, "plan");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "accountURL");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (v41)
      {

      }
      else
      {
        if (!v8)
          goto LABEL_17;
        objc_msgSend(v8, "plan");
        v42 = objc_claimAutoreleasedReturnValue();
        if (!v42)
          goto LABEL_17;
        v43 = (void *)v42;
        objc_msgSend(v8, "plan");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "isDeleteNotAllowed");

        if ((v45 & 1) != 0)
          goto LABEL_18;
      }
      objc_msgSend(a1, "accountManageButtonForPlanItem:target:", v8, v9);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "addObject:", v40);
LABEL_17:

LABEL_18:
    }
  }

}

- (PSUICellularDataPlanDetailGroup)initWithListController:(id)a3 groupSpecifier:(id)a4
{
  id v6;
  id v7;
  PSUICellularDataPlanDetailGroup *v8;
  PSUICellularDataPlanDetailGroup *v9;
  TSSIMSetupFlow *flow;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PSUICellularDataPlanDetailGroup;
  v8 = -[PSUICellularDataPlanDetailGroup init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_listController, v6);
    objc_storeWeak((id *)&v9->_groupSpecifier, v7);
    flow = v9->_flow;
    v9->_flow = 0;

  }
  return v9;
}

- (id)specifiers
{
  void *v3;
  void *v4;
  void *v5;

  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedPlanItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "specifiersFromCellularPlanItem:target:", v4, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)lastUpdatedText
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedPlanItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "plan");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  v6 = v5;

  if (v6 == 0.0)
  {
    v15 = 0;
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD1500];
    v8 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v3, "plan");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timestamp");
    objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringFromDate:dateStyle:timeStyle:", v10, 2, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_LAST_UPDATED"), &stru_24D5028C8, CFSTR("Cellular"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", v14, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

- (BOOL)isFlowRunning
{
  return self->_flow != 0;
}

- (id)localizedManageAccountAlertTitle:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  objc_msgSend(v3, "plan");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "status");

  if (v5 == 1)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CELLULAR_ACCOUNT_OPTIONS_RENEW"), &stru_24D5028C8, CFSTR("Cellular"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "plan");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "carrierName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "length"))
    {
      v9 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CELLULAR_ACCOUNT_OPTIONS_MANAGE_CARRIER_%@_ACCOUNT"), &stru_24D5028C8, CFSTR("Cellular"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", v11, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CELLULAR_ACCOUNT_OPTIONS_MANAGE_ACCOUNT"), &stru_24D5028C8, CFSTR("Cellular"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v7;
}

- (id)removeCellularPlanConfirmationMessage:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "plan");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carrierName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("REMOVE_CARRIER_%@_PLAN_CONFIRMATION"), &stru_24D5028C8, CFSTR("Cellular"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("REMOVE_PLAN_CONFIRMATION"), &stru_24D5028C8, CFSTR("Cellular"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)removeCellularPlanConfirmationTitle:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "plan");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carrierName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("REMOVE_CARRIER_%@_PLAN"), &stru_24D5028C8, CFSTR("Cellular"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("REMOVE_PLAN"), &stru_24D5028C8, CFSTR("Cellular"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)managePlanPressed:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id WeakRetained;
  _QWORD v24[5];
  _QWORD v25[5];
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedPlanItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSUICellularDataPlanDetailGroup getLogger](self, "getLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[PSUICellularDataPlanDetailGroup managePlanPressed:]";
    v29 = 2112;
    v30 = v5;
    _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
  }

  v7 = (void *)MEMORY[0x24BEBD3B0];
  -[PSUICellularDataPlanDetailGroup localizedManageAccountAlertTitle:](self, "localizedManageAccountAlertTitle:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("MANAGE_ACCOUNT_DESCRIPTION"), &stru_24D5028C8, CFSTR("Cellular"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", v8, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "plan");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accountURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = MEMORY[0x24BDAC760];
  if (v13)
  {
    v15 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("ACCOUNT_SETTINGS"), &stru_24D5028C8, CFSTR("Cellular"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v14;
    v25[1] = 3221225472;
    v25[2] = __53__PSUICellularDataPlanDetailGroup_managePlanPressed___block_invoke;
    v25[3] = &unk_24D501B58;
    v25[4] = self;
    v26 = v5;
    objc_msgSend(v15, "actionWithTitle:style:handler:", v17, 0, v25);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "addAction:", v18);
  }
  v19 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24D5028C8, CFSTR("Cellular"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v14;
  v24[1] = 3221225472;
  v24[2] = __53__PSUICellularDataPlanDetailGroup_managePlanPressed___block_invoke_2;
  v24[3] = &unk_24D5017B8;
  v24[4] = self;
  objc_msgSend(v19, "actionWithTitle:style:handler:", v21, 1, v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addAction:", v22);
  WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v11, 1, 0);

}

void __53__PSUICellularDataPlanDetailGroup_managePlanPressed___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "ctPlan");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleAccountSettingsTapped:", v2);

}

void __53__PSUICellularDataPlanDetailGroup_managePlanPressed___block_invoke_2(uint64_t a1)
{
  NSObject *v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v2 = 136315138;
    v3 = "-[PSUICellularDataPlanDetailGroup managePlanPressed:]_block_invoke_2";
    _os_log_impl(&dword_2161C6000, v1, OS_LOG_TYPE_DEFAULT, "%s cancel manage account", (uint8_t *)&v2, 0xCu);
  }

}

- (id)getPlanDetailedStatus:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedPlanItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  PSUIFormatPlanStatusForPlan(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)getPlanStatus:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedPlanItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isBackedByCellularPlan"))
  {
    objc_msgSend(v4, "plan");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PSUIGetPlanSubscriptionStatus(objc_msgSend(v5, "status"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)getPlanStatusDataOnly:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedPlanItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "plan");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataUsage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    v11 = 0.0;
    v12 = 0.0;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v14, "dataCapacity");
        v11 = v11 + v15;
        objc_msgSend(v14, "dataUsed");
        v12 = v12 + v16;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v9);
  }
  else
  {
    v11 = 0.0;
    v12 = 0.0;
  }

  v17 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_DATA_USAGE_SHORT"), &stru_24D5028C8, CFSTR("Cellular"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE856B8], "usageSizeString:", v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE856B8], "usageSizeString:", v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", v19, v20, v21, (_QWORD)v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)getPlanStatusDate:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedPlanItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isBackedByCellularPlan"))
  {
    v5 = (void *)MEMORY[0x24BDD1500];
    v6 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v4, "plan");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timestamp");
    objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringFromDate:dateStyle:timeStyle:", v8, 2, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)getPlanPurchaseDate:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedPlanItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isBackedByCellularPlan"))
  {
    v5 = (void *)MEMORY[0x24BDD1500];
    v6 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v4, "plan");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "billingStartDate");
    objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringFromDate:dateStyle:timeStyle:", v8, 2, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)getPlanExpireDate:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedPlanItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isBackedByCellularPlan"))
  {
    v5 = (void *)MEMORY[0x24BDD1500];
    v6 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v4, "plan");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "billingEndDate");
    objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringFromDate:dateStyle:timeStyle:", v8, 2, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)getPlanCellDataNumber:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedPlanItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "plan");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "phoneNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    objc_msgSend(v4, "plan");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "phoneNumber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)handleAccountSettingsTapped:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  TSSIMSetupFlow *v9;
  TSSIMSetupFlow *flow;
  _QWORD block[5];
  _QWORD v12[2];
  _QWORD v13[2];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PSUICellularDataPlanDetailGroup getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[PSUICellularDataPlanDetailGroup handleAccountSettingsTapped:]";
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "%s account settings: %@", buf, 0x16u);
  }

  v12[0] = *MEMORY[0x24BE82B48];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = *MEMORY[0x24BE82B60];
  v13[0] = v6;
  v13[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSUICellularDataPlanDetailGroup getLogger](self, "getLogger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[PSUICellularDataPlanDetailGroup handleAccountSettingsTapped:]";
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "%s - launching flow with options: %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BE82B38], "flowWithOptions:", v7);
  v9 = (TSSIMSetupFlow *)objc_claimAutoreleasedReturnValue();
  flow = self->_flow;
  self->_flow = v9;

  -[TSSIMSetupFlow setDelegate:](self->_flow, "setDelegate:", self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__PSUICellularDataPlanDetailGroup_handleAccountSettingsTapped___block_invoke;
  block[3] = &unk_24D501660;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __63__PSUICellularDataPlanDetailGroup_handleAccountSettingsTapped___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;
  void *v5;
  id WeakRetained;
  id v7;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sf_isiPad");

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BEBD7A0]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "firstViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v4, "initWithRootViewController:", v5);

    objc_msgSend(v7, "setModalPresentationStyle:", 2);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "firstViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v7, 1, 0);

}

- (void)handleRemovePlanTapped:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id WeakRetained;
  _QWORD v21[5];
  _QWORD v22[5];
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PSUICellularDataPlanDetailGroup getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "-[PSUICellularDataPlanDetailGroup handleRemovePlanTapped:]";
    v26 = 2112;
    v27 = v4;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "%s remove plan: %@", buf, 0x16u);
  }

  v6 = (void *)MEMORY[0x24BEBD3B0];
  -[PSUICellularDataPlanDetailGroup removeCellularPlanConfirmationTitle:](self, "removeCellularPlanConfirmationTitle:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUICellularDataPlanDetailGroup removeCellularPlanConfirmationMessage:](self, "removeCellularPlanConfirmationMessage:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("REMOVE"), &stru_24D5028C8, CFSTR("Cellular"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __58__PSUICellularDataPlanDetailGroup_handleRemovePlanTapped___block_invoke;
  v22[3] = &unk_24D501B58;
  v22[4] = self;
  v23 = v4;
  v14 = v4;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 2, v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addAction:", v15);
  v16 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24D5028C8, CFSTR("Cellular"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v13;
  v21[1] = 3221225472;
  v21[2] = __58__PSUICellularDataPlanDetailGroup_handleRemovePlanTapped___block_invoke_81;
  v21[3] = &unk_24D5017B8;
  v21[4] = self;
  objc_msgSend(v16, "actionWithTitle:style:handler:", v18, 1, v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addAction:", v19);
  WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v9, 1, 0);

}

void __58__PSUICellularDataPlanDetailGroup_handleRemovePlanTapped___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 136315394;
    v8 = "-[PSUICellularDataPlanDetailGroup handleRemovePlanTapped:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_2161C6000, v2, OS_LOG_TYPE_DEFAULT, "%s confirmed remove plan: %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__PSUICellularDataPlanDetailGroup_handleRemovePlanTapped___block_invoke_79;
  v6[3] = &unk_24D5025C8;
  v5 = *(_QWORD *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "didDeletePlanItem:completion:", v5, v6);

}

void __58__PSUICellularDataPlanDetailGroup_handleRemovePlanTapped___block_invoke_79(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "getLogger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "Failed to delete plan item: %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

void __58__PSUICellularDataPlanDetailGroup_handleRemovePlanTapped___block_invoke_81(uint64_t a1)
{
  NSObject *v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v2 = 136315138;
    v3 = "-[PSUICellularDataPlanDetailGroup handleRemovePlanTapped:]_block_invoke";
    _os_log_impl(&dword_2161C6000, v1, OS_LOG_TYPE_DEFAULT, "%s cancel remove plan", (uint8_t *)&v2, 0xCu);
  }

}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  _QWORD block[5];
  id v5;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__PSUICellularDataPlanDetailGroup_simSetupFlowCompleted___block_invoke;
  block[3] = &unk_24D501A20;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __57__PSUICellularDataPlanDetailGroup_simSetupFlowCompleted___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)WeakRetained[1];
  WeakRetained[1] = 0;

  v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(v3, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("CellularDataPlanDetailGroup"));
}

- (PSListController)listController
{
  return (PSListController *)objc_loadWeakRetained((id *)&self->_listController);
}

- (void)setListController:(id)a3
{
  objc_storeWeak((id *)&self->_listController, a3);
}

- (PSSpecifier)groupSpecifier
{
  return (PSSpecifier *)objc_loadWeakRetained((id *)&self->_groupSpecifier);
}

- (void)setGroupSpecifier:(id)a3
{
  objc_storeWeak((id *)&self->_groupSpecifier, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_groupSpecifier);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_flow, 0);
}

@end
