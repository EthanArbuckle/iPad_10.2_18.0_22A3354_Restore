@implementation PPReranker

- (PPReranker)init
{
  void *v3;
  PPReranker *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[PPReranker initWithNamedEntityStore:](self, "initWithNamedEntityStore:", v3);

  return v4;
}

- (PPReranker)initWithNamedEntityStore:(id)a3
{
  id v5;
  PPReranker *v6;
  PPReranker *v7;
  PPClientFeedbackHelper *v8;
  PPClientFeedbackHelper *clientFeedbackHelper;
  id v10;
  void *v11;
  uint64_t v12;
  _PASLock *dataLock;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PPReranker;
  v6 = -[PPReranker init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_namedEntityStore, a3);
    v8 = -[PPClientFeedbackHelper initWithParentObject:]([PPClientFeedbackHelper alloc], "initWithParentObject:", v7);
    clientFeedbackHelper = v7->_clientFeedbackHelper;
    v7->_clientFeedbackHelper = v8;

    v10 = objc_alloc(MEMORY[0x1E0D815F0]);
    v11 = (void *)objc_opt_new();
    v12 = objc_msgSend(v10, "initWithGuardedData:", v11);
    dataLock = v7->_dataLock;
    v7->_dataLock = (_PASLock *)v12;

  }
  return v7;
}

- (id)_lazyLoadEntityRankMapWithError:(id *)a3
{
  _PASLock *dataLock;
  id v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__4954;
  v18 = __Block_byref_object_dispose__4955;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__4954;
  v12 = __Block_byref_object_dispose__4955;
  v13 = 0;
  dataLock = self->_dataLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__PPReranker__lazyLoadEntityRankMapWithError___block_invoke;
  v7[3] = &unk_1E226ADD8;
  v7[4] = self;
  v7[5] = &v14;
  v7[6] = &v8;
  -[_PASLock runWithLockAcquired:](dataLock, "runWithLockAcquired:", v7);
  if (a3)
    *a3 = objc_retainAutorelease((id)v9[5]);
  v5 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

- (id)rerankedMediaItems:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[4];
  id v26;
  SEL v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPReranker.m"), 97, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaItems"));

  }
  pp_locations_signpost_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  pp_locations_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PPReranker.rerankedMediaItems", (const char *)&unk_18BE9F21B, buf, 2u);
  }

  v28 = 0;
  -[PPReranker _lazyLoadEntityRankMapWithError:](self, "_lazyLoadEntityRankMapWithError:", &v28);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v28;
  v14 = v13;
  if (v12)
  {
    pp_reranker_log_handle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_msgSend(v7, "count");
      v17 = objc_msgSend(v12, "count");
      *(_DWORD *)buf = 134218240;
      v30 = v16;
      v31 = 2048;
      v32 = v17;
      _os_log_impl(&dword_18BE3A000, v15, OS_LOG_TYPE_DEFAULT, "reranking %tu items with %tu entities", buf, 0x16u);
    }

    v18 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __39__PPReranker_rerankedMediaItems_error___block_invoke;
    v25[3] = &unk_1E226AE00;
    v26 = v12;
    v27 = a2;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v25);
    v24[0] = v18;
    v24[1] = 3221225472;
    v24[2] = __39__PPReranker_rerankedMediaItems_error___block_invoke_2;
    v24[3] = &__block_descriptor_40_e37_q24__0__INMediaItem_8__INMediaItem_16l;
    v24[4] = a2;
    objc_msgSend(v7, "sortedArrayUsingComparator:", v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    pp_locations_signpost_handle();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18BE3A000, v21, OS_SIGNPOST_INTERVAL_END, v9, "PPReranker.rerankedMediaItems", (const char *)&unk_18BE9F21B, buf, 2u);
    }

  }
  else
  {
    v19 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v13);
  }

  return v19;
}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, uint64_t, _QWORD);
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  pp_private_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_debug_impl(&dword_18BE3A000, v7, OS_LOG_TYPE_DEBUG, "received feedback: %@", (uint8_t *)&v8, 0xCu);
  }

  if (v6)
    v6[2](v6, 1, 0);

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataLock, 0);
  objc_storeStrong((id *)&self->_clientFeedbackHelper, 0);
  objc_storeStrong((id *)&self->_namedEntityStore, 0);
}

void __39__PPReranker_rerankedMediaItems_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  const void *v16;
  id v17;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8 + 0.0;

  v10 = *(void **)(a1 + 32);
  objc_msgSend(v4, "artist");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lowercaseString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v9 + v14;

  v16 = *(const void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(v4, v16, v17, (void *)1);

}

int64_t __39__PPReranker_rerankedMediaItems_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  const void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  int64_t v12;

  v5 = *(const void **)(a1 + 32);
  v6 = a3;
  objc_getAssociatedObject(a2, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_getAssociatedObject(v6, *(const void **)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "doubleValue");
  v10 = v9;
  objc_msgSend(v8, "doubleValue");
  v12 = +[PPUtils reverseCompareDouble:withDouble:](PPUtils, "reverseCompareDouble:withDouble:", v10, v11);

  return v12;
}

void __46__PPReranker__lazyLoadEntityRankMapWithError___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  char v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v5 = v3 + 1;
  v4 = v3[1];
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4);
  }
  else
  {
    pp_reranker_log_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18BE3A000, v6, OS_LOG_TYPE_DEFAULT, "loading the entity to rank map.", buf, 2u);
    }

    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setLimit:", 500);
    v8 = (void *)objc_opt_new();
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v21 = 0;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __46__PPReranker__lazyLoadEntityRankMapWithError___block_invoke_10;
    v19[3] = &unk_1E226ADB0;
    v10 = v8;
    v20 = v10;
    v11 = objc_msgSend(v9, "iterRankedNamedEntitiesWithQuery:error:block:", v7, &v21, v19);
    v12 = v21;
    if ((v11 & 1) != 0)
    {
      objc_storeStrong(v5, v8);
      v13 = *v5;
      v14 = a1 + 40;
    }
    else
    {
      pp_reranker_log_handle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v23 = v7;
        v24 = 2112;
        v25 = v12;
        _os_log_error_impl(&dword_18BE3A000, v15, OS_LOG_TYPE_ERROR, "failed to get ranked named entities with query: %@ error: %@", buf, 0x16u);
      }

      v14 = a1 + 48;
      v13 = v12;
    }
    v16 = *(_QWORD *)(*(_QWORD *)v14 + 8);
    v17 = v13;
    v18 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v17;

  }
}

void __46__PPReranker__lazyLoadEntityRankMapWithError___block_invoke_10(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a2;
  objc_msgSend(v4, "score");
  objc_msgSend(v3, "numberWithDouble:");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v4, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, v8);

}

@end
