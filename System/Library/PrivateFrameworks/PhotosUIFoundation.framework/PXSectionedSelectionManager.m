@implementation PXSectionedSelectionManager

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v6 = a4;
  v9 = a3;
  if ((v6 & 1) != 0 && (void *)PXSelectionManagerDataSourceObserverContext == a5)
  {
    if (-[PXObservable isPerformingChanges](self, "isPerformingChanges"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedSelectionManager.m"), 370, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!self.isPerformingChanges"));

    }
    v10 = v9;
    objc_msgSend(v10, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "changeHistory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __60__PXSectionedSelectionManager_observable_didChange_context___block_invoke;
    v16[3] = &unk_2514CFBE0;
    v16[4] = self;
    v17 = v11;
    v18 = v12;
    v13 = v12;
    v14 = v11;
    -[PXSectionedSelectionManager performChanges:](self, "performChanges:", v16);

  }
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXSectionedSelectionManager;
  -[PXObservable performChanges:](&v3, sel_performChanges_, a3);
}

- (void)didPerformChanges
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXSectionedSelectionManager;
  -[PXObservable didPerformChanges](&v3, sel_didPerformChanges);
  -[PXSectionedSelectionManager _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)_updateIfNeeded
{
  id v4;

  -[PXSectionedSelectionManager _updateSelectionSnapshotIfNeeded](self, "_updateSelectionSnapshotIfNeeded");
  if (-[PXSectionedSelectionManager _needsUpdate](self, "_needsUpdate"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedSelectionManager.m"), 171, CFSTR("Selection manager still needs to update after an update pass"));

  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.selectionSnapshot;
}

- (void)_setDataSource:(id)a3 withChangeHistory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  __int128 v17;
  uint64_t v18;
  id v19;
  _BYTE v20[32];
  _BYTE v21[32];
  _BYTE v22[32];
  _OWORD v23[2];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[5];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;

  v6 = a3;
  v7 = a4;
  -[PXSectionedSelectionManager dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSectionedSelectionManager _setDataSource:](self, "_setDataSource:", v6);
  v43 = *(_OWORD *)PXSimpleIndexPathNull;
  v44 = *(_OWORD *)&PXSimpleIndexPathNull[16];
  v41 = *(_OWORD *)PXSimpleIndexPathNull;
  v42 = *(_OWORD *)&PXSimpleIndexPathNull[16];
  v39 = *(_OWORD *)PXSimpleIndexPathNull;
  v40 = *(_OWORD *)&PXSimpleIndexPathNull[16];
  if (v7)
  {
    v9 = objc_msgSend(v8, "identifier");
    objc_msgSend(v7, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", v9, objc_msgSend(v6, "identifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSectionedSelectionManager selectedIndexPaths](self, "selectedIndexPaths");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXSectionedDataSourceChangeDetails indexPathSetAfterApplyingChanges:toIndexPathSet:hasIncrementalChanges:](PXSectionedDataSourceChangeDetails, "indexPathSetAfterApplyingChanges:toIndexPathSet:hasIncrementalChanges:", v10, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    if (v11)
      objc_msgSend(v11, "firstItemIndexPathForDataSourceIdentifier:", v9);
    -[PXSectionedSelectionManager snapshotValidator](self, "snapshotValidator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v6;
    if (!objc_msgSend(v13, "selectionManagerShouldAvoidEmptySelection:", self))
      goto LABEL_10;
    v14 = 0;
    if (!(_QWORD)v37 || (_QWORD)v38 == 0x7FFFFFFFFFFFFFFFLL || *((_QWORD *)&v38 + 1) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v15 = v8;
      goto LABEL_23;
    }
    if (v12)
    {
      objc_msgSend(v12, "anyItemIndexPath");
      if ((_QWORD)v35)
      {
LABEL_10:
        v15 = v8;
        v14 = 0;
LABEL_23:
        v16 = (void *)objc_msgSend(v12, "mutableCopy");
        -[PXSectionedSelectionManager cursorIndexPath](self, "cursorIndexPath");
        +[PXSectionedDataSourceChangeDetails indexPathAfterApplyingChanges:toIndexPath:hasIncrementalChanges:objectChanged:](PXSectionedDataSourceChangeDetails, "indexPathAfterApplyingChanges:toIndexPath:hasIncrementalChanges:objectChanged:", v10, v22, 0, 0);
        -[PXSectionedSelectionManager pendingIndexPath](self, "pendingIndexPath");
        +[PXSectionedDataSourceChangeDetails indexPathAfterApplyingChanges:toIndexPath:hasIncrementalChanges:objectChanged:](PXSectionedDataSourceChangeDetails, "indexPathAfterApplyingChanges:toIndexPath:hasIncrementalChanges:objectChanged:", v10, v21, 0, 0);
        -[PXSectionedSelectionManager pressedIndexPath](self, "pressedIndexPath");
        +[PXSectionedDataSourceChangeDetails indexPathAfterApplyingChanges:toIndexPath:hasIncrementalChanges:objectChanged:](PXSectionedDataSourceChangeDetails, "indexPathAfterApplyingChanges:toIndexPath:hasIncrementalChanges:objectChanged:", v10, v20, 0, 0);

        v8 = v15;
        v6 = v19;
        goto LABEL_24;
      }
    }
    else
    {
      v35 = 0u;
      v36 = 0u;
    }
    *(_QWORD *)&v31 = 0;
    *((_QWORD *)&v31 + 1) = &v31;
    *(_QWORD *)&v32 = 0x4010000000;
    *((_QWORD *)&v32 + 1) = &unk_244396D4B;
    v33 = *(_OWORD *)PXSimpleIndexPathNull;
    v34 = *(_OWORD *)&PXSimpleIndexPathNull[16];
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __64__PXSectionedSelectionManager__setDataSource_withChangeHistory___block_invoke;
    v28[3] = &unk_2514CFA90;
    v29 = v37;
    v30 = v38;
    v28[4] = &v31;
    v26 = v37;
    v27 = v38;
    objc_msgSend(v8, "enumerateItemIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", &v26, 1, v28);
    v26 = 0u;
    v27 = 0u;
    if (v6)
      objc_msgSend(v6, "firstItemIndexPath");
    v14 = 0;
    if (*(_QWORD *)(*((_QWORD *)&v31 + 1) + 32))
    {
      if (*(_QWORD *)(*((_QWORD *)&v31 + 1) + 48) != 0x7FFFFFFFFFFFFFFFLL
        && *(_QWORD *)(*((_QWORD *)&v31 + 1) + 56) == 0x7FFFFFFFFFFFFFFFLL)
      {
        v17 = *(_OWORD *)(*((_QWORD *)&v31 + 1) + 48);
        v23[0] = *(_OWORD *)(*((_QWORD *)&v31 + 1) + 32);
        v23[1] = v17;
        +[PXSectionedDataSourceChangeDetails indexPathAfterApplyingChanges:toIndexPath:hasIncrementalChanges:objectChanged:](PXSectionedDataSourceChangeDetails, "indexPathAfterApplyingChanges:toIndexPath:hasIncrementalChanges:objectChanged:", v10, v23, 0, 0);
        v14 = 0;
        v26 = v24;
        v27 = v25;
        if ((_QWORD)v24)
        {
          if ((_QWORD)v27 != 0x7FFFFFFFFFFFFFFFLL)
            v14 = *((_QWORD *)&v27 + 1) == 0x7FFFFFFFFFFFFFFFLL;
        }
      }
    }
    v24 = v26;
    v25 = v27;
    +[PXIndexPathSet indexPathSetWithIndexPath:](PXIndexPathSet, "indexPathSetWithIndexPath:", &v24);
    v18 = objc_claimAutoreleasedReturnValue();
    v15 = v8;

    _Block_object_dispose(&v31, 8);
    v12 = (void *)v18;
    goto LABEL_23;
  }
  +[PXIndexPathSet indexPathSet](PXMutableIndexPathSet, "indexPathSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
LABEL_24:
  -[PXSectionedSelectionManager _setEmptySelectionAvoided:](self, "_setEmptySelectionAvoided:", v14);
  -[PXSectionedSelectionManager _setSelectedIndexPaths:](self, "_setSelectedIndexPaths:", v16);
  v31 = v43;
  v32 = v44;
  -[PXSectionedSelectionManager _setCursorIndexPath:](self, "_setCursorIndexPath:", &v31);
  v31 = v41;
  v32 = v42;
  -[PXSectionedSelectionManager _setPendingIndexPath:](self, "_setPendingIndexPath:", &v31);
  v31 = v39;
  v32 = v40;
  -[PXSectionedSelectionManager _setPressedIndexPath:](self, "_setPressedIndexPath:", &v31);

}

- (void)_updateSelectionSnapshotIfNeeded
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  PXSelectionSnapshot *v8;
  void *v9;
  _BOOL8 v10;
  BOOL v11;
  void *v12;
  PXSelectionSnapshot *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  PXSelectionSnapshot *v19;
  PXSelectionSnapshot *v20;
  PXSelectionSnapshot *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _OWORD v26[2];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  char v37[32];
  char v38[32];
  __int128 v39;
  __int128 v40;
  _QWORD v41[7];
  uint8_t buf[16];
  __int128 v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  if (self->_needsUpdateFlags.selectionSnapshot)
  {
    self->_needsUpdateFlags.selectionSnapshot = 0;
    -[PXSectionedSelectionManager selectedIndexPaths](self, "selectedIndexPaths");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

    -[PXSectionedSelectionManager dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "identifier");

    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __63__PXSectionedSelectionManager__updateSelectionSnapshotIfNeeded__block_invoke;
    v41[3] = &unk_2514CFAB8;
    v41[5] = v7;
    v41[6] = a2;
    v41[4] = self;
    objc_msgSend(v5, "enumerateDataSourceIdentifiers:", v41);
    v39 = 0u;
    v40 = 0u;
    -[PXSectionedSelectionManager cursorIndexPath](self, "cursorIndexPath");
    v8 = [PXSelectionSnapshot alloc];
    -[PXSectionedSelectionManager dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSectionedSelectionManager pendingIndexPath](self, "pendingIndexPath");
    -[PXSectionedSelectionManager pressedIndexPath](self, "pressedIndexPath");
    v10 = -[PXSectionedSelectionManager selectionLimitReached](self, "selectionLimitReached");
    v11 = -[PXSectionedSelectionManager emptySelectionAvoided](self, "emptySelectionAvoided");
    -[PXSectionedSelectionManager overallSelectionOrder](self, "overallSelectionOrder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_OWORD *)buf = v39;
    v43 = v40;
    LOBYTE(v25) = v11;
    v13 = -[PXSelectionSnapshot initWithDataSource:selectedIndexPaths:cursorIndexPath:pendingIndexPath:pressedIndexPath:selectionLimitReached:emptySelectionAvoided:overallSelectionOrder:](v8, "initWithDataSource:selectedIndexPaths:cursorIndexPath:pendingIndexPath:pressedIndexPath:selectionLimitReached:emptySelectionAvoided:overallSelectionOrder:", v9, v5, buf, v38, v37, v10, v25, v12);

    -[PXSectionedSelectionManager selectionSnapshot](self, "selectionSnapshot");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dataSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "identifier");
    -[PXSelectionSnapshot dataSource](v13, "dataSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "identifier");

    if (v16 == v18)
    {
      -[PXSectionedSelectionManager _validatedSnapshotForSnapshot:](self, "_validatedSnapshotForSnapshot:", v13);
      v19 = (PXSelectionSnapshot *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19 != v13)
      {
        v21 = v19;

        -[PXSectionedSelectionManager selectedIndexPaths](self, "selectedIndexPaths");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "removeAllIndexPaths");
        -[PXSelectionSnapshot selectedIndexPaths](v21, "selectedIndexPaths");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "unionIndexPathSet:", v23);

        if (v21)
        {
          -[PXSelectionSnapshot cursorIndexPath](v21, "cursorIndexPath");
          v33 = v35;
          v34 = v36;
          -[PXSectionedSelectionManager _setCursorIndexPath:](self, "_setCursorIndexPath:", &v33);
          -[PXSelectionSnapshot pendingIndexPath](v21, "pendingIndexPath");
          v29 = v31;
          v30 = v32;
          -[PXSectionedSelectionManager _setPendingIndexPath:](self, "_setPendingIndexPath:", &v29);
          -[PXSelectionSnapshot pressedIndexPath](v21, "pressedIndexPath");
        }
        else
        {
          v35 = 0u;
          v36 = 0u;
          v33 = 0u;
          v34 = 0u;
          -[PXSectionedSelectionManager _setCursorIndexPath:](self, "_setCursorIndexPath:", &v33);
          v31 = 0u;
          v32 = 0u;
          v29 = 0u;
          v30 = 0u;
          -[PXSectionedSelectionManager _setPendingIndexPath:](self, "_setPendingIndexPath:", &v29);
          v27 = 0u;
          v28 = 0u;
        }
        v26[0] = v27;
        v26[1] = v28;
        -[PXSectionedSelectionManager _setPressedIndexPath:](self, "_setPressedIndexPath:", v26);
        -[PXSectionedSelectionManager _setSelectionLimitReached:](self, "_setSelectionLimitReached:", -[PXSelectionSnapshot isSelectionLimitReached](v21, "isSelectionLimitReached"));
        -[PXSelectionSnapshot overallSelectionOrder](v21, "overallSelectionOrder");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXSectionedSelectionManager _setOverallSelectionOrder:](self, "_setOverallSelectionOrder:", v24);

        v13 = v21;
      }

    }
    -[PXSectionedSelectionManager _setSelectionSnapshot:](self, "_setSelectionSnapshot:", v13);

  }
}

- (PXSelectionSnapshot)selectionSnapshot
{
  return self->_selectionSnapshot;
}

- (PXSectionedDataSource)dataSource
{
  return self->_dataSource;
}

- (PXMutableIndexPathSet)selectedIndexPaths
{
  return self->_selectedIndexPaths;
}

- (PXSimpleIndexPath)pressedIndexPath
{
  __int128 v3;

  v3 = *(_OWORD *)&self[7].section;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[6].subitem;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (PXSimpleIndexPath)pendingIndexPath
{
  __int128 v3;

  v3 = *(_OWORD *)&self[6].section;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[5].subitem;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (PXSimpleIndexPath)cursorIndexPath
{
  __int128 v3;

  v3 = *(_OWORD *)&self[5].section;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[4].subitem;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (BOOL)selectionLimitReached
{
  return self->_selectionLimitReached;
}

- (NSOrderedSet)overallSelectionOrder
{
  return self->_overallSelectionOrder;
}

- (BOOL)emptySelectionAvoided
{
  return self->_emptySelectionAvoided;
}

- (void)_setSelectionSnapshot:(id)a3
{
  PXSelectionSnapshot *v5;
  PXSelectionSnapshot *v6;

  v5 = (PXSelectionSnapshot *)a3;
  if (self->_selectionSnapshot != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_selectionSnapshot, a3);
    -[PXObservable signalChange:](self, "signalChange:", 1);
    v5 = v6;
  }

}

- (void)_setSelectedIndexPaths:(id)a3
{
  PXMutableIndexPathSet *v5;
  PXMutableIndexPathSet *v6;

  v5 = (PXMutableIndexPathSet *)a3;
  if (self->_selectedIndexPaths != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_selectedIndexPaths, a3);
    -[PXSectionedSelectionManager _invalidateSelectionSnapshot](self, "_invalidateSelectionSnapshot");
    v5 = v6;
  }

}

- (void)_setPressedIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->item;
  *(_OWORD *)&self->_pressedIndexPath.dataSourceIdentifier = *(_OWORD *)&a3->dataSourceIdentifier;
  *(_OWORD *)&self->_pressedIndexPath.item = v3;
}

- (void)_setPendingIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->item;
  *(_OWORD *)&self->_pendingIndexPath.dataSourceIdentifier = *(_OWORD *)&a3->dataSourceIdentifier;
  *(_OWORD *)&self->_pendingIndexPath.item = v3;
}

- (void)_setEmptySelectionAvoided:(BOOL)a3
{
  self->_emptySelectionAvoided = a3;
}

- (void)_setDataSource:(id)a3
{
  PXSectionedDataSource *v5;
  PXSectionedDataSource *v6;

  v5 = (PXSectionedDataSource *)a3;
  if (self->_dataSource != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_dataSource, a3);
    -[PXObservable signalChange:](self, "signalChange:", 2);
    -[PXSectionedSelectionManager _invalidateSelectionSnapshot](self, "_invalidateSelectionSnapshot");
    v5 = v6;
  }

}

- (void)_invalidateSelectionSnapshot
{
  self->_needsUpdateFlags.selectionSnapshot = 1;
}

- (void)_setCursorIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->item;
  *(_OWORD *)&self->_cursorIndexPath.dataSourceIdentifier = *(_OWORD *)&a3->dataSourceIdentifier;
  *(_OWORD *)&self->_cursorIndexPath.item = v3;
}

uint64_t __60__PXSectionedSelectionManager_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setDataSource:withChangeHistory:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (PXSectionedSelectionManagerSnapshotValidator)snapshotValidator
{
  return (PXSectionedSelectionManagerSnapshotValidator *)objc_loadWeakRetained((id *)&self->_snapshotValidator);
}

uint64_t __57__PXSectionedSelectionManager_initWithDataSourceManager___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setDataSource:withChangeHistory:", v3, 0);

  return objc_msgSend(*(id *)(a1 + 32), "_invalidateSelectionSnapshot");
}

- (void)deselectAll
{
  -[PXSectionedSelectionManager _makeSimpleModificationToSelectedIndexPathsUsingBlock:](self, "_makeSimpleModificationToSelectedIndexPathsUsingBlock:", &__block_literal_global_3167);
}

- (PXSectionedDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (PXSectionedSelectionManager)initWithDataSourceManager:(id)a3
{
  id v5;
  PXSectionedSelectionManager *v6;
  PXSectionedSelectionManager *v7;
  uint64_t v8;
  PXMutableIndexPathSet *selectedIndexPaths;
  _QWORD v11[4];
  PXSectionedSelectionManager *v12;
  id v13;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXSectionedSelectionManager;
  v6 = -[PXObservable init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSourceManager, a3);
    +[PXIndexPathSet indexPathSet](PXMutableIndexPathSet, "indexPathSet");
    v8 = objc_claimAutoreleasedReturnValue();
    selectedIndexPaths = v7->_selectedIndexPaths;
    v7->_selectedIndexPaths = (PXMutableIndexPathSet *)v8;

    objc_msgSend(v5, "registerChangeObserver:context:", v7, PXSelectionManagerDataSourceObserverContext);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __57__PXSectionedSelectionManager_initWithDataSourceManager___block_invoke;
    v11[3] = &unk_2514CFA68;
    v12 = v7;
    v13 = v5;
    -[PXSectionedSelectionManager performChanges:](v12, "performChanges:", v11);

  }
  return v7;
}

- (void)_makeSimpleModificationToSelectedIndexPathsUsingBlock:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void (**v9)(id, void *);

  v9 = (void (**)(id, void *))a3;
  if (self->_needsUpdateFlags.selectionSnapshot)
  {
    v4 = -1;
  }
  else
  {
    -[PXSectionedSelectionManager selectedIndexPaths](self, "selectedIndexPaths");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count");

  }
  -[PXSectionedSelectionManager selectedIndexPaths](self, "selectedIndexPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v6);

  if (self->_needsUpdateFlags.selectionSnapshot)
  {
    v7 = -1;
  }
  else
  {
    -[PXSectionedSelectionManager selectedIndexPaths](self, "selectedIndexPaths");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "count");

  }
  if (v4 != v7)
    -[PXSectionedSelectionManager _invalidateSelectionSnapshot](self, "_invalidateSelectionSnapshot");

}

uint64_t __42__PXSectionedSelectionManager_deselectAll__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAllIndexPaths");
}

- (void)setSnapshotValidator:(id)a3
{
  objc_storeWeak((id *)&self->_snapshotValidator, a3);
}

- (PXSectionedSelectionManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedSelectionManager.m"), 49, CFSTR("Not supported"));

  abort();
}

- (id)_validatedSnapshotForSnapshot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[PXSectionedSelectionManager snapshotValidator](self, "snapshotValidator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    v8 = v4;
    goto LABEL_5;
  }
  objc_msgSend(v5, "selectionManager:validateSnapshot:", self, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[PXSectionedSelectionManager selectionSnapshot](self, "selectionSnapshot");
    v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7 = v8;
  }

  return v7;
}

- (void)setSelectedState:(BOOL)a3 forIndexPath:(PXSimpleIndexPath *)a4
{
  int64_t dataSourceIdentifier;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  __int128 v11;
  int64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  __int128 v17;
  __int128 v18;
  BOOL v19;
  uint8_t buf[4];
  int64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  dataSourceIdentifier = a4->dataSourceIdentifier;
  if (a4->dataSourceIdentifier)
  {
    -[PXSectionedSelectionManager dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "identifier");

    if (dataSourceIdentifier != v9)
    {
      PXAssertGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v12 = a4->dataSourceIdentifier;
        -[PXSectionedSelectionManager dataSource](self, "dataSource");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "identifier");
        -[PXSectionedSelectionManager dataSource](self, "dataSource");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v21 = v12;
        v22 = 2048;
        v23 = v14;
        v24 = 2112;
        v25 = v15;
        _os_log_error_impl(&dword_24430E000, v10, OS_LOG_TYPE_ERROR, "Invalid use, data source identifier mismatch %lu!=%lu, can only select indexPaths in the current data source version: %@", buf, 0x20u);

      }
    }
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __61__PXSectionedSelectionManager_setSelectedState_forIndexPath___block_invoke;
    v16[3] = &__block_descriptor_65_e31_v16__0__PXMutableIndexPathSet_8l;
    v19 = a3;
    v11 = *(_OWORD *)&a4->item;
    v17 = *(_OWORD *)&a4->dataSourceIdentifier;
    v18 = v11;
    -[PXSectionedSelectionManager _makeSimpleModificationToSelectedIndexPathsUsingBlock:](self, "_makeSimpleModificationToSelectedIndexPathsUsingBlock:", v16);
  }
}

- (void)setSelectedState:(BOOL)a3 forIndexPath:(PXSimpleIndexPath *)a4 andUpdateCursorIndexPath:(BOOL)a5
{
  _BOOL4 v5;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v5 = a5;
  v8 = *(_OWORD *)&a4->item;
  v10 = *(_OWORD *)&a4->dataSourceIdentifier;
  v11 = v8;
  -[PXSectionedSelectionManager setSelectedState:forIndexPath:](self, "setSelectedState:forIndexPath:", a3, &v10);
  if (v5)
  {
    v9 = *(_OWORD *)&a4->item;
    v10 = *(_OWORD *)&a4->dataSourceIdentifier;
    v11 = v9;
    -[PXSectionedSelectionManager setCursorIndexPath:](self, "setCursorIndexPath:", &v10);
  }
}

- (void)setSelectedState:(BOOL)a3 forIndexPathSet:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  BOOL v10;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __64__PXSectionedSelectionManager_setSelectedState_forIndexPathSet___block_invoke;
  v8[3] = &unk_2514CFB00;
  v10 = a3;
  v9 = v6;
  v7 = v6;
  -[PXSectionedSelectionManager _makeSimpleModificationToSelectedIndexPathsUsingBlock:](self, "_makeSimpleModificationToSelectedIndexPathsUsingBlock:", v8);

}

- (void)selectAllItems
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  -[PXSectionedSelectionManager dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allItemIndexPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__PXSectionedSelectionManager_selectAllItems__block_invoke;
  v6[3] = &unk_2514CFB28;
  v7 = v4;
  v5 = v4;
  -[PXSectionedSelectionManager _makeSimpleModificationToSelectedIndexPathsUsingBlock:](self, "_makeSimpleModificationToSelectedIndexPathsUsingBlock:", v6);

}

- (void)selectAllItemsInSection:(PXSimpleIndexPath *)a3
{
  __int128 v3;
  _QWORD v4[5];
  __int128 v5;
  __int128 v6;
  SEL v7;

  v4[1] = 3221225472;
  v3 = *(_OWORD *)&a3->item;
  v5 = *(_OWORD *)&a3->dataSourceIdentifier;
  v4[0] = MEMORY[0x24BDAC760];
  v4[2] = __55__PXSectionedSelectionManager_selectAllItemsInSection___block_invoke;
  v4[3] = &unk_2514CFBB8;
  v4[4] = self;
  v6 = v3;
  v7 = a2;
  -[PXSectionedSelectionManager _makeSimpleModificationToSelectedIndexPathsUsingBlock:](self, "_makeSimpleModificationToSelectedIndexPathsUsingBlock:", v4);
}

- (void)setSelectedIndexPaths:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  -[PXSectionedSelectionManager _setSelectedIndexPaths:](self, "_setSelectedIndexPaths:", v4);

  -[PXSectionedSelectionManager _invalidateSelectionSnapshot](self, "_invalidateSelectionSnapshot");
}

- (void)setSelectedIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v5 = *(_OWORD *)&a3->item;
  v8 = *(_OWORD *)&a3->dataSourceIdentifier;
  v9 = v5;
  +[PXIndexPathSet indexPathSetWithIndexPath:](PXMutableIndexPathSet, "indexPathSetWithIndexPath:", &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSectionedSelectionManager _setSelectedIndexPaths:](self, "_setSelectedIndexPaths:", v6);

  v7 = *(_OWORD *)&a3->item;
  v8 = *(_OWORD *)&a3->dataSourceIdentifier;
  v9 = v7;
  -[PXSectionedSelectionManager _setCursorIndexPath:](self, "_setCursorIndexPath:", &v8);
  -[PXSectionedSelectionManager _invalidateSelectionSnapshot](self, "_invalidateSelectionSnapshot");
}

- (void)setCursorIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v5;
  _OWORD v6[4];

  -[PXSectionedSelectionManager cursorIndexPath](self, "cursorIndexPath");
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64((int64x2_t)v6[2], *(int64x2_t *)&a3->dataSourceIdentifier), (int32x4_t)vceqq_s64((int64x2_t)v6[3], *(int64x2_t *)&a3->item))), 0xFuLL))) & 1) == 0)
  {
    v5 = *(_OWORD *)&a3->item;
    v6[0] = *(_OWORD *)&a3->dataSourceIdentifier;
    v6[1] = v5;
    -[PXSectionedSelectionManager _setCursorIndexPath:](self, "_setCursorIndexPath:", v6);
    -[PXSectionedSelectionManager _invalidateSelectionSnapshot](self, "_invalidateSelectionSnapshot");
  }
}

- (void)setPendingIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v5;
  _OWORD v6[4];

  -[PXSectionedSelectionManager pendingIndexPath](self, "pendingIndexPath");
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64((int64x2_t)v6[2], *(int64x2_t *)&a3->dataSourceIdentifier), (int32x4_t)vceqq_s64((int64x2_t)v6[3], *(int64x2_t *)&a3->item))), 0xFuLL))) & 1) == 0)
  {
    v5 = *(_OWORD *)&a3->item;
    v6[0] = *(_OWORD *)&a3->dataSourceIdentifier;
    v6[1] = v5;
    -[PXSectionedSelectionManager _setPendingIndexPath:](self, "_setPendingIndexPath:", v6);
    -[PXSectionedSelectionManager _invalidateSelectionSnapshot](self, "_invalidateSelectionSnapshot");
  }
}

- (void)setPressedIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v5;
  _OWORD v6[4];

  -[PXSectionedSelectionManager pressedIndexPath](self, "pressedIndexPath");
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64((int64x2_t)v6[2], *(int64x2_t *)&a3->dataSourceIdentifier), (int32x4_t)vceqq_s64((int64x2_t)v6[3], *(int64x2_t *)&a3->item))), 0xFuLL))) & 1) == 0)
  {
    v5 = *(_OWORD *)&a3->item;
    v6[0] = *(_OWORD *)&a3->dataSourceIdentifier;
    v6[1] = v5;
    -[PXSectionedSelectionManager _setPressedIndexPath:](self, "_setPressedIndexPath:", v6);
    -[PXSectionedSelectionManager _invalidateSelectionSnapshot](self, "_invalidateSelectionSnapshot");
  }
}

- (void)setSelectionLimitReached:(BOOL)a3
{
  if (self->_selectionLimitReached != a3)
  {
    self->_selectionLimitReached = a3;
    -[PXSectionedSelectionManager _invalidateSelectionSnapshot](self, "_invalidateSelectionSnapshot");
  }
}

- (void)setOverallSelectionOrder:(id)a3
{
  NSOrderedSet *v4;
  NSOrderedSet *overallSelectionOrder;

  if (self->_overallSelectionOrder != a3)
  {
    v4 = (NSOrderedSet *)objc_msgSend(a3, "copy");
    overallSelectionOrder = self->_overallSelectionOrder;
    self->_overallSelectionOrder = v4;

    -[PXSectionedSelectionManager _invalidateSelectionSnapshot](self, "_invalidateSelectionSnapshot");
  }
}

- (id)sectionedDataSourceManagerInterestingObjectReferences:(id)a3
{
  return 0;
}

- (void)_setSelectionLimitReached:(BOOL)a3
{
  self->_selectionLimitReached = a3;
}

- (void)_setOverallSelectionOrder:(id)a3
{
  objc_storeStrong((id *)&self->_overallSelectionOrder, a3);
}

- (BOOL)disableAssetTypeCounting
{
  return self->_disableAssetTypeCounting;
}

- (void)setDisableAssetTypeCounting:(BOOL)a3
{
  self->_disableAssetTypeCounting = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_snapshotValidator);
  objc_storeStrong((id *)&self->_overallSelectionOrder, 0);
  objc_storeStrong((id *)&self->_selectedIndexPaths, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_selectionSnapshot, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
}

void __55__PXSectionedSelectionManager_selectAllItemsInSection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  __int128 v14;
  __int128 v15;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "identifier") != *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), CFSTR("PXSectionedSelectionManager.m"), 298, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSource.identifier == sectionIndexPath.dataSourceIdentifier"));

  }
  v4 = *(_QWORD *)(a1 + 48);
  if (v4 >= objc_msgSend(v3, "numberOfSections"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), CFSTR("PXSectionedSelectionManager.m"), 299, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIndexPath.section < dataSource.numberOfSections"));

  }
  v12[1] = 3221225472;
  v5 = *(_OWORD *)(a1 + 56);
  v14 = *(_OWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v12[0] = MEMORY[0x24BDAC760];
  v12[2] = __55__PXSectionedSelectionManager_selectAllItemsInSection___block_invoke_2;
  v12[3] = &unk_2514CFB90;
  v13 = v3;
  v15 = v5;
  v8 = v3;
  objc_msgSend(v11, "modifyItemIndexSetForDataSourceIdentifier:section:usingBlock:", v7, v6, v12);

}

void __55__PXSectionedSelectionManager_selectAllItemsInSection___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = a2;
  objc_msgSend(v4, "addIndexesInRange:", 0, objc_msgSend(v2, "numberOfItemsInSection:", v3));

}

uint64_t __45__PXSectionedSelectionManager_selectAllItems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "unionIndexPathSet:", *(_QWORD *)(a1 + 32));
}

uint64_t __64__PXSectionedSelectionManager_setSelectedState_forIndexPathSet___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
    return objc_msgSend(a2, "unionIndexPathSet:", v2);
  else
    return objc_msgSend(a2, "minusIndexPathSet:", v2);
}

uint64_t __61__PXSectionedSelectionManager_setSelectedState_forIndexPath___block_invoke(uint64_t a1, void *a2)
{
  __int128 *v2;
  __int128 v3;
  __int128 v5;
  __int128 v6;

  v2 = (__int128 *)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 48);
  if (*(_BYTE *)(a1 + 64))
  {
    v5 = *v2;
    v6 = v3;
    return objc_msgSend(a2, "addIndexPath:", &v5);
  }
  else
  {
    v5 = *v2;
    v6 = v3;
    return objc_msgSend(a2, "removeIndexPath:", &v5);
  }
}

void __63__PXSectionedSelectionManager__updateSelectionSnapshotIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 40) != a2)
  {
    PXAssertGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = 134218240;
      v7 = v5;
      v8 = 2048;
      v9 = a2;
      _os_log_fault_impl(&dword_24430E000, v4, OS_LOG_TYPE_FAULT, "Attempted to select an indexPath from an incorrect data source version %ld != %ld", (uint8_t *)&v6, 0x16u);
    }

  }
}

__n128 __64__PXSectionedSelectionManager__setDataSource_withChangeHistory___block_invoke(uint64_t a1, int64x2_t *a2, _BYTE *a3)
{
  __n128 result;
  int64x2_t *v4;
  int64x2_t v5;

  result.n128_u64[0] = (unint64_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(*(int64x2_t *)(a1 + 40), *a2), (int32x4_t)vceqq_s64(*(int64x2_t *)(a1 + 56), a2[1]))), 0xFuLL));
  result.n128_u16[0] = vminv_u16((uint16x4_t)result.n128_u64[0]);
  if ((result.n128_u8[0] & 1) == 0)
  {
    v4 = *(int64x2_t **)(*(_QWORD *)(a1 + 32) + 8);
    result = *(__n128 *)a2;
    v5 = a2[1];
    v4[2] = *a2;
    v4[3] = v5;
    *a3 = 1;
  }
  return result;
}

@end
