@implementation TUMetadataCacheDataProvider

void __58__TUMetadataCacheDataProvider_setObject_forDestinationID___block_invoke(uint64_t a1)
{
  void *v2;
  TUOptionalObject *v3;

  v3 = -[TUOptionalObject initWithValue:]([TUOptionalObject alloc], "initWithValue:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "providerCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));

}

- (TUMetadataCacheDataProvider)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  dispatch_queue_t v9;
  TUMetadataCacheDataProvider *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "classIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_queue);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = objc_retainAutorelease(v6);
  v9 = dispatch_queue_create((const char *)objc_msgSend(v8, "UTF8String"), v7);
  v10 = -[TUMetadataCacheDataProvider initWithQueue:](self, "initWithQueue:", v9);

  return v10;
}

- (TUMetadataCacheDataProvider)initWithQueue:(id)a3
{
  id v5;
  TUMetadataCacheDataProvider *v6;
  TUMetadataCacheDataProvider *v7;
  uint64_t v8;
  NSMutableDictionary *providerCache;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUMetadataCacheDataProvider;
  v6 = -[TUMetadataCacheDataProvider init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    providerCache = v7->_providerCache;
    v7->_providerCache = (NSMutableDictionary *)v8;

  }
  return v7;
}

+ (id)classIdentifier
{
  objc_class *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (objc_class *)objc_opt_class();
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TUMetadataCacheDataProvider queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__TUMetadataCacheDataProvider_setDelegate___block_invoke;
  v7[3] = &unk_1E38A1388;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)setObject:(id)a3 forDestinationID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[TUMetadataCacheDataProvider queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__TUMetadataCacheDataProvider_setObject_forDestinationID___block_invoke;
  block[3] = &unk_1E38A19B8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (id)metadataForDestinationID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6;
  v16 = __Block_byref_object_dispose__6;
  v17 = 0;
  -[TUMetadataCacheDataProvider queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__TUMetadataCacheDataProvider_metadataForDestinationID___block_invoke;
  block[3] = &unk_1E38A1D60;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

void __56__TUMetadataCacheDataProvider_metadataForDestinationID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "providerCache");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (NSMutableDictionary)providerCache
{
  return self->_providerCache;
}

id __43__TUMetadataCacheDataProvider_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
}

- (TUMetadataCacheDataProviderDelegate)delegate
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__6;
  v11 = __Block_byref_object_dispose__6;
  v12 = 0;
  -[TUMetadataCacheDataProvider queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__TUMetadataCacheDataProvider_delegate__block_invoke;
  v6[3] = &unk_1E38A1CE8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (TUMetadataCacheDataProviderDelegate *)v4;
}

void __39__TUMetadataCacheDataProvider_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

- (void)refresh
{
  NSObject *v3;
  _QWORD block[5];

  -[TUMetadataCacheDataProvider queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__TUMetadataCacheDataProvider_refresh__block_invoke;
  block[3] = &unk_1E38A1360;
  block[4] = self;
  dispatch_async(v3, block);

}

void __38__TUMetadataCacheDataProvider_refresh__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  id v6;

  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "providerCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_invalidateCache");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "dataProvider:requestedRefreshWithDestinationIDs:", *(_QWORD *)(a1 + 32), v6);

}

- (void)invalidateCache
{
  NSObject *v3;
  _QWORD block[5];

  -[TUMetadataCacheDataProvider queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__TUMetadataCacheDataProvider_invalidateCache__block_invoke;
  block[3] = &unk_1E38A1360;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __46__TUMetadataCacheDataProvider_invalidateCache__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateCache");
}

- (void)_invalidateCache
{
  NSObject *v3;
  id v4;

  -[TUMetadataCacheDataProvider queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[TUMetadataCacheDataProvider providerCache](self, "providerCache");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

}

- (BOOL)isEmpty
{
  TUMetadataCacheDataProvider *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  -[TUMetadataCacheDataProvider queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__TUMetadataCacheDataProvider_isEmpty__block_invoke;
  v5[3] = &unk_1E38A1CE8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __38__TUMetadataCacheDataProvider_isEmpty__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "providerCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "count") == 0;

}

- (id)description
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__6;
  v11 = __Block_byref_object_dispose__6;
  v12 = 0;
  -[TUMetadataCacheDataProvider queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__TUMetadataCacheDataProvider_description__block_invoke;
  v6[3] = &unk_1E38A1CE8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __42__TUMetadataCacheDataProvider_description__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "providerCache");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@: %@"), v3, v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerCache, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
