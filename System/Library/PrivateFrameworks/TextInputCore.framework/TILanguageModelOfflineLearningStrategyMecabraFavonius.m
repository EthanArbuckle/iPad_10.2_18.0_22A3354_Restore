@implementation TILanguageModelOfflineLearningStrategyMecabraFavonius

- (TILanguageModelOfflineLearningStrategyMecabraFavonius)initWithClientIdentifier:(id)a3
{
  id v4;
  TILanguageModelOfflineLearningStrategyMecabraFavonius *v5;
  uint64_t v6;
  TILanguageModelOfflineLearningTask *learningTask;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TILanguageModelOfflineLearningStrategyMecabraFavonius;
  v5 = -[TILanguageModelOfflineLearningStrategyMecabraFavonius init](&v9, sel_init);
  if (v5)
  {
    +[TILanguageModelOfflineLearningTask taskWithClientIdentifier:oneTimeTask:](TILanguageModelOfflineLearningTask, "taskWithClientIdentifier:oneTimeTask:", v4, 1);
    v6 = objc_claimAutoreleasedReturnValue();
    learningTask = v5->_learningTask;
    v5->_learningTask = (TILanguageModelOfflineLearningTask *)v6;

  }
  return v5;
}

- (id)filterMessages:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  BOOL (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;

  v3 = (objc_class *)MEMORY[0x1E0C99D68];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 8, -9, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __72__TILanguageModelOfflineLearningStrategyMecabraFavonius_filterMessages___block_invoke;
  v16 = &unk_1EA106F68;
  v17 = v5;
  v18 = v7;
  v8 = v7;
  v9 = v5;
  objc_msgSend(v4, "indexesOfObjectsPassingTest:", &v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectsAtIndexes:", v10, v13, v14, v15, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)incrementUsageCountsForMessages:(id)a3 withAdaptationContext:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 1;
  -[TILanguageModelOfflineLearningStrategyMecabraFavonius identifyLanguagesForMessages:](self, "identifyLanguagesForMessages:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __111__TILanguageModelOfflineLearningStrategyMecabraFavonius_incrementUsageCountsForMessages_withAdaptationContext___block_invoke;
  v10[3] = &unk_1EA106F90;
  v11 = v6;
  v12 = &v13;
  v10[4] = self;
  v8 = v6;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v10);
  LOBYTE(v6) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)v6;
}

- (BOOL)learnMessages:(id)a3 withRecipientRecords:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  id v19;
  id v20;
  char v21;
  TILanguageModelOfflineLearningStrategyMecabraFavonius *v23;
  id obj;
  void *v25;
  _QWORD v26[5];
  id v27;
  uint64_t *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  _BYTE v37[128];
  uint64_t v38;

  v23 = self;
  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 1;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v6, "count") + 1);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v6, "count") + 1);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v12, "recipient", v23);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "objectForKey:", CFSTR("compositeName"));
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        v17 = &stru_1EA1081D0;
        if (v15)
          v17 = (__CFString *)v15;
        v18 = v17;

        if (v14)
          objc_msgSend(v25, "setObject:forKey:", v14, v18);
        objc_msgSend(v7, "objectForKey:", v18);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        if (!v19)
        {
          v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v7, "setObject:forKey:", v19, v18);
        }
        objc_msgSend(v19, "addObject:", v12);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v9);
  }

  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __92__TILanguageModelOfflineLearningStrategyMecabraFavonius_learnMessages_withRecipientRecords___block_invoke;
  v26[3] = &unk_1EA106F90;
  v26[4] = v23;
  v27 = v25;
  v28 = &v33;
  v20 = v25;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v26);
  v21 = *((_BYTE *)v34 + 24);

  _Block_object_dispose(&v33, 8);
  return v21;
}

- (id)identifyLanguagesForMessages:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __CFString *v11;
  CFStringRef v12;
  CFStringRef v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  _QWORD *v24;
  _QWORD v25[5];
  id v26;
  _BYTE v27[128];
  uint64_t v28;
  CFRange v29;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__20681;
  v25[4] = __Block_byref_object_dispose__20682;
  v26 = 0;
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __86__TILanguageModelOfflineLearningStrategyMecabraFavonius_identifyLanguagesForMessages___block_invoke;
  v23 = &unk_1EA107058;
  v24 = v25;
  TIDispatchSync();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "body", (_QWORD)v16);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v29.length = -[__CFString length](v11, "length");
        v29.location = 0;
        v12 = CFStringTokenizerCopyBestStringLanguage(v11, v29);
        if (v12)
        {
          v13 = v12;
          objc_msgSend(v4, "objectForKey:", v12);
          v14 = (id)objc_claimAutoreleasedReturnValue();
          if (!v14)
          {
            v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v4, "setObject:forKey:", v14, v13);
          }
          objc_msgSend(v14, "addObject:", v10);

          CFRelease(v13);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v27, 16);
    }
    while (v7);
  }

  _Block_object_dispose(v25, 8);
  return v4;
}

- (TILanguageModelOfflineLearningTask)learningTask
{
  return (TILanguageModelOfflineLearningTask *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_learningTask, 0);
}

void __86__TILanguageModelOfflineLearningStrategyMecabraFavonius_identifyLanguagesForMessages___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0DBDBA8], "sharedInputModeController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enabledInputModeIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __92__TILanguageModelOfflineLearningStrategyMecabraFavonius_learnMessages_withRecipientRecords___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  TILanguageModelAdaptationContext *v12;
  char v13;
  id v14;

  v14 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "learningTask");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clientIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[TILanguageModelAdaptationContext initWithClientIdentifier:andRecipientRecord:]([TILanguageModelAdaptationContext alloc], "initWithClientIdentifier:andRecipientRecord:", v10, v11);
  -[TILanguageModelAdaptationContext setIsOnline:](v12, "setIsOnline:", 0);
  if (v12)
    v13 = objc_msgSend(*(id *)(a1 + 32), "incrementUsageCountsForMessages:withAdaptationContext:", v14, v12);
  else
    v13 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v13;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *a4 = 1;

}

void __111__TILanguageModelOfflineLearningStrategyMecabraFavonius_incrementUsageCountsForMessages_withAdaptationContext___block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  char v11;

  v7 = (void *)a1[4];
  v8 = a3;
  v9 = a2;
  objc_msgSend(v7, "learningTask");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "incrementUsageCountsForMessages:forLanguage:adaptationContext:", v8, v9, a1[5]);

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v11;
  if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    *a4 = 1;
}

BOOL __72__TILanguageModelOfflineLearningStrategyMecabraFavonius_filterMessages___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v11;
  void *v12;

  v3 = a2;
  objc_msgSend(v3, "body");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5
    && ((objc_opt_respondsToSelector() & 1) == 0 || objc_msgSend(v3, "fromMe"))
    && (objc_msgSend(v3, "dateSent"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "laterDate:", *(_QWORD *)(a1 + 32)),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = *(void **)(a1 + 32),
        v7,
        v6,
        v7 == v8))
  {
    objc_msgSend(v3, "dateSent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "earlierDate:", *(_QWORD *)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v12 == *(void **)(a1 + 40);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
