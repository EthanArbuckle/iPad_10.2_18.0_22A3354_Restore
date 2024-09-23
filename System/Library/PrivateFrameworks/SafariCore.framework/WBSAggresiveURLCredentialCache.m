@implementation WBSAggresiveURLCredentialCache

- (WBSAggresiveURLCredentialCache)initWithCredentialFetchBlock:(id)a3
{
  WBSAggresiveURLCredentialCache *v3;
  WBSAggresiveURLCredentialCache *v4;
  WBSAggresiveURLCredentialCache *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WBSAggresiveURLCredentialCache;
  v3 = -[WBSURLCredentialCache initWithCredentialFetchBlock:](&v7, sel_initWithCredentialFetchBlock_, a3);
  v4 = v3;
  if (v3)
  {
    -[WBSAggresiveURLCredentialCache invalidate](v3, "invalidate");
    v5 = v4;
  }

  return v4;
}

- (void)invalidate
{
  NSObject *v3;
  NSObject *internalQueue;
  _QWORD block[5];
  uint8_t buf[4];
  WBSAggresiveURLCredentialCache *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v7 = self;
    _os_log_impl(&dword_1B2621000, v3, OS_LOG_TYPE_INFO, "Invalidating aggressive credential cache <%p>", buf, 0xCu);
  }
  internalQueue = self->super._internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__WBSAggresiveURLCredentialCache_invalidate__block_invoke;
  block[3] = &unk_1E649B768;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __44__WBSAggresiveURLCredentialCache_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 16))();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

}

- (id)credentials
{
  NSObject *internalQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__16;
  v10 = __Block_byref_object_dispose__16;
  v11 = 0;
  internalQueue = self->super._internalQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__WBSAggresiveURLCredentialCache_credentials__block_invoke;
  v5[3] = &unk_1E649C470;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __45__WBSAggresiveURLCredentialCache_credentials__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 16);
    v5 = v2;
    v9 = 134218240;
    v10 = v3;
    v11 = 2048;
    v12 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1B2621000, v5, OS_LOG_TYPE_INFO, "Returning credentials from aggressive cache <%p>, which contain %lu items", (uint8_t *)&v9, 0x16u);

  }
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (void)getCredentialsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->super._internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__WBSAggresiveURLCredentialCache_getCredentialsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E649B6B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __70__WBSAggresiveURLCredentialCache_getCredentialsWithCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 16);
    v5 = v2;
    v8 = 134218240;
    v9 = v3;
    v10 = 2048;
    v11 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1B2621000, v5, OS_LOG_TYPE_INFO, "Getting credentials from aggressive cache <%p>, which contain %lu items", (uint8_t *)&v8, 0x16u);

  }
  v6 = *(_QWORD *)(a1 + 40);
  v7 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

}

@end
