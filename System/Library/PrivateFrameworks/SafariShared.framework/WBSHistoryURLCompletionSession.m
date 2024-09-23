@implementation WBSHistoryURLCompletionSession

- (WBSHistoryURLCompletionSession)initWithHistoryService:(id)a3
{
  id v5;
  WBSHistoryURLCompletionSession *v6;
  WBSHistoryURLCompletionSession *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *internalQueue;
  WBSHistoryURLCompletionSession *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSHistoryURLCompletionSession;
  v6 = -[WBSHistoryURLCompletionSession init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_historyService, a3);
    v8 = dispatch_queue_create("com.apple.SafariShared.WBSHistoryURLCompletionSession", 0);
    internalQueue = v7->_internalQueue;
    v7->_internalQueue = (OS_dispatch_queue *)v8;

    v10 = v7;
  }

  return v7;
}

- (id)_matchSnapshotForCompletionMatch:(id)a3
{
  id v3;
  WBSURLCompletionMatchSnapshot *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t matched;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  WBSURLCompletionMatchSnapshot *v13;
  void *v14;

  v3 = a3;
  if (objc_msgSend(v3, "matchLocation") == 4)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v3, "originalURLString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safari_URLWithDataAsString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    matched = _SSURLCompletionMatchLocationForWBSURLCompletionMatchLocation(objc_msgSend(v3, "matchLocation"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "data");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v9, "lastVisitedTimeInterval");
      objc_msgSend(v10, "dateWithTimeIntervalSinceReferenceDate:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v12 = objc_msgSend(v9, "visitCount");
      else
        v12 = 0;

    }
    else
    {
      v12 = 0;
      v11 = 0;
    }
    v13 = [WBSURLCompletionMatchSnapshot alloc];
    objc_msgSend(v3, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[WBSURLCompletionMatchSnapshot initWithURL:title:matchLocation:isTopHit:isSynthesizedTopHit:isTopHitDueToTriggerMatch:visitCount:lastVisitTime:](v13, "initWithURL:title:matchLocation:isTopHit:isSynthesizedTopHit:isTopHitDueToTriggerMatch:visitCount:lastVisitTime:", v7, v14, matched, objc_msgSend(v3, "isTopHit"), 0, 0, v12, v11);

  }
  return v4;
}

- (void)_getBestMatchesForTypedString:(id)a3 filterResultsUsingProfileIdentifier:(id)a4 limit:(unint64_t)a5 forQueryID:(int64_t)a6 withSearchParameters:(id)a7 completionHandler:(id)a8
{
  void (**v14)(id, void *, void *, _QWORD);
  WBSURLCompletionDatabase *urlCompletionDatabase;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[5];
  id v23;
  id v24;

  v14 = (void (**)(id, void *, void *, _QWORD))a8;
  urlCompletionDatabase = self->_urlCompletionDatabase;
  v24 = 0;
  v23 = 0;
  -[WBSURLCompletionDatabase getBestMatchesForTypedString:filterResultsUsingProfileIdentifier:topHits:matches:limit:forQueryID:withSearchParameters:](urlCompletionDatabase, "getBestMatchesForTypedString:filterResultsUsingProfileIdentifier:topHits:matches:limit:forQueryID:withSearchParameters:", a3, a4, &v24, &v23, a5, a6, a7);
  v16 = v24;
  v17 = v23;
  v18 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __156__WBSHistoryURLCompletionSession__getBestMatchesForTypedString_filterResultsUsingProfileIdentifier_limit_forQueryID_withSearchParameters_completionHandler___block_invoke;
  v22[3] = &unk_1E4B3C8B8;
  v22[4] = self;
  objc_msgSend(v16, "safari_mapObjectsUsingBlock:", v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v18;
  v21[1] = 3221225472;
  v21[2] = __156__WBSHistoryURLCompletionSession__getBestMatchesForTypedString_filterResultsUsingProfileIdentifier_limit_forQueryID_withSearchParameters_completionHandler___block_invoke_2;
  v21[3] = &unk_1E4B3C8B8;
  v21[4] = self;
  objc_msgSend(v17, "safari_mapObjectsUsingBlock:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2](v14, v19, v20, 0);

}

id __156__WBSHistoryURLCompletionSession__getBestMatchesForTypedString_filterResultsUsingProfileIdentifier_limit_forQueryID_withSearchParameters_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_matchSnapshotForCompletionMatch:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __156__WBSHistoryURLCompletionSession__getBestMatchesForTypedString_filterResultsUsingProfileIdentifier_limit_forQueryID_withSearchParameters_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_matchSnapshotForCompletionMatch:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_databaseConnectionOptions
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (void)_ensureDatabaseIsWarmed
{
  dispatch_semaphore_t v3;
  WBSHistoryServiceDatabase *database;
  NSObject *v5;
  _QWORD v6[4];
  dispatch_semaphore_t v7;

  v3 = dispatch_semaphore_create(0);
  database = self->_database;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__WBSHistoryURLCompletionSession__ensureDatabaseIsWarmed__block_invoke;
  v6[3] = &unk_1E4B2AD70;
  v7 = v3;
  v5 = v3;
  -[WBSHistoryServiceDatabase ensureLatestVisitsAreComputed:](database, "ensureLatestVisitsAreComputed:", v6);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

}

intptr_t __57__WBSHistoryURLCompletionSession__ensureDatabaseIsWarmed__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)getBestMatchesForTypedString:(id)a3 filterResultsUsingProfileIdentifier:(id)a4 limit:(unint64_t)a5 forQueryID:(int64_t)a6 withSearchParameters:(id)a7 completionHandler:(id)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSObject *internalQueue;
  uint64_t v19;
  id v20;
  id v21;
  qos_class_t v22;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD *v35;
  unint64_t v36;
  int64_t v37;
  _QWORD block[5];
  id v39;
  id v40;
  _QWORD *v41;
  _QWORD v42[3];
  char v43;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  v15 = a8;
  v16 = dispatch_group_create();
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v43 = 0;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  internalQueue = self->_internalQueue;
  v19 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __155__WBSHistoryURLCompletionSession_getBestMatchesForTypedString_filterResultsUsingProfileIdentifier_limit_forQueryID_withSearchParameters_completionHandler___block_invoke;
  block[3] = &unk_1E4B2BEE0;
  block[4] = self;
  v39 = v17;
  v41 = v42;
  v20 = v15;
  v40 = v20;
  v21 = v17;
  dispatch_group_async(v16, internalQueue, block);
  v22 = qos_class_self();
  dispatch_get_global_queue(v22, 0);
  v23 = objc_claimAutoreleasedReturnValue();
  v30[0] = v19;
  v30[1] = 3221225472;
  v30[2] = __155__WBSHistoryURLCompletionSession_getBestMatchesForTypedString_filterResultsUsingProfileIdentifier_limit_forQueryID_withSearchParameters_completionHandler___block_invoke_3;
  v30[3] = &unk_1E4B3C908;
  v30[4] = self;
  v31 = v12;
  v36 = a5;
  v37 = a6;
  v32 = v13;
  v33 = v14;
  v34 = v20;
  v35 = v42;
  v24 = v20;
  v25 = v14;
  v26 = v13;
  v27 = v12;
  dispatch_group_notify(v16, v23, v30);

  _Block_object_dispose(v42, 8);
}

void __155__WBSHistoryURLCompletionSession_getBestMatchesForTypedString_filterResultsUsingProfileIdentifier_limit_forQueryID_withSearchParameters_completionHandler___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  dispatch_semaphore_t v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[3])
  {
    objc_msgSend(v2, "_ensureDatabaseIsWarmed");
  }
  else
  {
    v3 = dispatch_semaphore_create(0);
    v4 = *(_QWORD **)(a1 + 32);
    v5 = (void *)v4[1];
    objc_msgSend(v4, "_databaseConnectionOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __155__WBSHistoryURLCompletionSession_getBestMatchesForTypedString_filterResultsUsingProfileIdentifier_limit_forQueryID_withSearchParameters_completionHandler___block_invoke_2;
    v13 = &unk_1E4B3C8E0;
    v17 = *(_QWORD *)(a1 + 56);
    v8 = v3;
    v14 = v8;
    v9 = *(id *)(a1 + 48);
    v15 = *(_QWORD *)(a1 + 32);
    v16 = v9;
    objc_msgSend(v5, "connectWithOptions:connection:completionHandler:", v6, v7, &v10);

    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    objc_msgSend(*(id *)(a1 + 32), "_ensureDatabaseIsWarmed", v10, v11, v12, v13);

  }
}

void __155__WBSHistoryURLCompletionSession_getBestMatchesForTypedString_filterResultsUsingProfileIdentifier_limit_forQueryID_withSearchParameters_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  WBSURLCompletionDatabase *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v6 = a3;
  if (!v10 || v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v7 = objc_alloc_init(WBSURLCompletionDatabase);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(void **)(v8 + 32);
    *(_QWORD *)(v8 + 32) = v7;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "setDataSource:");
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 24), a2);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }

}

uint64_t __155__WBSHistoryURLCompletionSession_getBestMatchesForTypedString_filterResultsUsingProfileIdentifier_limit_forQueryID_withSearchParameters_completionHandler___block_invoke_3(uint64_t result)
{
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 72) + 8) + 24))
    return objc_msgSend(*(id *)(result + 32), "_getBestMatchesForTypedString:filterResultsUsingProfileIdentifier:limit:forQueryID:withSearchParameters:completionHandler:", *(_QWORD *)(result + 40), *(_QWORD *)(result + 48), *(_QWORD *)(result + 80), *(_QWORD *)(result + 88), *(_QWORD *)(result + 56), *(_QWORD *)(result + 64));
  return result;
}

- (void)enumerateMatchDataForTypedStringHint:(id)a3 filterResultsUsingProfileIdentifier:(id)a4 options:(unint64_t)a5 withBlock:(id)a6
{
  id v9;
  id v10;
  dispatch_queue_t v11;
  dispatch_group_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  _QWORD v20[4];
  NSObject *v21;
  NSObject *v22;
  id v23;

  v9 = a3;
  v10 = a6;
  v11 = dispatch_queue_create("com.apple.SafariShared.WBSHistoryURLCompletionSession.enumerateMatchDataForTypedStringHint", 0);
  v12 = dispatch_group_create();
  -[WBSHistoryServiceDatabase urlCompletion](self->_database, "urlCompletion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSinceReferenceDate");
  v16 = v15;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __125__WBSHistoryURLCompletionSession_enumerateMatchDataForTypedStringHint_filterResultsUsingProfileIdentifier_options_withBlock___block_invoke;
  v20[3] = &unk_1E4B3C930;
  v17 = v12;
  v21 = v17;
  v18 = v11;
  v22 = v18;
  v19 = v10;
  v23 = v19;
  objc_msgSend(v13, "searchForUserTypedString:options:currentTime:enumerationGroup:enumerationBlock:", v9, a5, v17, v20, v16);

  dispatch_group_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
}

void __125__WBSHistoryURLCompletionSession_enumerateMatchDataForTypedStringHint_filterResultsUsingProfileIdentifier_options_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(NSObject **)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __125__WBSHistoryURLCompletionSession_enumerateMatchDataForTypedStringHint_filterResultsUsingProfileIdentifier_options_withBlock___block_invoke_2;
  v8[3] = &unk_1E4B29E18;
  v6 = *(id *)(a1 + 48);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  dispatch_group_async(v4, v5, v8);

}

uint64_t __125__WBSHistoryURLCompletionSession_enumerateMatchDataForTypedStringHint_filterResultsUsingProfileIdentifier_options_withBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)fakeBookmarkMatchDataWithURLString:(id)a3 title:(id)a4 shouldPreload:(BOOL)a5
{
  id v6;
  id v7;
  WBSHistoryServiceURLCompletionMatchData *v8;
  WBSHistoryServiceURLCompletionMatchEntry *v9;
  double v10;
  WBSHistoryServiceURLCompletionMatchEntry *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[WBSHistoryServiceURLCompletionMatchData initWithLastVisitWasFailure:visitWasFromThisDevice:visitWasClientError:]([WBSHistoryServiceURLCompletionMatchData alloc], "initWithLastVisitWasFailure:visitWasFromThisDevice:visitWasClientError:", 0, 0, 0);
  v9 = [WBSHistoryServiceURLCompletionMatchEntry alloc];
  LODWORD(v10) = 0;
  v11 = -[WBSHistoryServiceURLCompletionMatchEntry initWithURLString:title:topSitesScore:visitCountScore:](v9, "initWithURLString:title:topSitesScore:visitCountScore:", v6, v7, 0, v10);
  v14[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSHistoryServiceURLCompletionMatchData setEntries:](v8, "setEntries:", v12);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlCompletionDatabase, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_historyService, 0);
}

@end
