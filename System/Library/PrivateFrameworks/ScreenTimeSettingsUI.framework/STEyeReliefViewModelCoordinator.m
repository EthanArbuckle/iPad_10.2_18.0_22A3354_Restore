@implementation STEyeReliefViewModelCoordinator

- (STEyeReliefViewModelCoordinator)initWithPersistenceController:(id)a3 userDSID:(id)a4
{
  STPersistenceControllerProtocol *v6;
  id v7;
  STEyeReliefViewModelCoordinator *v8;
  STPersistenceControllerProtocol *persistenceController;
  STPersistenceControllerProtocol *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  STEyeReliefViewModel *viewModel;
  void *v15;
  void *v16;
  STEyeReliefViewModelCoordinator *v17;
  _QWORD v19[4];
  STEyeReliefViewModelCoordinator *v20;
  objc_super v21;

  v6 = (STPersistenceControllerProtocol *)a3;
  v21.receiver = self;
  v21.super_class = (Class)STEyeReliefViewModelCoordinator;
  v7 = a4;
  v8 = -[STEyeReliefViewModelCoordinator init](&v21, sel_init);
  persistenceController = v8->_persistenceController;
  v8->_persistenceController = v6;
  v10 = v6;

  v11 = (void *)objc_msgSend(v7, "copy");
  if (v11)
    v12 = v11;
  else
    v12 = &unk_24DBBED18;
  objc_storeStrong((id *)&v8->_userDSID, v12);

  v13 = objc_opt_new();
  viewModel = v8->_viewModel;
  v8->_viewModel = (STEyeReliefViewModel *)v13;

  -[STEyeReliefViewModelCoordinator persistenceController](v8, "persistenceController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "viewContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __74__STEyeReliefViewModelCoordinator_initWithPersistenceController_userDSID___block_invoke;
  v19[3] = &unk_24DB86440;
  v17 = v8;
  v20 = v17;
  objc_msgSend(v16, "performBlockAndWait:", v19);

  -[STEyeReliefViewModelCoordinator _registerForPersistentStoreNotifications](v17, "_registerForPersistentStoreNotifications");
  return v17;
}

void __74__STEyeReliefViewModelCoordinator_initWithPersistenceController_userDSID___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "persistenceController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_loadViewModelWithContext:", v2);

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
  -[STEyeReliefViewModelCoordinator persistenceController](self, "persistenceController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithContext:resultsRequests:", v8, v9);

  objc_msgSend(v10, "setDelegate:", self);
  -[STEyeReliefViewModelCoordinator setFetchedResultsController:](self, "setFetchedResultsController:", v10);

}

- (void)_loadViewModel
{
  void *v3;
  _QWORD v4[5];

  -[STEyeReliefViewModelCoordinator persistenceController](self, "persistenceController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__STEyeReliefViewModelCoordinator__loadViewModel__block_invoke;
  v4[3] = &unk_24DB86D90;
  v4[4] = self;
  objc_msgSend(v3, "performBackgroundTask:", v4);

}

uint64_t __49__STEyeReliefViewModelCoordinator__loadViewModel__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadViewModelWithContext:", a2);
}

- (void)_loadViewModelWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  _QWORD *v27;
  _QWORD v28[2];
  uint64_t (*v29)(uint64_t);
  void *v30;
  NSObject *v31;
  char v32;
  id v33;
  uint64_t v34;
  const __CFString *v35;
  __int128 buf;
  uint64_t (*v37)(uint64_t);
  void *v38;
  id v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[STUILog eyeRelief](STUILog, "eyeRelief");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[STEyeReliefViewModelCoordinator userDSID](self, "userDSID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_219AB4000, v5, OS_LOG_TYPE_DEFAULT, "Loading EyeRelief viewModel for userDSID %{public}@...", (uint8_t *)&buf, 0xCu);

  }
  -[STEyeReliefViewModelCoordinator viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STEyeReliefViewModelCoordinator userDSID](self, "userDSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STEyeReliefViewModelCoordinator userObjectID](self, "userObjectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v4, "objectWithID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    if (v10)
    {
LABEL_5:
      v12 = objc_msgSend(v10, "isEyeReliefEnabled");
      +[STUILog eyeRelief](STUILog, "eyeRelief");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v14;
        _os_log_impl(&dword_219AB4000, v13, OS_LOG_TYPE_DEFAULT, "Copied isEyeReliefEnabled from DM to viewModel: %{public}@", (uint8_t *)&buf, 0xCu);

      }
      v15 = MEMORY[0x24BDAC760];
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v29 = __61__STEyeReliefViewModelCoordinator__loadViewModelWithContext___block_invoke;
      v30 = &unk_24DB86B58;
      v31 = v7;
      v32 = v12;
      v16 = v28;
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        ((void (*)(_QWORD *, _QWORD))v29)(v16, 0);
      }
      else
      {
        *(_QWORD *)&buf = v15;
        *((_QWORD *)&buf + 1) = 3221225472;
        v37 = __STUICallCompletionHandlerOnMainThread_block_invoke_3;
        v38 = &unk_24DB86C38;
        v27 = v16;
        v39 = 0;
        v40 = v27;
        dispatch_async(MEMORY[0x24BDAC9B8], &buf);

      }
      v26 = v31;
      goto LABEL_16;
    }
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BE84570], "fetchRequestForUsersWithDSID:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  objc_msgSend(v10, "execute:", &v33);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v33;
  if (v17)
  {
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectID");
    v19 = v7;
    v20 = v8;
    v21 = v4;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[STEyeReliefViewModelCoordinator setUserObjectID:](self, "setUserObjectID:", v22);

    v4 = v21;
    v8 = v20;
    v7 = v19;

    v10 = v18;
    if (v18)
      goto LABEL_5;
LABEL_11:
    +[STUILog eyeRelief](STUILog, "eyeRelief");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      -[STEyeReliefViewModelCoordinator _loadViewModelWithContext:].cold.2();

    v24 = (void *)MEMORY[0x24BDD1540];
    v25 = *MEMORY[0x24BE84710];
    v34 = *MEMORY[0x24BDD0FC8];
    v35 = CFSTR("user could not be found");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 11, v10);
    v26 = v11;
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  +[STUILog eyeRelief](STUILog, "eyeRelief");
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    -[STEyeReliefViewModelCoordinator _loadViewModelWithContext:].cold.1();
LABEL_16:

}

uint64_t __61__STEyeReliefViewModelCoordinator__loadViewModelWithContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsEyeReliefEnabled:", *(unsigned __int8 *)(a1 + 40));
}

- (void)persistEyeReliefState:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x24BDAC8D0];
  +[STUILog eyeRelief](STUILog, "eyeRelief");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_219AB4000, v5, OS_LOG_TYPE_DEFAULT, "Setting Eye Distance on viewModel: %{public}@", (uint8_t *)&v7, 0xCu);

  }
  -[STEyeReliefViewModelCoordinator persistEyeReliefState:withCompletionHandler:](self, "persistEyeReliefState:withCompletionHandler:", v3, &__block_literal_global_23);
}

void __57__STEyeReliefViewModelCoordinator_persistEyeReliefState___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    +[STUILog eyeRelief](STUILog, "eyeRelief");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __57__STEyeReliefViewModelCoordinator_persistEyeReliefState___block_invoke_cold_1();

  }
}

- (void)persistEyeReliefState:(BOOL)a3 withCompletionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  BOOL v11;

  v6 = a4;
  -[STEyeReliefViewModelCoordinator persistenceController](self, "persistenceController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __79__STEyeReliefViewModelCoordinator_persistEyeReliefState_withCompletionHandler___block_invoke;
  v9[3] = &unk_24DB87078;
  v11 = a3;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "performBackgroundTaskAndWait:", v9);

}

void __79__STEyeReliefViewModelCoordinator_persistEyeReliefState_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "userObjectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectWithID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setIsEyeReliefEnabled:", *(unsigned __int8 *)(a1 + 48));
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "persistenceController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v8 = objc_msgSend(v7, "saveContext:error:", v3, &v19);
    v6 = v19;

    if ((v8 & 1) == 0)
    {
      +[STUILog eyeRelief](STUILog, "eyeRelief");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        __79__STEyeReliefViewModelCoordinator_persistEyeReliefState_withCompletionHandler___block_invoke_cold_1();

    }
  }
  v10 = (void *)MEMORY[0x24BE84558];
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84598]), "initWithEyeReliefEnabled:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(v10, "reportEvent:", v11);

  +[STUILog eyeRelief](STUILog, "eyeRelief");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_msgSend(v5, "isEyeReliefEnabled");
    *(_DWORD *)buf = 67240192;
    v21 = v13;
    _os_log_impl(&dword_219AB4000, v12, OS_LOG_TYPE_DEFAULT, "Successfully saved Eye Relief state: %{public}d", buf, 8u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__STEyeReliefViewModelCoordinator_persistEyeReliefState_withCompletionHandler___block_invoke_47;
  block[3] = &unk_24DB86C38;
  v14 = *(id *)(a1 + 40);
  v17 = v6;
  v18 = v14;
  v15 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __79__STEyeReliefViewModelCoordinator_persistEyeReliefState_withCompletionHandler___block_invoke_47(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (STEyeReliefViewModel)viewModel
{
  return (STEyeReliefViewModel *)objc_getProperty(self, a2, 8, 1);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchedResultsController, 0);
  objc_storeStrong((id *)&self->_userObjectID, 0);
  objc_storeStrong((id *)&self->_persistenceController, 0);
  objc_storeStrong((id *)&self->_userDSID, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (void)_loadViewModelWithContext:.cold.1()
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
  _os_log_fault_impl(&dword_219AB4000, v1, OS_LOG_TYPE_FAULT, "Failed to fetch user with DSID %{public}@:%{public}@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)_loadViewModelWithContext:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219AB4000, v0, v1, "User with DSID could not be found: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __57__STEyeReliefViewModelCoordinator_persistEyeReliefState___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_219AB4000, v0, OS_LOG_TYPE_ERROR, "Could not save Eye Relief setting: %{public}@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __79__STEyeReliefViewModelCoordinator_persistEyeReliefState_withCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219AB4000, v0, v1, "Failed to save Eye Relief state: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
