@implementation SSWishlistAddItemsRequest

- (SSWishlistAddItemsRequest)init
{
  return -[SSWishlistAddItemsRequest initWithItems:caller:version:](self, "initWithItems:caller:version:", 0, 0, 0);
}

- (SSWishlistAddItemsRequest)initWithItems:(id)a3 caller:(id)a4 version:(id)a5
{
  id v8;
  id v9;
  id v10;
  SSWishlistAddItemsRequest *v11;
  uint64_t v12;
  NSArray *items;
  uint64_t v14;
  NSString *caller;
  uint64_t v16;
  NSString *version;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SSWishlistAddItemsRequest;
  v11 = -[SSRequest init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    items = v11->_items;
    v11->_items = (NSArray *)v12;

    v14 = objc_msgSend(v9, "copy");
    caller = v11->_caller;
    v11->_caller = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    version = v11->_version;
    v11->_version = (NSString *)v16;

  }
  return v11;
}

- (void)startWithAddItemsResponseBlock:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;
  int v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    objc_msgSend(v5, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      v9 = v7;
    else
      v9 = v7 & 2;
    if (v9)
    {
      v21 = 136446210;
      v22 = "-[SSWishlistAddItemsRequest startWithAddItemsResponseBlock:]";
      LODWORD(v18) = 12;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v21, v18);
      v8 = objc_claimAutoreleasedReturnValue();
      free(v10);
      SSFileLog(v5, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __60__SSWishlistAddItemsRequest_startWithAddItemsResponseBlock___block_invoke;
  v19[3] = &unk_1E47B8630;
  v19[4] = self;
  v20 = v4;
  v17 = v4;
  -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 166, v19);

}

void __60__SSWishlistAddItemsRequest_startWithAddItemsResponseBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CFArrayRef v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  xpc_object_t xdict;

  v3 = a2;
  xdict = v3;
  if (*(_QWORD *)(a1 + 40))
  {
    if (v3 == (id)MEMORY[0x1E0C81258])
    {
      SSError((uint64_t)CFSTR("SSErrorDomain"), 121, 0, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = 0;
    }
    else
    {
      objc_opt_class();
      v4 = SSXPCDictionaryCopyCFObjectWithClass(xdict, "1");
      v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
      xpc_dictionary_get_value(xdict, "2");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v5, "initWithXPCEncoding:", v6);

      if (!v7)
      {
        -[__CFArray objectForKey:](v4, "objectForKey:", CFSTR("status"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "intValue"))
        {
          -[__CFArray objectForKey:](v4, "objectForKey:", CFSTR("msg"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          SSError((uint64_t)CFSTR("SSErrorDomain"), 137, 0, (uint64_t)v9);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v7 = 0;
        }

      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest");

}

- (id)copyXPCEncoding
{
  xpc_object_t v3;
  NSObject *dispatchQueue;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  SSWishlistAddItemsRequest *v10;

  v3 = xpc_dictionary_create(0, 0, 0);
  dispatchQueue = self->super._dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__SSWishlistAddItemsRequest_copyXPCEncoding__block_invoke;
  v8[3] = &unk_1E47B8768;
  v5 = v3;
  v9 = v5;
  v10 = self;
  dispatch_sync(dispatchQueue, v8);
  v6 = v5;

  return v6;
}

void __44__SSWishlistAddItemsRequest_copyXPCEncoding__block_invoke(uint64_t a1)
{
  SSXPCDictionarySetCFObject(*(void **)(a1 + 32), "0", *(__CFString **)(*(_QWORD *)(a1 + 40) + 96));
  SSXPCDictionarySetCFObject(*(void **)(a1 + 32), "1", *(__CFString **)(*(_QWORD *)(a1 + 40) + 104));
  SSXPCDictionarySetCFObject(*(void **)(a1 + 32), "2", *(__CFString **)(*(_QWORD *)(a1 + 40) + 112));
}

- (SSWishlistAddItemsRequest)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSWishlistAddItemsRequest *v6;
  uint64_t v8;
  NSArray *items;
  uint64_t v10;
  NSString *caller;
  uint64_t v12;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v6 = -[SSWishlistAddItemsRequest init](self, "init");
    if (!v6)
      goto LABEL_5;
    objc_opt_class();
    SSXPCDictionaryCopyCFObjectWithClass(v5, "0");
    v8 = objc_claimAutoreleasedReturnValue();
    items = v6->_items;
    v6->_items = (NSArray *)v8;

    objc_opt_class();
    SSXPCDictionaryCopyCFObjectWithClass(v5, "1");
    v10 = objc_claimAutoreleasedReturnValue();
    caller = v6->_caller;
    v6->_caller = (NSString *)v10;

    objc_opt_class();
    SSXPCDictionaryCopyCFObjectWithClass(v5, "2");
    v12 = objc_claimAutoreleasedReturnValue();
    self = (SSWishlistAddItemsRequest *)v6->_version;
    v6->_version = (NSString *)v12;
  }
  else
  {
    v6 = 0;
  }

LABEL_5:
  return v6;
}

- (id)copyQueryStringParameters
{
  id v3;
  NSArray *items;
  void *v5;
  NSString *version;
  void *v7;
  NSString *caller;
  void *v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (self->_items)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__77;
    v16 = __Block_byref_object_dispose__77;
    v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    items = self->_items;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __54__SSWishlistAddItemsRequest_copyQueryStringParameters__block_invoke;
    v11[3] = &unk_1E47C0278;
    v11[4] = self;
    v11[5] = &v12;
    -[NSArray enumerateObjectsUsingBlock:](items, "enumerateObjectsUsingBlock:", v11);
    objc_msgSend((id)v13[5], "componentsJoinedByString:", CFSTR(","));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("ids"));

    _Block_object_dispose(&v12, 8);
  }
  version = self->_version;
  if (version)
  {
    v7 = (void *)-[NSString copy](version, "copy");
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("version"));

  }
  caller = self->_caller;
  if (caller)
  {
    v9 = (void *)-[NSString copy](caller, "copy");
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("caller"));

  }
  return v3;
}

void __54__SSWishlistAddItemsRequest_copyQueryStringParameters__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_convertedValueForValue:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v3);
    v3 = v4;
  }

}

- (id)_convertedValueForValue:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = 0;
      goto LABEL_9;
    }
    v5 = (void *)_convertedValueForValue__formatter;
    if (!_convertedValueForValue__formatter)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
      v7 = (void *)_convertedValueForValue__formatter;
      _convertedValueForValue__formatter = (uint64_t)v6;

      objc_msgSend((id)_convertedValueForValue__formatter, "setNumberStyle:", 1);
      objc_msgSend((id)_convertedValueForValue__formatter, "setUsesGroupingSeparator:", 0);
      v5 = (void *)_convertedValueForValue__formatter;
    }
    objc_msgSend(v5, "stringFromNumber:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v4;
LABEL_9:

  return v8;
}

- (NSArray)items
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (NSString)caller
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)version
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_caller, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
