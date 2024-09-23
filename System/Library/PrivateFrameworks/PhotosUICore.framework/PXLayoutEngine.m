@implementation PXLayoutEngine

- (PXLayoutEngine)init
{

  return 0;
}

- (PXLayoutEngine)initWithLayoutGenerator:(id)a3 dataSourceSnapshot:(id)a4
{
  id v6;
  id v7;
  PXLayoutEngine *v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *internalWorkQueue;
  uint64_t v13;
  PXLayoutGenerator *layoutGenerator;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXLayoutEngine;
  v8 = -[PXLayoutEngine init](&v16, sel_init);
  if (v8)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_UTILITY, 0);
    v10 = objc_claimAutoreleasedReturnValue();

    v11 = dispatch_queue_create("com.apple.photosUICore.layoutEngine.internalWork-queue", v10);
    internalWorkQueue = v8->_internalWorkQueue;
    v8->_internalWorkQueue = (OS_dispatch_queue *)v11;

    v13 = objc_msgSend(v6, "copy");
    layoutGenerator = v8->_layoutGenerator;
    v8->_layoutGenerator = (PXLayoutGenerator *)v13;

    -[PXLayoutEngine setDataSourceSnapshot:withChangeDetails:](v8, "setDataSourceSnapshot:withChangeDetails:", v7, 0);
  }

  return v8;
}

- (void)performChanges:(id)a3
{
  id v4;
  NSObject *internalWorkQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  internalWorkQueue = self->_internalWorkQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__PXLayoutEngine_performChanges___block_invoke;
  block[3] = &unk_1E5146480;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(internalWorkQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)performChangesAndWait:(id)a3
{
  id v4;
  NSObject *internalWorkQueue;
  id v6;
  PXLayoutSnapshot *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  internalWorkQueue = self->_internalWorkQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__PXLayoutEngine_performChangesAndWait___block_invoke;
  v9[3] = &unk_1E5148CE0;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  dispatch_sync(internalWorkQueue, v9);
  v7 = self->_layoutSnapshot;

  return v7;
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.layoutData || self->_needsUpdateFlags.layoutSnapshot;
}

- (void)_updateIfNeeded
{
  id v4;

  if (-[PXLayoutEngine _needsUpdate](self, "_needsUpdate"))
  {
    -[PXLayoutEngine _updateLayoutDataIfNeeded](self, "_updateLayoutDataIfNeeded");
    -[PXLayoutEngine _updateLayoutSnapshotIfNeeded](self, "_updateLayoutSnapshotIfNeeded");
    if (-[PXLayoutEngine _needsUpdate](self, "_needsUpdate"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXLayoutEngine.m"), 90, CFSTR("updates still needed after an update cycle"));

    }
  }
}

- (void)invalidateLayoutSnapshot
{
  self->_needsUpdateFlags.layoutSnapshot = 1;
  -[PXLayoutEngine _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateLayoutSnapshotIfNeeded
{
  void *v3;
  void *v4;

  if (self->_needsUpdateFlags.layoutSnapshot)
  {
    self->_needsUpdateFlags.layoutSnapshot = 0;
    if (-[PXLayoutEngine canComputeLayoutSnapshot](self, "canComputeLayoutSnapshot"))
    {
      -[PXLayoutEngine computeLayoutSnapshot](self, "computeLayoutSnapshot");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        v4 = v3;
        -[PXLayoutEngine setLayoutSnapshot:](self, "setLayoutSnapshot:", v3);
        v3 = v4;
      }

    }
  }
}

- (void)invalidateLayoutData
{
  self->_needsUpdateFlags.layoutData = 1;
  -[PXLayoutEngine _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateLayoutDataIfNeeded
{
  if (self->_needsUpdateFlags.layoutData)
  {
    self->_needsUpdateFlags.layoutData = 0;
    -[PXLayoutEngine updateLayoutDataWithChangeDetails:](self, "updateLayoutDataWithChangeDetails:", self->_changeDetails);
    -[PXLayoutEngine setChangeDetails:](self, "setChangeDetails:", 0);
  }
}

- (void)setSeedItem:(id)a3
{
  PXLayoutItem *v5;
  PXLayoutItem *v6;
  char v7;
  PXLayoutItem *v8;

  v5 = (PXLayoutItem *)a3;
  v6 = v5;
  if (self->_seedItem != v5)
  {
    v8 = v5;
    v7 = -[PXLayoutItem isEqual:](v5, "isEqual:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_seedItem, a3);
      -[PXLayoutEngine invalidateLayoutSnapshot](self, "invalidateLayoutSnapshot");
      v6 = v8;
    }
  }

}

- (void)setDataSourceSnapshot:(id)a3
{
  PXLayoutEngineDataSourceSnapshot *v4;
  PXLayoutEngineDataSourceSnapshot *dataSourceSnapshot;

  if (self->_dataSourceSnapshot != a3)
  {
    v4 = (PXLayoutEngineDataSourceSnapshot *)objc_msgSend(a3, "copyWithZone:", 0);
    dataSourceSnapshot = self->_dataSourceSnapshot;
    self->_dataSourceSnapshot = v4;

  }
}

- (void)setDataSourceSnapshot:(id)a3 withChangeDetails:(id)a4
{
  id v6;

  v6 = a4;
  -[PXLayoutEngine setDataSourceSnapshot:](self, "setDataSourceSnapshot:", a3);
  -[PXLayoutEngine setChangeDetails:](self, "setChangeDetails:", v6);

  -[PXLayoutEngine invalidateLayoutData](self, "invalidateLayoutData");
}

- (void)setLayoutSnapshot:(id)a3
{
  PXLayoutSnapshot *v6;
  void *v7;
  PXLayoutSnapshot *v8;

  v6 = (PXLayoutSnapshot *)a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXLayoutEngine.m"), 152, CFSTR("layoutSnapshot cannot be nil"));

    v6 = 0;
  }
  if (self->_layoutSnapshot != v6)
  {
    v8 = v6;
    objc_storeStrong((id *)&self->_layoutSnapshot, a3);
    -[PXLayoutSnapshot setDataSourceSnapshot:](self->_layoutSnapshot, "setDataSourceSnapshot:", self->_dataSourceSnapshot);
    -[PXLayoutEngine _publishChanges](self, "_publishChanges");
    v6 = v8;
  }

}

- (void)_publishChanges
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __33__PXLayoutEngine__publishChanges__block_invoke;
  v2[3] = &unk_1E5148D30;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (BOOL)canComputeLayoutSnapshot
{
  return self->_layoutGenerator && self->_dataSourceSnapshot != 0;
}

- (void)updateLayoutDataWithChangeDetails:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXLayoutEngine.m"), 185, CFSTR("-updateLayoutDataWithChangeDetails: must be overriden"));

}

- (id)computeLayoutSnapshot
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXLayoutEngine.m"), 189, CFSTR("-computeLayoutSnapshot: must be overriden"));

  return 0;
}

- (PXLayoutEngineDelegate)delegate
{
  return (PXLayoutEngineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXLayoutSnapshot)layoutSnapshot
{
  return self->_layoutSnapshot;
}

- (PXLayoutEngineDataSourceSnapshot)dataSourceSnapshot
{
  return self->_dataSourceSnapshot;
}

- (PXLayoutItem)seedItem
{
  return self->_seedItem;
}

- (PXLayoutGenerator)layoutGenerator
{
  return self->_layoutGenerator;
}

- (void)setLayoutGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_layoutGenerator, a3);
}

- (PXLayoutDataSourceChangeDetails)changeDetails
{
  return self->_changeDetails;
}

- (void)setChangeDetails:(id)a3
{
  objc_storeStrong((id *)&self->_changeDetails, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeDetails, 0);
  objc_storeStrong((id *)&self->_layoutGenerator, 0);
  objc_storeStrong((id *)&self->_seedItem, 0);
  objc_storeStrong((id *)&self->_dataSourceSnapshot, 0);
  objc_storeStrong((id *)&self->_layoutSnapshot, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_internalWorkQueue, 0);
}

void __33__PXLayoutEngine__publishChanges__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v2 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v2, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v1, "layoutEngineDidUpdateLayoutSnapshot:", v2);

}

void __40__PXLayoutEngine_performChangesAndWait___block_invoke(uint64_t a1)
{
  _InternalWorkQueue_PerformChanges(*(void **)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __33__PXLayoutEngine_performChanges___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  _InternalWorkQueue_PerformChanges(WeakRetained, *(_QWORD *)(a1 + 32));

}

@end
