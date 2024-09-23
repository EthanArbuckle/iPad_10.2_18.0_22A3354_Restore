@implementation PSUICellularUsageSchedulingGroup

- (PSUICellularUsageSchedulingGroup)initWithListController:(id)a3 groupSpecifierTitle:(id)a4
{
  id v6;
  id v7;
  PSUICellularUsageSchedulingGroup *v8;
  PSUICellularUsageSchedulingGroup *v9;
  CTUIListWithHeaderLoadingGroup *v10;
  CTUIListWithHeaderLoadingGroup *loadingGroup;
  PSUIAppDataUsageSpecifierFactory *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  PSUIAppDataUsageSpecifierFactory *appDataUsageSpecifierFactory;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PSUICellularUsageSchedulingGroup;
  v8 = -[PSUICellularUsageSchedulingGroup init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_hostController, v6);
    v10 = -[CTUIListWithHeaderLoadingGroup initWithHostController:]([CTUIListWithHeaderLoadingGroup alloc], "initWithHostController:", v6);
    loadingGroup = v9->_loadingGroup;
    v9->_loadingGroup = v10;

    v12 = [PSUIAppDataUsageSpecifierFactory alloc];
    objc_msgSend(MEMORY[0x24BE85688], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE85698], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSUICarrierSpaceManager sharedManager](PSUICarrierSpaceManager, "sharedManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PSUIAppDataUsageSpecifierFactory initWithGroupSpecifierTitle:managementCache:statisticsCache:carrierSpaceManager:billingCycleDelegate:policySpecifierDelegate:](v12, "initWithGroupSpecifierTitle:managementCache:statisticsCache:carrierSpaceManager:billingCycleDelegate:policySpecifierDelegate:", v7, v13, v14, v15, v9, v9);
    appDataUsageSpecifierFactory = v9->_appDataUsageSpecifierFactory;
    v9->_appDataUsageSpecifierFactory = (PSUIAppDataUsageSpecifierFactory *)v16;

  }
  return v9;
}

- (id)specifiers
{
  void *v2;
  void *v3;

  -[PSUICellularUsageSchedulingGroup loadingGroup](self, "loadingGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "specifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)prefetchPoliciesFor:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BE85678];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchUsagePoliciesFor:", v4);

}

- (void)didFailToSetPolicyForSpecifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PSUICellularUsageSchedulingGroup hostController](self, "hostController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadSpecifier:", v4);

}

- (void)selectedBillingPeriodChanged:(unint64_t)a3
{
  NSObject *v4;
  uint8_t v5[16];

  -[PSUICellularUsageSchedulingGroup getLogger](self, "getLogger", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2161C6000, v4, OS_LOG_TYPE_DEFAULT, "Sorting cellular usage group due to billing period selector change", v5, 2u);
  }

  -[PSUICellularUsageSchedulingGroup sortGroup](self, "sortGroup");
}

- (void)calculateUsageWithForcedRefresh:(BOOL)a3
{
  PSUICellularUsageSchedulingGroup *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[8];

  if (a3)
    goto LABEL_7;
  v4 = self;
  objc_sync_enter(v4);
  if (!-[PSUICellularUsageSchedulingGroup refreshInProgress](v4, "refreshInProgress"))
  {
    -[PSUICellularUsageSchedulingGroup setRefreshInProgress:](v4, "setRefreshInProgress:", 1);
    objc_sync_exit(v4);

LABEL_7:
    -[PSUICellularUsageSchedulingGroup loadingGroup](self, "loadingGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICellularUsageSchedulingGroup appDataUsageSpecifierFactory](self, "appDataUsageSpecifierFactory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "headerSpecifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHeaderSpecifiers:", v8);

    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    objc_msgSend(MEMORY[0x24BE85698], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __68__PSUICellularUsageSchedulingGroup_calculateUsageWithForcedRefresh___block_invoke;
    v10[3] = &unk_24D5016B0;
    v10[4] = self;
    objc_copyWeak(&v11, (id *)buf);
    objc_msgSend(v9, "fetchDeviceDataUsageWithCompletion:", v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
    return;
  }
  -[PSUICellularUsageSchedulingGroup getLogger](v4, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "Refresh already in progress", buf, 2u);
  }

  objc_sync_exit(v4);
}

void __68__PSUICellularUsageSchedulingGroup_calculateUsageWithForcedRefresh___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    v8 = v3;
    _os_log_impl(&dword_2161C6000, v2, OS_LOG_TYPE_DEFAULT, "Device data usage fetch complete: %p", buf, 0xCu);
  }

  dispatch_get_global_queue(25, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __68__PSUICellularUsageSchedulingGroup_calculateUsageWithForcedRefresh___block_invoke_6;
  v5[3] = &unk_24D501A20;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  v5[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v4, v5);

  objc_destroyWeak(&v6);
}

void __68__PSUICellularUsageSchedulingGroup_calculateUsageWithForcedRefresh___block_invoke_6(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[6];
  id v11;
  uint8_t v12[16];
  uint8_t buf[8];
  uint8_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "getLogger");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2161C6000, v4, OS_LOG_TYPE_DEFAULT, "Creating specifiers", buf, 2u);
    }

    *(_QWORD *)buf = 0;
    v14 = buf;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__3;
    v17 = __Block_byref_object_dispose__3;
    v18 = 0;
    objc_msgSend(WeakRetained, "appDataUsageSpecifierFactory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentSpecifiers");
    v18 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "setRefreshInProgress:", 0);
    objc_msgSend(*(id *)(a1 + 32), "getLogger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "Prefetching policies", v12, 2u);
    }

    objc_msgSend(WeakRetained, "appDataUsageSpecifierFactory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "prefetchPoliciesFor:", v8);

    objc_msgSend(*(id *)(a1 + 32), "getLogger");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_2161C6000, v9, OS_LOG_TYPE_DEFAULT, "Dispatching cellular usage specifiers update to main thread", v12, 2u);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __68__PSUICellularUsageSchedulingGroup_calculateUsageWithForcedRefresh___block_invoke_7;
    block[3] = &unk_24D5023F0;
    objc_copyWeak(&v11, v2);
    block[4] = *(_QWORD *)(a1 + 32);
    block[5] = buf;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v11);
    _Block_object_dispose(buf, 8);

  }
}

void __68__PSUICellularUsageSchedulingGroup_calculateUsageWithForcedRefresh___block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "getLogger");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "Updating cellular usage specifiers on main thread", v6, 2u);
    }

    objc_msgSend(WeakRetained, "loadingGroup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setContentSpecifiers:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

    objc_msgSend(WeakRetained, "hostController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadSpecifiers");

  }
}

- (void)setGroupSpecifierTitle:(id)a3
{
  -[PSUIAppDataUsageSpecifierFactory setGroupSpecifierTitle:](self->_appDataUsageSpecifierFactory, "setGroupSpecifierTitle:", a3);
}

- (void)sortGroup
{
  PSUICellularUsageSchedulingGroup *v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  uint8_t buf[8];

  v2 = self;
  objc_sync_enter(v2);
  if (-[PSUICellularUsageSchedulingGroup refreshInProgress](v2, "refreshInProgress"))
  {
    -[PSUICellularUsageSchedulingGroup getLogger](v2, "getLogger");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "Refresh already in progress, just refresh specifiers instead of sorting.", buf, 2u);
    }

    -[PSUICellularUsageSchedulingGroup hostController](v2, "hostController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadSpecifiers");

    objc_sync_exit(v2);
  }
  else
  {
    objc_sync_exit(v2);

    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, v2);
    dispatch_get_global_queue(25, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __45__PSUICellularUsageSchedulingGroup_sortGroup__block_invoke;
    block[3] = &unk_24D5017E8;
    objc_copyWeak(&v7, (id *)buf);
    dispatch_async(v5, block);

    objc_destroyWeak(&v7);
    objc_destroyWeak((id *)buf);
  }
}

void __45__PSUICellularUsageSchedulingGroup_sortGroup__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  _QWORD v8[5];
  id v9;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "appDataUsageSpecifierFactory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "refreshOrderingOfContentSpecifiers");

    v8[0] = 0;
    v8[1] = v8;
    v8[2] = 0x3032000000;
    v8[3] = __Block_byref_object_copy__3;
    v8[4] = __Block_byref_object_dispose__3;
    v9 = 0;
    objc_msgSend(v3, "appDataUsageSpecifierFactory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentSpecifiers");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __45__PSUICellularUsageSchedulingGroup_sortGroup__block_invoke_2;
    v6[3] = &unk_24D502418;
    objc_copyWeak(&v7, v1);
    v6[4] = v8;
    dispatch_async(MEMORY[0x24BDAC9B8], v6);
    objc_destroyWeak(&v7);
    _Block_object_dispose(v8, 8);

  }
}

void __45__PSUICellularUsageSchedulingGroup_sortGroup__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "loadingGroup");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setContentSpecifiers:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

    objc_msgSend(v5, "hostController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadSpecifiers");

    WeakRetained = v5;
  }

}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("CellularUsageGroup"));
}

- (PSListController)hostController
{
  return (PSListController *)objc_loadWeakRetained((id *)&self->_hostController);
}

- (void)setHostController:(id)a3
{
  objc_storeWeak((id *)&self->_hostController, a3);
}

- (CTUIListWithHeaderLoadingGroup)loadingGroup
{
  return self->_loadingGroup;
}

- (void)setLoadingGroup:(id)a3
{
  objc_storeStrong((id *)&self->_loadingGroup, a3);
}

- (PSUIAppDataUsageSpecifierFactory)appDataUsageSpecifierFactory
{
  return self->_appDataUsageSpecifierFactory;
}

- (void)setAppDataUsageSpecifierFactory:(id)a3
{
  objc_storeStrong((id *)&self->_appDataUsageSpecifierFactory, a3);
}

- (BOOL)refreshInProgress
{
  return self->_refreshInProgress;
}

- (void)setRefreshInProgress:(BOOL)a3
{
  self->_refreshInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appDataUsageSpecifierFactory, 0);
  objc_storeStrong((id *)&self->_loadingGroup, 0);
  objc_destroyWeak((id *)&self->_hostController);
}

@end
