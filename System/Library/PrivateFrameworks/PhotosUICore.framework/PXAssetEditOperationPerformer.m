@implementation PXAssetEditOperationPerformer

- (PXAssetEditOperationPerformer)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetEditOperationManager.m"), 360, CFSTR("%s is not available as initializer"), "-[PXAssetEditOperationPerformer init]");

  abort();
}

- (PXAssetEditOperationPerformer)initWithEditOperationType:(id)a3 asset:(id)a4
{
  id v6;
  id v7;
  PXAssetEditOperationPerformer *v8;
  uint64_t v9;
  NSString *editOperationType;
  uint64_t v11;
  NSProgress *progress;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXAssetEditOperationPerformer;
  v8 = -[PXAssetEditOperationPerformer init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    editOperationType = v8->_editOperationType;
    v8->_editOperationType = (NSString *)v9;

    objc_storeStrong((id *)&v8->_asset, a4);
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 100);
    v11 = objc_claimAutoreleasedReturnValue();
    progress = v8->_progress;
    v8->_progress = (NSProgress *)v11;

  }
  return v8;
}

- (NSString)editOperationType
{
  return self->_editOperationType;
}

- (PXDisplayAsset)asset
{
  return self->_asset;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_editOperationType, 0);
}

@end
