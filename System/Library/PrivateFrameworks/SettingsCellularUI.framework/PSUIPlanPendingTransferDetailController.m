@implementation PSUIPlanPendingTransferDetailController

- (PSUIPlanPendingTransferDetailController)init
{
  PSUIPlanPendingTransferDetailController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSUIPlanPendingTransferDetailController;
  v2 = -[PSUIPlanPendingTransferDetailController init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_cellularPlanChanged, CFSTR("PSUICellularPlanChanged"), 0);

  }
  return v2;
}

- (void)cellularPlanChanged
{
  NSObject *v3;
  PSUIPlanPendingTransferMenusGroup *planPendingTransferMenus;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[PSUIPlanPendingTransferDetailController getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[PSUIPlanPendingTransferDetailController cellularPlanChanged]";
    v8 = 2112;
    v9 = CFSTR("PSUICellularPlanChanged");
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s received notification %@", buf, 0x16u);
  }

  planPendingTransferMenus = self->_planPendingTransferMenus;
  self->_planPendingTransferMenus = 0;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__PSUIPlanPendingTransferDetailController_cellularPlanChanged__block_invoke;
  block[3] = &unk_24D501660;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __62__PSUIPlanPendingTransferDetailController_cellularPlanChanged__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + (int)*MEMORY[0x24BE756E0]), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "getLogger");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "-[PSUIPlanPendingTransferDetailController cellularPlanChanged]_block_invoke";
      _os_log_impl(&dword_2161C6000, v2, OS_LOG_TYPE_DEFAULT, "%s No specifiers to show, returning to Settings > Cellular view", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v3, "popViewControllerAnimated:", 1);

  }
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  PSUIPlanPendingTransferMenusGroup *planPendingTransferMenus;
  PSUIPlanPendingTransferMenusGroup *v8;
  PSUIPlanPendingTransferMenusGroup *v9;
  PSUIPlanPendingTransferMenusGroup *v10;
  void *v11;
  void *v12;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[PSUIPlanPendingTransferDetailController getLogger](self, "getLogger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315138;
      v15 = "-[PSUIPlanPendingTransferDetailController specifiers]";
      _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "%s (re)loading specifiers", (uint8_t *)&v14, 0xCu);
    }

    v6 = (void *)objc_opt_new();
    planPendingTransferMenus = self->_planPendingTransferMenus;
    if (!planPendingTransferMenus)
    {
      v8 = [PSUIPlanPendingTransferMenusGroup alloc];
      v9 = -[PSUIPlanPendingTransferMenusGroup initWithHostController:parentSpecifier:](v8, "initWithHostController:parentSpecifier:", self, *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]));
      v10 = self->_planPendingTransferMenus;
      self->_planPendingTransferMenus = v9;

      planPendingTransferMenus = self->_planPendingTransferMenus;
    }
    -[PSUIPlanPendingTransferMenusGroup specifiers](planPendingTransferMenus, "specifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v11);

    objc_msgSend(MEMORY[0x24BE856B8], "logSpecifiers:origin:", v6, CFSTR("[PSUIPlanPendingTransferDetailController specifiers] end"));
    v12 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v6;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("PlanPendingTransferDetailController"));
}

- (PSUIPlanPendingTransferMenusGroup)planPendingTransferMenus
{
  return self->_planPendingTransferMenus;
}

- (void)setPlanPendingTransferMenus:(id)a3
{
  objc_storeStrong((id *)&self->_planPendingTransferMenus, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planPendingTransferMenus, 0);
}

@end
