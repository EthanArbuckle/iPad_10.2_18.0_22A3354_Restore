@implementation PXCreateCollectionListAction

- (PXCreateCollectionListAction)initWithTitle:(id)a3 parentCollectionList:(id)a4 childCollections:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  PXCreateCollectionListAction *v12;
  uint64_t v13;
  NSString *title;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)PXCreateCollectionListAction;
  v12 = -[PXPhotosAction initWithPhotoLibrary:](&v16, sel_initWithPhotoLibrary_, v11);

  if (v12)
  {
    v13 = objc_msgSend(v8, "copy");
    title = v12->_title;
    v12->_title = (NSString *)v13;

    objc_storeStrong((id *)&v12->_parentCollectionList, a4);
    v12->_indexInParentCollectionList = 0x7FFFFFFFFFFFFFFFLL;
    objc_storeStrong((id *)&v12->_childCollections, a5);
  }

  return v12;
}

- (PHCollectionList)createdCollectionList
{
  void *v3;
  PHCollectionList *createdCollectionList;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PHCollectionList *v10;
  PHCollectionList *v11;
  PHCollectionList *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[PXCreateCollectionListAction createdCollectionIdentifier](self, "createdCollectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  createdCollectionList = self->_createdCollectionList;
  if (createdCollectionList)
    v5 = 1;
  else
    v5 = v3 == 0;
  if (!v5)
  {
    v6 = (void *)MEMORY[0x1E0CD14E0];
    v14[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosAction standardFetchOptions](self, "standardFetchOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchCollectionListsWithLocalIdentifiers:options:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (PHCollectionList *)objc_claimAutoreleasedReturnValue();
    v11 = self->_createdCollectionList;
    self->_createdCollectionList = v10;

    createdCollectionList = self->_createdCollectionList;
  }
  v12 = createdCollectionList;

  return v12;
}

- (id)actionIdentifier
{
  return CFSTR("CreateCollectionList");
}

- (id)actionNameLocalizationKey
{
  return CFSTR("PXCreateFolderActionName");
}

- (void)performAction:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__PXCreateCollectionListAction_performAction___block_invoke;
  v3[3] = &unk_1E5149198;
  v3[4] = self;
  -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v3, a3);
}

- (void)performUndo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[PXCreateCollectionListAction createdCollectionList](self, "createdCollectionList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __44__PXCreateCollectionListAction_performUndo___block_invoke;
    v7[3] = &unk_1E5149198;
    v8 = v5;
    -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v7, v4);

    v4 = v8;
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

- (void)performRedo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[PXCreateCollectionListAction createdCollectionList](self, "createdCollectionList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __44__PXCreateCollectionListAction_performRedo___block_invoke;
    v7[3] = &unk_1E5149198;
    v8 = v5;
    -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v7, v4);

    v4 = v8;
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

- (NSString)title
{
  return self->_title;
}

- (PHCollectionList)parentCollectionList
{
  return self->_parentCollectionList;
}

- (unint64_t)indexInParentCollectionList
{
  return self->_indexInParentCollectionList;
}

- (PXFastEnumeration)childCollections
{
  return self->_childCollections;
}

- (NSString)createdCollectionIdentifier
{
  return self->_createdCollectionIdentifier;
}

- (void)setCreatedCollectionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdCollectionIdentifier, 0);
  objc_storeStrong((id *)&self->_childCollections, 0);
  objc_storeStrong((id *)&self->_parentCollectionList, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_createdCollectionList, 0);
}

void __44__PXCreateCollectionListAction_performRedo___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CD14E8];
  v3[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "undeleteCollectionLists:", v2);

}

void __44__PXCreateCollectionListAction_performUndo___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CD14E8];
  v3[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "deleteCollectionLists:", v2);

}

void __46__PXCreateCollectionListAction_performAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CD14E8];
  objc_msgSend(*(id *)(a1 + 32), "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "creationRequestForCollectionListWithTitle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "placeholderForCreatedCollectionList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCreatedCollectionIdentifier:", v6);

  v7 = objc_msgSend(*(id *)(a1 + 32), "indexInParentCollectionList");
  v8 = *(void **)(a1 + 32);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v8, "parentCollectionList");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXPhotoKitCollectionsDataSourceManager standardDataSourceManagerForCollectionList:](PXPhotoKitCollectionsDataSourceManager, "standardDataSourceManagerForCollectionList:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "collectionsFetchResult");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "indexOfFirstReorderableCollection");
    v13 = (void *)MEMORY[0x1E0CD14E8];
    objc_msgSend(*(id *)(a1 + 32), "parentCollectionList");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "changeRequestForCollectionList:childCollections:", v14, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v21[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "insertChildCollections:atIndexes:", v16, v17);

  }
  else
  {
    v18 = (void *)MEMORY[0x1E0CD14E8];
    objc_msgSend(v8, "parentCollectionList");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "changeRequestForCollectionList:", v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "insertChildCollections:atIndexes:", v11, v15);
  }

}

@end
