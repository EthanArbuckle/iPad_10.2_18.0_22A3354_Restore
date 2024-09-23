@implementation ICStorePlatformResponse

- (ICStorePlatformResponse)initWithResponseDictionary:(id)a3
{
  return -[ICStorePlatformResponse initWithResponseDictionary:requestedItemIdentifiers:](self, "initWithResponseDictionary:requestedItemIdentifiers:", a3, MEMORY[0x1E0C9AA60]);
}

- (ICStorePlatformResponse)initWithResponseDictionary:(id)a3 requestedItemIdentifiers:(id)a4
{
  id v6;
  id v7;
  ICStorePlatformResponse *v8;
  uint64_t v9;
  NSArray *requestedItemIdentifiers;
  uint64_t v11;
  NSDictionary *responseDictionary;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICStorePlatformResponse;
  v8 = -[ICStorePlatformResponse init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    requestedItemIdentifiers = v8->_requestedItemIdentifiers;
    v8->_requestedItemIdentifiers = (NSArray *)v9;

    v11 = objc_msgSend(v6, "copy");
    responseDictionary = v8->_responseDictionary;
    v8->_responseDictionary = (NSDictionary *)v11;

  }
  return v8;
}

- (ICStorePlatformResponse)initWithURLResponse:(id)a3 requestedItemIdentifiers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  ICStorePlatformResponse *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *storefrontIdentifier;
  id v14;
  const char *v15;
  uint64_t v16;
  NSNumber *accountIdentifier;
  id v18;
  const char *v19;
  uint64_t v20;
  NSNumber *enqueuerAccountIdentifier;
  uint64_t v22;
  NSDate *expirationDate;
  void *v24;
  uint64_t v25;
  ICURLAggregatedPerformanceMetrics *performanceMetrics;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "parsedBodyDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v9 = 0;
LABEL_17:

    goto LABEL_18;
  }
  v9 = -[ICStorePlatformResponse initWithResponseDictionary:requestedItemIdentifiers:](self, "initWithResponseDictionary:requestedItemIdentifiers:", v8, v7);
  if (v9)
  {
    objc_msgSend(v6, "urlRequest");
    self = (ICStorePlatformResponse *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "urlResponse");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ic_valueForHTTPHeaderField:", CFSTR("X-Set-Apple-Store-Front"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11
      || (objc_msgSend(v10, "ic_valueForHTTPHeaderField:", CFSTR("X-Apple-Request-Store-Front")),
          (v11 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
      || (-[ICStorePlatformResponse ic_valueForHTTPHeaderField:](self, "ic_valueForHTTPHeaderField:", CFSTR("X-Apple-Store-Front")), (v11 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v12 = objc_msgSend(v11, "copy");
      storefrontIdentifier = v9->_storefrontIdentifier;
      v9->_storefrontIdentifier = (NSString *)v12;

    }
    -[ICStorePlatformResponse ic_valueForHTTPHeaderField:](self, "ic_valueForHTTPHeaderField:", CFSTR("X-Dsid"));
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = (const char *)objc_msgSend(v14, "UTF8String");

    if (v15)
    {
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", strtoull(v15, 0, 10));
      accountIdentifier = v9->_accountIdentifier;
      v9->_accountIdentifier = (NSNumber *)v16;

    }
    -[ICStorePlatformResponse ic_valueForHTTPHeaderField:](self, "ic_valueForHTTPHeaderField:", CFSTR("X-Enqueuer-DSID"));
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = (const char *)objc_msgSend(v18, "UTF8String");

    if (v19)
    {
      v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", strtoull(v19, 0, 10));
      enqueuerAccountIdentifier = v9->_enqueuerAccountIdentifier;
      v9->_enqueuerAccountIdentifier = (NSNumber *)v20;

    }
    if (objc_msgSend(v10, "hasCacheControl"))
    {
      objc_msgSend(v10, "cacheControlMaxAge");
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:");
      v22 = objc_claimAutoreleasedReturnValue();
      expirationDate = v9->_expirationDate;
      v9->_expirationDate = (NSDate *)v22;

    }
    objc_msgSend(v6, "performanceMetrics");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v6, "aggregatedPerformanceMetrics");
      v25 = objc_claimAutoreleasedReturnValue();
      performanceMetrics = v9->_performanceMetrics;
      v9->_performanceMetrics = (ICURLAggregatedPerformanceMetrics *)v25;

    }
    goto LABEL_17;
  }
LABEL_18:

  return v9;
}

- (NSArray)allItems
{
  void *v3;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__ICStorePlatformResponse_allItems__block_invoke;
  v5[3] = &unk_1E438F178;
  v5[4] = v3;
  -[ICStorePlatformResponse enumerateItemsUsingBlock:](self, "enumerateItemsUsingBlock:", v5);
  return (NSArray *)v3;
}

- (void)enumerateItemsUsingBlock:(id)a3
{
  id v4;
  NSArray *requestedItemIdentifiers;
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  if (-[NSArray count](self->_requestedItemIdentifiers, "count"))
  {
    requestedItemIdentifiers = self->_requestedItemIdentifiers;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __52__ICStorePlatformResponse_enumerateItemsUsingBlock___block_invoke;
    v11[3] = &unk_1E438F1A0;
    v11[4] = self;
    v12 = v4;
    v7 = v4;
    -[NSArray enumerateObjectsUsingBlock:](requestedItemIdentifiers, "enumerateObjectsUsingBlock:", v11);

  }
  else
  {
    -[ICStorePlatformResponse expirationDate](self, "expirationDate");
    v9[1] = 3221225472;
    v9[2] = __52__ICStorePlatformResponse_enumerateItemsUsingBlock___block_invoke_2;
    v9[3] = &unk_1E438F1F0;
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[4] = v8;
    v10 = v4;
    v6 = v4;
    -[ICStorePlatformResponse _enumerateResultDictionariesUsingBlock:](self, "_enumerateResultDictionariesUsingBlock:", v9);

  }
}

- (id)itemForIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  ICStorePlatformResponse *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__29019;
  v16 = __Block_byref_object_dispose__29020;
  v17 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__ICStorePlatformResponse_itemForIdentifier___block_invoke;
  v8[3] = &unk_1E438F218;
  v5 = v4;
  v10 = self;
  v11 = &v12;
  v9 = v5;
  -[ICStorePlatformResponse _enumerateResultDictionariesUsingBlock:](self, "_enumerateResultDictionariesUsingBlock:", v8);
  v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

- (NSString)storefrontIdentifier
{
  NSString *storefrontIdentifier;
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;

  storefrontIdentifier = self->_storefrontIdentifier;
  if (!storefrontIdentifier)
  {
    -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("meta"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!_NSIsNSDictionary())
    {
      v3 = 0;
LABEL_15:

      return v3;
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("storefront"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!_NSIsNSDictionary())
    {
      v3 = 0;
LABEL_14:

      goto LABEL_15;
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("id"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString())
    {
      v7 = v6;
    }
    else
    {
      if (!_NSIsNSNumber())
      {
        v3 = 0;
        goto LABEL_13;
      }
      objc_msgSend(v6, "stringValue");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v3 = v7;
LABEL_13:

    goto LABEL_14;
  }
  v3 = storefrontIdentifier;
  return v3;
}

- (BOOL)isAuthenticated
{
  void *v2;
  char v3;

  -[NSDictionary valueForKey:](self->_responseDictionary, "valueForKey:", CFSTR("isAuthenticated"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (NSDictionary)resultsDictionary
{
  void *v2;
  void *v3;
  NSDictionary *v4;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("results"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)rawResponse
{
  return self->_responseDictionary;
}

- (void)_enumerateResultDictionariesUsingBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("storePlatformData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("results"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __66__ICStorePlatformResponse__enumerateResultDictionariesUsingBlock___block_invoke;
    v8[3] = &unk_1E438F240;
    v9 = v4;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
  else if (_NSIsNSDictionary())
  {
    v7 = 0;
    (*((void (**)(id, void *, const __CFString *, char *))v4 + 2))(v4, v6, &stru_1E4391778, &v7);
  }

}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSNumber)enqueuerAccountIdentifier
{
  return self->_enqueuerAccountIdentifier;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (ICURLAggregatedPerformanceMetrics)performanceMetrics
{
  return self->_performanceMetrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performanceMetrics, 0);
  objc_storeStrong((id *)&self->_storefrontIdentifier, 0);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
  objc_storeStrong((id *)&self->_requestedItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_enqueuerAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

void __66__ICStorePlatformResponse__enumerateResultDictionariesUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("results"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSDictionary())
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __45__ICStorePlatformResponse_itemForIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  ICStorePlatformMetadata *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_msgSend(a2, "objectForKey:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v12 = v6;
    if (_NSIsNSDictionary())
    {
      v7 = [ICStorePlatformMetadata alloc];
      objc_msgSend(*(id *)(a1 + 40), "expirationDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[ICStorePlatformMetadata initWithMetadataDictionary:expirationDate:](v7, "initWithMetadataDictionary:expirationDate:", v12, v8);
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

    }
    *a4 = 1;
    v6 = v12;
  }

}

void __52__ICStorePlatformResponse_enumerateItemsUsingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "itemForIdentifier:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v3 = v4;
  }

}

void __52__ICStorePlatformResponse_enumerateItemsUsingBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__ICStorePlatformResponse_enumerateItemsUsingBlock___block_invoke_3;
  v7[3] = &unk_1E438F1C8;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  v9 = a4;
  objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __52__ICStorePlatformResponse_enumerateItemsUsingBlock___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  ICStorePlatformMetadata *v7;

  v6 = a3;
  if (_NSIsNSDictionary())
  {
    v7 = -[ICStorePlatformMetadata initWithMetadataDictionary:expirationDate:]([ICStorePlatformMetadata alloc], "initWithMetadataDictionary:expirationDate:", v6, *(_QWORD *)(a1 + 32));
    if (v7)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      **(_BYTE **)(a1 + 48) = 0;
      *a4 = 0;
    }

  }
}

uint64_t __35__ICStorePlatformResponse_allItems__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

@end
