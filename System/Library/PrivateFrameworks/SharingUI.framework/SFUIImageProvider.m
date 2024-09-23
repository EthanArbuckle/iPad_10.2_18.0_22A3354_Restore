@implementation SFUIImageProvider

- (SFUIImageProvider)init
{
  SFUIImageProvider *v2;
  SFUIImageProvider *v3;
  NSCache *v4;
  NSCache *imageCache;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *fetchQueue;
  uint64_t v9;
  NSMutableDictionary *requestsForIdentifier;
  uint64_t v11;
  NSMutableDictionary *requestsForRequestID;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SFUIImageProvider;
  v2 = -[SFUIImageProvider init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_nextRequestID = 1;
    v4 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    imageCache = v3->_imageCache;
    v3->_imageCache = v4;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.SharingUI.SFUIImageProvider.fetchQueue", v6);
    fetchQueue = v3->_fetchQueue;
    v3->_fetchQueue = (OS_dispatch_queue *)v7;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    requestsForIdentifier = v3->_requestsForIdentifier;
    v3->_requestsForIdentifier = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    requestsForRequestID = v3->_requestsForRequestID;
    v3->_requestsForRequestID = (NSMutableDictionary *)v11;

  }
  return v3;
}

- (void)cancelImageRequest:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  sharing_ui_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SFUIImageProvider cancelImageRequest:].cold.1(v3, v5, v6);

  -[SFUIImageProvider requestsForRequestID](self, "requestsForRequestID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SFUIImageProvider requestsForRequestID](self, "requestsForRequestID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v11);

    -[SFUIImageProvider requestsForIdentifier](self, "requestsForIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "removeObject:", v9);
  }

}

- (int)nextRequestID
{
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  return self->_nextRequestID + 1;
}

- (void)scheduleImageRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  id v16;
  id location;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[SFUIImageProvider requestsForRequestID](self, "requestsForRequestID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v4, "requestID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

  -[SFUIImageProvider requestsForIdentifier](self, "requestsForIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUIImageProvider requestsForIdentifier](self, "requestsForIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

  }
  objc_msgSend(v9, "addObject:", v4);
  if ((unint64_t)objc_msgSend(v9, "count") <= 1)
  {
    if (objc_msgSend(v4, "synchronous"))
    {
      -[SFUIImageProvider performImageRequest:](self, "performImageRequest:", v4);
    }
    else
    {
      location = 0;
      objc_initWeak(&location, self);
      -[SFUIImageProvider fetchQueue](self, "fetchQueue");
      v13 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __42__SFUIImageProvider_scheduleImageRequest___block_invoke;
      block[3] = &unk_24CE0F378;
      objc_copyWeak(&v16, &location);
      v15 = v4;
      dispatch_async(v13, block);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    sharing_ui_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[SFUIImageProvider scheduleImageRequest:].cold.1(v4, v12);

  }
}

void __42__SFUIImageProvider_scheduleImageRequest___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "performImageRequest:", *(_QWORD *)(a1 + 32));

}

- (void)deliverImage:(id)a3 identifier:(id)a4 placeholder:(BOOL)a5 error:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  SFUIImageProvider *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v7 = a5;
  v45 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v31 = a6;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  sharing_ui_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBOOL();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v38 = v10;
    v39 = 2112;
    v40 = v11;
    v41 = 2112;
    v42 = v13;
    v43 = 2112;
    v44 = v31;
    _os_log_impl(&dword_212728000, v12, OS_LOG_TYPE_DEFAULT, "deliver image:%@ identifier:%@ placeholder:%@ error:%@", buf, 0x2Au);

  }
  if (v10)
  {
    -[SFUIImageProvider imageCache](self, "imageCache");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v10, v11);

  }
  -[SFUIImageProvider requestsForIdentifier](self, "requestsForIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[SFUIImageProvider requestsForIdentifier](self, "requestsForIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", 0, v11);

  }
  v29 = v11;
  v30 = self;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v18 = v16;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v33 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v23, "resultHandler");
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = (void *)v24;
        if (v24)
          (*(void (**)(uint64_t, id, _BOOL8, id))(v24 + 16))(v24, v10, v7, v31);
        if (!v7)
        {
          -[SFUIImageProvider requestsForRequestID](v30, "requestsForRequestID");
          v26 = v10;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v23, "requestID"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setObject:forKeyedSubscript:", 0, v28);

          v10 = v26;
        }

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v20);
  }

}

- (NSCache)imageCache
{
  return self->_imageCache;
}

- (OS_dispatch_queue)fetchQueue
{
  return self->_fetchQueue;
}

- (NSMutableDictionary)requestsForIdentifier
{
  return self->_requestsForIdentifier;
}

- (NSMutableDictionary)requestsForRequestID
{
  return self->_requestsForRequestID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestsForRequestID, 0);
  objc_storeStrong((id *)&self->_requestsForIdentifier, 0);
  objc_storeStrong((id *)&self->_fetchQueue, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
}

- (void)cancelImageRequest:(uint64_t)a3 .cold.1(int a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 134217984;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_212728000, a2, a3, "cancel request for requestID:%ld", (uint8_t *)&v3);
}

- (void)scheduleImageRequest:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_0(&dword_212728000, a2, v4, "existing request pending for identifier:%@", (uint8_t *)&v5);

}

@end
