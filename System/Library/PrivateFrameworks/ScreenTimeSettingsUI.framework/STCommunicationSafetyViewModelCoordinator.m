@implementation STCommunicationSafetyViewModelCoordinator

- (STCommunicationSafetyViewModelCoordinator)initWithPersistenceController:(id)a3 userDSID:(id)a4 modelUpdatedHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  STCommunicationSafetyViewModelCoordinator *v12;
  STCommunicationSafetyViewModelCoordinator *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id modelUpdatedHandler;
  uint64_t v19;
  STCommunicationSafetyViewModel *viewModel;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)STCommunicationSafetyViewModelCoordinator;
  v12 = -[STCommunicationSafetyViewModelCoordinator init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_persistenceController, a3);
    v14 = objc_msgSend(v10, "copy");
    v15 = (void *)v14;
    if (v14)
      v16 = (void *)v14;
    else
      v16 = &unk_24DBBE7C0;
    objc_storeStrong((id *)&v13->_userDSID, v16);

    v17 = _Block_copy(v11);
    modelUpdatedHandler = v13->_modelUpdatedHandler;
    v13->_modelUpdatedHandler = v17;

    v19 = objc_opt_new();
    viewModel = v13->_viewModel;
    v13->_viewModel = (STCommunicationSafetyViewModel *)v19;

    -[STCommunicationSafetyViewModelCoordinator _loadViewModel](v13, "_loadViewModel");
    -[STCommunicationSafetyViewModelCoordinator _registerForPersistentStoreNotifications](v13, "_registerForPersistentStoreNotifications");
  }

  return v13;
}

- (STCommunicationSafetyViewModelCoordinator)initWithPersistenceController:(id)a3 userDSID:(id)a4
{
  return -[STCommunicationSafetyViewModelCoordinator initWithPersistenceController:userDSID:modelUpdatedHandler:](self, "initWithPersistenceController:userDSID:modelUpdatedHandler:", a3, a4, 0);
}

- (void)_registerForPersistentStoreNotifications
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BE845A8];
  objc_msgSend(MEMORY[0x24BE84568], "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestWithFetchRequest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x24BE845B0]);
  -[STCommunicationSafetyViewModelCoordinator persistenceController](self, "persistenceController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithContext:resultsRequests:", v8, v9);

  objc_msgSend(v10, "setDelegate:", self);
  -[STCommunicationSafetyViewModelCoordinator setFetchedResultsController:](self, "setFetchedResultsController:", v10);

}

- (void)_loadViewModel
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "userDSID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_219AB4000, v2, v3, "Loading viewModel for userDSID %{public}@...", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

void __59__STCommunicationSafetyViewModelCoordinator__loadViewModel__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  char v12;
  char v13;
  char v14;
  char v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  _QWORD block[4];
  id v32;
  id v33;
  char v34;
  char v35;
  char v36;
  char v37;
  id v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = (id *)(a1 + 32);
  objc_msgSend(v5, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v4, "userObjectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *v4;
  if (v7)
  {
    objc_msgSend(v8, "userObjectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectWithID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = 0;
    if (v10)
    {
LABEL_3:
      v12 = objc_msgSend(v10, "isCommunicationSafetyReceivingRestricted", v3);
      v13 = objc_msgSend(v10, "isCommunicationSafetySendingRestricted");
      v14 = objc_msgSend(v10, "isCommunicationSafetyNotificationEnabled");
      v15 = objc_msgSend(v10, "isCommunicationSafetyAnalyticsEnabled");
      +[STUILog communicationSafety](STUILog, "communicationSafety");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        __59__STCommunicationSafetyViewModelCoordinator__loadViewModel__block_invoke_cold_6();

      +[STUILog communicationSafety](STUILog, "communicationSafety");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        __59__STCommunicationSafetyViewModelCoordinator__loadViewModel__block_invoke_cold_5();

      +[STUILog communicationSafety](STUILog, "communicationSafety");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        __59__STCommunicationSafetyViewModelCoordinator__loadViewModel__block_invoke_cold_4();

      +[STUILog communicationSafety](STUILog, "communicationSafety");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        __59__STCommunicationSafetyViewModelCoordinator__loadViewModel__block_invoke_cold_3();

      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __59__STCommunicationSafetyViewModelCoordinator__loadViewModel__block_invoke_44;
      block[3] = &unk_24DB86D68;
      v20 = v6;
      v34 = v12;
      v35 = v13;
      v36 = v14;
      v37 = v15;
      v21 = *v4;
      v32 = v20;
      v33 = v21;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      v22 = v32;
      v3 = v30;
      goto LABEL_20;
    }
    goto LABEL_14;
  }
  objc_msgSend(v8, "userDSID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE84570], "fetchRequestForUsersWithDSID:", v10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  objc_msgSend(v22, "execute:", &v38);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v38;
  if (v23)
  {
    objc_msgSend(v23, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v4, "setUserObjectID:", v25);

    v10 = v24;
    if (v24)
      goto LABEL_3;
LABEL_14:
    +[STUILog communicationSafety](STUILog, "communicationSafety");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      __59__STCommunicationSafetyViewModelCoordinator__loadViewModel__block_invoke_cold_2(v4, v26);

    v27 = (void *)MEMORY[0x24BDD1540];
    v28 = *MEMORY[0x24BE84710];
    v39 = *MEMORY[0x24BDD0FC8];
    v40[0] = CFSTR("user could not be found");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", v28, 11, v10);
    v22 = v11;
    v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  +[STUILog communicationSafety](STUILog, "communicationSafety");
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
    __59__STCommunicationSafetyViewModelCoordinator__loadViewModel__block_invoke_cold_1();

LABEL_20:
}

void __59__STCommunicationSafetyViewModelCoordinator__loadViewModel__block_invoke_44(uint64_t a1)
{
  void (**v2)(void);
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "setIsCommunicationSafetyReceivingRestricted:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setIsCommunicationSafetySendingRestricted:", *(unsigned __int8 *)(a1 + 49));
  objc_msgSend(*(id *)(a1 + 32), "setIsCommunicationSafetyNotificationEnabled:", *(unsigned __int8 *)(a1 + 50));
  objc_msgSend(*(id *)(a1 + 32), "setIsCommunicationSafetyAnalyticsEnabled:", *(unsigned __int8 *)(a1 + 51));
  objc_msgSend(*(id *)(a1 + 40), "modelUpdatedHandler");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    v2[2]();
    v2 = v3;
  }

}

- (void)persistCommunicationSafetySettingsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[STCommunicationSafetyViewModelCoordinator persistenceController](self, "persistenceController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __101__STCommunicationSafetyViewModelCoordinator_persistCommunicationSafetySettingsWithCompletionHandler___block_invoke;
  v7[3] = &unk_24DB86DE0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBackgroundTaskAndWait:", v7);

}

void __101__STCommunicationSafetyViewModelCoordinator_persistCommunicationSafetySettingsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  char v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "userObjectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "userObjectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectWithID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setIsCommunicationSafetyReceivingRestricted:", objc_msgSend(v4, "isCommunicationSafetyReceivingRestricted"));
    objc_msgSend(v7, "setIsCommunicationSafetySendingRestricted:", objc_msgSend(v4, "isCommunicationSafetySendingRestricted"));
    objc_msgSend(v7, "setIsCommunicationSafetyNotificationEnabled:", objc_msgSend(v4, "isCommunicationSafetyNotificationEnabled"));
    objc_msgSend(v7, "setIsCommunicationSafetyAnalyticsEnabled:", objc_msgSend(v4, "isCommunicationSafetyAnalyticsEnabled"));
    if ((_os_feature_enabled_impl() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BE84498], "sharedController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "saveContext:error:", v3, 0);

      v9 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "persistenceController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      v12 = objc_msgSend(v11, "saveContext:error:", v3, &v21);
      v9 = v21;

      if ((v12 & 1) == 0)
      {
        +[STUILog communicationSafety](STUILog, "communicationSafety");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          __101__STCommunicationSafetyViewModelCoordinator_persistCommunicationSafetySettingsWithCompletionHandler___block_invoke_cold_2();

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_reportCoreAnalyticsEventCommunicationSafetyEnabled:", objc_msgSend(v4, "isCommunicationSafetyReceivingRestricted"));
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __101__STCommunicationSafetyViewModelCoordinator_persistCommunicationSafetySettingsWithCompletionHandler___block_invoke_50;
    block[3] = &unk_24DB86C38;
    v14 = *(id *)(a1 + 40);
    v19 = v9;
    v20 = v14;
    v15 = v9;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    +[STUILog communicationSafety](STUILog, "communicationSafety");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      __101__STCommunicationSafetyViewModelCoordinator_persistCommunicationSafetySettingsWithCompletionHandler___block_invoke_cold_1(v10);

    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __101__STCommunicationSafetyViewModelCoordinator_persistCommunicationSafetySettingsWithCompletionHandler___block_invoke_51;
    v16[3] = &unk_24DB86DB8;
    v17 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x24BDAC9B8], v16);
    v7 = v17;
  }

}

uint64_t __101__STCommunicationSafetyViewModelCoordinator_persistCommunicationSafetySettingsWithCompletionHandler___block_invoke_50(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __101__STCommunicationSafetyViewModelCoordinator_persistCommunicationSafetySettingsWithCompletionHandler___block_invoke_51(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)saveCommunicationSafetyReceivingRestricted:(BOOL)a3 communicationSafetySendingRestricted:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  BOOL v13;
  BOOL v14;

  v8 = a5;
  -[STCommunicationSafetyViewModelCoordinator persistenceController](self, "persistenceController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __143__STCommunicationSafetyViewModelCoordinator_saveCommunicationSafetyReceivingRestricted_communicationSafetySendingRestricted_completionHandler___block_invoke;
  v11[3] = &unk_24DB86E08;
  v13 = a3;
  v14 = a4;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "performBackgroundTaskAndWait:", v11);

}

void __143__STCommunicationSafetyViewModelCoordinator_saveCommunicationSafetyReceivingRestricted_communicationSafetySendingRestricted_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "userObjectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "userObjectID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectWithID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setIsCommunicationSafetyReceivingRestricted:", *(unsigned __int8 *)(a1 + 48));
    objc_msgSend(v6, "setIsCommunicationSafetySendingRestricted:", *(unsigned __int8 *)(a1 + 49));
    if ((_os_feature_enabled_impl() & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "persistenceController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      v10 = objc_msgSend(v9, "saveContext:error:", v3, &v17);
      v7 = v17;

      if ((v10 & 1) == 0)
      {
        +[STUILog communicationSafety](STUILog, "communicationSafety");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          __101__STCommunicationSafetyViewModelCoordinator_persistCommunicationSafetySettingsWithCompletionHandler___block_invoke_cold_2();

      }
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE84498], "sharedController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "saveContext:error:", v3, 0);

    v7 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "_reportCoreAnalyticsEventCommunicationSafetyEnabled:", *(unsigned __int8 *)(a1 + 48));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __143__STCommunicationSafetyViewModelCoordinator_saveCommunicationSafetyReceivingRestricted_communicationSafetySendingRestricted_completionHandler___block_invoke_52;
  block[3] = &unk_24DB86C38;
  v12 = *(id *)(a1 + 40);
  v15 = v7;
  v16 = v12;
  v13 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __143__STCommunicationSafetyViewModelCoordinator_saveCommunicationSafetyReceivingRestricted_communicationSafetySendingRestricted_completionHandler___block_invoke_52(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_reportCoreAnalyticsEventCommunicationSafetyEnabled:(BOOL)a3
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE84538]), "initWithCommunicationSafetyEnabled:", a3);
  objc_msgSend(MEMORY[0x24BE84558], "reportEvent:", v3);

}

- (STCommunicationSafetyViewModel)viewModel
{
  return (STCommunicationSafetyViewModel *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)userDSID
{
  return self->_userDSID;
}

- (void)setUserDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (STPersistenceControllerProtocol)persistenceController
{
  return self->_persistenceController;
}

- (NSManagedObjectID)userObjectID
{
  return self->_userObjectID;
}

- (void)setUserObjectID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (STGroupFetchedResultsController)fetchedResultsController
{
  return self->_fetchedResultsController;
}

- (void)setFetchedResultsController:(id)a3
{
  objc_storeStrong((id *)&self->_fetchedResultsController, a3);
}

- (id)modelUpdatedHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setModelUpdatedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_modelUpdatedHandler, 0);
  objc_storeStrong((id *)&self->_fetchedResultsController, 0);
  objc_storeStrong((id *)&self->_userObjectID, 0);
  objc_storeStrong((id *)&self->_persistenceController, 0);
  objc_storeStrong((id *)&self->_userDSID, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

void __59__STCommunicationSafetyViewModelCoordinator__loadViewModel__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  v3 = 2114;
  v4 = v0;
  _os_log_fault_impl(&dword_219AB4000, v1, OS_LOG_TYPE_FAULT, "failed to fetch user with DSID %{public}@: %{public}@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __59__STCommunicationSafetyViewModelCoordinator__loadViewModel__block_invoke_cold_2(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "userDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_219AB4000, a2, v4, "user with DSID could not be found: %{public}@", v5);

  OUTLINED_FUNCTION_4();
}

void __59__STCommunicationSafetyViewModelCoordinator__loadViewModel__block_invoke_cold_3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_4_0(MEMORY[0x24BDD16E0]), "numberWithBool:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_219AB4000, v1, v2, "Copied isCommunicationSafetyAnalyticsEnabled from DB to viewModel: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4();
}

void __59__STCommunicationSafetyViewModelCoordinator__loadViewModel__block_invoke_cold_4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_4_0(MEMORY[0x24BDD16E0]), "numberWithBool:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_219AB4000, v1, v2, "Copied isCommunicationSafetyNotificationEnabled from DB to viewModel: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4();
}

void __59__STCommunicationSafetyViewModelCoordinator__loadViewModel__block_invoke_cold_5()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_4_0(MEMORY[0x24BDD16E0]), "numberWithBool:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_219AB4000, v1, v2, "Copied isCommunicationSafetySendingRestricted from DB to viewModel: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4();
}

void __59__STCommunicationSafetyViewModelCoordinator__loadViewModel__block_invoke_cold_6()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_4_0(MEMORY[0x24BDD16E0]), "numberWithBool:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_219AB4000, v1, v2, "Copied isCommunicationSafetyReceivingRestricted from DB to viewModel: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4();
}

void __101__STCommunicationSafetyViewModelCoordinator_persistCommunicationSafetySettingsWithCompletionHandler___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_219AB4000, log, OS_LOG_TYPE_FAULT, "Communication Safety View Model has no userObjectID. Nothing will be saved.", v1, 2u);
}

void __101__STCommunicationSafetyViewModelCoordinator_persistCommunicationSafetySettingsWithCompletionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_219AB4000, v0, v1, "Failed to save Communication Safety settings: %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

@end
