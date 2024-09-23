@implementation STUsageDetailsViewModelCoordinator

- (STUsageDetailsViewModelCoordinator)initWithPersistenceController:(id)a3 organizationIdentifier:(id)a4 userDSID:(id)a5 devices:(id)a6 selectedDeviceIdentifier:(id)a7 selectedUsageReportType:(id)a8 usageContext:(int64_t)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  STUsageDetailsViewModelCoordinator *v22;
  STUsageDetailsViewModelCoordinator *v23;
  uint64_t v24;
  NSString *organizationIdentifier;
  uint64_t v26;
  NSNumber *userDSID;
  uint64_t v28;
  NSArray *devices;
  uint64_t v30;
  STUsageDetailsViewModel *viewModel;
  uint64_t v32;
  NSString *selectedDeviceIdentifier;
  _UNKNOWN **v34;
  uint64_t v35;
  STDebouncer *usageChangeDebouncer;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  NSFetchedResultsController *usageFetchedResultsController;
  NSFetchedResultsController *v44;
  id v45;
  NSObject *v46;
  NSObject *v47;
  _QWORD v49[4];
  STUsageDetailsViewModelCoordinator *v50;
  uint8_t buf[8];
  id v52;
  objc_super v53;
  _QWORD v54[2];

  v54[1] = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v53.receiver = self;
  v53.super_class = (Class)STUsageDetailsViewModelCoordinator;
  v22 = -[STUsageDetailsViewModelCoordinator init](&v53, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_persistenceController, a3);
    v24 = objc_msgSend(v17, "copy");
    organizationIdentifier = v23->_organizationIdentifier;
    v23->_organizationIdentifier = (NSString *)v24;

    v26 = objc_msgSend(v18, "copy");
    userDSID = v23->_userDSID;
    v23->_userDSID = (NSNumber *)v26;

    v28 = objc_msgSend(v19, "copy");
    devices = v23->_devices;
    v23->_devices = (NSArray *)v28;

    v30 = objc_opt_new();
    viewModel = v23->_viewModel;
    v23->_viewModel = (STUsageDetailsViewModel *)v30;

    v32 = objc_msgSend(v20, "copy");
    selectedDeviceIdentifier = v23->_selectedDeviceIdentifier;
    v23->_selectedDeviceIdentifier = (NSString *)v32;

    v23->_usageContext = a9;
    if (a9 == 2)
    {
      -[STUsageDetailsViewModel setSelectedWeek:](v23->_viewModel, "setSelectedWeek:", 1);
    }
    else if (a9 == 1 || !a9 && objc_msgSend(v21, "integerValue") == 1)
    {
      -[STUsageDetailsViewModel selectToday](v23->_viewModel, "selectToday");
    }
    v34 = &off_24DB85000;
    if (_os_feature_enabled_impl())
    {
      v35 = objc_msgSend(objc_alloc(MEMORY[0x24BE84578]), "initWithMinCoalescenceInterval:maxCoalescenceInterval:", 2.0, 10.0);
      usageChangeDebouncer = v23->_usageChangeDebouncer;
      v23->_usageChangeDebouncer = (STDebouncer *)v35;

      -[STDebouncer setDelegate:](v23->_usageChangeDebouncer, "setDelegate:", v23);
      -[STUsageDetailsViewModelCoordinator _updateUsageFetchedResultsController](v23, "_updateUsageFetchedResultsController");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE84668], "fetchRequest");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("requestedDate"), 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = v38;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setSortDescriptors:", v39);

      v40 = objc_alloc(MEMORY[0x24BDBB688]);
      -[STPersistenceControllerProtocol viewContext](v23->_persistenceController, "viewContext");
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v40, "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v37, v41, 0, 0);
      usageFetchedResultsController = v23->_usageFetchedResultsController;
      v23->_usageFetchedResultsController = (NSFetchedResultsController *)v42;

      -[NSFetchedResultsController setDelegate:](v23->_usageFetchedResultsController, "setDelegate:", v23);
      v44 = v23->_usageFetchedResultsController;
      v52 = 0;
      LOBYTE(v41) = -[NSFetchedResultsController performFetch:](v44, "performFetch:", &v52);
      v45 = v52;
      if ((v41 & 1) == 0)
      {
        +[STUILog usage](STUILog, "usage");
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          -[STUsageDetailsViewModelCoordinator initWithPersistenceController:organizationIdentifier:userDSID:devices:selectedDeviceIdentifier:selectedUsageReportType:usageContext:].cold.1();

      }
      v34 = &off_24DB85000;
    }
    objc_msgSend(v34[235], "usage");
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219AB4000, v47, OS_LOG_TYPE_DEFAULT, "Initial Usage Fetch Started", buf, 2u);
    }

    -[STUsageDetailsViewModelCoordinator setRefreshing:](v23, "setRefreshing:", 1);
    v49[0] = MEMORY[0x24BDAC760];
    v49[1] = 3221225472;
    v49[2] = __170__STUsageDetailsViewModelCoordinator_initWithPersistenceController_organizationIdentifier_userDSID_devices_selectedDeviceIdentifier_selectedUsageReportType_usageContext___block_invoke;
    v49[3] = &unk_24DB866E0;
    v50 = v23;
    -[STUsageDetailsViewModelCoordinator loadViewModelWithCompletionHandler:](v50, "loadViewModelWithCompletionHandler:", v49);

  }
  return v23;
}

uint64_t __170__STUsageDetailsViewModelCoordinator_initWithPersistenceController_organizationIdentifier_userDSID_devices_selectedDeviceIdentifier_selectedUsageReportType_usageContext___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v5[16];

  +[STUILog usage](STUILog, "usage");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_219AB4000, v2, OS_LOG_TYPE_DEFAULT, "Initial Usage Fetch Completed", v5, 2u);
  }

  v3 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "setInitialUsageFetchDate:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "setRefreshing:", 0);
}

- (STUsageDetailsViewModelCoordinator)initWithPersistenceController:(id)a3 organizationIdentifier:(id)a4 userDSID:(id)a5 devices:(id)a6 selectedDeviceIdentifier:(id)a7 selectedUsageReportType:(id)a8 usageContext:(int64_t)a9 managedObjectContext:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  STUsageDetailsViewModelCoordinator *v23;

  objc_storeStrong((id *)&self->_moc, a10);
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  v23 = -[STUsageDetailsViewModelCoordinator initWithPersistenceController:organizationIdentifier:userDSID:devices:selectedDeviceIdentifier:selectedUsageReportType:usageContext:](self, "initWithPersistenceController:organizationIdentifier:userDSID:devices:selectedDeviceIdentifier:selectedUsageReportType:usageContext:", v22, v21, v20, v19, v18, v17, a9);

  return v23;
}

- (id)initForLocalDeviceWithPersistenceController:(id)a3 selectedUsageReportType:(id)a4 usageContext:(int64_t)a5
{
  return -[STUsageDetailsViewModelCoordinator initForLocalDeviceWithPersistenceController:selectedUsageReportType:usageContext:managedObjectContext:](self, "initForLocalDeviceWithPersistenceController:selectedUsageReportType:usageContext:managedObjectContext:", a3, a4, a5, 0);
}

- (id)initForLocalDeviceWithPersistenceController:(id)a3 selectedUsageReportType:(id)a4 usageContext:(int64_t)a5 managedObjectContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  STUIDevice *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  STUIDevice *v27;
  STUsageDetailsViewModelCoordinator *v28;
  id v30;
  id v31;
  STUsageDetailsViewModelCoordinator *v32;
  id v33;
  int64_t v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v35 = 0;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  +[DeviceDetails detailsForUserWithAltDSID:error:](_TtC20ScreenTimeSettingsUI13DeviceDetails, "detailsForUserWithAltDSID:error:", 0, &v35);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v35;
  if (!v13)
  {
    +[STUILog usage](STUILog, "usage");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[STUsageDetailsViewModelCoordinator initForLocalDeviceWithPersistenceController:selectedUsageReportType:usageContext:managedObjectContext:].cold.1();
    goto LABEL_7;
  }
  v15 = objc_msgSend(v13, "indexOfObjectPassingTest:", &__block_literal_global_24);
  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x24BE845E0], "userNotifications");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[STUsageDetailsViewModelCoordinator initForLocalDeviceWithPersistenceController:selectedUsageReportType:usageContext:managedObjectContext:].cold.2();
LABEL_7:
    v17 = 0;
    v18 = 0;
    goto LABEL_11;
  }
  v30 = v11;
  v31 = v14;
  v32 = self;
  v33 = v10;
  v34 = a5;
  objc_msgSend(v13, "objectAtIndexedSubscript:", v15);
  v16 = objc_claimAutoreleasedReturnValue();
  -[NSObject identifier](v16, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject coreDuetIdentifier](v16, "coreDuetIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUILog usage](STUILog, "usage");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    -[NSObject name](v16, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v37 = v19;
    v38 = 2114;
    v39 = v17;
    v40 = 2114;
    v41 = v21;
    _os_log_impl(&dword_219AB4000, v20, OS_LOG_TYPE_DEFAULT, "initForLocalDeviceWithPersistenceController Local Device Found:  %{public}@ %{public}@ %{public}@", buf, 0x20u);

  }
  v22 = [STUIDevice alloc];
  -[NSObject name](v16, "name");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[NSObject platform](v16, "platform");
  v25 = -[NSObject isLocalDevice](v16, "isLocalDevice");
  -[NSObject lastUpdatedDate](v16, "lastUpdatedDate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[STUIDevice initWithName:identifier:coreDuetIdentifier:platform:hasDeviceActivity:isLocalDevice:lastFamilyCheckinDate:](v22, "initWithName:identifier:coreDuetIdentifier:platform:hasDeviceActivity:isLocalDevice:lastFamilyCheckinDate:", v23, v17, v19, v24, 1, v25, v26);

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v27);

  v10 = v33;
  a5 = v34;
  v14 = v31;
  self = v32;
  v11 = v30;
LABEL_11:

  v28 = -[STUsageDetailsViewModelCoordinator initWithPersistenceController:organizationIdentifier:userDSID:devices:selectedDeviceIdentifier:selectedUsageReportType:usageContext:managedObjectContext:](self, "initWithPersistenceController:organizationIdentifier:userDSID:devices:selectedDeviceIdentifier:selectedUsageReportType:usageContext:managedObjectContext:", v12, *MEMORY[0x24BE84788], &unk_24DBBED48, v18, v17, v11, a5, v10);
  return v28;
}

uint64_t __140__STUsageDetailsViewModelCoordinator_initForLocalDeviceWithPersistenceController_selectedUsageReportType_usageContext_managedObjectContext___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  *a4 = 1;
  return objc_msgSend(a2, "isLocalDevice");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[STUsageDetailsViewModelCoordinator usageDataRefreshTimer](self, "usageDataRefreshTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)STUsageDetailsViewModelCoordinator;
  -[STUsageDetailsViewModelCoordinator dealloc](&v4, sel_dealloc);
}

- (void)setSelectedDeviceIdentifier:(id)a3
{
  NSString *v5;
  NSString *selectedDeviceIdentifier;
  BOOL v7;
  NSString *v8;

  v5 = (NSString *)a3;
  selectedDeviceIdentifier = self->_selectedDeviceIdentifier;
  if (selectedDeviceIdentifier != v5)
  {
    v8 = v5;
    if (!v5 || (v7 = -[NSString isEqualToString:](selectedDeviceIdentifier, "isEqualToString:", v5), v5 = v8, !v7))
    {
      objc_storeStrong((id *)&self->_selectedDeviceIdentifier, a3);
      -[STUsageDetailsViewModelCoordinator _updateUsageFetchedResultsController](self, "_updateUsageFetchedResultsController");
      -[STUsageDetailsViewModelCoordinator loadViewModelWithCompletionHandler:](self, "loadViewModelWithCompletionHandler:", 0);
      v5 = v8;
    }
  }

}

- (void)stopRefreshingUsageData
{
  void *v3;

  -[STUsageDetailsViewModelCoordinator usageDataRefreshTimer](self, "usageDataRefreshTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[STUsageDetailsViewModelCoordinator setUsageDataRefreshTimer:](self, "setUsageDataRefreshTimer:", 0);
}

- (void)scheduleRefreshUsageData
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  id v8;

  -[STUsageDetailsViewModelCoordinator lastUsageDataRefreshTime](self, "lastUsageDataRefreshTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", 60.0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "timeIntervalSinceNow");
  if (v4 <= 0.0)
  {
    -[STUsageDetailsViewModelCoordinator _refreshUsageDataAndReschedule](self, "_refreshUsageDataAndReschedule");
  }
  else
  {
    v5 = v4;
    -[STUsageDetailsViewModelCoordinator usageDataRefreshTimer](self, "usageDataRefreshTimer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");

    -[STUsageDetailsViewModelCoordinator setUsageDataRefreshTimer:](self, "setUsageDataRefreshTimer:", 0);
    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__refreshUsageDataAndReschedule, 0, 0, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUsageDetailsViewModelCoordinator setUsageDataRefreshTimer:](self, "setUsageDataRefreshTimer:", v7);

  }
}

- (void)_refreshUsageDataAndReschedule
{
  void *v3;
  NSObject *v4;
  char *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12[2];
  id buf;
  _QWORD v14[5];

  -[STUsageDetailsViewModelCoordinator usageDataRefreshTimer](self, "usageDataRefreshTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[STUsageDetailsViewModelCoordinator setUsageDataRefreshTimer:](self, "setUsageDataRefreshTimer:", 0);
  +[STUILog usage](STUILog, "usage");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (char *)os_signpost_id_generate(v4);

  +[STUILog usage](STUILog, "usage");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_219AB4000, v7, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v5, "Usage refresh", ", (uint8_t *)&buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __68__STUsageDetailsViewModelCoordinator__refreshUsageDataAndReschedule__block_invoke;
  v14[3] = &unk_24DB86440;
  v14[4] = self;
  objc_msgSend(v8, "addOperationWithBlock:", v14);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:", CFSTR("WillRefreshUsageNotification"), 0);

  objc_initWeak(&buf, self);
  v11[0] = v9;
  v11[1] = 3221225472;
  v11[2] = __68__STUsageDetailsViewModelCoordinator__refreshUsageDataAndReschedule__block_invoke_2;
  v11[3] = &unk_24DB88258;
  objc_copyWeak(v12, &buf);
  v12[1] = v5;
  -[STUsageDetailsViewModelCoordinator _refreshUsageDataWithCompletion:](self, "_refreshUsageDataWithCompletion:", v11);
  objc_destroyWeak(v12);
  objc_destroyWeak(&buf);
}

uint64_t __68__STUsageDetailsViewModelCoordinator__refreshUsageDataAndReschedule__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRefreshing:", 1);
}

void __68__STUsageDetailsViewModelCoordinator__refreshUsageDataAndReschedule__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  void *v6;
  uint8_t v7[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[STUILog usage](STUILog, "usage");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = *(_QWORD *)(a1 + 40);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      *(_WORD *)v7 = 0;
      _os_signpost_emit_with_name_impl(&dword_219AB4000, v4, OS_SIGNPOST_INTERVAL_END, v5, "Usage refresh", ", v7, 2u);
    }

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setLastUsageDataRefreshTime:", v6);

    objc_msgSend(WeakRetained, "scheduleRefreshUsageData");
  }

}

- (void)refreshUsageData
{
  -[STUsageDetailsViewModelCoordinator _refreshUsageDataWithCompletion:](self, "_refreshUsageDataWithCompletion:", 0);
}

- (void)_refreshUsageDataWithCompletion:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  if (_os_feature_enabled_impl())
  {
    -[STUsageDetailsViewModelCoordinator organizationIdentifier](self, "organizationIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE84788]);

    if (v6)
    {
      +[STUILog usage](STUILog, "usage");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219AB4000, v7, OS_LOG_TYPE_DEFAULT, "Refreshing local device activity data.", buf, 2u);
      }

      v8 = (void *)MEMORY[0x24BE84580];
      -[STUsageDetailsViewModelCoordinator lastUsageDataRefreshTime](self, "lastUsageDataRefreshTime");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __70__STUsageDetailsViewModelCoordinator__refreshUsageDataWithCompletion___block_invoke;
      v10[3] = &unk_24DB87140;
      v10[4] = self;
      v11 = v4;
      objc_msgSend(v8, "refreshAndUploadLocalDataSinceDate:completionHandler:", v9, v10);

    }
    else
    {
      -[STUsageDetailsViewModelCoordinator _downloadRemoteDeviceActivityDataAndRefreshLegacyUsageDataWithCompletionHandler:](self, "_downloadRemoteDeviceActivityDataAndRefreshLegacyUsageDataWithCompletionHandler:", v4);
    }
  }
  else
  {
    -[STUsageDetailsViewModelCoordinator _refreshLegacyUsageDataWithCompletionHandler:](self, "_refreshLegacyUsageDataWithCompletionHandler:", v4);
  }

}

void __70__STUsageDetailsViewModelCoordinator__refreshUsageDataWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    +[STUILog usage](STUILog, "usage");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __70__STUsageDetailsViewModelCoordinator__refreshUsageDataWithCompletion___block_invoke_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 32), "_downloadRemoteDeviceActivityDataAndRefreshLegacyUsageDataWithCompletionHandler:", *(_QWORD *)(a1 + 40));

}

- (void)_downloadRemoteDeviceActivityDataAndRefreshLegacyUsageDataWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  +[STUILog usage](STUILog, "usage");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_219AB4000, v5, OS_LOG_TYPE_DEFAULT, "Downloading remote device activity data.", v6, 2u);
  }

  objc_msgSend(MEMORY[0x24BE84580], "downloadRemoteData");
  -[STUsageDetailsViewModelCoordinator _refreshLegacyUsageDataWithCompletionHandler:](self, "_refreshLegacyUsageDataWithCompletionHandler:", v4);

}

- (void)_refreshLegacyUsageDataWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  void *v14;
  STUsageDetailsViewModelCoordinator *v15;
  id v16;
  _QWORD block[4];
  void *v18;
  STUsageDetailsViewModelCoordinator *v19;
  id v20;
  uint8_t buf[16];

  v4 = a3;
  if (_os_feature_enabled_impl())
  {
    -[STUsageDetailsViewModelCoordinator userDSID](self, "userDSID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUILog usage](STUILog, "usage");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219AB4000, v6, OS_LOG_TYPE_DEFAULT, "Calling simplified_agent tp update legacy usage", buf, 2u);
    }

    dispatch_get_global_queue(2, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __83__STUsageDetailsViewModelCoordinator__refreshLegacyUsageDataWithCompletionHandler___block_invoke;
    block[3] = &unk_24DB87B20;
    v18 = v5;
    v19 = self;
    v20 = v4;
    v8 = v5;
    dispatch_async(v7, block);

    v9 = v18;
    goto LABEL_9;
  }
  -[STUsageDetailsViewModelCoordinator currentUsageRequestObjectID](self, "currentUsageRequestObjectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    -[STUsageDetailsViewModelCoordinator userDSID](self, "userDSID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUsageDetailsViewModelCoordinator persistenceController](self, "persistenceController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __83__STUsageDetailsViewModelCoordinator__refreshLegacyUsageDataWithCompletionHandler___block_invoke_154;
    v13[3] = &unk_24DB87000;
    v14 = v11;
    v15 = self;
    v16 = v4;
    v8 = v11;
    objc_msgSend(v12, "performBackgroundTask:", v13);

    v9 = v14;
LABEL_9:

    goto LABEL_10;
  }
  +[STUILog usage](STUILog, "usage");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219AB4000, v8, OS_LOG_TYPE_DEFAULT, "Skipping legacy usage data refresh because a refresh is already in-progress.", buf, 2u);
  }
LABEL_10:

}

void __83__STUsageDetailsViewModelCoordinator__refreshLegacyUsageDataWithCompletionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v2 = (void *)objc_opt_new();
  v3 = a1[4];
  v9 = 0;
  objc_msgSend(v2, "requestLegacyUsageForUser:withError:", v3, &v9);
  v4 = v9;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __83__STUsageDetailsViewModelCoordinator__refreshLegacyUsageDataWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_24DB87140;
  v5 = (void *)a1[6];
  v7 = (id)a1[5];
  v8 = v5;
  objc_msgSend(v7, "loadViewModelWithCompletionHandler:", v6);

}

uint64_t __83__STUsageDetailsViewModelCoordinator__refreshLegacyUsageDataWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didFinishRefreshingWithError:completionHandler:", a2, *(_QWORD *)(a1 + 40));
}

void __83__STUsageDetailsViewModelCoordinator__refreshLegacyUsageDataWithCompletionHandler___block_invoke_154(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void (**v16)(id, id);
  id v17;
  void (**v18)(id, id);
  id v19;
  id v20;
  uint8_t buf[8];
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  id v25;
  void (**v26)(id, id);

  v3 = a2;
  +[STUILog usage](STUILog, "usage");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219AB4000, v4, OS_LOG_TYPE_DEFAULT, "Refreshing legacy usage data.", buf, 2u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  v20 = 0;
  objc_msgSend(MEMORY[0x24BE84668], "fetchOrCreateUsageRequestForUserWithDSID:inContext:error:", v5, v3, &v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v20;
  if (v6)
  {
    objc_msgSend(v6, "objectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setCurrentUsageRequestObjectID:", v8);

    objc_msgSend(v6, "setAcknowledgedDate:", 0);
    v9 = (void *)objc_opt_new();
    objc_msgSend(v6, "setRequestedDate:", v9);

    objc_msgSend(v6, "setIsBackgroundTask:", 0);
    objc_msgSend(*(id *)(a1 + 40), "persistenceController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v7;
    v11 = objc_msgSend(v10, "saveContext:error:", v3, &v19);
    v12 = v19;

    +[STUILog usage](STUILog, "usage");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219AB4000, v14, OS_LOG_TYPE_DEFAULT, "Successfully saved legacy usage request.", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __83__STUsageDetailsViewModelCoordinator__refreshLegacyUsageDataWithCompletionHandler___block_invoke_154_cold_2();
    }

    v18 = (void (**)(id, id))*(id *)(a1 + 48);
    v17 = v12;
    if (v18)
    {
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        v18[2](v18, v17);
      }
      else
      {
        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        v22 = 3221225472;
        v23 = __STUICallCompletionHandlerOnMainThread_block_invoke_4;
        v24 = &unk_24DB86C38;
        v26 = v18;
        v25 = v17;
        dispatch_async(MEMORY[0x24BDAC9B8], buf);

      }
    }

  }
  else
  {
    +[STUILog usage](STUILog, "usage");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __83__STUsageDetailsViewModelCoordinator__refreshLegacyUsageDataWithCompletionHandler___block_invoke_154_cold_1();

    v16 = (void (**)(id, id))*(id *)(a1 + 48);
    v17 = v7;
    if (v16)
    {
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        v16[2](v16, v17);
      }
      else
      {
        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        v22 = 3221225472;
        v23 = __STUICallCompletionHandlerOnMainThread_block_invoke_4;
        v24 = &unk_24DB86C38;
        v26 = v16;
        v25 = v17;
        dispatch_async(MEMORY[0x24BDAC9B8], buf);

      }
    }

  }
}

- (void)_didFinishRefreshingWithError:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __86__STUsageDetailsViewModelCoordinator__didFinishRefreshingWithError_completionHandler___block_invoke;
  v11[3] = &unk_24DB88280;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "addOperationWithBlock:", v11);

}

uint64_t __86__STUsageDetailsViewModelCoordinator__didFinishRefreshingWithError_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setRefreshing:", 0);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40));
  return result;
}

+ (NSString)defaultDeviceIdentifierForLocalUser
{
  void *v2;
  void *v3;

  +[STUsageDetailsSelection shared](_TtC20ScreenTimeSettingsUI23STUsageDetailsSelection, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceIdentifierForLocalUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (void)setDefaultDeviceIdentifierForLocalUser:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[STUsageDetailsSelection shared](_TtC20ScreenTimeSettingsUI23STUsageDetailsSelection, "shared");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDeviceIdentifierForLocalUser:", v3);

}

+ (NSNumber)defaultUsageReportTypeForLocalUser
{
  void *v2;
  void *v3;

  +[STUsageDetailsSelection shared](_TtC20ScreenTimeSettingsUI23STUsageDetailsSelection, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "usageReportTypeForLocalUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

+ (void)setDefaultUsageReportTypeForLocalUser:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[STUsageDetailsSelection shared](_TtC20ScreenTimeSettingsUI23STUsageDetailsSelection, "shared");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUsageReportTypeForLocalUser:", v3);

}

+ (id)defaultDeviceIdentifierForChild:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[STUsageDetailsSelection shared](_TtC20ScreenTimeSettingsUI23STUsageDetailsSelection, "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceIdentifierForChildUserDSID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)setDefaultDeviceIdentifier:(id)a3 childDSID:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[STUsageDetailsSelection shared](_TtC20ScreenTimeSettingsUI23STUsageDetailsSelection, "shared");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDeviceIdentifierTo:forChildUserDSID:", v6, v5);

}

+ (id)defaultUsageReportTypeForChild:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[STUsageDetailsSelection shared](_TtC20ScreenTimeSettingsUI23STUsageDetailsSelection, "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "usageReportTypeForChildUserDSID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)setDefaultUsageReportType:(id)a3 childDSID:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[STUsageDetailsSelection shared](_TtC20ScreenTimeSettingsUI23STUsageDetailsSelection, "shared");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUsageReportTypeTo:forChildUserDSID:", v6, v5);

}

- (void)_updateUsageFetchedResultsController
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_219AB4000, v0, v1, "Failed to set up fetched results controller for usage blocks: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[5];
  uint8_t buf[16];

  v8 = a4;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v9 = v8;
    -[STUsageDetailsViewModelCoordinator currentUsageRequestObjectID](self, "currentUsageRequestObjectID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (v12)
    {
      objc_msgSend(v9, "acknowledgedDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        +[STUILog usage](STUILog, "usage");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_219AB4000, v14, OS_LOG_TYPE_DEFAULT, "Usage Request Complete", buf, 2u);
        }

        -[STUsageDetailsViewModelCoordinator setRefreshing:](self, "setRefreshing:", 1);
        v15[0] = MEMORY[0x24BDAC760];
        v15[1] = 3221225472;
        v15[2] = __104__STUsageDetailsViewModelCoordinator_controller_didChangeObject_atIndexPath_forChangeType_newIndexPath___block_invoke;
        v15[3] = &unk_24DB866E0;
        v15[4] = self;
        -[STUsageDetailsViewModelCoordinator loadViewModelWithCompletionHandler:](self, "loadViewModelWithCompletionHandler:", v15);
      }
    }

  }
}

uint64_t __104__STUsageDetailsViewModelCoordinator_controller_didChangeObject_atIndexPath_forChangeType_newIndexPath___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  +[STUILog usage](STUILog, "usage");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_219AB4000, v2, OS_LOG_TYPE_DEFAULT, "Finished refreshing legacy usage data", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setRefreshing:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentUsageRequestObjectID:", 0);
}

- (void)controllerDidChangeContent:(id)a3
{
  id v4;

  if (_os_feature_enabled_impl())
  {
    -[STUsageDetailsViewModelCoordinator usageChangeDebouncer](self, "usageChangeDebouncer");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounce:", 0);

  }
}

- (void)debouncer:(id)a3 didDebounce:(id)a4
{
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  if (_os_feature_enabled_impl())
  {
    +[STUILog usage](STUILog, "usage");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219AB4000, v5, OS_LOG_TYPE_DEFAULT, "Usage Model: simplified_agent usage controller content change debounced. Reloading view model.", buf, 2u);
    }

    -[STUsageDetailsViewModelCoordinator setRefreshing:](self, "setRefreshing:", 1);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __60__STUsageDetailsViewModelCoordinator_debouncer_didDebounce___block_invoke;
    v6[3] = &unk_24DB866E0;
    v6[4] = self;
    -[STUsageDetailsViewModelCoordinator loadViewModelWithCompletionHandler:](self, "loadViewModelWithCompletionHandler:", v6);
  }
}

void __60__STUsageDetailsViewModelCoordinator_debouncer_didDebounce___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setRefreshing:", 0);
  +[STUILog usage](STUILog, "usage");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __60__STUsageDetailsViewModelCoordinator_debouncer_didDebounce___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_219AB4000, v5, OS_LOG_TYPE_DEFAULT, "Successfully loaded usage view model after usage blocks changed", v6, 2u);
  }

}

- (id)_usageBlocksWithUser:(id)a3 device:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  void *v9;
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
  void *v21;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x24BDAC8D0];
  v7 = (void *)MEMORY[0x24BDD1758];
  v8 = a4;
  objc_msgSend(v7, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("usage.user"), a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("usage.device"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %lld"), CFSTR("durationInMinutes"), 60);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE84660], "fetchRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDD14C0];
  v23[0] = v9;
  v23[1] = v10;
  v23[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "andPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPredicate:", v15);

  v22[0] = CFSTR("countedItems");
  v22[1] = CFSTR("categories");
  v22[2] = CFSTR("categories.timedItems");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRelationshipKeyPathsForPrefetching:", v16);

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSortDescriptors:", v18);

  objc_msgSend(v12, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v12, "execute:", a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)_usageItemsWithUsageBlocks:(id)a3 lastUpdatedDate:(id *)a4 firstPickupByWeekdayByWeek:(id)a5 referenceDate:(id)a6 usageContext:(int64_t)a7
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t i;
  void *v56;
  id v57;
  char v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t j;
  void *v68;
  void *v69;
  NSObject *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v87;
  id v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  void *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  uint64_t v103;
  id obj;
  id v105;
  id v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  uint8_t buf[4];
  void *v138;
  _BYTE v139[128];
  _BYTE v140[128];
  _BYTE v141[128];
  _BYTE v142[128];
  uint64_t v143;

  v143 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v88 = a5;
  v10 = a6;
  v11 = (void *)objc_opt_new();
  +[UsageDetails screenTimeUsageItemIdentifier](_TtC20ScreenTimeSettingsUI12UsageDetails, "screenTimeUsageItemIdentifier");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  +[UsageDetails appUsageItemIdentifier](_TtC20ScreenTimeSettingsUI12UsageDetails, "appUsageItemIdentifier");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  +[UsageDetails webUsageItemIdentifier](_TtC20ScreenTimeSettingsUI12UsageDetails, "webUsageItemIdentifier");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  +[UsageDetails categoryUsageItemIdentifier](_TtC20ScreenTimeSettingsUI12UsageDetails, "categoryUsageItemIdentifier");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  +[UsageDetails notificationUsageItemIdentifier](_TtC20ScreenTimeSettingsUI12UsageDetails, "notificationUsageItemIdentifier");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  +[UsageDetails pickupUsageItemIdentifier](_TtC20ScreenTimeSettingsUI12UsageDetails, "pickupUsageItemIdentifier");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE15820], "systemHiddenBundleIdentifiersForDeviceFamily:", 102);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    v14 = v12;
  else
    v14 = (id)objc_opt_new();
  v120 = v14;

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = 0u;
  v134 = 0u;
  v135 = 0u;
  v136 = 0u;
  v15 = v9;
  v91 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v133, v142, 16);
  if (v91)
  {
    v89 = *(_QWORD *)v134;
    v100 = *MEMORY[0x24BE84760];
    v97 = *MEMORY[0x24BE84758];
    v98 = *MEMORY[0x24BE84770];
    v96 = *MEMORY[0x24BE84768];
    v94 = (void *)*MEMORY[0x24BE84790];
    v95 = (void *)*MEMORY[0x24BE847C8];
    v107 = *MEMORY[0x24BE157E0];
    v16 = 0x24BDD1000uLL;
    v103 = *MEMORY[0x24BE157D0];
    v113 = *MEMORY[0x24BE157D8];
    v115 = v11;
    v105 = v15;
    v106 = v10;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v134 != v89)
        {
          v18 = v17;
          objc_enumerationMutation(v15);
          v17 = v18;
        }
        v92 = v17;
        v19 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * v17);
        objc_msgSend(v19, "startDate");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        if (a7 != 1)
        {
          objc_msgSend(v19, "firstPickupDate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            v110 = v19;
            objc_msgSend(v87, "components:fromDate:", 8704, v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v16 + 1760), "numberWithInteger:", objc_msgSend(v21, "weekOfYear"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v88, "objectForKeyedSubscript:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v23)
            {
              v23 = (void *)objc_opt_new();
              objc_msgSend(v88, "setObject:forKeyedSubscript:", v23, v22);
            }
            objc_msgSend(*(id *)(v16 + 1760), "numberWithInteger:", objc_msgSend(v21, "weekday"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectForKeyedSubscript:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v25)
              objc_msgSend(v23, "setObject:forKeyedSubscript:", v20, v24);

            v19 = v110;
          }

        }
        v26 = (void *)objc_opt_new();
        objc_msgSend(v26, "setItemType:", 1);
        objc_msgSend(v26, "setIdentifier:", v90);
        objc_msgSend(v26, "setTimePeriod:", 0);
        objc_msgSend(v26, "setStartDate:", v117);
        objc_msgSend(*(id *)(v16 + 1760), "numberWithLongLong:", objc_msgSend(v19, "screenTimeInSeconds"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setTotalUsage:", v27);

        objc_msgSend(v11, "addObject:", v26);
        if (a7 != 1)
        {
          v28 = (void *)objc_opt_new();
          objc_msgSend(v28, "setItemType:", 6);
          objc_msgSend(v28, "setIdentifier:", v102);
          objc_msgSend(v28, "setTimePeriod:", 0);
          objc_msgSend(v28, "setStartDate:", v117);
          objc_msgSend(*(id *)(v16 + 1760), "numberWithLongLong:", objc_msgSend(v19, "numberOfPickupsWithoutApplicationUsage"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setTotalUsage:", v29);

          objc_msgSend(v11, "addObject:", v28);
          v131 = 0u;
          v132 = 0u;
          v129 = 0u;
          v130 = 0u;
          v111 = v19;
          objc_msgSend(v19, "countedItems");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v129, v141, 16);
          if (!v31)
            goto LABEL_46;
          v32 = v31;
          v33 = *(_QWORD *)v130;
          while (1)
          {
            v34 = 0;
            v118 = v32;
            do
            {
              if (*(_QWORD *)v130 != v33)
                objc_enumerationMutation(v30);
              v35 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * v34);
              objc_msgSend(v35, "bundleIdentifier");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              if (v36)
              {
                if ((objc_msgSend(v120, "containsObject:", v36) & 1) != 0
                  || (objc_msgSend(v36, "hasPrefix:", v100) & 1) != 0)
                {
                  v37 = 0;
                }
                else
                {
                  v37 = objc_msgSend(v36, "hasPrefix:", v97) ^ 1;
                }
                if (objc_msgSend(v35, "numberOfNotifications") < 1)
                {
                  if (objc_msgSend(v35, "numberOfPickups") <= 0)
                    goto LABEL_44;
                  if (v37)
                    goto LABEL_42;
                }
                else
                {
                  v38 = (void *)objc_opt_new();
                  objc_msgSend(v38, "setItemType:", 5);
                  if (v37)
                  {
                    if (objc_msgSend(v36, "hasPrefix:", v98))
                    {
                      v39 = v95;
                      goto LABEL_39;
                    }
                    if (objc_msgSend(v36, "hasPrefix:", v96))
                    {
                      v39 = v94;
LABEL_39:
                      objc_msgSend(v101, "stringByAppendingFormat:", CFSTR("-%@"), v39);
                      v43 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v38, "setIdentifier:", v43);

                      v44 = objc_alloc(MEMORY[0x24BE84670]);
                      v45 = objc_msgSend(v35, "usageTrusted");
                      v46 = v44;
                      v47 = v39;
                      v32 = v118;
                    }
                    else
                    {
                      objc_msgSend(v101, "stringByAppendingFormat:", CFSTR("-%@"), v36);
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v38, "setIdentifier:", v48);

                      v49 = objc_alloc(MEMORY[0x24BE84670]);
                      v45 = objc_msgSend(v35, "usageTrusted");
                      v46 = v49;
                      v47 = v36;
                    }
                    v50 = (void *)objc_msgSend(v46, "initWithIdentifier:usageTrusted:", v47, v45);
                    objc_msgSend(v38, "setTrustIdentifier:", v50);

                    objc_msgSend(v38, "setTimePeriod:", 0);
                    objc_msgSend(v38, "setStartDate:", v117);
                    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v35, "numberOfNotifications"));
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v38, "setTotalUsage:", v51);

                    objc_msgSend(v115, "addObject:", v38);
                    if (objc_msgSend(v35, "numberOfPickups") <= 0)
                      goto LABEL_44;
LABEL_42:
                    objc_msgSend(v102, "stringByAppendingFormat:", CFSTR("-%@"), v36);
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    v52 = (void *)objc_opt_new();
                    objc_msgSend(v52, "setItemType:", 6);
                    objc_msgSend(v52, "setIdentifier:", v41);
                    v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84670]), "initWithIdentifier:usageTrusted:", v36, objc_msgSend(v35, "usageTrusted"));
                    objc_msgSend(v52, "setTrustIdentifier:", v53);

                    objc_msgSend(v52, "setTimePeriod:", 0);
                    objc_msgSend(v52, "setStartDate:", v117);
                    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v35, "numberOfPickups"));
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v52, "setTotalUsage:", v54);

                    v32 = v118;
                    objc_msgSend(v115, "addObject:", v52);

LABEL_43:
                    goto LABEL_44;
                  }
                  objc_msgSend(v38, "setIdentifier:", v101);
                  objc_msgSend(v38, "setTimePeriod:", 0);
                  objc_msgSend(v38, "setStartDate:", v117);
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v35, "numberOfNotifications"));
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "setTotalUsage:", v40);

                  objc_msgSend(v115, "addObject:", v38);
                  if (objc_msgSend(v35, "numberOfPickups") <= 0)
                    goto LABEL_44;
                }
                v41 = (void *)objc_opt_new();
                objc_msgSend(v41, "setItemType:", 6);
                objc_msgSend(v41, "setIdentifier:", v102);
                objc_msgSend(v41, "setTimePeriod:", 0);
                objc_msgSend(v41, "setStartDate:", v117);
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v35, "numberOfPickups"));
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "setTotalUsage:", v42);

                objc_msgSend(v115, "addObject:", v41);
                goto LABEL_43;
              }
LABEL_44:

              ++v34;
            }
            while (v32 != v34);
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v129, v141, 16);
            if (!v32)
            {
LABEL_46:

              v11 = v115;
              v16 = 0x24BDD1000uLL;
              v19 = v111;
              break;
            }
          }
        }
        v127 = 0u;
        v128 = 0u;
        v125 = 0u;
        v126 = 0u;
        objc_msgSend(v19, "categories");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v109 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v140, 16);
        if (!v109)
          goto LABEL_77;
        v108 = *(_QWORD *)v126;
        do
        {
          for (i = 0; i != v109; ++i)
          {
            if (*(_QWORD *)v126 != v108)
              objc_enumerationMutation(obj);
            v56 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * i);
            objc_msgSend(v56, "identifier");
            v57 = (id)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v57, "isEqualToString:", v107) & 1) != 0
              || objc_msgSend(v57, "isEqualToString:", v103))
            {

LABEL_55:
              if ((objc_msgSend(v57, "isEqualToString:", v113) & 1) != 0)
                goto LABEL_75;
              v112 = i;
              v119 = 0;
              goto LABEL_59;
            }
            v58 = objc_msgSend(v57, "isEqualToString:", v113);

            if ((v58 & 1) != 0)
              goto LABEL_55;
            v112 = i;
            objc_msgSend(v99, "stringByAppendingFormat:", CFSTR("-%@"), v57);
            v59 = v57;
            v57 = (id)objc_claimAutoreleasedReturnValue();
            v60 = (void *)objc_opt_new();
            objc_msgSend(v60, "setItemType:", 3);
            objc_msgSend(v60, "setIdentifier:", v57);
            v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84670]), "initWithIdentifier:usageTrusted:", v59, 1);
            objc_msgSend(v60, "setTrustIdentifier:", v61);

            v119 = v59;
            objc_msgSend(v60, "setCategoryIdentifier:", v59);
            objc_msgSend(v60, "setTimePeriod:", 0);
            objc_msgSend(v60, "setStartDate:", v117);
            objc_msgSend(*(id *)(v16 + 1760), "numberWithLongLong:", objc_msgSend(v56, "totalTimeInSeconds"));
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "setTotalUsage:", v62);

            objc_msgSend(v11, "addObject:", v60);
LABEL_59:

            v123 = 0u;
            v124 = 0u;
            v121 = 0u;
            v122 = 0u;
            objc_msgSend(v56, "timedItems");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v121, v139, 16);
            if (!v64)
              goto LABEL_74;
            v65 = v64;
            v66 = *(_QWORD *)v122;
            do
            {
              for (j = 0; j != v65; ++j)
              {
                if (*(_QWORD *)v122 != v66)
                  objc_enumerationMutation(v63);
                v68 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * j);
                objc_msgSend(v68, "bundleIdentifier");
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v69)
                {
                  objc_msgSend(v68, "domain");
                  v71 = objc_claimAutoreleasedReturnValue();
                  v70 = v71;
                  if (!v71)
                    goto LABEL_72;
                  objc_msgSend(v114, "stringByAppendingFormat:", CFSTR("-%@"), v71);
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  v73 = (void *)objc_opt_new();
                  objc_msgSend(v73, "setItemType:", 4);
                  objc_msgSend(v73, "setIdentifier:", v72);
                  v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84670]), "initWithIdentifier:usageTrusted:", v70, objc_msgSend(v68, "usageTrusted"));
                  objc_msgSend(v73, "setTrustIdentifier:", v74);

                  objc_msgSend(v73, "setCategoryIdentifier:", v119);
                  objc_msgSend(v73, "setTimePeriod:", 0);
                  objc_msgSend(v73, "setStartDate:", v117);
                  v75 = (void *)MEMORY[0x24BDD16E0];
                  v76 = objc_msgSend(v68, "totalTimeInSeconds");
                  v77 = v75;
                  v11 = v115;
                  objc_msgSend(v77, "numberWithLongLong:", v76);
                  v78 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v73, "setTotalUsage:", v78);

                  objc_msgSend(v115, "addObject:", v73);
                  goto LABEL_71;
                }
                if (!objc_msgSend(v120, "containsObject:", v69))
                {
                  objc_msgSend(v116, "stringByAppendingFormat:", CFSTR("-%@"), v69);
                  v70 = objc_claimAutoreleasedReturnValue();
                  v72 = (void *)objc_opt_new();
                  objc_msgSend(v72, "setItemType:", 2);
                  objc_msgSend(v72, "setIdentifier:", v70);
                  v79 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84670]), "initWithIdentifier:usageTrusted:", v69, objc_msgSend(v68, "usageTrusted"));
                  objc_msgSend(v72, "setTrustIdentifier:", v79);

                  objc_msgSend(v72, "setCategoryIdentifier:", v119);
                  objc_msgSend(v72, "setTimePeriod:", 0);
                  objc_msgSend(v72, "setStartDate:", v117);
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v68, "totalTimeInSeconds"));
                  v80 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v72, "setTotalUsage:", v80);

                  objc_msgSend(v11, "addObject:", v72);
LABEL_71:

                  goto LABEL_72;
                }
                +[STUILog usage](STUILog, "usage");
                v70 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v138 = v69;
                  _os_log_debug_impl(&dword_219AB4000, v70, OS_LOG_TYPE_DEBUG, "Skipping timed item for system app %@", buf, 0xCu);
                }
LABEL_72:

              }
              v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v121, v139, 16);
            }
            while (v65);
LABEL_74:

            v15 = v105;
            v10 = v106;
            v16 = 0x24BDD1000;
            i = v112;
            v57 = v119;
LABEL_75:

          }
          v109 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v140, 16);
        }
        while (v109);
LABEL_77:

        v17 = v92 + 1;
      }
      while (v92 + 1 != v91);
      v91 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v133, v142, 16);
    }
    while (v91);
  }

  if (a4)
  {
    objc_msgSend(v15, "firstObject");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "usage");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "lastUpdatedDate");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = v83;
    if (!v83)
      v83 = v10;
    *a4 = objc_retainAutorelease(v83);

  }
  return v11;
}

- (void)loadViewModelWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  _QWORD v27[5];
  id v28;

  v4 = a3;
  -[STUsageDetailsViewModelCoordinator userDSID](self, "userDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__7;
  v27[4] = __Block_byref_object_dispose__7;
  -[STUsageDetailsViewModelCoordinator selectedDeviceIdentifier](self, "selectedDeviceIdentifier");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  -[STUsageDetailsViewModelCoordinator viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasUsageData");
  v8 = objc_msgSend(v6, "selectedWeek");
  v9 = objc_msgSend(v6, "selectedDay");
  if (_os_feature_enabled_impl())
  {
    -[STUsageDetailsViewModelCoordinator moc](self, "moc");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BE84498], "sharedController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "persistentContainer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v17, "newBackgroundContext");

      goto LABEL_6;
    }
    v12 = v10;
    v11 = v12;
  }
  else
  {
    -[STUsageDetailsViewModelCoordinator persistenceController](self, "persistenceController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v11, "newBackgroundContext");
  }
  v13 = v12;
LABEL_6:

  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __73__STUsageDetailsViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke;
  v19[3] = &unk_24DB88378;
  v19[4] = self;
  v14 = v5;
  v20 = v14;
  v15 = v4;
  v22 = v15;
  v23 = v27;
  v16 = v13;
  v21 = v16;
  v24 = v9;
  v25 = v8;
  v26 = v7;
  objc_msgSend(v16, "performBlock:", v19);

  _Block_object_dispose(v27, 8);
}

void __73__STUsageDetailsViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (**v26)(id, id);
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  NSObject *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  void *v51;
  int v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  NSObject *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  NSObject *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  int v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  unint64_t v88;
  void *v89;
  void *v90;
  unint64_t v91;
  _BOOL4 v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  id v98;
  NSObject *v99;
  void *v100;
  uint64_t v101;
  NSObject *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  id v108;
  NSObject *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  void *v113;
  NSObject *v114;
  void *v115;
  uint64_t v116;
  NSObject *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void (**v125)(id, id);
  NSObject *v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  int v130;
  void *v131;
  void *v132;
  void *v133;
  int v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  NSObject *v139;
  _QWORD v140[5];
  NSObject *v141;
  char v142;
  char v143;
  id v144;
  id v145;
  _QWORD v146[5];
  id v147;
  NSObject *v148;
  BOOL v149;
  char v150;
  char v151;
  id v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  id v161;
  void *v162;
  _BYTE v163[128];
  _BYTE v164[128];
  _QWORD v165[2];
  _BYTE block[24];
  void *v167;
  id v168;
  void (**v169)(id, id);
  uint64_t v170;

  v170 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("HideNewUsageUI"));

  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AllDevicesTitle"), &stru_24DB8A1D0, 0);
  v5 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "userDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  if (v7)
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("dsid"), *(_QWORD *)(a1 + 40));
  else
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K != NULL"), CFSTR("localUserDeviceState"), v128);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE84570], "fetchRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v8);
  objc_msgSend(*(id *)(a1 + 32), "organizationIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BE84788]);

  if ((v11 & 1) == 0)
  {
    v165[0] = CFSTR("usages");
    v165[1] = CFSTR("usages.device");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v165, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRelationshipKeyPathsForPrefetching:", v12);

  }
  v161 = 0;
  objc_msgSend(v9, "execute:", &v161);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v161;
  if (v13)
  {
    if ((unint64_t)objc_msgSend(v13, "count") >= 2)
    {
      +[STUILog usage](STUILog, "usage");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        __73__STUsageDetailsViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_5();

    }
    v130 = v3;
    objc_msgSend(v13, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v131 = v13;
    v132 = v9;
    v138 = v16;
    v133 = v8;
    if (v11)
    {
      v134 = objc_msgSend(v16, "syncingEnabled");
    }
    else
    {
      v159 = 0u;
      v160 = 0u;
      v157 = 0u;
      v158 = 0u;
      objc_msgSend(v16, "usages");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v157, v164, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v158;
        while (2)
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v158 != v30)
              objc_enumerationMutation(v27);
            objc_msgSend(*(id *)(*((_QWORD *)&v157 + 1) + 8 * i), "device");
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v32)
            {
              v134 = 1;
              goto LABEL_28;
            }
          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v157, v164, 16);
          if (v29)
            continue;
          break;
        }
        v134 = 0;
LABEL_28:
        v17 = v138;
      }
      else
      {
        v134 = 0;
      }

    }
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("NOT (%K == %hd OR %K == %hd)"), CFSTR("device.platform"), 4, CFSTR("device.platform"), 5);
    v33 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "userDeviceStates");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v129 = (void *)v33;
    objc_msgSend(v34, "filteredSetUsingPredicate:", v33);
    v136 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "altDSID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = _os_feature_enabled_impl();
    +[STUILog usage](STUILog, "usage");
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
    v135 = v35;
    if (v36)
    {
      if (v38)
      {
        *(_WORD *)block = 0;
        _os_log_impl(&dword_219AB4000, v37, OS_LOG_TYPE_DEFAULT, "New usage feature flag is on.", block, 2u);
      }

      if (!v35 || v11 && (objc_msgSend(v17, "syncingEnabled") & 1) == 0)
      {
        objc_msgSend(v17, "localUserDeviceState");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "device");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "identifier");
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v43 = *(void **)(v42 + 40);
        *(_QWORD *)(v42 + 40) = v41;

      }
      v139 = v5;
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
      {
        objc_msgSend(*(id *)(a1 + 32), "devices");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend(v63, "count");

        if (v64 != 1)
        {
          v47 = 0;
          v56 = 0;
          LOBYTE(v11) = 0;
LABEL_81:
          objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          if (((_os_feature_enabled_impl() ^ 1 | v130) & 1) != 0)
            goto LABEL_97;
          if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
          {
            v83 = objc_msgSend(v47, "hasDeviceActivity");
            objc_msgSend(v47, "coreDuetIdentifier");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            if (v83)
            {
              objc_msgSend(v47, "identifier");
              v85 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_90:
              v92 = 1;
              goto LABEL_91;
            }
            v92 = 0;
            v85 = 0;
          }
          else
          {
            if (!v35)
            {
              objc_msgSend(v138, "localUserDeviceState");
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v93, "device");
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v94, "identifier");
              v95 = objc_claimAutoreleasedReturnValue();
              v96 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
              v97 = *(void **)(v96 + 40);
              *(_QWORD *)(v96 + 40) = v95;

              objc_msgSend(v93, "coreDuetIdentifier");
              v84 = (void *)objc_claimAutoreleasedReturnValue();

              v85 = 0;
              goto LABEL_90;
            }
            objc_msgSend(v138, "userDeviceStates");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "objectsPassingTest:", &__block_literal_global_221);
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = objc_msgSend(v87, "count");

            objc_msgSend(MEMORY[0x24BE84580], "deviceIdentifiersByUserAltDSID");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "objectForKeyedSubscript:", v35);
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            v91 = objc_msgSend(v90, "count");

            v84 = 0;
            v85 = 0;
            v92 = v88 <= v91;
          }
LABEL_91:
          v146[0] = MEMORY[0x24BDAC760];
          v146[1] = 3221225472;
          v146[2] = __73__STUsageDetailsViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_2;
          v146[3] = &unk_24DB88328;
          v146[4] = *(_QWORD *)(a1 + 32);
          v98 = v84;
          v147 = v98;
          v149 = v92;
          v150 = v11;
          v99 = v139;
          v148 = v99;
          v151 = v134;
          objc_msgSend(v137, "addOperationWithBlock:", v146);
          if (v92)
          {
            v100 = (void *)objc_opt_new();
            v101 = objc_msgSend(*(id *)(a1 + 32), "usageContext");
            if (v101 == 2)
            {
              v35 = v135;
              objc_msgSend(*(id *)(a1 + 32), "_loadLastWeekDeviceActivityForUserWithAltDSID:deviceActivityIdentifier:selectedItemDisplayName:referenceDate:completionHandler:", v135, v85, v99, v100, *(_QWORD *)(a1 + 56));
            }
            else
            {
              v35 = v135;
              if (v101 == 1)
              {
                objc_msgSend(*(id *)(a1 + 32), "_loadTodayDeviceActivityForUserWithAltDSID:deviceActivityIdentifier:selectedItemDisplayName:referenceDate:completionHandler:", v135, v85, v99, v100, *(_QWORD *)(a1 + 56));
              }
              else if (!v101)
              {
                objc_msgSend(*(id *)(a1 + 32), "_loadAllHistoricalDeviceActivityForUserWithAltDSID:deviceActivityIdentifier:selectedItemDisplayName:selectedDay:selectedWeek:hadUsageData:referenceDate:completionHandler:", v135, v85, v99, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(unsigned __int8 *)(a1 + 88), v100, *(_QWORD *)(a1 + 56));
              }
            }
            +[STUILog usage](STUILog, "usage");
            v126 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
            {
              v127 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
              *(_DWORD *)block = 138543618;
              *(_QWORD *)&block[4] = v35;
              *(_WORD *)&block[12] = 2114;
              *(_QWORD *)&block[14] = v127;
              _os_log_impl(&dword_219AB4000, v126, OS_LOG_TYPE_DEFAULT, "Rendering usage with Device Activity Data for user: %{public}@ device: %{public}@", block, 0x16u);
            }

            v113 = v129;
LABEL_132:

            v9 = v132;
            v8 = v133;
            v5 = v139;
            v13 = v131;
            goto LABEL_133;
          }

          v35 = v135;
LABEL_97:
          +[STUILog usage](STUILog, "usage");
          v102 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
          {
            v103 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
            *(_DWORD *)block = 138543618;
            *(_QWORD *)&block[4] = v35;
            *(_WORD *)&block[12] = 2114;
            *(_QWORD *)&block[14] = v103;
            _os_log_impl(&dword_219AB4000, v102, OS_LOG_TYPE_DEFAULT, "Rendering usage with Legacy Screen Time Data for user: %{public}@ device: %{public}@", block, 0x16u);
          }

          if (_os_feature_enabled_impl() && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
          {
            v104 = (void *)MEMORY[0x24BE84560];
            objc_msgSend(v47, "coreDuetIdentifier");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            v106 = *(_QWORD *)(a1 + 48);
            v145 = v14;
            objc_msgSend(v104, "fetchDeviceWithCoreDuetIdentifier:inContext:error:", v105, v106, &v145);
            v107 = objc_claimAutoreleasedReturnValue();
            v108 = v145;

            if (v107)
            {
              v56 = (void *)v107;
            }
            else
            {
              objc_msgSend(MEMORY[0x24BE845E0], "usage");
              v109 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
                __73__STUsageDetailsViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_3();

              v56 = 0;
            }
            v35 = v135;
          }
          else
          {
            v108 = v14;
          }
          v98 = (id)objc_opt_new();
          if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) || v56)
          {
            v110 = *(void **)(a1 + 32);
            v144 = v108;
            objc_msgSend(v110, "_usageBlocksWithUser:device:error:", v138, v56, &v144);
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v144;

            v112 = objc_msgSend(v111, "mutableCopy");
            v98 = (id)v112;
            v35 = v135;
          }
          else
          {
            v14 = v108;
          }
          v113 = v129;
          if (v98)
          {
            v140[0] = MEMORY[0x24BDAC760];
            v140[1] = 3221225472;
            v140[2] = __73__STUsageDetailsViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_222;
            v140[3] = &unk_24DB88350;
            v140[4] = *(_QWORD *)(a1 + 32);
            v142 = v11;
            v114 = v139;
            v141 = v114;
            v143 = v134;
            objc_msgSend(v137, "addOperationWithBlock:", v140);
            v115 = (void *)objc_opt_new();
            v116 = objc_msgSend(*(id *)(a1 + 32), "usageContext");
            switch(v116)
            {
              case 2:
                objc_msgSend(*(id *)(a1 + 32), "_loadLastWeekUsageWithUsageBlocks:selectedItemDisplayName:referenceDate:completionHandler:", v98, v114, v115, *(_QWORD *)(a1 + 56));
                break;
              case 1:
                objc_msgSend(*(id *)(a1 + 32), "_loadTodayUsageWithUsageBlocks:selectedItemDisplayName:referenceDate:completionHandler:", v98, v114, v115, *(_QWORD *)(a1 + 56));
                break;
              case 0:
                objc_msgSend(*(id *)(a1 + 32), "_loadAllHistoricalUsageWithUsageBlocks:selectedItemDisplayName:selectedDay:selectedWeek:hadUsageData:referenceDate:completionHandler:", v98, v114, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(unsigned __int8 *)(a1 + 88), v115, *(_QWORD *)(a1 + 56));
                break;
            }

          }
          else
          {
            +[STUILog usage](STUILog, "usage");
            v117 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
              __73__STUsageDetailsViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_2(v117, v118, v119, v120, v121, v122, v123, v124);

            v125 = (void (**)(id, id))*(id *)(a1 + 56);
            v14 = v14;
            if (v125)
            {
              if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
              {
                v125[2](v125, v14);
              }
              else
              {
                *(_QWORD *)block = MEMORY[0x24BDAC760];
                *(_QWORD *)&block[8] = 3221225472;
                *(_QWORD *)&block[16] = __STUICallCompletionHandlerOnMainThread_block_invoke_4;
                v167 = &unk_24DB86C38;
                v169 = v125;
                v168 = v14;
                dispatch_async(MEMORY[0x24BDAC9B8], block);

              }
            }

          }
          goto LABEL_132;
        }
        objc_msgSend(*(id *)(a1 + 32), "devices");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "firstObject");
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v47, "name");
        v66 = objc_claimAutoreleasedReturnValue();

        LOBYTE(v11) = objc_msgSend(v47, "isLocalDevice");
        objc_msgSend(v47, "identifier");
        v67 = objc_claimAutoreleasedReturnValue();
        v68 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v69 = *(void **)(v68 + 40);
        *(_QWORD *)(v68 + 40) = v67;

        objc_msgSend(*(id *)(a1 + 32), "setSelectedDeviceIdentifier:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
LABEL_80:
        v56 = 0;
        v139 = v66;
        goto LABEL_81;
      }
      v155 = 0u;
      v156 = 0u;
      v153 = 0u;
      v154 = 0u;
      objc_msgSend(*(id *)(a1 + 32), "devices");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v153, v163, 16);
      if (v45)
      {
        v46 = v45;
        v47 = 0;
        v48 = *(_QWORD *)v154;
        do
        {
          for (j = 0; j != v46; ++j)
          {
            if (*(_QWORD *)v154 != v48)
              objc_enumerationMutation(v44);
            v50 = *(void **)(*((_QWORD *)&v153 + 1) + 8 * j);
            objc_msgSend(v50, "identifier");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = objc_msgSend(v51, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

            if (v52)
            {
              v53 = v50;

              v47 = v53;
            }
          }
          v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v153, v163, 16);
        }
        while (v46);

        v35 = v135;
        if (v47)
          goto LABEL_79;
      }
      else
      {

      }
      objc_msgSend(*(id *)(a1 + 32), "devices");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(v70, "indexOfObjectPassingTest:", &__block_literal_global_215);

      objc_msgSend(*(id *)(a1 + 32), "devices");
      v72 = objc_claimAutoreleasedReturnValue();
      v73 = v72;
      if (v71 == 0x7FFFFFFFFFFFFFFFLL)
      {
        -[NSObject firstObject](v72, "firstObject");
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        +[STUILog usage](STUILog, "usage");
        v73 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
          __73__STUsageDetailsViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_4(v47, v73);
      }
      else
      {
        -[NSObject objectAtIndexedSubscript:](v72, "objectAtIndexedSubscript:", v71);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(v47, "identifier");
      v80 = objc_claimAutoreleasedReturnValue();
      v81 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v82 = *(void **)(v81 + 40);
      *(_QWORD *)(v81 + 40) = v80;

      objc_msgSend(*(id *)(a1 + 32), "setSelectedDeviceIdentifier:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
LABEL_79:
      objc_msgSend(v47, "name");
      v66 = objc_claimAutoreleasedReturnValue();

      LOBYTE(v11) = objc_msgSend(v47, "isLocalDevice");
      goto LABEL_80;
    }
    if (v38)
    {
      *(_WORD *)block = 0;
      _os_log_impl(&dword_219AB4000, v37, OS_LOG_TYPE_DEFAULT, "New usage feature flag is off.", block, 2u);
    }

    v54 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    if (v54)
    {
      v55 = *(_QWORD *)(a1 + 48);
      v152 = v14;
      objc_msgSend(MEMORY[0x24BE84560], "fetchDeviceWithIdentifier:inContext:error:", v54, v55, &v152);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v152;

      if (v56)
      {
        v58 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        objc_msgSend(v138, "localUserDeviceState");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "device");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "identifier");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v58) = objc_msgSend(v58, "isEqualToString:", v61);

        LOBYTE(v11) = v11 & v58;
        objc_msgSend(v56, "name");
        v62 = objc_claimAutoreleasedReturnValue();

        v47 = 0;
        v139 = v62;
        v14 = v57;
        goto LABEL_81;
      }
      v14 = v57;
      v17 = v138;
    }
    if (v134 && (unint64_t)objc_msgSend(v136, "count") > 1)
    {
      v139 = v5;
      v47 = 0;
      v56 = 0;
      LOBYTE(v11) = 1;
      goto LABEL_81;
    }
    if (v11)
    {
      objc_msgSend(v17, "localUserDeviceState");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "device");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v136, "count"))
        goto LABEL_73;
      v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("device.name"), 1);
      v162 = v74;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v162, 1);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v136, "sortedArrayUsingDescriptors:", v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v76, "objectAtIndexedSubscript:", 0);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "device");
      v56 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (v56)
    {
      objc_msgSend(v56, "name");
      v78 = v5;
      v139 = objc_claimAutoreleasedReturnValue();
LABEL_76:

      objc_msgSend(v56, "identifier");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setSelectedDeviceIdentifier:", v79);

      v47 = 0;
      goto LABEL_81;
    }
LABEL_73:
    +[STUILog usage](STUILog, "usage");
    v78 = objc_claimAutoreleasedReturnValue();
    v139 = v5;
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)block = 0;
      _os_log_impl(&dword_219AB4000, v78, OS_LOG_TYPE_DEFAULT, "No device found for remote user", block, 2u);
    }
    v56 = 0;
    goto LABEL_76;
  }
  +[STUILog usage](STUILog, "usage");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    __73__STUsageDetailsViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);

  v26 = (void (**)(id, id))*(id *)(a1 + 56);
  v14 = v14;
  if (v26)
  {
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      v26[2](v26, v14);
    }
    else
    {
      *(_QWORD *)block = MEMORY[0x24BDAC760];
      *(_QWORD *)&block[8] = 3221225472;
      *(_QWORD *)&block[16] = __STUICallCompletionHandlerOnMainThread_block_invoke_4;
      v167 = &unk_24DB86C38;
      v169 = v26;
      v168 = v14;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
  }

LABEL_133:
}

uint64_t __73__STUsageDetailsViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_213(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isLocalDevice");
}

BOOL __73__STUsageDetailsViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_219(uint64_t a1, void *a2)
{
  void *v2;
  int v3;

  objc_msgSend(a2, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "platform");

  return (v3 - 1) < 2;
}

void __73__STUsageDetailsViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "viewModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSelectedCoreDuetIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "setHasDeviceActivityData:", *(unsigned __int8 *)(a1 + 56));
  objc_msgSend(v2, "setLocalDevice:", *(unsigned __int8 *)(a1 + 57));
  objc_msgSend(v2, "setSelectedItemDisplayName:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v2, "setHasAggregateUsageData:", *(unsigned __int8 *)(a1 + 58));

}

void __73__STUsageDetailsViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_222(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "viewModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocalDevice:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(v2, "setSelectedItemDisplayName:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "setHasAggregateUsageData:", *(unsigned __int8 *)(a1 + 49));

}

- (void)_loadTodayUsageWithUsageBlocks:(id)a3 selectedItemDisplayName:(id)a4 referenceDate:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  STUsageReport *v19;
  void *v20;
  void *v21;
  void *v22;
  STUsageReport *v23;
  void *v24;
  id v25;
  STUsageReport *v26;
  id v27;
  id v28;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  STUsageReport *v34;
  id v35;
  id v36;

  v30 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_opt_new();
  v36 = 0;
  -[STUsageDetailsViewModelCoordinator _usageItemsWithUsageBlocks:lastUpdatedDate:firstPickupByWeekdayByWeek:referenceDate:usageContext:](self, "_usageItemsWithUsageBlocks:lastUpdatedDate:firstPickupByWeekdayByWeek:referenceDate:usageContext:", v12, &v36, v13, v10, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v36;
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "startOfDayForDate:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v16, "component:fromDate:", 512, v17);
  v19 = [STUsageReport alloc];
  objc_msgSend(v13, "objectForKeyedSubscript:", &unk_24DBBED60);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[STUsageReport initWithReportType:startDate:lastUpdatedDate:firstPickup:usageItems:](v19, "initWithReportType:startDate:lastUpdatedDate:firstPickup:usageItems:", 1, v17, v15, v22, v14);

  -[STUsageReport setDisplayName:](v23, "setDisplayName:", v11);
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __125__STUsageDetailsViewModelCoordinator__loadTodayUsageWithUsageBlocks_selectedItemDisplayName_referenceDate_completionHandler___block_invoke;
  v31[3] = &unk_24DB883A0;
  v31[4] = self;
  v32 = v15;
  v33 = v14;
  v34 = v23;
  v35 = v30;
  v25 = v30;
  v26 = v23;
  v27 = v14;
  v28 = v15;
  objc_msgSend(v24, "addOperationWithBlock:", v31);

}

void __125__STUsageDetailsViewModelCoordinator__loadTodayUsageWithUsageBlocks_selectedItemDisplayName_referenceDate_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[16];

  +[STUILog usage](STUILog, "usage");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_219AB4000, v2, OS_LOG_TYPE_DEFAULT, "Updating view model with today's usage", v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLastUpdatedDate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setRawUsageItems:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v3, "setSelectedDayUsageReport:", *(_QWORD *)(a1 + 56));
  v4 = *(_QWORD *)(a1 + 64);
  if (v4)
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);

}

- (void)_loadTodayDeviceActivityForUserWithAltDSID:(id)a3 deviceActivityIdentifier:(id)a4 selectedItemDisplayName:(id)a5 referenceDate:(id)a6 completionHandler:(id)a7
{
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  STUsageReport *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  STUsageReport *v33;
  void *v34;
  STUsageReport *v35;
  void *v36;
  id v37;
  STUsageReport *v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  _QWORD v45[5];
  id v46;
  STUsageReport *v47;
  id v48;
  id v49;

  v12 = a7;
  v13 = (void *)MEMORY[0x24BDBCE48];
  v14 = a6;
  v44 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v13, "currentCalendar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "startOfDayForDate:", v14);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v18, v14);
  v49 = 0;
  +[UsageDetails detailsForUserWithAltDSID:deviceActivityIdentifier:dateInterval:referenceDate:usageContext:error:](_TtC20ScreenTimeSettingsUI12UsageDetails, "detailsForUserWithAltDSID:deviceActivityIdentifier:dateInterval:referenceDate:usageContext:error:", v16, v15, v19, v14, 1, &v49);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = v49;
  if (!v20)
  {
    +[STUILog usage](STUILog, "usage");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[STUsageDetailsViewModelCoordinator _loadTodayDeviceActivityForUserWithAltDSID:deviceActivityIdentifier:selectedItemDisplayName:referenceDate:completionHandler:].cold.1();

  }
  v42 = (void *)v19;
  v23 = objc_msgSend(v17, "component:fromDate:", 512, v18, self);
  v24 = [STUsageReport alloc];
  objc_msgSend(v20, "lastUpdatedDate");
  v43 = v21;
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "firstPickupByWeekdayByWeek");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", &unk_24DBBED60);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v23);
  v28 = (void *)v18;
  v29 = v12;
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "usageItems");
  v41 = v17;
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v24;
  v34 = v28;
  v35 = -[STUsageReport initWithReportType:startDate:lastUpdatedDate:firstPickup:usageItems:](v33, "initWithReportType:startDate:lastUpdatedDate:firstPickup:usageItems:", 1, v28, v25, v31, v32);

  -[STUsageReport setDisplayName:](v35, "setDisplayName:", v44);
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __162__STUsageDetailsViewModelCoordinator__loadTodayDeviceActivityForUserWithAltDSID_deviceActivityIdentifier_selectedItemDisplayName_referenceDate_completionHandler___block_invoke;
  v45[3] = &unk_24DB86C10;
  v45[4] = v40;
  v46 = v20;
  v47 = v35;
  v48 = v29;
  v37 = v29;
  v38 = v35;
  v39 = v20;
  objc_msgSend(v36, "addOperationWithBlock:", v45);

}

void __162__STUsageDetailsViewModelCoordinator__loadTodayDeviceActivityForUserWithAltDSID_deviceActivityIdentifier_selectedItemDisplayName_referenceDate_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[16];

  +[STUILog usage](STUILog, "usage");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_219AB4000, v2, OS_LOG_TYPE_DEFAULT, "Updating view model with today's device activity", v7, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "lastUpdatedDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLastUpdatedDate:", v4);

  objc_msgSend(*(id *)(a1 + 40), "usageItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRawUsageItems:", v5);

  objc_msgSend(v3, "setSelectedDayUsageReport:", *(_QWORD *)(a1 + 48));
  v6 = *(_QWORD *)(a1 + 56);
  if (v6)
    (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);

}

- (void)_loadLastWeekUsageWithUsageBlocks:(id)a3 selectedItemDisplayName:(id)a4 referenceDate:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  STUsageReport *v19;
  void *v20;
  void *v21;
  void *v22;
  STUsageReport *v23;
  void *v24;
  id v25;
  STUsageReport *v26;
  id v27;
  id v28;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  STUsageReport *v34;
  id v35;
  id v36;

  v30 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_opt_new();
  v36 = 0;
  -[STUsageDetailsViewModelCoordinator _usageItemsWithUsageBlocks:lastUpdatedDate:firstPickupByWeekdayByWeek:referenceDate:usageContext:](self, "_usageItemsWithUsageBlocks:lastUpdatedDate:firstPickupByWeekdayByWeek:referenceDate:usageContext:", v12, &v36, v13, v10, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v36;
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "firstWeekday");
  objc_msgSend(v16, "nextDateAfterDate:matchingUnit:value:options:", v10, 512, v17, 260);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = [STUsageReport alloc];
  objc_msgSend(v13, "objectForKeyedSubscript:", &unk_24DBBED78);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[STUsageReport initWithReportType:startDate:lastUpdatedDate:firstPickup:usageItems:](v19, "initWithReportType:startDate:lastUpdatedDate:firstPickup:usageItems:", 0, v18, v15, v22, v14);

  -[STUsageReport setDisplayName:](v23, "setDisplayName:", v11);
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __128__STUsageDetailsViewModelCoordinator__loadLastWeekUsageWithUsageBlocks_selectedItemDisplayName_referenceDate_completionHandler___block_invoke;
  v31[3] = &unk_24DB883A0;
  v31[4] = self;
  v32 = v15;
  v33 = v14;
  v34 = v23;
  v35 = v30;
  v25 = v30;
  v26 = v23;
  v27 = v14;
  v28 = v15;
  objc_msgSend(v24, "addOperationWithBlock:", v31);

}

void __128__STUsageDetailsViewModelCoordinator__loadLastWeekUsageWithUsageBlocks_selectedItemDisplayName_referenceDate_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[16];

  +[STUILog usage](STUILog, "usage");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_219AB4000, v2, OS_LOG_TYPE_DEFAULT, "Updating view model with last week's usage", v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLastUpdatedDate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setRawUsageItems:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v3, "setSelectedWeekUsageReport:", *(_QWORD *)(a1 + 56));
  v4 = *(_QWORD *)(a1 + 64);
  if (v4)
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);

}

- (void)_loadLastWeekDeviceActivityForUserWithAltDSID:(id)a3 deviceActivityIdentifier:(id)a4 selectedItemDisplayName:(id)a5 referenceDate:(id)a6 completionHandler:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  STUsageReport *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  STUsageDetailsViewModelCoordinator *v30;
  void *v31;
  STUsageReport *v32;
  void *v33;
  id v34;
  id v35;
  STUsageReport *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  _QWORD v43[5];
  id v44;
  STUsageReport *v45;
  id v46;
  id v47;
  id v48;

  v41 = a7;
  v12 = (void *)MEMORY[0x24BDBCE48];
  v13 = a6;
  v40 = a5;
  v14 = a4;
  v15 = a3;
  objc_msgSend(v12, "currentCalendar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "firstWeekday");
  objc_msgSend(v16, "nextDateAfterDate:matchingUnit:value:options:", v13, 512, v17, 260);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v42, v13);
  v48 = 0;
  +[UsageDetails detailsForUserWithAltDSID:deviceActivityIdentifier:dateInterval:referenceDate:usageContext:error:](_TtC20ScreenTimeSettingsUI12UsageDetails, "detailsForUserWithAltDSID:deviceActivityIdentifier:dateInterval:referenceDate:usageContext:error:", v15, v14, v18, v13, 2, &v48);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v48;
  if (!v19)
  {
    v21 = v16;
    +[STUILog usage](STUILog, "usage");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[STUsageDetailsViewModelCoordinator _loadLastWeekDeviceActivityForUserWithAltDSID:deviceActivityIdentifier:selectedItemDisplayName:referenceDate:completionHandler:].cold.1();

    v16 = v21;
  }
  v38 = (void *)v18;
  v39 = v16;
  v23 = [STUsageReport alloc];
  objc_msgSend(v19, "lastUpdatedDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstPickupByWeekdayByWeek");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", &unk_24DBBED78);
  v26 = v20;
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v17);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "usageItems");
  v30 = self;
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[STUsageReport initWithReportType:startDate:lastUpdatedDate:firstPickup:usageItems:](v23, "initWithReportType:startDate:lastUpdatedDate:firstPickup:usageItems:", 0, v42, v24, v29, v31);

  -[STUsageReport setDisplayName:](v32, "setDisplayName:", v40);
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = __165__STUsageDetailsViewModelCoordinator__loadLastWeekDeviceActivityForUserWithAltDSID_deviceActivityIdentifier_selectedItemDisplayName_referenceDate_completionHandler___block_invoke;
  v43[3] = &unk_24DB883C8;
  v43[4] = v30;
  v44 = v19;
  v46 = v26;
  v47 = v41;
  v45 = v32;
  v34 = v26;
  v35 = v41;
  v36 = v32;
  v37 = v19;
  objc_msgSend(v33, "addOperationWithBlock:", v43);

}

void __165__STUsageDetailsViewModelCoordinator__loadLastWeekDeviceActivityForUserWithAltDSID_deviceActivityIdentifier_selectedItemDisplayName_referenceDate_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[16];

  +[STUILog usage](STUILog, "usage");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_219AB4000, v2, OS_LOG_TYPE_DEFAULT, "Updating view model with last week's device activity", v7, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "lastUpdatedDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLastUpdatedDate:", v4);

  objc_msgSend(*(id *)(a1 + 40), "usageItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRawUsageItems:", v5);

  objc_msgSend(v3, "setSelectedWeekUsageReport:", *(_QWORD *)(a1 + 48));
  v6 = *(_QWORD *)(a1 + 64);
  if (v6)
    (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, *(_QWORD *)(a1 + 56));

}

- (void)_loadAllHistoricalUsageWithUsageBlocks:(id)a3 selectedItemDisplayName:(id)a4 selectedDay:(unint64_t)a5 selectedWeek:(unint64_t)a6 hadUsageData:(BOOL)a7 referenceDate:(id)a8 completionHandler:(id)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v42[4];
  id v43;
  STUsageDetailsViewModelCoordinator *v44;
  id v45;
  id v46;
  id v47;
  _QWORD *v48;
  unint64_t v49;
  _QWORD v50[4];
  id v51;
  STUsageDetailsViewModelCoordinator *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  _QWORD *v61;
  unint64_t v62;
  unint64_t v63;
  BOOL v64;
  _QWORD v65[5];
  id v66;

  v13 = a3;
  v14 = a4;
  v15 = a8;
  v16 = a9;
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x3032000000;
  v65[3] = __Block_byref_object_copy__7;
  v65[4] = __Block_byref_object_dispose__7;
  v66 = 0;
  v39 = (void *)objc_opt_new();
  v17 = (void *)objc_opt_new();
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 4);
  if (a5 == 0x7FFFFFFFFFFFFFFFLL)
    v18 = 0;
  else
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 4);
  v37 = v16;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 4);
  v20 = v14;
  objc_msgSend(v13, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "startDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v50[0] = MEMORY[0x24BDAC760];
  v50[1] = 3221225472;
  v50[2] = __171__STUsageDetailsViewModelCoordinator__loadAllHistoricalUsageWithUsageBlocks_selectedItemDisplayName_selectedDay_selectedWeek_hadUsageData_referenceDate_completionHandler___block_invoke;
  v50[3] = &unk_24DB883F0;
  v62 = a6;
  v64 = a7;
  v36 = v13;
  v51 = v36;
  v52 = self;
  v61 = v65;
  v23 = v17;
  v53 = v23;
  v24 = v15;
  v54 = v24;
  v35 = v20;
  v55 = v35;
  v63 = a5;
  v25 = v39;
  v56 = v25;
  v26 = v22;
  v57 = v26;
  v27 = v38;
  v58 = v27;
  v28 = v18;
  v59 = v28;
  v29 = v19;
  v60 = v29;
  +[STUsageDetailsViewModel _enumerateWeeklyReportStartDatesWithReferenceDate:ascending:block:](STUsageDetailsViewModel, "_enumerateWeeklyReportStartDatesWithReferenceDate:ascending:block:", v24, 0, v50);
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = MEMORY[0x24BDAC760];
  v42[1] = 3221225472;
  v42[2] = __171__STUsageDetailsViewModelCoordinator__loadAllHistoricalUsageWithUsageBlocks_selectedItemDisplayName_selectedDay_selectedWeek_hadUsageData_referenceDate_completionHandler___block_invoke_2;
  v42[3] = &unk_24DB88418;
  v31 = v25;
  v43 = v31;
  v44 = self;
  v48 = v65;
  v32 = v29;
  v45 = v32;
  v33 = v27;
  v46 = v33;
  v49 = a6;
  v34 = v37;
  v47 = v34;
  objc_msgSend(v30, "addOperationWithBlock:", v42);

  _Block_object_dispose(v65, 8);
}

void __171__STUsageDetailsViewModelCoordinator__loadAllHistoricalUsageWithUsageBlocks_selectedItemDisplayName_selectedDay_selectedWeek_hadUsageData_referenceDate_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  BOOL v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id *v20;
  uint64_t v21;
  uint64_t v22;
  id *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id obj;

  v7 = a2;
  v8 = *(_QWORD *)(a1 + 120);
  if (*(_BYTE *)(a1 + 136))
    v9 = 0;
  else
    v9 = a3 == 0;
  if (v9 && v8 == a3)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dateByAddingUnit:value:toDate:options:", 0x2000, -1, v7, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K >= %@"), CFSTR("startDate"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "filteredArrayUsingPredicate:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
    obj = *(id *)(v15 + 40);
    objc_msgSend(*(id *)(a1 + 40), "_usageItemsWithUsageBlocks:lastUpdatedDate:firstPickupByWeekdayByWeek:referenceDate:usageContext:", v14, &obj, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v15 + 40), obj);
    objc_msgSend(*(id *)(a1 + 40), "_updateWeekAndDayReportsWithUsageItems:weekStartDate:lastUpdatedDate:referenceDate:selectedItemDisplayName:isSelectedWeek:selectedDay:weekUsageReports:dayUsageReports:dayUsageReportByWeekdays:firstPickupByWeekdayByWeek:", v16, v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 1, *(_QWORD *)(a1 + 128), 0, 0, 0, *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 72), "addObjectsFromArray:", v16);
    objc_msgSend(*(id *)(a1 + 32), "removeObjectsInArray:", v14);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v18 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(a1 + 40);
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
    v22 = *(_QWORD *)(v19 + 40);
    v20 = (id *)(v19 + 40);
    v21 = v22;
    if (v22)
      v23 = 0;
    else
      v23 = &v28;
    if (!v21)
      v28 = 0;
    objc_msgSend(v17, "_usageItemsWithUsageBlocks:lastUpdatedDate:firstPickupByWeekdayByWeek:referenceDate:usageContext:", v18, v23, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
      objc_storeStrong(v20, v28);
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15E0]), "initWithIndexesInRange:", 0, objc_msgSend(v24, "count"));
    objc_msgSend(*(id *)(a1 + 72), "insertObjects:atIndexes:", v24, v25);
    objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");

  }
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "dateByAddingUnit:value:toDate:options:", 0x2000, 1, v7, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 80), "compare:", v27) == -1)
    objc_msgSend(*(id *)(a1 + 40), "_updateWeekAndDayReportsWithUsageItems:weekStartDate:lastUpdatedDate:referenceDate:selectedItemDisplayName:isSelectedWeek:selectedDay:weekUsageReports:dayUsageReports:dayUsageReportByWeekdays:firstPickupByWeekdayByWeek:", *(_QWORD *)(a1 + 72), v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v8 == a3, *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 48));
  else
    *a4 = 1;

}

void __171__STUsageDetailsViewModelCoordinator__loadAllHistoricalUsageWithUsageBlocks_selectedItemDisplayName_selectedDay_selectedWeek_hadUsageData_referenceDate_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  +[STUILog usage](STUILog, "usage");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    v8 = 134217984;
    v9 = v3;
    _os_log_impl(&dword_219AB4000, v2, OS_LOG_TYPE_DEFAULT, "Updating view model with all historical usage (#items: %lu)", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLastUpdatedDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  objc_msgSend(v4, "setRawUsageItems:", *(_QWORD *)(a1 + 32));
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    objc_msgSend(v4, "setDayUsageReportByWeekdays:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(v4, "setDayUsageReportByWeekdays:", 0);
    objc_msgSend(v4, "setSelectedDayUsageReport:", 0);
  }
  v5 = objc_msgSend(*(id *)(a1 + 56), "count");
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v4, "setWeekUsageReports:", *(_QWORD *)(a1 + 56));
    if (*(_QWORD *)(a1 + 80) >= v6)
      objc_msgSend(v4, "setSelectedWeek:", v6 - 1);
  }
  else
  {
    objc_msgSend(v4, "setWeekUsageReports:", 0);
    objc_msgSend(v4, "setSelectedWeekUsageReport:", 0);
  }
  v7 = *(_QWORD *)(a1 + 64);
  if (v7)
    (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);

}

- (void)_loadAllHistoricalDeviceActivityForUserWithAltDSID:(id)a3 deviceActivityIdentifier:(id)a4 selectedItemDisplayName:(id)a5 selectedDay:(unint64_t)a6 selectedWeek:(unint64_t)a7 hadUsageData:(BOOL)a8 referenceDate:(id)a9 completionHandler:(id)a10
{
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void (**v26)(id, id);
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  STUsageDetailsViewModelCoordinator *v38;
  id v39;
  id v40;
  id v41;
  _QWORD *v42;
  uint64_t *v43;
  unint64_t v44;
  _QWORD v45[4];
  NSObject *v46;
  id v47;
  id v48;
  STUsageDetailsViewModelCoordinator *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  uint64_t *v56;
  _QWORD *v57;
  _QWORD *v58;
  unint64_t v59;
  unint64_t v60;
  BOOL v61;
  id obj;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  _QWORD v69[5];
  id v70;
  _QWORD v71[5];
  id v72;
  _QWORD block[4];
  id v74;
  void (**v75)(id, id);

  v16 = a3;
  v35 = a4;
  v33 = a5;
  v32 = a9;
  v34 = a10;
  v71[0] = 0;
  v71[1] = v71;
  v71[2] = 0x3032000000;
  v71[3] = __Block_byref_object_copy__7;
  v71[4] = __Block_byref_object_dispose__7;
  v72 = 0;
  v69[0] = 0;
  v69[1] = v69;
  v69[2] = 0x3032000000;
  v69[3] = __Block_byref_object_copy__7;
  v69[4] = __Block_byref_object_dispose__7;
  v70 = (id)objc_opt_new();
  v31 = (void *)objc_opt_new();
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 4);
  if (a6 == 0x7FFFFFFFFFFFFFFFLL)
    v29 = 0;
  else
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 4);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 4);
  v63 = 0;
  v64 = &v63;
  v65 = 0x3032000000;
  v66 = __Block_byref_object_copy__7;
  v67 = __Block_byref_object_dispose__7;
  v68 = 0;
  obj = 0;
  v28 = v16;
  +[UsageDetails earliestUsageDateForUserWithAltDSID:deviceActivityIdentifier:error:](_TtC20ScreenTimeSettingsUI12UsageDetails, "earliestUsageDateForUserWithAltDSID:deviceActivityIdentifier:error:", v16, v35, &obj);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v68, obj);
  if (v18)
  {
    v19 = MEMORY[0x24BDAC760];
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __208__STUsageDetailsViewModelCoordinator__loadAllHistoricalDeviceActivityForUserWithAltDSID_deviceActivityIdentifier_selectedItemDisplayName_selectedDay_selectedWeek_hadUsageData_referenceDate_completionHandler___block_invoke;
    v45[3] = &unk_24DB88440;
    v59 = a7;
    v61 = a8;
    v46 = v32;
    v47 = v28;
    v56 = &v63;
    v48 = v35;
    v49 = self;
    v50 = v33;
    v60 = a6;
    v20 = v31;
    v51 = v20;
    v52 = v18;
    v57 = v71;
    v58 = v69;
    v21 = v30;
    v53 = v21;
    v54 = v29;
    v22 = v17;
    v55 = v22;
    +[STUsageDetailsViewModel _enumerateWeeklyReportStartDatesWithReferenceDate:ascending:block:](STUsageDetailsViewModel, "_enumerateWeeklyReportStartDatesWithReferenceDate:ascending:block:", v46, 0, v45);
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v19;
    v36[1] = 3221225472;
    v36[2] = __208__STUsageDetailsViewModelCoordinator__loadAllHistoricalDeviceActivityForUserWithAltDSID_deviceActivityIdentifier_selectedItemDisplayName_selectedDay_selectedWeek_hadUsageData_referenceDate_completionHandler___block_invoke_231;
    v36[3] = &unk_24DB88468;
    v37 = v20;
    v38 = self;
    v42 = v71;
    v39 = v22;
    v40 = v21;
    v44 = a7;
    v41 = v34;
    v43 = &v63;
    objc_msgSend(v23, "addOperationWithBlock:", v36);

    v24 = v46;
  }
  else
  {
    v25 = (void *)v64[5];
    v26 = (void (**)(id, id))v34;
    v27 = v25;
    if (v26)
    {
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        v26[2](v26, v27);
      }
      else
      {
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __STUICallCompletionHandlerOnMainThread_block_invoke_4;
        block[3] = &unk_24DB86C38;
        v75 = v26;
        v74 = v27;
        dispatch_async(MEMORY[0x24BDAC9B8], block);

      }
    }

    +[STUILog usage](STUILog, "usage");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[STUsageDetailsViewModelCoordinator _loadAllHistoricalDeviceActivityForUserWithAltDSID:deviceActivityIdentifier:selectedItemDisplayName:selectedDay:selectedWeek:hadUsageData:referenceDate:completionHandler:].cold.1();
  }

  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(v69, 8);

  _Block_object_dispose(v71, 8);
}

void __208__STUsageDetailsViewModelCoordinator__loadAllHistoricalDeviceActivityForUserWithAltDSID_deviceActivityIdentifier_selectedItemDisplayName_selectedDay_selectedWeek_hadUsageData_referenceDate_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  BOOL v8;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  _BYTE *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  id obj;

  v7 = a2;
  if (*(_BYTE *)(a1 + 152))
    v8 = 0;
  else
    v8 = a3 == 0;
  v46 = *(_QWORD *)(a1 + 136);
  if (v8 && *(_QWORD *)(a1 + 136) == a3)
  {
    v45 = a3;
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dateByAddingUnit:value:toDate:options:", 0x2000, -1, v7, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v11, *(_QWORD *)(a1 + 32));
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 48);
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
    obj = *(id *)(v16 + 40);
    +[UsageDetails detailsForUserWithAltDSID:deviceActivityIdentifier:dateInterval:referenceDate:usageContext:error:](_TtC20ScreenTimeSettingsUI12UsageDetails, "detailsForUserWithAltDSID:deviceActivityIdentifier:dateInterval:referenceDate:usageContext:error:", v13, v14, v12, v15, 0, &obj);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v16 + 40), obj);
    if (!v17)
    {
      +[STUILog usage](STUILog, "usage");
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        __208__STUsageDetailsViewModelCoordinator__loadAllHistoricalDeviceActivityForUserWithAltDSID_deviceActivityIdentifier_selectedItemDisplayName_selectedDay_selectedWeek_hadUsageData_referenceDate_completionHandler___block_invoke_cold_1();

      *a4 = 1;
      goto LABEL_23;
    }
    v42 = *(void **)(a1 + 56);
    objc_msgSend(v17, "usageItems");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lastUpdatedDate");
    v43 = v12;
    v44 = a4;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(_QWORD *)(a1 + 64);
    v22 = *(_QWORD *)(a1 + 144);
    objc_msgSend(v17, "firstPickupByWeekdayByWeek");
    v23 = v7;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "_updateWeekAndDayReportsWithUsageItems:weekStartDate:lastUpdatedDate:referenceDate:selectedItemDisplayName:isSelectedWeek:selectedDay:weekUsageReports:dayUsageReports:dayUsageReportByWeekdays:firstPickupByWeekdayByWeek:", v18, v23, v19, v20, v21, 1, v22, 0, 0, 0, v24);

    v7 = v23;
    a4 = v44;

    a3 = v45;
  }
  if (objc_msgSend(*(id *)(a1 + 72), "count"))
    goto LABEL_14;
  objc_msgSend(*(id *)(a1 + 80), "earlierDate:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v11, *(_QWORD *)(a1 + 32));
  v26 = *(_QWORD *)(a1 + 40);
  v27 = *(_QWORD *)(a1 + 48);
  v28 = *(_QWORD *)(a1 + 32);
  v29 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
  v47 = *(id *)(v29 + 40);
  +[UsageDetails detailsForUserWithAltDSID:deviceActivityIdentifier:dateInterval:referenceDate:usageContext:error:](_TtC20ScreenTimeSettingsUI12UsageDetails, "detailsForUserWithAltDSID:deviceActivityIdentifier:dateInterval:referenceDate:usageContext:error:", v26, v27, v25, v28, 0, &v47);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v29 + 40), v47);
  if (v30)
  {
    objc_msgSend(v30, "lastUpdatedDate");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = *(_QWORD *)(*(_QWORD *)(a1 + 120) + 8);
    v33 = *(void **)(v32 + 40);
    *(_QWORD *)(v32 + 40) = v31;

    objc_msgSend(v30, "firstPickupByWeekdayByWeek");
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = *(_QWORD *)(*(_QWORD *)(a1 + 128) + 8);
    v36 = *(void **)(v35 + 40);
    *(_QWORD *)(v35 + 40) = v34;

    v37 = *(void **)(a1 + 72);
    objc_msgSend(v30, "usageItems");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addObjectsFromArray:", v38);

LABEL_14:
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "dateByAddingUnit:value:toDate:options:", 0x2000, 1, v7, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(*(id *)(a1 + 80), "compare:", v11) == -1)
      objc_msgSend(*(id *)(a1 + 56), "_updateWeekAndDayReportsWithUsageItems:weekStartDate:lastUpdatedDate:referenceDate:selectedItemDisplayName:isSelectedWeek:selectedDay:weekUsageReports:dayUsageReports:dayUsageReportByWeekdays:firstPickupByWeekdayByWeek:", *(_QWORD *)(a1 + 72), v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), v46 == a3, *(_QWORD *)(a1 + 144), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40));
    else
      *a4 = 1;
    goto LABEL_23;
  }
  +[STUILog usage](STUILog, "usage");
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    __208__STUsageDetailsViewModelCoordinator__loadAllHistoricalDeviceActivityForUserWithAltDSID_deviceActivityIdentifier_selectedItemDisplayName_selectedDay_selectedWeek_hadUsageData_referenceDate_completionHandler___block_invoke_cold_2();

  *a4 = 1;
LABEL_23:

}

void __208__STUsageDetailsViewModelCoordinator__loadAllHistoricalDeviceActivityForUserWithAltDSID_deviceActivityIdentifier_selectedItemDisplayName_selectedDay_selectedWeek_hadUsageData_referenceDate_completionHandler___block_invoke_231(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  +[STUILog usage](STUILog, "usage");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    v8 = 134217984;
    v9 = v3;
    _os_log_impl(&dword_219AB4000, v2, OS_LOG_TYPE_DEFAULT, "Updating view model with all historical device activity (#items: %lu)", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLastUpdatedDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  objc_msgSend(v4, "setRawUsageItems:", *(_QWORD *)(a1 + 32));
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    objc_msgSend(v4, "setDayUsageReportByWeekdays:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(v4, "setDayUsageReportByWeekdays:", 0);
    objc_msgSend(v4, "setSelectedDayUsageReport:", 0);
  }
  v5 = objc_msgSend(*(id *)(a1 + 56), "count");
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v4, "setWeekUsageReports:", *(_QWORD *)(a1 + 56));
    if (*(_QWORD *)(a1 + 88) >= v6)
      objc_msgSend(v4, "setSelectedWeek:", v6 - 1);
  }
  else
  {
    objc_msgSend(v4, "setWeekUsageReports:", 0);
    objc_msgSend(v4, "setSelectedWeekUsageReport:", 0);
  }
  v7 = *(_QWORD *)(a1 + 64);
  if (v7)
    (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));

}

- (void)_updateWeekAndDayReportsWithUsageItems:(id)a3 weekStartDate:(id)a4 lastUpdatedDate:(id)a5 referenceDate:(id)a6 selectedItemDisplayName:(id)a7 isSelectedWeek:(BOOL)a8 selectedDay:(unint64_t)a9 weekUsageReports:(id)a10 dayUsageReports:(id)a11 dayUsageReportByWeekdays:(id)a12 firstPickupByWeekdayByWeek:(id)a13
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  STUsageReport *v23;
  id v24;
  id v25;
  void *v26;
  STUsageReport *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  STUsageReport *v46;
  id v48;
  _BOOL4 v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  STUsageDetailsViewModelCoordinator *v60;
  id v61;
  unint64_t v62;
  BOOL v63;
  _QWORD v64[5];
  STUsageReport *v65;

  v49 = a8;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v45 = a6;
  v20 = a7;
  v42 = a11;
  v44 = a13;
  v21 = a12;
  v22 = a10;
  v23 = [STUsageReport alloc];
  v24 = v18;
  v25 = v18;
  v26 = v19;
  v27 = -[STUsageReport initWithReportType:startDate:lastUpdatedDate:firstPickup:usageItems:](v23, "initWithReportType:startDate:lastUpdatedDate:firstPickup:usageItems:", 0, v25, v19, 0, v17);
  v43 = v20;
  -[STUsageReport setDisplayName:](v27, "setDisplayName:", v20);
  objc_msgSend(v22, "addObject:", v27);

  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = MEMORY[0x24BDAC760];
  if (v49)
  {
    v64[0] = MEMORY[0x24BDAC760];
    v64[1] = 3221225472;
    v64[2] = __257__STUsageDetailsViewModelCoordinator__updateWeekAndDayReportsWithUsageItems_weekStartDate_lastUpdatedDate_referenceDate_selectedItemDisplayName_isSelectedWeek_selectedDay_weekUsageReports_dayUsageReports_dayUsageReportByWeekdays_firstPickupByWeekdayByWeek___block_invoke;
    v64[3] = &unk_24DB86588;
    v64[4] = self;
    v65 = v27;
    objc_msgSend(v28, "addOperationWithBlock:", v64);

  }
  v46 = v27;
  if (v21)
    v30 = (void *)objc_opt_new();
  else
    v30 = 0;
  v31 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v24;
  objc_msgSend(v31, "numberWithInteger:", objc_msgSend(v32, "component:fromDate:", 0x2000, v24));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v51[0] = v29;
  v51[1] = 3221225472;
  v51[2] = __257__STUsageDetailsViewModelCoordinator__updateWeekAndDayReportsWithUsageItems_weekStartDate_lastUpdatedDate_referenceDate_selectedItemDisplayName_isSelectedWeek_selectedDay_weekUsageReports_dayUsageReports_dayUsageReportByWeekdays_firstPickupByWeekdayByWeek___block_invoke_2;
  v51[3] = &unk_24DB88490;
  v52 = v45;
  v53 = v26;
  v54 = v44;
  v55 = v33;
  v56 = v17;
  v57 = v43;
  v61 = v30;
  v62 = a9;
  v63 = v49;
  v58 = v42;
  v59 = v28;
  v60 = self;
  v34 = v30;
  v50 = v28;
  v48 = v42;
  v35 = v43;
  v36 = v17;
  v37 = v33;
  v38 = v44;
  v39 = v26;
  v40 = v45;
  +[STUsageDetailsViewModel _enumerateDayReportStartDatesWithStartOfWeek:ascending:block:](STUsageDetailsViewModel, "_enumerateDayReportStartDatesWithStartOfWeek:ascending:block:", v41, 1, v51);
  objc_msgSend(v21, "addObject:", v34);

}

void __257__STUsageDetailsViewModelCoordinator__updateWeekAndDayReportsWithUsageItems_weekStartDate_lastUpdatedDate_referenceDate_selectedItemDisplayName_isSelectedWeek_selectedDay_weekUsageReports_dayUsageReports_dayUsageReportByWeekdays_firstPickupByWeekdayByWeek___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "viewModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSelectedWeekUsageReport:", v1);

}

void __257__STUsageDetailsViewModelCoordinator__updateWeekAndDayReportsWithUsageItems_weekStartDate_lastUpdatedDate_referenceDate_selectedItemDisplayName_isSelectedWeek_selectedDay_weekUsageReports_dayUsageReports_dayUsageReportByWeekdays_firstPickupByWeekdayByWeek___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  STUsageReport *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  STUsageReport *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  uint64_t v18;
  STUsageReport *v19;

  v5 = a2;
  v6 = (void *)MEMORY[0x220731350]();
  if (objc_msgSend(*(id *)(a1 + 32), "compare:", v5) != -1)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [STUsageReport alloc];
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[STUsageReport initWithReportType:startDate:lastUpdatedDate:firstPickup:usageItems:](v8, "initWithReportType:startDate:lastUpdatedDate:firstPickup:usageItems:", 1, v5, v9, v11, *(_QWORD *)(a1 + 64));

    -[STUsageReport setDisplayName:](v12, "setDisplayName:", *(_QWORD *)(a1 + 72));
    if (*(_QWORD *)(a1 + 112) == a3)
    {
      objc_msgSend(*(id *)(a1 + 80), "addObject:", v12);
      if (*(_BYTE *)(a1 + 120))
      {
        v14 = MEMORY[0x24BDAC760];
        v15 = 3221225472;
        v16 = __257__STUsageDetailsViewModelCoordinator__updateWeekAndDayReportsWithUsageItems_weekStartDate_lastUpdatedDate_referenceDate_selectedItemDisplayName_isSelectedWeek_selectedDay_weekUsageReports_dayUsageReports_dayUsageReportByWeekdays_firstPickupByWeekdayByWeek___block_invoke_3;
        v17 = &unk_24DB86588;
        v13 = *(void **)(a1 + 88);
        v18 = *(_QWORD *)(a1 + 96);
        v19 = v12;
        objc_msgSend(v13, "addOperationWithBlock:", &v14);

      }
    }
    objc_msgSend(*(id *)(a1 + 104), "setObject:forKeyedSubscript:", v12, v7, v14, v15, v16, v17, v18);

  }
  objc_autoreleasePoolPop(v6);

}

void __257__STUsageDetailsViewModelCoordinator__updateWeekAndDayReportsWithUsageItems_weekStartDate_lastUpdatedDate_referenceDate_selectedItemDisplayName_isSelectedWeek_selectedDay_weekUsageReports_dayUsageReports_dayUsageReportByWeekdays_firstPickupByWeekdayByWeek___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "viewModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSelectedDayUsageReport:", v1);

}

- (STUsageDetailsViewModel)viewModel
{
  return self->_viewModel;
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)selectedDeviceIdentifier
{
  return self->_selectedDeviceIdentifier;
}

- (NSDate)initialUsageFetchDate
{
  return self->_initialUsageFetchDate;
}

- (void)setInitialUsageFetchDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)organizationIdentifier
{
  return self->_organizationIdentifier;
}

- (void)setOrganizationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)userDSID
{
  return self->_userDSID;
}

- (void)setUserDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)usageContext
{
  return self->_usageContext;
}

- (STPersistenceControllerProtocol)persistenceController
{
  return self->_persistenceController;
}

- (void)setPersistenceController:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceController, a3);
}

- (NSManagedObjectContext)moc
{
  return self->_moc;
}

- (void)setMoc:(id)a3
{
  objc_storeStrong((id *)&self->_moc, a3);
}

- (NSFetchedResultsController)usageFetchedResultsController
{
  return (NSFetchedResultsController *)objc_getProperty(self, a2, 88, 1);
}

- (void)setUsageFetchedResultsController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (STDebouncer)usageChangeDebouncer
{
  return (STDebouncer *)objc_getProperty(self, a2, 96, 1);
}

- (NSDate)lastUsageDataRefreshTime
{
  return self->_lastUsageDataRefreshTime;
}

- (void)setLastUsageDataRefreshTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastUsageDataRefreshTime, a3);
}

- (NSTimer)usageDataRefreshTimer
{
  return self->_usageDataRefreshTimer;
}

- (void)setUsageDataRefreshTimer:(id)a3
{
  objc_storeStrong((id *)&self->_usageDataRefreshTimer, a3);
}

- (NSManagedObjectID)currentUsageRequestObjectID
{
  return self->_currentUsageRequestObjectID;
}

- (void)setCurrentUsageRequestObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_currentUsageRequestObjectID, a3);
}

- (BOOL)isRefreshing
{
  return self->_refreshing;
}

- (void)setRefreshing:(BOOL)a3
{
  self->_refreshing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUsageRequestObjectID, 0);
  objc_storeStrong((id *)&self->_usageDataRefreshTimer, 0);
  objc_storeStrong((id *)&self->_lastUsageDataRefreshTime, 0);
  objc_storeStrong((id *)&self->_usageChangeDebouncer, 0);
  objc_storeStrong((id *)&self->_usageFetchedResultsController, 0);
  objc_storeStrong((id *)&self->_moc, 0);
  objc_storeStrong((id *)&self->_persistenceController, 0);
  objc_storeStrong((id *)&self->_userDSID, 0);
  objc_storeStrong((id *)&self->_organizationIdentifier, 0);
  objc_storeStrong((id *)&self->_initialUsageFetchDate, 0);
  objc_storeStrong((id *)&self->_selectedDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (void)initWithPersistenceController:organizationIdentifier:userDSID:devices:selectedDeviceIdentifier:selectedUsageReportType:usageContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_219AB4000, v0, v1, "Unable to setup fetched results controller for usage blocks: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initForLocalDeviceWithPersistenceController:selectedUsageReportType:usageContext:managedObjectContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_219AB4000, v0, v1, "initForLocalDeviceWithPersistenceController failed to fetch device details from DeviceActivity: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initForLocalDeviceWithPersistenceController:selectedUsageReportType:usageContext:managedObjectContext:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_219AB4000, v0, v1, "initForLocalDeviceWithPersistenceController Failed to fetch local device: %{public}@. Will default to All Devices", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __70__STUsageDetailsViewModelCoordinator__refreshUsageDataWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_219AB4000, v0, v1, "Failed to refresh local device activity data: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __83__STUsageDetailsViewModelCoordinator__refreshLegacyUsageDataWithCompletionHandler___block_invoke_154_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_219AB4000, v0, v1, "Failed to create usage request: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __83__STUsageDetailsViewModelCoordinator__refreshLegacyUsageDataWithCompletionHandler___block_invoke_154_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_219AB4000, v0, v1, "Failed to save usage request: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __60__STUsageDetailsViewModelCoordinator_debouncer_didDebounce___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_219AB4000, v0, v1, "Failed to load usage view model after usage blocks changed: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __73__STUsageDetailsViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_3(&dword_219AB4000, a1, a3, "No users found", a5, a6, a7, a8, 0);
}

void __73__STUsageDetailsViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_3(&dword_219AB4000, a1, a3, "No usage blocks found", a5, a6, a7, a8, 0);
}

void __73__STUsageDetailsViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_4(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0(&dword_219AB4000, v0, v1, "Could not find expected device in ST core data: %@. Empty usage will be shown.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __73__STUsageDetailsViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_4(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_219AB4000, a2, OS_LOG_TYPE_ERROR, "loadViewModel no localDevice found! Setting to first device found %@", v4, 0xCu);

}

void __73__STUsageDetailsViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219AB4000, v0, v1, "More than 1 user found: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_loadTodayDeviceActivityForUserWithAltDSID:deviceActivityIdentifier:selectedItemDisplayName:referenceDate:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_219AB4000, v0, v1, "Failed to fetch toaday's usage details using DeviceActivity: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_loadLastWeekDeviceActivityForUserWithAltDSID:deviceActivityIdentifier:selectedItemDisplayName:referenceDate:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_219AB4000, v0, v1, "Failed to fetch last week's usage details using DeviceActivity: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_loadAllHistoricalDeviceActivityForUserWithAltDSID:deviceActivityIdentifier:selectedItemDisplayName:selectedDay:selectedWeek:hadUsageData:referenceDate:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0(&dword_219AB4000, v0, v1, "Failed to fetch earliest usage date using DeviceActivity: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __208__STUsageDetailsViewModelCoordinator__loadAllHistoricalDeviceActivityForUserWithAltDSID_deviceActivityIdentifier_selectedItemDisplayName_selectedDay_selectedWeek_hadUsageData_referenceDate_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_4(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0(&dword_219AB4000, v0, v1, "Failed to fetch previous week usage details using DeviceActivity: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __208__STUsageDetailsViewModelCoordinator__loadAllHistoricalDeviceActivityForUserWithAltDSID_deviceActivityIdentifier_selectedItemDisplayName_selectedDay_selectedWeek_hadUsageData_referenceDate_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_4(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0(&dword_219AB4000, v0, v1, "Failed to fetch all usage details using DeviceActivity: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
