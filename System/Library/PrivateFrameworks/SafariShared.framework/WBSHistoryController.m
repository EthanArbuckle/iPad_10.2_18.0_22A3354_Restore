@implementation WBSHistoryController

- (id)historyForProfileIdentifier:(id)a3 loadIfNeeded:(BOOL)a4
{
  id v6;
  void *v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__20;
  v20 = __Block_byref_object_dispose__20;
  v21 = 0;
  -[WBSHistoryController normalizeProfileIdentifier:](self, "normalizeProfileIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  queue = self->_queue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__WBSHistoryController_historyForProfileIdentifier_loadIfNeeded___block_invoke;
  v12[3] = &unk_1E4B3B210;
  v13 = v7;
  v14 = &v16;
  v12[4] = self;
  v15 = a4;
  v9 = v7;
  dispatch_sync(queue, v12);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (id)normalizeProfileIdentifier:(id)a3
{
  id v3;
  __CFString *v4;

  v3 = a3;
  if (objc_msgSend(v3, "length") && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D89E20]) & 1) == 0)
    v4 = (__CFString *)v3;
  else
    v4 = &stru_1E4B40D18;

  return v4;
}

void __65__WBSHistoryController_historyForProfileIdentifier_loadIfNeeded___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 32), "_createHistoryForProfileIdentifier:", *(_QWORD *)(a1 + 40));
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 40));
    }
  }
}

- (WBSHistoryController)init
{
  WBSHistoryController *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  id v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  NSMapTable *historyMap;
  uint64_t v11;
  NSMapTable *historySessionControllerMap;
  WBSHistoryController *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WBSHistoryController;
  v2 = -[WBSHistoryController init](&v15, sel_init);
  if (v2)
  {
    objc_storeStrong((id *)&sharedHistoryController, v2);
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("com.apple.Safari.%@.%p"), v5, v2);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = dispatch_queue_create((const char *)objc_msgSend(v6, "UTF8String"), 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v9 = objc_claimAutoreleasedReturnValue();
    historyMap = v2->_historyMap;
    v2->_historyMap = (NSMapTable *)v9;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v11 = objc_claimAutoreleasedReturnValue();
    historySessionControllerMap = v2->_historySessionControllerMap;
    v2->_historySessionControllerMap = (NSMapTable *)v11;

    v13 = v2;
  }

  return v2;
}

+ (WBSHistoryController)existingSharedHistoryController
{
  return (WBSHistoryController *)(id)sharedHistoryController;
}

- (id)_createHistoryForProfileIdentifier:(id)a3
{
  return 0;
}

- (id)_createHistorySessionControllerForHistory:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  WBSHistorySessionController *v6;
  WBSHistorySessionController *v7;

  v3 = a3;
  objc_msgSend(v3, "databaseID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = -[WBSHistorySessionController initWithHistory:]([WBSHistorySessionController alloc], "initWithHistory:", v3);
  }
  else
  {
    +[WBSHistorySessionController sharedSessionController](WBSHistorySessionController, "sharedSessionController");
    v6 = (WBSHistorySessionController *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)historySessionControllerForProfileIdentifier:(id)a3 loadIfNeeded:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *queue;
  id v10;
  _QWORD block[5];
  id v13;
  id v14;
  uint64_t *v15;
  BOOL v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a4;
  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__20;
  v21 = __Block_byref_object_dispose__20;
  v22 = 0;
  -[WBSHistoryController normalizeProfileIdentifier:](self, "normalizeProfileIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBSHistoryController historyForProfileIdentifier:loadIfNeeded:](self, "historyForProfileIdentifier:loadIfNeeded:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__WBSHistoryController_historySessionControllerForProfileIdentifier_loadIfNeeded___block_invoke;
    block[3] = &unk_1E4B3B238;
    v15 = &v17;
    block[4] = self;
    v13 = v7;
    v16 = v4;
    v14 = v8;
    dispatch_sync(queue, block);
    v10 = (id)v18[5];

  }
  else
  {
    v10 = 0;
  }

  _Block_object_dispose(&v17, 8);
  return v10;
}

void __82__WBSHistoryController_historySessionControllerForProfileIdentifier_loadIfNeeded___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    if (*(_BYTE *)(a1 + 64))
    {
      objc_msgSend(*(id *)(a1 + 32), "_createHistorySessionControllerForHistory:", *(_QWORD *)(a1 + 48));
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 40));
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historySessionControllerMap, 0);
  objc_storeStrong((id *)&self->_historyMap, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
