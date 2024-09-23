@implementation PSUIPerAppUsageListController

- (PSUIPerAppUsageListController)init
{
  PSUIPerAppUsageListController *v2;
  PSUIPerAppUsageListController *v3;
  uint64_t v4;
  PSSimStatusCache *simStatusCache;
  uint64_t v6;
  PSUICellularPlanManagerCache *cellularPlanManagerCache;
  PSUICellularUsageSchedulingGroup *v8;
  void *v9;
  uint64_t v10;
  PSUICellularUsageSchedulingGroup *schedulingGroup;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PSUIPerAppUsageListController;
  v2 = -[PSUIPerAppUsageListController init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_reloadDelay = 2.5;
    objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
    v4 = objc_claimAutoreleasedReturnValue();
    simStatusCache = v3->_simStatusCache;
    v3->_simStatusCache = (PSSimStatusCache *)v4;

    +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
    v6 = objc_claimAutoreleasedReturnValue();
    cellularPlanManagerCache = v3->_cellularPlanManagerCache;
    v3->_cellularPlanManagerCache = (PSUICellularPlanManagerCache *)v6;

    v8 = [PSUICellularUsageSchedulingGroup alloc];
    -[PSUIPerAppUsageListController appUsageGroupTitle](v3, "appUsageGroupTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PSUICellularUsageSchedulingGroup initWithListController:groupSpecifierTitle:](v8, "initWithListController:groupSpecifierTitle:", v3, v9);
    schedulingGroup = v3->_schedulingGroup;
    v3->_schedulingGroup = (PSUICellularUsageSchedulingGroup *)v10;

    -[PSUIPerAppUsageListController commonInit](v3, "commonInit");
  }
  return v3;
}

- (PSUIPerAppUsageListController)initWithReloadDelay:(double)a3 schedulingGroup:(id)a4 simStatusCache:(id)a5 cellularPlanManagerCache:(id)a6
{
  id v11;
  id v12;
  id v13;
  PSUIPerAppUsageListController *v14;
  PSUIPerAppUsageListController *v15;
  PSUICellularUsageSchedulingGroup *schedulingGroup;
  void *v17;
  objc_super v19;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PSUIPerAppUsageListController;
  v14 = -[PSUIPerAppUsageListController init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_reloadDelay = a3;
    objc_storeStrong((id *)&v14->_simStatusCache, a5);
    objc_storeStrong((id *)&v15->_cellularPlanManagerCache, a6);
    objc_storeStrong((id *)&v15->_schedulingGroup, a4);
    schedulingGroup = v15->_schedulingGroup;
    -[PSUIPerAppUsageListController appUsageGroupTitle](v15, "appUsageGroupTitle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICellularUsageSchedulingGroup setGroupSpecifierTitle:](schedulingGroup, "setGroupSpecifierTitle:", v17);

    -[PSUIPerAppUsageListController commonInit](v15, "commonInit");
  }

  return v15;
}

- (void)commonInit
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  self->_delayedReloadInProgress = 0;
  -[PSUIPerAppUsageListController getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "Init, asking to calculate usage.", v8, 2u);
  }

  -[PSUICellularUsageSchedulingGroup calculateUsageWithForcedRefresh:](self->_schedulingGroup, "calculateUsageWithForcedRefresh:", 0);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("APP_USAGE_LIST_TITLE"), &stru_24D5028C8, CFSTR("Cellular"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIPerAppUsageListController setTitle:](self, "setTitle:", v5);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_wirelessDataUsageChangedNotification, *MEMORY[0x24BE856D8], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_wirelessDataUsageCacheRefreshed, *MEMORY[0x24BE856D0], 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PSUIPerAppUsageListController;
  -[PSUIPerAppUsageListController dealloc](&v4, sel_dealloc);
}

- (id)specifiers
{
  objc_class *v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  id v7;

  -[PSUICellularUsageSchedulingGroup specifiers](self->_schedulingGroup, "specifiers");
  v3 = (objc_class *)objc_claimAutoreleasedReturnValue();
  v4 = (int)*MEMORY[0x24BE756E0];
  v5 = *(Class *)((char *)&self->super.super.super.super.super.isa + v4);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v4) = v3;
  v6 = v3;

  -[PSUIPerAppUsageListController reloadAfterDelayIfNeeded](self, "reloadAfterDelayIfNeeded");
  v7 = *(id *)((char *)&self->super.super.super.super.super.isa + v4);

  return v7;
}

- (void)reloadAfterDelayIfNeeded
{
  NSObject *v3;
  dispatch_time_t v4;
  _QWORD v5[5];
  id v6;
  uint8_t buf[8];

  if (-[PSUIPerAppUsageListController specifiersContainsSpinner](self, "specifiersContainsSpinner")
    && !self->_delayedReloadInProgress)
  {
    -[PSUIPerAppUsageListController getLogger](self, "getLogger");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "A spinner cell is showing, and no reload is in progress, attempt to reload in a few seconds.", buf, 2u);
    }

    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    self->_delayedReloadInProgress = 1;
    v4 = dispatch_time(0, (uint64_t)(self->_reloadDelay * 1000000000.0));
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __57__PSUIPerAppUsageListController_reloadAfterDelayIfNeeded__block_invoke;
    v5[3] = &unk_24D501A20;
    objc_copyWeak(&v6, (id *)buf);
    v5[4] = self;
    dispatch_after(v4, MEMORY[0x24BDAC9B8], v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak((id *)buf);
  }
}

void __57__PSUIPerAppUsageListController_reloadAfterDelayIfNeeded__block_invoke(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v2 = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 1376) = 0;
    if (objc_msgSend(*(id *)(a1 + 32), "specifiersContainsSpinner"))
    {
      v5 = objc_loadWeakRetained(v2);
      objc_msgSend(v5, "getLogger");
      v6 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to calculate usage and reload as spinner cell is still showing.", v7, 2u);
      }

      objc_msgSend(v4[174], "calculateUsageWithForcedRefresh:", 1);
      objc_msgSend(v4, "reloadSpecifiers");
    }
  }

}

- (BOOL)specifiersContainsSpinner
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "cellType", (_QWORD)v7) == 15)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)appUsageGroupTitle
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sf_isChinaRegionCellularDevice");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    v7 = CFSTR("APP_WIRELESS_DATA_USAGE");
  else
    v7 = CFSTR("APP_DATA_USAGE");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24D5028C8, CFSTR("Cellular"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSUIPerAppUsageListController activeDataPlanLabel](self, "activeDataPlanLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    if (-[PSSimStatusCache isDualSimCapable](self->_simStatusCache, "isDualSimCapable"))
    {
      -[PSUICellularPlanManagerCache planItems](self->_cellularPlanManagerCache, "planItems");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (v11 >= 2)
      {
        v12 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("APP_DATA_USAGE_FOR_%@"), &stru_24D5028C8, CFSTR("Cellular"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", v14, v9);
        v15 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v15;
      }
    }
  }

  return v8;
}

- (id)activeDataPlanLabel
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PSUICellularPlanManagerCache planItems](self->_cellularPlanManagerCache, "planItems", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v6, "isActiveDataPlan") & 1) != 0)
        {
          objc_msgSend(v6, "userLabel");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "label");
          v3 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)wirelessDataUsageChangedNotification
{
  NSObject *v3;
  PSUICellularUsageSchedulingGroup *schedulingGroup;
  void *v5;
  uint8_t v6[16];

  -[PSUIPerAppUsageListController getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "Received data usage changed notification", v6, 2u);
  }

  schedulingGroup = self->_schedulingGroup;
  -[PSUIPerAppUsageListController appUsageGroupTitle](self, "appUsageGroupTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUICellularUsageSchedulingGroup setGroupSpecifierTitle:](schedulingGroup, "setGroupSpecifierTitle:", v5);

  -[PSUICellularUsageSchedulingGroup calculateUsageWithForcedRefresh:](self->_schedulingGroup, "calculateUsageWithForcedRefresh:", 0);
  -[PSUIPerAppUsageListController reloadSpecifiers](self, "reloadSpecifiers");
}

- (void)wirelessDataUsageCacheRefreshed
{
  NSObject *v3;
  uint8_t v4[16];

  -[PSUIPerAppUsageListController getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "Received data usage cache refreshed notification", v4, 2u);
  }

  -[PSUICellularUsageSchedulingGroup sortGroup](self->_schedulingGroup, "sortGroup");
  -[PSUIPerAppUsageListController reloadSpecifiers](self, "reloadSpecifiers");
}

- (id)selectSpecifier:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PSUIPerAppUsageListController;
  -[PSUIPerAppUsageListController selectSpecifier:](&v7, sel_selectSpecifier_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setParentSpecifier:", v4);

  return v5;
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("PSUIPerAppUsageListController"));
}

- (BOOL)delayedReloadInProgress
{
  return self->_delayedReloadInProgress;
}

- (void)setDelayedReloadInProgress:(BOOL)a3
{
  self->_delayedReloadInProgress = a3;
}

- (double)reloadDelay
{
  return self->_reloadDelay;
}

- (void)setReloadDelay:(double)a3
{
  self->_reloadDelay = a3;
}

- (PSUICellularUsageSchedulingGroup)schedulingGroup
{
  return self->_schedulingGroup;
}

- (void)setSchedulingGroup:(id)a3
{
  objc_storeStrong((id *)&self->_schedulingGroup, a3);
}

- (PSSimStatusCache)simStatusCache
{
  return self->_simStatusCache;
}

- (void)setSimStatusCache:(id)a3
{
  objc_storeStrong((id *)&self->_simStatusCache, a3);
}

- (PSUICellularPlanManagerCache)cellularPlanManagerCache
{
  return self->_cellularPlanManagerCache;
}

- (void)setCellularPlanManagerCache:(id)a3
{
  objc_storeStrong((id *)&self->_cellularPlanManagerCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellularPlanManagerCache, 0);
  objc_storeStrong((id *)&self->_simStatusCache, 0);
  objc_storeStrong((id *)&self->_schedulingGroup, 0);
}

@end
