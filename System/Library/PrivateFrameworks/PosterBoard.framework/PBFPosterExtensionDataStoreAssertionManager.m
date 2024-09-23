@implementation PBFPosterExtensionDataStoreAssertionManager

- (PBFPosterExtensionDataStoreAssertionManager)init
{
  PBFPosterExtensionDataStoreAssertionManager *v2;
  uint64_t v3;
  BSAtomicFlag *invalidationFlag;
  uint64_t v5;
  BSAtomicFlag *txFlag;
  uint64_t v7;
  NSHashTable *observers;
  _PBFPosterExtensionDataStoreAssertionController *v9;
  _PBFPosterExtensionDataStoreAssertionController *controller;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PBFPosterExtensionDataStoreAssertionManager;
  v2 = -[PBFPosterExtensionDataStoreAssertionManager init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D016B8]), "initWithFlag:", 0);
    invalidationFlag = v2->_invalidationFlag;
    v2->_invalidationFlag = (BSAtomicFlag *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D016B8]), "initWithFlag:", 0);
    txFlag = v2->_txFlag;
    v2->_txFlag = (BSAtomicFlag *)v5;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v7;

    v9 = objc_alloc_init(_PBFPosterExtensionDataStoreAssertionController);
    controller = v2->_controller;
    v2->_controller = v9;

  }
  return v2;
}

- (BOOL)executeTransaction:(id)a3
{
  uint64_t (**v4)(id, _PBFPosterExtensionDataStoreAssertionController *);
  PBFPosterExtensionDataStoreAssertionManager *v5;
  _PBFPosterExtensionDataStoreAssertionController *v6;
  int v7;

  v4 = (uint64_t (**)(id, _PBFPosterExtensionDataStoreAssertionController *))a3;
  if (v4 && -[BSAtomicFlag setFlag:](self->_txFlag, "setFlag:", 1))
  {
    v5 = self;
    objc_sync_enter(v5);
    v6 = -[_PBFPosterExtensionDataStoreAssertionController initWithController:]([_PBFPosterExtensionDataStoreAssertionController alloc], "initWithController:", v5->_controller);
    v7 = v4[2](v4, v6);
    if (v7)
      -[PBFPosterExtensionDataStoreAssertionManager _notifyObserversOfUpdatedController:](v5, "_notifyObserversOfUpdatedController:", v6);
    -[BSAtomicFlag setFlag:](self->_txFlag, "setFlag:", 0);

    objc_sync_exit(v5);
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)addObserver:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) == 0)
  {
    v4 = self->_observers;
    objc_sync_enter(v4);
    -[NSHashTable addObject:](self->_observers, "addObject:", v5);
    objc_sync_exit(v4);

  }
}

- (void)removeObserver:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) == 0)
  {
    v4 = self->_observers;
    objc_sync_enter(v4);
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);
    objc_sync_exit(v4);

  }
}

- (void)enumerateObservers:(id)a3
{
  char v4;
  NSHashTable *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v8 = a3;
  v4 = -[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag");
  if (v8 && (v4 & 1) == 0)
  {
    v5 = self->_observers;
    objc_sync_enter(v5);
    -[NSHashTable allObjects](self->_observers, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    objc_sync_exit(v5);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__PBFPosterExtensionDataStoreAssertionManager_enumerateObservers___block_invoke;
    v9[3] = &unk_1E86F6170;
    v10 = v8;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

  }
}

uint64_t __66__PBFPosterExtensionDataStoreAssertionManager_enumerateObservers___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_notifyObserversOfUpdatedController:(id)a3
{
  id v5;
  BOOL v6;
  PBFPosterExtensionDataStoreAssertionManager *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  _BOOL4 v24;
  id v26;
  id *p_controller;
  id v28;
  PBFPosterExtensionDataStoreAssertionManager *obj;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = self;
    objc_sync_enter(v7);
    obj = v7;
    -[_PBFPosterExtensionDataStoreAssertionController inUseAssertionsByIdentity](v7->_controller, "inUseAssertionsByIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inUseAssertionsByIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v5;
    v30 = (void *)objc_opt_new();
    v10 = (void *)objc_opt_new();
    p_controller = (id *)&v7->_controller;
    v28 = a3;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend(v8, "keyEnumerator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v36 != v13)
            objc_enumerationMutation(v11);
          v15 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v9, "objectForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "count") == 0;

          if (v17)
            objc_msgSend(v10, "addObject:", v15);
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v12);
    }

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(v9, "keyEnumerator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v32 != v20)
            objc_enumerationMutation(v18);
          v22 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
          objc_msgSend(v8, "objectForKey:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "count") == 0;

          if (v24)
            objc_msgSend(v30, "addObject:", v22);
        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v19);
    }

    objc_storeStrong(p_controller, v28);
    v6 = -[PBFPosterExtensionDataStoreAssertionManager _notifyObserversOfNewAssertions:newlyNotInUseAssertions:](obj, "_notifyObserversOfNewAssertions:newlyNotInUseAssertions:", v30, v10);

    objc_sync_exit(obj);
    v5 = v26;
  }

  return v6;
}

- (BOOL)_notifyObserversOfNewAssertions:(id)a3 newlyNotInUseAssertions:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  _QWORD v10[4];
  id v11;
  PBFPosterExtensionDataStoreAssertionManager *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count") || objc_msgSend(v7, "count"))
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __103__PBFPosterExtensionDataStoreAssertionManager__notifyObserversOfNewAssertions_newlyNotInUseAssertions___block_invoke;
    v10[3] = &unk_1E86F6198;
    v11 = v6;
    v12 = self;
    v13 = v7;
    -[PBFPosterExtensionDataStoreAssertionManager enumerateObservers:](self, "enumerateObservers:", v10);

    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __103__PBFPosterExtensionDataStoreAssertionManager__notifyObserversOfNewAssertions_newlyNotInUseAssertions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "assertionManager:identityIsNowMarkedAsInUse:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v6);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = *(id *)(a1 + 48);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v3, "assertionManager:identityIsNowMarkedAsNOTInUse:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v11);
  }

}

- (void)invalidate
{
  _PBFPosterExtensionDataStoreAssertionController *controller;

  if (-[BSAtomicFlag setFlag:](self->_invalidationFlag, "setFlag:", 1))
  {
    -[_PBFPosterExtensionDataStoreAssertionController invalidate](self->_controller, "invalidate");
    controller = self->_controller;
    self->_controller = 0;

  }
}

- (id)inUsePosterPathIdentitiesForReason:(id)a3
{
  id v4;
  PBFPosterExtensionDataStoreAssertionManager *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[_PBFPosterExtensionDataStoreAssertionController inUsePosterPathIdentitiesForReason:](v5->_controller, "inUsePosterPathIdentitiesForReason:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (int64_t)numberOfAssertionsForReason:(id)a3
{
  id v4;
  PBFPosterExtensionDataStoreAssertionManager *v5;
  int64_t v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = -[_PBFPosterExtensionDataStoreAssertionController numberOfAssertionsForReason:](v5->_controller, "numberOfAssertionsForReason:", v4);
  objc_sync_exit(v5);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_txFlag, 0);
  objc_storeStrong((id *)&self->_invalidationFlag, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
