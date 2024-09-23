@implementation PKPaymentHostEndpointRegistry

- (PKPaymentHostEndpointRegistry)init
{
  PKPaymentHostEndpointRegistry *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *registrySerialQueue;
  NSObject *v5;
  _QWORD block[4];
  PKPaymentHostEndpointRegistry *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPaymentHostEndpointRegistry;
  v2 = -[PKPaymentHostEndpointRegistry init](&v9, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.passd.ListenerEndpointRegistry", 0);
    registrySerialQueue = v2->_registrySerialQueue;
    v2->_registrySerialQueue = (OS_dispatch_queue *)v3;

    v5 = v2->_registrySerialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__PKPaymentHostEndpointRegistry_init__block_invoke;
    block[3] = &unk_1E2ABE120;
    v8 = v2;
    dispatch_sync(v5, block);

  }
  return v2;
}

void __37__PKPaymentHostEndpointRegistry_init__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v5;

}

- (void)addListenerEndpoint:(id)a3 forHostIdentifier:(id)a4 processIdentifier:(int)a5
{
  id v8;
  id v9;
  NSObject *registrySerialQueue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  int v16;

  v8 = a3;
  v9 = a4;
  registrySerialQueue = self->_registrySerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__PKPaymentHostEndpointRegistry_addListenerEndpoint_forHostIdentifier_processIdentifier___block_invoke;
  block[3] = &unk_1E2ACB3E8;
  v16 = a5;
  block[4] = self;
  v14 = v9;
  v15 = v8;
  v11 = v8;
  v12 = v9;
  dispatch_sync(registrySerialQueue, block);

}

void __89__PKPaymentHostEndpointRegistry_addListenerEndpoint_forHostIdentifier_processIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 56));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v4, v6);

  }
  objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 40));
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v8 = *(_QWORD *)(a1 + 48);
  v11[0] = CFSTR("listenerEndpoint");
  v11[1] = CFSTR("processIdentifier");
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 56));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v10, *(_QWORD *)(a1 + 40));

}

- (id)takeListenerEndpointForHostIdentifier:(id)a3
{
  id v4;
  NSObject *registrySerialQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
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
  v15 = __Block_byref_object_copy__27;
  v16 = __Block_byref_object_dispose__27;
  v17 = 0;
  registrySerialQueue = self->_registrySerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__PKPaymentHostEndpointRegistry_takeListenerEndpointForHostIdentifier___block_invoke;
  block[3] = &unk_1E2ACB410;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(registrySerialQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __71__PKPaymentHostEndpointRegistry_takeListenerEndpointForHostIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", a1[5]);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("listenerEndpoint"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(v7, "objectForKey:", CFSTR("processIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", a1[5]);
    if (!objc_msgSend(v6, "count"))
      objc_msgSend(*(id *)(a1[4] + 24), "removeObjectForKey:", v5);

  }
  objc_msgSend(*(id *)(a1[4] + 16), "removeObjectForKey:", a1[5]);

}

- (void)removeListenerEndpointsForProcessIdentifier:(int)a3
{
  NSObject *registrySerialQueue;
  _QWORD v4[5];
  int v5;

  registrySerialQueue = self->_registrySerialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __77__PKPaymentHostEndpointRegistry_removeListenerEndpointsForProcessIdentifier___block_invoke;
  v4[3] = &unk_1E2ACA420;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(registrySerialQueue, v4);
}

void __77__PKPaymentHostEndpointRegistry_removeListenerEndpointsForProcessIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9++), (_QWORD)v12);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObjectForKey:", v11);

}

- (id)debugDescription
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p;\n"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    hostIdentifierToEndpointMap: %@\n"), self->_hostIdentifierToEndpointMap);
  objc_msgSend(v3, "appendFormat:", CFSTR("    processIdentifierToHostIdentifierMap: %@"), self->_processIdentifierToHostIdentifiersMap);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processIdentifierToHostIdentifiersMap, 0);
  objc_storeStrong((id *)&self->_hostIdentifierToEndpointMap, 0);
  objc_storeStrong((id *)&self->_registrySerialQueue, 0);
}

@end
