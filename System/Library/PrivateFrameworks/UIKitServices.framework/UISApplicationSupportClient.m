@implementation UISApplicationSupportClient

void __44__UISApplicationSupportClient__remoteTarget__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[5];

  v3 = (void *)MEMORY[0x1E0D23040];
  v4 = a2;
  objc_msgSend(v3, "userInteractive");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServiceQuality:", v5);

  objc_msgSend(v4, "setInterface:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setInterfaceTarget:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
  objc_msgSend(v4, "setInterruptionHandler:", &__block_literal_global_7);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__UISApplicationSupportClient__remoteTarget__block_invoke_4;
  v6[3] = &unk_1E2CAF430;
  v6[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "setInvalidationHandler:", v6);

}

- (UISApplicationSupportClient)init
{
  UISApplicationSupportClient *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UISApplicationSupportClient;
  v2 = -[UISApplicationSupportClient init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.uikit.applicationSupportClient", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

void __44__UISApplicationSupportClient__remoteTarget__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v2)
    goto LABEL_3;
  objc_msgSend(MEMORY[0x1E0D22FE8], "interfaceWithIdentifier:", 0x1E2CB2280);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D22FF8], "protocolForProtocol:", &unk_1EE1EC3F8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServer:", v4);

  v5 = (void *)MEMORY[0x1E0D23010];
  objc_msgSend(*(id *)(a1 + 32), "_applicationSupportServiceEndpoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connectionWithEndpoint:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 24);
  *(_QWORD *)(v8 + 24) = v7;

  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 24);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __44__UISApplicationSupportClient__remoteTarget__block_invoke_2;
  v20[3] = &unk_1E2CAF458;
  v21 = v3;
  v22 = v10;
  v12 = v3;
  objc_msgSend(v11, "configureConnection:", v20);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "activate");

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v2)
  {
LABEL_3:
    objc_msgSend(v2, "remoteTarget");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "activate");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "remoteTarget");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v18 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = v16;

      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v19 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("UISApplicationSupportClient.m"), 160, CFSTR("unable to create a remote target for %@"), 0x1E2CB2280);

      }
    }
  }
}

- (id)_applicationSupportServiceEndpoint
{
  char *v2;
  void *v3;
  void *v4;

  v2 = getenv("APPLICATION_SUPPORT_SERVICE_MACH_NAME");
  if (v2)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v2);
  else
    objc_msgSend(MEMORY[0x1E0D23018], "defaultShellMachName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D23018], "endpointForMachName:service:instance:", v3, 0x1E2CB2280, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)applicationInitializationContextWithParameters:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v5 = MEMORY[0x1E0C809B0];
  do
  {
    -[UISApplicationSupportClient _remoteTarget](self, "_remoteTarget");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v10[0] = v5;
      v10[1] = 3221225472;
      v10[2] = __78__UISApplicationSupportClient_applicationInitializationContextWithParameters___block_invoke;
      v10[3] = &unk_1E2CAF898;
      v10[4] = &v15;
      v10[5] = &v11;
      objc_msgSend(v6, "initializeClientWithParameters:completion:", v4, v10);
    }
    else
    {
      *((_BYTE *)v12 + 24) = 0;
    }

  }
  while (*((_BYTE *)v12 + 24));
  v8 = (id)v16[5];
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

  return v8;
}

- (id)_remoteTarget
{
  NSObject *queue;
  id v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  BSDispatchQueueAssertNot();
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  v13 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__UISApplicationSupportClient__remoteTarget__block_invoke;
  block[3] = &unk_1E2CAF480;
  block[4] = self;
  block[5] = &v8;
  block[6] = a2;
  dispatch_sync(queue, block);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __41__UISApplicationSupportClient_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 16))
  {
    *(_BYTE *)(v1 + 16) = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "invalidate");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 24);
    *(_QWORD *)(v3 + 24) = 0;

  }
}

void __78__UISApplicationSupportClient_applicationInitializationContextWithParameters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v6;
  id v7;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v7 = v4;
  v6 = a3;
  LOBYTE(v4) = objc_msgSend(v6, "isBSServiceConnectionError");

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__UISApplicationSupportClient_invalidate__block_invoke;
  block[3] = &unk_1E2CAF370;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_queue_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISApplicationSupportClient.m"), 43, CFSTR("UISApplicationSupportClient must be invalidated before deallocation."));

  }
  v5.receiver = self;
  v5.super_class = (Class)UISApplicationSupportClient;
  -[UISApplicationSupportClient dealloc](&v5, sel_dealloc);
}

- (void)requestPasscodeUnlockUIWithCompletion:(id)a3
{
  id v5;
  void *v6;
  id *v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD block[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISApplicationSupportClient.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  -[UISApplicationSupportClient _remoteTarget](self, "_remoteTarget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __69__UISApplicationSupportClient_requestPasscodeUnlockUIWithCompletion___block_invoke;
    v14[3] = &unk_1E2CAF848;
    v7 = &v15;
    v15 = v5;
    v8 = v5;
    objc_msgSend(v6, "requestPasscodeUnlockUIWithCompletion:", v14);
  }
  else
  {
    dispatch_get_global_queue(25, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__UISApplicationSupportClient_requestPasscodeUnlockUIWithCompletion___block_invoke_3;
    block[3] = &unk_1E2CAF870;
    v7 = &v13;
    v13 = v5;
    v10 = v5;
    dispatch_async(v9, block);

  }
}

void __69__UISApplicationSupportClient_requestPasscodeUnlockUIWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  dispatch_get_global_queue(25, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__UISApplicationSupportClient_requestPasscodeUnlockUIWithCompletion___block_invoke_2;
  block[3] = &unk_1E2CAF820;
  v8 = *(id *)(a1 + 32);
  v13 = v5;
  v14 = v8;
  v12 = v6;
  v9 = v5;
  v10 = v6;
  dispatch_async(v7, block);

}

uint64_t __69__UISApplicationSupportClient_requestPasscodeUnlockUIWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 48);
  if (*(_QWORD *)(a1 + 32))
    v2 = 0;
  else
    v2 = objc_msgSend(*(id *)(a1 + 40), "BOOLValue");
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(v1, v2);
}

uint64_t __69__UISApplicationSupportClient_requestPasscodeUnlockUIWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)destroyScenesWithPersistentIdentifiers:(id)a3 animationType:(unint64_t)a4 destroySessions:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id *v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v25;
  _QWORD v26[4];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v7 = a5;
  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v29;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

        }
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v13);
  }
  -[UISApplicationSupportClient _remoteTarget](self, "_remoteTarget");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __111__UISApplicationSupportClient_destroyScenesWithPersistentIdentifiers_animationType_destroySessions_completion___block_invoke;
    v26[3] = &unk_1E2CAF848;
    v20 = &v27;
    v27 = v11;
    v21 = v11;
    objc_msgSend(v17, "destroyScenesPersistentIdentifiers:animationType:destroySessions:completion:", v10, v18, v19, v26);

  }
  else
  {
    dispatch_get_global_queue(25, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __111__UISApplicationSupportClient_destroyScenesWithPersistentIdentifiers_animationType_destroySessions_completion___block_invoke_3;
    block[3] = &unk_1E2CAF870;
    v20 = &v25;
    v25 = v11;
    v22 = v11;
    dispatch_async(v18, block);
  }

}

void __111__UISApplicationSupportClient_destroyScenesWithPersistentIdentifiers_animationType_destroySessions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  dispatch_get_global_queue(25, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __111__UISApplicationSupportClient_destroyScenesWithPersistentIdentifiers_animationType_destroySessions_completion___block_invoke_2;
  block[3] = &unk_1E2CAF820;
  v8 = *(id *)(a1 + 32);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __111__UISApplicationSupportClient_destroyScenesWithPersistentIdentifiers_animationType_destroySessions_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "BOOLValue"), *(_QWORD *)(a1 + 40));
}

uint64_t __111__UISApplicationSupportClient_destroyScenesWithPersistentIdentifiers_animationType_destroySessions_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __44__UISApplicationSupportClient__remoteTarget__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "activate");
}

void __44__UISApplicationSupportClient__remoteTarget__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;

  objc_msgSend(a2, "invalidate");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = 0;

}

@end
