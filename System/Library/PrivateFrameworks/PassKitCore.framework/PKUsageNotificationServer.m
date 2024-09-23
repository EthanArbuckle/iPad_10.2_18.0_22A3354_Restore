@implementation PKUsageNotificationServer

- (PKUsageNotificationServer)init
{
  PKUsageNotificationServer *v2;
  PKUsageNotificationServer *v3;
  NSMutableSet *v4;
  NSMutableSet *connections;
  uint64_t v6;
  NSXPCListener *listener;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKUsageNotificationServer;
  v2 = -[PKUsageNotificationServer init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    connections = v3->_connections;
    v3->_connections = v4;

    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.passd.usage"));
    listener = v3->_listener;
    v3->_listener = (NSXPCListener *)v6;

    -[NSXPCListener setDelegate:](v3->_listener, "setDelegate:", v3);
    -[NSXPCListener _xpcConnection](v3->_listener, "_xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_connection_set_non_launching();

    -[NSXPCListener resume](v3->_listener, "resume");
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", 0);
  -[NSXPCListener invalidate](self->_listener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKUsageNotificationServer;
  -[PKUsageNotificationServer dealloc](&v3, sel_dealloc);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  _QWORD v13[5];
  id v14;
  id location;
  uint8_t buf[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PKUsageNotificationClientInterface();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRemoteObjectInterface:", v8);

  objc_msgSend(v7, "setExportedObject:", self);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE2338A8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v9);

  objc_msgSend(v7, "setInterruptionHandler:", &__block_literal_global_106);
  objc_initWeak(&location, v7);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__PKUsageNotificationServer_listener_shouldAcceptNewConnection___block_invoke_58;
  v13[3] = &unk_1E2ABE7B0;
  objc_copyWeak(&v14, &location);
  v13[4] = self;
  objc_msgSend(v7, "setInvalidationHandler:", v13);
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableSet addObject:](self->_connections, "addObject:", v7);
  os_unfair_lock_unlock(&self->_lock);
  PKLogFacilityTypeGetObject(4uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = objc_msgSend(v7, "processIdentifier");
    *(_DWORD *)buf = 67109120;
    v17 = v11;
    _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_INFO, "Pass usage connection added from pid %d", buf, 8u);
  }

  objc_msgSend(v7, "resume");
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return 1;
}

void __64__PKUsageNotificationServer_listener_shouldAcceptNewConnection___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  PKLogFacilityTypeGetObject(4uLL);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_18FC92000, v0, OS_LOG_TYPE_INFO, "Pass usage connection interrupted", v1, 2u);
  }

}

void __64__PKUsageNotificationServer_listener_shouldAcceptNewConnection___block_invoke_58(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    PKLogFacilityTypeGetObject(4uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_INFO, "Pass usage connection invalidated; removing it", v4, 2u);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", WeakRetained);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  }

}

- (void)notifyPassUsed:(id)a3 fromSource:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  os_unfair_lock_s *p_lock;
  void *v17;
  id v18;
  id v19;
  int64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  int64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v6, "storeIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v20 = a4;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v26;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v14), "stringValue", v20);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v12);
    }

    objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("associatedStoreIdentifiers"));
    a4 = v20;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v17 = (void *)-[NSMutableSet copy](self->_connections, "copy");
  os_unfair_lock_unlock(p_lock);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __55__PKUsageNotificationServer_notifyPassUsed_fromSource___block_invoke;
  v21[3] = &unk_1E2ACE3D0;
  v23 = v7;
  v24 = a4;
  v22 = v6;
  v18 = v7;
  v19 = v6;
  objc_msgSend(v17, "enumerateObjectsUsingBlock:", v21);

}

void __55__PKUsageNotificationServer_notifyPassUsed_fromSource___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "passTypeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "usedPassFromSource:withTypeIdentifier:info:", v3, v4, *(_QWORD *)(a1 + 40));

}

- (void)notifyPaymentPassUsedWithTransactionInfo:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  os_unfair_lock_s *p_lock;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  __CFString *v19;
  id v20;
  id v21;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v5, "merchant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mapsMerchant");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v17, "identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v8, CFSTR("muid"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v17, "resultProviderIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v9, CFSTR("resultProviderIdentifier"));

  objc_msgSend(v5, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v10, CFSTR("transactionLocation"));

  objc_msgSend(v5, "transactionDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v11, CFSTR("transactionDate"));

  objc_msgSend(v5, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v14 = (void *)-[NSMutableSet copy](self->_connections, "copy");
  os_unfair_lock_unlock(p_lock);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __70__PKUsageNotificationServer_notifyPaymentPassUsedWithTransactionInfo___block_invoke;
  v18[3] = &unk_1E2ACE3F8;
  v19 = &stru_1E2ADF4C0;
  v20 = v12;
  v21 = v6;
  v15 = v6;
  v16 = v12;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v18);
  CLPassKitNotifyPayment();

}

void __70__PKUsageNotificationServer_notifyPaymentPassUsedWithTransactionInfo___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "usedPaymentPassWithUniqueIdentifier:transactionIdentifier:info:", a1[4], a1[5], a1[6]);

  objc_msgSend(v3, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "usedPaymentPassWithTransactionIdentifier:info:", a1[5], a1[6]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
