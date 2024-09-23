@implementation SSLookupResponse

- (SSLookupResponse)initWithLocationResponseDictionary:(id)a3
{
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t i;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  SSLookupResponse *v26;
  _QWORD v27[6];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    return 0;
  }
  v32.receiver = self;
  v32.super_class = (Class)SSLookupResponse;
  v26 = -[SSLookupResponse init](&v32, sel_init);
  if (!v26)
    return 0;
  v5 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("storePlatformData"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ((v6 = objc_msgSend(a3, "objectForKey:", CFSTR("storePlatformPrewarmDataKey")),
         objc_opt_class(),
         (objc_opt_isKindOfClass() & 1) == 0)
      ? (v7 = CFSTR("lockup-search"))
      : (v7 = (const __CFString *)v6),
        v8 = (void *)objc_msgSend(v5, "objectForKey:", v7),
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) != 0))
  {
    v24 = (void *)objc_msgSend(v8, "mutableCopy");
    v25 = (void *)objc_msgSend((id)objc_msgSend(v24, "objectForKey:", CFSTR("results")), "mutableCopy");
  }
  else
  {
    v24 = 0;
    v25 = 0;
  }
  v9 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("results"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26->_itemOrder = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v29;
      v13 = CFSTR("id");
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v29 != v12)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v16 = (void *)objc_msgSend(v15, "objectForKey:", v13);
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v17 = v13;
              v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), objc_msgSend(v16, "longLongValue"));
              v19 = (void *)objc_msgSend(v15, "objectForKey:", CFSTR("poiBased"));
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                if (objc_msgSend(v19, "BOOLValue"))
                {
                  v20 = (void *)objc_msgSend((id)objc_msgSend(v25, "objectForKey:", v18), "mutableCopy");
                  if (v20)
                  {
                    v21 = v20;
                    objc_msgSend(v20, "setObject:forKey:", v19, CFSTR("poiBased"));
                    objc_msgSend(v25, "setObject:forKey:", v21, v18);

                  }
                }
              }
              -[NSMutableArray addObject:](v26->_itemOrder, "addObject:", v18);

              v13 = v17;
            }
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v11);
    }
  }
  if (v25)
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("results"), CFSTR("storePlatformData"), CFSTR("storePlatformPrewarmDataKey"), 0);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __55__SSLookupResponse_initWithLocationResponseDictionary___block_invoke;
    v27[3] = &unk_1E47BDCF8;
    v27[4] = v22;
    v27[5] = v24;
    objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v27);
    objc_msgSend(v24, "setObject:forKey:", v25, CFSTR("results"));

  }
  v26->_response = (NSDictionary *)objc_msgSend(v24, "copy");

  return v26;
}

uint64_t __55__SSLookupResponse_initWithLocationResponseDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", a3, a2);
  return result;
}

- (SSLookupResponse)initWithResponseDictionary:(id)a3
{
  SSLookupResponse *v5;
  objc_super v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)SSLookupResponse;
    v5 = -[SSLookupResponse init](&v7, sel_init);
    if (v5)
      v5->_response = (NSDictionary *)objc_msgSend(a3, "copy");
  }
  else
  {

    return 0;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSLookupResponse;
  -[SSLookupResponse dealloc](&v3, sel_dealloc);
}

- (NSArray)allItems
{
  NSArray *v3;
  _QWORD v5[5];

  v3 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__SSLookupResponse_allItems__block_invoke;
  v5[3] = &unk_1E47BDD20;
  v5[4] = v3;
  -[SSLookupResponse _enumerateItemsWithBlock:](self, "_enumerateItemsWithBlock:", v5);
  return v3;
}

uint64_t __28__SSLookupResponse_allItems__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)appStoreURLWithReason:(int64_t)a3 initialIndex:(int64_t)a4
{
  void *v5;
  void *v6;
  _QWORD v8[5];

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("itms-apps2://?action=lookup&i=%ld&r=%ld"), a4, a3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__SSLookupResponse_appStoreURLWithReason_initialIndex___block_invoke;
  v8[3] = &unk_1E47BDD20;
  v8[4] = v5;
  -[SSLookupResponse _enumerateItemsWithBlock:](self, "_enumerateItemsWithBlock:", v8);
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);

  return v6;
}

uint64_t __55__SSLookupResponse_appStoreURLWithReason_initialIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t result;
  const __CFString *v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend(a2, "ITunesStoreIdentifier"), "stringValue");
  result = objc_msgSend(v5, "length");
  if (result)
  {
    if (a3)
      v7 = CFSTR(",");
    else
      v7 = CFSTR("&ids=");
    objc_msgSend(*(id *)(a1 + 32), "appendString:", v7);
    return objc_msgSend(*(id *)(a1 + 32), "appendString:", v5);
  }
  return result;
}

- (id)itemForKey:(id)a3
{
  id v4;
  uint64_t v5;
  SSLookupItem *v6;

  v4 = -[NSDictionary objectForKey:](self->_response, "objectForKey:", CFSTR("results"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = objc_msgSend(v4, "objectForKey:", a3), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = -[SSLookupItem initWithLookupDictionary:]([SSLookupItem alloc], "initWithLookupDictionary:", v5);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (SSMetricsConfiguration)metricsConfiguration
{
  return -[SSMetricsConfiguration initWithGlobalConfiguration:]([SSMetricsConfiguration alloc], "initWithGlobalConfiguration:", self->_response);
}

- (id)valueForProperty:(id)a3
{
  return -[NSDictionary objectForKey:](self->_response, "objectForKey:", a3);
}

- (NSDictionary)responseDictionary
{
  return self->_response;
}

- (void)_enumerateItemsWithBlock:(id)a3
{
  id v5;
  NSMutableArray *itemOrder;
  _QWORD v7[6];
  _QWORD v8[4];
  _QWORD v9[6];

  v5 = -[NSDictionary objectForKey:](self->_response, "objectForKey:", CFSTR("results"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (-[NSMutableArray count](self->_itemOrder, "count"))
    {
      itemOrder = self->_itemOrder;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __45__SSLookupResponse__enumerateItemsWithBlock___block_invoke;
      v9[3] = &unk_1E47BDD50;
      v9[4] = v5;
      v9[5] = a3;
      -[NSMutableArray enumerateObjectsUsingBlock:](itemOrder, "enumerateObjectsUsingBlock:", v9);
    }
    else
    {
      v8[0] = 0;
      v8[1] = v8;
      v8[2] = 0x2020000000;
      v8[3] = 0;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __45__SSLookupResponse__enumerateItemsWithBlock___block_invoke_2;
      v7[3] = &unk_1E47BDD78;
      v7[4] = a3;
      v7[5] = v8;
      objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);
      _Block_object_dispose(v8, 8);
    }
  }
}

void __45__SSLookupResponse__enumerateItemsWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  SSLookupItem *v4;
  SSLookupItem *v5;

  v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = -[SSLookupItem initWithLookupDictionary:]([SSLookupItem alloc], "initWithLookupDictionary:", v3);
    if (v4)
    {
      v5 = v4;
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
  }
}

void __45__SSLookupResponse__enumerateItemsWithBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  SSLookupItem *v5;
  SSLookupItem *v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[SSLookupItem initWithLookupDictionary:]([SSLookupItem alloc], "initWithLookupDictionary:", a3);
    if (v5)
    {
      v6 = v5;
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

    }
  }
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_expirationDate);
  SSXPCDictionarySetCFObject(v3, "1", (__CFString *)self->_itemOrder);
  SSXPCDictionarySetCFObject(v3, "3", (__CFString *)-[SSMetricsMutableEvent bodyDictionary](self->_metricsPageEvent, "bodyDictionary"));
  SSXPCDictionarySetCFObject(v3, "2", (__CFString *)self->_response);
  return v3;
}

- (SSLookupResponse)initWithXPCEncoding:(id)a3
{
  SSLookupResponse *v5;
  xpc_object_t value;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  CFArrayRef v11;
  CFArrayRef v12;
  _QWORD applier[5];
  objc_super v14;

  if (a3 && MEMORY[0x1A85863E4](a3, a2) == MEMORY[0x1E0C812F8])
  {
    v14.receiver = self;
    v14.super_class = (Class)SSLookupResponse;
    v5 = -[SSLookupResponse init](&v14, sel_init);
    if (v5)
    {
      objc_opt_class();
      v5->_expirationDate = (NSDate *)SSXPCDictionaryCopyCFObjectWithClass(a3, "0");
      objc_opt_class();
      v5->_response = (NSDictionary *)SSXPCDictionaryCopyCFObjectWithClass(a3, "2");
      value = xpc_dictionary_get_value(a3, "1");
      if (value)
      {
        v8 = value;
        if (MEMORY[0x1A85863E4]() == MEMORY[0x1E0C812C8])
        {
          v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v10 = MEMORY[0x1E0C809B0];
          v5->_itemOrder = v9;
          applier[0] = v10;
          applier[1] = 3221225472;
          applier[2] = __40__SSLookupResponse_initWithXPCEncoding___block_invoke;
          applier[3] = &unk_1E47B9F50;
          applier[4] = v5;
          xpc_array_apply(v8, applier);
        }
      }
      objc_opt_class();
      v11 = SSXPCDictionaryCopyCFObjectWithClass(a3, "3");
      if (v11)
      {
        v12 = v11;
        v5->_metricsPageEvent = -[SSMetricsMutableEvent initWithBodyDictionary:]([SSMetricsPageEvent alloc], "initWithBodyDictionary:", v11);

      }
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

uint64_t __40__SSLookupResponse_initWithXPCEncoding___block_invoke(uint64_t a1, uint64_t a2, const __CFDictionary *a3)
{
  CFArrayRef v5;

  if (MEMORY[0x1A85863E4](a3) == MEMORY[0x1E0C81390])
  {
    v5 = SSXPCCreateCFObjectFromXPCObject(a3);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", v5);

  }
  return 1;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (SSMetricsPageEvent)metricsPageEvent
{
  return self->_metricsPageEvent;
}

- (void)_setMetricsPageEvent:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
