@implementation VCCompanionSyncIncomingSession

+ (int64_t)direction
{
  return 1;
}

- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, uint64_t, void *);
  NSObject *v10;
  VCSYChangeEnumerator *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  void *v37;
  VCCompanionSyncIncomingSession *v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void (**v43)(id, uint64_t, void *);
  id v44;
  id v45;
  id obj;
  void *v47;
  uint64_t v48;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  VCCompanionSyncIncomingSession *v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  id v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t, void *))a5;
  getWFWatchSyncLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v56 = "-[VCCompanionSyncIncomingSession syncSession:applyChanges:completion:]";
    v57 = 2114;
    v58 = self;
    v59 = 2048;
    v60 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_DEFAULT, "%s %{public}@ received %lu incoming changes", buf, 0x20u);
  }

  v11 = -[VCSYChangeEnumerator initWithLazyArray:]([VCSYChangeEnumerator alloc], "initWithLazyArray:", v8);
  -[VCSYChangeEnumerator allObjects](v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "count");
  if (v13 >= objc_msgSend(v8, "count"))
  {
    v15 = objc_alloc(MEMORY[0x1E0C99E08]);
    VCPartitionMessages(v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v15, "initWithDictionary:", v16);

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    -[VCCompanionSyncSession syncDataHandlers](self, "syncDataHandlers");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
    v47 = v14;
    if (v17)
    {
      v18 = v17;
      v42 = v12;
      v43 = v9;
      v44 = v8;
      v45 = v7;
      v19 = 0;
      v48 = *(_QWORD *)v52;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v52 != v48)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          v22 = (void *)MEMORY[0x1C3BAFA00]();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_opt_class(), "messageType"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "removeObjectForKey:", v23);
          if (objc_msgSend(v24, "count"))
          {
            -[VCCompanionSyncSession service](self, "service");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = v19;
            v26 = objc_msgSend(v21, "applyChanges:fromSyncService:error:", v24, v25, &v50);
            v27 = v50;

            getWFWatchSyncLogObject();
            v28 = objc_claimAutoreleasedReturnValue();
            v29 = v28;
            if (!v26)
            {
              if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
              {
                v32 = objc_msgSend(v24, "count");
                *(_DWORD *)buf = 136315906;
                v56 = "-[VCCompanionSyncIncomingSession syncSession:applyChanges:completion:]";
                v57 = 2114;
                v58 = self;
                v59 = 2048;
                v60 = v32;
                v61 = 2114;
                v62 = v27;
                _os_log_impl(&dword_1C146A000, v29, OS_LOG_TYPE_FAULT, "%s %{public}@ error applying %lu changes: %{public}@", buf, 0x2Au);
              }

              v7 = v45;
              v14 = v47;
              if (!v27)
              {
                v33 = (void *)MEMORY[0x1E0CB35C8];
                v34 = (objc_class *)objc_opt_class();
                NSStringFromClass(v34);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "vc_voiceShortcutErrorWithCode:reason:", 3001, CFSTR("%@ failed to apply %lu changes"), v35, objc_msgSend(v24, "count"));
                v27 = (id)objc_claimAutoreleasedReturnValue();

              }
              objc_autoreleasePoolPop(v22);
              v31 = 0;
              v19 = v27;
              goto LABEL_23;
            }
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              v30 = objc_msgSend(v24, "count");
              *(_DWORD *)buf = 136315906;
              v56 = "-[VCCompanionSyncIncomingSession syncSession:applyChanges:completion:]";
              v57 = 2114;
              v58 = self;
              v59 = 2048;
              v60 = v30;
              v61 = 2112;
              v62 = v24;
              _os_log_impl(&dword_1C146A000, v29, OS_LOG_TYPE_DEFAULT, "%s %{public}@ successfully applied %lu changes=%@", buf, 0x2Au);
            }

            v19 = v27;
            v14 = v47;
          }

          objc_autoreleasePoolPop(v22);
        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
        if (v18)
          continue;
        break;
      }
      v31 = 1;
      v7 = v45;
LABEL_23:
      v9 = v43;
      v8 = v44;
      v12 = v42;
    }
    else
    {
      v19 = 0;
      v31 = 1;
    }

    if (objc_msgSend(v14, "count"))
    {
      objc_msgSend(v14, "allKeys");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "if_compactMap:", &__block_literal_global_3986);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "componentsJoinedByString:", CFSTR(", "));
      v38 = (VCCompanionSyncIncomingSession *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 3005, CFSTR("Changes of type %@ were unhandled"), v38);
      v39 = objc_claimAutoreleasedReturnValue();

      getWFWatchSyncLogObject();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v56 = "-[VCCompanionSyncIncomingSession syncSession:applyChanges:completion:]";
        v57 = 2114;
        v58 = v38;
        _os_log_impl(&dword_1C146A000, v40, OS_LOG_TYPE_FAULT, "%s Changes of type %{public}@ were unhandled, failing", buf, 0x16u);
      }

      v31 = 0;
      v19 = (void *)v39;
      v14 = v47;
    }
    v9[2](v9, v31, v19);
    -[VCCompanionSyncSession transaction](self, "transaction");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    os_transaction_needs_more_time();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 3001, CFSTR("Failed to apply %lu changes because %lu of them failed to deserialize"), objc_msgSend(v8, "count"), objc_msgSend(v8, "count") - objc_msgSend(v12, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v14);
  }

}

- (void)resetDataStoreForSyncSession:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, id);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  void (**v25)(id, uint64_t, id);
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  VCCompanionSyncIncomingSession *v35;
  __int16 v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, id))a4;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[VCCompanionSyncSession syncDataHandlers](self, "syncDataHandlers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
  if (v9)
  {
    v10 = v9;
    v25 = v7;
    v26 = v6;
    v11 = 0;
    v12 = *(_QWORD *)v29;
    while (2)
    {
      v13 = 0;
      v14 = v11;
      do
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v13);
        v16 = (void *)MEMORY[0x1C3BAFA00]();
        v27 = v14;
        v17 = objc_msgSend(v15, "deleteSyncedData:", &v27);
        v11 = v27;

        getWFWatchSyncLogObject();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (!v17)
        {
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315650;
            v33 = "-[VCCompanionSyncIncomingSession resetDataStoreForSyncSession:completion:]";
            v34 = 2114;
            v35 = self;
            v36 = 2114;
            v37 = v11;
            _os_log_impl(&dword_1C146A000, v19, OS_LOG_TYPE_FAULT, "%s %{public}@ failed to reset local data: %{public}@", buf, 0x20u);
          }

          if (!v11)
          {
            v21 = (void *)MEMORY[0x1E0CB35C8];
            v22 = (objc_class *)objc_opt_class();
            NSStringFromClass(v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "vc_voiceShortcutErrorWithCode:reason:", 3001, CFSTR("%@ failed to reset data store"), v23);
            v11 = (id)objc_claimAutoreleasedReturnValue();

          }
          objc_autoreleasePoolPop(v16);
          v20 = 0;
          goto LABEL_17;
        }
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v33 = "-[VCCompanionSyncIncomingSession resetDataStoreForSyncSession:completion:]";
          v34 = 2114;
          v35 = self;
          _os_log_impl(&dword_1C146A000, v19, OS_LOG_TYPE_DEFAULT, "%s %{public}@ successfully reset local data", buf, 0x16u);
        }

        objc_autoreleasePoolPop(v16);
        ++v13;
        v14 = v11;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
      if (v10)
        continue;
      break;
    }
    v20 = 1;
LABEL_17:
    v7 = v25;
    v6 = v26;
  }
  else
  {
    v11 = 0;
    v20 = 1;
  }

  v7[2](v7, v20, v11);
  -[VCCompanionSyncSession transaction](self, "transaction");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  os_transaction_needs_more_time();

}

const __CFString *__70__VCCompanionSyncIncomingSession_syncSession_applyChanges_completion___block_invoke(uint64_t a1, void *a2)
{
  int v2;
  const __CFString *v3;

  v2 = objc_msgSend(a2, "intValue");
  v3 = CFSTR("IntentDefinition");
  if (v2 == 2)
    v3 = CFSTR("VoiceShortcut");
  if (v2 == 3)
    return CFSTR("Workflow");
  else
    return v3;
}

@end
