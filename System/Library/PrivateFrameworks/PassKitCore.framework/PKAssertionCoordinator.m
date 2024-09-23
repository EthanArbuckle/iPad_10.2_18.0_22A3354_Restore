@implementation PKAssertionCoordinator

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__PKAssertionCoordinator_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_270 != -1)
    dispatch_once(&_MergedGlobals_270, block);
  return (id)qword_1ECF22A90;
}

void __40__PKAssertionCoordinator_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initSharedInstance");
  v2 = (void *)qword_1ECF22A90;
  qword_1ECF22A90 = v1;

}

- (id)initSharedInstance
{
  PKAssertionCoordinator *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *coordinatorSerialQueue;
  uint64_t v6;
  NSHashTable *acquiredAssertions;
  PKXPCService *v8;
  void *v9;
  uint64_t v10;
  PKXPCService *remoteService;

  v2 = -[PKAssertionCoordinator init](self, "init");
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.PassKitCore.assertioncoordinator", v3);
    coordinatorSerialQueue = v2->_coordinatorSerialQueue;
    v2->_coordinatorSerialQueue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x1E0CB3690], "pk_weakObjectsHashTableUsingPointerPersonality");
    v6 = objc_claimAutoreleasedReturnValue();
    acquiredAssertions = v2->_acquiredAssertions;
    v2->_acquiredAssertions = (NSHashTable *)v6;

    v8 = [PKXPCService alloc];
    PDAssertionCoordinatorInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PKXPCService initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:](v8, "initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:", CFSTR("com.apple.passd.assertions"), v9, 0, v2);
    remoteService = v2->_remoteService;
    v2->_remoteService = (PKXPCService *)v10;

    -[PKXPCService setDelegate:](v2->_remoteService, "setDelegate:", v2);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[PKXPCService setDelegate:](self->_remoteService, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PKAssertionCoordinator;
  -[PKAssertionCoordinator dealloc](&v3, sel_dealloc);
}

- (void)acquireAssertionOfType:(unint64_t)a3 withReason:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  _QWORD block[4];
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  unint64_t v22;
  _QWORD v23[4];
  id v24;

  v8 = a4;
  v9 = a5;
  if (v9)
  {
    if (-[PKXPCService isSuspended](self->_remoteService, "isSuspended"))
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __71__PKAssertionCoordinator_acquireAssertionOfType_withReason_completion___block_invoke_7;
      block[3] = &unk_1E2ABD9A0;
      v17 = v9;
      dispatch_async(MEMORY[0x1E0C80D38], block);
      v10 = v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "UUIDString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = MEMORY[0x1E0C809B0];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __71__PKAssertionCoordinator_acquireAssertionOfType_withReason_completion___block_invoke;
      v23[3] = &unk_1E2ABD9A0;
      v14 = v9;
      v24 = v14;
      -[PKAssertionCoordinator _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v23);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v13;
      v18[1] = 3221225472;
      v18[2] = __71__PKAssertionCoordinator_acquireAssertionOfType_withReason_completion___block_invoke_3;
      v18[3] = &unk_1E2AD7EA0;
      v22 = a3;
      v18[4] = self;
      v19 = v12;
      v20 = v8;
      v21 = v14;
      v10 = v12;
      objc_msgSend(v15, "acquireAssertionOfType:withIdentifier:reason:handler:", a3, v10, v20, v18);

    }
  }

}

void __71__PKAssertionCoordinator_acquireAssertionOfType_withReason_completion___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__PKAssertionCoordinator_acquireAssertionOfType_withReason_completion___block_invoke_2;
  block[3] = &unk_1E2ABD9A0;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __71__PKAssertionCoordinator_acquireAssertionOfType_withReason_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.passkit.assertion"), -3, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __71__PKAssertionCoordinator_acquireAssertionOfType_withReason_completion___block_invoke_3(uint64_t a1, char a2)
{
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  char v13;

  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[2] = __71__PKAssertionCoordinator_acquireAssertionOfType_withReason_completion___block_invoke_4;
  v7[3] = &unk_1E2AC9E90;
  v7[1] = 3221225472;
  v13 = a2;
  v12 = *(_QWORD *)(a1 + 64);
  v8 = v3;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v11 = *(id *)(a1 + 56);
  dispatch_async(v4, v7);

}

void __71__PKAssertionCoordinator_acquireAssertionOfType_withReason_completion___block_invoke_4(uint64_t a1)
{
  PKAssertion *v2;
  id v3;
  PKAssertion *v4;
  _QWORD v5[4];
  PKAssertion *v6;
  _QWORD block[4];
  PKAssertion *v8;
  id v9;

  if (*(_BYTE *)(a1 + 72))
  {
    v2 = -[PKAssertion initWithType:identifier:reason:]([PKAssertion alloc], "initWithType:identifier:reason:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "addObject:", v2);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__PKAssertionCoordinator_acquireAssertionOfType_withReason_completion___block_invoke_5;
    block[3] = &unk_1E2ABDA18;
    v3 = *(id *)(a1 + 56);
    v8 = v2;
    v9 = v3;
    v4 = v2;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __71__PKAssertionCoordinator_acquireAssertionOfType_withReason_completion___block_invoke_6;
    v5[3] = &unk_1E2ABD9A0;
    v6 = (PKAssertion *)*(id *)(a1 + 56);
    dispatch_async(MEMORY[0x1E0C80D38], v5);
    v4 = v6;
  }

}

uint64_t __71__PKAssertionCoordinator_acquireAssertionOfType_withReason_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __71__PKAssertionCoordinator_acquireAssertionOfType_withReason_completion___block_invoke_6(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.passkit.assertion"), -1, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __71__PKAssertionCoordinator_acquireAssertionOfType_withReason_completion___block_invoke_7(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.passkit.assertion"), -2, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)invalidateAssertion:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  NSObject *coordinatorSerialQueue;
  id v18;
  id v19;
  _QWORD block[5];
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKXPCService connectionEstablished](self->_remoteService, "connectionEstablished"))
  {
    v9 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __57__PKAssertionCoordinator_invalidateAssertion_completion___block_invoke;
    v26[3] = &unk_1E2ABD9A0;
    v10 = v7;
    v27 = v10;
    -[PKAssertionCoordinator _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v26);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v6, "type");
    objc_msgSend(v6, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v9;
    v23[1] = 3221225472;
    v23[2] = __57__PKAssertionCoordinator_invalidateAssertion_completion___block_invoke_3;
    v23[3] = &unk_1E2ABE030;
    v23[4] = self;
    v24 = v8;
    v25 = v10;
    v14 = v10;
    v15 = v8;
    objc_msgSend(v11, "invalidateAssertionOfType:withIdentifier:handler:", v12, v13, v23);

    v16 = v27;
  }
  else
  {
    coordinatorSerialQueue = self->_coordinatorSerialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__PKAssertionCoordinator_invalidateAssertion_completion___block_invoke_6;
    block[3] = &unk_1E2ABE030;
    block[4] = self;
    v21 = v8;
    v22 = v7;
    v18 = v7;
    v19 = v8;
    dispatch_async(coordinatorSerialQueue, block);

    v16 = v21;
  }

}

void __57__PKAssertionCoordinator_invalidateAssertion_completion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD block[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__PKAssertionCoordinator_invalidateAssertion_completion___block_invoke_2;
    block[3] = &unk_1E2ABD9A0;
    v3 = v1;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __57__PKAssertionCoordinator_invalidateAssertion_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__PKAssertionCoordinator_invalidateAssertion_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PKAssertionCoordinator_invalidateAssertion_completion___block_invoke_4;
  block[3] = &unk_1E2ABE030;
  block[4] = v2;
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

void __57__PKAssertionCoordinator_invalidateAssertion_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  _QWORD block[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_removeAssertionWithIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__PKAssertionCoordinator_invalidateAssertion_completion___block_invoke_5;
    block[3] = &unk_1E2ABD9A0;
    v4 = v2;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __57__PKAssertionCoordinator_invalidateAssertion_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__PKAssertionCoordinator_invalidateAssertion_completion___block_invoke_6(uint64_t a1)
{
  void *v2;
  _QWORD block[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_removeAssertionWithIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__PKAssertionCoordinator_invalidateAssertion_completion___block_invoke_7;
    block[3] = &unk_1E2ABD9A0;
    v4 = v2;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __57__PKAssertionCoordinator_invalidateAssertion_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)assertion:(id)a3 shouldInvalidateWhenBackgrounded:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = a4;
  v6 = a3;
  -[PKAssertionCoordinator _remoteObjectProxy](self, "_remoteObjectProxy");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "type");
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "assertionOfType:withIdentifier:shouldInvalidateWhenBackgrounded:", v7, v8, v4);
}

- (void)isAssertionValid:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[PKAssertionCoordinator _remoteObjectProxy](self, "_remoteObjectProxy");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "type");
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "assertionOfType:withIdentifier:isValid:", v8, v9, v6);
}

- (void)hasValidAssertionOfType:(unint64_t)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[PKAssertionCoordinator _remoteObjectProxy](self, "_remoteObjectProxy");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hasValidAssertionOfType:completion:", a3, v6);

}

- (void)remoteService:(id)a3 didInterruptConnection:(id)a4
{
  uint64_t v4;
  NSObject *coordinatorSerialQueue;
  _QWORD *v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v4 = MEMORY[0x1E0C809B0];
  coordinatorSerialQueue = self->_coordinatorSerialQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__PKAssertionCoordinator_remoteService_didInterruptConnection___block_invoke;
  v7[3] = &unk_1E2ABE120;
  v7[4] = self;
  v6 = v7;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_17;
  block[3] = &unk_1E2ABD9A0;
  v9 = v6;
  dispatch_async(coordinatorSerialQueue, block);

}

void __63__PKAssertionCoordinator_remoteService_didInterruptConnection___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "copy");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeAllObjects");
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &__block_literal_global_184);

}

uint64_t __63__PKAssertionCoordinator_remoteService_didInterruptConnection___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "markAsInvalidatedAndNotify");
}

- (void)remoteServiceDidSuspend:(id)a3
{
  uint64_t v3;
  NSObject *coordinatorSerialQueue;
  _QWORD *v5;
  _QWORD v6[5];
  _QWORD block[4];
  id v8;

  v3 = MEMORY[0x1E0C809B0];
  coordinatorSerialQueue = self->_coordinatorSerialQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__PKAssertionCoordinator_remoteServiceDidSuspend___block_invoke;
  v6[3] = &unk_1E2ABE120;
  v6[4] = self;
  v5 = v6;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_17;
  block[3] = &unk_1E2ABD9A0;
  v8 = v5;
  dispatch_async(coordinatorSerialQueue, block);

}

void __50__PKAssertionCoordinator_remoteServiceDidSuspend___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v9, "invalidateWhenBackgrounded", (_QWORD)v10))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObject:", v9);
          objc_msgSend(v9, "markAsInvalidatedAndNotify");
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (id)_remoteObjectProxy
{
  return -[PKXPCService remoteObjectProxy](self->_remoteService, "remoteObjectProxy");
}

- (id)_remoteObjectProxyWithFailureHandler:(id)a3
{
  return -[PKXPCService remoteObjectProxyWithFailureHandler:](self->_remoteService, "remoteObjectProxyWithFailureHandler:", a3);
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  return -[PKXPCService remoteObjectProxyWithErrorHandler:](self->_remoteService, "remoteObjectProxyWithErrorHandler:", a3);
}

- (id)_existingRemoteObjectProxy
{
  return -[PKXPCService existingRemoteObjectProxy](self->_remoteService, "existingRemoteObjectProxy");
}

- (void)_removeAssertionWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_coordinatorSerialQueue);
  v5 = (void *)MEMORY[0x19400CFE8]();
  -[NSHashTable allObjects](self->_acquiredAssertions, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v13, "identifier", (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", v4);

        if (v15)
          -[NSHashTable removeObject:](self->_acquiredAssertions, "removeObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  objc_autoreleasePoolPop(v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinatorSerialQueue, 0);
  objc_storeStrong((id *)&self->_remoteService, 0);
  objc_storeStrong((id *)&self->_acquiredAssertions, 0);
}

@end
