@implementation PXSelectionCoordinator

- (PXSelectionCoordinator)init
{
  return -[PXSelectionCoordinator initWithSelectedOIDs:](self, "initWithSelectedOIDs:", 0);
}

- (PXSelectionCoordinator)initWithSelectedOIDs:(id)a3
{
  id v4;
  PXSelectionCoordinator *v5;
  uint64_t v6;
  NSMutableOrderedSet *mutableSelectedObjectIDs;
  uint64_t v8;
  NSMapTable *stateByManager;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXSelectionCoordinator;
  v5 = -[PXSelectionCoordinator init](&v11, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = objc_msgSend(v4, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    mutableSelectedObjectIDs = v5->_mutableSelectedObjectIDs;
    v5->_mutableSelectedObjectIDs = (NSMutableOrderedSet *)v6;

    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    stateByManager = v5->_stateByManager;
    v5->_stateByManager = (NSMapTable *)v8;

  }
  return v5;
}

- (void)setSelectionCountLimit:(id)a3
{
  NSNumber *v6;
  void *v7;
  NSNumber *v8;
  char v9;
  void *v10;
  void *v11;
  NSNumber *v12;

  v12 = (NSNumber *)a3;
  v6 = self->_selectionCountLimit;
  v7 = v12;
  if (v6 == v12)
  {
LABEL_7:

    goto LABEL_8;
  }
  v8 = v6;
  v9 = -[NSNumber isEqual:](v6, "isEqual:", v12);

  if ((v9 & 1) == 0)
  {
    if (v12 && -[NSNumber integerValue](v12, "integerValue") < 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSelectionCoordinator.m"), 65, CFSTR("Negative count limits are invalid"));

    }
    objc_storeStrong((id *)&self->_selectionCountLimit, a3);
    objc_msgSend(MEMORY[0x24BDBCF00], "orderedSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF00], "orderedSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSelectionCoordinator _modifySelectionWithRemovedOIDs:insertedOIDs:originatingSelectionManager:](self, "_modifySelectionWithRemovedOIDs:insertedOIDs:originatingSelectionManager:", v7, v10, 0);

    goto LABEL_7;
  }
LABEL_8:

}

- (NSOrderedSet)selectedObjectIDs
{
  void *v2;
  void *v3;

  -[PXSelectionCoordinator mutableSelectedObjectIDs](self, "mutableSelectedObjectIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSOrderedSet *)v3;
}

- (void)_updateSelectionLimitReached
{
  void *v3;
  uint64_t v4;
  _BOOL8 v5;
  id v6;

  -[PXSelectionCoordinator selectionCountLimit](self, "selectionCountLimit");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSelectionCoordinator selectedObjectIDs](self, "selectedObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v6)
    v5 = v4 >= objc_msgSend(v6, "integerValue");
  else
    v5 = 0;
  -[PXSelectionCoordinator setSelectionLimitReached:](self, "setSelectionLimitReached:", v5);

}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateRespondsTo.willUpdateSelectedObjects = objc_opt_respondsToSelector() & 1;
    self->_delegateRespondsTo.didUpdateSelectedObjects = objc_opt_respondsToSelector() & 1;
    self->_delegateRespondsTo.rejectedCountLimitViolation = objc_opt_respondsToSelector() & 1;
    self->_delegateRespondsTo.selectionLimitStatusChanged = objc_opt_respondsToSelector() & 1;
  }

}

- (void)_startMutatingSelectionManager:(id)a3
{
  PXSectionedSelectionManager *v5;
  PXSectionedSelectionManager *currentlyMutatingSelectionManager;
  void *v7;

  v5 = (PXSectionedSelectionManager *)a3;
  currentlyMutatingSelectionManager = self->_currentlyMutatingSelectionManager;
  if (currentlyMutatingSelectionManager)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSelectionCoordinator.m"), 94, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_currentlyMutatingSelectionManager == nil"));

    currentlyMutatingSelectionManager = self->_currentlyMutatingSelectionManager;
  }
  self->_currentlyMutatingSelectionManager = v5;

  self->_currentlyMutatingObservationCount = 0;
}

- (void)_stopMutatingSelectionManager:(id)a3
{
  PXSectionedSelectionManager *currentlyMutatingSelectionManager;
  void *v6;
  PXSectionedSelectionManager *v7;

  currentlyMutatingSelectionManager = (PXSectionedSelectionManager *)a3;
  v7 = currentlyMutatingSelectionManager;
  if (self->_currentlyMutatingSelectionManager != currentlyMutatingSelectionManager)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSelectionCoordinator.m"), 100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_currentlyMutatingSelectionManager == selectionManager"), v7);

    currentlyMutatingSelectionManager = self->_currentlyMutatingSelectionManager;
  }
  self->_currentlyMutatingSelectionManager = 0;

}

- (id)checkOutSelectionManagerForDataSourceManager:(id)a3
{
  id v4;
  PXSectionedSelectionManager *v5;
  _PXSelectionCoordinatorState *v6;
  void *v7;
  _PXSelectionCoordinatorState *v8;
  void *v9;

  v4 = a3;
  v5 = -[PXSectionedSelectionManager initWithDataSourceManager:]([PXSectionedSelectionManager alloc], "initWithDataSourceManager:", v4);

  -[PXSectionedSelectionManager setSnapshotValidator:](v5, "setSnapshotValidator:", self);
  v6 = [_PXSelectionCoordinatorState alloc];
  -[PXSectionedSelectionManager selectionSnapshot](v5, "selectionSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_PXSelectionCoordinatorState initWithSelectionSnapshot:](v6, "initWithSelectionSnapshot:", v7);

  -[PXSelectionCoordinator stateByManager](self, "stateByManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v8, v5);

  -[PXObservable registerChangeObserver:context:](v5, "registerChangeObserver:context:", self, CoordinatedSelectionManagerContext);
  -[PXSelectionCoordinator _updateSelectionManagerToGlobalState:managerState:](self, "_updateSelectionManagerToGlobalState:managerState:", v5, v8);

  return v5;
}

- (void)checkInSelectionManager:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXSelectionCoordinator stateByManager](self, "stateByManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

- (BOOL)modifySelectionWithRemovedOIDs:(id)a3 insertedOIDs:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  _BOOL4 v19;
  BOOL v20;
  void *v22;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7 || !v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSelectionCoordinator.m"), 121, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("removedOIDs && insertedOIDs"));

  }
  -[PXSelectionCoordinator mutableSelectedObjectIDs](self, "mutableSelectedObjectIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  v12 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v12, "intersectOrderedSet:", v11);
  objc_msgSend(v11, "minusOrderedSet:", v12);
  v13 = (void *)objc_msgSend(v9, "mutableCopy");
  objc_msgSend(v13, "minusOrderedSet:", v11);
  objc_msgSend(v11, "unionOrderedSet:", v13);
  -[PXSelectionCoordinator selectionCountLimit](self, "selectionCountLimit");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14 && (v16 = objc_msgSend(v14, "integerValue"), v16 < objc_msgSend(v11, "count")))
  {
    v17 = objc_msgSend(v11, "count");
    -[PXSelectionCoordinator mutableSelectedObjectIDs](self, "mutableSelectedObjectIDs");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v17 <= objc_msgSend(v18, "count");

  }
  else
  {
    v19 = 1;
  }
  if (objc_msgSend(v12, "count"))
  {
    v20 = 0;
    if (!v19)
      goto LABEL_13;
  }
  else
  {
    v20 = objc_msgSend(v13, "count") == 0;
    if (!v19)
      goto LABEL_13;
  }
  if (!v20)
    -[PXSelectionCoordinator _modifySelectionWithRemovedOIDs:insertedOIDs:originatingSelectionManager:](self, "_modifySelectionWithRemovedOIDs:insertedOIDs:originatingSelectionManager:", v12, v9, 0);
LABEL_13:

  return v19 || v20;
}

- (void)modifySelectionWithOrder:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PXSelectionCoordinator selectedObjectIDs](self, "selectedObjectIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10 || (v6 = objc_msgSend(v10, "count"), v7 = objc_msgSend(v5, "count"), v8 = v10, v6 != v7))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSelectionCoordinator.m"), 148, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updatedSelectionOrder && updatedSelectionOrder.count == currentSelectionOrder.count"));

    v8 = v10;
  }
  -[PXSelectionCoordinator _modifySelectionWithRemovedOIDs:insertedOIDs:originatingSelectionManager:](self, "_modifySelectionWithRemovedOIDs:insertedOIDs:originatingSelectionManager:", v5, v8, 0);

}

- (void)_updateSelectionManagerToGlobalState:(id)a3 managerState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;
  PXSelectionCoordinator *v22;
  char v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "dataSourceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXSelectionCoordinator mutableSelectedObjectIDs](self, "mutableSelectedObjectIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "indexPathSetForObjectIDs:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v10) = -[PXSelectionCoordinator selectionLimitReached](self, "selectionLimitReached");
  -[PXSelectionCoordinator _startMutatingSelectionManager:](self, "_startMutatingSelectionManager:", v6);
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __76__PXSelectionCoordinator__updateSelectionManagerToGlobalState_managerState___block_invoke;
  v19 = &unk_2514CFEA0;
  v23 = (char)v10;
  v20 = v12;
  v21 = v6;
  v22 = self;
  v13 = v6;
  v14 = v12;
  objc_msgSend(v13, "performChanges:", &v16);
  objc_msgSend(v13, "selectionSnapshot", v16, v17, v18, v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSelectionSnapshot:", v15);

  -[PXSelectionCoordinator _stopMutatingSelectionManager:](self, "_stopMutatingSelectionManager:", v13);
}

- (void)_handleDataSourceChangeToSelectionManager:(id)a3 state:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  NSObject *v18;
  PXSelectionCoordinator *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[6];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint8_t buf[4];
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v19 = self;
  v37 = *MEMORY[0x24BDAC8D0];
  v24 = a3;
  v20 = a4;
  objc_msgSend(v20, "selectionSnapshot");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "selectionSnapshot");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "dataSourceManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "allChangeDetailsFromDataSource:toDataSource:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v12, "sectionChanges", v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v13, "hasIncrementalChanges") & 1) == 0)
        {

LABEL_13:
          *((_BYTE *)v31 + 24) = 1;
          goto LABEL_14;
        }
        objc_msgSend(v12, "sectionChanges");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "insertedIndexes");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count") == 0;

        if (!v16)
          goto LABEL_13;
        objc_msgSend(v12, "sectionsWithItemChanges");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = MEMORY[0x24BDAC760];
        v25[1] = 3221225472;
        v25[2] = __74__PXSelectionCoordinator__handleDataSourceChangeToSelectionManager_state___block_invoke;
        v25[3] = &unk_2514D0F28;
        v25[4] = v12;
        v25[5] = &v30;
        objc_msgSend(v17, "enumerateIndexesUsingBlock:", v25);

        if (*((_BYTE *)v31 + 24))
          goto LABEL_14;
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_14:

  if (*((_BYTE *)v31 + 24))
  {
    if (PXSelectionCoordinatorGetLog_predicate != -1)
      dispatch_once(&PXSelectionCoordinatorGetLog_predicate, &__block_literal_global_3970);
    v18 = (id)PXSelectionCoordinatorGetLog_log;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v22;
      _os_log_impl(&dword_24430E000, v18, OS_LOG_TYPE_DEFAULT, "Reloading selection state for data source manager %@", buf, 0xCu);
    }

    -[PXSelectionCoordinator _updateSelectionManagerToGlobalState:managerState:](v19, "_updateSelectionManagerToGlobalState:managerState:", v24, v20);
  }
  else
  {
    objc_msgSend(v20, "setSelectionSnapshot:", v23);
  }
  _Block_object_dispose(&v30, 8);

}

- (void)_handleSelectionChangeToSelectionManager:(id)a3 state:(id)a4
{
  id v6;
  void *v7;
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
  id v20;

  v20 = a3;
  v6 = a4;
  objc_msgSend(v6, "selectionSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "selectionSnapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedIndexPaths");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v8, "selectedIndexPaths");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusIndexPathSet:", v11);

  objc_msgSend(v8, "selectedIndexPaths");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  objc_msgSend(v7, "selectedIndexPaths");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "minusIndexPathSet:", v14);

  if (self->_delegateRespondsTo.willUpdateSelectedObjects)
  {
    -[PXSelectionCoordinator delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "selectionCoordinator:willUpdateSelectedObjectsForSnapshot:withRemovedIndexes:insertedIndexes:", self, v8, v10, v13);

  }
  objc_msgSend(v7, "dataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectIDsForIndexPathSet:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "dataSource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectIDsForIndexPathSet:", v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setSelectionSnapshot:", v8);
  -[PXSelectionCoordinator _modifySelectionWithRemovedOIDs:insertedOIDs:originatingSelectionManager:](self, "_modifySelectionWithRemovedOIDs:insertedOIDs:originatingSelectionManager:", v17, v19, v20);

}

- (void)_modifySelectionWithRemovedOIDs:(id)a3 insertedOIDs:(id)a4 originatingSelectionManager:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v20, "count"))
  {
    -[PXSelectionCoordinator mutableSelectedObjectIDs](self, "mutableSelectedObjectIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "intersectsOrderedSet:", v20);

  }
  else
  {
    v11 = 0;
  }
  if (objc_msgSend(v8, "count"))
  {
    -[PXSelectionCoordinator mutableSelectedObjectIDs](self, "mutableSelectedObjectIDs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v8, "isSubsetOfOrderedSet:", v12) ^ 1;

  }
  else
  {
    v13 = 0;
  }
  -[PXSelectionCoordinator mutableSelectedObjectIDs](self, "mutableSelectedObjectIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "minusOrderedSet:", v20);

  -[PXSelectionCoordinator mutableSelectedObjectIDs](self, "mutableSelectedObjectIDs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "unionOrderedSet:", v8);

  v16 = -[PXSelectionCoordinator selectionLimitReached](self, "selectionLimitReached");
  -[PXSelectionCoordinator _updateSelectionLimitReached](self, "_updateSelectionLimitReached");
  v17 = -[PXSelectionCoordinator selectionLimitReached](self, "selectionLimitReached");
  -[PXSelectionCoordinator _performChangesToCoordinatedSelectionManagersWithRemovedOIDs:insertedOIDs:originatingSelectionManager:](self, "_performChangesToCoordinatedSelectionManagersWithRemovedOIDs:insertedOIDs:originatingSelectionManager:", v20, v8, v9);

  if ((v11 | v13) == 1 && self->_delegateRespondsTo.didUpdateSelectedObjects)
  {
    -[PXSelectionCoordinator delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "selectionCoordinator:didUpdateSelectedObjectsWithRemovedOIDs:insertedOIDs:", self, v20, v8);

  }
  if (v16 != v17 && self->_delegateRespondsTo.selectionLimitStatusChanged)
  {
    -[PXSelectionCoordinator delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "selectionLimitStatusChangedForSelectionCoordinator:", self);

  }
}

- (void)_performChangesToCoordinatedSelectionManagersWithRemovedOIDs:(id)a3 insertedOIDs:(id)a4 originatingSelectionManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  uint64_t i;
  id v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  int v27;
  id obj;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  _BOOL4 v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  PXSelectionCoordinator *v37;
  char v38;
  BOOL v39;
  _QWORD v40[6];
  char v41;
  BOOL v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v29 = v8;
  if (objc_msgSend(v8, "count"))
    v11 = 1;
  else
    v11 = objc_msgSend(v9, "count") != 0;
  v32 = v11;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[PXSelectionCoordinator stateByManager](self, "stateByManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "keyEnumerator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v13;
  v31 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v31)
  {
    v30 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v44 != v30)
          objc_enumerationMutation(obj);
        v15 = *(id *)(*((_QWORD *)&v43 + 1) + 8 * i);
        v16 = -[PXSelectionCoordinator selectionLimitReached](self, "selectionLimitReached");
        if (v15 == v10)
        {
          objc_msgSend(v10, "selectionSnapshot");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "isSelectionLimitReached");

          if (v16 != v27 || v32)
          {
            -[PXSelectionCoordinator _startMutatingSelectionManager:](self, "_startMutatingSelectionManager:", v10);
            v40[0] = MEMORY[0x24BDAC760];
            v40[1] = 3221225472;
            v40[2] = __128__PXSelectionCoordinator__performChangesToCoordinatedSelectionManagersWithRemovedOIDs_insertedOIDs_originatingSelectionManager___block_invoke;
            v40[3] = &unk_2514CFEC8;
            v41 = v16;
            v42 = v32;
            v40[4] = v10;
            v40[5] = self;
            objc_msgSend(v10, "performChanges:", v40);
            -[PXSelectionCoordinator _stopMutatingSelectionManager:](self, "_stopMutatingSelectionManager:", v10);
          }
        }
        else
        {
          objc_msgSend(v15, "selectionSnapshot");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "dataSource");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v29, "set");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "indexPathSetForObjectIDs:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "set");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "indexPathSetForObjectIDs:", v21);
          v22 = v9;
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          -[PXSelectionCoordinator _startMutatingSelectionManager:](self, "_startMutatingSelectionManager:", v15);
          v33[0] = MEMORY[0x24BDAC760];
          v33[1] = 3221225472;
          v33[2] = __128__PXSelectionCoordinator__performChangesToCoordinatedSelectionManagersWithRemovedOIDs_insertedOIDs_originatingSelectionManager___block_invoke_2;
          v33[3] = &unk_2514CFEF0;
          v34 = v20;
          v35 = v23;
          v38 = v16;
          v39 = v32;
          v36 = v15;
          v37 = self;
          v24 = v23;
          v25 = v20;
          objc_msgSend(v15, "performChanges:", v33);
          -[PXSelectionCoordinator _stopMutatingSelectionManager:](self, "_stopMutatingSelectionManager:", v15);

          v9 = v22;
        }
      }
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v31);
  }

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  void *v11;
  PXSectionedSelectionManager *v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  PXSectionedSelectionManager *v17;

  v6 = a4;
  v9 = a3;
  if ((void *)CoordinatedSelectionManagerContext != a5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSelectionCoordinator.m"), 331, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v17 = (PXSectionedSelectionManager *)v9;
  -[PXSelectionCoordinator stateByManager](self, "stateByManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = v17;
    if (self->_currentlyMutatingSelectionManager == v17)
    {
      if (self->_currentlyMutatingObservationCount)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSelectionCoordinator.m"), 315, CFSTR("A coordinated selection manager was changed while the coordinator was updating it"));

        v12 = v17;
        v13 = self->_currentlyMutatingObservationCount + 1;
      }
      else
      {
        v13 = 1;
      }
      self->_currentlyMutatingObservationCount = v13;
      -[PXSectionedSelectionManager selectionSnapshot](v12, "selectionSnapshot");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSelectionSnapshot:", v14);

    }
    else if ((v6 & 2) != 0)
    {
      -[PXSelectionCoordinator _handleDataSourceChangeToSelectionManager:state:](self, "_handleDataSourceChangeToSelectionManager:state:", v17, v11);
    }
    else if ((v6 & 1) != 0)
    {
      -[PXSelectionCoordinator _handleSelectionChangeToSelectionManager:state:](self, "_handleSelectionChangeToSelectionManager:state:", v17, v11);
    }
  }

}

- (id)selectionManager:(id)a3 validateSnapshot:(id)a4
{
  PXSectionedSelectionManager *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v28;

  v6 = (PXSectionedSelectionManager *)a3;
  v7 = a4;
  -[PXSelectionCoordinator selectionCountLimit](self, "selectionCountLimit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    goto LABEL_10;
  if (self->_currentlyMutatingSelectionManager == v6)
    goto LABEL_10;
  v10 = objc_msgSend(v8, "integerValue");
  -[PXSelectionCoordinator mutableSelectedObjectIDs](self, "mutableSelectedObjectIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v11, "count");

  objc_msgSend(v7, "selectedIndexPaths");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  -[PXSectionedSelectionManager selectionSnapshot](v6, "selectionSnapshot");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "selectedIndexPaths");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v13 - objc_msgSend(v15, "count");

  if (v16 < 1)
    goto LABEL_10;
  if (v16 + v28 <= v10)
    goto LABEL_10;
  objc_msgSend(v7, "dataSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedIndexPaths");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectIDsForIndexPathSet:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "set");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXSelectionCoordinator mutableSelectedObjectIDs](self, "mutableSelectedObjectIDs");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "set");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setByAddingObjectsFromSet:", v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");

  if (v24 <= v10 || v24 <= v28)
  {
LABEL_10:
    v26 = v7;
  }
  else
  {
    if (self->_delegateRespondsTo.rejectedCountLimitViolation)
    {
      -[PXSelectionCoordinator delegate](self, "delegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "selectionCoordinator:rejectedCountLimitViolationForSelectionManager:", self, v6);

    }
    v26 = 0;
  }

  return v26;
}

- (BOOL)selectionManagerShouldAvoidEmptySelection:(id)a3
{
  return 0;
}

- (BOOL)test_validateInternalState
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[PXSelectionCoordinator stateByManager](self, "stateByManager", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[PXSelectionCoordinator stateByManager](self, "stateByManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "selectionSnapshot");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "selectionSnapshot");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 != v13)
        {
          v14 = 0;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_11:

  return v14;
}

- (NSNumber)selectionCountLimit
{
  return self->_selectionCountLimit;
}

- (BOOL)selectionLimitReached
{
  return self->_selectionLimitReached;
}

- (void)setSelectionLimitReached:(BOOL)a3
{
  self->_selectionLimitReached = a3;
}

- (PXSelectionCoordinatorDelegate)delegate
{
  return (PXSelectionCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSMutableOrderedSet)mutableSelectedObjectIDs
{
  return self->_mutableSelectedObjectIDs;
}

- (NSMapTable)stateByManager
{
  return self->_stateByManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateByManager, 0);
  objc_storeStrong((id *)&self->_mutableSelectedObjectIDs, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectionCountLimit, 0);
  objc_storeStrong((id *)&self->_currentlyMutatingSelectionManager, 0);
}

void __128__PXSelectionCoordinator__performChangesToCoordinatedSelectionManagersWithRemovedOIDs_insertedOIDs_originatingSelectionManager___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "setSelectionLimitReached:", *(unsigned __int8 *)(a1 + 48));
  if (*(_BYTE *)(a1 + 49))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "selectedObjectIDs");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setOverallSelectionOrder:", v4);

  }
}

void __128__PXSelectionCoordinator__performChangesToCoordinatedSelectionManagersWithRemovedOIDs_insertedOIDs_originatingSelectionManager___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setSelectedState:forIndexPathSet:", 0, v3);
  objc_msgSend(v4, "setSelectedState:forIndexPathSet:", 1, *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setSelectionLimitReached:", *(unsigned __int8 *)(a1 + 64));

  if (*(_BYTE *)(a1 + 65))
  {
    v5 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "selectedObjectIDs");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setOverallSelectionOrder:", v6);

  }
}

void __74__PXSelectionCoordinator__handleDataSourceChangeToSelectionManager_state___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "itemChangesInSection:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "hasIncrementalChanges")
    || (objc_msgSend(v7, "insertedIndexes"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v6))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }

}

void __76__PXSelectionCoordinator__updateSelectionManagerToGlobalState_managerState___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setSelectedIndexPaths:", v3);
  objc_msgSend(v4, "setSelectionLimitReached:", *(unsigned __int8 *)(a1 + 56));

  v5 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "selectedObjectIDs");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOverallSelectionOrder:", v6);

}

@end
