@implementation PXComposeRecipientSelectionManager

- (PXComposeRecipientSelectionManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipientSelectionManager.m"), 53, CFSTR("%s is not available as initializer"), "-[PXComposeRecipientSelectionManager init]");

  abort();
}

- (PXComposeRecipientSelectionManager)initWithDataSource:(id)a3
{
  id v6;
  PXComposeRecipientSelectionManager *v7;
  PXComposeRecipientSelectionManager *v8;
  uint64_t v9;
  NSMutableOrderedSet *selectedComposeRecipients;
  uint64_t v11;
  NSMutableOrderedSet *selectedRecipients;
  void *v14;
  objc_super v15;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipientSelectionManager.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSource"));

  }
  v15.receiver = self;
  v15.super_class = (Class)PXComposeRecipientSelectionManager;
  v7 = -[PXComposeRecipientSelectionManager init](&v15, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_dataSource, a3);
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v9 = objc_claimAutoreleasedReturnValue();
    selectedComposeRecipients = v8->_selectedComposeRecipients;
    v8->_selectedComposeRecipients = (NSMutableOrderedSet *)v9;

    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v11 = objc_claimAutoreleasedReturnValue();
    selectedRecipients = v8->_selectedRecipients;
    v8->_selectedRecipients = (NSMutableOrderedSet *)v11;

  }
  return v8;
}

- (void)setDataSource:(id)a3 changeDetails:(id)a4
{
  PXComposeRecipientDataSource *v7;
  PXComposeRecipientDataSource *dataSource;
  PXComposeRecipientDataSource *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  PXComposeRecipientDataSource *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  PXComposeRecipientDataSource *v19;
  PXComposeRecipientDataSource *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void *v24;
  PXComposeRecipientSelectionManager *v25;
  id v26;
  _QWORD v27[4];
  PXComposeRecipientDataSource *v28;
  PXComposeRecipientSelectionManager *v29;
  id v30;

  v7 = (PXComposeRecipientDataSource *)a3;
  dataSource = self->_dataSource;
  if (dataSource != v7)
  {
    v19 = v7;
    v9 = dataSource;
    objc_storeStrong((id *)&self->_dataSource, a3);
    v10 = a4;
    objc_msgSend(v10, "removedIndexes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __66__PXComposeRecipientSelectionManager_setDataSource_changeDetails___block_invoke;
    v27[3] = &unk_1E51489A0;
    v14 = v9;
    v28 = v14;
    v29 = self;
    v15 = v12;
    v30 = v15;
    objc_msgSend(v11, "enumerateIndexesUsingBlock:", v27);
    objc_msgSend(v10, "changedIndexes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v16, "count"));
    v21 = v13;
    v22 = 3221225472;
    v23 = __66__PXComposeRecipientSelectionManager_setDataSource_changeDetails___block_invoke_2;
    v24 = &unk_1E51460E8;
    v25 = self;
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v26 = v17;
    objc_msgSend(v16, "enumerateIndexesUsingBlock:", &v21);
    if (objc_msgSend(v17, "count"))
    {
      -[PXComposeRecipientSelectionManager _setSelectedState:forComposeRecipients:](self, "_setSelectedState:forComposeRecipients:", 0, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
    if (objc_msgSend(v15, "count", v19, v21, v22, v23, v24, v25) || objc_msgSend(v18, "count"))
      -[PXComposeRecipientSelectionManager _invalidateCurrentSelectionSnapshotWithChangedComposeRecipients:](self, "_invalidateCurrentSelectionSnapshotWithChangedComposeRecipients:", v18);

    v7 = v20;
  }

}

- (void)selectAll
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[PXComposeRecipientSelectionManager dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "composeRecipients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v7, "count");
  v5 = v7;
  if (v4)
  {
    -[PXComposeRecipientSelectionManager _setSelectedState:forComposeRecipients:](self, "_setSelectedState:forComposeRecipients:", 1, v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
      -[PXComposeRecipientSelectionManager _invalidateCurrentSelectionSnapshotWithChangedComposeRecipients:](self, "_invalidateCurrentSelectionSnapshotWithChangedComposeRecipients:", v6);

    v5 = v7;
  }

}

- (void)setSelectedState:(BOOL)a3 atIndex:(int64_t)a4
{
  _BOOL8 v5;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v5 = a3;
  v14[1] = *MEMORY[0x1E0C80C00];
  -[PXComposeRecipientSelectionManager dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "composeRecipients");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectAtIndexedSubscript:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipientSelectionManager.m"), 125, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("composeRecipient"));

  }
  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXComposeRecipientSelectionManager _setSelectedState:forComposeRecipients:](self, "_setSelectedState:forComposeRecipients:", v5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "count"))
    -[PXComposeRecipientSelectionManager _invalidateCurrentSelectionSnapshotWithChangedComposeRecipients:](self, "_invalidateCurrentSelectionSnapshotWithChangedComposeRecipients:", v12);

}

- (id)_setSelectedState:(BOOL)a3 forComposeRecipients:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  BOOL v15;

  v6 = (void *)MEMORY[0x1E0C99DE8];
  v7 = a4;
  objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__PXComposeRecipientSelectionManager__setSelectedState_forComposeRecipients___block_invoke;
  v13[3] = &unk_1E51395D8;
  v15 = a3;
  v13[4] = self;
  v9 = v8;
  v14 = v9;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v13);

  v10 = v14;
  v11 = v9;

  return v11;
}

- (id)_createComposeRecipientSelectionSnapshotFromCurrentState
{
  PXComposeRecipientSelectionSnapshot *v3;
  void *v4;
  void *v5;
  PXComposeRecipientSelectionSnapshot *v6;

  v3 = [PXComposeRecipientSelectionSnapshot alloc];
  -[NSMutableOrderedSet array](self->_selectedComposeRecipients, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableOrderedSet array](self->_selectedRecipients, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXComposeRecipientSelectionSnapshot initWithSelectedComposeRecipients:selectedRecipients:](v3, "initWithSelectedComposeRecipients:selectedRecipients:", v4, v5);

  return v6;
}

- (void)_invalidateCurrentSelectionSnapshotWithChangedComposeRecipients:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[PXComposeRecipientSelectionManager selectionSnapshot](self, "selectionSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedComposeRecipients");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[PXComposeRecipientSelectionManager _createComposeRecipientSelectionSnapshotFromCurrentState](self, "_createComposeRecipientSelectionSnapshotFromCurrentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXComposeRecipientSelectionManager setSelectionSnapshot:](self, "setSelectionSnapshot:", v6);
  -[PXComposeRecipientSelectionManager selectionSnapshot](self, "selectionSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedComposeRecipients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v9 = v4;
  else
    v9 = (id)MEMORY[0x1E0C9AA60];
  objc_msgSend(off_1E50B1608, "changeDetailsFromArray:toArray:changedObjects:", v12, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXComposeRecipientSelectionManager delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "composeRecipientSelectionManager:didUpdateSelectionSnapshotWithChangeDetails:", self, v10);

}

- (PXComposeRecipientDataSource)dataSource
{
  return self->_dataSource;
}

- (PXComposeRecipientSelectionManagerDelegate)delegate
{
  return (PXComposeRecipientSelectionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXComposeRecipientSelectionSnapshot)selectionSnapshot
{
  return self->_selectionSnapshot;
}

- (void)setSelectionSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_selectionSnapshot, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionSnapshot, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_selectedRecipients, 0);
  objc_storeStrong((id *)&self->_selectedComposeRecipients, 0);
}

void __77__PXComposeRecipientSelectionManager__setSelectedState_forComposeRecipients___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  int v5;
  BOOL v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "recipient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(unsigned __int8 *)(a1 + 48);
  v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "containsObject:", v7);
  if (v4)
    v6 = v3 == 0;
  else
    v6 = 1;
  if (v6)
  {
    if (v5)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObject:", v7);
      if (v3)
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", v3);
      goto LABEL_11;
    }
  }
  else if ((v5 & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObject:", v7);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", v3);
LABEL_11:
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
  }

}

void __66__PXComposeRecipientSelectionManager_setDataSource_changeDetails___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "composeRecipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "containsObject:", v8);
  v6 = v8;
  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "removeObject:", v8);
    objc_msgSend(*(id *)(a1 + 48), "addIndex:", a2);
    objc_msgSend(v8, "recipient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "removeObject:", v7);

    v6 = v8;
  }

}

void __66__PXComposeRecipientSelectionManager_setDataSource_changeDetails___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "composeRecipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "containsObject:", v8);
  v6 = v8;
  if (v5)
  {
    objc_msgSend(v8, "recipient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

    v6 = v8;
  }

}

@end
