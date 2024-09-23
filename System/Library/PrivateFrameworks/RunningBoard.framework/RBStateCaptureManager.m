@implementation RBStateCaptureManager

void __33__RBStateCaptureManager_addItem___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock(&_stateCaptureLock);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addItem:", *(_QWORD *)(a1 + 40));
  os_unfair_lock_unlock(&_stateCaptureLock);
}

void __36__RBStateCaptureManager_removeItem___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock(&_stateCaptureLock);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeItem:", *(_QWORD *)(a1 + 40));
  os_unfair_lock_unlock(&_stateCaptureLock);
}

- (void)addItem:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__RBStateCaptureManager_addItem___block_invoke;
  v7[3] = &unk_24DD45FF0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)removeItem:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__RBStateCaptureManager_removeItem___block_invoke;
  v7[3] = &unk_24DD45FF0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (RBStateCaptureManager)init
{
  RBStateCaptureManager *v2;
  RBSStateCaptureSet *v3;
  RBSStateCaptureSet *itemsWithoutIdentifiers;
  uint64_t v5;
  NSMutableDictionary *itemsByIdentifier;
  uint64_t v7;
  OS_dispatch_queue *queue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RBStateCaptureManager;
  v2 = -[RBStateCaptureManager init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(RBSStateCaptureSet);
    itemsWithoutIdentifiers = v2->_itemsWithoutIdentifiers;
    v2->_itemsWithoutIdentifiers = v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    itemsByIdentifier = v2->_itemsByIdentifier;
    v2->_itemsByIdentifier = (NSMutableDictionary *)v5;

    v7 = objc_msgSend(MEMORY[0x24BE80D58], "createBackgroundQueue:", CFSTR("RBStateCaptureManager"));
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (id)stateForSubsystem:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *itemsByIdentifier;
  void *v7;
  void (**v8)(void);
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&_stateCaptureLock);
  itemsByIdentifier = self->_itemsByIdentifier;
  if (!v4)
  {
    v7 = (void *)-[NSMutableDictionary copy](itemsByIdentifier, "copy");
    -[RBSStateCaptureSet itemsCopy](self->_itemsWithoutIdentifiers, "itemsCopy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&_stateCaptureLock);
    v10 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __43__RBStateCaptureManager_stateForSubsystem___block_invoke;
    v15[3] = &unk_24DD471E8;
    v11 = v5;
    v16 = v11;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v15);
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __43__RBStateCaptureManager_stateForSubsystem___block_invoke_2;
    v13[3] = &unk_24DD47210;
    v14 = v11;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v13);

    goto LABEL_5;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](itemsByIdentifier, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&_stateCaptureLock);
  if (v7)
  {
    objc_msgSend(v7, "block");
    v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v8[2]();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "appendString:", v9);
LABEL_5:

  }
  return v5;
}

void __43__RBStateCaptureManager_stateForSubsystem___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void (**v4)(void);
  id v5;

  objc_msgSend(a3, "block");
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v4[2]();
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "length"))
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(",\n"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v5);

}

void __43__RBStateCaptureManager_stateForSubsystem___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "captureState");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(",\n"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v3);

}

- (void)addItem:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "stateCaptureTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __48__RBStateCaptureManager_addItem_withIdentifier___block_invoke;
  v10[3] = &unk_24DD47238;
  v11 = v6;
  v9 = v6;
  -[RBStateCaptureManager addItemWithTitle:identifier:block:](self, "addItemWithTitle:identifier:block:", v8, v7, v10);

}

uint64_t __48__RBStateCaptureManager_addItem_withIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "captureState");
}

- (void)addItemWithTitle:(id)a3 identifier:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  RBStateCaptureItem *v19;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  os_unfair_lock_lock(&_stateCaptureLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_itemsByIdentifier, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    rbs_state_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[RBStateCaptureManager addItemWithTitle:identifier:block:].cold.1((uint64_t)v8, v12, v13, v14, v15, v16, v17, v18);

  }
  v19 = -[RBStateCaptureItem initWithTitle:identifier:block:]([RBStateCaptureItem alloc], "initWithTitle:identifier:block:", v10, v8, v9);

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_itemsByIdentifier, "setObject:forKeyedSubscript:", v19, v8);
  os_unfair_lock_unlock(&_stateCaptureLock);

}

- (void)removeItemWithIdentifier:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock(&_stateCaptureLock);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_itemsByIdentifier, "setObject:forKeyedSubscript:", 0, v4);

  os_unfair_lock_unlock(&_stateCaptureLock);
}

- (id)identifiers
{
  void *v3;
  void *v4;
  void *v5;

  os_unfair_lock_lock(&_stateCaptureLock);
  v3 = (void *)MEMORY[0x24BDBCF20];
  -[NSMutableDictionary allKeys](self->_itemsByIdentifier, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&_stateCaptureLock);
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_itemsWithoutIdentifiers, 0);
  objc_storeStrong((id *)&self->_itemsByIdentifier, 0);
}

- (void)addItemWithTitle:(uint64_t)a3 identifier:(uint64_t)a4 block:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21A8B4000, a2, a3, "Duplicate identifier detected: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_1();
}

@end
