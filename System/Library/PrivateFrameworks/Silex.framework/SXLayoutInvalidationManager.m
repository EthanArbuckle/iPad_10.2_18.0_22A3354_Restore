@implementation SXLayoutInvalidationManager

- (SXLayoutInvalidationManager)initWithBlueprintProvider:(id)a3
{
  id v5;
  SXLayoutInvalidationManager *v6;
  SXLayoutInvalidationManager *v7;
  uint64_t v8;
  NSMutableArray *possibleInvalidations;
  uint64_t v10;
  NSMutableDictionary *pendingInvalidations;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SXLayoutInvalidationManager;
  v6 = -[SXLayoutInvalidationManager init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_layoutBlueprintProvider, a3);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    possibleInvalidations = v7->_possibleInvalidations;
    v7->_possibleInvalidations = (NSMutableArray *)v8;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    pendingInvalidations = v7->_pendingInvalidations;
    v7->_pendingInvalidations = (NSMutableDictionary *)v10;

  }
  return v7;
}

- (void)mightInvalidateComponent:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)SXInvalidationLog;
  if (os_log_type_enabled((os_log_t)SXInvalidationLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_217023000, v6, OS_LOG_TYPE_DEFAULT, "Might invalidate component, identifier=%{public}@", (uint8_t *)&v10, 0xCu);

  }
  -[SXLayoutInvalidationManager possibleInvalidations](self, "possibleInvalidations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

}

- (void)cancelPendingInvalidationForComponent:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD);
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)SXInvalidationLog;
  if (os_log_type_enabled((os_log_t)SXInvalidationLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543362;
    v24 = v7;
    _os_log_impl(&dword_217023000, v6, OS_LOG_TYPE_DEFAULT, "Cancel possible invalidation for component, identifier=%{public}@", (uint8_t *)&v23, 0xCu);

  }
  -[SXLayoutInvalidationManager possibleInvalidations](self, "possibleInvalidations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v9);

  -[SXLayoutInvalidationManager pendingInvalidations](self, "pendingInvalidations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)SXInvalidationLog;
    if (os_log_type_enabled((os_log_t)SXInvalidationLog, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      objc_msgSend(v4, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543362;
      v24 = v15;
      _os_log_impl(&dword_217023000, v14, OS_LOG_TYPE_DEFAULT, "Cancel pending invalidation for component, identifier=%{public}@", (uint8_t *)&v23, 0xCu);

    }
    objc_msgSend(v12, "pendingPromise");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "reject");
    v17 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SXLayoutInvalidatorErrorDomain"), 1, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v17)[2](v17, v18);

    -[SXLayoutInvalidationManager pendingInvalidations](self, "pendingInvalidations");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeObjectForKey:", v20);

  }
  -[SXLayoutInvalidationManager possibleInvalidations](self, "possibleInvalidations");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (!v22)
    -[SXLayoutInvalidationManager invalidateQueuedComponents](self, "invalidateQueuedComponents");

}

- (id)invalidateComponent:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__SXLayoutInvalidationManager_invalidateComponent___block_invoke;
  v8[3] = &unk_24D68D650;
  v9 = v4;
  v5 = v4;
  -[SXLayoutInvalidationManager invalidateComponent:invalidation:priority:](self, "invalidateComponent:invalidation:priority:", v5, v8, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __51__SXLayoutInvalidationManager_invalidateComponent___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateSizeForComponentWithIdentifier:suggestedSize:", v4, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));

}

- (id)invalidateComponent:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __57__SXLayoutInvalidationManager_invalidateComponent_state___block_invoke;
  v12[3] = &unk_24D68D678;
  v13 = v7;
  v14 = v6;
  v8 = v6;
  v9 = v7;
  -[SXLayoutInvalidationManager invalidateComponent:invalidation:priority:](self, "invalidateComponent:invalidation:priority:", v8, v12, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __57__SXLayoutInvalidationManager_invalidateComponent_state___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateState:forComponentWithIdentifier:", v2, v5);

}

- (id)invalidateComponent:(id)a3 state:(id)a4 priority:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __66__SXLayoutInvalidationManager_invalidateComponent_state_priority___block_invoke;
  v14[3] = &unk_24D68D678;
  v15 = v9;
  v16 = v8;
  v10 = v8;
  v11 = v9;
  -[SXLayoutInvalidationManager invalidateComponent:invalidation:priority:](self, "invalidateComponent:invalidation:priority:", v10, v14, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __66__SXLayoutInvalidationManager_invalidateComponent_state_priority___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateState:forComponentWithIdentifier:", v2, v5);

}

- (id)invalidateComponent:(id)a3 suggestedSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  CGFloat v13;
  CGFloat v14;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __65__SXLayoutInvalidationManager_invalidateComponent_suggestedSize___block_invoke;
  v11[3] = &unk_24D68D6A0;
  v12 = v7;
  v13 = width;
  v14 = height;
  v8 = v7;
  -[SXLayoutInvalidationManager invalidateComponent:invalidation:priority:](self, "invalidateComponent:invalidation:priority:", v8, v11, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __65__SXLayoutInvalidationManager_invalidateComponent_suggestedSize___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateSizeForComponentWithIdentifier:suggestedSize:", v5, *(double *)(a1 + 40), *(double *)(a1 + 48));

}

- (id)invalidateComponent:(id)a3 state:(id)a4 suggestedSize:(CGSize)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  CGFloat v18;
  CGFloat v19;

  height = a5.height;
  width = a5.width;
  v9 = a3;
  v10 = a4;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __71__SXLayoutInvalidationManager_invalidateComponent_state_suggestedSize___block_invoke;
  v15[3] = &unk_24D68D6C8;
  v16 = v10;
  v17 = v9;
  v18 = width;
  v19 = height;
  v11 = v9;
  v12 = v10;
  -[SXLayoutInvalidationManager invalidateComponent:invalidation:priority:](self, "invalidateComponent:invalidation:priority:", v11, v15, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __71__SXLayoutInvalidationManager_invalidateComponent_state_suggestedSize___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidateState:forComponentWithIdentifier:", v3, v6);

  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidateSizeForComponentWithIdentifier:suggestedSize:", v7, *(double *)(a1 + 48), *(double *)(a1 + 56));

}

- (id)invalidateComponent:(id)a3 suggestedSize:(CGSize)a4 priority:(unint64_t)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  CGFloat v15;
  CGFloat v16;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __74__SXLayoutInvalidationManager_invalidateComponent_suggestedSize_priority___block_invoke;
  v13[3] = &unk_24D68D6A0;
  v14 = v9;
  v15 = width;
  v16 = height;
  v10 = v9;
  -[SXLayoutInvalidationManager invalidateComponent:invalidation:priority:](self, "invalidateComponent:invalidation:priority:", v10, v13, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __74__SXLayoutInvalidationManager_invalidateComponent_suggestedSize_priority___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateSizeForComponentWithIdentifier:suggestedSize:", v5, *(double *)(a1 + 40), *(double *)(a1 + 48));

}

- (id)invalidateComponent:(id)a3 state:(id)a4 suggestedSize:(CGSize)a5 priority:(unint64_t)a6
{
  CGFloat height;
  CGFloat width;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  CGFloat v25;
  CGFloat v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  unint64_t v34;
  uint64_t v35;
  CGSize v36;

  height = a5.height;
  width = a5.width;
  v35 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = (void *)SXInvalidationLog;
  if (os_log_type_enabled((os_log_t)SXInvalidationLog, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    objc_msgSend(v11, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v36.width = width;
    v36.height = height;
    NSStringFromCGSize(v36);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v28 = v15;
    v29 = 2114;
    v30 = v16;
    v31 = 2114;
    v32 = v17;
    v33 = 2048;
    v34 = a6;
    _os_log_impl(&dword_217023000, v14, OS_LOG_TYPE_DEFAULT, "Queuing invalidation of component, identifier=%{public}@, suggested-size=%{public}@, state=%{public}@ priority=%lu", buf, 0x2Au);

  }
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __80__SXLayoutInvalidationManager_invalidateComponent_state_suggestedSize_priority___block_invoke;
  v22[3] = &unk_24D68D6C8;
  v23 = v12;
  v24 = v11;
  v25 = width;
  v26 = height;
  v18 = v11;
  v19 = v12;
  -[SXLayoutInvalidationManager invalidateComponent:invalidation:priority:](self, "invalidateComponent:invalidation:priority:", v18, v22, a6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

void __80__SXLayoutInvalidationManager_invalidateComponent_state_suggestedSize_priority___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidateState:forComponentWithIdentifier:", v3, v6);

  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidateSizeForComponentWithIdentifier:suggestedSize:", v7, *(double *)(a1 + 48), *(double *)(a1 + 56));

}

- (id)invalidateComponent:(id)a3 invalidation:(id)a4 priority:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  SXPendingLayoutInvalidation *v13;
  void *v14;
  SXPendingLayoutInvalidation *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  dispatch_time_t v21;
  void *v22;
  id v23;
  _QWORD block[5];
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  -[SXLayoutInvalidationManager layoutBlueprintProvider](self, "layoutBlueprintProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "blueprint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[SXLayoutInvalidationManager cancelPendingInvalidationForComponent:](self, "cancelPendingInvalidationForComponent:", v8);
    v12 = objc_alloc_init(MEMORY[0x24BE6CF68]);
    v13 = [SXPendingLayoutInvalidation alloc];
    objc_msgSend(v11, "layoutOptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[SXPendingLayoutInvalidation initWithComponent:pendingPromise:layoutOptions:invalidation:](v13, "initWithComponent:pendingPromise:layoutOptions:invalidation:", v8, v12, v14, v9);

    -[SXLayoutInvalidationManager pendingInvalidations](self, "pendingInvalidations");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v15, v17);

    if (a5 == 1
      || (-[SXLayoutInvalidationManager possibleInvalidations](self, "possibleInvalidations"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = objc_msgSend(v18, "count"),
          v18,
          !v19))
    {
      -[SXLayoutInvalidationManager invalidateQueuedComponents](self, "invalidateQueuedComponents");
    }
    else if (!-[SXLayoutInvalidationManager invalidationDispatched](self, "invalidationDispatched"))
    {
      v20 = SXInvalidationLog;
      if (os_log_type_enabled((os_log_t)SXInvalidationLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_217023000, v20, OS_LOG_TYPE_DEFAULT, "Dispatching invalidation for queued components", buf, 2u);
      }
      -[SXLayoutInvalidationManager setInvalidationDispatched:](self, "setInvalidationDispatched:", 1);
      v21 = dispatch_time(0, 500000000);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __73__SXLayoutInvalidationManager_invalidateComponent_invalidation_priority___block_invoke;
      block[3] = &unk_24D6874A8;
      block[4] = self;
      dispatch_after(v21, MEMORY[0x24BDAC9B8], block);
    }
    objc_msgSend(v12, "promise");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = objc_alloc(MEMORY[0x24BE6CF70]);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SXLayoutInvalidatorErrorDomain"), 2, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v23, "initWithError:", v12);
  }

  return v22;
}

uint64_t __73__SXLayoutInvalidationManager_invalidateComponent_invalidation_priority___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setInvalidationDispatched:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "invalidateQueuedComponents");
}

- (void)invalidateQueuedComponents
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  -[SXLayoutInvalidationManager pendingInvalidations](self, "pendingInvalidations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[SXLayoutInvalidationManager layoutBlueprintProvider](self, "layoutBlueprintProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "blueprint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[SXLayoutInvalidationManager pendingInvalidations](self, "pendingInvalidations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __57__SXLayoutInvalidationManager_invalidateQueuedComponents__block_invoke;
    v11[3] = &unk_24D68D6F0;
    v12 = v6;
    v10 = v6;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v11);

    -[SXLayoutInvalidationManager pendingInvalidations](self, "pendingInvalidations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeAllObjects");

    -[SXLayoutInvalidationManager delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layoutInvalidationManager:didInvalidateBlueprint:", self, v10);

  }
}

void __57__SXLayoutInvalidationManager_invalidateQueuedComponents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  void (**v17)(id, void *);
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "layoutOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "layoutOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  v10 = SXInvalidationLog;
  v11 = os_log_type_enabled((os_log_t)SXInvalidationLog, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      v18 = 138543362;
      v19 = v5;
      _os_log_impl(&dword_217023000, v10, OS_LOG_TYPE_DEFAULT, "Invalidate component layout, identifier=%{public}@", (uint8_t *)&v18, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "componentBlueprintForComponentIdentifier:includeChildren:", v5, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v6, "invalidation");
      v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "parentLayoutBlueprint");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v13)[2](v13, v14);

      objc_msgSend(v6, "pendingPromise");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "resolve");
      v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v17 = (void (**)(id, void *))objc_alloc_init(MEMORY[0x24BE6CF98]);
      v16[2](v16, v17);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SXLayoutInvalidatorErrorDomain"), 2, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pendingPromise");
      v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "reject");
      v17 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
      v17[2](v17, v15);
    }

  }
  else
  {
    if (v11)
    {
      v18 = 138543362;
      v19 = v5;
      _os_log_impl(&dword_217023000, v10, OS_LOG_TYPE_DEFAULT, "Rejecting invalidation of component. Layout options do not match. identifier=%{public}@", (uint8_t *)&v18, 0xCu);
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SXLayoutInvalidatorErrorDomain"), 2, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pendingPromise");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "reject");
    v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v16)[2](v16, v12);
  }

}

- (SXLayoutInvalidationManagerDelegate)delegate
{
  return (SXLayoutInvalidationManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SXLayoutBlueprintProvider)layoutBlueprintProvider
{
  return self->_layoutBlueprintProvider;
}

- (NSMutableArray)possibleInvalidations
{
  return self->_possibleInvalidations;
}

- (NSMutableDictionary)pendingInvalidations
{
  return self->_pendingInvalidations;
}

- (void)setPendingInvalidations:(id)a3
{
  objc_storeStrong((id *)&self->_pendingInvalidations, a3);
}

- (BOOL)invalidationDispatched
{
  return self->_invalidationDispatched;
}

- (void)setInvalidationDispatched:(BOOL)a3
{
  self->_invalidationDispatched = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingInvalidations, 0);
  objc_storeStrong((id *)&self->_possibleInvalidations, 0);
  objc_storeStrong((id *)&self->_layoutBlueprintProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
