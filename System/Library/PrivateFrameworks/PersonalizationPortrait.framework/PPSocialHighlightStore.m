@implementation PPSocialHighlightStore

void __50__PPSocialHighlightStore__sharedAdaptiveCoalescer__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = objc_opt_new();
  v2 = (void *)_sharedAdaptiveCoalescer__pasExprOnceResult;
  _sharedAdaptiveCoalescer__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

- (BOOL)iterRankedHighlightsWithLimit:(unint64_t)a3 client:(id)a4 variant:(id)a5 error:(id *)a6 block:(id)a7
{
  return -[PPSocialHighlightStore iterRankedHighlightsWithLimit:client:variant:reason:error:block:](self, "iterRankedHighlightsWithLimit:client:variant:reason:error:block:", a3, a4, a5, 0, a6, a7);
}

- (PPSocialHighlightStore)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PPSocialHighlightStore;
  return -[PPSocialHighlightStore init](&v3, sel_init);
}

- (BOOL)iterRankedHighlightsWithLimit:(unint64_t)a3 client:(id)a4 variant:(id)a5 reason:(id)a6 error:(id *)a7 block:(id)a8
{
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  dispatch_semaphore_t v20;
  void *v21;
  id v22;
  void *v23;
  char v24;
  _QWORD v26[6];

  v15 = a8;
  +[PPSocialHighlightStoreRequestKey socialHighlightStoreRequestKeyWithLimit:client:variant:reason:](PPSocialHighlightStoreRequestKey, "socialHighlightStoreRequestKeyWithLimit:client:variant:reason:", a3, a4, a5, a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_new();
  v18 = MEMORY[0x18D780768](v15);

  v19 = *(void **)(v17 + 24);
  *(_QWORD *)(v17 + 24) = v18;

  *(_BYTE *)(v17 + 8) = 0;
  v20 = dispatch_semaphore_create(0);
  v21 = *(void **)(v17 + 32);
  *(_QWORD *)(v17 + 32) = v20;

  objc_opt_self();
  if (_sharedAdaptiveCoalescer__pasOnceToken2 != -1)
    dispatch_once(&_sharedAdaptiveCoalescer__pasOnceToken2, &__block_literal_global_5233);
  v22 = (id)_sharedAdaptiveCoalescer__pasExprOnceResult;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __90__PPSocialHighlightStore_iterRankedHighlightsWithLimit_client_variant_reason_error_block___block_invoke;
  v26[3] = &unk_1E226B040;
  v26[4] = self;
  v26[5] = a2;
  v23 = (void *)MEMORY[0x18D780768](v26);
  objc_msgSend(v22, "coalesceRequestKey:handler:executeRequestAndInvokeHandlersBlock:", v16, v17, v23);

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v17 + 32), 0xFFFFFFFFFFFFFFFFLL);
  if (a7)
    *a7 = objc_retainAutorelease(*(id *)(v17 + 16));
  v24 = *(_BYTE *)(v17 + 8);

  return v24;
}

- (BOOL)iterRankedCollaborationsWithLimit:(unint64_t)a3 client:(id)a4 variant:(id)a5 error:(id *)a6 block:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;

  v11 = a7;
  v12 = a5;
  v13 = a4;
  +[PPSocialHighlightClient sharedInstance](PPSocialHighlightClient, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __87__PPSocialHighlightStore_iterRankedCollaborationsWithLimit_client_variant_error_block___block_invoke;
  v17[3] = &unk_1E226C1F0;
  v18 = v11;
  v15 = v11;
  LOBYTE(a6) = objc_msgSend(v14, "rankedCollaborationsWithLimit:client:variant:error:handleBatch:", a3, v13, v12, a6, v17);

  return (char)a6;
}

- (BOOL)iterRankedHighlightsForSyncedItems:(id)a3 client:(id)a4 variant:(id)a5 error:(id *)a6 block:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;

  v11 = a7;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  +[PPSocialHighlightClient sharedInstance](PPSocialHighlightClient, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __88__PPSocialHighlightStore_iterRankedHighlightsForSyncedItems_client_variant_error_block___block_invoke;
  v18[3] = &unk_1E226C1F0;
  v19 = v11;
  v16 = v11;
  LOBYTE(a6) = objc_msgSend(v15, "rankedHighlightsForSyncedItems:client:variant:error:handleBatch:", v14, v13, v12, a6, v18);

  return (char)a6;
}

- (id)attributionForIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  +[PPSocialHighlightClient sharedInstance](PPSocialHighlightClient, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributionForIdentifier:error:", v5, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)feedbackForHighlightIdentifier:(id)a3 type:(unint64_t)a4 client:(id)a5 variant:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a3;
  +[PPSocialHighlightClient sharedInstance](PPSocialHighlightClient, "sharedInstance");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "feedbackForHighlight:type:client:variant:completion:", v14, a4, v13, v12, v11);

}

- (void)feedbackForHighlightResourceURL:(id)a3 resolvedURL:(id)a4 type:(unint64_t)a5 client:(id)a6 variant:(id)a7 completion:(id)a8
{
  (*((void (**)(id, uint64_t, _QWORD))a8 + 2))(a8, 1, 0);
}

- (void)feedbackForAttributionIdentifier:(id)a3 type:(unint64_t)a4 client:(id)a5 variant:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a3;
  +[PPSocialHighlightClient sharedInstance](PPSocialHighlightClient, "sharedInstance");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "feedbackForAttribution:type:client:variant:completion:", v14, a4, v13, v12, v11);

}

void __88__PPSocialHighlightStore_iterRankedHighlightsForSyncedItems_client_variant_error_block___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
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

void __87__PPSocialHighlightStore_iterRankedCollaborationsWithLimit_client_variant_error_block___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
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

void __90__PPSocialHighlightStore_iterRankedHighlightsWithLimit_client_variant_reason_error_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  char v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[4];
  id v26;
  __int128 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  +[PPSocialHighlightClient sharedInstance](PPSocialHighlightClient, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "limit");
  objc_msgSend(v5, "client");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "variant");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __90__PPSocialHighlightStore_iterRankedHighlightsWithLimit_client_variant_reason_error_block___block_invoke_2;
  v25[3] = &unk_1E226B018;
  v11 = v6;
  v26 = v11;
  v27 = *(_OWORD *)(a1 + 32);
  v12 = objc_msgSend(v7, "rankedHighlightsWithLimit:client:variant:error:handleBatch:", v8, v9, v10, &v28, v25);
  v13 = v28;
  v14 = v28;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v15 = v11;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v19);
        *(_BYTE *)(v20 + 8) = v12;
        objc_storeStrong((id *)(v20 + 16), v13);
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v20 + 32));
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v17);
  }

}

void __90__PPSocialHighlightStore_iterRankedHighlightsWithLimit_client_variant_reason_error_block___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  char v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v16 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (v4)
  {
    v5 = v4;
    do
    {
      --v5;
      v6 = (void *)MEMORY[0x18D7805AC]();
      v21 = 0;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v7 = v16;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v18;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v18 != v10)
              objc_enumerationMutation(v7);
            v12 = (void *)MEMORY[0x18D7805AC]();
            objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v5);
            v13 = objc_claimAutoreleasedReturnValue();
            if (*(_BYTE *)(v13 + 8))
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), CFSTR("PPSocialHighlightStore.m"), 246, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("remainingHandler->_successful == NO"));

            }
            (*(void (**)(void))(*(_QWORD *)(v13 + 24) + 16))();
            if (v21)
            {
              *(_BYTE *)(v13 + 8) = 1;
              dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v13 + 32));
              objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", v5);

              objc_autoreleasePoolPop(v12);
              goto LABEL_15;
            }

            objc_autoreleasePoolPop(v12);
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
          if (v9)
            continue;
          break;
        }
      }
LABEL_15:

      objc_autoreleasePoolPop(v6);
    }
    while (v5);
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "count"))
    *a3 = 1;

}

+ (double)decayInterval
{
  void *v2;
  double v3;
  double v4;

  +[PPSocialHighlightClient sharedInstance](PPSocialHighlightClient, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "decayInterval");
  v4 = v3;

  return v4;
}

@end
