@implementation PKIssuerProvisioningExtensionConsumerContext

- (PKIssuerProvisioningExtensionConsumerContext)init
{
  PKIssuerProvisioningExtensionConsumerContext *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKIssuerProvisioningExtensionConsumerContext;
  result = -[PKIssuerProvisioningExtensionConsumerContext init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)dealloc
{
  NSMutableArray *v3;
  NSMutableArray *blocksQueuedForConnected;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = self->_blocksQueuedForConnected;
  blocksQueuedForConnected = self->_blocksQueuedForConnected;
  self->_blocksQueuedForConnected = 0;

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v3;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++) + 16))();
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  v10.receiver = self;
  v10.super_class = (Class)PKIssuerProvisioningExtensionConsumerContext;
  -[PKIssuerProvisioningExtensionConsumerContext dealloc](&v10, sel_dealloc);
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PKIssuerProvisioningExtensionConsumerContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PKIssuerProvisioningExtensionConsumerContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)connectWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __SecTask *v8;
  __SecTask *v9;
  NSString *v10;
  NSString *teamID;
  NSObject *v12;
  NSString *v13;
  void *v14;
  NSMutableArray *v15;
  NSMutableArray *blocksQueuedForConnected;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[8];
  audit_token_t token;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
    (*((void (**)(id))v4 + 2))(v4);
  os_unfair_lock_lock(&self->_lock);
  if (!self->_connected)
  {
    self->_connected = 1;
    -[PKIssuerProvisioningExtensionConsumerContext _auxiliaryConnection](self, "_auxiliaryConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "auditToken");
      v8 = SecTaskCreateWithAuditToken(0, &token);
      if (v8)
      {
        v9 = v8;
        v10 = (NSString *)SecTaskCopyValueForEntitlement(v8, CFSTR("com.apple.developer.team-identifier"), 0);
        teamID = self->_teamID;
        self->_teamID = v10;

        if (-[NSString length](self->_teamID, "length") != 10)
        {
          PKLogFacilityTypeGetObject(6uLL);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "PKIssuerProvisioningExtensionConsumerContext: teamID is invalid", buf, 2u);
          }

          v13 = self->_teamID;
          self->_teamID = 0;

        }
        v14 = (void *)SecTaskCopyValueForEntitlement(v9, CFSTR("com.apple.developer.payment-pass-provisioning"), 0);
        self->_entitled = objc_msgSend(v14, "BOOLValue");
        CFRelease(v9);

      }
    }

  }
  if (-[NSMutableArray count](self->_blocksQueuedForConnected, "count"))
    v15 = self->_blocksQueuedForConnected;
  else
    v15 = 0;
  blocksQueuedForConnected = self->_blocksQueuedForConnected;
  self->_blocksQueuedForConnected = 0;

  os_unfair_lock_unlock(&self->_lock);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v17 = v15;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v23 != v20)
          objc_enumerationMutation(v17);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v19);
  }

}

- (void)performWhenConnected:(id)a3
{
  void (**v4)(void);
  os_unfair_lock_s *p_lock;
  NSMutableArray *blocksQueuedForConnected;
  NSMutableArray *v7;
  NSMutableArray *v8;
  void *v9;
  void (**aBlock)(void);

  v4 = (void (**)(void))a3;
  if (v4)
  {
    aBlock = v4;
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (self->_connected)
    {
      os_unfair_lock_unlock(&self->_lock);
      aBlock[2]();

    }
    else
    {
      blocksQueuedForConnected = self->_blocksQueuedForConnected;
      if (!blocksQueuedForConnected)
      {
        v7 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
        v8 = self->_blocksQueuedForConnected;
        self->_blocksQueuedForConnected = v7;

        blocksQueuedForConnected = self->_blocksQueuedForConnected;
      }
      v9 = _Block_copy(aBlock);
      -[NSMutableArray addObject:](blocksQueuedForConnected, "addObject:", v9);

      os_unfair_lock_unlock(p_lock);
    }
  }
}

- (void)statusWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  NSObject *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD v16[4];
  NSObject *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD handler[7];
  _QWORD v21[3];
  char v22;
  _QWORD v23[5];
  id v24;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x3032000000;
    v23[3] = __Block_byref_object_copy__46;
    v23[4] = __Block_byref_object_dispose__46;
    v24 = _Block_copy(v4);
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x2020000000;
    v22 = 0;
    v6 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
    v7 = dispatch_time(0, 2000000000);
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
    v8 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __69__PKIssuerProvisioningExtensionConsumerContext_statusWithCompletion___block_invoke;
    handler[3] = &unk_1E2AD3330;
    handler[4] = self;
    handler[5] = v21;
    handler[6] = v23;
    dispatch_source_set_event_handler(v6, handler);
    dispatch_resume(v6);
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = __69__PKIssuerProvisioningExtensionConsumerContext_statusWithCompletion___block_invoke_12;
    v16[3] = &unk_1E2AD36D8;
    v9 = v6;
    v17 = v9;
    v18 = v21;
    v19 = v23;
    -[PKIssuerProvisioningExtensionConsumerContext remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __69__PKIssuerProvisioningExtensionConsumerContext_statusWithCompletion___block_invoke_2;
    v12[3] = &unk_1E2AD3700;
    v11 = v9;
    v13 = v11;
    v14 = v21;
    v15 = v23;
    objc_msgSend(v10, "statusWithCompletion:", v12);

    _Block_object_dispose(v21, 8);
    _Block_object_dispose(v23, 8);

  }
}

void __69__PKIssuerProvisioningExtensionConsumerContext_statusWithCompletion___block_invoke(_QWORD *a1)
{
  unsigned __int8 *v2;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = (unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
  do
  {
    if (__ldaxr(v2))
    {
      __clrex();
      return;
    }
  }
  while (__stlxr(1u, v2));
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1[4] + 40);
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "PKIssuerProvisioningExtensionConsumerContext: timeout trying to get status with extension for teamID: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) + 16))();
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

}

void __69__PKIssuerProvisioningExtensionConsumerContext_statusWithCompletion___block_invoke_12(uint64_t a1)
{
  unsigned __int8 *v2;
  uint64_t v4;
  void *v5;

  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  v2 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  while (!__ldaxr(v2))
  {
    if (!__stlxr(1u, v2))
    {
      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) + 16))();
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v5 = *(void **)(v4 + 40);
      *(_QWORD *)(v4 + 40) = 0;

      return;
    }
  }
  __clrex();
}

void __69__PKIssuerProvisioningExtensionConsumerContext_statusWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  unsigned __int8 *v3;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  v3 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  while (!__ldaxr(v3))
  {
    if (!__stlxr(1u, v3))
    {
      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) + 16))();
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = 0;

      goto LABEL_6;
    }
  }
  __clrex();
LABEL_6:

}

- (void)passEntriesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  NSObject *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD v16[4];
  NSObject *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD handler[7];
  _QWORD v21[3];
  char v22;
  _QWORD v23[5];
  id v24;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x3032000000;
    v23[3] = __Block_byref_object_copy__46;
    v23[4] = __Block_byref_object_dispose__46;
    v24 = _Block_copy(v4);
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x2020000000;
    v22 = 0;
    v6 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
    v7 = dispatch_time(0, 30000000000);
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
    v8 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __74__PKIssuerProvisioningExtensionConsumerContext_passEntriesWithCompletion___block_invoke;
    handler[3] = &unk_1E2AD3330;
    handler[4] = self;
    handler[5] = v21;
    handler[6] = v23;
    dispatch_source_set_event_handler(v6, handler);
    dispatch_resume(v6);
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = __74__PKIssuerProvisioningExtensionConsumerContext_passEntriesWithCompletion___block_invoke_15;
    v16[3] = &unk_1E2AD36D8;
    v9 = v6;
    v17 = v9;
    v18 = v21;
    v19 = v23;
    -[PKIssuerProvisioningExtensionConsumerContext remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __74__PKIssuerProvisioningExtensionConsumerContext_passEntriesWithCompletion___block_invoke_2;
    v12[3] = &unk_1E2AD3728;
    v11 = v9;
    v13 = v11;
    v14 = v21;
    v15 = v23;
    objc_msgSend(v10, "passEntriesWithCompletion:", v12);

    _Block_object_dispose(v21, 8);
    _Block_object_dispose(v23, 8);

  }
}

void __74__PKIssuerProvisioningExtensionConsumerContext_passEntriesWithCompletion___block_invoke(_QWORD *a1)
{
  unsigned __int8 *v2;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = (unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
  do
  {
    if (__ldaxr(v2))
    {
      __clrex();
      return;
    }
  }
  while (__stlxr(1u, v2));
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1[4] + 40);
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "PKIssuerProvisioningExtensionConsumerContext: timeout trying to get pass entries with extension for teamID: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) + 16))();
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

}

void __74__PKIssuerProvisioningExtensionConsumerContext_passEntriesWithCompletion___block_invoke_15(uint64_t a1)
{
  unsigned __int8 *v2;
  uint64_t v4;
  void *v5;

  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  v2 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  while (!__ldaxr(v2))
  {
    if (!__stlxr(1u, v2))
    {
      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) + 16))();
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v5 = *(void **)(v4 + 40);
      *(_QWORD *)(v4 + 40) = 0;

      return;
    }
  }
  __clrex();
}

void __74__PKIssuerProvisioningExtensionConsumerContext_passEntriesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  unsigned __int8 *v4;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v8 = a2;
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  if ((PassEntriesValidateStructure(v8) & 1) != 0)
  {
    v3 = v8;
  }
  else
  {

    v3 = 0;
  }
  v4 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  while (!__ldaxr(v4))
  {
    if (!__stlxr(1u, v4))
    {
      v9 = v3;
      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) + 16))();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = 0;

      v3 = v9;
      goto LABEL_9;
    }
  }
  __clrex();
LABEL_9:

}

- (void)remotePassEntriesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  NSObject *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD v16[4];
  NSObject *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD handler[7];
  _QWORD v21[3];
  char v22;
  _QWORD v23[5];
  id v24;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x3032000000;
    v23[3] = __Block_byref_object_copy__46;
    v23[4] = __Block_byref_object_dispose__46;
    v24 = _Block_copy(v4);
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x2020000000;
    v22 = 0;
    v6 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
    v7 = dispatch_time(0, 30000000000);
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
    v8 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __80__PKIssuerProvisioningExtensionConsumerContext_remotePassEntriesWithCompletion___block_invoke;
    handler[3] = &unk_1E2AD3330;
    handler[4] = self;
    handler[5] = v21;
    handler[6] = v23;
    dispatch_source_set_event_handler(v6, handler);
    dispatch_resume(v6);
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = __80__PKIssuerProvisioningExtensionConsumerContext_remotePassEntriesWithCompletion___block_invoke_17;
    v16[3] = &unk_1E2AD36D8;
    v9 = v6;
    v17 = v9;
    v18 = v21;
    v19 = v23;
    -[PKIssuerProvisioningExtensionConsumerContext remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __80__PKIssuerProvisioningExtensionConsumerContext_remotePassEntriesWithCompletion___block_invoke_2;
    v12[3] = &unk_1E2AD3728;
    v11 = v9;
    v13 = v11;
    v14 = v21;
    v15 = v23;
    objc_msgSend(v10, "remotePassEntriesWithCompletion:", v12);

    _Block_object_dispose(v21, 8);
    _Block_object_dispose(v23, 8);

  }
}

void __80__PKIssuerProvisioningExtensionConsumerContext_remotePassEntriesWithCompletion___block_invoke(_QWORD *a1)
{
  unsigned __int8 *v2;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = (unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
  do
  {
    if (__ldaxr(v2))
    {
      __clrex();
      return;
    }
  }
  while (__stlxr(1u, v2));
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1[4] + 40);
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "PKIssuerProvisioningExtensionConsumerContext: timeout trying to get remote pass entries with extension for teamID: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) + 16))();
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

}

void __80__PKIssuerProvisioningExtensionConsumerContext_remotePassEntriesWithCompletion___block_invoke_17(uint64_t a1)
{
  unsigned __int8 *v2;
  uint64_t v4;
  void *v5;

  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  v2 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  while (!__ldaxr(v2))
  {
    if (!__stlxr(1u, v2))
    {
      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) + 16))();
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v5 = *(void **)(v4 + 40);
      *(_QWORD *)(v4 + 40) = 0;

      return;
    }
  }
  __clrex();
}

void __80__PKIssuerProvisioningExtensionConsumerContext_remotePassEntriesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  unsigned __int8 *v4;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v8 = a2;
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  if ((PassEntriesValidateStructure(v8) & 1) != 0)
  {
    v3 = v8;
  }
  else
  {

    v3 = 0;
  }
  v4 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  while (!__ldaxr(v4))
  {
    if (!__stlxr(1u, v4))
    {
      v9 = v3;
      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) + 16))();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = 0;

      v3 = v9;
      goto LABEL_9;
    }
  }
  __clrex();
LABEL_9:

}

- (void)generateRequestWithEntryIdentifier:(id)a3 configuration:(id)a4 certificateChain:(id)a5 nonce:(id)a6 nonceSignature:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  NSString *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  int v23;
  int v24;
  id v25;
  NSObject *v26;
  void *v27;
  NSString *v28;
  NSObject *v29;
  dispatch_time_t v30;
  uint64_t v31;
  id v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  id v36;
  NSString *v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  _QWORD v44[4];
  NSObject *v45;
  id v46;
  NSString *v47;
  id v48;
  uint8_t *v49;
  __int128 *v50;
  _QWORD v51[4];
  NSObject *v52;
  uint8_t *v53;
  __int128 *v54;
  _QWORD handler[4];
  id v56;
  PKIssuerProvisioningExtensionConsumerContext *v57;
  uint8_t *v58;
  __int128 *v59;
  __int128 v60;
  __int128 v61;
  void (*v62)(uint64_t);
  id v63;
  unsigned int v64;
  uint64_t v65;
  uint8_t buf[8];
  _BYTE v67[20];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v43 = a3;
  v14 = a4;
  v41 = a5;
  v15 = a6;
  v42 = a7;
  v16 = a8;
  if (v16)
  {
    objc_msgSend(v14, "encryptionScheme");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = self->_teamID;
    if (self->_entitled)
    {
      v60 = 0u;
      v61 = 0u;
      -[PKIssuerProvisioningExtensionConsumerContext _auxiliaryConnection](self, "_auxiliaryConnection");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        objc_msgSend(v19, "auditToken");
      }
      else
      {
        v60 = 0u;
        v61 = 0u;
      }

      v65 = 0;
      v64 = 0;
      v22 = objc_retainAutorelease(v15);
      V0YaM92nP0Xx19HNvczPJ((uint64_t)&v60, 32, objc_msgSend(v22, "bytes"), objc_msgSend(v22, "length"), (uint64_t)&v65, (uint64_t)&v64);
      v24 = v23;
      if (!v23 && v65 && v64)
      {
        v25 = objc_alloc(MEMORY[0x1E0C99D50]);
        v21 = objc_msgSend(v25, "initWithBytes:length:", v65, v64);
      }
      else
      {
        PKLogFacilityTypeGetObject(0);
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)&buf[4] = v24;
          *(_WORD *)v67 = 2112;
          *(_QWORD *)&v67[2] = v43;
          *(_WORD *)&v67[10] = 2114;
          *(_QWORD *)&v67[12] = v18;
          _os_log_error_impl(&dword_18FC92000, v26, OS_LOG_TYPE_ERROR, "PKIssuerProvisioningExtensionConsumerContext: Proceeding with provisioning without fairplay data: %d for identifier: %@ and teamID: %{public}@", buf, 0x1Cu);
        }

        v21 = 0;
      }
      if (v65)
        jEHf8Xzsv8K(v65);
    }
    else
    {
      v21 = 0;
    }
    *(_QWORD *)&v60 = 0;
    *((_QWORD *)&v60 + 1) = &v60;
    *(_QWORD *)&v61 = 0x3032000000;
    *((_QWORD *)&v61 + 1) = __Block_byref_object_copy__46;
    v62 = __Block_byref_object_dispose__46;
    v27 = _Block_copy(v16);
    v39 = v16;
    v40 = (void *)v21;
    v28 = v18;
    v63 = v27;
    *(_QWORD *)buf = 0;
    *(_QWORD *)v67 = buf;
    *(_QWORD *)&v67[8] = 0x2020000000;
    v67[16] = 0;
    v29 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
    v30 = dispatch_time(0, 20000000000);
    dispatch_source_set_timer(v29, v30, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
    v31 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __153__PKIssuerProvisioningExtensionConsumerContext_generateRequestWithEntryIdentifier_configuration_certificateChain_nonce_nonceSignature_completionHandler___block_invoke;
    handler[3] = &unk_1E2AD3750;
    v58 = buf;
    v32 = v43;
    v56 = v32;
    v57 = self;
    v59 = &v60;
    dispatch_source_set_event_handler(v29, handler);
    dispatch_resume(v29);
    v51[0] = v31;
    v51[1] = 3221225472;
    v51[2] = __153__PKIssuerProvisioningExtensionConsumerContext_generateRequestWithEntryIdentifier_configuration_certificateChain_nonce_nonceSignature_completionHandler___block_invoke_24;
    v51[3] = &unk_1E2AD36D8;
    v33 = v29;
    v52 = v33;
    v53 = buf;
    v54 = &v60;
    -[PKIssuerProvisioningExtensionConsumerContext remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v51);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v31;
    v44[1] = 3221225472;
    v44[2] = __153__PKIssuerProvisioningExtensionConsumerContext_generateRequestWithEntryIdentifier_configuration_certificateChain_nonce_nonceSignature_completionHandler___block_invoke_2;
    v44[3] = &unk_1E2AD3778;
    v35 = v33;
    v45 = v35;
    v49 = buf;
    v36 = v17;
    v46 = v36;
    v37 = v28;
    v47 = v37;
    v38 = v40;
    v48 = v38;
    v50 = &v60;
    objc_msgSend(v34, "generateRequestWithEntryIdentifier:configuration:certificateChain:nonce:nonceSignature:completionHandler:", v32, v14, v41, v15, v42, v44);

    v16 = v39;
    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v60, 8);

  }
}

void __153__PKIssuerProvisioningExtensionConsumerContext_generateRequestWithEntryIdentifier_configuration_certificateChain_nonce_nonceSignature_completionHandler___block_invoke(_QWORD *a1)
{
  unsigned __int8 *v2;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
  do
  {
    if (__ldaxr(v2))
    {
      __clrex();
      return;
    }
  }
  while (__stlxr(1u, v2));
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = *(_QWORD *)(a1[5] + 40);
    v9 = 138412546;
    v10 = v5;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "PKIssuerProvisioningExtensionConsumerContext: timeout trying to generate request with entry identier: %@ for teamID: %{public}@", (uint8_t *)&v9, 0x16u);
  }

  AnalyticsSendEvent();
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) + 16))();
  v7 = *(_QWORD *)(a1[7] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

}

void __153__PKIssuerProvisioningExtensionConsumerContext_generateRequestWithEntryIdentifier_configuration_certificateChain_nonce_nonceSignature_completionHandler___block_invoke_24(uint64_t a1)
{
  unsigned __int8 *v2;
  uint64_t v4;
  void *v5;

  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  v2 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  while (!__ldaxr(v2))
  {
    if (!__stlxr(1u, v2))
    {
      dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) + 16))();
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v5 = *(void **)(v4 + 40);
      *(_QWORD *)(v4 + 40) = 0;

      return;
    }
  }
  __clrex();
}

void __153__PKIssuerProvisioningExtensionConsumerContext_generateRequestWithEntryIdentifier_configuration_certificateChain_nonce_nonceSignature_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  unsigned __int8 *v3;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  v3 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  while (!__ldaxr(v3))
  {
    if (!__stlxr(1u, v3))
    {
      dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
      objc_msgSend(v7, "setEncryptionVersion:", *(_QWORD *)(a1 + 40));
      objc_msgSend(v7, "setIssuerIdentifier:", *(_QWORD *)(a1 + 48));
      objc_msgSend(v7, "setFPInfo:", *(_QWORD *)(a1 + 56));
      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) + 16))();
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = 0;

      goto LABEL_6;
    }
  }
  __clrex();
LABEL_6:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamID, 0);
  objc_storeStrong((id *)&self->_blocksQueuedForConnected, 0);
}

@end
