@implementation VCVoiceShortcutPeaceMigrator

- (VCVoiceShortcutPeaceMigrator)initWithDatabase:(id)a3
{
  id v6;
  VCVoiceShortcutPeaceMigrator *v7;
  VCVoiceShortcutPeaceMigrator *v8;
  VCVoiceShortcutPeaceMigrator *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutPeaceMigrator.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database"));

  }
  v12.receiver = self;
  v12.super_class = (Class)VCVoiceShortcutPeaceMigrator;
  v7 = -[VCVoiceShortcutPeaceMigrator init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_database, a3);
    v9 = v8;
  }

  return v8;
}

- (BOOL)migrateWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  BOOL v17;
  _QWORD v19[4];
  id v20;
  _QWORD aBlock[4];
  id v22;
  VCVoiceShortcutPeaceMigrator *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = (void *)os_transaction_create();
  -[VCVoiceShortcutPeaceMigrator database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__17211;
  v30 = __Block_byref_object_dispose__17212;
  v31 = 0;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__VCVoiceShortcutPeaceMigrator_migrateWithError___block_invoke;
  aBlock[3] = &unk_1E7AEE370;
  v9 = v7;
  v22 = v9;
  v23 = self;
  v24 = &v26;
  v25 = &v32;
  v10 = _Block_copy(aBlock);
  -[VCVoiceShortcutPeaceMigrator database](self, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __49__VCVoiceShortcutPeaceMigrator_migrateWithError___block_invoke_138;
  v19[3] = &unk_1E7AEE398;
  v12 = v10;
  v20 = v12;
  objc_msgSend(v11, "performTransactionWithReason:block:error:", CFSTR("peace migration"), v19, 0);

  if (v27[5])
  {
    getWFPeaceMigrationLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = v27[5];
      *(_DWORD *)buf = 136315394;
      v37 = "-[VCVoiceShortcutPeaceMigrator migrateWithError:]";
      v38 = 2114;
      v39 = v14;
      _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_ERROR, "%s Shortcut migration from CoreData failed with error: %{public}@", buf, 0x16u);
    }

  }
  else
  {
    getWFPeaceMigrationLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v37 = "-[VCVoiceShortcutPeaceMigrator migrateWithError:]";
      _os_log_impl(&dword_1C15B3000, v15, OS_LOG_TYPE_INFO, "%s Shortcut migration from CoreData succeeded", buf, 0xCu);
    }

    if (v33[3])
    {
      getWFPeaceMigrationLogObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v37 = "-[VCVoiceShortcutPeaceMigrator migrateWithError:]";
        _os_log_impl(&dword_1C15B3000, v16, OS_LOG_TYPE_INFO, "%s At least one voice shortcut was migrated, marking migration as complete", buf, 0xCu);
      }

      +[WFCloudKitSyncSession setVoiceShortcutMigrationDidRun:](WFCloudKitSyncSession, "setVoiceShortcutMigrationDidRun:", 1);
    }
  }
  if (a3)
    *a3 = objc_retainAutorelease((id)v27[5]);
  v17 = v27[5] == 0;

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v17;
}

- (BOOL)migrateObject:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  BOOL v14;
  NSObject *v15;
  id v16;
  WFWorkflowRecord *v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v27;
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "entity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("VCVoiceShortcutManagedObject"));

  if (v9)
  {
    objc_msgSend(v6, "valueForKey:", CFSTR("identifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();
    v12 = v10;
    if (v12 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      getWFGeneralLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315906;
        v30 = "WFEnforceClass";
        v31 = 2114;
        v32 = v12;
        v33 = 2114;
        v34 = (id)objc_opt_class();
        v35 = 2114;
        v36 = v11;
        v16 = v34;
        _os_log_impl(&dword_1C15B3000, v15, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);

      }
      v13 = 0;
    }
    else
    {
      v13 = v12;
    }

    v28 = 0;
    v17 = -[WFWorkflowRecord initWithPeaceCoreDataModel:error:]([WFWorkflowRecord alloc], "initWithPeaceCoreDataModel:error:", v6, &v28);
    v18 = v28;
    if (v17)
    {
      objc_msgSend(v13, "UUIDString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      v14 = -[VCVoiceShortcutPeaceMigrator saveRecord:withIdentifier:error:](self, "saveRecord:withIdentifier:error:", v17, v19, &v27);
      v20 = v27;

      getWFPeaceMigrationLogObject();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v14)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v13, "UUIDString");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v30 = "-[VCVoiceShortcutPeaceMigrator migrateObject:error:]";
          v31 = 2114;
          v32 = v23;
          _os_log_impl(&dword_1C15B3000, v22, OS_LOG_TYPE_INFO, "%s Successfully saved voice shortcut (%{public}@) to database", buf, 0x16u);

        }
      }
      else
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315650;
          v30 = "-[VCVoiceShortcutPeaceMigrator migrateObject:error:]";
          v31 = 2112;
          v32 = v6;
          v33 = 2114;
          v34 = v18;
          _os_log_impl(&dword_1C15B3000, v22, OS_LOG_TYPE_FAULT, "%s Failed to convert %@ to a workflow record: %{public}@", buf, 0x20u);
        }

        if (a4)
          *a4 = objc_retainAutorelease(v20);
      }

    }
    else
    {
      getWFPeaceMigrationLogObject();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v13, "UUIDString");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v30 = "-[VCVoiceShortcutPeaceMigrator migrateObject:error:]";
        v31 = 2114;
        v32 = v25;
        v33 = 2114;
        v34 = v18;
        _os_log_impl(&dword_1C15B3000, v24, OS_LOG_TYPE_FAULT, "%s Failed to convert voice shortcut (%{public}@) to a workflow record: %{public}@", buf, 0x20u);

      }
      v14 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v18);
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)saveRecord:(id)a3 withIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  WFWorkflow *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  BOOL v21;
  NSObject *v22;
  id v23;
  void *v24;
  NSObject *v25;
  NSObject *p_super;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  uint64_t v31;
  WFWorkflowCreationOptions *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  uint64_t v51;
  void *v52;
  char v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  NSObject *loga;
  os_log_t log;
  NSObject *v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  id v66;
  id v67[2];
  id v68;
  uint8_t buf[4];
  const char *v70;
  __int16 v71;
  NSObject *v72;
  __int16 v73;
  NSObject *v74;
  __int16 v75;
  uint64_t v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[VCVoiceShortcutPeaceMigrator database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v68 = 0;
    v12 = -[WFWorkflow initWithRecord:reference:storageProvider:error:]([WFWorkflow alloc], "initWithRecord:reference:storageProvider:error:", v8, 0, 0, &v68);
    v13 = v68;
    if (v12)
    {
      v14 = -[NSObject length](v9, "length");
      getWFPeaceMigrationLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v14)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v70 = "-[VCVoiceShortcutPeaceMigrator saveRecord:withIdentifier:error:]";
          v71 = 2114;
          v72 = v9;
          _os_log_impl(&dword_1C15B3000, v16, OS_LOG_TYPE_INFO, "%s Migrating voice shortcut with identifier %{public}@", buf, 0x16u);
        }

        -[WFWorkflow actions](v12, "actions");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = v18;
        if (v19)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v20 = v19;
          else
            v20 = 0;
        }
        else
        {
          v20 = 0;
        }
        v23 = v20;

        objc_msgSend(v23, "intent");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v24 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          objc_msgSend(v10, "referenceForWorkflowID:", v9);
          v31 = objc_claimAutoreleasedReturnValue();
          if (v31)
          {
            v24 = (void *)v31;
            getWFPeaceMigrationLogObject();
            p_super = objc_claimAutoreleasedReturnValue();
            v21 = 1;
            if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v70 = "-[VCVoiceShortcutPeaceMigrator saveRecord:withIdentifier:error:]";
              v71 = 2114;
              v72 = v9;
              _os_log_impl(&dword_1C15B3000, p_super, OS_LOG_TYPE_INFO, "%s Voice shortcut (%{public}@) was migrated previously", buf, 0x16u);
            }
          }
          else
          {
            v64 = v19;
            v32 = -[WFWorkflowCreationOptions initWithRecord:]([WFWorkflowCreationOptions alloc], "initWithRecord:", v8);
            -[WFWorkflowCreationOptions setIdentifier:](v32, "setIdentifier:", v9);
            objc_msgSend(v8, "addWatchWorkflowTypeIfEligible");
            v66 = 0;
            p_super = &v32->super;
            objc_msgSend(v10, "createWorkflowWithOptions:error:", v32, &v66);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v66;
            v21 = v33 != 0;

            if (!v33)
            {
              getWFPeaceMigrationLogObject();
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 136315650;
                v70 = "-[VCVoiceShortcutPeaceMigrator saveRecord:withIdentifier:error:]";
                v71 = 2114;
                v72 = v9;
                v73 = 2114;
                v74 = v34;
                _os_log_impl(&dword_1C15B3000, v35, OS_LOG_TYPE_FAULT, "%s Failed to save new shortcut for voice shortcut (%{public}@): %{public}@", buf, 0x20u);
              }

              if (a5)
                *a5 = objc_retainAutorelease(v34);
            }

            v24 = 0;
            v19 = v64;
          }
          goto LABEL_52;
        }
        objc_msgSend(v24, "workflowForIntentInDatabase:", v10);
        v25 = objc_claimAutoreleasedReturnValue();
        p_super = v25;
        if (!v25)
        {
          getWFPeaceMigrationLogObject();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v24, "workflow");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "spokenPhrase");
            v36 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "workflow");
            loga = v30;
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "vocabularyIdentifier");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315906;
            v70 = "-[VCVoiceShortcutPeaceMigrator saveRecord:withIdentifier:error:]";
            v71 = 2114;
            v72 = v9;
            v73 = 2112;
            v74 = v36;
            v75 = 2114;
            v76 = (uint64_t)v37;
            _os_log_impl(&dword_1C15B3000, loga, OS_LOG_TYPE_ERROR, "%s Voice shortcut (%{public}@) references a nonexistent shortcut \"%@\", with identifier %{public}@", buf, 0x2Au);

            v30 = loga;
          }
          v21 = 0;
          goto LABEL_51;
        }
        v63 = v19;
        -[NSObject name](v25, "name");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "name");
        v61 = p_super;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v27, "isEqualToString:", v28);

        if (v29)
        {
          p_super = v61;
          getWFPeaceMigrationLogObject();
          v30 = objc_claimAutoreleasedReturnValue();
          v21 = 1;
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v70 = "-[VCVoiceShortcutPeaceMigrator saveRecord:withIdentifier:error:]";
            v71 = 2114;
            v72 = v9;
            _os_log_impl(&dword_1C15B3000, v30, OS_LOG_TYPE_INFO, "%s Voice shortcut (%{public}@) references a shortcut of the same name", buf, 0x16u);
          }
          v19 = v63;
          goto LABEL_51;
        }
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("name"), CFSTR("legacyName"), 0);
        v67[1] = 0;
        p_super = v61;
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "recordWithDescriptor:properties:error:", v61);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        log = (os_log_t)0;
        v57 = v38;
        if (!v38)
        {
          getWFPeaceMigrationLogObject();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
          {
            -[NSObject name](v61, "name");
            v44 = objc_claimAutoreleasedReturnValue();
            -[NSObject identifier](v61, "identifier");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315906;
            v70 = "-[VCVoiceShortcutPeaceMigrator saveRecord:withIdentifier:error:]";
            v71 = 2114;
            v72 = v9;
            v73 = 2112;
            v74 = v44;
            v75 = 2114;
            v76 = (uint64_t)v45;
            _os_log_impl(&dword_1C15B3000, v43, OS_LOG_TYPE_FAULT, "%s Voice shortcut (%{public}@) failed to load existing shortcut \"%@\", with identifier %{public}@", buf, 0x2Au);

            p_super = v61;
          }
          v42 = v43;
          v21 = 0;
          v19 = v63;
          goto LABEL_49;
        }
        objc_msgSend(v38, "legacyName");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "length");

        if (v40)
        {
          getWFPeaceMigrationLogObject();
          v41 = objc_claimAutoreleasedReturnValue();
          v21 = 1;
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v70 = "-[VCVoiceShortcutPeaceMigrator saveRecord:withIdentifier:error:]";
            v71 = 2114;
            v72 = v9;
            _os_log_impl(&dword_1C15B3000, v41, OS_LOG_TYPE_INFO, "%s Voice shortcut (%{public}@) references a shortcut that already has a legacy name", buf, 0x16u);
          }
          v42 = v41;
          p_super = v61;
          v19 = v63;
          goto LABEL_49;
        }
        objc_msgSend(v38, "name");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setLegacyName:", v47);

        objc_msgSend(v8, "name");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setName:", v48);

        getWFPeaceMigrationLogObject();
        v49 = v38;
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v49, "name");
          v55 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "legacyName");
          v51 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          v70 = "-[VCVoiceShortcutPeaceMigrator saveRecord:withIdentifier:error:]";
          v71 = 2114;
          v72 = v9;
          v73 = 2112;
          v74 = v55;
          v75 = 2112;
          v76 = v51;
          v52 = (void *)v51;
          _os_log_impl(&dword_1C15B3000, v50, OS_LOG_TYPE_INFO, "%s Voice shortcut (%{public}@) references a shortcut with a different name. Swapping the name to \"%@\" and moving \"%@\" to the legacyName", buf, 0x2Au);

        }
        v67[0] = 0;
        p_super = v61;
        v53 = objc_msgSend(v10, "saveRecord:withDescriptor:error:", v49, v61, v67);
        v56 = v67[0];
        if ((v53 & 1) != 0)
        {
          v21 = 1;
          v19 = v63;
        }
        else
        {
          getWFPeaceMigrationLogObject();
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315650;
            v70 = "-[VCVoiceShortcutPeaceMigrator saveRecord:withIdentifier:error:]";
            v71 = 2114;
            v72 = v9;
            v73 = 2114;
            v74 = v56;
            _os_log_impl(&dword_1C15B3000, v54, OS_LOG_TYPE_FAULT, "%s Failed to save existing shortcut for voice shortcut (%{public}@): %{public}@", buf, 0x20u);
          }

          v19 = v63;
          if (a5)
          {
            v42 = objc_retainAutorelease(v56);
            v21 = 0;
            *a5 = v42;
LABEL_49:
            v30 = log;
LABEL_50:

LABEL_51:
LABEL_52:

            goto LABEL_53;
          }
          v21 = 0;
        }
        v30 = log;
        v42 = v56;
        goto LABEL_50;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v70 = "-[VCVoiceShortcutPeaceMigrator saveRecord:withIdentifier:error:]";
        _os_log_impl(&dword_1C15B3000, v16, OS_LOG_TYPE_FAULT, "%s Voice shortcut record does not have an associated identifier", buf, 0xCu);
      }

    }
    else
    {
      getWFPeaceMigrationLogObject();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v70 = "-[VCVoiceShortcutPeaceMigrator saveRecord:withIdentifier:error:]";
        v71 = 2114;
        v72 = v13;
        _os_log_impl(&dword_1C15B3000, v22, OS_LOG_TYPE_FAULT, "%s Voice shortcut workflow data failed to open: %{public}@", buf, 0x16u);
      }

      if (a5)
      {
        v21 = 0;
        *a5 = objc_retainAutorelease(v13);
LABEL_53:

        goto LABEL_54;
      }
    }
    v21 = 0;
    goto LABEL_53;
  }
  getWFPeaceMigrationLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    v70 = "-[VCVoiceShortcutPeaceMigrator saveRecord:withIdentifier:error:]";
    _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_FAULT, "%s Workflow record is missing a name and cannot be migrated", buf, 0xCu);
  }
  v21 = 0;
LABEL_54:

  return v21;
}

- (WFDatabase)database
{
  return self->_database;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
}

void __49__VCVoiceShortcutPeaceMigrator_migrateWithError___block_invoke(_QWORD *a1)
{
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  id v24;
  uint64_t v25;
  id *v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  char v39;
  NSObject *v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id v56;
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  id v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v2 = 0x1E0C97000uLL;
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("VCVoiceShortcutManagedObject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isMarkedAsDeleted == NO"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v4);

  v5 = (void *)a1[4];
  v56 = 0;
  v43 = v3;
  objc_msgSend(v5, "executeFetchRequest:error:", v3, &v56);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v56;
  v41 = v56;
  v42 = v6;
  if (v41)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v7);
    getWFPeaceMigrationLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
LABEL_5:

      goto LABEL_6;
    }
    v9 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    *(_DWORD *)buf = 136315394;
    v58 = "-[VCVoiceShortcutPeaceMigrator migrateWithError:]_block_invoke";
    v59 = 2114;
    v60 = v9;
    v10 = "%s Failed to fetch voice shortcuts from CoreData: %{public}@";
    v11 = v8;
    v12 = OS_LOG_TYPE_FAULT;
    v13 = 22;
LABEL_4:
    _os_log_impl(&dword_1C15B3000, v11, v12, v10, buf, v13);
    goto LABEL_5;
  }
  if (!objc_msgSend(v6, "count"))
  {
    getWFPeaceMigrationLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      goto LABEL_5;
    *(_DWORD *)buf = 136315138;
    v58 = "-[VCVoiceShortcutPeaceMigrator migrateWithError:]_block_invoke";
    v10 = "%s No voice shortcuts found in CoreData database";
    v11 = v8;
    v12 = OS_LOG_TYPE_INFO;
    v13 = 12;
    goto LABEL_4;
  }
  v55 = 0u;
  v53 = 0u;
  v54 = 0u;
  v52 = 0u;
  v14 = v6;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v53 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
        v20 = (void *)MEMORY[0x1C3BB3598]();
        v21 = (void *)a1[5];
        v51 = 0;
        v22 = objc_msgSend(v21, "migrateObject:error:", v19, &v51);
        v23 = v51;
        v24 = v51;
        if ((v22 & 1) != 0)
        {
          ++*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
        }
        else
        {
          v25 = *(_QWORD *)(a1[6] + 8);
          v27 = *(_QWORD *)(v25 + 40);
          v26 = (id *)(v25 + 40);
          if (!v27)
            objc_storeStrong(v26, v23);
        }

        objc_autoreleasePoolPop(v20);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
    }
    while (v16);
  }

  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = objc_msgSend(&unk_1E7B8D868, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
    if (v45)
    {
      v44 = *(_QWORD *)v48;
      do
      {
        for (j = 0; j != v45; ++j)
        {
          if (*(_QWORD *)v48 != v44)
            objc_enumerationMutation(&unk_1E7B8D868);
          v29 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j);
          v30 = v2;
          objc_msgSend(*(id *)(v2 + 2888), "fetchRequestWithEntityName:", v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v31);
          v33 = (void *)a1[4];
          v46 = 0;
          objc_msgSend(v33, "executeRequest:error:", v32, &v46);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v46;
          objc_msgSend(v34, "result");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (v36)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v37 = v36;
            else
              v37 = 0;
          }
          else
          {
            v37 = 0;
          }
          v38 = v37;

          v39 = objc_msgSend(v38, "BOOLValue");
          if ((v39 & 1) == 0)
          {
            getWFPeaceMigrationLogObject();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315650;
              v58 = "-[VCVoiceShortcutPeaceMigrator migrateWithError:]_block_invoke";
              v59 = 2114;
              v60 = v29;
              v61 = 2114;
              v62 = v35;
              _os_log_impl(&dword_1C15B3000, v40, OS_LOG_TYPE_FAULT, "%s Failed to delete migrated %{public}@s: %{public}@", buf, 0x20u);
            }

          }
          v2 = v30;
        }
        v45 = objc_msgSend(&unk_1E7B8D868, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
      }
      while (v45);
    }
  }
LABEL_6:

}

uint64_t __49__VCVoiceShortcutPeaceMigrator_migrateWithError___block_invoke_138(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)migrateFromCloudKitIntoDatabaseIfNecessary:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  VCVoiceShortcutPeaceMigrator *v9;
  VCCKVoiceShortcutFetcher *v10;
  id v11;
  NSObject *v12;
  VCCKVoiceShortcutFetcher *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, char, void *);
  void *v17;
  id v18;
  _QWORD v19[4];
  VCVoiceShortcutPeaceMigrator *v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[WFCloudKitSyncSession voiceShortcutMigrationDidRun](WFCloudKitSyncSession, "voiceShortcutMigrationDidRun"))
  {
    getWFPeaceMigrationLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "+[VCVoiceShortcutPeaceMigrator migrateFromCloudKitIntoDatabaseIfNecessary:]";
      _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_INFO, "%s Previously migrated voice shortcuts, will not migrate them again", buf, 0xCu);
    }
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x1E0CA5870]);
    v4 = objc_msgSend(v5, "initWithBundleIdentifier:allowPlaceholder:error:", *MEMORY[0x1E0DC7FD8], 0, 0);
    -[NSObject applicationState](v4, "applicationState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isInstalled");

    if ((v7 & 1) != 0)
    {
      v8 = (void *)os_transaction_create();
      v9 = -[VCVoiceShortcutPeaceMigrator initWithDatabase:]([VCVoiceShortcutPeaceMigrator alloc], "initWithDatabase:", v3);
      v10 = [VCCKVoiceShortcutFetcher alloc];
      v18 = v8;
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __75__VCVoiceShortcutPeaceMigrator_migrateFromCloudKitIntoDatabaseIfNecessary___block_invoke;
      v19[3] = &unk_1E7AEEFF0;
      v20 = v9;
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __75__VCVoiceShortcutPeaceMigrator_migrateFromCloudKitIntoDatabaseIfNecessary___block_invoke_115;
      v17 = &unk_1E7AEE348;
      v11 = v8;
      v12 = v9;
      v13 = -[VCCKVoiceShortcutFetcher initWithRecordHandler:completionHandler:](v10, "initWithRecordHandler:completionHandler:", v19, &v14);
      -[VCCKVoiceShortcutFetcher start](v13, "start", v14, v15, v16, v17);

    }
    else
    {
      getWFPeaceMigrationLogObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v22 = "+[VCVoiceShortcutPeaceMigrator migrateFromCloudKitIntoDatabaseIfNecessary:]";
        _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_INFO, "%s Shortcuts app is not installed, will not attempt to migrate voice shortcuts from Peace", buf, 0xCu);
      }
    }

  }
}

void __75__VCVoiceShortcutPeaceMigrator_migrateFromCloudKitIntoDatabaseIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  WFWorkflowRecord *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  NSObject *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1C3BB3598]();
  v16 = 0;
  v5 = -[WFWorkflowRecord initWithPeaceCloudKitRecord:error:]([WFWorkflowRecord alloc], "initWithPeaceCloudKitRecord:error:", v3, &v16);
  v6 = v16;
  if (v5)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v3, "recordID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recordName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v10 = objc_msgSend(v7, "saveRecord:withIdentifier:error:", v5, v9, &v15);
    v11 = v15;

    if ((v10 & 1) == 0)
    {
      getWFPeaceMigrationLogObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
LABEL_8:

        goto LABEL_9;
      }
      objc_msgSend(v3, "recordID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "recordName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v18 = "+[VCVoiceShortcutPeaceMigrator migrateFromCloudKitIntoDatabaseIfNecessary:]_block_invoke";
      v19 = 2114;
      v20 = v14;
      v21 = 2114;
      v22 = v11;
      _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_ERROR, "%s Failed to save CloudKit record (%{public}@): %{public}@", buf, 0x20u);

LABEL_7:
      goto LABEL_8;
    }
  }
  else
  {
    getWFPeaceMigrationLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "recordID");
      v12 = objc_claimAutoreleasedReturnValue();
      -[NSObject recordName](v12, "recordName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v18 = "+[VCVoiceShortcutPeaceMigrator migrateFromCloudKitIntoDatabaseIfNecessary:]_block_invoke";
      v19 = 2114;
      v20 = v13;
      v21 = 2114;
      v22 = v6;
      _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_ERROR, "%s Failed to convert CloudKit record (%{public}@) into a workflow record: %{public}@", buf, 0x20u);
      goto LABEL_7;
    }
  }
LABEL_9:

  objc_autoreleasePoolPop(v4);
}

void __75__VCVoiceShortcutPeaceMigrator_migrateFromCloudKitIntoDatabaseIfNecessary___block_invoke_115(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFPeaceMigrationLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 136315138;
      v8 = "+[VCVoiceShortcutPeaceMigrator migrateFromCloudKitIntoDatabaseIfNecessary:]_block_invoke";
      _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_INFO, "%s Successfully migrated voice shortcuts from CloudKit", (uint8_t *)&v7, 0xCu);
    }

    +[WFCloudKitSyncSession setVoiceShortcutMigrationDidRun:](WFCloudKitSyncSession, "setVoiceShortcutMigrationDidRun:", 1);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "+[VCVoiceShortcutPeaceMigrator migrateFromCloudKitIntoDatabaseIfNecessary:]_block_invoke";
      v9 = 2114;
      v10 = v4;
      _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_ERROR, "%s Failed to migrate all CloudKit records: %{public}@", (uint8_t *)&v7, 0x16u);
    }

  }
}

@end
