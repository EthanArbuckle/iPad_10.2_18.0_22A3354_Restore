@implementation PUAssetSharedViewModel

- (PUAssetSharedViewModel)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAssetSharedViewModel.m"), 39, CFSTR("%s is not available as initializer"), "-[PUAssetSharedViewModel init]");

  abort();
}

- (PUAssetSharedViewModel)initWithAsset:(id)a3
{
  id v6;
  PUAssetSharedViewModel *v7;
  PUAssetSharedViewModel *v8;
  char v9;
  unsigned __int16 v10;
  void *v12;
  objc_super v13;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAssetSharedViewModel.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  v13.receiver = self;
  v13.super_class = (Class)PUAssetSharedViewModel;
  v7 = -[PUViewModel init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_asset, a3);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = objc_msgSend(v6, "needsDeferredProcessing");
    else
      v9 = 0;
    v8->_needsDeferredProcessing = v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = objc_msgSend(v6, "deferredProcessingNeeded");
    else
      v10 = 0;
    v8->_deferredProcessingNeeded = v10;
  }

  return v8;
}

- (id)newViewModelChange
{
  return objc_alloc_init(PUAssetSharedViewModelChange);
}

- (PUAssetSharedViewModelChange)currentChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUAssetSharedViewModel;
  -[PUViewModel currentChange](&v3, sel_currentChange);
  return (PUAssetSharedViewModelChange *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)registerChangeObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUAssetSharedViewModel;
  -[PUViewModel registerChangeObserver:](&v3, sel_registerChangeObserver_, a3);
}

- (void)unregisterChangeObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUAssetSharedViewModel;
  -[PUViewModel unregisterChangeObserver:](&v3, sel_unregisterChangeObserver_, a3);
}

- (void)setAsset:(id)a3
{
  PUDisplayAsset *v5;
  uint64_t v6;
  uint64_t v7;
  PUDisplayAsset *v8;

  v5 = (PUDisplayAsset *)a3;
  if (self->_asset != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_asset, a3);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = -[PUDisplayAsset needsDeferredProcessing](v8, "needsDeferredProcessing");
    else
      v6 = 0;
    -[PUAssetSharedViewModel setNeedsDeferredProcessing:](self, "setNeedsDeferredProcessing:", v6);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = -[PUDisplayAsset deferredProcessingNeeded](v8, "deferredProcessingNeeded");
    else
      v7 = 0;
    -[PUAssetSharedViewModel setDeferredProcessingNeeded:](self, "setDeferredProcessingNeeded:", v7);
    v5 = v8;
  }

}

- (void)setLoadingStatus:(id)a3
{
  PXOperationStatus *v4;
  void *v5;
  char v6;
  PXOperationStatus *v7;
  PXOperationStatus *loadingStatus;
  PXOperationStatus *v9;

  v9 = (PXOperationStatus *)a3;
  v4 = self->_loadingStatus;
  v5 = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = -[PXOperationStatus isEqual:](v9, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (PXOperationStatus *)-[PXOperationStatus copy](v9, "copy");
    loadingStatus = self->_loadingStatus;
    self->_loadingStatus = v7;

    -[PUAssetSharedViewModel currentChange](self, "currentChange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLoadingStatusChanged:", 1);
LABEL_4:

  }
}

- (void)setSaveProgress:(id)a3
{
  NSProgress *v5;
  void *v6;
  NSProgress *v7;

  v5 = (NSProgress *)a3;
  if (self->_saveProgress != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_saveProgress, a3);
    -[PUAssetSharedViewModel currentChange](self, "currentChange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSaveProgressChanged:", 1);

    v5 = v7;
  }

}

- (void)setSaveState:(int64_t)a3
{
  id v3;

  if (self->_saveState != a3)
  {
    self->_saveState = a3;
    -[PUAssetSharedViewModel currentChange](self, "currentChange");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSaveStateChanged:", 1);

  }
}

- (void)setFlippingFullSizeRenderState:(int64_t)a3
{
  id v3;

  if (self->_flippingFullSizeRenderState != a3)
  {
    self->_flippingFullSizeRenderState = a3;
    -[PUAssetSharedViewModel currentChange](self, "currentChange");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFlippingFullSizeRenderStateChanged:", 1);

  }
}

- (void)setNeedsDeferredProcessing:(BOOL)a3
{
  id v3;

  if (self->_needsDeferredProcessing != a3)
  {
    self->_needsDeferredProcessing = a3;
    -[PUAssetSharedViewModel currentChange](self, "currentChange");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNeedsDeferredProcessingChanged:", 1);

  }
}

- (void)setDeferredProcessingNeeded:(unsigned __int16)a3
{
  id v3;

  if (self->_deferredProcessingNeeded != a3)
  {
    self->_deferredProcessingNeeded = a3;
    -[PUAssetSharedViewModel currentChange](self, "currentChange");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDeferredProcessingNeededChanged:", 1);

  }
}

- (PUDisplayAsset)asset
{
  return self->_asset;
}

- (PXOperationStatus)loadingStatus
{
  return self->_loadingStatus;
}

- (NSProgress)saveProgress
{
  return self->_saveProgress;
}

- (int64_t)saveState
{
  return self->_saveState;
}

- (BOOL)needsDeferredProcessing
{
  return self->_needsDeferredProcessing;
}

- (unsigned)deferredProcessingNeeded
{
  return self->_deferredProcessingNeeded;
}

- (int64_t)flippingFullSizeRenderState
{
  return self->_flippingFullSizeRenderState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveProgress, 0);
  objc_storeStrong((id *)&self->_loadingStatus, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
