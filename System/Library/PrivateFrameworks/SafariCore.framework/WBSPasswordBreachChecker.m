@implementation WBSPasswordBreachChecker

- (WBSPasswordBreachChecker)initWithContext:(id)a3 bagManager:(id)a4
{
  id v7;
  id v8;
  WBSPasswordBreachChecker *v9;
  WBSPasswordBreachChecker *v10;
  WBSPasswordBreachRequestManager *v11;
  WBSPasswordBreachRequestManager *requestManager;
  WBSPasswordBreachChecker *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSPasswordBreachChecker;
  v9 = -[WBSPasswordBreachChecker init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_bagManager, a4);
    v11 = -[WBSPasswordBreachRequestManager initWithContext:]([WBSPasswordBreachRequestManager alloc], "initWithContext:", v7);
    requestManager = v10->_requestManager;
    v10->_requestManager = v11;

    v13 = v10;
  }

  return v10;
}

- (void)_checkHighFrequencyBucketForPasswords:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  WBSPasswordBreachRequestManager *requestManager;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2621000, v8, OS_LOG_TYPE_INFO, "Fetching high frequency bucket.", buf, 2u);
  }
  requestManager = self->_requestManager;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __88__WBSPasswordBreachChecker__checkHighFrequencyBucketForPasswords_withCompletionHandler___block_invoke;
  v12[3] = &unk_1E649D890;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[WBSPasswordBreachRequestManager fetchHighFrequencyBucketWithCompletionHandler:](requestManager, "fetchHighFrequencyBucketWithCompletionHandler:", v12);

}

void __88__WBSPasswordBreachChecker__checkHighFrequencyBucketForPasswords_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  uint64_t v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v3;
  if (v3)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v5 = *(id *)(a1 + 32);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v6)
    {
      v7 = v6;
      v29 = a1;
      v8 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v32 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v10, "highFrequencyEncodedPasswordData", v29);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v30, "containsLowercaseHexStringForData:", v11);

          if (v12)
            v13 = 1;
          else
            v13 = 2;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "uuid");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v15);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v7);
      a1 = v29;
    }
  }
  else
  {
    v16 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __88__WBSPasswordBreachChecker__checkHighFrequencyBucketForPasswords_withCompletionHandler___block_invoke_cold_1(v16, v17, v18, v19, v20, v21, v22, v23);
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v5 = *(id *)(a1 + 32);
    v24 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v36 != v26)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * j), "uuid");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E64CE370, v28);

        }
        v25 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v25);
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_checkLowFrequencyBatchesWithBagManager:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  id v11;
  _QWORD v12[5];
  id v13;
  char v14;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  v8 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2621000, v8, OS_LOG_TYPE_INFO, "Performing low frequency batch lookup.", buf, 2u);
  }
  -[WBSPasswordBreachContext configuration](self->_context, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "verboseSensitiveLoggingEnabled");

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __86__WBSPasswordBreachChecker__checkLowFrequencyBatchesWithBagManager_completionHandler___block_invoke;
  v12[3] = &unk_1E649D8E0;
  v12[4] = self;
  v13 = v6;
  v14 = v10;
  v11 = v6;
  objc_msgSend(v7, "getPasswordsForNextBatchWithCompletionHandler:", v12);

}

void __86__WBSPasswordBreachChecker__checkLowFrequencyBatchesWithBagManager_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  char v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "count");
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v25 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v11, "topBucketIdentiferAndHash");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "uuid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v13);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v8);
    }

    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(a1 + 40);
    v16 = *(void **)(v14 + 24);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[2] = __86__WBSPasswordBreachChecker__checkLowFrequencyBatchesWithBagManager_completionHandler___block_invoke_2;
    v18[3] = &unk_1E649D8B8;
    v18[1] = 3221225472;
    v22 = v4;
    v19 = v5;
    v20 = v14;
    v23 = *(_BYTE *)(a1 + 48);
    v21 = v15;
    v17 = v5;
    objc_msgSend(v16, "fetchLowFrequencyBucketsForBucketIdentifiersAndClientBlindedHashes:completionHandler:", v17, v18);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __86__WBSPasswordBreachChecker__checkLowFrequencyBatchesWithBagManager_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", *(_QWORD *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v27 = a1;
  obj = *(id *)(a1 + 32);
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v31;
    *(_QWORD *)&v6 = 138740227;
    v24 = v6;
    v26 = *(_QWORD *)v31;
    do
    {
      v9 = 0;
      v28 = v7;
      do
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v9);
        objc_msgSend(v3, "objectForKeyedSubscript:", v10, v24);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "first");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "second");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v12 && objc_msgSend(v13, "length"))
        {
          v15 = v3;
          objc_msgSend(*(id *)(*(_QWORD *)(v27 + 40) + 8), "cryptographicOperations");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "unblindHash:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (*(_BYTE *)(v27 + 64))
          {
            v18 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              v20 = (void *)MEMORY[0x1E0CB3940];
              v21 = v18;
              objc_msgSend(v20, "safari_stringAsHexWithData:", v14);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "safari_stringAsHexWithData:", v17);
              v22 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v24;
              v35 = v25;
              v36 = 2117;
              v37 = v22;
              v23 = (void *)v22;
              _os_log_debug_impl(&dword_1B2621000, v21, OS_LOG_TYPE_DEBUG, "Unblinded %{sensitive}@ to %{sensitive}@", buf, 0x16u);

            }
          }
          if (objc_msgSend(v12, "containsLowercaseHexStringForData:", v17))
            v19 = &unk_1E64CE388;
          else
            v19 = &unk_1E64CE3A0;
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, v10);

          v3 = v15;
          v8 = v26;
          v7 = v28;
        }
        else
        {
          objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E64CE370, v10);
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v7);
  }

  (*(void (**)(void))(*(_QWORD *)(v27 + 48) + 16))();
}

- (void)_mergeResultsByUUID:(id)a3 intoResultsByPersistentIdentifier:(id)a4 usingQueuedPasswordsbyUUID:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __109__WBSPasswordBreachChecker__mergeResultsByUUID_intoResultsByPersistentIdentifier_usingQueuedPasswordsbyUUID___block_invoke;
  v11[3] = &unk_1E649D908;
  v12 = v8;
  v13 = v7;
  v9 = v7;
  v10 = v8;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v11);

}

void __109__WBSPasswordBreachChecker__mergeResultsByUUID_intoResultsByPersistentIdentifier_usingQueuedPasswordsbyUUID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v6, "persistentIdentifiers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v12, "length"))
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)checkPasswordBatchesWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[16];

  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2621000, v5, OS_LOG_TYPE_INFO, "Beginning breached password lookup session.", buf, 2u);
  }
  -[WBSPasswordBreachQueuedPasswordBagManager allNonbreachedPasswords](self->_bagManager, "allNonbreachedPasswords");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  v8 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[WBSPasswordBreachChecker checkPasswordBatchesWithCompletionHandler:].cold.1(v9, v6);
    objc_msgSend(v6, "allValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __70__WBSPasswordBreachChecker_checkPasswordBatchesWithCompletionHandler___block_invoke;
    v11[3] = &unk_1E649D9D8;
    v11[4] = self;
    v12 = v6;
    v13 = v4;
    -[WBSPasswordBreachChecker _checkHighFrequencyBucketForPasswords:withCompletionHandler:](self, "_checkHighFrequencyBucketForPasswords:withCompletionHandler:", v10, v11);

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B2621000, v9, OS_LOG_TYPE_DEFAULT, "Found no passwords to check. Stopping session.", buf, 2u);
    }
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

void __70__WBSPasswordBreachChecker_checkPasswordBatchesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  dispatch_time_t v19;
  intptr_t v20;
  void *v21;
  unint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[5];
  id v32;
  id v33;
  NSObject *v34;

  objc_msgSend(a2, "safari_mapAndFilterKeysAndObjectsUsingBlock:", &__block_literal_global_32);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_mapAndFilterKeysAndObjectsUsingBlock:", &__block_literal_global_11_1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = objc_msgSend(v4, "count");
  v7 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    objc_msgSend(*(id *)(v7 + 16), "reportPasswordCheckBatchResults:", v4);
    objc_msgSend(*(id *)(a1 + 32), "_mergeResultsByUUID:intoResultsByPersistentIdentifier:usingQueuedPasswordsbyUUID:", v3, v5, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(*(id *)(v7 + 8), "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "verboseSensitiveLoggingEnabled");

    if (v9)
    {
      v10 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        __70__WBSPasswordBreachChecker_checkPasswordBatchesWithCompletionHandler___block_invoke_cold_2(v10);
    }
  }
  v11 = dispatch_group_create();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "numberOfBatchesPerSession");

  if (v13)
  {
    v14 = 0;
    while (1)
    {
      dispatch_group_enter(v11);
      v15 = *(_QWORD **)(a1 + 32);
      v16 = v15[2];
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __70__WBSPasswordBreachChecker_checkPasswordBatchesWithCompletionHandler___block_invoke_12;
      v31[3] = &unk_1E649D9B0;
      v31[4] = v15;
      v32 = v5;
      v33 = *(id *)(a1 + 40);
      v17 = v11;
      v34 = v17;
      objc_msgSend(v15, "_checkLowFrequencyBatchesWithBagManager:completionHandler:", v16, v31);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "configuration");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = dispatch_time(0, 1000000000 * objc_msgSend(v18, "lowFrequencyBucketFetchTimeout"));
      v20 = dispatch_group_wait(v17, v19);

      if (v20)
        break;

      ++v14;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "configuration");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "numberOfBatchesPerSession");

      if (v14 >= v22)
        goto LABEL_10;
    }
    v23 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      __70__WBSPasswordBreachChecker_checkPasswordBatchesWithCompletionHandler___block_invoke_cold_1(v23, v24, v25, v26, v27, v28, v29, v30);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
LABEL_10:
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void *__70__WBSPasswordBreachChecker_checkPasswordBatchesWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "unsignedIntegerValue");
  if (v3 > 2)
    return &unk_1E64CE370;
  else
    return (void *)qword_1E649D9F8[v3];
}

id __70__WBSPasswordBreachChecker_checkPasswordBatchesWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v4;

  v3 = a3;
  if (objc_msgSend(v3, "unsignedIntegerValue") == 2)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

void __70__WBSPasswordBreachChecker_checkPasswordBatchesWithCompletionHandler___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "safari_mapAndFilterKeysAndObjectsUsingBlock:", &__block_literal_global_14_0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "reportPasswordCheckBatchResults:", v3);
  objc_msgSend(*(id *)(a1 + 32), "_mergeResultsByUUID:intoResultsByPersistentIdentifier:usingQueuedPasswordsbyUUID:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void *__70__WBSPasswordBreachChecker_checkPasswordBatchesWithCompletionHandler___block_invoke_2_13(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "unsignedIntegerValue");
  if (v3 > 2)
    return &unk_1E64CE370;
  else
    return (void *)qword_1E649DA10[v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestManager, 0);
  objc_storeStrong((id *)&self->_bagManager, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

void __88__WBSPasswordBreachChecker__checkHighFrequencyBucketForPasswords_withCompletionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, a1, a3, "Failed to fetch high frequency bucket.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)checkPasswordBatchesWithCompletionHandler:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = 134283521;
  v5 = objc_msgSend(a2, "count");
  _os_log_debug_impl(&dword_1B2621000, v3, OS_LOG_TYPE_DEBUG, "Initial bag contains %{private}lu non-breached passwords.", (uint8_t *)&v4, 0xCu);

}

void __70__WBSPasswordBreachChecker_checkPasswordBatchesWithCompletionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, a1, a3, "Timed out waiting for low frequency bucket result.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __70__WBSPasswordBreachChecker_checkPasswordBatchesWithCompletionHandler___block_invoke_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B2621000, log, OS_LOG_TYPE_DEBUG, "No breached common passwords found.", v1, 2u);
  OUTLINED_FUNCTION_5();
}

@end
