@implementation PPXPCTopicStore

- (id)_init
{
  _QWORD *v2;
  PPClientFeedbackHelper *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PPXPCTopicStore;
  v2 = -[PPTopicStore _initFromSubclass](&v6, sel__initFromSubclass);
  if (v2)
  {
    v3 = -[PPClientFeedbackHelper initWithParentObject:]([PPClientFeedbackHelper alloc], "initWithParentObject:", v2);
    v4 = (void *)v2[1];
    v2[1] = v3;

  }
  return v2;
}

- (BOOL)iterRankedTopicsWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  char v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v19[4];
  id v20;
  uint8_t buf[16];

  v7 = a5;
  v8 = a3;
  pp_topics_signpost_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  pp_topics_signpost_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PPXPCTopicStore.iterRankedTopicsWithQuery", (const char *)&unk_18BE9F21B, buf, 2u);
  }

  +[PPTopicReadOnlyClient sharedInstance](PPTopicReadOnlyClient, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __57__PPXPCTopicStore_iterRankedTopicsWithQuery_error_block___block_invoke;
  v19[3] = &unk_1E226C1F0;
  v20 = v7;
  v14 = v7;
  v15 = objc_msgSend(v13, "rankedTopicsWithQuery:error:handleBatch:", v8, a4, v19);

  pp_topics_signpost_handle();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v17, OS_SIGNPOST_INTERVAL_END, v10, "PPXPCTopicStore.iterRankedTopicsWithQuery", (const char *)&unk_18BE9F21B, buf, 2u);
  }

  return v15;
}

- (id)rankedTopicsWithQuery:(id)a3 error:(id *)a4
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
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  id v28;
  uint64_t *v29;
  uint8_t buf[8];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  pp_topics_signpost_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  pp_topics_signpost_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PPXPCTopicStore.rankedTopicsWithQuery", (const char *)&unk_18BE9F21B, buf, 2u);
  }

  +[PPTopicReadOnlyClient sharedInstance](PPTopicReadOnlyClient, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __47__PPXPCTopicStore_rankedTopicsWithQuery_error___block_invoke;
  v27[3] = &unk_1E226A2F0;
  v12 = v6;
  v28 = v12;
  v29 = &v31;
  v13 = objc_msgSend(v11, "rankedTopicsWithQuery:error:handleBatch:", v5, a4, v27);

  pp_topics_signpost_handle();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v8 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v15, OS_SIGNPOST_INTERVAL_END, v8, "PPXPCTopicStore.rankedTopicsWithQuery", (const char *)&unk_18BE9F21B, buf, 2u);
  }

  if (v13)
  {
    v16 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v17 = (void *)objc_msgSend(v16, "initWithCapacity:", v32[3]);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v18 = v12;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v24 != v20)
            objc_enumerationMutation(v18);
          objc_msgSend(v17, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i), (_QWORD)v23);
        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
      }
      while (v19);
    }

  }
  else
  {
    v17 = 0;
  }

  _Block_object_dispose(&v31, 8);
  return v17;
}

- (BOOL)iterScoresForTopicMapping:(id)a3 query:(id)a4 error:(id *)a5 block:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id v17;
  char v18;
  NSObject *v19;
  NSObject *v20;
  _QWORD v22[4];
  id v23;
  uint8_t buf[16];

  v9 = a6;
  v10 = a4;
  v11 = a3;
  pp_topics_signpost_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_generate(v12);

  pp_topics_signpost_handle();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PPXPCTopicStore.iterScoresForTopicMapping", (const char *)&unk_18BE9F21B, buf, 2u);
  }

  +[PPTopicReadOnlyClient sharedInstance](PPTopicReadOnlyClient, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __63__PPXPCTopicStore_iterScoresForTopicMapping_query_error_block___block_invoke;
  v22[3] = &unk_1E226C1F0;
  v23 = v9;
  v17 = v9;
  v18 = objc_msgSend(v16, "scoresForTopicMapping:query:error:handleBatch:", v11, v10, a5, v22);

  pp_topics_signpost_handle();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v20, OS_SIGNPOST_INTERVAL_END, v13, "PPXPCTopicStore.iterScoresForTopicMapping", (const char *)&unk_18BE9F21B, buf, 2u);
  }

  return v18;
}

- (id)scoresForTopicMapping:(id)a3 query:(id)a4 error:(id *)a5
{
  void *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  id v31;
  id v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  uint64_t *v44;
  uint8_t buf[16];
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v32 = a4;
  v7 = (void *)objc_opt_new();
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  pp_topics_signpost_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  pp_topics_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PPXPCTopicStore.scoresForTopicMapping", (const char *)&unk_18BE9F21B, buf, 2u);
  }

  +[PPTopicReadOnlyClient sharedInstance](PPTopicReadOnlyClient, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __53__PPXPCTopicStore_scoresForTopicMapping_query_error___block_invoke;
  v42[3] = &unk_1E226A2F0;
  v30 = v7;
  v43 = v30;
  v44 = &v46;
  v13 = objc_msgSend(v12, "scoresForTopicMapping:query:error:handleBatch:", v31, v32, a5, v42);

  pp_topics_signpost_handle();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v9 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v15, OS_SIGNPOST_INTERVAL_END, v9, "PPXPCTopicStore.scoresForTopicMapping", (const char *)&unk_18BE9F21B, buf, 2u);
  }

  if (v13)
  {
    v16 = objc_alloc(MEMORY[0x1E0C99E08]);
    v17 = (void *)objc_msgSend(v16, "initWithCapacity:", v47[3]);
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = v30;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v39 != v19)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v22 = v21;
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v50, 16);
          if (v23)
          {
            v24 = *(_QWORD *)v35;
            do
            {
              for (j = 0; j != v23; ++j)
              {
                if (*(_QWORD *)v35 != v24)
                  objc_enumerationMutation(v22);
                v26 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
                objc_msgSend(v26, "second");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "first");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "setObject:forKeyedSubscript:", v27, v28);

              }
              v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v50, 16);
            }
            while (v23);
          }

        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
      }
      while (v18);
    }

  }
  else
  {
    v17 = 0;
  }

  _Block_object_dispose(&v46, 8);
  return v17;
}

- (BOOL)iterTopicRecordsWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  char v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v19[4];
  id v20;
  uint8_t buf[16];

  v7 = a5;
  v8 = a3;
  pp_topics_signpost_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  pp_topics_signpost_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PPXPCTopicStore.iterTopicRecordsWithQuery", (const char *)&unk_18BE9F21B, buf, 2u);
  }

  +[PPTopicReadOnlyClient sharedInstance](PPTopicReadOnlyClient, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __57__PPXPCTopicStore_iterTopicRecordsWithQuery_error_block___block_invoke;
  v19[3] = &unk_1E226C1F0;
  v20 = v7;
  v14 = v7;
  v15 = objc_msgSend(v13, "topicRecordsWithQuery:error:handleBatch:", v8, a4, v19);

  pp_topics_signpost_handle();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v17, OS_SIGNPOST_INTERVAL_END, v10, "PPXPCTopicStore.iterTopicRecordsWithQuery", (const char *)&unk_18BE9F21B, buf, 2u);
  }

  return v15;
}

- (id)topicRecordsWithQuery:(id)a3 error:(id *)a4
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
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  id v28;
  uint64_t *v29;
  uint8_t buf[8];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  pp_topics_signpost_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  pp_topics_signpost_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PPXPCTopicStore.topicRecordsWithQuery", (const char *)&unk_18BE9F21B, buf, 2u);
  }

  +[PPTopicReadOnlyClient sharedInstance](PPTopicReadOnlyClient, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __47__PPXPCTopicStore_topicRecordsWithQuery_error___block_invoke;
  v27[3] = &unk_1E226A2F0;
  v12 = v6;
  v28 = v12;
  v29 = &v31;
  v13 = objc_msgSend(v11, "topicRecordsWithQuery:error:handleBatch:", v5, a4, v27);

  pp_topics_signpost_handle();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v8 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v15, OS_SIGNPOST_INTERVAL_END, v8, "PPXPCTopicStore.topicRecordsWithQuery", (const char *)&unk_18BE9F21B, buf, 2u);
  }

  if (v13)
  {
    v16 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v17 = (void *)objc_msgSend(v16, "initWithCapacity:", v32[3]);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v18 = v12;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v24 != v20)
            objc_enumerationMutation(v18);
          objc_msgSend(v17, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i), (_QWORD)v23);
        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
      }
      while (v19);
    }

  }
  else
  {
    v17 = 0;
  }

  _Block_object_dispose(&v31, 8);
  return v17;
}

- (id)topicExtractionsFromText:(id)a3 error:(id *)a4
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
  pp_topics_signpost_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  pp_topics_signpost_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PPXPCTopicStore.topicExtractionsFromText", (const char *)&unk_18BE9F21B, buf, 2u);
  }

  +[PPTopicReadOnlyClient sharedInstance](PPTopicReadOnlyClient, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __50__PPXPCTopicStore_topicExtractionsFromText_error___block_invoke;
  v19[3] = &unk_1E226AC10;
  v20 = v6;
  v12 = v6;
  v13 = objc_msgSend(v11, "topicExtractionsFromText:error:handleBatch:", v5, a4, v19);

  pp_topics_signpost_handle();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v15, OS_SIGNPOST_INTERVAL_END, v8, "PPXPCTopicStore.topicExtractionsFromText", (const char *)&unk_18BE9F21B, buf, 2u);
  }

  if (v13)
    v16 = v12;
  else
    v16 = 0;
  v17 = v16;

  return v17;
}

- (id)unmapMappedTopicIdentifier:(id)a3 mappingIdentifier:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a4;
  v8 = a3;
  +[PPTopicReadOnlyClient sharedInstance](PPTopicReadOnlyClient, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unmapMappedTopicIdentifier:mappingIdentifier:error:", v8, v7, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)donateTopics:(id)a3 source:(id)a4 algorithm:(unint64_t)a5 cloudSync:(BOOL)a6 sentimentScore:(double)a7 exactMatchesInSourceText:(id)a8 error:(id *)a9
{
  _BOOL8 v12;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  os_signpost_id_t v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  char v25;
  NSObject *v26;
  NSObject *v27;
  void *v29;
  void *v30;
  uint8_t v31[16];
  uint8_t buf[16];

  v12 = a6;
  v17 = a3;
  v18 = a4;
  v19 = a8;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPXPCTopicStore.m"), 198, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("topics"));

    if (v18)
      goto LABEL_3;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPXPCTopicStore.m"), 199, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("source"));

    goto LABEL_3;
  }
  if (!v18)
    goto LABEL_11;
LABEL_3:
  pp_topics_signpost_handle();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_signpost_id_generate(v20);

  pp_topics_signpost_handle();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "PPXPCTopicStore.donateTopics", (const char *)&unk_18BE9F21B, buf, 2u);
  }

  +[PPTopicReadWriteClient sharedInstance](PPTopicReadWriteClient, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "donateTopics:source:algorithm:cloudSync:sentimentScore:exactMatchesInSourceText:error:", v17, v18, a5, v12, v19, a9, a7);

  pp_topics_signpost_handle();
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)v31 = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v27, OS_SIGNPOST_INTERVAL_END, v21, "PPXPCTopicStore.donateTopics", (const char *)&unk_18BE9F21B, v31, 2u);
  }

  return v25;
}

- (BOOL)deleteAllTopicsWithTopicId:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5
{
  id v7;
  void *v8;

  v7 = a3;
  +[PPTopicReadWriteClient sharedInstance](PPTopicReadWriteClient, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v8, "deleteAllTopicsWithTopicId:deletedCount:error:", v7, a4, a5);

  return (char)a5;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;

  v9 = a4;
  v10 = a3;
  +[PPTopicReadWriteClient sharedInstance](PPTopicReadWriteClient, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v11, "deleteAllTopicsFromSourcesWithBundleId:documentIds:deletedCount:error:", v10, v9, a5, a6);

  return (char)a6;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;

  v9 = a4;
  v10 = a3;
  +[PPTopicReadWriteClient sharedInstance](PPTopicReadWriteClient, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v11, "deleteAllTopicsFromSourcesWithBundleId:groupIds:deletedCount:error:", v10, v9, a5, a6);

  return (char)a6;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5
{
  id v7;
  void *v8;

  v7 = a3;
  +[PPTopicReadWriteClient sharedInstance](PPTopicReadWriteClient, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v8, "deleteAllTopicsFromSourcesWithBundleId:deletedCount:error:", v7, a4, a5);

  return (char)a5;
}

- (BOOL)cloudSyncWithError:(id *)a3
{
  void *v4;

  +[PPTopicReadWriteClient sharedInstance](PPTopicReadWriteClient, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "cloudSyncWithError:", a3);

  return (char)a3;
}

- (BOOL)clearWithError:(id *)a3 deletedCount:(unint64_t *)a4
{
  void *v6;

  +[PPTopicReadWriteClient sharedInstance](PPTopicReadWriteClient, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v6, "clearWithError:deletedCount:", a3, a4);

  return (char)a4;
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
  _QWORD v15[5];
  id v16;

  v7 = a4;
  v8 = a3;
  -[PPXPCTopicStore clientIdentifier](self, "clientIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPXPCTopicStore.m"), 271, CFSTR("The clientIdentifier property must be set on the PPTopicStore in order to send feedback."));

  }
  -[PPXPCTopicStore clientIdentifier](self, "clientIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClientIdentifier:", v11);

  +[PPTopicReadOnlyClient sharedInstance](PPTopicReadOnlyClient, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __47__PPXPCTopicStore_registerFeedback_completion___block_invoke;
  v15[3] = &unk_1E226C218;
  v15[4] = self;
  v16 = v7;
  v13 = v7;
  objc_msgSend(v12, "registerFeedback:completion:", v8, v15);

}

- (id)clientIdentifier
{
  return -[PPClientFeedbackHelper clientIdentifier](self->_clientFeedbackHelper, "clientIdentifier");
}

- (void)setClientIdentifier:(id)a3
{
  -[PPClientFeedbackHelper setClientIdentifier:](self->_clientFeedbackHelper, "setClientIdentifier:", a3);
}

- (void)registerUniversalSearchSpotlightFeedback:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;

  v7 = a4;
  v8 = a3;
  -[PPXPCTopicStore clientIdentifier](self, "clientIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPXPCTopicStore.m"), 301, CFSTR("The clientIdentifier property must be set on the PPTopicStore in order to send feedback."));

  }
  -[PPXPCTopicStore clientIdentifier](self, "clientIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClientIdentifier:", v11);

  +[PPTopicReadOnlyClient sharedInstance](PPTopicReadOnlyClient, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__PPXPCTopicStore_registerUniversalSearchSpotlightFeedback_completion___block_invoke;
  v15[3] = &unk_1E226C218;
  v15[4] = self;
  v16 = v7;
  v13 = v7;
  objc_msgSend(v12, "registerUniversalSearchSpotlightFeedback:completion:", v8, v15);

}

- (BOOL)computeAndCacheTopicScores:(id *)a3
{
  void *v4;

  +[PPTopicReadWriteClient sharedInstance](PPTopicReadWriteClient, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "computeAndCacheTopicScores:", a3);

  return (char)a3;
}

- (id)topicCacheSandboxExtensionToken:(id *)a3
{
  void *v4;
  void *v5;

  +[PPTopicReadOnlyClient sharedInstance](PPTopicReadOnlyClient, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topicCacheSandboxExtensionToken:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)cachePath:(id *)a3
{
  void *v4;
  void *v5;

  +[PPTopicReadOnlyClient sharedInstance](PPTopicReadOnlyClient, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cachePath:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientFeedbackHelper, 0);
}

void __71__PPXPCTopicStore_registerUniversalSearchSpotlightFeedback_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;
  uint64_t v7;
  id v8;

  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    v8 = v6;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v7, a2, a3);
    v6 = v8;
  }

}

void __47__PPXPCTopicStore_registerFeedback_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;
  uint64_t v7;
  id v8;

  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    v8 = v6;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v7, a2, a3);
    v6 = v8;
  }

}

uint64_t __50__PPXPCTopicStore_topicExtractionsFromText_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
}

void __47__PPXPCTopicStore_topicRecordsWithQuery_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "addObject:", v4);
  v5 = objc_msgSend(v4, "count");

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v5;
}

void __57__PPXPCTopicStore_iterTopicRecordsWithQuery_error_block___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
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

void __53__PPXPCTopicStore_scoresForTopicMapping_query_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "addObject:", v4);
  v5 = objc_msgSend(v4, "count");

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v5;
}

void __63__PPXPCTopicStore_iterScoresForTopicMapping_query_error_block___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (!*a3)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
        v13 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v12, "first", (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "second");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, void *, _BYTE *))(v13 + 16))(v13, v14, v15, a3);

        if (*a3)
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v9)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

void __47__PPXPCTopicStore_rankedTopicsWithQuery_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "addObject:", v4);
  v5 = objc_msgSend(v4, "count");

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v5;
}

void __57__PPXPCTopicStore_iterRankedTopicsWithQuery_error_block___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
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
