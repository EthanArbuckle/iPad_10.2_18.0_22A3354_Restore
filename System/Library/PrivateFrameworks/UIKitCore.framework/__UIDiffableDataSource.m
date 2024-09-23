@implementation __UIDiffableDataSource

- (id)indexPathForItemIdentifier:(id)a3
{
  return (id)-[_UIDiffableDataSourceState indexPathForItemIdentifier:](self->_state, "indexPathForItemIdentifier:", a3);
}

- (id)sectionIdentifierForIndex:(int64_t)a3
{
  return (id)-[_UIDiffableDataSourceState sectionIdentifierForIndex:](self->_state, "sectionIdentifierForIndex:", a3);
}

- (void)setSupplementaryViewProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)_cellForRowAtIndexPath:(id)a3 tableView:(id)a4
{
  return -[__UIDiffableDataSource tableView:cellForRowAtIndexPath:](self, "tableView:cellForRowAtIndexPath:", a4, a3);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[_UIDiffableDataSourceState dataSourceSnapshot](self->_state, "dataSourceSnapshot", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v7;
  int64_t v8;
  void *v9;
  int64_t v10;
  void *v12;

  -[_UIDiffableDataSourceState dataSourceSnapshot](self->_state, "dataSourceSnapshot", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "numberOfSections");

  if (v8 <= a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 1640, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("section < [_state.dataSourceSnapshot numberOfSections]"));

  }
  -[_UIDiffableDataSourceState dataSourceSnapshot](self->_state, "dataSourceSnapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "numberOfItemsInSection:", a4);

  return v10;
}

- (int64_t)_numberOfRowsInSection:(int64_t)a3 tableView:(id)a4
{
  return -[__UIDiffableDataSource tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", a4, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlersForBatchApply, 0);
  objc_storeStrong((id *)&self->_snapshotQueue, 0);
  objc_storeStrong((id *)&self->_applyQueue, 0);
  objc_storeStrong((id *)&self->_viewUpdater, 0);
  objc_storeStrong(&self->_collectionViewCellConfigurationHandler, 0);
  objc_storeStrong(&self->_reuseIdentifierProvider, 0);
  objc_storeStrong(&self->_tableViewCellConfigurationHandler, 0);
  objc_storeStrong((id *)&self->_sectionSnapshotHandlers, 0);
  objc_storeStrong(&self->_canReorderItemHandler, 0);
  objc_storeStrong(&self->_didApplySnapshotHandler, 0);
  objc_storeStrong(&self->_willApplySnapshotHandler, 0);
  objc_storeStrong((id *)&self->_reorderingHandlers, 0);
  objc_storeStrong(&self->_cellObserver, 0);
  objc_storeStrong(&self->_supplementaryViewConfigurationHandler, 0);
  objc_storeStrong(&self->_supplementaryReuseIdentifierProvider, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_destroyWeak((id *)&self->_viewUpdatesSink);
  objc_storeStrong(&self->_collectionViewCellProvider, 0);
  objc_storeStrong((id *)&self->_expandCollapseAnimationContext, 0);
  objc_storeStrong(&self->_supplementaryViewProvider, 0);
  objc_storeStrong(&self->_tableViewCellProvider, 0);
  objc_storeStrong((id *)&self->_currentTransaction, 0);
  objc_storeStrong((id *)&self->_pendingReorderingTransaction, 0);
  objc_storeStrong((id *)&self->_sectionControllers, 0);
  objc_storeStrong(&self->_rendererIdentifierProvider, 0);
  objc_storeStrong((id *)&self->_rendererMap, 0);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_destroyWeak((id *)&self->_tableView);
}

- (void)_commitStateAtomically:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  void (**v11)(_QWORD);
  _QWORD aBlock[5];
  id v13;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49____UIDiffableDataSource__commitStateAtomically___block_invoke;
  aBlock[3] = &unk_1E16B1B50;
  aBlock[4] = self;
  v6 = v4;
  v13 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[__UIDiffableDataSource snapshotQueue](self, "snapshotQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[__UIDiffableDataSource snapshotQueue](self, "snapshotQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __49____UIDiffableDataSource__commitStateAtomically___block_invoke_2;
    block[3] = &unk_1E16B1BF8;
    v11 = v7;
    dispatch_sync(v9, block);

  }
  else
  {
    v7[2](v7);
  }

}

- (id)snapshot
{
  void *v3;
  void *v4;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __34____UIDiffableDataSource_snapshot__block_invoke;
  aBlock[3] = &unk_1E16BAD40;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  -[__UIDiffableDataSource _snapshotWithHandlerAtomic:](self, "_snapshotWithHandlerAtomic:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_snapshotWithHandlerAtomic:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v11[4];
  void (**v12)(_QWORD);
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = (void (**)(_QWORD))a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__35;
  v18 = __Block_byref_object_dispose__35;
  v19 = 0;
  -[__UIDiffableDataSource snapshotQueue](self, "snapshotQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[__UIDiffableDataSource snapshotQueue](self, "snapshotQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __53____UIDiffableDataSource__snapshotWithHandlerAtomic___block_invoke;
    v11[3] = &unk_1E16BAE58;
    v13 = &v14;
    v12 = v4;
    dispatch_sync(v6, v11);

    v7 = v12;
  }
  else
  {
    v4[2](v4);
    v8 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v15[5];
    v15[5] = v8;
  }

  v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (OS_dispatch_queue)snapshotQueue
{
  return self->_snapshotQueue;
}

- (void)_commitRebasedSectionSnapshotsFromCurrentTransactionIfNeeded
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (self->_currentTransaction)
  {
    os_unfair_recursive_lock_lock_with_options();
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[NSDiffableDataSourceTransaction sectionTransactions](self->_currentTransaction, "sectionTransactions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v32 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v8, "sectionIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[__UIDiffableDataSource associatedSectionControllerForSectionIdentifier:](self, "associatedSectionControllerForSectionIdentifier:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v10)
          {
            objc_msgSend(v10, "_extantMutableSnapshotForSection:", v9);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
            {
              objc_msgSend(v8, "finalSnapshot");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "_updateSnapshot:forSectionIdentifier:", v13, v9);

            }
          }

        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v5);
    }

    -[NSDiffableDataSourceTransaction initialSnapshot](self->_currentTransaction, "initialSnapshot");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDiffableDataSourceTransaction finalSnapshot](self->_currentTransaction, "finalSnapshot");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sectionIdentifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sectionIdentifiers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "differenceFromArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v18, "removals");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v28 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "object");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[__UIDiffableDataSource associatedSectionControllerForSectionIdentifier:](self, "associatedSectionControllerForSectionIdentifier:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v25;
          if (v25)
            objc_msgSend(v25, "_updateSnapshot:forSectionIdentifier:", 0, v24);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v21);
    }

    os_unfair_recursive_lock_unlock();
  }
}

- (id)associatedSectionControllerForSectionIdentifier:(id)a3
{
  id v4;
  NSHashTable *sectionControllers;
  NSHashTable *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && (sectionControllers = self->_sectionControllers) != 0)
  {
    if (-[NSHashTable count](sectionControllers, "count") == 1)
    {
      -[NSHashTable allObjects](self->_sectionControllers, "allObjects");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      -[NSHashTable firstObject](v6, "firstObject");
      v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
      v8 = v7;
    }
    else
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v6 = self->_sectionControllers;
      v8 = (void *)-[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v16;
        while (2)
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(_QWORD *)v16 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v11, "associatedSectionIdentifiers", (_QWORD)v15);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "containsObject:", v4);

            if (v13)
            {
              v7 = v11;
              goto LABEL_16;
            }
          }
          v8 = (void *)-[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (v8)
            continue;
          break;
        }
      }
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)numberOfSections
{
  return -[_UIDiffableDataSourceState numberOfSections](self->_state, "numberOfSections");
}

- (_UIDiffableDataSourceState)state
{
  return self->_state;
}

- (int64_t)numberOfItemsInSection:(id)a3
{
  return -[_UIDiffableDataSourceState numberOfItemsInSection:](self->_state, "numberOfItemsInSection:", a3);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v7;
  int64_t v8;
  void *v9;
  int64_t v10;
  void *v12;

  -[_UIDiffableDataSourceState dataSourceSnapshot](self->_state, "dataSourceSnapshot", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "numberOfSections");

  if (v8 <= a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 1510, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("section < [_state.dataSourceSnapshot numberOfSections]"));

  }
  -[_UIDiffableDataSourceState dataSourceSnapshot](self->_state, "dataSourceSnapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "numberOfItemsInSection:", a4);

  return v10;
}

- (int64_t)_numberOfItemsInSection:(int64_t)a3 collectionView:(id)a4
{
  return -[__UIDiffableDataSource collectionView:numberOfItemsInSection:](self, "collectionView:numberOfItemsInSection:", a4, a3);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  void *v3;
  int64_t v4;

  -[_UIDiffableDataSourceState dataSourceSnapshot](self->_state, "dataSourceSnapshot", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");

  return v4;
}

- (id)_cellForItemAtIndexPath:(id)a3 collectionView:(id)a4
{
  return -[__UIDiffableDataSource collectionView:cellForItemAtIndexPath:](self, "collectionView:cellForItemAtIndexPath:", a4, a3);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD);
  void (**v18)(_QWORD, _QWORD, _QWORD);
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v7 = a3;
  v8 = a4;
  -[__UIDiffableDataSource itemIdentifierForIndexPath:](self, "itemIdentifierForIndexPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[__UIDiffableDataSource collectionViewCellProvider](self, "collectionViewCellProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    -[__UIDiffableDataSource reuseIdentifierProvider](self, "reuseIdentifierProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 1536, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.reuseIdentifierProvider"));

    }
    -[__UIDiffableDataSource collectionViewCellConfigurationHandler](self, "collectionViewCellConfigurationHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 1537, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.collectionViewCellConfigurationHandler"));

    }
    -[__UIDiffableDataSource reuseIdentifierProvider](self, "reuseIdentifierProvider");
    v17 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v17)[2](v17, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      if (v9)
      {
LABEL_13:
        objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v14, v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[__UIDiffableDataSource collectionViewCellConfigurationHandler](self, "collectionViewCellConfigurationHandler");
        v18 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, void *))v18)[2](v18, v12, v9);

LABEL_14:
        goto LABEL_15;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 1540, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reuseIdentifier"));

      if (v9)
        goto LABEL_13;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 1541, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemIdentifier"));

    goto LABEL_13;
  }
  -[__UIDiffableDataSource collectionViewCellProvider](self, "collectionViewCellProvider");
  v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, id, void *))v11)[2](v11, v7, v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 1524, CFSTR("UICollectionViewDiffableDataSource cell provider returned nil for index path %@ with item identifier '%@', which is not allowed. You must always return a cell to the collection view: %@"), v8, v9, v7);

  }
  if (-[NSHashTable count](self->_sectionControllers, "count"))
  {
    -[__UIDiffableDataSource associatedSectionControllerForItemIdentifier:](self, "associatedSectionControllerForItemIdentifier:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
      objc_msgSend(v13, "configureCell:forItem:", v12, v9);
    goto LABEL_14;
  }
LABEL_15:

  return v12;
}

- (id)itemIdentifierForIndexPath:(id)a3
{
  return (id)-[_UIDiffableDataSourceState itemIdentifierForIndexPath:](self->_state, "itemIdentifierForIndexPath:", a3);
}

- (id)collectionViewCellProvider
{
  return self->_collectionViewCellProvider;
}

- (void)_applyDifferencesFromSnapshot:(id)a3 toSection:(id)a4 animatingDifferences:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  _UIDiffableDataSourceSectionControllerInternal *v13;
  id v14;
  id v15;
  id v16;
  _UIDiffableDataSourceSectionControllerInternal *v17;
  _QWORD v18[5];
  _UIDiffableDataSourceSectionControllerInternal *v19;
  id v20;
  id v21;
  id v22;
  BOOL v23;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  os_unfair_recursive_lock_lock_with_options();
  -[__UIDiffableDataSource associatedSectionControllerForSectionIdentifier:](self, "associatedSectionControllerForSectionIdentifier:", v11);
  v13 = (_UIDiffableDataSourceSectionControllerInternal *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v13 = -[_UIDiffableDataSourceSectionController initWithDiffableDataSourceImpl:]([_UIDiffableDataSourceSectionControllerInternal alloc], "initWithDiffableDataSourceImpl:", self);
    -[__UIDiffableDataSource addAssociatedSectionControllerIfNeeded:](self, "addAssociatedSectionControllerIfNeeded:", v13);
  }
  os_unfair_recursive_lock_unlock();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __98____UIDiffableDataSource__applyDifferencesFromSnapshot_toSection_animatingDifferences_completion___block_invoke;
  v18[3] = &unk_1E16BADB8;
  v18[4] = self;
  v19 = v13;
  v20 = v10;
  v21 = v11;
  v23 = a5;
  v22 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  v17 = v13;
  -[__UIDiffableDataSource _performOnApplyQueue:]((unint64_t *)self, v18);

}

- (void)_performApplyWithoutRebasingSectionSnapshots:(id)a3
{
  void (**v4)(_QWORD);
  _BOOL8 v5;

  v4 = (void (**)(_QWORD))a3;
  v5 = -[__UIDiffableDataSource isApplyingWithoutRebasingSectionSnapshots](self, "isApplyingWithoutRebasingSectionSnapshots");
  -[__UIDiffableDataSource setIsApplyingWithoutRebasingSectionSnapshots:](self, "setIsApplyingWithoutRebasingSectionSnapshots:", 1);
  v4[2](v4);

  -[__UIDiffableDataSource setIsApplyingWithoutRebasingSectionSnapshots:](self, "setIsApplyingWithoutRebasingSectionSnapshots:", v5);
}

- (void)setIsApplyingWithoutRebasingSectionSnapshots:(BOOL)a3
{
  self->_isApplyingWithoutRebasingSectionSnapshots = a3;
}

- (void)addAssociatedSectionControllerIfNeeded:(id)a3
{
  id v4;
  NSHashTable *sectionControllers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  sectionControllers = self->_sectionControllers;
  v8 = v4;
  if (!sectionControllers)
  {
    v6 = (NSHashTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 0, 1);
    v7 = self->_sectionControllers;
    self->_sectionControllers = v6;

    v4 = v8;
    sectionControllers = self->_sectionControllers;
  }
  -[NSHashTable addObject:](sectionControllers, "addObject:", v4);

}

- (UICollectionView)_collectionView
{
  return (UICollectionView *)objc_loadWeakRetained((id *)&self->_collectionView);
}

- (id)associatedSectionControllerForItemIdentifier:(id)a3
{
  void *v4;
  void *v5;

  if (a3)
  {
    -[__UIDiffableDataSource sectionIdentifierForSectionContainingItemIdentifier:](self, "sectionIdentifierForSectionContainingItemIdentifier:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[__UIDiffableDataSource associatedSectionControllerForSectionIdentifier:](self, "associatedSectionControllerForSectionIdentifier:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)sectionIdentifierForSectionContainingItemIdentifier:(id)a3
{
  return (id)-[_UIDiffableDataSourceState sectionIdentifierForSectionContainingItemIdentifier:](self->_state, "sectionIdentifierForSectionContainingItemIdentifier:", a3);
}

- (UICollectionViewDiffableDataSourceReorderingHandlers)reorderingHandlers
{
  UICollectionViewDiffableDataSourceReorderingHandlers *reorderingHandlers;
  UICollectionViewDiffableDataSourceReorderingHandlers *v4;
  UICollectionViewDiffableDataSourceReorderingHandlers *v5;

  reorderingHandlers = self->_reorderingHandlers;
  if (!reorderingHandlers)
  {
    v4 = objc_alloc_init(UICollectionViewDiffableDataSourceReorderingHandlers);
    v5 = self->_reorderingHandlers;
    self->_reorderingHandlers = v4;

    reorderingHandlers = self->_reorderingHandlers;
  }
  return reorderingHandlers;
}

- (id)canReorderItemHandler
{
  return self->_canReorderItemHandler;
}

- (NSDiffableDataSourceTransaction)currentTransaction
{
  return self->_currentTransaction;
}

- (BOOL)_canApplySnapshotUpdateWithoutDiffing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  NSUInteger v11;
  BOOL v12;
  char v13;
  char v14;

  v4 = a3;
  objc_msgSend(v4, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "generationID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDiffableDataSourceState generationID](self->_state, "generationID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  objc_msgSend(v4, "pendingSnapshotUpdates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "count");
  v11 = -[NSHashTable count](self->_sectionControllers, "count");
  v12 = -[__UIDiffableDataSource isApplyingWithoutRebasingSectionSnapshots](self, "isApplyingWithoutRebasingSectionSnapshots");
  if (v11)
    v13 = v12;
  else
    v13 = 1;
  if (v10 == 1)
    v14 = v8;
  else
    v14 = 0;
  return v14 & v13;
}

- (void)_computeCurrentTransactionForFinalSnapshot:(id)a3 withDataSourceDiffer:(id)a4
{
  id v6;
  NSDiffableDataSourceTransaction *pendingReorderingTransaction;
  NSDiffableDataSourceTransaction *v8;
  NSDiffableDataSourceTransaction *currentTransaction;
  id v10;

  v10 = a3;
  v6 = a4;
  pendingReorderingTransaction = self->_pendingReorderingTransaction;
  if (pendingReorderingTransaction)
  {
    objc_storeStrong((id *)&self->_currentTransaction, pendingReorderingTransaction);
  }
  else
  {
    os_unfair_recursive_lock_lock_with_options();
    -[__UIDiffableDataSource _transactionForFinalSnapshot:dataSourceDiffer:shouldSkipRebasingSectionSnapshots:](self, "_transactionForFinalSnapshot:dataSourceDiffer:shouldSkipRebasingSectionSnapshots:", v10, v6, -[__UIDiffableDataSource isApplyingWithoutRebasingSectionSnapshots](self, "isApplyingWithoutRebasingSectionSnapshots"));
    v8 = (NSDiffableDataSourceTransaction *)objc_claimAutoreleasedReturnValue();
    currentTransaction = self->_currentTransaction;
    self->_currentTransaction = v8;

    os_unfair_recursive_lock_unlock();
  }

}

- (BOOL)isApplyingWithoutRebasingSectionSnapshots
{
  return self->_isApplyingWithoutRebasingSectionSnapshots;
}

- (id)_transactionForFinalSnapshot:(id)a3 dataSourceDiffer:(id)a4 shouldSkipRebasingSectionSnapshots:(BOOL)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id *v25;
  void *v26;
  void *v27;
  _UIDiffableDataSourceSectionSnapshotRebaser *v28;
  _UIDiffableDataSourceSectionSnapshotRebaser *v29;
  NSDiffableDataSourceTransaction *v30;
  id v31;
  NSDiffableDataSourceTransaction *v32;
  __UIDiffableDataSource *v34;
  _BOOL4 v35;
  id v36;
  id v37;
  NSHashTable *obj;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v35 = a5;
  v50 = *MEMORY[0x1E0C80C00];
  v37 = a3;
  v36 = a4;
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v34 = self;
  obj = self->_sectionControllers;
  v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v8)
  {
    v9 = v8;
    v39 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v45 != v39)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "_snapshotsMap", v34);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        objc_msgSend(v11, "keyEnumerator");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v41;
          do
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v41 != v15)
                objc_enumerationMutation(v12);
              v17 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j);
              objc_msgSend(v11, "objectForKey:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setObject:forKey:", v18, v17);

            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
          }
          while (v14);
        }

      }
      v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v9);
  }

  v19 = (void *)objc_msgSend(objc_alloc((Class)off_1E1679A30), "initWithState:", v34->_state);
  v20 = objc_alloc((Class)off_1E1679A30);
  objc_msgSend(v37, "state");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithState:", v21);

  if (v35)
  {
    v23 = v36;
    if (v36)
      v24 = (void *)*((_QWORD *)v36 + 4);
    else
      v24 = 0;
    v25 = v24;
    -[_UIIdentifierDiffer collectionDifference](v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
    {
      v28 = v26;
    }
    else
    {
      v31 = objc_alloc(MEMORY[0x1E0CB3838]);
      v28 = (_UIDiffableDataSourceSectionSnapshotRebaser *)objc_msgSend(v31, "initWithChanges:", MEMORY[0x1E0C9AA60]);
    }
    v29 = v28;

    v30 = -[NSDiffableDataSourceTransaction initWithInitialSnapshot:finalSnapshot:source:difference:finalSectionSnapshots:]([NSDiffableDataSourceTransaction alloc], "initWithInitialSnapshot:finalSnapshot:source:difference:finalSectionSnapshots:", v19, v22, 0, v29, v7);
  }
  else
  {
    v23 = v36;
    v29 = -[_UIDiffableDataSourceSectionSnapshotRebaser initWithInitialSnapshot:finalSnapshot:initialSectionSnapshots:dataSourceDiffer:]([_UIDiffableDataSourceSectionSnapshotRebaser alloc], "initWithInitialSnapshot:finalSnapshot:initialSectionSnapshots:dataSourceDiffer:", v19, v22, v7, v36);
    -[_UIDiffableDataSourceSectionSnapshotRebaser computeApplyTransactionIncludingSectionDifferences:](v29, "computeApplyTransactionIncludingSectionDifferences:", 0);
    v30 = (NSDiffableDataSourceTransaction *)objc_claimAutoreleasedReturnValue();
  }
  v32 = v30;

  return v32;
}

- (void)_resetCurrentTransaction
{
  NSDiffableDataSourceTransaction *pendingReorderingTransaction;
  NSDiffableDataSourceTransaction *currentTransaction;

  pendingReorderingTransaction = self->_pendingReorderingTransaction;
  self->_pendingReorderingTransaction = 0;

  currentTransaction = self->_currentTransaction;
  self->_currentTransaction = 0;

}

- (void)applyDifferencesFromSnapshot:(id)a3 animatingDifferences:(BOOL)a4 completion:(id)a5
{
  -[__UIDiffableDataSource _applyDifferencesFromSnapshot:animatingDifferences:completion:isOnApplyQueue:](self, "_applyDifferencesFromSnapshot:animatingDifferences:completion:isOnApplyQueue:", a3, a4, a5, 0);
}

- (unint64_t)mutationQueueSource
{
  return self->_mutationQueueSource;
}

- (OS_dispatch_queue)applyQueue
{
  return self->_applyQueue;
}

- (void)_storeState:(id)a3
{
  id v4;
  _UIDiffableDataSourceState *state;

  v4 = a3;
  objc_msgSend(v4, "willBecomeWiredToDataSource");
  state = self->_state;
  self->_state = (_UIDiffableDataSourceState *)v4;

}

- (BOOL)isSuppressingViewUpdates
{
  return self->_completionHandlersForBatchApply != 0;
}

- (void)setMutationQueueSource:(unint64_t)a3
{
  self->_mutationQueueSource = a3;
}

- (void)_notifyWillApplyForCurrentTransactionIfNeeded
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  id v9;

  if (self->_currentTransaction)
  {
    -[__UIDiffableDataSource willApplySnapshotHandler](self, "willApplySnapshotHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[__UIDiffableDataSource willApplySnapshotHandler](self, "willApplySnapshotHandler");
      v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[NSDiffableDataSourceTransaction _spiCopy](self->_currentTransaction, "_spiCopy");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v4)[2](v4, v5);

    }
    if (-[__UIDiffableDataSource _isApplyingReorderingTransaction](self, "_isApplyingReorderingTransaction"))
    {
      -[__UIDiffableDataSource reorderingHandlers](self, "reorderingHandlers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "willReorderHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[__UIDiffableDataSource reorderingHandlers](self, "reorderingHandlers");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "willReorderHandler");
        v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, NSDiffableDataSourceTransaction *))v8)[2](v8, self->_currentTransaction);

      }
    }
  }
}

- (id)willApplySnapshotHandler
{
  return self->_willApplySnapshotHandler;
}

- (void)_notifyDidApplyForCurrentTransactionIfNeeded
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  id v9;

  if (self->_currentTransaction)
  {
    -[__UIDiffableDataSource didApplySnapshotHandler](self, "didApplySnapshotHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[__UIDiffableDataSource didApplySnapshotHandler](self, "didApplySnapshotHandler");
      v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[NSDiffableDataSourceTransaction _spiCopy](self->_currentTransaction, "_spiCopy");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v4)[2](v4, v5);

    }
    if (-[__UIDiffableDataSource _isApplyingReorderingTransaction](self, "_isApplyingReorderingTransaction"))
    {
      -[__UIDiffableDataSource reorderingHandlers](self, "reorderingHandlers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "didReorderHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[__UIDiffableDataSource reorderingHandlers](self, "reorderingHandlers");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "didReorderHandler");
        v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, NSDiffableDataSourceTransaction *))v8)[2](v8, self->_currentTransaction);

      }
    }
  }
}

- (BOOL)_isApplyingReorderingTransaction
{
  return self->_pendingReorderingTransaction != 0;
}

- (id)didApplySnapshotHandler
{
  return self->_didApplySnapshotHandler;
}

- (int64_t)outstandingApplyCount
{
  return atomic_load((unint64_t *)&self->_outstandingApplyCount);
}

- (int64_t)_commitNewDataSource:(id)a3 withViewUpdates:(id)a4 viewPropertyAnimator:(id)a5 customAnimationsProvider:(id)a6 animated:(BOOL)a7 commitAlongsideHandler:(id)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int64_t v26;
  void *v28;
  uint64_t v29;
  id v30;
  _QWORD aBlock[4];
  id v33;
  __UIDiffableDataSource *v34;
  id v35;

  v15 = a3;
  v16 = a8;
  v17 = a9;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 1069, CFSTR("Error: Updates can only be committed on the main thread."));

  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __152____UIDiffableDataSource__commitNewDataSource_withViewUpdates_viewPropertyAnimator_customAnimationsProvider_animated_commitAlongsideHandler_completion___block_invoke;
  aBlock[3] = &unk_1E16BAD68;
  v33 = v15;
  v34 = self;
  v35 = v16;
  v30 = v16;
  v21 = v15;
  v22 = _Block_copy(aBlock);
  kdebug_trace();
  -[__UIDiffableDataSource viewUpdater](self, "viewUpdater");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDiffableDataSourceState dataSourceSnapshot](self->_state, "dataSourceSnapshot");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167C258, "snapshotterForSnapshot:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v29) = a7;
  v26 = objc_msgSend(v23, "_performUpdateWithCollectionViewUpdateItems:dataSourceSnapshot:updateHandler:completion:viewPropertyAnimator:customAnimationsProvider:animated:", v20, v25, v22, v17, v19, v18, v29);

  kdebug_trace();
  return v26;
}

- (_UIDiffableDataSourceViewUpdater)viewUpdater
{
  return self->_viewUpdater;
}

- (id)_transactionForReloadUpdatesWithSnapshot:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0CB3838];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = MEMORY[0x1E0C9AA60];
  v7 = (void *)objc_msgSend(v5, "initWithChanges:", MEMORY[0x1E0C9AA60]);
  +[NSDiffableDataSourceTransaction applyTransactionWithInitialSnapshot:finalSnapshot:difference:sectionTransactions:](NSDiffableDataSourceTransaction, "applyTransactionWithInitialSnapshot:finalSnapshot:difference:sectionTransactions:", v4, v4, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)reloadFromSnapshot:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56____UIDiffableDataSource_reloadFromSnapshot_completion___block_invoke;
  v10[3] = &unk_1E16BAD68;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[__UIDiffableDataSource _performOnApplyQueue:]((unint64_t *)self, v10);

}

- (__UIDiffableDataSource)initWithCollectionView:(id)a3 cellProvider:(id)a4
{
  id v6;
  id v7;
  id v8;
  __UIDiffableDataSource *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)off_1E167C2F0);
  v9 = -[__UIDiffableDataSource initWithCollectionView:cellProvider:reuseIdentifierProvider:cellConfigurationHandler:state:dataSource:](self, "initWithCollectionView:cellProvider:reuseIdentifierProvider:cellConfigurationHandler:state:dataSource:", v7, v6, 0, 0, v8, 0);

  return v9;
}

- (__UIDiffableDataSource)initWithCollectionView:(id)a3 cellProvider:(id)a4 reuseIdentifierProvider:(id)a5 cellConfigurationHandler:(id)a6 state:(id)a7 dataSource:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  __UIDiffableDataSource *v19;
  __UIDiffableDataSource *v20;
  _UIDiffableDataSourceViewUpdater *v21;
  _UIDiffableDataSourceViewUpdater *viewUpdater;
  uint64_t v23;
  id collectionViewCellProvider;
  uint64_t v25;
  id reuseIdentifierProvider;
  uint64_t v27;
  id collectionViewCellConfigurationHandler;
  void *v29;
  __UIDiffableDataSource *v30;
  objc_super v32;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = (__UIDiffableDataSource *)a8;
  v32.receiver = self;
  v32.super_class = (Class)__UIDiffableDataSource;
  v20 = -[__UIDiffableDataSource init](&v32, sel_init);
  if (v20)
  {
    v21 = -[_UIDiffableDataSourceViewUpdater initWithCollectionView:]([_UIDiffableDataSourceViewUpdater alloc], "initWithCollectionView:", v14);
    viewUpdater = v20->_viewUpdater;
    v20->_viewUpdater = v21;

    v23 = objc_msgSend(v15, "copy");
    collectionViewCellProvider = v20->_collectionViewCellProvider;
    v20->_collectionViewCellProvider = (id)v23;

    v25 = objc_msgSend(v16, "copy");
    reuseIdentifierProvider = v20->_reuseIdentifierProvider;
    v20->_reuseIdentifierProvider = (id)v25;

    v27 = objc_msgSend(v17, "copy");
    collectionViewCellConfigurationHandler = v20->_collectionViewCellConfigurationHandler;
    v20->_collectionViewCellConfigurationHandler = (id)v27;

    v29 = (void *)objc_msgSend(objc_alloc((Class)off_1E167C2F0), "initWithState:", v18);
    -[__UIDiffableDataSource _storeState:](v20, "_storeState:", v29);

    objc_storeWeak((id *)&v20->_collectionView, v14);
    _UIDiffableDataSourceCommonInit(v20);
    if (v19)
      v30 = v19;
    else
      v30 = v20;
    objc_msgSend(v14, "setDataSource:", v30);
  }

  return v20;
}

- (void)setTableViewDefaultRowAnimation:(int64_t)a3
{
  id v4;

  -[__UIDiffableDataSource viewUpdater](self, "viewUpdater");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTableViewRowAnimation:", a3);

}

- (int64_t)indexForSectionIdentifier:(id)a3
{
  return -[_UIDiffableDataSourceState indexForSectionIdentifier:](self->_state, "indexForSectionIdentifier:", a3);
}

- (id)_viewForSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4 collectionView:(id)a5
{
  return -[__UIDiffableDataSource collectionView:viewForSupplementaryElementOfKind:atIndexPath:](self, "collectionView:viewForSupplementaryElementOfKind:atIndexPath:", a5, a3, a4);
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v18;
  void *v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  void (**v21)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[__UIDiffableDataSource supplementaryViewProvider](self, "supplementaryViewProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    goto LABEL_5;
  -[__UIDiffableDataSource supplementaryReuseIdentifierProvider](self, "supplementaryReuseIdentifierProvider");
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13
    || (v14 = (void *)v13,
        -[__UIDiffableDataSource supplementaryViewConfigurationHandler](self, "supplementaryViewConfigurationHandler"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v15,
        v14,
        !v15))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 1551, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.supplementaryViewProvider || (self.supplementaryReuseIdentifierProvider && self.supplementaryViewConfigurationHandler)"));
LABEL_5:

  }
  -[__UIDiffableDataSource supplementaryViewProvider](self, "supplementaryViewProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    -[__UIDiffableDataSource supplementaryReuseIdentifierProvider](self, "supplementaryReuseIdentifierProvider");
    v20 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v20)[2](v20, v10, v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 1559, CFSTR("Error: reuseIdentifier must not be nil"));

    }
    objc_msgSend(v9, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v10, v19, v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[__UIDiffableDataSource supplementaryViewConfigurationHandler](self, "supplementaryViewConfigurationHandler");
    v21 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, id, id))v21)[2](v21, v18, v10, v11);

    goto LABEL_12;
  }
  -[__UIDiffableDataSource supplementaryViewProvider](self, "supplementaryViewProvider");
  v17 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, id, id))v17)[2](v17, v9, v10, v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 1556, CFSTR("UICollectionViewDiffableDataSource supplementary view provider returned nil for element kind '%@' at index path %@, which is not allowed. You must always return a view to the collection view: %@"), v10, v11, v9);
LABEL_12:

  }
  return v18;
}

- (id)supplementaryViewProvider
{
  return self->_supplementaryViewProvider;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD);
  void (**v19)(_QWORD, _QWORD, _QWORD);
  void *v21;
  void *v22;

  v7 = a3;
  v8 = a4;
  -[__UIDiffableDataSource tableViewCellProvider](self, "tableViewCellProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    goto LABEL_5;
  -[__UIDiffableDataSource tableViewCellConfigurationHandler](self, "tableViewCellConfigurationHandler");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10
    || (v11 = (void *)v10,
        -[__UIDiffableDataSource reuseIdentifierProvider](self, "reuseIdentifierProvider"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v11,
        !v12))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 1646, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.tableViewCellProvider || (self.tableViewCellConfigurationHandler && self.reuseIdentifierProvider)"));
LABEL_5:

  }
  -[__UIDiffableDataSource itemIdentifierForIndexPath:](self, "itemIdentifierForIndexPath:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 1649, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemIdentifier"));

  }
  -[__UIDiffableDataSource tableViewCellProvider](self, "tableViewCellProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    -[__UIDiffableDataSource reuseIdentifierProvider](self, "reuseIdentifierProvider");
    v18 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v18)[2](v18, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 1657, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reuseIdentifier"));

    }
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[__UIDiffableDataSource tableViewCellConfigurationHandler](self, "tableViewCellConfigurationHandler");
    v19 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v19)[2](v19, v16, v13);

    goto LABEL_14;
  }
  -[__UIDiffableDataSource tableViewCellProvider](self, "tableViewCellProvider");
  v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, id, void *))v15)[2](v15, v7, v8, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 1654, CFSTR("UITableViewDiffableDataSource cell provider returned nil for index path %@ with item identifier '%@', which is not allowed. You must always return a cell to the table view: %@"), v8, v13, v7);
LABEL_14:

  }
  return v16;
}

- (id)tableViewCellProvider
{
  return self->_tableViewCellProvider;
}

- (__UIDiffableDataSource)initWithTableView:(id)a3 cellProvider:(id)a4
{
  id v6;
  id v7;
  id v8;
  __UIDiffableDataSource *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)off_1E167C2F0);
  v9 = -[__UIDiffableDataSource initWithTableView:cellProvider:reuseIdentifierProvider:cellConfigurationHandler:state:dataSource:](self, "initWithTableView:cellProvider:reuseIdentifierProvider:cellConfigurationHandler:state:dataSource:", v7, v6, 0, 0, v8, 0);

  return v9;
}

- (__UIDiffableDataSource)initWithTableView:(id)a3 cellProvider:(id)a4 reuseIdentifierProvider:(id)a5 cellConfigurationHandler:(id)a6 state:(id)a7 dataSource:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  __UIDiffableDataSource *v19;
  __UIDiffableDataSource *v20;
  _UIDiffableDataSourceViewUpdater *v21;
  _UIDiffableDataSourceViewUpdater *viewUpdater;
  uint64_t v23;
  id tableViewCellProvider;
  uint64_t v25;
  id reuseIdentifierProvider;
  uint64_t v27;
  id tableViewCellConfigurationHandler;
  void *v29;
  __UIDiffableDataSource *v30;
  objc_super v32;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = (__UIDiffableDataSource *)a8;
  v32.receiver = self;
  v32.super_class = (Class)__UIDiffableDataSource;
  v20 = -[__UIDiffableDataSource init](&v32, sel_init);
  if (v20)
  {
    v21 = -[_UIDiffableDataSourceViewUpdater initWithTableView:]([_UIDiffableDataSourceViewUpdater alloc], "initWithTableView:", v14);
    viewUpdater = v20->_viewUpdater;
    v20->_viewUpdater = v21;

    v23 = objc_msgSend(v15, "copy");
    tableViewCellProvider = v20->_tableViewCellProvider;
    v20->_tableViewCellProvider = (id)v23;

    v25 = objc_msgSend(v16, "copy");
    reuseIdentifierProvider = v20->_reuseIdentifierProvider;
    v20->_reuseIdentifierProvider = (id)v25;

    v27 = objc_msgSend(v17, "copy");
    tableViewCellConfigurationHandler = v20->_tableViewCellConfigurationHandler;
    v20->_tableViewCellConfigurationHandler = (id)v27;

    v29 = (void *)objc_msgSend(objc_alloc((Class)off_1E167C2F0), "initWithState:", v18);
    -[__UIDiffableDataSource _storeState:](v20, "_storeState:", v29);

    objc_storeWeak((id *)&v20->_tableView, v14);
    _UIDiffableDataSourceCommonInit(v20);
    if (v19)
      v30 = v19;
    else
      v30 = v20;
    objc_msgSend(v14, "setDataSource:", v30);
  }

  return v20;
}

- (void)setSectionSnapshotHandlers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void)setCanReorderItemHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void)_performBatchApplyUsingReloadData:(id)a3
{
  void (**v5)(_QWORD);
  NSMutableArray *v6;
  NSMutableArray *completionHandlersForBatchApply;
  void *v8;
  NSMutableArray *v9;
  NSMutableArray *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(_QWORD))a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 800, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != NULL"));

  }
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 801, CFSTR("%@ is only supported on the main queue"), v18);

  }
  if (self->_completionHandlersForBatchApply)
  {
    v5[2](v5);
  }
  else
  {
    v6 = (NSMutableArray *)objc_opt_new();
    completionHandlersForBatchApply = self->_completionHandlersForBatchApply;
    self->_completionHandlersForBatchApply = v6;

    v5[2](v5);
    -[__UIDiffableDataSource viewUpdater](self, "viewUpdater");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_reloadData");

    v9 = self->_completionHandlersForBatchApply;
    v10 = self->_completionHandlersForBatchApply;
    self->_completionHandlersForBatchApply = 0;

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = v9;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i) + 16))();
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }

  }
}

- (void)setDidApplySnapshotHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void)setReorderingHandlers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (UICollectionViewDiffableDataSourceSectionSnapshotHandlers)sectionSnapshotHandlers
{
  UICollectionViewDiffableDataSourceSectionSnapshotHandlers *sectionSnapshotHandlers;
  UICollectionViewDiffableDataSourceSectionSnapshotHandlers *v4;
  UICollectionViewDiffableDataSourceSectionSnapshotHandlers *v5;

  sectionSnapshotHandlers = self->_sectionSnapshotHandlers;
  if (!sectionSnapshotHandlers)
  {
    v4 = objc_alloc_init(UICollectionViewDiffableDataSourceSectionSnapshotHandlers);
    v5 = self->_sectionSnapshotHandlers;
    self->_sectionSnapshotHandlers = v4;

    sectionSnapshotHandlers = self->_sectionSnapshotHandlers;
  }
  return sectionSnapshotHandlers;
}

+ (void)initialize
{
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, &__block_literal_global_104);
}

- (UITableView)tableView
{
  UITableView **p_tableView;
  id WeakRetained;
  __UIDiffableDataSource *v5;
  id v6;

  p_tableView = &self->_tableView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  objc_msgSend(WeakRetained, "dataSource");
  v5 = (__UIDiffableDataSource *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
    v6 = objc_loadWeakRetained((id *)p_tableView);
  else
    v6 = 0;
  return (UITableView *)v6;
}

- (__UIDiffableDataSource)initWithState:(id)a3
{
  id v4;
  __UIDiffableDataSource *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)__UIDiffableDataSource;
  v5 = -[__UIDiffableDataSource init](&v8, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc((Class)off_1E167C2F0), "initWithState:", v4);
    -[__UIDiffableDataSource _storeState:](v5, "_storeState:", v6);

    _UIDiffableDataSourceCommonInit(v5);
  }

  return v5;
}

- (__UIDiffableDataSource)initWithViewUpdatesSink:(id)a3
{
  id v4;
  __UIDiffableDataSource *v5;
  _UIDiffableDataSourceViewUpdater *v6;
  _UIDiffableDataSourceViewUpdater *viewUpdater;
  id v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)__UIDiffableDataSource;
  v5 = -[__UIDiffableDataSource init](&v10, sel_init);
  if (v5)
  {
    v6 = -[_UIDiffableDataSourceViewUpdater initWithCollectionViewUpdatesSink:]([_UIDiffableDataSourceViewUpdater alloc], "initWithCollectionViewUpdatesSink:", v4);
    viewUpdater = v5->_viewUpdater;
    v5->_viewUpdater = v6;

    v8 = objc_alloc_init((Class)off_1E167C2F0);
    -[__UIDiffableDataSource _storeState:](v5, "_storeState:", v8);

    _UIDiffableDataSourceCommonInit(v5);
  }

  return v5;
}

- (__UIDiffableDataSource)initWithCollectionView:(id)a3 sectionControllers:(id)a4 rendererIdentifierProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  __UIDiffableDataSource *v12;
  uint64_t v13;
  NSHashTable *sectionControllers;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init((Class)off_1E167C2F0);
  v12 = -[__UIDiffableDataSource initWithCollectionView:cellProvider:reuseIdentifierProvider:cellConfigurationHandler:state:dataSource:](self, "initWithCollectionView:cellProvider:reuseIdentifierProvider:cellConfigurationHandler:state:dataSource:", v8, 0, 0, 0, v11, 0);

  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 0, objc_msgSend(v9, "count"));
  sectionControllers = v12->_sectionControllers;
  v12->_sectionControllers = (NSHashTable *)v13;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = v9;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v20, "setDataSource:", v12, (_QWORD)v23);
        objc_msgSend(v20, "itemRenderers");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[__UIDiffableDataSource _registerItemRenderers:rendererIdentifierProvider:](v12, "_registerItemRenderers:rendererIdentifierProvider:", v21, v10);

        -[NSHashTable addObject:](v12->_sectionControllers, "addObject:", v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v17);
  }

  return v12;
}

- (__UIDiffableDataSource)initWithCollectionView:(id)a3 itemRenderers:(id)a4 rendererIdentifierProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  __UIDiffableDataSource *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init((Class)off_1E167C2F0);
  v12 = -[__UIDiffableDataSource initWithCollectionView:cellProvider:reuseIdentifierProvider:cellConfigurationHandler:state:dataSource:](self, "initWithCollectionView:cellProvider:reuseIdentifierProvider:cellConfigurationHandler:state:dataSource:", v10, 0, 0, 0, v11, 0);

  -[__UIDiffableDataSource _registerItemRenderers:rendererIdentifierProvider:](v12, "_registerItemRenderers:rendererIdentifierProvider:", v9, v8);
  return v12;
}

- (__UIDiffableDataSource)initWithCollectionView:(id)a3 cellProvider:(id)a4 dataSource:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  __UIDiffableDataSource *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init((Class)off_1E167C2F0);
  v12 = -[__UIDiffableDataSource initWithCollectionView:cellProvider:reuseIdentifierProvider:cellConfigurationHandler:state:dataSource:](self, "initWithCollectionView:cellProvider:reuseIdentifierProvider:cellConfigurationHandler:state:dataSource:", v10, v9, 0, 0, v11, v8);

  return v12;
}

- (__UIDiffableDataSource)initWithCollectionView:(id)a3 reuseIdentifierProvider:(id)a4 cellConfigurationHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  __UIDiffableDataSource *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init((Class)off_1E167C2F0);
  v12 = -[__UIDiffableDataSource initWithCollectionView:cellProvider:reuseIdentifierProvider:cellConfigurationHandler:state:dataSource:](self, "initWithCollectionView:cellProvider:reuseIdentifierProvider:cellConfigurationHandler:state:dataSource:", v10, 0, v9, v8, v11, 0);

  return v12;
}

- (UICollectionView)collectionView
{
  UICollectionView **p_collectionView;
  id WeakRetained;
  __UIDiffableDataSource *v5;
  id v6;

  p_collectionView = &self->_collectionView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  objc_msgSend(WeakRetained, "dataSource");
  v5 = (__UIDiffableDataSource *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
    v6 = objc_loadWeakRetained((id *)p_collectionView);
  else
    v6 = 0;
  return (UICollectionView *)v6;
}

- (__UIDiffableDataSource)initWithTableView:(id)a3 reuseIdentifierProvider:(id)a4 cellConfigurationHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  __UIDiffableDataSource *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init((Class)off_1E167C2F0);
  v12 = -[__UIDiffableDataSource initWithTableView:cellProvider:reuseIdentifierProvider:cellConfigurationHandler:state:dataSource:](self, "initWithTableView:cellProvider:reuseIdentifierProvider:cellConfigurationHandler:state:dataSource:", v10, 0, v9, v8, v11, 0);

  return v12;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDiffableDataSourceState dataSourceSnapshot](self->_state, "dataSourceSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDiffableDataSourceState sections](self->_state, "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDiffableDataSourceState identifiers](self->_state, "identifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: sectionCounts=%@; sections=[%p]; identifiers=[%p]>"),
    v5,
    self,
    v6,
    v7,
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (BOOL)_isDiffableDataSource
{
  return 1;
}

- (int64_t)numberOfItems
{
  return -[_UIDiffableDataSourceState numberOfItems](self->_state, "numberOfItems");
}

- (NSArray)sectionIdentifiers
{
  return (NSArray *)-[_UIDiffableDataSourceState sectionIdentifiers](self->_state, "sectionIdentifiers");
}

- (NSArray)itemIdentifiers
{
  return (NSArray *)-[_UIDiffableDataSourceState itemIdentifiers](self->_state, "itemIdentifiers");
}

- (NSArray)reloadedSectionIdentifiers
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSArray)reloadedItemIdentifiers
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSArray)reconfiguredItemIdentifiers
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (id)itemIdentifiersInSectionWithIdentifier:(id)a3
{
  return (id)-[_UIDiffableDataSourceState itemIdentifiersInSectionWithIdentifier:](self->_state, "itemIdentifiersInSectionWithIdentifier:", a3);
}

- (int64_t)indexOfItemIdentifier:(id)a3
{
  return -[_UIDiffableDataSourceState indexOfItemIdentifier:](self->_state, "indexOfItemIdentifier:", a3);
}

- (int64_t)indexOfSectionIdentifier:(id)a3
{
  return -[_UIDiffableDataSourceState indexOfSectionIdentifier:](self->_state, "indexOfSectionIdentifier:", a3);
}

- (void)appendItemsWithIdentifiers:(id)a3
{
  -[__UIDiffableDataSource appendItemsWithIdentifiers:intoSectionWithIdentifier:](self, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", a3, 0);
}

- (void)appendItemsWithIdentifiers:(id)a3 intoSectionWithIdentifier:(id)a4
{
  _UIDiffableDataSourceState *state;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  state = self->_state;
  v8 = a4;
  v9 = a3;
  -[_UIDiffableDataSourceState dataSourceSnapshot](state, "dataSourceSnapshot");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "numberOfSections");

  if (v11 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 386, CFSTR("There are currently no sections in the data source. Please add a section first."));

  }
  -[__UIDiffableDataSource snapshot](self, "snapshot");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v9, v8);

  -[__UIDiffableDataSource applyDifferencesFromSnapshot:](self, "applyDifferencesFromSnapshot:", v13);
}

- (void)insertItemsWithIdentifiers:(id)a3 beforeItemWithIdentifier:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 394, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifiers"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 395, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destinationIdentifier"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  -[__UIDiffableDataSource snapshot](self, "snapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insertItemsWithIdentifiers:beforeItemWithIdentifier:", v11, v7);
  -[__UIDiffableDataSource applyDifferencesFromSnapshot:](self, "applyDifferencesFromSnapshot:", v8);

}

- (void)insertItemsWithIdentifiers:(id)a3 afterItemWithIdentifier:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 403, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifiers"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 404, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destinationIdentifier"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  -[__UIDiffableDataSource snapshot](self, "snapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insertItemsWithIdentifiers:afterItemWithIdentifier:", v11, v7);
  -[__UIDiffableDataSource applyDifferencesFromSnapshot:](self, "applyDifferencesFromSnapshot:", v8);

}

- (void)deleteItemsWithIdentifiers:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[__UIDiffableDataSource snapshot](self, "snapshot");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteItemsWithIdentifiers:", v4);

  -[__UIDiffableDataSource applyDifferencesFromSnapshot:](self, "applyDifferencesFromSnapshot:", v5);
}

- (void)deleteAllItems
{
  id v3;

  -[__UIDiffableDataSource emptySnapshot](self, "emptySnapshot");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[__UIDiffableDataSource applyDifferencesFromSnapshot:](self, "applyDifferencesFromSnapshot:", v3);

}

- (void)moveItemWithIdentifier:(id)a3 beforeItemWithIdentifier:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 423, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromIdentifier"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 424, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toIdentifier"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  -[__UIDiffableDataSource snapshot](self, "snapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "moveItemWithIdentifier:beforeItemWithIdentifier:", v11, v7);
  -[__UIDiffableDataSource applyDifferencesFromSnapshot:](self, "applyDifferencesFromSnapshot:", v8);

}

- (void)moveItemWithIdentifier:(id)a3 afterItemWithIdentifier:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 432, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromIdentifier"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 433, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toIdentifier"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  -[__UIDiffableDataSource snapshot](self, "snapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "moveItemWithIdentifier:afterItemWithIdentifier:", v11, v7);
  -[__UIDiffableDataSource applyDifferencesFromSnapshot:](self, "applyDifferencesFromSnapshot:", v8);

}

- (void)reloadItemsWithIdentifiers:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[__UIDiffableDataSource snapshot](self, "snapshot");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadItemsWithIdentifiers:", v4);

  -[__UIDiffableDataSource applyDifferencesFromSnapshot:](self, "applyDifferencesFromSnapshot:", v5);
}

- (void)reconfigureItemsWithIdentifiers:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[__UIDiffableDataSource snapshot](self, "snapshot");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reconfigureItemsWithIdentifiers:", v4);

  -[__UIDiffableDataSource applyDifferencesFromSnapshot:](self, "applyDifferencesFromSnapshot:", v5);
}

- (void)appendSectionsWithIdentifiers:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[__UIDiffableDataSource snapshot](self, "snapshot");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendSectionsWithIdentifiers:", v4);

  -[__UIDiffableDataSource applyDifferencesFromSnapshot:](self, "applyDifferencesFromSnapshot:", v5);
}

- (void)insertSectionsWithIdentifiers:(id)a3 beforeSectionWithIdentifier:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 461, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIdentifiers"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 462, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toSectionIdentifier"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  -[__UIDiffableDataSource snapshot](self, "snapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insertSectionsWithIdentifiers:beforeSectionWithIdentifier:", v11, v7);
  -[__UIDiffableDataSource applyDifferencesFromSnapshot:](self, "applyDifferencesFromSnapshot:", v8);

}

- (void)insertSectionsWithIdentifiers:(id)a3 afterSectionWithIdentifier:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 470, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIdentifiers"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 471, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toSectionIdentifier"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  -[__UIDiffableDataSource snapshot](self, "snapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insertSectionsWithIdentifiers:afterSectionWithIdentifier:", v11, v7);
  -[__UIDiffableDataSource applyDifferencesFromSnapshot:](self, "applyDifferencesFromSnapshot:", v8);

}

- (void)deleteSectionsWithIdentifiers:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[__UIDiffableDataSource snapshot](self, "snapshot");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteSectionsWithIdentifiers:", v4);

  -[__UIDiffableDataSource applyDifferencesFromSnapshot:](self, "applyDifferencesFromSnapshot:", v5);
}

- (void)moveSectionWithIdentifier:(id)a3 beforeSectionWithIdentifier:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 485, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromSectionIdentifier"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 486, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toSectionIdentifier"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  -[__UIDiffableDataSource snapshot](self, "snapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "moveSectionWithIdentifier:beforeSectionWithIdentifier:", v11, v7);
  -[__UIDiffableDataSource applyDifferencesFromSnapshot:](self, "applyDifferencesFromSnapshot:", v8);

}

- (void)moveSectionWithIdentifier:(id)a3 afterSectionWithIdentifier:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 494, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromSectionIdentifier"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 495, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toSectionIdentifier"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  -[__UIDiffableDataSource snapshot](self, "snapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "moveSectionWithIdentifier:afterSectionWithIdentifier:", v11, v7);
  -[__UIDiffableDataSource applyDifferencesFromSnapshot:](self, "applyDifferencesFromSnapshot:", v8);

}

- (void)reloadSectionsWithIdentifiers:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 503, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIdentifiers"));

  }
  -[__UIDiffableDataSource snapshot](self, "snapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadSectionsWithIdentifiers:", v7);
  -[__UIDiffableDataSource applyDifferencesFromSnapshot:](self, "applyDifferencesFromSnapshot:", v5);

}

- (void)appendSectionWithIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 513, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIdentifier"));

  }
  -[__UIDiffableDataSource snapshot](self, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendSectionsWithIdentifiers:", v7);

  -[__UIDiffableDataSource applyDifferencesFromSnapshot:](self, "applyDifferencesFromSnapshot:", v6);
}

- (void)insertSectionWithIdentifier:(id)a3 beforeSectionWithIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 521, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIdentifier"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 522, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toSectionIdentifier"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  -[__UIDiffableDataSource snapshot](self, "snapshot");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "insertSectionsWithIdentifiers:beforeSectionWithIdentifier:", v11, v9);

  -[__UIDiffableDataSource applyDifferencesFromSnapshot:](self, "applyDifferencesFromSnapshot:", v10);
}

- (void)insertSectionWithIdentifier:(id)a3 afterSectionWithIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 530, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIdentifier"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 531, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toSectionIdentifier"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  -[__UIDiffableDataSource snapshot](self, "snapshot");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "insertSectionsWithIdentifiers:afterSectionWithIdentifier:", v11, v9);

  -[__UIDiffableDataSource applyDifferencesFromSnapshot:](self, "applyDifferencesFromSnapshot:", v10);
}

- (id)emptySnapshot
{
  return objc_alloc_init((Class)off_1E167D310);
}

- (void)_performOnApplyQueue:(unint64_t *)a1
{
  id v3;
  void *v4;
  unint64_t *v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD block[5];
  id v14;

  v3 = a2;
  if (a1)
  {
    v12 = v3;
    if (pthread_main_np() == 1 && objc_msgSend(a1, "outstandingApplyCount") >= 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "viewUpdater");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "targetView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", sel__performOnApplyQueue_, a1, CFSTR("_UIDiffableDataSourceImpl.m"), 575, CFSTR("Deadlock detected: calling this method on the main queue with outstanding async updates is not permitted and will deadlock. Please always submit updates either always on the main queue or always off the main queue - view=%@"), v11);

    }
    objc_msgSend(a1, "applyQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel__performOnApplyQueue_, a1, CFSTR("_UIDiffableDataSourceImpl.m"), 577, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.applyQueue != nil"));

    }
    v5 = a1 + 29;
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
    objc_msgSend(a1, "applyQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47____UIDiffableDataSource__performOnApplyQueue___block_invoke;
    block[3] = &unk_1E16B2F48;
    block[4] = a1;
    v14 = v12;
    dispatch_sync(v7, block);

    v3 = v12;
  }

}

- (void)applyDifferencesFromSnapshot:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55____UIDiffableDataSource_applyDifferencesFromSnapshot___block_invoke;
  v6[3] = &unk_1E16B1B50;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[__UIDiffableDataSource _performOnApplyQueue:]((unint64_t *)self, v6);

}

- (void)applyDifferencesFromSnapshot:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66____UIDiffableDataSource_applyDifferencesFromSnapshot_completion___block_invoke;
  v10[3] = &unk_1E16BAD68;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[__UIDiffableDataSource _performOnApplyQueue:]((unint64_t *)self, v10);

}

- (void)reloadFromSnapshot:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45____UIDiffableDataSource_reloadFromSnapshot___block_invoke;
  v6[3] = &unk_1E16B1B50;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[__UIDiffableDataSource _performOnApplyQueue:]((unint64_t *)self, v6);

}

- (void)_onApplyQueue_reloadFromSnapshot:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void (**v16)(_QWORD);
  NSObject *v17;
  _QWORD aBlock[5];
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (pthread_main_np() == 1)
    v8 = 2;
  else
    v8 = 4;
  -[__UIDiffableDataSource setMutationQueueSource:](self, "setMutationQueueSource:", v8 | -[__UIDiffableDataSource mutationQueueSource](self, "mutationQueueSource"));
  if (-[__UIDiffableDataSource mutationQueueSource](self, "mutationQueueSource") == 6)
  {
    v9 = _onApplyQueue_reloadFromSnapshot_completion____s_category[0];
    if (!_onApplyQueue_reloadFromSnapshot_completion____s_category[0])
    {
      v9 = __UILogCategoryGetNode("UIDiffing", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, _onApplyQueue_reloadFromSnapshot_completion____s_category);
    }
    v10 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = v10;
      -[__UIDiffableDataSource viewUpdater](self, "viewUpdater");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "targetView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v22 = v13;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Warning: applying updates in a non-thread confined manner is dangerous and can lead to deadlocks. Please always submit updates either always on the main queue or always off the main queue - view=%@", buf, 0xCu);

    }
  }
  objc_msgSend(v6, "_prepareForApplyToDataSource");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70____UIDiffableDataSource__onApplyQueue_reloadFromSnapshot_completion___block_invoke;
  aBlock[3] = &unk_1E16BAD68;
  aBlock[4] = self;
  v19 = v6;
  v20 = v7;
  v14 = v7;
  v15 = v6;
  v16 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[__UIDiffableDataSource applyQueue](self, "applyQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v17);

  if (pthread_main_np() == 1)
    v16[2](v16);
  else
    dispatch_sync(MEMORY[0x1E0C80D38], v16);

}

- (void)applyDifferencesFromSnapshot:(id)a3 animatingDifferences:(BOOL)a4
{
  -[__UIDiffableDataSource _applyDifferencesFromSnapshot:animatingDifferences:completion:isOnApplyQueue:](self, "_applyDifferencesFromSnapshot:animatingDifferences:completion:isOnApplyQueue:", a3, a4, 0, 0);
}

- (void)_applyDifferencesFromSnapshot:(id)a3 animatingDifferences:(BOOL)a4 completion:(id)a5 isOnApplyQueue:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  id v13;
  void (**v14)(_QWORD);
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  BOOL v19;

  v6 = a6;
  v10 = a3;
  v11 = a5;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __103____UIDiffableDataSource__applyDifferencesFromSnapshot_animatingDifferences_completion_isOnApplyQueue___block_invoke;
  v16[3] = &unk_1E16B1CF0;
  v16[4] = self;
  v17 = v10;
  v19 = a4;
  v18 = v11;
  v12 = v11;
  v13 = v10;
  v14 = (void (**)(_QWORD))_Block_copy(v16);
  v15 = v14;
  if (v6)
    v14[2](v14);
  else
    -[__UIDiffableDataSource _performOnApplyQueue:]((unint64_t *)self, v14);

}

- (void)_onApplyQueue_applyDifferencesFromSnapshot:(id)a3 animatingDifferences:(BOOL)a4 completion:(id)a5
{
  -[__UIDiffableDataSource _applyDifferencesFromSnapshot:animatingDifferences:completion:isOnApplyQueue:](self, "_applyDifferencesFromSnapshot:animatingDifferences:completion:isOnApplyQueue:", a3, a4, a5, 1);
}

- (void)_onApplyQueue_applyDifferencesFromSnapshot:(id)a3 viewPropertyAnimator:(id)a4 customAnimationsProvider:(id)a5
{
  -[__UIDiffableDataSource _onApplyQueue_applyDifferencesFromSnapshot:viewPropertyAnimator:customAnimationsProvider:animated:completion:](self, "_onApplyQueue_applyDifferencesFromSnapshot:viewPropertyAnimator:customAnimationsProvider:animated:completion:", a3, a4, a5, 1, 0);
}

- (int64_t)tableViewDefaultRowAnimation
{
  void *v2;
  int64_t v3;

  -[__UIDiffableDataSource viewUpdater](self, "viewUpdater");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "tableViewRowAnimation");

  return v3;
}

- (void)_applyDifferencesFromSnapshot:(id)a3 customAnimationsProvider:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81____UIDiffableDataSource__applyDifferencesFromSnapshot_customAnimationsProvider___block_invoke;
  v10[3] = &unk_1E16BAD68;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[__UIDiffableDataSource _performOnApplyQueue:]((unint64_t *)self, v10);

}

- (void)_applyDifferencesFromSnapshot:(id)a3 viewPropertyAnimator:(id)a4 customAnimationsProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __102____UIDiffableDataSource__applyDifferencesFromSnapshot_viewPropertyAnimator_customAnimationsProvider___block_invoke;
  v14[3] = &unk_1E16B4420;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[__UIDiffableDataSource _performOnApplyQueue:]((unint64_t *)self, v14);

}

- (id)snapshotForSection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSDiffableDataSourceSectionSnapshot *v9;
  void *v10;
  void *v11;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  -[__UIDiffableDataSource associatedSectionControllerForSectionIdentifier:](self, "associatedSectionControllerForSectionIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5
    && (objc_msgSend(v5, "_extantMutableSnapshotForSection:", v4),
        (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = v7;
    v9 = (NSDiffableDataSourceSectionSnapshot *)objc_msgSend(v7, "copy");

    os_unfair_recursive_lock_unlock();
    if (v9)
      goto LABEL_13;
  }
  else
  {
    os_unfair_recursive_lock_unlock();
  }
  -[__UIDiffableDataSource snapshot](self, "snapshot");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "indexOfSectionIdentifier:", v4) == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_11:

LABEL_12:
    v9 = objc_alloc_init(NSDiffableDataSourceSectionSnapshot);
    goto LABEL_13;
  }
  objc_msgSend(v10, "itemIdentifiersInSectionWithIdentifier:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "count"))
  {

    goto LABEL_11;
  }
  v9 = objc_alloc_init(NSDiffableDataSourceSectionSnapshot);
  -[NSDiffableDataSourceSectionSnapshot appendItems:](v9, "appendItems:", v11);

  if (!v9)
    goto LABEL_12;
LABEL_13:

  return v9;
}

- (id)_snapshotForSection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSDiffableDataSourceSectionSnapshot *v7;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  -[__UIDiffableDataSource associatedSectionControllerForSectionIdentifier:](self, "associatedSectionControllerForSectionIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    os_unfair_recursive_lock_unlock();
LABEL_5:
    v7 = objc_alloc_init(NSDiffableDataSourceSectionSnapshot);
    goto LABEL_6;
  }
  objc_msgSend(v5, "snapshotForSection:", v4);
  v7 = (NSDiffableDataSourceSectionSnapshot *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_unlock();
  if (!v7)
    goto LABEL_5;
LABEL_6:

  return v7;
}

- (void)_onApplyQueue_applyDifferencesFromSnapshot:(id)a3 viewPropertyAnimator:(id)a4 customAnimationsProvider:(id)a5 animated:(BOOL)a6 completion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  NSObject *v19;
  NSObject *v20;
  const char *v21;
  void *v22;
  void *v23;
  BOOL v24;
  SEL v25;
  BOOL pendingReorderingTransactionShouldPerformViewAnimations;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void (**v34)(void *, id);
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  _QWORD block[4];
  id v50;
  void (**v51)(void *, id);
  _QWORD v52[5];
  id v53;
  id v54;
  id v55;
  SEL v56;
  BOOL v57;
  _QWORD v58[5];
  id v59;
  id v60;
  id v61;
  id v62;
  BOOL v63;
  BOOL v64;
  _QWORD aBlock[5];
  id v66;
  BOOL v67;
  uint8_t buf[4];
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 831, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("snapshot"));

  }
  if (pthread_main_np() == 1)
    v17 = 2;
  else
    v17 = 4;
  -[__UIDiffableDataSource setMutationQueueSource:](self, "setMutationQueueSource:", v17 | -[__UIDiffableDataSource mutationQueueSource](self, "mutationQueueSource"));
  if (-[__UIDiffableDataSource mutationQueueSource](self, "mutationQueueSource") == 6)
  {
    v18 = _onApplyQueue_applyDifferencesFromSnapshot_viewPropertyAnimator_customAnimationsProvider_animated_completion____s_category;
    if (!_onApplyQueue_applyDifferencesFromSnapshot_viewPropertyAnimator_customAnimationsProvider_animated_completion____s_category)
    {
      v18 = __UILogCategoryGetNode("UIDiffing", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v18, (unint64_t *)&_onApplyQueue_applyDifferencesFromSnapshot_viewPropertyAnimator_customAnimationsProvider_animated_completion____s_category);
    }
    v19 = *(NSObject **)(v18 + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = v19;
      -[__UIDiffableDataSource viewUpdater](self, "viewUpdater");
      v21 = a2;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "targetView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v69 = v23;
      _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_ERROR, "Warning: applying updates in a non-thread confined manner is dangerous and can lead to deadlocks. Please always submit updates either always on the main queue or always off the main queue - view=%@", buf, 0xCu);

      a2 = v21;
    }
  }
  if (-[__UIDiffableDataSource isSuppressingViewUpdates](self, "isSuppressingViewUpdates"))
  {
    -[__UIDiffableDataSource _onApplyQueue_reloadFromSnapshot:completion:](self, "_onApplyQueue_reloadFromSnapshot:completion:", v13, v16);
  }
  else
  {
    v45 = v16;
    objc_msgSend(v13, "_prepareForApplyToDataSource");
    v44 = v14;
    v24 = a6;
    v25 = a2;
    if (-[__UIDiffableDataSource _isApplyingReorderingTransaction](self, "_isApplyingReorderingTransaction"))
      pendingReorderingTransactionShouldPerformViewAnimations = self->_pendingReorderingTransactionShouldPerformViewAnimations;
    else
      pendingReorderingTransactionShouldPerformViewAnimations = 1;
    v27 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __135____UIDiffableDataSource__onApplyQueue_applyDifferencesFromSnapshot_viewPropertyAnimator_customAnimationsProvider_animated_completion___block_invoke;
    aBlock[3] = &unk_1E16BADE0;
    aBlock[4] = self;
    v28 = v13;
    v66 = v28;
    v67 = pendingReorderingTransactionShouldPerformViewAnimations;
    v43 = _Block_copy(aBlock);
    v58[0] = v27;
    v58[1] = 3221225472;
    v58[2] = __135____UIDiffableDataSource__onApplyQueue_applyDifferencesFromSnapshot_viewPropertyAnimator_customAnimationsProvider_animated_completion___block_invoke_2;
    v58[3] = &unk_1E16BAE08;
    v63 = pendingReorderingTransactionShouldPerformViewAnimations;
    v58[4] = self;
    v29 = v28;
    v59 = v29;
    v30 = v45;
    v61 = v30;
    v31 = v44;
    v60 = v31;
    v32 = v15;
    v33 = v15;
    v62 = v33;
    v64 = v24;
    v42 = _Block_copy(v58);
    v52[0] = v27;
    v52[1] = 3221225472;
    v52[2] = __135____UIDiffableDataSource__onApplyQueue_applyDifferencesFromSnapshot_viewPropertyAnimator_customAnimationsProvider_animated_completion___block_invoke_5;
    v52[3] = &unk_1E16BAE30;
    v56 = v25;
    v52[4] = self;
    v57 = v24;
    v53 = v31;
    v54 = v33;
    v55 = v30;
    v34 = (void (**)(void *, id))_Block_copy(v52);
    -[__UIDiffableDataSource applyQueue](self, "applyQueue");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v35)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", v25, self, CFSTR("_UIDiffableDataSourceImpl.m"), 923, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.applyQueue != nil"));

    }
    -[__UIDiffableDataSource applyQueue](self, "applyQueue");
    v36 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v36);

    if (-[__UIDiffableDataSource _canApplySnapshotUpdateWithoutDiffing:](self, "_canApplySnapshotUpdateWithoutDiffing:", v29))
    {
      v14 = v44;
      v16 = v45;
      v15 = v32;
      v37 = v43;
      if (pthread_main_np() == 1)
      {
        v34[2](v34, v29);
      }
      else
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __135____UIDiffableDataSource__onApplyQueue_applyDifferencesFromSnapshot_viewPropertyAnimator_customAnimationsProvider_animated_completion___block_invoke_6;
        block[3] = &unk_1E16B2F48;
        v51 = v34;
        v50 = v29;
        dispatch_sync(MEMORY[0x1E0C80D38], block);

      }
      v39 = v42;
    }
    else
    {
      v37 = v43;
      (*((void (**)(void *))v43 + 2))(v43);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v44;
      v16 = v45;
      v15 = v32;
      if (pthread_main_np() == 1)
      {
        v39 = v42;
        (*((void (**)(void *, void *))v42 + 2))(v42, v38);
      }
      else
      {
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __135____UIDiffableDataSource__onApplyQueue_applyDifferencesFromSnapshot_viewPropertyAnimator_customAnimationsProvider_animated_completion___block_invoke_7;
        v46[3] = &unk_1E16B2F48;
        v39 = v42;
        v48 = v42;
        v47 = v38;
        dispatch_sync(MEMORY[0x1E0C80D38], v46);

      }
    }

  }
}

- (void)_performReloadOrReconfigureUpdateWithItems:(id)a3 dataSourceSnapshot:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  -[__UIDiffableDataSource viewUpdater](self, "viewUpdater");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v13) = a5;
  objc_msgSend(v14, "_performUpdateWithCollectionViewUpdateItems:dataSourceSnapshot:updateHandler:completion:viewPropertyAnimator:customAnimationsProvider:animated:", v12, v11, &__block_literal_global_58_0, v10, 0, 0, v13);

}

- (void)_commitUpdate:(id)a3 snapshot:(id)a4 animated:(BOOL)a5 animator:(id)a6 customAnimationsProvider:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  void *v42;
  _QWORD aBlock[5];
  id v44;

  v14 = a3;
  v15 = a4;
  v40 = a8;
  v39 = a7;
  v16 = a6;
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 963, CFSTR("Error: Updates can only be committed on the main thread."));

  }
  v17 = objc_msgSend(v14, "action");
  v42 = v14;
  if (v17 != 2)
  {
    v23 = v17;
    -[_UIDiffableDataSourceState identifiers](self->_state, "identifiers");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "mutableCopy");

    -[_UIDiffableDataSourceState sections](self->_state, "sections");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "mutableCopy");

    -[_UIDiffableDataSourceState dataSourceSnapshot](self->_state, "dataSourceSnapshot");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E167C258, "snapshotterForSnapshot:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23 == 3)
    {
      _UIDiffableDataSourceApplyMoveUpdate();
      v30 = objc_claimAutoreleasedReturnValue();
    }
    else if (v23 == 1)
    {
      _UIDiffableDataSourceApplyDeleteUpdate();
      v30 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v23)
      {
        v21 = (id)MEMORY[0x1E0C9AA60];
        goto LABEL_15;
      }
      _UIDiffableDataSourceApplyInsertUpdate();
      v30 = objc_claimAutoreleasedReturnValue();
    }
    v21 = (id)v30;
LABEL_15:
    v31 = objc_alloc((Class)off_1E167C2F0);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v31, "initWithGenerationID:identifiers:sections:dataSourceSnapshot:", v32, v25, v27, v29);

    goto LABEL_16;
  }
  -[__UIDiffableDataSource _validReloadOrReconfigureViewUpdatesInSnapshot:](self, "_validReloadOrReconfigureViewUpdatesInSnapshot:", v15);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  v20 = (void *)MEMORY[0x1E0C9AA60];
  if (v18)
    v20 = (void *)v18;
  v21 = v20;

  v22 = (void *)objc_msgSend(objc_alloc((Class)off_1E167C2F0), "initWithStateAdvancingGenerationID:", self->_state);
LABEL_16:
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __103____UIDiffableDataSource__commitUpdate_snapshot_animated_animator_customAnimationsProvider_completion___block_invoke;
  aBlock[3] = &unk_1E16B1B50;
  aBlock[4] = self;
  v44 = v22;
  v33 = v22;
  v34 = _Block_copy(aBlock);
  -[__UIDiffableDataSource _computeCurrentTransactionForFinalSnapshot:withDataSourceDiffer:](self, "_computeCurrentTransactionForFinalSnapshot:withDataSourceDiffer:", v15, 0);
  -[__UIDiffableDataSource _notifyWillApplyForCurrentTransactionIfNeeded](self, "_notifyWillApplyForCurrentTransactionIfNeeded");
  -[__UIDiffableDataSource viewUpdater](self, "viewUpdater");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDiffableDataSourceState dataSourceSnapshot](self->_state, "dataSourceSnapshot");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v38) = a5;
  objc_msgSend(v35, "_performUpdateWithCollectionViewUpdateItems:dataSourceSnapshot:updateHandler:completion:viewPropertyAnimator:customAnimationsProvider:animated:", v21, v36, v34, v40, v16, v39, v38);

  -[__UIDiffableDataSource _notifyDidApplyForCurrentTransactionIfNeeded](self, "_notifyDidApplyForCurrentTransactionIfNeeded");
  -[__UIDiffableDataSource _resetCurrentTransaction](self, "_resetCurrentTransaction");

}

- (id)_validReloadOrReconfigureViewUpdatesInSnapshot:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t i;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  UICollectionViewUpdateItem *v24;
  UICollectionViewUpdateItem *v25;
  id v26;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id obj;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "pendingSnapshotUpdates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v3;
  objc_msgSend(v3, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v38;
    v29 = *(_QWORD *)v38;
    while (1)
    {
      v10 = 0;
      v30 = v7;
      do
      {
        if (*(_QWORD *)v38 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v10);
        if (objc_msgSend(v11, "action") == 2)
        {
          v32 = v10;
          v12 = objc_msgSend(v11, "isSectionOperation");
          v13 = objc_msgSend(v11, "shouldReconfigure");
          objc_msgSend(v11, "identifiers");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          if (!v15)
            goto LABEL_27;
          v16 = v15;
          v17 = *(_QWORD *)v34;
          if (v13)
            v18 = 2;
          else
            v18 = 0;
          while (1)
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v34 != v17)
                objc_enumerationMutation(v14);
              v20 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
              if (v12)
              {
                v21 = objc_msgSend(v5, "indexOfSectionIdentifier:", v20);
                if (v21 == 0x7FFFFFFFFFFFFFFFLL)
                  continue;
                objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0x7FFFFFFFFFFFFFFFLL, v21);
                v22 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                objc_msgSend(v5, "indexPathForItemIdentifier:", v20);
                v22 = objc_claimAutoreleasedReturnValue();
              }
              v23 = (void *)v22;
              if (v22)
              {
                v24 = -[UICollectionViewUpdateItem initWithInitialIndexPath:finalIndexPath:updateAction:]([UICollectionViewUpdateItem alloc], "initWithInitialIndexPath:finalIndexPath:updateAction:", v22, 0, 2);
                v25 = v24;
                if (v24)
                  *(_BYTE *)&v24->_updateItemFlags = *(_BYTE *)&v24->_updateItemFlags & 0xFD | v18;
                if (v8)
                {
                  objc_msgSend(v8, "addObject:", v24);
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v24);
                  v8 = (void *)objc_claimAutoreleasedReturnValue();
                }

              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
            if (!v16)
            {
LABEL_27:

              v9 = v29;
              v7 = v30;
              v10 = v32;
              break;
            }
          }
        }
        ++v10;
      }
      while (v10 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      if (!v7)
        goto LABEL_32;
    }
  }
  v8 = 0;
LABEL_32:

  v26 = v8;
  return v26;
}

- (void)_registerItemRenderers:(id)a3 rendererIdentifierProvider:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id rendererIdentifierProvider;
  NSMapTable *v11;
  NSMapTable *rendererMap;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  id WeakRetained;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id collectionViewCellProvider;
  void *v27;
  _QWORD aBlock[4];
  id v29;
  id location;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!self->_rendererIdentifierProvider)
  {
    v9 = (void *)objc_msgSend(v7, "copy");
    rendererIdentifierProvider = self->_rendererIdentifierProvider;
    self->_rendererIdentifierProvider = v9;

  }
  v27 = v8;
  if (!self->_rendererMap)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v11 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    rendererMap = self->_rendererMap;
    self->_rendererMap = v11;

  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v13 = v6;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v32 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v18, "rendererIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v19)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceImpl.m"), 1156, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rendererIdentifier"));

        }
        -[NSMapTable setObject:forKey:](self->_rendererMap, "setObject:forKey:", v18, v19);
        WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
        v21 = objc_msgSend(v18, "cellClass");
        objc_msgSend(v18, "cellReuseIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "registerClass:forCellWithReuseIdentifier:", v21, v22);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v15);
  }

  if (!self->_collectionViewCellProvider)
  {
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __76____UIDiffableDataSource__registerItemRenderers_rendererIdentifierProvider___block_invoke;
    aBlock[3] = &unk_1E16BAE80;
    objc_copyWeak(&v29, &location);
    v24 = _Block_copy(aBlock);
    collectionViewCellProvider = self->_collectionViewCellProvider;
    self->_collectionViewCellProvider = v24;

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

}

- (BOOL)canMoveItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t (**v8)(_QWORD, _QWORD);
  uint64_t (**v9)(_QWORD, _QWORD);
  char v10;
  void *v11;

  v4 = a3;
  -[__UIDiffableDataSource reorderingHandlers](self, "reorderingHandlers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "canReorderItemHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[__UIDiffableDataSource canReorderItemHandler](self, "canReorderItemHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v10 = 0;
      goto LABEL_10;
    }
    -[__UIDiffableDataSource itemIdentifierForIndexPath:](self, "itemIdentifierForIndexPath:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[__UIDiffableDataSource canReorderItemHandler](self, "canReorderItemHandler");
      v8 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v10 = ((uint64_t (**)(_QWORD, void *))v8)[2](v8, v7);
      goto LABEL_7;
    }
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  -[__UIDiffableDataSource itemIdentifierForIndexPath:](self, "itemIdentifierForIndexPath:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_8;
  -[__UIDiffableDataSource reorderingHandlers](self, "reorderingHandlers");
  v8 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "canReorderItemHandler");
  v9 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v10 = ((uint64_t (**)(_QWORD, void *))v9)[2](v9, v7);

LABEL_7:
LABEL_9:

LABEL_10:
  return v10;
}

- (void)_willBeginReorderingForItemAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[__UIDiffableDataSource itemIdentifierForIndexPath:](self, "itemIdentifierForIndexPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[__UIDiffableDataSource sectionIdentifierForSectionContainingItemIdentifier:](self, "sectionIdentifierForSectionContainingItemIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[__UIDiffableDataSource associatedSectionControllerForSectionIdentifier:](self, "associatedSectionControllerForSectionIdentifier:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        objc_msgSend(v6, "_extantMutableSnapshotForSection:", v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8 && objc_msgSend(v8, "isExpanded:", v4))
        {
          objc_msgSend(v7, "_extantMutableSnapshotForSection:", v5);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)objc_msgSend(v10, "copy");

          if (v11)
          {
            v13[0] = v4;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "collapseItems:", v12);

            -[__UIDiffableDataSource applySnapshot:toSection:animatingDifferences:completion:](self, "applySnapshot:toSection:animatingDifferences:completion:", v11, v5, 1, 0);
          }

        }
      }

    }
  }

}

- (void)_commitReorderingForItemAtIndexPath:(id)a3 toDestinationIndexPath:(id)a4
{
  -[__UIDiffableDataSource _commitReorderingForItemAtIndexPath:toDestinationIndexPath:shouldPerformViewAnimations:](self, "_commitReorderingForItemAtIndexPath:toDestinationIndexPath:shouldPerformViewAnimations:", a3, a4, 0);
}

- (void)_commitReorderingForItemAtIndexPath:(id)a3 toDestinationIndexPath:(id)a4 shouldPerformViewAnimations:(BOOL)a5
{
  id v8;
  id v9;
  NSDiffableDataSourceTransaction *v10;
  NSDiffableDataSourceTransaction *pendingReorderingTransaction;
  void *v12;
  void *v13;
  UICollectionViewUpdateItem *v14;

  v8 = a4;
  v9 = a3;
  v14 = -[UICollectionViewUpdateItem initWithInitialIndexPath:finalIndexPath:updateAction:]([UICollectionViewUpdateItem alloc], "initWithInitialIndexPath:finalIndexPath:updateAction:", v9, v8, 3);

  -[__UIDiffableDataSource _reorderingTransactionForReorderingUpdate:](self, "_reorderingTransactionForReorderingUpdate:", v14);
  v10 = (NSDiffableDataSourceTransaction *)objc_claimAutoreleasedReturnValue();
  pendingReorderingTransaction = self->_pendingReorderingTransaction;
  self->_pendingReorderingTransaction = v10;

  -[NSDiffableDataSourceTransaction finalSnapshot](self->_pendingReorderingTransaction, "finalSnapshot");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  self->_pendingReorderingTransactionShouldPerformViewAnimations = a5;
  objc_msgSend(v12, "impl");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[__UIDiffableDataSource applyDifferencesFromSnapshot:animatingDifferences:](self, "applyDifferencesFromSnapshot:animatingDifferences:", v13, 1);

}

- (id)_reorderingTransactionForReorderingUpdate:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD aBlock[5];
  id v12;
  SEL v13;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)off_1E1679A30), "initWithState:", self->_state);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68____UIDiffableDataSource__reorderingTransactionForReorderingUpdate___block_invoke;
  aBlock[3] = &unk_1E16BAEA8;
  v12 = v6;
  v13 = a2;
  aBlock[4] = self;
  v7 = v6;
  v8 = _Block_copy(aBlock);
  +[NSDiffableDataSourceTransaction _computeReorderingTransactionWithInitialSnapshot:reorderingUpdate:sectionSnapshotProvider:](NSDiffableDataSourceTransaction, "_computeReorderingTransactionWithInitialSnapshot:reorderingUpdate:sectionSnapshotProvider:", v7, v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSArray)sectionControllers
{
  NSHashTable *sectionControllers;
  void *v3;

  sectionControllers = self->_sectionControllers;
  if (sectionControllers)
  {
    -[NSHashTable allObjects](sectionControllers, "allObjects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v3;
}

- (BOOL)sectionController:(id)a3 shouldExpandItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t (**v9)(_QWORD, _QWORD);
  char v10;

  v5 = a4;
  -[__UIDiffableDataSource sectionSnapshotHandlers](self, "sectionSnapshotHandlers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "shouldExpandItemHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[__UIDiffableDataSource sectionSnapshotHandlers](self, "sectionSnapshotHandlers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shouldExpandItemHandler");
    v9 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v10 = ((uint64_t (**)(_QWORD, id))v9)[2](v9, v5);

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (void)sectionController:(id)a3 willExpandItem:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  id v9;

  v9 = a4;
  -[__UIDiffableDataSource sectionSnapshotHandlers](self, "sectionSnapshotHandlers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "willExpandItemHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[__UIDiffableDataSource sectionSnapshotHandlers](self, "sectionSnapshotHandlers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "willExpandItemHandler");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v8)[2](v8, v9);

  }
}

- (BOOL)sectionController:(id)a3 shouldCollapseItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t (**v9)(_QWORD, _QWORD);
  char v10;

  v5 = a4;
  -[__UIDiffableDataSource sectionSnapshotHandlers](self, "sectionSnapshotHandlers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "shouldCollapseItemHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[__UIDiffableDataSource sectionSnapshotHandlers](self, "sectionSnapshotHandlers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shouldCollapseItemHandler");
    v9 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v10 = ((uint64_t (**)(_QWORD, id))v9)[2](v9, v5);

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (void)sectionController:(id)a3 willCollapseItem:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  id v9;

  v9 = a4;
  -[__UIDiffableDataSource sectionSnapshotHandlers](self, "sectionSnapshotHandlers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "willCollapseItemHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[__UIDiffableDataSource sectionSnapshotHandlers](self, "sectionSnapshotHandlers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "willCollapseItemHandler");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v8)[2](v8, v9);

  }
}

- (BOOL)sectionController:(id)a3 shouldQueryForSnapshotForExpandingParentItem:(id)a4
{
  void *v4;
  void *v5;
  BOOL v6;

  -[__UIDiffableDataSource sectionSnapshotHandlers](self, "sectionSnapshotHandlers", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "snapshotForExpandingParentItemHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (id)sectionController:(id)a3 snapshotForExpandingParentItem:(id)a4 currentSectionSnapshot:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);

  v7 = a4;
  v8 = a5;
  -[__UIDiffableDataSource sectionSnapshotHandlers](self, "sectionSnapshotHandlers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "snapshotForExpandingParentItemHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v8;
  if (v10)
  {
    -[__UIDiffableDataSource sectionSnapshotHandlers](self, "sectionSnapshotHandlers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "snapshotForExpandingParentItemHandler");
    v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v13)[2](v13, v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (void)setTableViewCellProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (_UICollectionViewUpdateExpandCollapseAnimationContext)expandCollapseAnimationContext
{
  return self->_expandCollapseAnimationContext;
}

- (void)setExpandCollapseAnimationContext:(id)a3
{
  objc_storeStrong((id *)&self->_expandCollapseAnimationContext, a3);
}

- (_UICollectionViewUpdateItemApplying)viewUpdatesSink
{
  return (_UICollectionViewUpdateItemApplying *)objc_loadWeakRetained((id *)&self->_viewUpdatesSink);
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (id)supplementaryReuseIdentifierProvider
{
  return self->_supplementaryReuseIdentifierProvider;
}

- (void)setSupplementaryReuseIdentifierProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (id)supplementaryViewConfigurationHandler
{
  return self->_supplementaryViewConfigurationHandler;
}

- (void)setSupplementaryViewConfigurationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (id)cellObserver
{
  return self->_cellObserver;
}

- (void)setWillApplySnapshotHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (id)tableViewCellConfigurationHandler
{
  return self->_tableViewCellConfigurationHandler;
}

- (void)setTableViewCellConfigurationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (id)reuseIdentifierProvider
{
  return self->_reuseIdentifierProvider;
}

- (void)setReuseIdentifierProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (id)collectionViewCellConfigurationHandler
{
  return self->_collectionViewCellConfigurationHandler;
}

- (void)setCollectionViewCellConfigurationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (void)setViewUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_viewUpdater, a3);
}

- (NSMutableArray)completionHandlersForBatchApply
{
  return self->_completionHandlersForBatchApply;
}

- (void)setCompletionHandlersForBatchApply:(id)a3
{
  objc_storeStrong((id *)&self->_completionHandlersForBatchApply, a3);
}

- (void)validateIdentifiers
{
  void *v2;
  void *v3;
  id v4;

  -[__UIDiffableDataSource state](self, "state");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "validateIdentifiers");
  }
  else
  {
    objc_msgSend(v4, "sections");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    _UIDiffableDataSourceValidateIdentifiers();

    objc_msgSend(v4, "identifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _UIDiffableDataSourceValidateIdentifiers();

  }
}

@end
