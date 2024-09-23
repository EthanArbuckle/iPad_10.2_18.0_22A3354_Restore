@implementation PXCreateAssetCollectionAction

- (PXCreateAssetCollectionAction)initWithTitle:(id)a3 parentCollectionList:(id)a4 selectedAssets:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  PXCreateAssetCollectionAction *v12;
  uint64_t v13;
  NSString *title;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)PXCreateAssetCollectionAction;
  v12 = -[PXPhotosAction initWithPhotoLibrary:](&v16, sel_initWithPhotoLibrary_, v11);

  if (v12)
  {
    v13 = objc_msgSend(v8, "copy");
    title = v12->_title;
    v12->_title = (NSString *)v13;

    objc_storeStrong((id *)&v12->_parentCollectionList, a4);
    objc_storeStrong((id *)&v12->_selectedAssets, a5);
  }

  return v12;
}

- (PXContentSyndicationPhotoKitAssetGroup)assetGroup
{
  PXContentSyndicationPhotoKitAssetGroup *assetGroup;
  PXContentSyndicationPhotoKitAssetGroup *v4;
  void *v5;
  PXContentSyndicationPhotoKitAssetGroup *v6;
  PXContentSyndicationPhotoKitAssetGroup *v7;

  assetGroup = self->_assetGroup;
  if (!assetGroup)
  {
    v4 = [PXContentSyndicationPhotoKitAssetGroup alloc];
    -[PXCreateAssetCollectionAction selectedAssets](self, "selectedAssets");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PXContentSyndicationPhotoKitAssetGroup initWithAssets:](v4, "initWithAssets:", v5);
    v7 = self->_assetGroup;
    self->_assetGroup = v6;

    assetGroup = self->_assetGroup;
  }
  return assetGroup;
}

- (NSArray)userLibraryAssets
{
  void *v2;
  void *v3;

  -[PXCreateAssetCollectionAction assetGroup](self, "assetGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userLibraryAssets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)unsavedSyndicatedAssets
{
  void *v2;
  void *v3;

  -[PXCreateAssetCollectionAction assetGroup](self, "assetGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unsavedSyndicatedAssets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (PHAssetCollection)createdAssetCollection
{
  void *v3;
  PHAssetCollection *createdAssetCollection;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PHAssetCollection *v10;
  PHAssetCollection *v11;
  PHAssetCollection *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[PXCreateAssetCollectionAction createdCollectionIdentifier](self, "createdCollectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  createdAssetCollection = self->_createdAssetCollection;
  if (createdAssetCollection)
    v5 = 1;
  else
    v5 = v3 == 0;
  if (!v5)
  {
    v6 = (void *)MEMORY[0x1E0CD13B8];
    v14[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosAction standardFetchOptions](self, "standardFetchOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchAssetCollectionsWithLocalIdentifiers:options:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (PHAssetCollection *)objc_claimAutoreleasedReturnValue();
    v11 = self->_createdAssetCollection;
    self->_createdAssetCollection = v10;

    createdAssetCollection = self->_createdAssetCollection;
  }
  v12 = createdAssetCollection;

  return v12;
}

- (id)actionIdentifier
{
  return CFSTR("CreateAssetCollection");
}

- (id)actionNameLocalizationKey
{
  return CFSTR("PXCreateAlbumActionName");
}

- (void)performAction:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];

  v6 = a3;
  -[PXCreateAssetCollectionAction unsavedSyndicatedAssets](self, "unsavedSyndicatedAssets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);

  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __47__PXCreateAssetCollectionAction_performAction___block_invoke;
    v7[3] = &unk_1E5149198;
    v7[4] = self;
    -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v7, v6);

  }
}

- (void)performUndo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[PXCreateAssetCollectionAction createdAssetCollection](self, "createdAssetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __45__PXCreateAssetCollectionAction_performUndo___block_invoke;
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
  -[PXCreateAssetCollectionAction createdAssetCollection](self, "createdAssetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __45__PXCreateAssetCollectionAction_performRedo___block_invoke;
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

- (PXFastEnumeration)selectedAssets
{
  return self->_selectedAssets;
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
  objc_storeStrong((id *)&self->_selectedAssets, 0);
  objc_storeStrong((id *)&self->_parentCollectionList, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_createdAssetCollection, 0);
  objc_storeStrong((id *)&self->_assetGroup, 0);
}

void __45__PXCreateAssetCollectionAction_performRedo___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CD13C8];
  v3[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "undeleteAssetCollections:", v2);

}

void __45__PXCreateAssetCollectionAction_performUndo___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CD13C8];
  v3[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "deleteAssetCollections:", v2);

}

void __47__PXCreateAssetCollectionAction_performAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CD13C8];
  objc_msgSend(*(id *)(a1 + 32), "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "creationRequestForAssetCollectionWithTitle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setCustomSortKey:", 1);
  objc_msgSend(v4, "setCustomSortAscending:", +[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled") ^ 1);
  objc_msgSend(*(id *)(a1 + 32), "assetGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v5, "userLibraryAssets");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithArray:", v7);

    objc_msgSend(v5, "syndicationIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PXContentSyndicationUserLibraryAssetsFromSyndicationIdentifiers(v9, v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "addObjectsFromArray:", v11);
    v12 = (void *)MEMORY[0x1E0CD1390];
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "px_orderedAssetsFromAssets:sortDescriptors:", v8, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "addAssets:", v15);
  }
  objc_msgSend(v4, "placeholderForCreatedAssetCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCreatedCollectionIdentifier:", v17);

  objc_msgSend(*(id *)(a1 + 32), "parentCollectionList");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPhotoKitCollectionsDataSourceManager standardDataSourceManagerForCollectionList:](PXPhotoKitCollectionsDataSourceManager, "standardDataSourceManagerForCollectionList:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "collectionsFetchResult");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "indexOfFirstReorderableCollection");
  v22 = (void *)MEMORY[0x1E0CD14E8];
  objc_msgSend(*(id *)(a1 + 32), "parentCollectionList");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "changeRequestForCollectionList:childCollections:", v23, v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v21);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "insertChildCollections:atIndexes:", v25, v26);

  +[PXTipsAppDonation donateSignalForEvent:](PXTipsAppDonation, "donateSignalForEvent:", 2);
}

@end
