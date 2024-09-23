@implementation WBSSystemNoteTakingLinkMetadataFetcher

+ (id)sharedFetcher
{
  if (sharedFetcher_onceToken != -1)
    dispatch_once(&sharedFetcher_onceToken, &__block_literal_global_43);
  return (id)sharedFetcher_sharedFetcher;
}

void __55__WBSSystemNoteTakingLinkMetadataFetcher_sharedFetcher__block_invoke()
{
  WBSSystemNoteTakingLinkMetadataFetcher *v0;
  void *v1;

  v0 = objc_alloc_init(WBSSystemNoteTakingLinkMetadataFetcher);
  v1 = (void *)sharedFetcher_sharedFetcher;
  sharedFetcher_sharedFetcher = (uint64_t)v0;

}

- (void)fetchMetadataForWebView:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v5 = a3;
  v6 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__24;
  v25 = __Block_byref_object_dispose__24;
  v26 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2050000000;
  v7 = (void *)getLPMetadataProviderClass_softClass_0;
  v30 = getLPMetadataProviderClass_softClass_0;
  v8 = MEMORY[0x1E0C809B0];
  if (!getLPMetadataProviderClass_softClass_0)
  {
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = (uint64_t)__getLPMetadataProviderClass_block_invoke_0;
    v18 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E54424C0;
    v19 = (void (*)(uint64_t))&v27;
    __getLPMetadataProviderClass_block_invoke_0((uint64_t)&v15);
    v7 = (void *)v28[3];
  }
  v9 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v27, 8);
  v10 = objc_alloc_init(v9);
  v15 = 0;
  v16 = (uint64_t)&v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1;
  v19 = __Block_byref_object_dispose__2;
  v20 = (id)MEMORY[0x1A85D45E4](v6);
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __77__WBSSystemNoteTakingLinkMetadataFetcher_fetchMetadataForWebView_completion___block_invoke;
  v14[3] = &unk_1E5446A58;
  v14[4] = &v15;
  v14[5] = &v21;
  v11 = (void *)MEMORY[0x1A85D45E4](v14);
  objc_msgSend(v10, "_startFetchingMetadataForWebView:isNonAppInitiated:completionHandler:", v5, 1, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v22[5];
  v22[5] = v12;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

}

void __77__WBSSystemNoteTakingLinkMetadataFetcher_fetchMetadataForWebView_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  __int128 v8;

  v3 = a2;
  if (v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXSystemNoteTaking();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __77__WBSSystemNoteTakingLinkMetadataFetcher_fetchMetadataForWebView_completion___block_invoke_cold_1(v4, v3);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__WBSSystemNoteTakingLinkMetadataFetcher_fetchMetadataForWebView_completion___block_invoke_3;
  block[3] = &unk_1E5446A30;
  v8 = *(_OWORD *)(a1 + 32);
  v7 = v3;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __77__WBSSystemNoteTakingLinkMetadataFetcher_fetchMetadataForWebView_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (id)linkContextPreviewForMetadata:(id)a3 image:(id)a4 selectedText:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v8)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2050000000;
    v10 = (void *)getLPImageClass_softClass_0;
    v19 = getLPImageClass_softClass_0;
    if (!getLPImageClass_softClass_0)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __getLPImageClass_block_invoke_0;
      v15[3] = &unk_1E54424C0;
      v15[4] = &v16;
      __getLPImageClass_block_invoke_0((uint64_t)v15);
      v10 = (void *)v17[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v16, 8);
    v12 = (void *)objc_msgSend([v11 alloc], "initWithPlatformImage:", v8);
    objc_msgSend(v7, "setImage:", v12);

  }
  if (v9)
    objc_msgSend(v7, "setSelectedText:", v9);
  objc_msgSend(v7, "dataRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __77__WBSSystemNoteTakingLinkMetadataFetcher_fetchMetadataForWebView_completion___block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1A840B000, v3, OS_LOG_TYPE_ERROR, "Fetching Link Presentation metadata failed: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
