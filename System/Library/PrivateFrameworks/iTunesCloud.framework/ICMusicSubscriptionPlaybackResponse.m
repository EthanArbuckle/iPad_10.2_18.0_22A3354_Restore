@implementation ICMusicSubscriptionPlaybackResponse

- (ICMusicSubscriptionPlaybackResponse)initWithResponseDictionary:(id)a3 requestDate:(id)a4 urlBag:(id)a5
{
  id v9;
  id v10;
  id v11;
  ICMusicSubscriptionPlaybackResponse *v12;
  ICMusicSubscriptionPlaybackResponse *v13;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[ICMusicSubscriptionPlaybackResponse init](self, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_responseDictionary, a3);
    objc_storeStrong((id *)&v13->_requestDate, a4);
    objc_storeStrong((id *)&v13->_urlBag, a5);
  }

  return v13;
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

- (NSString)householdID
{
  void *v2;
  id v3;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("householdId"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;

  return (NSString *)v3;
}

- (NSDate)leaseExpirationDate
{
  void *v3;
  void *v4;
  NSDate *requestDate;
  double v6;
  NSDate *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("ICMusicSubscriptionLeaseDurationInterval"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (v4)
      goto LABEL_6;
  }
  else
  {

  }
  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("leaseDurationInSeconds"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    requestDate = self->_requestDate;
    objc_msgSend(v4, "doubleValue");
    v7 = requestDate;
LABEL_11:
    -[NSDate dateByAddingTimeInterval:](v7, "dateByAddingTimeInterval:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  -[ICMusicSubscriptionPlaybackResponse serverError](self, "serverError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v7 = self->_requestDate;
    v6 = 600.0;
    goto LABEL_11;
  }
  v9 = 0;
LABEL_12:

  return (NSDate *)v9;
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
  ICMusicSubscriptionPlaybackResponseItem *v11;
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
            v11 = -[ICMusicSubscriptionPlaybackResponseItem initWithItemResponseDictionary:urlBag:]([ICMusicSubscriptionPlaybackResponseItem alloc], "initWithItemResponseDictionary:urlBag:", v10, self->_urlBag);
            -[NSDate dateByAddingTimeInterval:](self->_requestDate, "dateByAddingTimeInterval:", 7200.0);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICMusicSubscriptionPlaybackResponseItem setAssetExpirationDate:](v11, "setAssetExpirationDate:", v12);

            if (v11)
            {
              if (!v7)
                v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              objc_msgSend(v7, "addObject:", v11);
            }

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

- (id)itemWithStoreAdamID:(int64_t)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[ICMusicSubscriptionPlaybackResponse items](self, "items");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "storeAdamID", (_QWORD)v12) == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (NSData)leaseInfoData
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  NSData *v6;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("ckc"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSData())
  {
    v3 = v2;
LABEL_5:
    v4 = v3;
    goto LABEL_7;
  }
  if (_NSIsNSString())
  {
    v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v2, 0);
    goto LABEL_5;
  }
  v4 = 0;
LABEL_7:
  if (objc_msgSend(v4, "length"))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
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

- (NSData)subscriptionKeyBagData
{
  return (NSData *)ICMusicSubscriptionFairPlaySubscriptionKeyBagForResponseDictionary(self->_responseDictionary);
}

- (NSDictionary)metricsDictionary
{
  return (NSDictionary *)-[NSDictionary ic_dictionaryValueForKey:](self->_responseDictionary, "ic_dictionaryValueForKey:", CFSTR("metrics"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlBag, 0);
  objc_storeStrong((id *)&self->_requestDate, 0);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

@end
