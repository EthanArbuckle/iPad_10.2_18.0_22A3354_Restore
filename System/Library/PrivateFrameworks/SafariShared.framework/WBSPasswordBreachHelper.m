@implementation WBSPasswordBreachHelper

- (void)runLookupSessionIgnoringMinimumDelay:(BOOL)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  BOOL v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__WBSPasswordBreachHelper_runLookupSessionIgnoringMinimumDelay_completionHandler___block_invoke;
  v7[3] = &unk_1E4B3DAB0;
  v8 = v5;
  v9 = a3;
  v6 = v5;
  +[WBSPasswordBreachManager getSharedManagerWithCompletionHandler:](WBSPasswordBreachManager, "getSharedManagerWithCompletionHandler:", v7);

}

void __82__WBSPasswordBreachHelper_runLookupSessionIgnoringMinimumDelay_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  if (a2)
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __82__WBSPasswordBreachHelper_runLookupSessionIgnoringMinimumDelay_completionHandler___block_invoke_2;
    v4[3] = &unk_1E4B3DA88;
    v5 = *(id *)(a1 + 32);
    objc_msgSend(a2, "performNextSessionLookupIgnoringMinimumDelay:completionHandler:", v3, v4);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

uint64_t __82__WBSPasswordBreachHelper_runLookupSessionIgnoringMinimumDelay_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getResultRecordDictionariesForResultQueryDictionaries:(id)a3 withCompletionHandler:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0D89C58], "resultQueriesFromDictionaryRepresentations:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __103__WBSPasswordBreachHelper_getResultRecordDictionariesForResultQueryDictionaries_withCompletionHandler___block_invoke;
  v9[3] = &unk_1E4B3DAD8;
  v10 = v6;
  v11 = v5;
  v7 = v6;
  v8 = v5;
  +[WBSPasswordBreachManager getSharedManagerWithCompletionHandler:](WBSPasswordBreachManager, "getSharedManagerWithCompletionHandler:", v9);

}

void __103__WBSPasswordBreachHelper_getResultRecordDictionariesForResultQueryDictionaries_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  if (a2)
  {
    objc_msgSend(a2, "resultRecordsForQueries:", *(_QWORD *)(a1 + 32));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D89C60], "dictionaryRepresentationsForResultRecords:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (void)recentlyBreachedResultRecordDictionariesWithCompletionHandler:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __89__WBSPasswordBreachHelper_recentlyBreachedResultRecordDictionariesWithCompletionHandler___block_invoke;
  v5[3] = &unk_1E4B3DB00;
  v6 = v3;
  v4 = v3;
  +[WBSPasswordBreachManager getSharedManagerWithCompletionHandler:](WBSPasswordBreachManager, "getSharedManagerWithCompletionHandler:", v5);

}

void __89__WBSPasswordBreachHelper_recentlyBreachedResultRecordDictionariesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  if (a2)
  {
    objc_msgSend(a2, "recentlyBreachedResultRecords");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D89C60], "dictionaryRepresentationsForResultRecords:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

- (void)clearRecentlyBreachedResultRecordsWithCompletionHandler:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __83__WBSPasswordBreachHelper_clearRecentlyBreachedResultRecordsWithCompletionHandler___block_invoke;
  v5[3] = &unk_1E4B3DB00;
  v6 = v3;
  v4 = v3;
  +[WBSPasswordBreachManager getSharedManagerWithCompletionHandler:](WBSPasswordBreachManager, "getSharedManagerWithCompletionHandler:", v5);

}

uint64_t __83__WBSPasswordBreachHelper_clearRecentlyBreachedResultRecordsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t (*v3)(void);

  if (a2)
  {
    objc_msgSend(a2, "clearRecentlyBreachedResultRecords");
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  return v3();
}

- (void)clearAllRecordsWithCompletionHandler:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__WBSPasswordBreachHelper_clearAllRecordsWithCompletionHandler___block_invoke;
  v5[3] = &unk_1E4B3DB00;
  v6 = v3;
  v4 = v3;
  +[WBSPasswordBreachManager getSharedManagerWithCompletionHandler:](WBSPasswordBreachManager, "getSharedManagerWithCompletionHandler:", v5);

}

void __64__WBSPasswordBreachHelper_clearAllRecordsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  if (a2)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __64__WBSPasswordBreachHelper_clearAllRecordsWithCompletionHandler___block_invoke_2;
    v3[3] = &unk_1E4B2A6E0;
    v4 = *(id *)(a1 + 32);
    objc_msgSend(a2, "clearAllRecordsWithCompletionHandler:", v3);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

uint64_t __64__WBSPasswordBreachHelper_clearAllRecordsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addResultRecordDictionaries:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0D89C60], "resultRecordsFromDictionaryRepresentations:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__WBSPasswordBreachHelper_addResultRecordDictionaries_completionHandler___block_invoke;
  v9[3] = &unk_1E4B3DAD8;
  v10 = v6;
  v11 = v5;
  v7 = v6;
  v8 = v5;
  +[WBSPasswordBreachManager getSharedManagerWithCompletionHandler:](WBSPasswordBreachManager, "getSharedManagerWithCompletionHandler:", v9);

}

uint64_t __73__WBSPasswordBreachHelper_addResultRecordDictionaries_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t (*v3)(void);

  if (a2)
  {
    objc_msgSend(a2, "addResultRecords:", *(_QWORD *)(a1 + 32));
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  return v3();
}

@end
