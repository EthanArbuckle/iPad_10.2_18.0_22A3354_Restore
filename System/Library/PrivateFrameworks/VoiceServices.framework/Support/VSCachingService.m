@implementation VSCachingService

- (VSCachingService)initWithCache:(id)a3 shortTermMemory:(id)a4
{
  id v7;
  id v8;
  VSCachingService *v9;
  VSCachingService *v10;
  NSLock *v11;
  NSLock *threadLock;
  uint64_t v13;
  NSMutableArray *inMemoryCaches;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *cachingQueue;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)VSCachingService;
  v9 = -[VSCachingService init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cacheStore, a3);
    v11 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    threadLock = v10->_threadLock;
    v10->_threadLock = v11;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    inMemoryCaches = v10->_inMemoryCaches;
    v10->_inMemoryCaches = (NSMutableArray *)v13;

    objc_storeStrong((id *)&v10->_shortTermCache, a4);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("com.apple.voiced.cachingQueue", v15);
    cachingQueue = v10->_cachingQueue;
    v10->_cachingQueue = (OS_dispatch_queue *)v16;

  }
  return v10;
}

- (id)compressAudio:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  __int128 v14;
  uint64_t v16;
  _OWORD v17[2];
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t *v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  _OWORD v34[2];
  uint64_t v35;
  uint8_t buf[4];
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BEC0DB8]);
  if (v3)
  {
    objc_msgSend(v3, "asbd");
  }
  else
  {
    v35 = 0;
    memset(v34, 0, sizeof(v34));
  }
  v5 = (void *)objc_msgSend(v4, "initWithSourceASBD:", v34);
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__3308;
  v28 = __Block_byref_object_dispose__3309;
  v8 = MEMORY[0x24BDAC760];
  v29 = 0;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __34__VSCachingService_compressAudio___block_invoke;
  v23[3] = &unk_24DD8EC68;
  v23[4] = &v24;
  objc_msgSend(v5, "setErrorHandler:", v23);
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __34__VSCachingService_compressAudio___block_invoke_2;
  v19[3] = &unk_24DD8EC90;
  v9 = v6;
  v20 = v9;
  v22 = &v30;
  v10 = v7;
  v21 = v10;
  objc_msgSend(v5, "setOpusDataHandler:", v19);
  objc_msgSend(v5, "beginEncoding");
  objc_msgSend(v3, "audioData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeChunk:", v11);

  objc_msgSend(v5, "endEncoding");
  if (v25[5])
  {
    VSGetLogDefault();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v16 = v25[5];
      *(_DWORD *)buf = 138412290;
      v37 = v16;
      _os_log_error_impl(&dword_21AA84000, v12, OS_LOG_TYPE_ERROR, "Error converting audio during caching. %@", buf, 0xCu);
    }

    v13 = 0;
  }
  else
  {
    v13 = objc_alloc_init(MEMORY[0x24BEC0D78]);
    v14 = *(_OWORD *)(MEMORY[0x24BEC0E50] + 16);
    v17[0] = *MEMORY[0x24BEC0E50];
    v17[1] = v14;
    v18 = *(_QWORD *)(MEMORY[0x24BEC0E50] + 32);
    objc_msgSend(v13, "setAsbd:", v17);
    objc_msgSend(v13, "setAudioData:", v9);
    objc_msgSend(v13, "setPacketDescriptions:", v10);
    objc_msgSend(v13, "setPacketCount:", v31[3]);
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v13;
}

- (id)compressStreamAudio:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  __int128 v14;
  uint64_t v16;
  _OWORD v17[2];
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t *v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  _OWORD v37[2];
  uint64_t v38;
  uint8_t buf[4];
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BEC0DB8]);
  if (v3)
  {
    objc_msgSend(v3, "asbd");
  }
  else
  {
    v38 = 0;
    memset(v37, 0, sizeof(v37));
  }
  v5 = (void *)objc_msgSend(v4, "initWithSourceASBD:", v37);
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__3308;
  v31 = __Block_byref_object_dispose__3309;
  v8 = MEMORY[0x24BDAC760];
  v32 = 0;
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __40__VSCachingService_compressStreamAudio___block_invoke;
  v26[3] = &unk_24DD8EC68;
  v26[4] = &v27;
  objc_msgSend(v5, "setErrorHandler:", v26);
  v22[0] = v8;
  v22[1] = 3221225472;
  v22[2] = __40__VSCachingService_compressStreamAudio___block_invoke_2;
  v22[3] = &unk_24DD8EC90;
  v9 = v6;
  v23 = v9;
  v25 = &v33;
  v10 = v7;
  v24 = v10;
  objc_msgSend(v5, "setOpusDataHandler:", v22);
  objc_msgSend(v5, "beginEncoding");
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __40__VSCachingService_compressStreamAudio___block_invoke_3;
  v19[3] = &unk_24DD8ECB8;
  v11 = v5;
  v20 = v11;
  v21 = &v27;
  objc_msgSend(v3, "enumerateAudioWithBlock:", v19);
  objc_msgSend(v11, "endEncoding");
  if (v28[5])
  {
    VSGetLogDefault();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v16 = v28[5];
      *(_DWORD *)buf = 138412290;
      v40 = v16;
      _os_log_error_impl(&dword_21AA84000, v12, OS_LOG_TYPE_ERROR, "Error converting stream audio during caching. %@", buf, 0xCu);
    }

    v13 = 0;
  }
  else
  {
    v13 = objc_alloc_init(MEMORY[0x24BEC0D78]);
    v14 = *(_OWORD *)(MEMORY[0x24BEC0E50] + 16);
    v17[0] = *MEMORY[0x24BEC0E50];
    v17[1] = v14;
    v18 = *(_QWORD *)(MEMORY[0x24BEC0E50] + 32);
    objc_msgSend(v13, "setAsbd:", v17);
    objc_msgSend(v13, "setAudioData:", v9);
    objc_msgSend(v13, "setPacketDescriptions:", v10);
    objc_msgSend(v13, "setPacketCount:", v34[3]);
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v13;
}

- (void)_enqueueCacheWithHash:(id)a3 audioObject:(id)a4 timingInfo:(id)a5 voiceKey:(id)a6 voiceResourceKey:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  int v21;
  NSObject *v22;
  double v23;
  double v24;
  const char *v25;
  NSObject *v26;
  NSObject *v27;
  uint32_t v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  VSSpeechCacheAudio *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  VSSpeechCacheAudio *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  VSCachingService *v44;
  VSSpeechCacheAudio *v45;
  id v46;
  uint8_t buf[4];
  double v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (v14 && v15 && v16)
  {
    objc_msgSend(MEMORY[0x24BEC0DF0], "standardInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "disableCache");

    if (v21)
    {
      VSGetLogDefault();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21AA84000, v22, OS_LOG_TYPE_INFO, "Caching is disabled. Skipping caching.", buf, 2u);
      }
      goto LABEL_30;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        VSGetLogDefault();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v25 = "Unrecognized audio object, skip caching";
          v27 = v22;
          v28 = 2;
          goto LABEL_18;
        }
        goto LABEL_30;
      }
    }
    objc_msgSend(v15, "duration");
    v24 = v23;
    if (v23 < 0.5)
    {
      VSGetLogDefault();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v48 = v24;
        v25 = "Audio duration is too short: %.2f second, skip caching";
LABEL_15:
        v27 = v22;
        v28 = 12;
LABEL_18:
        _os_log_error_impl(&dword_21AA84000, v27, OS_LOG_TYPE_ERROR, v25, buf, v28);
        goto LABEL_30;
      }
      goto LABEL_30;
    }
    VSGetLogDefault();
    v26 = objc_claimAutoreleasedReturnValue();
    v22 = v26;
    if (v24 > 60.0)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v48 = v24;
        v25 = "Audio duration is too long: %.2f second, skip caching";
        goto LABEL_15;
      }
LABEL_30:

      goto LABEL_31;
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AA84000, v22, OS_LOG_TYPE_INFO, "Compressing audio for caching.", buf, 2u);
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[VSCachingService compressStreamAudio:](self, "compressStreamAudio:", v15);
      v29 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v30 = 0;
        goto LABEL_27;
      }
      -[VSCachingService compressAudio:](self, "compressAudio:", v15);
      v29 = objc_claimAutoreleasedReturnValue();
    }
    v30 = (void *)v29;
LABEL_27:
    VSGetLogDefault();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AA84000, v31, OS_LOG_TYPE_INFO, "Audio compressed for caching.", buf, 2u);
    }

    v32 = -[VSSpeechCacheAudio initWithKey:audio:wordTimingInfo:voiceKey:voiceResourceKey:]([VSSpeechCacheAudio alloc], "initWithKey:audio:wordTimingInfo:voiceKey:voiceResourceKey:", v14, v30, v16, v17, v18);
    -[VSCachingService threadLock](self, "threadLock");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "lock");

    -[VSCachingService inMemoryCaches](self, "inMemoryCaches");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v32);

    -[VSCachingService threadLock](self, "threadLock");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "unlock");

    -[VSCachingService cachingQueue](self, "cachingQueue");
    v36 = objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __102__VSCachingService__enqueueCacheWithHash_audioObject_timingInfo_voiceKey_voiceResourceKey_completion___block_invoke;
    v38[3] = &unk_24DD8ECE0;
    v39 = v14;
    v40 = v30;
    v41 = v16;
    v42 = v17;
    v43 = v18;
    v44 = self;
    v45 = v32;
    v46 = v19;
    v37 = v32;
    v22 = v30;
    dispatch_async(v36, v38);

    goto LABEL_30;
  }
LABEL_31:

}

- (id)inMemoryCacheForHash:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BEC0DF0], "standardInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "disableCache");

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    -[VSCachingService _inMemoryCacheForHash:](self, "_inMemoryCacheForHash:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)_inMemoryCacheForHash:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[VSCachingService threadLock](self, "threadLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[VSCachingService inMemoryCaches](self, "inMemoryCaches", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "key");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v4, "isEqualToString:", v11);

        if (v12)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  -[VSCachingService threadLock](self, "threadLock");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "unlock");

  return v7;
}

- (id)onDiskCacheForHash:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BEC0DF0], "standardInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "disableCache");

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    -[VSCachingService _onDiskCacheForHash:](self, "_onDiskCacheForHash:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)_onDiskCacheForHash:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[VSCachingService cacheStore](self, "cacheStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cacheDataForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)fetchCacheForTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  char isKindOfClass;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  int v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "speechCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[VSCachingService cacheStore](self, "cacheStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "request");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "request");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "languageCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "request");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "voiceName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preinstalledCacheForText:language:name:", v8, v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSpeechCache:", v13);

    objc_msgSend(v4, "speechCache");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      VSGetLogDefault();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "speechCache");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "key");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = 138412290;
        v60 = v17;
        _os_log_impl(&dword_21AA84000, v15, OS_LOG_TYPE_DEFAULT, "Preinstalled cached synthesis %@ is found.", (uint8_t *)&v59, 0xCu);

      }
      objc_msgSend(v4, "instrumentMetrics");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setIsCacheHitFromDisk:", 1);

      objc_msgSend(v4, "speechCache");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "voiceKey");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "instrumentMetrics");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setVoiceAssetKey:", v20);

      objc_msgSend(v4, "speechCache");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "voiceResourceKey");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "instrumentMetrics");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setVoiceResourceAssetKey:", v23);

    }
    objc_msgSend(MEMORY[0x24BEC0DF0], "standardInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "disableCache");

    if ((v26 & 1) == 0)
    {
      objc_msgSend(v4, "taskHash");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "speechCache");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v28)
      {
        -[VSCachingService _inMemoryCacheForHash:](self, "_inMemoryCacheForHash:", v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setSpeechCache:", v29);

        objc_msgSend(v4, "speechCache");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          VSGetLogDefault();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v4, "speechCache");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "key");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = 138412290;
            v60 = v33;
            _os_log_impl(&dword_21AA84000, v31, OS_LOG_TYPE_DEFAULT, "In-memory cached synthesis %@ is found.", (uint8_t *)&v59, 0xCu);

          }
          objc_msgSend(v4, "instrumentMetrics");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setIsCacheHitFromMemory:", 1);

        }
      }
      objc_msgSend(v4, "speechCache");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v35)
      {
        -[VSCachingService _onDiskCacheForHash:](self, "_onDiskCacheForHash:", v27);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setSpeechCache:", v36);

        objc_msgSend(v4, "speechCache");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          VSGetLogDefault();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v4, "speechCache");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "key");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = 138412290;
            v60 = v40;
            _os_log_impl(&dword_21AA84000, v38, OS_LOG_TYPE_DEFAULT, "On-disk cached synthesis %@ is found.", (uint8_t *)&v59, 0xCu);

          }
          objc_msgSend(v4, "instrumentMetrics");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setIsCacheHitFromDisk:", 1);

        }
      }
      objc_msgSend(v4, "speechCache");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v42)
      {
        objc_msgSend(v4, "request");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "text");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSCachingService popShortTermCacheForHash:](self, "popShortTermCacheForHash:", v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setSpeechCache:", v45);

        objc_msgSend(v4, "speechCache");
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        if (v46)
        {
          VSGetLogDefault();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v4, "request");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "logText");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = 138412290;
            v60 = v49;
            _os_log_impl(&dword_21AA84000, v47, OS_LOG_TYPE_DEFAULT, "Short-term cached synthesis is found for text '%@'", (uint8_t *)&v59, 0xCu);

          }
        }
      }
      objc_msgSend(v4, "speechCache");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v4, "speechCache");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "timingInfos");
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v53)
        {
          objc_msgSend(v52, "timingInfos");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setTimingInfos:", v54);

        }
        objc_msgSend(v52, "audio");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "duration");
        v57 = v56;
        objc_msgSend(v4, "instrumentMetrics");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setAudioDuration:", v57);

      }
    }
  }

}

- (void)enqueueShortTermCacheWithHash:(id)a3 audio:(id)a4 timingInfo:(id)a5 voiceKey:(id)a6 voiceResourceKey:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  VSSpeechCacheAudio *v20;
  void *v21;
  NSObject *v22;
  id v23;
  _QWORD block[4];
  id v25;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = -[VSSpeechCacheAudio initWithKey:audio:wordTimingInfo:voiceKey:voiceResourceKey:]([VSSpeechCacheAudio alloc], "initWithKey:audio:wordTimingInfo:voiceKey:voiceResourceKey:", v19, v18, v17, v16, v15);

  -[VSCachingService shortTermCache](self, "shortTermCache");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKey:timeToLive:", v20, v19, 10.0);

  -[VSCachingService cachingQueue](self, "cachingQueue");
  v22 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __104__VSCachingService_enqueueShortTermCacheWithHash_audio_timingInfo_voiceKey_voiceResourceKey_completion___block_invoke;
  block[3] = &unk_24DD8ED08;
  v25 = v14;
  v23 = v14;
  dispatch_async(v22, block);

}

- (id)shortTermCacheForHash:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[VSCachingService shortTermCache](self, "shortTermCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)popShortTermCacheForHash:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[VSCachingService shortTermCacheForHash:](self, "shortTermCacheForHash:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[VSCachingService shortTermCache](self, "shortTermCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v4);

  }
  return v5;
}

- (NSLock)threadLock
{
  return self->_threadLock;
}

- (void)setThreadLock:(id)a3
{
  objc_storeStrong((id *)&self->_threadLock, a3);
}

- (NSMutableArray)inMemoryCaches
{
  return self->_inMemoryCaches;
}

- (void)setInMemoryCaches:(id)a3
{
  objc_storeStrong((id *)&self->_inMemoryCaches, a3);
}

- (VSSpeechCache)cacheStore
{
  return self->_cacheStore;
}

- (void)setCacheStore:(id)a3
{
  objc_storeStrong((id *)&self->_cacheStore, a3);
}

- (VSShortTermCache)shortTermCache
{
  return self->_shortTermCache;
}

- (void)setShortTermCache:(id)a3
{
  objc_storeStrong((id *)&self->_shortTermCache, a3);
}

- (OS_dispatch_queue)cachingQueue
{
  return self->_cachingQueue;
}

- (void)setCachingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_cachingQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachingQueue, 0);
  objc_storeStrong((id *)&self->_shortTermCache, 0);
  objc_storeStrong((id *)&self->_cacheStore, 0);
  objc_storeStrong((id *)&self->_inMemoryCaches, 0);
  objc_storeStrong((id *)&self->_threadLock, 0);
}

uint64_t __104__VSCachingService_enqueueShortTermCacheWithHash_audio_timingInfo_voiceKey_voiceResourceKey_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __102__VSCachingService__enqueueCacheWithHash_audioObject_timingInfo_voiceKey_voiceResourceKey_completion___block_invoke(uint64_t a1)
{
  VSSpeechCacheAudio *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = -[VSSpeechCacheAudio initWithKey:audio:wordTimingInfo:voiceKey:voiceResourceKey:]([VSSpeechCacheAudio alloc], "initWithKey:audio:wordTimingInfo:voiceKey:voiceResourceKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 72), "cacheStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addCache:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    VSGetLogDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_error_impl(&dword_21AA84000, v5, OS_LOG_TYPE_ERROR, "Can't add audio cache, error: %@", (uint8_t *)&v10, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 72), "threadLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lock");

  objc_msgSend(*(id *)(a1 + 72), "inMemoryCaches");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", *(_QWORD *)(a1 + 80));

  objc_msgSend(*(id *)(a1 + 72), "threadLock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

  v9 = *(_QWORD *)(a1 + 88);
  if (v9)
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v4);

}

void __40__VSCachingService_compressStreamAudio___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __40__VSCachingService_compressStreamAudio___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v7;
  id v8;

  v7 = *(void **)(a1 + 32);
  v8 = a4;
  objc_msgSend(v7, "appendData:", a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += a3;
  objc_msgSend(*(id *)(a1 + 40), "appendData:", v8);

}

uint64_t __40__VSCachingService_compressStreamAudio___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "encodeChunk:", a2);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    *a5 = 1;
  return result;
}

void __34__VSCachingService_compressAudio___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __34__VSCachingService_compressAudio___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v7;
  id v8;

  v7 = *(void **)(a1 + 32);
  v8 = a4;
  objc_msgSend(v7, "appendData:", a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += a3;
  objc_msgSend(*(id *)(a1 + 40), "appendData:", v8);

}

+ (id)standardService
{
  if (standardService_onceToken != -1)
    dispatch_once(&standardService_onceToken, &__block_literal_global_3321);
  return (id)standardService___standardService;
}

void __35__VSCachingService_standardService__block_invoke()
{
  VSCachingService *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = [VSCachingService alloc];
  +[VSSpeechCache defaultCacheStore](VSSpeechCache, "defaultCacheStore");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[VSShortTermCache sharedInstance](VSShortTermCache, "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[VSCachingService initWithCache:shortTermMemory:](v0, "initWithCache:shortTermMemory:", v4, v1);
  v3 = (void *)standardService___standardService;
  standardService___standardService = v2;

}

@end
