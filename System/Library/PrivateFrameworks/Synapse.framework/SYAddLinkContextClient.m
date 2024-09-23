@implementation SYAddLinkContextClient

- (SYAddLinkContextClient)init
{
  SYAddLinkContextClient *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *clientQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SYAddLinkContextClient;
  v2 = -[SYAddLinkContextClient init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.synapse.AddLinkContextClient", v3);
    clientQueue = v2->__clientQueue;
    v2->__clientQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SYAddLinkContextClient _connection](self, "_connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[SYAddLinkContextClient set_connection:](self, "set_connection:", 0);
  v4.receiver = self;
  v4.super_class = (Class)SYAddLinkContextClient;
  -[SYAddLinkContextClient dealloc](&v4, sel_dealloc);
}

- (void)userWillAddLinkWithActivity:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[SYAddLinkContextClient _clientQueue](self, "_clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__SYAddLinkContextClient_userWillAddLinkWithActivity_completion___block_invoke;
  block[3] = &unk_1E757B388;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __65__SYAddLinkContextClient_userWillAddLinkWithActivity_completion___block_invoke(id *a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void (**v11)(id, _QWORD);
  NSObject *v12;
  void (**v13)(id, _QWORD);
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "_createConnectionIfNeeded");
  v2 = os_log_create("com.apple.synapse", "AddLinkContext");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1[5], "_uniqueIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v3;
    _os_log_impl(&dword_1BCC38000, v2, OS_LOG_TYPE_DEFAULT, "AddLinkContextClient: userWillAddLinkWithActivity started for activity: %@", buf, 0xCu);

  }
  objc_msgSend(a1[4], "_connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __65__SYAddLinkContextClient_userWillAddLinkWithActivity_completion___block_invoke_5;
  v18[3] = &unk_1E757B338;
  v19 = a1[6];
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = a1[5];
    v17 = 0;
    objc_msgSend(v7, "_createUserActivityDataWithSaving:options:error:", 0, 0, &v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v17;
    v10 = v9;
    if (v8)
    {
      v14[0] = v5;
      v14[1] = 3221225472;
      v14[2] = __65__SYAddLinkContextClient_userWillAddLinkWithActivity_completion___block_invoke_7;
      v14[3] = &unk_1E757B360;
      v15 = v9;
      v16 = a1[6];
      objc_msgSend(v6, "userWillAddLinkWithActivityData:completion:", v8, v14);

    }
    else
    {
      v12 = os_log_create("com.apple.synapse", "AddLinkContext");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __65__SYAddLinkContextClient_userWillAddLinkWithActivity_completion___block_invoke_cold_1((uint64_t *)a1 + 5, (uint64_t)v10, v12);

      v13 = (void (**)(id, _QWORD))a1[6];
      if (v13)
        v13[2](v13, 0);
    }

  }
  else
  {
    v11 = (void (**)(id, _QWORD))a1[6];
    if (v11)
      v11[2](v11, 0);
  }

}

void __65__SYAddLinkContextClient_userWillAddLinkWithActivity_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  v4 = os_log_create("com.apple.synapse", "AddLinkContext");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __65__SYAddLinkContextClient_userWillAddLinkWithActivity_completion___block_invoke_5_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    (*(void (**)(uint64_t, _QWORD))(v11 + 16))(v11, 0);

}

void __65__SYAddLinkContextClient_userWillAddLinkWithActivity_completion___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  SYContentItem *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v3 = a2;
  if (v3)
  {
    v14 = 0;
    v4 = -[SYContentItem initWithData:error:]([SYContentItem alloc], "initWithData:error:", v3, &v14);
    v5 = v14;
    if (v5)
    {
      v6 = os_log_create("com.apple.synapse", "AddLinkContext");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __65__SYAddLinkContextClient_userWillAddLinkWithActivity_completion___block_invoke_7_cold_1(a1, v6, v7, v8, v9, v10, v11, v12);

    }
  }
  else
  {
    v4 = 0;
  }
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
    (*(void (**)(uint64_t, SYContentItem *))(v13 + 16))(v13, v4);

}

- (void)userDidRemoveContentItems:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "indexesOfObjectsPassingTest:", &__block_literal_global_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[SYAddLinkContextClient _clientQueue](self, "_clientQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__SYAddLinkContextClient_userDidRemoveContentItems___block_invoke_2;
    block[3] = &unk_1E757B410;
    block[4] = self;
    v8 = v4;
    v9 = v5;
    dispatch_async(v6, block);

  }
}

uint64_t __52__SYAddLinkContextClient_userDidRemoveContentItems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "activityType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB3418]);

  return v3;
}

void __52__SYAddLinkContextClient_userDidRemoveContentItems___block_invoke_2(id *a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "_createConnectionIfNeeded");
  objc_msgSend(a1[5], "objectsAtIndexes:", a1[6]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = os_log_create("com.apple.synapse", "AddLinkContext");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(a1[6], "count");
    objc_msgSend(v2, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v26 = v4;
    v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_1BCC38000, v3, OS_LOG_TYPE_DEFAULT, "AddLinkContextClient: userDidRemoveContentItems started for %lu items including: %@", buf, 0x16u);

  }
  objc_msgSend(a1[4], "_connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1[6], "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = v2;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v14), "dataRepresentationWithError:", 0, (_QWORD)v20);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            objc_msgSend(v9, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v12);
    }

    if (!objc_msgSend(v9, "count"))
    {
      v16 = os_log_create("com.apple.synapse", "AddLinkContext");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = objc_msgSend(a1[6], "count");
        objc_msgSend(v10, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "itemIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v26 = v17;
        v27 = 2112;
        v28 = v19;
        _os_log_impl(&dword_1BCC38000, v16, OS_LOG_TYPE_DEFAULT, "AddLinkContextClient: userDidRemoveContentItems encoding failed for %lu items including: %@", buf, 0x16u);

      }
    }
    objc_msgSend(v8, "userDidRemoveContentItemDatas:", v9, (_QWORD)v20);

  }
}

void __52__SYAddLinkContextClient_userDidRemoveContentItems___block_invoke_11(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v3 = os_log_create("com.apple.synapse", "AddLinkContext");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __65__SYAddLinkContextClient_userWillAddLinkWithActivity_completion___block_invoke_5_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

- (void)userEditDidAddContentItems:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "indexesOfObjectsPassingTest:", &__block_literal_global_14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[SYAddLinkContextClient _clientQueue](self, "_clientQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__SYAddLinkContextClient_userEditDidAddContentItems___block_invoke_2;
    block[3] = &unk_1E757B410;
    block[4] = self;
    v8 = v4;
    v9 = v5;
    dispatch_async(v6, block);

  }
}

uint64_t __53__SYAddLinkContextClient_userEditDidAddContentItems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "activityType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB3418]);

  return v3;
}

void __53__SYAddLinkContextClient_userEditDidAddContentItems___block_invoke_2(id *a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "_createConnectionIfNeeded");
  objc_msgSend(a1[5], "objectsAtIndexes:", a1[6]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = os_log_create("com.apple.synapse", "AddLinkContext");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(a1[6], "count");
    objc_msgSend(v2, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v26 = v4;
    v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_1BCC38000, v3, OS_LOG_TYPE_DEFAULT, "AddLinkContextClient: userEditDidAddContentItems started for %lu items including: %@", buf, 0x16u);

  }
  objc_msgSend(a1[4], "_connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1[6], "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = v2;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v14), "dataRepresentationWithError:", 0, (_QWORD)v20);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            objc_msgSend(v9, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v12);
    }

    if (!objc_msgSend(v9, "count"))
    {
      v16 = os_log_create("com.apple.synapse", "AddLinkContext");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = objc_msgSend(a1[6], "count");
        objc_msgSend(v10, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "itemIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v26 = v17;
        v27 = 2112;
        v28 = v19;
        _os_log_impl(&dword_1BCC38000, v16, OS_LOG_TYPE_DEFAULT, "AddLinkContextClient: userEditDidAddContentItems encoding failed for %lu items including: %@", buf, 0x16u);

      }
    }
    objc_msgSend(v8, "userEditDidAddContentItemDatas:", v9, (_QWORD)v20);

  }
}

void __53__SYAddLinkContextClient_userEditDidAddContentItems___block_invoke_15(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v3 = os_log_create("com.apple.synapse", "AddLinkContext");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __65__SYAddLinkContextClient_userWillAddLinkWithActivity_completion___block_invoke_5_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

- (void)_createConnectionIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SYAddLinkContextClient _connection](self, "_connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.synapse.add-link-context-service"), 0);
    -[SYAddLinkContextClient set_connection:](self, "set_connection:", v4);

    -[SYAddLinkContextClient _connection](self, "_connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYAddLinkContextClient _clientQueue](self, "_clientQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setQueue:", v6);

    -[SYAddLinkContextClient _configureConnectionAndResume](self, "_configureConnectionAndResume");
  }
}

- (void)_configureConnectionAndResume
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  -[SYAddLinkContextClient _connection](self, "_connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYAddLinkContextClient.m"), 180, CFSTR("the XPC connection is unexpectedly nil"));

  }
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55__SYAddLinkContextClient__configureConnectionAndResume__block_invoke;
  v14[3] = &unk_1E757B438;
  objc_copyWeak(&v15, &location);
  -[SYAddLinkContextClient _connection](self, "_connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInvalidationHandler:", v14);

  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __55__SYAddLinkContextClient__configureConnectionAndResume__block_invoke_24;
  v12[3] = &unk_1E757B438;
  objc_copyWeak(&v13, &location);
  -[SYAddLinkContextClient _connection](self, "_connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInterruptionHandler:", v12);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF496760);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYAddLinkContextClient _connection](self, "_connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRemoteObjectInterface:", v8);

  -[SYAddLinkContextClient _connection](self, "_connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resume");

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __55__SYAddLinkContextClient__configureConnectionAndResume__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  v2 = os_log_create("com.apple.synapse", "AddLinkContext");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1BCC38000, v2, OS_LOG_TYPE_DEFAULT, "AddLinkContextClient: Connection was invalidated.", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidateConnection");

}

void __55__SYAddLinkContextClient__configureConnectionAndResume__block_invoke_24(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  v2 = os_log_create("com.apple.synapse", "AddLinkContext");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1BCC38000, v2, OS_LOG_TYPE_DEFAULT, "AddLinkContextClient: Connection was interrupted.", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidateConnection");

}

- (void)_invalidateConnection
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  -[SYAddLinkContextClient _clientQueue](self, "_clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SYAddLinkContextClient _connection](self, "_connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = os_log_create("com.apple.synapse", "AddLinkContext");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1BCC38000, v5, OS_LOG_TYPE_DEFAULT, "AddLinkContextClient: Invalidating connection.", v7, 2u);
    }

    -[SYAddLinkContextClient _connection](self, "_connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYAddLinkContextClient set_connection:](self, "set_connection:", 0);
    objc_msgSend(v6, "invalidate");

  }
}

- (void)createConnectionWithEndpoint:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[SYAddLinkContextClient _clientQueue](self, "_clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__SYAddLinkContextClient_createConnectionWithEndpoint___block_invoke;
  block[3] = &unk_1E757B460;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __55__SYAddLinkContextClient_createConnectionWithEndpoint___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "set_connection:", v3);

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_clientQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setQueue:", v5);

  return objc_msgSend(*(id *)(a1 + 32), "_configureConnectionAndResume");
}

- (NSXPCConnection)_connection
{
  return self->__connection;
}

- (void)set_connection:(id)a3
{
  objc_storeStrong((id *)&self->__connection, a3);
}

- (OS_dispatch_queue)_clientQueue
{
  return self->__clientQueue;
}

- (void)set_clientQueue:(id)a3
{
  objc_storeStrong((id *)&self->__clientQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__clientQueue, 0);
  objc_storeStrong((id *)&self->__connection, 0);
}

void __65__SYAddLinkContextClient_userWillAddLinkWithActivity_completion___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1BCC38000, log, OS_LOG_TYPE_ERROR, "Failed to serialize data for user activity %@. Error: %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

void __65__SYAddLinkContextClient_userWillAddLinkWithActivity_completion___block_invoke_5_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1BCC38000, a2, a3, "AddLinkContextClient: Error creating remote service proxy: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __65__SYAddLinkContextClient_userWillAddLinkWithActivity_completion___block_invoke_7_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1BCC38000, a2, a3, "Failed to deserialize data for content item data. Error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
