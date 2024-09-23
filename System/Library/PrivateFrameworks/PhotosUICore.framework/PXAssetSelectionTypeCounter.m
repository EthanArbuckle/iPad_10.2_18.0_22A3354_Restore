@implementation PXAssetSelectionTypeCounter

uint64_t __52__PXAssetSelectionTypeCounter_infoUpdaterDidUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTypedCount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)setTypedCount:(id)a3
{
  if (self->_typedCount.count != a3.var0 || self->_typedCount.type != a3.var1)
  {
    self->_typedCount = ($7D1650DB7441A0F5833AC641852B48F3)a3;
    -[PXAssetSelectionTypeCounter signalChange:](self, "signalChange:", 1);
  }
}

- (PXAssetSelectionTypeCounter)initWithSelectionManager:(id)a3
{
  id v4;
  PXAssetSelectionTypeCounter *v5;
  PXInfoUpdater *v6;
  PXInfoUpdater *infoUpdater;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *countUpdateQueue;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXAssetSelectionTypeCounter;
  v5 = -[PXAssetSelectionTypeCounter init](&v13, sel_init);
  if (v5)
  {
    v6 = -[PXInfoUpdater initWithInfoProvider:infoKind:]([PXInfoUpdater alloc], "initWithInfoProvider:infoKind:", v5, CFSTR("SelectedAssetsTypedCount"));
    infoUpdater = v5->_infoUpdater;
    v5->_infoUpdater = v6;

    -[PXInfoUpdater setObserver:](v5->_infoUpdater, "setObserver:", v5);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_USER_INITIATED, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.photos.assetSelectionTypeCounter", v9);
    countUpdateQueue = v5->_countUpdateQueue;
    v5->_countUpdateQueue = (OS_dispatch_queue *)v10;

    objc_storeWeak((id *)&v5->_selectionManager, v4);
    objc_msgSend(v4, "registerChangeObserver:context:", v5, PXSelectionManagerObserverContext);
  }

  return v5;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v9 = a3;
  if ((void *)PXSelectionManagerObserverContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetSelectionTypeCounter.m"), 57, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 1) != 0)
  {
    v12 = v9;
    -[PXAssetSelectionTypeCounter infoUpdater](self, "infoUpdater");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invalidateInfo");

    v9 = v12;
  }

}

- (id)requestInfoOfKind:(id)a3 withResultHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *countUpdateQueue;
  void *v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;

  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("SelectedAssetsTypedCount")))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetSelectionTypeCounter.m"), 92, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  -[PXAssetSelectionTypeCounter selectionSnapshot](self, "selectionSnapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isAnyItemSelected")
    && (-[PXAssetSelectionTypeCounter selectionManager](self, "selectionManager"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "disableAssetTypeCounting"),
        v10,
        !v11))
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    countUpdateQueue = self->_countUpdateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__PXAssetSelectionTypeCounter_requestInfoOfKind_withResultHandler___block_invoke;
    block[3] = &unk_1E5145688;
    v13 = v14;
    v19 = v13;
    v20 = v9;
    v21 = v8;
    dispatch_async(countUpdateQueue, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPXDisplayAssetTypedCount:", *(_QWORD *)off_1E50B7F48, *((_QWORD *)off_1E50B7F48 + 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v8 + 2))(v8, v12);

    v13 = 0;
  }

  return v13;
}

- (id)selectionSnapshot
{
  void *v2;
  void *v3;

  -[PXAssetSelectionTypeCounter selectionManager](self, "selectionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectionSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PXSectionedSelectionManager)selectionManager
{
  return (PXSectionedSelectionManager *)objc_loadWeakRetained((id *)&self->_selectionManager);
}

- (void)infoUpdaterDidUpdate:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[7];

  v5 = a3;
  -[PXAssetSelectionTypeCounter infoUpdater](self, "infoUpdater");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetSelectionTypeCounter.m"), 127, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  -[PXAssetSelectionTypeCounter infoUpdater](self, "infoUpdater");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "info");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "PXDisplayAssetTypedCountValue");
  v11 = v10;

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52__PXAssetSelectionTypeCounter_infoUpdaterDidUpdate___block_invoke;
  v13[3] = &unk_1E51449E0;
  v13[4] = self;
  v13[5] = v9;
  v13[6] = v11;
  -[PXAssetSelectionTypeCounter performChanges:](self, "performChanges:", v13);

}

- (PXInfoUpdater)infoUpdater
{
  return self->_infoUpdater;
}

- (PXAssetSelectionTypeCounter)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetSelectionTypeCounter.m"), 34, CFSTR("%s is not available as initializer"), "-[PXAssetSelectionTypeCounter init]");

  abort();
}

- (int64_t)priorityForInfoRequestOfKind:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  int64_t v7;

  if (!objc_msgSend(a3, "isEqualToString:", CFSTR("SelectedAssetsTypedCount")))
    return 0;
  -[PXAssetSelectionTypeCounter selectionSnapshot](self, "selectionSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedIndexPaths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = 10;
  if (v6 != 1)
    v7 = 0;
  if (v6)
    return v7;
  else
    return 100;
}

- ($DE30A600513D762F9B6AB73D2AED4B95)typedCount
{
  $7D1650DB7441A0F5833AC641852B48F3 *p_typedCount;
  unint64_t count;
  int64_t type;
  $DE30A600513D762F9B6AB73D2AED4B95 result;

  p_typedCount = &self->_typedCount;
  count = self->_typedCount.count;
  type = p_typedCount->type;
  result.var1 = type;
  result.var0 = count;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoUpdater, 0);
  objc_destroyWeak((id *)&self->_selectionManager);
  objc_storeStrong((id *)&self->_countUpdateQueue, 0);
}

void __67__PXAssetSelectionTypeCounter_requestInfoOfKind_withResultHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    v2 = PXDisplayAssetTypedCountFromSelectionSnapshot(*(void **)(a1 + 40));
    v3 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPXDisplayAssetTypedCount:", v2, v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);

  }
}

@end
