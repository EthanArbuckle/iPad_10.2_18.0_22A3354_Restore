@implementation PXChangePersonAssetsSortOrderAction

- (PXChangePersonAssetsSortOrderAction)initWithPerson:(id)a3 sortOrder:(int64_t)a4
{
  id v7;
  void *v8;
  PXChangePersonAssetsSortOrderAction *v9;
  objc_super v11;

  v7 = a3;
  objc_msgSend(v7, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)PXChangePersonAssetsSortOrderAction;
  v9 = -[PXPhotosAction initWithPhotoLibrary:](&v11, sel_initWithPhotoLibrary_, v8);

  if (v9)
  {
    objc_storeStrong((id *)&v9->_person, a3);
    v9->_sortOrder = a4;
    v9->_originalSortOrder = objc_msgSend(v7, "assetSortOrder");
  }

  return v9;
}

- (id)actionIdentifier
{
  return CFSTR("ChangePersonSortOrder");
}

- (id)actionNameLocalizationKey
{
  void *v2;
  void *v3;

  -[PXChangePersonAssetsSortOrderAction person](self, "person");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPeopleUtilities locKeyForPersonOrPet:withVisibility:key:](PXPeopleUtilities, "locKeyForPersonOrPet:withVisibility:key:", v2, 0, CFSTR("PXPhotosGridsPeopleSortActionName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)performAction:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__PXChangePersonAssetsSortOrderAction_performAction___block_invoke;
  v3[3] = &unk_1E5149198;
  v3[4] = self;
  -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v3, a3);
}

- (void)performUndo:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__PXChangePersonAssetsSortOrderAction_performUndo___block_invoke;
  v3[3] = &unk_1E5149198;
  v3[4] = self;
  -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v3, a3);
}

- (PHPerson)person
{
  return self->_person;
}

- (int64_t)sortOrder
{
  return self->_sortOrder;
}

- (int64_t)originalSortOrder
{
  return self->_originalSortOrder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_person, 0);
}

void __51__PXChangePersonAssetsSortOrderAction_performUndo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0CD16D8];
  objc_msgSend(*(id *)(a1 + 32), "person");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "changeRequestForPerson:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAssetSortOrder:", objc_msgSend(*(id *)(a1 + 32), "originalSortOrder"));
}

void __53__PXChangePersonAssetsSortOrderAction_performAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0CD16D8];
  objc_msgSend(*(id *)(a1 + 32), "person");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "changeRequestForPerson:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAssetSortOrder:", objc_msgSend(*(id *)(a1 + 32), "sortOrder"));
}

@end
