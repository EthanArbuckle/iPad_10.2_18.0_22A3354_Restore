@implementation PXCreateSmartAlbumAction

- (PXCreateSmartAlbumAction)initWithTitle:(id)a3 parentCollectionList:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PXCreateSmartAlbumAction *v9;
  uint64_t v10;
  NSString *title;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)PXCreateSmartAlbumAction;
  v9 = -[PXPhotosAction initWithPhotoLibrary:](&v13, sel_initWithPhotoLibrary_, v8);

  if (v9)
  {
    v10 = objc_msgSend(v6, "copy");
    title = v9->_title;
    v9->_title = (NSString *)v10;

    objc_storeStrong((id *)&v9->_parentCollectionList, a4);
  }

  return v9;
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
  -[PXCreateSmartAlbumAction createdCollectionIdentifier](self, "createdCollectionIdentifier");
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
  return CFSTR("CreateSmartAlbum");
}

- (id)actionNameLocalizationKey
{
  return CFSTR("PXCreateSmartAlbumActionName");
}

- (void)performAction:(id)a3
{
  (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
}

- (void)performUndo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[PXCreateSmartAlbumAction createdAssetCollection](self, "createdAssetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __40__PXCreateSmartAlbumAction_performUndo___block_invoke;
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
  -[PXCreateSmartAlbumAction createdAssetCollection](self, "createdAssetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __40__PXCreateSmartAlbumAction_performRedo___block_invoke;
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

- (NSString)createdCollectionIdentifier
{
  return self->_createdCollectionIdentifier;
}

- (void)setCreatedCollectionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdCollectionIdentifier, 0);
  objc_storeStrong((id *)&self->_parentCollectionList, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_createdAssetCollection, 0);
}

void __40__PXCreateSmartAlbumAction_performRedo___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CD17B8];
  v3[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "undeleteSmartAlbumsFromAssetCollection:", v2);

}

void __40__PXCreateSmartAlbumAction_performUndo___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CD17B8];
  v3[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "deleteSmartAlbumsFromAssetCollection:", v2);

}

@end
