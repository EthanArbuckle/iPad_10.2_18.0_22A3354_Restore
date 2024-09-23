@implementation WFContextualActionSpotlightSyncService

void __146__WFContextualActionSpotlightSyncService_queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName_identifiers_batchSize_fetcher_completionBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  getWFSpotlightSyncLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v15 = "-[WFContextualActionSpotlightSyncService queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName:identifiers"
          ":batchSize:fetcher:completionBlock:]_block_invoke";
    v16 = 2112;
    v17 = v3;
    _os_log_impl(&dword_1C146A000, v2, OS_LOG_TYPE_DEFAULT, "%s New indexing stage: Indexing %@ contextual actions", buf, 0x16u);
  }

  v4 = *(_QWORD *)(a1 + 64);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __146__WFContextualActionSpotlightSyncService_queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName_identifiers_batchSize_fetcher_completionBlock___block_invoke_179;
  v8[3] = &unk_1E7AA7718;
  v5 = *(void **)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 40);
  v9 = v5;
  v10 = *(id *)(a1 + 32);
  v12 = *(id *)(a1 + 72);
  v6 = *(id *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 80);
  v11 = v6;
  v13 = v7;
  (*(void (**)(uint64_t, _QWORD *))(v4 + 16))(v4, v8);

}

uint64_t __98__WFContextualActionSpotlightSyncService_indexAppShortcutsForBundleIdentifiers_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_v2GetAppShortcutContextualActionsForBundleIdentifiers:completionHandler:", *(_QWORD *)(a1 + 40), a2);
}

- (void)queue_v2GetAppShortcutContextualActionsForBundleIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  _QWORD block[4];
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[WFContextualActionSpotlightSyncService queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  getWFSpotlightSyncLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v35 = "-[WFContextualActionSpotlightSyncService queue_v2GetAppShortcutContextualActionsForBundleIdentifiers:completionHandler:]";
    _os_log_impl(&dword_1C146A000, v11, OS_LOG_TYPE_INFO, "%s Fetching app shortcuts for apps...", buf, 0xCu);
  }

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DD9C48]), "initWithAppShortcutsDenyListEnvironment:environment:", 2, 2);
  v33 = 0;
  objc_msgSend(v12, "fetchAppShortcutsForBundleIdentifiers:localeIdentifier:error:", v6, v10, &v33);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v33;
  if (!v14)
  {
    if (v6)
    {
      v17 = v6;
      getWFSpotlightSyncLogObject();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v35 = "-[WFContextualActionSpotlightSyncService queue_v2GetAppShortcutContextualActionsForBundleIdentifiers:completionHandler:]";
        v36 = 2112;
        v37 = v17;
        v19 = "%s Indexing app shortcuts for bundle identifiers: %@";
        v20 = v18;
        v21 = 22;
LABEL_12:
        _os_log_impl(&dword_1C146A000, v20, OS_LOG_TYPE_INFO, v19, buf, v21);
      }
    }
    else
    {
      objc_msgSend(v13, "allKeys");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      getWFSpotlightSyncLogObject();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v35 = "-[WFContextualActionSpotlightSyncService queue_v2GetAppShortcutContextualActionsForBundleIdentifiers:completionHandler:]";
        v19 = "%s Indexing app shortcuts for all apps";
        v20 = v18;
        v21 = 12;
        goto LABEL_12;
      }
    }

    v22 = (void *)objc_opt_new();
    v23 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __120__WFContextualActionSpotlightSyncService_queue_v2GetAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_234;
    v28[3] = &unk_1E7AA7A10;
    v28[4] = self;
    v29 = v13;
    v25[0] = v23;
    v25[1] = 3221225472;
    v25[2] = __120__WFContextualActionSpotlightSyncService_queue_v2GetAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_3;
    v25[3] = &unk_1E7AA7980;
    v25[4] = self;
    v26 = v22;
    v27 = v7;
    v24 = v22;
    objc_msgSend(v17, "if_flatMapAsynchronously:completionHandler:", v28, v25);

    goto LABEL_14;
  }
  getWFSpotlightSyncLogObject();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v35 = "-[WFContextualActionSpotlightSyncService queue_v2GetAppShortcutContextualActionsForBundleIdentifiers:completionHandler:]";
    v36 = 2112;
    v37 = v14;
    _os_log_impl(&dword_1C146A000, v15, OS_LOG_TYPE_ERROR, "%s Failed to get App Shortcuts: %@", buf, 0x16u);
  }

  -[WFContextualActionSpotlightSyncService queue](self, "queue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __120__WFContextualActionSpotlightSyncService_queue_v2GetAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke;
  block[3] = &unk_1E7AA77A8;
  v32 = v7;
  v31 = v14;
  dispatch_async(v16, block);

  v17 = v32;
LABEL_14:

}

- (VCDaemonDatabaseProvider)databaseProvider
{
  return self->_databaseProvider;
}

uint64_t __98__WFContextualActionSpotlightSyncService_indexAppShortcutsForBundleIdentifiers_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0DC79C0], "spotlightDomainIdentifierForBundleIdentifier:", a2);
}

void __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke(uint64_t a1)
{
  os_activity_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  os_activity_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;

  v2 = _os_activity_create(&dword_1C146A000, "spotlight indexing", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v3 = (void *)os_transaction_create();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_2;
  v9[3] = &unk_1E7AA7678;
  v15 = *(_QWORD *)(a1 + 56);
  v5 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v10 = v2;
  v11 = v5;
  v12 = v4;
  v6 = *(id *)(a1 + 48);
  v13 = v3;
  v14 = v6;
  v7 = v3;
  v8 = v2;
  objc_msgSend(v5, "queue_wipeIndexIfNotMigratedToNewDomainIdentifiersWithCompletionHandler:", v9);

}

- (void)queue_wipeIndexIfNotMigratedToNewDomainIdentifiersWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  void (**v10)(id, _QWORD);
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "workflowUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", *MEMORY[0x1E0DDA048]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v4[2](v4, 0);
  }
  else
  {
    getWFSpotlightSyncLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[WFContextualActionSpotlightSyncService queue_wipeIndexIfNotMigratedToNewDomainIdentifiersWithCompletionHandler:]";
      _os_log_impl(&dword_1C146A000, v7, OS_LOG_TYPE_DEFAULT, "%s Device is using old domain identifiers for contextual actions. Wiping the index.", buf, 0xCu);
    }

    -[WFContextualActionSpotlightSyncService index](self, "index");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __114__WFContextualActionSpotlightSyncService_queue_wipeIndexIfNotMigratedToNewDomainIdentifiersWithCompletionHandler___block_invoke;
    v9[3] = &unk_1E7AA7A38;
    v9[4] = self;
    v10 = v4;
    objc_msgSend(v8, "deleteAllSearchableItemsWithCompletionHandler:", v9);

  }
}

void __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  NSObject *v34;
  id v35;
  _QWORD v36[5];
  _QWORD v37[4];
  NSObject *v38;
  id v39;
  _QWORD v40[4];
  NSObject *v41;
  id v42;
  _QWORD v43[5];
  _QWORD v44[4];
  NSObject *v45;
  id v46;
  _QWORD v47[5];
  _QWORD v48[4];
  NSObject *v49;
  id v50;
  _QWORD v51[5];
  _QWORD v52[4];
  NSObject *v53;
  id v54;
  _QWORD v55[5];
  os_activity_scope_state_s state;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint8_t buf[4];
  const char *v63;
  __int16 v64;
  id v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  if (v3)
  {
    getWFSpotlightSyncLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v63 = "-[WFContextualActionSpotlightSyncService reindexSearchableItems:appShortcutBundleIdentifiers:completion:]_block_invoke_2";
      v64 = 2112;
      v65 = v3;
      _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_ERROR, "%s Error wiping Spotlight index. Not going to continue indexing new ones in, we'll try again later: %@", buf, 0x16u);
    }
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 5);
    v6 = dispatch_group_create();
    v4 = v6;
    v7 = *(_QWORD *)(a1 + 72);
    v8 = MEMORY[0x1E0C809B0];
    if ((v7 & 1) != 0)
    {
      dispatch_group_enter(v6);
      v9 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0DC7A48], "spotlightDomainIdentifierForBundleIdentifier:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = v8;
      v55[1] = 3221225472;
      v55[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_146;
      v55[3] = &unk_1E7AA74E0;
      v55[4] = *(_QWORD *)(a1 + 40);
      v52[0] = v8;
      v52[1] = 3221225472;
      v52[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_2_148;
      v52[3] = &unk_1E7AA7508;
      v53 = v4;
      v54 = v5;
      objc_msgSend(v9, "queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName:identifiers:batchSize:fetcher:completionBlock:", CFSTR("static"), v11, -1, v55, v52);

      v7 = *(_QWORD *)(a1 + 72);
    }
    if ((v7 & 2) != 0)
    {
      dispatch_group_enter(v4);
      v12 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0DC7DD8], "spotlightDomainIdentifierForBundleIdentifier:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = v8;
      v51[1] = 3221225472;
      v51[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_4;
      v51[3] = &unk_1E7AA74E0;
      v51[4] = *(_QWORD *)(a1 + 40);
      v48[0] = v8;
      v48[1] = 3221225472;
      v48[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_5;
      v48[3] = &unk_1E7AA7508;
      v49 = v4;
      v50 = v5;
      objc_msgSend(v12, "queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName:identifiers:batchSize:fetcher:completionBlock:", CFSTR("focus"), v14, -1, v51, v48);

      v7 = *(_QWORD *)(a1 + 72);
    }
    if ((v7 & 8) != 0)
    {
      dispatch_group_enter(v4);
      v15 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0DC7DE8], "spotlightDomainIdentifierForBundleIdentifier:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = v8;
      v47[1] = 3221225472;
      v47[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_7;
      v47[3] = &unk_1E7AA74E0;
      v47[4] = *(_QWORD *)(a1 + 40);
      v44[0] = v8;
      v44[1] = 3221225472;
      v44[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_8;
      v44[3] = &unk_1E7AA7508;
      v45 = v4;
      v46 = v5;
      objc_msgSend(v15, "queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName:identifiers:batchSize:fetcher:completionBlock:", CFSTR("settings toggles"), v17, -1, v47, v44);

      v7 = *(_QWORD *)(a1 + 72);
    }
    if ((v7 & 0x10) != 0)
    {
      dispatch_group_enter(v4);
      v18 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0DC7DD0], "spotlightDomainIdentifierForBundleIdentifier:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = v8;
      v43[1] = 3221225472;
      v43[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_10;
      v43[3] = &unk_1E7AA74E0;
      v43[4] = *(_QWORD *)(a1 + 40);
      v40[0] = v8;
      v40[1] = 3221225472;
      v40[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_11;
      v40[3] = &unk_1E7AA7508;
      v41 = v4;
      v42 = v5;
      objc_msgSend(v18, "queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName:identifiers:batchSize:fetcher:completionBlock:", CFSTR("alarm toggles"), v20, -1, v43, v40);

      v7 = *(_QWORD *)(a1 + 72);
    }
    if ((v7 & 4) != 0)
    {
      dispatch_group_enter(v4);
      v21 = *(void **)(a1 + 40);
      v22 = *(_QWORD *)(a1 + 48);
      v37[0] = v8;
      v37[1] = 3221225472;
      v37[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_13;
      v37[3] = &unk_1E7AA7508;
      v38 = v4;
      v39 = v5;
      objc_msgSend(v21, "indexAppShortcutsForBundleIdentifiers:completionHandler:", v22, v37);

      v7 = *(_QWORD *)(a1 + 72);
    }
    if ((v7 & 0x20) != 0)
    {
      dispatch_group_enter(v4);
      v23 = *(void **)(a1 + 40);
      +[WFAppEntityContextualAction spotlightDomainIdentifierForEntityType:](_TtC14VoiceShortcuts27WFAppEntityContextualAction, "spotlightDomainIdentifierForEntityType:", 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v8;
      v36[1] = 3221225472;
      v36[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_15;
      v36[3] = &unk_1E7AA74E0;
      v36[4] = *(_QWORD *)(a1 + 40);
      v33[0] = v8;
      v33[1] = 3221225472;
      v33[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_16;
      v33[3] = &unk_1E7AA7508;
      v34 = v4;
      v35 = v5;
      objc_msgSend(v23, "queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName:identifiers:batchSize:fetcher:completionBlock:", CFSTR("folder app entities"), v25, -1, v36, v33);

    }
    objc_msgSend(*(id *)(a1 + 40), "queue");
    v26 = objc_claimAutoreleasedReturnValue();
    v28[0] = v8;
    v28[1] = 3221225472;
    v28[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_18;
    v28[3] = &unk_1E7AA7558;
    v29 = *(id *)(a1 + 32);
    v30 = v5;
    v32 = *(id *)(a1 + 64);
    v31 = *(id *)(a1 + 56);
    v27 = v5;
    dispatch_group_notify(v4, v26, v28);

  }
  os_activity_scope_leave(&state);

}

- (void)indexAppShortcutsForBundleIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(v6, "if_map:", &__block_literal_global_207);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WFInstalledAppsEnumerator();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "if_map:", &__block_literal_global_209);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v11 = -[WFContextualActionSpotlightSyncService appShortcutBatchSize](self, "appShortcutBatchSize");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __98__WFContextualActionSpotlightSyncService_indexAppShortcutsForBundleIdentifiers_completionHandler___block_invoke_3;
  v13[3] = &unk_1E7AA7890;
  v13[4] = self;
  v14 = v6;
  v12 = v6;
  -[WFContextualActionSpotlightSyncService queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName:identifiers:batchSize:fetcher:completionBlock:](self, "queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName:identifiers:batchSize:fetcher:completionBlock:", CFSTR("app shortcuts"), v8, v11, v13, v7);

}

- (void)queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName:(id)a3 identifiers:(id)a4 batchSize:(unint64_t)a5 fetcher:(id)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  os_activity_t v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  WFContextualActionSpotlightSyncService *v25;
  os_activity_t v26;
  id v27;
  id v28;
  id v29;
  unint64_t v30;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  -[WFContextualActionSpotlightSyncService queue](self, "queue");
  v16 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v16);

  v17 = _os_activity_create(&dword_1C146A000, "contextual actions indexing stage", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __146__WFContextualActionSpotlightSyncService_queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName_identifiers_batchSize_fetcher_completionBlock___block_invoke;
  block[3] = &unk_1E7AA7740;
  v24 = v12;
  v25 = self;
  v28 = v14;
  v29 = v15;
  v26 = v17;
  v27 = v13;
  v30 = a5;
  v18 = v13;
  v19 = v15;
  v20 = v17;
  v21 = v14;
  v22 = v12;
  os_activity_apply(v20, block);

}

- (unint64_t)appShortcutBatchSize
{
  return -1;
}

- (void)receiveAutoShortcutsUpdatedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFSpotlightSyncLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "-[WFContextualActionSpotlightSyncService receiveAutoShortcutsUpdatedNotification:]";
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_INFO, "%s App Shortcuts updated, triggering re-index", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D44048]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFContextualActionSpotlightSyncService reindexSearchableItems:appShortcutBundleIdentifiers:completion:](self, "reindexSearchableItems:appShortcutBundleIdentifiers:completion:", 4, v7, 0);
}

- (void)reindexSearchableItems:(unint64_t)a3 appShortcutBundleIdentifiers:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a4;
  v9 = a5;
  -[WFContextualActionSpotlightSyncService queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke;
  v13[3] = &unk_1E7AA7580;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (WFContextualActionSpotlightSyncService)initWithEventHandler:(id)a3 databaseProvider:(id)a4
{
  id v7;
  id v8;
  WFContextualActionSpotlightSyncService *v9;
  WFContextualActionSpotlightSyncService *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  id v15;
  uint64_t v16;
  CSSearchableIndex *index;
  WFContextualActionSpotlightSyncService *v18;
  objc_super v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CA6B38], "isIndexingAvailable") & 1) != 0)
  {
    v20.receiver = self;
    v20.super_class = (Class)WFContextualActionSpotlightSyncService;
    v9 = -[WFContextualActionSpotlightSyncService init](&v20, sel_init);
    if (!v9)
    {
      v18 = 0;
      goto LABEL_8;
    }
    v10 = v9;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_UTILITY, 0);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = dispatch_queue_create("com.apple.VoiceShortcuts.WFContextualActionSpotlightSyncService", v12);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v10->_eventHandler, a3);
    objc_storeStrong((id *)&v10->_databaseProvider, a4);
    v15 = objc_alloc(MEMORY[0x1E0CA6B38]);
    v16 = objc_msgSend(v15, "initWithName:bundleIdentifier:", CFSTR("voiceshortcuts-contextualaction-spotlight-index-name"), *MEMORY[0x1E0DC7FD8]);
    index = v10->_index;
    v10->_index = (CSSearchableIndex *)v16;

    -[CSSearchableIndex setIndexDelegate:](v10->_index, "setIndexDelegate:", v10);
    self = v10;
    v18 = self;
  }
  else
  {
    getWFSpotlightSyncLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[WFContextualActionSpotlightSyncService initWithEventHandler:databaseProvider:]";
      _os_log_impl(&dword_1C146A000, v12, OS_LOG_TYPE_DEBUG, "%s Spotlight indexing is not available.", buf, 0xCu);
    }
    v18 = 0;
  }

LABEL_8:
  return v18;
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  WFDatabaseResult *v12;
  WFDatabaseResult *folderDatabaseResult;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  objc_class *v20;
  MTAlarmDataSource *v21;
  MTAlarmDataSource *alarmDataSource;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_receiveAutoShortcutsUpdatedNotification_, *MEMORY[0x1E0D44040], 0);

  -[WFContextualActionSpotlightSyncService eventHandler](self, "eventHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:", self, sel_receiveAutoShortcutsUpdatedNotification_, CFSTR("LNAppShortcutsChangedNotification"));

  -[WFContextualActionSpotlightSyncService eventHandler](self, "eventHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:", self, sel_applicationWasRegistered_, CFSTR("ApplicationRegistered"));

  -[WFContextualActionSpotlightSyncService eventHandler](self, "eventHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:", self, sel_migrateAppShortcutsAndReindexAllItemsIfNeeded, CFSTR("com.apple.mobile.keybagd.first_unlock"));

  -[WFContextualActionSpotlightSyncService eventHandler](self, "eventHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:", self, sel_systemLanguageUpdated, CFSTR("com.apple.language.changed"));

  -[WFContextualActionSpotlightSyncService eventHandler](self, "eventHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:", self, sel_spotlightPreferencesChanged, CFSTR("com.apple.spotlightui.prefschanged"));

  -[WFContextualActionSpotlightSyncService eventHandler](self, "eventHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:", self, sel_cellularSettingsUpdated, CFSTR("com.apple.commcenter.DataSettingsChangedNotification"));

  -[WFContextualActionSpotlightSyncService databaseProvider](self, "databaseProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "databaseWithError:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "sortedVisibleFolders");
    v12 = (WFDatabaseResult *)objc_claimAutoreleasedReturnValue();
    folderDatabaseResult = self->_folderDatabaseResult;
    self->_folderDatabaseResult = v12;

    -[WFContextualActionSpotlightSyncService folderDatabaseResult](self, "folderDatabaseResult");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "registerObserver:", self);

  }
  objc_msgSend(getFCActivityManagerClass(), "sharedActivityManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObserver:", self);

  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v16 = (void *)getMTAlarmManagerClass_softClass;
  v32 = getMTAlarmManagerClass_softClass;
  if (!getMTAlarmManagerClass_softClass)
  {
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __getMTAlarmManagerClass_block_invoke;
    v27 = &unk_1E7AA8030;
    v28 = &v29;
    __getMTAlarmManagerClass_block_invoke((uint64_t)&v24);
    v16 = (void *)v30[3];
  }
  v17 = objc_retainAutorelease(v16);
  _Block_object_dispose(&v29, 8);
  v18 = (void *)objc_opt_new();
  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v19 = (void *)getMTAlarmDataSourceClass_softClass;
  v32 = getMTAlarmDataSourceClass_softClass;
  if (!getMTAlarmDataSourceClass_softClass)
  {
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __getMTAlarmDataSourceClass_block_invoke;
    v27 = &unk_1E7AA8030;
    v28 = &v29;
    __getMTAlarmDataSourceClass_block_invoke((uint64_t)&v24);
    v19 = (void *)v30[3];
  }
  v20 = objc_retainAutorelease(v19);
  _Block_object_dispose(&v29, 8);
  v21 = (MTAlarmDataSource *)objc_msgSend([v20 alloc], "initWithAlarmManager:", v18);
  alarmDataSource = self->_alarmDataSource;
  self->_alarmDataSource = v21;

  -[MTAlarmDataSource registerObserver:](self->_alarmDataSource, "registerObserver:", self);
  v23 = (id)-[MTAlarmDataSource reloadAlarms](self->_alarmDataSource, "reloadAlarms");
  -[WFContextualActionSpotlightSyncService migrateAppShortcutsAndReindexAllItemsIfNeeded](self, "migrateAppShortcutsAndReindexAllItemsIfNeeded");

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D44040], 0);

  objc_msgSend(getFCActivityManagerClass(), "sharedActivityManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[WFContextualActionSpotlightSyncService alarmDataSource](self, "alarmDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFContextualActionSpotlightSyncService alarmDataSource](self, "alarmDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unregisterObserver:", self);

  }
  v7.receiver = self;
  v7.super_class = (Class)WFContextualActionSpotlightSyncService;
  -[WFContextualActionSpotlightSyncService dealloc](&v7, sel_dealloc);
}

- (void)migrateAppShortcutsAndReindexAllItemsIfNeeded
{
  BOOL v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  void *v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = +[WFContextualActionSpotlightSyncService didCompleteAppShortcutDomainMigration](WFContextualActionSpotlightSyncService, "didCompleteAppShortcutDomainMigration");
  getWFSpotlightSyncLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[WFContextualActionSpotlightSyncService migrateAppShortcutsAndReindexAllItemsIfNeeded]";
      _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_DEFAULT, "%s App Shortcuts domain don't need migration, skipping", buf, 0xCu);
    }

    -[WFContextualActionSpotlightSyncService reindexAllSearchableItemsIfNeeded:](self, "reindexAllSearchableItemsIfNeeded:", 0);
  }
  else
  {
    if (v5)
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[WFContextualActionSpotlightSyncService migrateAppShortcutsAndReindexAllItemsIfNeeded]";
      _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_DEFAULT, "%s App Shortcuts need migration, wiping existing App Shortcuts", buf, 0xCu);
    }

    -[WFContextualActionSpotlightSyncService index](self, "index");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC79C0], "legacySpotlightDomainIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __87__WFContextualActionSpotlightSyncService_migrateAppShortcutsAndReindexAllItemsIfNeeded__block_invoke;
    v9[3] = &unk_1E7AA7478;
    v9[4] = self;
    objc_msgSend(v6, "deleteSearchableItemsWithDomainIdentifiers:completionHandler:", v8, v9);

  }
}

- (void)reindexAllSearchableItemsIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;
  NSObject *v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v5 = +[WFContextualActionSpotlightSyncService contextualActionsIndexVersion](WFContextualActionSpotlightSyncService, "contextualActionsIndexVersion");
  getWFSpotlightSyncLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315650;
    v11 = "-[WFContextualActionSpotlightSyncService reindexAllSearchableItemsIfNeeded:]";
    v12 = 2050;
    v13 = v5;
    v14 = 2048;
    v15 = 29;
    _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_DEFAULT, "%s Checking if contextual actions index needs to be updated. Index version is: %{public}ld, needed index version is: %ld", (uint8_t *)&v10, 0x20u);
  }

  getWFSpotlightSyncLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5 != 29 || v3)
  {
    if (v3)
    {
      if (v8)
      {
        v10 = 136315138;
        v11 = "-[WFContextualActionSpotlightSyncService reindexAllSearchableItemsIfNeeded:]";
        v9 = "%s Forcing re-index";
LABEL_13:
        _os_log_impl(&dword_1C146A000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v10, 0xCu);
      }
    }
    else if (v8)
    {
      v10 = 136315138;
      v11 = "-[WFContextualActionSpotlightSyncService reindexAllSearchableItemsIfNeeded:]";
      v9 = "%s Current index version is lower than the needed index version. Beginning re-index";
      goto LABEL_13;
    }

    -[WFContextualActionSpotlightSyncService reindexAllSearchableItemsWithCompletion:](self, "reindexAllSearchableItemsWithCompletion:", &__block_literal_global_5690);
    return;
  }
  if (v8)
  {
    v10 = 136315138;
    v11 = "-[WFContextualActionSpotlightSyncService reindexAllSearchableItemsIfNeeded:]";
    _os_log_impl(&dword_1C146A000, v7, OS_LOG_TYPE_DEFAULT, "%s Contextual actions index doesn't need to be updated", (uint8_t *)&v10, 0xCu);
  }

}

- (void)reindexAllSearchableItemsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFSpotlightSyncLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[WFContextualActionSpotlightSyncService reindexAllSearchableItemsWithCompletion:]";
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_DEFAULT, "%s Triggering full wipe and reindex of all items", buf, 0xCu);
  }

  -[WFContextualActionSpotlightSyncService index](self, "index");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__WFContextualActionSpotlightSyncService_reindexAllSearchableItemsWithCompletion___block_invoke;
  v8[3] = &unk_1E7AA7A38;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "deleteAllSearchableItemsWithCompletionHandler:", v8);

}

- (void)reindexSearchableItems:(unint64_t)a3
{
  -[WFContextualActionSpotlightSyncService reindexSearchableItems:appShortcutBundleIdentifiers:completion:](self, "reindexSearchableItems:appShortcutBundleIdentifiers:completion:", a3, 0, 0);
}

- (void)queue_getStaticContextualActionsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  -[WFContextualActionSpotlightSyncService queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  WFStaticContextualActionDefinitionsForSurface();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContextualActionSpotlightSyncService queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __96__WFContextualActionSpotlightSyncService_queue_getStaticContextualActionsWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E7AA77A8;
  v11 = v6;
  v12 = v4;
  v8 = v6;
  v9 = v4;
  dispatch_async(v7, v10);

}

- (void)queue_getToggleSettingContextualActionsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFContextualActionSpotlightSyncService queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  WFToggleAccessibilityContextualActions();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v7;
  WFToggleSettingContextualActions();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __WFToggleContextualActions_block_invoke;
  v18[3] = &unk_1E7AA7AD8;
  v11 = v6;
  v19 = v11;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v18);

  -[WFContextualActionSpotlightSyncService queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __103__WFContextualActionSpotlightSyncService_queue_getToggleSettingContextualActionsWithCompletionHandler___block_invoke;
  v15[3] = &unk_1E7AA77A8;
  v16 = v11;
  v17 = v4;
  v13 = v11;
  v14 = v4;
  dispatch_async(v12, v15);

}

- (void)queue_getFocusModeContextualActionsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFContextualActionSpotlightSyncService queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(getFCActivityManagerClass(), "sharedActivityManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "availableActivities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v14, "activityIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v15);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v11);
  }

  v16 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v16, "allValues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "if_compactMap:", &__block_literal_global_201);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContextualActionSpotlightSyncService queue](self, "queue");
  v19 = objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __99__WFContextualActionSpotlightSyncService_queue_getFocusModeContextualActionsWithCompletionHandler___block_invoke_2;
  v22[3] = &unk_1E7AA77A8;
  v23 = v18;
  v24 = v4;
  v20 = v18;
  v21 = v4;
  dispatch_async(v19, v22);

}

- (void)queue_getAlarmContextualActionsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WFContextualActionSpotlightSyncService queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __95__WFContextualActionSpotlightSyncService_queue_getAlarmContextualActionsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E7AA77A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

- (void)queue_getFolderAppEntityContextualActionsWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  id v7;

  v4 = (void (**)(id, void *, _QWORD))a3;
  -[WFContextualActionSpotlightSyncService folderDatabaseResult](self, "folderDatabaseResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptors");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_map:", &__block_literal_global_205);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v6, 0);

}

- (void)queue_getAppShortcutContextualActionsForBundleIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  _QWORD block[4];
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[WFContextualActionSpotlightSyncService queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  WFInstalledAppsEnumerator();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "count"))
  {
    -[WFContextualActionSpotlightSyncService databaseProvider](self, "databaseProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(v13, "databaseWithError:", &v28);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v28;

    getWFSpotlightSyncLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v14)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v32 = "-[WFContextualActionSpotlightSyncService queue_getAppShortcutContextualActionsForBundleIdentifiers:completionHandler:]";
        _os_log_impl(&dword_1C146A000, v17, OS_LOG_TYPE_INFO, "%s Fetching app shortcuts for apps...", buf, 0xCu);
      }

      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D44140]), "initWithOptions:", 2);
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_215;
      v21[3] = &unk_1E7AA79A8;
      v21[4] = self;
      v24 = v7;
      v22 = v6;
      v23 = v14;
      objc_msgSend(v18, "autoShortcutsForLocaleIdentifier:completion:", v10, v21);

    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v32 = "-[WFContextualActionSpotlightSyncService queue_getAppShortcutContextualActionsForBundleIdentifiers:completionHandler:]";
        v33 = 2112;
        v34 = v15;
        _os_log_impl(&dword_1C146A000, v17, OS_LOG_TYPE_ERROR, "%s Failed to access the Shortcuts database, can't check whether app shortcuts should or should not be in Spotlight: %@", buf, 0x16u);
      }

      -[WFContextualActionSpotlightSyncService queue](self, "queue");
      v20 = objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_213;
      v25[3] = &unk_1E7AA77A8;
      v27 = v7;
      v26 = v15;
      dispatch_async(v20, v25);

      v18 = v27;
    }

  }
  else
  {
    -[WFContextualActionSpotlightSyncService queue](self, "queue");
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke;
    block[3] = &unk_1E7AA78B8;
    v30 = v7;
    dispatch_async(v19, block);

    v15 = v30;
  }

}

- (void)availableActivitiesDidChangeForManager:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  getWFSpotlightSyncLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "-[WFContextualActionSpotlightSyncService availableActivitiesDidChangeForManager:]";
    _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_INFO, "%s Available focus modes changes, triggering re-index", (uint8_t *)&v5, 0xCu);
  }

  -[WFContextualActionSpotlightSyncService reindexSearchableItems:](self, "reindexSearchableItems:", 2);
}

- (void)databaseResultDidChange:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  getWFSpotlightSyncLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[WFContextualActionSpotlightSyncService databaseResultDidChange:]";
    _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_DEFAULT, "%s Collections changed, triggering resync of folder entities", (uint8_t *)&v5, 0xCu);
  }

  -[WFContextualActionSpotlightSyncService reindexSearchableItems:](self, "reindexSearchableItems:", 32);
}

- (void)applicationWasRegistered:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  NSObject *v15;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isPlaceholder"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  v9 = objc_msgSend(v8, "BOOLValue");
  if ((v9 & 1) == 0)
  {
    objc_msgSend(v4, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("bundleIDs"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_opt_class();
      v12 = (objc_opt_isKindOfClass() & 1) != 0 ? v11 : 0;
    }
    else
    {
      v12 = 0;
    }
    v13 = v12;

    v14 = objc_msgSend(v13, "containsObject:", *MEMORY[0x1E0DC7FD8]);
    if (v14)
    {
      getWFSpotlightSyncLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 136315138;
        v17 = "-[WFContextualActionSpotlightSyncService applicationWasRegistered:]";
        _os_log_impl(&dword_1C146A000, v15, OS_LOG_TYPE_DEFAULT, "%s Shortcuts app installed, triggering force sync", (uint8_t *)&v16, 0xCu);
      }

      -[WFContextualActionSpotlightSyncService reindexAllSearchableItemsIfNeeded:](self, "reindexAllSearchableItemsIfNeeded:", 1);
    }
  }

}

- (void)dataSourceDidReload:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  getWFSpotlightSyncLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "-[WFContextualActionSpotlightSyncService dataSourceDidReload:]";
    _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_INFO, "%s Alarm data source reloaded, triggering re-index", (uint8_t *)&v5, 0xCu);
  }

  -[WFContextualActionSpotlightSyncService reindexSearchableItems:](self, "reindexSearchableItems:", 16);
}

- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  getWFSpotlightSyncLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[WFContextualActionSpotlightSyncService searchableIndex:reindexAllSearchableItemsWithAcknowledgementHandler:]";
    _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_INFO, "%s CSSearchableIndex requested full reindex", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __110__WFContextualActionSpotlightSyncService_searchableIndex_reindexAllSearchableItemsWithAcknowledgementHandler___block_invoke;
  v8[3] = &unk_1E7AA7A60;
  v9 = v5;
  v7 = v5;
  -[WFContextualActionSpotlightSyncService reindexAllSearchableItemsWithCompletion:](self, "reindexAllSearchableItemsWithCompletion:", v8);

}

- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  getWFSpotlightSyncLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[WFContextualActionSpotlightSyncService searchableIndex:reindexSearchableItemsWithIdentifiers:acknowledgementHandler:]";
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_1C146A000, v9, OS_LOG_TYPE_INFO, "%s CSSearchableIndex requested index of items: %@", buf, 0x16u);
  }

  getWFSpotlightSyncLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[WFContextualActionSpotlightSyncService searchableIndex:reindexSearchableItemsWithIdentifiers:acknowledgementHandler:]";
    _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_INFO, "%s Sync service doesn't support reindexing individual items, triggering full reindex", buf, 0xCu);
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __119__WFContextualActionSpotlightSyncService_searchableIndex_reindexSearchableItemsWithIdentifiers_acknowledgementHandler___block_invoke;
  v12[3] = &unk_1E7AA7A60;
  v13 = v8;
  v11 = v8;
  -[WFContextualActionSpotlightSyncService reindexAllSearchableItemsWithCompletion:](self, "reindexAllSearchableItemsWithCompletion:", v12);

}

- (void)systemLanguageUpdated
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  getWFSpotlightSyncLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[WFContextualActionSpotlightSyncService systemLanguageUpdated]";
    _os_log_impl(&dword_1C146A000, v3, OS_LOG_TYPE_INFO, "%s System language updated, triggering full reindex", (uint8_t *)&v4, 0xCu);
  }

  -[WFContextualActionSpotlightSyncService reindexAllSearchableItemsWithCompletion:](self, "reindexAllSearchableItemsWithCompletion:", &__block_literal_global_247);
}

- (void)cellularSettingsUpdated
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  getWFSpotlightSyncLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[WFContextualActionSpotlightSyncService cellularSettingsUpdated]";
    _os_log_impl(&dword_1C146A000, v3, OS_LOG_TYPE_INFO, "%s Cellular settings updated, triggering toggle sync", (uint8_t *)&v4, 0xCu);
  }

  -[WFContextualActionSpotlightSyncService reindexSearchableItems:](self, "reindexSearchableItems:", 8);
}

- (void)spotlightPreferencesChanged
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  getWFSpotlightSyncLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[WFContextualActionSpotlightSyncService spotlightPreferencesChanged]";
    _os_log_impl(&dword_1C146A000, v3, OS_LOG_TYPE_INFO, "%s Spotlight preferences updated, triggering App Shortcut sync", (uint8_t *)&v4, 0xCu);
  }

  -[WFContextualActionSpotlightSyncService reindexSearchableItems:](self, "reindexSearchableItems:", 4);
}

- (void)setDatabaseProvider:(id)a3
{
  objc_storeStrong((id *)&self->_databaseProvider, a3);
}

- (OS_os_activity)activity
{
  return self->_activity;
}

- (SwiftVCDaemonXPCEventHandler)eventHandler
{
  return self->_eventHandler;
}

- (BPSSink)focusModeSink
{
  return self->_focusModeSink;
}

- (CSSearchableIndex)index
{
  return self->_index;
}

- (MTAlarmDataSource)alarmDataSource
{
  return self->_alarmDataSource;
}

- (void)setAlarmDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_alarmDataSource, a3);
}

- (WFDatabaseResult)folderDatabaseResult
{
  return self->_folderDatabaseResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderDatabaseResult, 0);
  objc_storeStrong((id *)&self->_alarmDataSource, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_focusModeSink, 0);
  objc_storeStrong((id *)&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
}

uint64_t __119__WFContextualActionSpotlightSyncService_searchableIndex_reindexSearchableItemsWithIdentifiers_acknowledgementHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __110__WFContextualActionSpotlightSyncService_searchableIndex_reindexAllSearchableItemsWithAcknowledgementHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __114__WFContextualActionSpotlightSyncService_queue_wipeIndexIfNotMigratedToNewDomainIdentifiersWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __114__WFContextualActionSpotlightSyncService_queue_wipeIndexIfNotMigratedToNewDomainIdentifiersWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E7AA77A8;
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t __114__WFContextualActionSpotlightSyncService_queue_wipeIndexIfNotMigratedToNewDomainIdentifiersWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  getWFSpotlightSyncLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[WFContextualActionSpotlightSyncService queue_wipeIndexIfNotMigratedToNewDomainIdentifiersWithCompletionHandle"
         "r:]_block_invoke_2";
    _os_log_impl(&dword_1C146A000, v3, OS_LOG_TYPE_DEFAULT, "%s Wiped index!", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99EA0], "workflowUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0DDA048]);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __120__WFContextualActionSpotlightSyncService_queue_v2GetAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __120__WFContextualActionSpotlightSyncService_queue_v2GetAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_234(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  char v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD block[4];
  void (**v15)(id, void *, _QWORD);
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  +[WFSpotlightSettingsClient shared](WFSpotlightSettingsClient, "shared");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isSpotlightEnabledForBundleIdentifier:", v6);

  if ((v9 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "if_map:", &__block_literal_global_238);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v11, 0);

  }
  else
  {
    getWFSpotlightSyncLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[WFContextualActionSpotlightSyncService queue_v2GetAppShortcutContextualActionsForBundleIdentifiers:complet"
            "ionHandler:]_block_invoke";
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_1C146A000, v12, OS_LOG_TYPE_INFO, "%s App shortcuts are disabled for Spotlight for %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "queue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __120__WFContextualActionSpotlightSyncService_queue_v2GetAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_236;
    block[3] = &unk_1E7AA78B8;
    v15 = v7;
    dispatch_async(v13, block);

  }
}

void __120__WFContextualActionSpotlightSyncService_queue_v2GetAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_3(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    if (objc_msgSend(a1[5], "count"))
    {
      getWFSpotlightSyncLogObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        v8 = a1[5];
        *(_DWORD *)buf = 136315394;
        v29 = "-[WFContextualActionSpotlightSyncService queue_v2GetAppShortcutContextualActionsForBundleIdentifiers:compl"
              "etionHandler:]_block_invoke_2";
        v30 = 2112;
        v31 = (uint64_t)v8;
        _os_log_impl(&dword_1C146A000, v7, OS_LOG_TYPE_FAULT, "%s Looks like we've skipped indexing app shortcuts from app %@ into the index, check the logs for more information", buf, 0x16u);
      }

    }
    getWFSpotlightSyncLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = objc_msgSend(v5, "count");
      *(_DWORD *)buf = 136315650;
      v29 = "-[WFContextualActionSpotlightSyncService queue_v2GetAppShortcutContextualActionsForBundleIdentifiers:complet"
            "ionHandler:]_block_invoke";
      v30 = 2048;
      v31 = v10;
      v32 = 2112;
      v33 = v5;
      _os_log_impl(&dword_1C146A000, v9, OS_LOG_TYPE_INFO, "%s %lu app shortcuts found...: %@", buf, 0x20u);
    }

    objc_msgSend(MEMORY[0x1E0DC79C0], "autoShortcutContextualActionsByQueryingEligibilityForProminentDisplay:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    getWFSpotlightSyncLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = objc_msgSend(v11, "count");
      *(_DWORD *)buf = 136315650;
      v29 = "-[WFContextualActionSpotlightSyncService queue_v2GetAppShortcutContextualActionsForBundleIdentifiers:complet"
            "ionHandler:]_block_invoke";
      v30 = 2048;
      v31 = v13;
      v32 = 2112;
      v33 = v11;
      _os_log_impl(&dword_1C146A000, v12, OS_LOG_TYPE_INFO, "%s Eligibility marked %lu app shortcut actions: %@", buf, 0x20u);
    }

    objc_msgSend(a1[4], "queue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __120__WFContextualActionSpotlightSyncService_queue_v2GetAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_241;
    block[3] = &unk_1E7AA8110;
    v15 = a1[6];
    v23 = v6;
    v24 = v15;
    v22 = v11;
    v16 = v6;
    v17 = v11;
    dispatch_async(v14, block);

  }
  else
  {
    getWFSpotlightSyncLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[WFContextualActionSpotlightSyncService queue_v2GetAppShortcutContextualActionsForBundleIdentifiers:complet"
            "ionHandler:]_block_invoke_3";
      v30 = 2112;
      v31 = (uint64_t)v6;
      _os_log_impl(&dword_1C146A000, v18, OS_LOG_TYPE_ERROR, "%s Error generating contextual actions from app shortcuts: %@", buf, 0x16u);
    }

    objc_msgSend(a1[4], "queue");
    v19 = objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __120__WFContextualActionSpotlightSyncService_queue_v2GetAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_239;
    v25[3] = &unk_1E7AA77A8;
    v20 = a1[6];
    v26 = v6;
    v27 = v20;
    v17 = v6;
    dispatch_async(v19, v25);

    v16 = v27;
  }

}

uint64_t __120__WFContextualActionSpotlightSyncService_queue_v2GetAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_239(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __120__WFContextualActionSpotlightSyncService_queue_v2GetAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_241(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __120__WFContextualActionSpotlightSyncService_queue_v2GetAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_236(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __120__WFContextualActionSpotlightSyncService_queue_v2GetAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  objc_class *v4;
  id v5;
  void *v6;

  v4 = (objc_class *)MEMORY[0x1E0DC79C0];
  v5 = a2;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithExecutableAppShortcut:index:", v5, a3);

  return v6;
}

uint64_t __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_213(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_215(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  _QWORD block[4];
  id v31;
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(void **)(a1 + 40);
    if (v7)
    {
      v8 = v7;
      getWFSpotlightSyncLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 136315394;
        v34 = "-[WFContextualActionSpotlightSyncService queue_getAppShortcutContextualActionsForBundleIdentifiers:complet"
              "ionHandler:]_block_invoke_2";
        v35 = 2112;
        v36 = v10;
        v11 = "%s Indexing app shortcuts for bundle identifiers: %@";
        v12 = v9;
        v13 = 22;
LABEL_10:
        _os_log_impl(&dword_1C146A000, v12, OS_LOG_TYPE_INFO, v11, buf, v13);
      }
    }
    else
    {
      objc_msgSend(v5, "allKeys");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      getWFSpotlightSyncLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v34 = "-[WFContextualActionSpotlightSyncService queue_getAppShortcutContextualActionsForBundleIdentifiers:complet"
              "ionHandler:]_block_invoke";
        v11 = "%s Indexing app shortcuts for all apps";
        v12 = v9;
        v13 = 12;
        goto LABEL_10;
      }
    }

    v16 = (void *)objc_opt_new();
    v17 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_218;
    v25[3] = &unk_1E7AA7958;
    v18 = *(id *)(a1 + 48);
    v19 = *(_QWORD *)(a1 + 32);
    v26 = v18;
    v27 = v19;
    v28 = v16;
    v29 = v5;
    v22[0] = v17;
    v22[1] = 3221225472;
    v22[2] = __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_229;
    v22[3] = &unk_1E7AA7980;
    v22[4] = *(_QWORD *)(a1 + 32);
    v20 = *(id *)(a1 + 56);
    v23 = v28;
    v24 = v20;
    v21 = v28;
    objc_msgSend(v8, "if_flatMapAsynchronously:completionHandler:", v25, v22);

    goto LABEL_12;
  }
  getWFSpotlightSyncLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v34 = "-[WFContextualActionSpotlightSyncService queue_getAppShortcutContextualActionsForBundleIdentifiers:completionH"
          "andler:]_block_invoke";
    v35 = 2112;
    v36 = v6;
    _os_log_impl(&dword_1C146A000, v14, OS_LOG_TYPE_ERROR, "%s Failed to get app shortcuts: %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_216;
  block[3] = &unk_1E7AA77A8;
  v32 = *(id *)(a1 + 56);
  v31 = v6;
  dispatch_async(v15, block);

  v8 = v32;
LABEL_12:

}

uint64_t __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_216(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_218(id *a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  char v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void **v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _BYTE *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD block[4];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  _BYTE buf[24];
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  v8 = a1[4];
  v38 = 0;
  v9 = objc_msgSend(v8, "isSpotlightEnabledForAutoShortcutsWithBundleIdentifier:error:", v6, &v38);
  v10 = v38;
  if (v10)
  {
    getWFSpotlightSyncLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[WFContextualActionSpotlightSyncService queue_getAppShortcutContextualActionsForBundleIdenti"
                           "fiers:completionHandler:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2112;
      v40 = v10;
      _os_log_impl(&dword_1C146A000, v11, OS_LOG_TYPE_ERROR, "%s Error retrieving the app shortcuts preference for Spotlight for %@: %@", buf, 0x20u);
    }

    objc_msgSend(a1[5], "queue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_219;
    block[3] = &unk_1E7AA7558;
    v34 = a1[6];
    v35 = v6;
    v37 = v7;
    v36 = v10;
    dispatch_async(v12, block);

    v13 = &v34;
LABEL_10:
    v14 = *v13;
    goto LABEL_11;
  }
  if ((v9 & 1) == 0)
  {
    getWFSpotlightSyncLogObject();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[WFContextualActionSpotlightSyncService queue_getAppShortcutContextualActionsForBundleIdenti"
                           "fiers:completionHandler:]_block_invoke_2";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v6;
      _os_log_impl(&dword_1C146A000, v19, OS_LOG_TYPE_INFO, "%s App shortcuts are disabled for Spotlight for %@", buf, 0x16u);
    }

    objc_msgSend(a1[5], "queue");
    v20 = objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_220;
    v30[3] = &unk_1E7AA77A8;
    v31 = 0;
    v32 = v7;
    dispatch_async(v20, v30);

    v13 = &v32;
    goto LABEL_10;
  }
  objc_msgSend(a1[7], "objectForKeyedSubscript:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v15 = MEMORY[0x1E0C809B0];
  v40 = 0;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_2;
  v25[3] = &unk_1E7AA78E0;
  v26 = a1[4];
  v27 = 0;
  v16 = a1[6];
  v28 = a1[5];
  v29 = v16;
  objc_msgSend(v14, "if_objectsPassingTest:", v25);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  v21[1] = 3221225472;
  v21[2] = __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_224;
  v21[3] = &unk_1E7AA7930;
  v22 = v6;
  v24 = buf;
  v23 = a1[4];
  objc_msgSend(v17, "if_flatMap:", v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v18, 0);
  _Block_object_dispose(buf, 8);
LABEL_11:

}

void __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_229(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    if (objc_msgSend(a1[5], "count"))
    {
      getWFSpotlightSyncLogObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        v8 = a1[5];
        *(_DWORD *)buf = 136315394;
        v29 = "-[WFContextualActionSpotlightSyncService queue_getAppShortcutContextualActionsForBundleIdentifiers:complet"
              "ionHandler:]_block_invoke_2";
        v30 = 2112;
        v31 = (uint64_t)v8;
        _os_log_impl(&dword_1C146A000, v7, OS_LOG_TYPE_FAULT, "%s Looks like we've skipped indexing app shortcuts from app %@ into the index, check the logs for more information", buf, 0x16u);
      }

    }
    getWFSpotlightSyncLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = objc_msgSend(v5, "count");
      *(_DWORD *)buf = 136315650;
      v29 = "-[WFContextualActionSpotlightSyncService queue_getAppShortcutContextualActionsForBundleIdentifiers:completio"
            "nHandler:]_block_invoke";
      v30 = 2048;
      v31 = v10;
      v32 = 2112;
      v33 = v5;
      _os_log_impl(&dword_1C146A000, v9, OS_LOG_TYPE_INFO, "%s %lu app shortcuts found...: %@", buf, 0x20u);
    }

    objc_msgSend(MEMORY[0x1E0DC79C0], "autoShortcutContextualActionsByQueryingEligibilityForProminentDisplay:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    getWFSpotlightSyncLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = objc_msgSend(v11, "count");
      *(_DWORD *)buf = 136315650;
      v29 = "-[WFContextualActionSpotlightSyncService queue_getAppShortcutContextualActionsForBundleIdentifiers:completio"
            "nHandler:]_block_invoke";
      v30 = 2048;
      v31 = v13;
      v32 = 2112;
      v33 = v11;
      _os_log_impl(&dword_1C146A000, v12, OS_LOG_TYPE_INFO, "%s Eligibility marked %lu app shortcut actions: %@", buf, 0x20u);
    }

    objc_msgSend(a1[4], "queue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_231;
    block[3] = &unk_1E7AA8110;
    v15 = a1[6];
    v23 = v6;
    v24 = v15;
    v22 = v11;
    v16 = v6;
    v17 = v11;
    dispatch_async(v14, block);

  }
  else
  {
    getWFSpotlightSyncLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[WFContextualActionSpotlightSyncService queue_getAppShortcutContextualActionsForBundleIdentifiers:completio"
            "nHandler:]_block_invoke";
      v30 = 2112;
      v31 = (uint64_t)v6;
      _os_log_impl(&dword_1C146A000, v18, OS_LOG_TYPE_ERROR, "%s Error generating contextual actions from app shortcuts: %@", buf, 0x16u);
    }

    objc_msgSend(a1[4], "queue");
    v19 = objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_230;
    v25[3] = &unk_1E7AA77A8;
    v20 = a1[6];
    v26 = v6;
    v27 = v20;
    v17 = v6;
    dispatch_async(v19, v25);

    v16 = v27;
  }

}

uint64_t __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_230(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_231(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_219(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

uint64_t __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_220(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), MEMORY[0x1E0C9AA60], *(_QWORD *)(a1 + 32));
}

uint64_t __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v16;
  _QWORD block[4];
  NSObject *v18;
  NSObject *v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  NSObject *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "attributionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    objc_msgSend(v3, "attributionBundleIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);
    v20 = 0;
    v8 = objc_msgSend(v7, "isSpotlightEnabledForAutoShortcutsWithBundleIdentifier:error:", v6, &v20);
    v9 = v20;
    if (v9)
    {
      getWFSpotlightSyncLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 136315650;
        v22 = "-[WFContextualActionSpotlightSyncService queue_getAppShortcutContextualActionsForBundleIdentifiers:complet"
              "ionHandler:]_block_invoke_2";
        v23 = 2112;
        v24 = v6;
        v25 = 2112;
        v26 = v11;
        _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_ERROR, "%s Error retrieving the app shortcuts preference for Spotlight for %@: %@", buf, 0x20u);
      }

      objc_msgSend(*(id *)(a1 + 48), "queue");
      v12 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_221;
      block[3] = &unk_1E7AA8138;
      v18 = *(id *)(a1 + 56);
      v19 = v6;
      dispatch_async(v12, block);

      v13 = v18;
LABEL_6:

      v14 = 0;
      goto LABEL_7;
    }
    if ((v8 & 1) == 0)
    {
      getWFSpotlightSyncLogObject();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "-[WFContextualActionSpotlightSyncService queue_getAppShortcutContextualActionsForBundleIdentifiers:complet"
              "ionHandler:]_block_invoke_2";
        v23 = 2112;
        v24 = v6;
        _os_log_impl(&dword_1C146A000, v13, OS_LOG_TYPE_INFO, "%s App shortcuts are disabled for Spotlight for %@", buf, 0x16u);
      }
      goto LABEL_6;
    }

  }
  if ((objc_msgSend(MEMORY[0x1E0DC79A8], "isAppShortcutDenyListed:inEnvironment:", v3, 2) & 1) != 0)
  {
    v14 = 0;
    goto LABEL_12;
  }
  getWFSpotlightSyncLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  v14 = 1;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "actionIdentifier");
    v16 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v22 = "-[WFContextualActionSpotlightSyncService queue_getAppShortcutContextualActionsForBundleIdentifiers:completionH"
          "andler:]_block_invoke";
    v23 = 2112;
    v24 = v16;
    _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_INFO, "%s App Shortcut action %@ is deny listed, skipping", buf, 0x16u);

  }
LABEL_7:

LABEL_12:
  return v14;
}

id __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_224(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0DC79C0], "allActionsForAutoShortcut:bundleIdentifier:startIndex:", a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_2_225;
  v9 = &unk_1E7AA7908;
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v3, "if_objectsPassingTest:", &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(v4, "count", v6, v7, v8, v9);
  return v4;
}

uint64_t __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_2_225(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "phrase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "signature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(*(id *)(a1 + 32), "isAutoShortcutDisabledForBundleIdentifier:autoShortcutIdentifier:", *(_QWORD *)(a1 + 40), v5);
  if (v6)
  {
    getWFSpotlightSyncLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "uniqueIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315394;
      v11 = "-[WFContextualActionSpotlightSyncService queue_getAppShortcutContextualActionsForBundleIdentifiers:completio"
            "nHandler:]_block_invoke_2";
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_1C146A000, v7, OS_LOG_TYPE_INFO, "%s App shortcut %@ is disabled", (uint8_t *)&v10, 0x16u);

    }
  }

  return v6 ^ 1u;
}

uint64_t __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_221(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
}

id __98__WFContextualActionSpotlightSyncService_indexAppShortcutsForBundleIdentifiers_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC79C0];
  objc_msgSend(a2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "spotlightDomainIdentifierForBundleIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

_TtC14VoiceShortcuts27WFAppEntityContextualAction *__105__WFContextualActionSpotlightSyncService_queue_getFolderAppEntityContextualActionsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _TtC14VoiceShortcuts27WFAppEntityContextualAction *v3;
  void *v4;
  void *v5;
  _TtC14VoiceShortcuts27WFAppEntityContextualAction *v6;

  v2 = a2;
  v3 = [_TtC14VoiceShortcuts27WFAppEntityContextualAction alloc];
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[WFAppEntityContextualAction initWithIdentifier:displayTitle:entityType:](v3, "initWithIdentifier:displayTitle:entityType:", v4, v5, 0);
  return v6;
}

void __95__WFContextualActionSpotlightSyncService_queue_getAlarmContextualActionsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD block[4];
  id v23;
  id v24;

  v1 = a1;
  objc_msgSend(*(id *)(a1 + 32), "alarmDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfAlarms");

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v3)
  {
    v5 = 0;
    do
    {
      objc_msgSend(*(id *)(v1 + 32), "alarmDataSource");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "alarmAtRow:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = v7;
      objc_msgSend(v7, "intentAlarm");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_alloc_init(MEMORY[0x1E0CBD9C0]);
      objc_msgSend(v21, "encodeObject:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_alloc(MEMORY[0x1E0DC7DD0]);
      objc_msgSend(v7, "alarmID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "UUIDString");
      v12 = v3;
      v13 = v1;
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "displayString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v10, "initWithAlarmIdentifier:alarmName:alarmData:operation:", v14, v15, v9, 2);

      v1 = v13;
      v3 = v12;

      objc_msgSend(v4, "addObject:", v16);
      ++v5;
    }
    while (v12 != v5);
  }
  objc_msgSend(*(id *)(v1 + 32), "queue");
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__WFContextualActionSpotlightSyncService_queue_getAlarmContextualActionsWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E7AA77A8;
  v18 = *(id *)(v1 + 40);
  v23 = v4;
  v24 = v18;
  v19 = v4;
  dispatch_async(v17, block);

}

uint64_t __95__WFContextualActionSpotlightSyncService_queue_getAlarmContextualActionsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __99__WFContextualActionSpotlightSyncService_queue_getFocusModeContextualActionsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

id __99__WFContextualActionSpotlightSyncService_queue_getFocusModeContextualActionsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;

  v2 = a2;
  if ((objc_msgSend(v2, "isPlaceholder") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v4 = v2;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "WFToggleFocusModeContextualActionFocusMode *WFToggleFocusModeContextualActionFocusModeFromFocusMode(__strong id<FCActivityDescribing>)");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("WFContextualActionSpotlightSyncService.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("focusMode"));

    }
    v5 = objc_alloc(MEMORY[0x1E0DC7DE0]);
    objc_msgSend(v4, "activityIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activityDisplayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activitySymbolImageName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activityColorName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v5, "initWithIdentifier:name:symbolName:colorName:", v6, v7, v8, v9);

    objc_msgSend(MEMORY[0x1E0DC7DD8], "toggle:", v10);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

uint64_t __103__WFContextualActionSpotlightSyncService_queue_getToggleSettingContextualActionsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __96__WFContextualActionSpotlightSyncService_queue_getStaticContextualActionsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __146__WFContextualActionSpotlightSyncService_queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName_identifiers_batchSize_fetcher_completionBlock___block_invoke_179(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 40), &state);
  if (v6)
  {
    getWFSpotlightSyncLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 136315650;
      v32 = "-[WFContextualActionSpotlightSyncService queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName:identifie"
            "rs:batchSize:fetcher:completionBlock:]_block_invoke";
      v33 = 2112;
      v34 = v9;
      v35 = 2112;
      v36 = v6;
      _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_ERROR, "%s Couldn't get %@ contextual actions, let's not touch existing indexed ones: %@", buf, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v10 = objc_msgSend(v5, "count");
    v11 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v5, "if_map:", &__block_literal_global_183);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0CA6B28];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __146__WFContextualActionSpotlightSyncService_queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName_identifiers_batchSize_fetcher_completionBlock___block_invoke_2_193;
    v21[3] = &unk_1E7AA76F0;
    v15 = *(_QWORD *)(a1 + 56);
    v27 = *(id *)(a1 + 64);
    v16 = *(id *)(a1 + 56);
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(a1 + 40);
    v22 = v16;
    v23 = v17;
    v24 = v18;
    v28 = v10;
    v25 = *(id *)(a1 + 48);
    v19 = v5;
    v20 = *(_QWORD *)(a1 + 72);
    v26 = v19;
    v29 = v20;
    objc_msgSend(v14, "performDiffOfIdentifiers:inDomains:withItemFetcher:completionBlock:", v13, v15, &__block_literal_global_186, v21);

  }
  os_activity_scope_leave(&state);

}

void __146__WFContextualActionSpotlightSyncService_queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName_identifiers_batchSize_fetcher_completionBlock___block_invoke_2_193(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  getWFSpotlightSyncLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "-[WFContextualActionSpotlightSyncService queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName:identifie"
            "rs:batchSize:fetcher:completionBlock:]_block_invoke_2";
      v32 = 2112;
      v33 = (uint64_t)v9;
      _os_log_impl(&dword_1C146A000, v11, OS_LOG_TYPE_ERROR, "%s Search query returned error: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(v8, "count");
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      v31 = "-[WFContextualActionSpotlightSyncService queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName:identifie"
            "rs:batchSize:fetcher:completionBlock:]_block_invoke";
      v32 = 2048;
      v33 = v12;
      v34 = 2112;
      v35 = v13;
      _os_log_impl(&dword_1C146A000, v11, OS_LOG_TYPE_DEFAULT, "%s Deleting %lu contextual actions from domains %@", buf, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 40), "index");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __146__WFContextualActionSpotlightSyncService_queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName_identifiers_batchSize_fetcher_completionBlock___block_invoke_194;
    v21[3] = &unk_1E7AA76C8;
    v16 = *(void **)(a1 + 48);
    v21[4] = *(_QWORD *)(a1 + 40);
    v22 = v16;
    v17 = *(id *)(a1 + 32);
    v18 = *(_QWORD *)(a1 + 80);
    v23 = v17;
    v28 = v18;
    v24 = *(id *)(a1 + 56);
    v27 = *(id *)(a1 + 72);
    v19 = *(id *)(a1 + 64);
    v20 = *(_QWORD *)(a1 + 88);
    v25 = v19;
    v29 = v20;
    v26 = v7;
    objc_msgSend(v14, "deleteSearchableItemsWithIdentifiers:completionHandler:", v15, v21);

  }
}

void __146__WFContextualActionSpotlightSyncService_queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName_identifiers_batchSize_fetcher_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (objc_class *)MEMORY[0x1E0CA6B30];
  v6 = a2;
  v7 = objc_alloc_init(v5);
  v20[0] = *MEMORY[0x1E0DC7FD8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBundleIDs:", v8);

  objc_msgSend(v7, "setFetchAttributes:", &unk_1E7ABF720);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B28]), "initWithQueryString:queryContext:", v6, v7);

  v10 = (void *)objc_opt_new();
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __146__WFContextualActionSpotlightSyncService_queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName_identifiers_batchSize_fetcher_completionBlock___block_invoke_3;
  v18[3] = &unk_1E7AA7628;
  v12 = v10;
  v19 = v12;
  objc_msgSend(v9, "setFoundItemsHandler:", v18);
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __146__WFContextualActionSpotlightSyncService_queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName_identifiers_batchSize_fetcher_completionBlock___block_invoke_192;
  v15[3] = &unk_1E7AA7A38;
  v16 = v12;
  v17 = v4;
  v13 = v12;
  v14 = v4;
  objc_msgSend(v9, "setCompletionHandler:", v15);
  objc_msgSend(v9, "start");

}

void __146__WFContextualActionSpotlightSyncService_queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName_identifiers_batchSize_fetcher_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  getWFSpotlightSyncLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[WFContextualActionSpotlightSyncService queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName:identifiers"
          ":batchSize:fetcher:completionBlock:]_block_invoke_3";
    v19 = 2048;
    v20 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_DEBUG, "%s Found %lu matching items in the index", buf, 0x16u);
  }

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "uniqueIdentifier", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

uint64_t __146__WFContextualActionSpotlightSyncService_queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName_identifiers_batchSize_fetcher_completionBlock___block_invoke_192(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

void __146__WFContextualActionSpotlightSyncService_queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName_identifiers_batchSize_fetcher_completionBlock___block_invoke_194(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __146__WFContextualActionSpotlightSyncService_queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName_identifiers_batchSize_fetcher_completionBlock___block_invoke_2_195;
  v12[3] = &unk_1E7AA76A0;
  v13 = *(id *)(a1 + 40);
  v14 = v3;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 88);
  v15 = v5;
  v21 = v6;
  v16 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 80);
  v8 = *(_QWORD *)(a1 + 32);
  v20 = v7;
  v17 = v8;
  v9 = *(id *)(a1 + 64);
  v10 = *(_QWORD *)(a1 + 96);
  v18 = v9;
  v22 = v10;
  v19 = *(id *)(a1 + 72);
  v11 = v3;
  dispatch_async(v4, v12);

}

void __146__WFContextualActionSpotlightSyncService_queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName_identifiers_batchSize_fetcher_completionBlock___block_invoke_2_195(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  int8x16_t v17;
  _QWORD v18[4];
  id v19;
  int8x16_t v20;
  id v21;
  id v22;
  uint64_t v23;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  if (*(_QWORD *)(a1 + 40))
  {
    getWFSpotlightSyncLogObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *(_QWORD *)(a1 + 96);
      v5 = *(_QWORD *)(a1 + 48);
      v4 = *(_QWORD *)(a1 + 56);
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136316162;
      v26 = "-[WFContextualActionSpotlightSyncService queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName:identifie"
            "rs:batchSize:fetcher:completionBlock:]_block_invoke_2";
      v27 = 2112;
      v28 = v5;
      v29 = 2048;
      v30 = v3;
      v31 = 2112;
      v32 = v4;
      v33 = 2112;
      v34 = v6;
      _os_log_impl(&dword_1C146A000, v2, OS_LOG_TYPE_ERROR, "%s Couldn't wipe domains %@ -- not indexing the fetched %lu %@ contextual actions, let's try again later: %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
  }
  else
  {
    getWFSpotlightSyncLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 48);
      v8 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 136315650;
      v26 = "-[WFContextualActionSpotlightSyncService queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName:identifie"
            "rs:batchSize:fetcher:completionBlock:]_block_invoke";
      v27 = 2112;
      v28 = v8;
      v29 = 2112;
      v30 = v9;
      _os_log_impl(&dword_1C146A000, v7, OS_LOG_TYPE_DEFAULT, "%s Deleted necessary %@ contextual actions from domains %@, indexing the new ones...", buf, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 64), "index");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 104);
    v12 = *(_QWORD *)(a1 + 72);
    v13 = *(_QWORD *)(a1 + 80);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __146__WFContextualActionSpotlightSyncService_queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName_identifiers_batchSize_fetcher_completionBlock___block_invoke_196;
    v18[3] = &unk_1E7AA7678;
    v14 = *(id *)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 96);
    v19 = v14;
    v23 = v15;
    v17 = *(int8x16_t *)(a1 + 56);
    v16 = (id)v17.i64[0];
    v20 = vextq_s8(v17, v17, 8uLL);
    v21 = *(id *)(a1 + 48);
    v22 = *(id *)(a1 + 88);
    objc_msgSend(v10, "indexSearchableItems:withBatchSize:updatedIdentifiers:completionBlock:", v12, v11, v13, v18);

  }
  os_activity_scope_leave(&state);
}

void __146__WFContextualActionSpotlightSyncService_queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName_identifiers_batchSize_fetcher_completionBlock___block_invoke_196(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  os_activity_scope_state_s state;

  v3 = a2;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  objc_msgSend(*(id *)(a1 + 40), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __146__WFContextualActionSpotlightSyncService_queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName_identifiers_batchSize_fetcher_completionBlock___block_invoke_2_197;
  block[3] = &unk_1E7AA7650;
  v5 = *(_QWORD *)(a1 + 72);
  v8 = v3;
  v12 = v5;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 64);
  v6 = v3;
  dispatch_async(v4, block);

  os_activity_scope_leave(&state);
}

uint64_t __146__WFContextualActionSpotlightSyncService_queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName_identifiers_batchSize_fetcher_completionBlock___block_invoke_2_197(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  getWFSpotlightSyncLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      v5 = a1[8];
      v7 = (void *)a1[5];
      v6 = (void *)a1[6];
      v8 = a1[4];
      v13 = 136316162;
      v14 = "-[WFContextualActionSpotlightSyncService queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName:identifie"
            "rs:batchSize:fetcher:completionBlock:]_block_invoke_2";
      v15 = 2048;
      v16 = v5;
      v17 = 2112;
      v18 = v7;
      v19 = 2112;
      v20 = v6;
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_FAULT, "%s Failed to index %lu %@ contextual actions from domains %@: %@", (uint8_t *)&v13, 0x34u);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v9 = a1[8];
    v10 = (void *)a1[5];
    objc_msgSend(v10, "capitalizedString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315906;
    v14 = "-[WFContextualActionSpotlightSyncService queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName:identifiers"
          ":batchSize:fetcher:completionBlock:]_block_invoke";
    v15 = 2048;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    v19 = 2112;
    v20 = v11;
    _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_DEFAULT, "%s Successfully indexed %lu %@ contextual actions. %@ contextual actions are in good shape!", (uint8_t *)&v13, 0x2Au);

  }
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

uint64_t __146__WFContextualActionSpotlightSyncService_queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName_identifiers_batchSize_fetcher_completionBlock___block_invoke_181(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

void __82__WFContextualActionSpotlightSyncService_reindexAllSearchableItemsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    getWFSpotlightSyncLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315394;
      v6 = "-[WFContextualActionSpotlightSyncService reindexAllSearchableItemsWithCompletion:]_block_invoke";
      v7 = 2112;
      v8 = v3;
      _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_ERROR, "%s Unable to wipe index: %@", (uint8_t *)&v5, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "reindexSearchableItems:appShortcutBundleIdentifiers:completion:", 63, 0, *(_QWORD *)(a1 + 40));
  }

}

uint64_t __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_146(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_getStaticContextualActionsWithCompletionHandler:", a2);
}

void __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_2_148(uint64_t a1, void *a2)
{
  id v3;
  void (**v4)(_QWORD);
  _QWORD aBlock[4];
  id v6;

  v3 = a2;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_3;
  aBlock[3] = &unk_1E7AA8300;
  v6 = *(id *)(a1 + 32);
  v4 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (v3)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v3, CFSTR("Static actions"));
  v4[2](v4);

}

uint64_t __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_getFocusModeContextualActionsWithCompletionHandler:", a2);
}

void __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void (**v4)(_QWORD);
  _QWORD aBlock[4];
  id v6;

  v3 = a2;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_6;
  aBlock[3] = &unk_1E7AA8300;
  v6 = *(id *)(a1 + 32);
  v4 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (v3)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v3, CFSTR("Focus actions"));
  v4[2](v4);

}

uint64_t __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_getToggleSettingContextualActionsWithCompletionHandler:", a2);
}

void __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  void (**v4)(_QWORD);
  _QWORD aBlock[4];
  id v6;

  v3 = a2;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_9;
  aBlock[3] = &unk_1E7AA8300;
  v6 = *(id *)(a1 + 32);
  v4 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (v3)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v3, CFSTR("Toggle settings actions"));
  v4[2](v4);

}

uint64_t __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_10(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_getAlarmContextualActionsWithCompletionHandler:", a2);
}

void __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  void (**v4)(_QWORD);
  _QWORD aBlock[4];
  id v6;

  v3 = a2;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_12;
  aBlock[3] = &unk_1E7AA8300;
  v6 = *(id *)(a1 + 32);
  v4 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (v3)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v3, CFSTR("Toggle alarm actions"));
  v4[2](v4);

}

void __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  void (**v4)(_QWORD);
  _QWORD aBlock[4];
  id v6;

  v3 = a2;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_14;
  aBlock[3] = &unk_1E7AA8300;
  v6 = *(id *)(a1 + 32);
  v4 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (v3)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v3, CFSTR("App shortcuts actions"));
  v4[2](v4);

}

uint64_t __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_15(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_getFolderAppEntityContextualActionsWithCompletionHandler:", a2);
}

void __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  void (**v4)(_QWORD);
  _QWORD aBlock[4];
  id v6;

  v3 = a2;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_17;
  aBlock[3] = &unk_1E7AA8300;
  v6 = *(id *)(a1 + 32);
  v4 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (v3)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v3, CFSTR("App Entities"));
  v4[2](v4);

}

void __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_18(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  v2 = objc_msgSend(*(id *)(a1 + 40), "count");
  objc_msgSend(*(id *)(a1 + 40), "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    getWFSpotlightSyncLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_2_177;
      v9[3] = &unk_1E7AA7530;
      v10 = *(id *)(a1 + 40);
      objc_msgSend(v3, "if_map:", v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v13 = "-[WFContextualActionSpotlightSyncService reindexSearchableItems:appShortcutBundleIdentifiers:completion:]_block_invoke";
      v14 = 2112;
      v15 = v5;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_ERROR, "%s Contextual action indexing finished. Index is UNHEALTHY. Unhealthy stages: %@, indexing errors: %@", buf, 0x20u);

    }
  }
  else
  {
    getWFSpotlightSyncLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[WFContextualActionSpotlightSyncService reindexSearchableItems:appShortcutBundleIdentifiers:completion:]_block_invoke_18";
      _os_log_impl(&dword_1C146A000, v7, OS_LOG_TYPE_DEFAULT, "%s Contextual action indexing finished. Index is HEALTHY.", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99EA0], "workflowUserDefaults");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject setValue:forKey:](v4, "setValue:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0DDA048]);
  }

  v8 = *(_QWORD *)(a1 + 56);
  if (v8)
    (*(void (**)(uint64_t, BOOL))(v8 + 16))(v8, v2 == 0);

  os_activity_scope_leave(&state);
}

uint64_t __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_2_177(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
}

void __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_17(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_14(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_12(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_9(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_6(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __76__WFContextualActionSpotlightSyncService_reindexAllSearchableItemsIfNeeded___block_invoke(uint64_t a1, int a2)
{
  uint64_t result;

  if (a2)
    return +[WFContextualActionSpotlightSyncService setContextualActionsIndexVersion:](WFContextualActionSpotlightSyncService, "setContextualActionsIndexVersion:", 29);
  return result;
}

void __87__WFContextualActionSpotlightSyncService_migrateAppShortcutsAndReindexAllItemsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  getWFSpotlightSyncLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[WFContextualActionSpotlightSyncService migrateAppShortcutsAndReindexAllItemsIfNeeded]_block_invoke";
      v8 = 2112;
      v9 = v3;
      _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_ERROR, "%s Error deleting legacy App Shortcuts domain: %@", (uint8_t *)&v6, 0x16u);
    }

  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[WFContextualActionSpotlightSyncService migrateAppShortcutsAndReindexAllItemsIfNeeded]_block_invoke";
      _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_DEFAULT, "%s Marking App Shortcut migration complete", (uint8_t *)&v6, 0xCu);
    }

    +[WFContextualActionSpotlightSyncService setDidCompleteAppShortcutDomainMigration](WFContextualActionSpotlightSyncService, "setDidCompleteAppShortcutDomainMigration");
  }
  objc_msgSend(*(id *)(a1 + 32), "reindexAllSearchableItemsIfNeeded:", 1);

}

+ (BOOL)didCompleteAppShortcutDomainMigration
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "workflowUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("WFAutoShortcutContextualActionDomainMigration"));

  return v3;
}

+ (void)setDidCompleteAppShortcutDomainMigration
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "workflowUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBool:forKey:", 1, CFSTR("WFAutoShortcutContextualActionDomainMigration"));

}

+ (int64_t)contextualActionsIndexVersion
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "workflowUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("WFContextualActionsIndexVersion"));

  return v3;
}

+ (void)setContextualActionsIndexVersion:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "workflowUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", a3, CFSTR("WFContextualActionsIndexVersion"));

}

@end
