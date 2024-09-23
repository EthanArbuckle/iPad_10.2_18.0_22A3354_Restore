@implementation WFINShortcutRunDescriptor(Conversion)

- (void)createWorkflowWithEnvironment:()Conversion database:completionHandler:
{
  void (**v7)(id, _QWORD, id);
  void *v8;
  void *v9;
  void *v10;
  id v11;
  WFWorkflow *v12;
  void *v13;
  WFWorkflow *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  objc_msgSend(a1, "shortcut");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v9, "createActionWithShortcut:error:", v8, &v24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v24;

  if (v10)
  {
    v12 = [WFWorkflow alloc];
    v13 = (void *)objc_opt_new();
    v23 = 0;
    v14 = -[WFWorkflow initWithRecord:reference:storageProvider:migrateIfNecessary:environment:error:](v12, "initWithRecord:reference:storageProvider:migrateIfNecessary:environment:error:", v13, 0, 0, 0, a3, &v23);
    v15 = v23;

    if (!v14)
    {
      v7[2](v7, 0, v15);
LABEL_13:

      goto LABEL_14;
    }
    -[WFWorkflow addAction:](v14, "addAction:", v10);
    objc_msgSend(v8, "userActivity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v8, "userActivity");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "title");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v8, "intent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
LABEL_12:
        ((void (**)(id, WFWorkflow *, id))v7)[2](v7, v14, 0);
        goto LABEL_13;
      }
      objc_msgSend(v8, "intent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_title");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v21 = v18;
    v22 = (void *)objc_msgSend(v18, "copy");
    -[WFWorkflow setName:](v14, "setName:", v22);

    goto LABEL_12;
  }
  getWFGeneralLogObject();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v26 = "-[WFINShortcutRunDescriptor(Conversion) createWorkflowWithEnvironment:database:completionHandler:]";
    v27 = 2112;
    v28 = v8;
    v29 = 2112;
    v30 = v11;
    _os_log_impl(&dword_1C15B3000, v19, OS_LOG_TYPE_ERROR, "%s Unable to create action from INShortcut: %@, error: %@", buf, 0x20u);
  }

  v7[2](v7, 0, v11);
LABEL_14:

}

- (void)donateRunInteractionWithDatabase:()Conversion workflowReference:completionHandler:
{
  id v6;
  void *v7;
  void *v8;
  char *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a5;
  objc_msgSend(a1, "shortcut");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD9A8]), "_init");
    objc_storeStrong((id *)&v9[*MEMORY[0x1E0CBDD50]], v8);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __110__WFINShortcutRunDescriptor_Conversion__donateRunInteractionWithDatabase_workflowReference_completionHandler___block_invoke;
    v10[3] = &unk_1E7AF9450;
    v11 = v8;
    v12 = v6;
    objc_msgSend(v9, "donateInteractionWithCompletion:", v10);

  }
}

@end
