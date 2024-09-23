@implementation PXPhotoKitCollectionListRearrangeActionPerformer

- (PXPhotoKitCollectionListRearrangeActionPerformer)initWithActionType:(id)a3 collectionList:(id)a4 parameters:(id)a5
{
  id v9;
  PXPhotoKitCollectionListRearrangeActionPerformer *v10;
  uint64_t v11;
  PXFastEnumeration *sourceCollections;
  PHCollection *v13;
  PHCollection *targetCollection;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PXPhotoKitCollectionListRearrangeActionPerformer;
  v10 = -[PXPhotoKitCollectionListActionPerformer initWithActionType:collectionList:parameters:](&v20, sel_initWithActionType_collectionList_parameters_, a3, a4, v9);
  if (v10)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)off_1E50B7D30);
    v11 = objc_claimAutoreleasedReturnValue();
    sourceCollections = v10->_sourceCollections;
    v10->_sourceCollections = (PXFastEnumeration *)v11;

    objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)off_1E50B7D38);
    v13 = (PHCollection *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHCollection px_descriptionForAssertionMessage](v13, "px_descriptionForAssertionMessage");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("PXPhotoKitCollectionListRearrangeActionPerformer.m"), 29, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("parameters[PXActionParameterKeyTargetObject]"), v18, v19);

      }
    }
    targetCollection = v10->_targetCollection;
    v10->_targetCollection = v13;

  }
  return v10;
}

- (void)performBackgroundTask
{
  PXRearrangeCollectionListAction *v3;
  void *v4;
  PXRearrangeCollectionListAction *v5;
  void *v6;
  _QWORD v7[5];

  v3 = [PXRearrangeCollectionListAction alloc];
  -[PXPhotoKitCollectionListActionPerformer collectionList](self, "collectionList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXRearrangeCollectionListAction initWithCollectionList:movedCollections:targetCollection:](v3, "initWithCollectionList:movedCollections:targetCollection:", v4, self->_sourceCollections, self->_targetCollection);

  -[PXActionPerformer undoManager](self, "undoManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__PXPhotoKitCollectionListRearrangeActionPerformer_performBackgroundTask__block_invoke;
  v7[3] = &unk_1E5148B78;
  v7[4] = self;
  -[PXAction executeWithUndoManager:completionHandler:](v5, "executeWithUndoManager:completionHandler:", v6, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetCollection, 0);
  objc_storeStrong((id *)&self->_sourceCollections, 0);
}

uint64_t __73__PXPhotoKitCollectionListRearrangeActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", a2, a3);
}

+ (BOOL)canPerformOnCollectionList:(id)a3
{
  return +[PXRearrangeCollectionListAction canPerformOnCollection:](PXRearrangeCollectionListAction, "canPerformOnCollection:", a3);
}

@end
