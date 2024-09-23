@implementation SSNetworkQualityInquiry

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__SSNetworkQualityInquiry_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_sharedSelf;
}

void __41__SSNetworkQualityInquiry_sharedInstance__block_invoke()
{
  SSNetworkQualityInquiry *v0;
  void *v1;
  void *v2;
  int v3;
  int v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(SSNetworkQualityInquiry);
  v1 = (void *)sharedInstance_sharedSelf;
  sharedInstance_sharedSelf = (uint64_t)v0;

  if (!sharedInstance_sharedSelf)
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v3 = objc_msgSend(v2, "shouldLog");
    if (objc_msgSend(v2, "shouldLogToDisk"))
      v4 = v3 | 2;
    else
      v4 = v3;
    objc_msgSend(v2, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      v4 &= 2u;
    if (v4)
    {
      LODWORD(v15) = 138412290;
      *(_QWORD *)((char *)&v15 + 4) = objc_opt_class();
      v6 = *(id *)((char *)&v15 + 4);
      LODWORD(v14) = 12;
      v7 = (void *)_os_log_send_and_compose_impl();

      if (!v7)
      {
LABEL_13:

        return;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v15, v14, v15);
      v5 = objc_claimAutoreleasedReturnValue();
      free(v7);
      SSFileLog(v2, CFSTR("%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v5);
    }

    goto LABEL_13;
  }
}

- (SSNetworkQualityInquiry)init
{
  SSNetworkQualityInquiry *v3;
  uint64_t v4;
  NWNetworkOfInterestManager *v5;
  NWNetworkOfInterestManager *manager;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  NSMutableSet *v9;
  NSMutableSet *knownNetworks;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  SSNetworkQualityInquiry *v23;
  uint64_t v25;
  objc_super v26;
  int v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend((id)objc_opt_class(), "isEntitled") & 1) == 0)
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12 = objc_msgSend(v11, "shouldLog");
    if (objc_msgSend(v11, "shouldLogToDisk"))
      v13 = v12 | 2;
    else
      v13 = v12;
    objc_msgSend(v11, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      v13 &= 2u;
    if (v13)
    {
      v27 = 138412290;
      v28 = (id)objc_opt_class();
      v15 = v28;
      LODWORD(v25) = 12;
      v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_16:

        v3 = 0;
        goto LABEL_17;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v16, 4, &v27, v25);
      v14 = objc_claimAutoreleasedReturnValue();
      free(v16);
      SSFileLog(v11, CFSTR("%@"), v17, v18, v19, v20, v21, v22, (uint64_t)v14);
    }

    goto LABEL_16;
  }
  v26.receiver = self;
  v26.super_class = (Class)SSNetworkQualityInquiry;
  v3 = -[SSNetworkQualityInquiry init](&v26, sel_init);
  if (v3)
  {
    v4 = SSVSymptomPresentationFeed();
    v5 = (NWNetworkOfInterestManager *)objc_alloc_init((Class)SSVWeakLinkedClassForString(CFSTR("NWNetworkOfInterestManager"), v4));
    manager = v3->_manager;
    v3->_manager = v5;

    if (!v3->_manager)
    {
      v23 = 0;
      goto LABEL_18;
    }
    v7 = dispatch_queue_create("com.apple.StoreServices.NetworkQualityInquiry.queue", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v7;

    -[NWNetworkOfInterestManager setQueue:](v3->_manager, "setQueue:", v3->_queue);
    -[NWNetworkOfInterestManager setDelegate:](v3->_manager, "setDelegate:", v3);
    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    knownNetworks = v3->_knownNetworks;
    v3->_knownNetworks = v9;

    -[NWNetworkOfInterestManager trackNOIAnyForInterfaceType:options:](v3->_manager, "trackNOIAnyForInterfaceType:options:", 2, 0);
    -[NWNetworkOfInterestManager trackNOIAnyForInterfaceType:options:](v3->_manager, "trackNOIAnyForInterfaceType:options:", 1, 0);
    -[NWNetworkOfInterestManager trackNOIAnyForInterfaceType:options:](v3->_manager, "trackNOIAnyForInterfaceType:options:", 3, 0);
  }
LABEL_17:
  v3 = v3;
  v23 = v3;
LABEL_18:

  return v23;
}

- (void)dealloc
{
  objc_super v3;

  -[NWNetworkOfInterestManager setDelegate:](self->_manager, "setDelegate:", 0);
  -[NWNetworkOfInterestManager destroy](self->_manager, "destroy");
  v3.receiver = self;
  v3.super_class = (Class)SSNetworkQualityInquiry;
  -[SSNetworkQualityInquiry dealloc](&v3, sel_dealloc);
}

- (BOOL)areKnownNetworksReady
{
  NSObject *v3;
  void *v4;

  -[SSNetworkQualityInquiry queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SSNetworkQualityInquiry knownNetworks](self, "knownNetworks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "count") == 3;

  return (char)v3;
}

- (void)performWhenKnownNetworksReady:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SSNetworkQualityInquiry queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__SSNetworkQualityInquiry_performWhenKnownNetworksReady___block_invoke;
  v7[3] = &unk_1E47B8AC0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __57__SSNetworkQualityInquiry_performWhenKnownNetworksReady___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (objc_msgSend(*(id *)(a1 + 32), "areKnownNetworksReady"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "knownNetworksReadyHandlers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
    {
      v3 = *(void **)(a1 + 32);
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
      objc_msgSend(v3, "setKnownNetworksReadyHandlers:", v4);

    }
    objc_msgSend(*(id *)(a1 + 32), "knownNetworksReadyHandlers");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    v6 = (void *)MEMORY[0x1A8585DF0]();
    objc_msgSend(v7, "addObject:", v6);

  }
}

- (void)drainKnownNetworksReadyHandlers
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[SSNetworkQualityInquiry queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[SSNetworkQualityInquiry knownNetworksReadyHandlers](self, "knownNetworksReadyHandlers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++) + 16))();
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[SSNetworkQualityInquiry setKnownNetworksReadyHandlers:](self, "setKnownNetworksReadyHandlers:", 0);
}

- (void)didStartTrackingNOI:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[SSNetworkQualityInquiry knownNetworks](self, "knownNetworks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  if (-[SSNetworkQualityInquiry areKnownNetworksReady](self, "areKnownNetworksReady"))
    -[SSNetworkQualityInquiry drainKnownNetworksReadyHandlers](self, "drainKnownNetworksReadyHandlers");
}

- (void)didStopTrackingNOI:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  int v20;
  SSNetworkQualityInquiry *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SSNetworkQualityInquiry knownNetworks](self, "knownNetworks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = objc_msgSend(v6, "shouldLog");
  if (objc_msgSend(v6, "shouldLogToDisk"))
    v8 = v7 | 2;
  else
    v8 = v7;
  objc_msgSend(v6, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    v10 = v8;
  else
    v10 = v8 & 2;
  if (!v10)
    goto LABEL_12;
  v20 = 138412546;
  v21 = self;
  v22 = 2112;
  v23 = v4;
  LODWORD(v19) = 22;
  v11 = (void *)_os_log_send_and_compose_impl();

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4, &v20, v19);
    v9 = objc_claimAutoreleasedReturnValue();
    free(v11);
    SSFileLog(v6, CFSTR("%@"), v12, v13, v14, v15, v16, v17, (uint64_t)v9);
LABEL_12:

  }
  -[SSNetworkQualityInquiry manager](self, "manager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "trackNOIAnyForInterfaceType:options:", objc_msgSend(v4, "interface"), 0);

}

- (void)didStopTrackingAllNOIs:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[SSNetworkQualityInquiry didStopTrackingNOI:](self, "didStopTrackingNOI:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)investigateNetworks
{
  SSPromise *v3;
  SSPromise *v4;
  SSPromise *v5;
  SSPromise *v6;
  _QWORD v8[5];
  SSPromise *v9;

  v3 = objc_alloc_init(SSPromise);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__SSNetworkQualityInquiry_investigateNetworks__block_invoke;
  v8[3] = &unk_1E47BC5A8;
  v8[4] = self;
  v4 = v3;
  v9 = v4;
  -[SSNetworkQualityInquiry performWhenKnownNetworksReady:](self, "performWhenKnownNetworksReady:", v8);
  v5 = v9;
  v6 = v4;

  return v6;
}

void __46__SSNetworkQualityInquiry_investigateNetworks__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  double v5;
  double v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  SSPromise *v17;
  void *v18;
  SSPromise *v19;
  void *v20;
  id v21;
  uint64_t v22;
  id obj;
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;
  SSPromise *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v24 = a2;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v3)
  {
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __46__SSNetworkQualityInquiry_investigateNetworks__block_invoke_2;
    v34[3] = &unk_1E47BC530;
    v35 = *(id *)(a1 + 40);
    objc_msgSend(v3, "addFinishBlock:", v34);

  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99D68]);
    objc_msgSend(v4, "timeIntervalSince1970");
    v6 = v5;

    v7 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v7 + 8) && (uint64_t)(v6 * 1000.0) - *(_QWORD *)(v7 + 16) <= 999)
    {
      objc_msgSend(*(id *)(a1 + 40), "finishWithResult:");
    }
    else
    {
      v22 = a1;
      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v24, "knownNetworks");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v10);
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      objc_msgSend(v24, "knownNetworks");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v31;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v31 != v14)
              objc_enumerationMutation(obj);
            v16 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v15);
            v17 = objc_alloc_init(SSPromise);
            objc_msgSend(v8, "addObject:", v17);
            objc_msgSend(v24, "manager");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v27[0] = MEMORY[0x1E0C809B0];
            v27[1] = 3221225472;
            v27[2] = __46__SSNetworkQualityInquiry_investigateNetworks__block_invoke_3;
            v27[3] = &unk_1E47BC558;
            v27[4] = v16;
            v28 = v11;
            v29 = v17;
            v19 = v17;
            objc_msgSend(v18, "auditableLinkQualityForNOI:reply:", v16, v27);

            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
        }
        while (v13);
      }

      +[SSPromise promiseWithAll:](SSPromise, "promiseWithAll:", v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __46__SSNetworkQualityInquiry_investigateNetworks__block_invoke_41;
      v25[3] = &unk_1E47BC580;
      v25[4] = *(_QWORD *)(v22 + 32);
      v26 = v11;
      v21 = v11;
      objc_msgSend(v20, "addFinishBlock:", v25);
      objc_storeStrong((id *)(*(_QWORD *)(v22 + 32) + 24), *(id *)(v22 + 40));

    }
  }

}

uint64_t __46__SSNetworkQualityInquiry_investigateNetworks__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
}

void __46__SSNetworkQualityInquiry_investigateNetworks__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  __CFString *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  int v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE *v27;
  uint64_t v28;
  _BYTE v29[24];
  void *v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = v5;
  if (v8 && (v9 = objc_msgSend(v7, "interface"), (unint64_t)(v9 - 1) <= 2))
  {
    v10 = off_1E47BC5C8[v9 - 1];
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *(_QWORD *)v29 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v29[8] = 3221225472;
    *(_QWORD *)&v29[16] = __SSNetworkQualityInquiryReportMake_block_invoke;
    v30 = &unk_1E47BAEA8;
    v12 = v11;
    v31 = v12;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v29);
    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, CFSTR("interface"));
      v13 = (void *)objc_msgSend(v12, "copy");
    }
    else
    {
      v13 = 0;
    }

    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v13);

    }
  }
  else
  {

  }
  if (v6)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "shouldLog");
    if (objc_msgSend(v14, "shouldLogToDisk"))
      v16 = v15 | 2;
    else
      v16 = v15;
    objc_msgSend(v14, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      v18 = v16;
    else
      v18 = v16 & 2;
    if (v18)
    {
      v19 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v29 = 138412546;
      *(_QWORD *)&v29[4] = v19;
      *(_WORD *)&v29[12] = 2112;
      *(_QWORD *)&v29[14] = v6;
      LODWORD(v28) = 22;
      v27 = v29;
      v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20)
      {
LABEL_20:

        goto LABEL_21;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v20, 4, v29, v28);
      v17 = objc_claimAutoreleasedReturnValue();
      free(v20);
      SSFileLog(v14, CFSTR("%@"), v21, v22, v23, v24, v25, v26, (uint64_t)v17);
    }

    goto LABEL_20;
  }
LABEL_21:
  objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", MEMORY[0x1E0C9AAB0], v27);

}

void __46__SSNetworkQualityInquiry_investigateNetworks__block_invoke_41(uint64_t a1)
{
  id v2;
  double v3;
  uint64_t v4;
  void *v5;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
  v2 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  objc_msgSend(v2, "timeIntervalSince1970");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = (uint64_t)(v3 * 1000.0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "finishWithResult:", *(_QWORD *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = 0;

}

+ (BOOL)isEntitled
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t i;
  const __CFString *v7;
  __SecTask *v8;
  __SecTask *v9;
  CFTypeRef v10;
  BOOL v11;
  CFErrorRef error;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = objc_msgSend(&unk_1E481E900, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v2)
    return 1;
  v3 = v2;
  v4 = *(_QWORD *)v15;
  v5 = 1;
  do
  {
    for (i = 0; i != v3; ++i)
    {
      if (*(_QWORD *)v15 != v4)
        objc_enumerationMutation(&unk_1E481E900);
      v7 = *(const __CFString **)(*((_QWORD *)&v14 + 1) + 8 * i);
      v8 = SecTaskCreateFromSelf(0);
      if (v8)
      {
        v9 = v8;
        error = 0;
        v10 = SecTaskCopyValueForEntitlement(v8, v7, &error);
        if (error)
          CFRelease(error);
        v11 = v10 != 0;
        if (v10)
          CFRelease(v10);
        CFRelease(v9);
      }
      else
      {
        v11 = 0;
      }
      v5 &= v11;
    }
    v3 = objc_msgSend(&unk_1E481E900, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  }
  while (v3);
  return v5;
}

- (NWNetworkOfInterestManager)manager
{
  return self->_manager;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableSet)knownNetworks
{
  return self->_knownNetworks;
}

- (NSMutableArray)knownNetworksReadyHandlers
{
  return self->_knownNetworksReadyHandlers;
}

- (void)setKnownNetworksReadyHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_knownNetworksReadyHandlers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownNetworksReadyHandlers, 0);
  objc_storeStrong((id *)&self->_knownNetworks, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_currentInvestigation, 0);
  objc_storeStrong((id *)&self->_lastKnownReports, 0);
}

@end
