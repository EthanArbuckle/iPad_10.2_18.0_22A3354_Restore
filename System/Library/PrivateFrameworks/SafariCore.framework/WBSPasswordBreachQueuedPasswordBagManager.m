@implementation WBSPasswordBreachQueuedPasswordBagManager

- (WBSPasswordBreachQueuedPasswordBagManager)initWithContext:(id)a3 results:(id)a4 passwordSource:(id)a5
{
  id v9;
  id v10;
  id v11;
  WBSPasswordBreachQueuedPasswordBagManager *v12;
  WBSPasswordBreachQueuedPasswordBagManager *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *internalQueue;
  NSObject *v16;
  WBSPasswordBreachQueuedPasswordBagManager *v17;
  WBSPasswordBreachQueuedPasswordBagManager *v18;
  _QWORD block[4];
  WBSPasswordBreachQueuedPasswordBagManager *v21;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)WBSPasswordBreachQueuedPasswordBagManager;
  v12 = -[WBSPasswordBreachQueuedPasswordBagManager init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a3);
    objc_storeStrong((id *)&v13->_results, a4);
    objc_storeStrong((id *)&v13->_credentialSource, a5);
    v14 = dispatch_queue_create("com.apple.Safari.WBSPasswordBreachQueuedPasswordBagManager", 0);
    internalQueue = v13->_internalQueue;
    v13->_internalQueue = (OS_dispatch_queue *)v14;

    v13->_fillState = 0;
    v16 = v13->_internalQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__WBSPasswordBreachQueuedPasswordBagManager_initWithContext_results_passwordSource___block_invoke;
    block[3] = &unk_1E649B768;
    v17 = v13;
    v21 = v17;
    dispatch_async(v16, block);
    v18 = v17;

  }
  return v13;
}

void __84__WBSPasswordBreachQueuedPasswordBagManager_initWithContext_results_passwordSource___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint8_t v13[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queuedPasswordBagManagerState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_passwordBagFromDictionaryRepresentation:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "mutableCopy");
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v5;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    v8 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1B2621000, v8, OS_LOG_TYPE_INFO, "Restored password bag.", v13, 2u);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_constructNewBagOnInternalQueueEnsuringFakePasswordGeneration:", 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 32);
    *(_QWORD *)(v10 + 32) = v9;

    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
    {
      v12 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __84__WBSPasswordBreachQueuedPasswordBagManager_initWithContext_results_passwordSource___block_invoke_cold_1();
    }
  }

}

- (id)_passwordBagFromDictionaryRepresentation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD v17[4];
  id v18;
  uint8_t buf[16];

  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2621000, v5, OS_LOG_TYPE_INFO, "Trying to restore password bag from persisted state.", buf, 2u);
  }
  objc_msgSend(v4, "safari_numberForKey:", CFSTR("FillState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    self->_fillState = objc_msgSend(v6, "integerValue");
    objc_msgSend(v4, "safari_arrayContainingObjectsOfClass:forKey:", objc_opt_class(), CFSTR("PersistentIdentifiers"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v8);
      -[WBSPasswordBreachQueuedPasswordBagManager _unbreachedCredentials](self, "_unbreachedCredentials");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __86__WBSPasswordBreachQueuedPasswordBagManager__passwordBagFromDictionaryRepresentation___block_invoke;
      v17[3] = &unk_1E649DAC0;
      v18 = v9;
      v11 = v9;
      objc_msgSend(v10, "safari_filterObjectsUsingBlock:", v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSPasswordBreachQueuedPasswordBagManager _constructBagOnInternalQueueWithCredentials:ensureFakePasswordGeneration:](self, "_constructBagOnInternalQueueWithCredentials:ensureFakePasswordGeneration:", v12, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[WBSPasswordBreachQueuedPasswordBagManager _passwordBagFromDictionaryRepresentation:].cold.2();
      v13 = 0;
    }

  }
  else
  {
    v14 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[WBSPasswordBreachQueuedPasswordBagManager _passwordBagFromDictionaryRepresentation:].cold.1();
    v13 = 0;
  }

  return v13;
}

uint64_t __86__WBSPasswordBreachQueuedPasswordBagManager__passwordBagFromDictionaryRepresentation___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "persistentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (id)_unbreachedCredentials
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[WBSPasswordBreachCredentialSource credentials](self->_credentialSource, "credentials");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_mapObjectsUsingBlock:", &__block_literal_global_34);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSPasswordBreachResults resultRecordsForQueries:](self->_results, "resultRecordsForQueries:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v12, "persistentIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v13);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __67__WBSPasswordBreachQueuedPasswordBagManager__unbreachedCredentials__block_invoke_2;
  v17[3] = &unk_1E649DAC0;
  v18 = v6;
  v14 = v6;
  objc_msgSend(v3, "safari_filterObjectsUsingBlock:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

WBSPasswordBreachResultQuery *__67__WBSPasswordBreachQueuedPasswordBagManager__unbreachedCredentials__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WBSPasswordBreachResultQuery *v3;
  void *v4;
  void *v5;
  WBSPasswordBreachResultQuery *v6;

  v2 = a2;
  v3 = [WBSPasswordBreachResultQuery alloc];
  objc_msgSend(v2, "persistentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateLastModified");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[WBSPasswordBreachResultQuery initWithPersistentIdentifier:dateLastModified:](v3, "initWithPersistentIdentifier:dateLastModified:", v4, v5);
  return v6;
}

BOOL __67__WBSPasswordBreachQueuedPasswordBagManager__unbreachedCredentials__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "persistentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = (objc_msgSend(v4, "result") & 0xFFFFFFFFFFFFFFFELL) != 2;
  else
    v5 = 1;

  return v5;
}

- (id)_constructNewBagOnInternalQueueEnsuringFakePasswordGeneration:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  int64_t fillState;
  int64_t v7;
  void *v8;
  void *v9;

  v3 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[WBSPasswordBreachQueuedPasswordBagManager _constructNewBagOnInternalQueueEnsuringFakePasswordGeneration:].cold.1();
  fillState = self->_fillState;
  if (!fillState)
  {
    v7 = 1;
    goto LABEL_7;
  }
  if (fillState == 1)
  {
    v7 = 2;
LABEL_7:
    self->_fillState = v7;
  }
  -[WBSPasswordBreachQueuedPasswordBagManager _unbreachedCredentials](self, "_unbreachedCredentials");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSPasswordBreachQueuedPasswordBagManager _constructBagOnInternalQueueWithCredentials:ensureFakePasswordGeneration:](self, "_constructBagOnInternalQueueWithCredentials:ensureFakePasswordGeneration:", v8, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_constructBagOnInternalQueueWithCredentials:(id)a3 ensureFakePasswordGeneration:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  WBSPasswordBreachQueuedPassword *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  NSObject *v19;
  unint64_t v20;
  void *v21;
  int v22;
  NSObject *v23;
  unint64_t v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  unint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D80], "safari_dictionaryWithObjectsInFastEnumerationCollection:groupedUsingBlock:", a3, &__block_literal_global_12_1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v5, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(v7);
        v12 = -[WBSPasswordBreachQueuedPassword initWithCredentials:context:]([WBSPasswordBreachQueuedPassword alloc], "initWithCredentials:context:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i), self->_context);
        -[WBSPasswordBreachQueuedPassword uuid](v12, "uuid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v13);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v9);
  }

  -[WBSPasswordBreachContext configuration](self->_context, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "passwordCheckBatchSize");
  v16 = objc_msgSend(v14, "numberOfBatchesPerSession");
  v17 = objc_msgSend(v6, "count");
  v18 = v17;
  if (!a4 && !v17)
  {
    v19 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[WBSPasswordBreachQueuedPasswordBagManager _constructBagOnInternalQueueWithCredentials:ensureFakePasswordGeneration:].cold.2();
LABEL_19:
    v28 = v6;
    goto LABEL_20;
  }
  v20 = v16 * v15;
  if (v20 <= v17)
    goto LABEL_19;
  -[WBSPasswordBreachContext configuration](self->_context, "configuration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "verboseSensitiveLoggingEnabled");

  if (v22)
  {
    v23 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134545665;
      v37 = v20 - v18;
      _os_log_debug_impl(&dword_1B2621000, v23, OS_LOG_TYPE_DEBUG, "Adding %{sensitive}lu generated passwords to the bag.", buf, 0xCu);
    }
  }
  v24 = v20 - v18;
  if (v20 == v18)
    goto LABEL_19;
  while (1)
  {
    v25 = -[WBSPasswordBreachQueuedPassword initFakePasswordWithContext:]([WBSPasswordBreachQueuedPassword alloc], "initFakePasswordWithContext:", self->_context);
    if (!v25)
      break;
    v26 = v25;
    objc_msgSend(v25, "uuid");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v26, v27);

    if (!--v24)
      goto LABEL_19;
  }
  v30 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    -[WBSPasswordBreachQueuedPasswordBagManager _constructBagOnInternalQueueWithCredentials:ensureFakePasswordGeneration:].cold.1();
  v28 = 0;
LABEL_20:

  return v28;
}

id __118__WBSPasswordBreachQueuedPasswordBagManager__constructBagOnInternalQueueWithCredentials_ensureFakePasswordGeneration___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a2, "password");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "length");
  if (v3)
  {
    if (+[WBSPasswordEvaluator passwordLooksLikeDigitOnlyPasscode:](WBSPasswordEvaluator, "passwordLooksLikeDigitOnlyPasscode:", v2))
    {
      v3 = 0;
    }
    else
    {
      v3 = v2;
    }
  }
  v4 = v3;

  return v4;
}

- (void)getPasswordsForNextBatchWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __91__WBSPasswordBreachQueuedPasswordBagManager_getPasswordsForNextBatchWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E649B6B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __91__WBSPasswordBreachQueuedPasswordBagManager_getPasswordsForNextBatchWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  int v49;
  id obj;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t v59;
  _BYTE v60[15];
  uint8_t v61[128];
  uint8_t buf[4];
  uint64_t v63;
  __int16 v64;
  uint64_t v65;
  _BYTE v66[128];
  uint64_t v67;

  v1 = a1;
  v67 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "passwordCheckBatchSize");

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 32), "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 8), "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    if (!v3)
    {
LABEL_40:
      v13 = v6;
      goto LABEL_41;
    }
    v8 = 0;
    v43 = v7;
    v44 = v4;
    v42 = v3;
LABEL_4:
    v9 = arc4random();
    v10 = v9 % objc_msgSend(v6, "count");
    objc_msgSend(v6, "objectAtIndexedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 32), "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v12);
    objc_msgSend(v6, "removeObjectAtIndex:", v10);
    if (objc_msgSend(v6, "count"))
    {
      v13 = v6;
      goto LABEL_32;
    }
    v14 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      __91__WBSPasswordBreachQueuedPasswordBagManager_getPasswordsForNextBatchWithCompletionHandler___block_invoke_cold_3(&v59, v60, v14);
    if ((objc_msgSend(v7, "shouldRefillBagWhenEmpty") & 1) == 0)
    {
      v40 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        __91__WBSPasswordBreachQueuedPasswordBagManager_getPasswordsForNextBatchWithCompletionHandler___block_invoke_cold_2();

      goto LABEL_40;
    }
    objc_msgSend(*(id *)(v1 + 32), "_constructNewBagOnInternalQueueEnsuringFakePasswordGeneration:", 1);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v41 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
        __91__WBSPasswordBreachQueuedPasswordBagManager_getPasswordsForNextBatchWithCompletionHandler___block_invoke_cold_1();
      (*(void (**)(void))(*(_QWORD *)(v1 + 40) + 16))();

      goto LABEL_42;
    }
    v16 = (void *)v15;
    v45 = v12;
    v46 = v8;
    v47 = v11;
    v49 = objc_msgSend(v7, "verboseSensitiveLoggingEnabled");
    v48 = v16;
    objc_msgSend(v16, "allKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v17, "mutableCopy");

    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    obj = *(id *)(*(_QWORD *)(v1 + 32) + 32);
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
    if (!v18)
      goto LABEL_24;
    v19 = v18;
    v20 = *(_QWORD *)v56;
LABEL_12:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v56 != v20)
        objc_enumerationMutation(obj);
      v22 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * v21);
      v23 = v1;
      objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 32), "objectForKeyedSubscript:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "persistentIdentifiers");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "firstObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "length");

      if (!v27)
        goto LABEL_22;
      if (objc_msgSend(v24, "remainingHashCount"))
      {
        if (!v49)
          goto LABEL_22;
        v28 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          goto LABEL_22;
        v29 = v28;
        v30 = objc_msgSend(v24, "remainingHashCount");
        *(_DWORD *)buf = 138740227;
        v63 = v22;
        v64 = 2053;
        v65 = v30;
        _os_log_debug_impl(&dword_1B2621000, v29, OS_LOG_TYPE_DEBUG, "Skipping adding work to %{sensitive}@ because it already has %{sensitive}lu items enqueued.", buf, 0x16u);
      }
      else
      {
        objc_msgSend(v48, "objectForKeyedSubscript:", v22);
        v29 = objc_claimAutoreleasedReturnValue();
        -[NSObject pushBucketIdentifiersAndHashesFromQueuedPassword:](v29, "pushBucketIdentifiersAndHashesFromQueuedPassword:", v24);
      }

LABEL_22:
      ++v21;
      v1 = v23;
      if (v19 == v21)
      {
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
        if (!v19)
        {
LABEL_24:

          v53 = 0u;
          v54 = 0u;
          v51 = 0u;
          v52 = 0u;
          v4 = v44;
          v31 = v44;
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
          v12 = v45;
          if (v32)
          {
            v33 = v32;
            v34 = *(_QWORD *)v52;
            do
            {
              for (i = 0; i != v33; ++i)
              {
                if (*(_QWORD *)v52 != v34)
                  objc_enumerationMutation(v31);
                objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "uuid");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "removeObject:", v36);

              }
              v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
            }
            while (v33);
          }

          v37 = *(_QWORD *)(v1 + 32);
          v38 = *(void **)(v37 + 32);
          *(_QWORD *)(v37 + 32) = v48;

          v6 = v13;
          v3 = v42;
          v7 = v43;
          v8 = v46;
          v11 = v47;
LABEL_32:

          if (++v8 == v3)
          {
LABEL_41:
            (*(void (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
            v6 = v13;
            goto LABEL_42;
          }
          goto LABEL_4;
        }
        goto LABEL_12;
      }
    }
  }
  v39 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2621000, v39, OS_LOG_TYPE_DEFAULT, "Queued password bag is empty. Stopping lookup session.", buf, 2u);
  }
  (*(void (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
LABEL_42:

}

- (void)reportPasswordCheckBatchResults:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__WBSPasswordBreachQueuedPasswordBagManager_reportPasswordCheckBatchResults___block_invoke;
  v7[3] = &unk_1E649B6D8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __77__WBSPasswordBreachQueuedPasswordBagManager_reportPasswordCheckBatchResults___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  __int128 v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  WBSPasswordBreachResultRecord *v24;
  __int128 v25;
  int v26;
  id obj;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v4, "verboseSensitiveLoggingEnabled");

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = *(id *)(a1 + 40);
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
  if (v30)
  {
    v29 = *(_QWORD *)v37;
    *(_QWORD *)&v5 = 134217984;
    v25 = v5;
    v28 = a1;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v37 != v29)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", v7, v25);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "unsignedIntegerValue");

          if ((unint64_t)(v10 - 2) < 2)
          {
            if (v26)
            {
              v16 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138739971;
                v42 = v7;
                _os_log_debug_impl(&dword_1B2621000, v16, OS_LOG_TYPE_DEBUG, "Password with UUID %{sensitive}@ breached. Removing from bag.", buf, 0xCu);
              }
            }
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", v7);
          }
          else
          {
            if (!v10)
              goto LABEL_13;
            if (v10 == 1)
            {
              objc_msgSend(v8, "removeTopBucketIdentifierAndHash");
              if (v26)
              {
                v11 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
                if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138739971;
                  v42 = v7;
                  _os_log_debug_impl(&dword_1B2621000, v11, OS_LOG_TYPE_DEBUG, "Password with UUID %{sensitive}@ not breached.", buf, 0xCu);
                }
              }
LABEL_13:
              if (!objc_msgSend(v8, "remainingHashCount"))
              {
                v12 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
                objc_msgSend(v8, "uuid");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "removeObjectForKey:", v13);

                if (v26)
                {
                  v14 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
                  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138739971;
                    v42 = v7;
                    _os_log_debug_impl(&dword_1B2621000, v14, OS_LOG_TYPE_DEBUG, "Password with UUID %{sensitive}@ has no remaining queued work. Removing from bag.", buf, 0xCu);
                  }
                }
              }
            }
            else
            {
              v17 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v25;
                v42 = v10;
                _os_log_error_impl(&dword_1B2621000, v17, OS_LOG_TYPE_ERROR, "Received unknown breach check result: %lu", buf, 0xCu);
              }
            }
          }
          v34 = 0u;
          v35 = 0u;
          v32 = 0u;
          v33 = 0u;
          v31 = v8;
          objc_msgSend(v8, "persistentIdentifiers");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v33;
            do
            {
              for (j = 0; j != v20; ++j)
              {
                if (*(_QWORD *)v33 != v21)
                  objc_enumerationMutation(v18);
                v23 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
                if (objc_msgSend(v23, "length"))
                {
                  v24 = -[WBSPasswordBreachResultRecord initWithPersistentIdentifier:result:dateLastModified:]([WBSPasswordBreachResultRecord alloc], "initWithPersistentIdentifier:result:dateLastModified:", v23, v10, v2);
                  objc_msgSend(v3, "addObject:", v24);

                }
              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
            }
            while (v20);
          }

          a1 = v28;
          v8 = v31;
          goto LABEL_35;
        }
        v15 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138477827;
          v42 = v7;
          _os_log_error_impl(&dword_1B2621000, v15, OS_LOG_TYPE_ERROR, "Received result for unknown password: %{private}@", buf, 0xCu);
        }
LABEL_35:

      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
    }
    while (v30);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addResultRecords:", v3);
}

- (NSDictionary)allNonbreachedPasswords
{
  NSObject *internalQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__10;
  v10 = __Block_byref_object_dispose__10;
  v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__WBSPasswordBreachQueuedPasswordBagManager_allNonbreachedPasswords__block_invoke;
  v5[3] = &unk_1E649BA10;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __68__WBSPasswordBreachQueuedPasswordBagManager_allNonbreachedPasswords__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)saveBagToStore
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__WBSPasswordBreachQueuedPasswordBagManager_saveBagToStore__block_invoke;
  block[3] = &unk_1E649B768;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

void __59__WBSPasswordBreachQueuedPasswordBagManager_saveBagToStore__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_dictionaryRepresentation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setQueuedPasswordBagManagerState:", v3);

}

- (id)_dictionaryRepresentation
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  WBSPasswordBreachQueuedPasswordBagManager *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[2];
  _QWORD v29[2];
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v19 = self;
  -[NSMutableDictionary allValues](self->_queuedPasswordsByUUID, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        objc_msgSend(v9, "persistentIdentifiers");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v21;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v21 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
              if (objc_msgSend(v15, "length"))
                objc_msgSend(v3, "addObject:", v15);
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
          }
          while (v12);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
    }
    while (v6);
  }

  v28[0] = CFSTR("FillState");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v19->_fillState);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = CFSTR("PersistentIdentifiers");
  v29[0] = v16;
  v29[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (int64_t)fillState
{
  NSObject *internalQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__WBSPasswordBreachQueuedPasswordBagManager_fillState__block_invoke;
  v5[3] = &unk_1E649BA10;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__WBSPasswordBreachQueuedPasswordBagManager_fillState__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 40);
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p, context: %@, results: %@, credentialSource: %@, queuedPasswordsByUUID: %@>"), objc_opt_class(), self, self->_context, self->_results, self->_credentialSource, self->_queuedPasswordsByUUID);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_queuedPasswordsByUUID, 0);
  objc_storeStrong((id *)&self->_credentialSource, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

void __84__WBSPasswordBreachQueuedPasswordBagManager_initWithContext_results_passwordSource___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_11();
  _os_log_error_impl(&dword_1B2621000, v0, OS_LOG_TYPE_ERROR, "Could not create password bag.", v1, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)_passwordBagFromDictionaryRepresentation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_7(&dword_1B2621000, v0, v1, "Missing fill state.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_passwordBagFromDictionaryRepresentation:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_7(&dword_1B2621000, v0, v1, "No persistent identifiers found.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_constructNewBagOnInternalQueueEnsuringFakePasswordGeneration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_7(&dword_1B2621000, v0, v1, "Constructing new password bag.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_constructBagOnInternalQueueWithCredentials:ensureFakePasswordGeneration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9(&dword_1B2621000, v0, v1, "Could not generate password for new password bag. Aborting.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_constructBagOnInternalQueueWithCredentials:ensureFakePasswordGeneration:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_7(&dword_1B2621000, v0, v1, "Found no unbreached credentials; not going to generate any extra passwords.",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_5();
}

void __91__WBSPasswordBreachQueuedPasswordBagManager_getPasswordsForNextBatchWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9(&dword_1B2621000, v0, v1, "Failed to construct new password bag. Aborting.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __91__WBSPasswordBreachQueuedPasswordBagManager_getPasswordsForNextBatchWithCompletionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_7(&dword_1B2621000, v0, v1, "Told not to refill password bag.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __91__WBSPasswordBreachQueuedPasswordBagManager_getPasswordsForNextBatchWithCompletionHandler___block_invoke_cold_3(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1B2621000, log, OS_LOG_TYPE_DEBUG, "Password bag empty.", buf, 2u);
}

@end
