@implementation SSMachineDataRequest

- (SSMachineDataRequest)initWithURLResponse:(id)a3
{
  id v4;
  SSMachineDataRequest *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  NSData *actionData;
  uint64_t v14;
  NSString *actionName;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SSMachineDataRequest;
  v5 = -[SSRequest init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "allHeaderFields");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HeaderValueForKey(v6, CFSTR("X-Apple-MD-Action"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("X-Apple-MD-Data");
    if (!objc_msgSend(v7, "length"))
    {
      HeaderValueForKey(v6, CFSTR("X-Apple-AMD-Action"));
      v9 = objc_claimAutoreleasedReturnValue();

      v10 = CFSTR("X-Apple-AMD-Data");
      v5->_protocolVersion = 1;
      v7 = (void *)v9;
      v8 = v10;
    }
    if (objc_msgSend(v7, "length"))
    {
      HeaderValueForKey(v6, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "length"))
      {
        v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v11, 0);
        actionData = v5->_actionData;
        v5->_actionData = (NSData *)v12;

      }
      v14 = objc_msgSend(v7, "copy");
      actionName = v5->_actionName;
      v5->_actionName = (NSString *)v14;

    }
    else
    {
      v11 = v5;
      v5 = 0;
    }

  }
  return v5;
}

- (NSNumber)accountIdentifier
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
  v9 = __Block_byref_object_copy__64;
  v10 = __Block_byref_object_dispose__64;
  v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__SSMachineDataRequest_accountIdentifier__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSNumber *)v3;
}

void __41__SSMachineDataRequest_accountIdentifier__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 96));
}

- (NSData)actionData
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
  v9 = __Block_byref_object_copy__64;
  v10 = __Block_byref_object_dispose__64;
  v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__SSMachineDataRequest_actionData__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSData *)v3;
}

void __34__SSMachineDataRequest_actionData__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 104));
}

- (NSString)actionName
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
  v9 = __Block_byref_object_copy__64;
  v10 = __Block_byref_object_dispose__64;
  v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__SSMachineDataRequest_actionName__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __34__SSMachineDataRequest_actionName__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 112));
}

- (BOOL)allowsBootstrapCellularData
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
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__SSMachineDataRequest_allowsBootstrapCellularData__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __51__SSMachineDataRequest_allowsBootstrapCellularData__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 120);
  return result;
}

- (int64_t)protocolVersion
{
  NSObject *dispatchQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__SSMachineDataRequest_protocolVersion__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__SSMachineDataRequest_protocolVersion__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 128);
  return result;
}

- (void)setAccountIdentifier:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__SSMachineDataRequest_setAccountIdentifier___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __45__SSMachineDataRequest_setAccountIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 96) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 96);
    *(_QWORD *)(v5 + 96) = v4;

  }
}

- (void)setActionData:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__SSMachineDataRequest_setActionData___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __38__SSMachineDataRequest_setActionData___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 104) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 104);
    *(_QWORD *)(v5 + 104) = v4;

  }
}

- (void)setActionName:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__SSMachineDataRequest_setActionName___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __38__SSMachineDataRequest_setActionName___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 112) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 112);
    *(_QWORD *)(v5 + 112) = v4;

  }
}

- (void)setAllowsBootstrapCellularData:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__SSMachineDataRequest_setAllowsBootstrapCellularData___block_invoke;
  v4[3] = &unk_1E47B9850;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __55__SSMachineDataRequest_setAllowsBootstrapCellularData___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 120) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setProtocolVersion:(int64_t)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__SSMachineDataRequest_setProtocolVersion___block_invoke;
  v4[3] = &unk_1E47BA600;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __43__SSMachineDataRequest_setProtocolVersion___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 128) = *(_QWORD *)(result + 40);
  return result;
}

- (void)setUserAgent:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__SSMachineDataRequest_setUserAgent___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __37__SSMachineDataRequest_setUserAgent___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 136) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 136);
    *(_QWORD *)(v5 + 136) = v4;

  }
}

- (void)setWaitsForPurchaseOperations:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__SSMachineDataRequest_setWaitsForPurchaseOperations___block_invoke;
  v4[3] = &unk_1E47B9850;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __54__SSMachineDataRequest_setWaitsForPurchaseOperations___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 144) = *(_BYTE *)(result + 40);
  return result;
}

- (NSString)userAgent
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
  v9 = __Block_byref_object_copy__64;
  v10 = __Block_byref_object_dispose__64;
  v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__SSMachineDataRequest_userAgent__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __33__SSMachineDataRequest_userAgent__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 136));
}

- (BOOL)waitsForPurchaseOperations
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
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__SSMachineDataRequest_waitsForPurchaseOperations__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__SSMachineDataRequest_waitsForPurchaseOperations__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 144);
  return result;
}

- (void)startWithCompletionBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__SSMachineDataRequest_startWithCompletionBlock___block_invoke;
  v6[3] = &unk_1E47BF418;
  v7 = v4;
  v5 = v4;
  -[SSMachineDataRequest startWithDetailedCompletionBlock:](self, "startWithDetailedCompletionBlock:", v6);

}

uint64_t __49__SSMachineDataRequest_startWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (void)startWithDetailedCompletionBlock:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  SSMachineDataRequest *v18;
  id v19;
  id v20;
  id location;

  v4 = a3;
  v5 = SSViTunesStoreFramework();
  v6 = (void *)objc_msgSend(objc_alloc((Class)SSVWeakLinkedClassForString(CFSTR("ISMachineDataActionOperation"), v5)), "initWithMachineDataRequest:", self);
  -[SSMachineDataRequest userAgent](self, "userAgent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SSMachineDataRequest userAgent](self, "userAgent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserAgent:", v8);
  }
  else
  {
    +[SSDevice currentDevice](SSDevice, "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userAgent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserAgent:", v9);

  }
  objc_initWeak(&location, v6);
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __57__SSMachineDataRequest_startWithDetailedCompletionBlock___block_invoke;
  v17 = &unk_1E47BB6A0;
  objc_copyWeak(&v20, &location);
  v10 = v4;
  v18 = self;
  v19 = v10;
  objc_msgSend(v6, "setCompletionBlock:", &v14);
  v11 = SSViTunesStoreFramework();
  v12 = SSVWeakLinkedClassForString(CFSTR("ISOperationQueue"), v11);
  objc_msgSend(v12, "mainQueue", v14, v15, v16, v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addOperation:", v6);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __57__SSMachineDataRequest_startWithDetailedCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    objc_msgSend(WeakRetained, "syncState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v2 + 16))(v2, v3, v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest");

}

- (SSMachineDataRequest)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSMachineDataRequest *v6;
  uint64_t v8;
  uint64_t v9;
  NSNumber *accountID;
  uint64_t v11;
  uint64_t v12;
  NSData *actionData;
  uint64_t v14;
  uint64_t v15;
  NSString *actionName;
  uint64_t v17;
  uint64_t v18;
  NSString *userAgent;
  objc_super v20;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v20.receiver = self;
    v20.super_class = (Class)SSMachineDataRequest;
    v6 = -[SSRequest init](&v20, sel_init);
    if (v6)
    {
      v8 = objc_opt_class();
      v9 = SSXPCDictionaryCopyObjectWithClass(v5, "50", v8);
      accountID = v6->_accountID;
      v6->_accountID = (NSNumber *)v9;

      v11 = objc_opt_class();
      v12 = SSXPCDictionaryCopyObjectWithClass(v5, "51", v11);
      actionData = v6->_actionData;
      v6->_actionData = (NSData *)v12;

      v14 = objc_opt_class();
      v15 = SSXPCDictionaryCopyObjectWithClass(v5, "52", v14);
      actionName = v6->_actionName;
      v6->_actionName = (NSString *)v15;

      v6->_allowsBootstrapCellularData = xpc_dictionary_get_BOOL(v5, "54");
      v6->_protocolVersion = xpc_dictionary_get_int64(v5, "55");
      v17 = objc_opt_class();
      v18 = SSXPCDictionaryCopyObjectWithClass(v5, "56", v17);
      userAgent = v6->_userAgent;
      v6->_userAgent = (NSString *)v18;

      v6->_waitsForPurchaseOperations = xpc_dictionary_get_BOOL(v5, "53");
    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;
  NSObject *dispatchQueue;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  SSMachineDataRequest *v10;

  v3 = xpc_dictionary_create(0, 0, 0);
  dispatchQueue = self->super._dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__SSMachineDataRequest_copyXPCEncoding__block_invoke;
  v8[3] = &unk_1E47B8768;
  v5 = v3;
  v9 = v5;
  v10 = self;
  dispatch_sync(dispatchQueue, v8);
  v6 = v5;

  return v6;
}

void __39__SSMachineDataRequest_copyXPCEncoding__block_invoke(uint64_t a1)
{
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "50", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96));
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "51", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104));
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "52", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 112));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "54", *(_BYTE *)(*(_QWORD *)(a1 + 40) + 120));
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "55", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 128));
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "56", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 136));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "53", *(_BYTE *)(*(_QWORD *)(a1 + 40) + 144));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_actionName, 0);
  objc_storeStrong((id *)&self->_actionData, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

@end
