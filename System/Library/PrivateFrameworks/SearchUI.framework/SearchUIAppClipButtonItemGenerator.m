@implementation SearchUIAppClipButtonItemGenerator

- (void)generateSearchUIButtonItemsWithSFButtonItem:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "command");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "sharedCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __93__SearchUIAppClipButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke;
  v11[3] = &unk_1EA1F8750;
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v8, "getObjectForKey:completionHandler:", v7, v11);

}

void __93__SearchUIAppClipButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke(uint64_t a1, void *a2)
{
  SearchUIButtonItem *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "BOOLValue"))
  {
    v3 = -[SearchUIButtonItem initWithSFButtonItem:]([SearchUIButtonItem alloc], "initWithSFButtonItem:", *(_QWORD *)(a1 + 32));
    v4 = *(_QWORD *)(a1 + 40);
    v6[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t))(v4 + 16))(v4, v5, 1);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 1);
  }
}

+ (id)sharedCache
{
  if (sharedCache_onceToken_1 != -1)
    dispatch_once(&sharedCache_onceToken_1, &__block_literal_global_37);
  return (id)sharedCache_cache;
}

void __49__SearchUIAppClipButtonItemGenerator_sharedCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedCache_cache;
  sharedCache_cache = v0;

}

- (id)itemsToBatchPreFetchForRowModel:(id)a3
{
  return (id)objc_msgSend(a3, "requestAppClipObjects");
}

- (TLKAsyncCache)cacheToPrewarm
{
  return (TLKAsyncCache *)objc_msgSend((id)objc_opt_class(), "sharedCache");
}

@end
