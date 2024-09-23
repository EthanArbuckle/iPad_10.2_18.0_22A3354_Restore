@implementation PSUICellularPlanDetailController

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  PSUISubscriptionContextMenusGroup *subscriptionContextMenus;
  PSUISubscriptionContextMenusGroup *v9;
  PSUISubscriptionContextMenusProductionFactory *v10;
  PSUISubscriptionContextMenusProductionFactory *v11;
  PSUISubscriptionContextMenusGroup *v12;
  PSUISubscriptionContextMenusGroup *v13;
  void *v14;
  void *v15;
  int v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[PSUICellularPlanDetailController getLogger](self, "getLogger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315138;
      v18 = "-[PSUICellularPlanDetailController specifiers]";
      _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "%s (re)loading specifiers", (uint8_t *)&v17, 0xCu);
    }

    v6 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("SUBSCRIPTION_CONTEXT_MENUS_GROUP"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);
    subscriptionContextMenus = self->_subscriptionContextMenus;
    if (subscriptionContextMenus)
    {
      -[PSUISubscriptionContextMenusGroup setGroupSpecifier:](subscriptionContextMenus, "setGroupSpecifier:", v7);
    }
    else
    {
      v9 = [PSUISubscriptionContextMenusGroup alloc];
      v10 = [PSUISubscriptionContextMenusProductionFactory alloc];
      v11 = -[PSUISubscriptionContextMenusProductionFactory initWithHostController:parentSpecifier:groupSpecifier:popViewControllerOnPlanRemoval:](v10, "initWithHostController:parentSpecifier:groupSpecifier:popViewControllerOnPlanRemoval:", self, *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]), v7, 1);
      v12 = -[PSUISubscriptionContextMenusGroup initWithFactory:](v9, "initWithFactory:", v11);
      v13 = self->_subscriptionContextMenus;
      self->_subscriptionContextMenus = v12;

    }
    -[PSUISubscriptionContextMenusGroup specifiers](self->_subscriptionContextMenus, "specifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v14);

    objc_msgSend(MEMORY[0x24BE856B8], "logSpecifiers:origin:", v6, CFSTR("[PSUICellularPlanDetailController specifiers] end"));
    v15 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v6;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularPlanDetailController getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[PSUICellularPlanDetailController viewWillAppear:]";
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v6.receiver = self;
  v6.super_class = (Class)PSUICellularPlanDetailController;
  -[PSUICellularPlanDetailController viewWillAppear:](&v6, sel_viewWillAppear_, v3);
  -[PSUICellularPlanDetailController reloadSpecifiers](self, "reloadSpecifiers");
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("CellularPlanDetailController"));
}

- (PSUISubscriptionContextMenusGroup)subscriptionContextMenus
{
  return self->_subscriptionContextMenus;
}

- (void)setSubscriptionContextMenus:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionContextMenus, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionContextMenus, 0);
}

@end
