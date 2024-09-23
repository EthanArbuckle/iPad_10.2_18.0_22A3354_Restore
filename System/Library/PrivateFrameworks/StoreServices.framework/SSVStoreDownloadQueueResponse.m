@implementation SSVStoreDownloadQueueResponse

- (id)_initStoreDownloadQueueResponse
{
  SSVStoreDownloadQueueResponse *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *dispatchQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSVStoreDownloadQueueResponse;
  v2 = -[SSVStoreDownloadQueueResponse init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.storeservices.StoreDownloadQueueResponse", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (SSVStoreDownloadQueueResponse)initWithDictionary:(id)a3 userIdentifier:(id)a4
{
  return -[SSVStoreDownloadQueueResponse initWithDictionary:userIdentifier:preferredAssetFlavor:](self, "initWithDictionary:userIdentifier:preferredAssetFlavor:", a3, a4, 0);
}

- (SSVStoreDownloadQueueResponse)initWithDictionary:(id)a3 userIdentifier:(id)a4 preferredAssetFlavor:(id)a5
{
  id v8;
  id v9;
  id v10;
  SSVStoreDownloadQueueResponse *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  char v15;
  void *v16;
  uint64_t v17;
  NSArray *rangesToLoad;
  void *v19;
  void *v20;
  uint64_t v21;
  NSError *error;
  id v23;
  SSVStoreDownloadQueueResponse *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  BOOL v36;
  uint64_t v37;
  NSDictionary *itemErrors;
  uint64_t v39;
  NSData *keybag;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  NSMutableOrderedSet *v45;
  NSMutableOrderedSet *downloads;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t j;
  SSVStoreDownload *v52;
  void *v53;
  char v54;
  SSDictionaryResponse *v55;
  void *v56;
  char v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[SSVStoreDownloadQueueResponse _initStoreDownloadQueueResponse](self, "_initStoreDownloadQueueResponse");
  if (v11)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("page-type"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0x1E0C99000uLL;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "objectForKey:", CFSTR("template-name"));
      v14 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v14;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = objc_msgSend(v12, "isEqualToString:", CFSTR("preorder-success"));
    else
      v15 = 0;
    objc_msgSend(v8, "objectForKey:", CFSTR("more"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      SSVCopyLoadMoreRangesFromArray(v16);
      v17 = objc_claimAutoreleasedReturnValue();
      rangesToLoad = v11->_rangesToLoad;
      v11->_rangesToLoad = (NSArray *)v17;

    }
    objc_msgSend(v8, "objectForKey:", CFSTR("failureType"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("customerMessage"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSVStoreDownloadQueueResponse _errorWithFailureType:customerMessage:](v11, "_errorWithFailureType:customerMessage:", v19, v20);
      v21 = objc_claimAutoreleasedReturnValue();
      error = v11->_error;
      v11->_error = (NSError *)v21;

    }
    objc_msgSend(v8, "objectForKey:", CFSTR("failed-items"));
    v23 = (id)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v58 = v15;
      v60 = v10;
      v61 = v8;
      v62 = v9;
      v24 = v11;
      v64 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v69 = 0u;
      v70 = 0u;
      v71 = 0u;
      v72 = 0u;
      v59 = v23;
      v25 = v23;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v70;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v70 != v28)
              objc_enumerationMutation(v25);
            v30 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v31 = v13;
              objc_msgSend(v30, "objectForKey:", CFSTR("item-id"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "objectForKey:", CFSTR("failureType"));
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "objectForKey:", CFSTR("customerMessage"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              -[SSVStoreDownloadQueueResponse _errorWithFailureType:customerMessage:](v24, "_errorWithFailureType:customerMessage:", v33, v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              if (v32)
                v36 = v35 == 0;
              else
                v36 = 1;
              if (!v36)
                objc_msgSend(v64, "setObject:forKey:", v35, v32);

              v13 = v31;
            }
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
        }
        while (v27);
      }

      v37 = objc_msgSend(v64, "copy");
      v11 = v24;
      itemErrors = v24->_itemErrors;
      v24->_itemErrors = (NSDictionary *)v37;

      v8 = v61;
      v9 = v62;
      v23 = v59;
      v10 = v60;
      v15 = v58;
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("keybag"));
    v39 = objc_claimAutoreleasedReturnValue();
    keybag = v11->_keybag;
    v11->_keybag = (NSData *)v39;

    objc_msgSend(v8, "objectForKey:", CFSTR("dsPersonId"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    SSAccountGetUniqueIdentifierFromValue(v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
      v43 = v42;
    else
      v43 = v9;
    objc_storeStrong((id *)&v11->_userIdentifier, v43);
    if ((v15 & 1) == 0)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("items"));
      v44 = objc_claimAutoreleasedReturnValue();

      v23 = (id)v44;
      if (!v44)
      {
        objc_msgSend(v8, "objectForKey:", CFSTR("songList"));
        v23 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v63 = v9;
        v45 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
        downloads = v11->_downloads;
        v11->_downloads = v45;

        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        v23 = v23;
        v47 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
        if (v47)
        {
          v48 = v47;
          v49 = *(_QWORD *)v66;
          do
          {
            v50 = v23;
            for (j = 0; j != v48; ++j)
            {
              if (*(_QWORD *)v66 != v49)
                objc_enumerationMutation(v50);
              v52 = -[SSVStoreDownload initWithDictionary:]([SSVStoreDownload alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * j));
              if (objc_msgSend(v10, "length"))
                -[SSVStoreDownload setPreferredAssetFlavor:](v52, "setPreferredAssetFlavor:", v10);
              -[NSMutableOrderedSet addObject:](v11->_downloads, "addObject:", v52);

            }
            v23 = v50;
            v48 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
          }
          while (v48);
        }

        v9 = v63;
      }
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("cancel-purchase-batch"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      v54 = objc_msgSend(v53, "BOOLValue");
    else
      v54 = 0;
    v11->_shouldCancelPurchaseBatch = v54;
    v55 = -[SSDictionaryResponse initWithResponseDictionary:]([SSDictionaryResponse alloc], "initWithResponseDictionary:", v8);
    -[SSDictionaryResponse actionsWithActionType:](v55, "actionsWithActionType:", CFSTR("SSResponseActionTypeCheckDownloadQueues"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_triggeredQueueCheck = objc_msgSend(v56, "count") != 0;

  }
  return v11;
}

- (SSVStoreDownloadQueueResponse)initWithError:(id)a3 userIdentifier:(id)a4
{
  id v7;
  id v8;
  id *v9;
  SSVStoreDownloadQueueResponse *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[SSVStoreDownloadQueueResponse _initStoreDownloadQueueResponse](self, "_initStoreDownloadQueueResponse");
  v10 = (SSVStoreDownloadQueueResponse *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 3, a3);
    objc_storeStrong((id *)&v10->_userIdentifier, a4);
  }

  return v10;
}

- (NSOrderedSet)downloads
{
  return (NSOrderedSet *)(id)-[NSMutableOrderedSet copy](self->_downloads, "copy");
}

- (NSError)error
{
  NSObject *dispatchQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__80;
  v10 = __Block_byref_object_dispose__80;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__SSVStoreDownloadQueueResponse_error__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSError *)v3;
}

void __38__SSVStoreDownloadQueueResponse_error__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

- (id)errorForItemIdentifier:(id)a3
{
  return -[NSDictionary objectForKey:](self->_itemErrors, "objectForKey:", a3);
}

- (NSData)keybag
{
  return self->_keybag;
}

- (NSArray)rangesToLoad
{
  return self->_rangesToLoad;
}

- (void)setError:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__SSVStoreDownloadQueueResponse_setError___block_invoke;
  block[3] = &unk_1E47B8768;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(dispatchQueue, block);

}

void __42__SSVStoreDownloadQueueResponse_setError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id *v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v5 = *(void **)(v2 + 24);
  v4 = (id *)(v2 + 24);
  if (v5 != v3)
    objc_storeStrong(v4, v3);
}

- (void)setShouldCancelPurchaseBatch:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__SSVStoreDownloadQueueResponse_setShouldCancelPurchaseBatch___block_invoke;
  v4[3] = &unk_1E47B9850;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __62__SSVStoreDownloadQueueResponse_setShouldCancelPurchaseBatch___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 56) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setTriggeredQueueCheck:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__SSVStoreDownloadQueueResponse_setTriggeredQueueCheck___block_invoke;
  v4[3] = &unk_1E47B9850;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __56__SSVStoreDownloadQueueResponse_setTriggeredQueueCheck___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 57) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)shouldCancelPurchaseBatch
{
  NSObject *dispatchQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__SSVStoreDownloadQueueResponse_shouldCancelPurchaseBatch__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __58__SSVStoreDownloadQueueResponse_shouldCancelPurchaseBatch__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 56);
  return result;
}

- (BOOL)triggeredQueueCheck
{
  NSObject *dispatchQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__SSVStoreDownloadQueueResponse_triggeredQueueCheck__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __52__SSVStoreDownloadQueueResponse_triggeredQueueCheck__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 57);
  return result;
}

- (NSNumber)userIdentifier
{
  return self->_userIdentifier;
}

- (id)_errorWithFailureType:(id)a3 customerMessage:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v6 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = (int)objc_msgSend(v5, "intValue");
    v8 = CFSTR("SSServerErrorDomain");
  }
  else
  {
    v8 = CFSTR("SSErrorDomain");
    v7 = 100;
  }
  SSError((uint64_t)v8, v7, (uint64_t)v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)storeCorrelationID
{
  return self->_storeCorrelationID;
}

- (void)setStoreCorrelationID:(id)a3
{
  self->_storeCorrelationID = (NSString *)a3;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  self->_clientIdentifier = (NSString *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_rangesToLoad, 0);
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_storeStrong((id *)&self->_itemErrors, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_downloads, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
