@implementation PXMoveToCollectionListAction

- (PXMoveToCollectionListAction)initWithCollections:(id)a3 targetCollectionList:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PXMoveToCollectionListAction *v10;
  void *v11;
  uint64_t v12;
  PHCollectionList *sourceCollectionList;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)PXMoveToCollectionListAction;
  v10 = -[PXPhotosAction initWithPhotoLibrary:](&v15, sel_initWithPhotoLibrary_, v9);

  if (v10)
  {
    objc_storeStrong((id *)&v10->_movedCollections, a3);
    objc_msgSend(v7, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "px_fetchContainer");
    v12 = objc_claimAutoreleasedReturnValue();
    sourceCollectionList = v10->_sourceCollectionList;
    v10->_sourceCollectionList = (PHCollectionList *)v12;

    objc_storeStrong((id *)&v10->_targetCollectionList, a4);
  }

  return v10;
}

- (int64_t)adjustedTargetIndexForFetchResult:(id)a3 movedAssets:(id)a4 targetAsset:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  int64_t v11;

  v7 = a4;
  v8 = a3;
  v9 = v8;
  if (a5)
    v10 = objc_msgSend(v8, "indexOfObject:", a5);
  else
    v10 = objc_msgSend(v8, "count");
  v11 = +[PXDragAndDropUtilities adjustedTargetIndexForCollection:movedObjects:targetIndex:](PXDragAndDropUtilities, "adjustedTargetIndexForCollection:movedObjects:targetIndex:", v9, v7, v10);

  return v11;
}

- (id)actionIdentifier
{
  return CFSTR("MoveToCollectionList");
}

- (id)actionNameLocalizationKey
{
  return CFSTR("PXMoveToFolderActionName");
}

- (void)performAction:(id)a3
{
  id v4;
  PHCollectionList *v5;
  PHCollectionList *v6;
  PXFastEnumeration *v7;
  void *v8;
  PHFetchResult *v9;
  PHFetchResult *beforeFetchResult;
  id v11;
  id v12;
  PHCollectionList *v13;
  PXFastEnumeration *v14;
  PHCollectionList *v15;
  _QWORD v16[5];
  PHCollectionList *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  PHCollectionList *v21;
  PXFastEnumeration *v22;

  v4 = a3;
  v5 = self->_sourceCollectionList;
  v6 = self->_targetCollectionList;
  v7 = self->_movedCollections;
  -[PXPhotosAction standardFetchOptions](self, "standardFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", v5, v8);
  v9 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
  beforeFetchResult = self->_beforeFetchResult;
  self->_beforeFetchResult = v9;

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __46__PXMoveToCollectionListAction_performAction___block_invoke;
  v20[3] = &unk_1E5148D08;
  v21 = v6;
  v22 = v7;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __46__PXMoveToCollectionListAction_performAction___block_invoke_2;
  v16[3] = &unk_1E5146940;
  v16[4] = self;
  v17 = v5;
  v18 = v8;
  v19 = v4;
  v11 = v4;
  v12 = v8;
  v13 = v5;
  v14 = v7;
  v15 = v6;
  -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v20, v16);

}

- (void)performUndo:(id)a3
{
  PHCollectionList *v5;
  PHFetchResult *v6;
  PHCollectionList *v7;
  PHFetchResult *v8;
  _QWORD v9[4];
  PHFetchResult *v10;
  PHCollectionList *v11;

  v5 = self->_sourceCollectionList;
  v6 = self->_beforeFetchResult;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__PXMoveToCollectionListAction_performUndo___block_invoke;
  v9[3] = &unk_1E5148D08;
  v10 = v6;
  v11 = v5;
  v7 = v5;
  v8 = v6;
  -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v9, a3);

}

- (PHCollectionList)targetCollectionList
{
  return self->_targetCollectionList;
}

- (PXFastEnumeration)movedCollections
{
  return self->_movedCollections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movedCollections, 0);
  objc_storeStrong((id *)&self->_targetCollectionList, 0);
  objc_storeStrong((id *)&self->_afterFetchResult, 0);
  objc_storeStrong((id *)&self->_beforeFetchResult, 0);
  objc_storeStrong((id *)&self->_sourceCollectionList, 0);
}

void __44__PXMoveToCollectionListAction_performUndo___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, objc_msgSend(*(id *)(a1 + 32), "count"));
  objc_msgSend(MEMORY[0x1E0CD14E8], "changeRequestForCollectionList:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertChildCollections:atIndexes:", *(_QWORD *)(a1 + 32), v3);

}

void __46__PXMoveToCollectionListAction_performAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CD14E8], "changeRequestForCollectionList:", *(_QWORD *)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 40);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, objc_msgSend(v2, "count"));
  objc_msgSend(v4, "insertChildCollections:atIndexes:", v2, v3);

}

void __46__PXMoveToCollectionListAction_performAction___block_invoke_2(_QWORD *a1, int a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", a1[5], a1[6]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_storeStrong((id *)(a1[4] + 96), v5);
  if (a2)

  (*(void (**)(void))(a1[7] + 16))();
}

+ (BOOL)canPerformOnCollection:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (objc_msgSend(v3, "canContainCollections"))
    v4 = objc_msgSend(v3, "canPerformEditOperation:", 5);
  else
    v4 = 0;

  return v4;
}

@end
