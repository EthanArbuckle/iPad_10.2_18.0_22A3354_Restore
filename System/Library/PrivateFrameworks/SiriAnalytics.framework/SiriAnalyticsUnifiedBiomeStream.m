@implementation SiriAnalyticsUnifiedBiomeStream

- (SiriAnalyticsUnifiedBiomeStream)init
{

  return 0;
}

- (SiriAnalyticsUnifiedBiomeStream)initWithReadWriteStorageURL:(id)a3 prefs:(id)a4
{
  SiriAnalyticsUnifiedBiomeStream *v4;
  SiriAnalyticsUnifiedBiomeStream *v5;
  uint64_t v6;
  BMSource *source;

  v4 = -[SiriAnalyticsUnifiedBiomeStream initWithReadOnlyStorageURL:prefs:](self, "initWithReadOnlyStorageURL:prefs:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[BMStoreStream source](v4->_stream, "source");
    v6 = objc_claimAutoreleasedReturnValue();
    source = v5->_source;
    v5->_source = (BMSource *)v6;

  }
  return v5;
}

- (SiriAnalyticsUnifiedBiomeStream)initWithReadOnlyStorageURL:(id)a3 prefs:(id)a4
{
  id v7;
  id v8;
  SiriAnalyticsUnifiedBiomeStream *v9;
  SiriAnalyticsUnifiedBiomeStream *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  BMStoreStream *stream;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)SiriAnalyticsUnifiedBiomeStream;
  v9 = -[SiriAnalyticsUnifiedBiomeStream init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    +[SiriAnalyticsUnifiedMessageStreamHelper ensureDirectoryExistsAt:](SiriAnalyticsUnifiedMessageStreamHelper, "ensureDirectoryExistsAt:", v7);
    v11 = objc_alloc(MEMORY[0x1E0D024C0]);
    objc_msgSend(v7, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithStoreBasePath:segmentSize:protectionClass:", v12, 0x100000, 3);

    objc_storeStrong((id *)&v10->_prefs, a4);
    v14 = objc_alloc(MEMORY[0x1E0D024B0]);
    objc_msgSend(v8, "unifiedStreamMaxAgeOrDefault");
    v16 = (void *)objc_msgSend(v14, "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:", 0, 1, objc_msgSend(v8, "unifiedStreamMaxSizeOrDefault"), v15);
    objc_msgSend(v13, "setPruningPolicy:", v16);
    v17 = objc_alloc(MEMORY[0x1E0D02790]);
    +[SiriAnalyticsUnifiedMessageStreamHelper identifier](SiriAnalyticsUnifiedMessageStreamHelper, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "initWithPrivateStreamIdentifier:storeConfig:eventDataClass:", v18, v13, objc_opt_class());
    stream = v10->_stream;
    v10->_stream = (BMStoreStream *)v19;

  }
  return v10;
}

- (void)sendEvents:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[BMSource sendEvent:](self->_source, "sendEvent:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)fetchMessagesSince:(double)a3 receiveMessage:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  _QWORD v18[4];
  id v19;
  _QWORD *v20;
  _QWORD v21[4];

  v8 = a4;
  v9 = a5;
  -[BMStoreStream publisherFromStartTime:](self->_stream, "publisherFromStartTime:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  *(double *)&v21[3] = a3;
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __80__SiriAnalyticsUnifiedBiomeStream_fetchMessagesSince_receiveMessage_completion___block_invoke;
  v18[3] = &unk_1E4357858;
  v12 = v9;
  v19 = v12;
  v20 = v21;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __80__SiriAnalyticsUnifiedBiomeStream_fetchMessagesSince_receiveMessage_completion___block_invoke_63;
  v15[3] = &unk_1E4357880;
  v17 = v21;
  v13 = v8;
  v16 = v13;
  v14 = (id)objc_msgSend(v10, "sinkWithCompletion:receiveInput:", v18, v15);

  _Block_object_dispose(v21, 8);
}

- (void)fetchMessagesSinceBookmark:(id)a3 receiveMessage:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[BMStoreStream publisherFromStartTime:](self->_stream, "publisherFromStartTime:", 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v14 = 0;
LABEL_6:
    v16 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __88__SiriAnalyticsUnifiedBiomeStream_fetchMessagesSinceBookmark_receiveMessage_completion___block_invoke;
    v20[3] = &unk_1E43578A8;
    v21 = v10;
    v18[0] = v16;
    v18[1] = 3221225472;
    v18[2] = __88__SiriAnalyticsUnifiedBiomeStream_fetchMessagesSinceBookmark_receiveMessage_completion___block_invoke_2;
    v18[3] = &unk_1E43578D0;
    v19 = v9;
    v17 = (id)objc_msgSend(v11, "drivableSinkWithBookmark:completion:shouldContinue:", v14, v20, v18);

    v15 = v21;
    goto LABEL_7;
  }
  v12 = (void *)MEMORY[0x1E0CB3710];
  objc_msgSend(MEMORY[0x1E0CB3510], "bm_allowedClassesForSecureCodingBMBookmark");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v12, "unarchivedObjectOfClasses:fromData:error:", v13, v8, &v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v22;

  if (!v15 && v14)
    goto LABEL_6;
  (*((void (**)(id, _QWORD, _QWORD, uint64_t))v10 + 2))(v10, 0, 0, 2);
LABEL_7:

}

- (void)fetchMessagesBatchSinceBookmark:(id)a3 batchSize:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  _QWORD v14[6];
  _QWORD v15[5];
  id v16;

  v8 = a3;
  v9 = a5;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy_;
  v15[4] = __Block_byref_object_dispose_;
  v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a4);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __88__SiriAnalyticsUnifiedBiomeStream_fetchMessagesBatchSinceBookmark_batchSize_completion___block_invoke;
  v14[3] = &unk_1E43578F8;
  v14[4] = v15;
  v14[5] = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__SiriAnalyticsUnifiedBiomeStream_fetchMessagesBatchSinceBookmark_batchSize_completion___block_invoke_2;
  v11[3] = &unk_1E4357920;
  v10 = v9;
  v12 = v10;
  v13 = v15;
  -[SiriAnalyticsUnifiedBiomeStream fetchMessagesSinceBookmark:receiveMessage:completion:](self, "fetchMessagesSinceBookmark:receiveMessage:completion:", v8, v14, v11);

  _Block_object_dispose(v15, 8);
}

- (void)prune
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  NSObject *v12;
  double v13;
  double v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AF76A4](self, a2);
  v4 = objc_alloc(MEMORY[0x1E0D024C0]);
  -[NSURL path](self->_url, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithStoreBasePath:segmentSize:protectionClass:", v5, 0x100000, 3);

  v7 = objc_alloc(MEMORY[0x1E0D024D0]);
  +[SiriAnalyticsUnifiedMessageStreamHelper identifier](SiriAnalyticsUnifiedMessageStreamHelper, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithStream:permission:config:", v8, 2, v6);

  v10 = -[SiriAnalyticsPreferences unifiedStreamMaxSizeOrDefault](self->_prefs, "unifiedStreamMaxSizeOrDefault");
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v11 = v10 << 20;
  v12 = SiriAnalyticsLogContextUnifiedBiomeStream;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextUnifiedBiomeStream, OS_LOG_TYPE_DEBUG))
  {
    v20 = 136315394;
    v21 = "-[SiriAnalyticsUnifiedBiomeStream prune]";
    v22 = 2048;
    v23 = *(double *)&v11;
    _os_log_debug_impl(&dword_1A025F000, v12, OS_LOG_TYPE_DEBUG, "%s Pruning stream with max size: %lu bytes", (uint8_t *)&v20, 0x16u);
  }
  objc_msgSend(v9, "pruneStreamToMaxStreamSizeInBytes:", v11);
  -[SiriAnalyticsPreferences unifiedStreamMaxAgeOrDefault](self->_prefs, "unifiedStreamMaxAgeOrDefault");
  v14 = v13;
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v15 = SiriAnalyticsLogContextUnifiedBiomeStream;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextUnifiedBiomeStream, OS_LOG_TYPE_DEBUG))
  {
    v20 = 136315394;
    v21 = "-[SiriAnalyticsUnifiedBiomeStream prune]";
    v22 = 2048;
    v23 = v14;
    _os_log_debug_impl(&dword_1A025F000, v15, OS_LOG_TYPE_DEBUG, "%s Pruning stream with max age: %.1f seconds", (uint8_t *)&v20, 0x16u);
  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024B0]), "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:", 0, 0, 0, v14);
  objc_msgSend(v6, "setPruningPolicy:", v16);
  v17 = objc_alloc(MEMORY[0x1E0D02790]);
  +[SiriAnalyticsUnifiedMessageStreamHelper identifier](SiriAnalyticsUnifiedMessageStreamHelper, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithPrivateStreamIdentifier:storeConfig:eventDataClass:", v18, v6, objc_opt_class());

  objc_msgSend(v19, "pruneExpiredEventsWithBlock:", &__block_literal_global_627);
  objc_autoreleasePoolPop(v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_prefs, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

BOOL __88__SiriAnalyticsUnifiedBiomeStream_fetchMessagesBatchSinceBookmark_batchSize_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", a2);
  return (unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "count") < *(_QWORD *)(a1 + 40);
}

uint64_t __88__SiriAnalyticsUnifiedBiomeStream_fetchMessagesBatchSinceBookmark_batchSize_completion___block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = *(_QWORD *)(a1 + 32);
  if (a3)
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  else
    v7 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, v7, a2);
}

void __88__SiriAnalyticsUnifiedBiomeStream_fetchMessagesSinceBookmark_receiveMessage_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "state")
    || (objc_msgSend(v5, "error"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v13 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v13;
    if (v9 || !v8)
    {
      v10 = 0;
      v11 = 0;
      v12 = 1;
    }
    else
    {
      v10 = v8;
      v11 = 1;
      v12 = 0;
    }
    (*(void (**)(_QWORD, void *, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v10, v11, v12);

  }
}

uint64_t __88__SiriAnalyticsUnifiedBiomeStream_fetchMessagesSinceBookmark_receiveMessage_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "eventBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  }
  else
  {
    if (SiriAnalyticsLoggingInit_once != -1)
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
    v8 = SiriAnalyticsLogContextStreaming;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextStreaming, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "-[SiriAnalyticsUnifiedBiomeStream fetchMessagesSinceBookmark:receiveMessage:completion:]_block_invoke_2";
      v12 = 2112;
      v13 = v3;
      _os_log_error_impl(&dword_1A025F000, v8, OS_LOG_TYPE_ERROR, "%s Event had no eventBody: %@", (uint8_t *)&v10, 0x16u);
    }
    v7 = 1;
  }

  return v7;
}

void __80__SiriAnalyticsUnifiedBiomeStream_fetchMessagesSince_receiveMessage_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  double v6;
  _BOOL8 v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v4 = (void *)SiriAnalyticsLogContextUnifiedBiomeStream;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextUnifiedBiomeStream, OS_LOG_TYPE_DEBUG))
  {
    v9 = v4;
    v10 = objc_msgSend(v3, "state");
    objc_msgSend(v3, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315650;
    v13 = "-[SiriAnalyticsUnifiedBiomeStream fetchMessagesSince:receiveMessage:completion:]_block_invoke";
    v14 = 2048;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    _os_log_debug_impl(&dword_1A025F000, v9, OS_LOG_TYPE_DEBUG, "%s Sink completion with state: %ld, error: %@", (uint8_t *)&v12, 0x20u);

  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v7 = objc_msgSend(v3, "state") == 0;
  objc_msgSend(v3, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _BOOL8, void *, double))(v5 + 16))(v5, v7, v8, v6);

}

void __80__SiriAnalyticsUnifiedBiomeStream_fetchMessagesSince_receiveMessage_completion___block_invoke_63(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "timestamp");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  objc_msgSend(v7, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "eventBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  }
}

@end
