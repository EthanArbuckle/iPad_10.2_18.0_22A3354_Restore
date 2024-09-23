@implementation PPPeopleSuggester

- (PPPeopleSuggester)init
{
  PPPeopleSuggester *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _PASLock *lock;
  uint64_t v14;
  OS_dispatch_queue *serialQueueForSweeping;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PPPeopleSuggester;
  v2 = -[PPPeopleSuggester init](&v17, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D709B0], "defaultConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setMaximumNumberOfSuggestions:", objc_msgSend(v4, "peopleSuggesterMax"));

    v5 = objc_opt_new();
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D709A8]), "initWithConfiguration:", v3);
    v7 = *(void **)(v5 + 8);
    *(_QWORD *)(v5 + 8) = v6;

    v8 = objc_opt_new();
    v9 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v8;

    objc_msgSend(*(id *)(v5 + 16), "setCountLimit:", 4);
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v5);
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v12;

    objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "PPPeopleSuggester.serialQueueForSweeping", 9);
    v14 = objc_claimAutoreleasedReturnValue();
    serialQueueForSweeping = v2->_serialQueueForSweeping;
    v2->_serialQueueForSweeping = (OS_dispatch_queue *)v14;

  }
  return v2;
}

- (id)rankedContactIdentifiers
{
  return -[PPPeopleSuggester _rankedContactIdentifiersMatchingName:](self, "_rankedContactIdentifiersMatchingName:", 0);
}

- (double)_cacheEntryAgeThresholdSecondsSince1970
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "timeIntervalSince1970");
  v4 = v3 + -1800.0;

  return v4;
}

- (id)_rankedContactIdentifiersMatchingName:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  _PASLock *lock;
  __CFString *v9;
  __CFString *v10;
  id v11;
  _QWORD v13[4];
  __CFString *v14;
  __CFString *v15;
  PPPeopleSuggester *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = (__CFString *)a3;
  v5 = v4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__9582;
  v22 = __Block_byref_object_dispose__9583;
  v23 = 0;
  v6 = CFSTR("nilKey");
  if (v4)
    v6 = v4;
  v7 = v6;
  lock = self->_lock;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__PPPeopleSuggester__rankedContactIdentifiersMatchingName___block_invoke;
  v13[3] = &unk_1E7E18B78;
  v9 = v5;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  v16 = self;
  v17 = &v18;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v13);
  v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v11;
}

- (void)_sweepCache
{
  _PASLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__PPPeopleSuggester__sweepCache__block_invoke;
  v3[3] = &unk_1E7E18BA0;
  v3[4] = self;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueueForSweeping, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

void __32__PPPeopleSuggester__sweepCache__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  NSObject *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  pp_contacts_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEBUG, "PPPeopleSuggester: sweeping cache", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_cacheEntryAgeThresholdSecondsSince1970");
  v6 = v5;
  objc_msgSend(v3[2], "mapTableRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v11)
  {
    v13 = v11;
    v14 = 0;
    v15 = *(_QWORD *)v26;
    *(_QWORD *)&v12 = 138412290;
    v24 = v12;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(v10);
        v17 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v3[2], "objectForKey:", v17, v24, (_QWORD)v25);
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)v18;
        if (v18 && *(double *)(v18 + 8) < v6)
        {
          pp_private_log_handle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v24;
            v30 = v17;
            _os_log_debug_impl(&dword_1C392E000, v20, OS_LOG_TYPE_DEBUG, "PPPeopleSuggester: removing entry for %@", buf, 0xCu);
          }

          objc_msgSend(v3[2], "removeObjectForKey:", v17);
          ++v14;
        }

      }
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v13);
  }
  else
  {
    v14 = 0;
  }

  v21 = objc_opt_new();
  v22 = v3[3];
  v3[3] = (id)v21;

  pp_contacts_log_handle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v30) = v14;
    _os_log_debug_impl(&dword_1C392E000, v23, OS_LOG_TYPE_DEBUG, "PPPeopleSuggester: removed %d entries from cache", buf, 8u);
  }

}

void __59__PPPeopleSuggester__rankedContactIdentifiersMatchingName___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  NSObject *v4;
  uint64_t v5;
  id *v6;
  double v7;
  double v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  _QWORD *v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  double v35;
  double v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  id *v40;
  _QWORD *v41;
  id *v42;
  _QWORD block[5];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[128];
  uint8_t buf[4];
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  pp_contacts_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v39 = objc_msgSend(*(id *)(a1 + 32), "length");
    *(_DWORD *)buf = 134217984;
    v50 = v39;
    _os_log_debug_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEBUG, "PPPeopleSuggester: _rankedContactIdentifiersMatchingName: name.length: %tu", buf, 0xCu);
  }

  objc_msgSend(v3[2], "objectForKey:", *(_QWORD *)(a1 + 40));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (id *)v5;
  if (v5
    && (v7 = *(double *)(v5 + 8), objc_msgSend(*(id *)(a1 + 48), "_cacheEntryAgeThresholdSecondsSince1970"), v7 >= v8))
  {
    v12 = v6[2];
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v14 = *(id *)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;
  }
  else
  {
    v40 = v6;
    v9 = objc_msgSend(*(id *)(a1 + 32), "length");
    v10 = v3[1];
    v11 = (void *)objc_opt_new();
    if (v9)
      objc_msgSend(v10, "rankedNameSuggestionsFromContext:name:", v11, *(_QWORD *)(a1 + 32));
    else
      objc_msgSend(v10, "rankedGlobalSuggestionsFromContext:contactsOnly:", v11, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (_QWORD *)a1;
    v42 = v3;

    pp_contacts_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(v15, "count");
      *(_DWORD *)buf = 134217984;
      v50 = v17;
      _os_log_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEFAULT, "PPPeopleSuggester: %tu suggestions", buf, 0xCu);
    }

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v15, "count"));
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v14 = v15;
    v19 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v45;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v45 != v21)
            objc_enumerationMutation(v14);
          v23 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v22);
          v24 = (void *)MEMORY[0x1C3BD6630]();
          objc_msgSend(v23, "conversationIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "length");

          if (v26)
          {
            pp_contacts_log_handle();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v23, "conversationIdentifier");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v50 = (uint64_t)v29;
              _os_log_debug_impl(&dword_1C392E000, v27, OS_LOG_TYPE_DEBUG, "PPPeopleSuggester: _PSSuggestion: id: %@", buf, 0xCu);

            }
            objc_msgSend(v23, "conversationIdentifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObject:", v28);

          }
          objc_autoreleasePoolPop(v24);
          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      }
      while (v20);
    }

    v30 = (_QWORD *)objc_opt_new();
    v31 = (void *)objc_opt_new();
    objc_msgSend(v31, "timeIntervalSince1970");
    if (v30)
    {
      v30[1] = v32;

      v33 = v18;
      v31 = (void *)v30[2];
      v30[2] = v33;
    }
    v3 = v42;

    objc_msgSend(v42[2], "setObject:forKey:", v30, v41[5]);
    objc_storeStrong((id *)(*(_QWORD *)(v41[7] + 8) + 40), v18);
    v34 = (void *)objc_opt_new();
    objc_msgSend(v34, "timeIntervalSinceDate:", v42[3]);
    v36 = v35;

    if (v36 > 60.0)
    {
      v37 = v41[6];
      v38 = *(NSObject **)(v37 + 16);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __59__PPPeopleSuggester__rankedContactIdentifiersMatchingName___block_invoke_32;
      block[3] = &unk_1E7E1F4F0;
      block[4] = v37;
      dispatch_async(v38, block);
    }

    v6 = v40;
  }

}

uint64_t __59__PPPeopleSuggester__rankedContactIdentifiersMatchingName___block_invoke_32(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sweepCache");
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6, &__block_literal_global_9603);
  return (id)sharedInstance__pasExprOnceResult_9604;
}

void __35__PPPeopleSuggester_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_9604;
  sharedInstance__pasExprOnceResult_9604 = v1;

  objc_autoreleasePoolPop(v0);
}

@end
