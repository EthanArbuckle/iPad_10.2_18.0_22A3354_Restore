@implementation STTimeAllowancesViewModelCoordinator

- (STTimeAllowancesViewModelCoordinator)initWithPersistenceController:(id)a3 userDSID:(id)a4
{
  id v7;
  id v8;
  STTimeAllowancesViewModelCoordinator *v9;
  STTimeAllowancesViewModelCoordinator *v10;
  uint64_t v11;
  STAskForTimeClient *askForTimeClient;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  STTimeAllowancesViewModel *viewModel;
  STTimeAllowancesViewModelCoordinator *v18;
  _QWORD v20[4];
  STTimeAllowancesViewModelCoordinator *v21;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)STTimeAllowancesViewModelCoordinator;
  v9 = -[STTimeAllowancesViewModelCoordinator init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_persistenceController, a3);
    v11 = objc_opt_new();
    askForTimeClient = v10->_askForTimeClient;
    v10->_askForTimeClient = (STAskForTimeClient *)v11;

    v13 = objc_msgSend(v8, "copy");
    v14 = (void *)v13;
    if (v13)
      v15 = (void *)v13;
    else
      v15 = &unk_24DBBED00;
    objc_storeStrong((id *)&v10->_userDSID, v15);

    v16 = objc_opt_new();
    viewModel = v10->_viewModel;
    v10->_viewModel = (STTimeAllowancesViewModel *)v16;

    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __79__STTimeAllowancesViewModelCoordinator_initWithPersistenceController_userDSID___block_invoke;
    v20[3] = &unk_24DB866E0;
    v18 = v10;
    v21 = v18;
    -[STTimeAllowancesViewModelCoordinator loadViewModelWithCompletionHandler:](v18, "loadViewModelWithCompletionHandler:", v20);
    -[STTimeAllowancesViewModelCoordinator _registerForPersistentStoreNotifications](v18, "_registerForPersistentStoreNotifications");

  }
  return v10;
}

uint64_t __79__STTimeAllowancesViewModelCoordinator_initWithPersistenceController_userDSID___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "saveDefaultAlwaysAllowListWithCompletionHandler:", 0);
  return result;
}

- (void)saveDefaultAlwaysAllowListWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[16];

  v4 = a3;
  -[STTimeAllowancesViewModelCoordinator viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alwaysAllowList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    +[STUILog persistence](STUILog, "persistence");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219AB4000, v7, OS_LOG_TYPE_DEFAULT, "Always Allow list does not exist. Saving default Always Allow list.", buf, 2u);
    }

    -[STTimeAllowancesViewModelCoordinator userDSID](self, "userDSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[STTimeAllowancesViewModelCoordinator persistenceController](self, "persistenceController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __88__STTimeAllowancesViewModelCoordinator_saveDefaultAlwaysAllowListWithCompletionHandler___block_invoke;
    v11[3] = &unk_24DB86DE0;
    v12 = v8;
    v13 = v4;
    v10 = v8;
    objc_msgSend(v9, "performBackgroundTask:", v11);

  }
}

void __88__STTimeAllowancesViewModelCoordinator_saveDefaultAlwaysAllowListWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void (**v5)(id, id);
  id v6;
  int v7;
  id v8;
  void *v9;
  void (**v10)(id, _QWORD);
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void (**v17)(id, id);
  id v18;
  id v19;
  uint64_t block;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  id v24;
  void (**v25)(id, id);
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v19 = 0;
    objc_msgSend(MEMORY[0x24BE84570], "fetchUserWithDSID:inContext:error:", v4, v3, &v19);
    v5 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
    v6 = v19;
    if (v5)
    {
      v18 = v6;
      v7 = objc_msgSend(MEMORY[0x24BE84510], "saveDefaultAlwaysAllowListIfNecessaryForUser:error:", v5, &v18);
      v8 = v18;

      v9 = *(void **)(a1 + 40);
      if (v7)
      {
        v10 = v9;
        if (v10)
        {
          if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
          {
            v10[2](v10, 0);
          }
          else
          {
            block = MEMORY[0x24BDAC760];
            v21 = 3221225472;
            v22 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
            v23 = &unk_24DB86C38;
            v17 = v10;
            v24 = 0;
            v25 = v17;
            dispatch_async(MEMORY[0x24BDAC9B8], &block);

          }
        }
      }
      else
      {
        v10 = v9;
        v8 = v8;
        if (v10)
        {
          if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
          {
            ((void (**)(id, id))v10)[2](v10, v8);
          }
          else
          {
            block = MEMORY[0x24BDAC760];
            v21 = 3221225472;
            v22 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
            v23 = &unk_24DB86C38;
            v25 = v10;
            v24 = v8;
            dispatch_async(MEMORY[0x24BDAC9B8], &block);

          }
        }

      }
      goto LABEL_25;
    }
    +[STUILog persistence](STUILog, "persistence");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      __88__STTimeAllowancesViewModelCoordinator_saveDefaultAlwaysAllowListWithCompletionHandler___block_invoke_cold_2();

  }
  else
  {
    v6 = 0;
  }
  +[STUILog persistence](STUILog, "persistence");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    __88__STTimeAllowancesViewModelCoordinator_saveDefaultAlwaysAllowListWithCompletionHandler___block_invoke_cold_1();

  v13 = (void *)MEMORY[0x24BDD1540];
  v14 = *MEMORY[0x24BE84710];
  v26 = *MEMORY[0x24BDD0FC8];
  v27[0] = CFSTR("user could not be found");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 11, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void (**)(id, id))*(id *)(a1 + 40);
  v8 = v16;
  if (v5)
  {
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      v5[2](v5, v8);
    }
    else
    {
      block = MEMORY[0x24BDAC760];
      v21 = 3221225472;
      v22 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
      v23 = &unk_24DB86C38;
      v25 = v5;
      v24 = v8;
      dispatch_async(MEMORY[0x24BDAC9B8], &block);

    }
  }

LABEL_25:
}

- (void)_registerForPersistentStoreNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  STGroupFetchedResultsController *v12;
  STGroupFetchedResultsController *groupFetchResultsController;
  id v14;

  v3 = (void *)MEMORY[0x24BE84510];
  -[STTimeAllowancesViewModelCoordinator userDSID](self, "userDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchResultsRequestsForChangesToBlueprintsForUserWithDSID:", v4);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BE845A8];
  objc_msgSend(MEMORY[0x24BE844F8], "fetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestWithFetchRequest:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x24BE845B0]);
  objc_msgSend(v14, "arrayByAddingObject:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STTimeAllowancesViewModelCoordinator persistenceController](self, "persistenceController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (STGroupFetchedResultsController *)objc_msgSend(v8, "initWithResultsRequests:cacheName:managedObjectContext:", v9, 0, v11);
  groupFetchResultsController = self->_groupFetchResultsController;
  self->_groupFetchResultsController = v12;

  -[STGroupFetchedResultsController setDelegate:](self->_groupFetchResultsController, "setDelegate:", self);
}

- (void)groupResultsController:(id)a3 didChangeResultsForRequest:(id)a4 objectID:(id)a5 changeType:(unint64_t)a6
{
  -[STTimeAllowancesViewModelCoordinator loadViewModelWithCompletionHandler:](self, "loadViewModelWithCompletionHandler:", &__block_literal_global_19, a4, a5, a6);
}

- (void)loadViewModelWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  STTimeAllowancesViewModelCoordinator *v13;
  id v14;
  id v15;
  _QWORD *v16;
  id v17;
  id location;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  -[STTimeAllowancesViewModelCoordinator viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STTimeAllowancesViewModelCoordinator userDSID](self, "userDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__6;
  v19[4] = __Block_byref_object_dispose__6;
  -[STTimeAllowancesViewModelCoordinator userObjectID](self, "userObjectID");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[STTimeAllowancesViewModelCoordinator persistenceController](self, "persistenceController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke;
  v11[3] = &unk_24DB87F00;
  v16 = v19;
  v8 = v6;
  v12 = v8;
  v9 = v4;
  v15 = v9;
  v13 = self;
  v10 = v5;
  v14 = v10;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v7, "performBackgroundTask:", v11);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(v19, 8);

}

void __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void (**v21)(id, id);
  id v22;
  NSObject *v23;
  void (**v24)(id, id);
  NSObject *v25;
  void (**v26)(id, id);
  void *v27;
  id v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  _BOOL4 v35;
  STAllowance *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void (**v47)(id, id);
  NSObject *v48;
  void (**v49)(id, id);
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t j;
  STUIAskForTimeRequestResponse *v61;
  void *v62;
  void *v63;
  char v64;
  id v65;
  id v66;
  void *v67;
  char v68;
  NSObject *v69;
  NSObject *v70;
  void (**v71)(id, id);
  __int128 v72;
  int v73;
  id v74;
  STAlwaysAllowList *v75;
  STDeviceBedtime *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  id v83;
  _QWORD v84[4];
  id v85;
  STDeviceBedtime *v86;
  id v87;
  STAlwaysAllowList *v88;
  id v89;
  uint64_t v90;
  __int128 v91;
  id v92;
  char v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  id v98;
  id v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  id v104;
  id v105;
  id v106;
  uint64_t block;
  uint64_t v108;
  uint64_t (*v109)(uint64_t);
  void *v110;
  id v111;
  void (**v112)(id, id);
  _BYTE v113[128];
  uint8_t v114[4];
  uint64_t v115;
  _BYTE v116[128];
  uint64_t v117;
  _QWORD v118[4];

  v118[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v79 = v3;
  v80 = a1;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    objc_msgSend(v3, "objectWithID:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    v5 = 0;
    if (v4)
      goto LABEL_6;
LABEL_12:
    +[STUILog persistence](STUILog, "persistence");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_2();

    v18 = (void *)MEMORY[0x24BDD1540];
    v117 = *MEMORY[0x24BDD0FC8];
    v118[0] = CFSTR("user could not be found");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v118, &v117, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", *MEMORY[0x24BE84710], 11, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void (**)(id, id))*(id *)(v80 + 56);
    v22 = v20;
    if (v21)
    {
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        v21[2](v21, v22);
      }
      else
      {
        block = MEMORY[0x24BDAC760];
        v108 = 3221225472;
        v109 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
        v110 = &unk_24DB86C38;
        v112 = v21;
        v111 = v22;
        dispatch_async(MEMORY[0x24BDAC9B8], &block);

      }
    }

    goto LABEL_95;
  }
  v10 = v4;
  objc_msgSend(MEMORY[0x24BE84570], "fetchRequestForUsersWithDSID:", *(_QWORD *)(a1 + 32));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = 0;
  objc_msgSend(v11, "execute:", &v106);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v106;
  if (v12)
  {
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "objectID");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(v80 + 64) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    v4 = v13;
    if (v13)
    {
LABEL_6:
      v77 = v4;
      objc_msgSend(v4, "managingOrganization");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      if (v78)
      {
        objc_msgSend(MEMORY[0x24BE84510], "fetchRequestMatchingBlueprintsForUser:ofType:fromOrganization:includeTombstones:", v77, *MEMORY[0x24BE846B8], v78, 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v105 = v5;
        objc_msgSend(v6, "execute:", &v105);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v105;

        if (!v7)
        {
          +[STUILog persistence](STUILog, "persistence");
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_5();

          v26 = (void (**)(id, id))*(id *)(v80 + 56);
          v22 = v8;
          if (v26)
          {
            if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
            {
              v26[2](v26, v22);
            }
            else
            {
              block = MEMORY[0x24BDAC760];
              v108 = 3221225472;
              v109 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
              v110 = &unk_24DB86C38;
              v112 = v26;
              v111 = v22;
              dispatch_async(MEMORY[0x24BDAC9B8], &block);

            }
          }

          goto LABEL_94;
        }
        objc_msgSend(v7, "firstObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          v76 = -[STDeviceBedtime initWithBlueprint:]([STDeviceBedtime alloc], "initWithBlueprint:", v9);
        else
          v76 = 0;

        v82 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x24BE84510], "fetchRequestMatchingBlueprintsForUser:ofType:fromOrganization:includeTombstones:", v77, *MEMORY[0x24BE846D0], v78, 0);
        v75 = (STAlwaysAllowList *)objc_claimAutoreleasedReturnValue();
        v104 = v8;
        -[STAlwaysAllowList execute:](v75, "execute:", &v104);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = v104;

        if (!v27)
        {
          +[STUILog persistence](STUILog, "persistence");
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
            __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_6();

          v47 = (void (**)(id, id))*(id *)(v80 + 56);
          v22 = v74;
          if (v47)
          {
            if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
            {
              v47[2](v47, v22);
            }
            else
            {
              block = MEMORY[0x24BDAC760];
              v108 = 3221225472;
              v109 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
              v110 = &unk_24DB86C38;
              v112 = v47;
              v111 = v22;
              dispatch_async(MEMORY[0x24BDAC9B8], &block);

            }
          }

          goto LABEL_92;
        }
        v102 = 0u;
        v103 = 0u;
        v100 = 0u;
        v101 = 0u;
        v28 = v27;
        v29 = 0;
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v100, v116, 16);
        if (v30)
        {
          v31 = *(_QWORD *)v101;
          do
          {
            for (i = 0; i != v30; ++i)
            {
              if (*(_QWORD *)v101 != v31)
                objc_enumerationMutation(v28);
              v33 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * i);
              objc_msgSend(v33, "configurations");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = objc_msgSend(v34, "count") == 0;

              if (v35)
              {
                +[STUILog persistence](STUILog, "persistence");
                v39 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                  __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_8(v114, v33, &v115, v39);

                objc_msgSend(v33, "tombstone");
                v29 = 1;
              }
              else
              {
                v36 = -[STAllowance initWithBlueprint:]([STAllowance alloc], "initWithBlueprint:", v33);
                -[STAllowance identifier](v36, "identifier");
                v37 = (void *)objc_claimAutoreleasedReturnValue();

                if (v37)
                {
                  -[STAllowance identifier](v36, "identifier");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v82, "setObject:forKeyedSubscript:", v36, v38);

                }
              }
            }
            v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v100, v116, 16);
          }
          while (v30);
        }

        v40 = (void *)MEMORY[0x24BE84510];
        v41 = *(_QWORD *)(v80 + 32);
        objc_msgSend(v77, "alwaysAllowActivationIdentifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "fetchRequestMatchingBlueprintsForUserWithDSID:ofType:withIdentifier:fromOrganization:", v41, *MEMORY[0x24BE846B0], v42, v78);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        v99 = v74;
        objc_msgSend(v43, "execute:", &v99);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v99;

        if (!v44)
        {
          +[STUILog persistence](STUILog, "persistence");
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
            __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_7();

          v49 = (void (**)(id, id))*(id *)(v80 + 56);
          v22 = v5;
          if (v49)
          {
            if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
            {
              v49[2](v49, v22);
            }
            else
            {
              block = MEMORY[0x24BDAC760];
              v108 = 3221225472;
              v109 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
              v110 = &unk_24DB86C38;
              v112 = v49;
              v111 = v22;
              dispatch_async(MEMORY[0x24BDAC9B8], &block);

            }
          }

          goto LABEL_93;
        }
        objc_msgSend(v44, "firstObject");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        if (v45)
          v75 = -[STAlwaysAllowList initWithBlueprint:]([STAlwaysAllowList alloc], "initWithBlueprint:", v45);
        else
          v75 = 0;

        v73 = v29 & 1;
      }
      else
      {
        v82 = (void *)objc_opt_new();
        v73 = 0;
        v75 = 0;
        v76 = 0;
      }
      objc_msgSend(MEMORY[0x24BE844F8], "fetchRequest");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = (void *)MEMORY[0x24BDD1758];
      objc_msgSend(*(id *)(v80 + 40), "userDSID");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "predicateWithFormat:", CFSTR("%K == %@ AND %K == nil AND %K > %@"), CFSTR("requestingUser.dsid"), v51, CFSTR("answer"), CFSTR("expirationDate"), v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "setPredicate:", v53);

      v98 = v5;
      objc_msgSend(v81, "execute:", &v98);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v98;

      if (v54)
      {
        v56 = (void *)objc_opt_new();
        v96 = 0u;
        v97 = 0u;
        v95 = 0u;
        v94 = 0u;
        v57 = v54;
        v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v94, v113, 16);
        if (v58)
        {
          v59 = *(_QWORD *)v95;
          do
          {
            for (j = 0; j != v58; ++j)
            {
              if (*(_QWORD *)v95 != v59)
                objc_enumerationMutation(v57);
              v61 = -[STUIAskForTimeRequestResponse initWithRequestResponse:]([STUIAskForTimeRequestResponse alloc], "initWithRequestResponse:", *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * j));
              -[STUIAskForTimeRequestResponse identifier](v61, "identifier");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "setObject:forKeyedSubscript:", v61, v62);

            }
            v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v94, v113, 16);
          }
          while (v58);
        }

        objc_msgSend(v77, "unmodeledManagingOrganizationSettings");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend(v63, "allLimitsEnabled");
        v84[0] = MEMORY[0x24BDAC760];
        v84[1] = 3221225472;
        v84[2] = __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_236;
        v84[3] = &unk_24DB87ED8;
        v85 = *(id *)(v80 + 48);
        v86 = v76;
        v87 = v82;
        v93 = v64;
        v88 = v75;
        v65 = v56;
        v89 = v65;
        objc_copyWeak(&v92, (id *)(v80 + 72));
        v72 = *(_OWORD *)(v80 + 56);
        v66 = (id)v72;
        v91 = v72;
        v90 = *(_QWORD *)(v80 + 40);
        dispatch_async(MEMORY[0x24BDAC9B8], v84);
        if (v73)
        {
          objc_msgSend(*(id *)(v80 + 40), "persistenceController");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = v55;
          v68 = objc_msgSend(v67, "saveContext:error:", v79, &v83);
          v22 = v83;

          if ((v68 & 1) != 0)
          {
            +[STUILog persistence](STUILog, "persistence");
            v69 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(block) = 0;
              _os_log_impl(&dword_219AB4000, v69, OS_LOG_TYPE_DEFAULT, "Saved database after deleting corrupt blueprints", (uint8_t *)&block, 2u);
            }
          }
          else
          {
            +[STUILog persistence](STUILog, "persistence");
            v69 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
              __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_4();
          }

        }
        else
        {
          v22 = v55;
        }

        objc_destroyWeak(&v92);
      }
      else
      {
        +[STUILog persistence](STUILog, "persistence");
        v70 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
          __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_3();

        v71 = (void (**)(id, id))*(id *)(v80 + 56);
        v22 = v55;
        if (v71)
        {
          if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
          {
            v71[2](v71, v22);
          }
          else
          {
            block = MEMORY[0x24BDAC760];
            v108 = 3221225472;
            v109 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
            v110 = &unk_24DB86C38;
            v112 = v71;
            v111 = v22;
            dispatch_async(MEMORY[0x24BDAC9B8], &block);

          }
        }

      }
LABEL_92:
      v43 = v75;
LABEL_93:

      v6 = v76;
LABEL_94:

      goto LABEL_95;
    }
    goto LABEL_12;
  }
  +[STUILog persistence](STUILog, "persistence");
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    __88__STTimeAllowancesViewModelCoordinator_saveDefaultAlwaysAllowListWithCompletionHandler___block_invoke_cold_2();

  v24 = (void (**)(id, id))*(id *)(a1 + 56);
  v22 = v5;
  if (v24)
  {
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      v24[2](v24, v22);
    }
    else
    {
      block = MEMORY[0x24BDAC760];
      v108 = 3221225472;
      v109 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
      v110 = &unk_24DB86C38;
      v112 = v24;
      v111 = v22;
      dispatch_async(MEMORY[0x24BDAC9B8], &block);

    }
  }

LABEL_95:
}

void __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_236(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  void (**v4)(id, _QWORD);
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  _QWORD block[4];
  id v14;
  void (**v15)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "setBedtime:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setAllowancesByIdentifier:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setAllAllowancesEnabled:", *(unsigned __int8 *)(a1 + 104));
  objc_msgSend(*(id *)(a1 + 32), "setAlwaysAllowList:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setPendingAskForTimeByIdentifier:", *(_QWORD *)(a1 + 64));
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  objc_msgSend(WeakRetained, "setUserObjectID:", v2);

  v4 = (void (**)(id, _QWORD))*(id *)(a1 + 80);
  v5 = MEMORY[0x24BDAC760];
  if (v4)
  {
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      v4[2](v4, 0);
    }
    else
    {
      block[0] = v5;
      block[1] = 3221225472;
      block[2] = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
      block[3] = &unk_24DB86C38;
      v14 = 0;
      v15 = v4;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
  }

  objc_msgSend(*(id *)(a1 + 56), "allowedBundleIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE15820], "sharedCategories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_24DB87EB0;
  v8 = *(_QWORD *)(a1 + 72);
  v11 = v6;
  v12 = v8;
  v9 = v6;
  objc_msgSend(v7, "categoriesForBundleIDs:completionHandler:", v9, v10);

}

void __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEE0]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v8 = MEMORY[0x24BDAC760];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_239;
    v14[3] = &unk_24DB86560;
    v9 = v7;
    v15 = v9;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v14);
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_2_242;
    v12[3] = &unk_24DB86588;
    v12[4] = *(_QWORD *)(a1 + 40);
    v13 = v9;
    v11 = v9;
    objc_msgSend(v10, "addOperationWithBlock:", v12);

  }
  else
  {
    +[STUILog persistence](STUILog, "persistence");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_2_cold_1();
  }

}

void __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_239(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "canonicalBundleIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  v8 = (id)v6;
  if (v6)
    v7 = (id)v6;
  else
    v7 = v5;
  objc_msgSend(v4, "addObject:", v7);

}

void __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_2_242(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 40), "array");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alwaysAllowList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowedBundleIDs:", v4);

}

- (id)_iCloudAccountPredicate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BE190A8];
  -[STTimeAllowancesViewModelCoordinator userDSID](self, "userDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buildWithDSID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)saveDeviceBedtime:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[STTimeAllowancesViewModelCoordinator persistenceController](self, "persistenceController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __76__STTimeAllowancesViewModelCoordinator_saveDeviceBedtime_completionHandler___block_invoke;
  v11[3] = &unk_24DB87F28;
  objc_copyWeak(&v14, &location);
  v9 = v7;
  v13 = v9;
  v10 = v6;
  v12 = v10;
  objc_msgSend(v8, "performBackgroundTask:", v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __76__STTimeAllowancesViewModelCoordinator_saveDeviceBedtime_completionHandler___block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void (**v7)(id, id);
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  void (**v22)(id, _QWORD);
  void (**v23)(id, _QWORD);
  void *v24;
  char v25;
  id v26;
  void (**v27)(id, id);
  void (**v28)(id, id);
  void *v29;
  id v30;
  id v31;
  uint64_t block;
  uint64_t v33;
  uint64_t (*v34)(uint64_t);
  void *v35;
  id v36;
  void (**v37)(id, id);
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "userObjectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "objectWithID:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void (**)(id, id))v6;
      objc_msgSend(a1[4], "scheduleByWeekdayIndex");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = 0;
        v10 = 0;
      }
      else
      {
        objc_msgSend(a1[4], "simpleSchedule");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "startTime");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "endTime");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v18 = objc_msgSend(a1[4], "askForMoreTime");
      v19 = (void *)MEMORY[0x24BE84510];
      v20 = objc_msgSend(a1[4], "deviceBedtimeEnabled");
      v31 = 0;
      LODWORD(v18) = objc_msgSend(v19, "saveDowntimeForUser:startTime:endTime:scheduleByWeekdayIndex:enabled:behaviorType:error:", v7, v9, v10, v8, v20, v18, &v31);
      v21 = v31;
      if ((_DWORD)v18)
      {
        if ((_os_feature_enabled_impl() & 1) != 0)
        {
          v22 = (void (**)(id, _QWORD))a1[5];
          if (v22)
          {
            if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
            {
              v22[2](v22, 0);
            }
            else
            {
              block = MEMORY[0x24BDAC760];
              v33 = 3221225472;
              v34 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
              v35 = &unk_24DB86C38;
              v27 = v22;
              v36 = 0;
              v37 = v27;
              dispatch_async(MEMORY[0x24BDAC9B8], &block);

            }
          }

          v16 = v21;
          goto LABEL_32;
        }
        v29 = v9;
        objc_msgSend(MEMORY[0x24BE84498], "sharedController");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v21;
        v25 = objc_msgSend(v24, "saveContext:error:", v3, &v30);
        v16 = v30;

        v26 = a1[5];
        if ((v25 & 1) != 0)
        {
          v23 = (void (**)(id, _QWORD))v26;
          v9 = v29;
          if (v23)
          {
            if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
            {
              v23[2](v23, 0);
            }
            else
            {
              block = MEMORY[0x24BDAC760];
              v33 = 3221225472;
              v34 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
              v35 = &unk_24DB86C38;
              v28 = v23;
              v36 = 0;
              v37 = v28;
              dispatch_async(MEMORY[0x24BDAC9B8], &block);

            }
          }
          goto LABEL_27;
        }
        v23 = (void (**)(id, _QWORD))v26;
        v16 = v16;
        v9 = v29;
        if (!v23)
        {
LABEL_26:

LABEL_27:
LABEL_32:

          goto LABEL_33;
        }
      }
      else
      {
        v23 = (void (**)(id, _QWORD))a1[5];
        v16 = v21;
        if (!v23)
          goto LABEL_26;
      }
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        ((void (**)(id, id))v23)[2](v23, v16);
      }
      else
      {
        block = MEMORY[0x24BDAC760];
        v33 = 3221225472;
        v34 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
        v35 = &unk_24DB86C38;
        v37 = v23;
        v36 = v16;
        dispatch_async(MEMORY[0x24BDAC9B8], &block);

      }
      goto LABEL_26;
    }
  }
  +[STUILog persistence](STUILog, "persistence");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    __84__STContentPrivacyViewModelCoordinator_saveContentPrivacyEnabled_completionHandler___block_invoke_cold_1();

  v12 = (void *)MEMORY[0x24BDD1540];
  v13 = *MEMORY[0x24BE84710];
  v38 = *MEMORY[0x24BDD0FC8];
  v39[0] = CFSTR("user could not be found");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void (**)(id, id))a1[5];
  v16 = v15;
  if (v7)
  {
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      v7[2](v7, v16);
    }
    else
    {
      block = MEMORY[0x24BDAC760];
      v33 = 3221225472;
      v34 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
      v35 = &unk_24DB86C38;
      v37 = v7;
      v36 = v16;
      dispatch_async(MEMORY[0x24BDAC9B8], &block);

    }
  }

LABEL_33:
}

- (void)toggleDowntimeWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  STTimeAllowancesViewModelCoordinator *v11;
  id v12;

  v4 = a3;
  -[STTimeAllowancesViewModelCoordinator userObjectID](self, "userObjectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STTimeAllowancesViewModelCoordinator persistenceController](self, "persistenceController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __76__STTimeAllowancesViewModelCoordinator_toggleDowntimeWithCompletionHandler___block_invoke;
  v9[3] = &unk_24DB87000;
  v11 = self;
  v12 = v4;
  v10 = v5;
  v7 = v4;
  v8 = v5;
  objc_msgSend(v6, "performBackgroundTask:", v9);

}

void __76__STTimeAllowancesViewModelCoordinator_toggleDowntimeWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void (**v22)(id, id);
  void (**v23)(id, id);
  id v24;
  id v25;
  id v26;
  uint64_t block;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  id v31;
  void (**v32)(id, id);
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32) && (objc_msgSend(v3, "objectWithID:"), (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = (void *)v5;
    v7 = objc_alloc(MEMORY[0x24BE84680]);
    objc_msgSend(v6, "dsid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithDSID:", v8);

    v10 = objc_msgSend(*(id *)(a1 + 40), "isDowntimeActive");
    v26 = 0;
    objc_msgSend(MEMORY[0x24BE84510], "applyAutomaticOnDemandDowntimeStateChange:forUserID:context:error:", v10 ^ 1u, v9, v4, &v26);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v26;

    if (v11)
    {
      objc_msgSend(MEMORY[0x24BE84498], "sharedController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v12;
      v14 = objc_msgSend(v13, "saveContext:error:", v4, &v25);
      v15 = v25;

      if (v14)
        v16 = 0;
      else
        v16 = v15;
      v12 = v15;
    }
    else
    {
      v16 = v12;
    }
    v23 = (void (**)(id, id))*(id *)(a1 + 48);
    v24 = v16;
    if (v23)
    {
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        v23[2](v23, v24);
      }
      else
      {
        block = MEMORY[0x24BDAC760];
        v28 = 3221225472;
        v29 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
        v30 = &unk_24DB86C38;
        v32 = v23;
        v31 = v24;
        dispatch_async(MEMORY[0x24BDAC9B8], &block);

      }
    }

  }
  else
  {
    +[STUILog persistence](STUILog, "persistence");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      __76__STTimeAllowancesViewModelCoordinator_toggleDowntimeWithCompletionHandler___block_invoke_cold_1();

    v18 = (void *)MEMORY[0x24BDD1540];
    v19 = *MEMORY[0x24BE84710];
    v33 = *MEMORY[0x24BDD0FC8];
    v34[0] = CFSTR("user could not be found");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 11, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void (**)(id, id))*(id *)(a1 + 48);
    v12 = v21;
    if (v22)
    {
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        v22[2](v22, v12);
      }
      else
      {
        block = MEMORY[0x24BDAC760];
        v28 = 3221225472;
        v29 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
        v30 = &unk_24DB86C38;
        v32 = v22;
        v31 = v12;
        dispatch_async(MEMORY[0x24BDAC9B8], &block);

      }
    }

  }
}

- (BOOL)isDowntimeActive
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v3 = objc_alloc(MEMORY[0x24BE84680]);
  -[STTimeAllowancesViewModelCoordinator userDSID](self, "userDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDSID:", v4);

  -[STTimeAllowancesViewModelCoordinator persistenceController](self, "persistenceController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __56__STTimeAllowancesViewModelCoordinator_isDowntimeActive__block_invoke;
  v11[3] = &unk_24DB87B48;
  v8 = v5;
  v12 = v8;
  v9 = v7;
  v13 = v9;
  v14 = &v15;
  objc_msgSend(v9, "performBlockAndWait:", v11);
  LOBYTE(v7) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)v7;
}

void __56__STTimeAllowancesViewModelCoordinator_isDowntimeActive__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  unint64_t v6;
  id v7;

  v2 = a1[4];
  v3 = a1[5];
  v7 = 0;
  objc_msgSend(MEMORY[0x24BE84510], "downtimeConfigurationForUserID:context:error:", v2, v3, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;
  v6 = objc_msgSend(v4, "currentState");

  if (v6 <= 4)
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0x100010000uLL >> (8 * v6);

}

- (int64_t)currentDowntimeState
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  int64_t v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v3 = objc_alloc(MEMORY[0x24BE84680]);
  -[STTimeAllowancesViewModelCoordinator userDSID](self, "userDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDSID:", v4);

  -[STTimeAllowancesViewModelCoordinator persistenceController](self, "persistenceController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __60__STTimeAllowancesViewModelCoordinator_currentDowntimeState__block_invoke;
  v12[3] = &unk_24DB87F50;
  v15 = &v16;
  v8 = v5;
  v13 = v8;
  v9 = v7;
  v14 = v9;
  objc_msgSend(v9, "performBlockAndWait:", v12);
  v10 = v17[3];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __60__STTimeAllowancesViewModelCoordinator_currentDowntimeState__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v2 = a1[4];
  v3 = a1[5];
  v6 = 0;
  objc_msgSend(MEMORY[0x24BE84510], "downtimeConfigurationForUserID:context:error:", v2, v3, &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v6;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v4, "currentState");

}

- (double)timeToNextExpectedStateChange
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v3 = objc_alloc(MEMORY[0x24BE84680]);
  -[STTimeAllowancesViewModelCoordinator userDSID](self, "userDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDSID:", v4);

  -[STTimeAllowancesViewModelCoordinator persistenceController](self, "persistenceController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__6;
  v23 = __Block_byref_object_dispose__6;
  v24 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __69__STTimeAllowancesViewModelCoordinator_timeToNextExpectedStateChange__block_invoke;
  v15[3] = &unk_24DB87F50;
  v18 = &v19;
  v8 = v5;
  v16 = v8;
  v9 = v7;
  v17 = v9;
  objc_msgSend(v9, "performBlockAndWait:", v15);
  if (v20[5])
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "autoupdatingCurrentCalendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    STLocalDateFromUTCErasedDate();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceNow");
    v13 = v12;

  }
  else
  {
    v13 = -1.0;
  }

  _Block_object_dispose(&v19, 8);
  return v13;
}

void __69__STTimeAllowancesViewModelCoordinator_timeToNextExpectedStateChange__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = a1[4];
  v3 = a1[5];
  v9 = 0;
  objc_msgSend(MEMORY[0x24BE84510], "downtimeConfigurationForUserID:context:error:", v2, v3, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  objc_msgSend(v4, "nextStateChangeDate");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (void)saveAllowance:(id)a3 completionHandler:(id)a4
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
  -[STTimeAllowancesViewModelCoordinator persistenceController](self, "persistenceController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __72__STTimeAllowancesViewModelCoordinator_saveAllowance_completionHandler___block_invoke;
  v11[3] = &unk_24DB87000;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "performBackgroundTask:", v11);

}

void __72__STTimeAllowancesViewModelCoordinator_saveAllowance_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void (**v6)(id, id);
  void *v7;
  uint64_t v8;
  int v9;
  id v10;
  void (**v11)(id, _QWORD);
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void (**v18)(id, _QWORD);
  id v19;
  void *v20;
  char v21;
  void *v22;
  void (**v23)(id, id);
  void (**v24)(id, id);
  id v25;
  id v26;
  uint64_t block;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  id v31;
  void (**v32)(id, id);
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "userObjectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 || (objc_msgSend(v3, "objectWithID:", v4), (v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    +[STUILog persistence](STUILog, "persistence");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      __84__STContentPrivacyViewModelCoordinator_saveContentPrivacyEnabled_completionHandler___block_invoke_cold_1();

    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = *MEMORY[0x24BE84710];
    v33 = *MEMORY[0x24BDD0FC8];
    v34[0] = CFSTR("user could not be found");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 11, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void (**)(id, id))*(id *)(a1 + 48);
    v17 = v16;
    if (v6)
    {
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        v6[2](v6, v17);
      }
      else
      {
        block = MEMORY[0x24BDAC760];
        v28 = 3221225472;
        v29 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
        v30 = &unk_24DB86C38;
        v32 = v6;
        v31 = v17;
        dispatch_async(MEMORY[0x24BDAC9B8], &block);

      }
    }

    goto LABEL_26;
  }
  v6 = (void (**)(id, id))v5;
  v7 = (void *)objc_opt_class();
  v8 = *(_QWORD *)(a1 + 40);
  v26 = 0;
  v9 = objc_msgSend(v7, "saveAllowance:forUser:error:", v8, v6, &v26);
  v10 = v26;
  if (!v9)
  {
    v18 = (void (**)(id, _QWORD))*(id *)(a1 + 48);
    v19 = v10;
    goto LABEL_14;
  }
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE84498], "sharedController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v10;
    v21 = objc_msgSend(v20, "saveContext:error:", v3, &v25);
    v17 = v25;

    v22 = *(void **)(a1 + 48);
    if ((v21 & 1) != 0)
    {
      v18 = v22;
      if (v18)
      {
        if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
        {
          v18[2](v18, 0);
        }
        else
        {
          block = MEMORY[0x24BDAC760];
          v28 = 3221225472;
          v29 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
          v30 = &unk_24DB86C38;
          v24 = v18;
          v31 = 0;
          v32 = v24;
          dispatch_async(MEMORY[0x24BDAC9B8], &block);

        }
      }
LABEL_25:

LABEL_26:
      goto LABEL_27;
    }
    v18 = v22;
    v19 = v17;
LABEL_14:
    v17 = v19;
    if (v18)
    {
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        ((void (**)(id, id))v18)[2](v18, v17);
      }
      else
      {
        block = MEMORY[0x24BDAC760];
        v28 = 3221225472;
        v29 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
        v30 = &unk_24DB86C38;
        v32 = v18;
        v31 = v17;
        dispatch_async(MEMORY[0x24BDAC9B8], &block);

      }
    }

    goto LABEL_25;
  }
  v11 = (void (**)(id, _QWORD))*(id *)(a1 + 48);
  if (v11)
  {
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      v11[2](v11, 0);
    }
    else
    {
      block = MEMORY[0x24BDAC760];
      v28 = 3221225472;
      v29 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
      v30 = &unk_24DB86C38;
      v23 = v11;
      v31 = 0;
      v32 = v23;
      dispatch_async(MEMORY[0x24BDAC9B8], &block);

    }
  }

  v17 = v10;
LABEL_27:

}

+ (BOOL)saveAllowance:(id)a3 forUser:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  uint64_t v28;
  void *v29;
  uint64_t v31;
  uint64_t v32;
  id v33;
  _QWORD v35[4];
  void *v36;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "timeByDay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v8, "count"));
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __68__STTimeAllowancesViewModelCoordinator_saveAllowance_forUser_error___block_invoke;
    v35[3] = &unk_24DB87F78;
    v36 = v9;
    v33 = v9;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v35);
    v10 = (void *)MEMORY[0x24BE84510];
    objc_msgSend(v7, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "webDomains");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "categoryIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v7, "allowanceEnabled");
    v16 = objc_msgSend(v7, "behaviorType");

    v32 = v16;
    v17 = v33;
    LOBYTE(v31) = v15;
    v18 = objc_msgSend(v10, "saveUsageLimitWithIdentifier:user:bundleIdentifiers:webDomains:categoryIdentifiers:dailyBudgetLimit:budgetLimitByWeekday:enabled:behaviorType:error:", v11, v6, v12, v13, v14, v33, 0.0, v31, v32, a5);

    v19 = v36;
  }
  else
  {
    objc_msgSend(v7, "time");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[STAllowance timeIntervalForAllowanceDateComponents:](STAllowance, "timeIntervalForAllowanceDateComponents:", v20);
    v22 = v21;

    v23 = (void *)MEMORY[0x24BE84510];
    objc_msgSend(v7, "identifier");
    v24 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifiers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "webDomains");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "categoryIdentifiers");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v7, "allowanceEnabled");
    v28 = objc_msgSend(v7, "behaviorType");

    LOBYTE(v31) = v27;
    v29 = v23;
    v17 = (void *)v24;
    v18 = objc_msgSend(v29, "saveUsageLimitWithIdentifier:user:bundleIdentifiers:webDomains:categoryIdentifiers:dailyBudgetLimit:budgetLimitByWeekday:enabled:behaviorType:error:", v24, v6, v19, v25, v26, 0, v22, v31, v28, a5);

  }
  return v18;
}

void __68__STTimeAllowancesViewModelCoordinator_saveAllowance_forUser_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a2;
  +[STAllowance timeIntervalForAllowanceDateComponents:](STAllowance, "timeIntervalForAllowanceDateComponents:", a3);
  objc_msgSend(v5, "numberWithDouble:");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

- (void)deleteAllowance:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[STTimeAllowancesViewModelCoordinator userObjectID](self, "userObjectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STTimeAllowancesViewModelCoordinator persistenceController](self, "persistenceController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __74__STTimeAllowancesViewModelCoordinator_deleteAllowance_completionHandler___block_invoke;
  v13[3] = &unk_24DB87000;
  v15 = v6;
  v16 = v7;
  v14 = v8;
  v10 = v6;
  v11 = v7;
  v12 = v8;
  objc_msgSend(v9, "performBackgroundTask:", v13);

}

void __74__STTimeAllowancesViewModelCoordinator_deleteAllowance_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void (**v6)(id, id);
  void *v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  void (**v14)(id, _QWORD);
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void (**v21)(id, id);
  id v22;
  id v23;
  uint64_t block;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  id v28;
  void (**v29)(id, id);
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v3, "objectWithID:");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void (**)(id, id))v5;
      v7 = (void *)MEMORY[0x24BE84510];
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      LODWORD(v7) = objc_msgSend(v7, "deleteUsageLimitWithIdentifier:user:managedObjectContext:error:", v8, v6, v4, &v23);
      v9 = v23;

      if ((_DWORD)v7)
      {
        objc_msgSend(MEMORY[0x24BE84498], "sharedController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v9;
        v11 = objc_msgSend(v10, "saveContext:error:", v4, &v22);
        v12 = v22;

        v13 = *(void **)(a1 + 48);
        if ((v11 & 1) != 0)
        {
          v14 = v13;
          if (v14)
          {
            if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
            {
              v14[2](v14, 0);
            }
            else
            {
              block = MEMORY[0x24BDAC760];
              v25 = 3221225472;
              v26 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
              v27 = &unk_24DB86C38;
              v21 = v14;
              v28 = 0;
              v29 = v21;
              dispatch_async(MEMORY[0x24BDAC9B8], &block);

            }
          }
LABEL_22:

          goto LABEL_23;
        }
        v14 = v13;
        v20 = v12;
      }
      else
      {
        v14 = (void (**)(id, _QWORD))*(id *)(a1 + 48);
        v20 = v9;
      }
      v12 = v20;
      if (v14)
      {
        if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
        {
          ((void (**)(id, id))v14)[2](v14, v12);
        }
        else
        {
          block = MEMORY[0x24BDAC760];
          v25 = 3221225472;
          v26 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
          v27 = &unk_24DB86C38;
          v29 = v14;
          v28 = v12;
          dispatch_async(MEMORY[0x24BDAC9B8], &block);

        }
      }

      goto LABEL_22;
    }
  }
  +[STUILog persistence](STUILog, "persistence");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    __76__STTimeAllowancesViewModelCoordinator_toggleDowntimeWithCompletionHandler___block_invoke_cold_1();

  v16 = (void *)MEMORY[0x24BDD1540];
  v17 = *MEMORY[0x24BE84710];
  v30 = *MEMORY[0x24BDD0FC8];
  v31[0] = CFSTR("user could not be found");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 11, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void (**)(id, id))*(id *)(a1 + 48);
  v12 = v19;
  if (v6)
  {
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      v6[2](v6, v12);
    }
    else
    {
      block = MEMORY[0x24BDAC760];
      v25 = 3221225472;
      v26 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
      v27 = &unk_24DB86C38;
      v29 = v6;
      v28 = v12;
      dispatch_async(MEMORY[0x24BDAC9B8], &block);

    }
  }

LABEL_23:
}

- (void)saveAllAllowancesEnabled:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  STTimeAllowancesViewModelCoordinator *v14;
  id v15;
  BOOL v16;

  v4 = a3;
  v6 = a4;
  -[STTimeAllowancesViewModelCoordinator viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllAllowancesEnabled:", v4);

  -[STTimeAllowancesViewModelCoordinator userObjectID](self, "userObjectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STTimeAllowancesViewModelCoordinator persistenceController](self, "persistenceController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __83__STTimeAllowancesViewModelCoordinator_saveAllAllowancesEnabled_completionHandler___block_invoke;
  v12[3] = &unk_24DB87FA0;
  v14 = self;
  v15 = v6;
  v16 = v4;
  v13 = v8;
  v10 = v6;
  v11 = v8;
  objc_msgSend(v9, "performBackgroundTask:", v12);

}

void __83__STTimeAllowancesViewModelCoordinator_saveAllAllowancesEnabled_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void (**v12)(id, _QWORD);
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void (**v20)(id, _QWORD);
  id v21;
  uint64_t block;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  id v26;
  void (**v27)(id, _QWORD);
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32)
    && (objc_msgSend(v3, "objectWithID:"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = v5;
    objc_msgSend(v5, "unmodeledManagingOrganizationSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAllLimitsEnabled:", *(unsigned __int8 *)(a1 + 56));
    objc_msgSend(v6, "familySettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == v8)
      objc_msgSend(v7, "setIsDirty:", 1);
    objc_msgSend(*(id *)(a1 + 40), "persistenceController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v10 = objc_msgSend(v9, "saveContext:error:", v4, &v21);
    v11 = v21;

    if ((v10 & 1) != 0)
    {
      v12 = (void (**)(id, _QWORD))*(id *)(a1 + 48);
      if (v12)
      {
        if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
        {
          v12[2](v12, 0);
        }
        else
        {
          block = MEMORY[0x24BDAC760];
          v23 = 3221225472;
          v24 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
          v25 = &unk_24DB86C38;
          v20 = v12;
          v26 = 0;
          v27 = v20;
          dispatch_async(MEMORY[0x24BDAC9B8], &block);

        }
      }
    }
    else
    {
      +[STUILog persistence](STUILog, "persistence");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        __82__STContentPrivacyViewModelCoordinator_saveCommunicationLimits_completionHandler___block_invoke_cold_2();

      v12 = (void (**)(id, _QWORD))*(id *)(a1 + 48);
      v19 = v11;
      if (v12)
      {
        if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
        {
          ((void (**)(id, id))v12)[2](v12, v19);
        }
        else
        {
          block = MEMORY[0x24BDAC760];
          v23 = 3221225472;
          v24 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
          v25 = &unk_24DB86C38;
          v27 = v12;
          v26 = v19;
          dispatch_async(MEMORY[0x24BDAC9B8], &block);

        }
      }

    }
  }
  else
  {
    +[STUILog persistence](STUILog, "persistence");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      __76__STTimeAllowancesViewModelCoordinator_toggleDowntimeWithCompletionHandler___block_invoke_cold_1();

    v14 = (void *)MEMORY[0x24BDD1540];
    v15 = *MEMORY[0x24BE84710];
    v28 = *MEMORY[0x24BDD0FC8];
    v29[0] = CFSTR("user could not be found");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 11, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = *(id *)(a1 + 48);
    v11 = v17;
    if (v6)
    {
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        (*((void (**)(id, id))v6 + 2))(v6, v11);
      }
      else
      {
        block = MEMORY[0x24BDAC760];
        v23 = 3221225472;
        v24 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
        v25 = &unk_24DB86C38;
        v27 = (void (**)(id, _QWORD))v6;
        v26 = v11;
        dispatch_async(MEMORY[0x24BDAC9B8], &block);

      }
    }

  }
}

- (void)saveAlwaysAllowList:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(id, _QWORD);
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD block[4];
  id v27;
  void (**v28)(id, _QWORD);

  v6 = a4;
  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = a3;
  -[STTimeAllowancesViewModelCoordinator viewModel](self, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "alwaysAllowList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allowedBundleIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "allowedBundleIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isEqualToSet:", v14) & 1) != 0)
  {
    v15 = (void (**)(id, _QWORD))v6;
    if (v15)
    {
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        v15[2](v15, 0);
      }
      else
      {
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
        block[3] = &unk_24DB86C38;
        v27 = 0;
        v28 = v15;
        dispatch_async(MEMORY[0x24BDAC9B8], block);

      }
    }

  }
  else
  {
    -[STTimeAllowancesViewModelCoordinator userDSID](self, "userDSID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[STTimeAllowancesViewModelCoordinator userObjectID](self, "userObjectID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[STTimeAllowancesViewModelCoordinator persistenceController](self, "persistenceController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __78__STTimeAllowancesViewModelCoordinator_saveAlwaysAllowList_completionHandler___block_invoke;
    v21[3] = &unk_24DB87FC8;
    v22 = v17;
    v23 = v16;
    v25 = v6;
    v24 = v13;
    v19 = v16;
    v20 = v17;
    objc_msgSend(v18, "performBackgroundTask:", v21);

  }
}

void __78__STTimeAllowancesViewModelCoordinator_saveAlwaysAllowList_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void (**v5)(id, id);
  id v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  id v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  void (**v15)(id, _QWORD);
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void (**v23)(id, id);
  id v24;
  id v25;
  id v26;
  uint64_t block;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  id v31;
  void (**v32)(id, id);
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v3, "objectWithID:");
    v5 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
    v6 = 0;
    if (!v5)
      goto LABEL_23;
LABEL_6:
    v8 = *(_QWORD *)(a1 + 48);
    v25 = v6;
    v9 = objc_msgSend(MEMORY[0x24BE84510], "saveAlwaysAllowListForUser:withBundleIDs:error:", v5, v8, &v25);
    v10 = v25;

    if (v9)
    {
      objc_msgSend(MEMORY[0x24BE84498], "sharedController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v10;
      v12 = objc_msgSend(v11, "saveContext:error:", v4, &v24);
      v13 = v24;

      v14 = *(void **)(a1 + 56);
      if ((v12 & 1) != 0)
      {
        v15 = v14;
        if (v15)
        {
          if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
          {
            v15[2](v15, 0);
          }
          else
          {
            block = MEMORY[0x24BDAC760];
            v28 = 3221225472;
            v29 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
            v30 = &unk_24DB86C38;
            v23 = v15;
            v31 = 0;
            v32 = v23;
            dispatch_async(MEMORY[0x24BDAC9B8], &block);

          }
        }
LABEL_19:

        goto LABEL_30;
      }
      v15 = v14;
      v16 = v13;
    }
    else
    {
      v15 = (void (**)(id, _QWORD))*(id *)(a1 + 56);
      v16 = v10;
    }
    v13 = v16;
    if (v15)
    {
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        ((void (**)(id, id))v15)[2](v15, v13);
      }
      else
      {
        block = MEMORY[0x24BDAC760];
        v28 = 3221225472;
        v29 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
        v30 = &unk_24DB86C38;
        v32 = v15;
        v31 = v13;
        dispatch_async(MEMORY[0x24BDAC9B8], &block);

      }
    }

    goto LABEL_19;
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    v26 = 0;
    objc_msgSend(MEMORY[0x24BE84570], "fetchUserWithDSID:inContext:error:", v7, v3, &v26);
    v5 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
    v6 = v26;
    if (!v5)
    {
      +[STUILog persistence](STUILog, "persistence");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        __88__STTimeAllowancesViewModelCoordinator_saveDefaultAlwaysAllowListWithCompletionHandler___block_invoke_cold_2();

      goto LABEL_23;
    }
    goto LABEL_6;
  }
  v6 = 0;
LABEL_23:
  +[STUILog persistence](STUILog, "persistence");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    __78__STTimeAllowancesViewModelCoordinator_saveAlwaysAllowList_completionHandler___block_invoke_cold_1();

  v19 = (void *)MEMORY[0x24BDD1540];
  v20 = *MEMORY[0x24BE84710];
  v33 = *MEMORY[0x24BDD0FC8];
  v34[0] = CFSTR("user could not be found");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 11, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void (**)(id, id))*(id *)(a1 + 56);
  v13 = v22;
  if (v5)
  {
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      v5[2](v5, v13);
    }
    else
    {
      block = MEMORY[0x24BDAC760];
      v28 = 3221225472;
      v29 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
      v30 = &unk_24DB86C38;
      v32 = v5;
      v31 = v13;
      dispatch_async(MEMORY[0x24BDAC9B8], &block);

    }
  }

LABEL_30:
}

- (void)respondToAskForTime:(id)a3 withApproval:(BOOL)a4 timeApproved:(id)a5 completionHandler:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v7 = a4;
  v10 = a6;
  v11 = a5;
  v12 = a3;
  -[STTimeAllowancesViewModelCoordinator askForTimeClient](self, "askForTimeClient");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x24BDD1880]);
  objc_msgSend(v12, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(v14, "initWithUUIDString:", v15);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __104__STTimeAllowancesViewModelCoordinator_respondToAskForTime_withApproval_timeApproved_completionHandler___block_invoke;
  v18[3] = &unk_24DB86DB8;
  v19 = v10;
  v17 = v10;
  objc_msgSend(v13, "handleAnswer:requestIdentifier:timeApproved:completionHandler:", !v7, v16, v11, v18);

}

void __104__STTimeAllowancesViewModelCoordinator_respondToAskForTime_withApproval_timeApproved_completionHandler___block_invoke(uint64_t a1)
{
  void (**v1)(id, _QWORD);
  _QWORD v2[4];
  id v3;
  void (**v4)(id, _QWORD);

  v1 = (void (**)(id, _QWORD))*(id *)(a1 + 32);
  if (v1)
  {
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      v1[2](v1, 0);
    }
    else
    {
      v2[0] = MEMORY[0x24BDAC760];
      v2[1] = 3221225472;
      v2[2] = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
      v2[3] = &unk_24DB86C38;
      v3 = 0;
      v4 = v1;
      dispatch_async(MEMORY[0x24BDAC9B8], v2);

    }
  }

}

- (STTimeAllowancesViewModel)viewModel
{
  return (STTimeAllowancesViewModel *)objc_getProperty(self, a2, 8, 1);
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

- (STAskForTimeClient)askForTimeClient
{
  return self->_askForTimeClient;
}

- (STGroupFetchedResultsController)groupFetchResultsController
{
  return self->_groupFetchResultsController;
}

- (NSManagedObjectID)userObjectID
{
  return self->_userObjectID;
}

- (void)setUserObjectID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userObjectID, 0);
  objc_storeStrong((id *)&self->_groupFetchResultsController, 0);
  objc_storeStrong((id *)&self->_askForTimeClient, 0);
  objc_storeStrong((id *)&self->_persistenceController, 0);
  objc_storeStrong((id *)&self->_userDSID, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

void __88__STTimeAllowancesViewModelCoordinator_saveDefaultAlwaysAllowListWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_0(&dword_219AB4000, v0, v1, "user with DSID could not be found: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __88__STTimeAllowancesViewModelCoordinator_saveDefaultAlwaysAllowListWithCompletionHandler___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_2(&dword_219AB4000, v0, v1, "failed to fetch user with DSID %{public}@: %{public}@");
  OUTLINED_FUNCTION_1();
}

void __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_0(&dword_219AB4000, v0, v1, "user with DSID could not be found: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_219AB4000, v0, v1, "Error fetching existing ask for time request responses: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_219AB4000, v0, v1, "Failed to save database changes: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_219AB4000, v0, v1, "failed to fetch bedtime blueprint: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219AB4000, v0, v1, "failed to fetch usage limit blueprints: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219AB4000, v0, v1, "failed to fetch always allow blueprints: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_8(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_error_impl(&dword_219AB4000, a4, OS_LOG_TYPE_ERROR, "Deleting usage limit blueprint with missing configurations: %{public}@", a1, 0xCu);

}

void __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_219AB4000, v0, v1, "Failed to fetch categories for always allowed apps: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __76__STTimeAllowancesViewModelCoordinator_toggleDowntimeWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_0(&dword_219AB4000, v0, v1, "user with objectID could not be found: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __78__STTimeAllowancesViewModelCoordinator_saveAlwaysAllowList_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  _BYTE v3[24];

  OUTLINED_FUNCTION_2_1(*MEMORY[0x24BDAC8D0]);
  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = v1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = *(_QWORD *)(v0 + 40);
  OUTLINED_FUNCTION_2_2(&dword_219AB4000, v0, v2, "user with objectID / DSID could not be found: %{public}@ / %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

@end
