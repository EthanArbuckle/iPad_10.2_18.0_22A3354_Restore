@implementation WFShareSheetWorkflowProvider

- (WFShareSheetWorkflowProvider)initWithDatabaseProvider:(id)a3
{
  id v6;
  WFShareSheetWorkflowProvider *v7;
  void *v9;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFShareSheetWorkflowProvider.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("databaseProvider"));

    if (!self)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (self)
  {
LABEL_3:
    objc_storeStrong((id *)&self->_databaseProvider, a3);
    v7 = self;
  }
LABEL_4:

  return self;
}

- (id)shareSheetWorkflowsForExtensionMatchingDictionaries:(id)a3 hostBundleIdentifier:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  id obj;
  void *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  id v54;
  uint8_t v55[128];
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFShareSheetWorkflowProvider.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extensionMatchingDictionaries"));

  }
  VCOSTransactionWithName((uint64_t)CFSTR("shareSheetWorkflowReferencesForExtensionMatchingDictionaries"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13ED0], "sharedRegistry");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentItemClassesForShareSheetWithExtensionMatchingDictionaries:hostBundleIdentifier:", v9, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = v13;
  if (objc_msgSend(v13, "count"))
  {
    -[WFShareSheetWorkflowProvider databaseProvider](self, "databaseProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0;
    objc_msgSend(v14, "databaseWithError:", &v54);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v54;

    v45 = v15;
    if (v15)
    {
      v41 = v16;
      v42 = v11;
      v43 = v10;
      v44 = v9;
      objc_msgSend(v15, "sortedVisibleWorkflowsWithType:", *MEMORY[0x1E0DC8500]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("inputClasses"), CFSTR("workflowTypes"), 0);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (id)objc_opt_new();
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v40 = v17;
      objc_msgSend(v17, "descriptors");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      if (v18)
      {
        v19 = v18;
        v20 = v15;
        v21 = *(_QWORD *)v51;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v51 != v21)
              objc_enumerationMutation(obj);
            v23 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
            objc_msgSend(v20, "recordWithDescriptor:properties:error:", v23, v48, 0);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "inputClasses");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "if_compactMap:", &__block_literal_global_4181);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            v27 = objc_alloc(MEMORY[0x1E0C99E60]);
            v28 = (void *)MEMORY[0x1E0DD9EF8];
            objc_msgSend(v24, "workflowTypes");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "effectiveInputClassesFromInputClasses:workflowTypes:", v26, v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = (void *)objc_msgSend(v27, "initWithArray:", v30);

            if (objc_msgSend(v49, "intersectsSet:", v31))
            {
              v32 = objc_alloc(MEMORY[0x1E0DC7C68]);
              objc_msgSend(v23, "identifier");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "name");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "icon");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = (void *)objc_msgSend(v32, "initWithIdentifier:name:glyphCharacter:", v33, v34, objc_msgSend(v35, "glyphCharacter"));

              v20 = v45;
              objc_msgSend(v46, "addObject:", v36);

            }
          }
          v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
        }
        while (v19);
      }

      v10 = v43;
      v9 = v44;
      v16 = v41;
      v11 = v42;
    }
    else
    {
      getWFGeneralLogObject();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v57 = "-[WFShareSheetWorkflowProvider shareSheetWorkflowsForExtensionMatchingDictionaries:hostBundleIdentifier:error:]";
        v58 = 2114;
        v59 = v16;
        _os_log_impl(&dword_1C146A000, v37, OS_LOG_TYPE_DEFAULT, "%s Database is not available, returning empty array of share sheet workflow references, error = %{public}@", buf, 0x16u);
      }

      if (a5)
        *a5 = objc_retainAutorelease(v16);
      v46 = (id)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v46 = (id)MEMORY[0x1E0C9AA60];
  }

  return v46;
}

- (id)generateSingleUseTokenForWorkflowIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFShareSheetWorkflowProvider.m"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workflowIdentifier"));

  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWorkflowIdentifier:forToken:", v5, v7);

  return v7;
}

- (WFDatabaseProvider)databaseProvider
{
  return self->_databaseProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseProvider, 0);
}

Class __111__WFShareSheetWorkflowProvider_shareSheetWorkflowsForExtensionMatchingDictionaries_hostBundleIdentifier_error___block_invoke(int a1, NSString *aClassName)
{
  return NSClassFromString(aClassName);
}

@end
