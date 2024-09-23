@implementation TRIBiomeDataStreamProvider

- (TRIBiomeDataStreamProvider)init
{
  TRIBiomeDataStreamProvider *v2;
  uint64_t v3;
  OS_dispatch_queue *providerQueue;
  NSMutableDictionary *v5;
  NSMutableDictionary *streamIdentifierstoSubscribedSinks;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TRIBiomeDataStreamProvider;
  v2 = -[TRIBiomeDataStreamProvider init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "com.apple.trial.biome-provider", 17);
    v3 = objc_claimAutoreleasedReturnValue();
    providerQueue = v2->_providerQueue;
    v2->_providerQueue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    streamIdentifierstoSubscribedSinks = v2->_streamIdentifierstoSubscribedSinks;
    v2->_streamIdentifierstoSubscribedSinks = v5;

    v2->_shouldSubscribeWithWaking = 1;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[TRIBiomeDataStreamProvider unsubscribeAllDataStreams](self, "unsubscribeAllDataStreams");
  v3.receiver = self;
  v3.super_class = (Class)TRIBiomeDataStreamProvider;
  -[TRIBiomeDataStreamProvider dealloc](&v3, sel_dealloc);
}

- (void)readLastDataStreamEventForIdentifier:(id)a3 eventHandler:(id)a4
{
  void (**v5)(id, _QWORD, id);
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  void (**v15)(id, _QWORD, id);
  _QWORD v16[4];
  void (**v17)(id, _QWORD, id);
  id v18;

  v5 = (void (**)(id, _QWORD, id))a4;
  v6 = a3;
  BiomeLibrary();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v7, "streamWithIdentifier:error:", v6, &v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v18;
  if (v9)
  {
    v5[2](v5, 0, v9);
  }
  else
  {
    objc_msgSend(v8, "publisher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "last");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __80__TRIBiomeDataStreamProvider_readLastDataStreamEventForIdentifier_eventHandler___block_invoke;
    v16[3] = &unk_1E3BFFBF0;
    v17 = v5;
    v14[0] = v12;
    v14[1] = 3221225472;
    v14[2] = __80__TRIBiomeDataStreamProvider_readLastDataStreamEventForIdentifier_eventHandler___block_invoke_5;
    v14[3] = &unk_1E3BFFC18;
    v15 = v17;
    v13 = (id)objc_msgSend(v11, "sinkWithCompletion:receiveInput:", v16, v14);

  }
}

void __80__TRIBiomeDataStreamProvider_readLastDataStreamEventForIdentifier_eventHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "state") == 1)
  {
    TRILogCategory_ClientFramework();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "error");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_error_impl(&dword_19B89C000, v4, OS_LOG_TYPE_ERROR, "failed to to read Biome stream: %@", (uint8_t *)&v8, 0xCu);

    }
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);

  }
}

void __80__TRIBiomeDataStreamProvider_readLastDataStreamEventForIdentifier_eventHandler___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "json");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)readLastDataStreamEventForIdentifier:(id)a3 withFilter:(id)a4 eventHandler:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD, id);
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  void (**v19)(id, _QWORD, id);
  _QWORD v20[4];
  void (**v21)(id, _QWORD, id);
  _QWORD v22[4];
  id v23;
  id v24;

  v7 = a4;
  v8 = (void (**)(id, _QWORD, id))a5;
  v9 = a3;
  BiomeLibrary();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v10, "streamWithIdentifier:error:", v9, &v24);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v24;
  if (v12)
  {
    v8[2](v8, 0, v12);
  }
  else
  {
    objc_msgSend(v11, "publisher");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __91__TRIBiomeDataStreamProvider_readLastDataStreamEventForIdentifier_withFilter_eventHandler___block_invoke;
    v22[3] = &unk_1E3BFFC40;
    v23 = v7;
    objc_msgSend(v13, "filterWithIsIncluded:", v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "last");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v14;
    v20[1] = 3221225472;
    v20[2] = __91__TRIBiomeDataStreamProvider_readLastDataStreamEventForIdentifier_withFilter_eventHandler___block_invoke_2;
    v20[3] = &unk_1E3BFFBF0;
    v21 = v8;
    v18[0] = v14;
    v18[1] = 3221225472;
    v18[2] = __91__TRIBiomeDataStreamProvider_readLastDataStreamEventForIdentifier_withFilter_eventHandler___block_invoke_9;
    v18[3] = &unk_1E3BFFC18;
    v19 = v21;
    v17 = (id)objc_msgSend(v16, "sinkWithCompletion:receiveInput:", v20, v18);

  }
}

uint64_t __91__TRIBiomeDataStreamProvider_readLastDataStreamEventForIdentifier_withFilter_eventHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "json");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v4, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v6;
}

void __91__TRIBiomeDataStreamProvider_readLastDataStreamEventForIdentifier_withFilter_eventHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "state") == 1)
  {
    TRILogCategory_ClientFramework();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "error");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_error_impl(&dword_19B89C000, v4, OS_LOG_TYPE_ERROR, "failed to to read Biome stream: %@", (uint8_t *)&v8, 0xCu);

    }
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);

  }
}

void __91__TRIBiomeDataStreamProvider_readLastDataStreamEventForIdentifier_withFilter_eventHandler___block_invoke_9(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "json");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)subscribeDataStreamForIdentifier:(id)a3 eventHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *providerQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  providerQueue = self->_providerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__TRIBiomeDataStreamProvider_subscribeDataStreamForIdentifier_eventHandler___block_invoke;
  block[3] = &unk_1E3BFFC68;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(providerQueue, block);

}

uint64_t __76__TRIBiomeDataStreamProvider_subscribeDataStreamForIdentifier_eventHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_subscribeForStreamIdentifier:eventHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_subscribeForStreamIdentifier:(id)a3 eventHandler:(id)a4
{
  void (**v6)(id, _QWORD, id);
  NSObject *providerQueue;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSMutableDictionary *streamIdentifierstoSubscribedSinks;
  void *v22;
  void *v23;
  NSObject *v24;
  NSMutableDictionary *v25;
  void *v26;
  _QWORD v27[4];
  void (**v28)(id, _QWORD, id);
  _QWORD v29[4];
  void (**v30)(id, _QWORD, id);
  id v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD, id))a4;
  providerQueue = self->_providerQueue;
  v8 = a3;
  dispatch_assert_queue_V2(providerQueue);
  BiomeLibrary();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  objc_msgSend(v9, "streamWithIdentifier:error:", v8, &v31);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v31;
  if (v11)
  {
    v6[2](v6, 0, v11);
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v10, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("com.apple.trial.%@"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    TRILogCategory_ClientFramework();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v14;
      _os_log_impl(&dword_19B89C000, v15, OS_LOG_TYPE_DEFAULT, "Subscribing to events from Biome stream: %@", buf, 0xCu);
    }

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D025E0]), "initWithIdentifier:targetQueue:waking:", v14, self->_providerQueue, self->_shouldSubscribeWithWaking);
    objc_msgSend(v10, "DSLPublisher");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "subscribeOn:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __73__TRIBiomeDataStreamProvider__subscribeForStreamIdentifier_eventHandler___block_invoke;
    v29[3] = &unk_1E3BFFBF0;
    v30 = v6;
    v27[0] = v19;
    v27[1] = 3221225472;
    v27[2] = __73__TRIBiomeDataStreamProvider__subscribeForStreamIdentifier_eventHandler___block_invoke_14;
    v27[3] = &unk_1E3BFFC18;
    v28 = v30;
    objc_msgSend(v18, "sinkWithCompletion:receiveInput:", v29, v27);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    streamIdentifierstoSubscribedSinks = self->_streamIdentifierstoSubscribedSinks;
    objc_msgSend(v10, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](streamIdentifierstoSubscribedSinks, "objectForKeyedSubscript:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      TRILogCategory_ClientFramework();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v14;
        _os_log_impl(&dword_19B89C000, v24, OS_LOG_TYPE_DEFAULT, "Subscribed sink already exists. Replacing: %@", buf, 0xCu);
      }

    }
    v25 = self->_streamIdentifierstoSubscribedSinks;
    objc_msgSend(v10, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v20, v26);

  }
}

void __73__TRIBiomeDataStreamProvider__subscribeForStreamIdentifier_eventHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "state") == 1)
  {
    TRILogCategory_ClientFramework();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "error");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_error_impl(&dword_19B89C000, v4, OS_LOG_TYPE_ERROR, "failed to to read Biome stream: %@", (uint8_t *)&v8, 0xCu);

    }
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);

  }
}

void __73__TRIBiomeDataStreamProvider__subscribeForStreamIdentifier_eventHandler___block_invoke_14(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "json");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)unsubscribeAllDataStreams
{
  NSObject *providerQueue;
  _QWORD block[5];

  providerQueue = self->_providerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__TRIBiomeDataStreamProvider_unsubscribeAllDataStreams__block_invoke;
  block[3] = &unk_1E3BFE828;
  block[4] = self;
  dispatch_sync(providerQueue, block);
}

uint64_t __55__TRIBiomeDataStreamProvider_unsubscribeAllDataStreams__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unsubscribeAllDataStreams");
}

- (void)_unsubscribeAllDataStreams
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_providerQueue);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = self->_streamIdentifierstoSubscribedSinks;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_streamIdentifierstoSubscribedSinks, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7), (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "cancel");

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)setShouldSubscribeWithWaking:(BOOL)a3
{
  self->_shouldSubscribeWithWaking = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamIdentifierstoSubscribedSinks, 0);
  objc_storeStrong((id *)&self->_providerQueue, 0);
}

@end
