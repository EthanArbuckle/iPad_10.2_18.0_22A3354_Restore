@implementation PSUCurrentActivityManager

- (PSUCurrentActivityManager)init
{
  PSUCurrentActivityManager *v2;
  void *v3;
  uint64_t v4;
  FBSDisplayLayoutMonitor *monitor;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PSUCurrentActivityManager;
  v2 = -[PSUCurrentActivityManager init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE38448], "configurationForDefaultMainDisplayMonitor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE38438], "monitorWithConfiguration:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    monitor = v2->_monitor;
    v2->_monitor = (FBSDisplayLayoutMonitor *)v4;

  }
  return v2;
}

- (void)prewarm
{
  id v2;

  v2 = (id)-[FBSDisplayLayoutMonitor currentLayout](self->_monitor, "currentLayout");
}

- (void)dealloc
{
  objc_super v3;

  -[FBSDisplayLayoutMonitor invalidate](self->_monitor, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PSUCurrentActivityManager;
  -[PSUCurrentActivityManager dealloc](&v3, sel_dealloc);
}

- (void)fetchUserActivityContentIdentifiersForBundleId:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  PSUCurrentActivityManager *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __94__PSUCurrentActivityManager_fetchUserActivityContentIdentifiersForBundleId_completionHandler___block_invoke;
  v10[3] = &unk_2515CA2D0;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v6;
  v9 = v7;
  -[PSUCurrentActivityManager _visibilityForAppWithBundleId:completionHandler:](self, "_visibilityForAppWithBundleId:completionHandler:", v8, v10);

}

- (void)_visibilityForAppWithBundleId:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, BOOL);
  dispatch_time_t v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  void (**v12)(id, BOOL);

  v6 = a3;
  v7 = (void (**)(id, BOOL))a4;
  if (-[PSUCurrentActivityManager _hasLayoutInfo](self, "_hasLayoutInfo"))
  {
    v7[2](v7, -[PSUCurrentActivityManager _isAppVisibleWithBundleId:](self, "_isAppVisibleWithBundleId:", v6));
  }
  else
  {
    v8 = dispatch_time(0, 1000000000);
    dispatch_get_global_queue(2, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __77__PSUCurrentActivityManager__visibilityForAppWithBundleId_completionHandler___block_invoke;
    block[3] = &unk_2515CA320;
    v12 = v7;
    block[4] = self;
    v11 = v6;
    dispatch_after(v8, v9, block);

  }
}

- (BOOL)_hasLayoutInfo
{
  void *v2;
  BOOL v3;

  -[FBSDisplayLayoutMonitor currentLayout](self->_monitor, "currentLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)_isAppVisibleWithBundleId:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  id v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v20 = a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[FBSDisplayLayoutMonitor currentLayout](self->_monitor, "currentLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "elements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v23 = *(_QWORD *)v25;
    v9 = *MEMORY[0x24BE38278];
    v10 = *MEMORY[0x24BE38280];
    v22 = *MEMORY[0x24BE38270];
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v23)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v12, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v13, "isEqualToString:", v9) & 1) != 0)
          goto LABEL_15;
        objc_msgSend(v12, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isEqualToString:", v10))
        {

LABEL_15:
          goto LABEL_16;
        }
        objc_msgSend(v12, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", v22);

        if ((v16 & 1) != 0)
          goto LABEL_16;
        if (objc_msgSend(v12, "conformsToProtocol:", &unk_2573FB500))
        {
          objc_msgSend(v12, "bundleIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToString:", v20);

          v8 |= v18;
        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v7)
        continue;
      break;
    }
  }
  else
  {
LABEL_16:
    v8 = 0;
  }

  return v8 & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitor, 0);
}

uint64_t __77__PSUCurrentActivityManager__visibilityForAppWithBundleId_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "_isAppVisibleWithBundleId:", *(_QWORD *)(a1 + 40)));
}

void __94__PSUCurrentActivityManager_fetchUserActivityContentIdentifiersForBundleId_completionHandler___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;

  if ((a2 & 1) != 0)
  {
    v3 = (void *)MEMORY[0x24BDC1598];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __94__PSUCurrentActivityManager_fetchUserActivityContentIdentifiersForBundleId_completionHandler___block_invoke_2;
    v8[3] = &unk_2515CA2F8;
    v11 = *(id *)(a1 + 48);
    v4 = *(id *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v9 = v4;
    v10 = v5;
    objc_msgSend(v3, "_currentUserActivityProxiesWithOptions:matching:completionHandler:", 0, 0, v8);

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 48);
    v7 = (id)objc_opt_new();
    (*(void (**)(uint64_t, id, _QWORD))(v6 + 16))(v6, v7, 0);

  }
}

void __94__PSUCurrentActivityManager_fetchUserActivityContentIdentifiersForBundleId_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  qos_class_t v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id obj;
  _QWORD v25[5];
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  NSObject *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[4];
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0);
  }
  else
  {
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __94__PSUCurrentActivityManager_fetchUserActivityContentIdentifiersForBundleId_completionHandler___block_invoke_3;
    v35[3] = &unk_2515CA280;
    v36 = *(id *)(a1 + 32);
    objc_msgSend(a2, "_pas_filteredArrayWithTest:", v35);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v22 = a1;
      v6 = dispatch_group_create();
      v7 = (void *)objc_opt_new();
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v23 = v5;
      obj = v5;
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v32;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v32 != v10)
              objc_enumerationMutation(obj);
            v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v11);
            dispatch_group_enter(v6);
            v13 = (void *)MEMORY[0x24BDC1598];
            objc_msgSend(v12, "uuid");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v28[0] = MEMORY[0x24BDAC760];
            v28[1] = 3221225472;
            v28[2] = __94__PSUCurrentActivityManager_fetchUserActivityContentIdentifiersForBundleId_completionHandler___block_invoke_4;
            v28[3] = &unk_2515CA2A8;
            v28[4] = v12;
            v29 = v7;
            v30 = v6;
            objc_msgSend(v13, "_fetchUserActivityWithUUID:completionHandler:", v14, v28);

            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
        }
        while (v9);
      }

      v15 = (void *)MEMORY[0x24BE7A5D8];
      v16 = qos_class_self();
      dispatch_get_global_queue(v16, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __94__PSUCurrentActivityManager_fetchUserActivityContentIdentifiersForBundleId_completionHandler___block_invoke_11;
      v25[3] = &unk_2515CA2D0;
      v18 = *(id *)(v22 + 48);
      v26 = v7;
      v27 = v18;
      v25[4] = *(_QWORD *)(v22 + 40);
      v19 = v7;
      objc_msgSend(v15, "notifyGroup:onQueue:withTimeout:block:", v6, v17, v25, 5.0);

      v5 = v23;
    }
    else
    {
      v20 = *(_QWORD *)(a1 + 48);
      v21 = (void *)objc_opt_new();
      (*(void (**)(uint64_t, void *, _QWORD))(v20 + 16))(v20, v21, 0);

    }
  }
}

uint64_t __94__PSUCurrentActivityManager_fetchUserActivityContentIdentifiersForBundleId_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __94__PSUCurrentActivityManager_fetchUserActivityContentIdentifiersForBundleId_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PSUSummarizationLogging();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v12;
      v15 = 2112;
      v16 = v6;
      _os_log_error_impl(&dword_244BC5000, v7, OS_LOG_TYPE_ERROR, "Could not fetch user activity for UUID: %@; error: %@",
        (uint8_t *)&v13,
        0x16u);

    }
  }
  objc_msgSend(v5, "targetContentIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = *(id *)(a1 + 40);
    objc_sync_enter(v9);
    v10 = *(void **)(a1 + 40);
    objc_msgSend(v5, "targetContentIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

    objc_sync_exit(v9);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __94__PSUCurrentActivityManager_fetchUserActivityContentIdentifiersForBundleId_completionHandler___block_invoke_11(uint64_t a1, char a2)
{
  uint64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  id obj;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if ((a2 & 1) != 0)
  {
    obj = *(id *)(a1 + 40);
    objc_sync_enter(obj);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_sync_exit(obj);

  }
  else
  {
    v3 = *(_QWORD *)(a1 + 48);
    v4 = (void *)MEMORY[0x24BDD1540];
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x24BDD0FC8];
    v11[0] = CFSTR("Timed out");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", v6, -1, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v8);

  }
}

+ (PSUCurrentActivityManager)sharedInstance
{
  if (sharedInstance__pasOnceToken2[0] != -1)
    dispatch_once(sharedInstance__pasOnceToken2, &__block_literal_global_14);
  return (PSUCurrentActivityManager *)(id)sharedInstance__pasExprOnceResult;
}

void __43__PSUCurrentActivityManager_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x24952359C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

@end
