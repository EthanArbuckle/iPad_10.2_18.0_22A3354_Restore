@implementation VSPrewarmService

- (VSPrewarmService)init
{
  VSPrewarmService *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *prewarmQueue;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VSPrewarmService;
  v2 = -[VSPrewarmService init](&v8, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.voiced.prewarmQueue", v3);
    prewarmQueue = v2->_prewarmQueue;
    v2->_prewarmQueue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel_handleVoiceSelectionPurge_, CFSTR("com.apple.voiceservices.notification.voice-purge"), 0);

  }
  return v2;
}

- (void)handleVoiceSelectionPurge:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  objc_msgSend(a3, "object");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "voicePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSPrewarmService cachedEngine](self, "cachedEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "voicePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if (v7)
    -[VSPrewarmService unloadEngine](self, "unloadEngine");

}

- (void)setActiveSessionCount:(int64_t)a3
{
  self->_activeSessionCount = a3 & ~(a3 >> 63);
  if (a3 <= 0)
    -[VSPrewarmService unloadEngine](self, "unloadEngine");
}

- (void)prewarmWithRequest:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  VSPrewarmService *v9;

  v4 = a3;
  -[VSPrewarmService prewarmQueue](self, "prewarmQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__VSPrewarmService_prewarmWithRequest___block_invoke;
  block[3] = &unk_24DD8EDB0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (id)_cachedEngineForVoice:(id)a3 resources:(id)a4
{
  id v6;
  NSObject *prewarmQueue;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  VSSpeechEngine *v14;

  v6 = a4;
  prewarmQueue = self->_prewarmQueue;
  v8 = a3;
  dispatch_assert_queue_V2(prewarmQueue);
  -[VSSpeechEngine voicePath](self->_cachedEngine, "voicePath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "voicePath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "isEqualToString:", v10) & 1) == 0)
  {

    goto LABEL_5;
  }
  -[VSVoiceResourceAsset key](self->_loadedResources, "key");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "key");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToString:", v12);

  if (!v13)
  {
LABEL_5:
    v14 = 0;
    goto LABEL_6;
  }
  v14 = self->_cachedEngine;
LABEL_6:

  return v14;
}

- (id)cachedEngineForVoice:(id)a3 resources:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3085;
  v21 = __Block_byref_object_dispose__3086;
  v22 = 0;
  -[VSPrewarmService prewarmQueue](self, "prewarmQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __51__VSPrewarmService_cachedEngineForVoice_resources___block_invoke;
  v13[3] = &unk_24DD8EA90;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, v13);

  v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

- (id)_engineForVoice:(id)a3 resources:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  id v37;
  void *v39;
  VSPrewarmService *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[2];
  uint8_t buf[4];
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_prewarmQueue);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(v7, "resourceMimeTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
  if (v9)
  {
    v10 = v9;
    v40 = self;
    v11 = *(_QWORD *)v42;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v42 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v7, "resourceMimeTypes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v15, "isEqualToString:", CFSTR("gryphon_frontend")))
        {
          objc_msgSend(v7, "searchPathURL");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "path");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stringByAppendingPathComponent:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
      if (v10)
        continue;
      break;
    }
    v16 = 0;
LABEL_11:
    self = v40;
  }
  else
  {
    v16 = 0;
  }

  v19 = objc_alloc(MEMORY[0x24BEC0DE8]);
  objc_msgSend(v6, "voicePath");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithVoicePath:resourcePath:", v20, v16);

  if (v21)
  {
    if (v7)
      -[VSPrewarmService _loadVoiceResources:forEngine:](self, "_loadVoiceResources:forEngine:", v7, v21);
    v22 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v6, "voicePath");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *MEMORY[0x24BEC0EC8];
    v45[0] = v23;
    v45[1] = v24;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "fileURLWithPathComponents:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "path");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "fileExistsAtPath:", v28);

    if (v29)
    {
      VSGetLogDefault();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_21AA84000, v30, OS_LOG_TYPE_DEBUG, "Voice specific resources found.", buf, 2u);
      }

      v31 = objc_alloc_init(MEMORY[0x24BEC0E30]);
      v32 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(v6, "voicePath");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "fileURLWithPath:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setSearchPathURL:", v34);

      -[VSPrewarmService _loadVoiceResources:forEngine:](self, "_loadVoiceResources:forEngine:", v31, v21);
    }
    v35 = v21;
  }
  else
  {
    VSGetLogDefault();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "voicePath");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v47 = v39;
      _os_log_error_impl(&dword_21AA84000, v36, OS_LOG_TYPE_ERROR, "Can't create engine with path '%@'", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BEC0DA0], "sharedManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (id)objc_msgSend(v26, "purgeAsset:", v6);
  }

  return v21;
}

- (id)loadEngineForVoice:(id)a3 resources:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3085;
  v21 = __Block_byref_object_dispose__3086;
  v22 = 0;
  -[VSPrewarmService prewarmQueue](self, "prewarmQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __49__VSPrewarmService_loadEngineForVoice_resources___block_invoke;
  v13[3] = &unk_24DD8EA90;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, v13);

  v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

- (void)unloadCachedEngineWithVoice:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[VSPrewarmService prewarmQueue](self, "prewarmQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__VSPrewarmService_unloadCachedEngineWithVoice___block_invoke;
  block[3] = &unk_24DD8EDB0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)_loadVoiceResources:(id)a3 forEngine:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  NSObject *v20;
  id v21;
  float v22;
  float v23;
  float v24;
  __int128 v25;
  id v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v26 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_prewarmQueue);
  objc_msgSend(v6, "searchPathURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v27 = v6;
  objc_msgSend(v6, "resourceList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v29;
    *(_QWORD *)&v11 = 138412546;
    v25 = v11;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v8, "stringByAppendingPathComponent:", v15, v25);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "fileExistsAtPath:", v16);

        if ((v18 & 1) != 0)
        {
          objc_msgSend(v27, "resourceMimeTypes");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKeyedSubscript:", v15);
          v20 = objc_claimAutoreleasedReturnValue();

          if ((-[NSObject isEqualToString:](v20, "isEqualToString:", CFSTR("VoiceServices/config")) & 1) == 0
            && (-[NSObject isEqualToString:](v20, "isEqualToString:", CFSTR("gryphon_frontend")) & 1) == 0)
          {
            v21 = (id)objc_msgSend(v26, "loadResourceAtPath:mimeType:error:", v16, v20, 0);
          }
        }
        else
        {
          VSGetLogDefault();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v25;
            v33 = v15;
            v34 = 2112;
            v35 = v16;
            _os_log_error_impl(&dword_21AA84000, v20, OS_LOG_TYPE_ERROR, "Specified resource file '%@' does not exist at: '%@'", buf, 0x16u);
          }
        }

      }
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v12);
  }

  objc_msgSend(v27, "pitch");
  if (v22 == 0.0)
    objc_msgSend(v26, "pitch");
  objc_msgSend(v26, "setPitch:");
  objc_msgSend(v27, "rate");
  if (v23 == 0.0)
    objc_msgSend(v26, "rate");
  objc_msgSend(v26, "setRate:");
  objc_msgSend(v27, "volume");
  if (v24 == 0.0)
    objc_msgSend(v26, "volume");
  objc_msgSend(v26, "setVolume:");

}

- (void)unloadEngine
{
  NSObject *v3;
  _QWORD block[5];

  -[VSPrewarmService prewarmQueue](self, "prewarmQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__VSPrewarmService_unloadEngine__block_invoke;
  block[3] = &unk_24DD8EBB0;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)waitUntilPrewarmFinish
{
  dispatch_sync((dispatch_queue_t)self->_prewarmQueue, &__block_literal_global_36);
}

- (int64_t)activeSessionCount
{
  return self->_activeSessionCount;
}

- (VSSpeechEngine)cachedEngine
{
  return self->_cachedEngine;
}

- (void)setCachedEngine:(id)a3
{
  objc_storeStrong((id *)&self->_cachedEngine, a3);
}

- (VSVoiceResourceAsset)loadedResources
{
  return self->_loadedResources;
}

- (void)setLoadedResources:(id)a3
{
  objc_storeStrong((id *)&self->_loadedResources, a3);
}

- (OS_dispatch_queue)prewarmQueue
{
  return self->_prewarmQueue;
}

- (void)setPrewarmQueue:(id)a3
{
  objc_storeStrong((id *)&self->_prewarmQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prewarmQueue, 0);
  objc_storeStrong((id *)&self->_loadedResources, 0);
  objc_storeStrong((id *)&self->_cachedEngine, 0);
}

uint64_t __32__VSPrewarmService_unloadEngine__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCachedEngine:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setLoadedResources:", 0);
}

void __48__VSPrewarmService_unloadCachedEngineWithVoice___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (v2)
  {
    objc_msgSend(v2, "voicePath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "voicePath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "isEqualToString:", v4);

    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 16);
      *(_QWORD *)(v6 + 16) = 0;

      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(v8 + 24);
      *(_QWORD *)(v8 + 24) = 0;

    }
  }
}

void __49__VSPrewarmService_loadEngineForVoice_resources___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[2];
  if (v3)
  {
    objc_msgSend(v2, "_cachedEngineForVoice:resources:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);

    if (v4 == v5)
      return;
    v2 = *(_QWORD **)(a1 + 32);
    v3 = (void *)v2[2];
  }
  v2[2] = 0;

  objc_msgSend(*(id *)(a1 + 32), "_engineForVoice:resources:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (objc_msgSend(MEMORY[0x24BEC0D80], "lowInactiveMemory"))
  {
    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (v9)
    {
      v10 = *(_QWORD *)(a1 + 32);
      if (*(uint64_t *)(v10 + 8) > 0)
        goto LABEL_10;
    }
  }
  if ((objc_msgSend(MEMORY[0x24BEC0D80], "lowInactiveMemory") & 1) == 0)
  {
    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (v9)
    {
      v10 = *(_QWORD *)(a1 + 32);
LABEL_10:
      objc_storeStrong((id *)(v10 + 16), v9);
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 48));
    }
  }
}

void __51__VSPrewarmService_cachedEngineForVoice_resources___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_cachedEngineForVoice:resources:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __39__VSPrewarmService_prewarmWithRequest___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  VSSpeechSpeakTask *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  int v31;
  NSObject *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  VSGetLogDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v27 = *(NSObject **)(a1 + 32);
    v31 = 138412290;
    v32 = v27;
    _os_log_debug_impl(&dword_21AA84000, v2, OS_LOG_TYPE_DEBUG, "Prewarming: Invoked with request: '%@'", (uint8_t *)&v31, 0xCu);
  }

  kdebug_trace();
  mach_absolute_time();
  +[OspreyTTSService sharedInstance](OspreyTTSService, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "initializeDeviceAuthenticationSessionWithCompletion:", &__block_literal_global_21);

  v4 = -[VSSpeechSpeakTask initWithRequest:]([VSSpeechSpeakTask alloc], "initWithRequest:", *(_QWORD *)(a1 + 32));
  -[VSSpeechSpeakTask fetchVoiceAsset](v4, "fetchVoiceAsset");
  -[VSSpeechSpeakTask fetchVoiceResource](v4, "fetchVoiceResource");
  -[VSSpeechSpeakTask error](v4, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    VSGetLogDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[VSSpeechSpeakTask error](v4, "error");
      v7 = objc_claimAutoreleasedReturnValue();
      v31 = 138412290;
      v32 = v7;
      _os_log_error_impl(&dword_21AA84000, v6, OS_LOG_TYPE_ERROR, "Unable to prewarm, error: %@", (uint8_t *)&v31, 0xCu);
LABEL_19:

    }
  }
  else
  {
    v8 = *(void **)(a1 + 40);
    -[VSSpeechSpeakTask voiceSelection](v4, "voiceSelection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask voiceResource](v4, "voiceResource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_cachedEngineForVoice:resources:", v9, v10);
    v6 = objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v11 = *(_QWORD *)(a1 + 40);
      v12 = *(void **)(v11 + 16);
      *(_QWORD *)(v11 + 16) = 0;

      v13 = *(void **)(a1 + 40);
      -[VSSpeechSpeakTask voiceSelection](v4, "voiceSelection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSpeechSpeakTask voiceResource](v4, "voiceResource");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_engineForVoice:resources:", v14, v15);
      v6 = objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        VSGetLogDefault();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          -[VSSpeechSpeakTask voiceSelection](v4, "voiceSelection");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "voicePath");
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = 138412290;
          v32 = v30;
          _os_log_error_impl(&dword_21AA84000, v7, OS_LOG_TYPE_ERROR, "Can't prewarm engine with path '%@'", (uint8_t *)&v31, 0xCu);

        }
        v6 = 0;
        goto LABEL_19;
      }
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 16), v6);
      -[VSSpeechSpeakTask voiceResource](v4, "voiceResource");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(a1 + 40);
      v18 = *(void **)(v17 + 24);
      *(_QWORD *)(v17 + 24) = v16;

      objc_msgSend(*(id *)(a1 + 32), "languageCode");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (id)objc_msgSend(CFSTR("Prewarm textify emoji"), "vs_textifyEmojiWithLanguage:", v19);

    }
    -[NSObject preheat](v6, "preheat");
    mach_absolute_time();
    VSGetLogDefault();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      VSAbsoluteTimeToSecond();
      v31 = 134217984;
      v32 = v22;
      _os_log_impl(&dword_21AA84000, v21, OS_LOG_TYPE_INFO, "Prewarm finished. Latency: %.3f", (uint8_t *)&v31, 0xCu);
    }

    VSGetLogDefault();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v28 = *(NSObject **)(a1 + 32);
      v31 = 138412290;
      v32 = v28;
      _os_log_debug_impl(&dword_21AA84000, v23, OS_LOG_TYPE_DEBUG, "Prewarming: Completed with request: '%@'", (uint8_t *)&v31, 0xCu);
    }

    kdebug_trace();
    if (objc_msgSend(MEMORY[0x24BEC0D80], "lowInactiveMemory"))
    {
      v24 = *(_QWORD *)(a1 + 40);
      if (!*(_QWORD *)(v24 + 8))
      {
        v25 = *(void **)(v24 + 16);
        *(_QWORD *)(v24 + 16) = 0;

        v26 = *(_QWORD *)(a1 + 40);
        v7 = *(NSObject **)(v26 + 24);
        *(_QWORD *)(v26 + 24) = 0;
        goto LABEL_19;
      }
    }
  }

}

void __39__VSPrewarmService_prewarmWithRequest___block_invoke_19(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  VSGetLogDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v2;
      _os_log_error_impl(&dword_21AA84000, v4, OS_LOG_TYPE_ERROR, "Unable to initialize Device Authentication session: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_21AA84000, v4, OS_LOG_TYPE_INFO, "Device Authentication session is initialized", (uint8_t *)&v5, 2u);
  }

}

+ (id)sharedService
{
  if (sharedService_onceToken_3115 != -1)
    dispatch_once(&sharedService_onceToken_3115, &__block_literal_global_3116);
  return (id)sharedService___prewarmService;
}

void __33__VSPrewarmService_sharedService__block_invoke()
{
  VSPrewarmService *v0;
  void *v1;

  v0 = objc_alloc_init(VSPrewarmService);
  v1 = (void *)sharedService___prewarmService;
  sharedService___prewarmService = (uint64_t)v0;

}

@end
