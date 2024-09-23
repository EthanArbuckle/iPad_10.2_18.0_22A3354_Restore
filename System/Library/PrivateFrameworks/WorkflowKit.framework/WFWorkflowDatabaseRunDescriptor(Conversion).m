@implementation WFWorkflowDatabaseRunDescriptor(Conversion)

- (id)workflowReferenceWithDatabase:()Conversion error:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  void *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(a1, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "referenceForWorkflowID:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(a1, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && !v7)
  {
    objc_msgSend(a1, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueVisibleReferenceForWorkflowName:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v7)
  {
    v11 = v7;
  }
  else
  {
    getWFXPCRunnerLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[WFWorkflowDatabaseRunDescriptor(Conversion) workflowReferenceWithDatabase:error:]";
      v25 = 2112;
      v26 = a1;
      _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_ERROR, "%s Couldn't find shortcut with descriptor: %@", buf, 0x16u);
    }

    if (a4)
    {
      objc_msgSend(a1, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = (void *)MEMORY[0x1E0CB3940];
        WFLocalizedString(CFSTR("Unable to find a shortcut named “%@”."));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "localizedStringWithFormat:", v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        WFLocalizedString(CFSTR("Unable to find the specified shortcut."));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v18 = (void *)MEMORY[0x1E0CB35C8];
      v21 = *MEMORY[0x1E0CB2D50];
      v22 = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("WFDatabaseErrorDomain"), 3, v19);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v7;
}

- (void)createWorkflowWithEnvironment:()Conversion database:completionHandler:
{
  id v8;
  void (**v9)(id, WFWorkflow *, id);
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  WFWorkflow *v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v8 = a4;
  v9 = a5;
  v19 = 0;
  objc_msgSend(a1, "workflowReferenceWithDatabase:error:", v8, &v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v19;
  v12 = v11;
  if (v10)
  {
    v18 = v11;
    objc_msgSend(v8, "workflowRecordForDescriptor:error:", v10, &v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v18;

    if (v13)
    {
      v17 = v14;
      v15 = -[WFWorkflow initWithRecord:reference:storageProvider:migrateIfNecessary:environment:error:]([WFWorkflow alloc], "initWithRecord:reference:storageProvider:migrateIfNecessary:environment:error:", v13, v10, 0, 1, a3, &v17);
      v16 = v17;

      v9[2](v9, v15, v16);
      v14 = v16;
    }
    else
    {
      v9[2](v9, 0, v14);
    }

    v12 = v14;
  }
  else
  {
    v9[2](v9, 0, v11);
  }

}

- (void)donateRunInteractionWithDatabase:()Conversion workflowReference:completionHandler:
{
  id v6;
  id v7;
  void *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a4;
  v7 = a5;
  v8 = v7;
  if (v6)
  {
    v9 = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD9A8]), "_init");
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CBDB28]), "initWithWorkflowReference:", v6);
    v11 = (int)*MEMORY[0x1E0CBDD50];
    v12 = *(void **)&v9[v11];
    *(_QWORD *)&v9[v11] = v10;

    objc_msgSend(v6, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setGroupIdentifier:", v13);

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __116__WFWorkflowDatabaseRunDescriptor_Conversion__donateRunInteractionWithDatabase_workflowReference_completionHandler___block_invoke;
    v14[3] = &unk_1E7AF9450;
    v15 = v6;
    v16 = v8;
    objc_msgSend(v9, "donateInteractionWithCompletion:", v14);

  }
  else
  {
    (*((void (**)(id))v7 + 2))(v7);
  }

}

@end
