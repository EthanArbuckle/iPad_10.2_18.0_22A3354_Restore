@implementation VCSpotlightSyncOperation

- (VCSpotlightSyncOperation)initWithReferences:(id)a3 forceFullResync:(BOOL)a4 spotlightIndex:(id)a5 localState:(id)a6 transaction:(id)a7
{
  _BOOL4 v10;
  id v12;
  id v13;
  id v14;
  id v15;
  VCSpotlightSyncOperation *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  VCSpotlightSyncOperation *v25;
  NSObject *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint8_t buf[4];
  const char *v34;
  uint64_t v35;

  v10 = a4;
  v35 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = -[VCSpotlightSyncOperation init](self, "init");
  if (v16)
  {
    v28 = v15;
    if (v10)
    {
      getWFSpotlightSyncLogObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v34 = "-[VCSpotlightSyncOperation initWithReferences:forceFullResync:spotlightIndex:localState:transaction:]";
        _os_log_impl(&dword_1C146A000, v17, OS_LOG_TYPE_DEBUG, "%s Invoking full resync", buf, 0xCu);
      }

      v14 = 0;
    }
    v18 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(v12, "valueForKey:", CFSTR("identifier"), v28, v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dictionaryWithObjects:forKeys:", v12, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = 0;
    v32 = 0;
    objc_msgSend((id)objc_opt_class(), "_fillIdentifiersToRemove:referencesToIndex:withMaximumUpdatedItems:references:localState:", &v32, &v31, 10, v20, v14);
    v21 = v32;
    v22 = v32;
    v23 = v31;
    v24 = v31;
    if (objc_msgSend(v22, "count") || objc_msgSend(v24, "count"))
    {
      objc_storeStrong((id *)&v16->_identifiersToRemove, v21);
      objc_storeStrong((id *)&v16->_referencesToIndex, v23);
      objc_storeStrong((id *)&v16->_keyedReferences, v20);
      v16->_fullResync = v14 == 0;
      objc_storeStrong((id *)&v16->_index, a5);
      objc_storeStrong((id *)&v16->_localState, v14);
      objc_storeStrong((id *)&v16->_transaction, a7);
      v25 = v16;
    }
    else
    {
      getWFSpotlightSyncLogObject();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v34 = "-[VCSpotlightSyncOperation initWithReferences:forceFullResync:spotlightIndex:localState:transaction:]";
        _os_log_impl(&dword_1C146A000, v27, OS_LOG_TYPE_INFO, "%s Found no items to update, terminating sync early", buf, 0xCu);
      }

      v25 = 0;
    }
    v15 = v29;
    v13 = v30;

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (VCSpotlightSyncOperation)initWithModifiedReferences:(id)a3 inserted:(id)a4 removed:(id)a5 spotlightIndex:(id)a6 localState:(id)a7 transaction:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  VCSpotlightSyncOperation *v20;
  uint64_t v21;
  NSSet *identifiersToRemove;
  NSDictionary *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  NSDictionary *keyedReferences;
  NSDictionary *v39;
  uint64_t v40;
  NSDictionary *referencesToIndex;
  VCSpotlightSyncOperation *v42;
  id v44;
  id v45;
  id v46;
  id obj;
  id v48;
  id v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = -[VCSpotlightSyncOperation init](self, "init");
  if (v20)
  {
    v44 = v19;
    v45 = v18;
    v46 = v17;
    obj = a8;
    v50 = v15;
    v48 = v16;
    objc_msgSend(v16, "valueForKeyPath:", CFSTR("identifier"));
    v21 = objc_claimAutoreleasedReturnValue();
    identifiersToRemove = v20->_identifiersToRemove;
    v20->_identifiersToRemove = (NSSet *)v21;

    v23 = (NSDictionary *)objc_opt_new();
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v49 = v14;
    v24 = v14;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v56 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          objc_msgSend(v29, "identifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKey:](v23, "setObject:forKey:", v29, v30);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
      }
      while (v26);
    }

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v31 = v50;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v52;
      do
      {
        for (j = 0; j != v33; ++j)
        {
          if (*(_QWORD *)v52 != v34)
            objc_enumerationMutation(v31);
          v36 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
          objc_msgSend(v36, "identifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKey:](v23, "setObject:forKey:", v36, v37);

        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
      }
      while (v33);
    }

    keyedReferences = v20->_keyedReferences;
    v20->_keyedReferences = v23;
    v39 = v23;

    v40 = -[NSDictionary copy](v39, "copy");
    referencesToIndex = v20->_referencesToIndex;
    v20->_referencesToIndex = (NSDictionary *)v40;

    v20->_fullResync = 0;
    objc_storeStrong((id *)&v20->_index, a6);
    objc_storeStrong((id *)&v20->_localState, a7);
    objc_storeStrong((id *)&v20->_transaction, obj);

    v42 = v20;
    v14 = v49;
    v15 = v50;
    v16 = v48;
    v18 = v45;
    v17 = v46;
    v19 = v44;
  }

  return v20;
}

- (VCSpotlightSyncOperation)init
{
  VCSpotlightSyncOperation *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  VCSpotlightSyncOperation *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VCSpotlightSyncOperation;
  v2 = -[VCSpotlightSyncOperation init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("com.apple.VoiceShortcuts.SpotlightSyncOperation", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = v2;
  }

  return v2;
}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  -[VCSpotlightSyncOperation queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__VCSpotlightSyncOperation_start__block_invoke;
  block[3] = &unk_1E7AA8300;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)indexSearchableItems
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  VCSpotlightSyncOperation *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[VCSpotlightSyncOperation queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  getWFSpotlightSyncLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    -[VCSpotlightSyncOperation referencesToIndex](self, "referencesToIndex");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v15 = "-[VCSpotlightSyncOperation indexSearchableItems]";
    v16 = 2048;
    v17 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_INFO, "%s indexSearchableItems called with (%lu) items to index", buf, 0x16u);

  }
  v6 = objc_alloc_init(MEMORY[0x1E0DC7E48]);
  -[VCSpotlightSyncOperation referencesToIndex](self, "referencesToIndex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = self;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__VCSpotlightSyncOperation_indexSearchableItems__block_invoke;
  v11[3] = &unk_1E7AA6848;
  v12 = v6;
  v13 = self;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__VCSpotlightSyncOperation_indexSearchableItems__block_invoke_119;
  v10[3] = &unk_1E7AA6870;
  v9 = v6;
  objc_msgSend(v8, "if_enumerateAsynchronously:completionHandler:", v11, v10);

}

- (void)saveLocalState
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  VCSpotlightState *v18;
  void *v19;
  void *v20;
  BOOL v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  const char *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint32_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  _QWORD v32[5];
  BOOL v33;
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _BYTE buf[12];
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  -[VCSpotlightSyncOperation queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  getWFSpotlightSyncLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[VCSpotlightSyncOperation saveLocalState]";
    _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_DEBUG, "%s Preparing to save local state to disk", buf, 0xCu);
  }

  if (-[VCSpotlightSyncOperation fullResync](self, "fullResync"))
  {
    v5 = (void *)objc_opt_new();
  }
  else
  {
    -[VCSpotlightSyncOperation localState](self, "localState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  objc_msgSend(v5, "syncedShortcuts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  v9 = -[VCSpotlightSyncOperation fullResync](self, "fullResync");
  v10 = MEMORY[0x1E0C809B0];
  if (!v9)
  {
    -[VCSpotlightSyncOperation identifiersToRemove](self, "identifiersToRemove");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v10;
    v37[1] = 3221225472;
    v37[2] = __42__VCSpotlightSyncOperation_saveLocalState__block_invoke;
    v37[3] = &unk_1E7AA6898;
    v38 = v8;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v37);

  }
  -[VCSpotlightSyncOperation referencesToIndex](self, "referencesToIndex");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v10;
  v35[1] = 3221225472;
  v35[2] = __42__VCSpotlightSyncOperation_saveLocalState__block_invoke_2;
  v35[3] = &unk_1E7AA68C0;
  v14 = v8;
  v36 = v14;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v35);

  getWFSpotlightSyncLogObject();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[VCSpotlightSyncOperation saveLocalState]";
    _os_log_impl(&dword_1C146A000, v15, OS_LOG_TYPE_DEBUG, "%s Generated synced shortcut mapping", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "getUUIDBytes:", buf);

  v17 = *(_QWORD *)buf;
  v18 = -[VCSpotlightState initWithIdentifier:syncedShortcuts:]([VCSpotlightState alloc], "initWithIdentifier:syncedShortcuts:", *(_QWORD *)buf, v14);
  VCLocalSpotlightStateFileURL();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "path");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v21 = -[VCSpotlightState saveToPath:error:](v18, "saveToPath:error:", v20, &v34);
  v22 = v34;

  getWFSpotlightSyncLogObject();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v21)
  {
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      goto LABEL_16;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[VCSpotlightSyncOperation saveLocalState]";
    v25 = "%s Saved local state to disk";
    v26 = v24;
    v27 = OS_LOG_TYPE_DEBUG;
    v28 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      goto LABEL_16;
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[VCSpotlightSyncOperation saveLocalState]";
    v40 = 2112;
    v41 = v22;
    v25 = "%s Could not save local state to disk. Spotlight syncing will give up until new changes come in. We'll try again then. %@";
    v26 = v24;
    v27 = OS_LOG_TYPE_FAULT;
    v28 = 22;
  }
  _os_log_impl(&dword_1C146A000, v26, v27, v25, buf, v28);
LABEL_16:

  *(_QWORD *)buf = v17;
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithBytes:length:", buf, 8);
  getWFSpotlightSyncLogObject();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[VCSpotlightSyncOperation saveLocalState]";
    _os_log_impl(&dword_1C146A000, v30, OS_LOG_TYPE_DEBUG, "%s Generated client state to end batch", buf, 0xCu);
  }

  -[VCSpotlightSyncOperation index](self, "index");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v10;
  v32[1] = 3221225472;
  v32[2] = __42__VCSpotlightSyncOperation_saveLocalState__block_invoke_125;
  v32[3] = &unk_1E7AA68E8;
  v32[4] = self;
  v33 = v21;
  objc_msgSend(v31, "endIndexBatchWithClientState:completionHandler:", v29, v32);

}

- (void)clearLocalStateAndExit
{
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[VCSpotlightSyncOperation queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[VCSpotlightSyncOperation index](self, "index");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__VCSpotlightSyncOperation_clearLocalStateAndExit__block_invoke;
  v6[3] = &unk_1E7AA7478;
  v6[4] = self;
  objc_msgSend(v4, "endIndexBatchWithClientState:completionHandler:", v5, v6);

}

- (void)deleteSpotlightFileAndCleanup
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[VCSpotlightSyncOperation queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  VCLocalSpotlightStateFileURL();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INRemoveItemAtPath();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  getWFSpotlightSyncLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v13 = 136315394;
      v14 = "-[VCSpotlightSyncOperation deleteSpotlightFileAndCleanup]";
      v15 = 2114;
      v16 = v6;
      v9 = "%s Error clearing local state: (%{public}@)";
      v10 = v8;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 22;
LABEL_6:
      _os_log_impl(&dword_1C146A000, v10, v11, v9, (uint8_t *)&v13, v12);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v13 = 136315138;
    v14 = "-[VCSpotlightSyncOperation deleteSpotlightFileAndCleanup]";
    v9 = "%s Cleared local state.";
    v10 = v8;
    v11 = OS_LOG_TYPE_INFO;
    v12 = 12;
    goto LABEL_6;
  }

  -[VCSpotlightSyncOperation cleanupAndExitWithRequestToRelaunch:](self, "cleanupAndExitWithRequestToRelaunch:", 0);
}

- (void)cleanupAndExitWithRequestToRelaunch:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  -[VCSpotlightSyncOperation queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  getWFSpotlightSyncLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = CFSTR("NO");
    if (v3)
      v7 = CFSTR("YES");
    v9 = 136315394;
    v10 = "-[VCSpotlightSyncOperation cleanupAndExitWithRequestToRelaunch:]";
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_INFO, "%s Cleaned up with request to relaunch: %@", (uint8_t *)&v9, 0x16u);
  }

  -[VCSpotlightSyncOperation delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "syncOperationFinishedWithRequestToRelaunch:", v3);

}

- (VCSpotlightSyncOperationDelegate)delegate
{
  return (VCSpotlightSyncOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDictionary)referencesToIndex
{
  return self->_referencesToIndex;
}

- (NSSet)identifiersToRemove
{
  return self->_identifiersToRemove;
}

- (NSDictionary)keyedReferences
{
  return self->_keyedReferences;
}

- (BOOL)fullResync
{
  return self->_fullResync;
}

- (VCSpotlightState)localState
{
  return self->_localState;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (CSSearchableIndex)index
{
  return self->_index;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_localState, 0);
  objc_storeStrong((id *)&self->_keyedReferences, 0);
  objc_storeStrong((id *)&self->_identifiersToRemove, 0);
  objc_storeStrong((id *)&self->_referencesToIndex, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __50__VCSpotlightSyncOperation_clearLocalStateAndExit__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__VCSpotlightSyncOperation_clearLocalStateAndExit__block_invoke_2;
  v7[3] = &unk_1E7AA8138;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __50__VCSpotlightSyncOperation_clearLocalStateAndExit__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    getWFSpotlightSyncLogObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v5 = 136315394;
      v6 = "-[VCSpotlightSyncOperation clearLocalStateAndExit]_block_invoke_2";
      v7 = 2114;
      v8 = v3;
      _os_log_impl(&dword_1C146A000, v2, OS_LOG_TYPE_ERROR, "%s Error ending index batch with empty client state: (%{public}@)", (uint8_t *)&v5, 0x16u);
    }

  }
  return objc_msgSend(*(id *)(a1 + 40), "deleteSpotlightFileAndCleanup");
}

uint64_t __42__VCSpotlightSyncOperation_saveLocalState__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", a2);
}

void __42__VCSpotlightSyncOperation_saveLocalState__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a2;
  objc_msgSend(v3, "numberWithUnsignedLongLong:", objc_msgSend(v4, "spotlightHash"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setObject:forKey:", v6, v5);
}

void __42__VCSpotlightSyncOperation_saveLocalState__block_invoke_125(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  char v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__VCSpotlightSyncOperation_saveLocalState__block_invoke_2_126;
  block[3] = &unk_1E7AA7330;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v10 = *(_BYTE *)(a1 + 40);
  v6 = v3;
  dispatch_async(v4, block);

}

uint64_t __42__VCSpotlightSyncOperation_saveLocalState__block_invoke_2_126(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void *v7;
  unint64_t v8;
  BOOL v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  getWFSpotlightSyncLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v11 = 136315394;
      v12 = "-[VCSpotlightSyncOperation saveLocalState]_block_invoke_2";
      v13 = 2114;
      v14 = v5;
      _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_ERROR, "%s Error ending index batch with client state: (%{public}@)", (uint8_t *)&v11, 0x16u);
    }

    return objc_msgSend(*(id *)(a1 + 40), "deleteSpotlightFileAndCleanup");
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v11 = 136315138;
      v12 = "-[VCSpotlightSyncOperation saveLocalState]_block_invoke";
      _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_INFO, "%s Ended index batch", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "referencesToIndex");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (*(_BYTE *)(a1 + 48))
      v9 = v8 > 9;
    else
      v9 = 0;
    v10 = v9;
    return objc_msgSend(*(id *)(a1 + 40), "cleanupAndExitWithRequestToRelaunch:", v10);
  }
}

void __48__VCSpotlightSyncOperation_indexSearchableItems__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  void *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  v8 = (void *)MEMORY[0x1C3BAFA00]();
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  getWFSpotlightSyncLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[VCSpotlightSyncOperation indexSearchableItems]_block_invoke";
    v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_INFO, "%s > generating searchable item for reference %@", buf, 0x16u);
  }

  objc_msgSend(v6, "searchableItemRepresentationWithIconDrawerContext:", *(_QWORD *)(a1 + 32));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 40), "index");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "indexSearchableItems:completionHandler:", v13, v7);

    getWFSpotlightSyncLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[VCSpotlightSyncOperation indexSearchableItems]_block_invoke";
      v21 = 2112;
      v22 = v9;
      v15 = "%s + indexed searchable item for reference %@";
      v16 = v14;
      v17 = OS_LOG_TYPE_INFO;
LABEL_8:
      _os_log_impl(&dword_1C146A000, v16, v17, v15, buf, 0x16u);
    }
  }
  else
  {
    getWFSpotlightSyncLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[VCSpotlightSyncOperation indexSearchableItems]_block_invoke";
      v21 = 2112;
      v22 = v9;
      v15 = "%s ! no item generated for reference %@";
      v16 = v14;
      v17 = OS_LOG_TYPE_FAULT;
      goto LABEL_8;
    }
  }

  objc_autoreleasePoolPop(v8);
}

void __48__VCSpotlightSyncOperation_indexSearchableItems__block_invoke_119(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__VCSpotlightSyncOperation_indexSearchableItems__block_invoke_2;
  block[3] = &unk_1E7AA6E20;
  v7 = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = v7;
  v12 = a2;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __48__VCSpotlightSyncOperation_indexSearchableItems__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  getWFSpotlightSyncLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v12 = 136315394;
      v13 = "-[VCSpotlightSyncOperation indexSearchableItems]_block_invoke_2";
      v14 = 2114;
      v15 = v5;
      _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_ERROR, "%s Error indexing items: (%{public}@)", (uint8_t *)&v12, 0x16u);
    }

    return objc_msgSend(*(id *)(a1 + 40), "clearLocalStateAndExit");
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 48);
      v12 = 136315394;
      v13 = "-[VCSpotlightSyncOperation indexSearchableItems]_block_invoke";
      v14 = 2048;
      v15 = v7;
      _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_INFO, "%s Successfully indexed (%lu) new items.", (uint8_t *)&v12, 0x16u);
    }

    v8 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "referencesToIndex");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v8 < v10)
    {
      getWFSpotlightSyncLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = 136315138;
        v13 = "-[VCSpotlightSyncOperation indexSearchableItems]_block_invoke";
        _os_log_impl(&dword_1C146A000, v11, OS_LOG_TYPE_ERROR, "%s We seemed to have dropped some references. No errors, so continuing: check logs to see what references were dropped", (uint8_t *)&v12, 0xCu);
      }

    }
    return objc_msgSend(*(id *)(a1 + 40), "saveLocalState");
  }
}

void __33__VCSpotlightSyncOperation_start__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD aBlock[5];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __33__VCSpotlightSyncOperation_start__block_invoke_2;
  aBlock[3] = &unk_1E7AA7478;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v2 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "index");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beginIndexBatch");

  v4 = objc_msgSend(*(id *)(a1 + 32), "fullResync");
  getWFSpotlightSyncLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[VCSpotlightSyncOperation start]_block_invoke";
      _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_INFO, "%s Unindexing all Shortcuts from index.", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "index");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = *MEMORY[0x1E0DC8018];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deleteSearchableItemsWithDomainIdentifiers:completionHandler:", v8, v2);
  }
  else
  {
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "identifiersToRemove");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 136315394;
      v14 = "-[VCSpotlightSyncOperation start]_block_invoke";
      v15 = 2048;
      v16 = v10;
      _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_INFO, "%s Unindexing (%lu) shortcuts from spotlight index.", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "index");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifiersToRemove");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deleteSearchableItemsWithIdentifiers:completionHandler:", v11, v2);

  }
}

void __33__VCSpotlightSyncOperation_start__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__VCSpotlightSyncOperation_start__block_invoke_3;
  v7[3] = &unk_1E7AA8138;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __33__VCSpotlightSyncOperation_start__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  getWFSpotlightSyncLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v7 = 136315394;
      v8 = "-[VCSpotlightSyncOperation start]_block_invoke_3";
      v9 = 2114;
      v10 = v5;
      _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_ERROR, "%s Error unindexing items: (%{public}@)", (uint8_t *)&v7, 0x16u);
    }

    return objc_msgSend(*(id *)(a1 + 40), "clearLocalStateAndExit");
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v7 = 136315138;
      v8 = "-[VCSpotlightSyncOperation start]_block_invoke";
      _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_INFO, "%s Successfully unindexed items from Spotlight", (uint8_t *)&v7, 0xCu);
    }

    return objc_msgSend(*(id *)(a1 + 40), "indexSearchableItems");
  }
}

+ (void)_fillIdentifiersToRemove:(id *)a3 referencesToIndex:(id *)a4 withMaximumUpdatedItems:(int64_t)a5 references:(id)a6 localState:(id)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id *v22;
  void *v23;
  id v24;
  unint64_t v25;
  int64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  id *v36;
  void *v37;
  id *v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v11 = a6;
  v12 = a7;
  v13 = (void *)objc_opt_new();
  v14 = (void *)objc_opt_new();
  v38 = a4;
  if (v12)
  {
    v15 = (void *)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(v12, "syncedShortcuts");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = a3;
    v17 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __117__VCSpotlightSyncOperation__fillIdentifiersToRemove_referencesToIndex_withMaximumUpdatedItems_references_localState___block_invoke;
    v41[3] = &unk_1E7AA6910;
    v42 = v15;
    v18 = v13;
    v43 = v18;
    v19 = v14;
    v44 = v19;
    v20 = v15;
    objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v41);

    v39[0] = v17;
    v39[1] = 3221225472;
    v39[2] = __117__VCSpotlightSyncOperation__fillIdentifiersToRemove_referencesToIndex_withMaximumUpdatedItems_references_localState___block_invoke_2;
    v39[3] = &unk_1E7AA6938;
    v21 = v19;
    v40 = v21;
    objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v39);
    *v36 = (id)objc_msgSend(v18, "copy");
    *v38 = (id)objc_msgSend(v21, "copy");

  }
  else
  {
    v37 = v13;
    v22 = a3;
    objc_msgSend(v11, "allValues");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v11;
    v25 = objc_msgSend(v11, "count");
    if (v25 >= a5)
      v26 = a5;
    else
      v26 = v25;
    objc_msgSend(v23, "subarrayWithRange:", 0, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v28 = v27;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v46 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          v34 = (void *)MEMORY[0x1C3BAFA00]();
          objc_msgSend(v33, "identifier");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setValue:forKey:", v33, v35);

          objc_autoreleasePoolPop(v34);
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v30);
    }

    v13 = v37;
    *v22 = (id)objc_msgSend(v37, "copy");
    *v38 = (id)objc_msgSend(v14, "copy");

    v11 = v24;
    v12 = 0;
  }

}

void __117__VCSpotlightSyncOperation__fillIdentifiersToRemove_referencesToIndex_withMaximumUpdatedItems_references_localState___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x1C3BAFA00]();
  objc_msgSend(a1[4], "objectForKey:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(a1[4], "removeObjectForKey:", v9);
    if ((unint64_t)objc_msgSend(a1[6], "count") <= 9)
    {
      v8 = objc_msgSend(v7, "spotlightHash");
      if (v8 != objc_msgSend(v5, "unsignedLongLongValue"))
        objc_msgSend(a1[6], "setObject:forKey:", v7, v9);
    }
  }
  else
  {
    objc_msgSend(a1[5], "addObject:", v9);
  }

  objc_autoreleasePoolPop(v6);
}

void __117__VCSpotlightSyncOperation__fillIdentifiersToRemove_referencesToIndex_withMaximumUpdatedItems_references_localState___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = (void *)MEMORY[0x1C3BAFA00]();
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") < 0xA)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, v9);
  else
    *a4 = 1;
  objc_autoreleasePoolPop(v8);

}

@end
