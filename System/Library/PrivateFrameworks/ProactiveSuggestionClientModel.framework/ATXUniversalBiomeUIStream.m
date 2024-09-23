@implementation ATXUniversalBiomeUIStream

- (void)donateGenericUIEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ATXUniversalBiomeUIStream _innerStreamForConsumerSubType:](self, "_innerStreamForConsumerSubType:", objc_msgSend(v4, "consumerSubTypeForUIStream"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendEvent:", v4);

}

- (id)_innerStreamForConsumerSubType:(unsigned __int8)a3
{
  void *v4;
  void *v5;

  -[ATXUniversalBiomeUIStream _streamIdForConsumerSubType:](self, "_streamIdForConsumerSubType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXUniversalBiomeUIStream _innerStreamForStreamId:](self, "_innerStreamForStreamId:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_innerStreamForStreamId:(id)a3
{
  id v4;
  void *v5;
  int v6;
  _PASLock *lock;
  id v8;
  NSObject *v9;
  _QWORD v11[4];
  id v12;
  ATXUniversalBiomeUIStream *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  -[ATXUniversalBiomeUIStream streamIdentifiers](self, "streamIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__6;
    v19 = __Block_byref_object_dispose__6;
    v20 = 0;
    lock = self->_lock;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __53__ATXUniversalBiomeUIStream__innerStreamForStreamId___block_invoke;
    v11[3] = &unk_1E57CF1F8;
    v14 = &v15;
    v12 = v4;
    v13 = self;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v11);
    v8 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    __atxlog_handle_blending();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[ATXUniversalBiomeUIStream _innerStreamForStreamId:].cold.1((uint64_t)self, (uint64_t)v4, v9);

    v8 = 0;
  }

  return v8;
}

- (id)streamIdentifiers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[ATXUniversalBiomeUIStream _validUIStreamConsumerSubTypes](self, "_validUIStreamConsumerSubTypes", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        -[ATXUniversalBiomeUIStream _streamIdForConsumerSubType:](self, "_streamIdForConsumerSubType:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "unsignedIntValue"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (id)_streamIdForConsumerSubType:(unsigned __int8)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("blendingUI%@"), v5);

  return v6;
}

- (id)_validUIStreamConsumerSubTypes
{
  return &unk_1E57EC700;
}

- (ATXUniversalBiomeUIStream)init
{
  return -[ATXUniversalBiomeUIStream initWithStoreConfig:](self, "initWithStoreConfig:", 0);
}

void __53__ATXUniversalBiomeUIStream__innerStreamForStreamId___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id *v9;

  v9 = a2;
  objc_msgSend(v9[1], "objectForKey:", a1[4]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D02790]), "initWithPrivateStreamIdentifier:storeConfig:", a1[4], *(_QWORD *)(a1[5] + 8));
    v7 = *(_QWORD *)(a1[6] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    objc_msgSend(v9[1], "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[4]);
  }

}

- (id)genericEventPublisherFromStartTime:(double)a3 consumerSubType:(unsigned __int8)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  -[ATXUniversalBiomeUIStream _innerStreamForConsumerSubType:](self, "_innerStreamForConsumerSubType:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "publisherFromStartTime:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C9AA60], "bpsPublisher");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (ATXUniversalBiomeUIStream)initWithStoreConfig:(id)a3
{
  id v4;
  ATXUniversalBiomeUIStream *v5;
  BMStoreConfig *v6;
  BMStoreConfig *storeConfig;
  id v8;
  void *v9;
  uint64_t v10;
  _PASLock *lock;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXUniversalBiomeUIStream;
  v5 = -[ATXUniversalBiomeUIStream init](&v13, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = (BMStoreConfig *)v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D024C0], "atx_storeConfig");
      v6 = (BMStoreConfig *)objc_claimAutoreleasedReturnValue();
    }
    storeConfig = v5->_storeConfig;
    v5->_storeConfig = v6;

    v8 = objc_alloc(MEMORY[0x1E0D815F0]);
    v9 = (void *)objc_opt_new();
    v10 = objc_msgSend(v8, "initWithGuardedData:", v9);
    lock = v5->_lock;
    v5->_lock = (_PASLock *)v10;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_storeConfig, 0);
}

- (id)genericEventPublisherFromStartTime:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[6];

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02790]), "initWithPrivateStreamIdentifier:storeConfig:", CFSTR("homeScreen"), self->_storeConfig);
  objc_msgSend(v5, "publisherFromStartTime:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXUniversalBiomeUIStream streamIdentifiers](self, "streamIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__ATXUniversalBiomeUIStream_genericEventPublisherFromStartTime___block_invoke;
  v11[3] = &unk_1E57CF0E8;
  v11[4] = self;
  *(double *)&v11[5] = a3;
  objc_msgSend(v7, "_pas_mappedArrayWithTransform:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "orderedMergeWithOthers:comparator:", v8, &__block_literal_global_11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __64__ATXUniversalBiomeUIStream_genericEventPublisherFromStartTime___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_innerStreamForStreamId:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "publisherFromStartTime:", *(double *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __64__ATXUniversalBiomeUIStream_genericEventPublisherFromStartTime___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "timestamp");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "timestamp");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

- (id)deprecatedGenericEventPublisherFromStartTime:(double)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02790]), "initWithPrivateStreamIdentifier:storeConfig:", CFSTR("homeScreen"), self->_storeConfig);
  objc_msgSend(v4, "publisherFromStartTime:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_innerStreamForStreamId:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v6;
  v9 = 2112;
  v10 = a2;
  _os_log_fault_impl(&dword_1AA841000, a3, OS_LOG_TYPE_FAULT, "%@ - could not create BMStoreStream for streamId: %@", (uint8_t *)&v7, 0x16u);

}

@end
