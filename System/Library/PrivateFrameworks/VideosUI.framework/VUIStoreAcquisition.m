@implementation VUIStoreAcquisition

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_16 != -1)
    dispatch_once(&sharedInstance_onceToken_16, &__block_literal_global_73);
  return (id)sharedInstance_sSharedInstance_1;
}

void __37__VUIStoreAcquisition_sharedInstance__block_invoke()
{
  VUIStoreAcquisition *v0;
  void *v1;

  v0 = objc_alloc_init(VUIStoreAcquisition);
  v1 = (void *)sharedInstance_sSharedInstance_1;
  sharedInstance_sSharedInstance_1 = (uint64_t)v0;

}

- (VUIStoreAcquisition)init
{
  VUIStoreAcquisition *v2;
  NSMutableArray *v3;
  NSMutableArray *pendingQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUIStoreAcquisition;
  v2 = -[VUIStoreAcquisition init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingQueue = v2->_pendingQueue;
    v2->_pendingQueue = v3;

    v2->_concurrentCount = 1;
  }
  return v2;
}

- (id)acquireWithProperties:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  VUIAcquisitionRequest *v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "buyParams");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "length"))
  {

    goto LABEL_16;
  }
  objc_msgSend(v6, "buyParams");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAcquisitionRequest properties](self->_activeRequest, "properties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "buyParams");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqualToString:", v11);

  if ((v12 & 1) != 0)
  {
LABEL_16:
    v23 = 0;
    goto LABEL_17;
  }
  v25 = v7;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = self->_pendingQueue;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v27;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v17);
        objc_msgSend(v6, "buyParams");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "properties");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "buyParams");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "isEqualToString:", v21))
        {
          v22 = objc_msgSend(v18, "isCancelled");

          if ((v22 & 1) == 0)
          {

            v23 = 0;
            v7 = v25;
            goto LABEL_17;
          }
        }
        else
        {

        }
        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v15);
  }

  v23 = objc_alloc_init(VUIAcquisitionRequest);
  v7 = v25;
  -[VUIAcquisitionRequest setCompletionBlock:](v23, "setCompletionBlock:", v25);
  -[VUIAcquisitionRequest setProperties:](v23, "setProperties:", v6);
  -[NSMutableArray addObject:](self->_pendingQueue, "addObject:", v23);
  -[VUIStoreAcquisition _processFirstRequest](self, "_processFirstRequest");
LABEL_17:

  return v23;
}

- (void)cancelAcquisition:(id)a3
{
  objc_msgSend(a3, "setCancelled:", 1);
}

- (void)_processFirstRequest
{
  id obj;

  if (-[NSMutableArray count](self->_pendingQueue, "count") && self->_concurrentCount)
  {
    -[NSMutableArray objectAtIndex:](self->_pendingQueue, "objectAtIndex:", 0);
    obj = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(obj, "isCancelled") & 1) != 0)
    {
      -[NSMutableArray removeObjectAtIndex:](self->_pendingQueue, "removeObjectAtIndex:", 0);
      -[VUIStoreAcquisition _processFirstRequest](self, "_processFirstRequest");
    }
    else
    {
      --self->_concurrentCount;
      objc_storeStrong((id *)&self->_activeRequest, obj);
      -[VUIStoreAcquisition _processRequest:](self, "_processRequest:", obj);
      -[NSMutableArray removeObjectAtIndex:](self->_pendingQueue, "removeObjectAtIndex:", 0);
    }

  }
}

- (void)_processRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userAgent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 || (objc_msgSend(v4, "dsid"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    objc_msgSend(v4, "strongToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[VUIStoreAcquisition _handleRequest:](self, "_handleRequest:", v7);
      goto LABEL_5;
    }
  }
  -[VUIStoreAcquisition _handleCustomRequest:](self, "_handleCustomRequest:", v7);
LABEL_5:

}

- (void)_handleRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  _QWORD v21[5];
  id v22;
  _QWORD block[2];
  uint64_t (*v24)(uint64_t);
  void *v25;
  VUIStoreAcquisition *v26;
  id v27;
  id v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "urlBagKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "buyParams");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0DAF5D0], "purchaseWithBuyParameters:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("redownloadProduct")))
    {
      v9 = (void *)objc_opt_new();
      objc_msgSend(v9, "setURLBagKey:", v6);
      objc_msgSend(v9, "setShouldProcessProtocol:", 0);
      objc_msgSend(v8, "setRequestProperties:", v9);

    }
    if (!v6 || objc_msgSend(v6, "isEqualToString:", CFSTR("buyProduct")))
    {
      objc_msgSend(v8, "requestProperties");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (id)objc_msgSend(v10, "mutableCopy");

      if (!v11)
        v11 = objc_alloc_init(MEMORY[0x1E0DAF5C8]);
      objc_msgSend(v8, "setRequestProperties:", v11);

    }
    objc_msgSend(v8, "setIgnoresForcedPasswordRestriction:", objc_msgSend(v5, "ignoresForcedPasswordRestriction"));
    v12 = objc_alloc(MEMORY[0x1E0DAF5D8]);
    v29[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v12, "initWithPurchases:", v13);

    objc_msgSend(v14, "setCreatesDownloads:", 0);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __38__VUIStoreAcquisition__handleRequest___block_invoke_51;
    v21[3] = &unk_1E9F9E668;
    v15 = &v22;
    v21[4] = self;
    v22 = v4;
    v16 = v4;
    objc_msgSend(v14, "startWithPurchaseResponseBlock:completionBlock:", v21, &__block_literal_global_56);
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v8, "setObject:forKey:", CFSTR("Error making purchase: no buy params specified in request"), *MEMORY[0x1E0CB2D50]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TVCKCloudDataClientError"), 0, v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    v24 = __38__VUIStoreAcquisition__handleRequest___block_invoke;
    v25 = &unk_1E9F99840;
    v26 = self;
    v27 = v4;
    v28 = v17;
    v18 = (void *)MEMORY[0x1E0CB3978];
    v19 = v4;
    v14 = v17;
    if (objc_msgSend(v18, "isMainThread"))
      v24((uint64_t)block);
    else
      dispatch_async(MEMORY[0x1E0C80D38], block);
    v15 = &v27;
    VUIDefaultLogObject();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[VUIStoreAcquisition _handleRequest:].cold.1(v20);

  }
}

uint64_t __38__VUIStoreAcquisition__handleRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleResponse:responseDict:forRequest:error:cancelled:", 0, 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);
}

void __38__VUIStoreAcquisition__handleRequest___block_invoke_51(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  _BOOL4 v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD block[2];
  uint64_t (*v23)(uint64_t);
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  BOOL v30;
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  _BOOL4 v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "URLResponse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bodyData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v31 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v5, 0, 0, &v31);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v31;
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  objc_msgSend(v3, "error");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v6)
    v10 = 0;
  else
    v10 = v7;
  if (v8)
    v10 = (void *)v8;
  v11 = v10;

  objc_msgSend(v11, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0DDC120]) & 1) != 0)
  {
    v13 = objc_msgSend(v11, "code");

    if (v13 == 16)
    {
      v14 = 1;
      goto LABEL_18;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DDC1D8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v15 != 0;

  if (!v7 && !v11 && !v15 && v6)
  {
    LOBYTE(v14) = 0;
    v7 = 0;
    goto LABEL_21;
  }
LABEL_18:
  VUIDefaultLogObject();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v33 = v11;
    v34 = 2112;
    v35 = v7;
    v36 = 1024;
    v37 = v14;
    _os_log_error_impl(&dword_1D96EE000, v16, OS_LOG_TYPE_ERROR, "Error making purchse: [%@] plist error [%@] Was cancelled [%d]", buf, 0x1Cu);
  }

LABEL_21:
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v23 = __38__VUIStoreAcquisition__handleRequest___block_invoke_53;
  v24 = &unk_1E9F9B978;
  v17 = *(void **)(a1 + 40);
  v25 = *(_QWORD *)(a1 + 32);
  v26 = v3;
  v27 = v6;
  v28 = v17;
  v29 = v11;
  v30 = v14;
  v18 = (void *)MEMORY[0x1E0CB3978];
  v19 = v11;
  v20 = v6;
  v21 = v3;
  if (objc_msgSend(v18, "isMainThread"))
    v23((uint64_t)block);
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __38__VUIStoreAcquisition__handleRequest___block_invoke_53(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  objc_msgSend(*(id *)(a1 + 32), "_processFirstRequest");
  return objc_msgSend(*(id *)(a1 + 32), "_handleResponse:responseDict:forRequest:error:cancelled:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72));
}

- (void)_handleResponse:(id)a3 responseDict:(id)a4 forRequest:(id)a5 error:(id)a6 cancelled:(BOOL)a7
{
  _BOOL4 v7;
  id v11;
  id v12;
  id v13;
  id v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void (**v21)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;

  v7 = a7;
  v30 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v14)
    v15 = 1;
  else
    v15 = v12 == 0;
  v16 = 2;
  if (v15)
    v16 = 0;
  if (v7)
    v17 = 1;
  else
    v17 = v16;
  objc_msgSend(v13, "properties");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "urlBagKey");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "completionBlock");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v13, "completionBlock");
    v21 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, uint64_t, id, id))v21)[2](v21, v17, v12, v14);

  }
  objc_msgSend(v11, "URLResponse");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "allHeaderFields");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "vui_appleTimingAppHeaderValue");

  VUIDefaultLogObject();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    v28 = 134217984;
    v29 = v24;
    _os_log_impl(&dword_1D96EE000, v25, OS_LOG_TYPE_INFO, "Time to process buy in ms [%ld]", (uint8_t *)&v28, 0xCu);
  }

  if (v17 == 2 && (!v19 || objc_msgSend(v19, "isEqualToString:", CFSTR("buyProduct"))))
  {
    +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "deviceMediaLibrary");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "updateFromCloudWithReason:", 1);

  }
}

- (void)postCrossProcessNotificationWithBuyParams:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("VUIStoreAcquisitionCrossProcessNotificationKeyError"));
  if (objc_msgSend(v5, "length"))
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, CFSTR("VUIStoreAcquisitionCrossProcessNotificationKeyBuyParams"));
  VUIDefaultLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v11 = 138412546;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_INFO, "Posting VUIStoreAcquisitionCrossProcessNotification with buy params: %@, error: %@", (uint8_t *)&v11, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "vui_postNotificationName:object:userInfo:", CFSTR("com.apple.VideosUI.StoreAcquisitionCrossProcessNotification"), 0, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeRequest, 0);
  objc_storeStrong((id *)&self->_pendingQueue, 0);
}

- (void)_handleRequest:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D96EE000, log, OS_LOG_TYPE_ERROR, "Error making purchse: no buy params specified in request", v1, 2u);
}

@end
