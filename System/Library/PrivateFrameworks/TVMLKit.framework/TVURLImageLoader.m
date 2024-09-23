@implementation TVURLImageLoader

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_36);
  return (id)sharedInstance_sSharedInstance;
}

void __34__TVURLImageLoader_sharedInstance__block_invoke()
{
  TVURLImageLoader *v0;
  void *v1;

  v0 = objc_alloc_init(TVURLImageLoader);
  v1 = (void *)sharedInstance_sSharedInstance;
  sharedInstance_sSharedInstance = (uint64_t)v0;

}

- (TVURLImageLoader)init
{
  TVURLImageLoader *v2;
  void *v3;
  uint64_t v4;
  NSURLSession *session;
  id v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *processingQueue;
  uint64_t v9;
  NSMutableDictionary *loadOptionsByID;
  uint64_t v11;
  NSMutableDictionary *loadIDsByURL;
  uint64_t v13;
  NSMutableDictionary *taskOptionsByURL;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)TVURLImageLoader;
  v2 = -[TVURLImageLoader init](&v16, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHTTPMaximumConnectionsPerHost:", 4);
    objc_msgSend(v3, "setHTTPShouldUsePipelining:", 1);
    objc_msgSend(v3, "setWaitsForConnectivity:", 0);
    objc_msgSend(v3, "set_timingDataOptions:", 1);
    objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:delegate:delegateQueue:", v3, v2, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    session = v2->_session;
    v2->_session = (NSURLSession *)v4;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("TVURLImageLoader (%p) processing queue"), v2);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = dispatch_queue_create((const char *)objc_msgSend(v6, "cStringUsingEncoding:", 4), 0);
    processingQueue = v2->_processingQueue;
    v2->_processingQueue = (OS_dispatch_queue *)v7;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    loadOptionsByID = v2->_loadOptionsByID;
    v2->_loadOptionsByID = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    loadIDsByURL = v2->_loadIDsByURL;
    v2->_loadIDsByURL = (NSMutableDictionary *)v11;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    taskOptionsByURL = v2->_taskOptionsByURL;
    v2->_taskOptionsByURL = (NSMutableDictionary *)v13;

  }
  return v2;
}

- (void)_executeOnProcessingQueue:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[TVURLImageLoader processingQueue](self, "processingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__TVURLImageLoader__executeOnProcessingQueue___block_invoke;
  block[3] = &unk_24EB87088;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __46__TVURLImageLoader__executeOnProcessingQueue___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

- (id)URLForObject:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v3, "url");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
LABEL_7:

  return v5;
}

- (id)imageKeyForObject:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "absoluteString");
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v5 = (void *)v4;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "identifier");
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v6 = (void *)TVMLKitImageLogObject;
  if (os_log_type_enabled((os_log_t)TVMLKitImageLogObject, OS_LOG_TYPE_DEBUG))
    -[TVURLImageLoader imageKeyForObject:].cold.1(v6);
  v5 = 0;
LABEL_9:
  objc_msgSend(v5, "tv_SHA256String");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  TVURLImageLoader *v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a7;
  v13 = a8;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v52 = self;
    -[TVURLImageLoader session](self, "session");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dataTaskWithURL:", v11);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    if (v17)
      goto LABEL_3;
  }
  else
  {
    v26 = v15;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v44 = (void *)TVMLKitImageLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitImageLogObject, OS_LOG_TYPE_DEBUG))
        -[TVURLImageLoader loadImageForObject:scaleToSize:cropToFit:imageDirection:requestLoader:completionHandler:].cold.1(v44);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, 0);
      v28 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, id))v13 + 2))(v13, 0, 0, 0, 0, v28);
      v17 = 0;
      v25 = 0;
      goto LABEL_23;
    }
    v51 = v11;
    v52 = self;
    v47 = v14;
    v48 = v13;
    v49 = v12;
    v29 = v11;
    v30 = objc_alloc(MEMORY[0x24BDD16B0]);
    objc_msgSend(v29, "url");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v30, "initWithURL:", v31);

    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    objc_msgSend(v29, "headers");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v61;
      do
      {
        v37 = 0;
        do
        {
          if (*(_QWORD *)v61 != v36)
            objc_enumerationMutation(v33);
          v38 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * v37);
          objc_msgSend(v29, "headers");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "objectForKey:", v38);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setValue:forHTTPHeaderField:", v40, v38);

          ++v37;
        }
        while (v35 != v37);
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
      }
      while (v35);
    }

    -[TVURLImageLoader session](v52, "session");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "dataTaskWithRequest:", v32);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "decrypter");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v26;
    if (v42)
    {
      objc_msgSend(v29, "decrypter");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKey:", v43, CFSTR("TVURLImageLoaderTaskDecryptorKey"));

    }
    v13 = v48;
    v12 = v49;
    v14 = v47;
    v11 = v51;
    if (v17)
    {
LABEL_3:
      v50 = v11;
      objc_msgSend(v17, "originalRequest");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "URL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "description");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "setObject:forKey:", v21, CFSTR("TVURLImageLoaderOptionsIDKey"));
      objc_msgSend(v14, "setObject:forKey:", v19, CFSTR("TVURLImageLoaderOptionsURLKey"));
      if (v13)
      {
        v22 = (void *)objc_msgSend(v13, "copy");
        objc_msgSend(v14, "setObject:forKey:", v22, CFSTR("TVURLImageLoaderOptionsCompletionHandlerKey"));

      }
      objc_msgSend(v15, "setObject:forKey:", v17, CFSTR("TVURLImageLoaderTaskKey"));
      objc_msgSend(v12, "recordForResource:withInitiator:", 3, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
        objc_msgSend(v15, "setObject:forKey:", v23, CFSTR("TVURLImageLoaderOptionsRequestRecordKey"));
      objc_msgSend(MEMORY[0x24BDBCEC8], "data");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v24, CFSTR("TVURLImageLoaderTaskReceivedDataKey"));

      v53[0] = MEMORY[0x24BDAC760];
      v53[1] = 3221225472;
      v53[2] = __108__TVURLImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke;
      v53[3] = &unk_24EB870B0;
      v25 = v21;
      v54 = v25;
      v55 = v14;
      v56 = v19;
      v17 = v17;
      v57 = v17;
      v26 = v15;
      v58 = v15;
      v59 = v23;
      v27 = v23;
      v28 = v19;
      -[TVURLImageLoader _executeOnProcessingQueue:](v52, "_executeOnProcessingQueue:", v53);

      v11 = v50;
LABEL_23:

      goto LABEL_24;
    }
  }
  v26 = v15;
  v25 = 0;
LABEL_24:
  v45 = v25;

  return v45;
}

void __108__TVURLImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a2;
  v4 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(v3, "loadOptionsByID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 32));

  if (os_log_type_enabled((os_log_t)TVMLKitImageLogObject, OS_LOG_TYPE_DEBUG))
    __108__TVURLImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke_cold_2();
  objc_msgSend(v3, "loadIDsByURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "loadIDsByURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, *(_QWORD *)(a1 + 48));

  }
  objc_msgSend(v7, "addObject:", *(_QWORD *)(a1 + 32));
  if (objc_msgSend(v7, "count") == 1)
  {
    v9 = (void *)TVMLKitImageLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitImageLogObject, OS_LOG_TYPE_DEBUG))
      __108__TVURLImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke_cold_1(a1, v9);
    v10 = (void *)objc_msgSend(*(id *)(a1 + 64), "copy");
    objc_msgSend(v3, "taskOptionsByURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 56), "resume");
    v12 = *(void **)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 56), "originalRequest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "willSendRequest:", v13);

  }
}

- (void)cancelLoad:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __31__TVURLImageLoader_cancelLoad___block_invoke;
    v5[3] = &unk_24EB870D8;
    v6 = v4;
    -[TVURLImageLoader _executeOnProcessingQueue:](self, "_executeOnProcessingQueue:", v5);

  }
}

void __31__TVURLImageLoader_cancelLoad___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = a2;
  objc_msgSend(v3, "loadOptionsByID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v5 = (_QWORD *)(a1 + 32);
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v3, "loadOptionsByID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("TVURLImageLoaderOptionsURLKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)TVMLKitImageLogObject, OS_LOG_TYPE_DEBUG))
      __31__TVURLImageLoader_cancelLoad___block_invoke_cold_2();
    objc_msgSend(v3, "loadOptionsByID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectForKey:", *v5);

    objc_msgSend(v3, "loadIDsByURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "removeObject:", *v5);
    if (!objc_msgSend(v13, "count"))
    {
      objc_msgSend(v3, "loadIDsByURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObjectForKey:", v10);

      objc_msgSend(v3, "taskOptionsByURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("TVURLImageLoaderTaskKey"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "taskOptionsByURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeObjectForKey:", v10);

      v19 = (void *)TVMLKitImageLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitImageLogObject, OS_LOG_TYPE_DEBUG))
        __31__TVURLImageLoader_cancelLoad___block_invoke_cold_1(v19);
      objc_msgSend(v17, "cancel");

    }
  }

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __77__TVURLImageLoader_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke;
  v15[3] = &unk_24EB87100;
  v16 = v9;
  v17 = v10;
  v18 = v11;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  -[TVURLImageLoader _executeOnProcessingQueue:](self, "_executeOnProcessingQueue:", v15);

}

void __77__TVURLImageLoader_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "originalRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "taskOptionsByURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("TVURLImageLoaderOptionsRequestRecordKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_timingData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "didReceiveResponse:timingData:", v9, v10);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __55__TVURLImageLoader_URLSession_dataTask_didReceiveData___block_invoke;
  v11[3] = &unk_24EB87128;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  -[TVURLImageLoader _executeOnProcessingQueue:](self, "_executeOnProcessingQueue:", v11);

}

void __55__TVURLImageLoader_URLSession_dataTask_didReceiveData___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "originalRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "taskOptionsByURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("TVURLImageLoaderTaskReceivedDataKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "appendData:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "taskOptionsByURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("TVURLImageLoaderOptionsRequestRecordKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "didReceiveData:", *(_QWORD *)(a1 + 40));
}

- (void)URLSession:(id)a3 dataTask:(id)a4 willCacheResponse:(id)a5 completionHandler:(id)a6
{
  objc_class *v7;
  void (**v8)(id, id);
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = (objc_class *)MEMORY[0x24BDD1498];
  v8 = (void (**)(id, id))a6;
  v9 = a5;
  v10 = [v7 alloc];
  objc_msgSend(v9, "response");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (id)objc_msgSend(v10, "initWithResponse:data:userInfo:storagePolicy:", v11, v12, v13, 2);
  v8[2](v8, v14);

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __57__TVURLImageLoader_URLSession_task_didCompleteWithError___block_invoke;
  v11[3] = &unk_24EB87128;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  -[TVURLImageLoader _executeOnProcessingQueue:](self, "_executeOnProcessingQueue:", v11);

}

void __57__TVURLImageLoader_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id *v39;
  id *v40;
  void *v41;
  void *v42;
  id v43;
  NSObject *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  id obj;
  id *v54;
  _QWORD v55[4];
  id v56;
  id v57;
  _QWORD v58[4];
  id v59;
  id v60;
  id v61;
  id v62;
  _QWORD block[4];
  id v64;
  id v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t v71[128];
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  id v77;
  _QWORD v78[2];
  _QWORD v79[5];

  v79[2] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "originalRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "taskOptionsByURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TVURLImageLoaderTaskKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 32);

  if (v8 == v9)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("TVURLImageLoaderOptionsRequestRecordKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("TVURLImageLoaderTaskDecryptorKey"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("TVURLImageLoaderTaskReceivedDataKey"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "response");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "itunes_statusCode");

    v14 = *(void **)(a1 + 40);
    v48 = v11;
    v51 = a1;
    v54 = (id *)(a1 + 32);
    v46 = v10;
    if (v14 || (unint64_t)(v13 - 400) <= 0xFFFFFFFFFFFFFF37)
    {
      if (v14)
      {
        v10 = v14;
      }
      else
      {
        v18 = (void *)MEMORY[0x24BDD1540];
        v19 = *MEMORY[0x24BDD1100];
        v78[0] = CFSTR("statusCode");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v13, v46, v11);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v79[0] = v20;
        v78[1] = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD15B8], "localizedStringForStatusCode:", v13);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v79[1] = v21;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v79, v78, 2);
        v22 = v11;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, -18, v23);
        v10 = (id)objc_claimAutoreleasedReturnValue();

        v11 = v22;
      }
      objc_msgSend(v11, "didFailWithError:", v10, v46);
      v24 = (void *)TVMLKitImageLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitImageLogObject, OS_LOG_TYPE_DEBUG))
      {
        v43 = *v54;
        v44 = v24;
        objc_msgSend(v43, "description");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v73 = v45;
        v74 = 2112;
        v75 = v5;
        v76 = 2112;
        v77 = v10;
        _os_log_debug_impl(&dword_222D98000, v44, OS_LOG_TYPE_DEBUG, "URLImageLoader Finished task %@ url %@ with error [%@]", buf, 0x20u);

      }
      v52 = 0;
    }
    else
    {
      v15 = v50;
      if (objc_msgSend(v15, "length", v10, v11))
      {
        if (v10)
        {
          objc_msgSend(v10, "decryptImageData:", v15);
          v16 = objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            +[TVImage imageWithData:](TVImage, "imageWithData:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setRotationEnabled:", objc_msgSend(v3, "isImageRotationEnabled"));
            v10 = 0;
            v15 = (id)v16;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -18, 0);
            v10 = (id)objc_claimAutoreleasedReturnValue();
            v15 = 0;
            v17 = 0;
          }
        }
        else
        {
          +[TVImage imageWithData:](TVImage, "imageWithData:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setRotationEnabled:", objc_msgSend(v3, "isImageRotationEnabled"));
        }
        v26 = (void *)TVMLKitImageLogObject;
        if (os_log_type_enabled((os_log_t)TVMLKitImageLogObject, OS_LOG_TYPE_DEBUG))
          __57__TVURLImageLoader_URLSession_task_didCompleteWithError___block_invoke_cold_2((uint64_t)v54, v26);
      }
      else
      {
        v25 = (void *)TVMLKitImageLogObject;
        if (os_log_type_enabled((os_log_t)TVMLKitImageLogObject, OS_LOG_TYPE_DEBUG))
          __57__TVURLImageLoader_URLSession_task_didCompleteWithError___block_invoke_cold_1(a1 + 32, v25);
        v17 = 0;
        v10 = 0;
      }
      v52 = v17;
      objc_msgSend(v11, "didCompleteLoadingWithResponseBody:", v15);

    }
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    objc_msgSend(v3, "loadIDsByURL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v5;
    objc_msgSend(v27, "objectForKeyedSubscript:", v5);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v28;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v68 != v31)
            objc_enumerationMutation(obj);
          v33 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i);
          objc_msgSend(v3, "loadOptionsByID");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectForKeyedSubscript:", v33);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v3, "loadOptionsByID");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "removeObjectForKey:", v33);

          objc_msgSend(v35, "objectForKey:", CFSTR("TVURLImageLoaderOptionsCompletionHandlerKey"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v37;
          if (v10)
          {
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __57__TVURLImageLoader_URLSession_task_didCompleteWithError___block_invoke_35;
            block[3] = &unk_24EB86A48;
            v66 = v37;
            v64 = *v54;
            v65 = v10;
            dispatch_async(MEMORY[0x24BDAC9B8], block);

            v39 = &v64;
            v40 = &v66;
          }
          else if (v52)
          {
            v58[0] = MEMORY[0x24BDAC760];
            v58[1] = 3221225472;
            v58[2] = __57__TVURLImageLoader_URLSession_task_didCompleteWithError___block_invoke_2;
            v58[3] = &unk_24EB87150;
            v62 = v37;
            v59 = *(id *)(v51 + 32);
            v60 = v52;
            v61 = *(id *)(v51 + 40);
            dispatch_async(MEMORY[0x24BDAC9B8], v58);

            v39 = &v59;
            v40 = &v62;
          }
          else
          {
            v55[0] = MEMORY[0x24BDAC760];
            v55[1] = 3221225472;
            v55[2] = __57__TVURLImageLoader_URLSession_task_didCompleteWithError___block_invoke_3;
            v55[3] = &unk_24EB86A70;
            v57 = v37;
            v56 = *v54;
            dispatch_async(MEMORY[0x24BDAC9B8], v55);
            v39 = &v56;
            v40 = &v57;
          }

        }
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
      }
      while (v30);
    }

    objc_msgSend(v3, "loadIDsByURL");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v49;
    objc_msgSend(v41, "removeObjectForKey:", v49);

    objc_msgSend(v3, "taskOptionsByURL");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "removeObjectForKey:", v49);

  }
  else
  {
    v10 = 0;
  }

}

void __57__TVURLImageLoader_URLSession_task_didCompleteWithError___block_invoke_35(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (*(_QWORD *)(a1 + 48) && objc_msgSend(*(id *)(a1 + 32), "state") != 2)
  {
    v2 = *(_QWORD *)(a1 + 48);
    if (*(_QWORD *)(a1 + 40))
    {
      (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 48), 0, 0, 0, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -18, 0);
      v3 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, id))(v2 + 16))(v2, 0, 0, 0, 0, v3);

    }
  }
}

uint64_t __57__TVURLImageLoader_URLSession_task_didCompleteWithError___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(result + 56))
  {
    v1 = result;
    result = objc_msgSend(*(id *)(result + 32), "state");
    if (result != 2)
      return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 56) + 16))();
  }
  return result;
}

void __57__TVURLImageLoader_URLSession_task_didCompleteWithError___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (*(_QWORD *)(a1 + 40))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "state") != 2)
    {
      v2 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -18, 0);
      v3 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, id))(v2 + 16))(v2, 0, 0, 0, 0, v3);

    }
  }
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 completionHandler:(id)a6
{
  return -[TVURLImageLoader loadImageForObject:scaleToSize:cropToFit:imageDirection:completionHandler:](self, "loadImageForObject:scaleToSize:cropToFit:imageDirection:completionHandler:", a3, a5, 1, a6, a4.width, a4.height);
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 completionHandler:(id)a7
{
  return -[TVURLImageLoader loadImageForObject:scaleToSize:cropToFit:imageDirection:requestLoader:completionHandler:](self, "loadImageForObject:scaleToSize:cropToFit:imageDirection:requestLoader:completionHandler:", a3, a5, a6, 0, a7, a4.width, a4.height);
}

- (BOOL)isImageRotationEnabled
{
  return self->_imageRotationEnabled;
}

- (void)setImageRotationEnabled:(BOOL)a3
{
  self->_imageRotationEnabled = a3;
}

- (NSURLSession)session
{
  return self->_session;
}

- (NSMutableDictionary)loadOptionsByID
{
  return self->_loadOptionsByID;
}

- (NSMutableDictionary)loadIDsByURL
{
  return self->_loadIDsByURL;
}

- (NSMutableDictionary)taskOptionsByURL
{
  return self->_taskOptionsByURL;
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_taskOptionsByURL, 0);
  objc_storeStrong((id *)&self->_loadIDsByURL, 0);
  objc_storeStrong((id *)&self->_loadOptionsByID, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)imageKeyForObject:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5(a1);
  v2 = (void *)OUTLINED_FUNCTION_7();
  v3 = OUTLINED_FUNCTION_10(v2);
  OUTLINED_FUNCTION_0_1(&dword_222D98000, v4, v5, "URLImageLoader cannot create key for object of type [%@]", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

- (void)loadImageForObject:(void *)a1 scaleToSize:cropToFit:imageDirection:requestLoader:completionHandler:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5(a1);
  v2 = (void *)OUTLINED_FUNCTION_7();
  v3 = OUTLINED_FUNCTION_10(v2);
  OUTLINED_FUNCTION_0_1(&dword_222D98000, v4, v5, "URLImageLoader cannot load image for object of type [%@]", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

void __108__TVURLImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_6(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_222D98000, v5, v6, "URLImageLoader Loading task %@ URL %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_2_1();
}

void __108__TVURLImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke_cold_2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_11();
  v3 = v0;
  OUTLINED_FUNCTION_1_1(&dword_222D98000, v1, (uint64_t)v1, "URLImageLoader Adding request %@ URL %@", v2);
}

void __31__TVURLImageLoader_cancelLoad___block_invoke_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_6(), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_222D98000, v3, v4, "URLImageLoader Canceling task %@ URL %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_1();
}

void __31__TVURLImageLoader_cancelLoad___block_invoke_cold_2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_11();
  v3 = v0;
  OUTLINED_FUNCTION_1_1(&dword_222D98000, v1, (uint64_t)v1, "URLImageLoader Canceling request %@ URL %@", v2);
}

void __57__TVURLImageLoader_URLSession_task_didCompleteWithError___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_9(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_6(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_222D98000, v4, v5, "URLImageLoader Finished loading task %@ url %@ with no data", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_1();
}

void __57__TVURLImageLoader_URLSession_task_didCompleteWithError___block_invoke_cold_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_9(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_6(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_222D98000, v4, v5, "URLImageLoader Finished loading task %@ url %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_1();
}

@end
