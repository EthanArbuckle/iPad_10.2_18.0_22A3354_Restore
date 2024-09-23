@implementation WBSLazyURLCredentialCache

- (void)invalidate
{
  NSObject *v3;
  NSObject *internalQueue;
  _QWORD block[5];
  uint8_t buf[4];
  WBSLazyURLCredentialCache *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v7 = self;
    _os_log_impl(&dword_1B2621000, v3, OS_LOG_TYPE_INFO, "Invalidating lazy credential cache <%p>", buf, 0xCu);
  }
  internalQueue = self->super._internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__WBSLazyURLCredentialCache_invalidate__block_invoke;
  block[3] = &unk_1E649B768;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __39__WBSLazyURLCredentialCache_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = 0;

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
  v5[2] = __40__WBSLazyURLCredentialCache_credentials__block_invoke;
  v5[3] = &unk_1E649C470;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __40__WBSLazyURLCredentialCache_credentials__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 16))
  {
    (*(void (**)(void))(*(_QWORD *)(v2 + 24) + 16))();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;

  }
  v6 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 16);
    v9 = v6;
    v13 = 134218240;
    v14 = v7;
    v15 = 2048;
    v16 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_1B2621000, v9, OS_LOG_TYPE_INFO, "Returning credentials from lazy cache <%p>, which contain %lu items", (uint8_t *)&v13, 0x16u);

  }
  v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

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
  v7[2] = __65__WBSLazyURLCredentialCache_getCredentialsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E649B6B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __65__WBSLazyURLCredentialCache_getCredentialsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 16))
  {
    (*(void (**)(void))(*(_QWORD *)(v2 + 24) + 16))();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;

  }
  v6 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 16);
    v9 = v6;
    v12 = 134218240;
    v13 = v7;
    v14 = 2048;
    v15 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_1B2621000, v9, OS_LOG_TYPE_INFO, "Getting credentials from lazy cache <%p>, which contain %lu items", (uint8_t *)&v12, 0x16u);

  }
  v10 = *(_QWORD *)(a1 + 40);
  v11 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

}

@end
