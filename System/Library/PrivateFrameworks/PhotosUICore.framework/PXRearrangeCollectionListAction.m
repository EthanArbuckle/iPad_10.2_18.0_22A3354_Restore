@implementation PXRearrangeCollectionListAction

- (PXRearrangeCollectionListAction)initWithCollectionList:(id)a3 movedCollections:(id)a4 targetCollection:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  PXRearrangeCollectionListAction *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "photoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)PXRearrangeCollectionListAction;
  v13 = -[PXPhotosAction initWithPhotoLibrary:](&v15, sel_initWithPhotoLibrary_, v12);

  if (v13)
  {
    objc_storeStrong((id *)&v13->_collectionList, a3);
    objc_storeStrong((id *)&v13->_movedCollections, a4);
    objc_storeStrong((id *)&v13->_targetCollection, a5);
  }

  return v13;
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

- (BOOL)_canPerformUndo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[PXRearrangeCollectionListAction standardFetchOptions](self, "standardFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD14E0], "fetchCollectionsInCollectionList:options:", self->_collectionList, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchedObjectIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHFetchResult fetchedObjectIDs](self->_afterFetchResult, "fetchedObjectIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToArray:", v6);

  return v7;
}

- (id)standardFetchOptions
{
  void *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXRearrangeCollectionListAction;
  -[PXPhotosAction standardFetchOptions](&v4, sel_standardFetchOptions);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIncludeUserSmartAlbums:", 1);
  return v2;
}

- (id)actionIdentifier
{
  return CFSTR("RearrangeCollectionList");
}

- (id)actionNameLocalizationKey
{
  return CFSTR("PXRearrangeFolderActionName");
}

- (void)performAction:(id)a3
{
  id v4;
  PHCollectionList *v5;
  PXFastEnumeration *v6;
  PHCollection *v7;
  void *v8;
  PHFetchResult *v9;
  PHFetchResult *beforeFetchResult;
  uint64_t v11;
  id v12;
  id v13;
  PHCollectionList *v14;
  PHCollection *v15;
  PXFastEnumeration *v16;
  _QWORD v17[5];
  PHCollectionList *v18;
  id v19;
  id v20;
  _QWORD v21[5];
  PXFastEnumeration *v22;
  PHCollection *v23;
  PHCollectionList *v24;

  v4 = a3;
  v5 = self->_collectionList;
  v6 = self->_movedCollections;
  v7 = self->_targetCollection;
  -[PXRearrangeCollectionListAction standardFetchOptions](self, "standardFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", v5, v8);
  v9 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
  beforeFetchResult = self->_beforeFetchResult;
  self->_beforeFetchResult = v9;

  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __49__PXRearrangeCollectionListAction_performAction___block_invoke;
  v21[3] = &unk_1E513DD48;
  v21[4] = self;
  v22 = v6;
  v23 = v7;
  v24 = v5;
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __49__PXRearrangeCollectionListAction_performAction___block_invoke_2;
  v17[3] = &unk_1E5146940;
  v17[4] = self;
  v18 = v24;
  v19 = v8;
  v20 = v4;
  v12 = v4;
  v13 = v8;
  v14 = v24;
  v15 = v7;
  v16 = v6;
  -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v21, v17);

}

- (void)performUndo:(id)a3
{
  PHCollectionList *v4;
  PHCollectionList *v5;
  PHFetchResult *v6;
  PHCollectionList *v7;
  PHFetchResult *v8;
  _QWORD v9[4];
  PHFetchResult *v10;
  PHCollectionList *v11;

  v4 = (PHCollectionList *)a3;
  if (-[PXRearrangeCollectionListAction _canPerformUndo](self, "_canPerformUndo"))
  {
    v5 = self->_collectionList;
    v6 = self->_beforeFetchResult;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __47__PXRearrangeCollectionListAction_performUndo___block_invoke;
    v9[3] = &unk_1E5148D08;
    v10 = v6;
    v11 = v5;
    v7 = v5;
    v8 = v6;
    -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v9, v4);

    v4 = v7;
  }
  else
  {
    (*(void (**)(PHCollectionList *, _QWORD, _QWORD))&v4->super.super._propertyHintLock._os_unfair_lock_opaque)(v4, 0, 0);
  }

}

- (PHCollectionList)collectionList
{
  return self->_collectionList;
}

- (PXFastEnumeration)movedCollections
{
  return self->_movedCollections;
}

- (PHCollection)targetCollection
{
  return self->_targetCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetCollection, 0);
  objc_storeStrong((id *)&self->_movedCollections, 0);
  objc_storeStrong((id *)&self->_collectionList, 0);
  objc_storeStrong((id *)&self->_afterFetchResult, 0);
  objc_storeStrong((id *)&self->_beforeFetchResult, 0);
}

void __47__PXRearrangeCollectionListAction_performUndo___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, objc_msgSend(*(id *)(a1 + 32), "count"));
  objc_msgSend(MEMORY[0x1E0CD14E8], "changeRequestForCollectionList:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeChildCollections:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v2, "insertChildCollections:atIndexes:", *(_QWORD *)(a1 + 32), v3);

}

void __49__PXRearrangeCollectionListAction_performAction___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "adjustedTargetIndexForFetchResult:movedAssets:targetAsset:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", v2, objc_msgSend(*(id *)(a1 + 40), "count"));
  objc_msgSend(MEMORY[0x1E0CD14E8], "changeRequestForCollectionList:childCollections:", *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeChildCollections:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "insertChildCollections:atIndexes:", *(_QWORD *)(a1 + 40), v4);

}

void __49__PXRearrangeCollectionListAction_performAction___block_invoke_2(_QWORD *a1, int a2, void *a3)
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
  objc_storeStrong((id *)(a1[4] + 88), v5);
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
