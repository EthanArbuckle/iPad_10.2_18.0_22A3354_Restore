@implementation PPContactStore

- (PPContactStore)init
{
  PPContactStore *v2;
  PPRecordMonitoringHelper *v3;
  PPRecordMonitoringHelper *monitoringHelper;
  PPClientFeedbackHelper *v5;
  PPClientFeedbackHelper *clientFeedbackHelper;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PPContactStore;
  v2 = -[PPContactStore init](&v8, sel_init);
  if (v2)
  {
    v3 = -[PPRecordMonitoringHelper initWithName:]([PPRecordMonitoringHelper alloc], "initWithName:", CFSTR("ContactStore"));
    monitoringHelper = v2->_monitoringHelper;
    v2->_monitoringHelper = v3;

    v5 = -[PPClientFeedbackHelper initWithParentObject:]([PPClientFeedbackHelper alloc], "initWithParentObject:", v2);
    clientFeedbackHelper = v2->_clientFeedbackHelper;
    v2->_clientFeedbackHelper = v5;

  }
  return v2;
}

- (BOOL)iterRankedContactsWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v7 = a5;
  v8 = a3;
  +[PPContactClient sharedInstance](PPContactClient, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__PPContactStore_iterRankedContactsWithQuery_error_block___block_invoke;
  v12[3] = &unk_1E226C1F0;
  v13 = v7;
  v10 = v7;
  LOBYTE(a4) = objc_msgSend(v9, "rankedContactsWithQuery:error:handleBatch:", v8, a4, v12);

  return (char)a4;
}

- (BOOL)iterContactNameRecordsForClient:(id)a3 error:(id *)a4 block:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v7 = a5;
  v8 = a3;
  +[PPContactClient sharedInstance](PPContactClient, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__PPContactStore_iterContactNameRecordsForClient_error_block___block_invoke;
  v12[3] = &unk_1E226C1F0;
  v13 = v7;
  v10 = v7;
  LOBYTE(a4) = objc_msgSend(v9, "contactNameRecordsForClient:error:handleBatch:", v8, a4, v12);

  return (char)a4;
}

- (id)upcomingRelevantContactsForQuery:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  uint8_t buf[16];

  v5 = a3;
  v6 = (void *)objc_opt_new();
  pp_contacts_signpost_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  pp_contacts_signpost_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PPContactStore.upcomingRelevantContactsForQuery", (const char *)&unk_18BE9F21B, buf, 2u);
  }

  +[PPContactClient sharedInstance](PPContactClient, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __57__PPContactStore_upcomingRelevantContactsForQuery_error___block_invoke;
  v19[3] = &unk_1E226AC10;
  v20 = v6;
  v12 = v6;
  v13 = objc_msgSend(v11, "upcomingRelevantContactsForQuery:error:handleBatch:", v5, a4, v19);

  pp_contacts_signpost_handle();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v15, OS_SIGNPOST_INTERVAL_END, v8, "PPContactStore.upcomingRelevantContactsForQuery", (const char *)&unk_18BE9F21B, buf, 2u);
  }

  if (v13)
    v16 = v12;
  else
    v16 = 0;
  v17 = v16;

  return v17;
}

- (id)contactHandlesForTopics:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  uint8_t buf[16];

  v5 = a3;
  v6 = (void *)objc_opt_new();
  pp_contacts_signpost_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  pp_contacts_signpost_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PPContactStore.contactHandlesForTopics", (const char *)&unk_18BE9F21B, buf, 2u);
  }

  +[PPContactClient sharedInstance](PPContactClient, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __48__PPContactStore_contactHandlesForTopics_error___block_invoke;
  v19[3] = &unk_1E226AC10;
  v20 = v6;
  v12 = v6;
  v13 = objc_msgSend(v11, "contactHandlesForTopics:error:handleBatch:", v5, a4, v19);

  pp_contacts_signpost_handle();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v15, OS_SIGNPOST_INTERVAL_END, v8, "PPContactStore.contactHandlesForTopics", (const char *)&unk_18BE9F21B, buf, 2u);
  }

  if (v13)
    v16 = v12;
  else
    v16 = 0;
  v17 = v16;

  return v17;
}

- (id)contactHandlesForSource:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  uint8_t buf[16];

  v5 = a3;
  v6 = (void *)objc_opt_new();
  pp_contacts_signpost_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  pp_contacts_signpost_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PPContactStore.contactHandlesForSource", (const char *)&unk_18BE9F21B, buf, 2u);
  }

  +[PPContactClient sharedInstance](PPContactClient, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __48__PPContactStore_contactHandlesForSource_error___block_invoke;
  v19[3] = &unk_1E226AC10;
  v20 = v6;
  v12 = v6;
  v13 = objc_msgSend(v11, "contactHandlesForSource:error:handleBatch:", v5, a4, v19);

  pp_contacts_signpost_handle();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v15, OS_SIGNPOST_INTERVAL_END, v8, "PPContactStore.contactHandlesForSource", (const char *)&unk_18BE9F21B, buf, 2u);
  }

  if (v13)
    v16 = v12;
  else
    v16 = 0;
  v17 = v16;

  return v17;
}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  _QWORD v18[5];
  id v19;

  v7 = a4;
  v8 = a3;
  if (objc_msgSend(v8, "isMapped"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPContactStore.m"), 131, CFSTR("You cannot send mapped feedback on named entities. Please use PPFeedback to create the feedback for named entities."));

  }
  -[PPContactStore clientIdentifier](self, "clientIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPContactStore.m"), 132, CFSTR("The clientIdentifier property must be set on the %@ in order to send feedback."), v17);

  }
  -[PPContactStore clientIdentifier](self, "clientIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClientIdentifier:", v11);

  +[PPContactClient sharedInstance](PPContactClient, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __46__PPContactStore_registerFeedback_completion___block_invoke;
  v18[3] = &unk_1E226C218;
  v18[4] = self;
  v19 = v7;
  v13 = v7;
  objc_msgSend(v12, "registerFeedback:completion:", v8, v18);

}

- (id)forwardingTargetForSelector:(SEL)a3
{
  PPClientFeedbackHelper *v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = self->_clientFeedbackHelper;
  else
    v4 = 0;
  return v4;
}

- (void)feedbackDisambiguationResultWithChoicesIdentifiers:(id)a3 chosenContactIdentifier:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[PPContactClient sharedInstance](PPContactClient, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __104__PPContactStore_feedbackDisambiguationResultWithChoicesIdentifiers_chosenContactIdentifier_completion___block_invoke;
  v12[3] = &unk_1E226A6E0;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v10, "feedbackDisambiguationResultWithChoicesIdentifiers:chosenContactIdentifier:completion:", v9, v8, v12);

}

- (id)_recordGenerator
{
  return &__block_literal_global_2961;
}

- (void)_sendChangesToDelegates
{
  PPRecordMonitoringHelper *monitoringHelper;
  id v3;

  monitoringHelper = self->_monitoringHelper;
  -[PPContactStore _recordGenerator](self, "_recordGenerator");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PPRecordMonitoringHelper sendChangesToDelegatesWithChangeGenerator:recordGenerator:](monitoringHelper, "sendChangesToDelegatesWithChangeGenerator:recordGenerator:", &__block_literal_global_20, v3);

}

- (void)_loadContactNameRecordsWithDelegate:(id)a3
{
  PPRecordMonitoringHelper *monitoringHelper;
  id v5;
  id v6;

  monitoringHelper = self->_monitoringHelper;
  v5 = a3;
  -[PPContactStore _recordGenerator](self, "_recordGenerator");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PPRecordMonitoringHelper loadRecordsWithDelegate:recordGenerator:](monitoringHelper, "loadRecordsWithDelegate:recordGenerator:", v5, v6);

}

- (BOOL)loadContactNameRecordsAndMonitorChangesWithDelegate:(id)a3 error:(id *)a4
{
  id v5;
  PPRecordMonitoringHelper *monitoringHelper;
  void *v7;
  _QWORD v9[4];
  id v10;
  id location;

  v5 = a3;
  location = 0;
  objc_initWeak(&location, self);
  monitoringHelper = self->_monitoringHelper;
  -[PPContactStore _recordGenerator](self, "_recordGenerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__PPContactStore_loadContactNameRecordsAndMonitorChangesWithDelegate_error___block_invoke;
  v9[3] = &unk_1E226B998;
  objc_copyWeak(&v10, &location);
  LOBYTE(monitoringHelper) = -[PPRecordMonitoringHelper loadRecordsAndMonitorChangesWithDelegate:recordGenerator:notificationRegistrationBlock:](monitoringHelper, "loadRecordsAndMonitorChangesWithDelegate:recordGenerator:notificationRegistrationBlock:", v5, v7, v9);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
  return (char)monitoringHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientFeedbackHelper, 0);
  objc_storeStrong((id *)&self->_monitoringHelper, 0);
}

void __76__PPContactStore_loadContactNameRecordsAndMonitorChangesWithDelegate_error___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  _QWORD v3[4];
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __76__PPContactStore_loadContactNameRecordsAndMonitorChangesWithDelegate_error___block_invoke_2;
    v3[3] = &unk_1E226B998;
    objc_copyWeak(&v4, v1);
    +[PPNotificationManager addContactsObserverForLifetimeOfObject:block:](PPNotificationManager, "addContactsObserverForLifetimeOfObject:block:", WeakRetained, v3);
    objc_destroyWeak(&v4);
  }

}

void __76__PPContactStore_loadContactNameRecordsAndMonitorChangesWithDelegate_error___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)*((_QWORD *)WeakRetained + 1);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __76__PPContactStore_loadContactNameRecordsAndMonitorChangesWithDelegate_error___block_invoke_3;
    v4[3] = &unk_1E226C130;
    v4[4] = v2;
    objc_msgSend(v3, "handleChangeNotificationWithName:afterDelaySeconds:handler:", CFSTR("Contacts"), v4, 0.0);
  }

}

uint64_t __76__PPContactStore_loadContactNameRecordsAndMonitorChangesWithDelegate_error___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendChangesToDelegates");
}

id __41__PPContactStore__sendChangesToDelegates__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2954;
  v18 = __Block_byref_object_dispose__2955;
  v19 = 0;
  +[PPContactClient sharedInstance](PPContactClient, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __41__PPContactStore__sendChangesToDelegates__block_invoke_21;
  v12[3] = &unk_1E226ABA8;
  v12[4] = &v14;
  objc_msgSend(v5, "contactNameRecordChangesForClient:error:handleBatch:", v6, &v13, v12);
  v7 = v13;

  if (objc_msgSend((id)v15[5], "changesTruncated"))
  {
    pp_contacts_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v4;
      _os_log_impl(&dword_18BE3A000, v8, OS_LOG_TYPE_DEFAULT, "delegate %@ had contact changes truncated, must reset", buf, 0xCu);
    }

    if (a3)
      *a3 = 1;
  }
  if (v7)
  {
    pp_contacts_log_handle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v7;
      _os_log_error_impl(&dword_18BE3A000, v9, OS_LOG_TYPE_ERROR, "contactNameRecordChangesForClient returned error: %@", buf, 0xCu);
    }

  }
  objc_msgSend((id)v15[5], "changes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v14, 8);
  return v10;
}

void __41__PPContactStore__sendChangesToDelegates__block_invoke_21(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  else
  {
    pp_contacts_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_18BE3A000, v7, OS_LOG_TYPE_ERROR, "contactNameRecordChangesForClient sent an empty batch", v8, 2u);
    }

  }
}

id __34__PPContactStore__recordGenerator__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, _BYTE *);
  void *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = (void *)objc_opt_new();
  +[PPContactClient sharedInstance](PPContactClient, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __34__PPContactStore__recordGenerator__block_invoke_2;
  v13 = &unk_1E226AC10;
  v6 = v3;
  v14 = v6;
  objc_msgSend(v4, "contactNameRecordsForClient:error:handleBatch:", v5, &v15, &v10);
  v7 = v15;

  if (v7)
  {
    pp_contacts_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v17 = v2;
      v18 = 2112;
      v19 = v7;
      _os_log_error_impl(&dword_18BE3A000, v8, OS_LOG_TYPE_ERROR, "error during contactNameRecordsForClient for delegate %@: %@", buf, 0x16u);
    }

  }
  objc_msgSend(v6, "sortUsingComparator:", &__block_literal_global_17, v10, v11, v12, v13);

  return v6;
}

uint64_t __34__PPContactStore__recordGenerator__block_invoke_2(uint64_t result, uint64_t a2, _BYTE *a3)
{
  if (!*a3)
    return objc_msgSend(*(id *)(result + 32), "addObjectsFromArray:", a2);
  return result;
}

int64_t __34__PPContactStore__recordGenerator__block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a2, "score");
  v6 = v5;
  objc_msgSend(v4, "score");
  v8 = v7;

  return +[PPUtils reverseCompareDouble:withDouble:](PPUtils, "reverseCompareDouble:withDouble:", v6, v8);
}

void __104__PPContactStore_feedbackDisambiguationResultWithChoicesIdentifiers_chosenContactIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    pp_contacts_log_handle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_error_impl(&dword_18BE3A000, v4, OS_LOG_TYPE_ERROR, "Error from feedbackDisambiguationResultWithChoicesIdentifiers: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __46__PPContactStore_registerFeedback_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(id *)(a1 + 32);
  if (v5)
  {
    pp_contacts_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_error_impl(&dword_18BE3A000, v7, OS_LOG_TYPE_ERROR, "Error from registerFeedback:completion: %@", (uint8_t *)&v9, 0xCu);
    }

  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);

}

uint64_t __48__PPContactStore_contactHandlesForSource_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
}

uint64_t __48__PPContactStore_contactHandlesForTopics_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
}

uint64_t __57__PPContactStore_upcomingRelevantContactsForQuery_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
}

void __62__PPContactStore_iterContactNameRecordsForClient_error_block___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (!*a3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
        if (*a3)
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v9)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

void __58__PPContactStore_iterRankedContactsWithQuery_error_block___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (!*a3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
        if (*a3)
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v9)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

@end
