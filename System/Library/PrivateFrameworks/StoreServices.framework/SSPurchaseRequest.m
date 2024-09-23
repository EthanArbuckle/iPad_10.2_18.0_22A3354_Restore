@implementation SSPurchaseRequest

- (SSPurchaseRequest)init
{
  return -[SSPurchaseRequest initWithPurchases:](self, "initWithPurchases:", 0);
}

- (SSPurchaseRequest)initWithPurchases:(id)a3
{
  SSPurchaseRequest *v4;
  SSPurchaseRequest *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SSPurchaseRequest;
  v4 = -[SSRequest init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_createsDownloads = 1;
    v4->_createsJobs = 1;
    v4->_needsAuthentication = 1;
    v4->_purchases = (NSArray *)objc_msgSend(a3, "copy");
    v5->_shouldValidatePurchases = 1;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[SSPurchaseManager setDelegate:](self->_purchaseManager, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SSPurchaseRequest;
  -[SSRequest dealloc](&v3, sel_dealloc);
}

- (NSArray)purchases
{
  return self->_purchases;
}

- (void)startWithPurchaseBlock:(id)a3 completionBlock:(id)a4
{
  id purchaseBlock;
  id completionBlock;

  purchaseBlock = self->_purchaseBlock;
  if (purchaseBlock != a3)
  {

    self->_purchaseBlock = (id)objc_msgSend(a3, "copy");
  }
  completionBlock = self->_completionBlock;
  if (completionBlock != a4)
  {

    self->_completionBlock = (id)objc_msgSend(a4, "copy");
  }
  -[SSPurchaseRequest _addPurchasesToManager](self, "_addPurchasesToManager");
}

- (void)startWithPurchaseResponseBlock:(id)a3 completionBlock:(id)a4
{
  id purchaseResponseBlock;
  id completionBlock;

  purchaseResponseBlock = self->_purchaseResponseBlock;
  if (purchaseResponseBlock != a3)
  {

    self->_purchaseResponseBlock = (id)objc_msgSend(a3, "copy");
  }
  completionBlock = self->_completionBlock;
  if (completionBlock != a4)
  {

    self->_completionBlock = (id)objc_msgSend(a4, "copy");
  }
  -[SSPurchaseRequest _addPurchasesToManager](self, "_addPurchasesToManager");
}

- (void)cancel
{
  objc_super v3;

  -[SSPurchaseManager cancelPurchases:withCompletionBlock:](self->_purchaseManager, "cancelPurchases:withCompletionBlock:", self->_purchases, 0);
  v3.receiver = self;
  v3.super_class = (Class)SSPurchaseRequest;
  -[SSRequest cancel](&v3, sel_cancel);
}

- (BOOL)start
{
  -[SSPurchaseRequest _addPurchasesToManager](self, "_addPurchasesToManager");
  return 1;
}

- (void)startWithCompletionBlock:(id)a3
{
  id completionBlock;

  completionBlock = self->_completionBlock;
  if (completionBlock != a3)
  {

    self->_completionBlock = (id)objc_msgSend(a3, "copy");
  }
  -[SSPurchaseRequest _addPurchasesToManager](self, "_addPurchasesToManager");
}

- (void)purchaseManager:(id)a3 didFinishPurchasesWithResponses:(id)a4
{
  -[SSPurchaseRequest _finishPurchasesWithResponses:](self, "_finishPurchasesWithResponses:", a4);
}

- (id)copyXPCEncoding
{
  return 0;
}

- (SSPurchaseRequest)initWithXPCEncoding:(id)a3
{

  return 0;
}

- (void)_addPurchasesToManager
{
  SSPurchaseRequest *v3;
  SSPurchaseManager *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  SSPurchaseManager *purchaseManager;
  uint64_t v12;
  uint64_t v13;
  NSArray *obj;
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[SSRequest _beginBackgroundTask](self, "_beginBackgroundTask");
  v3 = self;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SSVNetworkingDidStartNotification"), 0);
  if (!self->_purchaseManager)
  {
    v4 = objc_alloc_init(SSPurchaseManager);
    self->_purchaseManager = v4;
    -[SSPurchaseManager setDelegate:](v4, "setDelegate:", self);
  }
  if (!self->_openPurchaseIdentifiers)
    self->_openPurchaseIdentifiers = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = self->_purchases;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16, 104);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", objc_msgSend(v9, "uniqueIdentifier"));
        objc_msgSend(v9, "setBackgroundPurchase:", self->_isBackgroundRequest);
        objc_msgSend(v9, "setCreatesDownloads:", self->_createsDownloads);
        objc_msgSend(v9, "setCreatesJobs:", self->_createsJobs);
        objc_msgSend(v9, "setPlaybackRequest:", self->_playbackRequest);
        -[NSMutableSet addObject:](self->_openPurchaseIdentifiers, "addObject:", v10);

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
  purchaseManager = self->_purchaseManager;
  v12 = *(uint64_t *)((char *)&self->super.super.isa + v13);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __43__SSPurchaseRequest__addPurchasesToManager__block_invoke;
  v15[3] = &unk_1E47BA468;
  v15[4] = self;
  -[SSPurchaseManager addPurchases:withCompletionBlock:](purchaseManager, "addPurchases:withCompletionBlock:", v12, v15);
}

void __43__SSPurchaseRequest__addPurchasesToManager__block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  SSPurchaseResponse *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) == 0)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
          v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          v12 = objc_alloc_init(SSPurchaseResponse);
          -[SSPurchaseResponse setError:](v12, "setError:", a3);
          -[SSPurchaseResponse setPurchase:](v12, "setPurchase:", v11);
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
    objc_msgSend(*(id *)(a1 + 32), "_finishPurchasesWithResponses:", v5);

  }
}

- (void)_finishPurchasesWithResponses:(id)a3
{
  NSObject *dispatchQueue;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  SSPurchaseRequest *v16;
  _QWORD v17[7];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD block[10];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  void (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  uint64_t v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v39 = 0;
  v40 = &v39;
  v41 = 0x3052000000;
  v42 = __Block_byref_object_copy__8;
  v43 = __Block_byref_object_dispose__8;
  v44 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3052000000;
  v32 = __Block_byref_object_copy__8;
  v33 = __Block_byref_object_dispose__8;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3052000000;
  v26 = __Block_byref_object_copy__8;
  v27 = __Block_byref_object_dispose__8;
  v28 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SSPurchaseRequest__finishPurchasesWithResponses___block_invoke;
  block[3] = &unk_1E47BA490;
  block[6] = &v39;
  block[7] = &v29;
  block[4] = self;
  block[5] = a3;
  block[8] = &v23;
  block[9] = &v35;
  dispatch_sync(dispatchQueue, block);
  if (v30[5] || v24[5])
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v45, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(a3);
          v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          v11 = objc_msgSend((id)objc_msgSend(v10, "purchase"), "uniqueIdentifier");
          v12 = objc_msgSend(v10, "error");
          v13 = -[SSPurchaseRequest _purchaseForUniqueIdentifier:](self, "_purchaseForUniqueIdentifier:", v11);
          v14 = v30[5];
          if (v14)
            (*(void (**)(uint64_t, id, uint64_t))(v14 + 16))(v14, v13, v12);
          if (v24[5])
          {
            objc_msgSend(v10, "setPurchase:", v13);
            (*(void (**)(void))(v24[5] + 16))();
          }
        }
        v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v45, 16);
      }
      while (v7);
    }
  }
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __51__SSPurchaseRequest__finishPurchasesWithResponses___block_invoke_2;
  v17[3] = &unk_1E47B8F30;
  v17[4] = self;
  v17[5] = a3;
  v17[6] = &v35;
  dispatch_async(MEMORY[0x1E0C80D38], v17);
  if (*((_BYTE *)v36 + 24))
  {
    v15 = v40[5];
    if (v15)
      (*(void (**)(uint64_t, _QWORD))(v15 + 16))(v15, 0);
    -[SSRequest _endBackgroundTask](self, "_endBackgroundTask");
    v16 = self;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SSVNetworkingDidStopNotification"), 0);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);
}

uint64_t __51__SSPurchaseRequest__finishPurchasesWithResponses___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t result;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = objc_msgSend(*(id *)(a1[4] + 120), "copy");
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) = objc_msgSend(*(id *)(a1[4] + 144), "copy");
  *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40) = objc_msgSend(*(id *)(a1[4] + 152), "copy");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)a1[5];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "purchase"), "uniqueIdentifier"));
        objc_msgSend(*(id *)(a1[4] + 136), "removeObject:", v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  result = objc_msgSend(*(id *)(a1[4] + 136), "count");
  *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = result == 0;
  return result;
}

uint64_t __51__SSPurchaseRequest__finishPurchasesWithResponses___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  uint64_t result;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  char v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = objc_opt_respondsToSelector();
  v12 = objc_opt_respondsToSelector();
  result = objc_opt_respondsToSelector();
  v13 = result;
  if ((v3 & 1) != 0 || (v12 & 1) != 0 || (result & 1) != 0)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = *(void **)(a1 + 40);
    result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (result)
    {
      v6 = result;
      v7 = *(_QWORD *)v15;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
          v10 = objc_msgSend(v9, "error");
          v11 = (void *)objc_msgSend(*(id *)(a1 + 32), "_purchaseForUniqueIdentifier:", objc_msgSend((id)objc_msgSend(v9, "purchase"), "uniqueIdentifier"));
          if (v10)
          {
            if ((v3 & 1) != 0)
            {
              objc_msgSend(v11, "setTidHeaders:", objc_msgSend(v9, "tidHeaders"));
              objc_msgSend(v2, "purchaseRequest:purchaseDidFail:withError:", *(_QWORD *)(a1 + 32), v11, v10);
            }
          }
          else if ((v13 & 1) != 0)
          {
            objc_msgSend(v2, "purchaseRequest:purchaseDidSucceedWithResponse:", *(_QWORD *)(a1 + 32), v9);
          }
          else if ((v12 & 1) != 0)
          {
            objc_msgSend(v2, "purchaseRequest:purchaseDidSucceed:", *(_QWORD *)(a1 + 32), v11);
          }
          ++v8;
        }
        while (v6 != v8);
        result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        v6 = result;
      }
      while (result);
    }
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(v2, "requestDidFinish:", *(_QWORD *)(a1 + 32));
  }
  return result;
}

- (id)_purchaseForUniqueIdentifier:(int64_t)a3
{
  NSArray *purchases;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  purchases = self->_purchases;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](purchases, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(purchases);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if (objc_msgSend(v9, "uniqueIdentifier") == a3)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](purchases, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (BOOL)isBackgroundRequest
{
  return self->_isBackgroundRequest;
}

- (void)setBackgroundRequest:(BOOL)a3
{
  self->_isBackgroundRequest = a3;
}

- (BOOL)createsDownloads
{
  return self->_createsDownloads;
}

- (void)setCreatesDownloads:(BOOL)a3
{
  self->_createsDownloads = a3;
}

- (BOOL)needsAuthentication
{
  return self->_needsAuthentication;
}

- (void)setNeedsAuthentication:(BOOL)a3
{
  self->_needsAuthentication = a3;
}

- (BOOL)isPlaybackRequest
{
  return self->_playbackRequest;
}

- (void)setPlaybackRequest:(BOOL)a3
{
  self->_playbackRequest = a3;
}

- (BOOL)shouldValidatePurchases
{
  return self->_shouldValidatePurchases;
}

- (void)setShouldValidatePurchases:(BOOL)a3
{
  self->_shouldValidatePurchases = a3;
}

- (BOOL)createsJobs
{
  return self->_createsJobs;
}

- (void)setCreatesJobs:(BOOL)a3
{
  self->_createsJobs = a3;
}

@end
