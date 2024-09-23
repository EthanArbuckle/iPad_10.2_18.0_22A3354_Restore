@implementation SSPersonalizeOffersRequest

- (SSPersonalizeOffersRequest)initWithItems:(id)a3
{
  SSPersonalizeOffersRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSPersonalizeOffersRequest;
  v4 = -[SSRequest init](&v6, sel_init);
  if (v4)
    v4->_items = (NSArray *)objc_msgSend(a3, "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSPersonalizeOffersRequest;
  -[SSRequest dealloc](&v3, sel_dealloc);
}

- (NSArray)items
{
  return self->_items;
}

- (void)startWithPersonalizedResponseBlock:(id)a3
{
  id v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int *v18;
  uint64_t v19;
  _QWORD v20[6];
  int v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    v5 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v5)
      v5 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v5, "OSLogObject"), OS_LOG_TYPE_FAULT))
      v8 = v7;
    else
      v8 = v7 & 2;
    if (v8)
    {
      v21 = 136446210;
      v22 = "-[SSPersonalizeOffersRequest startWithPersonalizedResponseBlock:]";
      LODWORD(v19) = 12;
      v18 = &v21;
      v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        v10 = (void *)v9;
        v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4, &v21, v19);
        free(v10);
        SSFileLog(v5, CFSTR("%@"), v12, v13, v14, v15, v16, v17, v11);
      }
    }
  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __65__SSPersonalizeOffersRequest_startWithPersonalizedResponseBlock___block_invoke;
  v20[3] = &unk_1E47B8EE0;
  v20[4] = self;
  v20[5] = a3;
  -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 55, v20, v18);
}

uint64_t __65__SSPersonalizeOffersRequest_startWithPersonalizedResponseBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  SSItem *v18;
  SSItemOffer *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *global_queue;
  uint64_t v24;
  uint64_t v26;
  _QWORD block[7];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v2 = a1;
  v33 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 40))
  {
    if (a2 == (void *)MEMORY[0x1E0C81258])
    {
      v6 = 121;
    }
    else
    {
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithXPCEncoding:", xpc_dictionary_get_value(a2, "2"));
      v5 = -[SSPersonalizeOffersResponse initWithXPCEncoding:]([SSPersonalizeOffersResponse alloc], "initWithXPCEncoding:", xpc_dictionary_get_value(a2, "1"));
      if (v5 | v4)
      {
        v7 = (void *)v5;
        if (v5)
        {
          v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v26 = v2;
          v9 = *(void **)(*(_QWORD *)(v2 + 32) + 96);
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v29;
            do
            {
              for (i = 0; i != v11; ++i)
              {
                if (*(_QWORD *)v29 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
                v15 = objc_msgSend((id)objc_msgSend(v14, "ITunesStoreIdentifier"), "stringValue");
                if (v15 && (v16 = objc_msgSend(v7, "actionParametersForItemIdentifier:", v15)) != 0)
                {
                  v17 = v16;
                  v18 = -[SSItem initWithItemDictionary:]([SSItem alloc], "initWithItemDictionary:", objc_msgSend(v14, "rawItemDictionary"));
                  v19 = -[SSItem defaultItemOffer](v18, "defaultItemOffer");
                  -[SSItemOffer setBuyParameters:](v19, "setBuyParameters:", v17);
                  v20 = -[SSItem itemKind](v18, "itemKind");
                  v21 = objc_msgSend(v7, "priceDisplayForItemType:", v20);
                  if (v21)
                    -[SSItemOffer setPriceDisplay:](v19, "setPriceDisplay:", v21);
                  v22 = objc_msgSend(v7, "actionDisplayNameForItemType:", v20);
                  -[SSItemOffer setActionDisplayName:](v19, "setActionDisplayName:", v22);
                  -[SSItemOffer setOneTapOffer:](v19, "setOneTapOffer:", v22 == 0);
                  objc_msgSend(v8, "addObject:", v18);

                }
                else
                {
                  objc_msgSend(v8, "addObject:", v14);
                }
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
            }
            while (v11);
          }
          objc_msgSend(v7, "_setPersonalizedItems:", v8);

          v2 = v26;
        }
        goto LABEL_22;
      }
      v6 = 100;
    }
    v4 = (uint64_t)(id)SSError((uint64_t)CFSTR("SSErrorDomain"), v6, 0, 0);
    v7 = 0;
LABEL_22:
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__SSPersonalizeOffersRequest_startWithPersonalizedResponseBlock___block_invoke_2;
    block[3] = &unk_1E47B9E60;
    v24 = *(_QWORD *)(v2 + 40);
    block[5] = v4;
    block[6] = v24;
    block[4] = v7;
    dispatch_async(global_queue, block);

  }
  return objc_msgSend(*(id *)(v2 + 32), "_shutdownRequest");
}

uint64_t __65__SSPersonalizeOffersRequest_startWithPersonalizedResponseBlock___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (BOOL)start
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__SSPersonalizeOffersRequest_start__block_invoke;
  v3[3] = &unk_1E47BD530;
  v3[4] = self;
  -[SSPersonalizeOffersRequest startWithPersonalizedResponseBlock:](self, "startWithPersonalizedResponseBlock:", v3);
  return 1;
}

void __35__SSPersonalizeOffersRequest_start__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD block[7];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SSPersonalizeOffersRequest_start__block_invoke_2;
  block[3] = &unk_1E47B9E88;
  block[4] = *(_QWORD *)(a1 + 32);
  block[5] = a2;
  block[6] = a3;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __35__SSPersonalizeOffersRequest_start__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "delegate");
  if (*(_QWORD *)(a1 + 40))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v2, "personalizeOffersRequest:didReceiveResponse:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(v2, "requestDidFinish:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(v2, "request:didFailWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  return result;
}

- (void)startWithCompletionBlock:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__SSPersonalizeOffersRequest_startWithCompletionBlock___block_invoke;
  v3[3] = &unk_1E47BD558;
  v3[4] = a3;
  -[SSPersonalizeOffersRequest startWithPersonalizedResponseBlock:](self, "startWithPersonalizedResponseBlock:", v3);
}

uint64_t __55__SSPersonalizeOffersRequest_startWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (SSPersonalizeOffersRequest)initWithXPCEncoding:(id)a3
{
  SSPersonalizeOffersRequest *v5;
  CFArrayRef v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  SSItem *v14;
  SSItem *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a3 && MEMORY[0x1A85863E4](a3, a2) == MEMORY[0x1E0C812F8])
  {
    v5 = -[SSRequest init](self, "init");
    if (v5)
    {
      objc_opt_class();
      v7 = SSXPCDictionaryCopyCFObjectWithClass(a3, "50");
      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v9 = -[__CFArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v17;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v7);
            v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v14 = -[SSItem initWithItemDictionary:]([SSItem alloc], "initWithItemDictionary:", v13);
              if (v14)
              {
                v15 = v14;
                objc_msgSend(v8, "addObject:", v14);

              }
            }
            ++v12;
          }
          while (v10 != v12);
          v10 = -[__CFArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v10);
      }

      v5->_items = (NSArray *)objc_msgSend(v8, "copy");
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;
  __CFString *v4;
  NSArray *items;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = xpc_dictionary_create(0, 0, 0);
  v4 = (__CFString *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  items = self->_items;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](items, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(items);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "rawItemDictionary");
        if (v10)
          -[__CFString addObject:](v4, "addObject:", v10);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](items, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  SSXPCDictionarySetCFObject(v3, "50", v4);

  return v3;
}

@end
