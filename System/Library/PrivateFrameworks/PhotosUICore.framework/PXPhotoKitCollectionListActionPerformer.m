@implementation PXPhotoKitCollectionListActionPerformer

- (PXPhotoKitCollectionListActionPerformer)initWithActionType:(id)a3 collectionList:(id)a4 parameters:(id)a5
{
  id v9;
  id v10;
  id v11;
  PXPhotoKitCollectionListActionPerformer *v12;
  PXPhotoKitCollectionListActionPerformer *v13;
  void *v15;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitCollectionListActionPerformer.m"), 14, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("collectionList"));

  }
  v16.receiver = self;
  v16.super_class = (Class)PXPhotoKitCollectionListActionPerformer;
  v12 = -[PXActionPerformer initWithActionType:](&v16, sel_initWithActionType_, v9);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_collectionList, a4);

  return v13;
}

- (PXPhotoKitCollectionListActionPerformer)initWithActionType:(id)a3 collectionList:(id)a4
{
  return -[PXPhotoKitCollectionListActionPerformer initWithActionType:collectionList:parameters:](self, "initWithActionType:collectionList:parameters:", a3, a4, MEMORY[0x1E0C9AA70]);
}

- (PHCollectionList)collectionList
{
  return self->_collectionList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionList, 0);
}

+ (BOOL)canPerformOnCollectionList:(id)a3
{
  return 0;
}

+ (id)localizedTitleForActionType:(id)a3 collectionList:(id)a4
{
  return 0;
}

+ (id)systemImageNameForCollectionList:(id)a3 actionType:(id)a4
{
  return 0;
}

@end
