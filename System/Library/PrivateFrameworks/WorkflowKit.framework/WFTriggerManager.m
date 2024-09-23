@implementation WFTriggerManager

- (WFTriggerManager)initWithDatabase:(id)a3
{
  id v6;
  WFTriggerManager *v7;
  WFTriggerManager *v8;
  WFTriggerManager *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTriggerManager.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFTriggerManager;
  v7 = -[WFTriggerManager init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_database, a3);
    v9 = v8;
  }

  return v8;
}

- (NSXPCConnection)connection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  void *v6;

  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.shortcutsautomationd.xpc"), 0);
    v5 = self->_connection;
    self->_connection = v4;

    WFAutomationDaemonXPCInterface();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v6);

    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", &__block_literal_global_36213);
    -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", &__block_literal_global_148);
    -[NSXPCConnection resume](self->_connection, "resume");
    connection = self->_connection;
  }
  return connection;
}

- (void)saveNewConfiguredTrigger:(id)a3 notifyDaemon:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  uint64_t v13;
  id v14;
  id *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[5];
  id obj;
  _QWORD v25[5];
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  id *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v6 = a4;
  v9 = a3;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))v10;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTriggerManager.m"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("record"));

    if (v11)
      goto LABEL_3;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTriggerManager.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_11;
LABEL_3:
  v35 = 0;
  v36 = (id *)&v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__36181;
  v39 = __Block_byref_object_dispose__36182;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__36181;
  v33 = __Block_byref_object_dispose__36182;
  v34 = 0;
  -[WFTriggerManager database](self, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __69__WFTriggerManager_saveNewConfiguredTrigger_notifyDaemon_completion___block_invoke;
  v25[3] = &unk_1E7AF2478;
  v27 = &v29;
  v25[4] = self;
  v14 = v9;
  v26 = v14;
  v28 = &v35;
  v15 = v36;
  obj = v36[5];
  objc_msgSend(v12, "performTransactionWithReason:block:error:", CFSTR("save trigger"), v25, &obj);
  objc_storeStrong(v15 + 5, obj);

  v16 = v30[5];
  if (v16 && v6)
  {
    if (_os_feature_enabled_impl())
    {
      -[WFTriggerManager connection](self, "connection");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "remoteObjectProxy");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)v30[5], "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v13;
      v23[1] = 3221225472;
      v23[2] = __69__WFTriggerManager_saveNewConfiguredTrigger_notifyDaemon_completion___block_invoke_2;
      v23[3] = &unk_1E7AF24A0;
      v23[4] = &v29;
      objc_msgSend(v18, "refreshTriggerWithIdentifier:completion:", v19, v23);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC7958], "standardClient");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v30[5], "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v13;
      v22[1] = 3221225472;
      v22[2] = __69__WFTriggerManager_saveNewConfiguredTrigger_notifyDaemon_completion___block_invoke_160;
      v22[3] = &unk_1E7AF24A0;
      v22[4] = &v29;
      objc_msgSend(v18, "refreshTriggerWithIdentifier:completion:", v19, v22);
    }

    v16 = v30[5];
  }
  ((void (**)(_QWORD, uint64_t, id))v11)[2](v11, v16, v36[5]);

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

}

- (void)saveNewConfiguredTrigger:(id)a3 workflow:(id)a4 notifyDaemon:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, uint64_t, _QWORD, id);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  WFWorkflowCreationOptions *v17;
  void *v18;
  uint64_t v19;
  WFWorkflowCreationOptions *v20;
  id v21;
  id *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  _QWORD v31[5];
  _QWORD v32[5];
  id obj;
  _QWORD v34[5];
  WFWorkflowCreationOptions *v35;
  id v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  id *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;

  v30 = a5;
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, uint64_t, _QWORD, id))a6;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTriggerManager.m"), 122, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workflow"));

    if (v12)
      goto LABEL_4;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTriggerManager.m"), 123, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTriggerManager.m"), 121, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("record"));

  if (!v11)
    goto LABEL_12;
LABEL_3:
  if (!v12)
    goto LABEL_13;
LABEL_4:
  objc_msgSend(v11, "setHiddenFromLibraryAndSync:", 1);
  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("Automation %@"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setName:", v16);

  v17 = -[WFWorkflowCreationOptions initWithRecord:]([WFWorkflowCreationOptions alloc], "initWithRecord:", v11);
  v52 = 0;
  v53 = (id *)&v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__36181;
  v56 = __Block_byref_object_dispose__36182;
  v57 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__36181;
  v50 = __Block_byref_object_dispose__36182;
  v51 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__36181;
  v44 = __Block_byref_object_dispose__36182;
  v45 = 0;
  -[WFTriggerManager database](self, "database");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __78__WFTriggerManager_saveNewConfiguredTrigger_workflow_notifyDaemon_completion___block_invoke;
  v34[3] = &unk_1E7AF24C8;
  v37 = &v40;
  v34[4] = self;
  v20 = v17;
  v35 = v20;
  v38 = &v52;
  v39 = &v46;
  v21 = v10;
  v36 = v21;
  v22 = v53;
  obj = v53[5];
  objc_msgSend(v18, "performTransactionWithReason:block:error:", CFSTR("save trigger with workflow"), v34, &obj);
  objc_storeStrong(v22 + 5, obj);

  v23 = v47[5];
  if (v23 && v30)
  {
    if (_os_feature_enabled_impl())
    {
      -[WFTriggerManager connection](self, "connection");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "remoteObjectProxy");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)v47[5], "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v19;
      v32[1] = 3221225472;
      v32[2] = __78__WFTriggerManager_saveNewConfiguredTrigger_workflow_notifyDaemon_completion___block_invoke_2;
      v32[3] = &unk_1E7AF24A0;
      v32[4] = &v46;
      objc_msgSend(v25, "refreshTriggerWithIdentifier:completion:", v26, v32);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC7958], "standardClient");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v47[5], "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v19;
      v31[1] = 3221225472;
      v31[2] = __78__WFTriggerManager_saveNewConfiguredTrigger_workflow_notifyDaemon_completion___block_invoke_170;
      v31[3] = &unk_1E7AF24A0;
      v31[4] = &v46;
      objc_msgSend(v25, "refreshTriggerWithIdentifier:completion:", v26, v31);
    }

    v23 = v47[5];
  }
  v12[2](v12, v23, v41[5], v53[5]);

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);

  _Block_object_dispose(&v52, 8);
}

- (void)saveNewConfiguredTrigger:(id)a3 workflowReference:(id)a4 notifyDaemon:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void (**v12)(id, uint64_t, _QWORD);
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id obj;
  _QWORD v23[5];
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  id *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, uint64_t, _QWORD))a6;
  v34 = 0;
  v35 = (id *)&v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__36181;
  v38 = __Block_byref_object_dispose__36182;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__36181;
  v32 = __Block_byref_object_dispose__36182;
  v33 = 0;
  -[WFTriggerManager database](self, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __87__WFTriggerManager_saveNewConfiguredTrigger_workflowReference_notifyDaemon_completion___block_invoke;
  v23[3] = &unk_1E7AF24F0;
  v26 = &v28;
  v23[4] = self;
  v15 = v10;
  v24 = v15;
  v16 = v11;
  v25 = v16;
  v27 = &v34;
  v17 = v35;
  obj = v35[5];
  objc_msgSend(v13, "performTransactionWithReason:block:error:", CFSTR("save trigger with workflow"), v23, &obj);
  objc_storeStrong(v17 + 5, obj);

  v18 = v29[5];
  if (v18 && v7)
  {
    objc_msgSend(MEMORY[0x1E0DC7958], "standardClient");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v29[5], "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v14;
    v21[1] = 3221225472;
    v21[2] = __87__WFTriggerManager_saveNewConfiguredTrigger_workflowReference_notifyDaemon_completion___block_invoke_2;
    v21[3] = &unk_1E7AF24A0;
    v21[4] = &v28;
    objc_msgSend(v19, "refreshTriggerWithIdentifier:completion:", v20, v21);

    v18 = v29[5];
  }
  ((void (**)(id, uint64_t, id))v12)[2](v12, v18, v35[5]);

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

}

- (void)updateConfiguredTrigger:(id)a3 triggerID:(id)a4 notifyDaemon:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v11;
  id v12;
  void (**v13)(id, uint64_t, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  id v32;
  id v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v7 = a5;
  v38 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = (void (**)(id, uint64_t, _QWORD))a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
LABEL_21:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTriggerManager.m"), 193, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("triggerID"));

    if (v13)
      goto LABEL_4;
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTriggerManager.m"), 192, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("newRecord"));

  if (!v12)
    goto LABEL_21;
LABEL_3:
  if (v13)
    goto LABEL_4;
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTriggerManager.m"), 194, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_4:
  -[WFTriggerManager database](self, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "configuredTriggerForTriggerID:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[WFTriggerManager database](self, "database");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    objc_msgSend(v16, "recordWithDescriptor:error:", v15, &v33);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v33;

    if (v17)
    {
      v31 = v7;
      objc_msgSend(v11, "triggerData");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setTriggerData:", v19);

      objc_msgSend(v17, "setShouldNotify:", objc_msgSend(v11, "shouldNotify"));
      objc_msgSend(v17, "setShouldPrompt:", objc_msgSend(v11, "shouldPrompt"));
      objc_msgSend(v17, "setShouldRecur:", objc_msgSend(v11, "shouldRecur"));
      objc_msgSend(v17, "setEnabled:", objc_msgSend(v11, "isEnabled"));
      objc_msgSend(v17, "setEditableShortcut:", objc_msgSend(v11, "editableShortcut"));
      objc_msgSend(v11, "selectedEntryMetadata");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setSelectedEntryMetadata:", v20);

      -[WFTriggerManager database](self, "database");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v18;
      v22 = objc_msgSend(v21, "saveRecord:withDescriptor:error:", v17, v15, &v32);
      v23 = v32;

      if ((v22 & 1) != 0)
      {
        if (v31)
        {
          if (_os_feature_enabled_impl())
          {
            -[WFTriggerManager connection](self, "connection");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "remoteObjectProxy");
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v25, "refreshTriggerWithIdentifier:completion:", v12, v13);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0DC7958], "standardClient");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "refreshTriggerWithIdentifier:completion:", v12, v13);

          }
        }
        else
        {
          v13[2](v13, 1, 0);
        }
      }
      else
      {
        ((void (**)(id, uint64_t, id))v13)[2](v13, 0, v23);
      }
      v18 = v23;
    }
    else
    {
      ((void (**)(id, uint64_t, id))v13)[2](v13, 0, v18);
    }

  }
  else
  {
    getWFTriggersLogObject();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[WFTriggerManager updateConfiguredTrigger:triggerID:notifyDaemon:completion:]";
      v36 = 2112;
      v37 = v12;
      _os_log_impl(&dword_1C15B3000, v26, OS_LOG_TYPE_ERROR, "%s Couldn't find trigger to update for triggerID (%@)", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFTriggerErrorDomain"), 1001, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, id))v13)[2](v13, 0, v18);
  }

}

- (void)associateWorkflowToTriggerID:(id)a3 deletingExistingReference:(BOOL)a4 notifyDaemon:(BOOL)a5 workflowReference:(id)a6 completion:(id)a7
{
  _BOOL4 v9;
  id v13;
  id v14;
  id v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  void *v17;
  id v18;
  id v19;
  id *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  _QWORD v26[5];
  id v27;
  id v28;
  uint64_t *v29;
  BOOL v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v9 = a5;
  v13 = a3;
  v14 = a6;
  v15 = a7;
  v16 = (void (**)(_QWORD, _QWORD, _QWORD))v15;
  if (v13)
  {
    if (v15)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTriggerManager.m"), 232, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("triggerID"));

    if (v16)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTriggerManager.m"), 233, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__36181;
  v35 = __Block_byref_object_dispose__36182;
  v36 = 0;
  -[WFTriggerManager database](self, "database");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __117__WFTriggerManager_associateWorkflowToTriggerID_deletingExistingReference_notifyDaemon_workflowReference_completion___block_invoke;
  v26[3] = &unk_1E7AF2518;
  v26[4] = self;
  v18 = v13;
  v30 = a4;
  v27 = v18;
  v29 = &v31;
  v19 = v14;
  v28 = v19;
  v20 = (id *)(v32 + 5);
  obj = (id)v32[5];
  objc_msgSend(v17, "performTransactionWithReason:block:error:", CFSTR("associate workflow to trigger, possibly deleting existing reference"), v26, &obj);
  objc_storeStrong(v20, obj);

  if (v9)
  {
    if (_os_feature_enabled_impl())
    {
      -[WFTriggerManager connection](self, "connection");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "remoteObjectProxy");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC7958], "standardClient");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v22, "refreshTriggerWithIdentifier:completion:", v18, v16);

  }
  else
  {
    ((void (**)(_QWORD, BOOL, _QWORD))v16)[2](v16, v32[5] == 0, 0);
  }

  _Block_object_dispose(&v31, 8);
}

- (void)deleteTriggerWithIdentifier:(id)a3 notifyDaemon:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v6 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTriggerManager.m"), 267, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("triggerID"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTriggerManager.m"), 268, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  -[WFTriggerManager database](self, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configuredTriggerForTriggerID:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[WFTriggerManager database](self, "database");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v15 = objc_msgSend(v14, "deleteReference:error:", v13, &v23);
    v16 = v23;

    if ((v15 & 1) == 0)
    {
      ((void (**)(_QWORD, _QWORD, id))v11)[2](v11, 0, v16);
      goto LABEL_12;
    }
  }
  else
  {
    getWFTriggersLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[WFTriggerManager deleteTriggerWithIdentifier:notifyDaemon:completion:]";
      v26 = 2112;
      v27 = v9;
      _os_log_impl(&dword_1C15B3000, v17, OS_LOG_TYPE_ERROR, "%s No configuredTrigger for triggerID %@", buf, 0x16u);
    }

    v16 = 0;
  }
  if (v6)
  {
    objc_msgSend(v13, "trigger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend((id)objc_opt_class(), "triggerBacking");

    objc_msgSend(MEMORY[0x1E0DC7958], "standardClient");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "unregisterTriggerWithIdentifier:triggerBacking:completion:", v9, v19, v11);

  }
  else
  {
    v11[2](v11, 1, 0);
  }
LABEL_12:

}

- (id)allConfiguredTriggers
{
  void *v2;
  void *v3;
  void *v4;

  -[WFTriggerManager database](self, "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allConfiguredTriggers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "descriptors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)configuredTriggerWithID:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTriggerManager.m"), 294, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("triggerID"));

  }
  -[WFTriggerManager database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configuredTriggerForTriggerID:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)updateNotificationLevel:(int)a3 forConfiguredTrigger:(id)a4 error:(id *)a5
{
  uint64_t v6;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v15;

  v6 = *(_QWORD *)&a3;
  v9 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTriggerManager.m"), 300, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuredTrigger"));

  }
  -[WFTriggerManager database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recordWithDescriptor:error:", v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "setNotificationLevel:", v6);
    -[WFTriggerManager database](self, "database");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "saveRecord:withDescriptor:error:", v11, v9, a5);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)disableAllTriggers
{
  void *v3;
  id v4;

  -[WFTriggerManager allConfiguredTriggers](self, "allConfiguredTriggers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_compactMap:", &__block_literal_global_179);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[WFTriggerManager disableTriggersWithIdentifiers:](self, "disableTriggersWithIdentifiers:", v4);
}

- (void)disableTriggersWithIdentifiers:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__WFTriggerManager_disableTriggersWithIdentifiers___block_invoke;
  v3[3] = &unk_1E7AF9D28;
  v3[4] = self;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v3);
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (WFDatabase)database
{
  return self->_database;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __51__WFTriggerManager_disableTriggersWithIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configuredTriggerForTriggerID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v7, "recordWithDescriptor:error:", v6, &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15;

  if (!v8)
  {
    getWFTriggerNotificationsLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[WFTriggerManager disableTriggersWithIdentifiers:]_block_invoke";
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_ERROR, "%s Could not disable trigger due to no existing record error: %@", buf, 0x16u);
    }
    goto LABEL_8;
  }
  objc_msgSend(v8, "setEnabled:", 0);
  objc_msgSend(*(id *)(a1 + 32), "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v9;
  v11 = objc_msgSend(v10, "saveRecord:withDescriptor:error:", v8, v6, &v14);
  v12 = v14;

  if ((v11 & 1) == 0)
  {
    getWFTriggerNotificationsLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[WFTriggerManager disableTriggersWithIdentifiers:]_block_invoke";
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_ERROR, "%s Could not disable trigger due to error: %@", buf, 0x16u);
    }
    v9 = v12;
LABEL_8:

    v12 = v9;
  }

}

id __38__WFTriggerManager_disableAllTriggers__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "isEnabled"))
  {
    objc_msgSend(v2, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __117__WFTriggerManager_associateWorkflowToTriggerID_deletingExistingReference_notifyDaemon_workflowReference_completion___block_invoke(uint64_t a1, id *a2)
{
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuredTriggerForTriggerID:", *(_QWORD *)(a1 + 40));
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 64))
    v5 = v13 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "database");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "workflowID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "referenceForWorkflowID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "database");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "deleteReference:error:", v8, a2);

      if ((v10 & 1) == 0)
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *a2);

        goto LABEL_11;
      }
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "associateWorkflowToTrigger:workflow:error:", v13, *(_QWORD *)(a1 + 48), a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *a2);
LABEL_11:

}

void __87__WFTriggerManager_saveNewConfiguredTrigger_workflowReference_notifyDaemon_completion___block_invoke(uint64_t a1, id *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createTriggerWithRecord:workflow:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *a2);
}

void __87__WFTriggerManager_saveNewConfiguredTrigger_workflowReference_notifyDaemon_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    getWFTriggersLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      v8 = 136315650;
      v9 = "-[WFTriggerManager saveNewConfiguredTrigger:workflowReference:notifyDaemon:completion:]_block_invoke_2";
      v10 = 2112;
      v11 = v7;
      v12 = 2114;
      v13 = v5;
      _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_ERROR, "%s failed to refresh new trigger (%@): %{public}@", (uint8_t *)&v8, 0x20u);
    }

  }
}

void __78__WFTriggerManager_saveNewConfiguredTrigger_workflow_notifyDaemon_completion___block_invoke(uint64_t a1, id *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;

  objc_msgSend(*(id *)(a1 + 32), "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createWorkflowWithOptions:error:", *(_QWORD *)(a1 + 40), a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "database");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "createTriggerWithRecord:workflow:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
      return;
    objc_msgSend(*(id *)(a1 + 32), "database");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "deleteReference:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), 0);

  }
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v14 = *a2;
  v15 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v14;

}

void __78__WFTriggerManager_saveNewConfiguredTrigger_workflow_notifyDaemon_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    getWFTriggersLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      v8 = 136315650;
      v9 = "-[WFTriggerManager saveNewConfiguredTrigger:workflow:notifyDaemon:completion:]_block_invoke_2";
      v10 = 2112;
      v11 = v7;
      v12 = 2114;
      v13 = v5;
      _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_ERROR, "%s failed to refresh new trigger (%@): %{public}@", (uint8_t *)&v8, 0x20u);
    }

  }
}

void __78__WFTriggerManager_saveNewConfiguredTrigger_workflow_notifyDaemon_completion___block_invoke_170(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    getWFTriggersLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      v8 = 136315650;
      v9 = "-[WFTriggerManager saveNewConfiguredTrigger:workflow:notifyDaemon:completion:]_block_invoke";
      v10 = 2112;
      v11 = v7;
      v12 = 2114;
      v13 = v5;
      _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_ERROR, "%s failed to refresh new trigger (%@): %{public}@", (uint8_t *)&v8, 0x20u);
    }

  }
}

void __69__WFTriggerManager_saveNewConfiguredTrigger_notifyDaemon_completion___block_invoke(uint64_t a1, id *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createTriggerWithRecord:error:", *(_QWORD *)(a1 + 40), a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *a2);
}

void __69__WFTriggerManager_saveNewConfiguredTrigger_notifyDaemon_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    getWFTriggersLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      v8 = 136315650;
      v9 = "-[WFTriggerManager saveNewConfiguredTrigger:notifyDaemon:completion:]_block_invoke_2";
      v10 = 2112;
      v11 = v7;
      v12 = 2114;
      v13 = v5;
      _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_ERROR, "%s failed to refresh new trigger (%@): %{public}@", (uint8_t *)&v8, 0x20u);
    }

  }
}

void __69__WFTriggerManager_saveNewConfiguredTrigger_notifyDaemon_completion___block_invoke_160(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    getWFTriggersLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      v8 = 136315650;
      v9 = "-[WFTriggerManager saveNewConfiguredTrigger:notifyDaemon:completion:]_block_invoke";
      v10 = 2112;
      v11 = v7;
      v12 = 2114;
      v13 = v5;
      _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_ERROR, "%s failed to refresh new trigger (%@): %{public}@", (uint8_t *)&v8, 0x20u);
    }

  }
}

void __30__WFTriggerManager_connection__block_invoke_147()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  getWFTriggersLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    v1 = 136315138;
    v2 = "-[WFTriggerManager connection]_block_invoke";
    _os_log_impl(&dword_1C15B3000, v0, OS_LOG_TYPE_ERROR, "%s Client connection invalidated to automationd", (uint8_t *)&v1, 0xCu);
  }

}

void __30__WFTriggerManager_connection__block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  getWFTriggersLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    v1 = 136315138;
    v2 = "-[WFTriggerManager connection]_block_invoke";
    _os_log_impl(&dword_1C15B3000, v0, OS_LOG_TYPE_ERROR, "%s Client connection to automationd interrupted", (uint8_t *)&v1, 0xCu);
  }

}

@end
