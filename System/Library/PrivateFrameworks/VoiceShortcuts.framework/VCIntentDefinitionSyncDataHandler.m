@implementation VCIntentDefinitionSyncDataHandler

- (VCIntentDefinitionSyncDataHandler)initWithEventHandler:(id)a3
{
  id v6;
  VCIntentDefinitionSyncDataHandler *v7;
  VCIntentDefinitionSyncDataHandler *v8;
  void *v9;
  void *v10;
  void *v11;
  VCIntentDefinitionSyncDataHandler *v12;
  void *v14;
  objc_super v15;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCIntentDefinitionSyncDataHandler.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("eventHandler"));

  }
  v15.receiver = self;
  v15.super_class = (Class)VCIntentDefinitionSyncDataHandler;
  v7 = -[VCSyncDataHandler init](&v15, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_eventHandler, a3);
    -[VCIntentDefinitionSyncDataHandler eventHandler](v8, "eventHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:", v8, sel_installedApplicationsDidChange_, CFSTR("ApplicationRegistered"));

    -[VCIntentDefinitionSyncDataHandler eventHandler](v8, "eventHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:", v8, sel_installedApplicationsDidChange_, CFSTR("ApplicationUnregistered"));

    -[VCIntentDefinitionSyncDataHandler eventHandler](v8, "eventHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:", v8, sel_installedApplicationsDidChange_, CFSTR("ApplicationStateChanged"));

    v12 = v8;
  }

  return v8;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[VCIntentDefinitionSyncDataHandler eventHandler](self, "eventHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:", self, CFSTR("ApplicationRegistered"));

  -[VCIntentDefinitionSyncDataHandler eventHandler](self, "eventHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:", self, CFSTR("ApplicationUnregistered"));

  -[VCIntentDefinitionSyncDataHandler eventHandler](self, "eventHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:", self, CFSTR("ApplicationStateChanged"));

  v6.receiver = self;
  v6.super_class = (Class)VCIntentDefinitionSyncDataHandler;
  -[VCIntentDefinitionSyncDataHandler dealloc](&v6, sel_dealloc);
}

- (void)installedApplicationsDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  char v8;
  id v9;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isPlaceholder"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v5;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v9;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  v8 = objc_msgSend(v7, "BOOLValue");
  if ((v8 & 1) == 0)
    -[VCSyncDataHandler requestSync](self, "requestSync");

}

- (id)unsyncedChangesForSyncService:(id)a3 metadata:(id *)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  VCIntentDefinitionSyncDataHandler *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = objc_msgSend((id)objc_opt_class(), "changeClass");
  v10 = (void *)objc_opt_new();
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__3943;
  v27 = __Block_byref_object_dispose__3944;
  v28 = 0;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __82__VCIntentDefinitionSyncDataHandler_unsyncedChangesForSyncService_metadata_error___block_invoke;
  v18 = &unk_1E7AA6C28;
  v22 = v9;
  v11 = v10;
  v19 = v11;
  v20 = self;
  v21 = &v23;
  v12 = _Block_copy(&v15);
  VCAccessSyncServiceIntentDefinitionState(v8, v12, (NSObject **)a5);
  *a4 = objc_retainAutorelease((id)v24[5]);
  objc_msgSend(v11, "allObjects", v15, v16, v17, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v23, 8);
  return v13;
}

- (BOOL)markChangesAsSynced:(id)a3 withSyncService:(id)a4 metadata:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD aBlock[4];
  id v18;
  id v19;
  VCIntentDefinitionSyncDataHandler *v20;

  v10 = a3;
  v11 = a5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__VCIntentDefinitionSyncDataHandler_markChangesAsSynced_withSyncService_metadata_error___block_invoke;
  aBlock[3] = &unk_1E7AA6C50;
  v18 = v10;
  v19 = v11;
  v20 = self;
  v12 = v11;
  v13 = v10;
  v14 = a4;
  v15 = _Block_copy(aBlock);
  LOBYTE(a6) = VCAccessSyncServiceIntentDefinitionState(v14, v15, (NSObject **)a6);

  return (char)a6;
}

- (BOOL)resetSyncStateForService:(id)a3 error:(id *)a4
{
  return VCClearSyncServiceState(a3, CFSTR("IntentDefinitions.plist"), a4);
}

- (BOOL)applyChanges:(id)a3 fromSyncService:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  char v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  id v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  __int128 v43;
  uint64_t v44;
  id v45;
  id *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  char v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  id v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  const char *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  void *v71;
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
  if (!v9)
  {
    v52 = 1;
    goto LABEL_45;
  }
  v11 = v9;
  v12 = *(_QWORD *)v61;
  v52 = 1;
  *(_QWORD *)&v10 = 136315394;
  v43 = v10;
  v45 = v8;
  v46 = a5;
  v49 = v7;
  v44 = *(_QWORD *)v61;
  do
  {
    v13 = 0;
    v47 = v11;
    do
    {
      if (*(_QWORD *)v61 != v12)
        objc_enumerationMutation(v8);
      v14 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v13);
      WFSyncedDefinitionDirectoryURL();
      v15 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      WFDefinitionDirectoryURLForBundleIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v59 = 0;
      LOBYTE(v15) = objc_msgSend(v7, "removeItemAtURL:error:", v17, &v59);
      v18 = v59;
      v19 = v18;
      if ((v15 & 1) == 0)
      {
        if (objc_msgSend(v18, "vc_isFileNotFound"))
        {

          v19 = 0;
        }
        else if (v19)
        {
          getWFWatchSyncLogObject();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v43;
            v65 = "-[VCIntentDefinitionSyncDataHandler applyChanges:fromSyncService:error:]";
            v66 = 2114;
            v67 = v14;
            _os_log_impl(&dword_1C146A000, v20, OS_LOG_TYPE_ERROR, "%s Could not delete directory for change: %{public}@", buf, 0x16u);
          }

          if (a5)
          {
            v19 = objc_retainAutorelease(v19);
            v52 = 0;
            *a5 = v19;
          }
          else
          {
            v52 = 0;
          }
          goto LABEL_39;
        }
      }
      if (objc_msgSend(v14, "changeType", v43) == 1 || objc_msgSend(v14, "changeType") == 2)
      {
        v58 = 0;
        v21 = objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v17, 1, 0, &v58);
        v22 = v58;
        if ((v21 & 1) != 0 || !v22)
        {
          v50 = v22;
          v51 = v19;
          v56 = 0u;
          v57 = 0u;
          v54 = 0u;
          v55 = 0u;
          v48 = v14;
          objc_msgSend(v14, "files");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v54, v72, 16);
          if (v28)
          {
            v29 = v28;
            v30 = *(_QWORD *)v55;
            while (2)
            {
              for (i = 0; i != v29; ++i)
              {
                if (*(_QWORD *)v55 != v30)
                  objc_enumerationMutation(v27);
                v32 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
                objc_msgSend(v32, "filename");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "URLByAppendingPathComponent:", v33);
                v34 = (void *)objc_claimAutoreleasedReturnValue();

                v53 = 0;
                v35 = objc_msgSend(v32, "writeToFileURL:overwriting:error:", v34, 1, &v53);
                v36 = v53;
                v37 = v36;
                if ((v35 & 1) == 0)
                {
                  getWFWatchSyncLogObject();
                  v38 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend(v32, "filename");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 136315906;
                    v65 = "-[VCIntentDefinitionSyncDataHandler applyChanges:fromSyncService:error:]";
                    v66 = 2114;
                    v67 = v39;
                    v68 = 2114;
                    v69 = v48;
                    v70 = 2114;
                    v71 = v37;
                    _os_log_impl(&dword_1C146A000, v38, OS_LOG_TYPE_ERROR, "%s Could not write %{public}@ for %{public}@: %{public}@", buf, 0x2Au);

                  }
                  a5 = v46;
                  v11 = v47;
                  v12 = v44;
                  if (v46)
                    *v46 = objc_retainAutorelease(v37);

                  v52 = 0;
                  v7 = v49;
                  v8 = v45;
                  goto LABEL_36;
                }

              }
              v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v54, v72, 16);
              if (v29)
                continue;
              break;
            }
            v8 = v45;
            a5 = v46;
            v7 = v49;
            v12 = v44;
            v11 = v47;
          }
LABEL_36:
          v19 = v51;

          v40 = v50;
        }
        else
        {
          v23 = v12;
          v24 = v8;
          v25 = v22;
          getWFWatchSyncLogObject();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v65 = "-[VCIntentDefinitionSyncDataHandler applyChanges:fromSyncService:error:]";
            v66 = 2114;
            v67 = v14;
            v68 = 2114;
            v69 = v25;
            _os_log_impl(&dword_1C146A000, v26, OS_LOG_TYPE_ERROR, "%s Could not create intent definition directory for %{public}@: %{public}@", buf, 0x20u);
          }

          v52 = 0;
          if (a5)
            *a5 = objc_retainAutorelease(v25);
          v40 = v25;
          v8 = v24;
          v12 = v23;
          v7 = v49;
        }

      }
LABEL_39:

      ++v13;
    }
    while (v13 != v11);
    v41 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
    v11 = v41;
  }
  while (v41);
LABEL_45:

  return v52 & 1;
}

- (BOOL)deleteSyncedData:(id *)a3
{
  void *v4;
  void *v5;
  char v6;
  id v7;
  BOOL v8;
  id v10;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WFSyncedDefinitionDirectoryURL();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v6 = objc_msgSend(v4, "removeItemAtURL:error:", v5, &v10);
  v7 = v10;

  if ((v6 & 1) != 0)
    goto LABEL_7;
  if (objc_msgSend(v7, "vc_isFileNotFound"))
  {

    v7 = 0;
LABEL_7:
    v8 = 1;
    goto LABEL_8;
  }
  if (!v7)
    goto LABEL_7;
  if (a3)
  {
    v7 = objc_retainAutorelease(v7);
    v8 = 0;
    *a3 = v7;
  }
  else
  {
    v8 = 0;
  }
LABEL_8:

  return v8;
}

- (SwiftVCDaemonXPCEventHandler)eventHandler
{
  return self->_eventHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventHandler, 0);
}

uint64_t __88__VCIntentDefinitionSyncDataHandler_markChangesAsSynced_withSyncService_metadata_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  objc_class *v33;
  void *v34;
  uint64_t v36;
  void *v37;
  id obj;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  id v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "applications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = v5;
  v37 = v3;
  if (v5)
    v7 = v5;
  else
    v7 = (id)objc_opt_new();
  v8 = v7;

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v36 = a1;
  obj = *(id *)(a1 + 32);
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v41 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x1C3BAFA00]();
        if (objc_msgSend(v13, "changeType") == 3)
        {
          objc_msgSend(v13, "objectIdentifier");
          v15 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "removeObjectForKey:", v15);
        }
        else
        {
          v16 = objc_alloc(MEMORY[0x1E0CA5870]);
          objc_msgSend(v13, "objectIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = 0;
          v18 = (void *)objc_msgSend(v16, "initWithBundleIdentifier:allowPlaceholder:error:", v17, 0, &v39);
          v15 = v39;

          if (!v18)
          {
            getWFWatchSyncLogObject();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v13, "objectIdentifier");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315651;
              v45 = "-[VCIntentDefinitionSyncDataHandler markChangesAsSynced:withSyncService:metadata:error:]_block_invoke";
              v46 = 2113;
              v47 = v20;
              v48 = 2112;
              v49 = v15;
              _os_log_impl(&dword_1C146A000, v19, OS_LOG_TYPE_ERROR, "%s Could not get LSApplicationRecord for bundle ID %{private}@: %@", buf, 0x20u);

            }
          }
          v21 = (void *)objc_opt_new();
          objc_msgSend(v18, "registrationDate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setRegisteredDate:", v22);

          objc_msgSend(v13, "checksum");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setChecksum:", v23);

          objc_msgSend(v13, "objectIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKey:", v21, v24);

        }
        objc_autoreleasePoolPop(v14);
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    }
    while (v10);
  }

  objc_msgSend(v37, "setApplications:", v8);
  v25 = *(void **)(v36 + 40);
  if (v25)
  {
    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("LSDatabaseUUID"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v27 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(*(id *)(v36 + 40), "objectForKeyedSubscript:", CFSTR("LSDatabaseUUID"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v27, "initWithUUIDString:", v28);

    }
    else
    {
      v29 = 0;
    }

    objc_msgSend(*(id *)(v36 + 40), "objectForKeyedSubscript:", CFSTR("LSDatabaseSequenceNumber"));
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)v30;
    if (v29 && v30)
    {
      getWFWatchSyncLogObject();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        v33 = (objc_class *)objc_opt_class();
        NSStringFromClass(v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v45 = "-[VCIntentDefinitionSyncDataHandler markChangesAsSynced:withSyncService:metadata:error:]_block_invoke";
        v46 = 2114;
        v47 = v34;
        _os_log_impl(&dword_1C146A000, v32, OS_LOG_TYPE_INFO, "%s %{public}@ completed syncing entire changeset, ratcheting database sequence number", buf, 0x16u);

      }
      objc_msgSend(v37, "setDatabaseUUID:", v29);
      objc_msgSend(v37, "setSequenceNumber:", v31);
    }

  }
  return 1;
}

uint64_t __82__VCIntentDefinitionSyncDataHandler_unsyncedChangesForSyncService_metadata_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  objc_class *v48;
  void *v49;
  id v51;
  void *v52;
  void *v53;
  id obj;
  void *v55;
  NSObject *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  id v65;
  id v66;
  _QWORD v67[2];
  _QWORD v68[2];
  uint8_t buf[4];
  const char *v70;
  __int16 v71;
  void *v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0;
  v66 = 0;
  objc_msgSend(v4, "getKnowledgeUUID:andSequenceNumber:", &v66, &v65);
  v5 = v66;
  v6 = v65;
  objc_msgSend(v3, "databaseUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqual:", v5) & 1) != 0)
  {
    objc_msgSend(v3, "sequenceNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToNumber:", v6);

    if (v9)
    {
      getWFWatchSyncLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v70 = "-[VCIntentDefinitionSyncDataHandler unsyncedChangesForSyncService:metadata:error:]_block_invoke";
        _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_INFO, "%s LaunchServices database is unchanged, therefore there are no intent definition changes", buf, 0xCu);
      }
      v11 = 0;
      goto LABEL_40;
    }
  }
  else
  {

  }
  v51 = v6;
  v52 = v5;
  v53 = v4;
  v56 = objc_opt_new();
  WFInstalledAppsEnumerator();
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
  v55 = v3;
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v62 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        v17 = (void *)MEMORY[0x1C3BAFA00]();
        v18 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 56)), "initWithApplicationRecord:changeType:", v16, 2);
        if (v18)
        {
          objc_msgSend(v16, "bundleIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v56, "addObject:", v19);

          objc_msgSend(v3, "applications");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v22, "registeredDate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "registrationDate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v23, "isEqual:", v24);

          if ((v25 & 1) == 0)
          {
            objc_msgSend(v18, "checksum");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "checksum");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v26, "isEqual:", v27);

            if ((v28 & 1) == 0)
            {
              if (!v22)
                objc_msgSend(v18, "setChangeType:", 1);
              objc_msgSend(*(id *)(a1 + 32), "addObject:", v18, v51, v52);
            }
          }

          v3 = v55;
        }

        objc_autoreleasePoolPop(v17);
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
    }
    while (v13);
  }

  objc_msgSend(v3, "applications");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = objc_alloc(MEMORY[0x1E0C99E20]);
    objc_msgSend(v3, "applications");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "allKeys");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v30, "initWithArray:", v32);

  }
  else
  {
    v33 = 0;
  }
  v6 = v51;
  v5 = v52;

  objc_msgSend(v33, "minusSet:", v56);
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v34 = v33;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v58;
    do
    {
      for (j = 0; j != v36; ++j)
      {
        if (*(_QWORD *)v58 != v37)
          objc_enumerationMutation(v34);
        v39 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j);
        v40 = (void *)MEMORY[0x1C3BAFA00]();
        v41 = *(void **)(a1 + 32);
        v42 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 56)), "initWithObjectIdentifier:changeType:", v39, 3);
        objc_msgSend(v41, "addObject:", v42);

        objc_autoreleasePoolPop(v40);
      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
    }
    while (v36);
  }

  v11 = 0;
  if (v52)
  {
    v3 = v55;
    v10 = v56;
    v4 = v53;
    if (v51)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "count"))
      {
        v67[0] = CFSTR("LSDatabaseUUID");
        objc_msgSend(v52, "UUIDString");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v67[1] = CFSTR("LSDatabaseSequenceNumber");
        v68[0] = v43;
        v68[1] = v51;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, v67, 2);
        v44 = objc_claimAutoreleasedReturnValue();
        v45 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v46 = *(void **)(v45 + 40);
        *(_QWORD *)(v45 + 40) = v44;

        v11 = 0;
      }
      else
      {
        getWFWatchSyncLogObject();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          v48 = (objc_class *)objc_opt_class();
          NSStringFromClass(v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v70 = "-[VCIntentDefinitionSyncDataHandler unsyncedChangesForSyncService:metadata:error:]_block_invoke";
          v71 = 2114;
          v72 = v49;
          _os_log_impl(&dword_1C146A000, v47, OS_LOG_TYPE_INFO, "%s %{public}@ found no changes to sync, ratcheting database sequence number", buf, 0x16u);

        }
        objc_msgSend(v55, "setDatabaseUUID:", v52);
        objc_msgSend(v55, "setSequenceNumber:", v51);
        v11 = 1;
      }
    }
  }
  else
  {
    v3 = v55;
    v10 = v56;
    v4 = v53;
  }

LABEL_40:
  return v11;
}

+ (int)messageType
{
  return 1;
}

@end
