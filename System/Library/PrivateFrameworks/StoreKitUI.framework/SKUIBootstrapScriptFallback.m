@implementation SKUIBootstrapScriptFallback

+ (id)defaultCacheFolder
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v20;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        +[SKUIBootstrapScriptFallback defaultCacheFolder].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v10, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 0, &v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v20;

  if (!v11)
  {
    NSLog(CFSTR("*** Could not find caches directory, reason: %@"), v12);
    v13 = (void *)MEMORY[0x1E0C99E98];
    NSTemporaryDirectory();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fileURLWithPath:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "length"))
  {
    objc_msgSend(v11, "URLByAppendingPathComponent:", v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v17;
  }
  objc_msgSend(v11, "URLByAppendingPathComponent:", CFSTR("SKUIBootstrapScriptFallback"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)cacheFilenameForStoreFrontIdentifier:(id)a3
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        +[SKUIBootstrapScriptFallback cacheFilenameForStoreFrontIdentifier:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("_"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@.%@"), v12, CFSTR("v1"), CFSTR("js"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (SKUIBootstrapScriptFallback)initWithCacheFolder:(id)a3 filename:(id)a4
{
  id v7;
  id v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  SKUIBootstrapScriptFallback *v17;
  SKUIBootstrapScriptFallback *v18;
  uint64_t v19;
  NSString *cacheFilename;
  dispatch_queue_t v21;
  OS_dispatch_queue *queue;
  objc_super v24;

  v7 = a3;
  v8 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v9)
        -[SKUIBootstrapScriptFallback initWithCacheFolder:filename:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)SKUIBootstrapScriptFallback;
  v17 = -[SKUIBootstrapScriptFallback init](&v24, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_cacheFolder, a3);
    v19 = objc_msgSend(v8, "copy");
    cacheFilename = v18->_cacheFilename;
    v18->_cacheFilename = (NSString *)v19;

    v18->_maximumAge = 604800.0;
    v21 = dispatch_queue_create("SKUIBootstrapScriptFallback", 0);
    queue = v18->_queue;
    v18->_queue = (OS_dispatch_queue *)v21;

    -[SKUIBootstrapScriptFallback _createCacheDirectoriesIfNeeded](v18, "_createCacheDirectoriesIfNeeded");
  }

  return v18;
}

- (SKUIBootstrapScriptFallback)initWithFilename:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  SKUIBootstrapScriptFallback *v14;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIBootstrapScriptFallback initWithFilename:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_msgSend((id)objc_opt_class(), "defaultCacheFolder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SKUIBootstrapScriptFallback initWithCacheFolder:filename:](self, "initWithCacheFolder:filename:", v13, v4);

  return v14;
}

- (SKUIBootstrapScriptFallback)init
{
  -[SKUIBootstrapScriptFallback doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (int64_t)state
{
  NSObject *v3;
  NSObject *v4;
  int64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  -[SKUIBootstrapScriptFallback queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[SKUIBootstrapScriptFallback queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__SKUIBootstrapScriptFallback_state__block_invoke;
  v7[3] = &unk_1E73A0270;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __36__SKUIBootstrapScriptFallback_state__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_unsynchronizedState");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSURL)cachedFileLocation
{
  void *v3;
  void *v4;
  void *v5;

  -[SKUIBootstrapScriptFallback cacheFolder](self, "cacheFolder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIBootstrapScriptFallback cacheFilename](self, "cacheFilename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v5;
}

- (BOOL)isBagAvailable
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(MEMORY[0x1E0DAF660], "contextWithBagType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DDC1B8], "sharedCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLBagForContext:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)canFallbackForError:(id)a3
{
  id v4;
  int64_t v5;
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  BOOL v31;

  v4 = a3;
  v5 = -[SKUIBootstrapScriptFallback state](self, "state");
  if (v5)
  {
    if (v5 == -1)
      -[SKUIBootstrapScriptFallback invalidate](self, "invalidate");
    goto LABEL_22;
  }
  v6 = v4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        -[SKUIBootstrapScriptFallback canFallbackForError:].cold.2(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  objc_msgSend(v6, "domain");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CB32E8]) & 1) != 0)
  {
    v16 = objc_msgSend(v6, "code");

    if (v16 == -1001)
    {
LABEL_20:
      v31 = -[SKUIBootstrapScriptFallback isBagAvailable](self, "isBagAvailable");
      goto LABEL_23;
    }
  }
  else
  {

  }
  v17 = v6;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v18 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v18)
        -[SKUIBootstrapScriptFallback canFallbackForError:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);
    }
  }
  objc_msgSend(v17, "userInfo");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E0DAFA30]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "integerValue");

  objc_msgSend(v17, "domain");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v29, "isEqualToString:", *MEMORY[0x1E0DAFA28]) & 1) == 0)
  {

LABEL_22:
    v31 = 0;
    goto LABEL_23;
  }
  v30 = objc_msgSend(v17, "code");

  v31 = 0;
  if (v30 == 109 && v28 >= 500 && v28 <= 599)
    goto LABEL_20;
LABEL_23:

  return v31;
}

- (id)retrieveScript:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  -[SKUIBootstrapScriptFallback queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__101;
  v14 = __Block_byref_object_dispose__101;
  v15 = 0;
  -[SKUIBootstrapScriptFallback queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__SKUIBootstrapScriptFallback_retrieveScript___block_invoke;
  block[3] = &unk_1E73A9700;
  block[5] = &v10;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(v6, block);

  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_63);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __46__SKUIBootstrapScriptFallback_retrieveScript___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[2];
  _QWORD v18[2];
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_unsynchronizedState");
  if (v2)
  {
    if (!*(_QWORD *)(a1 + 48))
      return;
    if (v2 == -2)
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v19 = *MEMORY[0x1E0CB2D50];
      v20 = CFSTR("No cached script to retrieve.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      v5 = v15;
      v6 = 560145512;
    }
    else
    {
      if (v2 != -1)
        return;
      v3 = (void *)MEMORY[0x1E0CB35C8];
      v21 = *MEMORY[0x1E0CB2D50];
      v22[0] = CFSTR("Cached script too old to retrieve.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      v5 = v3;
      v6 = 1869374497;
    }
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("SKUIBootstrapScriptFallbackErrorDomain"), v6, v4);
    **(_QWORD **)(a1 + 48) = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(*(id *)(a1 + 32), "cachedFileLocation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v9 = objc_msgSend(v7, "initWithContentsOfURL:encoding:error:", v8, 4, &v16);
    v4 = v16;
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      if (*(_QWORD *)(a1 + 48))
      {
        v12 = (void *)MEMORY[0x1E0CB35C8];
        v13 = *MEMORY[0x1E0CB2D50];
        v17[0] = *MEMORY[0x1E0CB3388];
        v17[1] = v13;
        v18[0] = v4;
        v18[1] = CFSTR("Could not retrieve script.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("SKUIBootstrapScriptFallbackErrorDomain"), 561149042, v14);
        **(_QWORD **)(a1 + 48) = (id)objc_claimAutoreleasedReturnValue();

      }
    }
  }

}

uint64_t __46__SKUIBootstrapScriptFallback_retrieveScript___block_invoke_2()
{
  return +[SKUIMetricsAppLaunchEvent withPendingLaunchEvent:](SKUIMetricsAppLaunchEvent, "withPendingLaunchEvent:", &__block_literal_global_35);
}

uint64_t __46__SKUIBootstrapScriptFallback_retrieveScript___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUsedBootstrapFallback:", 1);
}

- (void)scriptEvaluated:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SKUIBootstrapScriptFallback *v9;

  v4 = a3;
  -[SKUIBootstrapScriptFallback queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__SKUIBootstrapScriptFallback_scriptEvaluated___block_invoke;
  v7[3] = &unk_1E739FD10;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __47__SKUIBootstrapScriptFallback_scriptEvaluated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "cachedFileLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v4 = objc_msgSend(v2, "writeToURL:atomically:encoding:error:", v3, 1, 4, &v6);
  v5 = v6;

  if ((v4 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "_logError:forOperation:", v5, CFSTR("writing new JS file to cache"));

}

- (void)invalidate
{
  NSObject *v3;
  _QWORD block[5];

  -[SKUIBootstrapScriptFallback queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__SKUIBootstrapScriptFallback_invalidate__block_invoke;
  block[3] = &unk_1E739FD38;
  block[4] = self;
  dispatch_async(v3, block);

}

void __41__SKUIBootstrapScriptFallback_invalidate__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  char v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  const char *v24;
  uint64_t v25;
  BOOL v26;
  id v27;
  _BOOL8 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  uint8_t v49[128];
  uint8_t buf[4];
  _BYTE v51[28];

  *(_QWORD *)&v51[12] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cacheFolder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  objc_msgSend(v2, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v3, 0, 1, &v48);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v48;

  if (!v4)
  {
    v27 = v5;
    if (os_variant_has_internal_content())
    {
      if (_os_feature_enabled_impl())
      {
        v28 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
        if (v28)
          __41__SKUIBootstrapScriptFallback_invalidate__block_invoke_cold_1(v28, v29, v30, v31, v32, v33, v34, v35);
      }
    }
    objc_msgSend(v27, "domain");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v36, "isEqualToString:", *MEMORY[0x1E0CB28A8]) & 1) != 0)
    {
      if (objc_msgSend(v27, "code") == 4)
      {

        goto LABEL_34;
      }
      v37 = objc_msgSend(v27, "code");

      if (v37 == 260)
        goto LABEL_34;
    }
    else
    {

    }
    objc_msgSend(*(id *)(a1 + 32), "_logError:forOperation:", v27, CFSTR("getting listing of cached JS files for invalidation"));
    goto LABEL_34;
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v7)
  {
    v8 = v7;
    v39 = a1;
    v40 = v4;
    v41 = v5;
    v9 = 0;
    v10 = *(_QWORD *)v45;
    v38 = v51;
    v11 = *MEMORY[0x1E0CB28A8];
    v12 = "com.apple.StoreKitUI";
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        v14 = v9;
        if (*(_QWORD *)v45 != v10)
          objc_enumerationMutation(v6);
        v15 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
        v43 = v9;
        v16 = objc_msgSend(v2, "removeItemAtURL:error:", v15, &v43, v38);
        v9 = v43;

        if ((v16 & 1) == 0)
        {
          v17 = v9;
          if (os_variant_has_internal_content()
            && _os_feature_enabled_impl()
            && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          {
            __41__SKUIBootstrapScriptFallback_invalidate__block_invoke_cold_2(buf, v38);
          }
          objc_msgSend(v17, "domain");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v18, "isEqualToString:", v11) & 1) == 0)
          {

LABEL_28:
            objc_msgSend(*(id *)(v39 + 32), "_logError:forOperation:", v17, CFSTR("invalidating cached JS files"));
            goto LABEL_29;
          }
          if (objc_msgSend(v17, "code") == 4)
          {

          }
          else
          {
            v42 = v9;
            v19 = v8;
            v20 = v10;
            v21 = v2;
            v22 = v11;
            v23 = v6;
            v24 = v12;
            v25 = objc_msgSend(v17, "code");

            v26 = v25 == 260;
            v12 = v24;
            v6 = v23;
            v11 = v22;
            v2 = v21;
            v10 = v20;
            v8 = v19;
            v9 = v42;
            if (!v26)
              goto LABEL_28;
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      if (v8)
        continue;
      break;
    }
LABEL_29:

    v4 = v40;
    v5 = v41;
  }

LABEL_34:
}

- (void)_createCacheDirectoriesIfNeeded
{
  NSObject *v3;
  _QWORD block[5];

  -[SKUIBootstrapScriptFallback queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__SKUIBootstrapScriptFallback__createCacheDirectoriesIfNeeded__block_invoke;
  block[3] = &unk_1E739FD38;
  block[4] = self;
  dispatch_async(v3, block);

}

void __62__SKUIBootstrapScriptFallback__createCacheDirectoriesIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cacheFolder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v4 = objc_msgSend(v2, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v6);
  v5 = v6;

  if ((v4 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_logError:forOperation:", v5, CFSTR("creating cache directory structure"));

}

- (int64_t)_unsynchronizedState
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  int64_t v13;
  id v15;
  id v16;

  -[SKUIBootstrapScriptFallback queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SKUIBootstrapScriptFallback cachedFileLocation](self, "cachedFileLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v5 = *MEMORY[0x1E0C998D8];
  v15 = 0;
  v6 = objc_msgSend(v4, "getResourceValue:forKey:error:", &v16, v5, &v15);
  v7 = v16;
  v8 = v15;

  if (v6)
  {
    -[SKUIBootstrapScriptFallback cachedFileLocation](self, "cachedFileLocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeCachedResourceValueForKey:", v5);

    objc_msgSend(v7, "timeIntervalSinceNow");
    v11 = fabs(v10);
    -[SKUIBootstrapScriptFallback maximumAge](self, "maximumAge");
    if (v11 <= v12)
      v13 = 0;
    else
      v13 = -1;
  }
  else
  {
    v13 = -2;
  }

  return v13;
}

- (void)_logError:(id)a3 forOperation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0DAF538], "sharedConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldLog");
  if (objc_msgSend(v7, "shouldLogToDisk"))
    v9 = v8 | 2;
  else
    v9 = v8;
  objc_msgSend(v7, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    v9 &= 2u;
  if (!v9)
    goto LABEL_9;
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v14 = 138412802;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = 2112;
  v17 = v6;
  v18 = 2112;
  v19 = v5;
  LODWORD(v13) = 32;
  v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v12, 4, &v14, v13);
    v10 = objc_claimAutoreleasedReturnValue();
    free(v12);
    SSFileLog();
LABEL_9:

  }
}

- (void)_runWhenBackgroundWorkFinished:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;

  v4 = a3;
  -[SKUIBootstrapScriptFallback queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  -[SKUIBootstrapScriptFallback queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_barrier_async(v6, v4);

}

- (BOOL)_setCacheAge:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  id *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  -[SKUIBootstrapScriptFallback queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  -[SKUIBootstrapScriptFallback queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__SKUIBootstrapScriptFallback__setCacheAge_error___block_invoke;
  v11[3] = &unk_1E73A9768;
  v11[4] = self;
  v12 = v6;
  v13 = &v15;
  v14 = a4;
  v9 = v6;
  dispatch_sync(v8, v11);

  LOBYTE(self) = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return (char)self;
}

void __50__SKUIBootstrapScriptFallback__setCacheAge_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "cachedFileLocation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *MEMORY[0x1E0C998D8];
  v7 = 0;
  v5 = objc_msgSend(v2, "setResourceValue:forKey:error:", v3, v4, &v7);
  v6 = v7;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v5;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) && *(_QWORD *)(a1 + 56))
    **(_QWORD **)(a1 + 56) = objc_retainAutorelease(v6);

}

- (NSURL)cacheFolder
{
  return self->_cacheFolder;
}

- (NSString)cacheFilename
{
  return self->_cacheFilename;
}

- (double)maximumAge
{
  return self->_maximumAge;
}

- (void)setMaximumAge:(double)a3
{
  self->_maximumAge = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cacheFilename, 0);
  objc_storeStrong((id *)&self->_cacheFolder, 0);
}

+ (void)defaultCacheFolder
{
  OUTLINED_FUNCTION_1();
}

+ (void)cacheFilenameForStoreFrontIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithCacheFolder:(uint64_t)a3 filename:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithFilename:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)canFallbackForError:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)canFallbackForError:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void __41__SKUIBootstrapScriptFallback_invalidate__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void __41__SKUIBootstrapScriptFallback_invalidate__block_invoke_cold_2(uint8_t *buf, _QWORD *a2)
{
  *(_DWORD *)buf = 136446210;
  *a2 = "NSErrorIsFileNotFound";
}

@end
