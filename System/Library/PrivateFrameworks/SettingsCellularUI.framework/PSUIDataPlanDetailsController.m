@implementation PSUIDataPlanDetailsController

- (PSUIDataPlanDetailsController)init
{
  PSUIDataPlanDetailsController *v2;
  PSUIDataPlanDetailsController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSUIDataPlanDetailsController;
  v2 = -[PSUIDataPlanDetailsController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PSUIDataPlanDetailsController setModalInPresentation:](v2, "setModalInPresentation:", 1);
  return v3;
}

- (PSUIDataPlanDetailsController)initWithParentSpecifier:(id)a3
{
  id v5;
  PSUIDataPlanDetailsController *v6;
  PSUIDataPlanDetailsController *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PSUIDataPlanDetailsController;
  v6 = -[PSUIDataPlanDetailsController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_parentSpecifier, a3);
    -[PSUIDataPlanDetailsController titleDescription](v7, "titleDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
      -[PSUIDataPlanDetailsController setTitle:](v7, "setTitle:", v8);

  }
  return v7;
}

- (void)dismiss
{
  -[PSUIDataPlanDetailsController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)specifiers
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  PSUICellularDataPlanDetailGroup *v7;
  PSUICellularDataPlanDetailGroup *cellularDataPlanDetailGroup;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  int v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[PSSpecifier userInfo](self->_parentSpecifier, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "isSelected"))
    {
      objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("CELLULAR_ACCOUNT_DETAILS_GROUP"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[PSUICellularDataPlanDetailGroup isFlowRunning](self->_cellularDataPlanDetailGroup, "isFlowRunning"))
      {
        v7 = -[PSUICellularDataPlanDetailGroup initWithListController:groupSpecifier:]([PSUICellularDataPlanDetailGroup alloc], "initWithListController:groupSpecifier:", self, v6);
        cellularDataPlanDetailGroup = self->_cellularDataPlanDetailGroup;
        self->_cellularDataPlanDetailGroup = v7;

      }
      -[PSUICellularDataPlanDetailGroup specifiers](self->_cellularDataPlanDetailGroup, "specifiers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "count"))
      {
        objc_msgSend(v3, "addObject:", v6);
        objc_msgSend(v3, "ps_addSpecifiers:toGroup:", v9, v6);
      }

    }
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("SUBSCRIPTION_CONTEXT_MENUS_GROUP"));
    v10 = objc_claimAutoreleasedReturnValue();
    -[PSUIDataPlanDetailsController createOrUpdateSubscriptionContextMenuGroup:](self, "createOrUpdateSubscriptionContextMenuGroup:", v10);
    -[PSUISubscriptionContextMenusGroup specifiers](self->_subscriptionContextMenus, "specifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      -[PSUIDataPlanDetailsController getLogger](self, "getLogger");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 136315138;
        v18 = "-[PSUIDataPlanDetailsController specifiers]";
        _os_log_impl(&dword_2161C6000, v12, OS_LOG_TYPE_DEFAULT, "%s showing subscription context menus group", (uint8_t *)&v17, 0xCu);
      }

      objc_msgSend(v3, "addObject:", v10);
      objc_msgSend(v3, "ps_addSpecifiers:toGroup:", v11, v10);
    }
    v13 = (int)*MEMORY[0x24BE756E0];
    v14 = *(Class *)((char *)&self->super.super.super.super.super.isa + v13);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v13) = (Class)v3;
    v15 = v3;

    v3 = *(id *)((char *)&self->super.super.super.super.super.isa + v13);
  }
  else
  {
    -[PSUIDataPlanDetailsController getLogger](self, "getLogger");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_2161C6000, v10, OS_LOG_TYPE_DEFAULT, "Plan item is not set!", (uint8_t *)&v17, 2u);
    }
  }

  return v3;
}

- (void)createOrUpdateSubscriptionContextMenuGroup:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  PSUISubscriptionContextMenusGroup *v13;
  PSUISubscriptionContextMenusProductionFactory *v14;
  PSUISubscriptionContextMenusGroup *v15;
  PSUISubscriptionContextMenusGroup *subscriptionContextMenus;
  id v17;

  v17 = a3;
  if (self->_subscriptionContextMenus)
  {
    v4 = (int)*MEMORY[0x24BE757A8];
    v5 = *MEMORY[0x24BE75CE8];
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v4), "propertyForKey:", *MEMORY[0x24BE75CE8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[PSUISubscriptionContextMenusGroup parentSpecifier](self->_subscriptionContextMenus, "parentSpecifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v4), "propertyForKey:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setProperty:forKey:", v8, v5);

    }
    v9 = *MEMORY[0x24BE75958];
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v4), "propertyForKey:", *MEMORY[0x24BE75958]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[PSUISubscriptionContextMenusGroup parentSpecifier](self->_subscriptionContextMenus, "parentSpecifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v4), "propertyForKey:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setProperty:forKey:", v12, v9);

    }
    -[PSUISubscriptionContextMenusGroup setGroupSpecifier:](self->_subscriptionContextMenus, "setGroupSpecifier:", v17);
  }
  else
  {
    v13 = [PSUISubscriptionContextMenusGroup alloc];
    v14 = -[PSUISubscriptionContextMenusProductionFactory initWithHostController:parentSpecifier:groupSpecifier:popViewControllerOnPlanRemoval:]([PSUISubscriptionContextMenusProductionFactory alloc], "initWithHostController:parentSpecifier:groupSpecifier:popViewControllerOnPlanRemoval:", self, self->_parentSpecifier, v17, 0);
    v15 = -[PSUISubscriptionContextMenusGroup initWithFactory:](v13, "initWithFactory:", v14);
    subscriptionContextMenus = self->_subscriptionContextMenus;
    self->_subscriptionContextMenus = v15;

  }
}

- (id)titleDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[PSSpecifier userInfo](self->_parentSpecifier, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isBackedByCellularPlan"))
  {
    objc_msgSend(v2, "plan");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "planDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "plan");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "carrierName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "length") && objc_msgSend(v6, "length") && (objc_msgSend(v4, "isEqualToString:", v6) & 1) == 0)
    {
      v9 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_CARRIER_AND_PLAN_NAME"), &stru_24D5028C8, CFSTR("Cellular"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", v11, v6, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (v4)
      {
        v7 = v4;
      }
      else if (v6)
      {
        v7 = v6;
      }
      else
      {
        objc_msgSend(v2, "name");
        v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      v8 = v7;
    }

  }
  else
  {
    objc_msgSend(v2, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("DataPlanDetailsController"));
}

- (PSUISubscriptionContextMenusGroup)subscriptionContextMenus
{
  return self->_subscriptionContextMenus;
}

- (void)setSubscriptionContextMenus:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionContextMenus, a3);
}

- (PSUICellularDataPlanDetailGroup)cellularDataPlanDetailGroup
{
  return self->_cellularDataPlanDetailGroup;
}

- (void)setCellularDataPlanDetailGroup:(id)a3
{
  objc_storeStrong((id *)&self->_cellularDataPlanDetailGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellularDataPlanDetailGroup, 0);
  objc_storeStrong((id *)&self->_subscriptionContextMenus, 0);
  objc_storeStrong((id *)&self->_parentSpecifier, 0);
}

@end
