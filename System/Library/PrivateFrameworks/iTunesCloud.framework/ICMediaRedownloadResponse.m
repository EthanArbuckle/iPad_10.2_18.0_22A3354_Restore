@implementation ICMediaRedownloadResponse

- (ICMediaRedownloadResponse)initWithResponseDictionary:(id)a3 requestDate:(id)a4 urlBag:(id)a5
{
  id v8;
  id v9;
  id v10;
  ICMediaRedownloadResponse *v11;
  uint64_t v12;
  NSDate *requestDate;
  uint64_t v14;
  NSDictionary *responseDictionary;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ICMediaRedownloadResponse;
  v11 = -[ICMediaRedownloadResponse init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v9, "copy");
    requestDate = v11->_requestDate;
    v11->_requestDate = (NSDate *)v12;

    v14 = objc_msgSend(v8, "copy");
    responseDictionary = v11->_responseDictionary;
    v11->_responseDictionary = (NSDictionary *)v14;

    objc_storeStrong((id *)&v11->_urlBag, a5);
  }

  return v11;
}

- (BOOL)authorized
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("authorized"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (BOOL)shouldCancelPurchaseBatch
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("cancel-purchase-batch"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (int64_t)status
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("status"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
    v3 = objc_msgSend(v2, "longLongValue");
  else
    v3 = 0;

  return v3;
}

- (ICStoreDialogResponse)dialog
{
  void *v2;
  ICStoreDialogResponse *v3;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("dialog"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
    v3 = -[ICStoreDialogResponse initWithResponseDictionary:]([ICStoreDialogResponse alloc], "initWithResponseDictionary:", v2);
  else
    v3 = 0;

  return v3;
}

- (NSError)serverError
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("failureType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICStoreServerError"), objc_msgSend(v2, "integerValue"), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSError *)v3;
}

- (unsigned)downloadQueueItemCount
{
  void *v2;
  unsigned int v3;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("download-queue-item-count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
    v3 = objc_msgSend(v2, "unsignedIntValue");
  else
    v3 = 0;

  return v3;
}

- (NSString)jingleAction
{
  void *v2;
  void *v3;
  NSString *v4;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("jingleAction"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSArray)items
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  ICStoreMediaResponseItem *v11;
  void *v12;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("songList"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSArray())
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v14 = v3;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v4);
          v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (_NSIsNSDictionary())
          {
            v11 = -[ICStoreMediaResponseItem initWithItemResponseDictionary:urlBag:]([ICStoreMediaResponseItem alloc], "initWithItemResponseDictionary:urlBag:", v10, self->_urlBag);
            -[NSDate dateByAddingTimeInterval:](self->_requestDate, "dateByAddingTimeInterval:", 7200.0);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICStoreMediaResponseItem setAssetExpirationDate:](v11, "setAssetExpirationDate:", v12);

            if (!v7)
              v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v7, "addObject:", v11);

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }

    v3 = v14;
  }
  else
  {
    v7 = 0;
  }

  return (NSArray *)v7;
}

- (NSData)subscriptionKeyBagData
{
  return (NSData *)ICMusicSubscriptionFairPlaySubscriptionKeyBagForResponseDictionary(self->_responseDictionary);
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDictionary, 0);
  objc_storeStrong((id *)&self->_urlBag, 0);
  objc_storeStrong((id *)&self->_requestDate, 0);
}

@end
