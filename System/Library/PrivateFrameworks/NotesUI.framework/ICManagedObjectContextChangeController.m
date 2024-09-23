@implementation ICManagedObjectContextChangeController

- (NSSet)objectTypeKeys
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[ICManagedObjectContextChangeController objectTypes](self, "objectTypes") & 2) != 0)
    objc_msgSend(v3, "addObject:", *MEMORY[0x1E0C97878]);
  if ((-[ICManagedObjectContextChangeController objectTypes](self, "objectTypes") & 8) != 0)
    objc_msgSend(v3, "addObject:", *MEMORY[0x1E0C979A8]);
  if ((-[ICManagedObjectContextChangeController objectTypes](self, "objectTypes") & 1) != 0)
    objc_msgSend(v3, "addObject:", *MEMORY[0x1E0C97A20]);
  if ((-[ICManagedObjectContextChangeController objectTypes](self, "objectTypes") & 4) != 0)
    objc_msgSend(v3, "addObject:", *MEMORY[0x1E0C97840]);
  if ((-[ICManagedObjectContextChangeController objectTypes](self, "objectTypes") & 0x10) != 0)
    objc_msgSend(v3, "addObject:", *MEMORY[0x1E0C97890]);
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSSet *)v4;
}

- (unint64_t)objectTypes
{
  return self->_objectTypes;
}

- (ICManagedObjectContextChangeController)initWithManagedObjectContexts:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  ICManagedObjectContextChangeController *v9;
  ICManagedObjectContextChangeController *v10;
  uint64_t v11;
  NSMutableSet *needsUpdateManagedObjectIDs;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *needsUpdateManagedObjectIDsSerialQueue;
  uint64_t v16;
  ICSelectorDelayer *updateSelectorDelayer;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)ICManagedObjectContextChangeController;
  v9 = -[ICManagedObjectContextChangeController init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_managedObjectContexts, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    needsUpdateManagedObjectIDs = v10->_needsUpdateManagedObjectIDs;
    v10->_needsUpdateManagedObjectIDs = (NSMutableSet *)v11;

    objc_storeWeak((id *)&v10->_delegate, v8);
    v10->_objectTypes = 15;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.notes.moc-change-controller-object-ids-serial-queue", v13);
    needsUpdateManagedObjectIDsSerialQueue = v10->_needsUpdateManagedObjectIDsSerialQueue;
    v10->_needsUpdateManagedObjectIDsSerialQueue = (OS_dispatch_queue *)v14;

    v10->_updateInterval = 0.1;
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D64268]), "initWithTarget:selector:delay:waitToFireUntilRequestsStop:callOnMainThread:", v10, sel_performUpdatesIfNeeded, 1, 1, v10->_updateInterval);
    updateSelectorDelayer = v10->_updateSelectorDelayer;
    v10->_updateSelectorDelayer = (ICSelectorDelayer *)v16;

    -[ICManagedObjectContextChangeController addObservers](v10, "addObservers");
  }

  return v10;
}

- (void)addObservers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[ICManagedObjectContextChangeController managedObjectContexts](self, "managedObjectContexts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[ICManagedObjectContextChangeController managedObjectContexts](self, "managedObjectContexts");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      v8 = *MEMORY[0x1E0C978B0];
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_managedObjectContextObjectsDidChange_, v8, v10);

          ++v9;
        }
        while (v6 != v9);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", self, sel_managedObjectContextObjectsDidChange_, *MEMORY[0x1E0C978B0], 0);

  }
}

- (NSSet)managedObjectContexts
{
  return self->_managedObjectContexts;
}

- (void)managedObjectContextObjectsDidChange:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  ICManagedObjectContextChangeController *val;
  _QWORD block[4];
  id v19;
  id v20;
  id location;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  val = self;
  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[ICManagedObjectContextChangeController objectTypeKeys](val, "objectTypeKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v23;
    v8 = *MEMORY[0x1E0C97A20];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v9);
        objc_msgSend(v3, "userInfo", val);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v10, "isEqualToString:", v8))
        {
          objc_msgSend(v12, "objectsPassingTest:", &__block_literal_global_50);
          v13 = objc_claimAutoreleasedReturnValue();

          v12 = (void *)v13;
        }
        objc_msgSend(v4, "unionSet:", v12);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v6);
  }

  -[ICManagedObjectContextChangeController delegate](val, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "managedObjectContextChangeController:managedObjectIDsToUpdateForUpdatedManagedObjects:", val, v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "count"))
  {
    objc_initWeak(&location, val);
    -[ICManagedObjectContextChangeController needsUpdateManagedObjectIDsSerialQueue](val, "needsUpdateManagedObjectIDsSerialQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__ICManagedObjectContextChangeController_managedObjectContextObjectsDidChange___block_invoke_2;
    block[3] = &unk_1E5C1F098;
    objc_copyWeak(&v20, &location);
    v19 = v15;
    dispatch_async(v16, block);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

}

- (void)performUpdatesIfNeeded
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[ICManagedObjectContextChangeController needsUpdateManagedObjectIDsSerialQueue](self, "needsUpdateManagedObjectIDsSerialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__ICManagedObjectContextChangeController_performUpdatesIfNeeded__block_invoke;
  v4[3] = &unk_1E5C1F720;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (OS_dispatch_queue)needsUpdateManagedObjectIDsSerialQueue
{
  return self->_needsUpdateManagedObjectIDsSerialQueue;
}

void __64__ICManagedObjectContextChangeController_performUpdatesIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_performUpdatesIfNeeded");

}

- (void)_performUpdatesIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id location;

  -[ICManagedObjectContextChangeController needsUpdateManagedObjectIDs](self, "needsUpdateManagedObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    objc_initWeak(&location, self);
    -[ICManagedObjectContextChangeController updateSelectorDelayer](self, "updateSelectorDelayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancelPreviousFireRequests");

    v7 = MEMORY[0x1E0C809B0];
    objc_copyWeak(&v8, &location);
    performBlockOnMainThreadAndWait();
    -[ICManagedObjectContextChangeController needsUpdateManagedObjectIDs](self, "needsUpdateManagedObjectIDs", v7, 3221225472, __65__ICManagedObjectContextChangeController__performUpdatesIfNeeded__block_invoke, &unk_1E5C1F720);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeAllObjects");

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (NSMutableSet)needsUpdateManagedObjectIDs
{
  return self->_needsUpdateManagedObjectIDs;
}

BOOL __79__ICManagedObjectContextChangeController_managedObjectContextObjectsDidChange___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "changedValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)setObjectTypes:(unint64_t)a3
{
  self->_objectTypes = a3;
}

- (ICManagedObjectContextChangeControllerDelegate)delegate
{
  return (ICManagedObjectContextChangeControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (ICManagedObjectContextChangeController)initWithDelegate:(id)a3
{
  return -[ICManagedObjectContextChangeController initWithManagedObjectContexts:delegate:](self, "initWithManagedObjectContexts:delegate:", 0, a3);
}

- (void)dealloc
{
  objc_super v3;

  -[ICManagedObjectContextChangeController removeObservers](self, "removeObservers");
  v3.receiver = self;
  v3.super_class = (Class)ICManagedObjectContextChangeController;
  -[ICManagedObjectContextChangeController dealloc](&v3, sel_dealloc);
}

- (void)performUpdatesIfNeededAndWait
{
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICManagedObjectContextChangeController performUpdatesIfNeededAndWait]", 1, 0, CFSTR("Unexpected call from background thread"));
  -[ICManagedObjectContextChangeController _performUpdatesIfNeeded](self, "_performUpdatesIfNeeded");
}

- (void)setUpdateInterval:(double)a3
{
  id v4;

  self->_updateInterval = a3;
  -[ICManagedObjectContextChangeController updateSelectorDelayer](self, "updateSelectorDelayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelay:", a3);

}

void __79__ICManagedObjectContextChangeController_managedObjectContextObjectsDidChange___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  _QWORD block[4];
  id v7;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "needsUpdateManagedObjectIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unionSet:", *(_QWORD *)(a1 + 32));

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__ICManagedObjectContextChangeController_managedObjectContextObjectsDidChange___block_invoke_3;
    block[3] = &unk_1E5C1F720;
    objc_copyWeak(&v7, v2);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v7);
  }

}

void __79__ICManagedObjectContextChangeController_managedObjectContextObjectsDidChange___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  int v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "managedObjectContextChangeControllerShouldUpdateImmediately:", v5);

    WeakRetained = v5;
    if (v3)
    {
      objc_msgSend(v5, "updateSelectorDelayer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "requestFire");

      WeakRetained = v5;
    }
  }

}

void __65__ICManagedObjectContextChangeController__performUpdatesIfNeeded__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "needsUpdateManagedObjectIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "managedObjectContextChangeController:performUpdatesForManagedObjectIDs:", WeakRetained, v2);

}

- (void)removeObservers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[ICManagedObjectContextChangeController managedObjectContexts](self, "managedObjectContexts", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    v8 = *MEMORY[0x1E0C978B0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "removeObserver:name:object:", self, v8, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setManagedObjectContexts:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectContexts, a3);
}

- (double)updateInterval
{
  return self->_updateInterval;
}

- (void)setNeedsUpdateManagedObjectIDs:(id)a3
{
  objc_storeStrong((id *)&self->_needsUpdateManagedObjectIDs, a3);
}

- (void)setNeedsUpdateManagedObjectIDsSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_needsUpdateManagedObjectIDsSerialQueue, a3);
}

- (ICSelectorDelayer)updateSelectorDelayer
{
  return self->_updateSelectorDelayer;
}

- (void)setUpdateSelectorDelayer:(id)a3
{
  objc_storeStrong((id *)&self->_updateSelectorDelayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateSelectorDelayer, 0);
  objc_storeStrong((id *)&self->_needsUpdateManagedObjectIDsSerialQueue, 0);
  objc_storeStrong((id *)&self->_needsUpdateManagedObjectIDs, 0);
  objc_storeStrong((id *)&self->_managedObjectContexts, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
