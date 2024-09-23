@implementation TUMetadataCache

- (TUMetadataCache)initWithDataProviders:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  dispatch_queue_t v12;
  TUMetadataCache *v13;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "classIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_queue);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.%@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_BACKGROUND, 0);
  v10 = objc_claimAutoreleasedReturnValue();

  v11 = objc_retainAutorelease(v8);
  v12 = dispatch_queue_create((const char *)objc_msgSend(v11, "UTF8String"), v10);
  v13 = -[TUMetadataCache initWithQueue:dataProviders:](self, "initWithQueue:dataProviders:", v12, v5);

  return v13;
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

- (TUMetadataCache)initWithQueue:(id)a3 dataProviders:(id)a4
{
  id v7;
  id v8;
  TUMetadataCache *v9;
  TUMetadataCache *v10;
  uint64_t v11;
  NSArray *providers;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)TUMetadataCache;
  v9 = -[TUMetadataCache init](&v23, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    v11 = objc_msgSend(v8, "copy");
    providers = v10->_providers;
    v10->_providers = (NSArray *)v11;

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v13 = v10->_providers;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v17++), "setDelegate:", v10, (_QWORD)v19);
        }
        while (v15 != v17);
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v15);
    }

  }
  return v10;
}

- (id)metadataForDestinationID:(id)a3
{
  id v4;
  TUMetadataItem *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(TUMetadataItem);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[TUMetadataCache providers](self, "providers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "metadataForDestinationID:", v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          -[TUMetadataItem setMetadata:forProvider:](v5, "setMetadata:forProvider:", v11, objc_opt_class());

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (NSArray)providers
{
  return self->_providers;
}

- (void)updateCacheWithDestinationIDs:(id)a3
{
  -[TUMetadataCache updateCacheWithDestinationIDs:completion:](self, "updateCacheWithDestinationIDs:completion:", a3, 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (TUMetadataCache)init
{
  -[TUMetadataCache doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)updateCacheWithDestinationIDs:(id)a3 completion:(id)a4
{
  -[TUMetadataCache _updateCacheWithDestinationIDs:onlyEmptyProviders:completion:](self, "_updateCacheWithDestinationIDs:onlyEmptyProviders:completion:", a3, 0, a4);
}

- (void)updateCacheForEmptyDataProvidersWithDestinationIDs:(id)a3
{
  -[TUMetadataCache updateCacheForEmptyDataProvidersWithDestinationIDs:completion:](self, "updateCacheForEmptyDataProvidersWithDestinationIDs:completion:", a3, 0);
}

- (void)updateCacheForEmptyDataProvidersWithDestinationIDs:(id)a3 completion:(id)a4
{
  -[TUMetadataCache _updateCacheWithDestinationIDs:onlyEmptyProviders:completion:](self, "_updateCacheWithDestinationIDs:onlyEmptyProviders:completion:", a3, 1, a4);
}

- (void)_updateCacheWithDestinationIDs:(id)a3 onlyEmptyProviders:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(_QWORD);
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void (**v19)(_QWORD);
  id v20;
  _QWORD v21[5];
  void (**v22)(_QWORD);
  _QWORD block[5];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v6 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  if (objc_msgSend(v8, "count"))
  {
    v19 = v9;
    v10 = dispatch_group_create();
    v20 = v8;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[TUMetadataCache providers](self, "providers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v26;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v16);
          if (!v6 || objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v16), "isEmpty"))
          {
            -[TUMetadataCache queue](self, "queue", v19);
            v18 = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __80__TUMetadataCache__updateCacheWithDestinationIDs_onlyEmptyProviders_completion___block_invoke;
            block[3] = &unk_1E38A1388;
            block[4] = v17;
            v24 = v11;
            dispatch_group_async(v10, v18, block);

          }
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v14);
    }

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __80__TUMetadataCache__updateCacheWithDestinationIDs_onlyEmptyProviders_completion___block_invoke_9;
    v21[3] = &unk_1E38A1FC0;
    v9 = v19;
    v21[4] = self;
    v22 = v19;
    dispatch_group_notify(v10, MEMORY[0x1E0C80D38], v21);

    v8 = v20;
  }
  else if (v9)
  {
    v9[2](v9);
  }

}

void __80__TUMetadataCache__updateCacheWithDestinationIDs_onlyEmptyProviders_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  dispatch_time_t v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = dispatch_group_create();
  objc_msgSend(*(id *)(a1 + 32), "updateCacheWithDestinationIDs:withGroup:", *(_QWORD *)(a1 + 40), v2);
  v3 = dispatch_time(0, 500000000);
  if (dispatch_group_wait(v2, v3))
  {
    TUDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v6;
      v9 = 2048;
      v10 = 500;
      _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "%@ did not complete before the %llu millisecond timeout.", (uint8_t *)&v7, 0x16u);

    }
  }

}

void __80__TUMetadataCache__updateCacheWithDestinationIDs_onlyEmptyProviders_completion___block_invoke_9(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("com.apple.telephonyutilities.TUMetadataCacheDidFinishUpdatingNotification"), *(_QWORD *)(a1 + 32));

}

- (BOOL)isEmpty
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[TUMetadataCache providers](self, "providers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "isEmpty"))
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v17.receiver = self;
  v17.super_class = (Class)TUMetadataCache;
  -[TUMetadataCache description](&v17, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@"), v4);

  if (-[TUMetadataCache isEmpty](self, "isEmpty"))
  {
    objc_msgSend(v5, "appendFormat:", CFSTR(": <empty>"));
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[TUMetadataCache providers](self, "providers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if ((objc_msgSend(v11, "isEmpty") & 1) == 0)
            objc_msgSend(v5, "appendFormat:", CFSTR("\n\t%@"), v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v8);
    }

  }
  return (NSString *)v5;
}

- (void)dataProvider:(id)a3 requestedRefreshWithDestinationIDs:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  TUMetadataCache *v14;

  v6 = a3;
  v7 = a4;
  -[TUMetadataCache queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__TUMetadataCache_dataProvider_requestedRefreshWithDestinationIDs___block_invoke;
  block[3] = &unk_1E38A19B8;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __67__TUMetadataCache_dataProvider_requestedRefreshWithDestinationIDs___block_invoke(uint64_t a1)
{
  NSObject *v2;
  dispatch_time_t v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = dispatch_group_create();
  objc_msgSend(*(id *)(a1 + 32), "updateCacheWithDestinationIDs:withGroup:", *(_QWORD *)(a1 + 40), v2);
  v3 = dispatch_time(0, 5000000000);
  if (dispatch_group_wait(v2, v3))
  {
    TUDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v8 = v5;
      v9 = 2048;
      v10 = 5;
      _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Update (refresh) of data provider %@ did not complete before the %ld second timeout.", buf, 0x16u);
    }

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__TUMetadataCache_dataProvider_requestedRefreshWithDestinationIDs___block_invoke_20;
  block[3] = &unk_1E38A1360;
  block[4] = *(_QWORD *)(a1 + 48);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __67__TUMetadataCache_dataProvider_requestedRefreshWithDestinationIDs___block_invoke_20(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("com.apple.telephonyutilities.TUMetadataCacheDidFinishUpdatingNotification"), *(_QWORD *)(a1 + 32));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_providers, 0);
}

@end
