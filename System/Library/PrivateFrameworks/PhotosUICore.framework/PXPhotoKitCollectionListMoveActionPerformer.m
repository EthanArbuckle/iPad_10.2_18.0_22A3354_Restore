@implementation PXPhotoKitCollectionListMoveActionPerformer

- (PXPhotoKitCollectionListMoveActionPerformer)initWithActionType:(id)a3 collectionList:(id)a4 parameters:(id)a5
{
  id v9;
  id v10;
  PXPhotoKitCollectionListMoveActionPerformer *v11;
  PXPhotoKitCollectionListMoveActionPerformer *v12;
  uint64_t v13;
  PXFastEnumeration *sourceCollections;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PXPhotoKitCollectionListMoveActionPerformer;
  v11 = -[PXPhotoKitCollectionListActionPerformer initWithActionType:collectionList:parameters:](&v16, sel_initWithActionType_collectionList_parameters_, a3, v9, v10);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_collectionList, a4);
    objc_msgSend(v10, "objectForKeyedSubscript:", *(_QWORD *)off_1E50B7D28);
    v13 = objc_claimAutoreleasedReturnValue();
    sourceCollections = v12->_sourceCollections;
    v12->_sourceCollections = (PXFastEnumeration *)v13;

  }
  return v12;
}

- (void)performBackgroundTask
{
  PXMoveToCollectionListAction *v3;
  void *v4;
  _QWORD v5[5];

  v3 = -[PXMoveToCollectionListAction initWithCollections:targetCollectionList:]([PXMoveToCollectionListAction alloc], "initWithCollections:targetCollectionList:", self->_sourceCollections, self->_collectionList);
  -[PXActionPerformer undoManager](self, "undoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__PXPhotoKitCollectionListMoveActionPerformer_performBackgroundTask__block_invoke;
  v5[3] = &unk_1E5148B78;
  v5[4] = self;
  -[PXAction executeWithUndoManager:completionHandler:](v3, "executeWithUndoManager:completionHandler:", v4, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceCollections, 0);
  objc_storeStrong((id *)&self->_collectionList, 0);
}

uint64_t __68__PXPhotoKitCollectionListMoveActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", a2, a3);
}

+ (BOOL)canPerformOnCollectionList:(id)a3
{
  return +[PXMoveToCollectionListAction canPerformOnCollection:](PXMoveToCollectionListAction, "canPerformOnCollection:", a3);
}

@end
